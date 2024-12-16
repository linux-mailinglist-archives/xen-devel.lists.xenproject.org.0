Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36979F320C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 14:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858061.1270311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBaC-0003Pg-Jg; Mon, 16 Dec 2024 13:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858061.1270311; Mon, 16 Dec 2024 13:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBaC-0003Md-Gt; Mon, 16 Dec 2024 13:56:24 +0000
Received: by outflank-mailman (input) for mailman id 858061;
 Mon, 16 Dec 2024 13:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/+0=TJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNBaB-0003MV-02
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 13:56:23 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2416::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85bc13ab-bbb5-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 14:56:20 +0100 (CET)
Received: from CH2PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:5a::18)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 13:56:11 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::b2) by CH2PR08CA0008.outlook.office365.com
 (2603:10b6:610:5a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Mon,
 16 Dec 2024 13:56:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 13:56:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 07:56:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 07:56:10 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Dec 2024 07:56:08 -0600
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
X-Inumbo-ID: 85bc13ab-bbb5-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6BjuSMyB0+dTmpcIYE3uv88+r+r620jgPkY504tIaFXmrPtwC0gOWqastr68l2w72NxQFZqrYnzlmqWtR2v7xtdiZE0+/Spk0pUV7WCT0p8mJDqeAA4sqxBt6OPC9uK9YypKkaLUgSpSjpBhzNo1vc1qrKBfQHBMPgBIFv/c8yMY+1iFY+4fO0g5WKxlxhoqc8CWvofiNWHzuOc+/90At2RO87nqk2uRfepQc8sHM9jXc/r1aVC6jhFAfUM4pLiJmsIWVVuy0WJp5n/hEwbA3GZYbkgi9o+r5FWUvPveaX0WP4BEHKhQ7KohgrUfyaQLguAh+nV6eo78+juV8YDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AsawoGcIXA1bkqmsFbGyMtCG2SunipahcRRRtswVgs=;
 b=FvyECNq6n3nammz0wotm6oPuGQ7pDH2z+Tkpxk8dVhhaZ1l7Tjm3XjTAoodYj0y+WMLqpN0zHeXQgr04W3kjToXIJO1uqejJpaz4wjSglcMtz8cu+jRAkKnSPwoPfeowEkivAjikd8r13aTORleQZqIQq8NlpjFi9QDhW+OhMR9eIui+JGpHofx98okU5ezT1+/DatH83nuldm+aQDw3cDK5KojyEXRCGXAtX8m9hyKiWiz9aYdcSfEWzymCn907ybQoqXxzWa7mAcCw0+KLNfoPNtSPhgqcOcyNmVLMieKc3czXijeNj0UM8Dzx/CPHtN4lRjLHDGeCFmYvJQeGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AsawoGcIXA1bkqmsFbGyMtCG2SunipahcRRRtswVgs=;
 b=DIfsOFs5pitjfQ8zOyGFP3gF65QoW+NeX2NV/UKAB33tHLzkXhbztFarEpWEOqOvGkb+cvHGR8B/c0n2NN8wRDasunQnlcHTZ6SYyoIvzvhAYdPb8fd56GpGkZQnEzw/fXUBByKW0IkoRbVgGG3eVUlU/x9GD2nO/33icaiQ7YU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
Date: Mon, 16 Dec 2024 14:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/12] xen/arm: add cache coloring support for Xen
 image
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241213162815.9196-13-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1e3bd2-f9be-42a9-bf02-08dd1dd96623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VitNR0NVZG1CRG9rVWI5TEdGUkJ0Qm5US0xyRWxTcmp2TG1CR3lGa3ZMbFRo?=
 =?utf-8?B?cTJ1NExGTmF6NGlUdUN1N2tHQ3U0SWZyMzM1M3d0N0JGNTVIL0FucXFFNlM0?=
 =?utf-8?B?c2t4TDVFQ21mdjA5WHl0cERiV242alJ4eG1iY3E1L045cnM3dzZCT0daRTV6?=
 =?utf-8?B?OWFwb21DTlh3ZEltSitnSjZLSGZ0WS9WcWcrRDBOYkgvL3c0dUVLdEFPQUVp?=
 =?utf-8?B?Wk1sRmdFKzdHVC82anFkcTl1YXh0Q3hVUGtlcmV3YW1pWS94WE1UaTNUYk9J?=
 =?utf-8?B?VGU3Tk5idW9BT2VwbTIwenZ4TzQ4VWhWTGlWandGTER1MkV2dTdWRXJnOXhh?=
 =?utf-8?B?TDJFWkp2QlZmRFZYL2p4eWRGcnlaWjg1Vk43SVo1NUU3Ykh4bW5QQTlkaXFH?=
 =?utf-8?B?VmJjL2NZMEhSQUF4VmJyNzY3SGc1NEd1cDFIbVhIS1RDSHlXTkdSOHZBSjU2?=
 =?utf-8?B?WTRab2d2RnJraXFKNEtsV0ZlNW85aXNkdGkyd0JUU0NyZGJ4eVJMWHdSc2Q4?=
 =?utf-8?B?Y05NY1pPaEczWXVleStEVU5KWGl5UXhIMGQ1c3prcUtZOWZZeWI4WHhmcW11?=
 =?utf-8?B?RWs3TEQ3RHhWb21Md0dmRWJqSFBlNFpwdTRDTGhHR1QrbE41bmp0bTVjQ1Ft?=
 =?utf-8?B?L09iWGFIWFVsVHJXUTk2WkRIRlM3OFp3eHkvdkNBeFNiTTNPMy9XMmR6TytF?=
 =?utf-8?B?bXdjWGoyeGxNVHZzQ0hPWEVlZFIxODhLc0VheHhkMEN5RlJpMVVNQjBUaThC?=
 =?utf-8?B?WE92cCtPWENTenRRYzduZVpDemNydnlDeGRrTDMvQjlINzM2STl4Tm1mTUo4?=
 =?utf-8?B?b1FpdnpQYzMvQ0ZCYVFaWHplN09qb2U0cERIbGI4bWxwQW9PNnpIOFJDNTZJ?=
 =?utf-8?B?NmtDbEJIYlFTWWV5MCtSbUR4NzBVdmZwQmc5ekJiaWZYalB5SVMra3BYZDdz?=
 =?utf-8?B?YS9Zd1RxWExkOENsZWo2Tlp2UnRFQTNLZTJPT05TcEF3V3pnTnowamZCcGdK?=
 =?utf-8?B?QnB0ZGhoRGV2bk10WFh4NmRaeDg1NSt5ZVJ4K21JTkkwZzZweEV3UzdQQTVm?=
 =?utf-8?B?bjlxQlNKYTZaSG11VVY5WFdSclVTdGt5eWpQd0drU2h3WDVhM2lLSHZOanFN?=
 =?utf-8?B?UUVid0xmdysvWFo5WllnVWNyQ3JJb1lWM0p3akxObUkyck1IaENtTUdud055?=
 =?utf-8?B?am8wUWhockhCdm5RVDBIeEd0WUtJWFJ6NjRBQkFQTTBObG1pV1A1ZXVEZ29Z?=
 =?utf-8?B?T3FZcysvMUhBT1RoQnJxUWQzdDZySjQ2eExRa09udlVhR2RYVi9qTWE1RVVo?=
 =?utf-8?B?dGl6Z25IVjJ2TVEzT2pxYXE5NmI0QWFSbHBURElzR3ZaQlUzdENQbEJNVVpx?=
 =?utf-8?B?Z3lYR0V3NDAwMjBTNzYyTzkyaHlobCs3Nlh3LzZOUWxkVFltdVE3YTlFdFlo?=
 =?utf-8?B?Zm9pODdmV2dRU0FPaXhURmtzbzhXeEJxQXFOSmFJYVhtREcxYzQ4eDRmTWVL?=
 =?utf-8?B?d25IUUpTTlphbm04MkdZejhGWVpXaGhUL0FyWnd2LzYwRDRhQkFQdWxyVWJ2?=
 =?utf-8?B?QVRWODJjYk1oRUdzblhHMkVhNHRtakdqNEdST0Z1TnhjS1hqNm5FTnRWTmJW?=
 =?utf-8?B?OC9KWVJRSmh5YUpFSXJQVVB4V0ZQSUEySjZMeWIyS3hZblFZc3JHV1E2U1Ja?=
 =?utf-8?B?RjREYzhwM2xrUThxR0xZckoxNkVRenQ5ak90bW1BS05YblpiMU43eHpzNkxP?=
 =?utf-8?B?dkp1ODJKMHp5WGVjb1FPZXZQSWN3NExGYVBQMHUxZmZhSUJnR0ZjU2NvcVZu?=
 =?utf-8?B?Mlh4Z0xMbGlUanRkOXF3ekdqZTRBZHNmUzQ3a09UdWpVU0JlVnJNMENlZXd0?=
 =?utf-8?B?U0hwTE0wOUVpamtnTTNQNS9sRVkybFdzR0RXOFR3dWViV1g4bG1BQVdnaFlV?=
 =?utf-8?B?SFlBVkR6SVUzZWVPVTlqT0V6WjhWcGVwTGp3V3pPV0tiVHl1WmVTNkJLVXhm?=
 =?utf-8?Q?+8RcNPhcXOGgN7qVDIH93dcSGwWTTc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:56:11.4268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1e3bd2-f9be-42a9-bf02-08dd1dd96623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582



