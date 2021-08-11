Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1435E3E8EE2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165877.303088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlg9-00036A-Vy; Wed, 11 Aug 2021 10:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165877.303088; Wed, 11 Aug 2021 10:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlg9-00033C-SR; Wed, 11 Aug 2021 10:41:45 +0000
Received: by outflank-mailman (input) for mailman id 165877;
 Wed, 11 Aug 2021 10:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDlg9-000332-0T
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:41:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a154665a-e8ef-41c5-81d0-038b09e05cf0;
 Wed, 11 Aug 2021 10:41:43 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-0RDScDAMPpCHxMA6PrpD_w-1;
 Wed, 11 Aug 2021 12:41:41 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:41:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 10:41:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR04CA0129.eurprd04.prod.outlook.com (2603:10a6:207::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:41:39 +0000
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
X-Inumbo-ID: a154665a-e8ef-41c5-81d0-038b09e05cf0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628678502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oliIBlwtB5aSHfkxuKeSahdgjtCPfzBcf70SieP4HRw=;
	b=CfL3Hm5OHnhA7NLgoDnYaB3Z6xHMFAtKkbQEEpGK1++AskLBYvAhBz+vuC1zx/vnqXYuNb
	afWRDCbD5IgtfBW8zxeT3NkALJNpJ1VSyK+RNgN85/7BpGBpEwjyUpBc9j5cqwma+TTsQ0
	k00C31zae6lo2lnD8C20G4u6mha3r5c=
X-MC-Unique: 0RDScDAMPpCHxMA6PrpD_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xu4M+kL48g/LDF6Nas6K/1y95FdDvocOyx1b48sZO373rMxWnmvOHsrtwmFVoUuHho2+GZB1Y8UBBgD31zINmziQV6TAFxRJMmdoJNeOYneaDOeXiiCE0qgbIQzXm5TUk0O9YAlrDw4LLO+bZ/HlxjV+ZunSMhiOdiJBytUXjI4JytQXdcuVXaGkmhiepX80u4jOwnY4+oMthnWDi/pl33tOf/0hB2R6feKZ1tVh4um3ylA+Un3rZCrpiGtcXZoAy4nNNKzgsKE0clXtC6ld7JNaATDC8DgGObJ9bH/Nj6vrX3cuN7P8xHDYQ+mCTwp1G9GW0FrRMB3NM5ZWSOzeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oliIBlwtB5aSHfkxuKeSahdgjtCPfzBcf70SieP4HRw=;
 b=D410f8x4pdGVeKB5eYcj2yAKD0/rZMYm6FTbBPSXQgCplnPIl862dk3BZ6ZR8H3cyM7A2Gr4YvwOo8GOuGJXrh2qqwGs48fsbjgkXCad9NDVMLpSJqk+Vfpen8XYbrTNK3ABy+CIZArhbzcs/mO1TSTcNdUhwW4tW0GchLmQExImcHKWHujyXUbGbw7/1ld1neAgLCLA0hwmnirCd8be0DTBOMyfPUwsi3wT/1daBaW56LP5KJ52N6gipaAnQ3X+IvL2PshYJ8zqRohRmybZc3FkMA72aN0bYVE0kgR4o+SwjXYoi2Np/CdYCqQKrvn2L3Zutjw9MU3E3x1M/xwGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN RFC PATCH 00/40] Add device tree based NUMA support to Arm64
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, sstabellini@kernel.org, julien@xen.org,
 xen-devel@lists.xenproject.org
