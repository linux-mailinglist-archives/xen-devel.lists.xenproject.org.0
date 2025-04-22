Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E1A97011
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962883.1354042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHD-0008S0-D4; Tue, 22 Apr 2025 15:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962883.1354042; Tue, 22 Apr 2025 15:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FHD-0008NZ-8v; Tue, 22 Apr 2025 15:11:11 +0000
Received: by outflank-mailman (input) for mailman id 962883;
 Tue, 22 Apr 2025 15:11:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NnGu=XI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7FEc-0008SP-L7
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:08:30 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a597ed4f-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:08:28 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so6707541f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 08:08:28 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4b68sm15530650f8f.87.2025.04.22.08.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 08:08:27 -0700 (PDT)
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
X-Inumbo-ID: a597ed4f-1f8b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745334508; x=1745939308; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1h7HOtRok7EODaipP4CuzZ0e5STJDWpbufVebAiWTHU=;
        b=DigpKn7WL/lxFFKeeb3bUc11Kkf5TorfgMkBBnDSrpBAkh7dMiBQ/MoMyCrkQUIDrr
         wiBtT/1mQtoakOm18GA3wiGD0veWho6px5QSVxcdYmR8ePVbm4YiX5VxSfFIL5obom10
         9Qa0UIDfdVzp5AFeHeFsua1gFDnzRDWHhB83gdG6DknQ09S359dgZqr6Nx3YGERFV4oF
         qImwzlFJwsYmoE7Zmj/jXdN8dzllmsI07glmn8fC1D9eIcS6oEezhFi+4GQMJ/cNa0uN
         ZyCyYRAVsyvEzSg05EMHl1oBpAOyZtp4fpmLwbnTrA+WISbPC5T1i5iFmoDFneeno6KA
         67lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745334508; x=1745939308;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1h7HOtRok7EODaipP4CuzZ0e5STJDWpbufVebAiWTHU=;
        b=I0X/G8o+KKApDkJ/h4pEB+mu9+/S3hgbBXymqq+dQg2BmgksUC+d9V6i04vEpGkPZM
         xU1T1U7ElVYX1Fu8sJxKM7DNm5qKZcjELqjfBO5AOljg8bmJdUVHIwz+NcVG471CfnyG
         gv773gJfj2aIlnYW+IyeYgy1UY34Hb80P6FszCuG/lTMM2J5mtWA+MYvEFZSUbd/I/P0
         naCudZpJm9wOAOjlyvAr7DcCx094xpLj5sHY5ieVUaTpkr4ugvYy1VsfPY/a7IJM8/yW
         aISR5q81mKcM8FflIwp4oe0KEHArLZAmDSRpZV4ivjAe2uESVB/Ym2g/DbB1fI6Qo1IC
         Yqhg==
X-Forwarded-Encrypted: i=1; AJvYcCX0iFE8as+8mX5A2g+wjr5MqXi2UxVUZxFCeCRbr7flCe0+IezKtE/OjBRmuNceM+Xlr0YVwblqiCM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaLZ2QAQMkngIIAPOpu/cb9rh2w9m5LIQLBFrj12l14DpC3gWp
	qZ+0lo8adaPW+c+PrBZbtPGBDxORNFINZA0VhqZFBmHvHhCPeXno
X-Gm-Gg: ASbGncskr/GnIQtxp8lfeoHTJd1hL9yrhPEshO5MlyQYSKn+p9gUs1P1f02iTJBow/x
	OBo0zgQuYCW6qpyh3pAAgafEPOYUlxAiMvIrPhxHeNuG6dA+9YYmZiX0+GD8uOIMQsqdTIDil1Q
	NqIqA5SnfoS8RDoIs7dSAwk6qNvhnfP0OzyIrnerbYn4ZyTNGSIT52dA3JXlveCWH+GplYRz2dN
	fochXZijsIQTmtd6zgb5rVsVhbUn41cvS+6nOZVwxs704mPPJsgLbPi7dKQH71qUdGwxl9vbyhG
	cGNLP/0VmF/FzDV49vzYfIyEDRnWTQe6xoORZKupltFFzRpvTLZta+5gy8u0JNMXx7fqmZ35dM5
	+oT9UKtVeSfNUTGYm
X-Google-Smtp-Source: AGHT+IGg1eXWBcl4whkua/8T0xKJXs4s6hbRVuK9Wvt/nYY04+bTvbnaT6zssG3NnGWQzuRl1bCZ+w==
X-Received: by 2002:a05:6000:2483:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-39efbaf2647mr12479649f8f.47.1745334507584;
        Tue, 22 Apr 2025 08:08:27 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FjK0MV04SamkBxU0ZExrOsUE"
Message-ID: <e6cc1553-fd92-4870-82a9-6db5bca42299@gmail.com>
Date: Tue, 22 Apr 2025 17:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <c31977cb20be408ac695ec44edaa6e058e6ec10f.1744626032.git.oleksii.kurochko@gmail.com>
 <6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com>

