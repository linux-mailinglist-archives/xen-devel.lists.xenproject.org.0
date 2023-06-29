Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F316742533
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 13:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556801.869574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqFU-0001zX-Ts; Thu, 29 Jun 2023 11:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556801.869574; Thu, 29 Jun 2023 11:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEqFU-0001x6-QK; Thu, 29 Jun 2023 11:55:44 +0000
Received: by outflank-mailman (input) for mailman id 556801;
 Thu, 29 Jun 2023 11:55:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEqFT-0001x0-Iq
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 11:55:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEqFT-0002bO-2Y; Thu, 29 Jun 2023 11:55:43 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.2.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEqFS-00066g-Rr; Thu, 29 Jun 2023 11:55:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=QFkItA5zsvqGCS/6CoT3bFE1TKWbIyh6eXaJtu/ufD8=; b=Y0ggWk8h+0kwm6osHQVs0Z3q+g
	D/2AJzt8KzkiVf7JUPKaXH+KV5O7oJgYTQkIO3QbFkD/8ncMOC2mdnaHmHpZh99AmjOH2/Lf4deY9
	1jCfh4rB0O2IrzRekyoDyunv85XK176mEVZhtZg+uFCCZC6BScm0Sxr9TE5aY+f/Y2cU=;
Message-ID: <6a06868f-beea-13c3-5d18-23930c7dd971@xen.org>
Date: Thu, 29 Jun 2023 12:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
 <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
 <39a5a729-0099-67e4-bf4a-c65ae99a4619@xen.org>
 <37e2856b-038e-6a3a-a6ff-c518dfeda552@amd.com>
 <f849b3cc-f9c1-131a-f6c1-5be27911ec6e@xen.org>
 <301e2e02-f2ab-5538-d426-52a02a7f35b5@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <301e2e02-f2ab-5538-d426-52a02a7f35b5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 29/06/2023 12:21, Ayan Kumar Halder wrote:
> 
> On 28/06/2023 14:42, Julien Grall wrote:
>> What's the guarantee that the compiler will not generate any 
>> instructions that could generate an alignment fault?
> 
> I thought by writing in assembly, we tell the compiler what instructions 
> to generate. For eg
> 
> ENTRY(set_boot_mpumap)
>      push {r4}
>      mov   r2, #0               /* table index */
> 1:  ldr   r3, [r1], #4         /* r3: prbar */
>      ldr   r4, [r1], #12        /* r4: prlar */
>      write_pr r2, r3, r4
>      add   r2, r2, #1           /* table index ++ */
>      cmp   r2, r0
>      blt  1b
>      pop {r4}
>      ret
> ENDPROC(set_boot_mpumap)
> 
> I ask the compiler to use ldr (and not ldrb) instructions.
> 
> May be I am missing something very obvious here.

The problem is not the assembly code. The problem is the C code. You wrote:

     /*
      * Since it is the MPU protection region which holds the XEN kernel 
that
      * needs updating.
      * The whole MPU system must be disabled for the update.
      */
     disable_mpu();

     /*
      * Set new MPU memory region configuration.
      * To avoid the mismatch between nr_xen_mpumap and nr_xen_mpumap
      * after the relocation of some MPU regions later, here
      * next_xen_mpumap_index is used.
      * To avoid unexpected unaligment access fault during MPU disabled,
      * set_boot_mpumap shall be written in assembly code.
      */
     set_boot_mpumap(next_xen_mpumap_index, (pr_t *)boot_mpumap);

     enable_mpu();

You can't guarantee what assembly instructions the compiler will use for 
any of this code. So if you are concerned about unaligned access when 
the MPU is disabled, then you should never return to C (even 
temporarily) while the MPU is off.

>>
>> Furthermore, from my understanding, at least on Armv8-A, there are 
>> caching problem because you will need to save some registers (for the 
>> call to set_boot_mpumap()) on the stack with cache disabled. This 
>> means the cache will be bypassed. But you may then restore the 
>> registers with the cache enabled (the compiler could decide that it is 
>> not necessary to read the stack before hand). So you could read the 
>> wrong data if there is a stale cacheline.
> 
> Yes, this makes some sense. So will the following make it correct :-

I am confused. In a previous answer, I voiced my concerned with trying 
to replace the full MPU table. So it is not clear to me why you are 
asking me if the following work. Do you still want to do it? If so, why?

> 
> 1. Execute 'dmb' before invoking enable_mpu(). This will ensure that the 
> registers are strictly restored in set_boot_mpumap() before the HSCTLR 
> is read.

I am afraid I don't know how the DMB will enforce that. Can you clarify?

> 
> We do have 'dsb sy' before modifying HSCTLR (ie enabling cache), but may 
> be we want to be stricter.
> 
> 2. Invalidate the D cache after "mcr   CP32(r0, HSCTLR)" and then dsb 
> (to ensure d cache is invalidated), isb (flush the instruction cache as 
> MPU is enabled), ret.

I might be missing something here. The ISB instruction will not flush 
the instruction cache, it will flush the pipeline instead and guarantee 
that previous instructions will complete before continuing.

But overall, the easiest solution is to disable the MPU, update the MPU 
tables, and then re-enable the MPU all in assembly (i.e. no jump back to 
C even temporarily).

So you control the accesses and can limit (if not remove) any write to 
the memory whilst the cache is disabled.

Cheers,

-- 
Julien Grall