On 13/12/2024 17:28, Carlo Nonato wrote:
> 
> 
> Xen image is relocated to a new colored physical space. Some relocation
> functionalities must be brought back:
> - the virtual address of the new space is taken from 0c18fb76323b
>   ("xen/arm: Remove unused BOOT_RELOC_VIRT_START").
> - relocate_xen() and get_xen_paddr() are taken from f60658c6ae47
>   ("xen/arm: Stop relocating Xen").
> 
> setup_pagetables() must be adapted for coloring and for relocation. Runtime
> page tables are used to map the colored space, but they are also linked in
> boot tables so that the new space is temporarily available for relocation.
> This implies that Xen protection must happen after the copy.
> 
> Finally, since the alternative framework needs to remap the Xen text and
> inittext sections, this operation must be done in a coloring-aware way.
> The function xen_remap_colored() is introduced for that.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common
> ---
> v12:
> - FUNC instead of ENTRY in head.S for relocate_xen
> - dc cvau instead of dc cvav in relocate_xen()
> - added relocate_and_switch_ttbr() to make setup_pagetables() code more clear
> v11:
> - else if -> if in xen_colored_mfn()
> v10:
> - no changes
> v9:
> - patch adapted to changes to setup_pagetables()
> v8:
> - moved xen_colored_map_size() to arm/llc-coloring.c
> v7:
> - added BUG_ON() checks to arch_llc_coloring_init() and
>   create_llc_coloring_mappings()
> v6:
> - squashed with BOOT_RELOC_VIRT_START patch
> - consider_modules() moved in another patch
> - removed psci and smpboot code because of new idmap work already handles that
> - moved xen_remap_colored() in alternative.c since it's only used there
> - removed xen_colored_temp[] in favor of xen_xenmap[] usage for mapping
> - use of boot_module_find_by_kind() to remove the need of extra parameter in
>   setup_pagetables()
> - moved get_xen_paddr() in arm/llc-coloring.c since it's only used there
> v5:
> - FIXME: consider_modules copy pasted since it got moved
> v4:
> - removed set_value_for_secondary() because it was wrongly cleaning cache
> - relocate_xen() now calls switch_ttbr_id()
> ---
>  xen/arch/arm/alternative.c            |  26 ++++++-
>  xen/arch/arm/arm64/mmu/head.S         |  58 ++++++++++++++-
>  xen/arch/arm/arm64/mmu/mm.c           |  29 ++++++++
>  xen/arch/arm/include/asm/mmu/layout.h |   3 +
>  xen/arch/arm/include/asm/mmu/mm.h     |   1 +
>  xen/arch/arm/llc-coloring.c           |  63 ++++++++++++++++
>  xen/arch/arm/mmu/setup.c              | 103 ++++++++++++++++++++++----
>  xen/arch/arm/setup.c                  |  10 ++-
>  xen/common/llc-coloring.c             |  18 +++++
>  xen/include/xen/llc-coloring.h        |  13 ++++
>  10 files changed, 304 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
> index fec7dbd2cd..2c1af6e7e4 100644
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -9,6 +9,7 @@
>  #include <xen/init.h>
>  #include <xen/types.h>
>  #include <xen/kernel.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/mm.h>
>  #include <xen/vmap.h>
>  #include <xen/smp.h>
> @@ -191,6 +192,25 @@ static int __apply_alternatives_multi_stop(void *xenmap)
>      return 0;
>  }
> 
> +static void __init *xen_remap_colored(mfn_t xen_mfn, paddr_t xen_size)
> +{
> +    unsigned int i;
> +    void *xenmap;
> +    mfn_t *xen_colored_mfns, mfn;
> +
> +    xen_colored_mfns = xmalloc_array(mfn_t, xen_size >> PAGE_SHIFT);
> +    if ( !xen_colored_mfns )
> +        panic("Can't allocate LLC colored MFNs\n");
> +
> +    for_each_xen_colored_mfn ( xen_mfn, mfn, i )
> +        xen_colored_mfns[i] = mfn;
> +
> +    xenmap = vmap(xen_colored_mfns, xen_size >> PAGE_SHIFT);
> +    xfree(xen_colored_mfns);
> +
> +    return xenmap;
> +}
> +
>  /*
>   * This function should only be called during boot and before CPU0 jump
>   * into the idle_loop.
> @@ -209,7 +229,11 @@ void __init apply_alternatives_all(void)
>       * The text and inittext section are read-only. So re-map Xen to
>       * be able to patch the code.
>       */
> -    xenmap = vmap_contig(xen_mfn, 1U << xen_order);
> +    if ( llc_coloring_enabled )
> +        xenmap = xen_remap_colored(xen_mfn, xen_size);
> +    else
> +        xenmap = vmap_contig(xen_mfn, 1U << xen_order);
> +
>      /* Re-mapping Xen is not expected to fail during boot. */
>      BUG_ON(!xenmap);
> 
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index 665a51a337..634156f83d 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -428,6 +428,61 @@ FUNC_LOCAL(fail)
>          b     1b
>  END(fail)
> 
> +/*
> + * Copy Xen to new location and switch TTBR
> + * x0    ttbr
> + * x1    source address
> + * x2    destination address
> + * x3    length
> + *
> + * Source and destination must be word aligned, length is rounded up
> + * to a 16 byte boundary.
> + *
> + * MUST BE VERY CAREFUL when saving things to RAM over the copy
> + */
> +FUNC(relocate_xen)
> +        /*
> +         * Copy 16 bytes at a time using:
> +         *   x9: counter
> +         *   x10: data
> +         *   x11: data
> +         *   x12: source
> +         *   x13: destination
> +         */
> +        mov     x9, x3
> +        mov     x12, x1
> +        mov     x13, x2
> +
> +1:      ldp     x10, x11, [x12], #16
> +        stp     x10, x11, [x13], #16
> +
> +        subs    x9, x9, #16
> +        bgt     1b
> +
> +        /*
> +         * Flush destination from dcache using:
> +         *   x9: counter
> +         *   x10: step
> +         *   x11: vaddr
> +         *
> +         * This is to ensure data is visible to the instruction cache
> +         */
> +        dsb   sy
> +
> +        mov   x9, x3
> +        ldr   x10, =dcache_line_bytes /* x10 := step */
> +        ldr   x10, [x10]
> +        mov   x11, x2
> +
> +1:      dc    cvau, x11
> +
> +        add   x11, x11, x10
> +        subs  x9, x9, x10
> +        bgt   1b
> +
> +        /* No need for dsb/isb because they are alredy done in switch_ttbr_id */
> +        b switch_ttbr_id
> +
>  /*
>   * Switch TTBR
>   *
> @@ -453,7 +508,8 @@ FUNC(switch_ttbr_id)
> 
>          /*
>           * 5) Flush I-cache
> -         * This should not be necessary but it is kept for safety.
> +         * This should not be necessary in the general case, but it's needed
> +         * for cache coloring because code is relocated in that case.
>           */
>          ic     iallu
>          isb
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 671eaadbc1..f1f2543902 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> 
>  #include <xen/init.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/mm.h>
>  #include <xen/pfn.h>
> 
> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
>  }
> 
>  extern void switch_ttbr_id(uint64_t ttbr);
> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
> 
>  typedef void (switch_ttbr_fn)(uint64_t ttbr);
> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
> +
> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
CODING_STYLE: { needs to be on its own line

Also, this function is only executed in case of LLC coloring, so shouldn't it
be #ifdef protected.

> +    vaddr_t id_addr = virt_to_maddr(relocate_xen);
> +    relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
> +    lpae_t pte;
> +
> +    /* Enable the identity mapping in the boot page tables */
> +    update_identity_mapping(true);
> +
> +    /* Enable the identity mapping in the runtime page tables */
> +    pte = pte_of_xenaddr((vaddr_t)relocate_xen);
> +    pte.pt.table = 1;
> +    pte.pt.xn = 0;
> +    pte.pt.ro = 1;
> +    write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
> +
> +    /* Relocate Xen and switch TTBR */
> +    fn(ttbr, _start, (void *)BOOT_RELOC_VIRT_START, _end - _start);
> +
> +    /*
> +     * Disable the identity mapping in the runtime page tables.
> +     * Note it is not necessary to disable it in the boot page tables
> +     * because they are not going to be used by this CPU anymore.
> +     */
> +    update_identity_mapping(false);
> +}
> 
>  void __init switch_ttbr(uint64_t ttbr)
>  {
> diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
> index a3b546465b..19c0ec63a5 100644
> --- a/xen/arch/arm/include/asm/mmu/layout.h
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -30,6 +30,7 @@
>   *  10M -  12M   Fixmap: special-purpose 4K mapping slots
>   *  12M -  16M   Early boot mapping of FDT
>   *  16M -  18M   Livepatch vmap (if compiled in)
> + *  16M -  24M   Cache-colored Xen text, data, bss (temporary, if compiled in)
>   *
>   *   1G -   2G   VMAP: ioremap and early_ioremap
>   *
> @@ -74,6 +75,8 @@
>  #define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
>  #define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
> 
> +#define BOOT_RELOC_VIRT_START   (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> +
>  #ifdef CONFIG_LIVEPATCH
>  #define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
>  #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index c5e03a66bf..f5a00558c4 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -31,6 +31,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
> 
>  /* Switch to a new root page-tables */
>  extern void switch_ttbr(uint64_t ttbr);
> +extern void relocate_and_switch_ttbr(uint64_t ttbr);
> 
>  #endif /* __ARM_MMU_MM_H__ */
> 
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> index 1c7b92bc45..7cb4ecb50e 100644
> --- a/xen/arch/arm/llc-coloring.c
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -9,6 +9,7 @@
>  #include <xen/llc-coloring.h>
> 
>  #include <asm/processor.h>
> +#include <asm/setup.h>
>  #include <asm/sysregs.h>
>  #include <asm/system.h>
> 
> @@ -64,8 +65,70 @@ unsigned int __init get_llc_way_size(void)
>      return line_size * num_sets;
>  }
> 
> +/**
Incorrect comment style. Should be /*

> + * get_xen_paddr - get physical address to relocate Xen to
> + *
> + * Xen is relocated to as near to the top of RAM as possible and
> + * aligned to a XEN_PADDR_ALIGN boundary.
> + */
> +static paddr_t __init get_xen_paddr(paddr_t xen_size)
> +{
> +    const struct membanks *mem = bootinfo_get_mem();
> +    paddr_t min_size, paddr = 0;
> +    unsigned int i;
> +
> +    min_size = ROUNDUP(xen_size, XEN_PADDR_ALIGN);
> +
> +    /* Find the highest bank with enough space. */
> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        const struct membank *bank = &mem->bank[i];
> +        paddr_t s, e;
> +
> +        if ( bank->size >= min_size )
> +        {
> +            e = consider_modules(bank->start, bank->start + bank->size,
> +                                 min_size, XEN_PADDR_ALIGN, 0);
> +            if ( !e )
> +                continue;
> +
> +#ifdef CONFIG_ARM_32
> +            /* Xen must be under 4GB */
> +            if ( e > GB(4) )
> +                e = GB(4);
> +            if ( e < bank->start )
> +                continue;
> +#endif
> +
> +            s = e - min_size;
> +
> +            if ( s > paddr )
> +                paddr = s;
> +        }
> +    }
> +
> +    if ( !paddr )
> +        panic("Not enough memory to relocate Xen\n");
> +
> +    printk("Placing Xen at 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> +           paddr, paddr + min_size);
> +
> +    return paddr;
> +}
> +
> +static paddr_t __init xen_colored_map_size(void)
> +{
> +    return ROUNDUP((_end - _start) * get_max_nr_llc_colors(), XEN_PADDR_ALIGN);
> +}
> +
>  void __init arch_llc_coloring_init(void)
>  {
> +    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
> +
> +    BUG_ON(!xen_bootmodule);
> +
> +    xen_bootmodule->size = xen_colored_map_size();
> +    xen_bootmodule->start = get_xen_paddr(xen_bootmodule->size);
>  }
> 
>  /*
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 196974f3e2..073f762a32 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -7,6 +7,7 @@
> 
>  #include <xen/init.h>
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/sections.h>
>  #include <xen/sizes.h>
>  #include <xen/vmap.h>
> @@ -20,6 +21,9 @@
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> 
> +#define virt_to_reloc_virt(virt) \
> +    (((vaddr_t)virt) - XEN_VIRT_START + BOOT_RELOC_VIRT_START)
You need to enclose 'virt' in paranthesis.

> +
>  /* Main runtime page tables */
> 
>  /*
> @@ -69,6 +73,7 @@ static void __init __maybe_unused build_assertions(void)
>      /* 2MB aligned regions */
>      BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
>      BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
> +    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
>      /* 1GB aligned regions */
>  #ifdef CONFIG_ARM_32
>      BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
> @@ -138,6 +143,9 @@ static void __init __maybe_unused build_assertions(void)
> 
>  lpae_t __init pte_of_xenaddr(vaddr_t va)
>  {
> +    if ( llc_coloring_enabled )
> +        va = virt_to_reloc_virt(va);
> +
>      return mfn_to_xen_entry(virt_to_mfn(va), MT_NORMAL);
>  }
> 
> @@ -316,6 +324,32 @@ paddr_t __init consider_modules(paddr_t s, paddr_t e,
>      return e;
>  }
> 
> +static void __init create_llc_coloring_mappings(void)
Shouldn't this be #ifdef protected and stub provided if config disabled?.

