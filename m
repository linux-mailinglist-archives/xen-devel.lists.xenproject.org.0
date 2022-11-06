Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4161E546
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:20:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438632.692673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkFT-0004Zw-4m; Sun, 06 Nov 2022 18:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438632.692673; Sun, 06 Nov 2022 18:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkFT-0004Xj-1f; Sun, 06 Nov 2022 18:19:59 +0000
Received: by outflank-mailman (input) for mailman id 438632;
 Sun, 06 Nov 2022 18:19:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkFR-0004Xd-8C
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:19:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkFQ-0005Y9-S4; Sun, 06 Nov 2022 18:19:56 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkFQ-0000iG-Ld; Sun, 06 Nov 2022 18:19:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=6OHnUGUKM00eLzFajU4H9xE6DmXyE/8beR2b4D1sX5E=; b=tpO8mZif2cyqgQJljyz8J0hFRY
	PGwsLAmBtdvdG2IYCsDXTTlBJKFsJNN0MmsECAZFX23ScPyr4cisQNMEYP8kXuEhDJw0b/L8CjN4V
	+7ZB3Dar86hs6VGMrzX7crqzeEUOr06EYaemTmwXRSb58CfHEPfeKc+7ubxZ1iPOBODA=;
Message-ID: <4bb65932-c16e-9970-8ab8-a685aef26051@xen.org>
Date: Sun, 6 Nov 2022 18:19:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-8-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v2 07/12] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
In-Reply-To: <20221031151326.22634-8-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 31/10/2022 15:13, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 6841d5de43..8a9a014bef 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -62,6 +62,23 @@
>   #define READ_SYSREG(R...)       READ_SYSREG32(R)
>   #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
>   
> +#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
> +#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
> +
> +#define READ_SYSREG_LR(INDEX)    ({                         \
> +    uint64_t _val;                                          \
> +    uint32_t _lrc = READ_CP32(ICH_LRC_REG(INDEX));          \
> +    uint32_t _lr = READ_CP32(ICH_LR_REG(INDEX));            \
> +                                                            \
> +    _val = ((uint64_t) _lrc << 32) | _lr;                   \
> +    _val; })
> +
> +#define WRITE_SYSREG_LR(INDEX, V) ({                        \

I would prefer if the prototype stays consistent with the other write 
helpers. I.e. the value is first and the name second.

> +    uint64_t _val = (V);                                    \
> +    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(INDEX)); \
> +    WRITE_CP32(_val >> 32, ICH_LRC_REG(INDEX));           \
> +});
> +
>   /* MVFR2 is not defined on ARMv7 */
>   #define MVFR2_MAYBE_UNDEFINED
>   
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 54670084c3..353f0eea29 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -471,6 +471,9 @@
>   
>   #define READ_SYSREG(name)     READ_SYSREG64(name)
>   #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
> +#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
> +#define WRITE_SYSREG_LR(index, v)  WRITE_SYSREG(v, ICH_LR_REG(index))
> +#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
>   
>   #endif /* _ASM_ARM_ARM64_SYSREGS_H */
>   
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index 6daf2b1a30..4421dd49ac 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -362,6 +362,48 @@
>   #define MVFR0_EL1               MVFR0
>   #define MVFR1_EL1               MVFR1
>   #define MVFR2_EL1               MVFR2
> +
> +#define ___CP32(a,b,c,d,e)        a,b,c,d,e

Unless there are a reason to do, please use space after each comma. The 
same goes for the rest of the patch.

Cheers,

-- 
Julien Grall

