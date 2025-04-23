Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A5A997FD
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 20:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965147.1355771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7evd-0001yD-MK; Wed, 23 Apr 2025 18:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965147.1355771; Wed, 23 Apr 2025 18:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7evd-0001wk-JZ; Wed, 23 Apr 2025 18:34:37 +0000
Received: by outflank-mailman (input) for mailman id 965147;
 Wed, 23 Apr 2025 18:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXFY=XJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u7evb-0001we-TD
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 18:34:36 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2416::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9909a5ea-2071-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 20:34:33 +0200 (CEST)
Received: from SJ0PR05CA0100.namprd05.prod.outlook.com (2603:10b6:a03:334::15)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 18:34:28 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::65) by SJ0PR05CA0100.outlook.office365.com
 (2603:10b6:a03:334::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Wed,
 23 Apr 2025 18:34:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 18:34:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 13:34:27 -0500
Received: from [172.20.75.239] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 13:34:26 -0500
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
X-Inumbo-ID: 9909a5ea-2071-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivI2Xc7eUgLD3vLw74K+tKVB2tGyFlVE6feN41G3DsFut7X5Zrr29pKbZ2+IwKYMluozkd/AU5pGBT3H/GuYJTsy9l5SxcgP3Wqs1nwkQ3C2EMRlAtzIJtYRY/X4ikNJ36laYFCn4h3uaAEirJ+FOQ80fRUA4MO+sUNucytzTB7xr9qpIDPS18ztDpK1IZ+AalGSRxbSFloMXRyahYShfARBiWJ6K79wGmk5pMz14wFtm0UywtYZ/7tm8YN6YhRc6LmvZ7SMN/TIQOhnpl6x4Kqqy3qayV+JLCt6fo0BWnC4orbyInp5bUjW6bwlWRJhijgDd0iE70e9ii2+g+rKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP2ltlmkeyFZZ5QDbZe7NGKMLZXS335p9/4GiOQ5ybY=;
 b=lddctWHSSywrKxw5rjW8KC6kUPop+n3GppZ3Thv5vIsc3Juq7FxxIjKc9+V2OxVUN2TkI5+24PHb0WETI78Q8gZA1hDd4XiU6/ZW86TPG/OXu3PcHnLJvUq1p04tMBzevn3WKynHBrN2M/cXrLdpJNyy8NWqq+AKl2G8bAI1jd3dHicrUBztIeKLawT+YY2B4Hrxiij8hIYCj+bzGq/xU2Nren3/gyw1yU8CuofaivdJbS2MrJpnmBTGqk8OXg8QyFxsRsPlZ4eZT8dsvjhppwj0EBBt3fsjNJb7SxhmQqnP9aG2bAdYtfv2mE14VOnGiQGoO9v3aiYMhFddHO71XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nP2ltlmkeyFZZ5QDbZe7NGKMLZXS335p9/4GiOQ5ybY=;
 b=1rDZuh0yrGg+4JmLHzCAzXfP1RY9QCXATsNhbQ/Q4PLAw2wYvfcBWVeXZCOh5ElmhGu7iGCGLY0H7HwkXFuEqbHhGi6qmSUgi4HrkOBokWSocyfAaxpQKFOre2kG4lWS2sSNVjSmmvYpKV4folPmWgtnEFuyIxSv/B8LZeSjZ5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3faee6ec-803d-4622-a729-38047c796c77@amd.com>
Date: Wed, 23 Apr 2025 14:34:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] xen/arm: add support for PCI child bus
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
 <79bbb6705638445526bbd1fa299b7bfd0d087462.1745402473.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <79bbb6705638445526bbd1fa299b7bfd0d087462.1745402473.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf8b93e-c461-42fb-660a-08dd82957b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmVZQTlwcWRKQUFJUGlHalVXTk9OQ3JtaHljZEVRTkNPYlZ3V3FDY0o0d2hV?=
 =?utf-8?B?MnBwVWw3RWxGZFVydVc2cHRia0x4T0pJcU1TcnpuUy80SnJaYStxQlQxZjZx?=
 =?utf-8?B?bVJzQUdRRUhqUStpeXRicEpyTUtWTk1HQjVZeXVwVC9jcVlLVTBwRXZVN1ZK?=
 =?utf-8?B?MkxQZ3BLVEt1Z2R1RUJ5Q2V1eG9RVTlvZGNrQWwrQmFWQ1pZTDZ3SXdVTGVZ?=
 =?utf-8?B?aS9wUTdaUUVqcHFPdzBaaFYrUnRrbG9qbG9pek5zMU45UXFIeElYUE5ka2Rv?=
 =?utf-8?B?V05Hd29ta3MzYjF0L1d4eVliYmdKaHB4N0tUeC9PMy8zMFNWeUJSaVZaMG5H?=
 =?utf-8?B?RmM1UVNaVWtycDM1WFgweHoyZXR1Y2szeXZHcE96VE1sQ2ZxckJ1d2tyaUo3?=
 =?utf-8?B?eE4yYjl1ampRdHpFWFNrekFIRjQyNkhUZlN5MHZQekhnQnc5bElHeW9sQW9K?=
 =?utf-8?B?TEFiSU1BUXhSTWJVMXZMMnNFK1lsZUxDYTlDSHZQdmI5dFprZEFTQ2FSL0w3?=
 =?utf-8?B?bitPMlR5VmEweUh5MmFPdENOL2VBS2kvU0Q1WEhXS2tlamhYM2xVY0lBU3J4?=
 =?utf-8?B?S1E2Y0phT0FmUUZDSzNadi9yVzVwUU1xYnpGZFl6aFQyKytCUWdmbTJrZ05S?=
 =?utf-8?B?Smk2Q1g3am9IcGNSWEE1YTJqSWtLOWRCQkEybUZlMEJsYkczWVdqVEYrVVVx?=
 =?utf-8?B?bS9TbTF1cjRyZXpLb2VLZC9JeXVCNFJ0UFgwODlOT3JjZkV5Znc4UjZYYXhn?=
 =?utf-8?B?bjF1N0F6Ukk0RzZ0WWtWMkdzUUF6U0xUMlZabEZ3dzFJN0NZYldwUnpjZHM5?=
 =?utf-8?B?ejFIMGw2TERJdTV1Y1c5ck1YYTFYdDdCWldnS0NMTlZNNGZnd3pvZS84WDZa?=
 =?utf-8?B?NTV1eDJ2cGNZOFJpeUU1NmFnY2xzemlrS0dSUXp2dWtIcVgvV0w4L3pVME5t?=
 =?utf-8?B?Sk1DelJvM3h1UTliUHk0cWRaWmR3ZXUvV1BKSnp3SXlMTHFVUVJSNVpsc3lZ?=
 =?utf-8?B?MU9kZlFrU00zMERpRUdWUkdKdmE5dUxWSVJrcW03VDVscGJHV1QvRUpCV3RH?=
 =?utf-8?B?QlNZaWZCL2ZPUEdlcGxFMHRqQXMwdnY1eEg4M0xtMWlVd1drTEtuMkx3OVJ3?=
 =?utf-8?B?dVV0N1A1ai9ubVQ5YnNUNFBLczV4SmUwdk9QbUkydVVEQ25oMXZSVjhhYW8z?=
 =?utf-8?B?MHowTWtoZjQ3TUJkZHliQzY2QWpFZWNNRnZPRkIwL0lsUEpyZVVva2dMVUEx?=
 =?utf-8?B?ZUQ2Sm9TaWJMTzFWM2s2Ui95cHZOdEV5blMxUXJjYzZZUncvb0ZwaHM0d1A3?=
 =?utf-8?B?RFlIWHZYTU1MSDdZZG1sRWZhZjJiU0lSUUo1bDZaejlaTmNIVUFqcVBVVEtj?=
 =?utf-8?B?aEVpcmp3UnhrdGpyQnl1dHN2THZORnU1YkZSM1NuSFdXalREb1pKczRQcFpE?=
 =?utf-8?B?QUFacFVjMmZ5emhvclVEbS9wKzZaMmlVc0pSTzhQUzYrVTRGemw2dkhJVkFJ?=
 =?utf-8?B?TFoxamRjT2ZhelcyUHl1cytNLys5N0lZUXI0cHZwdk8va2JsVXYvNEtwZVBW?=
 =?utf-8?B?MXpNY0pOMTMxNFE5Njg2NDhVUnhrbGZMamljSHl6c2RKSldOb0xleEJsQ2pY?=
 =?utf-8?B?cnhpU2xQTmpmYkpLa2o4YzN5Qi85RmxKSUtnZURWUW9oL1FxV2RDVlZNek1I?=
 =?utf-8?B?SWRvdVFKc1JCYUFjc1l2ZWQ3ZVdzRHhyVjR4YUYyWXdsMGhGa3dEN1Bwb2tY?=
 =?utf-8?B?MVVzbzNkcWljR1VVZlk3OE9BRHU2SUdxOE9pTkhZbDhEbWZTVTlyejNBYkFh?=
 =?utf-8?B?dlFaTWRKQW4ySTlDYXlxU2FvbjRvbG0yaERxMVJkdVN4YmlQSTNvNTRSOSt5?=
 =?utf-8?B?a0ZYYWU0VlZJS3Vnd1YxUEsrOHRDSHlVaFZBRUxvMHVzSHlyKzhwM05RZ2Nn?=
 =?utf-8?B?SGlqVWpETVpkcDBFZ1hoL2VRMStheDBCeVUwMmgySHJsa1MvOVhuNzhVMFhi?=
 =?utf-8?B?ckpqTTdHQ0N3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 18:34:28.1220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf8b93e-c461-42fb-660a-08dd82957b0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341

