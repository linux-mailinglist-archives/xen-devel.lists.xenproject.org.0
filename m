Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F41AA9154
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 12:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975981.1363253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBtLg-0001yF-Ou; Mon, 05 May 2025 10:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975981.1363253; Mon, 05 May 2025 10:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBtLg-0001w2-LW; Mon, 05 May 2025 10:47:00 +0000
Received: by outflank-mailman (input) for mailman id 975981;
 Mon, 05 May 2025 10:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBtLe-0001vw-3W
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 10:46:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42419709-299e-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 12:46:54 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so704939566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 03:46:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c5a94sm5289446a12.26.2025.05.05.03.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 03:46:52 -0700 (PDT)
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
X-Inumbo-ID: 42419709-299e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746442014; x=1747046814; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A523VmheOzqHsrElYC46Yg580McTffOJTQNKMDCNGOc=;
        b=Yf0aMSoI+TweTIx6teZqLg+NsyL4GbxjqpaM3eUkOz5eBHqDtksHgLAQV+B6VYO4Df
         cHshnBsDWKTMjf36P15IG9mihpeXxRJPGoIJHUomD4JNZLbMcZBrXWz+Y0BPvpAeq+3T
         C+xCpgkrFMlLYnh8EzyO4wNooWNz3iRCm/d4yV9DSTIt8VTuUNSCtfq+4oskJNccT5LE
         WikgpO/uQzZAD876PlqQNSkOkXsLv/DtggrJucbrVvaTrXE4Wt6DKgLZ2lDeXN3dfxZI
         Ak0n7uQiluOFAmd4gABkYO4Ntf8jk486lQvbIPwh9J22T/Djf6vBi8LuhiAJiq9tEXog
         qWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746442014; x=1747046814;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A523VmheOzqHsrElYC46Yg580McTffOJTQNKMDCNGOc=;
        b=VISBU2YeS6FHIXj4PaPJL3pBkdVPaJZWeywtXToRnipdTh/cUQd8OoPMwwFSnrHbIp
         a+H7mmyrI5hfAUJmRuFKZxJX/MdPN/+cA8Haeo64ja9Q3xAPW0+CjfS+E5qnwJ8+KsCZ
         C3S7xXLSWCSoJDwa0Z4naAY/SgT2V3Gp7ySX9AUE5vfvXHbRrimfcWlii3r7LHp3M+DP
         ntp3y4WT7gnDjZfBpKFHBv9cFk39bKofPcPuzp2I41ZmNd5fPPq3aqdFclCHQGpJc7iY
         qI4hSHTlKS5d+ecxkRDUJPHzcC03uHAUibuSfQU/Mc/zNWh26SLqyJY1tQ69dkRbkEym
         AG8A==
X-Gm-Message-State: AOJu0YxHApVIUVHAC42LOhew3+fjInNtxPC+xBfTKD/bmUgQ7fKobXsJ
	trex/o3Flmxs9Oe6l7/BxQQbrGI4GwlcaOw+TRl4qjkCvVZeuF08
X-Gm-Gg: ASbGncvzQ9aFQHPlzUflCIRbI8aLlkPFgX2IdyemgscRBUMchn+vqp29fAl6UL/KMQ8
	jhNqnS91yZlGLm3d2R4BMtrnSdAuxuMRVP5m1AxznbEN4o6mD4vK6rXfx4pMr1gGJWoUfQ2TtBG
	zxt3Vlnd6BsTScbxbMT/RVdR+fuzsQWUOtIULAmo5lSvbuUymrMAbcdz6WEKt/Bhu0UnYhqpw8W
	Xcd8RQ4pXv/C3G0vS9545Utbs75wDxIPklY8u8Cy3NBpC4XHSCz8pSbTAJnfHEjIdgRMpxYz1rU
	svqqGJNwe8W3h8xw/Z+H2pwxM0VwUu0m0B3RGkURhYZofAjGipV1nRs9uZLnM1JnS3hpc1QHIL7
	GHqL16egq8eq635Ut
X-Google-Smtp-Source: AGHT+IEx0z5AzVepwiFPpVFW72O2Q5nLS+hnX+3ELKFvKQx7dF6xIFbYElrxYHMFIT81FabXmO/jUw==
X-Received: by 2002:a17:907:2dab:b0:ac7:95b5:f5d1 with SMTP id a640c23a62f3a-ad19083700dmr725466766b.42.1746442013171;
        Mon, 05 May 2025 03:46:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------5xbHStcDnUr1SCGu0GXO5f1l"
Message-ID: <5523bf0d-a94e-444d-a1fa-035ecccb4448@gmail.com>
Date: Mon, 5 May 2025 12:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] xen/common: dom0less: introduce common
 dom0less-build.c
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <76390ef52f108b580e1c397ed178ceadf1ae53c4.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------5xbHStcDnUr1SCGu0GXO5f1l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/2/25 10:53 PM, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>> Part of Arm's dom0less-build.c could be common between architectures which are
>> using device tree files to create guest domains. Thereby move some parts of
>> Arm's dom0less-build.c to common code with minor changes.
>>
>> As a part of theses changes the following changes are introduced:
>> - Introduce make_arch_nodes() to cover arch-specific nodes. For example, in
>>    case of Arm, it is PSCI and vpl011 nodes.
>> - Introduce set_domain_type() to abstract a way how setting of domain type
>>    happens. For example, RISC-V won't have this member of arch_domain structure
>>    as vCPUs will always have the same bitness as hypervisor. In case of Arm, it
>>    is possible that Arm64 could create 32-bit and 64-bit domains.
>> - Introduce init_vuart() to cover details of virtual uart initialization.
>> - Introduce init_intc_phandle() to cover some details of interrupt controller
>>    phandle initialization. As an example, RISC-V could have different name for
>>    interrupt controller node ( APLIC, PLIC, IMSIC, etc ) but the code in
>>    domain_handle_dtb_bootmodule() could handle only one interrupt controller
>>    node name.
>> - s/make_gic_domU_node/make_intc_domU_node as GIC is Arm specific naming and
>>    add prototype of make_intc_domU_node() to dom0less-build.h
>>
>> The following functions are moved to xen/common/device-tree:
>> - Functions which are moved as is:
>>    - domain_p2m_pages().
>>    - handle_passthrough_prop().
>>    - handle_prop_pfdt().
>>    - scan_pfdt_node().
>>    - check_partial_fdt().
>> - Functions which are moved with some minor changes:
>>    - alloc_xenstore_evtchn():
>>      - ifdef-ing by CONFIG_HVM accesses to hvm.params.
>>    - prepare_dtb_domU():
>>      - ifdef-ing access to gnttab_{start,size} by CONFIG_GRANT_TABLE.
>>      - s/make_gic_domU_node/make_intc_domU_node.
>>      - Add call of make_arch_nodes().
>> - domain_handle_dtb_bootmodule():
>>    - hide details of interrupt controller phandle initialization by calling
>>      init_intc_phandle().
>>    - Update the comment above init_intc_phandle(): s/gic/interrupt controller.
>> - construct_domU():
>>    - ifdef-ing by CONFIG_HVM accesses to hvm.params.
>>    - Call init_vuart() to hide Arm's vpl011_init() details there.
>>    - Add call of set_domain_type() instead of setting kinfo->arch.type explicitly.
>>
>> Some parts of dom0less-build.c are wraped by #ifdef CONFIG_STATIC_{SHMEM,MEMORY}
>> as not all archs support these configs.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> FYI for a possible follow-up patch (doesn't have to be done in this
> patch), the following functions could now be static:
>
> alloc_dom0_vcpu0
> dom0_max_vcpus

I will make them static in follow-up patch in the next patch series version.

