Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E58546A3D1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:13:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239713.415628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muITL-00013a-V2; Mon, 06 Dec 2021 18:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239713.415628; Mon, 06 Dec 2021 18:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muITL-00011n-Ri; Mon, 06 Dec 2021 18:12:19 +0000
Received: by outflank-mailman (input) for mailman id 239713;
 Mon, 06 Dec 2021 18:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMFW=QX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muITK-00011g-GV
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:12:18 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad4da63-56c0-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 19:12:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44712)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muITH-000uWW-0Z (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 06 Dec 2021 18:12:15 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 00A0B1FDB9;
 Mon,  6 Dec 2021 18:12:14 +0000 (GMT)
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
X-Inumbo-ID: 0ad4da63-56c0-11ec-a5e1-b9374ead2679
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <3f742d50-1b45-b0f0-d7ad-dc3d4763f5c7@srcf.net>
Date: Mon, 6 Dec 2021 18:12:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-9-andrew.cooper3@citrix.com>
 <282f884c-834e-caf7-4e09-6c7a662c666e@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH RFC 8/8] x86/boot: Check that permission restrictions have
 taken effect
In-Reply-To: <282f884c-834e-caf7-4e09-6c7a662c666e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2021 13:33, Jan Beulich wrote:
> On 30.11.2021 11:04, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> RFC.  I don't know if this is something we'd want to keep or not.
>>
>> Getting extable handling working for test_nx_data is proving tricky, and while
>> I can't spot anything that should stop the extable from working with NX
>> faults, from a security hardening perspective, there really ought to
>> be.
>>
>> (Spurious faults aside), there are no circumstances where an NX fault is
>> legitimate, and restricting extable's ability to interfere with the fatality
>> of an NX fault provides a better security posture.
> Gating the extable_fixup() invocation accordingly should be possible.
> A respective check could live even earlier, but the window between
> the !guest_mode() check and the function's invocation isn't very large
> anyway.
>
> Since we can't have both testability and such faults being uniformly
> fatal, but since otoh we use pre_extable quite sparingly, how about
> forcing the fixup to take that path by disabling interrupts around
> the test?

That feels like an abuse of an unrelated mechanism, not to mention fragile.

> In any event this touches the insufficient selectiveness of the fixup
> machinery again: Any kind of fault will be recovered from whenever a
> fixup record is attached to an insn.

There are multiple things here.  Yes, I agree that fixing up all faults
is suboptimal.

But even within #PF alone, things such as SMAP/SMEP faults are
programmer error with no hope of extable being able to adequately
resolve, and should be fatal.

I actually like the approach that Linux has recently taken, by
describing a fixup type rather than arbitrary logic, in an attempt to
keep the number of special cases from getting out of hand.  This
approach is quite easy to filter into specific exceptions.

~Andrew

