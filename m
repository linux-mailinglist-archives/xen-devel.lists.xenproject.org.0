Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C04007F8
	for <lists+xen-devel@lfdr.de>; Sat,  4 Sep 2021 00:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178519.324584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHyr-0002tk-4u; Fri, 03 Sep 2021 22:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178519.324584; Fri, 03 Sep 2021 22:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMHyr-0002r6-1E; Fri, 03 Sep 2021 22:48:17 +0000
Received: by outflank-mailman (input) for mailman id 178519;
 Fri, 03 Sep 2021 22:48:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mMHyp-0002qd-Dr
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 22:48:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce82eaaf-8eab-471f-a37c-8c963c90fb6d;
 Fri, 03 Sep 2021 22:48:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E3A461056;
 Fri,  3 Sep 2021 22:48:13 +0000 (UTC)
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
X-Inumbo-ID: ce82eaaf-8eab-471f-a37c-8c963c90fb6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630709293;
	bh=D3TKVtXRF0k7je6UxI5S91fhLgoCCJ2RQ6UxqDcfnA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SkypW8AB/LVsQX17U1lF7SVw119y3enF4tgUOj0R9Ry6KSegHjQD8hwpTTFwdOaUU
	 un4idD6fP73zahznH66T7Ttc4KYexYORWAREKHoUinVaBaTD4N6s9pzlHv0o+q6naS
	 DT7wsA/SfsTq6uAShajW2T/029Oad7O+x53oVLdUBPJvKFtlbxel2L8K96MZRNzrbl
	 ei1etvyU4SHPo06FUYuSPu5RUTzFqgXmoLRsuFEhIJhTuPvJix6yJRIrcynrCZEWXP
	 Wx4yteW+qD7zfaNDvymFB2LbgpiAb784I8xB7Jy3St2jYZDjgJ1xBiE6XI/0CqiNHU
	 0JF7uH5/SSwHw==