>
>
>
>> ---
>> Change in v3:
>>   - Align construct_domU() with the current staging.
>>   - Align alloc_xenstore_params() with the current staging.
>>   - Move defintion of XENSTORE_PFN_LATE_ALLOC to common and
>>     declaration of need_xenstore to common.
>> ---
>> Change in v2:
>>   - Wrap by #ifdef CONFIG_STATIC_* inclusions of <asm/static-memory.h> and
>>     <asm/static-shmem.h>. Wrap also the code which uses something from the
>>     mentioned headers.
>>   - Add handling of legacy case in construct_domU().
>>   - Use xen/fdt-kernel.h and xen/fdt-domain-build.h instead of asm/*.
>>   - Update the commit message.
>> ---
>>   xen/arch/arm/dom0less-build.c            | 714 ++---------------------
>>   xen/common/device-tree/dom0less-build.c  | 699 ++++++++++++++++++++++
>>   xen/include/asm-generic/dom0less-build.h |  18 +-
>>   3 files changed, 751 insertions(+), 680 deletions(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 0310579863..627c212b3b 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -25,8 +25,6 @@
>>   #include <asm/static-memory.h>
>>   #include <asm/static-shmem.h>
>>   
>> -bool __initdata need_xenstore;
>> -
>>   #ifdef CONFIG_VGICV2
>>   static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>>   {
>> @@ -152,7 +150,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>>   }
>>   #endif
>>   
>> -static int __init make_gic_domU_node(struct kernel_info *kinfo)
>> +int __init make_intc_domU_node(struct kernel_info *kinfo)
>>   {
>>       switch ( kinfo->d->arch.vgic.version )
>>       {
>> @@ -218,708 +216,60 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>>   }
>>   #endif
>>   
>> -/*
>> - * Scan device tree properties for passthrough specific information.
>> - * Returns < 0 on error
>> - *         0 on success
>> - */
>> -static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>> -                                          const struct fdt_property *xen_reg,
>> -                                          const struct fdt_property *xen_path,
>> -                                          bool xen_force,
>> -                                          uint32_t address_cells,
>> -                                          uint32_t size_cells)
>> -{
>> -    const __be32 *cell;
>> -    unsigned int i, len;
>> -    struct dt_device_node *node;
>> -    int res;
>> -    paddr_t mstart, size, gstart;
>> -
>> -    /* xen,reg specifies where to map the MMIO region */
>> -    cell = (const __be32 *)xen_reg->data;
>> -    len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>> -                                        sizeof(uint32_t));
>> -
>> -    for ( i = 0; i < len; i++ )
>> -    {
>> -        device_tree_get_reg(&cell, address_cells, size_cells,
>> -                            &mstart, &size);
>> -        gstart = dt_next_cell(address_cells, &cell);
>> -
>> -        if ( gstart & ~PAGE_MASK || mstart & ~PAGE_MASK || size & ~PAGE_MASK )
>> -        {
>> -            printk(XENLOG_ERR
>> -                   "DomU passthrough config has not page aligned addresses/sizes\n");
>> -            return -EINVAL;
>> -        }
>> -
>> -        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
>> -                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
>> -        if ( res )
>> -        {
>> -            printk(XENLOG_ERR "Unable to permit to dom%d access to"
>> -                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>> -                   kinfo->d->domain_id,
>> -                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>> -            return res;
>> -        }
>> -
>> -        res = map_regions_p2mt(kinfo->d,
>> -                               gaddr_to_gfn(gstart),
>> -                               PFN_DOWN(size),
>> -                               maddr_to_mfn(mstart),
>> -                               p2m_mmio_direct_dev);
>> -        if ( res < 0 )
>> -        {
>> -            printk(XENLOG_ERR
>> -                   "Failed to map %"PRIpaddr" to the guest at%"PRIpaddr"\n",
>> -                   mstart, gstart);
>> -            return -EFAULT;
>> -        }
>> -    }
>> -
>> -    /*
>> -     * If xen_force, we let the user assign a MMIO region with no
>> -     * associated path.
>> -     */
>> -    if ( xen_path == NULL )
>> -        return xen_force ? 0 : -EINVAL;
>> -
>> -    /*
>> -     * xen,path specifies the corresponding node in the host DT.
>> -     * Both interrupt mappings and IOMMU settings are based on it,
>> -     * as they are done based on the corresponding host DT node.
>> -     */
>> -    node = dt_find_node_by_path(xen_path->data);
>> -    if ( node == NULL )
>> -    {
>> -        printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
>> -               xen_path->data);
>> -        return -EINVAL;
>> -    }
>> -
>> -    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
>> -    if ( res < 0 )
>> -        return res;
>> -
>> -    res = iommu_add_dt_device(node);
>> -    if ( res < 0 )
>> -        return res;
>> -
>> -    /* If xen_force, we allow assignment of devices without IOMMU protection. */
>> -    if ( xen_force && !dt_device_is_protected(node) )
>> -        return 0;
>> -
>> -    return iommu_assign_dt_device(kinfo->d, node);
>> -}
>> -
>> -static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>> -                                   const void *pfdt, int nodeoff,
>> -                                   uint32_t address_cells, uint32_t size_cells,
>> -                                   bool scan_passthrough_prop)
>> -{
>> -    void *fdt = kinfo->fdt;
>> -    int propoff, nameoff, res;
>> -    const struct fdt_property *prop, *xen_reg = NULL, *xen_path = NULL;
>> -    const char *name;
>> -    bool found, xen_force = false;
>> -
>> -    for ( propoff = fdt_first_property_offset(pfdt, nodeoff);
>> -          propoff >= 0;
>> -          propoff = fdt_next_property_offset(pfdt, propoff) )
>> -    {
>> -        if ( !(prop = fdt_get_property_by_offset(pfdt, propoff, NULL)) )
>> -            return -FDT_ERR_INTERNAL;
>> -
>> -        found = false;
>> -        nameoff = fdt32_to_cpu(prop->nameoff);
>> -        name = fdt_string(pfdt, nameoff);
>> -
>> -        if ( scan_passthrough_prop )
>> -        {
>> -            if ( dt_prop_cmp("xen,reg", name) == 0 )
>> -            {
>> -                xen_reg = prop;
>> -                found = true;
>> -            }
>> -            else if ( dt_prop_cmp("xen,path", name) == 0 )
>> -            {
>> -                xen_path = prop;
>> -                found = true;
>> -            }
>> -            else if ( dt_prop_cmp("xen,force-assign-without-iommu",
>> -                                  name) == 0 )
>> -            {
>> -                xen_force = true;
>> -                found = true;
>> -            }
>> -        }
>> -
>> -        /*
>> -         * Copy properties other than the ones above: xen,reg, xen,path,
>> -         * and xen,force-assign-without-iommu.
>> -         */
>> -        if ( !found )
>> -        {
>> -            res = fdt_property(fdt, name, prop->data, fdt32_to_cpu(prop->len));
>> -            if ( res )
>> -                return res;
>> -        }
>> -    }
>> -
>> -    /*
>> -     * Only handle passthrough properties if both xen,reg and xen,path
>> -     * are present, or if xen,force-assign-without-iommu is specified.
>> -     */
>> -    if ( xen_reg != NULL && (xen_path != NULL || xen_force) )
>> -    {
>> -        res = handle_passthrough_prop(kinfo, xen_reg, xen_path, xen_force,
>> -                                      address_cells, size_cells);
>> -        if ( res < 0 )
>> -        {
>> -            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->d);
>> -            return res;
>> -        }
>> -    }
>> -    else if ( (xen_path && !xen_reg) || (xen_reg && !xen_path && !xen_force) )
>> -    {
>> -        printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
>> -               kinfo->d);
>> -        return -EINVAL;
>> -    }
>> -
>> -    /* FDT_ERR_NOTFOUND => There is no more properties for this node */
>> -    return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
>> -}
>> -
>> -static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>> -                                 int nodeoff,
>> -                                 uint32_t address_cells, uint32_t size_cells,
>> -                                 bool scan_passthrough_prop)
>> -{
>> -    int rc = 0;
>> -    void *fdt = kinfo->fdt;
>> -    int node_next;
>> -
>> -    rc = fdt_begin_node(fdt, fdt_get_name(pfdt, nodeoff, NULL));
>> -    if ( rc )
>> -        return rc;
>> -
>> -    rc = handle_prop_pfdt(kinfo, pfdt, nodeoff, address_cells, size_cells,
>> -                          scan_passthrough_prop);
>> -    if ( rc )
>> -        return rc;
>> -
>> -    address_cells = device_tree_get_u32(pfdt, nodeoff, "#address-cells",
>> -                                        DT_ROOT_NODE_ADDR_CELLS_DEFAULT);
>> -    size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>> -                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>> -
>> -    node_next = fdt_first_subnode(pfdt, nodeoff);
>> -    while ( node_next > 0 )
>> -    {
>> -        rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>> -                            scan_passthrough_prop);
>> -        if ( rc )
>> -            return rc;
>> -
>> -        node_next = fdt_next_subnode(pfdt, node_next);
>> -    }
>> -
>> -    return fdt_end_node(fdt);
>> -}
>> -
>> -static int __init check_partial_fdt(void *pfdt, size_t size)
>> +int __init make_arch_nodes(struct kernel_info *kinfo)
>>   {
>> -    int res;
>> -
>> -    if ( fdt_magic(pfdt) != FDT_MAGIC )
>> -    {
>> -        dprintk(XENLOG_ERR, "Partial FDT is not a valid Flat Device Tree");
>> -        return -EINVAL;
>> -    }
>> -
>> -    res = fdt_check_header(pfdt);
>> -    if ( res )
>> -    {
>> -        dprintk(XENLOG_ERR, "Failed to check the partial FDT (%d)", res);
>> -        return -EINVAL;
>> -    }
>> -
>> -    if ( fdt_totalsize(pfdt) > size )
>> -    {
>> -        dprintk(XENLOG_ERR, "Partial FDT totalsize is too big");
>> -        return -EINVAL;
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -static int __init domain_handle_dtb_bootmodule(struct domain *d,
>> -                                               struct kernel_info *kinfo)
>> -{
>> -    void *pfdt;
>> -    int res, node_next;
>> -
>> -    pfdt = ioremap_cache(kinfo->dtb_bootmodule->start,
>> -                         kinfo->dtb_bootmodule->size);
>> -    if ( pfdt == NULL )
>> -        return -EFAULT;
>> -
>> -    res = check_partial_fdt(pfdt, kinfo->dtb_bootmodule->size);
>> -    if ( res < 0 )
>> -        goto out;
>> -
>> -    for ( node_next = fdt_first_subnode(pfdt, 0);
>> -          node_next > 0;
>> -          node_next = fdt_next_subnode(pfdt, node_next) )
>> -    {
>> -        const char *name = fdt_get_name(pfdt, node_next, NULL);
>> -
>> -        if ( name == NULL )
>> -            continue;
>> -
>> -        /*
>> -         * Only scan /gic /aliases /passthrough, ignore the rest.
>> -         * They don't have to be parsed in order.
>> -         *
>> -         * Take the GIC phandle value from the special /gic node in the
>> -         * DTB fragment.
>> -         */
>> -        if ( dt_node_cmp(name, "gic") == 0 )
>> -        {
>> -            uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
>> -
>> -            if ( phandle_intc != 0 )
>> -                kinfo->phandle_intc = phandle_intc;
>> -            continue;
>> -        }
>> -
>> -        if ( dt_node_cmp(name, "aliases") == 0 )
>> -        {
>> -            res = scan_pfdt_node(kinfo, pfdt, node_next,
>> -                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>> -                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 false);
>> -            if ( res )
>> -                goto out;
>> -            continue;
>> -        }
>> -        if ( dt_node_cmp(name, "passthrough") == 0 )
>> -        {
>> -            res = scan_pfdt_node(kinfo, pfdt, node_next,
>> -                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>> -                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 true);
>> -            if ( res )
>> -                goto out;
>> -            continue;
>> -        }
>> -    }
>> -
>> - out:
>> -    iounmap(pfdt);
>> -
>> -    return res;
>> -}
>> -
>> -/*
>> - * The max size for DT is 2MB. However, the generated DT is small (not including
>> - * domU passthrough DT nodes whose size we account separately), 4KB are enough
>> - * for now, but we might have to increase it in the future.
>> - */
>> -#define DOMU_DTB_SIZE 4096
>> -static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>> -{
>> -    int addrcells, sizecells;
>> -    int ret, fdt_size = DOMU_DTB_SIZE;
>> -
>> -    kinfo->phandle_intc = GUEST_PHANDLE_GIC;
>> -    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
>> -    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
>> -
>> -    addrcells = GUEST_ROOT_ADDRESS_CELLS;
>> -    sizecells = GUEST_ROOT_SIZE_CELLS;
>> -
>> -    /* Account for domU passthrough DT size */
>> -    if ( kinfo->dtb_bootmodule )
>> -        fdt_size += kinfo->dtb_bootmodule->size;
>> -
>> -    /* Cap to max DT size if needed */
>> -    fdt_size = min(fdt_size, SZ_2M);
>> -
>> -    kinfo->fdt = xmalloc_bytes(fdt_size);
>> -    if ( kinfo->fdt == NULL )
>> -        return -ENOMEM;
>> -
>> -    ret = fdt_create(kinfo->fdt, fdt_size);
>> -    if ( ret < 0 )
>> -        goto err;
>> -
>> -    ret = fdt_finish_reservemap(kinfo->fdt);
>> -    if ( ret < 0 )
>> -        goto err;
>> -
>> -    ret = fdt_begin_node(kinfo->fdt, "");
>> -    if ( ret < 0 )
>> -        goto err;
>> -
>> -    ret = fdt_property_cell(kinfo->fdt, "#address-cells", addrcells);
>> -    if ( ret )
>> -        goto err;
>> -
>> -    ret = fdt_property_cell(kinfo->fdt, "#size-cells", sizecells);
>> -    if ( ret )
>> -        goto err;
>> -
>> -    ret = make_chosen_node(kinfo);
>> -    if ( ret )
>> -        goto err;
>> +    int ret;
>>   
>>       ret = make_psci_node(kinfo->fdt);
>>       if ( ret )
>> -        goto err;
>> -
>> -    ret = make_cpus_node(d, kinfo->fdt);
>> -    if ( ret )
>> -        goto err;
>> -
>> -    ret = make_memory_node(kinfo, addrcells, sizecells,
>> -                           kernel_info_get_mem(kinfo));
>> -    if ( ret )
>> -        goto err;
>> -
>> -    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
>> -    if ( ret )
>> -        goto err;
>> -
>> -    /*
>> -     * domain_handle_dtb_bootmodule has to be called before the rest of
>> -     * the device tree is generated because it depends on the value of
>> -     * the field phandle_intc.
>> -     */
>> -    if ( kinfo->dtb_bootmodule )
>> -    {
>> -        ret = domain_handle_dtb_bootmodule(d, kinfo);
>> -        if ( ret )
>> -            goto err;
>> -    }
>> -
>> -    ret = make_gic_domU_node(kinfo);
>> -    if ( ret )
>> -        goto err;
>> -
>> -    ret = make_timer_node(kinfo);
>> -    if ( ret )
>> -        goto err;
>> +        return -EINVAL;
>>   
>>       if ( kinfo->vuart )
>>       {
>> -        ret = -EINVAL;
>>   #ifdef CONFIG_SBSA_VUART_CONSOLE
>>           ret = make_vpl011_uart_node(kinfo);
>>   #endif
>>           if ( ret )
>> -            goto err;
>> -    }
>> -
>> -    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>> -    {
>> -        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
>> -        if ( ret )
>> -            goto err;
>> +            return -EINVAL;
>>       }
>>   
>> -    ret = fdt_end_node(kinfo->fdt);
>> -    if ( ret < 0 )
>> -        goto err;
>> -
>> -    ret = fdt_finish(kinfo->fdt);
>> -    if ( ret < 0 )
>> -        goto err;
>> -
>>       return 0;
>> -
>> -  err:
>> -    printk("Device tree generation failed (%d).\n", ret);
>> -    xfree(kinfo->fdt);
>> -
>> -    return -EINVAL;
>>   }
>>   
>> -#define XENSTORE_PFN_OFFSET 1
>> -static int __init alloc_xenstore_page(struct domain *d)
>> +/* TODO: make arch.type generic ? */
>> +#ifdef CONFIG_ARM_64
>> +void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>>   {
>> -    struct page_info *xenstore_pg;
>> -    struct xenstore_domain_interface *interface;
>> -    mfn_t mfn;
>> -    gfn_t gfn;
>> -    int rc;
>> -
>> -    if ( (UINT_MAX - d->max_pages) < 1 )
>> -    {
>> -        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
>> -               d);
>> -        return -EINVAL;
>> -    }
>> -
>> -    d->max_pages += 1;
>> -    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
>> -    if ( xenstore_pg == NULL && is_64bit_domain(d) )
>> -        xenstore_pg = alloc_domheap_page(d, 0);
>> -    if ( xenstore_pg == NULL )
>> -        return -ENOMEM;
>> -
>> -    mfn = page_to_mfn(xenstore_pg);
>> -    if ( !mfn_x(mfn) )
>> -        return -ENOMEM;
>> -
>> -    if ( !is_domain_direct_mapped(d) )
>> -        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
>> -                           (XENSTORE_PFN_OFFSET << PAGE_SHIFT));
>> -    else
>> -        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
>> -
>> -    rc = guest_physmap_add_page(d, gfn, mfn, 0);
>> -    if ( rc )
>> -    {
>> -        free_domheap_page(xenstore_pg);
>> -        return rc;
>> -    }
>> -
>> -    d->arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
>> -    interface = map_domain_page(mfn);
>> -    interface->connection = XENSTORE_RECONNECT;
>> -    unmap_domain_page(interface);
>> -
>> -    return 0;
>> +    /* type must be set before allocate memory */
>> +    d->arch.type = kinfo->arch.type;
>>   }
>> -
>> -static int __init alloc_xenstore_params(struct kernel_info *kinfo)
>> +#else
>> +void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
>>   {
>> -    struct domain *d = kinfo->d;
>> -    int rc = 0;
>> -
>> -    if ( (kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
>> -                                 == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
>> -        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = XENSTORE_PFN_LATE_ALLOC;
>> -    else if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
>> -    {
>> -        rc = alloc_xenstore_page(d);
>> -        if ( rc < 0 )
>> -            return rc;
>> -    }
>> -
>> -    return rc;
>> +    /* Nothing to do */
>>   }
>> +#endif
>>   
>> -static void __init domain_vcpu_affinity(struct domain *d,
>> -                                        const struct dt_device_node *node)
>> +int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
>> +                      const struct dt_device_node *node)
>>   {
>> -    struct dt_device_node *np;
>> -
>> -    dt_for_each_child_node(node, np)
>> -    {
>> -        const char *hard_affinity_str = NULL;
>> -        uint32_t val;
>> -        int rc;
>> -        struct vcpu *v;
>> -        cpumask_t affinity;
>> -
>> -        if ( !dt_device_is_compatible(np, "xen,vcpu") )
>> -            continue;
>> -
>> -        if ( !dt_property_read_u32(np, "id", &val) )
>> -            panic("Invalid xen,vcpu node for domain %s\n", dt_node_name(node));
>> -
>> -        if ( val >= d->max_vcpus )
>> -            panic("Invalid vcpu_id %u for domain %s, max_vcpus=%u\n", val,
>> -                  dt_node_name(node), d->max_vcpus);
>> -
>> -        v = d->vcpu[val];
>> -        rc = dt_property_read_string(np, "hard-affinity", &hard_affinity_str);
>> -        if ( rc < 0 )
>> -            continue;
>> -
>> -        cpumask_clear(&affinity);
>> -        while ( *hard_affinity_str != '\0' )
>> -        {
>> -            unsigned int start, end;
>> -
>> -            start = simple_strtoul(hard_affinity_str, &hard_affinity_str, 0);
>> -
>> -            if ( *hard_affinity_str == '-' )    /* Range */
>> -            {
>> -                hard_affinity_str++;
>> -                end = simple_strtoul(hard_affinity_str, &hard_affinity_str, 0);
>> -            }
>> -            else                /* Single value */
>> -                end = start;
>> -
>> -            if ( end >= nr_cpu_ids )
>> -                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
>> -
>> -            for ( ; start <= end; start++ )
>> -                cpumask_set_cpu(start, &affinity);
>> -
>> -            if ( *hard_affinity_str == ',' )
>> -                hard_affinity_str++;
>> -            else if ( *hard_affinity_str != '\0' )
>> -                break;
>> -        }
>> +    int rc = 0;
>>   
>> -        rc = vcpu_set_hard_affinity(v, &affinity);
>> -        if ( rc )
>> -            panic("vcpu%d: failed (rc=%d) to set hard affinity for domain %s\n",
>> -                  v->vcpu_id, rc, dt_node_name(node));
>> -    }
>> -}
>> +    kinfo->vuart = dt_property_read_bool(node, "vpl011");
>>   
>> -#ifdef CONFIG_ARCH_PAGING_MEMPOOL
>> -static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
>> -                                             unsigned int smp_cpus)
>> -{
>>       /*
>> -     * Keep in sync with libxl__get_required_paging_memory().
>> -     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
>> -     * plus 128 pages to cover extended regions.
>> +     * Base address and irq number are needed when creating vpl011 device
>> +     * tree node in prepare_dtb_domU, so initialization on related variables
>> +     * shall be done first.
>>        */
>> -    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
>> -
>> -    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>> -
>> -    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>> -}
>> -
>> -static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>> -                                            const struct dt_device_node *node)
>> -{
>> -    unsigned long p2m_pages;
>> -    uint32_t p2m_mem_mb;
>> -    int rc;
>> -
>> -    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
>> -    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
>> -    p2m_pages = rc ?
>> -                p2m_mem_mb << (20 - PAGE_SHIFT) :
>> -                domain_p2m_pages(mem, d->max_vcpus);
>> -
>> -    spin_lock(&d->arch.paging.lock);
>> -    rc = p2m_set_allocation(d, p2m_pages, NULL);
>> -    spin_unlock(&d->arch.paging.lock);
>> -
>> -    return rc;
>> -}
>> -#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
>> -static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>> -                                            const struct dt_device_node *node)
>> -{
>> -    return 0;
>> -}
>> -#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
>> -
>> -int __init construct_domU(struct domain *d,
>> -                          const struct dt_device_node *node)
>> -{
>> -    struct kernel_info kinfo = KERNEL_INFO_INIT;
>> -    const char *dom0less_enhanced;
>> -    int rc;
>> -    u64 mem;
>> -
>> -    rc = dt_property_read_u64(node, "memory", &mem);
>> -    if ( !rc )
>> -    {
>> -        printk("Error building DomU: cannot read \"memory\" property\n");
>> -        return -EINVAL;
>> -    }
>> -    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
>> -
>> -    rc = domain_p2m_set_allocation(d, mem, node);
>> -    if ( rc != 0 )
>> -        return rc;
>> -
>> -    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
>> -           d->max_vcpus, mem);
>> -
>> -    kinfo.vuart = dt_property_read_bool(node, "vpl011");
>> -    if ( kinfo.vuart && is_hardware_domain(d) )
>> -        panic("hardware domain cannot specify vpl011\n");
>> -
>> -    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
>> -    if ( rc == -EILSEQ ||
>> -         rc == -ENODATA ||
>> -         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
>> -    {
>> -        need_xenstore = true;
>> -        kinfo.dom0less_feature = DOM0LESS_ENHANCED;
>> -    }
>> -    else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
>> -    {
>> -        need_xenstore = true;
>> -        kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
>> -    }
>> -    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>> -        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>> -
>> -    if ( vcpu_create(d, 0) == NULL )
>> -        return -ENOMEM;
>> -
>> -    d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
>> -
>> -    kinfo.d = d;
>> -
>> -    rc = kernel_probe(&kinfo, node);
>> -    if ( rc < 0 )
>> -        return rc;
>> -
>> -#ifdef CONFIG_ARM_64
>> -    /* type must be set before allocate memory */
>> -    d->arch.type = kinfo.arch.type;
>> -#endif
>> -    if ( is_hardware_domain(d) )
>> -    {
>> -        rc = construct_hwdom(&kinfo, node);
>> -        if ( rc < 0 )
>> -            return rc;
>> -    }
> I think we should retain this chunk in the code movement. It is OK if it
> is behind a #ifdef CONFIG_ARM.

I'll is_hardware_domain() handling. I think it can be without #ifdef, it seems to me
it is a good thing to re-use construct_hwdom() in the case of creation of h/w domain.

>
>
>> -    else
>> +    if ( kinfo->vuart )
>>       {
>> -        if ( !dt_find_property(node, "xen,static-mem", NULL) )
>> -            allocate_memory(d, &kinfo);
>> -        else if ( !is_domain_direct_mapped(d) )
>> -            allocate_static_memory(d, &kinfo, node);
>> -        else
>> -            assign_static_memory_11(d, &kinfo, node);
>> -
>> -        rc = process_shm(d, &kinfo, node);
>> -        if ( rc < 0 )
>> -            return rc;
>> -
>> -        /*
>> -         * Base address and irq number are needed when creating vpl011 device
>> -         * tree node in prepare_dtb_domU, so initialization on related variables
>> -         * shall be done first.
>> -         */
>> -        if ( kinfo.vuart )
>> -        {
>> -            rc = domain_vpl011_init(d, NULL);
>> -            if ( rc < 0 )
>> -                return rc;
>> -        }
>> -
>> -        rc = prepare_dtb_domU(d, &kinfo);
>> -        if ( rc < 0 )
>> -            return rc;
>> -
>> -        rc = construct_domain(d, &kinfo);
>> +        rc = domain_vpl011_init(d, NULL);
>>           if ( rc < 0 )
>>               return rc;
>>       }
>>   
>> -    domain_vcpu_affinity(d, node);
>> -
>> -    return alloc_xenstore_params(&kinfo);
>> +    return rc;
>>   }
>>   
>>   void __init arch_create_domUs(struct dt_device_node *node,
>> @@ -995,6 +345,22 @@ void __init arch_create_domUs(struct dt_device_node *node,
>>       }
>>   }
>>   
>> +int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
>> +                             const int node_next, const void *pfdt)
>> +{
>> +    if ( dt_node_cmp(name, "gic") == 0 )
>> +    {
>> +        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
>> +
>> +        if ( phandle_intc != 0 )
>> +            kinfo->phandle_intc = phandle_intc;
>> +
>> +        return 0;
>> +    }
>> +
>> +    return 1;
>> +}
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index a01a8b6b1a..c3face5b90 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -3,24 +3,43 @@
>>   #include <xen/bootfdt.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/domain.h>
>> +#include <xen/domain_page.h>
>>   #include <xen/err.h>
>>   #include <xen/event.h>
>> +#include <xen/fdt-domain-build.h>
>> +#include <xen/fdt-kernel.h>
>>   #include <xen/grant_table.h>
>>   #include <xen/init.h>
>> +#include <xen/iocap.h>
>>   #include <xen/iommu.h>
>> +#include <xen/libfdt/libfdt.h>
>>   #include <xen/llc-coloring.h>
>> +#include <xen/sizes.h>
>>   #include <xen/sched.h>
>>   #include <xen/stdbool.h>
>>   #include <xen/types.h>
>> +#include <xen/vmap.h>
>>   
>>   #include <public/bootfdt.h>
>>   #include <public/domctl.h>
>>   #include <public/event_channel.h>
>> +#include <public/io/xs_wire.h>
>>   
>>   #include <asm/dom0less-build.h>
>>   #include <asm/setup.h>
>>   
>> +#ifdef CONFIG_STATIC_MEMORY
>> +#include <asm/static-memory.h>
>> +#endif
> #if __has_include ?
>
>
>> +#ifdef CONFIG_STATIC_SHM
>> +#include <asm/static-shmem.h>
>> +#endif
> Same here?

