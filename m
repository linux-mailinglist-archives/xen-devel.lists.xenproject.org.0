Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498D985119
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 04:49:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803435.1213994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stI4m-00068D-0r; Wed, 25 Sep 2024 02:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803435.1213994; Wed, 25 Sep 2024 02:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stI4l-00065X-Ts; Wed, 25 Sep 2024 02:48:23 +0000
Received: by outflank-mailman (input) for mailman id 803435;
 Wed, 25 Sep 2024 02:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJO7=QX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1stI4j-00065R-TE
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 02:48:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f3a9c0f-7ae8-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 04:48:19 +0200 (CEST)
Received: from BLAPR03CA0110.namprd03.prod.outlook.com (2603:10b6:208:32a::25)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 02:48:10 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:208:32a:cafe::e) by BLAPR03CA0110.outlook.office365.com
 (2603:10b6:208:32a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 25 Sep 2024 02:48:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Wed, 25 Sep 2024 02:48:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Sep
 2024 21:48:09 -0500
Received: from [172.30.194.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 24 Sep 2024 21:48:07 -0500
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
X-Inumbo-ID: 9f3a9c0f-7ae8-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJmEb/cOv22s6/grzLXDhpcBtywomcV2gHUrDwDO6YN3VhR9IrzD+BslJAuYQw6j2ej4XRjX6E2rFXt7UW54UrzFW+6ZeYaV/scYIUu+qBaAvF6bXm8PVtcjLS/jKXsfRk/JK4TVeE+/O3lS7c2FPQqt6Th6v/qYbNojZi3sizWsD5XvMk16SUghrUTPEeE2UWoj6h4kTWAs5FEYGcRiwmVi0fiQapnZJkM5aXxumqoMPkNJpTXQd9fh8b4/WGXJUTJigWe9fkRVP5qfY5yx5IkKTECswrqrUDxb+epGKvLJsQBl190J9ApaaiOw9kf2ubVp3SDEy3ZXW2gHzlh3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcRbvoykgiID+/cRo8GtSmFyybY02S3RS865ek6AT/0=;
 b=xQH6HHvOYyOv8tsLTgvGFYP4zD63/FEkhWMklef24wwsVIQfGEh9EHzf1PeuQ1Wd84ZV5fjkn8C//fvJRE6G7c8IRt4lt9PaAwZcftKYnCZ6lUyWOMr2RG6Gs7aHSIJeXfeY45wSr1F5y2MCJKf3hMjAuptbRH8Cv1BVc8PaywILxO8n7lDWTc9LVfcb2WEUrnvgCUGXdF28Wt4LUwGj0B8S0/qmjt8uk8x3qGpuKU5ZQu+H8geQIUQmYUM7iZmqqjzuyvPcygIrxx3yC3XgscSi/uRgUh8tdCKd3NszY7fdSPhSB/9IUlyRzRjIDjij0KjtLt5ErLEbbYo0K/FPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcRbvoykgiID+/cRo8GtSmFyybY02S3RS865ek6AT/0=;
 b=is2QRjGxFIWqbZWB9MT6ja4YnbgtQUQ7cNL1wE36IZnnFPvqa0aaNMdy2xQ/PjmQvVUGzNHpoPUmdNtXCt5q5P5gZUiuYCMVij++DwStzuZ55g2QBOJSUHjC1jBsYOhkGg52YAcUinWmSVLOQ1lRwPISDTjOOx/Cmcx68zLzuVA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fac1898a-678b-47aa-a08c-ba910e216430@amd.com>
Date: Tue, 24 Sep 2024 22:48:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>,
	<dpsmith@apertussolutions.com>, <edgar.iglesias@amd.com>, Sergiy Kibrik
	<Sergiy_Kibrik@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com>
 <20240924162359.1390487-4-edgar.iglesias@gmail.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240924162359.1390487-4-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0070446a-d1e7-4fd9-c405-08dcdd0c7dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDJpMjFwOFJZMDlCUExDWnZoNkRsR3JsdnhLVjA3T25mckNnVS9WMzY0amZY?=
 =?utf-8?B?ZW9JOW9mdEFmZXdTenhheG5EN1psa3VlSDJsKzdYUTQzYlVFdExZZm1jVGZB?=
 =?utf-8?B?T1NDWXUxM0VTM2EzUGhoU0lDOUt0M2ExdmJqWlVtVHZHelNqeUZhd2hLMmxM?=
 =?utf-8?B?bzJjWklVYldGMDl3ZGVWTVFDaXQ0UktVTEtzdVVIUGR4dHlpRzZqMy92UVl6?=
 =?utf-8?B?NlNMSzR3cU9Ra3FPZ3RUU3A5aHJuTTNBUnhqVHROOXBsZUFKVXFMRzZrVXZu?=
 =?utf-8?B?UDFJOE1SUG81OW8xRUJ4QXdLcDFUSjRFd0U3QkRhRW1ERExXQlN2OUJwV0Y4?=
 =?utf-8?B?NlY4eTFucFgzWm4wNzNyblNscDFacEkxL0xjWVN0TEJLMFpkWUtFZGZUVnR4?=
 =?utf-8?B?VzVYVlVBWTZ1cWxwbnpvQlRhZURZWTROUmd1dGdKWUxLOTYwcURkTjlMazRY?=
 =?utf-8?B?Z0FoaEp3WHdFV0FVaVlSejdSajVZNW1pWnRQYjY0K1JwS0p2dndGRFZWRm1t?=
 =?utf-8?B?eUYyTmdPSzhVUGJvTStFNXg2VXhGc09Od2xXdnZmNnI2d08vQ0JaRkl4VVJG?=
 =?utf-8?B?UFRrSjMvVVlMZW45R0xyam5CM0ZnaTlKWCtZOWMyblE3UnhhaDAxek41TmdJ?=
 =?utf-8?B?WVJsejlSb2orM2ZEcWpnd0MvdUhwSytvWHpQOVF3V2NybVkvVnpubWRLeXZC?=
 =?utf-8?B?ZGM2Y09QK2doMHVteVdJVHV3Mndwa20wODNjcjZGVkRmd2Zja0NyaHF3Yjdj?=
 =?utf-8?B?MStzUGdnVnpzOGtnTmN3aVJNdlRsaktKemhtWnVTZ3dKZEdTcEs2NitzcGhJ?=
 =?utf-8?B?L0trb3cwT3puRGsrbTBKMFRzR0tiNDJNNVFibnNSUFpiTFpONXMyMEJqRWJL?=
 =?utf-8?B?SjhsWXc0dlEvT1VySEttcjRodDJkYlRwK28vZXFDVWZGbFd0ZnhNWTBFckh4?=
 =?utf-8?B?QnE1ZkR6OEQ3T1NIbktjQ3lkNFBWcFlYY1RqQmVoM0MyZHRkS0k0dlZoeXdz?=
 =?utf-8?B?VXd2Z3E3YWZ0OEhCNTVqT2ZielRYOEVHdy9mSU1LcHhVQ1BqVk9Id1Y1TWNP?=
 =?utf-8?B?dVFtcjRuT2VIdGVZcHlSN2x0R1ZpandaWFkzbk8yb3paN2MvMWVHTFFadnZD?=
 =?utf-8?B?aHdIbVJBYUJmelJzbU01UWhDaFp3QzRxUExIZjlVeG16Ym5rU3FVVlVQcEUw?=
 =?utf-8?B?R3JjUXFlOHZtSWp5bFZ0RXJsNVRmblVBOG9ZVDZKaW4rSk9PMDNrdjJTWUdY?=
 =?utf-8?B?N0I4RHJBRWhsWUU0c0xEREZ4QUtTK1hFbHEwZjluM1pwRE5yc1RMWTNralRY?=
 =?utf-8?B?MEo2YnNPL05DL1djK1FhVVo1cmMyQ001Q0pTcTFxRCs3RGxPYmU5WHdodk8z?=
 =?utf-8?B?eUJySEd4K3VzQnJzRUJtOW5hNHo5eWNncU9wdkJ4bWo3OWVGS3BBSlhlZTQx?=
 =?utf-8?B?UEhpVHZCUXBici9RLzNWS3crbWVVMGhuWVVTQ2gwVTdmRUQ1MVJzRVJ5MlBF?=
 =?utf-8?B?TGRoUlNhU0VhN24xQWZjNHRUUmphQlNnQ0xVVFNRYUFvejVtR3pKVDg0UzR4?=
 =?utf-8?B?NEs5MGVrWC9MM1pzeHRMWnQzWU12Vll2T0tTcFRmOTlXVUdUbWgzeDRVaDNy?=
 =?utf-8?B?NGpMOVhQYzJhOW5nK1VTVWdXWC8xbE15TzdUellOU3pHM0JKc2ZSRFFJTnd4?=
 =?utf-8?B?N1ZxOTgvbzFuT1pLOGxzelNJV3RQNVhOOVBpQjl4ZXlBclZKU3pNcUdFVkQz?=
 =?utf-8?B?NGtPYWdIYTZ1Uk9VVlBMSFgzR29JM0x0QTd0K2NqRmsrdkl2ckxqN1lrY0ZB?=
 =?utf-8?B?TmVkWVhKSWw4SlBiWWNiQT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 02:48:09.8379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0070446a-d1e7-4fd9-c405-08dcdd0c7dc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211

On 9/24/24 12:23, Edgar E. Iglesias wrote:
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 09b65e44ae..dab24fa9e2 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -586,6 +586,189 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
>      return res;
>  }
>  
> +static int __init make_virtio_pci_domU_node(const struct kernel_info *kinfo)
> +{
> +    void *fdt = kinfo->fdt;
> +    /* reg is sized to be used for all the needed properties below */
> +    __be32 reg[(1 + (GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS)
> +               * 2];
> +    __be32 irq_map[4 * 4 * 8];
> +    __be32 *cells;
> +    char buf[22]; /* pcie@ + max 16 char address + '\0' */
> +    int res;
> +    int devfn, intx_pin;
> +    static const char compat[] = "pci-host-ecam-generic";
> +    static const char reg_names[] = "ecam";
> +
> +    if ( p2m_ipa_bits <= 40 ) {
> +        printk("PA bits %d is too small!\nvirtio-pci is only supported "
> +               "on platforms with PA bits > 40\n", p2m_ipa_bits);
> +        return -EINVAL;
> +    }
> +
> +    snprintf(buf, sizeof(buf), "pcie@%lx", kinfo->virtio_pci.ecam.base);
> +    dt_dprintk("Create virtio-pci node\n");
> +    res = fdt_begin_node(fdt, buf);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "compatible", compat, sizeof(compat));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_string(fdt, "device_type", "pci");
> +    if ( res )
> +        return res;
> +
> +    /* Create reg property */
> +    cells = &reg[0];
> +    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                       kinfo->virtio_pci.ecam.base, GUEST_VIRTIO_PCI_ECAM_SIZE);
> +
> +    res = fdt_property(fdt, "reg", reg,
> +                       (GUEST_ROOT_ADDRESS_CELLS +
> +                        GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "reg-names", reg_names, sizeof(reg_names));
> +    if ( res )
> +        return res;
> +
> +    /* Create bus-range property */
> +    cells = &reg[0];
> +    dt_set_cell(&cells, 1, 0);
> +    dt_set_cell(&cells, 1, 0xff);
> +    res = fdt_property(fdt, "bus-range", reg, 2 * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#address-cells", 3);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#size-cells", 2);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_string(fdt, "status", "okay");
> +    if ( res )
> +        return res;
> +
> +    /*
> +     * Create ranges property as:
> +     * <(PCI bitfield) (PCI address) (CPU address) (Size)>
> +     */
> +    cells = &reg[0];
> +    dt_set_cell(&cells, 1, GUEST_VIRTIO_PCI_MEM_TYPE);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, GUEST_VIRTIO_PCI_MEM_SIZE);
> +    dt_set_cell(&cells, 1, GUEST_VIRTIO_PCI_PREFETCH_MEM_TYPE);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.pf_mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, kinfo->virtio_pci.pf_mem.base);
> +    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, GUEST_VIRTIO_PCI_PREFETCH_MEM_SIZE);
> +    res = fdt_property(fdt, "ranges", reg, 14 * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "dma-coherent", "", 0);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#interrupt-cells", 1);
> +    if ( res )
> +        return res;
> +
> +    /*
> +     * PCI-to-PCI bridge specification
> +     * 9.1: Interrupt routing. Table 9-1
> +     *
> +     * the PCI Express Base Specification, Revision 2.1
> +     * 2.2.8.1: INTx interrupt signaling - Rules
> +     *          the Implementation Note
> +     *          Table 2-20
> +     */
> +    cells = &irq_map[0];
> +    for (devfn = 0; devfn <= 0x18; devfn += 8) {
> +        for (intx_pin = 0; intx_pin < 4; intx_pin++) {
> +            int irq = GUEST_VIRTIO_PCI_SPI_FIRST - 32;
> +            irq += ((intx_pin + PCI_SLOT(devfn)) % 4);
> +
> +            dt_set_cell(&cells, 1, devfn << 8);
> +            dt_set_cell(&cells, 1, 0);
> +            dt_set_cell(&cells, 1, 0);
> +            dt_set_cell(&cells, 1, intx_pin + 1);
> +            dt_set_cell(&cells, 1, kinfo->phandle_gic);

Here we will also want a parent unit address (GIC unit address). The
number of cells is determined by the vGIC node's #address-cells. See
section 2.4.3 in [1].

Also take a look at EPAM's libxl implementation, in the function
create_virtio_pci_irq_map() [2].

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
[2] https://lore.kernel.org/xen-devel/20231115112611.3865905-4-Sergiy_Kibrik@epam.com/

> +            /* 3 GIC cells.  */
> +            dt_set_cell(&cells, 1, 0);
> +            dt_set_cell(&cells, 1, irq);
> +            dt_set_cell(&cells, 1, DT_IRQ_TYPE_LEVEL_HIGH);
> +        }
> +    }
> +
> +    /* Assert we've sized irq_map correctly.  */
> +    BUG_ON(cells - &irq_map[0] != ARRAY_SIZE(irq_map));
> +
> +    res = fdt_property(fdt, "interrupt-map", irq_map, sizeof(irq_map));
> +    if ( res )
> +        return res;
> +
> +    cells = &reg[0];
> +    dt_set_cell(&cells, 1, cpu_to_be16(PCI_DEVFN(3, 0)));
> +    dt_set_cell(&cells, 1, 0x0);
> +    dt_set_cell(&cells, 1, 0x0);
> +    dt_set_cell(&cells, 1, 0x7);
> +    res = fdt_property(fdt, "interrupt-map-mask", reg, 4 * sizeof(*reg));
> +    if ( res )
> +        return res;
> +
> +    if ( kinfo->virtio_pci.mode == VIRTIO_PCI_GRANTS )
> +    {
> +        cells = &reg[0];
> +        dt_set_cell(&cells, 1, 0x0);
> +        dt_set_cell(&cells, 1, GUEST_PHANDLE_IOMMU);
> +        dt_set_cell(&cells, 1, 0x0);
> +        dt_set_cell(&cells, 1, 0x10000);
> +        res = fdt_property(fdt, "iommu-map", reg, 4 * sizeof(*reg));
> +        if ( res )
> +            return res;
> +    }
> +
> +    res = fdt_property_cell(fdt, "linux,pci-domain", 1);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_end_node(fdt);
> +    if ( res )
> +        return res;
> +
> +    if ( kinfo->virtio_pci.mode == VIRTIO_PCI_GRANTS )
> +    {
> +        snprintf(buf, sizeof(buf), "xen_iommu");
> +
> +        res = fdt_begin_node(fdt, buf);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "compatible", "xen,grant-dma");
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_cell(fdt, "#iommu-cells", 1);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_end_node(fdt);
> +    }
> +
> +    return res;
> +}

