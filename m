Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9616545EEED
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232908.404231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqb2W-0004Fw-7U; Fri, 26 Nov 2021 13:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232908.404231; Fri, 26 Nov 2021 13:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqb2W-0004Df-45; Fri, 26 Nov 2021 13:13:20 +0000
Received: by outflank-mailman (input) for mailman id 232908;
 Fri, 26 Nov 2021 13:13:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jyU=QN=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqb2T-0004DZ-V9
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:13:17 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d516f76-4eba-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:13:16 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43100)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqb2K-000ggk-10 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 26 Nov 2021 13:13:08 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E56301FC8B;
 Fri, 26 Nov 2021 13:13:07 +0000 (GMT)
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
X-Inumbo-ID: 9d516f76-4eba-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <41e1f32d-6fe0-b588-ca27-8ddbd77f25e4@srcf.net>
Date: Fri, 26 Nov 2021 13:13:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <2bc4eeab-a69a-a953-e09e-7b87f7dc4b85@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
In-Reply-To: <2bc4eeab-a69a-a953-e09e-7b87f7dc4b85@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2021 12:48, Jan Beulich wrote:
> On 26.11.2021 13:33, Andrew Cooper wrote:
>> CET Indirect Branch Tracking is a hardware feature designed to protect against
>> forward-edge control flow hijacking (Call/Jump oriented programming), and is a
>> companion feature to CET Shadow Stacks added in Xen 4.14.
>>
>> This series depends on lots of previously posted patches.  See
>> xenbits/xen-cet-ibt for the full branch with all dependencies.
>>
>> Patch 1 introduces some compile time infrastructure.
>>
>> Patches 2 thru 56 annotate all function pointer targets in the common and x86
>> hypervisor code.  Patches are split by API and in no particular order, and
>> largely mechanical.  As such, I'm limiting review mainly to The Rest.  While
>> doing this work does depend on an experimental GCC change (patch 56), the
>> result does actually work properly with GCC 9 onwards.
> I wonder what this means. Are you talking about a gcc 9 with the experimental
> change backported?

No - plain GCC 9 as released (give or take the bug with retpoline which
was fixed in 9.4).  See patch 1.

This entire series, on GCC 9.4 or 10, will compile and function
correctly with CET-IBT active in hardware.

> Or are you saying that things build fine there (but don't
> work as far as IBT is concerned) in the absence of the experimental change?
> In which case what about older gcc?

The only thing the experimental change does is provide more
typechecking, so the compiler can identify when there is a call to a
non-ENDBR'd function.  See patch 56.

There is no possible way I could have done this work without the
experimental change, because there are far too many function pointers to
have found blind.

The typechecking isn't perfect, but it's pretty good.  In the short
term, we're going to have to be careful with new code, and I ought to
put something in Gitlab CI.  In the longer term, I hope for something
suitable to get into GCC 12.

That said, there are also a huge number of errors new in GCC 12 to do
with array bounds checks, and I'm not sure sprinkling more gcc11_wrap()
is going to work this time.

>> Various note accumulated through the work:
>>   * I have already posted patches fixing some of the most egregious (ab)uses of
>>     function pointers.  There are plenty of other areas which could do with
>>     cleanup.
>>   * With everything turned on, we get 1688 runtime endbr64's, and 233 init
>>     time.  The number of runtime endbr64's is expected to reduce with
>>     Juergen's hypercall series (see later), and in common deployment cases
>>     where not everything is compiled in by default.
>>   * I have not checked for misaligned endbr64's, and I'm not sure there is
>>     anything useful we could do upon discovering that there were any.
>>     Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), but
>>     this doesn't account for the structure of x86 code, which is most
>>     certainly not a uniform random distribution of bytes.
> Do you really mean "misaligned" here? The 2nd sentence rather might suggest
> that you mean byte sequences resembling ENDBR, despite actually being part
> of other insns. If so, checking might not allow to prove anything, as e.g.
> displacements change with about every build.

I do mean "any sequence of bytes resembling ENDBR", because that is
ultimately how the CPU instruction decode will behave.

And yes - you certainly can hide it in a 4-byte disp/imm, but it's an
incredibly rare imm32 to find (except for tasks such as in patch 64). 
You can also hide it in an disp/imm8 followed by a specific nopl, but
I'm not sure if we'd ever emit 0F 1E FA as a nopl by default.

~Andrew