I thought that if we have already some CONFIG_* then it is better to use #ifdef, but I am okay with
changing it to __has_include.

>
>
>> +#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>> +
>>   static domid_t __initdata xs_domid = DOMID_INVALID;
>> +static bool __initdata need_xenstore;
>>   
>>   void __init set_xs_domain(struct domain *d)
>>   {
>> @@ -109,6 +128,686 @@ static void __init initialize_domU_xenstore(void)
>>       }
>>   }
>>   
>> +/*
>> + * Scan device tree properties for passthrough specific information.
>> + * Returns < 0 on error
>> + *         0 on success
>> + */
>> +static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>> +                                          const struct fdt_property *xen_reg,
>> +                                          const struct fdt_property *xen_path,
>> +                                          bool xen_force,
>> +                                          uint32_t address_cells,
>> +                                          uint32_t size_cells)
>> +{
>> +    const __be32 *cell;
>> +    unsigned int i, len;
>> +    struct dt_device_node *node;
>> +    int res;
>> +    paddr_t mstart, size, gstart;
>> +
>> +    /* xen,reg specifies where to map the MMIO region */
>> +    cell = (const __be32 *)xen_reg->data;
>> +    len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>> +                                        sizeof(uint32_t));
>> +
>> +    for ( i = 0; i < len; i++ )
>> +    {
>> +        device_tree_get_reg(&cell, address_cells, size_cells,
>> +                            &mstart, &size);
>> +        gstart = dt_next_cell(address_cells, &cell);
>> +
>> +        if ( gstart & ~PAGE_MASK || mstart & ~PAGE_MASK || size & ~PAGE_MASK )
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "DomU passthrough config has not page aligned addresses/sizes\n");
>> +            return -EINVAL;
>> +        }
>> +
>> +        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
>> +                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_ERR "Unable to permit to dom%d access to"
>> +                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>> +                   kinfo->d->domain_id,
>> +                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>> +            return res;
>> +        }
>> +
>> +        res = map_regions_p2mt(kinfo->d,
>> +                               gaddr_to_gfn(gstart),
>> +                               PFN_DOWN(size),
>> +                               maddr_to_mfn(mstart),
>> +                               p2m_mmio_direct_dev);
>> +        if ( res < 0 )
>> +        {
>> +            printk(XENLOG_ERR
>> +                   "Failed to map %"PRIpaddr" to the guest at%"PRIpaddr"\n",
>> +                   mstart, gstart);
>> +            return -EFAULT;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * If xen_force, we let the user assign a MMIO region with no
>> +     * associated path.
>> +     */
>> +    if ( xen_path == NULL )
>> +        return xen_force ? 0 : -EINVAL;
>> +
>> +    /*
>> +     * xen,path specifies the corresponding node in the host DT.
>> +     * Both interrupt mappings and IOMMU settings are based on it,
>> +     * as they are done based on the corresponding host DT node.
>> +     */
>> +    node = dt_find_node_by_path(xen_path->data);
>> +    if ( node == NULL )
>> +    {
>> +        printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
>> +               xen_path->data);
>> +        return -EINVAL;
>> +    }
>> +
>> +    res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
>> +    if ( res < 0 )
>> +        return res;
>> +
>> +    res = iommu_add_dt_device(node);
>> +    if ( res < 0 )
>> +        return res;
>> +
>> +    /* If xen_force, we allow assignment of devices without IOMMU protection. */
>> +    if ( xen_force && !dt_device_is_protected(node) )
>> +        return 0;
>> +
>> +    return iommu_assign_dt_device(kinfo->d, node);
>> +}
>> +
>> +static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>> +                                   const void *pfdt, int nodeoff,
>> +                                   uint32_t address_cells, uint32_t size_cells,
>> +                                   bool scan_passthrough_prop)
>> +{
>> +    void *fdt = kinfo->fdt;
>> +    int propoff, nameoff, res;
>> +    const struct fdt_property *prop, *xen_reg = NULL, *xen_path = NULL;
>> +    const char *name;
>> +    bool found, xen_force = false;
>> +
>> +    for ( propoff = fdt_first_property_offset(pfdt, nodeoff);
>> +          propoff >= 0;
>> +          propoff = fdt_next_property_offset(pfdt, propoff) )
>> +    {
>> +        if ( !(prop = fdt_get_property_by_offset(pfdt, propoff, NULL)) )
>> +            return -FDT_ERR_INTERNAL;
>> +
>> +        found = false;
>> +        nameoff = fdt32_to_cpu(prop->nameoff);
>> +        name = fdt_string(pfdt, nameoff);
>> +
>> +        if ( scan_passthrough_prop )
>> +        {
>> +            if ( dt_prop_cmp("xen,reg", name) == 0 )
>> +            {
>> +                xen_reg = prop;
>> +                found = true;
>> +            }
>> +            else if ( dt_prop_cmp("xen,path", name) == 0 )
>> +            {
>> +                xen_path = prop;
>> +                found = true;
>> +            }
>> +            else if ( dt_prop_cmp("xen,force-assign-without-iommu",
>> +                                  name) == 0 )
>> +            {
>> +                xen_force = true;
>> +                found = true;
>> +            }
>> +        }
>> +
>> +        /*
>> +         * Copy properties other than the ones above: xen,reg, xen,path,
>> +         * and xen,force-assign-without-iommu.
>> +         */
>> +        if ( !found )
>> +        {
>> +            res = fdt_property(fdt, name, prop->data, fdt32_to_cpu(prop->len));
>> +            if ( res )
>> +                return res;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * Only handle passthrough properties if both xen,reg and xen,path
>> +     * are present, or if xen,force-assign-without-iommu is specified.
>> +     */
>> +    if ( xen_reg != NULL && (xen_path != NULL || xen_force) )
>> +    {
>> +        res = handle_passthrough_prop(kinfo, xen_reg, xen_path, xen_force,
>> +                                      address_cells, size_cells);
>> +        if ( res < 0 )
>> +        {
>> +            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo->d);
>> +            return res;
>> +        }
>> +    }
>> +    else if ( (xen_path && !xen_reg) || (xen_reg && !xen_path && !xen_force) )
>> +    {
>> +        printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
>> +               kinfo->d);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* FDT_ERR_NOTFOUND => There is no more properties for this node */
>> +    return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
>> +}
>> +
>> +static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>> +                                 int nodeoff,
>> +                                 uint32_t address_cells, uint32_t size_cells,
>> +                                 bool scan_passthrough_prop)
>> +{
>> +    int rc = 0;
>> +    void *fdt = kinfo->fdt;
>> +    int node_next;
>> +
>> +    rc = fdt_begin_node(fdt, fdt_get_name(pfdt, nodeoff, NULL));
>> +    if ( rc )
>> +        return rc;
>> +
>> +    rc = handle_prop_pfdt(kinfo, pfdt, nodeoff, address_cells, size_cells,
>> +                          scan_passthrough_prop);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    address_cells = device_tree_get_u32(pfdt, nodeoff, "#address-cells",
>> +                                        DT_ROOT_NODE_ADDR_CELLS_DEFAULT);
>> +    size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
>> +                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
>> +
>> +    node_next = fdt_first_subnode(pfdt, nodeoff);
>> +    while ( node_next > 0 )
>> +    {
>> +        rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>> +                            scan_passthrough_prop);
>> +        if ( rc )
>> +            return rc;
>> +
>> +        node_next = fdt_next_subnode(pfdt, node_next);
>> +    }
>> +
>> +    return fdt_end_node(fdt);
>> +}
>> +
>> +static int __init check_partial_fdt(void *pfdt, size_t size)
>> +{
>> +    int res;
>> +
>> +    if ( fdt_magic(pfdt) != FDT_MAGIC )
>> +    {
>> +        dprintk(XENLOG_ERR, "Partial FDT is not a valid Flat Device Tree");
>> +        return -EINVAL;
>> +    }
>> +
>> +    res = fdt_check_header(pfdt);
>> +    if ( res )
>> +    {
>> +        dprintk(XENLOG_ERR, "Failed to check the partial FDT (%d)", res);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( fdt_totalsize(pfdt) > size )
>> +    {
>> +        dprintk(XENLOG_ERR, "Partial FDT totalsize is too big");
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init domain_handle_dtb_bootmodule(struct domain *d,
>> +                                               struct kernel_info *kinfo)
>> +{
>> +    void *pfdt;
>> +    int res, node_next;
>> +
>> +    pfdt = ioremap_cache(kinfo->dtb_bootmodule->start,
>> +                         kinfo->dtb_bootmodule->size);
>> +    if ( pfdt == NULL )
>> +        return -EFAULT;
>> +
>> +    res = check_partial_fdt(pfdt, kinfo->dtb_bootmodule->size);
>> +    if ( res < 0 )
>> +        goto out;
>> +
>> +    for ( node_next = fdt_first_subnode(pfdt, 0);
>> +          node_next > 0;
>> +          node_next = fdt_next_subnode(pfdt, node_next) )
>> +    {
>> +        const char *name = fdt_get_name(pfdt, node_next, NULL);
>> +
>> +        if ( name == NULL )
>> +            continue;
>> +
>> +        /*
>> +         * Only scan /$(interrupt_controller) /aliases /passthrough,
>> +         * ignore the rest.
>> +         * They don't have to be parsed in order.
>> +         *
>> +         * Take the interrupt controller phandle value from the special
>> +         * interrupt controller node in the DTB fragment.
>> +         */
>> +        if ( init_intc_phandle(kinfo, name, node_next, pfdt) == 0 )
>> +            continue;
>> +
>> +        if ( dt_node_cmp(name, "aliases") == 0 )
>> +        {
>> +            res = scan_pfdt_node(kinfo, pfdt, node_next,
>> +                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>> +                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> +                                 false);
>> +            if ( res )
>> +                goto out;
>> +            continue;
>> +        }
>> +        if ( dt_node_cmp(name, "passthrough") == 0 )
>> +        {
>> +            res = scan_pfdt_node(kinfo, pfdt, node_next,
>> +                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>> +                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> +                                 true);
>> +            if ( res )
>> +                goto out;
>> +            continue;
>> +        }
>> +    }
>> +
>> + out:
>> +    iounmap(pfdt);
>> +
>> +    return res;
>> +}
>> +
>> +/*
>> + * The max size for DT is 2MB. However, the generated DT is small (not including
>> + * domU passthrough DT nodes whose size we account separately), 4KB are enough
>> + * for now, but we might have to increase it in the future.
>> + */
>> +#define DOMU_DTB_SIZE 4096
>> +static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>> +{
>> +    int addrcells, sizecells;
>> +    int ret, fdt_size = DOMU_DTB_SIZE;
>> +
>> +    kinfo->phandle_intc = GUEST_PHANDLE_GIC;
>> +
>> +#ifdef CONFIG_GRANT_TABLE
>> +    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
>> +    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
>> +#endif
>> +
>> +    addrcells = GUEST_ROOT_ADDRESS_CELLS;
>> +    sizecells = GUEST_ROOT_SIZE_CELLS;
>> +
>> +    /* Account for domU passthrough DT size */
>> +    if ( kinfo->dtb_bootmodule )
>> +        fdt_size += kinfo->dtb_bootmodule->size;
>> +
>> +    /* Cap to max DT size if needed */
>> +    fdt_size = min(fdt_size, SZ_2M);
>> +
>> +    kinfo->fdt = xmalloc_bytes(fdt_size);
>> +    if ( kinfo->fdt == NULL )
>> +        return -ENOMEM;
>> +
>> +    ret = fdt_create(kinfo->fdt, fdt_size);
>> +    if ( ret < 0 )
>> +        goto err;
>> +
>> +    ret = fdt_finish_reservemap(kinfo->fdt);
>> +    if ( ret < 0 )
>> +        goto err;
>> +
>> +    ret = fdt_begin_node(kinfo->fdt, "");
>> +    if ( ret < 0 )
>> +        goto err;
>> +
>> +    ret = fdt_property_cell(kinfo->fdt, "#address-cells", addrcells);
>> +    if ( ret )
>> +        goto err;
>> +
>> +    ret = fdt_property_cell(kinfo->fdt, "#size-cells", sizecells);
>> +    if ( ret )
>> +        goto err;
>> +
>> +    ret = make_chosen_node(kinfo);
>> +    if ( ret )
>> +        goto err;
>> +
>> +    ret = make_cpus_node(d, kinfo->fdt);
>> +    if ( ret )
>> +        goto err;
>> +
>> +    ret = make_memory_node(kinfo, addrcells, sizecells,
>> +                           kernel_info_get_mem(kinfo));
>> +    if ( ret )
>> +        goto err;
>> +
>> +#ifdef CONFIG_STATIC_SHM
> This should not be necessary because there is a stub implementation of
> make_resv_memory_node available in static-shmem.h for the
> !CONFIG_STATIC_SHM case.

But static-shmem.h isn't available on all architectures. Until static-shmem.h isn't moved to
asm-generic or xen folders and then re-used by an architecture we have to have #ifdef.

>
>
>> +    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
>> +    if ( ret )
>> +        goto err;
>> +#endif
>> +
>> +    /*
>> +     * domain_handle_dtb_bootmodule has to be called before the rest of
>> +     * the device tree is generated because it depends on the value of
>> +     * the field phandle_intc.
>> +     */
>> +    if ( kinfo->dtb_bootmodule )
>> +    {
>> +        ret = domain_handle_dtb_bootmodule(d, kinfo);
>> +        if ( ret )
>> +            goto err;
>> +    }
>> +
>> +    ret = make_intc_domU_node(kinfo);
>> +    if ( ret )
>> +        goto err;
>> +
>> +    ret = make_timer_node(kinfo);
>> +    if ( ret )
>> +        goto err;
>> +
>> +    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>> +    {
>> +        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
>> +        if ( ret )
>> +            goto err;
>> +    }
>> +
>> +    ret = make_arch_nodes(kinfo);
>> +    if ( ret )
>> +        goto err;
>> +
>> +    ret = fdt_end_node(kinfo->fdt);
>> +    if ( ret < 0 )
>> +        goto err;
>> +
>> +    ret = fdt_finish(kinfo->fdt);
>> +    if ( ret < 0 )
>> +        goto err;
>> +
>> +    return 0;
>> +
>> +  err:
>> +    printk("Device tree generation failed (%d).\n", ret);
>> +    xfree(kinfo->fdt);
>> +
>> +    return -EINVAL;
>> +}
>> +
>> +#define XENSTORE_PFN_OFFSET 1
>> +static int __init alloc_xenstore_page(struct domain *d)
>> +{
>> +    struct page_info *xenstore_pg;
>> +    struct xenstore_domain_interface *interface;
>> +    mfn_t mfn;
>> +    gfn_t gfn;
>> +    int rc;
>> +
>> +    if ( (UINT_MAX - d->max_pages) < 1 )
>> +    {
>> +        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
>> +               d);
>> +        return -EINVAL;
>> +    }
>> +
>> +    d->max_pages += 1;
>> +    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
>> +    if ( xenstore_pg == NULL && is_64bit_domain(d) )
>> +        xenstore_pg = alloc_domheap_page(d, 0);
>> +    if ( xenstore_pg == NULL )
>> +        return -ENOMEM;
>> +
>> +    mfn = page_to_mfn(xenstore_pg);
>> +    if ( !mfn_x(mfn) )
>> +        return -ENOMEM;
>> +
>> +    if ( !is_domain_direct_mapped(d) )
>> +        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
>> +                           (XENSTORE_PFN_OFFSET << PAGE_SHIFT));
>> +    else
>> +        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
>> +
>> +    rc = guest_physmap_add_page(d, gfn, mfn, 0);
>> +    if ( rc )
>> +    {
>> +        free_domheap_page(xenstore_pg);
>> +        return rc;
>> +    }
>> +
>> +#ifdef CONFIG_HVM
>> +    d->arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
>> +#endif
>> +    interface = map_domain_page(mfn);
>> +    interface->connection = XENSTORE_RECONNECT;
>> +    unmap_domain_page(interface);
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init alloc_xenstore_params(struct kernel_info *kinfo)
>> +{
>> +    struct domain *d = kinfo->d;
>> +    int rc = 0;
>> +
>> +#ifdef CONFIG_HVM
>> +    if ( (kinfo->dom0less_feature & (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
>> +                                 == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
>> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = XENSTORE_PFN_LATE_ALLOC;
>> +    else
>> +#endif
>> +    if ( kinfo->dom0less_feature & DOM0LESS_XENSTORE )
>> +    {
>> +        rc = alloc_xenstore_page(d);
>> +        if ( rc < 0 )
>> +            return rc;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +static void __init domain_vcpu_affinity(struct domain *d,
>> +                                        const struct dt_device_node *node)
>> +{
>> +    struct dt_device_node *np;
>> +
>> +    dt_for_each_child_node(node, np)
>> +    {
>> +        const char *hard_affinity_str = NULL;
>> +        uint32_t val;
>> +        int rc;
>> +        struct vcpu *v;
>> +        cpumask_t affinity;
>> +
>> +        if ( !dt_device_is_compatible(np, "xen,vcpu") )
>> +            continue;
>> +
>> +        if ( !dt_property_read_u32(np, "id", &val) )
>> +            panic("Invalid xen,vcpu node for domain %s\n", dt_node_name(node));
>> +
>> +        if ( val >= d->max_vcpus )
>> +            panic("Invalid vcpu_id %u for domain %s, max_vcpus=%u\n", val,
>> +                  dt_node_name(node), d->max_vcpus);
>> +
>> +        v = d->vcpu[val];
>> +        rc = dt_property_read_string(np, "hard-affinity", &hard_affinity_str);
>> +        if ( rc < 0 )
>> +            continue;
>> +
>> +        cpumask_clear(&affinity);
>> +        while ( *hard_affinity_str != '\0' )
>> +        {
>> +            unsigned int start, end;
>> +
>> +            start = simple_strtoul(hard_affinity_str, &hard_affinity_str, 0);
>> +
>> +            if ( *hard_affinity_str == '-' )    /* Range */
>> +            {
>> +                hard_affinity_str++;
>> +                end = simple_strtoul(hard_affinity_str, &hard_affinity_str, 0);
>> +            }
>> +            else                /* Single value */
>> +                end = start;
>> +
>> +            if ( end >= nr_cpu_ids )
>> +                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
>> +
>> +            for ( ; start <= end; start++ )
>> +                cpumask_set_cpu(start, &affinity);
>> +
>> +            if ( *hard_affinity_str == ',' )
>> +                hard_affinity_str++;
>> +            else if ( *hard_affinity_str != '\0' )
>> +                break;
>> +        }
>> +
>> +        rc = vcpu_set_hard_affinity(v, &affinity);
>> +        if ( rc )
>> +            panic("vcpu%d: failed (rc=%d) to set hard affinity for domain %s\n",
>> +                  v->vcpu_id, rc, dt_node_name(node));
>> +    }
>> +}
>> +
>> +#ifdef CONFIG_ARCH_PAGING_MEMPOOL
>> +static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
>> +                                             unsigned int smp_cpus)
>> +{
>> +    /*
>> +     * Keep in sync with libxl__get_required_paging_memory().
>> +     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
>> +     * plus 128 pages to cover extended regions.
>> +     */
>> +    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
>> +
>> +    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>> +
>> +    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>> +}
>> +
>> +static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>> +                                            const struct dt_device_node *node)
>> +{
>> +    unsigned long p2m_pages;
>> +    uint32_t p2m_mem_mb;
>> +    int rc;
>> +
>> +    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &p2m_mem_mb);
>> +    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
>> +    p2m_pages = rc ?
>> +                p2m_mem_mb << (20 - PAGE_SHIFT) :
>> +                domain_p2m_pages(mem, d->max_vcpus);
>> +
>> +    spin_lock(&d->arch.paging.lock);
>> +    rc = p2m_set_allocation(d, p2m_pages, NULL);
>> +    spin_unlock(&d->arch.paging.lock);
>> +
>> +    return rc;
>> +}
>> +#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
>> +static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
>> +                                            const struct dt_device_node *node)
>> +{
>> +    return 0;
>> +}
>> +#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
>> +
>> +static int __init construct_domU(struct domain *d,
>> +                          const struct dt_device_node *node)
>> +{
>> +    struct kernel_info kinfo = KERNEL_INFO_INIT;
>> +    const char *dom0less_enhanced;
>> +    int rc;
>> +    u64 mem;
>> +
>> +    rc = dt_property_read_u64(node, "memory", &mem);
>> +    if ( !rc )
>> +    {
>> +        printk("Error building DomU: cannot read \"memory\" property\n");
>> +        return -EINVAL;
>> +    }
>> +    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
>> +
>> +    rc = domain_p2m_set_allocation(d, mem, node);
>> +    if ( rc != 0 )
>> +        return rc;
>> +
>> +    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
>> +           d->max_vcpus, mem);
>> +
>> +    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
>> +    if ( rc == -EILSEQ ||
>> +         rc == -ENODATA ||
>> +         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
>> +    {
>> +        need_xenstore = true;
>> +        kinfo.dom0less_feature = DOM0LESS_ENHANCED;
>> +    }
>> +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
>> +    {
>> +        need_xenstore = true;
>> +        kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
>> +    }
>> +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>> +        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>> +
>> +    if ( vcpu_create(d, 0) == NULL )
>> +        return -ENOMEM;
>> +
>> +    d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
>> +
>> +    kinfo.d = d;
>> +
>> +    rc = kernel_probe(&kinfo, node);
>> +    if ( rc < 0 )
>> +        return rc;
>> +
>> +    set_domain_type(d, &kinfo);
>> +
>> +    if ( !dt_find_property(node, "xen,static-mem", NULL) )
>> +        allocate_memory(d, &kinfo);
>> +#ifdef CONFIG_STATIC_MEMORY
> Also this should not be needed thanks to the stub implementation of
> allocate_static_memory and assign_static_memory_11
>
>
>> +    else if ( !is_domain_direct_mapped(d) )
>> +        allocate_static_memory(d, &kinfo, node);
>> +    else
>> +        assign_static_memory_11(d, &kinfo, node);
>> +#endif
>> +
>> +#ifdef CONFIG_STATIC_SHM
> There is a stub for process_shm too

The same as with make_resv_memory_node(), static-shmem.h header isn't available for
all archs.
I can return my patches which move static-shmem.h to asm-generic and then drop all the ifdef-s connect to it:
https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/
https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/

Let me know if it is better to do now or should it be better to drop #ifdef-ing when an architrecture will require
static-shmem or static-mem features?

~ Oleksii

>
>> +    rc = process_shm(d, &kinfo, node);
>> +    if ( rc < 0 )
>> +        return rc;
>> +#endif
>> +
>> +    rc = init_vuart(d, &kinfo, node);
>> +    if ( rc < 0 )
>> +        return rc;
>> +
>> +    rc = prepare_dtb_domU(d, &kinfo);
>> +    if ( rc < 0 )
>> +        return rc;
>> +
>> +    rc = construct_domain(d, &kinfo);
>> +    if ( rc < 0 )
>> +        return rc;
>> +
>> +    domain_vcpu_affinity(d, node);
>> +
>> +    return alloc_xenstore_params(&kinfo);
>> +}
>> +
>>   void __init create_domUs(void)
>>   {
>>       struct dt_device_node *node;
>> diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
>> index f095135caa..c00bb853d6 100644
>> --- a/xen/include/asm-generic/dom0less-build.h
>> +++ b/xen/include/asm-generic/dom0less-build.h
>> @@ -11,10 +11,7 @@
>>   
>>   struct domain;
>>   struct dt_device_node;
>> -
>> -/* TODO: remove both when construct_domU() will be moved to common. */
>> -#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>> -extern bool need_xenstore;
>> +struct kernel_info;
>>   
>>   /*
>>    * List of possible features for dom0less domUs
>> @@ -48,12 +45,21 @@ void create_domUs(void);
>>   bool is_dom0less_mode(void);
>>   void set_xs_domain(struct domain *d);
>>   
>> -int construct_domU(struct domain *d, const struct dt_device_node *node);
>> -
>>   void arch_create_domUs(struct dt_device_node *node,
>>                          struct xen_domctl_createdomain *d_cfg,
>>                          unsigned int flags);
>>   
>> +int init_vuart(struct domain *d, struct kernel_info *kinfo,
>> +               const struct dt_device_node *node);
>> +
>> +int make_intc_domU_node(struct kernel_info *kinfo);
>> +int make_arch_nodes(struct kernel_info *kinfo);
>> +
>> +void set_domain_type(struct domain *d, struct kernel_info *kinfo);
>> +
>> +int init_intc_phandle(struct kernel_info *kinfo, const char *name,
>> +                      const int node_next, const void *pfdt);
>> +
>>   #else /* !CONFIG_DOM0LESS_BOOT */
>>   
>>   static inline void create_domUs(void) {}
>> -- 
>> 2.49.0
>>
--------------5xbHStcDnUr1SCGu0GXO5f1l
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
    <div class="moz-cite-prefix">On 5/2/25 10:53 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Fri, 2 May 2025, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Part of Arm's dom0less-build.c could be common between architectures which are
using device tree files to create guest domains. Thereby move some parts of
Arm's dom0less-build.c to common code with minor changes.

As a part of theses changes the following changes are introduced:
- Introduce make_arch_nodes() to cover arch-specific nodes. For example, in
  case of Arm, it is PSCI and vpl011 nodes.
- Introduce set_domain_type() to abstract a way how setting of domain type
  happens. For example, RISC-V won't have this member of arch_domain structure
  as vCPUs will always have the same bitness as hypervisor. In case of Arm, it
  is possible that Arm64 could create 32-bit and 64-bit domains.
- Introduce init_vuart() to cover details of virtual uart initialization.
- Introduce init_intc_phandle() to cover some details of interrupt controller
  phandle initialization. As an example, RISC-V could have different name for
  interrupt controller node ( APLIC, PLIC, IMSIC, etc ) but the code in
  domain_handle_dtb_bootmodule() could handle only one interrupt controller
  node name.
- s/make_gic_domU_node/make_intc_domU_node as GIC is Arm specific naming and
  add prototype of make_intc_domU_node() to dom0less-build.h

The following functions are moved to xen/common/device-tree:
- Functions which are moved as is:
  - domain_p2m_pages().
  - handle_passthrough_prop().
  - handle_prop_pfdt().
  - scan_pfdt_node().
  - check_partial_fdt().
- Functions which are moved with some minor changes:
  - alloc_xenstore_evtchn():
    - ifdef-ing by CONFIG_HVM accesses to hvm.params.
  - prepare_dtb_domU():
    - ifdef-ing access to gnttab_{start,size} by CONFIG_GRANT_TABLE.
    - s/make_gic_domU_node/make_intc_domU_node.
    - Add call of make_arch_nodes().
- domain_handle_dtb_bootmodule():
  - hide details of interrupt controller phandle initialization by calling
    init_intc_phandle().
  - Update the comment above init_intc_phandle(): s/gic/interrupt controller.
- construct_domU():
  - ifdef-ing by CONFIG_HVM accesses to hvm.params.
  - Call init_vuart() to hide Arm's vpl011_init() details there.
  - Add call of set_domain_type() instead of setting kinfo-&gt;arch.type explicitly.

Some parts of dom0less-build.c are wraped by #ifdef CONFIG_STATIC_{SHMEM,MEMORY}
as not all archs support these configs.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
FYI for a possible follow-up patch (doesn't have to be done in this
patch), the following functions could now be static:

alloc_dom0_vcpu0
dom0_max_vcpus</pre>
    </blockquote>
    <pre>I will make them static in follow-up patch in the next patch series version.

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">



</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
Change in v3:
 - Align construct_domU() with the current staging.
 - Align alloc_xenstore_params() with the current staging.
 - Move defintion of XENSTORE_PFN_LATE_ALLOC to common and
   declaration of need_xenstore to common.
---
Change in v2:
 - Wrap by #ifdef CONFIG_STATIC_* inclusions of &lt;asm/static-memory.h&gt; and
   &lt;asm/static-shmem.h&gt;. Wrap also the code which uses something from the
   mentioned headers.
 - Add handling of legacy case in construct_domU().
 - Use xen/fdt-kernel.h and xen/fdt-domain-build.h instead of asm/*.
 - Update the commit message.
---
 xen/arch/arm/dom0less-build.c            | 714 ++---------------------
 xen/common/device-tree/dom0less-build.c  | 699 ++++++++++++++++++++++
 xen/include/asm-generic/dom0less-build.h |  18 +-
 3 files changed, 751 insertions(+), 680 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 0310579863..627c212b3b 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -25,8 +25,6 @@
 #include &lt;asm/static-memory.h&gt;
 #include &lt;asm/static-shmem.h&gt;
 
-bool __initdata need_xenstore;
-
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
@@ -152,7 +150,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 }
 #endif
 
-static int __init make_gic_domU_node(struct kernel_info *kinfo)
+int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
     switch ( kinfo-&gt;d-&gt;arch.vgic.version )
     {
@@ -218,708 +216,60 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 }
 #endif
 
-/*
- * Scan device tree properties for passthrough specific information.
- * Returns &lt; 0 on error
- *         0 on success
- */
-static int __init handle_passthrough_prop(struct kernel_info *kinfo,
-                                          const struct fdt_property *xen_reg,
-                                          const struct fdt_property *xen_path,
-                                          bool xen_force,
-                                          uint32_t address_cells,
-                                          uint32_t size_cells)
-{
-    const __be32 *cell;
-    unsigned int i, len;
-    struct dt_device_node *node;
-    int res;
-    paddr_t mstart, size, gstart;
-
-    /* xen,reg specifies where to map the MMIO region */
-    cell = (const __be32 *)xen_reg-&gt;data;
-    len = fdt32_to_cpu(xen_reg-&gt;len) / ((address_cells * 2 + size_cells) *
-                                        sizeof(uint32_t));
-
-    for ( i = 0; i &lt; len; i++ )
-    {
-        device_tree_get_reg(&amp;cell, address_cells, size_cells,
-                            &amp;mstart, &amp;size);
-        gstart = dt_next_cell(address_cells, &amp;cell);
-
-        if ( gstart &amp; ~PAGE_MASK || mstart &amp; ~PAGE_MASK || size &amp; ~PAGE_MASK )
-        {
-            printk(XENLOG_ERR
-                   "DomU passthrough config has not page aligned addresses/sizes\n");
-            return -EINVAL;
-        }
-
-        res = iomem_permit_access(kinfo-&gt;d, paddr_to_pfn(mstart),
-                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
-                   kinfo-&gt;d-&gt;domain_id,
-                   mstart &amp; PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
-            return res;
-        }
-
-        res = map_regions_p2mt(kinfo-&gt;d,
-                               gaddr_to_gfn(gstart),
-                               PFN_DOWN(size),
-                               maddr_to_mfn(mstart),
-                               p2m_mmio_direct_dev);
-        if ( res &lt; 0 )
-        {
-            printk(XENLOG_ERR
-                   "Failed to map %"PRIpaddr" to the guest at%"PRIpaddr"\n",
-                   mstart, gstart);
-            return -EFAULT;
-        }
-    }
-
-    /*
-     * If xen_force, we let the user assign a MMIO region with no
-     * associated path.
-     */
-    if ( xen_path == NULL )
-        return xen_force ? 0 : -EINVAL;
-
-    /*
-     * xen,path specifies the corresponding node in the host DT.
-     * Both interrupt mappings and IOMMU settings are based on it,
-     * as they are done based on the corresponding host DT node.
-     */
-    node = dt_find_node_by_path(xen_path-&gt;data);
-    if ( node == NULL )
-    {
-        printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
-               xen_path-&gt;data);
-        return -EINVAL;
-    }
-
-    res = map_device_irqs_to_domain(kinfo-&gt;d, node, true, NULL);
-    if ( res &lt; 0 )
-        return res;
-
-    res = iommu_add_dt_device(node);
-    if ( res &lt; 0 )
-        return res;
-
-    /* If xen_force, we allow assignment of devices without IOMMU protection. */
-    if ( xen_force &amp;&amp; !dt_device_is_protected(node) )
-        return 0;
-
-    return iommu_assign_dt_device(kinfo-&gt;d, node);
-}
-
-static int __init handle_prop_pfdt(struct kernel_info *kinfo,
-                                   const void *pfdt, int nodeoff,
-                                   uint32_t address_cells, uint32_t size_cells,
-                                   bool scan_passthrough_prop)
-{
-    void *fdt = kinfo-&gt;fdt;
-    int propoff, nameoff, res;
-    const struct fdt_property *prop, *xen_reg = NULL, *xen_path = NULL;
-    const char *name;
-    bool found, xen_force = false;
-
-    for ( propoff = fdt_first_property_offset(pfdt, nodeoff);
-          propoff &gt;= 0;
-          propoff = fdt_next_property_offset(pfdt, propoff) )
-    {
-        if ( !(prop = fdt_get_property_by_offset(pfdt, propoff, NULL)) )
-            return -FDT_ERR_INTERNAL;
-
-        found = false;
-        nameoff = fdt32_to_cpu(prop-&gt;nameoff);
-        name = fdt_string(pfdt, nameoff);
-
-        if ( scan_passthrough_prop )
-        {
-            if ( dt_prop_cmp("xen,reg", name) == 0 )
-            {
-                xen_reg = prop;
-                found = true;
-            }
-            else if ( dt_prop_cmp("xen,path", name) == 0 )
-            {
-                xen_path = prop;
-                found = true;
-            }
-            else if ( dt_prop_cmp("xen,force-assign-without-iommu",
-                                  name) == 0 )
-            {
-                xen_force = true;
-                found = true;
-            }
-        }
-
-        /*
-         * Copy properties other than the ones above: xen,reg, xen,path,
-         * and xen,force-assign-without-iommu.
-         */
-        if ( !found )
-        {
-            res = fdt_property(fdt, name, prop-&gt;data, fdt32_to_cpu(prop-&gt;len));
-            if ( res )
-                return res;
-        }
-    }
-
-    /*
-     * Only handle passthrough properties if both xen,reg and xen,path
-     * are present, or if xen,force-assign-without-iommu is specified.
-     */
-    if ( xen_reg != NULL &amp;&amp; (xen_path != NULL || xen_force) )
-    {
-        res = handle_passthrough_prop(kinfo, xen_reg, xen_path, xen_force,
-                                      address_cells, size_cells);
-        if ( res &lt; 0 )
-        {
-            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo-&gt;d);
-            return res;
-        }
-    }
-    else if ( (xen_path &amp;&amp; !xen_reg) || (xen_reg &amp;&amp; !xen_path &amp;&amp; !xen_force) )
-    {
-        printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
-               kinfo-&gt;d);
-        return -EINVAL;
-    }
-
-    /* FDT_ERR_NOTFOUND =&gt; There is no more properties for this node */
-    return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
-}
-
-static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
-                                 int nodeoff,
-                                 uint32_t address_cells, uint32_t size_cells,
-                                 bool scan_passthrough_prop)
-{
-    int rc = 0;
-    void *fdt = kinfo-&gt;fdt;
-    int node_next;
-
-    rc = fdt_begin_node(fdt, fdt_get_name(pfdt, nodeoff, NULL));
-    if ( rc )
-        return rc;
-
-    rc = handle_prop_pfdt(kinfo, pfdt, nodeoff, address_cells, size_cells,
-                          scan_passthrough_prop);
-    if ( rc )
-        return rc;
-
-    address_cells = device_tree_get_u32(pfdt, nodeoff, "#address-cells",
-                                        DT_ROOT_NODE_ADDR_CELLS_DEFAULT);
-    size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
-                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
-
-    node_next = fdt_first_subnode(pfdt, nodeoff);
-    while ( node_next &gt; 0 )
-    {
-        rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
-                            scan_passthrough_prop);
-        if ( rc )
-            return rc;
-
-        node_next = fdt_next_subnode(pfdt, node_next);
-    }
-
-    return fdt_end_node(fdt);
-}
-
-static int __init check_partial_fdt(void *pfdt, size_t size)
+int __init make_arch_nodes(struct kernel_info *kinfo)
 {
-    int res;
-
-    if ( fdt_magic(pfdt) != FDT_MAGIC )
-    {
-        dprintk(XENLOG_ERR, "Partial FDT is not a valid Flat Device Tree");
-        return -EINVAL;
-    }
-
-    res = fdt_check_header(pfdt);
-    if ( res )
-    {
-        dprintk(XENLOG_ERR, "Failed to check the partial FDT (%d)", res);
-        return -EINVAL;
-    }
-
-    if ( fdt_totalsize(pfdt) &gt; size )
-    {
-        dprintk(XENLOG_ERR, "Partial FDT totalsize is too big");
-        return -EINVAL;
-    }
-
-    return 0;
-}
-
-static int __init domain_handle_dtb_bootmodule(struct domain *d,
-                                               struct kernel_info *kinfo)
-{
-    void *pfdt;
-    int res, node_next;
-
-    pfdt = ioremap_cache(kinfo-&gt;dtb_bootmodule-&gt;start,
-                         kinfo-&gt;dtb_bootmodule-&gt;size);
-    if ( pfdt == NULL )
-        return -EFAULT;
-
-    res = check_partial_fdt(pfdt, kinfo-&gt;dtb_bootmodule-&gt;size);
-    if ( res &lt; 0 )
-        goto out;
-
-    for ( node_next = fdt_first_subnode(pfdt, 0);
-          node_next &gt; 0;
-          node_next = fdt_next_subnode(pfdt, node_next) )
-    {
-        const char *name = fdt_get_name(pfdt, node_next, NULL);
-
-        if ( name == NULL )
-            continue;
-
-        /*
-         * Only scan /gic /aliases /passthrough, ignore the rest.
-         * They don't have to be parsed in order.
-         *
-         * Take the GIC phandle value from the special /gic node in the
-         * DTB fragment.
-         */
-        if ( dt_node_cmp(name, "gic") == 0 )
-        {
-            uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
-
-            if ( phandle_intc != 0 )
-                kinfo-&gt;phandle_intc = phandle_intc;
-            continue;
-        }
-
-        if ( dt_node_cmp(name, "aliases") == 0 )
-        {
-            res = scan_pfdt_node(kinfo, pfdt, node_next,
-                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
-                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 false);
-            if ( res )
-                goto out;
-            continue;
-        }
-        if ( dt_node_cmp(name, "passthrough") == 0 )
-        {
-            res = scan_pfdt_node(kinfo, pfdt, node_next,
-                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
-                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
-                                 true);
-            if ( res )
-                goto out;
-            continue;
-        }
-    }
-
- out:
-    iounmap(pfdt);
-
-    return res;
-}
-
-/*
- * The max size for DT is 2MB. However, the generated DT is small (not including
- * domU passthrough DT nodes whose size we account separately), 4KB are enough
- * for now, but we might have to increase it in the future.
- */
-#define DOMU_DTB_SIZE 4096
-static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
-{
-    int addrcells, sizecells;
-    int ret, fdt_size = DOMU_DTB_SIZE;
-
-    kinfo-&gt;phandle_intc = GUEST_PHANDLE_GIC;
-    kinfo-&gt;gnttab_start = GUEST_GNTTAB_BASE;
-    kinfo-&gt;gnttab_size = GUEST_GNTTAB_SIZE;
-
-    addrcells = GUEST_ROOT_ADDRESS_CELLS;
-    sizecells = GUEST_ROOT_SIZE_CELLS;
-
-    /* Account for domU passthrough DT size */
-    if ( kinfo-&gt;dtb_bootmodule )
-        fdt_size += kinfo-&gt;dtb_bootmodule-&gt;size;
-
-    /* Cap to max DT size if needed */
-    fdt_size = min(fdt_size, SZ_2M);
-
-    kinfo-&gt;fdt = xmalloc_bytes(fdt_size);
-    if ( kinfo-&gt;fdt == NULL )
-        return -ENOMEM;
-
-    ret = fdt_create(kinfo-&gt;fdt, fdt_size);
-    if ( ret &lt; 0 )
-        goto err;
-
-    ret = fdt_finish_reservemap(kinfo-&gt;fdt);
-    if ( ret &lt; 0 )
-        goto err;
-
-    ret = fdt_begin_node(kinfo-&gt;fdt, "");
-    if ( ret &lt; 0 )
-        goto err;
-
-    ret = fdt_property_cell(kinfo-&gt;fdt, "#address-cells", addrcells);
-    if ( ret )
-        goto err;
-
-    ret = fdt_property_cell(kinfo-&gt;fdt, "#size-cells", sizecells);
-    if ( ret )
-        goto err;
-
-    ret = make_chosen_node(kinfo);
-    if ( ret )
-        goto err;
+    int ret;
 
     ret = make_psci_node(kinfo-&gt;fdt);
     if ( ret )
-        goto err;
-
-    ret = make_cpus_node(d, kinfo-&gt;fdt);
-    if ( ret )
-        goto err;
-
-    ret = make_memory_node(kinfo, addrcells, sizecells,
-                           kernel_info_get_mem(kinfo));
-    if ( ret )
-        goto err;
-
-    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
-    if ( ret )
-        goto err;
-
-    /*
-     * domain_handle_dtb_bootmodule has to be called before the rest of
-     * the device tree is generated because it depends on the value of
-     * the field phandle_intc.
-     */
-    if ( kinfo-&gt;dtb_bootmodule )
-    {
-        ret = domain_handle_dtb_bootmodule(d, kinfo);
-        if ( ret )
-            goto err;
-    }
-
-    ret = make_gic_domU_node(kinfo);
-    if ( ret )
-        goto err;
-
-    ret = make_timer_node(kinfo);
-    if ( ret )
-        goto err;
+        return -EINVAL;
 
     if ( kinfo-&gt;vuart )
     {
-        ret = -EINVAL;
 #ifdef CONFIG_SBSA_VUART_CONSOLE
         ret = make_vpl011_uart_node(kinfo);
 #endif
         if ( ret )
-            goto err;
-    }
-
-    if ( kinfo-&gt;dom0less_feature &amp; DOM0LESS_ENHANCED_NO_XS )
-    {
-        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
-        if ( ret )
-            goto err;
+            return -EINVAL;
     }
 
-    ret = fdt_end_node(kinfo-&gt;fdt);
-    if ( ret &lt; 0 )
-        goto err;
-
-    ret = fdt_finish(kinfo-&gt;fdt);
-    if ( ret &lt; 0 )
-        goto err;
-
     return 0;
-
-  err:
-    printk("Device tree generation failed (%d).\n", ret);
-    xfree(kinfo-&gt;fdt);
-
-    return -EINVAL;
 }
 
