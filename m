Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0A2D4E6E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48817.86358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8Uj-0006cK-D4; Wed, 09 Dec 2020 23:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48817.86358; Wed, 09 Dec 2020 23:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8Uj-0006bv-9Y; Wed, 09 Dec 2020 23:03:37 +0000
Received: by outflank-mailman (input) for mailman id 48817;
 Wed, 09 Dec 2020 23:03:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn8Uh-0006bq-Gh
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:03:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8Ug-0004W7-9F; Wed, 09 Dec 2020 23:03:34 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8Uf-0008Ro-VS; Wed, 09 Dec 2020 23:03:34 +0000
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
	bh=3MQJ9vloOwkHii0kvk6B1/G/TcoG2G3CSPvRoenFr9Q=; b=1P6Xm7LqFuAHlkLQjVhOBnZFtu
	qBwWrkysyShYRewioM4fEl3dJKOG3dZB6x5O7lxkaDMCD0Tnff206vXIIdvvRTHUSHsKZWaP5oqIM
	fwjuNQh8/XBlB1VkG9vqkVCbsjM9qj7O7XNZQbrJUGcqjo32orlqvvELPdsHLcgNACbk=;
Subject: Re: [PATCH v3 1/7] xen/arm: Add ID registers and complete cpuinfo
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <aab713989bec4dc843bd513c03b305c83028851b.1607524536.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <62484fa0-fa86-523a-12e0-54d69934d791@xen.org>
Date: Wed, 9 Dec 2020 23:03:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <aab713989bec4dc843bd513c03b305c83028851b.1607524536.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 09/12/2020 16:30, Bertrand Marquis wrote:
> Add definition and entries in cpuinfo for ID registers introduced in
> newer Arm Architecture reference manual:
> - ID_PFR2: processor feature register 2
> - ID_DFR1: debug feature register 1
> - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
> - ID_ISA6: ISA Feature register 6
> Add more bitfield definitions in PFR fields of cpuinfo.
> Add MVFR2 register definition for aarch32.
> Add mvfr values in cpuinfo.
> Add some registers definition for arm64 in sysregs as some are not
> always know by compilers.
> Initialize the new values added in cpuinfo in identify_cpu during init.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> ---
> Changes in V2:
>    Fix dbg32 table size and add proper initialisation of the second entry
>    of the table by reading ID_DFR1 register.
> Changes in V3:
>    Fix typo in commit title
>    Add MVFR2 definition and handling on aarch32 and remove specific case
>    for mvfr field in cpuinfo (now the same on arm64 and arm32).
>    Add MMFR4 definition if not known by the compiler.
> 
> ---
>   xen/arch/arm/cpufeature.c           | 18 ++++++++++
>   xen/include/asm-arm/arm64/sysregs.h | 28 +++++++++++++++
>   xen/include/asm-arm/cpregs.h        | 12 +++++++
>   xen/include/asm-arm/cpufeature.h    | 56 ++++++++++++++++++++++++-----
>   4 files changed, 105 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 44126dbf07..bc7ee5ac95 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -114,15 +114,20 @@ void identify_cpu(struct cpuinfo_arm *c)
>   
>           c->mm64.bits[0]  = READ_SYSREG64(ID_AA64MMFR0_EL1);
>           c->mm64.bits[1]  = READ_SYSREG64(ID_AA64MMFR1_EL1);
> +        c->mm64.bits[2]  = READ_SYSREG64(ID_AA64MMFR2_EL1);
>   
>           c->isa64.bits[0] = READ_SYSREG64(ID_AA64ISAR0_EL1);
>           c->isa64.bits[1] = READ_SYSREG64(ID_AA64ISAR1_EL1);
> +
> +        c->zfr64.bits[0] = READ_SYSREG64(ID_AA64ZFR0_EL1);
>   #endif
>   
>           c->pfr32.bits[0] = READ_SYSREG32(ID_PFR0_EL1);
>           c->pfr32.bits[1] = READ_SYSREG32(ID_PFR1_EL1);
> +        c->pfr32.bits[2] = READ_SYSREG32(ID_PFR2_EL1);
>   
>           c->dbg32.bits[0] = READ_SYSREG32(ID_DFR0_EL1);
> +        c->dbg32.bits[1] = READ_SYSREG32(ID_DFR1_EL1);
>   
>           c->aux32.bits[0] = READ_SYSREG32(ID_AFR0_EL1);
>   
> @@ -130,6 +135,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>           c->mm32.bits[1]  = READ_SYSREG32(ID_MMFR1_EL1);
>           c->mm32.bits[2]  = READ_SYSREG32(ID_MMFR2_EL1);
>           c->mm32.bits[3]  = READ_SYSREG32(ID_MMFR3_EL1);
> +        c->mm32.bits[4]  = READ_SYSREG32(ID_MMFR4_EL1);
> +        c->mm32.bits[5]  = READ_SYSREG32(ID_MMFR5_EL1);

