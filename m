Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7843466B946
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 09:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478448.741648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHL8b-00030H-Il; Mon, 16 Jan 2023 08:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478448.741648; Mon, 16 Jan 2023 08:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHL8b-0002y7-G1; Mon, 16 Jan 2023 08:46:41 +0000
Received: by outflank-mailman (input) for mailman id 478448;
 Mon, 16 Jan 2023 08:46:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHL8a-0002xt-4F
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 08:46:40 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4946e9b0-957a-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 09:46:38 +0100 (CET)
Received: from MW4PR03CA0091.namprd03.prod.outlook.com (2603:10b6:303:b7::6)
 by CH2PR12MB4892.namprd12.prod.outlook.com (2603:10b6:610:65::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 08:46:34 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::ed) by MW4PR03CA0091.outlook.office365.com
 (2603:10b6:303:b7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 08:46:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 08:46:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 02:46:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 02:46:32 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 16 Jan 2023 02:46:31 -0600
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
X-Inumbo-ID: 4946e9b0-957a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI55dvDU1HOuYlHjTbdE1at3o/lk10QalWRDMKvdMt6GhCHgLY8LKQw/A0L0wxdGqY5pMeTzUU57pnRW4us6XEUK9GEQjNuumqD6FutHbyS1sLiCXmTnSZI/UvPkD6yzsvnu3SzJxHNSAyaXGiFlVO51/FxfxI7jCgZtwZyUQBBOCyhiE4yzoei1fm1A6RfnS/PTNz1NNZAOqHcmEIc5lx+1jKskZ2A0du15ojkIiZu4Tz2XIaeJB8+EaSRmBYcNCNOiAlEDV4vGkTXuj3ZfUuhn3jsTt2QNUl+/jg3UWW1hQjytynU9fdI2Ca8T6FPfh4HJG2vNccjGQRyKdSfWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPJ/4zyj4FOlfb65H/9fAMd9pTZhI2hVsCXL/vYHx+c=;
 b=LYykhUtUXV1viUEyKnxGLqtze1mBqKTHf58WLzE0GmSjifFKGbIusgt2W+bTjlXKxUocHBz1fQdnY0l1irrjK4oRfD5WSQUxjuiOYsMMBPh0DpGK3lW3swMjwKQ8oYPrWs7G7s2AXlcY1nfFX2yV5jCnPVIdukQLNktuz3mZF+T8bMPcrGD0A+QwrFvZRFR1CimRJ1yRsr+U1lrphngGLsNK4E4eYzHbo3/ePMfMrzEtbZWvVsxqGufBMWjTBAWpkVUWaeqbYLkUnfz/8lVHhD5NDzUVCADSADFKALl94jfXxtmSA5sMDaE/gvdTgDoXy9JB1vZ7U50kQUsBObp2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPJ/4zyj4FOlfb65H/9fAMd9pTZhI2hVsCXL/vYHx+c=;
 b=CYhyxPGO6sBPih/3JlVOXy1DqzVp0o12rSyK4vBjPjhSFIscggdo1jYlv9eJNpXXoatebsS4dqqo80XBHnN+WDT6qViAyu8tsR7ZNH4LLB8Y8d2zksVbamk6WnXbLvCqUmU3kQsHQQqz/xscUiY/A7/68aaTOpzGnwjEpQw+uVQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <72b2be45-d7bc-a94f-1d49-b9fc0b2fd081@amd.com>
Date: Mon, 16 Jan 2023 09:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 11/14] xen/arm64: Rework the memory layout
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-12-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113101136.479-12-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT052:EE_|CH2PR12MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 997b1a42-1470-4db6-863e-08daf79e2bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BzeqDArINkk3C3HJPOK5SIs5mwPOgD0jPwRjjHi0YLbrVhj26BjBrAtOFJnEAdDu1RmJLjt7g7ouKcdKdAOV0TkGfXEmmgXCcFR1l54jXT9aqGkcvmvE+JKKXVmurW+3NI4HUP59VpQFyYfCE3lmAXHdkPBJ2fRj8r+3dLMqoCNmI3uDpgmyLOSYawItqlnDD0uW5kmpizqpQQT0tiKEWSYQ+lwbO0FU+tzPdA4oo8ihyq12qR4KAchlM9AhsHYzO34c/aHhPGn4Zmn78BuUgfztuoPxKh0Gchy2l0Wl0tKUwRVPCz7J7gfjfGJ8xvEANUgbw/rizTaYBP66ufVO5P8Pglo7zbNfSZrrPU0mcbKfcITG2pWPaSzPJvcEdMx2w9IIieQYjCSJqfot1AG2QV1e4/T96pRrxWF7r1DHHrImSwk+wqiAu4HCbT5dwgDoL6vag2tvvxLYlGAh1zbt0FnbBHIrYA9dkjYC9IjrxP/mzikgC7qy2D+hJM5gYfFr5HNPImNkbeaavpWhHuRPxOvUDD3T+T8H8BdQz9+w9zXfNF+bRKggUzp4vcJhuAFiXeFpYyI/y7Cwbh8WquDDySD+CRrQmfcH1O/jyp/w3fosGhSFe03K0vz2E3ME0DXnYG29e5bPeHL+/gkWnjcTQM1D9/ITSQB2+3KPp0KMRR/ma8D48eP/iPrAw/tCCxODZsJOXJyyRnMHLn/lA+J0ZfwbHmVK1EFP1/DmNWEvJ53YHbiVKeotrQ8IW+d551q4/99xMDFqsv3G9OY4+/reIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(186003)(478600001)(44832011)(5660300002)(8676002)(36756003)(26005)(4326008)(70586007)(70206006)(40460700003)(54906003)(316002)(110136005)(16576012)(336012)(40480700001)(83380400001)(8936002)(82310400005)(2616005)(47076005)(426003)(82740400003)(31696002)(36860700001)(2906002)(53546011)(41300700001)(86362001)(81166007)(31686004)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 08:46:33.7091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997b1a42-1470-4db6-863e-08daf79e2bd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4892

