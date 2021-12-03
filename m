Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0398C467A4E
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 16:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237772.412380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtAWI-0006TZ-Ot; Fri, 03 Dec 2021 15:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237772.412380; Fri, 03 Dec 2021 15:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtAWI-0006Q6-Lk; Fri, 03 Dec 2021 15:30:42 +0000
Received: by outflank-mailman (input) for mailman id 237772;
 Fri, 03 Dec 2021 15:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mtAWG-0006Q0-SN
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 15:30:40 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6a7e812-544d-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 16:30:37 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40562)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mtAWC-000bGB-oS (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 15:30:36 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 692C81FC17;
 Fri,  3 Dec 2021 15:30:36 +0000 (GMT)
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
X-Inumbo-ID: f6a7e812-544d-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a96abdb7-cdf7-2b24-d293-d3d2c6c77c78@srcf.net>
Date: Fri, 3 Dec 2021 15:30:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-63-andrew.cooper3@citrix.com>
 <a64a40ef-82f7-2264-5656-aaa5c94384f1@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
In-Reply-To: <a64a40ef-82f7-2264-5656-aaa5c94384f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/12/2021 13:32, Jan Beulich wrote:
> On 26.11.2021 13:34, Andrew Cooper wrote:
>> Each IDT vector needs to land on an endbr64 instruction.  This is especially
>> important for the #CP handler, which will escalate to #DF if the endbr64 is
>> missing.
> One question here: How does this work?

Honestly, I'm not sure.

>  I don't recall there being any "CET
> shadow" along the lines of "STI shadow" and "SS shadow", yet there's
> clearly an insn boundary here that gets "skipped" if the 2nd #CP gets
> converted to #DF. And fetching of the first handler insn also isn't part
> of exception delivery (and could cause other exceptions first, like #PF).

I can't make my observations of real hardware behaviour match the
description in the spec.

Given what a mess it all is, I wouldn't be surprised if the exception
delivery microcode has a special case to escalate this to #DF.

If it didn't escalate to #DF, then you'd end up with an infinite stream
of #CP's, which will most likely cause a stack overflow because #CP
needs to be not-IST for shadow stack reasons.

~Andrew