-#define XENSTORE_PFN_OFFSET 1
-static int __init alloc_xenstore_page(struct domain *d)
+/* TODO: make arch.type generic ? */
+#ifdef CONFIG_ARM_64
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
-    struct page_info *xenstore_pg;
-    struct xenstore_domain_interface *interface;
-    mfn_t mfn;
-    gfn_t gfn;
-    int rc;
-
-    if ( (UINT_MAX - d-&gt;max_pages) &lt; 1 )
-    {
-        printk(XENLOG_ERR "%pd: Over-allocation for d-&gt;max_pages by 1 page.\n",
-               d);
-        return -EINVAL;
-    }
-
-    d-&gt;max_pages += 1;
-    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
-    if ( xenstore_pg == NULL &amp;&amp; is_64bit_domain(d) )
-        xenstore_pg = alloc_domheap_page(d, 0);
-    if ( xenstore_pg == NULL )
-        return -ENOMEM;
-
-    mfn = page_to_mfn(xenstore_pg);
-    if ( !mfn_x(mfn) )
-        return -ENOMEM;
-
-    if ( !is_domain_direct_mapped(d) )
-        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
-                           (XENSTORE_PFN_OFFSET &lt;&lt; PAGE_SHIFT));
-    else
-        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
-
-    rc = guest_physmap_add_page(d, gfn, mfn, 0);
-    if ( rc )
-    {
-        free_domheap_page(xenstore_pg);
-        return rc;
-    }
-
-    d-&gt;arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
-    interface = map_domain_page(mfn);
-    interface-&gt;connection = XENSTORE_RECONNECT;
-    unmap_domain_page(interface);
-
-    return 0;
+    /* type must be set before allocate memory */
+    d-&gt;arch.type = kinfo-&gt;arch.type;
 }
