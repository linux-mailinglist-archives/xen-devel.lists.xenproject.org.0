Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102D99DB5C9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 11:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845239.1260698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbr6-0007Bc-48; Thu, 28 Nov 2024 10:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845239.1260698; Thu, 28 Nov 2024 10:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbr6-00079J-0w; Thu, 28 Nov 2024 10:34:40 +0000
Received: by outflank-mailman (input) for mailman id 845239;
 Thu, 28 Nov 2024 10:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t80U=SX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tGbr4-00079D-6D
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 10:34:38 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2408::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59262b87-ad74-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 11:34:30 +0100 (CET)
Received: from BL1PR13CA0132.namprd13.prod.outlook.com (2603:10b6:208:2bb::17)
 by DS0PR12MB6584.namprd12.prod.outlook.com (2603:10b6:8:d0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.13; Thu, 28 Nov 2024 10:34:26 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::2c) by BL1PR13CA0132.outlook.office365.com
 (2603:10b6:208:2bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Thu,
 28 Nov 2024 10:34:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 10:34:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 04:34:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 04:34:24 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Nov 2024 04:34:23 -0600
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
X-Inumbo-ID: 59262b87-ad74-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwODo6NjJjIiwiaGVsbyI6Ik5BTTA0LUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU5MjYyYjg3LWFkNzQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzkwMDcwLjY3NzM5Miwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTjPt2rUrM/C5u2s8gAkihemoLcCJNwWvnJSnjKbMcxrumpsnhPjG6TrdPMa0b4WVCzMoHCDGrYFgMBccmr7uZAaaM4NXHs2YWqQdefYw4/HW2vHni8kjrx2+WhtZtqLaNKZl3lV1rwPmw0YrJxhVj39I3TXFEEuz+0Qb1M3vwJ+YCJKsFM+vkNEZpsOv7mIwjhg9r9B6vVivaMCz7QDYlsnipG3fqA9+Au/PWHBzAcgJmCFnDUiw2zCz82rLfMkOMDO41FV4so1PJ19Bl++7dmhVYzfANZxrl1mDHKMwxejZlK29/zx1nxyShj9ilurS7TN6z3+P6pIDsehBC9clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4uTMKKZDQIMTDXt7mwNzHaGLW79KZ9lepCeyf/549w=;
 b=kbqpacyUDKqjFBfBU6BnOz9aHeZWX5jl+luf5qfTKwQquKwLDmKNloODFLPExQEJIu4jn0tJsDcGqZ7hYOS9reEHsZdDozfUVAY0HDP88Br1QLnsgncOTLuPcWRE+F6rFrUrD0lIbWpzKVwFsuxdhv15NgKEW5uMQRQa/KGrl+BoxX7JaEo9J587UDLhebfJSepMXumbxR0VD4xAyfpRmNInMO7gzt+4WDo6Hr4TyX4EZTdtatIbncsKXsfEM8/AeB7LY/5MTEt4UIZ+E0sdjFwTrv91K0fsXUpzIvBXfX5TqaE7Awvbdmuai+R1yaHVAvRM+o2atAyy781Jd6TdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4uTMKKZDQIMTDXt7mwNzHaGLW79KZ9lepCeyf/549w=;
 b=iOthFavpBMdQbJi5U+McAMmhsvc/a7DhLgu8c9oWQ8UFPkrTBZJs7HdbtmpJvw8ukLDkaeQ2E6YnYsiAgsr44FY+DrPSp2bq80OOvpkbqHFLMrjyYM1gnUoHrmBjaaZdc38q4guvx0B9xq+Hys/ZgIzkj2Hrh+Tf9CPo8hW2Dq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <15ebc55c-62d0-4133-97cf-57f4c503aacb@amd.com>
Date: Thu, 28 Nov 2024 11:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-4-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241119141329.44221-4-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|DS0PR12MB6584:EE_
X-MS-Office365-Filtering-Correlation-Id: 27af0479-f647-43c3-fdc0-08dd0f983b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUV2RUdHeUl3VnRkVXF0dTJQV2dYMUZENXYxbEltbm9HRGpyYzhJbTVGb1lZ?=
 =?utf-8?B?UkdhRHFBQ1hCUnRXM0xFRktSREhBSUVUcUlHRTZLcXFRY1RCMzBMelVVUHJE?=
 =?utf-8?B?Wm9VYTQ0QkFEbDRkdWluanV4dWxqTUdhYXNEYWM2QXlwUzVLU1NHd1dWMmRp?=
 =?utf-8?B?R2I0WlpOYnRYVXRhN1RpcVI4SEFsbWUwSWFZZU9odFBCODFDWUNHOFFmWVl4?=
 =?utf-8?B?a2MxbnRmbWZQeXB5MWIwclRSYUkyay9sZ0VRRldnU1I4MHNNZUlXaUdmb3hv?=
 =?utf-8?B?blMrMmQxQWRESEpxV05RMWp1TEJTbW5BSTJ5cWFnUG9BMFI5eitDYjZLbVpq?=
 =?utf-8?B?ajN6eU9PVHh5TDlwbGdIV3hQV29HU2JMczJ6aU5QNDJnNmYrU2x6bzVkbjcy?=
 =?utf-8?B?UXRtOEdBNmx3QnhrMWk3M21FdUI0ck1SdFc3cFJ2ZDFDNTY5a2FnclVZTFFR?=
 =?utf-8?B?OW10UDhMc054dW5ucG12RlNhZEpwbjFyYmVNU3dHZFBGY2thdXYweTljVDVH?=
 =?utf-8?B?d1k5REs3VStlY1NLbGptM3h2RFA5Y0VKVTJIVms5VndoSE5HMUJGeWwwN2JZ?=
 =?utf-8?B?dnR0dGIxdytQbDFHOXpYaUJJS3crWWpHNjU2d1BKK01OdjJHKzFWendRTm9B?=
 =?utf-8?B?blVNR2NoOXVaS25UaFQ0ay91RkJXT0pINmE5SDR5U0FzcUNKTzc2MDlTVlcx?=
 =?utf-8?B?UVhwa093VXRyMUlBVS9FQWh0YU1nN0k3N2VZS080Z2VvRnUyZkJ6Zm1lUG15?=
 =?utf-8?B?KzBhcGFFNVVzZStUSlR1QW1uZVJWS3ZCTzRYVzRNankzYTZKdm00bFl3M0p5?=
 =?utf-8?B?QXp6MzRHYWVxS0tNZE5rSXppekRvQi9YQkw1MXFwNTVOWHl3THg1U29uNzBv?=
 =?utf-8?B?dXZCbEpSWHE0MjYwWjNXaHRZNWxpVG5WUE54WFcyZklyTDFzaThOS3pBeUc0?=
 =?utf-8?B?elVPTzN0a2ZNMEdCZW1HVVJQNitRNTlxZDlBNW5SL00vRzd1bm92Witkck1x?=
 =?utf-8?B?cE1xVUhuV2w0aUEzTVNBRzVsajhqQmtXTzY1dmlLbHp2ZzM1bEJNTVFyNC8w?=
 =?utf-8?B?VjkxbjZDT2FLYjhjajY3V09mSk1wNlNlTkM5ekFjcnlhU0FCU1BoUEZUeVRk?=
 =?utf-8?B?cnJSWlVVTU16UHVpRjNEZFZJQXpmVHJUcGxQTVd4YnB4dDI5SWs0ZDVzdE00?=
 =?utf-8?B?cUhlSzNCNzF4ODhkc0ZMSXY1Wm1iY0dOYzd6T3NBYUJYa0ZGSXFhd3hFbzQ1?=
 =?utf-8?B?QnZ6akxiZ1hTUkpNckNjSXE0YVlNZ2N3cTZrSFBWcGVKRGE3dy9HY0ZZa3Uv?=
 =?utf-8?B?djRMSUF1SGxjYkdOd1FmZUZiNXdIS01ZdGpaZXZueWJIK29Ob0ZUVGd1V3hw?=
 =?utf-8?B?S1p1Mjh6NnBETGN2UlpFQlpIRDFwRlR3c21HTmk3YWg0WlI0cWttRU1pWmlF?=
 =?utf-8?B?ZXlqb1Y4emg3MnJ0bzdnWEhOS2Q2em5kOWFIQldLWVd3SXhiL0krUHRtQU9V?=
 =?utf-8?B?empkUCtES0pkWW9EVU9xa1dFVVNoS0RvR0tuNUxRbkZOaFFieDcxcHNFTGZB?=
 =?utf-8?B?MENJc1FGSlZEeWNBMWxwVndqYjNqTzdEWUZXS1dEbWlyZE55c0dLdHU4TXJz?=
 =?utf-8?B?UGNPRjFxMWNQYVQwaUFrYTB3c2MrWVFVZHp5WTZYWmFqODk3Q2ZUK1lTaXMy?=
 =?utf-8?B?dzdYaCtkMjVFNVpOa0JUUGt1T0VEcFErV0p2cGN6bG9TOTJJc3AxTHJXOCtX?=
 =?utf-8?B?MkhaQnoyQUREeHFhV3BlWjlHbGdpLzhWUllkTDg3WXhISEY1SkF4TjcraDdH?=
 =?utf-8?B?ZkRSU1VYSXA0THpLN1hoYjd6Uy9RQTJlbnVXZjl5dHloWHdDa01UeFVOREZp?=
 =?utf-8?B?RWgxazlKU2xzZnVKU1EremFkSEdMQW5yMFRrU0RDVDNwVk5OYnMxNGpFNlhP?=
 =?utf-8?Q?9VyRPN1wnwKzc7vAUX/1EM40re7fiCIR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 10:34:25.5824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27af0479-f647-43c3-fdc0-08dd0f983b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6584



On 19/11/2024 15:13, Carlo Nonato wrote:
> 
> 
> Cache coloring requires Dom0 not to be direct-mapped because of its non
> contiguous mapping nature, so allocate_memory() is needed in this case.
> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
> moved allocate_memory() in dom0less_build.c. In order to use it
> in Dom0 construction bring it back to domain_build.c and declare it in
> domain_build.h.
> 
> Take the opportunity to adapt the implementation of allocate_memory() so
> that it uses the host layout when called on the hwdom, via
> find_unallocated_memory().
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
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
>  xen/arch/arm/dom0less-build.c           | 44 ------------
>  xen/arch/arm/domain_build.c             | 96 +++++++++++++++++++++++--
>  xen/arch/arm/include/asm/domain_build.h |  1 +
>  3 files changed, 93 insertions(+), 48 deletions(-)
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
> index 2c30792de8..a95376dcdc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -416,7 +416,6 @@ static void __init allocate_memory_11(struct domain *d,
>      }
>  }
> 
> -#ifdef CONFIG_DOM0LESS_BOOT
>  bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>                                      alloc_domheap_mem_cb cb, void *extra)
>  {
> @@ -508,7 +507,6 @@ bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> 
>      return true;
>  }
> -#endif
> 
>  /*
>   * When PCI passthrough is available we want to keep the
> @@ -1003,6 +1001,93 @@ out:
>      return res;
>  }
> 
> +void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
> +{
> +    struct membanks *mem = kernel_info_get_mem(kinfo);
> +    unsigned int i, nr_banks = 2;
Instead of hardcoding, shouldn't it be GUEST_RAM_BANKS?
Also, the second bank won't work with CONFIG_ARM_PA_BITS_32 which limits PA to 32bit.


> +    paddr_t bank_start, bank_size;
> +    struct membanks *hwdom_ext_regions = NULL;
AFAICT you search for free memory. Naming it as extended regions is not a good choice.
Instead, hwdom_free_mem?

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
> +        ASSERT(llc_coloring_enabled);
> +
> +        hwdom_ext_regions = xzalloc_flex_struct(struct membanks, bank,
> +                                                NR_MEM_BANKS);
> +        if ( !hwdom_ext_regions )
> +            goto fail;
empty line here please

> +        hwdom_ext_regions->max_banks = NR_MEM_BANKS;
> +
> +        if ( find_unallocated_memory(kinfo, hwdom_ext_regions) )
If you reuse find_unallocated_memory for a purpose other than extended regions, I think
the description of this function should change as well as comments inside.

Today, the function gets all RAM and exclude dom0 RAM (in your case is 0 at this point, reserved memory,
static shmem and gnttab (in your case is 0 at this point). I think we cannot get away without
making this function more generic. Maybe it should take as a parameter struct membanks * array?
Also, the callback add_ext_regions() may not be suited for all purposes (i.e. it takes only banks
> 64MB into account). I know that there will be more use cases for a function that will return the
free memory for domains. As an example, today, for direct mapped domains we hardcode the gnttab region
(only dom0 is special cased). This should not be like that. We would need to find a free memory region
to expose as gnttab.

> +            goto fail;
> +
> +        nr_banks = hwdom_ext_regions->nr_banks;
> +    }
> +
> +    for ( i = 0; kinfo->unassigned_mem > 0 && nr_banks > 0; i++, nr_banks-- )
> +    {
> +        if ( is_hardware_domain(d) )
> +        {
> +            bank_start = hwdom_ext_regions->bank[i].start;
> +            bank_size = hwdom_ext_regions->bank[i].size;
> +
> +            if ( bank_size < min_t(paddr_t, kinfo->unassigned_mem, MB(128)) )
I would expect some explanation.

> +                continue;
> +        }
> +        else
> +        {
> +            if ( i == 0 )
> +            {
> +                bank_start = GUEST_RAM0_BASE;
> +                bank_size = GUEST_RAM0_SIZE;
> +            }
> +            else if ( i == 1 )
> +            {
> +                bank_start = GUEST_RAM1_BASE;
> +                bank_size = GUEST_RAM1_SIZE;
> +            }
> +            else
> +                goto fail;
This could be simplified:
const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;

if ( i >= GUEST_RAM_BANKS )
    goto fail;

bank_start = bankbase[i];
bank_size = banksize[i];

This patch requires also opinion of other maintainers.

~Michal