Please don't introduce any more use of READ_SYSREG32(), they are wrong 
on Armv8 because system registers are always 64-bit.

>   
>           c->isa32.bits[0] = READ_SYSREG32(ID_ISAR0_EL1);
>           c->isa32.bits[1] = READ_SYSREG32(ID_ISAR1_EL1);
> @@ -137,6 +144,17 @@ void identify_cpu(struct cpuinfo_arm *c)
>           c->isa32.bits[3] = READ_SYSREG32(ID_ISAR3_EL1);
>           c->isa32.bits[4] = READ_SYSREG32(ID_ISAR4_EL1);
>           c->isa32.bits[5] = READ_SYSREG32(ID_ISAR5_EL1);
> +        c->isa32.bits[6] = READ_SYSREG32(ID_ISAR6_EL1);
> +
> +#ifdef CONFIG_ARM_64
> +        c->mvfr.bits[0] = READ_SYSREG64(MVFR0_EL1);
> +        c->mvfr.bits[1] = READ_SYSREG64(MVFR1_EL1);
> +        c->mvfr.bits[2] = READ_SYSREG64(MVFR2_EL1);
> +#else
> +        c->mvfr.bits[0] = READ_CP32(MVFR0);
> +        c->mvfr.bits[1] = READ_CP32(MVFR1);
> +        c->mvfr.bits[2] = READ_CP32(MVFR2);
> +#endif

READ_SYSREG() will do the job to either use READ_SYSREG64() or 
READ_CP32() depending on the arch used.

>   }
>   
>   /*
> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
> index c60029d38f..077fd95fb7 100644
> --- a/xen/include/asm-arm/arm64/sysregs.h
> +++ b/xen/include/asm-arm/arm64/sysregs.h
> @@ -57,6 +57,34 @@
>   #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>   #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>   
> +/*
> + * Define ID coprocessor registers if they are not
> + * already defined by the compiler.
> + *
> + * Values picked from linux kernel
> + */
> +#ifndef ID_AA64MMFR2_EL1

I am a bit puzzled how this meant to work. Will the libc/compiler 
headers define ID_AA64MMFR2_EL1?