-
-static int __init alloc_xenstore_params(struct kernel_info *kinfo)
+#else
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
 {
-    struct domain *d = kinfo-&gt;d;
-    int rc = 0;
-
-    if ( (kinfo-&gt;dom0less_feature &amp; (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
-                                 == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
-        d-&gt;arch.hvm.params[HVM_PARAM_STORE_PFN] = XENSTORE_PFN_LATE_ALLOC;
-    else if ( kinfo-&gt;dom0less_feature &amp; DOM0LESS_XENSTORE )
-    {
-        rc = alloc_xenstore_page(d);
-        if ( rc &lt; 0 )
-            return rc;
-    }
-
-    return rc;
+    /* Nothing to do */
 }
+#endif
 
-static void __init domain_vcpu_affinity(struct domain *d,
-                                        const struct dt_device_node *node)
+int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
+                      const struct dt_device_node *node)
 {
-    struct dt_device_node *np;
-
-    dt_for_each_child_node(node, np)
-    {
-        const char *hard_affinity_str = NULL;
-        uint32_t val;
-        int rc;
-        struct vcpu *v;
-        cpumask_t affinity;
-
-        if ( !dt_device_is_compatible(np, "xen,vcpu") )
-            continue;
-
-        if ( !dt_property_read_u32(np, "id", &amp;val) )
-            panic("Invalid xen,vcpu node for domain %s\n", dt_node_name(node));
-
-        if ( val &gt;= d-&gt;max_vcpus )
-            panic("Invalid vcpu_id %u for domain %s, max_vcpus=%u\n", val,
-                  dt_node_name(node), d-&gt;max_vcpus);
-
-        v = d-&gt;vcpu[val];
-        rc = dt_property_read_string(np, "hard-affinity", &amp;hard_affinity_str);
-        if ( rc &lt; 0 )
-            continue;
-
-        cpumask_clear(&amp;affinity);
-        while ( *hard_affinity_str != '\0' )
-        {
-            unsigned int start, end;
-
-            start = simple_strtoul(hard_affinity_str, &amp;hard_affinity_str, 0);
-
-            if ( *hard_affinity_str == '-' )    /* Range */
-            {
-                hard_affinity_str++;
-                end = simple_strtoul(hard_affinity_str, &amp;hard_affinity_str, 0);
-            }
-            else                /* Single value */
-                end = start;
-
-            if ( end &gt;= nr_cpu_ids )
-                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
-
-            for ( ; start &lt;= end; start++ )
-                cpumask_set_cpu(start, &amp;affinity);
-
-            if ( *hard_affinity_str == ',' )
-                hard_affinity_str++;
-            else if ( *hard_affinity_str != '\0' )
-                break;
-        }
+    int rc = 0;
 
-        rc = vcpu_set_hard_affinity(v, &amp;affinity);
-        if ( rc )
-            panic("vcpu%d: failed (rc=%d) to set hard affinity for domain %s\n",
-                  v-&gt;vcpu_id, rc, dt_node_name(node));
-    }
-}
+    kinfo-&gt;vuart = dt_property_read_bool(node, "vpl011");
 
-#ifdef CONFIG_ARCH_PAGING_MEMPOOL
-static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
-                                             unsigned int smp_cpus)
-{
     /*
-     * Keep in sync with libxl__get_required_paging_memory().
-     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
-     * plus 128 pages to cover extended regions.
+     * Base address and irq number are needed when creating vpl011 device
+     * tree node in prepare_dtb_domU, so initialization on related variables
+     * shall be done first.
      */
-    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
-
-    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
-
-    return DIV_ROUND_UP(memkb, 1024) &lt;&lt; (20 - PAGE_SHIFT);
-}
-
-static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
-                                            const struct dt_device_node *node)
-{
-    unsigned long p2m_pages;
-    uint32_t p2m_mem_mb;
-    int rc;
-
-    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &amp;p2m_mem_mb);
-    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
-    p2m_pages = rc ?
-                p2m_mem_mb &lt;&lt; (20 - PAGE_SHIFT) :
-                domain_p2m_pages(mem, d-&gt;max_vcpus);
-
-    spin_lock(&amp;d-&gt;arch.paging.lock);
-    rc = p2m_set_allocation(d, p2m_pages, NULL);
-    spin_unlock(&amp;d-&gt;arch.paging.lock);
-
-    return rc;
-}
-#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
-static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
-                                            const struct dt_device_node *node)
-{
-    return 0;
-}
-#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
-
-int __init construct_domU(struct domain *d,
-                          const struct dt_device_node *node)
-{
-    struct kernel_info kinfo = KERNEL_INFO_INIT;
-    const char *dom0less_enhanced;
-    int rc;
-    u64 mem;
-
-    rc = dt_property_read_u64(node, "memory", &amp;mem);
-    if ( !rc )
-    {
-        printk("Error building DomU: cannot read \"memory\" property\n");
-        return -EINVAL;
-    }
-    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
-
-    rc = domain_p2m_set_allocation(d, mem, node);
-    if ( rc != 0 )
-        return rc;
-
-    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
-           d-&gt;max_vcpus, mem);
-
-    kinfo.vuart = dt_property_read_bool(node, "vpl011");
-    if ( kinfo.vuart &amp;&amp; is_hardware_domain(d) )
-        panic("hardware domain cannot specify vpl011\n");
-
-    rc = dt_property_read_string(node, "xen,enhanced", &amp;dom0less_enhanced);
-    if ( rc == -EILSEQ ||
-         rc == -ENODATA ||
-         (rc == 0 &amp;&amp; !strcmp(dom0less_enhanced, "enabled")) )
-    {
-        need_xenstore = true;
-        kinfo.dom0less_feature = DOM0LESS_ENHANCED;
-    }
-    else if ( rc == 0 &amp;&amp; !strcmp(dom0less_enhanced, "legacy") )
-    {
-        need_xenstore = true;
-        kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
-    }
-    else if ( rc == 0 &amp;&amp; !strcmp(dom0less_enhanced, "no-xenstore") )
-        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
-
-    if ( vcpu_create(d, 0) == NULL )
-        return -ENOMEM;
-
-    d-&gt;max_pages = ((paddr_t)mem * SZ_1K) &gt;&gt; PAGE_SHIFT;
-
-    kinfo.d = d;
-
-    rc = kernel_probe(&amp;kinfo, node);
-    if ( rc &lt; 0 )
-        return rc;
-
-#ifdef CONFIG_ARM_64
-    /* type must be set before allocate memory */
-    d-&gt;arch.type = kinfo.arch.type;
-#endif
-    if ( is_hardware_domain(d) )
-    {
-        rc = construct_hwdom(&amp;kinfo, node);
-        if ( rc &lt; 0 )
-            return rc;
-    }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think we should retain this chunk in the code movement. It is OK if it
is behind a #ifdef CONFIG_ARM.</pre>
    </blockquote>
    <pre>I'll is_hardware_domain() handling. I think it can be without #ifdef, it seems to me
