Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BCB680831
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486662.754080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQ9s-0001ut-PW; Mon, 30 Jan 2023 09:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486662.754080; Mon, 30 Jan 2023 09:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQ9s-0001sO-Mk; Mon, 30 Jan 2023 09:09:00 +0000
Received: by outflank-mailman (input) for mailman id 486662;
 Mon, 30 Jan 2023 09:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6cZ7=53=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMQ9q-0001sI-PZ
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:08:58 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b88e0082-a07d-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 10:08:55 +0100 (CET)
Received: from MW2PR2101CA0002.namprd21.prod.outlook.com (2603:10b6:302:1::15)
 by BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:08:52 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::c5) by MW2PR2101CA0002.outlook.office365.com
 (2603:10b6:302:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Mon, 30 Jan 2023 09:08:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.25 via Frontend Transport; Mon, 30 Jan 2023 09:08:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 03:08:51 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 01:08:50 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 30 Jan 2023 03:08:49 -0600
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
X-Inumbo-ID: b88e0082-a07d-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHHMQ/UKvzY20BRQzTlNufdDMVyQhQddRiQ4RgQSJODbOWot633uyEvubRAwLpejXzbOhj0RA6EKeKH8sWCJU2SO+UBUrnwLPFAjNtlW9n/6dbuXF3XzxOgxjtic+7NDc1z5brGk1wQ6TvfSap6R1mxf763E+4Htwf8/ZAhc/T27kX5vWxHjqoLGVj65xnE1lfACdFwYaERTSFS+atFuYHwKiPjfFlsRMbnLSdftFC07+VwTcg9ndEwulxspZ/ghaG2a3xBUyWrkAjEvjAp9WZ1n9w9ddujanFqeogcHq61LiHyLQju1IEHHRbSfCtYwVvFYtZCXBgzW9Q8mbXnwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1a+MbhIMv8EBARb8BlfZrMO4M0yMJY+3CqZR+eJHqM=;
 b=ZGd5urpjOOvzf+oK2u7158YVcWxjg5aW3BRfeK4+gmNARFb0JhzF4rHLs13q/sqZ8xmmtJCFffK3Xf/9w03DqeMQ/Y7SDrkr2maaTqllRdbkBLtmC9Tb7ggUZwYHp2v6sCKgmA/G4S79C8/hFoX2adaEaUJzl+XaCcMAGTC9irW+E5vgpxcGVVtX4hxSEC+sRI/NNkIMyBP7aqWqv4tfO8dcMXD/nSCEy9PkGdt5Lv85NRg2kFAnydATvmAbhHvWHcnbt+Gk1gt2hmil5idWFTPDp+37adUHYCUHRoNehOklRRLs6pIauADFVGmImSyvOmzHu92BZxD9IemK9VwfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1a+MbhIMv8EBARb8BlfZrMO4M0yMJY+3CqZR+eJHqM=;
 b=l/APYzj4dqHzMAgxFOWCCjwbJ2AOpJZ5wnw24h9tUFUb8kFbgKXAanho8PfqC3C2Oa3u0D+J/KlvZiyfKdO2/VAWGMrm4KGxyZ6YnLsKHrvcr3n2di5cRhciwu3L0MReCD6eJ3DLzazrsDUr9/RXP02CE22gP1eGBl1ng5f1H0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <af0bf576-373c-353e-b575-40f5bbde861f@amd.com>
Date: Mon, 30 Jan 2023 10:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 2/5] xen/arm64: Rework the memory layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-3-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230127195508.2786-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 37facfca-2b65-4d5c-ef31-08db02a19b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rnrPXCnPn4fY6WJYQ8xwYUGqbcDB59qVAQq9YlEcv2+joyKtW5ZsxOUX15Y1JGOLH3/DrnC8UdHO+0sor38AaOV+ac81/jtAgXb+B5BSrpQ+eYhgD9623Xt201BP2+U3EmPemKygxmiwFNXLjdwUFVxyfFJDjydX2KcBTcKIexaAklNVgnpjhIsBhR9zF7whjLxWAu1ckeK7lP4Vzcsct5u7XiIH16/TnJow4friB/bj6yuMSJSBCwntzFK6F13JJefBkV9trpEs9SGNqRYSylb7HIJ6MCFchVWCrjvkl2bC4z5efplsGg3PMtwAwMi6nkVWh8T+5JfAX87qlvHwSKvcMMh+rDVT1sRhI5VMAfGJ+E3rTxH0FRF+5g3KOKzct/4DvFRg0s2rPC02EHCnheb0ItINRsXWI8syIjv8yb5vry6VQgJQokr9vRj4bNevTa1p49mO+Vuq5pIaYQCj6PDn1l/v8M7EKjQfNxyTKC894vb/2qanH4Hnwk6rTVpgJBDfjJdYaKagqWAVVlcMUK5VvpugHH4JURY3UuCO37f9SwsPdOrDIGhEAcmjOn7YrW/ysIlyHojcoR5PrYVbrTw3NT4A/xOsV1ov9VOeARNAuODXWt6hDNVlNK+z8jNTG1Qn0ZFO91JYpdDEBybH8z8R6CHOLHfAjrNTLlqGqatiRfHquon/pwqiTByns014EE/D9vHyUi8EYhhrcOrItVkpgNF/NjjqubcxqZqO7/lQQ3fNbk+Dw9X21WzTlx/qMyN2Fj+tPnTUmBXr4JUCDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(8936002)(41300700001)(44832011)(5660300002)(36860700001)(426003)(83380400001)(47076005)(40480700001)(81166007)(40460700003)(86362001)(82740400003)(31696002)(356005)(36756003)(316002)(110136005)(70206006)(4326008)(54906003)(8676002)(70586007)(478600001)(16576012)(2616005)(336012)(186003)(26005)(53546011)(31686004)(82310400005)(2906002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:08:51.8775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37facfca-2b65-4d5c-ef31-08db02a19b37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132

Hi Julien,

On 27/01/2023 20:55, Julien Grall wrote:
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
> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
> tweak of the boot code because XEN_VIRT_START cannot be used as an
> immediate.
> 
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ---
>     Changes in v5:
>         - We are reserving 4 slots rather than 2.
>         - Fix the addresses in the layout comment.
>         - Fix the size of the region in the layout comment
>         - Add Luca's tested-by (the reviewed-by was not added
>           because of the changes requested by Michal
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
>  xen/arch/arm/include/asm/config.h | 34 +++++++++++++++++++++----------
>  xen/arch/arm/mm.c                 | 11 +++++-----
>  3 files changed, 31 insertions(+), 17 deletions(-)
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
> index 5df0e4c4959b..e388462c23d1 100644
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
> + *  (Relative offsets)
> + *   0  -   2M   Unmapped
> + *   2M -   4M   Xen text, data, bss
> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> + *   6M -  10M   Early boot mapping of FDT
> + *  10M -  12M   Livepatch vmap (if compiled in)
>   *
>   *   1G -   2G   VMAP: ioremap and early_ioremap
>   *
>   *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>   *
> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
> + * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
>   *  Unused
>   *
>   * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
> @@ -107,7 +113,17 @@
>   *  Unused
>   */
> 
> +#ifdef CONFIG_ARM_32
>  #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> +#else
> +
> +#define SLOT0_ENTRY_BITS  39
> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
> +
> +#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
> +#endif
> +
>  #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
> 
>  #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
> @@ -163,10 +179,6 @@
> 
>  #else /* ARM_64 */
> 
> -#define SLOT0_ENTRY_BITS  39
> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
> -
>  #define VMAP_VIRT_START  GB(1)
>  #define VMAP_VIRT_SIZE   GB(1)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index f758cad545fa..0b0edf28d57a 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -153,7 +153,7 @@ static void __init __maybe_unused build_assertions(void)
>  #endif
>      /* Page table structure constraints */
>  #ifdef CONFIG_ARM_64
> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
> +    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START) < 2);
I haven't spotted this before but this should be < 4.

~Michal