> +#define ID_AA64MMFR2_EL1            S3_0_C0_C7_2
> +#endif
> +#ifndef ID_PFR2_EL1
> +#define ID_PFR2_EL1                 S3_0_C0_C3_4
> +#endif
> +#ifndef ID_MMFR4_EL1
> +#define ID_MMFR4_EL1                S3_0_C0_C2_6
> +#endif
> +#ifndef ID_MMFR5_EL1
> +#define ID_MMFR5_EL1                S3_0_C0_C3_6
> +#endif
> +#ifndef ID_ISAR6_EL1
> +#define ID_ISAR6_EL1                S3_0_C0_C2_7
> +#endif
> +#ifndef ID_AA64ZFR0_EL1
> +#define ID_AA64ZFR0_EL1             S3_0_C0_C4_4
> +#endif
> +#ifndef ID_DFR1_EL1
> +#define ID_DFR1_EL1                 S3_0_C0_C3_5
> +#endif
> +
>   /* Access to system registers */
>   
>   #define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
> index 8fd344146e..2690ddeb7a 100644
> --- a/xen/include/asm-arm/cpregs.h
> +++ b/xen/include/asm-arm/cpregs.h
> @@ -63,6 +63,8 @@
>   #define FPSID           p10,7,c0,c0,0   /* Floating-Point System ID Register */
>   #define FPSCR           p10,7,c1,c0,0   /* Floating-Point Status and Control Register */
>   #define MVFR0           p10,7,c7,c0,0   /* Media and VFP Feature Register 0 */
> +#define MVFR1           p10,7,c6,c0,0   /* Media and VFP Feature Register 1 */
> +#define MVFR2           p10,7,c5,c0,0   /* Media and VFP Feature Register 2 */
>   #define FPEXC           p10,7,c8,c0,0   /* Floating-Point Exception Control Register */
>   #define FPINST          p10,7,c9,c0,0   /* Floating-Point Instruction Register */
>   #define FPINST2         p10,7,c10,c0,0  /* Floating-point Instruction Register 2 */
> @@ -108,18 +110,23 @@
>   #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Register */
>   #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0 */
>   #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1 */
> +#define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2 */
>   #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
> +#define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
>   #define ID_AFR0         p15,0,c0,c1,3   /* Auxiliary Feature Register 0 */
>   #define ID_MMFR0        p15,0,c0,c1,4   /* Memory Model Feature Register 0 */
>   #define ID_MMFR1        p15,0,c0,c1,5   /* Memory Model Feature Register 1 */
>   #define ID_MMFR2        p15,0,c0,c1,6   /* Memory Model Feature Register 2 */
>   #define ID_MMFR3        p15,0,c0,c1,7   /* Memory Model Feature Register 3 */
> +#define ID_MMFR4        p15,0,c0,c2,6   /* Memory Model Feature Register 4 */
> +#define ID_MMFR5        p15,0,c0,c3,6   /* Memory Model Feature Register 5 */
>   #define ID_ISAR0        p15,0,c0,c2,0   /* ISA Feature Register 0 */
>   #define ID_ISAR1        p15,0,c0,c2,1   /* ISA Feature Register 1 */
>   #define ID_ISAR2        p15,0,c0,c2,2   /* ISA Feature Register 2 */
>   #define ID_ISAR3        p15,0,c0,c2,3   /* ISA Feature Register 3 */
>   #define ID_ISAR4        p15,0,c0,c2,4   /* ISA Feature Register 4 */
>   #define ID_ISAR5        p15,0,c0,c2,5   /* ISA Feature Register 5 */
> +#define ID_ISAR6        p15,0,c0,c2,7   /* ISA Feature Register 6 */
>   #define CCSIDR          p15,1,c0,c0,0   /* Cache Size ID Registers */
>   #define CLIDR           p15,1,c0,c0,1   /* Cache Level ID Register */
>   #define CSSELR          p15,2,c0,c0,0   /* Cache Size Selection Register */
> @@ -312,18 +319,23 @@
>   #define HSTR_EL2                HSTR
>   #define ID_AFR0_EL1             ID_AFR0
>   #define ID_DFR0_EL1             ID_DFR0
> +#define ID_DFR1_EL1             ID_DFR1
>   #define ID_ISAR0_EL1            ID_ISAR0
>   #define ID_ISAR1_EL1            ID_ISAR1
>   #define ID_ISAR2_EL1            ID_ISAR2
>   #define ID_ISAR3_EL1            ID_ISAR3
>   #define ID_ISAR4_EL1            ID_ISAR4
>   #define ID_ISAR5_EL1            ID_ISAR5
> +#define ID_ISAR6_EL1            ID_ISAR6
>   #define ID_MMFR0_EL1            ID_MMFR0
>   #define ID_MMFR1_EL1            ID_MMFR1
>   #define ID_MMFR2_EL1            ID_MMFR2
>   #define ID_MMFR3_EL1            ID_MMFR3
> +#define ID_MMFR4_EL1            ID_MMFR4
> +#define ID_MMFR5_EL1            ID_MMFR5
>   #define ID_PFR0_EL1             ID_PFR0
>   #define ID_PFR1_EL1             ID_PFR1
> +#define ID_PFR2_EL1             ID_PFR2
>   #define IFSR32_EL2              IFSR
>   #define MDCR_EL2                HDCR
>   #define MIDR_EL1                MIDR
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index c7b5052992..6cf83d775b 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -148,6 +148,7 @@ struct cpuinfo_arm {
>       union {
>           uint64_t bits[2];
>           struct {
> +            /* PFR0 */
>               unsigned long el0:4;
>               unsigned long el1:4;
>               unsigned long el2:4;
> @@ -155,9 +156,23 @@ struct cpuinfo_arm {
>               unsigned long fp:4;   /* Floating Point */
>               unsigned long simd:4; /* Advanced SIMD */
>               unsigned long gic:4;  /* GIC support */
> -            unsigned long __res0:28;
> +            unsigned long ras:4;
> +            unsigned long sve:4;
> +            unsigned long sel2:4;
> +            unsigned long mpam:4;
> +            unsigned long amu:4;
> +            unsigned long dit:4;
> +            unsigned long __res0:4;
>               unsigned long csv2:4;
> -            unsigned long __res1:4;
> +            unsigned long cvs3:4;
> +
> +            /* PFR1 */
> +            unsigned long bt:4;
> +            unsigned long ssbs:4;
> +            unsigned long mte:4;
> +            unsigned long ras_frac:4;
> +            unsigned long mpam_frac:4;
> +            unsigned long __res1:44;
>           };
>       } pfr64;
>   
> @@ -170,7 +185,7 @@ struct cpuinfo_arm {
>       } aux64;
>   
>       union {
> -        uint64_t bits[2];
> +        uint64_t bits[3];
>           struct {
>               unsigned long pa_range:4;
>               unsigned long asid_bits:4;
> @@ -190,6 +205,8 @@ struct cpuinfo_arm {
>               unsigned long pan:4;
>               unsigned long __res1:8;
>               unsigned long __res2:32;
> +
> +            unsigned long __res3:64;
>           };
>       } mm64;
>   
> @@ -197,6 +214,10 @@ struct cpuinfo_arm {
>           uint64_t bits[2];
>       } isa64;
>   
> +    struct {
> +        uint64_t bits[1];
> +    } zfr64;
> +
>   #endif
>   
>       /*
> @@ -204,25 +225,38 @@ struct cpuinfo_arm {
>        * when running in 32-bit mode.
>        */
>       union {
> -        uint32_t bits[2];
> +        uint32_t bits[3];
>           struct {
> +            /* PFR0 */
>               unsigned long arm:4;
>               unsigned long thumb:4;
>               unsigned long jazelle:4;
>               unsigned long thumbee:4;
> -            unsigned long __res0:16;
> +            unsigned long csv2:4;
> +            unsigned long amu:4;
> +            unsigned long dit:4;
> +            unsigned long ras:4;
>   
> +            /* PFR1 */
>               unsigned long progmodel:4;
>               unsigned long security:4;
>               unsigned long mprofile:4;
>               unsigned long virt:4;
>               unsigned long gentimer:4;
> -            unsigned long __res1:12;
> +            unsigned long sec_frac:4;
> +            unsigned long virt_frac:4;
> +            unsigned long gic:4;
> +
> +            /* PFR2 */
> +            unsigned long csv3:4;
> +            unsigned long ssbs:4;
> +            unsigned long ras_frac:4;
> +            unsigned long __res2:20;
>           };
>       } pfr32;
>   
>       struct {
> -        uint32_t bits[1];
> +        uint32_t bits[2];
>       } dbg32;
>   
>       struct {
> @@ -230,12 +264,16 @@ struct cpuinfo_arm {
>       } aux32;
>   
>       struct {
> -        uint32_t bits[4];
> +        uint32_t bits[6];
>       } mm32;
>   
>       struct {
> -        uint32_t bits[6];
> +        uint32_t bits[7];
>       } isa32;
> +
> +    struct {
> +        uint64_t bits[3];

Shouldn't this be register_t?

> +    } mvfr;
>   };
>   
>   extern struct cpuinfo_arm boot_cpu_data;
> 

-- 
Julien Grall