it is a good thing to re-use construct_hwdom() in the case of creation of h/w domain.

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-    else
+    if ( kinfo-&gt;vuart )
     {
-        if ( !dt_find_property(node, "xen,static-mem", NULL) )
-            allocate_memory(d, &amp;kinfo);
-        else if ( !is_domain_direct_mapped(d) )
-            allocate_static_memory(d, &amp;kinfo, node);
-        else
-            assign_static_memory_11(d, &amp;kinfo, node);
-
-        rc = process_shm(d, &amp;kinfo, node);
-        if ( rc &lt; 0 )
-            return rc;
-
-        /*
-         * Base address and irq number are needed when creating vpl011 device
-         * tree node in prepare_dtb_domU, so initialization on related variables
-         * shall be done first.
-         */
-        if ( kinfo.vuart )
-        {
-            rc = domain_vpl011_init(d, NULL);
-            if ( rc &lt; 0 )
-                return rc;
-        }
-
-        rc = prepare_dtb_domU(d, &amp;kinfo);
-        if ( rc &lt; 0 )
-            return rc;
-
-        rc = construct_domain(d, &amp;kinfo);
+        rc = domain_vpl011_init(d, NULL);
         if ( rc &lt; 0 )
             return rc;
     }
 
-    domain_vcpu_affinity(d, node);
-
-    return alloc_xenstore_params(&amp;kinfo);
+    return rc;
 }
 
 void __init arch_create_domUs(struct dt_device_node *node,
@@ -995,6 +345,22 @@ void __init arch_create_domUs(struct dt_device_node *node,
     }
 }
 