On 4/23/25 07:08, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> PCI host bridges often have different ways to access the root and child
> bus configuration spaces. One of the examples is Designware's host bridge
> and its multiple clones [1].
> 
> Linux kernel implements this by instantiating a child bus when device
> drivers provide not only the usual pci_ops to access ECAM space (this is
> the case for the generic host bridge), but also means to access the child
> bus which has a dedicated configuration space and own implementation for
> accessing the bus, e.g. child_ops.
> 
> For Xen it is not feasible to fully implement PCI bus infrastructure as
> Linux kernel does, but still child bus can be supported.
> 
> Add support for the PCI child bus which includes the following changes:
> - introduce bus mapping functions depending on SBDF
> - assign bus start and end for the child bus and re-configure the same for
>   the parent (root) bus
> - make pci_find_host_bridge be aware of multiple busses behind the same bridge
> - update pci_host_bridge_mappings, so it also doesn't map to guest the memory
>   spaces belonging to the child bus
> - make pci_host_common_probe accept one more pci_ops structure for the child bus
> - install MMIO handlers for the child bus

Nit: perhaps clarify that they are only installed for the hardware domain

> - re-work vpci_mmio_{write|read} with parent and child approach in mind
> 
> [1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dwc
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v3->v4:
> * remove changes to pci_ecam_map_bus
> * make map_bus inline
> * fix logic error in pci_host_bridge_mappings
> 
> v2->v3:
> * no change
> 
> v1->v2:
> * fixed compilation issues
> ---
>  xen/arch/arm/include/asm/pci.h      |  9 ++-
>  xen/arch/arm/pci/pci-access.c       | 37 +++++++++++--
>  xen/arch/arm/pci/pci-host-common.c  | 86 +++++++++++++++++++++++------
>  xen/arch/arm/pci/pci-host-generic.c |  2 +-
>  xen/arch/arm/pci/pci-host-zynqmp.c  |  2 +-
>  xen/arch/arm/vpci.c                 | 83 ++++++++++++++++++++++------
>  6 files changed, 177 insertions(+), 42 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 3d2ca9b5b0..94ec63f3c8 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -67,6 +67,9 @@ struct pci_host_bridge {
>      uint16_t segment;                /* Segment number */
>      struct pci_config_window* cfg;   /* Pointer to the bridge config window */
>      const struct pci_ops *ops;
> +    /* Child bus */
> +    struct pci_config_window *child_cfg;
> +    const struct pci_ops *child_ops;
>      void *priv;                      /* Private data of the bridge. */
>  };
>  
> @@ -96,8 +99,10 @@ struct pci_ecam_ops {
>  /* Default ECAM ops */
>  extern const struct pci_ecam_ops pci_generic_ecam_ops;
>  
> -struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
> -                                              const struct pci_ecam_ops *ops);
> +struct pci_host_bridge *
> +pci_host_common_probe(struct dt_device_node *dev,
> +                      const struct pci_ecam_ops *ops,
> +                      const struct pci_ecam_ops *child_ops);
>  int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t *value);
>  int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> diff --git a/xen/arch/arm/pci/pci-access.c b/xen/arch/arm/pci/pci-access.c
> index 9f9aac43d7..91271973fb 100644
> --- a/xen/arch/arm/pci/pci-access.c
> +++ b/xen/arch/arm/pci/pci-access.c
> @@ -18,10 +18,31 @@
>  #define INVALID_VALUE (~0U)
>  #define PCI_ERR_VALUE(len) GENMASK(0, len * 8)
>  
> +static const struct pci_ops *get_ops(struct pci_host_bridge *bridge,
> +                                     pci_sbdf_t sbdf)
> +{
> +    if ( bridge->child_ops )
> +    {
> +        struct pci_config_window *cfg = bridge->child_cfg;
> +
> +        if ( (sbdf.bus >= cfg->busn_start) && (sbdf.bus <= cfg->busn_end) )
> +            return bridge->child_ops;
> +    }
> +    return bridge->ops;
> +}
> +
> +static inline void __iomem *map_bus(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
> +                             uint32_t reg)
> +{
> +    const struct pci_ops *ops = get_ops(bridge, sbdf);
> +
> +    return ops->map_bus(bridge, sbdf, reg);
> +}
> +
>  int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                              uint32_t reg, uint32_t len, uint32_t *value)
>  {
> -    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
> +    void __iomem *addr = map_bus(bridge, sbdf, reg);
>  
>      if ( !addr )
>      {
> @@ -50,7 +71,7 @@ int pci_generic_config_read(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>  int pci_generic_config_write(struct pci_host_bridge *bridge, pci_sbdf_t sbdf,
>                               uint32_t reg, uint32_t len, uint32_t value)
>  {
> -    void __iomem *addr = bridge->ops->map_bus(bridge, sbdf, reg);
> +    void __iomem *addr = map_bus(bridge, sbdf, reg);
>  
>      if ( !addr )
>          return -ENODEV;
> @@ -78,14 +99,16 @@ static uint32_t pci_config_read(pci_sbdf_t sbdf, unsigned int reg,
>  {
>      uint32_t val = PCI_ERR_VALUE(len);
>      struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +    const struct pci_ops *ops;
>  
>      if ( unlikely(!bridge) )
>          return val;
>  
> -    if ( unlikely(!bridge->ops->read) )
> +    ops = get_ops(bridge, sbdf);
> +    if ( unlikely(!ops->read) )
>          return val;
>  
> -    bridge->ops->read(bridge, sbdf, reg, len, &val);
> +    ops->read(bridge, sbdf, reg, len, &val);
>  
>      return val;
>  }
> @@ -94,14 +117,16 @@ static void pci_config_write(pci_sbdf_t sbdf, unsigned int reg,
>                               unsigned int len, uint32_t val)
>  {
>      struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> +    const struct pci_ops *ops;
>  
>      if ( unlikely(!bridge) )
>          return;
>  
> -    if ( unlikely(!bridge->ops->write) )
> +    ops = get_ops(bridge, sbdf);
> +    if ( unlikely(!ops->write) )
>          return;
>  
> -    bridge->ops->write(bridge, sbdf, reg, len, val);
> +    ops->write(bridge, sbdf, reg, len, val);
>  }
>  
>  /*
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 53953d4895..1d0dc1b4bd 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -57,17 +57,12 @@ static void pci_ecam_free(struct pci_config_window *cfg)
>      xfree(cfg);
>  }
>  
> -static struct pci_config_window * __init
> -gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
> +static void __init gen_pci_init_bus_range(struct dt_device_node *dev,
> +                                          struct pci_host_bridge *bridge,
> +                                          struct pci_config_window *cfg)
>  {
> -    int err, cfg_reg_idx;
>      u32 bus_range[2];
> -    paddr_t addr, size;
> -    struct pci_config_window *cfg;
> -
> -    cfg = xzalloc(struct pci_config_window);
> -    if ( !cfg )
> -        return NULL;
> +    int err;
>  
>      err = dt_property_read_u32_array(dev, "bus-range", bus_range,
>                                       ARRAY_SIZE(bus_range));
> @@ -82,6 +77,36 @@ gen_pci_init(struct dt_device_node *dev, const struct pci_ecam_ops *ops)
>          if ( cfg->busn_end > cfg->busn_start + 0xff )
>              cfg->busn_end = cfg->busn_start + 0xff;
>      }
> +}
> +
> +static void __init gen_pci_init_bus_range_child(struct dt_device_node *dev,
> +                                                struct pci_host_bridge *bridge,
> +                                                struct pci_config_window *cfg)
> +{
> +    cfg->busn_start = bridge->cfg->busn_start + 1;

I read this as "the child bus number starts at the parent bus number
plus one". I'm not sure we want to hardcode this type of information in
a common file. Perhaps it would be better suited in pci-designware.c or
pci-host-rcar4.c. Could you pass the bus range init function pointer via
struct pci_ops?

> +    cfg->busn_end = bridge->cfg->busn_end;
> +    bridge->cfg->busn_end = bridge->cfg->busn_start;
> +
> +    printk(XENLOG_INFO "Root bus end updated: [bus %x-%x]\n",
> +           bridge->cfg->busn_start, bridge->cfg->busn_end);
> +}
> +
> +static struct pci_config_window *__init
> +gen_pci_init(struct dt_device_node *dev, struct pci_host_bridge *bridge,
> +             const struct pci_ecam_ops *ops,
> +             void (*init_bus_range)(struct dt_device_node *dev,
> +                                    struct pci_host_bridge *bridge,
> +                                    struct pci_config_window *cfg))
> +{
> +    int err, cfg_reg_idx;
> +    paddr_t addr, size;
> +    struct pci_config_window *cfg;
> +
> +    cfg = xzalloc(struct pci_config_window);
> +    if ( !cfg )
> +        return NULL;
> +
> +    init_bus_range(dev, bridge, cfg);
>  
>      if ( ops->cfg_reg_index )
>      {
> @@ -208,8 +233,10 @@ static int pci_bus_find_domain_nr(struct dt_device_node *dev)
>      return domain;
>  }
>  
> -struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
> -                                              const struct pci_ecam_ops *ops)
> +struct pci_host_bridge *
> +pci_host_common_probe(struct dt_device_node *dev,
> +                      const struct pci_ecam_ops *ops,
> +                      const struct pci_ecam_ops *child_ops)
>  {
>      struct pci_host_bridge *bridge;
>      struct pci_config_window *cfg;
> @@ -224,7 +251,7 @@ struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
>          return ERR_PTR(-ENOMEM);
>  
>      /* Parse and map our Configuration Space windows */
> -    cfg = gen_pci_init(dev, ops);
> +    cfg = gen_pci_init(dev, bridge, ops, gen_pci_init_bus_range);
>      if ( !cfg )
>      {
>          err = -ENOMEM;
> @@ -242,10 +269,29 @@ struct pci_host_bridge *pci_host_common_probe(struct dt_device_node *dev,
>          BUG();
>      }
>      bridge->segment = domain;
> +
> +    if ( child_ops )
> +    {
> +        /* Parse and map child's Configuration Space windows */
> +        cfg = gen_pci_init(dev, bridge, child_ops,
> +                           gen_pci_init_bus_range_child);
> +        if ( !cfg )
> +        {
> +            err = -ENOMEM;
> +            goto err_child;
> +        }
> +
> +        bridge->child_cfg = cfg;
> +        bridge->child_ops = &child_ops->pci_ops;
> +    }
> +
>      pci_add_host_bridge(bridge);
>  
>      return bridge;
>  
> +err_child:
> +    xfree(bridge->cfg);
> +
>  err_exit:
>      xfree(bridge);
>  
> @@ -280,9 +326,12 @@ struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t bus)
>      {
>          if ( bridge->segment != segment )
>              continue;
> -        if ( (bus < bridge->cfg->busn_start) || (bus > bridge->cfg->busn_end) )
> -            continue;
> -        return bridge;
> +        if ( bridge->child_cfg && (bus >= bridge->child_cfg->busn_start) &&
> +             (bus <= bridge->child_cfg->busn_end) )
> +            return bridge;
> +        if ( (bus >= bridge->cfg->busn_start) &&
> +             (bus <= bridge->cfg->busn_end) )
> +            return bridge;
>      }
>  
>      return NULL;
> @@ -348,6 +397,7 @@ int __init pci_host_bridge_mappings(struct domain *d)
>      {
>          const struct dt_device_node *dev = bridge->dt_node;
>          unsigned int i;
> +        bool need_mapping;
>  
>          for ( i = 0; i < dt_number_of_address(dev); i++ )
>          {
> @@ -363,7 +413,11 @@ int __init pci_host_bridge_mappings(struct domain *d)
>                  return err;
>              }
>  
> -            if ( bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr) )
> +            need_mapping = bridge->ops->need_p2m_hwdom_mapping(d, bridge, addr);
> +            if ( need_mapping || bridge->child_ops )
> +                need_mapping =
> +                    bridge->child_ops->need_p2m_hwdom_mapping(d, bridge, addr);

You're dereferencing child_ops without NULL-checking it.

> +            if ( need_mapping )
>              {
>                  err = map_range_to_domain(dev, addr, size, &mr_data);
>                  if ( err )
> diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
> index a6ffbda174..47cf144831 100644
> --- a/xen/arch/arm/pci/pci-host-generic.c
> +++ b/xen/arch/arm/pci/pci-host-generic.c
> @@ -29,7 +29,7 @@ static const struct dt_device_match __initconstrel gen_pci_dt_match[] =
>  static int __init pci_host_generic_probe(struct dt_device_node *dev,
>                                           const void *data)
>  {
> -    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops));
> +    return PTR_RET(pci_host_common_probe(dev, &pci_generic_ecam_ops, NULL));
>  }
>  
>  DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
> diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
> index a38f2e019e..75d1235aaf 100644
> --- a/xen/arch/arm/pci/pci-host-zynqmp.c
> +++ b/xen/arch/arm/pci/pci-host-zynqmp.c
> @@ -47,7 +47,7 @@ static const struct dt_device_match __initconstrel nwl_pcie_dt_match[] =
>  static int __init pci_host_generic_probe(struct dt_device_node *dev,
>                                           const void *data)
>  {
> -    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops));
> +    return PTR_RET(pci_host_common_probe(dev, &nwl_pcie_ops, NULL));
>  }
>  
>  DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index b63a356bb4..468aee1db7 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -8,15 +8,17 @@
>  #include <asm/mmio.h>
>  
>  static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
> -                                     paddr_t gpa)
> +                                     paddr_t gpa, bool use_root)
>  {
>      pci_sbdf_t sbdf;
>  
>      if ( bridge )
>      {
> -        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
> +        const struct pci_config_window *cfg = use_root ? bridge->cfg
> +                                                       : bridge->child_cfg;
> +        sbdf.sbdf = VPCI_ECAM_BDF(gpa - cfg->phys_addr);
>          sbdf.seg = bridge->segment;
> -        sbdf.bus += bridge->cfg->busn_start;
> +        sbdf.bus += cfg->busn_start;
>      }
>      else
>          sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
> @@ -24,11 +26,9 @@ static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
>      return sbdf;
>  }
>  
> -static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> -                          register_t *r, void *p)
> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info, register_t *r,
> +                          pci_sbdf_t sbdf)
>  {
> -    struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
>      const unsigned int access_size = (1U << info->dabt.size) * 8;
>      const register_t invalid = GENMASK_ULL(access_size - 1, 0);
>      /* data is needed to prevent a pointer cast on 32bit */
> @@ -46,31 +46,78 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      return 0;
>  }
>  
> -static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> -                           register_t r, void *p)
> +static int vpci_mmio_read_root(struct vcpu *v, mmio_info_t *info, register_t *r,
> +                               void *p)
> +{
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, true);
> +
> +    return vpci_mmio_read(v, info, r, sbdf);
> +}
> +
> +static int vpci_mmio_read_child(struct vcpu *v, mmio_info_t *info,
> +                                register_t *r, void *p)
>  {
>      struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, false);
> +
> +    return vpci_mmio_read(v, info, r, sbdf);
> +}
>  
> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info, register_t r,
> +                           pci_sbdf_t sbdf)
> +{
>      return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                             1U << info->dabt.size, r);
>  }
>  
> +static int vpci_mmio_write_root(struct vcpu *v, mmio_info_t *info, register_t r,
> +                                void *p)
> +{
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, true);
> +
> +    return vpci_mmio_write(v, info, r, sbdf);
> +}
> +
> +static int vpci_mmio_write_child(struct vcpu *v, mmio_info_t *info,
> +                                 register_t r, void *p)
> +{
> +    struct pci_host_bridge *bridge = p;
> +    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa, false);
> +
> +    return vpci_mmio_write(v, info, r, sbdf);
> +}
> +
>  static const struct mmio_handler_ops vpci_mmio_handler = {
> -    .read  = vpci_mmio_read,
> -    .write = vpci_mmio_write,
> +    .read = vpci_mmio_read_root,
> +    .write = vpci_mmio_write_root,
> +};
> +
> +static const struct mmio_handler_ops vpci_mmio_handler_child = {
> +    .read = vpci_mmio_read_child,
> +    .write = vpci_mmio_write_child,
>  };
>  
>  static int vpci_setup_mmio_handler_cb(struct domain *d,
>                                        struct pci_host_bridge *bridge)
>  {
>      struct pci_config_window *cfg = bridge->cfg;
> +    int count = 1;
>  
>      register_mmio_handler(d, &vpci_mmio_handler,
>                            cfg->phys_addr, cfg->size, bridge);
>  
> -    /* We have registered a single MMIO handler. */
> -    return 1;
> +    if ( bridge->child_ops )
> +    {
> +        struct pci_config_window *cfg = bridge->child_cfg;

This variable shadows the cfg variable of the same name at the top of
the function.

> +
> +        register_mmio_handler(d, &vpci_mmio_handler_child, cfg->phys_addr,
> +                              cfg->size, bridge);
> +        count++;
> +    }
> +
> +    return count;
>  }
>  
>  int domain_vpci_init(struct domain *d)
> @@ -101,8 +148,12 @@ int domain_vpci_init(struct domain *d)
>  static int vpci_get_num_handlers_cb(struct domain *d,
>                                      struct pci_host_bridge *bridge)
>  {
> -    /* Each bridge has a single MMIO handler for the configuration space. */
> -    return 1;
> +    int count = 1;
> +
> +    if ( bridge->child_cfg )
> +        count++;
> +
> +    return count;
>  }
>  
>  unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)


