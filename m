Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E94B6DE7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 14:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273186.468279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJy7a-0007wS-Ic; Tue, 15 Feb 2022 13:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273186.468279; Tue, 15 Feb 2022 13:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJy7a-0007uU-Fd; Tue, 15 Feb 2022 13:43:58 +0000
Received: by outflank-mailman (input) for mailman id 273186;
 Tue, 15 Feb 2022 13:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FBm=S6=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nJy7Z-0007uO-Ev
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 13:43:57 +0000
Received: from ppsw-40.csi.cam.ac.uk (ppsw-40.csi.cam.ac.uk [131.111.8.140])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50e84f98-8e65-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 14:43:55 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:55400)
 by ppsw-40.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nJy7W-00033V-lI (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 15 Feb 2022 13:43:54 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 614E61FB0D;
 Tue, 15 Feb 2022 13:43:54 +0000 (GMT)
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
X-Inumbo-ID: 50e84f98-8e65-11ec-b215-9bbe72dcb22c
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <d62fddef-5cae-7334-ed0b-cc2c9313f040@srcf.net>
Date: Tue, 15 Feb 2022 13:43:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-35-andrew.cooper3@citrix.com>
 <2a5e1893-506e-e4fc-dbff-6001feec1e99@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 34/70] x86/emul: CFI hardening
In-Reply-To: <2a5e1893-506e-e4fc-dbff-6001feec1e99@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2022 13:38, Jan Beulich wrote:
> On 14.02.2022 13:50, Andrew Cooper wrote:
>> Control Flow Integrity schemes use toolchain and optionally hardware support
>> to help protect against call/jump/return oriented programming attacks.
>>
>> Use cf_check to annotate function pointer targets for the toolchain.
>>
>> pv_emul_is_mem_write() is only used in a single file.  Having it as a static
>> inline is pointless because it can't be inlined to begin with.
> I'd like you to consider to re-word this:

This is the reworded version.

> It being static inline was for
> the case of there appearing a 2nd user. I don't view such as pointless.

I find that impossible to reconcile with your normal review feedback.

It is unconditionally forced out of line because of how it's used,
meaning that if it ever got used in a second translation unit we'd end
up with a duplicate function, at which point it would need to be
non-static and exported to pass review.  (And sanity.)

~Andrew