This is a multi-part message in MIME format.
--------------FjK0MV04SamkBxU0ZExrOsUE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 10:08 AM, Orzel, Michal wrote:
> I'm ok with making dom0less common in principle but I don't know if we should
> keep using the word dom0less which we all know is confusing. In one of the
> maintainers call we agreed on using "predefined domUs" to denote the concept of
> starting domUs at boot in a static way. This was so that we could have a common
> name for parts that are common between dom0less and hyperlaunch, while leaving
> dom0less/hyperlaunch to denote arch specific bits. We need more opinions here.
>
> On 14/04/2025 17:56, Oleksii Kurochko wrote:
>> Move some parts of Arm's Dom0Less code to be reused by other architectures.
>> At the moment, RISC-V is going to reuse these parts.
>>
>> Move dom0less-build.h from the Arm-specific directory to asm-generic
>> as these header is expected to be the same across acrhictectures with
>> some updates: add the following declaration of construct_domU(),
>> arch_xen_domctl_createdomain() and arch_create_domus() as there are
>> some parts which are still architecture-specific.
> Why do we need arch_xen_domctl_createdomain() and arch_create_domus()?
> FWICS the latter already takes d_cfg as parameter. I think we could get away
> with just a single arch specific function called during domU creation to e.g.
> cover arch specific DT bindings.

Agree, arch_xen_domctl_createdomain() could be dropped and we can live only with
arch_create_domus(). I'll drop it.

>
> Also, if there are already functions with _domU, use it instead of _domu (i.e.
> lowercase) for consistency.

Sure, I'll align the names.

