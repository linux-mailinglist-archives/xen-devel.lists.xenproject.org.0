Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B622464DCD
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 13:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236011.409371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOcw-0000BR-Hr; Wed, 01 Dec 2021 12:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236011.409371; Wed, 01 Dec 2021 12:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msOcw-00009T-Es; Wed, 01 Dec 2021 12:22:22 +0000
Received: by outflank-mailman (input) for mailman id 236011;
 Wed, 01 Dec 2021 12:22:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msOcu-00009N-UF
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 12:22:20 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54035f86-52a1-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 13:22:19 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34726)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msOct-000z1x-73 (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 12:22:19 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id EC7771FDDA;
 Wed,  1 Dec 2021 12:22:18 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 54035f86-52a1-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <bd4d66b3-a388-b3cf-2284-91c43bc3d99d@srcf.net>
Date: Wed, 1 Dec 2021 12:22:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] x86/PoD: HVM guests can't pin their pages
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
 <0ec2eb9c-a4b9-65c3-3751-3a7fb9b760c1@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <0ec2eb9c-a4b9-65c3-3751-3a7fb9b760c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 10:53, Jan Beulich wrote:
> Pinning is a PV concept, used there only for page table pages.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Perhaps this is a leftover from autotranslate mode?  That was doing some
very HVM-like things for PV guests.

> ---
> I'm actually inclined to hide _PGT_pinned in !HVM builds; the downside
> of doing so is some new #ifdef-ary which would need adding.

Judging by the current users, I doubt it is worth it, although folding
this delta wouldn't go amiss.

diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index cb9052749963..e5f63daa1a71 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -36,7 +36,7 @@
  /* Page is locked? */
 #define _PGT_locked       PG_shift(4)
 #define PGT_locked        PG_mask(1, 4)
- /* Owning guest has pinned this page to its current type? */
+ /* Owning guest has pinned this page to its current type? PV only */
 #define _PGT_pinned       PG_shift(5)
 #define PGT_pinned        PG_mask(1, 5)
  /* Has this page been validated for use as its current type? */

~Andrew