Hi Julien,

On 13/01/2023 11:11, Julien Grall wrote:
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
> The memory layout is reshuffled to keep the first two slots of the zeroeth
Should be "four slots" instead of "two".

> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
> tweak of the boot code because XEN_VIRT_START cannot be used as an
> immediate.
> 
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ----
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
>  xen/arch/arm/include/asm/config.h | 35 ++++++++++++++++++++-----------
>  xen/arch/arm/mm.c                 | 11 +++++-----
>  3 files changed, 31 insertions(+), 18 deletions(-)
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
> index 6c1b762e976d..c5d407a7495f 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -72,15 +72,12 @@
>  #include <xen/page-size.h>
> 
>  /*
> - * Common ARM32 and ARM64 layout:
> + * ARM32 layout:
>   *   0  -   2M   Unmapped
>   *   2M -   4M   Xen text, data, bss
>   *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>   *   6M -  10M   Early boot mapping of FDT
> - *   10M - 12M   Livepatch vmap (if compiled in)
> - *
> - * ARM32 layout:
> - *   0  -  12M   <COMMON>
> + *  10M -  12M   Livepatch vmap (if compiled in)
>   *
>   *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
>   * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
> @@ -90,14 +87,22 @@
>   *   2G -   4G   Domheap: on-demand-mapped
>   *
>   * ARM64 layout:
> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
> - *   0  -  12M   <COMMON>
> + * 0x0000000000000000 - 0x00001fffffffffff (2TB, L0 slots [0..3])
End address should be 0x1FFFFFFFFFF (one less f).

> + *  Reserved to identity map Xen
> + *
> + * 0x0000020000000000 - 0x000028fffffffff (512GB, L0 slot [4]
End address should be 0x27FFFFFFFFF.

> + *  (Relative offsets)
> + *   0  -   2M   Unmapped
> + *   2M -   4M   Xen text, data, bss
> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> + *   6M -  10M   Early boot mapping of FDT
> + *  10M -  12M   Livepatch vmap (if compiled in)
>   *
>   *   1G -   2G   VMAP: ioremap and early_ioremap
>   *
>   *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
>   *
> - * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
> + * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [5..255])
Start address should be 0x28000000000.

Not related to this patch:
I took a look at config.h and spotted two things:
1) DIRECTMAP_SIZE calculation is incorrect. It is defined as (SLOT0_ENTRY_SIZE * (265-256))
but it actually should be (SLOT0_ENTRY_SIZE * (266-256)) i.e. 10 slots and not 9. Due to this
bug we actually support 4.5TB of direct-map and not 5TB.

2) frametable information
struct page_info is no longer 24B but 56B for arm64 and 32B for arm32. It looks like SUPPORT.md
took this into account when stating that we support 12GB for arm32 and 2TB for arm64. However,
this is also wrong as it does not take into account physical address compression. With PDX that
is enabled by default we could fit tens of TB in 32GB frametable. I think we want to get rid of
comments like "Frametable: 24 bytes per page for 16GB of RAM" in favor of just "Frametable".
This is to because the struct page_info size may change again and it is rather difficult to
calculate the max RAM size supported with PDX enabled.

If you want, I can push the patches for these issues.

~Michal


