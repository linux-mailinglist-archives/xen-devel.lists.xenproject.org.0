Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1E9F301A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857905.1270105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9ty-00062Y-Od; Mon, 16 Dec 2024 12:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857905.1270105; Mon, 16 Dec 2024 12:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9ty-0005zv-L0; Mon, 16 Dec 2024 12:08:42 +0000
Received: by outflank-mailman (input) for mailman id 857905;
 Mon, 16 Dec 2024 12:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/+0=TJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tN9tw-0005zp-74
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:08:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2413::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a563cd8-bba6-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 13:08:37 +0100 (CET)
Received: from CY5PR22CA0026.namprd22.prod.outlook.com (2603:10b6:930:16::16)
 by CH2PR12MB9493.namprd12.prod.outlook.com (2603:10b6:610:27c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 12:08:31 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:16:cafe::30) by CY5PR22CA0026.outlook.office365.com
 (2603:10b6:930:16::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Mon,
 16 Dec 2024 12:08:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 12:08:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 06:08:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 06:08:30 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Dec 2024 06:08:29 -0600
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
X-Inumbo-ID: 7a563cd8-bba6-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2p22iqhFYpCS2fMcC0mjBUxBYSKt/9rL7FVGubKmtTtq7QCZV3UsAGrnkPMM/wh4WWPQ06Vus9dQKg8qw8Ro7Fna1IVxleWNzXJ/YkcNJt5BLmHHsocFwdEf8hixY+C0xPrySbTyoN/ZoHlX3HYgh3J1H+mayGzMJLP8a+ZFDDzBJsomy8b7DvAStRSAs0i3DD/s+Y/0RDaeP++2y+xG8eEJLkF0vhpuRLHCGaLY6MT1bWPGxROiGSDu877y2H/9tIaByvBUqqau0tk2CM26LhOUig/maB50s+WFD1fnXRHQMj3XQiMh6L5HNd7qfntAgvleZ+xDHVsRpN3agKXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBeJCbgxaAyLeBYJ1WxdC5gReHzTab06dZAagJ453To=;
 b=cSbCJ0aJ3+XOGoOOvAVNDaVDLGB8WjFnQsDHzRVdB3Co2Ld4KLNlLIpjfk3OfMOk2v4O4auGQHFuq+7AoWyX9DPyetb/GQDYh22Gj/MDgfvGByl0VPsGNIvGSs9Agj2KnBy4PSP/OuYIdXjv11VuSE4XmrVyz5/3LdszJQvdy4SAI+MFXYJkb75he6gFtr9sxa3mylNhPLCl1HpGEb50fMVhFV3WFIAmxZ/uIZ+Y/yIAzLjrdDlXWaKmOT9l0Ph3t9yg2N+LgGOOxoMdxv4EInWIFIrS4MAgP4x7aQ17XyzYQQgKk/lGCMWlj3zI6rYp+8a/TXKZjYFLZA4juUXFjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBeJCbgxaAyLeBYJ1WxdC5gReHzTab06dZAagJ453To=;
 b=c3p1nqZF+GzMPNPR5kDitdXDdj9JyBsH91Cpq3OQWSDP//xzXO+yFImqyqetSPVpdPk2ffw6mcE4PKFCI1LaZSisPxnvReyHaK/ZVlX+ontL/PuZL4TPdfjg7bgHKSSUcVvEwapESv/6cJOFXHkVhEWmRHASkXSxyFQtMzGRQwA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <adfdc378-e1cd-4500-a21c-6c5660ebfd1b@amd.com>
Date: Mon, 16 Dec 2024 13:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-4-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241213162815.9196-4-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CH2PR12MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7fde1e-b15c-48a6-bc48-08dd1dca5baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUUvc3pUMUxJUEphZGlSa1FBZVd3V2pTWDByY29vL2htMzJjWkJPT1RPUVJL?=
 =?utf-8?B?Vk5zQzNOYUtwV091dDFtcThhZ3JFamRBSlcrNy9ZZXgxNnhRNE02Uno5eVJ0?=
 =?utf-8?B?cEY1cHg0UmlsUnVLb2wzMzNLMFYrMEdaUEs3Y2d0a0JGNUhsN1FvTmVDSXRY?=
 =?utf-8?B?VHM5em1RWjRKUnNCbDFnTnVnVUZyT1NhbXFGMVgyUmd5NHlXUnBqT3M3dlhi?=
 =?utf-8?B?bzlHK2orbS8wUTRSRk1uYzM3K2d3UWNMV2VMbmtZSUlQUTJYSUtDNDVWTVdZ?=
 =?utf-8?B?OHF2YmxVd2ovZTR5RDVqT3NxcjNDZ2l0emZOZEU0OExHclY3MnBjU2hGUjNr?=
 =?utf-8?B?RnNkRkl3Yk5vY3lDQ1l3OEE2aStsc3dDcmt1dWQvb0FHN0laQ295ZDI5NEw4?=
 =?utf-8?B?Y2JrWXRlUlZzWHNCR1RHcDNYNVczRFI5NnFuRnljRUZzQUNpdTlrSWRTdEY0?=
 =?utf-8?B?VGlad3ZZcFZ5ek5XMFZkRmhqNkVzT0kxQXh1OUFrZDJ3SkJNdGFUT0VYOFBN?=
 =?utf-8?B?VVdrTWRBeDJwRStMWmc0L2pTVjg5N3lQYnArd094YUplVjMwVnhiVmpRVTZO?=
 =?utf-8?B?RS9nY0tINkwxdElWQVhCcEdkdEJReE5LU3dRdHYwajI2WjBrbFMyREtTb3Fr?=
 =?utf-8?B?dzVyUmlXVUcvU3J1emUzSkxva09Gc0FmNm96WXp1Y1ZOT0VXNUtWQU9ReXdq?=
 =?utf-8?B?NU81L3NiTG5uNGpDSkNYUWNFYVJWZENOQ3pQdlpWSytrM3Bnd1Joa2VjUjZw?=
 =?utf-8?B?WFgzYTFDNWRkdXVXZTZiSE1XN3VpcVErWnJ5U003V09iNm9aaUxZM0pEcmRU?=
 =?utf-8?B?bzRjazlmamVydXQ3bWYvYjV0UC9vK2haNm1vclF1a0RmVG1nUGd2MUV3RXNi?=
 =?utf-8?B?ak96U2UyVVNWRVNBSEs5eFB0WmtIS1NOdC90YXUrSlk2akpodDU4QkxkdjZI?=
 =?utf-8?B?TEJlM2F0OHZJdTdNcExNV0tYTG0xWW00RDA2Ykk0Q215R2x5bzlrb3Z5dTB3?=
 =?utf-8?B?YkIrbkxOdEF6eVRuVmhuZTRLVzR4eTBJSzJ6R2xMN3h2K0JGeVJmbFA1SnVG?=
 =?utf-8?B?UlRvcnVHVkY0Q281bktzRk5KWHMrMmRyUWhZb3Q0Ynd3c282QkNDMU1xUDFj?=
 =?utf-8?B?cUhHb3RhY0lqTFA1NWU5UUdJTjNjNEtQdHlkR3E3YXdJSEFQL3l6ekJ1NjVp?=
 =?utf-8?B?QWR0eDNkay90YnY5RnhLSTBqQ0IvRWFOLzY1MUhYank3YU5WZWJGang4WHA0?=
 =?utf-8?B?NnV2T0oxUmVoYWkwclluTG9KNW9zYnNhK250ZnQwVS8zN3ZhbzlvTjM4Nzhs?=
 =?utf-8?B?bVphNXdsVUp2SVFEYWdDbXBqcUszZEtaYXhGR3Vrc2NORnNockNLOVF0a2pE?=
 =?utf-8?B?cVpUMXVrQ2xHZmxVK2pVQVRmdkptMEJDUUVCS0FwWEwvSU9vc09LdEhUbGlJ?=
 =?utf-8?B?R3RzUG1SS1NPSlJldzJFbk00akgrZk52M1RpVXRaT2tZT3ExL29DaWZtQVJv?=
 =?utf-8?B?bWs5ampML2pQUFN5L21ZTE56WDNRR0VxNWVsT3ZjU3d3bmRIVEpROUJvaXBs?=
 =?utf-8?B?VmFIRzhJbVlFV0xNM0pSb3lCTDhOaDB1N0dqaHZLOThLTHhXdHhYcFpZVitM?=
 =?utf-8?B?YzhybFRMbEFXc3grem9mZmQxbEtnM1RQVTk5T3VyazNkMjhkZnZHMjFnazJ5?=
 =?utf-8?B?NnVGZkQ2d29hM2Yva0VxeENuVjNRZ29VcUJ2L3pOcW9CWUt6L25ha0VtSHRh?=
 =?utf-8?B?bXVSRk1qV09qMDM4enAzN0txN2g5YWRIbnR3MW12WUxYQ2ptNklRd3lySDFo?=
 =?utf-8?B?dWxIMGFZdk5tMTBjSzdUUGIxZW9kTk9wcjlhR1lNd3JpRHN3WWlkYUNubGZ4?=
 =?utf-8?B?cVJudVJYaFEyNytJSW52dGxvTnl2UUtPYXhZMWh3ZWVtTVRENlR0Q1lTOEw1?=
 =?utf-8?B?dWN3aXh5bUtCaitIVmE3MEpPTVQ5OXd0OHF4QnVHTTh1WkRYNkhORHNQeW1m?=
 =?utf-8?Q?3gHFrSSo1NNh20b2tG1A14oR4Rgr3E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 12:08:31.3275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7fde1e-b15c-48a6-bc48-08dd1dca5baa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9493



On 13/12/2024 17:28, Carlo Nonato wrote:
> 
> 
> Cache coloring requires Dom0 not to be direct-mapped because of its non
> contiguous mapping nature, so allocate_memory() is needed in this case.
> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
> moved allocate_memory() in dom0less_build.c. In order to use it
> in Dom0 construction bring it back to domain_build.c and declare it in
> domain_build.h.
> 
> Adapt the implementation of allocate_memory() so that it uses the host
> layout when called on the hwdom, via find_unallocated_memory(). Take the
> opportunity to keep the parameter order consistent with
> rangeset_report_ranges() and move the membanks struct after the callback
> function in find_unallocated_memory().
Why? What benefit does this change (that is irrelevant to the goal of this patch) provide?

> 
> Introduce add_hwdom_free_regions() callback to add hwdom banks in descending
> order.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v12:
> - used the new generic find_unallocated_memory()
> - added add_hwdom_free_regions() callback
> v11:
> - GUEST_RAM_BANKS instead of hardcoding the number of banks in allocate_memory()
> - hwdom_ext_regions -> hwdom_free_mem in allocate_memory()
> - added a comment in allocate_memory() when skipping small banks
> v10:
> - fixed a compilation bug that happened when dom0less support was disabled
> v9:
> - no changes
> v8:
> - patch adapted to new changes to allocate_memory()
> v7:
> - allocate_memory() now uses the host layout when called on the hwdom
> v6:
> - new patch
> ---
>  xen/arch/arm/dom0less-build.c           |  44 -------
>  xen/arch/arm/domain_build.c             | 164 +++++++++++++++++++++++-
>  xen/arch/arm/include/asm/domain_build.h |   4 +
>  3 files changed, 161 insertions(+), 51 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index d93a85434e..67b1503647 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -49,50 +49,6 @@ bool __init is_dom0less_mode(void)
>      return ( !dom0found && domUfound );
>  }
> 
> -static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
> -{
> -    struct membanks *mem = kernel_info_get_mem(kinfo);
> -    unsigned int i;
> -    paddr_t bank_size;
> -
> -    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
> -           /* Don't want format this as PRIpaddr (16 digit hex) */
> -           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> -
> -    mem->nr_banks = 0;
> -    bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
> -                               bank_size) )
> -        goto fail;
> -
> -    bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> -                               bank_size) )
> -        goto fail;
> -
> -    if ( kinfo->unassigned_mem )
> -        goto fail;
> -
> -    for( i = 0; i < mem->nr_banks; i++ )
> -    {
> -        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
> -               d,
> -               i,
> -               mem->bank[i].start,
> -               mem->bank[i].start + mem->bank[i].size,
> -               /* Don't want format this as PRIpaddr (16 digit hex) */
> -               (unsigned long)(mem->bank[i].size >> 20));
> -    }
> -
> -    return;
> -
> -fail:
> -    panic("Failed to allocate requested domain memory."
> -          /* Don't want format this as PRIpaddr (16 digit hex) */
> -          " %ldKB unallocated. Fix the VMs configurations.\n",
> -          (unsigned long)kinfo->unassigned_mem >> 10);
> -}
> -
>  #ifdef CONFIG_VGICV2
>  static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>  {
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index adf26f2778..bfcff99194 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2,6 +2,7 @@
>  #include <xen/init.h>
>  #include <xen/compile.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
>  #include <xen/domain_page.h>
> @@ -416,7 +417,6 @@ static void __init allocate_memory_11(struct domain *d,
>      }
>  }
> 
> -#ifdef CONFIG_DOM0LESS_BOOT
>  bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>                                      alloc_domheap_mem_cb cb, void *extra)
>  {
> @@ -508,7 +508,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> 
>      return true;
>  }
> -#endif
> 
>  /*
>   * When PCI passthrough is available we want to keep the
> @@ -900,6 +899,52 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>      return 0;
>  }
> 
> +static int __init add_hwdom_free_regions(unsigned long s_gfn,
> +                                         unsigned long e_gfn, void *data)
> +{
> +    struct membanks *free_regions = data;
> +    paddr_t start, size;
> +    paddr_t s = pfn_to_paddr(s_gfn);
> +    paddr_t e = pfn_to_paddr(e_gfn);
> +    unsigned int i, j;
> +
> +    if ( free_regions->nr_banks >= free_regions->max_banks )
> +        return 0;
> +
> +    /*
> +     * Both start and size of the free region should be 2MB aligned to
> +     * potentially allow superpage mapping.
> +     */
> +    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
> +    if ( start > e )
> +        return 0;
> +
> +    /*
> +     * e is actually "end-1" because it is called by rangeset functions
> +     * which are inclusive of the last address.
> +     */
> +    e += 1;
> +    size = (e - start) & ~(SZ_2M - 1);
> +
> +    /* Find the insert position (descending order). */
> +    for ( i = 0; i < free_regions->nr_banks ; i++)
CODING_STYLE:
for ( i = 0; i < free_regions->nr_banks; i++ )

