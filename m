Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A782CF7B5
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 00:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45111.80587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKsZ-0002Yh-BZ; Fri, 04 Dec 2020 23:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45111.80587; Fri, 04 Dec 2020 23:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKsZ-0002YI-86; Fri, 04 Dec 2020 23:52:47 +0000
Received: by outflank-mailman (input) for mailman id 45111;
 Fri, 04 Dec 2020 23:52:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNFP=FI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klKsY-0002YD-0D
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 23:52:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f734f3-864b-42ce-b86e-f95466562de2;
 Fri, 04 Dec 2020 23:52:45 +0000 (UTC)
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
X-Inumbo-ID: e7f734f3-864b-42ce-b86e-f95466562de2
Date: Fri, 4 Dec 2020 15:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607125964;
	bh=YYyU6PwrDiQTEYcWMMLQfrhbgp4/5WOqB7PcoZaU+jM=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=l48xANx5IC8noSkTBcMCOxBrHjWDmuz9tkL5BHLxh7uW37ghXpF+9xpxMobDymnUZ
	 JiLLOxnTiBKVEdguyZyu9jx3ja999zvvbaTAF965Nf5z9NO2AeZ5XPotncQLDMjg8s
	 tFVHSIf8/X2nv0MZpmOjuUnkOI8ahuDto60bCG5HT7AGmIwqz6XzSrS/nltsmoj06S
	 3Qe2RHnQADhE1QN9LI+ZlYCINzjwoFH3SXndM06kjU8arbLKsDbemTR/0cHZii8tth
	 Uk/p+V/CxANa14weEwM2Ci2f2JrzuWLpUxUpgfs3IP7Camt5G1lEjg+G221RlTM5vG
	 wKx5YC/dBE4Ng==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/7] xen/arm: Add ID registers and complete cpufinfo
In-Reply-To: <97efd89cccdffc2a7fd987ac8156f5eea191fd3f.1606742184.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012041546340.32240@sstabellini-ThinkPad-T480s>
References: <cover.1606742184.git.bertrand.marquis@arm.com> <97efd89cccdffc2a7fd987ac8156f5eea191fd3f.1606742184.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

There is a typo in the subject line


On Mon, 30 Nov 2020, Bertrand Marquis wrote:
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

I realize I am using an old compiler but I am getting a build error:

