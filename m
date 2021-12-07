Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EE746B630
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 09:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240739.417431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVyw-000299-TX; Tue, 07 Dec 2021 08:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240739.417431; Tue, 07 Dec 2021 08:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVyw-00027L-QP; Tue, 07 Dec 2021 08:37:50 +0000
Received: by outflank-mailman (input) for mailman id 240739;
 Tue, 07 Dec 2021 08:37:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gtX=QY=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1muVyv-00027F-GP
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 08:37:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f4589e73-5738-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 09:37:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7AB41042;
 Tue,  7 Dec 2021 00:37:46 -0800 (PST)
Received: from [10.57.4.134] (unknown [10.57.4.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7BCF3F73B;
 Tue,  7 Dec 2021 00:37:45 -0800 (PST)
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
X-Inumbo-ID: f4589e73-5738-11ec-a5e1-b9374ead2679
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
Date: Tue, 7 Dec 2021 09:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 06.12.2021 16:29, Julien Grall wrote:
> Hi,
> 
> On 06/12/2021 14:20, Michal Orzel wrote:
>> to hypervisor when switching to AArch32 state.
>>
I will change to "from AArch32 state".
>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>> "If the general-purpose register was accessible from AArch32 state the
>> upper 32 bits either become zero, or hold the value that the same
>> architectural register held before any AArch32 execution.
>> The choice between these two options is IMPLEMENTATIONDEFINED"
> 
> Typo: Missing space between IMPLEMENTATION and DEFINED.
> 
Ok.
>>
>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>> needs to be fixed.
> 
> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
> 
I would say:
"
The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
if the command passed as the first argument was clobbered,
"
>>
>> Fix this bug by zeroing the upper 32 bits of these registers on an
>> entry to hypervisor when switching to AArch32 state.
>>
>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>> when not passed.
> 
> Which error do you see otherwise? Is it a compilation error?
> 
Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
So basically in all the places where entry is called with hyp=1.
When taking the current patch and removing default value for compat you will get:
```
entry.S:254: Error: ".endif" without ".if"
entry.S:258: Error: symbol `.if' is already defined
entry.S:258: Error: ".endif" without ".if"
entry.S:262: Error: symbol `.if' is already defined
entry.S:262: Error: ".endif" without ".if"
entry.S:266: Error: symbol `.if' is already defined
entry.S:266: Error: ".endif" without ".if"
entry.S:278: Error: symbol `.if' is already defined
entry.S:278: Error: ".endif" without ".if"
entry.S:292: Error: symbol `.if' is already defined
entry.S:292: Error: ".endif" without ".if"
entry.S:317: Error: symbol `.if' is already defined
entry.S:317: Error: ".endif" without ".if"
```

>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/arch/arm/arm64/entry.S | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>> index fc3811ad0a..d364128175 100644
>> --- a/xen/arch/arm/arm64/entry.S
>> +++ b/xen/arch/arm/arm64/entry.S
>> @@ -109,8 +109,16 @@
>>    * If 0, we rely on the on x0/x1 to have been saved at the correct
>>    * position on the stack before.
>>    */
>> -        .macro  entry, hyp, compat, save_x0_x1=1
>> +        .macro  entry, hyp, compat=0, save_x0_x1=1
>>           sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
>> +
>> +        /* Zero the upper 32 bits of the registers when switching to AArch32 */
>> +        .if \compat == 1      /* AArch32 mode */
>> +        .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>> +        mov w\nr, w\nr
>> +        .endr
>> +        .endif
> 
> So Jan mentioned, the x0/x1 may have already been saved. So you may need to fetch them from the stack and then clobber the top 32-bit.
> 
So I would do the following:
-fetch x0/x1 from the stack
-clobber them
-store them again on the stack

/*
 * Zero the upper 32 bits of the gp registers when switching
 * from AArch32.
 */
.if \compat == 1      /* AArch32 mode */

/* x0/x1 have already been saved so fetch them to zero top 32 bits */
.if \save_x0_x1 == 0
ldp     x0, x1, [sp], #(UREGS_kernel_sizeof - UREGS_X0)
.endif

.irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
mov w\nr, w\nr
.endr

.if \save_x0_x1 == 0
stp     x0, x1, [sp, #-(UREGS_kernel_sizeof - UREGS_X0)]
.endif

.endif

> Cheers,
> 

Cheers,
Michal

