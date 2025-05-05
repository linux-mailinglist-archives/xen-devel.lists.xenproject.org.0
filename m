Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3A7AA8D1B
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 09:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975851.1363154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqMU-0005SP-9s; Mon, 05 May 2025 07:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975851.1363154; Mon, 05 May 2025 07:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBqMU-0005Pa-69; Mon, 05 May 2025 07:35:38 +0000
Received: by outflank-mailman (input) for mailman id 975851;
 Mon, 05 May 2025 07:35:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBqMS-0005PS-Nr
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 07:35:37 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 870eb97b-2983-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 09:35:33 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1056391766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 00:35:33 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189540eb8sm451666866b.173.2025.05.05.00.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 00:35:31 -0700 (PDT)
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
X-Inumbo-ID: 870eb97b-2983-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746430533; x=1747035333; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSVCoi/A4Hc2vR9OKvCTewLQX3Xyonx3kmhhYYyMneg=;
        b=ItexaG0xYwj64v9SdvA8CRRztLWhofLaUZTAxDdgl8RxB9657JzKyvz+K+IUQppcus
         KQ1Q+47JjXrO4PUV0qEbQIz6kK/2VrHKZt4aQQh3tHLyv79XkhFZbcbqJzNpjhugydzZ
         cGg0MMzpZLSh59kF9lhKOsoFqfSxz8DZgcmH3pvnO4iMXQdd3YhnSsuHnsxbhnLioZyw
         vdJxR/TyGtVmOmNNVoyCVpyY6AGUsDyQqBqZqo+v9xLi0feiBTkSiNepFBXjAIjS9TTo
         W2qOv3ndnLdQa2oOjX+tUCO4Inmg1xoU6PoEpSz3X1XVEEurzH/1BEzBJ5oCY5DMvr0S
         0AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746430533; x=1747035333;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSVCoi/A4Hc2vR9OKvCTewLQX3Xyonx3kmhhYYyMneg=;
        b=OO1+t4TWbl9PzfGV71e8CdMejarD9gV4payFeXLh4RlKX5DM+vYvAy8Buadc5IM3aI
         C64iN9E70qWuHx4ZRKIvJXi2Oev1ZFASrzwRirYN2+ww86iPchOKkmBzAfqfpN6trbXj
         xcPBdTkiZyY/6B8ehqCV1nvX9xlgjMQ2Ov1CdPQ9XV3Z9iLuMVkZXOsWZSPhlm2NyT+f
         SFO+706fa9gxsqdF8ycBZL17ZLEF+b2hSubYjrFqmAMz0Mz5Aso20fOIzXi7y++MZT6e
         ERr5y1c+30OVKDunTJPvC4P4EXi5mvIY9iSev67UfDxpdzWpIG0DUUdI/blhKA1KRD5q
         tMxg==
X-Gm-Message-State: AOJu0YznD/IkLvyUO6Z9W2TJHlsROtl+SVrI1+hzqrtXXC1RUuWJHflr
	zV4brlFEa88TeagVz5OS4yCjBCqIibzMjBRrM3Pk0DM4ZpXW4jsVtqSIlQ==
X-Gm-Gg: ASbGnct6sahWUREpuI8ruxoGVRHFaEsZ+85fXImaBESwyUj28rvNZp5A3uzGt6hdH/Q
	vYvsvenL67mdYaJfpI5rwfqKpVeEdQqJEIHq8H6rQrn0D2dMycYyRWQgiUCs1K4OmYK9zCv/zQc
	nevtOUP6HICx5WoI/pL6cWIvlsEbB3TGz+owAV2pxoTiVJ0tkVkDin+pR1SdqvtC+va2rQef7MK
	aluZOPCkaCraJmvTuehui+/XtDEppn2Lucvy3MaRz+VooFl6InokLvZKqreSJHeHpNBiNLZEHx4
	WTNBiyKdrxHBsMkqppDkUEP0mcLkbdGr1F2GnfH+HQqeXEw/p7IOclne4+eQJuNLj+UaA0nEVXI
	3idk7LVHmeKroZyXl
X-Google-Smtp-Source: AGHT+IE2uwLWAHEdYfHDKexOIySISZO8oTaX96/YBgX+ezNsmNBWKQKktE5qjCNA5ps1/ggYTc53pA==
X-Received: by 2002:a17:907:c28f:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad190654de0mr736726066b.13.1746430532146;
        Mon, 05 May 2025 00:35:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------XhSxytRE3300FoxfdHaztzYN"
Message-ID: <c804228e-c15e-4cce-80e7-f90f4a290a81@gmail.com>
Date: Mon, 5 May 2025 09:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <82f0c1d4fe25b4a52d76f3c8004e107b183af56c.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------XhSxytRE3300FoxfdHaztzYN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/2/25 7:55 PM, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>> Move some parts of Arm's Dom0Less code to be reused by other architectures.
>> At the moment, RISC-V is going to reuse these parts.
>>
>> Move dom0less-build.h from the Arm-specific directory to asm-generic
>> as these header is expected to be the same across acrhictectures with
>> some updates: add the following declaration of construct_domU(),
>> and arch_create_domUs() as there are some parts which are still
>> architecture-specific.
>>
>> Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
>> code for an architecture.
>>
>> Relocate the CONFIG_DOM0LESS configuration to the common with adding
>> "depends on HAS_DOM0LESS" to not break builds for architectures which
>> don't support CONFIG_DOM0LESS config, especically it would be useful
>> to not provide stubs for  construct_domU(), arch_create_domUs()
>> in case of *-randconfig which may set CONFIG_DOM0LESS=y.
>>
>> Move is_dom0less_mode() function to the common code, as it depends on
>> boot modules that are already part of the common code.
>>
>> Move create_domUs() function to the common code with some updates:
>> - Add arch_create_domUs() to cover parsing of arch-specific features,
>>    for example, SVE (Scalar Vector Extension ) exists only in Arm.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> It was suggested to change dom0less to predefined domus or similar
>> (https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0):
>>
>> I decided to go with dom0less name for now as it will require a lot of places to change,
>> including CI's test, and IMO we could do in a separate patch.
>> If it is necessry to do now, I'll be happy to do that in next version of the current
>> patch series.
> I think it is fine to use dom0less for now, it will make the code easier
> to review and it is not necessary to change the name at this point.
>
> The patch looks good to me, except for a couple of minor suggestions I
> have below. I could make them on commit. With those:
>
> Reviewed-by: Stefano Stabellini<sstabellini@kernel.org>

