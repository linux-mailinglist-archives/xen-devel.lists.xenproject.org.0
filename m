Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15338969A3B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 12:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788932.1198434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQod-00072g-42; Tue, 03 Sep 2024 10:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788932.1198434; Tue, 03 Sep 2024 10:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQod-000709-0q; Tue, 03 Sep 2024 10:31:15 +0000
Received: by outflank-mailman (input) for mailman id 788932;
 Tue, 03 Sep 2024 10:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Szdq=QB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slQob-000702-CS
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 10:31:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1eb4dc0-69df-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 12:31:10 +0200 (CEST)
Received: from BLAP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::15)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 10:31:03 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::c8) by BLAP220CA0010.outlook.office365.com
 (2603:10b6:208:32c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 10:31:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 10:31:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 05:31:01 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 05:30:59 -0500
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
X-Inumbo-ID: a1eb4dc0-69df-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baZrAC2LNRXR07ouqiLXg6ZKDQ5Dr1Cymesh5oA7OuU+ZIFURAiF5qJ5ALB9BULgJjEC/GztsRPJtA7ar89C/yeZYTy0EW08b9PCT4m3bKhiB2OsgW+p/Eb1zJmbmBxcEemtgVZMvBPiuWjcrfyVCuQbstB+mQM1E9aePnKkSY960TQY3B5VaHBo6m/6rVndEnVeelN6RQXT6iL1gnH8LRl2aRrsJqK3MPFMTMgoLw6EwG/vqNfz2A8h0P0bQuRVzYwu7bo35t4BvypWTwcM2jHBYk2XBIT0J8qCTqqXD8+s6hnzVlDZfLszqyTHhQX//kotVnPTzVKa25Xr88VRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4Nj8zeLm4ms+Wbdy7UUG/PGsHGocM1+sdevZl7sW5g=;
 b=mheRBvDRgyWAy8p8/I/ZWhJKagVACRBXGj1TlCr5kKcwFl+uKwF5T4Ic8GT5L5/h0I20fWphsApcv9TMgtoi0P/WHpRguOCbij+FBuIbqh+suuhNCmHKPXLSNbMVVCLnWlD51One85Em2l4v4rC68S2qnOhvWpmVN0gwJG0g7ZG8SDffWpkHtgo+wa023kMf8fxDV8vJNdIl2C+WmX7xAL66Zy2ISTcf2IUos+tSZe2R7OVhSfsMchVeQDyApqXbMhVYLFUyBg74CilsJqx4p8Cu8Sw1JBhDEH9T1wVAA2jxnW96ls5eztbN8/Ofi5Klymf9owO9ASBZz6omOd8Lrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4Nj8zeLm4ms+Wbdy7UUG/PGsHGocM1+sdevZl7sW5g=;
 b=NJvluk5cmPKvWYb8kgJFDz/CJilOpEDY3U8psrK9fTPsRh81H7octlkrC4m5j5iO1z3amI2kApL5aHoda+H4r4fsSWuofatccrN49AYgKweNvc1Sv8zBsiu28e0ZNRpmFHv65j1uR6m+rSdePBlyPxnIQDEt12J8/YBn4F6KgkI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c33b1051-2a51-4843-8fb5-6710d0e4ba91@amd.com>
Date: Tue, 3 Sep 2024 12:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM/vgic: Use for_each_set_bit() in vgic-mmio*
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
 <20240902100355.3032079-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240902100355.3032079-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: de6c3280-ae54-4521-ba35-08dccc0382a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THNKb25yR2JmTWVwK2Fsc2t4TjBTb2dlc0R6ODFKejFEbnRxNXE1cjdIYzlj?=
 =?utf-8?B?MEZZVVhkdzNWTmxvNHhnNWhQVUkzWGlqT05nYndtc091bkN6cGdPbGNoK24z?=
 =?utf-8?B?dDA5YmhWNTVGTFQ2VjdMNm5RS2J6cUE2U2Q0WlJnM1Y1UzVieHFJZWVqVml5?=
 =?utf-8?B?ZWhRSlQrK2NOZmdlT2dTQVBuMUFsQ2g0elZ3L09kaktIVFh3ZXloYXkzNzQ0?=
 =?utf-8?B?Wnp2eTY3SW9mdll3cmx5YVhDNkRiZ3g5Vk9sOU5ROWFPMWhMUEZUdXRKVWNo?=
 =?utf-8?B?NVk2cjcydWFkOFdhM3FMdmhMYmhBLzhCZEVpQTZXazFza0ZSNkdlR3ZjbC82?=
 =?utf-8?B?MmVQNUQvRFJ4L01pZjVQSHQwY1hNQ01aZm9qUFhHSWR2akh5TnpsdTY5UkJG?=
 =?utf-8?B?dzZmMXFyeTlsMUluUG5pRmhWMlRuaS81KzJucDlDNGcxbFhDRXdyQnRVTVJJ?=
 =?utf-8?B?eHlmTm1KK1QvSWIvdHBPNWV0RFdubXk4K2FMSG1QZFRHc2lmRFRCRTJOZHMx?=
 =?utf-8?B?N01LY3JiTjRNWVVOS3pVVk9uYXhFalF0dkdQN3U0cWRoUUp1S3g0VDBNN1JG?=
 =?utf-8?B?anpzRC9ZcGNmSVdKRUFzbkM3Q05FdVFKYjFYdkw5eGVkRysvY21SZHRVUW9Q?=
 =?utf-8?B?SVIzSEVQaHV5MEpFN2Q5dmJnRU9jMCtmOW9iQlM1aXd2UU12YXdHWlhxQWt6?=
 =?utf-8?B?UU9yNmdjZVF2d2hjc0ZuQktvNWlDd2phUlpyS2NhU0ZBN0s1RzNIUFl0bS90?=
 =?utf-8?B?K1VBZW92VENjV1NwQzBvYkUybGVnTEdHS29SRmxqaXB6RHFWdVFFQ3A3SUNL?=
 =?utf-8?B?Rm1la3ZaMEtZbXlERGs1ejVJZ2VremIyQVZMSUJxTlNRaGtoOVhzdTN1MVlG?=
 =?utf-8?B?STU2U0gwbGs3cnpPeUY4SE5aUjd4aDBBbEpocFpDSU9YL1ZjRnloVFpmcGR1?=
 =?utf-8?B?TWJaYWowYmREOHVwSWc4SDRMR3R2QTNJUWRMUENkSGV3WWVnUExONzViVFlv?=
 =?utf-8?B?cERxZ3dUb2gzNVZPaUE5L1hrdnRhbnEvdGN6cnNWUW9SWFhZVzVkTFhrc2tH?=
 =?utf-8?B?Ynd5aEc5UEJXaTRNV2FENFZva2ZuOTB6TlZFRnY1UmF1dm5uY2wxc052Z3dj?=
 =?utf-8?B?MWtadU9Tbk9SUGJYZlJPYUVPTDlGbU04eGQyd0NoQ2o0dGk5S2xoa2JXeUpY?=
 =?utf-8?B?WW90VGpOZFVSMFVLQXF6OFpDRmJVdUc1cTlZSmZXbzRmLzZ5UnFFTDI0aCtr?=
 =?utf-8?B?QjNteStTUmtvbHI4a1NlT2hEV1VPM29FZUV3dENHRWVQZ1lJM0lUYi9KNXhk?=
 =?utf-8?B?OG9ubS9scWJlaStJREtkSm8wVEdRcjR4YStBbXI1bGxtNi9iQnNIZHJ6ZnJn?=
 =?utf-8?B?OVc5Mjd4NWl5Vlp1UUZ1NHhQYzM2UDZLMHhUV202MTMrSVpobUIvS25BSjBC?=
 =?utf-8?B?K1QxYk9HZ2h3clB2dDBjWVhYanpUOUUwWHNkaTUxZmZWUUJnTklsQm1EcDN0?=
 =?utf-8?B?aWRrTTNVUFcyaGk0dUt3WmZqTGgzMENrcnlqYkh5azFqUjhKdmE2SVIyU1FL?=
 =?utf-8?B?dDdDUDEyK2FPa1NjbFRNUlFtRzZ3WWdFMDYrV3ZRckhiMHVCQ05lRGhaMzVh?=
 =?utf-8?B?eTdKZGo3SzFMQ3BPSU5DTEFyVkVsQVpMZFY5RjRXTkxoWkUxcWNsa2N5Y3Nh?=
 =?utf-8?B?Mldmak90T3NXTEJVT3BYby81aFBTMzBLMVZWMmNvV3hxQUZPSU1ZZWxNQ0tq?=
 =?utf-8?B?UnpIMTNySmxTOEc0aVJNSTFZa0RCdDcwdHptNzh0Z2dJUDNBV0MvdDB2Zjlo?=
 =?utf-8?B?TkNpcXVNSXVjczNDSlhpQkRDRnBRTmVLZ0ZQU2ZaZ09QOVladkJPcG1sUjJS?=
 =?utf-8?B?eU4rb24vcUY5MG1sUHZ6L3ZVOTdnREpIeXdmV0JFdGF3SDEyK0JwR3U0ZTNP?=
 =?utf-8?Q?KHZCmStIxIcijKQOoCBlWKlMWDWkk0YN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 10:31:02.8050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6c3280-ae54-4521-ba35-08dccc0382a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959



On 02/09/2024 12:03, Andrew Cooper wrote:
> 
> 
> These are all loops over a scalar value, and don't need to call general bitop
> helpers behind the scenes.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> Slighly RFC.  It's unclear whether len is the size of the register, or the
> size of the access.  For sub-GPR accesses, won't the upper bits be clear
> anyway?  If so, this can be simplified further.
See dispatch_mmio_write(). "len" refers to access size (i.e. 1/4/8 bytes). Each register is defined
with a region access i.e. VGIC_ACCESS_32bit that is compared with the actual access. In the current code
there is no register with 8B access. If there is a mismatch, there will be a data abort injected.
Also, the top 32-bits are not cleared anywhere, so I don't think we can drop masking. @Julien?

> 
> $ ../scripts/bloat-o-meter xen-syms-arm64-{before,after}
> add/remove: 0/0 grow/shrink: 2/5 up/down: 20/-140 (-120)
> Function                                     old     new   delta
> vgic_mmio_write_spending                     320     332     +12
> vgic_mmio_write_cpending                     368     376      +8
> vgic_mmio_write_sactive                      192     176     -16
> vgic_mmio_write_cactive                      192     176     -16
> vgic_mmio_write_cenable                      316     288     -28
> vgic_mmio_write_senable                      320     284     -36
> vgic_mmio_write_sgir                         344     300     -44
> 
> $ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
> add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-32 (-32)
> Function                                     old     new   delta
> vgic_mmio_write_sactive                      204     200      -4
> vgic_mmio_write_cpending                     464     460      -4
> vgic_mmio_write_cactive                      204     200      -4
> vgic_mmio_write_sgir                         336     316     -20
> ---
>  xen/arch/arm/vgic/vgic-mmio-v2.c |  3 +--
>  xen/arch/arm/vgic/vgic-mmio.c    | 36 +++++++++++++++++++++-----------
>  2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
> index 670b335db2c3..42fac0403f07 100644
> --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
> +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
> @@ -90,7 +90,6 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
>      unsigned int intid = val & GICD_SGI_INTID_MASK;
>      unsigned long targets = (val & GICD_SGI_TARGET_MASK) >>
>                              GICD_SGI_TARGET_SHIFT;
> -    unsigned int vcpu_id;
> 
>      switch ( val & GICD_SGI_TARGET_LIST_MASK )
>      {
> @@ -108,7 +107,7 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
>          return;
>      }
> 
> -    bitmap_for_each ( vcpu_id, &targets, 8 )
> +    for_each_set_bit ( vcpu_id, (uint8_t)targets )
>      {
>          struct vcpu *vcpu = d->vcpu[vcpu_id];
>          struct vgic_irq *irq = vgic_get_irq(d, vcpu, intid);
> diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
> index bd4caf7fc326..f7c336a238ab 100644
> --- a/xen/arch/arm/vgic/vgic-mmio.c
> +++ b/xen/arch/arm/vgic/vgic-mmio.c
> @@ -69,9 +69,11 @@ void vgic_mmio_write_senable(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
> 
> -    bitmap_for_each ( i, &val, len * 8 )
> +    if ( len < sizeof(val) )
> +        val &= (1UL << (len * 8)) - 1;
> +
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>          unsigned long flags;
> @@ -114,9 +116,11 @@ void vgic_mmio_write_cenable(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
> 
> -    bitmap_for_each ( i, &val, len * 8 )
> +    if ( len < sizeof(val) )
> +        val &= (1UL << (len * 8)) - 1;
> +
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq;
>          unsigned long flags;
> @@ -182,11 +186,13 @@ void vgic_mmio_write_spending(struct vcpu *vcpu,
>                                unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>      unsigned long flags;
>      irq_desc_t *desc;
> 
> -    bitmap_for_each ( i, &val, len * 8 )
> +    if ( len < sizeof(val) )
> +        val &= (1UL << (len * 8)) - 1;
> +
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
> 
> @@ -230,11 +236,13 @@ void vgic_mmio_write_cpending(struct vcpu *vcpu,
>                                unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>      unsigned long flags;
>      irq_desc_t *desc;
> 
> -    bitmap_for_each ( i, &val, len * 8 )
> +    if ( len < sizeof(val) )
> +        val &= (1UL << (len * 8)) - 1;
> +
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
> 
> @@ -326,9 +334,11 @@ void vgic_mmio_write_cactive(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
> 
> -    bitmap_for_each ( i, &val, len * 8 )
> +    if ( len < sizeof(val) )
> +        val &= (1UL << (len * 8)) - 1;
> +
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
> 
> @@ -356,9 +366,11 @@ void vgic_mmio_write_sactive(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
> 
> -    bitmap_for_each ( i, &val, len * 8 )
> +    if ( len < sizeof(val) )
> +        val &= (1UL << (len * 8)) - 1;
> +
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
> 
> --
> 2.39.2
> 

~Michal

