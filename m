Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596279DF25E
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 18:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846216.1261420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHRWs-0006cX-Cm; Sat, 30 Nov 2024 17:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846216.1261420; Sat, 30 Nov 2024 17:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHRWs-0006aZ-A2; Sat, 30 Nov 2024 17:45:14 +0000
Received: by outflank-mailman (input) for mailman id 846216;
 Sat, 30 Nov 2024 17:45:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tHRWq-0006aT-Vl
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 17:45:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHRWq-00DT6F-17;
 Sat, 30 Nov 2024 17:45:12 +0000
Received: from [2a02:8012:3a1:0:d435:aa99:ecdf:cc2c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHRWq-005y3O-1R;
 Sat, 30 Nov 2024 17:45:12 +0000
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
	bh=Wb0b6pLykWnxEW3MPFt7EzD1sd15lDDN29Bvj32IKTg=; b=nA00FaHR/6HVagJSRnGyePipGe
	luYH4G5Yj6siwZEUAQr49NJ9pb8J1qwKZOmP7pKy+GSzefMM430lOg9MRClKziiWebmeePrD9Jept
	UYkUQJeIICCYqOHX6I/W8tP/g4kNVamK3V1o8VUzM9Z8mpn0ulP0om6jGd+UslIm/00U=;
Message-ID: <4521597b-2714-4ec2-8e80-d90dfa84ce99@xen.org>
Date: Sat, 30 Nov 2024 17:45:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
 <20241118121250.4027441-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241118121250.4027441-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 18/11/2024 12:12, Ayan Kumar Halder wrote:
> +/*
> + * Macro to prepare and set a EL2 MPU memory region.
> + * We will also create an according MPU memory region entry, which
> + * is a structure of pr_t,  in table \prmap.
> + *
> + * sel:         region selector
> + * base:        reg storing base address
> + * limit:       reg storing limit address
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * maxcount:    maximum number of EL2 regions supported
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
> + *              REGION_NORMAL_PRLAR
> + *
> + * Preserves \maxcount
> + * Clobbers \sel, \base, \limit, \prbar, \prlar

Per this line, "\sel" is clobbered. Which implies the caller cannot rely 
on the value. Yet ...

> + *
> + * Note that all parameters using registers should be distinct.
> + */
> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +    /* Check if the region is empty */
> +    cmp   \base, \limit
> +    beq   1f
> +
> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
> +    cmp   \sel, \maxcount
> +    bge   fail_insufficient_regions
> +
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    and   \base, \base, #MPU_REGION_MASK
> +    mov   \prbar, #\attr_prbar
> +    orr   \prbar, \prbar, \base
> +
> +    /* Limit address should be inclusive */
> +    sub   \limit, \limit, #1
> +    and   \limit, \limit, #MPU_REGION_MASK
> +    mov   \prlar, #\attr_prlar
> +    orr   \prlar, \prlar, \limit
> +
> +    msr   PRSELR_EL2, \sel
> +    isb
> +    msr   PRBAR_EL2, \prbar
> +    msr   PRLAR_EL2, \prlar
> +    dsb   sy
> +    isb
> +
> +    add   \sel, \sel, #1
> +
> +1:
> +.endm
> +
> +/*
> + * Failure caused due to insufficient MPU regions.
> + */
> +FUNC_LOCAL(fail_insufficient_regions)
> +    PRINT("- Selected MPU region is above the implemented number in MPUIR_EL2 -\r\n")
> +1:  wfe
> +    b   1b
> +END(fail_insufficient_regions)
> +
> +/*
> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
> + * regions.
> + *
> + * Clobbers x0 - x5
> + *
> + */
> +FUNC(enable_boot_cpu_mm)
> +    /* Get the number of regions specified in MPUIR_EL2 */
> +    mrs   x5, MPUIR_EL2
> +    and   x5, x5, #NUM_MPU_REGIONS_MASK
> +
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    ldr   x1, =_stext
> +    ldr   x2, =_etext
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen read-only data section. */
> +    ldr   x1, =_srodata
> +    ldr   x2, =_erodata
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR


... you will pass x0 (\sel) without any update from the previous call. 
So effectively, you treat \sel as an input/output that will get incremented.

Therefore the comment needs to be updated. Possibly to:

"
output:

sel: Next available index in the MPU
"

I will commit the series once we agree on the wording.

Cheers,

-- 
Julien Grall