> +        if ( size > free_regions->bank[i].size )
> +            break;
> +
> +    /* Move the other banks to make space. */
> +    for ( j = free_regions->nr_banks; j > i ; j-- )
> +    {
> +        free_regions->bank[j].start = free_regions->bank[j - 1].start;
> +        free_regions->bank[j].size = free_regions->bank[j - 1].size;
> +    }
> +
> +    free_regions->bank[i].start = start;
> +    free_regions->bank[i].size = size;
> +    free_regions->nr_banks++;
The algorithm looks good. In my head I thought you will use sort() after adding all the banks, but
I'm not sure which solution is more efficient. Probably yours and it avoids implementing cmp and swap functions.

> +
> +    return 0;
> +}
> +
>  /*
>   * Find unused regions of Host address space which can be exposed to domain
>   * using the host memory layout. In order to calculate regions we exclude every
> @@ -908,10 +953,10 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>  static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>                                            const struct membanks *mem_banks[],
>                                            unsigned int nr_mem_banks,
> -                                          struct membanks *free_regions,
>                                            int (*cb)(unsigned long s_gfn,
>                                                      unsigned long e_gfn,
> -                                                    void *data))
> +                                                    void *data),
> +                                          struct membanks *free_regions)
>  {
>      const struct membanks *mem = bootinfo_get_mem();
>      struct rangeset *unalloc_mem;
> @@ -977,6 +1022,108 @@ out:
>      return res;
>  }
> 
> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
> +{
> +    struct membanks *mem = kernel_info_get_mem(kinfo);
> +    unsigned int i, nr_banks = GUEST_RAM_BANKS;
> +    struct membanks *hwdom_free_mem = NULL;
> +
> +    printk(XENLOG_INFO "Allocating mappings totalling %ldMB for %pd:\n",
> +           /* Don't want format this as PRIpaddr (16 digit hex) */
> +           (unsigned long)(kinfo->unassigned_mem >> 20), d);
> +
> +    mem->nr_banks = 0;
> +    /*
> +     * Use host memory layout for hwdom. Only case for this is when LLC coloring
> +     * is enabled.
> +     */
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
> +        /*
> +         * Exclude the following regions:
> +         * 1) Remove reserved memory
> +         * 2) Grant table assigned to Dom0
Can we not mention 'Dom0'? In the future hwdom may not necessarily be dom0. Especially that
in other places you mention hwdom.

> +         */
> +        const struct membanks *mem_banks[] = {
> +            bootinfo_get_reserved_mem(),
> +            gnttab,
> +        };
> +
> +        ASSERT(llc_coloring_enabled);
Remove this assert. There's nothing LLC special here and this could be re-used in the future
to provide non 1:1 hwdom.