Thanks.

I will apply the suggestions below (unless they have already been committed by the time I start preparing the new version of the patch series).

~ Oleksii

>
>
>> ---
>> Changes in v3:
>>   - Move changes connected to the patch "xen/arm: dom0less delay xenstore initialization"
>>     to common.
>>     Also, some necessary parts for the mentioned patches were moved
>>     to common (such as alloc_xenstore_evtchn(), ... ).
>>     Not all changes are moved, changes connected to alloc_xenstore_params() and
>>     construct_domu() will be moved in the following patches of this patch series.
>>   - Move parsing of capabilities property to common code.
>>   - Align parsing of "passthrough", "multiboot,device-tree" properties with staging.
>>   - Drop arch_xen_domctl_createdomain().
>>   - Add 'select HAS_DEVICE_TREE' for config HAS_DOM0LESS.
>>   - Add empty lines after license in the top of newly added files.
>>   - s/arch_create_domus/arch_create_domUs.
>>   - Add footer below commit message regarding the naming of dom0less.
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
>>   xen/arch/arm/dom0less-build.c             | 371 ++++------------------
>>   xen/arch/arm/include/asm/Makefile         |   1 +
>>   xen/arch/arm/include/asm/dom0less-build.h |  34 --
>>   xen/common/Kconfig                        |  13 +
>>   xen/common/device-tree/Makefile           |   1 +
>>   xen/common/device-tree/dom0less-build.c   | 283 +++++++++++++++++
>>   xen/include/asm-generic/dom0less-build.h  |  49 +++
>>   8 files changed, 404 insertions(+), 357 deletions(-)
>>   delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>   create mode 100644 xen/common/device-tree/dom0less-build.c
>>   create mode 100644 xen/include/asm-generic/dom0less-build.h
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index da8a406f5a..d0e0a7753c 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -15,6 +15,7 @@ config ARM
>>   	select GENERIC_UART_INIT
>>   	select HAS_ALTERNATIVE if HAS_VMAP
>>   	select HAS_DEVICE_TREE
>> +	select HAS_DOM0LESS
>>   	select HAS_STACK_PROTECTOR
>>   	select HAS_UBSAN
>>   
>> @@ -120,14 +121,6 @@ config GICV2
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
>> index a356fc94fc..ef49495d4f 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -22,48 +22,7 @@
>>   #include <asm/static-memory.h>
>>   #include <asm/static-shmem.h>
>>   
>> -#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>> -
>> -static domid_t __initdata xs_domid = DOMID_INVALID;
>> -static bool __initdata need_xenstore;
>> -
>> -void __init set_xs_domain(struct domain *d)
>> -{
>> -    xs_domid = d->domain_id;
>> -    set_global_virq_handler(d, VIRQ_DOM_EXC);
>> -}
>> -
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
>> +bool __initdata need_xenstore;
>>   
>>   #ifdef CONFIG_VGICV2
>>   static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>> @@ -686,25 +645,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>       return -EINVAL;
>>   }
>>   
>> -static int __init alloc_xenstore_evtchn(struct domain *d)
>> -{
>> -    evtchn_alloc_unbound_t alloc;
>> -    int rc;
>> -
>> -    alloc.dom = d->domain_id;
>> -    alloc.remote_dom = xs_domid;
>> -    rc = evtchn_alloc_unbound(&alloc, 0);
>> -    if ( rc )
>> -    {
>> -        printk("Failed allocating event channel for domain\n");
>> -        return rc;
>> -    }
>> -
>> -    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
>> -
>> -    return 0;
>> -}
>> -
>>   #define XENSTORE_PFN_OFFSET 1
>>   static int __init alloc_xenstore_page(struct domain *d)
>>   {
>> @@ -771,36 +711,6 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
>>       return rc;
>>   }
>>   
>> -static void __init initialize_domU_xenstore(void)
>> -{
>> -    struct domain *d;
>> -
>> -    if ( xs_domid == DOMID_INVALID )
>> -        return;
>> -
>> -    for_each_domain( d )
>> -    {
>> -        uint64_t gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
>> -        int rc;
>> -
>> -        if ( gfn == 0 )
>> -            continue;
>> -
>> -        if ( is_xenstore_domain(d) )
>> -            continue;
>> -
>> -        rc = alloc_xenstore_evtchn(d);
>> -        if ( rc < 0 )
>> -            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
>> -
>> -        if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
>> -        {
>> -            ASSERT(gfn < UINT32_MAX);
>> -            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
>> -        }
>> -    }
>> -}
>> -
>>   static void __init domain_vcpu_affinity(struct domain *d,
>>                                           const struct dt_device_node *node)
>>   {
>> @@ -906,8 +816,8 @@ static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
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
>> @@ -1009,246 +919,77 @@ static int __init construct_domU(struct domain *d,
>>       return alloc_xenstore_params(&kinfo);
>>   }
>>   
>> -void __init create_domUs(void)
>> +void __init arch_create_domUs(struct dt_device_node *node,
>> +                       struct xen_domctl_createdomain *d_cfg,
>> +                       unsigned int flags)
>>   {
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
>> -        bool has_dtb = false;
>> -        uint32_t val;
>> -        int rc;
>> -
>> -        if ( !dt_device_is_compatible(node, "xen,domain") )
>> -            continue;
>> -
>> -        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>> -            panic("No more domain IDs available\n");
>> +    uint32_t val;
>>   
>> -        if ( dt_property_read_u32(node, "capabilities", &val) )
>> -        {
>> -            if ( val & ~DOMAIN_CAPS_MASK )
>> -                panic("Invalid capabilities (%"PRIx32")\n", val);
>> -
>> -            if ( val & DOMAIN_CAPS_CONTROL )
>> -                flags |= CDF_privileged;
>> -
>> -            if ( val & DOMAIN_CAPS_HARDWARE )
>> -            {
>> -                if ( hardware_domain )
>> -                    panic("Only 1 hardware domain can be specified! (%pd)\n",
>> -                           hardware_domain);
>> -
>> -                d_cfg.max_grant_frames = gnttab_dom0_frames();
>> -                d_cfg.max_evtchn_port = -1;
>> -                flags |= CDF_hardware;
>> -                iommu = true;
>> -            }
>> -
>> -            if ( val & DOMAIN_CAPS_XENSTORE )
>> -            {
>> -                if ( xs_domid != DOMID_INVALID )
>> -                    panic("Only 1 xenstore domain can be specified! (%u)\n",
>> -                          xs_domid);
>> +    d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>> +    d_cfg->flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>>   
>> -                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
>> -                d_cfg.max_evtchn_port = -1;
>> -            }
>> -        }
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
>> -
>> -        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
>> -            panic("Missing property 'cpus' for domain %s\n",
>> -                  dt_node_name(node));
>> -
>> -        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
>> -        {
>> -            if ( flags & CDF_hardware )
>> -                panic("Don't specify passthrough for hardware domain\n");
>> -
>> -            if ( !strcmp(dom0less_iommu, "enabled") )
>> -                iommu = true;
>> -        }
>> -
>> -        if ( (flags & CDF_hardware) && !(flags & CDF_directmap) &&
>> -             !iommu_enabled )
>> -            panic("non-direct mapped hardware domain requires iommu\n");
>> -
>> -        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
>> -        {
>> -            if ( flags & CDF_hardware )
>> -                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
>> -
>> -            has_dtb = true;
>> -        }
>> -
>> -        if ( iommu_enabled && (iommu || has_dtb) )
>> -            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>> -
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
>> -        else if ( flags & CDF_hardware )
>> -            panic("nr_spis cannot be specified for hardware domain\n");
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
>> +            * vpl011 uses one emulated SPI. If vpl011 is requested, make
>> +            * sure that we allocate enough SPIs for it.
>> +            */
>> +        if ( dt_property_read_bool(node, "vpl011") )
>> +            d_cfg->arch.nr_spis = MAX(d_cfg->arch.nr_spis,
>> +                                      vpl011_virq - 32 + 1);
>> +    }
>> +    else if ( flags & CDF_hardware )
>> +        panic("nr_spis cannot be specified for hardware domain\n");
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
>> -
>> -        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
>> -            set_xs_domain(d);
>>       }
>> -
>> -    if ( need_xenstore && xs_domid == DOMID_INVALID )
>> -        panic("xenstore requested, but xenstore domain not present\n");
>> -
>> -    initialize_domU_xenstore();
>>   }
>>   
>>   /*
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
>> index b0e41a1954..0000000000
>> --- a/xen/arch/arm/include/asm/dom0less-build.h
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
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
>> -void set_xs_domain(struct domain *d);
>> -
>> -#else /* !CONFIG_DOM0LESS_BOOT */
>> -
>> -static inline void create_domUs(void) {}
>> -static inline bool is_dom0less_mode(void)
>> -{
>> -    return false;
>> -}
>> -static inline void set_xs_domain(struct domain *d) {}
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
>> index be28060716..be38abf9e1 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -12,6 +12,15 @@ config CORE_PARKING
>>   	bool
>>   	depends on NR_CPUS > 1
>>   
>> +config DOM0LESS_BOOT
>> +	bool "Dom0less boot support" if EXPERT
>> +	depends on HAS_DOM0LESS
> I think it is better to also add here:
>
>    depends on HAS_DEVICE_TREE
>
> and ...
>
>
>> +	default y
>> +	help
>> +	  Dom0less boot support enables Xen to create and start domU guests during
>> +	  Xen boot without the need of a control domain (Dom0), which could be
>> +	  present anyway.
>> +
>>   config GRANT_TABLE
>>   	bool "Grant table support" if EXPERT
>>   	default y
>> @@ -74,6 +83,10 @@ config HAS_DEVICE_TREE
>>   	bool
>>   	select LIBFDT
>>   
>> +config HAS_DOM0LESS
>> +	bool
>> +	select HAS_DEVICE_TREE
> ... remove select HAS_DEVICE_TREE from here. To reduce the dependencies
> complexity.
>
>
>>   config HAS_DIT # Data Independent Timing
>>   	bool
>>   
>> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
>> index 7c549be38a..f3dafc9b81 100644
>> --- a/xen/common/device-tree/Makefile
>> +++ b/xen/common/device-tree/Makefile
>> @@ -1,5 +1,6 @@
>>   obj-y += bootfdt.init.o
>>   obj-y += bootinfo.init.o
>>   obj-y += device-tree.o
>> +obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
>>   obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>>   obj-y += intc.o
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> new file mode 100644
>> index 0000000000..a01a8b6b1a
>> --- /dev/null
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -0,0 +1,283 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/bootfdt.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/domain.h>
>> +#include <xen/err.h>
>> +#include <xen/event.h>
>> +#include <xen/grant_table.h>
>> +#include <xen/init.h>
>> +#include <xen/iommu.h>
>> +#include <xen/llc-coloring.h>
>> +#include <xen/sched.h>
>> +#include <xen/stdbool.h>
>> +#include <xen/types.h>
>> +
>> +#include <public/bootfdt.h>
>> +#include <public/domctl.h>
>> +#include <public/event_channel.h>
>> +
>> +#include <asm/dom0less-build.h>
>> +#include <asm/setup.h>
>> +
>> +static domid_t __initdata xs_domid = DOMID_INVALID;
>> +
>> +void __init set_xs_domain(struct domain *d)
>> +{
>> +    xs_domid = d->domain_id;
>> +    set_global_virq_handler(d, VIRQ_DOM_EXC);
>> +}
>> +
>> +bool __init is_dom0less_mode(void)
>> +{
>> +    struct bootmodules *mods = &bootinfo.modules;
>> +    struct bootmodule *mod;
>> +    unsigned int i;
>> +    bool dom0found = false;
>> +    bool domUfound = false;
>> +
>> +    /* Look into the bootmodules */
>> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
>> +    {
>> +        mod = &mods->module[i];
>> +        /* Find if dom0 and domU kernels are present */
>> +        if ( mod->kind == BOOTMOD_KERNEL )
>> +        {
>> +            if ( mod->domU == false )
>> +            {
>> +                dom0found = true;
>> +                break;
>> +            }
>> +            else
>> +                domUfound = true;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * If there is no dom0 kernel but at least one domU, then we are in
>> +     * dom0less mode
>> +     */
>> +    return ( !dom0found && domUfound );
>> +}
>> +
>> +static int __init alloc_xenstore_evtchn(struct domain *d)
>> +{
>> +    evtchn_alloc_unbound_t alloc;
>> +    int rc;
>> +
>> +    alloc.dom = d->domain_id;
>> +    alloc.remote_dom = xs_domid;
>> +    rc = evtchn_alloc_unbound(&alloc, 0);
>> +    if ( rc )
>> +    {
>> +        printk("Failed allocating event channel for domain\n");
>> +        return rc;
>> +    }
>> +
>> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
>> +
>> +    return 0;
>> +}
>> +
>> +static void __init initialize_domU_xenstore(void)
>> +{
>> +    struct domain *d;
>> +
>> +    if ( xs_domid == DOMID_INVALID )
>> +        return;
>> +
>> +    for_each_domain( d )
>> +    {
>> +        uint64_t gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
>> +        int rc;
>> +
>> +        if ( gfn == 0 )
>> +            continue;
>> +
>> +        if ( is_xenstore_domain(d) )
>> +            continue;
>> +
>> +        rc = alloc_xenstore_evtchn(d);
>> +        if ( rc < 0 )
>> +            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
>> +
>> +        if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
>> +        {
>> +            ASSERT(gfn < UINT32_MAX);
>> +            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
>> +        }
>> +    }
>> +}
>> +
>> +void __init create_domUs(void)
>> +{
>> +    struct dt_device_node *node;
>> +    const char *dom0less_iommu;
>> +    bool iommu = false;
>> +    const struct dt_device_node *cpupool_node,
>> +                                *chosen = dt_find_node_by_path("/chosen");
>> +    const char *llc_colors_str = NULL;
>> +
>> +    BUG_ON(chosen == NULL);
>> +    dt_for_each_child_node(chosen, node)
>> +    {
>> +        struct domain *d;
>> +        struct xen_domctl_createdomain d_cfg = {0};
>> +        unsigned int flags = 0U;
>> +        bool has_dtb = false;
>> +        uint32_t val;
>> +        int rc;
>> +
>> +        if ( !dt_device_is_compatible(node, "xen,domain") )
>> +            continue;
>> +
>> +        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>> +            panic("No more domain IDs available\n");
>> +
>> +        d_cfg.max_evtchn_port = 1023;
>> +        d_cfg.max_grant_frames = -1;
>> +        d_cfg.max_maptrack_frames = -1;
>> +        d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version);
>> +
>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>> +        {
>> +            if ( val & ~DOMAIN_CAPS_MASK )
>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>> +
>> +            if ( val & DOMAIN_CAPS_CONTROL )
>> +                flags |= CDF_privileged;
>> +
>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>> +            {
>> +                if ( hardware_domain )
>> +                    panic("Only 1 hardware domain can be specified! (%pd)\n",
>> +                            hardware_domain);
>> +
>> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
>> +                d_cfg.max_evtchn_port = -1;
>> +                flags |= CDF_hardware;
>> +                iommu = true;
>> +            }
>> +
>> +            if ( val & DOMAIN_CAPS_XENSTORE )
>> +            {
>> +                if ( xs_domid != DOMID_INVALID )
>> +                    panic("Only 1 xenstore domain can be specified! (%u)\n",
>> +                            xs_domid);
>> +
>> +                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
>> +                d_cfg.max_evtchn_port = -1;
>> +            }
>> +        }
>> +
>> +        if ( dt_find_property(node, "xen,static-mem", NULL) )
>> +        {
>> +            if ( llc_coloring_enabled )
>> +                panic("LLC coloring and static memory are incompatible\n");
>> +
>> +            flags |= CDF_staticmem;
>> +        }
>> +
>> +        if ( dt_property_read_bool(node, "direct-map") )
>> +        {
>> +            if ( !(flags & CDF_staticmem) )
>> +                panic("direct-map is not valid for domain %s without static allocation.\n",
>> +                      dt_node_name(node));
>> +
>> +            flags |= CDF_directmap;
>> +        }
>> +
>> +        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
>> +            panic("Missing property 'cpus' for domain %s\n",
>> +                  dt_node_name(node));
>> +
>> +        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
>> +        {
>> +            if ( flags & CDF_hardware )
>> +                panic("Don't specify passthrough for hardware domain\n");
>> +
>> +            if ( !strcmp(dom0less_iommu, "enabled") )
>> +                iommu = true;
>> +        }
>> +
>> +        if ( (flags & CDF_hardware) && !(flags & CDF_directmap) &&
>> +             !iommu_enabled )
>> +            panic("non-direct mapped hardware domain requires iommu\n");
>> +
>> +        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
>> +        {
>> +            if ( flags & CDF_hardware )
>> +                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
>> +
>> +            has_dtb = true;
>> +        }
>> +
>> +        if ( iommu_enabled && (iommu || has_dtb) )
>> +            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>> +
>> +        /* Get the optional property domain-cpupool */
>> +        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
>> +        if ( cpupool_node )
>> +        {
>> +            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
>> +            if ( pool_id < 0 )
>> +                panic("Error getting cpupool id from domain-cpupool (%d)\n",
>> +                      pool_id);
>> +            d_cfg.cpupool_id = pool_id;
>> +        }
>> +
>> +        if ( dt_property_read_u32(node, "max_grant_version", &val) )
>> +            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
>> +
>> +        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
>> +        {
>> +            if ( val > INT32_MAX )
>> +                panic("max_grant_frames (%"PRIu32") overflow\n", val);
>> +            d_cfg.max_grant_frames = val;
>> +        }
>> +
>> +        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
>> +        {
>> +            if ( val > INT32_MAX )
>> +                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
>> +            d_cfg.max_maptrack_frames = val;
>> +        }
>> +
>> +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
>> +        if ( !llc_coloring_enabled && llc_colors_str )
>> +            panic("'llc-colors' found, but LLC coloring is disabled\n");
>> +
>> +        arch_create_domUs(node, &d_cfg, flags);
>> +
>> +        /*
>> +         * The variable max_init_domid is initialized with zero, so here it's
>> +         * very important to use the pre-increment operator to call
>> +         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
>> +         */
>> +        d = domain_create(++max_init_domid, &d_cfg, flags);
>> +        if ( IS_ERR(d) )
>> +            panic("Error creating domain %s (rc = %ld)\n",
>> +                  dt_node_name(node), PTR_ERR(d));
>> +
>> +        if ( llc_coloring_enabled &&
>> +             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
>> +            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
>> +                  dt_node_name(node), rc);
>> +
>> +        d->is_console = true;
>> +        dt_device_set_used_by(node, d->domain_id);
>> +
>> +        rc = construct_domU(d, node);
>> +        if ( rc )
>> +            panic("Could not set up domain %s (rc = %d)\n",
>> +                  dt_node_name(node), rc);
>> +
>> +        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
>> +            set_xs_domain(d);
>> +    }
>> +
>> +    if ( need_xenstore && xs_domid == DOMID_INVALID )
>> +        panic("xenstore requested, but xenstore domain not present\n");
>> +
>> +    initialize_domU_xenstore();
>> +}
>> diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
>> new file mode 100644
>> index 0000000000..5655571a66
>> --- /dev/null
>> +++ b/xen/include/asm-generic/dom0less-build.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
>> +#define __ASM_GENERIC_DOM0LESS_BUILD_H__
>> +
>> +#include <xen/stdbool.h>
>> +
>> +#ifdef CONFIG_DOM0LESS_BOOT
>> +
>> +#include <public/domctl.h>
>> +
>> +struct domain;
> This declaration needs to be out of the #ifdef CONFIG_DOM0LESS_BOOT
> because...
>
>
>> +struct dt_device_node;
>> +
>> +/* TODO: remove both when construct_domU() will be moved to common. */
>> +#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>> +extern bool need_xenstore;
>> +
>> +void create_domUs(void);
>> +bool is_dom0less_mode(void);
>> +void set_xs_domain(struct domain *d);
>> +
>> +int construct_domU(struct domain *d, const struct dt_device_node *node);
>> +
>> +void arch_create_domUs(struct dt_device_node *node,
>> +                       struct xen_domctl_createdomain *d_cfg,
>> +                       unsigned int flags);
>> +
>> +#else /* !CONFIG_DOM0LESS_BOOT */
>> +
>> +static inline void create_domUs(void) {}
>> +static inline bool is_dom0less_mode(void)
>> +{
>> +    return false;
>> +}
>> +static inline void set_xs_domain(struct domain *d) {}
> ... of this usage of struct domain *d.
>
>
>> +#endif /* CONFIG_DOM0LESS_BOOT */
>> +
>> +#endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> -- 
>> 2.49.0
>>
--------------XhSxytRE3300FoxfdHaztzYN
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
    <div class="moz-cite-prefix">On 5/2/25 7:55 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Fri, 2 May 2025, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Move some parts of Arm's Dom0Less code to be reused by other architectures.
At the moment, RISC-V is going to reuse these parts.

Move dom0less-build.h from the Arm-specific directory to asm-generic
as these header is expected to be the same across acrhictectures with
some updates: add the following declaration of construct_domU(),
and arch_create_domUs() as there are some parts which are still
architecture-specific.

Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
code for an architecture.

Relocate the CONFIG_DOM0LESS configuration to the common with adding
"depends on HAS_DOM0LESS" to not break builds for architectures which
don't support CONFIG_DOM0LESS config, especically it would be useful
to not provide stubs for  construct_domU(), arch_create_domUs()
in case of *-randconfig which may set CONFIG_DOM0LESS=y.

Move is_dom0less_mode() function to the common code, as it depends on
boot modules that are already part of the common code.

Move create_domUs() function to the common code with some updates:
- Add arch_create_domUs() to cover parsing of arch-specific features,
  for example, SVE (Scalar Vector Extension ) exists only in Arm.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
It was suggested to change dom0less to predefined domus or similar
(<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0">https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0</a>):

I decided to go with dom0less name for now as it will require a lot of places to change,
including CI's test, and IMO we could do in a separate patch.
If it is necessry to do now, I'll be happy to do that in next version of the current
patch series.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think it is fine to use dom0less for now, it will make the code easier
to review and it is not necessary to change the name at this point.

The patch looks good to me, except for a couple of minor suggestions I
have below. I could make them on commit. With those:

Reviewed-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a></pre>
    </blockquote>
    <pre>Thanks.

I will apply the suggestions below (unless they have already been committed by the time I start preparing the new version of the patch series).

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021028020.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
Changes in v3:
 - Move changes connected to the patch "xen/arm: dom0less delay xenstore initialization"
   to common.
   Also, some necessary parts for the mentioned patches were moved
   to common (such as alloc_xenstore_evtchn(), ... ).
   Not all changes are moved, changes connected to alloc_xenstore_params() and
   construct_domu() will be moved in the following patches of this patch series.
 - Move parsing of capabilities property to common code.
 - Align parsing of "passthrough", "multiboot,device-tree" properties with staging.
 - Drop arch_xen_domctl_createdomain().
 - Add 'select HAS_DEVICE_TREE' for config HAS_DOM0LESS.
 - Add empty lines after license in the top of newly added files.
 - s/arch_create_domus/arch_create_domUs.
 - Add footer below commit message regarding the naming of dom0less.
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
 xen/arch/arm/dom0less-build.c             | 371 ++++------------------
 xen/arch/arm/include/asm/Makefile         |   1 +
 xen/arch/arm/include/asm/dom0less-build.h |  34 --
 xen/common/Kconfig                        |  13 +
 xen/common/device-tree/Makefile           |   1 +
 xen/common/device-tree/dom0less-build.c   | 283 +++++++++++++++++
 xen/include/asm-generic/dom0less-build.h  |  49 +++
 8 files changed, 404 insertions(+), 357 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index da8a406f5a..d0e0a7753c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_DOM0LESS
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
 
@@ -120,14 +121,6 @@ config GICV2
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
index a356fc94fc..ef49495d4f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,48 +22,7 @@
 #include &lt;asm/static-memory.h&gt;
 #include &lt;asm/static-shmem.h&gt;
 
-#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
-
-static domid_t __initdata xs_domid = DOMID_INVALID;
-static bool __initdata need_xenstore;
-
-void __init set_xs_domain(struct domain *d)
-{
-    xs_domid = d-&gt;domain_id;
-    set_global_virq_handler(d, VIRQ_DOM_EXC);
-}
-
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
+bool __initdata need_xenstore;
 
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
@@ -686,25 +645,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     return -EINVAL;
 }
 
-static int __init alloc_xenstore_evtchn(struct domain *d)
-{
-    evtchn_alloc_unbound_t alloc;
-    int rc;
-
-    alloc.dom = d-&gt;domain_id;
-    alloc.remote_dom = xs_domid;
-    rc = evtchn_alloc_unbound(&amp;alloc, 0);
-    if ( rc )
-    {
-        printk("Failed allocating event channel for domain\n");
-        return rc;
-    }
-
-    d-&gt;arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
-
-    return 0;
-}
-
 #define XENSTORE_PFN_OFFSET 1
 static int __init alloc_xenstore_page(struct domain *d)
 {
@@ -771,36 +711,6 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
     return rc;
 }
 
-static void __init initialize_domU_xenstore(void)
-{
-    struct domain *d;
-
-    if ( xs_domid == DOMID_INVALID )
-        return;
-
-    for_each_domain( d )
-    {
-        uint64_t gfn = d-&gt;arch.hvm.params[HVM_PARAM_STORE_PFN];
-        int rc;
-
-        if ( gfn == 0 )
-            continue;
-
-        if ( is_xenstore_domain(d) )
-            continue;
-
-        rc = alloc_xenstore_evtchn(d);
-        if ( rc &lt; 0 )
-            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
-
-        if ( gfn != XENSTORE_PFN_LATE_ALLOC &amp;&amp; IS_ENABLED(CONFIG_GRANT_TABLE) )
-        {
-            ASSERT(gfn &lt; UINT32_MAX);
-            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
-        }
-    }
-}
-
 static void __init domain_vcpu_affinity(struct domain *d,
                                         const struct dt_device_node *node)
 {
@@ -906,8 +816,8 @@ static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
 }
 #endif /* CONFIG_ARCH_PAGING_MEMPOOL */
 
-static int __init construct_domU(struct domain *d,
-                                 const struct dt_device_node *node)
+int __init construct_domU(struct domain *d,
+                          const struct dt_device_node *node)
 {
     struct kernel_info kinfo = KERNEL_INFO_INIT;
     const char *dom0less_enhanced;
@@ -1009,246 +919,77 @@ static int __init construct_domU(struct domain *d,
     return alloc_xenstore_params(&amp;kinfo);
 }
 
-void __init create_domUs(void)
+void __init arch_create_domUs(struct dt_device_node *node,
+                       struct xen_domctl_createdomain *d_cfg,
+                       unsigned int flags)
 {
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
-        bool has_dtb = false;
-        uint32_t val;
-        int rc;
-
-        if ( !dt_device_is_compatible(node, "xen,domain") )
-            continue;
-
-        if ( (max_init_domid + 1) &gt;= DOMID_FIRST_RESERVED )
-            panic("No more domain IDs available\n");
+    uint32_t val;
 
-        if ( dt_property_read_u32(node, "capabilities", &amp;val) )
-        {
-            if ( val &amp; ~DOMAIN_CAPS_MASK )
-                panic("Invalid capabilities (%"PRIx32")\n", val);
-
-            if ( val &amp; DOMAIN_CAPS_CONTROL )
-                flags |= CDF_privileged;
-
-            if ( val &amp; DOMAIN_CAPS_HARDWARE )
-            {
-                if ( hardware_domain )
-                    panic("Only 1 hardware domain can be specified! (%pd)\n",
-                           hardware_domain);
-
-                d_cfg.max_grant_frames = gnttab_dom0_frames();
-                d_cfg.max_evtchn_port = -1;
-                flags |= CDF_hardware;
-                iommu = true;
-            }
-
-            if ( val &amp; DOMAIN_CAPS_XENSTORE )
-            {
-                if ( xs_domid != DOMID_INVALID )
-                    panic("Only 1 xenstore domain can be specified! (%u)\n",
-                          xs_domid);
+    d_cfg-&gt;arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    d_cfg-&gt;flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
 
-                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
-                d_cfg.max_evtchn_port = -1;
-            }
-        }
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
-
-        if ( !dt_property_read_u32(node, "cpus", &amp;d_cfg.max_vcpus) )
-            panic("Missing property 'cpus' for domain %s\n",
-                  dt_node_name(node));
-
-        if ( !dt_property_read_string(node, "passthrough", &amp;dom0less_iommu) )
-        {
-            if ( flags &amp; CDF_hardware )
-                panic("Don't specify passthrough for hardware domain\n");
-
-            if ( !strcmp(dom0less_iommu, "enabled") )
-                iommu = true;
-        }
-
-        if ( (flags &amp; CDF_hardware) &amp;&amp; !(flags &amp; CDF_directmap) &amp;&amp;
-             !iommu_enabled )
-            panic("non-direct mapped hardware domain requires iommu\n");
-
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
-        {
-            if ( flags &amp; CDF_hardware )
-                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
-
-            has_dtb = true;
-        }
-
-        if ( iommu_enabled &amp;&amp; (iommu || has_dtb) )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-
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
-        else if ( flags &amp; CDF_hardware )
-            panic("nr_spis cannot be specified for hardware domain\n");
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
+            * vpl011 uses one emulated SPI. If vpl011 is requested, make
+            * sure that we allocate enough SPIs for it.
+            */
+        if ( dt_property_read_bool(node, "vpl011") )
+            d_cfg-&gt;arch.nr_spis = MAX(d_cfg-&gt;arch.nr_spis,
+                                      vpl011_virq - 32 + 1);
+    }
+    else if ( flags &amp; CDF_hardware )
+        panic("nr_spis cannot be specified for hardware domain\n");
 
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
-
-        if ( d_cfg.flags &amp; XEN_DOMCTL_CDF_xs_domain )
-            set_xs_domain(d);
     }
-
-    if ( need_xenstore &amp;&amp; xs_domid == DOMID_INVALID )
-        panic("xenstore requested, but xenstore domain not present\n");
-
-    initialize_domU_xenstore();
 }
 
 /*
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
index b0e41a1954..0000000000
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ /dev/null
@@ -1,34 +0,0 @@
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
-void set_xs_domain(struct domain *d);
-
-#else /* !CONFIG_DOM0LESS_BOOT */
-
-static inline void create_domUs(void) {}
-static inline bool is_dom0less_mode(void)
-{
-    return false;
-}
-static inline void set_xs_domain(struct domain *d) {}
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
index be28060716..be38abf9e1 100644
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
      <pre wrap="" class="moz-quote-pre">