References: <20210811102423.28908-1-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb62f56a-6023-58df-99ed-a4588c4d80b9@suse.com>
Date: Wed, 11 Aug 2021 12:41:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR04CA0129.eurprd04.prod.outlook.com (2603:10a6:207::13)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c96bd626-5bb1-449a-6ee9-08d95cb499d3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6863A2C2D2943290B7CCA94BB3F89@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VHonVPF8ATvlQVUK5ZM1GU8DfGCgxXY1h43lOaZvGHGvaZxV4SAF1r6+VPDXbqDfEjMPaKs2PABCAcLxiGU+qflLV4MYMJW+LLsdQZrw8xyWkxBnGzFACem7kF8u1aZsyMj64SpKp22kA3bq+T6qRJ7TygPXbInCNoiCItp8/JgA9joZ2ty3vtWuYSrIi7+dZqa3PM6lsYvEP38jOurV4X/rAROqV4g2aS+oHDk9ZO1sWh+gBh/kSXM7N3F2COSioAKk6u+Oep76B2hfeNfBNQXhYQ98SzwKVM4lB56Tq6hjg12JAmt3YI5NYhHVyVtHdOb9lf35DuP1ABXMcu0p/iHjBl7cjeCUIw5wmrJ4ep7HNt2favHkc6q92TbVetDiO2Mq28saRKmJ3ppReBRKG0AufGukjkA3yqJTTcAfy3x3yfnUnOG8Yay1s8quS69ysBkdJs+vdhA81cSP/Jtm7B8ffyOW57LGWthBOrW+qEd3sQYWlWi+xci0piynqssy7S0WVxKTVnZ8NXmeQOJGSipHUQ8CsFaCsua2gWQpHqD9Eq71h1GZV4BFwbfNF3XxK/67MF0bAEFzzyv2tYqi5Gzw+n6yVwi0dwy/It5LcHV69V19ZKsZxkMunKGw70rcwU9or40c9KxwYpu+bBF2QI7Ej14/TG9E9geHTD4NWNi2IUIXVtKd6k+TxZBYnguiGBrF3mj2rXfweY9KSpDcB9okr5BysktzjOWMQvUq+b4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(39860400002)(136003)(396003)(6916009)(4326008)(53546011)(8936002)(6486002)(86362001)(31686004)(5660300002)(31696002)(6666004)(8676002)(2906002)(36756003)(83380400001)(16576012)(316002)(478600001)(26005)(186003)(38100700002)(66946007)(66556008)(66476007)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1B1cmtRQVFRRE5yS3VBZ0J0cmZ6Si8za3QxbzVVVUZFMTZpVGZkODRvMEp6?=
 =?utf-8?B?ak9MYWZnSHdjcUhDYlNoTzF1OHJsOEFRWWxoTTFJNlR5UXBXOXhHUk5BVldV?=
 =?utf-8?B?QlVORGVEVStlcDhRRW9pU0VJcGNKY2RLNExtNnZ2WkoxNXhCb0lTRngxeXc1?=
 =?utf-8?B?Tm1YR0dLZjRBOFlGUDVwOXZ0OU1ndVBhek9MY0lsQVorclY1SE11aG1hUEFs?=
 =?utf-8?B?amtBQlVDZWxpaDczV3gwMGVyVEhHZWtoWWlJSDFKdjIwRXV1cDBDdHZIa2xj?=
 =?utf-8?B?RWZBN1ZER1FxQU5WaEhHZFNBZXdXY0F1ZFhKRm9haFdINTUrU0VLOStlVkFM?=
 =?utf-8?B?TjQwSUVCaVlLK0p4cExhaWx3U3hQS2RIY1lOZzlZWDVoaDVaUXMzd01oWkxI?=
 =?utf-8?B?dHVaU2FHSEVGaTZ5VFhIZGJRdXJtNzVSZnlTd3pNb0szTjZMK245TlBNd1Ny?=
 =?utf-8?B?WEZDMDhhYUZwcWNTTGV0cVl1U2xVZTl1a1IzRXgrWEo1TlUybUlIcjFPelQv?=
 =?utf-8?B?RjRsakxhNVZJbFZMV2lPTUF2eStTeFhITURvQUJ5SVFvb2lXMWU1Z1Z4UkQr?=
 =?utf-8?B?alJuMVl3YzRjODlpZ1pmaGhJT3M1YUVtWEp1VjR4YUxOeThqbW1rUmVKWkpX?=
 =?utf-8?B?VEFZN1BCSWRzR3VJYXBqc1NnZks4V0JyN1FCZm5NYzRMV3NFQ1pTRlRyZXlt?=
 =?utf-8?B?VXVLVFc1RVN4bm1VL3V0YkZMaXQwT3doS2l5V0NwVitac0tGdGlTY2k3K1NQ?=
 =?utf-8?B?aTA3b3FDejFjNnMzaEE4TTVlVU4wamhjYWZxMm4rbUxoYmk5aUJTeEEwZHFt?=
 =?utf-8?B?VEM4ZmNpRWsyUkU2VEpIZ0gxRG9Gc0M5YUlNTTg2YVpyQ0pGZnpCcFFvRkF4?=
 =?utf-8?B?SXBaK2ZYWGMzN29RQ3RkMEJEa2hqSStRc2VCK01abkoxZi94QjF6TDg3Yjc2?=
 =?utf-8?B?Zll1R00xOW5NNFVobGRRT1RUcTFLM1hJM3MyV0ZnZGNjZHVMeXlwbEgrVWRW?=
 =?utf-8?B?UjZqVVdLQ2U5TUlubVBCTi9lYjZUeGJ0eEE5U2lnRmI0Nm9lV3Bwdm5ER1RP?=
 =?utf-8?B?bGsvNXgzOHg2QlhwVWZ3a0JRd2EreDB4NDBPVkhPOEdVcnUwWmVOMmxUUGxh?=
 =?utf-8?B?Q01hSVEzaXREd3NXRHRzbHVIeXRqUU5Cd3VXTys0ZTNxMDZwOVhFaVFXcnM2?=
 =?utf-8?B?RjFKUWYvVGJtMTZzdmhHVXp5cHM5T254VXdvNkdpa0dsS1ZuTUlGSXBlK1RP?=
 =?utf-8?B?bkJya0pRdStQdUpudTZFMnViQ2hkbkg0WVdNLzBvcndNUWlzMkl6dThvcU1q?=
 =?utf-8?B?NU5YR1Zsa25DRTBocDM0NnRiVzdpVGZ3cVIrejU4SXJzZmhjL1pzZFlONm1N?=
 =?utf-8?B?bkNwd2Z6dlVMcUZjM1AzR2ptM01oMmt2dXRPWHVqOXFTYUJKM1BMaHNwVWhM?=
 =?utf-8?B?K0ZvdCtjeHFoVFpCVkhNYVc5clNxdkxvYjVNNEducTBzUU5nSzRTU2YwRTBs?=
 =?utf-8?B?NEJRdkhsYzZreEV3U3VqV0kxcHFlaHkxY3ZiYzhyb3AzYnpRV0pGMnVCdXVW?=
 =?utf-8?B?UC84dnQrY3QxNk9KemhMd082UTc1amtoOFF1b1VONVNxMkZxY0grK2JYR0dR?=
 =?utf-8?B?V1FNYnlCWEF1bjFmeTZyTVI1UG1pSmZhVEVtenk3M2MvMnMrejlnODlDVHRm?=
 =?utf-8?B?bUJPenI5SDZiSzljVUlaa3dIMkpTNDRUNStjbTZUWENPbUlEOUhNeEltU1Nl?=
 =?utf-8?Q?emkp7sSi878fX8c8WUEU5NZp7hr40hJ2CLHbc7m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c96bd626-5bb1-449a-6ee9-08d95cb499d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:41:39.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqTvgtoRPfp+gokAl5DoRRE8xfJuSG6B8oOsA3REnpqT8Y/2Vq1s26C70DpglAsOQpMafCrPE85uyAWgcIFXnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 11.08.2021 12:23, Wei Chen wrote:
> Hongda Deng (2):
>   xen/arm: return default DMA bit width when platform is not set
>   xen/arm: Fix lowmem_bitsize when arch_get_dma_bitsize return 0
> 
> Wei Chen (38):
>   tools: Fix -Werror=maybe-uninitialized for xlu_pci_parse_bdf
>   xen/arm: Print a 64-bit number in hex from early uart
>   xen/x86: Initialize memnodemapsize while faking NUMA node
>   xen: decouple NUMA from ACPI in Kconfig
>   xen/arm: use !CONFIG_NUMA to keep fake NUMA API
>   xen/x86: Move NUMA memory node map functions to common
>   xen/x86: Move numa_add_cpu_node to common
>   xen/x86: Move NR_NODE_MEMBLKS macro to common
>   xen/x86: Move NUMA nodes and memory block ranges to common
>   xen/x86: Move numa_initmem_init to common
>   xen/arm: introduce numa_set_node for Arm
>   xen/arm: set NUMA nodes max number to 64 by default
>   xen/x86: move NUMA API from x86 header to common header
>   xen/arm: Create a fake NUMA node to use common code
>   xen/arm: Introduce DEVICE_TREE_NUMA Kconfig for arm64
>   xen/arm: Keep memory nodes in dtb for NUMA when boot from EFI
>   xen: fdt: Introduce a helper to check fdt node type
>   xen/arm: implement node distance helpers for Arm64
>   xen/arm: introduce device_tree_numa as a switch for device tree NUMA
>   xen/arm: introduce a helper to parse device tree processor node
>   xen/arm: introduce a helper to parse device tree memory node
>   xen/arm: introduce a helper to parse device tree NUMA distance map
>   xen/arm: unified entry to parse all NUMA data from device tree
>   xen/arm: Add boot and secondary CPU to NUMA system
>   xen/arm: build CPU NUMA node map while creating cpu_logical_map
>   xen/x86: decouple nodes_cover_memory with E820 map
>   xen/arm: implement Arm arch helpers Arm to get memory map info
>   xen: move NUMA memory and CPU parsed nodemasks to common
>   xen/x86: move nodes_cover_memory to common
>   xen/x86: make acpi_scan_nodes to be neutral
>   xen: export bad_srat and srat_disabled to extern
>   xen: move numa_scan_nodes from x86 to common
>   xen: enable numa_scan_nodes for device tree based NUMA
>   xen/arm: keep guest still be NUMA unware
>   xen: introduce an arch helper to do NUMA init failed fallback
>   xen/arm: enable device tree based NUMA in system init
>   xen/x86: move numa_setup to common to support NUMA switch in command
>     line
>   xen/x86: move dump_numa info hotkey to common

May I please ask that you follow patch submission guidelines, in that
you send patches To: the list and Cc: relevant people. Furthermore I
doubt that I need to be on Cc: for all 40 of the patches.

Thanks and regards,
Jan


