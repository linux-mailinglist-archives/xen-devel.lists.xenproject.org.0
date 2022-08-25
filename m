Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E645D5A1110
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 14:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393402.632333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCJS-0000Ts-M6; Thu, 25 Aug 2022 12:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393402.632333; Thu, 25 Aug 2022 12:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRCJS-0000Qx-Hz; Thu, 25 Aug 2022 12:50:22 +0000
Received: by outflank-mailman (input) for mailman id 393402;
 Thu, 25 Aug 2022 12:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRCJQ-0000Qr-UU
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 12:50:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 703ae2ec-2474-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 14:50:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6336.eurprd04.prod.outlook.com (2603:10a6:803:f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 12:50:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 12:50:16 +0000
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
X-Inumbo-ID: 703ae2ec-2474-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeG4ufI1MJuAiKqhK60mWctCCis9JRc8VIM1x2JmxyJDGgS2KKy3qVFM1bbvnE0PK+13Bliw4jg/VK/Gok1sGyT7s+TDudFMV/Q9cn9A58CbwgSnbKwJwtCEJp2hRAdfx5XT6gtQbvofgVlEByUnOhTeMg32pspKmAaqHuI+GdsobuJTerGh1LqZi6LMMl8ZOSY0mLcoO+IJ2AXd3hBuf63qeQZKzSAzQtfataNWC/EK34e4ow4erqaTQLPJHpZH0RNbocsM5lWc931v0c+KunWNhdbYkPnDaNni1fSprOYOZvRNTmNtMtwWv//eNOlBtxG4nl6WiB5dvuSBGMOPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfcUUSmjuBQL2clpKn7sZv66CIzJz2MxVSwK4vScXJs=;
 b=RT7PO3d6kLotsKU1yNiUP/O4y9maf47mhu+mkVFR45/BQOAagQR0fuDUfTLMDpDXt6Y33VLeaXLvLH/aAVJO2oh0TZsUdEJAPvvX7iMQBGCnbvK3D0ZWRZHsShXM/B4KshkIsIvwus08vsw08ERPjAGYcBBmzmku3IASutVcKDYrV+Y6ySl0SlN0vFOuF8F9htHenOP6a4e0K+1EjbeZlZtLB4Fp4eAkthJwLyEs17xBp0Pt1rf2niqwO4Esw2mt8DS+s2vGblzdYcoZIttFutJ+Q+X10KNR3P9MQBtvy0TkuecouS+WRzSQacDqd5kzALzm/g18PNQWqW0Lw7SVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfcUUSmjuBQL2clpKn7sZv66CIzJz2MxVSwK4vScXJs=;
 b=r5Tf1R4dMp3CmCsIiF0uXeK72H3sbiqCviLMQJX5BPGae8eoMDRR/myHkX6M5c556yUsu9gvQfdA0uYW4XT2/80yUdlRoWReeZHmF25iP4qNZKA/4NYjkIuc15tq2nNvSpVTr0+LEfqw0bZCyikIBNoMjYiw702ugZLV2+BZdiOnPYCBjFFjPA6l1eZ98RgUjmREj34P/TSMiqCf4EYQWgzAU4bwCpA3NGX9lKqIhKRB5mrMUb6vhFJlnNcOeDev144K9DmVSm2QAIvDh3o1EwV0zX/s9uOuNpZG8qd/w3kZwQjeFlQWcaHXRRN6A2M5wHzIniR15dh3xJzo3p49jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <67d9e7bf-8e0c-9290-5ac5-30d8cd8b9177@suse.com>
Date: Thu, 25 Aug 2022 14:50:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220822025810.2240707-1-wei.chen@arm.com>
 <20220822025810.2240707-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220822025810.2240707-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 281510cc-58d1-43e4-3e3f-08da86985bd0
X-MS-TrafficTypeDiagnostic: VI1PR04MB6336:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iNXcsH1Vqryt7nckcc3YL2FpIrFV3CLR/3O3XaICPjPq52s3qHtPf2vj8KgfQwWpEoImg/KXXAB0vnr7VDgyaJu8gpAv3PHDfxT4fxZyP6JD5BXx8TsrSfynI7Tdcp/WEdezRDG3RULRoykKibX3pLXIwmftwh2Xr5XwsYcw7Ai1Gy1zUI/viMtWU8S6I2TPT1PN22VsjceDfAkPbpcmjrOskFYzWWvTzbURUHNAOvnOCldTyIp/qzydr19YZmM//7T4TWDeU0jloWWMD6NUL3miyIPaMP0Nz1A7KakzXwIDi21rI9C80leSIztB8svWk8B/7M648xgQSQyCrhqm6dQLSL+wtfAHbivk9sW68xjE3omi6StU7XdMghebqLXIQS8//aZP+KX4zOsWcn7rdiAZGdTLZ9vfm/gTNqla/N8y8eX0fr7jT7DolGpRLI1tn05YTJbLWFiyR+FNcZFQkCmIXvvERtvq6pSPyn88J2mxPbsLysBCGDUnDB23w2dKWjQmnfRLcghclYLkGgvgbbWdkxS7J0M4sDtkk4Z7X9Z9u5sgdO7IuMRkSJu5HK9UlMTUPrQW4aml9AE03iMAoElO1gANBeMnhwykcnRSlU67TR7Nfivi3g1unaXJBS+g72dBvauzwhm3YmLNcFnunlxE8WFSp42GJoXNsVJpEZczdfaUbCXA9LxpfnaVvYR0oCkTW+p+r4SmHtaSZEjoIgpH9fU+JAKHwwuB75WGm/CbjVYpOt4xxNBYlNv7PHNR4WCVILcp+ZbY8atBf9uHmBK4tlt3dmnRQw+zhL+07jk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(396003)(366004)(316002)(66946007)(31696002)(8676002)(66556008)(86362001)(4326008)(26005)(38100700002)(66476007)(2906002)(6506007)(53546011)(6512007)(31686004)(83380400001)(186003)(6486002)(478600001)(36756003)(6916009)(5660300002)(2616005)(54906003)(8936002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckdOT25wVUd2V0RJV3U1c3VQT0NPOEZOczFvYWs3MjBMZUl2Q2dadUVNWHV6?=
 =?utf-8?B?bm1aOWRUQlBUNGdUaFRvUGNYRUF6aXFjSlp6N2thbkZKd2dHczhHaFNKOFFz?=
 =?utf-8?B?a3hicnBQZUhoRkFCc1N6bTdSNjdzSXpwQ3RKZ1UydERJQmdiWDdpbUNjTU10?=
 =?utf-8?B?dmJlbVhtKys0Sk9yRy9kM1pNaFZQajhMeFh0RGltUHBrWkdzQTRGYmFWMHB4?=
 =?utf-8?B?MCtXYmYvVGdHWlhnVFY1OFhZSmIwNFp4MjVySmluRVRuN0g5NXVpcjJ5WFJF?=
 =?utf-8?B?NHNDWFUrTXl4SXFvNjA5QUg2b3dtbDZOZjQzRXlmcFJuSC9xRWpkNTlvRkp5?=
 =?utf-8?B?S3VmQmZmNE0wM09uSklmZ2RLM2tiL05zeCtlY2FtbC8wNjcrclgwOG9BbEVQ?=
 =?utf-8?B?dGV4TDBPK1Baem16MnF6WWRGSjBXc05GZ2x3d3V5ek5rbDIrQlFNeENGSE1k?=
 =?utf-8?B?VmlmdnFXWldiaHp1UWhBWTU4WXRiUk54eTgxbW8vMkVpdDJUcU91WVBOdmtR?=
 =?utf-8?B?dlhNeUJsNW03ay81M1dZVVNTbWk3bEhHeDUydHFLNXd2azI5b3VJanVKcUE1?=
 =?utf-8?B?ZXZGVU53ZWVLRXV2azdmZ0xBQXRVaVF4TnhQSXhnaEZkaTZZTmY2ekdyVlk3?=
 =?utf-8?B?SlFLeU1CZi94eCtaTWdnV1hvQ1RKNEtVMTBHVURyNis3SGhnUkNuOGxwNS8z?=
 =?utf-8?B?bFRGWmZub3NjTWlGSTVjV0ZKZ2toSCtmazJaT2JZcE1GL2hkVGUwYnZ2OXFS?=
 =?utf-8?B?Z0Qvd0hhbEd2RG1zUnlBUUFSbGo5eDlVeHkxUUZZT1ZNaGFZZzNGOVlPYndj?=
 =?utf-8?B?SEVxOGt3aEpIdUZ2WEhwNXRrYk1iWkFVSCtiVzJjMWh5ei9RcytEMUdmbHY4?=
 =?utf-8?B?L2RUNitlTlFWQWd2Qk1EeER5Rm83WDlEQ3lRQ3AyQmpJYXdwcm53NlArTE4w?=
 =?utf-8?B?NjhjMmFzODd0UlNkQkFUdFplQ0pHeDZXREo5cmhsWGlPTXpVSCtVVHd4SldW?=
 =?utf-8?B?d1psbWNsdjJrUkZ6WE5UeENQaTI5R1kzM3hCZGJGVkQycUx4bi9DSldubnBH?=
 =?utf-8?B?LzdYZG0zT2JpdUZVVFZuNGJJMm9ISUJaL2pVVjIwWlRpcHhNeXl4eTZGbjQ4?=
 =?utf-8?B?VXNxeUpUMlFoRCtHNFBsbWJ2T2FDNk9VNWk2UzYvSy9SZUcrN1VpUzRoV29E?=
 =?utf-8?B?YXNlTUJsdy82d1AzRGQ0MHJWR1AraVZKZXBET0Z5NVU5YW1PL0xmRDVKemZH?=
 =?utf-8?B?NmRVcFQ4MmhSam9KeVhQOFVEVVBiOWhMdU9BRS9HcG0zWHphUU9aREZ5b0tr?=
 =?utf-8?B?b2J6NWNyMkFONHM4SEpRbDJOZHVOdDRkMFBzVGFIMlE5ZHN1Ti9uNlV1YzBC?=
 =?utf-8?B?VGxWdXpNRXJabGFWczYrSHJpZ2dvZnhGUnJRSnhLRzI2WlJLZDVFQ09OSkl0?=
 =?utf-8?B?Ymc0UDJlMEdqbW5vdzdpazZRUHpCUUlVb2tla2ZTclgyVGo1d1k5SkE4ZWV3?=
 =?utf-8?B?Tm1uZlhFYjB4c3ZYVXhpN29KWjRGalUyN3E4elBydUNVNXp2cTNkUG9zMmUw?=
 =?utf-8?B?MU5CM21sM1JnZ2c3SkhqVXRkWnB6SzNQa2R3dExyS1RkY1g3UEdOUExtTjBQ?=
 =?utf-8?B?VjZjTU1xcFBLVDB3b1lVWlBVTFdCcms0dk5YSjYwd21CMEttUDIxc2xlS2hF?=
 =?utf-8?B?K1d1WHJ0TWdVeGlVaTIzcEJVd3J4T1c4bGZFMGFHWmh6S3JTd0VFSFRCV3My?=
 =?utf-8?B?LzRBL01DTEIrRFNZbUdxV1ptSGNTKy9WVmlZaFQ2bGNwTm5xMkR0OE9WSnR6?=
 =?utf-8?B?bHloRUdYUWI1QVpmUVBQdzJaN0toWEo2OGdOOXFUNWQ0RUhaSDUwNEszL0Ry?=
 =?utf-8?B?UXc1bng5ZVFCSDRGVGFzOHJDVnJKYWVlMXhNbFEwL2FJYmNFeEg3bGgwNWxM?=
 =?utf-8?B?ejFpOFJyNi85UEJDUTFOT3AzRi9wY2xZRVc2ZWk0ZmlhRjc1Q1VzOE4xTjdX?=
 =?utf-8?B?U3pYTmhKVm1leVJSclB6RFNmSzVRdk9CMkdjc3BNYzQwYkxhN3VEUW05eWxF?=
 =?utf-8?B?NzFDVzFoZnNEa0tidXBtMDJqUjRWQUVIdTBjaVhZeWE5bi9rVGNzYnVmY3Vp?=
 =?utf-8?Q?x6M5spuSWfLSeYmQo66+vgfu2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281510cc-58d1-43e4-3e3f-08da86985bd0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:50:16.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL+VTGMJCl436rbAA7bem/pW2JrB08IFGy3D3bDSXDMlfCdSnQOCc4xOOAuqLtp6poCPgGRK7XhpJcPfPyujIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6336

On 22.08.2022 04:58, Wei Chen wrote:
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -13,6 +13,21 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  
> +static nodemask_t __initdata processor_nodes_parsed;
> +static nodemask_t __initdata memory_nodes_parsed;
> +static struct node __initdata nodes[MAX_NUMNODES];
> +
> +static int __ro_after_init num_node_memblks;

unsigned int?

> @@ -36,6 +51,308 @@ bool numa_disabled(void)
>      return numa_off || arch_numa_disabled(false);
>  }
>  
> +void __init numa_set_processor_nodes_parsed(nodeid_t node)
> +{
> +    node_set(node, processor_nodes_parsed);
> +}
> +
> +unsigned int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)

