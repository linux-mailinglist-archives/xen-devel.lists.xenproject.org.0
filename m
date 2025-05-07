Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DADAAECCA
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 22:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978813.1365666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uClFY-0000qq-OQ; Wed, 07 May 2025 20:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978813.1365666; Wed, 07 May 2025 20:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uClFY-0000oI-LY; Wed, 07 May 2025 20:20:16 +0000
Received: by outflank-mailman (input) for mailman id 978813;
 Wed, 07 May 2025 20:20:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uClFX-0000oC-Bn
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 20:20:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uClFW-00FFju-30;
 Wed, 07 May 2025 20:20:14 +0000
Received: from [2a02:8012:3a1:0:c9b5:a95:fe54:4681]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uClFW-004sYh-26;
 Wed, 07 May 2025 20:20:14 +0000
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
	bh=ARMWzLav3jB4dx6trLgEyVdyoz4nQsU0LPXorHA/phg=; b=kKDCSSTSIZH1IyDzuRbQPJFPYN
	XUumWDFxVM9FF7DeBwjndHTGqs4ydz8u5jc3yG8Z85B7w9DaTmuQWTUMTfTsihNCTVSM3IOvSGBQR
	XP+fpSgCMRIsFSx1jnDuYB/XbVHweTg6v10oVKURVvyDSLHBuleegjNSdEYhbcJetFUw=;
Message-ID: <084a2708-f6e0-497d-9fd7-59408ddad6df@xen.org>
Date: Wed, 7 May 2025 21:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm/mpu: Introduce MPU memory mapping flags
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-6-luca.fancellu@arm.com>
 <64f32855-e33d-4d89-9066-e63f0f1cce94@xen.org>
 <4E014B93-3CFC-4FAD-B177-6B61A4996B7D@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4E014B93-3CFC-4FAD-B177-6B61A4996B7D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/04/2025 17:52, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

Sorry for the late answer.

> 
>> On 14 Apr 2025, at 12:48, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 11/04/2025 23:56, Luca Fancellu wrote:
>>> Introduce the MPU memory mapping flags in asm/page.h.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   xen/arch/arm/include/asm/page.h | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
>>> index 69f817d1e68a..22f7d2c6cb30 100644
>>> --- a/xen/arch/arm/include/asm/page.h
>>> +++ b/xen/arch/arm/include/asm/page.h
>>> @@ -62,6 +62,7 @@
>>>     #define MAIRVAL (MAIR1VAL << 32 | MAIR0VAL)
>>>   +#ifdef CONFIG_MMU
>>>   /*
>>>    * Layout of the flags used for updating the hypervisor page tables
>>>    *
>>> @@ -90,6 +91,30 @@
>>>   #define _PAGE_CONTIG_BIT    8
>>>   #define _PAGE_CONTIG        (1U << _PAGE_CONTIG_BIT)
>>>   +#else /* !CONFIG_MMU */
>>> +
>>> +/*
>>> + * Layout of the flags used for updating MPU memory region attributes
>>> + * [0:2] Memory attribute Index
>>> + * [3:4] Execute Never
>>> + * [5:6] Access Permission
>>
>> I am rather confused why we are splitting Execute Never from the Access Permission. I guess you tried to match the HW, but it also means we need to duplicate a lot of define between the MMU and MPU code.
>>
>> Instead, I would rather try to re-use the existing ones and ignore the ones we don't need (e.g. BLOCK_BIT and CONTIG).
> 
> I’m having a bit of trouble understanding the MMU part:
> 
> /*
> * Layout of the flags used for updating the hypervisor page tables
> *
> * [0:2] Memory Attribute Index
> * [3:4] Permission flags
> * [5] Page present
> * [6] Only populate page tables
> * [7] Superpage mappings is allowed
> * [8] Set contiguous bit (internal flag)
> */
> #define PAGE_AI_MASK(x) ((x) & 0x7U)
> 
> #define _PAGE_XN_BIT 3
> #define _PAGE_RO_BIT 4
> #define _PAGE_XN (1U << _PAGE_XN_BIT)
> #define _PAGE_RO (1U << _PAGE_RO_BIT)
> #define PAGE_XN_MASK(x) (((x) >> _PAGE_XN_BIT) & 0x1U)
> #define PAGE_RO_MASK(x) (((x) >> _PAGE_RO_BIT) & 0x1U)
> 
> I can see on the MMU basically AP[1] means RO or not, AP[0] means XN or not, from the arm spec
> (verison L.a, D8.4.2.1.1 Stage 2 data accesses using Direct permissions) I can see stage 2 AP[1:0] is:
>   - 00: no access
>   - 01: RO
>   - 10: WO
>   - 11: RW

This is describing the stage-2 S2AP field. Whereas the flags above are 
only used for EL2 stage-1. So you want to look at the table
Table D8-62. That said...

> 
> So:
>   - 00: read-only is zero and execution is allowed
>   - 01: read-only is zero and execution is not allowed
>   - 10: read-only is one (??), execution is allowed
>   - 11: read-only is one (??), execution is not allowed

... part of flags doesn't directly correspond to AP. Instead, we 
individually set AP[2] (called ro for Xen), AP[1] is RES1 (as we have 
only one exception level). And then 'xn' is set separately.

See mfn_to_xen_entry() and xen_pt_update_entry():

         /* Set permission */
         pte.pt.ro = PAGE_RO_MASK(flags);
         pte.pt.xn = PAGE_XN_MASK(flags);

Let me know if it makes sense.

Cheers,

-- 
Julien Grall