+int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                             const int node_next, const void *pfdt)
+{
+    if ( dt_node_cmp(name, "gic") == 0 )
+    {
+        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
+
+        if ( phandle_intc != 0 )
+            kinfo-&gt;phandle_intc = phandle_intc;
+
+        return 0;
+    }
+
+    return 1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index a01a8b6b1a..c3face5b90 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -3,24 +3,43 @@
 #include &lt;xen/bootfdt.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/domain.h&gt;
+#include &lt;xen/domain_page.h&gt;
 #include &lt;xen/err.h&gt;
 #include &lt;xen/event.h&gt;
+#include &lt;xen/fdt-domain-build.h&gt;
+#include &lt;xen/fdt-kernel.h&gt;
 #include &lt;xen/grant_table.h&gt;
 #include &lt;xen/init.h&gt;
+#include &lt;xen/iocap.h&gt;
 #include &lt;xen/iommu.h&gt;
+#include &lt;xen/libfdt/libfdt.h&gt;
 #include &lt;xen/llc-coloring.h&gt;
+#include &lt;xen/sizes.h&gt;
 #include &lt;xen/sched.h&gt;
 #include &lt;xen/stdbool.h&gt;
 #include &lt;xen/types.h&gt;
+#include &lt;xen/vmap.h&gt;
 
 #include &lt;public/bootfdt.h&gt;
 #include &lt;public/domctl.h&gt;
 #include &lt;public/event_channel.h&gt;
+#include &lt;public/io/xs_wire.h&gt;
 
 #include &lt;asm/dom0less-build.h&gt;
 #include &lt;asm/setup.h&gt;
 
+#ifdef CONFIG_STATIC_MEMORY
+#include &lt;asm/static-memory.h&gt;
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
#if __has_include ?


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#ifdef CONFIG_STATIC_SHM
+#include &lt;asm/static-shmem.h&gt;
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same here?</pre>
    </blockquote>
    <pre>I thought that if we have already some CONFIG_* then it is better to use #ifdef, but I am okay with
changing it to __has_include.

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
+
 static domid_t __initdata xs_domid = DOMID_INVALID;
+static bool __initdata need_xenstore;
 
 void __init set_xs_domain(struct domain *d)
 {
@@ -109,6 +128,686 @@ static void __init initialize_domU_xenstore(void)
     }
 }
 
