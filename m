Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C805E467742
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:25:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237542.411984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7bx-0001je-LB; Fri, 03 Dec 2021 12:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237542.411984; Fri, 03 Dec 2021 12:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7bx-0001hq-Hx; Fri, 03 Dec 2021 12:24:21 +0000
Received: by outflank-mailman (input) for mailman id 237542;
 Fri, 03 Dec 2021 12:24:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mt7bv-0001hk-Mo
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:24:19 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef82b31b-5433-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:24:18 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44288)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mt7bt-000Bdm-2M (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 12:24:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 6A66D1FB51;
 Fri,  3 Dec 2021 12:24:17 +0000 (GMT)
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
X-Inumbo-ID: ef82b31b-5433-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <eb59334a-ebb7-9cee-f7be-596deaf32d2e@srcf.net>
Date: Fri, 3 Dec 2021 12:24:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
 <53cf0492-e197-d3e6-8898-9e199bbc5399@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 3/3] x86emul: drop "seg" parameter from insn_fetch() hook
In-Reply-To: <53cf0492-e197-d3e6-8898-9e199bbc5399@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 11:23, Jan Beulich wrote:
> This is specified (and asserted for in a number of places) to always be
> CS. Passing this as an argument in various places is therefore
> pointless. The price to pay is two simple new functions,

This is actually a very interesting case study.

Both are indirect targets, so need cf_check (or rather, will do
imminently.  I'll fold a suitable fix when I rebase the CET series).

On the face of it, there's now a pile of parameter shuffling just to get
a 0 in %rdi, which isn't ideal.

However, for fine grained CFI schemes using a type hash, it actually
prevents mixing and matching of read/fetch hooks, so ends up as a
hardening improvement too.

>  with the
> benefit of the PTWR case now gaining a more appropriate error code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> In principle in the PTWR case I think we ought to set PFEC_insn_fetch in
> the error code only when NX is seen as available by the guest. Otoh I'd
> kind of expect x86_emul_pagefault() to abstract away this detail.
> Thoughts?

I have mixed feelings.  x86_emul_pagefault() is the wrong place to put
such logic because it, like its neighbours, is just a thin wrapper for
filling the pending event information.

Architecturally, PFEC_insn_fetch is visible for NX || SMEP, and we do
have logic to make this happen correctly for HVM guests (confirmed by my
XTF test, which I *still* need to get around to adding to CI).  I think
it's all contained in the main pagewalk, but I can't remember offhand.

However, PV guests explicitly share their paging settings with Xen, and
we don't hide EFER.NX based on CPUID, although we do appear to hide
CR4.SMEP unilaterally (hardly surprising).

Given the ubiquity of NX these days, and the fact that PV guests are
known-fuzzy in the pagetable department, I'm not sure it's worth the
overhead of trying to hide.

~Andrew