> +
> +        if ( !gnttab )
> +            goto fail;
> +
> +        gnttab->nr_banks = 1;
> +        gnttab->bank[0].start = kinfo->gnttab_start;
> +        gnttab->bank[0].size = kinfo->gnttab_start + kinfo->gnttab_size;
Incorrect. You assign to 'end' to'size'. It should simply be:
gnttab->bank[0].size = kinfo->gnttab_size.

> +
> +        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
> +                                             NR_MEM_BANKS);
> +        if ( !hwdom_free_mem )
> +            goto fail;
> +
> +        hwdom_free_mem->max_banks = NR_MEM_BANKS;
> +
> +        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
> +                                     add_hwdom_free_regions, hwdom_free_mem) )
> +            goto fail;
> +
> +        nr_banks = hwdom_free_mem->nr_banks;
> +        xfree(gnttab);
> +    }
> +
> +    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
> +    {
> +        paddr_t bank_start, bank_size;
> +
> +        if ( is_hardware_domain(d) )
> +        {
> +            bank_start = hwdom_free_mem->bank[i].start;
> +            bank_size = hwdom_free_mem->bank[i].size;
> +        }
> +        else
> +        {
> +            const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> +            const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> +
> +            if ( i >= GUEST_RAM_BANKS )
> +                goto fail;
> +
> +            bank_start = bankbase[i];
> +            bank_size = banksize[i];
> +        }
> +
> +        bank_size = MIN(bank_size, kinfo->unassigned_mem);
> +        if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(bank_start), bank_size) )
> +            goto fail;
> +    }
> +
> +    if ( kinfo->unassigned_mem )
> +        goto fail;
> +
> +    for( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
> +               d,
> +               i,
> +               mem->bank[i].start,
> +               mem->bank[i].start + mem->bank[i].size,
> +               /* Don't want format this as PRIpaddr (16 digit hex) */
> +               (unsigned long)(mem->bank[i].size >> 20));
> +    }
> +
> +    xfree(hwdom_free_mem);
> +    return;
> +
> +fail:
> +    panic("Failed to allocate requested domain memory."
> +          /* Don't want format this as PRIpaddr (16 digit hex) */
> +          " %ldKB unallocated. Fix the VMs configurations.\n",
> +          (unsigned long)kinfo->unassigned_mem >> 10);
> +}
> +
>  static int __init handle_pci_range(const struct dt_device_node *dev,
>                                     uint64_t addr, uint64_t len, void *data)
>  {
> @@ -1176,7 +1323,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>      gnttab->bank[0].size = kinfo->gnttab_size;
> 
>      res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
> -                                  ext_regions, add_ext_regions);
> +                                  add_ext_regions, ext_regions);
>      xfree(gnttab);
> 
>      return res;
> @@ -1235,7 +1382,7 @@ int __init make_hypervisor_node(struct domain *d,
> 
>          ext_regions->max_banks = NR_MEM_BANKS;
> 
> -        if ( is_domain_direct_mapped(d) )
> +        if ( domain_use_host_layout(d) )
>          {
>              if ( !is_iommu_enabled(d) )
>                  res = find_host_extended_regions(kinfo, ext_regions);
> @@ -2164,8 +2311,11 @@ static int __init construct_dom0(struct domain *d)
>      /* type must be set before allocate_memory */
>      d->arch.type = kinfo.type;
>  #endif
> -    allocate_memory_11(d, &kinfo);
>      find_gnttab_region(d, &kinfo);
This re-ordering should be mentioned in commit msg.

> +    if ( is_domain_direct_mapped(d) )
> +        allocate_memory_11(d, &kinfo);
> +    else
> +        allocate_memory(d, &kinfo);
> 
>      rc = process_shm_chosen(d, &kinfo);
>      if ( rc < 0 )
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index e712afbc7f..b0d646e173 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -11,6 +11,7 @@ bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>                               alloc_domheap_mem_cb cb, void *extra);
>  bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>                            paddr_t tot_size);
> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>  int construct_domain(struct domain *d, struct kernel_info *kinfo);
>  int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
>  int make_chosen_node(const struct kernel_info *kinfo);
> @@ -54,6 +55,9 @@ static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
>  int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
>  #endif
> 
> +typedef int (*add_free_regions_fn)(unsigned long s_gfn, unsigned long e_gfn,
> +                                   void *data);
Random code? Remove.

With the remarks addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


