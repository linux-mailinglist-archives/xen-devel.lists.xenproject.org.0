Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3348C80C6
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 08:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723822.1128907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7qgq-00032Y-L9; Fri, 17 May 2024 06:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723822.1128907; Fri, 17 May 2024 06:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7qgq-00030X-IV; Fri, 17 May 2024 06:03:36 +0000
Received: by outflank-mailman (input) for mailman id 723822;
 Fri, 17 May 2024 06:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7qgo-00030R-KI
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 06:03:34 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ec51e20-1413-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 08:03:33 +0200 (CEST)
Received: from MN2PR05CA0008.namprd05.prod.outlook.com (2603:10b6:208:c0::21)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Fri, 17 May
 2024 06:03:25 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::d7) by MN2PR05CA0008.outlook.office365.com
 (2603:10b6:208:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.12 via Frontend
 Transport; Fri, 17 May 2024 06:03:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 06:03:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 01:03:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 01:03:24 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 17 May 2024 01:03:22 -0500
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
X-Inumbo-ID: 2ec51e20-1413-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFlxTWr36NYgGxGk79I7nvb+ssd4dylNKZXvQQmYgUlqcF9yu6oyJ0/eCMq1DmxxL+Ff8dt7Q3WUsg9t8qkGn5HoVDIpwaX5W3WDZzi66uN27Fbzak1XaiBUc7DbNfZrpy7qvkrCakHa8n36TgaYNJ8j3QxxE7X/iS7CSsM04CukPpd2zaeuGuCYqKifML/zAjz8b6iHgJ6w+4vJzToomSbLvRt4iXDoavToQcpDySvyJZ5XHmd8gIA2h2GdT3WHgOsHO5/QVBZty5N2OhzIdcX2yzkHW3Lc1ZJpIpOMrORVnq1zW54Hv1Q4E12rkVB2/iwbqUrksJcUx2oLQxTaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQSB1ASWz/oXaBldxTRIk2Q7eTJHYhI6okfoX6IssWk=;
 b=i3fcibowIv9WzAjghPvchLRmuErsRpm6+StI/YDPQ5GtszxW8AteHJJB3n6pnKUTccMKPk7S2Qh2ZWbmN4JpzQT1EWmx+jhMQkUl4VJvHenqFdrmQOJl4P2Czb7TAgB86nR9RB35EgO12XlXwyxqSqNWN8y38OuhqDJjsNrj/79Y62XMiyAhOFuno5NvV6vrWlUlPTwXyHtK5NtcXpf9hwkIUIXlUp5MyoS1+bGoclXYytHe1v6D//j09PQ9k67PvTj3g7D8jeJhFKNdEq6t2ipWdtylDqG5hPM4lN7A7SfVr0ikw7DcRWjC8jqGOXU5OUsmLa2E0EyOxoKsoSdHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQSB1ASWz/oXaBldxTRIk2Q7eTJHYhI6okfoX6IssWk=;
 b=XJW1IUv/T7Xrsz8T2UyR1L2wJCqqUIYkGVUZTF1j8nwWH3iqVUTmatnrcDvjJlTQEQd7AdERXCFs4Ypt/v/G9gKpzABCOVRtRgH+Iv+QphiMASrV+3zCPjz0rmldNk6reHfmzEc8vak4zLPG6uQW8o1M7HYf7+HxUHn4+8624ZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <59e72623-00a7-4b19-9240-fb8c4982a381@amd.com>
Date: Fri, 17 May 2024 14:03:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-6-xin.wang2@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <20240516100330.1433265-6-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e1b45e-4504-4a11-8e38-08dc7637104b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXRCY1pyazdGV1FMQ1ZRL3JRSlNoa2JLd3RKQTd6ajFzbHVhY0JhbittOHFT?=
 =?utf-8?B?cFdYN1hDK2RoUnZjQVJDcExYTkpVVDhoM2RMWUVJLzhmVnZUZzRhNzkwYzJ3?=
 =?utf-8?B?TVJBQk1RNFk2ZFJZbXVEbG90RXlSM1pHWHRxM0piN0g4QkJCV3RMS3lacXVt?=
 =?utf-8?B?RGU5OWgxRTFncTVJbVEwUlVUUnF0M1Bybm9PQkpiRVVELzlwbEJrNTEwUzVz?=
 =?utf-8?B?NStLamczbGdhOUFmbDZkdDk2Ti9MeFNhVVA5S1drTXZjak5vbWdTU2FMdXMz?=
 =?utf-8?B?K1N6cC82MDB5dVZRd0Rkdm5KSDBaZElaekY2R1hNaytlVHI1QklUbUZSeWdp?=
 =?utf-8?B?U3FYZUM5SnIzbzViYUpBdU9qRGU1Nld3Z1ZkZTJrS1hEb092VU5ndnNXN1Mz?=
 =?utf-8?B?Sml1Uk0rMzZOZmQvWTFqM29FTVNDY1hYdmFiTHprZDdxbm55YW1qN2dJSFdZ?=
 =?utf-8?B?K1J1T01XQTZEM0pRa3JEOGJ1a2J2UWdlY1ZNUUtFSWFDSm5SaExJN29TVks1?=
 =?utf-8?B?U1U3aU9IN2RYMEFrT0w5YzFGQUJFTHNIWHphOWxYbXl3dndibFczODNaeGN4?=
 =?utf-8?B?eDZiTnh4b2hsNmZYT1BCMEg0ZW15OFEyemlZQ2gzR2JkbkhOOUx6S09oOVIy?=
 =?utf-8?B?MHVsWGpvd2VFTFB4WC9wZkc5aDdDRDl3MFVkNFdyZVB3Mlh3Yk5wdEZYaTF4?=
 =?utf-8?B?L3RzOEdXczdWWkwrejAvSS8ybVBseXZmTi9GdEVhVlVkUm5xVDM3Z3d0R25P?=
 =?utf-8?B?eDRlQ2N1UjBTdEM4SllNWkFYRXpGaGoyZmhmZHRFd2VVV2Z4NnRFTkY2dCtn?=
 =?utf-8?B?Qjl4K0lsOUc2Q09jdWpyOVJ1RDZwcytibTNnVG9HYWlQTURvTlZkZGt1Si9y?=
 =?utf-8?B?Uk9aTy9Nc1pCRk9LQmE1c0xmbUlna2J2cmxUTEdmMjd4M3pyRnIyNzFJUnhB?=
 =?utf-8?B?OXJ6Y0tPbnd5QWhlMjlmQjVDbEc1emhZUndXek1xMFJWN21jSHVzYTdnRFd0?=
 =?utf-8?B?cUxQMGZ1RmIxSHpqazBLeHZMdDU5M3lKU3hBaG5PSmNDMHAzS2VYNkdJQTll?=
 =?utf-8?B?ZWdLNGcyQ1I2bXZJSmxNVC9yZzcxaW9xb3Z5UjZ2WC9yRS95Sll0aThsd25E?=
 =?utf-8?B?ZVQyUnF0VEZaNmRBVXhEc2FuNDhtaDc1a2tXQ2RNYUhpdGhnWHBJN1pscFRz?=
 =?utf-8?B?YkczS0xIR0tHTWZTaHB3Mi9WT2k3Tkt3WThubWYxUEdoWXNXSDEwRThpYkwr?=
 =?utf-8?B?Q0kwQ2NFaTdtSjcrV3ZDekt6RmVDbEk4R0RmbEZHOGdUTGNoTlhlS05tSmFt?=
 =?utf-8?B?bDZXdDB2QTRlVmdDQUdUYVVmSlJGSWg5UHpsK21XUnRlL1RtVFZpM1VGa0NX?=
 =?utf-8?B?bDNWNFk5Y0d0NGNCTnpRSExvK3ZyR2x4YzJDcG0vQlp0bXVOd3pnMHljRXZT?=
 =?utf-8?B?c3RMQWtIV25VdXRwS0lEMmV4TG85cHRtTkw1VXROSlc5dUplSTkyYmMwNkJn?=
 =?utf-8?B?YkVpQWlnQnN5VTN0MVBlMUxUcFczWGxNL0RGNnAyTjc5WDNvdEV0MDJvM3Ex?=
 =?utf-8?B?V0cxcStFTEt0SDdhNkdCQjNvY1E1aEJCazY4cHhaSEFVWDl4RTFvNm5PbVpa?=
 =?utf-8?B?RWI4SWxvenJtdnFXTDF6Y3drbUI4LytmeXVma3F6S0U5VVRKczEyaFBKZFVv?=
 =?utf-8?B?T3Q5NEhia2NDSytwenVyRFFvaUFGbENHTk8xSFE4MWlOTkRIOW92ZXlhQ2Zx?=
 =?utf-8?B?Z1VRY3JQRHNBWnFqOEQrSWFyZ01aZ0pKZjU5eEVleW1wN1dTaU1pb092YkEv?=
 =?utf-8?B?WmVNdFpmTHgyYVF0UkU3bXRBU283ejJuM2dyNyt0TEloU1RhOHJWamdCWUJJ?=
 =?utf-8?Q?tlQW163A2sS0k?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 06:03:24.8121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e1b45e-4504-4a11-8e38-08dc7637104b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603



On 5/16/2024 6:03 PM, Henry Wang wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>
> Currently, routing/removing physical interrupts are only allowed at
> the domain creation/destroy time. For use cases such as dynamic device
> tree overlay adding/removing, the routing/removing of physical IRQ to
> running domains should be allowed.
>
> Removing the above-mentioned domain creation/dying check. Since this
> will introduce interrupt state unsync issues for cases when the
> interrupt is active or pending in the guest, therefore for these cases
> we simply reject the operation. Do it for both new and old vGIC
> implementations.
>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - Reject the case where the IRQ is active or pending in guest.
> ---
>   xen/arch/arm/gic-vgic.c  |  8 ++++++--
>   xen/arch/arm/gic.c       | 15 ---------------
>   xen/arch/arm/vgic/vgic.c |  5 +++--
>   3 files changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index 56490dbc43..d1608415f8 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -444,14 +444,18 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
>       {
>           /* The VIRQ should not be already enabled by the guest */
>           if ( !p->desc &&
> -             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
> +             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
> +             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
> +             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
>               p->desc = desc;
>           else
>               ret = -EBUSY;
>       }
>       else
>       {
> -        if ( desc && p->desc != desc )
> +        if ( desc && p->desc != desc &&
> +             (test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
> +              test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status)) )

This should be

+        if ( (desc && p->desc != desc) ||
+             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
+             test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )

> @@ -887,7 +887,8 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *vcpu,
>       }
>       else                                /* remove a mapped IRQ */
>       {
> -        if ( desc && irq->hwintid != desc->irq )
> +        if ( desc && irq->hwintid != desc->irq &&
> +             (irq->active || irq->pending_latch) )

Same here, this should be

+        if ( (desc && irq->hwintid != desc->irq) ||
+             irq->active || irq->pending_latch )

Kind regards,
Henry