Date: Fri, 3 Sep 2021 15:48:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/arm: Rename cpu_boot_data to system_cpuinfo
In-Reply-To: <588f4cdd02ce3f907c4b97b1513d90f153d127c0.1629897306.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2109031419130.26072@sstabellini-ThinkPad-T480s>
References: <cover.1629897306.git.bertrand.marquis@arm.com> <588f4cdd02ce3f907c4b97b1513d90f153d127c0.1629897306.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Aug 2021, Bertrand Marquis wrote:
> As we will sanitize the content of boot_cpu_data it will not really
> contain the boot cpu information but the system sanitize information.
> Rename the structure to system_cpuinfo so the user is informed that this
> is the system wide available feature and not anymore the features of the
> boot cpu.
> The original boot cpu data is still available in cpu_data.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3: none
> Changes in v2:
>   - patch introduced in v2
> ---
>  xen/arch/arm/cpufeature.c        |  8 ++------
>  xen/arch/arm/setup.c             | 34 ++++++++++++++++++--------------
>  xen/arch/arm/smpboot.c           |  6 +++---
>  xen/include/asm-arm/cpufeature.h |  6 +++---
>  4 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 1d88783809..f600a611bd 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -169,12 +169,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>   */
>  static int __init create_guest_cpuinfo(void)
>  {
> -    /*
> -     * TODO: The code is currently using only the features detected on the boot
> -     * core. In the long term we should try to compute values containing only
> -     * features supported by all cores.
> -     */
> -    guest_cpuinfo = boot_cpu_data;
> +    /* Use the sanitized cpuinfo as initial guest cpuinfo */
> +    guest_cpuinfo = system_cpuinfo;
>  
>  #ifdef CONFIG_ARM_64
>      /* Hide MPAM support as xen does not support it */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 63a908e325..3798c5ade0 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -56,7 +56,11 @@
>  
>  struct bootinfo __initdata bootinfo;
>  
> -struct cpuinfo_arm __read_mostly boot_cpu_data;
> +/*
> + * Sanitized version of cpuinfo containing only features available on all
> + * cores (only on arm64 as there is no sanitization support on arm32).
> + */
> +struct cpuinfo_arm __read_mostly system_cpuinfo;
>  
>  #ifdef CONFIG_ACPI
>  bool __read_mostly acpi_disabled;
> @@ -100,7 +104,7 @@ static const char * __initdata processor_implementers[] = {
>  static void __init processor_id(void)
>  {
>      const char *implementer = "Unknown";
> -    struct cpuinfo_arm *c = &boot_cpu_data;
> +    struct cpuinfo_arm *c = &system_cpuinfo;
>  
>      identify_cpu(c);
>      current_cpu_data = *c;
> @@ -120,7 +124,7 @@ static void __init processor_id(void)
>  #if defined(CONFIG_ARM_64)
>      printk("64-bit Execution:\n");
>      printk("  Processor Features: %016"PRIx64" %016"PRIx64"\n",
> -           boot_cpu_data.pfr64.bits[0], boot_cpu_data.pfr64.bits[1]);
> +           system_cpuinfo.pfr64.bits[0], system_cpuinfo.pfr64.bits[1]);
>      printk("    Exception Levels: EL3:%s EL2:%s EL1:%s EL0:%s\n",
>             cpu_has_el3_32 ? "64+32" : cpu_has_el3_64 ? "64" : "No",
>             cpu_has_el2_32 ? "64+32" : cpu_has_el2_64 ? "64" : "No",
> @@ -144,13 +148,13 @@ static void __init processor_id(void)
>                 boot_cpu_feature64(simd));
>  
>      printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
> -           boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
> +           system_cpuinfo.dbg64.bits[0], system_cpuinfo.dbg64.bits[1]);
>      printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
> -           boot_cpu_data.aux64.bits[0], boot_cpu_data.aux64.bits[1]);
> +           system_cpuinfo.aux64.bits[0], system_cpuinfo.aux64.bits[1]);
>      printk("  Memory Model Features: %016"PRIx64" %016"PRIx64"\n",
> -           boot_cpu_data.mm64.bits[0], boot_cpu_data.mm64.bits[1]);
> +           system_cpuinfo.mm64.bits[0], system_cpuinfo.mm64.bits[1]);
>      printk("  ISA Features:  %016"PRIx64" %016"PRIx64"\n",
> -           boot_cpu_data.isa64.bits[0], boot_cpu_data.isa64.bits[1]);
> +           system_cpuinfo.isa64.bits[0], system_cpuinfo.isa64.bits[1]);
>  #endif
>  
>      /*
> @@ -161,7 +165,7 @@ static void __init processor_id(void)
>      {
>          printk("32-bit Execution:\n");
>          printk("  Processor Features: %"PRIregister":%"PRIregister"\n",
> -               boot_cpu_data.pfr32.bits[0], boot_cpu_data.pfr32.bits[1]);
> +               system_cpuinfo.pfr32.bits[0], system_cpuinfo.pfr32.bits[1]);
>          printk("    Instruction Sets:%s%s%s%s%s%s\n",
>                 cpu_has_aarch32 ? " AArch32" : "",
>                 cpu_has_arm ? " A32" : "",
> @@ -174,18 +178,18 @@ static void __init processor_id(void)
>                 cpu_has_security ? " Security" : "");
>  
>          printk("  Debug Features: %"PRIregister"\n",
> -               boot_cpu_data.dbg32.bits[0]);
> +               system_cpuinfo.dbg32.bits[0]);
>          printk("  Auxiliary Features: %"PRIregister"\n",
> -               boot_cpu_data.aux32.bits[0]);
> +               system_cpuinfo.aux32.bits[0]);
>          printk("  Memory Model Features: %"PRIregister" %"PRIregister"\n"
>                 "                         %"PRIregister" %"PRIregister"\n",
> -               boot_cpu_data.mm32.bits[0], boot_cpu_data.mm32.bits[1],
> -               boot_cpu_data.mm32.bits[2], boot_cpu_data.mm32.bits[3]);
> +               system_cpuinfo.mm32.bits[0], system_cpuinfo.mm32.bits[1],
> +               system_cpuinfo.mm32.bits[2], system_cpuinfo.mm32.bits[3]);
>          printk("  ISA Features: %"PRIregister" %"PRIregister" %"PRIregister"\n"
>                 "                %"PRIregister" %"PRIregister" %"PRIregister"\n",
> -               boot_cpu_data.isa32.bits[0], boot_cpu_data.isa32.bits[1],
> -               boot_cpu_data.isa32.bits[2], boot_cpu_data.isa32.bits[3],
> -               boot_cpu_data.isa32.bits[4], boot_cpu_data.isa32.bits[5]);
> +               system_cpuinfo.isa32.bits[0], system_cpuinfo.isa32.bits[1],
> +               system_cpuinfo.isa32.bits[2], system_cpuinfo.isa32.bits[3],
> +               system_cpuinfo.isa32.bits[4], system_cpuinfo.isa32.bits[5]);
>      }
>      else
>      {
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index a1ee3146ef..c9f2827d56 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -124,7 +124,7 @@ static void __init dt_smp_init_cpus(void)
>      bool bootcpu_valid = false;
>      int rc;
>  
> -    mpidr = boot_cpu_data.mpidr.bits & MPIDR_HWID_MASK;
> +    mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
>  
>      if ( !cpus )
>      {
> @@ -319,13 +319,13 @@ void start_secondary(void)
>       * now.
>       */
>      if ( !opt_hmp_unsafe &&
> -         current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
> +         current_cpu_data.midr.bits != system_cpuinfo.midr.bits )
>      {
>          printk(XENLOG_ERR
>                 "CPU%u MIDR (0x%"PRIregister") does not match boot CPU MIDR (0x%"PRIregister"),\n"
>                 XENLOG_ERR "disable cpu (see big.LITTLE.txt under docs/).\n",
>                 smp_processor_id(), current_cpu_data.midr.bits,
> -               boot_cpu_data.midr.bits);
> +               system_cpuinfo.midr.bits);
>          stop_cpu();
>      }
>  
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
> index ba48db3eac..8f2b8e7830 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -3,7 +3,7 @@
>  
>  #ifdef CONFIG_ARM_64
>  #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
> -#define boot_cpu_feature64(feat)       (boot_cpu_data.pfr64.feat)
> +#define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
>  
>  #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
>  
> @@ -21,7 +21,7 @@
>  #endif
>  
>  #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
> -#define boot_cpu_feature32(feat)       (boot_cpu_data.pfr32.feat)
> +#define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
>  
>  #define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
>  #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
> @@ -326,7 +326,7 @@ struct cpuinfo_arm {
>      } mvfr;
>  };
>  
> -extern struct cpuinfo_arm boot_cpu_data;
> +extern struct cpuinfo_arm system_cpuinfo;
>  
>  extern void identify_cpu(struct cpuinfo_arm *);
>  
> -- 
> 2.17.1
> 

