Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D927B02334
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 19:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041418.1412248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaI1F-0001T4-Mz; Fri, 11 Jul 2025 17:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041418.1412248; Fri, 11 Jul 2025 17:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaI1F-0001Ra-JA; Fri, 11 Jul 2025 17:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1041418;
 Fri, 11 Jul 2025 17:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mu1t=ZY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uaI1F-0001RU-2r
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 17:58:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2009::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc43cf8-5e80-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 19:58:42 +0200 (CEST)
Received: from SJ0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:a03:3a0::22)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 11 Jul
 2025 17:58:37 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::f6) by SJ0PR03CA0257.outlook.office365.com
 (2603:10b6:a03:3a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 17:58:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 17:58:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 12:58:35 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Jul 2025 12:58:34 -0500
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
X-Inumbo-ID: adc43cf8-5e80-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWFcT2CLrmu8rhCvUr0IgXBcZBF0h+c2qcsfyjF7bJbP2pzULxnCY9mT3vjOtUmuhH4xvsAE4tltmpO4PlLZW0R7cR+JBwKvZLzdtYAw5VKPl2QpUPz8QmooKzG3Tgq63JDsQWNaYcq6U1IaEVSH9vz/CL4T9xr7Ir2LJoAmYGbbEsm//LdNGeVk+dwKR8VFu1+owkW6q0hSn2ziN7la5s8sSEv1SKIbrGDeB9jgS7q+jeMlghD+7cjwzQ8GIPUSsOi/Jvd3+qxd28bhYmNL9l5WQBV9r01VHpD4ZTQqockaUcJZ5QcaP9+R24iO3JmWc6dzPnRcjBaURRgd6dk3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB5Z+aODOmJlJvhLYZlobcx9AhLhhoKMf4cLmuJwCgU=;
 b=dcFWuJqOJzNeChopx4HPuwtLEbigL3h9iPifeqEwpz9he9d65Yg7Ad0Tn9xmkowm399z/n/bTpF+kBFPJ3yxOYp56wEavl0w/eXumZTPrIctWS3koFbMmjd/N7nkm7Pm0bwlFFkOe/RoIYOEGlL0ouJXEnGXel1MbfiyMwZ9oiA/F05RskgkVNdIJ1ZkEsNuZEAar7607ojylOvEDChi6AXnDFXbvpjQOXPXrvRa+MiMCAu9w4TDYd6j1G8fzReT/DJelroyyvDXnf2uKlvVRbqF+Kc+kGINaQvk7N28MMJQt7G5qgTP6JNOIKAVuw775CbUPlsNTaNHc6tzurCytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB5Z+aODOmJlJvhLYZlobcx9AhLhhoKMf4cLmuJwCgU=;
 b=gc1FwLpjpysd9344eqojcMPRBWKB+JPqRI8IhVovZxM0FEa3PaM3KnmBTYUBoagsvpyCwygYttTTTfj5Bwg0CLqwSB4JH3QZVHqbZBmp961/ggImTNk743cK2D6ESnmvOYTU4vW16fDIVeprDP4LTlt9op8e7S7gvLUkk/mVYa0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <336e1f34-7279-4d9b-9ede-fb66ded7dae3@amd.com>
Date: Fri, 11 Jul 2025 13:58:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	<jason.andryuk@amd.com>
References: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DS0PR12MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 181c6ab0-68c1-49d2-372a-08ddc0a48f03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmU5Y2g2Uno0cE80aHhubWZuVldJRlRvRmI0R0padnliM1lRbDRWSkIralNq?=
 =?utf-8?B?c3VEdzVUTUlTMTdmNDBQdm96Z1RMTVhnRzhvQXdWcGtQYWUyTzNIcGlhSlFw?=
 =?utf-8?B?ZjNYZmFPY21vSjRWcHZER0g2cC9QczVkZzlIZlYrSU9OUGZyZjRncGNmQlhW?=
 =?utf-8?B?M3JoVXN3OWp5dldMVkswd1JsRHBnalFKRnVlTDE3ZngyZjcxd1d2WFdnMFVq?=
 =?utf-8?B?RzNwWE5iV0VER1daMDlxV2VmWDhOME4zUklVL2VRZHNhcmxEUGp2Sy8zbW9p?=
 =?utf-8?B?T2VDQk1oVkhFdkZsK3QyZzZwSUpzZUVDUEhTSDlOOXFqU2F3ZUdDRHdjR0RJ?=
 =?utf-8?B?aHRCWk9RaC9tOE9ueTB4eHpPSExiV1MxNnU2WjVNL1NBS1RjbXN2Qm9OQzF1?=
 =?utf-8?B?b0xrc1pNQnVjZnNNRXZneFdjOGdDRUtxVFptc1pSVFN1SXh1Qi9PVDBvTEVK?=
 =?utf-8?B?by9uRWo0Qzg5dnFMOGRzZ2h1RDdCdXhmQXlVNkc2SEJCS3ArSWlpU1lkYVQ0?=
 =?utf-8?B?TDRUakx4QkFsamp1OWFwS0RkTk9KUDhqSWxFZ1BtSDFBMXF0M0JwNEdZdWg1?=
 =?utf-8?B?emdhVC90YjZ4TjVpMGJkV1FWeTlDUEZuYzR4ZVE2YmlSSnZaYkt0UkMwYVVp?=
 =?utf-8?B?M09DNzZ1d1FLcGtWSy80NzVrdXdvclBTaS9RODFRRmR4cWpldUR6d2FyU0VG?=
 =?utf-8?B?NU9xcGR3aGROMlJjdmNrdUU1ZXB3UTYyR0ZkTGdxSW1QTURPR1FoQnVaUjJG?=
 =?utf-8?B?SDhGUXVQWmZqbmFRV0V0NUI4SElFZ21pVFoybXBPRTRKVzlFTUYzZjVDWHNz?=
 =?utf-8?B?UHJqS21LdHRsSEJQVUF5THlwazBGRk9rUTlrZjFkaTREb2Y1MmcrMjA0VjJD?=
 =?utf-8?B?L1ZRVjkzazVDenQ2VEg5YmhnSUlQMGdKeWt0ZFArZHQ0OWcrL1RUZ3RNbHp2?=
 =?utf-8?B?MklITjB2VFpIaytFdTdhWFpvZWcwWU1LSEkxV3htZUVXV3YvY3RjazVPWFpY?=
 =?utf-8?B?QjhDbTI0cHRqUitieURVeGZIdjBkTUVwUnY4MGN4RkdpNWQwSmxuR2ZCNi9Q?=
 =?utf-8?B?MDVaVk1QOVNhb3Z4Y2IrbVJtWlZSL2NwZW9RemVLQm9zd3ZoQWV1Rlh2cFEr?=
 =?utf-8?B?aHd3Q2QzR0hXUERWM0lQbEdQbnJaOXpITVpoMWE1dkJqUFlwc3NZU0dtc2tj?=
 =?utf-8?B?UU9uQUhxQnp6dGZralZnQjQ5Nk5ZbWlmelJOM0MrcGFsdUFNQ1p2bFcraVlU?=
 =?utf-8?B?R0JQSnVjcXhXRFhoN2NMTHVGaUNybG9hdWdIU1BwOU5qUXFiRnZNbmdYeXZI?=
 =?utf-8?B?MnN5azE1NkRPNWJkWFEvZDZISktTTXlheklEV0xuYktYNm9JRWkxejNCbTV6?=
 =?utf-8?B?cHhFcUh4L2xuQzAwV2hKZ3BXQVBHZ3dVV2VQcFlSdGc3Q3FLSjFuaG5hNTlm?=
 =?utf-8?B?RkVVUWlzaFNWWTdrNWZRK0o1VG5uS0d4V0hDWGpRM1I1THliVjZWZ1VIR2Qr?=
 =?utf-8?B?OGxRWUhBSm10SWxsaTIxa0JZNXdMT3g0eWYwRGRJR2VoR3NBOWd6eEFIV29G?=
 =?utf-8?B?QkFyMjA3QUloWTVUYXlZSzVOMEVia05rUGZhZzlzOTBlR05sY2psblZZQkRO?=
 =?utf-8?B?NEI1RlF2Sm84WWxhc1JtZ2gxZ3E0VTNnSGhKUzM4aHFCdWRQUEdQUWFqelht?=
 =?utf-8?B?TmdqK3ZQV3BnOHlTc2p1aFEwd29nc3BCcTZ4MTdFT0YwVVUyY3F3aVB1K2wv?=
 =?utf-8?B?QjF1S0trcTJZa0dWb2xyaTN3Vm9KWjJoTDBvdEpXVGEzRVBkMCtGa2dFam90?=
 =?utf-8?B?aUc1L3hWT3Q3bFh2THlYcS9EbmFlYXhZeitWYXFxU21TS1NZV0Rtdk41U1p3?=
 =?utf-8?B?OW5DNWFwb2JkZjBNeG92MFVqbitKYUxrNmhTMFhKNWJoN2ZMc1RMdDZ3dWs2?=
 =?utf-8?B?cEFTZUExeGlHRGJVcHRLTUIrRkRnN2pFRnlDdWFreU05RzBnRzJTSU1uNFRQ?=
 =?utf-8?B?dU1KZ1g1TXN6cVBXS3FOc2NHcVFIME9nRFFqVllEWXoyQmhTcVR2Q0crc1lM?=
 =?utf-8?Q?YQ/A+1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 17:58:36.1633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 181c6ab0-68c1-49d2-372a-08ddc0a48f03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533

On 7/10/25 20:25, Stefano Stabellini wrote:
> Up until f9f6b22ab "xen/arm: Map ITS doorbell register to IOMMU page
> tables" the only caller of iommu_map on ARM was grant_table.c which has
> a specific usage model and restrictions as described by the in-code
> comment in arm_iommu_map_page.
> 
> f9f6b22ab introduced a second caller to iommu_map on ARM:
> vgic_v3_its_init_virtual. This specific statement in the
> f9f6b22ab commit message is wrong:
> 
> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
> virtual ITSes are currently only created for hwdom where the doorbell
> mapping is always 1:1."
> 
> Leading to crashes any time the hardware domain is not direct-mapped
> (e.g. cache coloring and non-Dom0 hardware domain):
> 
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
> [...]
> (XEN) Xen call trace:
> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
> 
> Specifically, non-1:1 hardware domain exists with cache coloring
> enabled. For that, is_domain_direct_mapped(d) is false but
> domain_use_host_layout(d) is true.
> 
> At a minimum, we need to change the is_domain_direct_mapped(d) check in
> arm_iommu_map_page into a domain_use_host_layout(d) check. But in
> preparation of exposing vITS to domUs, let's take this opportunity to
> generalize the arm_iommu_map_page function further to be more generic
> and unopinionated. Move the in-code comment specific to the grant table
> can live in grant-table.c instead.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> ---
>  xen/common/grant_table.c                    | 10 ++++++++--
>  xen/drivers/passthrough/arm/iommu_helpers.c | 13 +------------
>  2 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index cf131c43a1..2e08dac656 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1274,8 +1274,14 @@ map_grant_ref(
>          }
>  
>          /*
> -         * We're not translated, so we know that dfns and mfns are
> -         * the same things, so the IOMMU entry is always 1-to-1.
> +         * Grant mappings can be used for DMA requests. The dev_bus_addr
> +         * returned by the hypercall is the MFN (not the IPA). For
> +         * device protected by an IOMMU, Xen needs to add a 1:1 mapping
> +         * in the domain p2m to allow DMA request to work. This is only
> +         * valid when the domain is directed mapped.
> +         *
> +         * We're not translated, so we know that dfns and mfns are the
> +         * same things, so the IOMMU entry is always 1-to-1.
>           */
>          if ( !(op->flags & GNTMAP_readonly) && node.cnt.wr == 1 )
>              kind = IOMMUF_readable | IOMMUF_writable;
> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
> index 5cb1987481..dae5fc0caa 100644
> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>  {
>      p2m_type_t t;
>  
> -    /*
> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
> -     * returned by the hypercall is the MFN (not the IPA). For device
> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
> -     * p2m to allow DMA request to work.
> -     * This is only valid when the domain is directed mapped. Hence this
> -     * function should only be used by gnttab code with gfn == mfn == dfn.
> -     */
> -    BUG_ON(!is_domain_direct_mapped(d));
> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
> -
>      /* We only support readable and writable flags */
>      if ( !(flags & (IOMMUF_readable | IOMMUF_writable)) )
>          return -EINVAL;
> @@ -57,7 +46,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>       * The function guest_physmap_add_entry replaces the current mapping
>       * if there is already one...
>       */
> -    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
> +    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), mfn,
>                                     IOMMUF_order(flags), t);
>  }
>  