> +{
> +    lpae_t pte;
> +    unsigned int i;
> +    struct bootmodule *xen_bootmodule = boot_module_find_by_kind(BOOTMOD_XEN);
> +    mfn_t start_mfn = maddr_to_mfn(xen_bootmodule->start), mfn;
> +
> +    for_each_xen_colored_mfn ( start_mfn, mfn, i )
> +    {
> +        pte = mfn_to_xen_entry(mfn, MT_NORMAL);
> +        pte.pt.table = 1; /* level 3 mappings always have this bit set */
> +        xen_xenmap[i] = pte;
> +    }
> +
> +    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
> +    {
> +        vaddr_t va = BOOT_RELOC_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
> +
> +        pte = mfn_to_xen_entry(virt_to_mfn(xen_xenmap +
> +                                           i * XEN_PT_LPAE_ENTRIES),
> +                               MT_NORMAL);
> +        pte.pt.table = 1;
> +        write_pte(&boot_second[second_table_offset(va)], pte);
> +    }
> +}
> +
>  /*
>   * Boot-time pagetable setup.
>   * Changes here may need matching changes in head.S
> @@ -326,6 +360,14 @@ void __init setup_pagetables(void)
>      lpae_t pte, *p;
>      int i;
> 
> +    /*
> +     * In case of cache coloring, map the new physical space in the boot page
> +     * tables. From now on, pte_of_xenaddr() will translate addresses to this
> +     * new space.
> +     */
> +    if ( llc_coloring_enabled )
> +        create_llc_coloring_mappings();
> +
>      arch_setup_page_tables();
> 
>  #ifdef CONFIG_ARM_64
> @@ -353,13 +395,7 @@ void __init setup_pagetables(void)
>              break;
>          pte = pte_of_xenaddr(va);
>          pte.pt.table = 1; /* third level mappings always have this bit set */
> -        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> -        {
> -            pte.pt.xn = 0;
> -            pte.pt.ro = 1;
> -        }
> -        if ( is_kernel_rodata(va) )
> -            pte.pt.ro = 1;
> +        pte.pt.xn = 0; /* Permissions will be enforced later. Allow execution */
>          xen_xenmap[i] = pte;
>      }
> 
> @@ -379,19 +415,54 @@ void __init setup_pagetables(void)
>      pte.pt.table = 1;
>      xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
> 
> -#ifdef CONFIG_ARM_64
> -    ttbr = virt_to_maddr(xen_pgtable);
> -#else
> -    ttbr = virt_to_maddr(cpu0_pgtable);
> +#ifdef CONFIG_ARM_32
> +    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
>  #endif
> 
> -    switch_ttbr(ttbr);
> +    if ( llc_coloring_enabled ) {
CODING_STYLE: { needs to be on its own line

> +        ttbr = virt_to_maddr(virt_to_reloc_virt(THIS_CPU_PGTABLE));
> +        relocate_and_switch_ttbr(ttbr);
> +    }
> +    else {
CODING_STYLE: { needs to be on its own line

> +        ttbr = virt_to_maddr(THIS_CPU_PGTABLE);
> +        switch_ttbr(ttbr);
> +    }
> 
> -    xen_pt_enforce_wnx();
> +    /* Protect Xen */
> +    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
> +    {
> +        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
> +        lpae_t *entry = xen_xenmap + i;
> 
> -#ifdef CONFIG_ARM_32
> -    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
> -#endif
> +        if ( !is_kernel(va) )
> +            break;
> +
> +        pte = read_atomic(entry);
> +
> +        if ( is_kernel_text(va) || is_kernel_inittext(va) )
> +        {
> +            pte.pt.xn = 0;
> +            pte.pt.ro = 1;
> +        }
> +        else if ( is_kernel_rodata(va) ) {
CODING_STYLE: { needs to be on its own line

> +            pte.pt.ro = 1;
> +            pte.pt.xn = 1;
> +        }
> +        else {
CODING_STYLE: { needs to be on its own line

> +            pte.pt.xn = 1;
> +            pte.pt.ro = 0;
> +        }
> +
> +        write_pte(entry, pte);
> +    }
> +
> +    /*
> +     * We modified live page-tables. Ensure the TLBs are invalidated
> +     * before setting enforcing the WnX permissions.
> +     */
> +    flush_xen_tlb_local();
> +
> +    xen_pt_enforce_wnx();
>  }
> 
>  void *__init arch_vmap_virt_end(void)
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 568a49b274..5e2c519ce8 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -304,8 +304,6 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>      /* Initialize traps early allow us to get backtrace when an error occurred */
>      init_traps();
> 
> -    setup_pagetables();
> -
>      smp_clear_cpu_maps();
> 
>      device_tree_flattened = early_fdt_map(fdt_paddr);
> @@ -329,6 +327,14 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
> 
>      llc_coloring_init();
> 
> +    /*
> +     * Page tables must be setup after LLC coloring initialization because
> +     * coloring info are required in order to create colored mappings
> +     */
> +    setup_pagetables();
> +    /* Device-tree was mapped in boot page tables, remap it in the new tables */
> +    device_tree_flattened = early_fdt_map(fdt_paddr);
> +
>      setup_mm();
> 
>      vm_init();
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index ff4837fcc6..545d8b49e8 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -42,6 +42,8 @@ static unsigned int __ro_after_init xen_num_colors;
> 
>  #define mfn_color_mask              (max_nr_colors - 1)
>  #define mfn_to_color(mfn)           (mfn_x(mfn) & mfn_color_mask)
> +#define get_mfn_with_color(mfn, color) \
> +    (_mfn((mfn_x(mfn) & ~mfn_color_mask) | (color)))
> 
>  /*
>   * Parse the coloring configuration given in the buf string, following the
> @@ -364,6 +366,22 @@ unsigned int get_max_nr_llc_colors(void)
>      return max_nr_colors;
>  }
> 
> +mfn_t __init xen_colored_mfn(mfn_t mfn)
> +{
> +    unsigned int i, color = mfn_to_color(mfn);
> +
> +    for ( i = 0; i < xen_num_colors; i++ )
> +    {
> +        if ( color == xen_colors[i] )
> +            return mfn;
> +        if ( color < xen_colors[i] )
> +            return get_mfn_with_color(mfn, xen_colors[i]);
> +    }
> +
> +    /* Jump to next color space (max_nr_colors mfns) and use the first color */
> +    return get_mfn_with_color(mfn_add(mfn, max_nr_colors), xen_colors[0]);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> index 1216d1fbd4..30c8a1d9a6 100644
> --- a/xen/include/xen/llc-coloring.h
> +++ b/xen/include/xen/llc-coloring.h
> @@ -8,6 +8,7 @@
>  #ifndef __XEN_LLC_COLORING_H__
>  #define __XEN_LLC_COLORING_H__
> 
> +#include <xen/mm-frame.h>
>  #include <xen/types.h>
> 
>  struct domain;
> @@ -30,6 +31,17 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
>  static inline void domain_llc_coloring_free(struct domain *d) {}
>  #endif
> 
> +/**
> + * Iterate over each Xen mfn in the colored space.
> + * @start_mfn:  the first mfn that needs to be colored.
> + * @mfn:        the current mfn.
> + * @i:          loop index.
> + */
> +#define for_each_xen_colored_mfn(start_mfn, mfn, i) \
> +    for ( i = 0, mfn = xen_colored_mfn(start_mfn);  \
Here and elsewhere you need to enclose 'i' in paranthesis. Otherwise ECLAIR will report 20.7 violation.

> +          i < (_end - _start) >> PAGE_SHIFT;        \
> +          i++, mfn = xen_colored_mfn(mfn_add(mfn, 1)) )
> +
>  unsigned int get_llc_way_size(void);
>  void arch_llc_coloring_init(void);
>  int dom0_set_llc_colors(struct domain *d);
> @@ -38,6 +50,7 @@ int domain_set_llc_colors(struct domain *d,
>  int domain_set_llc_colors_from_str(struct domain *d, const char *str);
>  unsigned int page_to_llc_color(const struct page_info *pg);
>  unsigned int get_max_nr_llc_colors(void);
> +mfn_t xen_colored_mfn(mfn_t mfn);
> 
>  #endif /* __XEN_LLC_COLORING_H__ */
> 
> --
> 2.43.0
> 

~Michal