+/*
+ * Scan device tree properties for passthrough specific information.
+ * Returns &lt; 0 on error
+ *         0 on success
+ */
+static int __init handle_passthrough_prop(struct kernel_info *kinfo,
+                                          const struct fdt_property *xen_reg,
+                                          const struct fdt_property *xen_path,
+                                          bool xen_force,
+                                          uint32_t address_cells,
+                                          uint32_t size_cells)
+{
+    const __be32 *cell;
+    unsigned int i, len;
+    struct dt_device_node *node;
+    int res;
+    paddr_t mstart, size, gstart;
+
+    /* xen,reg specifies where to map the MMIO region */
+    cell = (const __be32 *)xen_reg-&gt;data;
+    len = fdt32_to_cpu(xen_reg-&gt;len) / ((address_cells * 2 + size_cells) *
+                                        sizeof(uint32_t));
+
+    for ( i = 0; i &lt; len; i++ )
+    {
+        device_tree_get_reg(&amp;cell, address_cells, size_cells,
+                            &amp;mstart, &amp;size);
+        gstart = dt_next_cell(address_cells, &amp;cell);
+
+        if ( gstart &amp; ~PAGE_MASK || mstart &amp; ~PAGE_MASK || size &amp; ~PAGE_MASK )
+        {
+            printk(XENLOG_ERR
+                   "DomU passthrough config has not page aligned addresses/sizes\n");
+            return -EINVAL;
+        }
+
+        res = iomem_permit_access(kinfo-&gt;d, paddr_to_pfn(mstart),
+                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to permit to dom%d access to"
+                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
+                   kinfo-&gt;d-&gt;domain_id,
+                   mstart &amp; PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
+            return res;
+        }
+
+        res = map_regions_p2mt(kinfo-&gt;d,
+                               gaddr_to_gfn(gstart),
+                               PFN_DOWN(size),
+                               maddr_to_mfn(mstart),
+                               p2m_mmio_direct_dev);
+        if ( res &lt; 0 )
+        {
+            printk(XENLOG_ERR
+                   "Failed to map %"PRIpaddr" to the guest at%"PRIpaddr"\n",
+                   mstart, gstart);
+            return -EFAULT;
+        }
+    }
+
+    /*
+     * If xen_force, we let the user assign a MMIO region with no
+     * associated path.
+     */
+    if ( xen_path == NULL )
+        return xen_force ? 0 : -EINVAL;
+
+    /*
+     * xen,path specifies the corresponding node in the host DT.
+     * Both interrupt mappings and IOMMU settings are based on it,
+     * as they are done based on the corresponding host DT node.
+     */
+    node = dt_find_node_by_path(xen_path-&gt;data);
+    if ( node == NULL )
+    {
+        printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
+               xen_path-&gt;data);
+        return -EINVAL;
+    }
+
+    res = map_device_irqs_to_domain(kinfo-&gt;d, node, true, NULL);
+    if ( res &lt; 0 )
+        return res;
+
+    res = iommu_add_dt_device(node);
+    if ( res &lt; 0 )
+        return res;
+
+    /* If xen_force, we allow assignment of devices without IOMMU protection. */
+    if ( xen_force &amp;&amp; !dt_device_is_protected(node) )
+        return 0;
+
+    return iommu_assign_dt_device(kinfo-&gt;d, node);
+}
+
+static int __init handle_prop_pfdt(struct kernel_info *kinfo,
+                                   const void *pfdt, int nodeoff,
+                                   uint32_t address_cells, uint32_t size_cells,
+                                   bool scan_passthrough_prop)
+{
+    void *fdt = kinfo-&gt;fdt;
+    int propoff, nameoff, res;
+    const struct fdt_property *prop, *xen_reg = NULL, *xen_path = NULL;
+    const char *name;
+    bool found, xen_force = false;
+
+    for ( propoff = fdt_first_property_offset(pfdt, nodeoff);
+          propoff &gt;= 0;
+          propoff = fdt_next_property_offset(pfdt, propoff) )
+    {
+        if ( !(prop = fdt_get_property_by_offset(pfdt, propoff, NULL)) )
+            return -FDT_ERR_INTERNAL;
+
+        found = false;
+        nameoff = fdt32_to_cpu(prop-&gt;nameoff);
+        name = fdt_string(pfdt, nameoff);
+
+        if ( scan_passthrough_prop )
+        {
+            if ( dt_prop_cmp("xen,reg", name) == 0 )
+            {
+                xen_reg = prop;
+                found = true;
+            }
+            else if ( dt_prop_cmp("xen,path", name) == 0 )
+            {
+                xen_path = prop;
+                found = true;
+            }
+            else if ( dt_prop_cmp("xen,force-assign-without-iommu",
+                                  name) == 0 )
+            {
+                xen_force = true;
+                found = true;
+            }
+        }
+
+        /*
+         * Copy properties other than the ones above: xen,reg, xen,path,
+         * and xen,force-assign-without-iommu.
+         */
+        if ( !found )
+        {
+            res = fdt_property(fdt, name, prop-&gt;data, fdt32_to_cpu(prop-&gt;len));
+            if ( res )
+                return res;
+        }
+    }
+
+    /*
+     * Only handle passthrough properties if both xen,reg and xen,path
+     * are present, or if xen,force-assign-without-iommu is specified.
+     */
+    if ( xen_reg != NULL &amp;&amp; (xen_path != NULL || xen_force) )
+    {
+        res = handle_passthrough_prop(kinfo, xen_reg, xen_path, xen_force,
+                                      address_cells, size_cells);
+        if ( res &lt; 0 )
+        {
+            printk(XENLOG_ERR "Failed to assign device to %pd\n", kinfo-&gt;d);
+            return res;
+        }
+    }
+    else if ( (xen_path &amp;&amp; !xen_reg) || (xen_reg &amp;&amp; !xen_path &amp;&amp; !xen_force) )
+    {
+        printk(XENLOG_ERR "xen,reg or xen,path missing for %pd\n",
+               kinfo-&gt;d);
+        return -EINVAL;
+    }
+
+    /* FDT_ERR_NOTFOUND =&gt; There is no more properties for this node */
+    return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
+}
+
+static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
+                                 int nodeoff,
+                                 uint32_t address_cells, uint32_t size_cells,
+                                 bool scan_passthrough_prop)
+{
+    int rc = 0;
+    void *fdt = kinfo-&gt;fdt;
+    int node_next;
+
+    rc = fdt_begin_node(fdt, fdt_get_name(pfdt, nodeoff, NULL));
+    if ( rc )
+        return rc;
+
+    rc = handle_prop_pfdt(kinfo, pfdt, nodeoff, address_cells, size_cells,
+                          scan_passthrough_prop);
+    if ( rc )
+        return rc;
+
+    address_cells = device_tree_get_u32(pfdt, nodeoff, "#address-cells",
+                                        DT_ROOT_NODE_ADDR_CELLS_DEFAULT);
+    size_cells = device_tree_get_u32(pfdt, nodeoff, "#size-cells",
+                                     DT_ROOT_NODE_SIZE_CELLS_DEFAULT);
+
+    node_next = fdt_first_subnode(pfdt, nodeoff);
+    while ( node_next &gt; 0 )
+    {
+        rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
+                            scan_passthrough_prop);
+        if ( rc )
+            return rc;
+
+        node_next = fdt_next_subnode(pfdt, node_next);
+    }
+
+    return fdt_end_node(fdt);
+}
+
+static int __init check_partial_fdt(void *pfdt, size_t size)
+{
+    int res;
+
+    if ( fdt_magic(pfdt) != FDT_MAGIC )
+    {
+        dprintk(XENLOG_ERR, "Partial FDT is not a valid Flat Device Tree");
+        return -EINVAL;
+    }
+
+    res = fdt_check_header(pfdt);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed to check the partial FDT (%d)", res);
+        return -EINVAL;
+    }
+
+    if ( fdt_totalsize(pfdt) &gt; size )
+    {
+        dprintk(XENLOG_ERR, "Partial FDT totalsize is too big");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init domain_handle_dtb_bootmodule(struct domain *d,
+                                               struct kernel_info *kinfo)
+{
+    void *pfdt;
+    int res, node_next;
+
+    pfdt = ioremap_cache(kinfo-&gt;dtb_bootmodule-&gt;start,
+                         kinfo-&gt;dtb_bootmodule-&gt;size);
+    if ( pfdt == NULL )
+        return -EFAULT;
+
+    res = check_partial_fdt(pfdt, kinfo-&gt;dtb_bootmodule-&gt;size);
+    if ( res &lt; 0 )
+        goto out;
+
+    for ( node_next = fdt_first_subnode(pfdt, 0);
+          node_next &gt; 0;
+          node_next = fdt_next_subnode(pfdt, node_next) )
+    {
+        const char *name = fdt_get_name(pfdt, node_next, NULL);
+
+        if ( name == NULL )
+            continue;
+
+        /*
+         * Only scan /$(interrupt_controller) /aliases /passthrough,
+         * ignore the rest.
+         * They don't have to be parsed in order.
+         *
+         * Take the interrupt controller phandle value from the special
+         * interrupt controller node in the DTB fragment.
+         */
+        if ( init_intc_phandle(kinfo, name, node_next, pfdt) == 0 )
+            continue;
+
+        if ( dt_node_cmp(name, "aliases") == 0 )
+        {
+            res = scan_pfdt_node(kinfo, pfdt, node_next,
+                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
+                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
+                                 false);
+            if ( res )
+                goto out;
+            continue;
+        }
+        if ( dt_node_cmp(name, "passthrough") == 0 )
+        {
+            res = scan_pfdt_node(kinfo, pfdt, node_next,
+                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
+                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
+                                 true);
+            if ( res )
+                goto out;
+            continue;
+        }
+    }
+
+ out:
+    iounmap(pfdt);
+
+    return res;
+}
+
+/*
+ * The max size for DT is 2MB. However, the generated DT is small (not including
+ * domU passthrough DT nodes whose size we account separately), 4KB are enough
+ * for now, but we might have to increase it in the future.
+ */
+#define DOMU_DTB_SIZE 4096
+static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
+{
+    int addrcells, sizecells;
+    int ret, fdt_size = DOMU_DTB_SIZE;
+
+    kinfo-&gt;phandle_intc = GUEST_PHANDLE_GIC;
+
+#ifdef CONFIG_GRANT_TABLE
+    kinfo-&gt;gnttab_start = GUEST_GNTTAB_BASE;
+    kinfo-&gt;gnttab_size = GUEST_GNTTAB_SIZE;
+#endif
+
+    addrcells = GUEST_ROOT_ADDRESS_CELLS;
+    sizecells = GUEST_ROOT_SIZE_CELLS;
+
+    /* Account for domU passthrough DT size */
+    if ( kinfo-&gt;dtb_bootmodule )
+        fdt_size += kinfo-&gt;dtb_bootmodule-&gt;size;
+
+    /* Cap to max DT size if needed */
+    fdt_size = min(fdt_size, SZ_2M);
+
+    kinfo-&gt;fdt = xmalloc_bytes(fdt_size);
+    if ( kinfo-&gt;fdt == NULL )
+        return -ENOMEM;
+
+    ret = fdt_create(kinfo-&gt;fdt, fdt_size);
+    if ( ret &lt; 0 )
+        goto err;
+
+    ret = fdt_finish_reservemap(kinfo-&gt;fdt);
+    if ( ret &lt; 0 )
+        goto err;
+
+    ret = fdt_begin_node(kinfo-&gt;fdt, "");
+    if ( ret &lt; 0 )
+        goto err;
+
+    ret = fdt_property_cell(kinfo-&gt;fdt, "#address-cells", addrcells);
+    if ( ret )
+        goto err;
+
+    ret = fdt_property_cell(kinfo-&gt;fdt, "#size-cells", sizecells);
+    if ( ret )
+        goto err;
+
+    ret = make_chosen_node(kinfo);
+    if ( ret )
+        goto err;
+
+    ret = make_cpus_node(d, kinfo-&gt;fdt);
+    if ( ret )
+        goto err;
+
+    ret = make_memory_node(kinfo, addrcells, sizecells,
+                           kernel_info_get_mem(kinfo));
+    if ( ret )
+        goto err;
+
+#ifdef CONFIG_STATIC_SHM
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This should not be necessary because there is a stub implementation of
make_resv_memory_node available in static-shmem.h for the
!CONFIG_STATIC_SHM case.</pre>
    </blockquote>
    <pre>But static-shmem.h isn't available on all architectures. Until static-shmem.h isn't moved to
asm-generic or xen folders and then re-used by an architecture we have to have #ifdef.

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
+    if ( ret )
+        goto err;
+#endif
+
+    /*
+     * domain_handle_dtb_bootmodule has to be called before the rest of
+     * the device tree is generated because it depends on the value of
+     * the field phandle_intc.
+     */
+    if ( kinfo-&gt;dtb_bootmodule )
+    {
+        ret = domain_handle_dtb_bootmodule(d, kinfo);
+        if ( ret )
+            goto err;
+    }
+
+    ret = make_intc_domU_node(kinfo);
+    if ( ret )
+        goto err;
+
+    ret = make_timer_node(kinfo);
+    if ( ret )
+        goto err;
+
+    if ( kinfo-&gt;dom0less_feature &amp; DOM0LESS_ENHANCED_NO_XS )
+    {
+        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
+        if ( ret )
+            goto err;
+    }
+
+    ret = make_arch_nodes(kinfo);
+    if ( ret )
+        goto err;
+
+    ret = fdt_end_node(kinfo-&gt;fdt);
+    if ( ret &lt; 0 )
+        goto err;
+
+    ret = fdt_finish(kinfo-&gt;fdt);
+    if ( ret &lt; 0 )
+        goto err;
+
+    return 0;
+
+  err:
+    printk("Device tree generation failed (%d).\n", ret);
+    xfree(kinfo-&gt;fdt);
+
+    return -EINVAL;
+}
+
+#define XENSTORE_PFN_OFFSET 1
+static int __init alloc_xenstore_page(struct domain *d)
+{
+    struct page_info *xenstore_pg;
+    struct xenstore_domain_interface *interface;
+    mfn_t mfn;
+    gfn_t gfn;
+    int rc;
+
+    if ( (UINT_MAX - d-&gt;max_pages) &lt; 1 )
+    {
+        printk(XENLOG_ERR "%pd: Over-allocation for d-&gt;max_pages by 1 page.\n",
+               d);
+        return -EINVAL;
+    }
+
+    d-&gt;max_pages += 1;
+    xenstore_pg = alloc_domheap_page(d, MEMF_bits(32));
+    if ( xenstore_pg == NULL &amp;&amp; is_64bit_domain(d) )
+        xenstore_pg = alloc_domheap_page(d, 0);
+    if ( xenstore_pg == NULL )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(xenstore_pg);
+    if ( !mfn_x(mfn) )
+        return -ENOMEM;
+
+    if ( !is_domain_direct_mapped(d) )
+        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE +
+                           (XENSTORE_PFN_OFFSET &lt;&lt; PAGE_SHIFT));
+    else
+        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
+
+    rc = guest_physmap_add_page(d, gfn, mfn, 0);
+    if ( rc )
+    {
+        free_domheap_page(xenstore_pg);
+        return rc;
+    }
+
+#ifdef CONFIG_HVM
+    d-&gt;arch.hvm.params[HVM_PARAM_STORE_PFN] = gfn_x(gfn);
+#endif
+    interface = map_domain_page(mfn);
+    interface-&gt;connection = XENSTORE_RECONNECT;
+    unmap_domain_page(interface);
+
+    return 0;
+}
+
+static int __init alloc_xenstore_params(struct kernel_info *kinfo)
+{
+    struct domain *d = kinfo-&gt;d;
+    int rc = 0;
+
+#ifdef CONFIG_HVM
+    if ( (kinfo-&gt;dom0less_feature &amp; (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY))
+                                 == (DOM0LESS_XENSTORE | DOM0LESS_XS_LEGACY) )
+        d-&gt;arch.hvm.params[HVM_PARAM_STORE_PFN] = XENSTORE_PFN_LATE_ALLOC;
+    else
+#endif
+    if ( kinfo-&gt;dom0less_feature &amp; DOM0LESS_XENSTORE )
+    {
+        rc = alloc_xenstore_page(d);
+        if ( rc &lt; 0 )
+            return rc;
+    }
+
+    return rc;
+}
+
+static void __init domain_vcpu_affinity(struct domain *d,
+                                        const struct dt_device_node *node)
+{
+    struct dt_device_node *np;
+
+    dt_for_each_child_node(node, np)
+    {
+        const char *hard_affinity_str = NULL;
+        uint32_t val;
+        int rc;
+        struct vcpu *v;
+        cpumask_t affinity;
+
+        if ( !dt_device_is_compatible(np, "xen,vcpu") )
+            continue;
+
+        if ( !dt_property_read_u32(np, "id", &amp;val) )
+            panic("Invalid xen,vcpu node for domain %s\n", dt_node_name(node));
+
+        if ( val &gt;= d-&gt;max_vcpus )
+            panic("Invalid vcpu_id %u for domain %s, max_vcpus=%u\n", val,
+                  dt_node_name(node), d-&gt;max_vcpus);
+
+        v = d-&gt;vcpu[val];
+        rc = dt_property_read_string(np, "hard-affinity", &amp;hard_affinity_str);
+        if ( rc &lt; 0 )
+            continue;
+
+        cpumask_clear(&amp;affinity);
+        while ( *hard_affinity_str != '\0' )
+        {
+            unsigned int start, end;
+
+            start = simple_strtoul(hard_affinity_str, &amp;hard_affinity_str, 0);
+
+            if ( *hard_affinity_str == '-' )    /* Range */
+            {
+                hard_affinity_str++;
+                end = simple_strtoul(hard_affinity_str, &amp;hard_affinity_str, 0);
+            }
+            else                /* Single value */
+                end = start;
+
+            if ( end &gt;= nr_cpu_ids )
+                panic("Invalid pCPU %u for domain %s\n", end, dt_node_name(node));
+
+            for ( ; start &lt;= end; start++ )
+                cpumask_set_cpu(start, &amp;affinity);
+
+            if ( *hard_affinity_str == ',' )
+                hard_affinity_str++;
+            else if ( *hard_affinity_str != '\0' )
+                break;
+        }
+
+        rc = vcpu_set_hard_affinity(v, &amp;affinity);
+        if ( rc )
+            panic("vcpu%d: failed (rc=%d) to set hard affinity for domain %s\n",
+                  v-&gt;vcpu_id, rc, dt_node_name(node));
+    }
+}
+
+#ifdef CONFIG_ARCH_PAGING_MEMPOOL
+static unsigned long __init domain_p2m_pages(unsigned long maxmem_kb,
+                                             unsigned int smp_cpus)
+{
+    /*
+     * Keep in sync with libxl__get_required_paging_memory().
+     * 256 pages (1MB) per vcpu, plus 1 page per MiB of RAM for the P2M map,
+     * plus 128 pages to cover extended regions.
+     */
+    unsigned long memkb = 4 * (256 * smp_cpus + (maxmem_kb / 1024) + 128);
+
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+
+    return DIV_ROUND_UP(memkb, 1024) &lt;&lt; (20 - PAGE_SHIFT);
+}
+
+static int __init domain_p2m_set_allocation(struct domain *d, uint64_t mem,
+                                            const struct dt_device_node *node)
+{
+    unsigned long p2m_pages;
+    uint32_t p2m_mem_mb;
+    int rc;
+
+    rc = dt_property_read_u32(node, "xen,domain-p2m-mem-mb", &amp;p2m_mem_mb);
+    /* If xen,domain-p2m-mem-mb is not specified, use the default value. */
+    p2m_pages = rc ?
+                p2m_mem_mb &lt;&lt; (20 - PAGE_SHIFT) :
+                domain_p2m_pages(mem, d-&gt;max_vcpus);
+
+    spin_lock(&amp;d-&gt;arch.paging.lock);
+    rc = p2m_set_allocation(d, p2m_pages, NULL);
+    spin_unlock(&amp;d-&gt;arch.paging.lock);
+
+    return rc;
+}
+#else /* !CONFIG_ARCH_PAGING_MEMPOOL */
+static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
+                                            const struct dt_device_node *node)
+{
+    return 0;
+}
+#endif /* CONFIG_ARCH_PAGING_MEMPOOL */
+
+static int __init construct_domU(struct domain *d,
+                          const struct dt_device_node *node)
+{
+    struct kernel_info kinfo = KERNEL_INFO_INIT;
+    const char *dom0less_enhanced;
+    int rc;
+    u64 mem;
+
+    rc = dt_property_read_u64(node, "memory", &amp;mem);
+    if ( !rc )
+    {
+        printk("Error building DomU: cannot read \"memory\" property\n");
+        return -EINVAL;
+    }
+    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
+
+    rc = domain_p2m_set_allocation(d, mem, node);
+    if ( rc != 0 )
+        return rc;
+
+    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
+           d-&gt;max_vcpus, mem);
+
+    rc = dt_property_read_string(node, "xen,enhanced", &amp;dom0less_enhanced);
+    if ( rc == -EILSEQ ||
+         rc == -ENODATA ||
+         (rc == 0 &amp;&amp; !strcmp(dom0less_enhanced, "enabled")) )
+    {
+        need_xenstore = true;
+        kinfo.dom0less_feature = DOM0LESS_ENHANCED;
+    }
+    else if ( rc == 0 &amp;&amp; !strcmp(dom0less_enhanced, "legacy") )
+    {
+        need_xenstore = true;
+        kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
+    }
+    else if ( rc == 0 &amp;&amp; !strcmp(dom0less_enhanced, "no-xenstore") )
+        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
+
+    if ( vcpu_create(d, 0) == NULL )
+        return -ENOMEM;
+
+    d-&gt;max_pages = ((paddr_t)mem * SZ_1K) &gt;&gt; PAGE_SHIFT;
+
+    kinfo.d = d;
+
+    rc = kernel_probe(&amp;kinfo, node);
+    if ( rc &lt; 0 )
+        return rc;
+
+    set_domain_type(d, &amp;kinfo);
+
+    if ( !dt_find_property(node, "xen,static-mem", NULL) )
+        allocate_memory(d, &amp;kinfo);
+#ifdef CONFIG_STATIC_MEMORY
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Also this should not be needed thanks to the stub implementation of
allocate_static_memory and assign_static_memory_11


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    else if ( !is_domain_direct_mapped(d) )
+        allocate_static_memory(d, &amp;kinfo, node);
+    else
+        assign_static_memory_11(d, &amp;kinfo, node);
+#endif
+
+#ifdef CONFIG_STATIC_SHM
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There is a stub for process_shm too</pre>
    </blockquote>
    <pre>The same as with make_resv_memory_node(), static-shmem.h header isn't available for
all archs.
I can return my patches which move static-shmem.h to asm-generic and then drop all the ifdef-s connect to it:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/">https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/</a>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/">https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/</a>

Let me know if it is better to do now or should it be better to drop #ifdef-ing when an architrecture will require
static-shmem or static-mem features?

~ Oleksii</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    rc = process_shm(d, &amp;kinfo, node);
+    if ( rc &lt; 0 )
+        return rc;
+#endif
+
+    rc = init_vuart(d, &amp;kinfo, node);
+    if ( rc &lt; 0 )
+        return rc;
+
+    rc = prepare_dtb_domU(d, &amp;kinfo);
+    if ( rc &lt; 0 )
+        return rc;
+
+    rc = construct_domain(d, &amp;kinfo);
+    if ( rc &lt; 0 )
+        return rc;
+
+    domain_vcpu_affinity(d, node);
+
+    return alloc_xenstore_params(&amp;kinfo);
+}
+
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
index f095135caa..c00bb853d6 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -11,10 +11,7 @@
 
 struct domain;
 struct dt_device_node;
-
-/* TODO: remove both when construct_domU() will be moved to common. */
-#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
-extern bool need_xenstore;
+struct kernel_info;
 
 /*
  * List of possible features for dom0less domUs
@@ -48,12 +45,21 @@ void create_domUs(void);
 bool is_dom0less_mode(void);
 void set_xs_domain(struct domain *d);
 
-int construct_domU(struct domain *d, const struct dt_device_node *node);
-
 void arch_create_domUs(struct dt_device_node *node,
                        struct xen_domctl_createdomain *d_cfg,
                        unsigned int flags);
 
+int init_vuart(struct domain *d, struct kernel_info *kinfo,
+               const struct dt_device_node *node);
+
+int make_intc_domU_node(struct kernel_info *kinfo);
+int make_arch_nodes(struct kernel_info *kinfo);
+
+void set_domain_type(struct domain *d, struct kernel_info *kinfo);
+
+int init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                      const int node_next, const void *pfdt);
+
 #else /* !CONFIG_DOM0LESS_BOOT */
 
 static inline void create_domUs(void) {}
-- 
2.49.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------5xbHStcDnUr1SCGu0GXO5f1l--