>
>> Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
>> code for an architecture.
>>
>> Relocate the CONFIG_DOM0LESS configuration to the common with adding
>> "depends on HAS_DOM0LESS" to not break builds for architectures which
>> don't support CONFIG_DOM0LESS config, especically it would be useful
>> to not provide stubs for  construct_domU(), arch_xen_domctl_createdomain()
>> and arch_create_domus() in case of *-randconfig which may set
>> CONFIG_DOM0LESS=y.
>>
>> Move is_dom0less_mode() function to the common code, as it depends on
>> boot modules that are already part of the common code.
>>
>> Move create_domUs() function to the common code with some updates:
>> - Add function arch_xen_domctl_createdomain() as structure
>>    xen_domctl_createdomain may have some arch-spicific information and
>>    initialization.
>> - Add arch_create_domus() to cover parsing of arch-specific features,
>>    for example, SVE (Scalar Vector Extension ) exists only in Arm.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - Convert 'depends on Arm' to 'depends on HAS_DOM0LESS' for
>>     CONFIG_DOM0LESS_BOOT.
>>   - Change 'default Arm' to 'default y' for CONFIG_DOM0LESS_BOOT as there is
>>     dependency on HAS_DOM0LESS.
>>   - Introduce HAS_DOM0LESS and enable it for Arm.
>>   - Update the commit message.
>> ---
>>   xen/arch/arm/Kconfig                      |   9 +-
>>   xen/arch/arm/dom0less-build.c             | 270 ++++++----------------
>>   xen/arch/arm/include/asm/Makefile         |   1 +
>>   xen/arch/arm/include/asm/dom0less-build.h |  32 ---
>>   xen/common/Kconfig                        |  12 +
>>   xen/common/device-tree/Makefile           |   1 +
>>   xen/common/device-tree/dom0less-build.c   | 161 +++++++++++++
>>   xen/include/asm-generic/dom0less-build.h  |  40 ++++
>>   8 files changed, 287 insertions(+), 239 deletions(-)
>>   delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>   create mode 100644 xen/common/device-tree/dom0less-build.c
>>   create mode 100644 xen/include/asm-generic/dom0less-build.h
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 565f288331..060389c3c8 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -15,6 +15,7 @@ config ARM
>>   	select GENERIC_UART_INIT
>>   	select HAS_ALTERNATIVE if HAS_VMAP
>>   	select HAS_DEVICE_TREE
>> +	select HAS_DOM0LESS
>>   	select HAS_UBSAN
>>   
>>   config ARCH_DEFCONFIG
>> @@ -119,14 +120,6 @@ config GICV2
>>   	  Driver for the ARM Generic Interrupt Controller v2.
>>   	  If unsure, say Y
>>   
>> -config DOM0LESS_BOOT
>> -	bool "Dom0less boot support" if EXPERT
>> -	default y
>> -	help
>> -	  Dom0less boot support enables Xen to create and start domU guests during
>> -	  Xen boot without the need of a control domain (Dom0), which could be
>> -	  present anyway.
>> -
>>   config GICV3
>>   	bool "GICv3 driver"
>>   	depends on !NEW_VGIC
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index bd15563750..7ec3f85795 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -20,38 +20,6 @@
>>   #include <asm/static-memory.h>
>>   #include <asm/static-shmem.h>
>>   
>> -bool __init is_dom0less_mode(void)
>> -{
>> -    struct bootmodules *mods = &bootinfo.modules;
>> -    struct bootmodule *mod;
>> -    unsigned int i;
>> -    bool dom0found = false;
>> -    bool domUfound = false;
>> -
>> -    /* Look into the bootmodules */
>> -    for ( i = 0 ; i < mods->nr_mods ; i++ )
>> -    {
>> -        mod = &mods->module[i];
>> -        /* Find if dom0 and domU kernels are present */
>> -        if ( mod->kind == BOOTMOD_KERNEL )
>> -        {
>> -            if ( mod->domU == false )
>> -            {
>> -                dom0found = true;
>> -                break;
>> -            }
>> -            else
>> -                domUfound = true;
>> -        }
>> -    }
>> -
>> -    /*
>> -     * If there is no dom0 kernel but at least one domU, then we are in
>> -     * dom0less mode
>> -     */
>> -    return ( !dom0found && domUfound );
>> -}
>> -
>>   #ifdef CONFIG_VGICV2
>>   static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>>   {
>> @@ -869,8 +837,8 @@ static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>>   }
>>   #endif /* CONFIG_ARCH_PAGING_MEMPOOL */
>>   
>> -static int __init construct_domU(struct domain *d,
>> -                                 const struct dt_device_node *node)
>> +int __init construct_domU(struct domain *d,
>> +                          const struct dt_device_node *node)
>>   {
>>       struct kernel_info kinfo = KERNEL_INFO_INIT;
>>       const char *dom0less_enhanced;
>> @@ -965,188 +933,92 @@ static int __init construct_domU(struct domain *d,
>>       return alloc_xenstore_params(&kinfo);
>>   }
>>   
>> -void __init create_domUs(void)
>> -{
>> -    struct dt_device_node *node;
>> -    const char *dom0less_iommu;
>> -    bool iommu = false;
>> -    const struct dt_device_node *cpupool_node,
>> -                                *chosen = dt_find_node_by_path("/chosen");
>> -    const char *llc_colors_str = NULL;
>> -
>> -    BUG_ON(chosen == NULL);
>> -    dt_for_each_child_node(chosen, node)
>> -    {
>> -        struct domain *d;
>> -        struct xen_domctl_createdomain d_cfg = {
>> -            .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>> -            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> -            /*
>> -             * The default of 1023 should be sufficient for guests because
>> -             * on ARM we don't bind physical interrupts to event channels.
>> -             * The only use of the evtchn port is inter-domain communications.
>> -             * 1023 is also the default value used in libxl.
>> -             */
>> -            .max_evtchn_port = 1023,
>> -            .max_grant_frames = -1,
>> -            .max_maptrack_frames = -1,
>> -            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>> -        };
>> -        unsigned int flags = 0U;
>> -        uint32_t val;
>> -        int rc;
>> -
>> -        if ( !dt_device_is_compatible(node, "xen,domain") )
>> -            continue;
>> -
>> -        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>> -            panic("No more domain IDs available\n");
>> -
>> -        if ( dt_find_property(node, "xen,static-mem", NULL) )
>> -        {
>> -            if ( llc_coloring_enabled )
>> -                panic("LLC coloring and static memory are incompatible\n");
>> -
>> -            flags |= CDF_staticmem;
>> -        }
>> -
>> -        if ( dt_property_read_bool(node, "direct-map") )
>> -        {
>> -            if ( !(flags & CDF_staticmem) )
>> -                panic("direct-map is not valid for domain %s without static allocation.\n",
>> -                      dt_node_name(node));
>> -
>> -            flags |= CDF_directmap;
>> -        }
>>   
>> -        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
>> -            panic("Missing property 'cpus' for domain %s\n",
>> -                  dt_node_name(node));
>> -
>> -        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
>> -             !strcmp(dom0less_iommu, "enabled") )
>> -            iommu = true;
>> +struct xen_domctl_createdomain __init arch_xen_domctl_createdomain(void)
> Out of curiosity. Why by value?

Just bad design. I planned to update that in the next patch version before you noticed that
it could be droppped, at all.

But it should be safe as I expected that RVO will be used based on dissassembler:
002ccf88 <arch_xen_domctl_createdomain>:
   2ccf88:       e16d41f0        strd    r4, [sp, #-16]!
   2ccf8c:       e58db008        str     fp, [sp, #8]
   2ccf90:       e58de00c        str     lr, [sp, #12]
   2ccf94:       e28db00c        add     fp, sp, #12
   2ccf98:       e1a04000        mov     r4, r0
   2ccf9c:       e3a02048        mov     r2, #72 @ 0x48
   2ccfa0:       e3a01000        mov     r1, #0
   2ccfa4:       ebfe6da5        bl      268640 <memset>
   2ccfa8:       e30b32b4        movw    r3, #45748      @ 0xb2b4
   2ccfac:       e340302a        movt    r3, #42 @ 0x2a
   2ccfb0:       e5933000        ldr     r3, [r3]
   2ccfb4:       e203300f        and     r3, r3, #15
   2ccfb8:       e3a02003        mov     r2, #3
   2ccfbc:       e5842014        str     r2, [r4, #20]
   2ccfc0:       e30023ff        movw    r2, #1023       @ 0x3ff
   2ccfc4:       e5842020        str     r2, [r4, #32]
   2ccfc8:       e3e02000        mvn     r2, #0
   2ccfcc:       e5842024        str     r2, [r4, #36]   @ 0x24
   2ccfd0:       e5842028        str     r2, [r4, #40]   @ 0x28
   2ccfd4:       e584302c        str     r3, [r4, #44]   @ 0x2c
   2ccfd8:       e1a00004        mov     r0, r4
   2ccfdc:       e24bd00c        sub     sp, fp, #12
   2ccfe0:       e1cd40d0        ldrd    r4, [sp]
   2ccfe4:       e59db008        ldr     fp, [sp, #8]
   2ccfe8:       e28dd00c        add     sp, sp, #12
   2ccfec:       e49df004        pop     {pc}            @ (ldr pc, [sp], #4
So, basically, it is transformed to void arch_xen_domctl_createdomain(struct xen_domctl_createdomain *ret) by compiler.
If I'm not mistaken something. It was pretty long time ago when I used Arm assembly.

>
>> +{
>> +    struct xen_domctl_createdomain d_cfg = {
>> +        .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> +        /*
>> +            * The default of 1023 should be sufficient for guests because
>> +            * on ARM we don't bind physical interrupts to event channels.
>> +            * The only use of the evtchn port is inter-domain communications.
>> +            * 1023 is also the default value used in libxl.
>> +            */
>> +        .max_evtchn_port = 1023,
>> +        .max_grant_frames = -1,
>> +        .max_maptrack_frames = -1,
>> +        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>> +    };
>> +
>> +    return d_cfg;
>> +}
>>   
>> -        if ( iommu_enabled &&
>> -             (iommu || dt_find_compatible_node(node, NULL,
>> -                                               "multiboot,device-tree")) )
>> -            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>> +void __init arch_create_domus(struct dt_device_node *node,
>> +                       struct xen_domctl_createdomain *d_cfg,
>> +                       unsigned int flags)
>> +{
>> +    uint32_t val;
>>   
>> -        if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>> -        {
>> -            int vpl011_virq = GUEST_VPL011_SPI;
>> -
>> -            d_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
>> -
>> -            /*
>> -             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
>> -             * set, in which case it'll match the hardware.
>> -             *
>> -             * Since the domain is not yet created, we can't use
>> -             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
>> -             * be hardcoded.
>> -             * The logic here shall be consistent with the one in
>> -             * domain_vpl011_init().
>> -             */
>> -            if ( flags & CDF_directmap )
>> -            {
>> -                vpl011_virq = serial_irq(SERHND_DTUART);
>> -                if ( vpl011_virq < 0 )
>> -                    panic("Error getting IRQ number for this serial port %d\n",
>> -                          SERHND_DTUART);
>> -            }
>> +    if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>> +    {
>> +        int vpl011_virq = GUEST_VPL011_SPI;
>>   
>> -            /*
>> -             * vpl011 uses one emulated SPI. If vpl011 is requested, make
>> -             * sure that we allocate enough SPIs for it.
>> -             */
>> -            if ( dt_property_read_bool(node, "vpl011") )
>> -                d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
>> -                                         vpl011_virq - 32 + 1);
>> -        }
>> +        d_cfg->arch.nr_spis = VGIC_DEF_NR_SPIS;
>>   
>> -        /* Get the optional property domain-cpupool */
>> -        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
>> -        if ( cpupool_node )
>> +        /*
>> +         * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
>> +         * set, in which case it'll match the hardware.
>> +         *
>> +         * Since the domain is not yet created, we can't use
>> +         * d->arch.vpl011.irq. So the logic to find the vIRQ has to
>> +         * be hardcoded.
>> +         * The logic here shall be consistent with the one in
>> +         * domain_vpl011_init().
>> +         */
>> +        if ( flags & CDF_directmap )
>>           {
>> -            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
>> -            if ( pool_id < 0 )
>> -                panic("Error getting cpupool id from domain-cpupool (%d)\n",
>> -                      pool_id);
>> -            d_cfg.cpupool_id = pool_id;
>> +            vpl011_virq = serial_irq(SERHND_DTUART);
>> +            if ( vpl011_virq < 0 )
>> +                panic("Error getting IRQ number for this serial port %d\n",
>> +                        SERHND_DTUART);
>>           }
>>   
>> -        if ( dt_property_read_u32(node, "max_grant_version", &val) )
>> -            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
>> +        /*
>> +         * vpl011 uses one emulated SPI. If vpl011 is requested, make
>> +         * sure that we allocate enough SPIs for it.
>> +         */
>> +        if ( dt_property_read_bool(node, "vpl011") )
>> +            d_cfg->arch.nr_spis = MAX(d_cfg->arch.nr_spis,
>> +                                      vpl011_virq - 32 + 1);
>> +    }
>>   
>> -        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
>> -        {
>> -            if ( val > INT32_MAX )
>> -                panic("max_grant_frames (%"PRIu32") overflow\n", val);
>> -            d_cfg.max_grant_frames = val;
>> -        }
>> +    if ( dt_get_property(node, "sve", &val) )
>> +    {
>> +#ifdef CONFIG_ARM64_SVE
>> +        unsigned int sve_vl_bits;
>> +        bool ret = false;
>>   
>> -        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
>> +        if ( !val )
>>           {
>> -            if ( val > INT32_MAX )
>> -                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
>> -            d_cfg.max_maptrack_frames = val;
>> +            /* Property found with no value, means max HW VL supported */
>> +            ret = sve_domctl_vl_param(-1, &sve_vl_bits);
>>           }
>> -
>> -        if ( dt_get_property(node, "sve", &val) )
>> +        else
>>           {
>> -#ifdef CONFIG_ARM64_SVE
>> -            unsigned int sve_vl_bits;
>> -            bool ret = false;
>> -
>> -            if ( !val )
>> -            {
>> -                /* Property found with no value, means max HW VL supported */
>> -                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
>> -            }
>> +            if ( dt_property_read_u32(node, "sve", &val) )
>> +                ret = sve_domctl_vl_param(val, &sve_vl_bits);
>>               else
>> -            {
>> -                if ( dt_property_read_u32(node, "sve", &val) )
>> -                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
>> -                else
>> -                    panic("Error reading 'sve' property\n");
>> -            }
>> +                panic("Error reading 'sve' property\n");
>> +        }
>>   
>> -            if ( ret )
>> -                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
>> -            else
>> -                panic("SVE vector length error\n");
>> +        if ( ret )
>> +            d_cfg->arch.sve_vl = sve_encode_vl(sve_vl_bits);
>> +        else
>> +            panic("SVE vector length error\n");
>>   #else
>> -            panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
>> +        panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
>>   #endif
>> -        }
>> -
>> -        dt_property_read_string(node, "llc-colors", &llc_colors_str);
>> -        if ( !llc_coloring_enabled && llc_colors_str )
>> -            panic("'llc-colors' found, but LLC coloring is disabled\n");
>> -
>> -        /*
>> -         * The variable max_init_domid is initialized with zero, so here it's
>> -         * very important to use the pre-increment operator to call
>> -         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
>> -         */
>> -        d = domain_create(++max_init_domid, &d_cfg, flags);
>> -        if ( IS_ERR(d) )
>> -            panic("Error creating domain %s (rc = %ld)\n",
>> -                  dt_node_name(node), PTR_ERR(d));
>> -
>> -        if ( llc_coloring_enabled &&
>> -             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
>> -            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
>> -                  dt_node_name(node), rc);
>> -
>> -        d->is_console = true;
>> -        dt_device_set_used_by(node, d->domain_id);
>> -
>> -        rc = construct_domU(d, node);
>> -        if ( rc )
>> -            panic("Could not set up domain %s (rc = %d)\n",
>> -                  dt_node_name(node), rc);
>>       }
>>   }
>>   
>> diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
>> index 4a4036c951..831c914cce 100644
>> --- a/xen/arch/arm/include/asm/Makefile
>> +++ b/xen/arch/arm/include/asm/Makefile
>> @@ -1,6 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   generic-y += altp2m.h
>>   generic-y += device.h
>> +generic-y += dom0less-build.h
>>   generic-y += hardirq.h
>>   generic-y += iocap.h
>>   generic-y += paging.h
>> diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
>> deleted file mode 100644
>> index 5864944bda..0000000000
>> --- a/xen/arch/arm/include/asm/dom0less-build.h
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -
>> -#ifndef __ASM_DOM0LESS_BUILD_H_
>> -#define __ASM_DOM0LESS_BUILD_H_
>> -
>> -#include <xen/stdbool.h>
>> -
>> -#ifdef CONFIG_DOM0LESS_BOOT
>> -
>> -void create_domUs(void);
>> -bool is_dom0less_mode(void);
>> -
>> -#else /* !CONFIG_DOM0LESS_BOOT */
>> -
>> -static inline void create_domUs(void) {}
>> -static inline bool is_dom0less_mode(void)
>> -{
>> -    return false;
>> -}
>> -
>> -#endif /* CONFIG_DOM0LESS_BOOT */
>> -
>> -#endif /* __ASM_DOM0LESS_BUILD_H_ */
>> -
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 06ae9751aa..2fd79aea5b 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -12,6 +12,15 @@ config CORE_PARKING
>>   	bool
>>   	depends on NR_CPUS > 1
>>   
>> +config DOM0LESS_BOOT
>> +	bool "Dom0less boot support" if EXPERT
>> +	depends on HAS_DOM0LESS
> You put dom0less code under device-tree, yet I don't see any of these Kconfig
> options being dependent on HAS_DEVICE_TREE. I think this is wrong.

Agree, HAS_DEVICE_TREE should be as a dependency here.

>> +#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
>> +#define __ASM_GENERIC_DOM0LESS_BUILD_H__
>> +
>> +#include <xen/stdbool.h>
>> +
>> +#ifdef CONFIG_DOM0LESS_BOOT
>> +
>> +#include <public/domctl.h>
>> +
>> +void create_domUs(void);
>> +bool is_dom0less_mode(void);
>> +
>> +int construct_domU(struct domain *d, const struct dt_device_node *node);
> I don't see necessary headers included for these structs

I will use forward declarations for that.

Thanks for review.

~ Oleksii

--------------FjK0MV04SamkBxU0ZExrOsUE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/17/25 10:08 AM, Orzel, Michal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com">
      <pre wrap="" class="moz-quote-pre">I'm ok with making dom0less common in principle but I don't know if we should
keep using the word dom0less which we all know is confusing. In one of the
maintainers call we agreed on using "predefined domUs" to denote the concept of
starting domUs at boot in a static way. This was so that we could have a common
name for parts that are common between dom0less and hyperlaunch, while leaving
dom0less/hyperlaunch to denote arch specific bits. We need more opinions here.

On 14/04/2025 17:56, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Move some parts of Arm's Dom0Less code to be reused by other architectures.
At the moment, RISC-V is going to reuse these parts.

Move dom0less-build.h from the Arm-specific directory to asm-generic
as these header is expected to be the same across acrhictectures with
some updates: add the following declaration of construct_domU(),
arch_xen_domctl_createdomain() and arch_create_domus() as there are
some parts which are still architecture-specific.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why do we need arch_xen_domctl_createdomain() and arch_create_domus()?
FWICS the latter already takes d_cfg as parameter. I think we could get away
with just a single arch specific function called during domU creation to e.g.
cover arch specific DT bindings.</pre>
    </blockquote>
    <pre>Agree, arch_xen_domctl_createdomain() could be dropped and we can live only with
arch_create_domus(). I'll drop it.
</pre>
    <blockquote type="cite"
      cite="mid:6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com">
      <pre wrap="" class="moz-quote-pre">

Also, if there are already functions with _domU, use it instead of _domu (i.e.
lowercase) for consistency.</pre>
    </blockquote>
    <pre>Sure, I'll align the names.

</pre>
    <blockquote type="cite"
      cite="mid:6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
code for an architecture.

Relocate the CONFIG_DOM0LESS configuration to the common with adding
"depends on HAS_DOM0LESS" to not break builds for architectures which
don't support CONFIG_DOM0LESS config, especically it would be useful
to not provide stubs for  construct_domU(), arch_xen_domctl_createdomain()
and arch_create_domus() in case of *-randconfig which may set
CONFIG_DOM0LESS=y.

Move is_dom0less_mode() function to the common code, as it depends on
boot modules that are already part of the common code.

Move create_domUs() function to the common code with some updates:
- Add function arch_xen_domctl_createdomain() as structure
  xen_domctl_createdomain may have some arch-spicific information and
  initialization.
- Add arch_create_domus() to cover parsing of arch-specific features,
  for example, SVE (Scalar Vector Extension ) exists only in Arm.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v2:
 - Convert 'depends on Arm' to 'depends on HAS_DOM0LESS' for
   CONFIG_DOM0LESS_BOOT.
 - Change 'default Arm' to 'default y' for CONFIG_DOM0LESS_BOOT as there is
   dependency on HAS_DOM0LESS.
 - Introduce HAS_DOM0LESS and enable it for Arm.
 - Update the commit message.
---
 xen/arch/arm/Kconfig                      |   9 +-
 xen/arch/arm/dom0less-build.c             | 270 ++++++----------------
 xen/arch/arm/include/asm/Makefile         |   1 +
 xen/arch/arm/include/asm/dom0less-build.h |  32 ---
 xen/common/Kconfig                        |  12 +
 xen/common/device-tree/Makefile           |   1 +
 xen/common/device-tree/dom0less-build.c   | 161 +++++++++++++
 xen/include/asm-generic/dom0less-build.h  |  40 ++++
 8 files changed, 287 insertions(+), 239 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 565f288331..060389c3c8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_DOM0LESS
 	select HAS_UBSAN
 
 config ARCH_DEFCONFIG
@@ -119,14 +120,6 @@ config GICV2
 	  Driver for the ARM Generic Interrupt Controller v2.
 	  If unsure, say Y
 
-config DOM0LESS_BOOT
-	bool "Dom0less boot support" if EXPERT
-	default y
-	help
-	  Dom0less boot support enables Xen to create and start domU guests during
-	  Xen boot without the need of a control domain (Dom0), which could be
-	  present anyway.
-
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index bd15563750..7ec3f85795 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -20,38 +20,6 @@
 #include &lt;asm/static-memory.h&gt;
 #include &lt;asm/static-shmem.h&gt;
 
-bool __init is_dom0less_mode(void)
-{
-    struct bootmodules *mods = &amp;bootinfo.modules;
-    struct bootmodule *mod;
-    unsigned int i;
-    bool dom0found = false;
-    bool domUfound = false;
-
-    /* Look into the bootmodules */
-    for ( i = 0 ; i &lt; mods-&gt;nr_mods ; i++ )
-    {
-        mod = &amp;mods-&gt;module[i];
-        /* Find if dom0 and domU kernels are present */
-        if ( mod-&gt;kind == BOOTMOD_KERNEL )
-        {
-            if ( mod-&gt;domU == false )
-            {
-                dom0found = true;
-                break;
-            }
-            else
-                domUfound = true;
-        }
-    }
-
-    /*
-     * If there is no dom0 kernel but at least one domU, then we are in
-     * dom0less mode
-     */
-    return ( !dom0found &amp;&amp; domUfound );
-}
-
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
@@ -869,8 +837,8 @@ static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
 }
 #endif /* CONFIG_ARCH_PAGING_MEMPOOL */
 
-static int __init construct_domU(struct domain *d,
-                                 const struct dt_device_node *node)
+int __init construct_domU(struct domain *d,
+                          const struct dt_device_node *node)
 {
     struct kernel_info kinfo = KERNEL_INFO_INIT;
     const char *dom0less_enhanced;
@@ -965,188 +933,92 @@ static int __init construct_domU(struct domain *d,
     return alloc_xenstore_params(&amp;kinfo);
 }
 
-void __init create_domUs(void)
-{
-    struct dt_device_node *node;
-    const char *dom0less_iommu;
-    bool iommu = false;
-    const struct dt_device_node *cpupool_node,
-                                *chosen = dt_find_node_by_path("/chosen");
-    const char *llc_colors_str = NULL;
-
-    BUG_ON(chosen == NULL);
-    dt_for_each_child_node(chosen, node)
-    {
-        struct domain *d;
-        struct xen_domctl_createdomain d_cfg = {
-            .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
-            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-            /*
-             * The default of 1023 should be sufficient for guests because
-             * on ARM we don't bind physical interrupts to event channels.
-             * The only use of the evtchn port is inter-domain communications.
-             * 1023 is also the default value used in libxl.
-             */
-            .max_evtchn_port = 1023,
-            .max_grant_frames = -1,
-            .max_maptrack_frames = -1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-        };
-        unsigned int flags = 0U;
-        uint32_t val;
-        int rc;
-
-        if ( !dt_device_is_compatible(node, "xen,domain") )
-            continue;
-
-        if ( (max_init_domid + 1) &gt;= DOMID_FIRST_RESERVED )
-            panic("No more domain IDs available\n");
-
-        if ( dt_find_property(node, "xen,static-mem", NULL) )
-        {
-            if ( llc_coloring_enabled )
-                panic("LLC coloring and static memory are incompatible\n");
-
-            flags |= CDF_staticmem;
-        }
-
-        if ( dt_property_read_bool(node, "direct-map") )
-        {
-            if ( !(flags &amp; CDF_staticmem) )
-                panic("direct-map is not valid for domain %s without static allocation.\n",
-                      dt_node_name(node));
-
-            flags |= CDF_directmap;
-        }
 
-        if ( !dt_property_read_u32(node, "cpus", &amp;d_cfg.max_vcpus) )
-            panic("Missing property 'cpus' for domain %s\n",
-                  dt_node_name(node));
-
-        if ( !dt_property_read_string(node, "passthrough", &amp;dom0less_iommu) &amp;&amp;
-             !strcmp(dom0less_iommu, "enabled") )
-            iommu = true;
+struct xen_domctl_createdomain __init arch_xen_domctl_createdomain(void)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Out of curiosity. Why by value?</pre>
    </blockquote>
    <pre>Just bad design. I planned to update that in the next patch version before you noticed that
it could be droppped, at all.

But it should be safe as I expected that RVO will be used based on dissassembler:
002ccf88 &lt;arch_xen_domctl_createdomain&gt;:
  2ccf88:       e16d41f0        strd    r4, [sp, #-16]!
  2ccf8c:       e58db008        str     fp, [sp, #8]
  2ccf90:       e58de00c        str     lr, [sp, #12]
  2ccf94:       e28db00c        add     fp, sp, #12
  2ccf98:       e1a04000        mov     r4, r0
  2ccf9c:       e3a02048        mov     r2, #72 @ 0x48
  2ccfa0:       e3a01000        mov     r1, #0
  2ccfa4:       ebfe6da5        bl      268640 &lt;memset&gt;
  2ccfa8:       e30b32b4        movw    r3, #45748      @ 0xb2b4
  2ccfac:       e340302a        movt    r3, #42 @ 0x2a
  2ccfb0:       e5933000        ldr     r3, [r3]
  2ccfb4:       e203300f        and     r3, r3, #15
  2ccfb8:       e3a02003        mov     r2, #3
  2ccfbc:       e5842014        str     r2, [r4, #20]
  2ccfc0:       e30023ff        movw    r2, #1023       @ 0x3ff
  2ccfc4:       e5842020        str     r2, [r4, #32]
  2ccfc8:       e3e02000        mvn     r2, #0
  2ccfcc:       e5842024        str     r2, [r4, #36]   @ 0x24
  2ccfd0:       e5842028        str     r2, [r4, #40]   @ 0x28
  2ccfd4:       e584302c        str     r3, [r4, #44]   @ 0x2c
  2ccfd8:       e1a00004        mov     r0, r4
  2ccfdc:       e24bd00c        sub     sp, fp, #12
  2ccfe0:       e1cd40d0        ldrd    r4, [sp]
  2ccfe4:       e59db008        ldr     fp, [sp, #8]
  2ccfe8:       e28dd00c        add     sp, sp, #12
  2ccfec:       e49df004        pop     {pc}            @ (ldr pc, [sp], #4
So, basically, it is transformed to void arch_xen_domctl_createdomain(struct xen_domctl_createdomain *ret) by compiler.
If I'm not mistaken something. It was pretty long time ago when I used Arm assembly.

</pre>
    <blockquote type="cite"
      cite="mid:6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    struct xen_domctl_createdomain d_cfg = {
+        .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        /*
+            * The default of 1023 should be sufficient for guests because
+            * on ARM we don't bind physical interrupts to event channels.
+            * The only use of the evtchn port is inter-domain communications.
+            * 1023 is also the default value used in libxl.
+            */
+        .max_evtchn_port = 1023,
+        .max_grant_frames = -1,
+        .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+    };
+
+    return d_cfg;
+}
 
-        if ( iommu_enabled &amp;&amp;
-             (iommu || dt_find_compatible_node(node, NULL,
-                                               "multiboot,device-tree")) )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+void __init arch_create_domus(struct dt_device_node *node,
+                       struct xen_domctl_createdomain *d_cfg,
+                       unsigned int flags)
+{
+    uint32_t val;
 
-        if ( !dt_property_read_u32(node, "nr_spis", &amp;d_cfg.arch.nr_spis) )
-        {
-            int vpl011_virq = GUEST_VPL011_SPI;
-
-            d_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
-
-            /*
-             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
-             * set, in which case it'll match the hardware.
-             *
-             * Since the domain is not yet created, we can't use
-             * d-&gt;arch.vpl011.irq. So the logic to find the vIRQ has to
-             * be hardcoded.
-             * The logic here shall be consistent with the one in
-             * domain_vpl011_init().
-             */
-            if ( flags &amp; CDF_directmap )
-            {
-                vpl011_virq = serial_irq(SERHND_DTUART);
-                if ( vpl011_virq &lt; 0 )
-                    panic("Error getting IRQ number for this serial port %d\n",
-                          SERHND_DTUART);
-            }
+    if ( !dt_property_read_u32(node, "nr_spis", &amp;d_cfg-&gt;arch.nr_spis) )
+    {
+        int vpl011_virq = GUEST_VPL011_SPI;
 
-            /*
-             * vpl011 uses one emulated SPI. If vpl011 is requested, make
-             * sure that we allocate enough SPIs for it.
-             */
-            if ( dt_property_read_bool(node, "vpl011") )
-                d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         vpl011_virq - 32 + 1);
-        }
+        d_cfg-&gt;arch.nr_spis = VGIC_DEF_NR_SPIS;
 
-        /* Get the optional property domain-cpupool */
-        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
-        if ( cpupool_node )
+        /*
+         * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
+         * set, in which case it'll match the hardware.
+         *
+         * Since the domain is not yet created, we can't use
+         * d-&gt;arch.vpl011.irq. So the logic to find the vIRQ has to
+         * be hardcoded.
+         * The logic here shall be consistent with the one in
+         * domain_vpl011_init().
+         */
+        if ( flags &amp; CDF_directmap )
         {
-            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
-            if ( pool_id &lt; 0 )
-                panic("Error getting cpupool id from domain-cpupool (%d)\n",
-                      pool_id);
-            d_cfg.cpupool_id = pool_id;
+            vpl011_virq = serial_irq(SERHND_DTUART);
+            if ( vpl011_virq &lt; 0 )
+                panic("Error getting IRQ number for this serial port %d\n",
+                        SERHND_DTUART);
         }
 
-        if ( dt_property_read_u32(node, "max_grant_version", &amp;val) )
-            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+        /*
+         * vpl011 uses one emulated SPI. If vpl011 is requested, make
+         * sure that we allocate enough SPIs for it.
+         */
+        if ( dt_property_read_bool(node, "vpl011") )
+            d_cfg-&gt;arch.nr_spis = MAX(d_cfg-&gt;arch.nr_spis,
+                                      vpl011_virq - 32 + 1);
+    }
 
-        if ( dt_property_read_u32(node, "max_grant_frames", &amp;val) )
-        {
-            if ( val &gt; INT32_MAX )
-                panic("max_grant_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_grant_frames = val;
-        }
+    if ( dt_get_property(node, "sve", &amp;val) )
+    {
+#ifdef CONFIG_ARM64_SVE
+        unsigned int sve_vl_bits;
+        bool ret = false;
 
-        if ( dt_property_read_u32(node, "max_maptrack_frames", &amp;val) )
+        if ( !val )
         {
-            if ( val &gt; INT32_MAX )
-                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_maptrack_frames = val;
+            /* Property found with no value, means max HW VL supported */
+            ret = sve_domctl_vl_param(-1, &amp;sve_vl_bits);
         }
-
-        if ( dt_get_property(node, "sve", &amp;val) )
+        else
         {
-#ifdef CONFIG_ARM64_SVE
-            unsigned int sve_vl_bits;
-            bool ret = false;
-
-            if ( !val )
-            {
-                /* Property found with no value, means max HW VL supported */
-                ret = sve_domctl_vl_param(-1, &amp;sve_vl_bits);
-            }
+            if ( dt_property_read_u32(node, "sve", &amp;val) )
+                ret = sve_domctl_vl_param(val, &amp;sve_vl_bits);
             else
-            {
-                if ( dt_property_read_u32(node, "sve", &amp;val) )
-                    ret = sve_domctl_vl_param(val, &amp;sve_vl_bits);
-                else
-                    panic("Error reading 'sve' property\n");
-            }
+                panic("Error reading 'sve' property\n");
+        }
 
-            if ( ret )
-                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
-            else
-                panic("SVE vector length error\n");
+        if ( ret )
+            d_cfg-&gt;arch.sve_vl = sve_encode_vl(sve_vl_bits);
+        else
+            panic("SVE vector length error\n");
 #else
-            panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
+        panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
 #endif
-        }
-
-        dt_property_read_string(node, "llc-colors", &amp;llc_colors_str);
-        if ( !llc_coloring_enabled &amp;&amp; llc_colors_str )
-            panic("'llc-colors' found, but LLC coloring is disabled\n");
-
-        /*
-         * The variable max_init_domid is initialized with zero, so here it's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid &gt; 0. (domid == 0 is reserved for Dom0)
-         */
-        d = domain_create(++max_init_domid, &amp;d_cfg, flags);
-        if ( IS_ERR(d) )
-            panic("Error creating domain %s (rc = %ld)\n",
-                  dt_node_name(node), PTR_ERR(d));
-
-        if ( llc_coloring_enabled &amp;&amp;
-             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
-            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
-                  dt_node_name(node), rc);
-
-        d-&gt;is_console = true;
-        dt_device_set_used_by(node, d-&gt;domain_id);
-
-        rc = construct_domU(d, node);
-        if ( rc )
-            panic("Could not set up domain %s (rc = %d)\n",
-                  dt_node_name(node), rc);
     }
 }
 
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4a4036c951..831c914cce 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
 generic-y += device.h
+generic-y += dom0less-build.h
 generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += paging.h
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
deleted file mode 100644
index 5864944bda..0000000000
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __ASM_DOM0LESS_BUILD_H_
-#define __ASM_DOM0LESS_BUILD_H_
-
-#include &lt;xen/stdbool.h&gt;
-
-#ifdef CONFIG_DOM0LESS_BOOT
-
-void create_domUs(void);
-bool is_dom0less_mode(void);
-
-#else /* !CONFIG_DOM0LESS_BOOT */
-
-static inline void create_domUs(void) {}
-static inline bool is_dom0less_mode(void)
-{
-    return false;
-}
-
-#endif /* CONFIG_DOM0LESS_BOOT */
-
-#endif /* __ASM_DOM0LESS_BUILD_H_ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 06ae9751aa..2fd79aea5b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,6 +12,15 @@ config CORE_PARKING
 	bool
 	depends on NR_CPUS &gt; 1
 
+config DOM0LESS_BOOT
+	bool "Dom0less boot support" if EXPERT
+	depends on HAS_DOM0LESS
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">You put dom0less code under device-tree, yet I don't see any of these Kconfig
options being dependent on HAS_DEVICE_TREE. I think this is wrong.</pre>
    </blockquote>
    <pre>Agree, HAS_DEVICE_TREE should be as a dependency here.</pre>
    <blockquote type="cite"
      cite="mid:6e0ec1f3-08e5-475f-8d66-f3814e047760@amd.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
+#define __ASM_GENERIC_DOM0LESS_BUILD_H__
+
+#include &lt;xen/stdbool.h&gt;
+
+#ifdef CONFIG_DOM0LESS_BOOT
+
+#include &lt;public/domctl.h&gt;
+
+void create_domUs(void);
+bool is_dom0less_mode(void);
+
+int construct_domU(struct domain *d, const struct dt_device_node *node);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I don't see necessary headers included for these structs</pre>
    </blockquote>
    <pre>I will use forward declarations for that.

Thanks for review.

~ Oleksii</pre>
  </body>
</html>

--------------FjK0MV04SamkBxU0ZExrOsUE--

