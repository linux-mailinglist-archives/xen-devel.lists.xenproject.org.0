Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A9478A6D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 12:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248581.428764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBnN-0001Uq-KD; Fri, 17 Dec 2021 11:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248581.428764; Fri, 17 Dec 2021 11:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myBnN-0001SB-G3; Fri, 17 Dec 2021 11:53:05 +0000
Received: by outflank-mailman (input) for mailman id 248581;
 Fri, 17 Dec 2021 11:53:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cq30=RC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1myBnL-0001S5-BA
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 11:53:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e2787f47-5f2f-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 12:53:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8661A1435;
 Fri, 17 Dec 2021 03:53:00 -0800 (PST)
Received: from [10.57.7.107] (unknown [10.57.7.107])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 516403F5A1;
 Fri, 17 Dec 2021 03:52:59 -0800 (PST)
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
X-Inumbo-ID: e2787f47-5f2f-11ec-9e60-abaf8a552007
Subject: Re: [PATCH v3] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211217072159.3464-1-michal.orzel@arm.com>
 <48666542-6647-d1ec-78df-2fbb43efcc0d@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <f05fadce-3d7b-9564-0865-de683c0baaa8@arm.com>
Date: Fri, 17 Dec 2021 12:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <48666542-6647-d1ec-78df-2fbb43efcc0d@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 17.12.2021 11:01, Julien Grall wrote:
> Hi,
> 
> On 17/12/2021 07:21, Michal Orzel wrote:
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
>> Changes since v2:
>> -add clobbering of w30
>> Changes since v1:
>> -put new code into macro
>> -add compile time check for save_x0_x1
>> ---
>>   xen/arch/arm/arm64/entry.S | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
>> index fc3811ad0a..e351ef8639 100644
>> --- a/xen/arch/arm/arm64/entry.S
>> +++ b/xen/arch/arm/arm64/entry.S
>> @@ -102,6 +102,30 @@
>>           .endif
>>             .endm
>> +
>> +/*
>> + * Clobber top 32 bits of gp registers when switching from AArch32
>> + */
>> +        .macro clobber_gp_top_halves, compat, save_x0_x1
>> +
>> +        .if \compat == 1      /* AArch32 mode */
>> +
>> +        /*
>> +         * save_x0_x1 is equal to 0 only for guest_sync (compat == 0).
>> +         * Add a compile time check to avoid violating this rule.
>> +         */
> 
> We may want in the future to allow save_x0_x1 == 1 with compat == 1 if we need to create fastpath like we did when entering AArch64.
> 
> So I would reword the comment to make clear this is an implementation decision. How about:
> 
> "At the moment, no-one is using save_x0_x1 == 0 with compat == 1. So the code is not handling it to simplify the implementation."
> 
> If you are happy with the new comment, I can update it on commit:
> 
Please do. The comment looks ok.

> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Cheers,
> 

Cheers,
Michal

