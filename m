Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B4A87EE4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949861.1346304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HsH-0002no-Ek; Mon, 14 Apr 2025 11:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949861.1346304; Mon, 14 Apr 2025 11:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HsH-0002kw-BK; Mon, 14 Apr 2025 11:21:13 +0000
Received: by outflank-mailman (input) for mailman id 949861;
 Mon, 14 Apr 2025 11:21:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4HsF-0002kj-PO
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:21:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4HsF-00EoZk-0u;
 Mon, 14 Apr 2025 11:21:11 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4HsE-00D5Im-2g;
 Mon, 14 Apr 2025 11:21:11 +0000
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
	bh=XQZ8rZqCZJyrXxMxSMY0M5BftYWjPn/PjsXN+wqNehs=; b=U9QxMM8VYaM1l6dTU0JnezEwa9
	XY46TORc2/85UKGm43Ifu+oFsWFXblAjmg921mZZu+b1rFWqmZxtLuj7hyIhJWo87+31LQpr+zHn5
	ipibVaF0liwLSj7JarbNXWXGtbnhj9NpkKcT5a04rDz+TBH7FAO9lF7ICaiMamsdDp+c=;
Message-ID: <b401f18a-f32a-46c2-8e2f-343a4eb134b8@xen.org>
Date: Mon, 14 Apr 2025 20:21:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 11/04/2025 20:04, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 22871999af..8d7b95d982 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -20,6 +20,15 @@
>    * uses r0 as a placeholder register. */
>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>   
> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
> +
> +#ifdef __ASSEMBLY__
> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
> +#endif /* __ASSEMBLY__ */
> +
>   #ifndef __ASSEMBLY__
>   
>   /* C wrappers */
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index aec9e8f329..a7503a190f 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -1,6 +1,8 @@
>   #ifndef __ASM_ARM_CPREGS_H
>   #define __ASM_ARM_CPREGS_H
>   
> +#include <asm/mpu/cpregs.h>

Just to confirm, the CP registers used by the MPU will never be used for 
an other purpose on MMU systems, is that correct?

> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> new file mode 100644
> index 0000000000..e2f3b2264c
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_MPU_CPREGS_H
> +#define __ASM_ARM_MPU_CPREGS_H
> +
> +#ifdef CONFIG_ARM_32

I am not sure I agree with the placement of this ifdef. Is the 
implication that 32-bit domain will never be supported on arm64? If not, 
then everything but the aliases should be available for 64-bit (like we 
already do in asm/cpregs.h).

> +
> +/* CP15 CR0: MPU Type Register */
> +#define HMPUIR          p15,4,c0,c0,4
> +
> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
> +#define HPRSELR         p15,4,c6,c2,1
> +#define PRBAR_EL2       p15,4,c6,c3,0
> +#define PRLAR_EL2       p15,4,c6,c8,1

I am a little bit surprised the registers have _EL2 in their name. By 
any chance are you using the aarch64 naming? If so, please provide the 
32-bit name and add an alias below.

> +
> +#define MPUIR_EL2       HMPUIR
> +#define PRSELR_EL2      HPRSELR

Please add a comment on top explaining why we have the aliases (see in 
cpregs.h).

> +
> +#endif /* CONFIG_ARM_32 */
> +#endif /* __ASM_ARM_MPU_CPREGS_H */
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall


