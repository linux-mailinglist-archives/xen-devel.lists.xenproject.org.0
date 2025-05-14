Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03889AB64ED
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984008.1370184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6yV-00028J-Em; Wed, 14 May 2025 07:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984008.1370184; Wed, 14 May 2025 07:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6yV-000260-B9; Wed, 14 May 2025 07:56:23 +0000
Received: by outflank-mailman (input) for mailman id 984008;
 Wed, 14 May 2025 07:56:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uF6yT-00025o-Q6
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:56:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6yT-008Gs5-1r;
 Wed, 14 May 2025 07:56:21 +0000
Received: from [2a02:8012:3a1:0:51a6:3d91:4273:769]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6yT-00EqjY-08;
 Wed, 14 May 2025 07:56:21 +0000
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
	bh=tnCLJ72ZR6IPMAha1TMyk5FpG8G37Vq1CT8bERcPWoA=; b=gR2hlEjerJc7XIVllFh0EjxMhE
	xwc003lyYSl3YUS2kXokyGfYmOmeQM3IUvUJYMJ6zKPbxNbniY8WJlffps3XBkFKlv0Mg8SWzGAro
	jYQrjqieJCosmu23Yivyu11gstqsmPnoj3Q1RRSd84lXgMbLO44kh5BMHc/oCEuWMStw=;
Message-ID: <bf4eb400-2852-4aee-b3e5-53ee6bbdd38c@xen.org>
Date: Wed, 14 May 2025 08:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] arm/mpu: Introduce MPU memory region map structure
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250513084532.4059388-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 13/05/2025 09:45, Luca Fancellu wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Introduce pr_t typedef which is a structure having the prbar
> and prlar members, each being structured as the registers of
> the AArch64 Armv8-R architecture.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes in v5:
>   - Given some comments on the page.h flags, I had to rework some
>     fields here to better match the flags usage and avoid duplication
> Changes in v4:
>   - Fixed typos, changed name for reserved bitfields, add emacs bits
>     to arm64/mpu.h.
>     Now base and limit are 42 bits as we consider FEAT_LPA disabled,
>     since we support max 1TB of memory.
>     Moved data structure in commit that uses it
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h | 52 ++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/mpu.h       |  4 +++
>   2 files changed, 56 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> new file mode 100644
> index 000000000000..d3c055a2e53b
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_ARM64_MPU_H__
> +#define __ARM_ARM64_MPU_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +/* Protection Region Base Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long xn_0:1;     /* Execute-Never XN[0] */
> +        unsigned long xn:1;       /* Execute-Never XN[1] */
> +        unsigned long ap_0:1;     /* Access Permission AP[0] */
> +        unsigned long ro:1;       /* Access Permission AP[1] */
> +        unsigned long sh:2;       /* Shareability */
> +        unsigned long base:42;    /* Base Address */
> +        unsigned long res0:16;    /* RES0 */
> +    } reg;
> +    uint64_t bits;
> +} prbar_t;
> +
> +/* Protection Region Limit Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long en:1;     /* Region enable */
> +        unsigned long ai:3;     /* Memory Attribute Index */
> +        unsigned long ns:1;     /* Not-Secure */
> +        unsigned long res0:1;   /* RES0 */
> +        unsigned long limit:42; /* Limit Address */
> +        unsigned long res1:16;  /* RES0 */
> +    } reg;
> +    uint64_t bits;
> +} prlar_t;
> +
> +/* MPU Protection Region */
> +typedef struct {
> +    prbar_t prbar;
> +    prlar_t prlar;
> +} pr_t;
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ARM_ARM64_MPU_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index d4ec4248b62b..bb83f5a5f580 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -6,6 +6,10 @@
>   #ifndef __ARM_MPU_H__
>   #define __ARM_MPU_H__
>   
> +#if defined(CONFIG_ARM_64)
> +# include <asm/arm64/mpu.h>
> +#endif
> +
>   #define MPU_REGION_SHIFT  6
>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>   #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))

-- 
Julien Grall


