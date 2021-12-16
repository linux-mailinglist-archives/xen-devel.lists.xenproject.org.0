Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE40477472
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 15:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247999.427711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxriB-00057L-7C; Thu, 16 Dec 2021 14:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247999.427711; Thu, 16 Dec 2021 14:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxriB-00055U-47; Thu, 16 Dec 2021 14:26:23 +0000
Received: by outflank-mailman (input) for mailman id 247999;
 Thu, 16 Dec 2021 14:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0wh=RB=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mxriA-00055O-28
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 14:26:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 22507b04-5e7c-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 15:26:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318FE1435;
 Thu, 16 Dec 2021 06:26:18 -0800 (PST)
Received: from [10.57.5.90] (unknown [10.57.5.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E988D3F73B;
 Thu, 16 Dec 2021 06:26:16 -0800 (PST)
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
X-Inumbo-ID: 22507b04-5e7c-11ec-9e60-abaf8a552007
Subject: Re: [PATCH v2] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211216092134.579-1-michal.orzel@arm.com>
 <58061d10-7299-6aec-5cb4-4c2d54f0043d@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <56435926-e091-fe33-9044-b669ecba23f1@arm.com>
Date: Thu, 16 Dec 2021 15:26:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58061d10-7299-6aec-5cb4-4c2d54f0043d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 16.12.2021 14:50, Jan Beulich wrote:
> On 16.12.2021 10:21, Michal Orzel wrote:
>> to hypervisor when switching from AArch32 state.
>>
>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>> "If the general-purpose register was accessible from AArch32 state the
>> upper 32 bits either become zero, or hold the value that the same
>> architectural register held before any AArch32 execution.
>> The choice between these two options is IMPLEMENTATION DEFINED"
>>
>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>> needs to be fixed. The reason why is that there are places in Xen
>> where we assume that top 32bits are zero for AArch32 guests.
>> If they are not, this can lead to misinterpretation of Xen regarding
>> what the guest requested. For example hypercalls returning an error
>> encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op
>> would return -ENOSYS if the command passed as the first argument was
>> clobbered.
>>
>> Create a macro clobber_gp_top_halves to clobber top 32 bits of gp
>> registers when hyp == 0 (guest mode) and compat == 1 (AArch32 mode).
>> Add a compile time check to ensure that save_x0_x1 == 1 if
>> compat == 1.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>  xen/arch/arm/arm64/entry.S | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>> index fc3811ad0a..01f32324d0 100644
>> --- a/xen/arch/arm/arm64/entry.S
>> +++ b/xen/arch/arm/arm64/entry.S
>> @@ -102,6 +102,30 @@
>>          .endif
>>  
>>          .endm
>> +
>> +/*
>> + * Clobber top 32 bits of gp registers when switching from AArch32
>> + */
>> +        .macro clobber_gp_top_halves, compat, save_x0_x1
>> +
>> +        .if \compat == 1      /* AArch32 mode */
>> +
>> +        /*
>> +         * save_x0_x1 is equal to 0 only for guest_sync (compat == 0).
>> +         * Add a compile time check to avoid violating this rule.
>> +         */
>> +        .if \save_x0_x1 == 0
>> +        .error "save_x0_x1 is 0 but compat is 1"
>> +        .endif
>> +
>> +        .irp n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
>> +        mov w\n, w\n
>> +        .endr
> 
> What about x30 (aka lr)?
> 
Well the docs says about gp registers as a whole so including lr.
However I do not see how clobbering lr would impact Xen.
lr is not used to pass any data.

> For values read from elr_el2, spsr_el2, and esr_el2 I guess the
> hardware takes care of the high halves getting zeroed?
> 
From the docs:
"On exception entry to an Exception level using AArch64 state from an Exception level using AArch32 state,
the AArch64 Stack Pointers and Exception Link Registers associated with an Exception level that are not
accessible during execution in AArch32 state at that Exception level, retain the state that they had before
the execution in AArch32 state."

So basically they retain the state. It is a different model than the gp registers model.
> Jan
> 

Cheers,
Michal

