Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC86751C2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481556.746530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIo6d-0008HX-1v; Fri, 20 Jan 2023 09:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481556.746530; Fri, 20 Jan 2023 09:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIo6c-0008FD-VP; Fri, 20 Jan 2023 09:54:42 +0000
Received: by outflank-mailman (input) for mailman id 481556;
 Fri, 20 Jan 2023 09:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUaQ=5R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIo6b-0008F7-Pt
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:54:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 736ae32c-98a8-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 10:54:39 +0100 (CET)
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by SA1PR12MB7271.namprd12.prod.outlook.com (2603:10b6:806:2b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 09:54:35 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::6e) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Fri, 20 Jan 2023 09:54:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 20 Jan 2023 09:54:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 03:54:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 20 Jan
 2023 03:54:33 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 20 Jan 2023 03:54:32 -0600
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
X-Inumbo-ID: 736ae32c-98a8-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irrxW1YHEU5fG3nIfVGMlxRh6OLRCnkZ1hzikdltA/XuLX+MqYOt4uWX/dJrcySdfw7qwkoLwL0DQI8c1bQ45T0ULymhDMwMnlgZ/UNdwC91qeyyG0zLX2iUorZTU1x01naG92ZDjjzSNS8WQ17LJrjAfGYyb/hZWqFYiUIXeIiZyE0z7OnvDAn7ENXdQJuU4S6lLgdGE+6dBhzUN10RYQReBcRCYQBQY1b82ZpsxcIGUrHWdbOtMjmDnysbYEaraPNz5lpLNKnMii5s/xieB1iiTgUy20KCWdyxj1elO4ZCpiUMKzYwq5cUciDqf8ULWgvfQyDRlgGXv/KMSxgewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K/CRRq2IYUdYpxVIoqaguFzA04n9HeLJrwTyngZo/8=;
 b=Iperh/Yw8Fw3oBYlPb2/dZ2Z84vRIB0AXRu89w/GD9X/VL/VkBBc2WQbiCce/JEVOpu+DZVwNCGfmP3IyTzsmXheEhH7+nQosUAQGftnvGQ+/Sei0zgsobfA6D8kOHWZ0TJdn30t7+pILT29LRmotnuuPXDua9jAsE0atzCGXQkLnzngpH1CzMi/YJEATwvhA/AJFO/D6FxqgXAXJ5pdxU3cCrgym4sIlTuxCZT5JxViIP/yxtxIqt0svVdUwOyj0IqhXOtyQdKlnoItZ+YGyy1nG7jF2TBpTV+Pmz2Ijk4BdoxV/3f23ayW5G7G7Y+lLCHn0KsZTrGKrhguPm5NIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K/CRRq2IYUdYpxVIoqaguFzA04n9HeLJrwTyngZo/8=;
 b=AOzdxdkMBn1/IgSXwLWnsnmrFipe8ZYc5pdO2Stmzeou4KVN5+DONimg/vYW9RweSIMZcryPzzlmuRff6Eg5hX0rsjUyWhKq5YcB+vmOkVhiwsmrz+XycCzN6yk/RILOAczI6FnCoGRt+YxG8yyQ9NVy+Hff0xsVgpRIgaUWK/8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b2822e36-0972-5c4b-90d9-aee6533824b2@amd.com>
