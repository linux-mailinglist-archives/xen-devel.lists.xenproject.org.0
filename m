Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE14678F4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237681.412250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt96E-00070c-IB; Fri, 03 Dec 2021 13:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237681.412250; Fri, 03 Dec 2021 13:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt96E-0006yc-Er; Fri, 03 Dec 2021 13:59:42 +0000
Received: by outflank-mailman (input) for mailman id 237681;
 Fri, 03 Dec 2021 13:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mt96C-0006xZ-PS
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:59:40 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4161c867-5441-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 14:59:39 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40538)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mt96A-000LWp-oF (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 13:59:38 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5CCFB1FC17;
 Fri,  3 Dec 2021 13:59:38 +0000 (GMT)
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
X-Inumbo-ID: 4161c867-5441-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <57190224-879a-8309-e1a9-534072af9aa0@srcf.net>
Date: Fri, 3 Dec 2021 13:59:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-60-andrew.cooper3@citrix.com>
 <a8434878-129d-8207-09e3-4909e638a4d0@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 59/65] x86/traps: Rework write_stub_trampoline() to not
 hardcode the jmp
In-Reply-To: <a8434878-129d-8207-09e3-4909e638a4d0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 13:17, Jan Beulich wrote:
> On 26.11.2021 13:34, Andrew Cooper wrote:
>> For CET-IBT, we will need to optionally insert an endbr64 instruction at the
>> start of the stub.  Don't hardcode the jmp displacement assuming that it
>> starts at byte 24 of the stub.
>>
>> Also add extra comments describing what is going on.  The mix of %rax and %rsp
>> is far from trivial to follow.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/x86_64/traps.c | 36 ++++++++++++++++++++++--------------
>>  1 file changed, 22 insertions(+), 14 deletions(-)
>>
>> diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
>> index d661d7ffcaaf..6f3c65bedc7a 100644
>> --- a/xen/arch/x86/x86_64/traps.c
>> +++ b/xen/arch/x86/x86_64/traps.c
>> @@ -293,30 +293,38 @@ static unsigned int write_stub_trampoline(
>>      unsigned char *stub, unsigned long stub_va,
>>      unsigned long stack_bottom, unsigned long target_va)
>>  {
>> +    unsigned char *p = stub;
>> +
>> +    /* Store guest %rax into %ss slot */
>>      /* movabsq %rax, stack_bottom - 8 */
>> -    stub[0] = 0x48;
>> -    stub[1] = 0xa3;
>> -    *(uint64_t *)&stub[2] = stack_bottom - 8;
>> +    *p++ = 0x48;
>> +    *p++ = 0xa3;
>> +    *(uint64_t *)p = stack_bottom - 8;
>> +    p += 8;
>>  
>> +    /* Store guest %rsp in %rax */
>>      /* movq %rsp, %rax */
>> -    stub[10] = 0x48;
>> -    stub[11] = 0x89;
>> -    stub[12] = 0xe0;
>> +    *p++ = 0x48;
>> +    *p++ = 0x89;
>> +    *p++ = 0xe0;
>>  
>> +    /* Switch to Xen stack */
>>      /* movabsq $stack_bottom - 8, %rsp */
>> -    stub[13] = 0x48;
>> -    stub[14] = 0xbc;
>> -    *(uint64_t *)&stub[15] = stack_bottom - 8;
>> +    *p++ = 0x48;
>> +    *p++ = 0xbc;
>> +    *(uint64_t *)p = stack_bottom - 8;
>> +    p += 8;
>>  
>> +    /* Store guest %rsp into %rsp slot */
>>      /* pushq %rax */
>> -    stub[23] = 0x50;
>> +    *p++ = 0x50;
>>  
>>      /* jmp target_va */
>> -    stub[24] = 0xe9;
>> -    *(int32_t *)&stub[25] = target_va - (stub_va + 29);
>> +    *p++ = 0xe9;
>> +    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
>> +    p += 4;
>>  
>> -    /* Round up to a multiple of 16 bytes. */
>> -    return 32;
>> +    return p - stub;
>>  }
> I'm concerned of you silently discarding the aligning to 16 bytes here.
> Imo this really needs justifying, or perhaps even delaying until a
> later change.

Oh.  That was an oversight, and I'm honestly a little impressed that the
result worked fine.

return ROUNDUP(p - stub, 16);

ought to do?

>  I'd like to point out though that we may not have a space
> issue here at all, as I think we can replace one of the MOVABSQ (using
> absolute numbers to hopefully make this easier to follow):
>
>     movabsq %rax, stack_bottom - 8
>     movq %rsp, %rax
>     movq -18(%rip), %rsp
>     pushq %rax
>     jmp target_va
>
> This totals to 26 bytes, leaving enough room for ENDBR64 without crossing
> the 32-byte boundary. But I fear you may eat me for using insn bytes as
> data ...

Well that's entertaining, and really quite a shame that RIP-relative
addresses only work with 32bit displacements.

While it is shorter, it's only 3 bytes shorter, and the stack layout is
custom anyway so it really doesn't matter if the push lives here or not.

Furthermore (and probably scraping the excuses barrel here), it forces a
data side TLB and cacheline fill where we didn't have one previously. 
Modern CPUs ought to be fine here, but older ones (that don't have a
shared L2TLB) are liable to stall.

Perhaps lets leave this as an emergency option, if we need to find more
space again in the future?

~Andrew

