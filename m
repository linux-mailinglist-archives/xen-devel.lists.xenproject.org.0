Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36E36E40E6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521777.810638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJIQ-00027s-AY; Mon, 17 Apr 2023 07:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521777.810638; Mon, 17 Apr 2023 07:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJIQ-000253-7g; Mon, 17 Apr 2023 07:29:06 +0000
Received: by outflank-mailman (input) for mailman id 521777;
 Mon, 17 Apr 2023 07:29:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poJIO-00024x-JD
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:29:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eab::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 866a7e2c-dcf1-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 09:29:03 +0200 (CEST)
Received: from CY5PR17CA0059.namprd17.prod.outlook.com (2603:10b6:930:12::23)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:28:59 +0000
Received: from CY4PEPF0000C97F.namprd02.prod.outlook.com
 (2603:10b6:930:12:cafe::b9) by CY5PR17CA0059.outlook.office365.com
 (2603:10b6:930:12::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 07:28:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97F.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.16 via Frontend Transport; Mon, 17 Apr 2023 07:28:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 02:28:57 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 02:28:56 -0500
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
X-Inumbo-ID: 866a7e2c-dcf1-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=be1aAbCF89tmwmqqpyXGz38JXhvhwjDI3Oas/23PfCWSIuJUkbDrZHy3NHSP1tDIL3pMmIh7c04ofRuGTdPamRl4r8diysP4lPUV821kZnm6auGkLfM2+/GhNvlPQsGxg+8/tx3mze/8PkYqrDqbha2qs+iWy8dlVp8BZtTM2RGTNgsW/PnizG2o3IxF5K7Gxbd4lkLgte1iQVvbAmLCfvQ72AKfqEqq6uznAOetuuN5VXFSXrhU9RAOivGASpO3JjdVY6Vqrmo4r8UyAIny3IjepRtDAwxkzkI3/32oR0Sl5qYhX2UQlsDv/ZTBDs0y4rQC7Fy3FhoeuEiqBynDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/tanqHOuQI4YVyvSOUiTRNovyenuslY3plKudh7H40=;
 b=BbBKZfzgS+wgT/AFDObB19z6RqYkAjSQfYCsQFBL2sTRSJTp1Zoak01DB9JLpc4QrgzUhndfJp/a5AB2wTOKA9PQ+veVQ1Bmctr2yBkC7RdJDkIQqTX6UsqpGOMBoxUj7KU1U3L/oVRHXrkuRcYDV+gVQWGxMPFkS5KOy5ZhKeqKuxRHb84IDOLOkRGOjLFcju41hGw5ZLqwksaUpp5Bm4ZUtmTm8S3d5YGgf1E5TwW8HfyBiJ6fL2giwrdMoHrvwqQCXX+u9QkCuStj0Y2bBll7d74NMpbBjwKQIaqVbVsnlDXurA5Rs6WuWN+Ji45reL66PWZDkd56YOGuFtRk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/tanqHOuQI4YVyvSOUiTRNovyenuslY3plKudh7H40=;
 b=IFsyYpm684BnWGBLZn1+gmWXzcs+O7ePfeqD1q0BKp/tTMHwLvaExwvPVa26+fuy1yrGYnyyUpCu0s1Db+mDUEB8tdTLTDDCy2b2A2q+k6pAC5DrEAaM/TKoQm+lkBDOm3jYI9HwNX5yEyZ9mmvmflT1TsrCk8Gr9HJeY8MOEw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b088d287-3809-0a37-1a41-992d6ed9d631@amd.com>
Date: Mon, 17 Apr 2023 09:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230416143211.72227-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97F:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e5c3dc-db05-4af1-616f-08db3f156893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HT9UvaBdP0idPNht2FuMsX8Ta8N2xjm5lO2NBQRajJJI6a2664xvNo7bkztYXzvVamlpsQTFO19rxreRfsJv7/XO94HEtpNTTYca5dtNFu6ufRtqM4+v4qHlRoalsF5fNKqibojTSKBkhIGgIs148Y6dIzhsI989nwDc9cMMrctQ4ezBenoD764BqBEaXS/i664LDS+O5Ur+b3IYLpYRqL+b2+LeYNvIDYHmM3duejck7gW7/MKL5AfK6TIt8XLYYrmW644y7yOoqGtjWXoVrU1F8JkoAjUSpTm45cjRAqoVYFR6T7r5JlGFEm4GEJKM+03gWgWTSjej7/xcOM1cn46CQmzQ7p6ddui/CVSxRs240TKcmkP+pdjUSlXpDrlz39hC4kZtqtvxD2IlFWOrO8lH7HTKqMFxVL1wptek9sOGQSXWULD/61wgIgwkm9ot8ek+y/ku6GoaFi0QqdFvTsp1V1Oqw+R9PkCUizBlAcqZQwmOpqTny6PAre1T4L+ARf15B54rtnPO3VxS7RUjEJRPPkdGMBa9SNG3WXo6zflZwy07kAziFPd/cyJ/dFcARL8e65NIfRzwaAqaniV7g83hNL50VJ3U1plwZrB4bSpIDHraC+hCuyUt1zLXmEQ3dsK/xvT1Zg+ArAODYGuUB2IhhiE6bVnR7Pc/FjlfN8pP6lnz2Uh+FIGfAsVbUpqvaXRUX8ayVoFlIDVM5vgAQt0SClZScUm3I5nEsarYH3tQzcjgHpaokgjNgzdYbeo+xqr38RIS8LidKvBupQOoMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(46966006)(36840700001)(40470700004)(36756003)(110136005)(54906003)(16576012)(4326008)(316002)(70586007)(70206006)(478600001)(5660300002)(82310400005)(8936002)(8676002)(41300700001)(2906002)(44832011)(40480700001)(82740400003)(86362001)(31696002)(81166007)(356005)(426003)(2616005)(336012)(26005)(40460700003)(186003)(53546011)(36860700001)(47076005)(83380400001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:28:58.3315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e5c3dc-db05-4af1-616f-08db3f156893
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C97F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594

Hi,

On 16/04/2023 16:32, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Xen is currently not fully compliant with the Arm Arm because it will
> switch the TTBR with the MMU on.
> 
> In order to be compliant, we need to disable the MMU before
> switching the TTBR. The implication is the page-tables should
> contain an identity mapping of the code switching the TTBR.
> 
> In most of the case we expect Xen to be loaded in low memory. I am aware
> of one platform (i.e AMD Seattle) where the memory start above 512GB.
> To give us some slack, consider that Xen may be loaded in the first 2TB
> of the physical address space.
> 
> The memory layout is reshuffled to keep the first four slots of the zeroeth
> level free. All the regions currently in L0 slot 0 will not be part of
> slot 4 (2TB). This requires a slight tweak of the boot code because
> XEN_VIRT_START (2TB + 2MB) cannot be used as an immediate.
> 
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
> 
> Lastly, take the opportunity to check a compile time if any of the
s/a/at/ compile time

> regions may overlap with the reserved area for identity mapping.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
>     Changes in v7:
>         - Remove all tags
>         - Add BUILD_BUG_ON()s
>         - Don't forget to update FRAMETABLE_VIRT_START and
>           VMAP_VIRT_START
> 
>     Changes in v6:
>         - Correct the BUILD_BUG_ON(), Xen virtual address should be
>           above 2TB (i.e. slot0 > 4).
>         - Add Bertrand's reviewed-by
> 
>     Changes in v5:
>         - We are reserving 4 slots rather than 2.
>         - Fix the addresses in the layout comment.
>         - Fix the size of the region in the layout comment
>         - Add Luca's tested-by (the reviewed-by was not added
>           because of the changes requested by Michal)
>         - Add Michal's reviewed-by
> 
>     Changes in v4:
>         - Correct the documentation
>         - The start address is 2TB, so slot0 is 4 not 2.
> 
>     Changes in v2:
>         - Reword the commit message
>         - Load Xen at 2TB + 2MB
>         - Update the documentation to reflect the new layout
> ---
>  xen/arch/arm/arm64/head.S         |  3 ++-
>  xen/arch/arm/include/asm/config.h | 38 +++++++++++++++++++++----------
>  xen/arch/arm/mm.c                 | 23 +++++++++++++++----
>  3 files changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 4a3f87117c83..663f5813b12e 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -607,7 +607,8 @@ create_page_tables:
>           * need an additional 1:1 mapping, the virtual mapping will
>           * suffice.
>           */
> -        cmp   x19, #XEN_VIRT_START
> +        ldr   x0, =XEN_VIRT_START
> +        cmp   x19, x0
>          bne   1f
>          ret
>  1:
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 5df0e4c4959b..2cfe5e480256 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -72,16 +72,13 @@
>  #include <xen/page-size.h>
> 
>  /*
> - * Common ARM32 and ARM64 layout:
> + * ARM32 layout:
>   *   0  -   2M   Unmapped
>   *   2M -   4M   Xen text, data, bss
>   *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>   *   6M -  10M   Early boot mapping of FDT
>   *   10M - 12M   Livepatch vmap (if compiled in)
>   *
> - * ARM32 layout:
> - *   0  -  12M   <COMMON>
> - *
>   *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>   * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>   *                    space
> @@ -90,14 +87,23 @@
>   *   2G -   4G   Domheap: on-demand-mapped
>   *
>   * ARM64 layout:
> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
> - *   0  -  12M   <COMMON>
> + * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> + *
> + *  Reserved to identity map Xen
> + *
> + * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4]
missing closing parenthesis at the end of line

This can be done on commit, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

