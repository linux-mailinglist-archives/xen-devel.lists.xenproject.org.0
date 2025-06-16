Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2CADAA7B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016857.1393801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR51R-0002RN-6M; Mon, 16 Jun 2025 08:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016857.1393801; Mon, 16 Jun 2025 08:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR51R-0002P3-3Z; Mon, 16 Jun 2025 08:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1016857;
 Mon, 16 Jun 2025 08:16:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uR51P-0002Ox-6d
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:16:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR51O-004SYv-2i;
 Mon, 16 Jun 2025 08:16:50 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR51O-0077CU-2A;
 Mon, 16 Jun 2025 08:16:50 +0000
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
	bh=0vlaOGK/FbiNzZriffdHbblDsVqw2Vqrfhfw/ES0JSE=; b=HW30mwxXJIpUS28CoIV+VomP5Y
	mDAnTUf76ldmQ65k2/HCr7u1+yD9m15nM7Ji2aooIy9zB629D5gc746tkcKFnD3mFsrGTcTHSy71Y
	PkKMyEN1YJSlKh/5D0Ox1w/eet0RL3k6/2iSNk4JuOJBqL4YVdeiDU9IqLdJdyEpawkk=;
Message-ID: <182d8f4f-f41d-4e10-99d9-83be7cc8d2b4@xen.org>
Date: Mon, 16 Jun 2025 09:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm/mpu: Introduce MPU memory region map structure
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250611143544.3453532-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 11/06/2025 15:35, Ayan Kumar Halder wrote:
> Introduce pr_t typedef which is a structure having the prbar and prlar members,
> each being structured as the registers of the AArch32 Armv8-R architecture.
> 
> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
> BASE or LIMIT bitfields in prbar or prlar respectively.
> 
> In pr_of_addr(), enclose prbar and prlar arm64 specific bitfields with
> appropriate macros. So, that this function can be later reused for arm32 as
> well.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes from v1 :-
> 
> 1. Preserve pr_t typedef in arch specific files.
> 
> 2. Fix typo.
> 
> v2 :-
> 
> 1. Change CONFIG_ARM64 to CONFIG_ARM_64 to enclose arm64 specific bitfields for
> prbar and prlar registers in pr_of_addr().
> 
>   xen/arch/arm/include/asm/arm32/mpu.h | 34 ++++++++++++++++++++++++++--
>   xen/arch/arm/mpu/mm.c                |  4 ++++
>   2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index f0d4d4055c..0a6930b3a0 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -5,10 +5,40 @@
>   
>   #ifndef __ASSEMBLY__
>   
> +/*
> + * Unlike arm64, there are no reserved 0 bits beyond base and limit bitfield in
> + * prbar and prlar registers respectively.
> + */
> +#define MPU_REGION_RES0       0x0
> +
> +/* Hypervisor Protection Region Base Address Register */
> +typedef union {
> +    struct {
> +        unsigned int xn:1;       /* Execute-Never */
> +        unsigned int ap_0:1;     /* Access Permission AP[0] */
> +        unsigned int ro:1;       /* Access Permission AP[1] */
> +        unsigned int sh:2;       /* Shareability */
> +        unsigned int res0:1;
> +        unsigned int base:26;    /* Base Address */
> +    } reg;
> +    uint32_t bits;
> +} prbar_t;
> +
> +/* Hypervisor Protection Region Limit Address Register */
> +typedef union {
> +    struct {
> +        unsigned int en:1;     /* Region enable */
> +        unsigned int ai:3;     /* Memory Attribute Index */
> +        unsigned int res0:2;
> +        unsigned int limit:26; /* Limit Address */
> +    } reg;
> +    uint32_t bits;
> +} prlar_t;
> +
>   /* MPU Protection Region */
>   typedef struct {
> -    uint32_t prbar;
> -    uint32_t prlar;
> +    prbar_t prbar;
> +    prlar_t prlar;
>   } pr_t;
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 86fbe105af..3d37beab57 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -167,7 +167,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>       /* Build up value for PRBAR_EL2. */
>       prbar = (prbar_t) {
>           .reg = {
> +#ifdef CONFIG_ARM_64
>               .xn_0 = 0,
> +#endif
>               .xn = PAGE_XN_MASK(flags),
>               .ap_0 = 0,
>               .ro = PAGE_RO_MASK(flags)
> @@ -206,7 +208,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>       /* Build up value for PRLAR_EL2. */
>       prlar = (prlar_t) {
>           .reg = {
> +#ifdef CONFIG_ARM_64
>               .ns = 0,        /* Hyp mode is in secure world */
> +#endif
>               .ai = attr_idx,
>               .en = 1,        /* Region enabled */
>           }};

-- 
Julien Grall