bool (and then true/false below)?

> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < num_node_memblks; i++ )
> +    {
> +        struct node *nd = &node_memblk_range[i];

const?

> +        if ( nd->start <= start && nd->end >= end &&
> +             memblk_nodeid[i] == node )
> +            return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static
> +enum conflicts __init conflicting_memblks(nodeid_t nid, paddr_t start,

May I ask that you re-flow this to either

static enum conflicts __init
conflicting_memblks(nodeid_t nid, paddr_t start,

or

static enum conflicts __init conflicting_memblks(
    nodeid_t nid, paddr_t start,

?

> +                                          paddr_t end, paddr_t nd_start,
> +                                          paddr_t nd_end, unsigned int *mblkid)
> +{
> +    unsigned int i;
> +
> +    /*
> +     * Scan all recorded nodes' memory blocks to check conflicts:
> +     * Overlap or interleave.
> +     */
> +    for ( i = 0; i < num_node_memblks; i++ )
> +    {
> +        struct node *nd = &node_memblk_range[i];

const?

> +bool __init numa_memblks_available(void)
> +{
> +    return num_node_memblks < NR_NODE_MEMBLKS;
> +}

This is kind of clumsy, but I have no better suggestion.

> +/*
> + * This function will be called by NUMA memory affinity initialization to
> + * update NUMA node's memory range. In this function, we assume all memory
> + * regions belonging to a single node are in one chunk. Holes (or MMIO
> + * ranges) between them will be included in the node.
> + *
> + * So in numa_update_node_memblks, if there are multiple banks for each
> + * node, start and end are stretched to cover the holes between them, and
> + * it works as long as memory banks of different NUMA nodes don't interleave.
> + */
> +int __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,

The function only ever returns 0 or -EINVAL - please consider switching
to "bool" return type.

> +                                    paddr_t start, paddr_t size,
> +                                    const char *prefix,
> +                                    bool hotplug)
> +{
> +    unsigned int i;
> +    paddr_t end = start + size;
> +    paddr_t nd_start = start;
> +    paddr_t nd_end = end;
> +    struct node *nd = &nodes[node];
> +
> +    /*
> +     * For the node that already has some memory blocks, we will
> +     * expand the node memory range temporarily to check memory
> +     * interleaves with other nodes. We will not use this node
> +     * temp memory range to check overlaps, because it will mask
> +     * the overlaps in same node.
> +     *
> +     * Node with 0 bytes memory doesn't need this expandsion.
> +     */
> +    if ( nd->start != nd->end )
> +    {
> +        if ( nd_start > nd->start )
> +            nd_start = nd->start;
> +
> +        if ( nd_end < nd->end )
> +            nd_end = nd->end;
> +    }
> +
> +    /* It is fine to add this area to the nodes data it will be used later*/

Please adjust style here.

> +    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
> +    {
> +    case OVERLAP:
> +        if ( memblk_nodeid[i] == node )
> +        {
> +            bool mismatch = !(hotplug) != !test_bit(i, memblk_hotplug);
> +
> +            printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
> +                   mismatch ? KERN_ERR : KERN_WARNING, prefix,
> +                   arch_nid, start, end - 1,
> +                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +            if ( mismatch )
> +                return -EINVAL;
> +            break;
> +        }
> +
> +        printk(KERN_ERR
> +               "NUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with %s %u [%"PRIpaddr", %"PRIpaddr"]\n",
> +               prefix, arch_nid, start, end - 1, prefix,
> +               numa_node_to_arch_nid(memblk_nodeid[i]),
> +               node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +        return -EINVAL;
> +
> +
> +    case INTERLEAVE:
> +        printk(KERN_ERR
> +               "NUMA： %s %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with %s %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
> +               prefix, arch_nid, nd_start, nd_end - 1,
> +               prefix, numa_node_to_arch_nid(memblk_nodeid[i]),
> +               node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +        return -EINVAL;
> +
> +    case NO_CONFLICT:
> +        break;
> +    }
> +
> +    if ( !hotplug )
> +    {
> +        node_set(node, memory_nodes_parsed);
> +        nd->start = nd_start;
> +        nd->end = nd_end;
> +    }
> +
> +    if ( strcasecmp("Node", prefix) )
> +        printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
> +               node, prefix, arch_nid, start, end - 1,
> +               hotplug ? " (hotplug)" : "");
> +    else
> +        printk(KERN_INFO "NUMA: Node %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
> +               node, start, end - 1, hotplug ? " (hotplug)" : "");

Hmm, if I'm not mistaken one of the two printk()s and hence also one of
the two format strings will be dead code / data on every archiecture.
I wonder if we don't want to have a HAS_NUMA_FW_NODE_ID (name subject
to improvment) Kconfig setting to avoid such. I could imagine this to
become relevant also in other code.

> +static int __init numa_scan_nodes(paddr_t start, paddr_t end)

This function returns only 0 or -1, i.e. is even more of a candidate
for having "bool" return type than numa_update_node_memblks().

> +{
> +    unsigned int i;
> +    nodemask_t all_nodes_parsed;
> +
> +    /* First clean up the node list */
> +    for ( i = 0; i < MAX_NUMNODES; i++ )
> +        cutoff_node(i, start, end);
> +
> +    /* When numa is on with good firmware, we can do numa scan nodes. */
> +    if ( arch_numa_disabled(true) )
> +        return -1;
> +
> +    if ( !nodes_cover_memory() )
> +    {
> +        numa_fw_bad();
> +        return -1;
> +    }
> +
> +    memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
> +                                       memblk_nodeid);
> +
> +    if ( memnode_shift < 0 )
> +    {
> +        printk(KERN_ERR
> +               "NUMA: No NUMA node hash function found. Contact maintainer\n");
> +        numa_fw_bad();
> +        return -1;
> +    }
> +
> +    nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
> +
> +    /* Finally register nodes */
> +    for_each_node_mask( i, all_nodes_parsed )
> +    {
> +        paddr_t size = nodes[i].end - nodes[i].start;
> +
> +        if ( size == 0 )
> +            printk(KERN_INFO "NUMA: node %u has no memory\n", i);
> +
> +        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
> +    }

May I suggest to eliminate "size" at this occasion, for being used
only once and rather not helping readability (imo at least)?

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -58,6 +58,8 @@
>  #include <xen/perfc.h>
>  #include <public/memory.h>
>  
> +extern paddr_t mem_hotplug;
> +
>  struct page_info;
>  
>  void put_page(struct page_info *);

I'm sorry, but I guess this may go about anywhere in the file, but not
right at the top. I would probably have put it ahead of npfec_kind_t
or right after dom_cow.

Jan