Date: Fri, 20 Jan 2023 10:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-3-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230116015820.1269387-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT041:EE_|SA1PR12MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9f2b1e-d647-4db3-2e9b-08dafacc55ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lg2lFnry0HhFDuvHSA6tvTwmlF4K9n/Fk7GxDFmZj2lOuAuj0fPKrYE7L8pCooKxCeAsyZyM/NExYX9tsDtgZA8KLbTKArsRHjYAWiBCI7sRoN3qTwYgGDpdgamzy/W/zllKMHd3sdkzur4YUZobhkdA+WEBH/+cmKA9Tc+WCwnyPMXlYUmTBdaVHd+Z2RJ1OtuZwcCk0yp0oWsrwGK6mkdu8iFUGBcj+qwg4VVWNokBl5M2Jx1tjSlvOzb3jUetAfhisYSwRrElA+9zVL00SOK0Zb3DkenUygVcvdR/V4tQLlFXyBnA19K+LFXWENRZxwd63ERIXzjri+zKWiHEm8RSagFjZdcEvmNJydILoUmEKH4fr6JBKfpNeeMrWfBKk+9L0Y8Oay5lYnZfUibVHYMArMwTOL/BsXrJUvlmahYxpF5bAGqyxFRLYCZjeRnT6FvXxmYwBERAsMYehq30PGWSbm0JN89+KpoibvB5Cj5YxBNAqxetA7kuAEI59cDBboq+gMxcIYCGtifCwUBDXGEWscez1ujpyTt4xnSPQ5rQwNElBC7/VoQMyibZKTzWG2KdwwEH0x7SpHyanZDppqsNclA5YlBIkXdlHDYMKZJqv9eB/wuUF0ERKmBgwUfwI7UbvZ4xDILztfml8Wq2yBSqSBwx9Rp2fIGo44dnpjT+bq4gS4n/dL85VJrCJpVCK5Hw1Jez3JQ3fhpaaJEQWtCGDy6ThIwKS8ujgEAN5T0PsZZ227H45hKgdO+HlNX+J8i0M7m/3v23Ri0D+Gfkfw/0PEz2a8kTF7JqDx0oPEZ2v/vEW/2mc+6lIoT38mmxbCqOgF6D5d8WTw1RxWQD9l2a2Fpj5VB+469SXt2HwHI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(44832011)(70586007)(70206006)(5660300002)(8936002)(8676002)(4326008)(16576012)(316002)(82310400005)(478600001)(966005)(54906003)(110136005)(36860700001)(26005)(53546011)(2906002)(186003)(2616005)(36756003)(31696002)(40460700003)(86362001)(336012)(81166007)(83380400001)(40480700001)(356005)(82740400003)(31686004)(41300700001)(426003)(47076005)(36900700001)(43740500002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 09:54:34.7691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f2b1e-d647-4db3-2e9b-08dafacc55ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7271

Hi Henry,

On 16/01/2023 02:58, Henry Wang wrote:
> 
> 
> Currently, the mapping of the GICv2 CPU interface is created in
> arch_domain_create(). This causes some troubles in populating and
> freeing of the domain P2M pages pool. For example, a default 16
> P2M pages are required in p2m_init() to cope with the P2M mapping
> of 8KB GICv2 CPU interface area, and these 16 P2M pages would cause
> the complexity of P2M destroy in the failure path of
> arch_domain_create().
> 
> As per discussion in [1], similarly as the MMIO access for ACPI, this
> patch defers the GICv2 CPU interface mapping until the first MMIO
> access. This is achieved by moving the GICv2 CPU interface mapping
> code from vgic_v2_domain_init() to the stage-2 data abort trap handling
> code. The original CPU interface size and virtual CPU interface base
> address is now saved in `struct vgic_dist` instead of the local
> variable of vgic_v2_domain_init().
> 
> Note that GICv2 changes introduced by this patch is not applied to the
> "New vGIC" implementation, as the "New vGIC" is not used. Also since
The fact that "New vGIC" is not used very often and its work is in-progress
does not mean that we can implement changes resulting in a build failure
when enabling CONFIG_NEW_VGIC, which is the case with your patch.
So this needs to be fixed.

> the hardware domain (Dom0) has an unlimited size P2M pool, the
> gicv2_map_hwdom_extra_mappings() is also not touched by this patch.
> 
> [1] https://lore.kernel.org/xen-devel/e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org/
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  xen/arch/arm/include/asm/vgic.h |  2 ++
>  xen/arch/arm/traps.c            | 19 ++++++++++++++++---
>  xen/arch/arm/vgic-v2.c          | 25 ++++++-------------------
>  3 files changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 3d44868039..1d37c291e1 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -153,6 +153,8 @@ struct vgic_dist {
>      /* Base address for guest GIC */
>      paddr_t dbase; /* Distributor base address */
>      paddr_t cbase; /* CPU interface base address */
> +    paddr_t csize; /* CPU interface size */
> +    paddr_t vbase; /* virtual CPU interface base address */
Could you swap them so that base address variables are grouped?

>  #ifdef CONFIG_GICV3
>      /* GIC V3 addressing */
>      /* List of contiguous occupied by the redistributors */
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 061c92acbd..d98f166050 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1787,9 +1787,12 @@ static inline bool hpfar_is_valid(bool s1ptw, uint8_t fsc)
>  }
> 
>  /*
> - * When using ACPI, most of the MMIO regions will be mapped on-demand
> - * in stage-2 page tables for the hardware domain because Xen is not
> - * able to know from the EFI memory map the MMIO regions.
> + * Try to map the MMIO regions for some special cases:
> + * 1. When using ACPI, most of the MMIO regions will be mapped on-demand
> + *    in stage-2 page tables for the hardware domain because Xen is not
> + *    able to know from the EFI memory map the MMIO regions.
> + * 2. For guests using GICv2, the GICv2 CPU interface mapping is created
> + *    on the first access of the MMIO region.
>   */
>  static bool try_map_mmio(gfn_t gfn)
>  {
> @@ -1798,6 +1801,16 @@ static bool try_map_mmio(gfn_t gfn)
>      /* For the hardware domain, all MMIOs are mapped with GFN == MFN */
>      mfn_t mfn = _mfn(gfn_x(gfn));
> 
> +    /*
> +     * Map the GICv2 virtual cpu interface in the gic cpu interface
NIT: in all the other places you use CPU (capital letters)

> +     * region of the guest on the first access of the MMIO region.
> +     */
> +    if ( d->arch.vgic.version == GIC_V2 &&
> +         gfn_x(gfn) == gfn_x(gaddr_to_gfn(d->arch.vgic.cbase)) )
There is a macro gnf_eq that you can use to avoid opencoding it.

> +        return !map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
At this point you can use just gfn instead of gaddr_to_gfn(d->arch.vgic.cbase)

> +                                 d->arch.vgic.csize / PAGE_SIZE,
> +                                 maddr_to_mfn(d->arch.vgic.vbase));
> +
>      /*
>       * Device-Tree should already have everything mapped when building
>       * the hardware domain.
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 0026cb4360..21e14a5a6f 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -644,10 +644,6 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
> 
>  static int vgic_v2_domain_init(struct domain *d)
>  {
> -    int ret;
> -    paddr_t csize;
> -    paddr_t vbase;
> -
>      /*
>       * The hardware domain and direct-mapped domain both get the hardware
>       * address.
> @@ -667,8 +663,8 @@ static int vgic_v2_domain_init(struct domain *d)
>           * aligned to PAGE_SIZE.
>           */
>          d->arch.vgic.cbase = vgic_v2_hw.cbase;
> -        csize = vgic_v2_hw.csize;
> -        vbase = vgic_v2_hw.vbase;
> +        d->arch.vgic.csize = vgic_v2_hw.csize;
> +        d->arch.vgic.vbase = vgic_v2_hw.vbase;
>      }
>      else if ( is_domain_direct_mapped(d) )
>      {
> @@ -683,8 +679,8 @@ static int vgic_v2_domain_init(struct domain *d)
>           */
>          d->arch.vgic.dbase = vgic_v2_hw.dbase;
>          d->arch.vgic.cbase = vgic_v2_hw.cbase;
> -        csize = GUEST_GICC_SIZE;
> -        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
> +        d->arch.vgic.csize = GUEST_GICC_SIZE;
> +        d->arch.vgic.vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
>      }
>      else
>      {
> @@ -697,19 +693,10 @@ static int vgic_v2_domain_init(struct domain *d)
>           */
>          BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
>          d->arch.vgic.cbase = GUEST_GICC_BASE;
> -        csize = GUEST_GICC_SIZE;
> -        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
> +        d->arch.vgic.csize = GUEST_GICC_SIZE;
> +        d->arch.vgic.vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
>      }
> 
> -    /*
> -     * Map the gic virtual cpu interface in the gic cpu interface
> -     * region of the guest.
> -     */
> -    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
> -                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
> -    if ( ret )
> -        return ret;
> -
Maybe adding some comment like "Mapping of the virtual CPU interface is deferred until first access"
would be helpful.

~Michal