/local/repos/gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-gcc -MMD -MP -MF ./.cpufeature.o.d  -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O1 -fno-omit-frame-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla -pipe -D__XEN__ -include /local/repos/xen-upstream/xen/include/xen/config.h -Wa,--strip-local-absolute -g -mcpu=generic -mgeneral-regs-only   -I/local/repos/xen-upstream/xen/include -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -Wnested-externs '-D__OBJECT_FILE__="cpufeature.o"'  -c cpufeature.c -o cpufeature.o
{standard input}: Assembler messages:
{standard input}:634: Error: unknown or missing system register name at operand 2 -- `mrs x1,ID_MMFR4_EL1'

If I remove the line:

  c->mm32.bits[4]  = READ_SYSREG32(ID_MMFR4_EL1);


it builds just fine



> ---
> Changes in V2:
>   Fix dbg32 table size and add proper initialisation of the second entry
>   of the table by reading ID_DFR1 register.
> ---
>  xen/arch/arm/cpufeature.c           | 17 ++++++++
>  xen/include/asm-arm/arm64/sysregs.h | 25 ++++++++++++
>  xen/include/asm-arm/cpregs.h        | 11 +++++
>  xen/include/asm-arm/cpufeature.h    | 63 ++++++++++++++++++++++++-----
>  4 files changed, 107 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 44126dbf07..204be9b084 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -114,15 +114,20 @@ void identify_cpu(struct cpuinfo_arm *c)
>  
>          c->mm64.bits[0]  = READ_SYSREG64(ID_AA64MMFR0_EL1);
>          c->mm64.bits[1]  = READ_SYSREG64(ID_AA64MMFR1_EL1);
> +        c->mm64.bits[2]  = READ_SYSREG64(ID_AA64MMFR2_EL1);
>  
>          c->isa64.bits[0] = READ_SYSREG64(ID_AA64ISAR0_EL1);
>          c->isa64.bits[1] = READ_SYSREG64(ID_AA64ISAR1_EL1);
> +
> +        c->zfr64.bits[0] = READ_SYSREG64(ID_AA64ZFR0_EL1);
>  #endif
>  
>          c->pfr32.bits[0] = READ_SYSREG32(ID_PFR0_EL1);
>          c->pfr32.bits[1] = READ_SYSREG32(ID_PFR1_EL1);
> +        c->pfr32.bits[2] = READ_SYSREG32(ID_PFR2_EL1);
>  
>          c->dbg32.bits[0] = READ_SYSREG32(ID_DFR0_EL1);
> +        c->dbg32.bits[1] = READ_SYSREG32(ID_DFR1_EL1);
>  
>          c->aux32.bits[0] = READ_SYSREG32(ID_AFR0_EL1);
>  
> @@ -130,6 +135,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>          c->mm32.bits[1]  = READ_SYSREG32(ID_MMFR1_EL1);
>          c->mm32.bits[2]  = READ_SYSREG32(ID_MMFR2_EL1);
>          c->mm32.bits[3]  = READ_SYSREG32(ID_MMFR3_EL1);
> +        c->mm32.bits[4]  = READ_SYSREG32(ID_MMFR4_EL1);
> +        c->mm32.bits[5]  = READ_SYSREG32(ID_MMFR5_EL1);
>  
>          c->isa32.bits[0] = READ_SYSREG32(ID_ISAR0_EL1);
>          c->isa32.bits[1] = READ_SYSREG32(ID_ISAR1_EL1);
> @@ -137,6 +144,16 @@ void identify_cpu(struct cpuinfo_arm *c)
>          c->isa32.bits[3] = READ_SYSREG32(ID_ISAR3_EL1);
>          c->isa32.bits[4] = READ_SYSREG32(ID_ISAR4_EL1);
>          c->isa32.bits[5] = READ_SYSREG32(ID_ISAR5_EL1);
> +        c->isa32.bits[6] = READ_SYSREG32(ID_ISAR6_EL1);
> +
> +#ifdef CONFIG_ARM_64
> +        c->mvfr.bits[0] = READ_SYSREG64(MVFR0_EL1);
> +        c->mvfr.bits[1] = READ_SYSREG64(MVFR1_EL1);
> +        c->mvfr.bits[2] = READ_SYSREG64(MVFR2_EL1);
> +#else
> +        c->mvfr.bits[0] = READ_CP32(MVFR0);
> +        c->mvfr.bits[1] = READ_CP32(MVFR1);
> +#endif
>  }
>  
>  /*
> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
> index c60029d38f..5abbeda3fd 100644
> --- a/xen/include/asm-arm/arm64/sysregs.h
> +++ b/xen/include/asm-arm/arm64/sysregs.h
> @@ -57,6 +57,31 @@
>  #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>  #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>  
> +/*
> + * Define ID coprocessor registers if they are not
> + * already defined by the compiler.
> + *
> + * Values picked from linux kernel
> + */
> +#ifndef ID_AA64MMFR2_EL1
> +#define ID_AA64MMFR2_EL1            S3_0_C0_C7_2
> +#endif
> +#ifndef ID_PFR2_EL1
> +#define ID_PFR2_EL1                 S3_0_C0_C3_4
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
>  /* Access to system registers */
>  
>  #define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
> index 8fd344146e..58be898891 100644
> --- a/xen/include/asm-arm/cpregs.h
> +++ b/xen/include/asm-arm/cpregs.h
> @@ -63,6 +63,7 @@
>  #define FPSID           p10,7,c0,c0,0   /* Floating-Point System ID Register */
>  #define FPSCR           p10,7,c1,c0,0   /* Floating-Point Status and Control Register */
>  #define MVFR0           p10,7,c7,c0,0   /* Media and VFP Feature Register 0 */
> +#define MVFR1           p10,7,c6,c0,0   /* Media and VFP Feature Register 1 */
>  #define FPEXC           p10,7,c8,c0,0   /* Floating-Point Exception Control Register */
>  #define FPINST          p10,7,c9,c0,0   /* Floating-Point Instruction Register */
>  #define FPINST2         p10,7,c10,c0,0  /* Floating-point Instruction Register 2 */
> @@ -108,18 +109,23 @@
>  #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Register */
>  #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0 */
>  #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1 */
> +#define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2 */
>  #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
> +#define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
>  #define ID_AFR0         p15,0,c0,c1,3   /* Auxiliary Feature Register 0 */
>  #define ID_MMFR0        p15,0,c0,c1,4   /* Memory Model Feature Register 0 */
>  #define ID_MMFR1        p15,0,c0,c1,5   /* Memory Model Feature Register 1 */
>  #define ID_MMFR2        p15,0,c0,c1,6   /* Memory Model Feature Register 2 */
>  #define ID_MMFR3        p15,0,c0,c1,7   /* Memory Model Feature Register 3 */
> +#define ID_MMFR4        p15,0,c0,c2,6   /* Memory Model Feature Register 4 */
> +#define ID_MMFR5        p15,0,c0,c3,6   /* Memory Model Feature Register 5 */
>  #define ID_ISAR0        p15,0,c0,c2,0   /* ISA Feature Register 0 */
>  #define ID_ISAR1        p15,0,c0,c2,1   /* ISA Feature Register 1 */
>  #define ID_ISAR2        p15,0,c0,c2,2   /* ISA Feature Register 2 */
>  #define ID_ISAR3        p15,0,c0,c2,3   /* ISA Feature Register 3 */
>  #define ID_ISAR4        p15,0,c0,c2,4   /* ISA Feature Register 4 */
>  #define ID_ISAR5        p15,0,c0,c2,5   /* ISA Feature Register 5 */
> +#define ID_ISAR6        p15,0,c0,c2,7   /* ISA Feature Register 6 */
>  #define CCSIDR          p15,1,c0,c0,0   /* Cache Size ID Registers */
>  #define CLIDR           p15,1,c0,c0,1   /* Cache Level ID Register */
>  #define CSSELR          p15,2,c0,c0,0   /* Cache Size Selection Register */
> @@ -312,18 +318,23 @@
>  #define HSTR_EL2                HSTR
>  #define ID_AFR0_EL1             ID_AFR0
>  #define ID_DFR0_EL1             ID_DFR0
> +#define ID_DFR1_EL1             ID_DFR1
>  #define ID_ISAR0_EL1            ID_ISAR0
>  #define ID_ISAR1_EL1            ID_ISAR1
>  #define ID_ISAR2_EL1            ID_ISAR2
>  #define ID_ISAR3_EL1            ID_ISAR3
>  #define ID_ISAR4_EL1            ID_ISAR4
>  #define ID_ISAR5_EL1            ID_ISAR5
> +#define ID_ISAR6_EL1            ID_ISAR6
>  #define ID_MMFR0_EL1            ID_MMFR0
>  #define ID_MMFR1_EL1            ID_MMFR1
>  #define ID_MMFR2_EL1            ID_MMFR2
>  #define ID_MMFR3_EL1            ID_MMFR3
> +#define ID_MMFR4_EL1            ID_MMFR4
> +#define ID_MMFR5_EL1            ID_MMFR5
>  #define ID_PFR0_EL1             ID_PFR0
>  #define ID_PFR1_EL1             ID_PFR1
> +#define ID_PFR2_EL1             ID_PFR2
>  #define IFSR32_EL2              IFSR
>  #define MDCR_EL2                HDCR
>  #define MIDR_EL1                MIDR
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index c7b5052992..64354c3f19 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -148,6 +148,7 @@ struct cpuinfo_arm {
>      union {
>          uint64_t bits[2];
>          struct {
> +            /* PFR0 */
>              unsigned long el0:4;
>              unsigned long el1:4;
>              unsigned long el2:4;
> @@ -155,9 +156,23 @@ struct cpuinfo_arm {
>              unsigned long fp:4;   /* Floating Point */
>              unsigned long simd:4; /* Advanced SIMD */
>              unsigned long gic:4;  /* GIC support */
> -            unsigned long __res0:28;
> +            unsigned long ras:4;
> +            unsigned long sve:4;
> +            unsigned long sel2:4;
> +            unsigned long mpam:4;
> +            unsigned long amu:4;
> +            unsigned long dit:4;
> +            unsigned long __res0:4;
>              unsigned long csv2:4;
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
>          };
>      } pfr64;
>  
> @@ -170,7 +185,7 @@ struct cpuinfo_arm {
>      } aux64;
>  
>      union {
> -        uint64_t bits[2];
> +        uint64_t bits[3];
>          struct {
>              unsigned long pa_range:4;
>              unsigned long asid_bits:4;
> @@ -190,6 +205,8 @@ struct cpuinfo_arm {
>              unsigned long pan:4;
>              unsigned long __res1:8;
>              unsigned long __res2:32;
> +
> +            unsigned long __res3:64;
>          };
>      } mm64;
>  
> @@ -197,6 +214,10 @@ struct cpuinfo_arm {
>          uint64_t bits[2];
>      } isa64;
>  
> +    struct {
> +        uint64_t bits[1];
> +    } zfr64;
> +
>  #endif
>  
>      /*
> @@ -204,25 +225,38 @@ struct cpuinfo_arm {
>       * when running in 32-bit mode.
>       */
>      union {
> -        uint32_t bits[2];
> +        uint32_t bits[3];
>          struct {
> +            /* PFR0 */
>              unsigned long arm:4;
>              unsigned long thumb:4;
>              unsigned long jazelle:4;
>              unsigned long thumbee:4;
> -            unsigned long __res0:16;
> +            unsigned long csv2:4;
> +            unsigned long amu:4;
> +            unsigned long dit:4;
> +            unsigned long ras:4;
>  
> +            /* PFR1 */
>              unsigned long progmodel:4;
>              unsigned long security:4;
>              unsigned long mprofile:4;
>              unsigned long virt:4;
>              unsigned long gentimer:4;
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
>          };
>      } pfr32;
>  
>      struct {
> -        uint32_t bits[1];
> +        uint32_t bits[2];
>      } dbg32;
>  
>      struct {
> @@ -230,12 +264,23 @@ struct cpuinfo_arm {
>      } aux32;
>  
>      struct {
> -        uint32_t bits[4];
> +        uint32_t bits[6];
>      } mm32;
>  
>      struct {
> -        uint32_t bits[6];
> +        uint32_t bits[7];
>      } isa32;
> +
> +#ifdef CONFIG_ARM_64
> +    struct {
> +        uint64_t bits[3];
> +    } mvfr;
> +#else
> +    /* Only MVFR0 and MVFR1 exist on armv7 */
> +    struct {
> +        uint32_t bits[2];
> +    } mvfr;
> +#endif
>  };
>  
>  extern struct cpuinfo_arm boot_cpu_data;
> -- 
> 2.17.1
> 

