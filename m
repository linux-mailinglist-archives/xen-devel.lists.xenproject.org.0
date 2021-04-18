Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2A36371A
	for <lists+xen-devel@lfdr.de>; Sun, 18 Apr 2021 20:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112524.214678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBmq-0005yR-LH; Sun, 18 Apr 2021 18:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112524.214678; Sun, 18 Apr 2021 18:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYBmq-0005y5-ID; Sun, 18 Apr 2021 18:04:48 +0000
Received: by outflank-mailman (input) for mailman id 112524;
 Sun, 18 Apr 2021 18:04:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYBmo-0005xw-61
 for xen-devel@lists.xenproject.org; Sun, 18 Apr 2021 18:04:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBmn-0007YN-1e; Sun, 18 Apr 2021 18:04:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYBmm-0002cB-OZ; Sun, 18 Apr 2021 18:04:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=RUOwWtlLaQC3izBU8Lx7a8oS+ie2Ya8Rso3dy+hoJ8k=; b=TmRN5anIhtWiv3dOtK9WW26MM0
	DQiRm/1/Sgb/Or1m8PG8tArrA5lJmcSUeMn4dPbkpXddBAp1tQVPaCiNqHKGkfnJy957X3ghffDvZ
	o44xO30hIH5P2zv2Fbc7RBizqcsfve+MwGHN4XObEF1wm9ViaXc/LBpZ3Kr3tF0F7Sk4=;
Subject: Re: [PATCH v3 2/2] xen/arm64: Place a speculation barrier following
 an ret instruction
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210401164444.20377-1-julien@xen.org>
 <20210401164444.20377-3-julien@xen.org>
 <alpine.DEB.2.21.2104131558410.4885@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <84c127d0-557c-9161-8696-f227d6c18658@xen.org>
Date: Sun, 18 Apr 2021 19:04:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2104131558410.4885@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/04/2021 00:03, Stefano Stabellini wrote:
> On Thu, 1 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Some CPUs can speculate past a RET instruction and potentially perform
>> speculative accesses to memory before processing the return.
>>
>> There is no known gadget available after the RET instruction today.
>> However some of the registers (such as in check_pending_guest_serror())
>> may contain a value provided by the guest.
>>
>> In order to harden the code, it would be better to add a speculation
>> barrier after each RET instruction. The performance impact is meant to
>> be negligeable as the speculation barrier is not meant to be
>> architecturally executed.
>>
>> Rather than manually inserting a speculation barrier, use a macro
>> which overrides the mnemonic RET and replace with RET + SB. We need to
>> use the opcode for RET to prevent any macro recursion.
>>
>> This patch is only covering the assembly code. C code would need to be
>> covered separately using the compiler support.
>>
>> This is part of the work to mitigate straight-line speculation.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> ---
>>
>> It is not clear to me whether Armv7 (we don't officially support 32-bit
>> hypervisor on Armv8) is also affected by straight-line speculation.
>> The LLVM website suggests it is: https://reviews.llvm.org/D92395
>>
>> For now only focus on arm64.
>>
>>      Changes in v3:
>>          -  Add Bertrand's reviewed-by
>>
>>      Changes in v2:
>>          - Use a macro rather than inserting the speculation barrier
>>          manually
>>          - Remove mitigation for arm32
>> ---
>>   xen/arch/arm/arm32/entry.S         |  1 +
>>   xen/arch/arm/arm32/lib/lib1funcs.S |  1 +
>>   xen/include/asm-arm/arm64/macros.h |  6 ++++++
>>   xen/include/asm-arm/macros.h       | 18 +++++++++---------
>>   4 files changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
>> index f2f1bc7a3158..d0a066484f13 100644
>> --- a/xen/arch/arm/arm32/entry.S
>> +++ b/xen/arch/arm/arm32/entry.S
>> @@ -441,6 +441,7 @@ ENTRY(__context_switch)
>>   
>>           add     r4, r1, #VCPU_arch_saved_context
>>           ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and return */
>> +        sb
>>   
>>   /*
>>    * Local variables:
>> diff --git a/xen/arch/arm/arm32/lib/lib1funcs.S b/xen/arch/arm/arm32/lib/lib1funcs.S
>> index f1278bd6c139..8c33ffbbcc4c 100644
>> --- a/xen/arch/arm/arm32/lib/lib1funcs.S
>> +++ b/xen/arch/arm/arm32/lib/lib1funcs.S
>> @@ -382,5 +382,6 @@ UNWIND(.save {lr})
>>   	bl	__div0
>>   	mov	r0, #0			@ About as wrong as it could be.
>>   	ldr	pc, [sp], #8
>> +	sb
>>   UNWIND(.fnend)
>>   ENDPROC(Ldiv0)
>> diff --git a/xen/include/asm-arm/arm64/macros.h b/xen/include/asm-arm/arm64/macros.h
>> index f981b4f43e84..4614394b3dd5 100644
>> --- a/xen/include/asm-arm/arm64/macros.h
>> +++ b/xen/include/asm-arm/arm64/macros.h
>> @@ -21,6 +21,12 @@
>>       ldr     \dst, [\dst, \tmp]
>>       .endm
>>   
>> +    .macro  ret
>> +        // ret opcode
> 
> This series is very nice Julien! You can add my acked-by to both patches
> and also commit them.

I have realized that I left a couple of arm32 specific code in the 
patch. I will commit the first one and respin this one.

> 
> One minor request: could you please replace this comment with
> 
> /* ret opcode */
> 
> on commit?  // is not part of the coding style.

I have modified it in the new version.

Cheers,

-- 
Julien Grall