I think it is better to also add here:

  depends on HAS_DEVICE_TREE

and ...


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	default y
+	help
+	  Dom0less boot support enables Xen to create and start domU guests during
+	  Xen boot without the need of a control domain (Dom0), which could be
+	  present anyway.
+
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
@@ -74,6 +83,10 @@ config HAS_DEVICE_TREE
 	bool
 	select LIBFDT
 
+config HAS_DOM0LESS
+	bool
+	select HAS_DEVICE_TREE
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... remove select HAS_DEVICE_TREE from here. To reduce the dependencies
complexity.


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> config HAS_DIT # Data Independent Timing
 	bool
 
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 7c549be38a..f3dafc9b81 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,5 +1,6 @@
 obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
+obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
new file mode 100644
index 0000000000..a01a8b6b1a
--- /dev/null
+++ b/xen/common/device-tree/dom0less-build.c
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/domain.h&gt;
+#include &lt;xen/err.h&gt;
+#include &lt;xen/event.h&gt;
+#include &lt;xen/grant_table.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/iommu.h&gt;
+#include &lt;xen/llc-coloring.h&gt;
+#include &lt;xen/sched.h&gt;
+#include &lt;xen/stdbool.h&gt;
+#include &lt;xen/types.h&gt;
+
+#include &lt;public/bootfdt.h&gt;
+#include &lt;public/domctl.h&gt;
+#include &lt;public/event_channel.h&gt;
+
+#include &lt;asm/dom0less-build.h&gt;
+#include &lt;asm/setup.h&gt;
+
+static domid_t __initdata xs_domid = DOMID_INVALID;
+
+void __init set_xs_domain(struct domain *d)
+{
+    xs_domid = d-&gt;domain_id;
+    set_global_virq_handler(d, VIRQ_DOM_EXC);
+}
+
+bool __init is_dom0less_mode(void)
+{
+    struct bootmodules *mods = &amp;bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+    bool dom0found = false;
+    bool domUfound = false;
+
+    /* Look into the bootmodules */
+    for ( i = 0 ; i &lt; mods-&gt;nr_mods ; i++ )
+    {
+        mod = &amp;mods-&gt;module[i];
+        /* Find if dom0 and domU kernels are present */
+        if ( mod-&gt;kind == BOOTMOD_KERNEL )
+        {
+            if ( mod-&gt;domU == false )
+            {
+                dom0found = true;
+                break;
+            }
+            else
+                domUfound = true;
+        }
+    }
+
+    /*
+     * If there is no dom0 kernel but at least one domU, then we are in
+     * dom0less mode
+     */
+    return ( !dom0found &amp;&amp; domUfound );
+}
+
+static int __init alloc_xenstore_evtchn(struct domain *d)
+{
+    evtchn_alloc_unbound_t alloc;
+    int rc;
+
+    alloc.dom = d-&gt;domain_id;
+    alloc.remote_dom = xs_domid;
+    rc = evtchn_alloc_unbound(&amp;alloc, 0);
+    if ( rc )
+    {
+        printk("Failed allocating event channel for domain\n");
+        return rc;
+    }
+
+    d-&gt;arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
+
+    return 0;
+}
+
+static void __init initialize_domU_xenstore(void)
+{
+    struct domain *d;
+
+    if ( xs_domid == DOMID_INVALID )
+        return;
+
+    for_each_domain( d )
+    {
+        uint64_t gfn = d-&gt;arch.hvm.params[HVM_PARAM_STORE_PFN];
+        int rc;
+
+        if ( gfn == 0 )
+            continue;
+
+        if ( is_xenstore_domain(d) )
+            continue;
+
+        rc = alloc_xenstore_evtchn(d);
+        if ( rc &lt; 0 )
+            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
+
+        if ( gfn != XENSTORE_PFN_LATE_ALLOC &amp;&amp; IS_ENABLED(CONFIG_GRANT_TABLE) )
+        {
+            ASSERT(gfn &lt; UINT32_MAX);
+            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
+        }
+    }
+}
+
+void __init create_domUs(void)
+{
+    struct dt_device_node *node;
+    const char *dom0less_iommu;
+    bool iommu = false;
+    const struct dt_device_node *cpupool_node,
+                                *chosen = dt_find_node_by_path("/chosen");
+    const char *llc_colors_str = NULL;
+
+    BUG_ON(chosen == NULL);
+    dt_for_each_child_node(chosen, node)
+    {
+        struct domain *d;
+        struct xen_domctl_createdomain d_cfg = {0};
+        unsigned int flags = 0U;
+        bool has_dtb = false;
+        uint32_t val;
+        int rc;
+
+        if ( !dt_device_is_compatible(node, "xen,domain") )
+            continue;
+
+        if ( (max_init_domid + 1) &gt;= DOMID_FIRST_RESERVED )
+            panic("No more domain IDs available\n");
+
+        d_cfg.max_evtchn_port = 1023;
+        d_cfg.max_grant_frames = -1;
+        d_cfg.max_maptrack_frames = -1;
+        d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version);
+
+        if ( dt_property_read_u32(node, "capabilities", &amp;val) )
+        {
+            if ( val &amp; ~DOMAIN_CAPS_MASK )
+                panic("Invalid capabilities (%"PRIx32")\n", val);
+
+            if ( val &amp; DOMAIN_CAPS_CONTROL )
+                flags |= CDF_privileged;
+
+            if ( val &amp; DOMAIN_CAPS_HARDWARE )
+            {
+                if ( hardware_domain )
+                    panic("Only 1 hardware domain can be specified! (%pd)\n",
+                            hardware_domain);
+
+                d_cfg.max_grant_frames = gnttab_dom0_frames();
+                d_cfg.max_evtchn_port = -1;
+                flags |= CDF_hardware;
+                iommu = true;
+            }
+
+            if ( val &amp; DOMAIN_CAPS_XENSTORE )
+            {
+                if ( xs_domid != DOMID_INVALID )
+                    panic("Only 1 xenstore domain can be specified! (%u)\n",
+                            xs_domid);
+
+                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
+                d_cfg.max_evtchn_port = -1;
+            }
+        }
+
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+        {
+            if ( llc_coloring_enabled )
+                panic("LLC coloring and static memory are incompatible\n");
+
+            flags |= CDF_staticmem;
+        }
+
+        if ( dt_property_read_bool(node, "direct-map") )
+        {
+            if ( !(flags &amp; CDF_staticmem) )
+                panic("direct-map is not valid for domain %s without static allocation.\n",
+                      dt_node_name(node));
+
+            flags |= CDF_directmap;
+        }
+
+        if ( !dt_property_read_u32(node, "cpus", &amp;d_cfg.max_vcpus) )
+            panic("Missing property 'cpus' for domain %s\n",
+                  dt_node_name(node));
+
+        if ( !dt_property_read_string(node, "passthrough", &amp;dom0less_iommu) )
+        {
+            if ( flags &amp; CDF_hardware )
+                panic("Don't specify passthrough for hardware domain\n");
+
+            if ( !strcmp(dom0less_iommu, "enabled") )
+                iommu = true;
+        }
+
+        if ( (flags &amp; CDF_hardware) &amp;&amp; !(flags &amp; CDF_directmap) &amp;&amp;
+             !iommu_enabled )
+            panic("non-direct mapped hardware domain requires iommu\n");
+
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+        {
+            if ( flags &amp; CDF_hardware )
+                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
+
+            has_dtb = true;
+        }
+
+        if ( iommu_enabled &amp;&amp; (iommu || has_dtb) )
+            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+
+        /* Get the optional property domain-cpupool */
+        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
+        if ( cpupool_node )
+        {
+            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
+            if ( pool_id &lt; 0 )
+                panic("Error getting cpupool id from domain-cpupool (%d)\n",
+                      pool_id);
+            d_cfg.cpupool_id = pool_id;
+        }
+
+        if ( dt_property_read_u32(node, "max_grant_version", &amp;val) )
+            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+
+        if ( dt_property_read_u32(node, "max_grant_frames", &amp;val) )
+        {
+            if ( val &gt; INT32_MAX )
+                panic("max_grant_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_grant_frames = val;
+        }
+
+        if ( dt_property_read_u32(node, "max_maptrack_frames", &amp;val) )
+        {
+            if ( val &gt; INT32_MAX )
+                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_maptrack_frames = val;
+        }
+
+        dt_property_read_string(node, "llc-colors", &amp;llc_colors_str);
+        if ( !llc_coloring_enabled &amp;&amp; llc_colors_str )
+            panic("'llc-colors' found, but LLC coloring is disabled\n");
+
+        arch_create_domUs(node, &amp;d_cfg, flags);
+
+        /*
+         * The variable max_init_domid is initialized with zero, so here it's
+         * very important to use the pre-increment operator to call
+         * domain_create() with a domid &gt; 0. (domid == 0 is reserved for Dom0)
+         */
+        d = domain_create(++max_init_domid, &amp;d_cfg, flags);
+        if ( IS_ERR(d) )
+            panic("Error creating domain %s (rc = %ld)\n",
+                  dt_node_name(node), PTR_ERR(d));
+
+        if ( llc_coloring_enabled &amp;&amp;
+             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
+            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
+
+        d-&gt;is_console = true;
+        dt_device_set_used_by(node, d-&gt;domain_id);
+
+        rc = construct_domU(d, node);
+        if ( rc )
+            panic("Could not set up domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
+
+        if ( d_cfg.flags &amp; XEN_DOMCTL_CDF_xs_domain )
+            set_xs_domain(d);
+    }
+
+    if ( need_xenstore &amp;&amp; xs_domid == DOMID_INVALID )
+        panic("xenstore requested, but xenstore domain not present\n");
+
+    initialize_domU_xenstore();
+}
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
new file mode 100644
index 0000000000..5655571a66
--- /dev/null
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
+#define __ASM_GENERIC_DOM0LESS_BUILD_H__
+
+#include &lt;xen/stdbool.h&gt;
+
+#ifdef CONFIG_DOM0LESS_BOOT
+
+#include &lt;public/domctl.h&gt;
+
+struct domain;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This declaration needs to be out of the #ifdef CONFIG_DOM0LESS_BOOT
because...


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+struct dt_device_node;
+
+/* TODO: remove both when construct_domU() will be moved to common. */
+#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
+extern bool need_xenstore;
+
+void create_domUs(void);
+bool is_dom0less_mode(void);
+void set_xs_domain(struct domain *d);
+
+int construct_domU(struct domain *d, const struct dt_device_node *node);
+
+void arch_create_domUs(struct dt_device_node *node,
+                       struct xen_domctl_createdomain *d_cfg,
+                       unsigned int flags);
+
+#else /* !CONFIG_DOM0LESS_BOOT */
+
+static inline void create_domUs(void) {}
+static inline bool is_dom0less_mode(void)
+{
+    return false;
+}
+static inline void set_xs_domain(struct domain *d) {}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... of this usage of struct domain *d.


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#endif /* CONFIG_DOM0LESS_BOOT */
+
+#endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.49.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------XhSxytRE3300FoxfdHaztzYN--

