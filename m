Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D380F582793
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 15:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376202.608816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgzQ-0006U7-7a; Wed, 27 Jul 2022 13:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376202.608816; Wed, 27 Jul 2022 13:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgzQ-0006Qg-47; Wed, 27 Jul 2022 13:22:16 +0000
Received: by outflank-mailman (input) for mailman id 376202;
 Wed, 27 Jul 2022 13:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGgzP-0006Qa-2r
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 13:22:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20130af4-0daf-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 15:22:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 13:22:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 13:22:10 +0000
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
X-Inumbo-ID: 20130af4-0daf-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4tjM0nVtB8NfrraIpCZSsHIpn5YLuoT9YU+B21UYBJMT6+wcP0K3iRhAvpDb4mXX/QnBFEip2d1cdR8MWlGBHpJRHrogBgb7s9U62aV5JDdts+UJDx52jdayiItazw4f9kekO7ADtIKeUyfSEMChHE6hM006Eix8vVhqSHtNvHdcbRhY4Qvjy2ZS6vrjaKlV3RycnLXUcoScpZK9p2kp/wsKcS5Ghv8iaK+C8iiCGbkQwAqc7k2kubVYHeWZGpmpxnuhrd7uJRkD5CrFu/jrB1VNlFCY8JvWt6jSPr7oVjETGaXUY8mxkQEQgSWSL5KvVTliLyRXxoZpu2bBBxfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz1Pzwt+NpeMuxYKJIKtLCQNN3fyW25kuPYevPazw7U=;
 b=kO1XAAhsmrzQUKDvr8TFFGe32N5jFVPYaLuCIRnAcMm2w/YtdkcF2J2TQEIURN0hT4INn0msxBPfXC8Jl9muk0dwd/5v8DfI73ly+DA0NKVGgttMBPO4/SvksceYr6lGP0VaLQ/4VeRmrLrTiT0kYeFHPnQLOYV5VXoyzow3BYcXi9u/Z/yfUsel3r0/REl5YWbFkUdKSTPr4fJT0dlcOOpXHYwQ/2DxmiAKJlVpznqgjbGR6oSfNvFsLsSlW20jBWVV/DZYD47ZoyJwpRWjNBBwrjh2kMIZ4voW4BhdVq/lZN5OBct1w6PqlY6mxkqELPQ5yURSZRBt/ySJRdDmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz1Pzwt+NpeMuxYKJIKtLCQNN3fyW25kuPYevPazw7U=;
 b=NEV0CdzrQngAGW1howjY814ACi8RvMlZzh4hFpjQGQNLHvn2c2IyY5xn1e5/ePLTGjZkRwlGoayoHmfrxSJ4dkhXPukTou5qdLlfhytbo6rv4cPPwVjHe+7CNJJq6BuU6S4d2ph68h9St2YdtpPhO+95c+uwanfy5N/185z5DqCXeMT8P4XKUI6aV8IDODO/gniBgm8xpsir24a70wEaAPHDE8j+gGIFcdy0JP+aZOyV31OThuJbrJQCTUnn721sB4nD9/I87iwr2iaRI2vEFzP31arXEC7+bsPQTsrNa62E9eUaCAqg3lPUK2PAJfXXxvnUwsupOo8TcXcAvRKc2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0832fa09-8b1e-86e8-1291-fd071fe44575@suse.com>
Date: Wed, 27 Jul 2022 15:22:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 15/18] x86: rework domain page allocation
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-16-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220706210454.30096-16-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0101CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::44) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6205476-cb5f-44b0-9247-08da6fd302b1
X-MS-TrafficTypeDiagnostic: AS8PR04MB7830:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	skoV3PxZ3mle/naNucgVHSlfswfa+/k/Ww+bNS39a3pbYMiHtKAwmcpQjDhzVXlOVy5kbbgAVq+iDo6h74bTrcZ9Xy8w1FqGh9Bu1DF3aupvwORM8lKAVsjEPF24Lna2xxPf1uZO7oXiKrofYeQ9EfCQy5nm0P83UoZC96V2o2AcvGA9zi8HuIY2OHwlH4XQtRYpH2RwcPNLpuDmHJM6cvZ4gVrsU+nkeFKExekkUQb2CWhGyEvvhf1cIxu8XPLJryKaiVbG0MRdi4UcJnVtWKAs9O3qoMeEeUsEWJudwVb+j7qk+kU/V/Bl7U05JNrfI5pnwp8n2h3+1h6WbvbeOc19poeWX3w9aybpQ/7aVvWsd/rYB1Q7TI9HJHUndoP9fsb7cYF9PmAqj+RdJNnZBB5sTBbRdx6gy0LAzbTwoKp5eWsrpEGYZjg9eLOQmc6HK59AhRxmqjrVHBpgJOfiFRrPqcKoGjvG+h+VhxKf5hdTNJXlRincWyNqxIBAfgWZLQ3Q8Gx4WQK0VYFw7ExRF7NowG5PBoPdzuJtliQBAq4OUDoSCJoAYktHDh8PjqV4HMOol8kxEhjK6vYYOxN1ySqKr7kTyNi44ZOBCmAPeshiU5fY5q7Ph2HdQFpgBu/rWNqufSWm3x9zJSyKDzYLR10n1pCOeBluc3RUDTGg0bY97w+OcRymJ7m5jtEGCvaVmt/sNRipMn70N5P0nksOysR20VcUq/zkIyk3aXYK1stAAZMrTISaHuNxF2pVNHNlSKgH1U982PplAbX18QCvmUGynqniyLKWDvEMco0/erechMosVqy4NejBdgfAP2lrjE4OWt9IuqsPveJVfqVZNA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(136003)(39860400002)(396003)(38100700002)(86362001)(5660300002)(31686004)(31696002)(478600001)(6486002)(8936002)(316002)(66946007)(4326008)(83380400001)(2616005)(186003)(54906003)(66556008)(2906002)(6916009)(53546011)(26005)(41300700001)(6512007)(66476007)(8676002)(36756003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzlhYnZCSHFsRDJucGJpNjdVNzE4NDdHUzViTE52QnpUTUFWZ1FTSzkyUUJr?=
 =?utf-8?B?L1N4WFM0UExVRVVFZFBxdHRPUm41ME84V0I4NStRVzVhWlpkcWZ0Q2tsbmxZ?=
 =?utf-8?B?S2xPSGRXZElNZzQ5c1JHd0VUdmtKR3g4UVVJdGgvc1Z6L2h2bVZ3cVIrVjlo?=
 =?utf-8?B?STFUb0lrTDNNV0wwQUxwUEh5NFdxSVljVHozVmIzeDBoWXpCblRUQWtZbE1p?=
 =?utf-8?B?S0VPZWRQYXVGN3NnSHRGVStHZmw4NjZFVTNCNXJzWjFlNk9BVXpXcjZxNnh3?=
 =?utf-8?B?LzdYbVVnMW50UGx5aDhqbkp3anhwcE9yU21xVU5jM0o4TEdWVlhhR0doS0c2?=
 =?utf-8?B?OU1kVzFJTnVTeGhpcTFUUjJCTWZJblpHY3JycG1qSUdMa1ovMjJlbURmTXla?=
 =?utf-8?B?U1ErdEROUTdYY25Hb2p2TWl0MkNKMDdxMDlDQjkrYzdkbFVPZGxkVi9wVnlV?=
 =?utf-8?B?anc3VG5ER215eVpSOVlRRnN1RENZYktDSXY5TXBCN3RrVDJpcTlEMXZZZ24w?=
 =?utf-8?B?NkZOcU1sRkZqTzlPbG13YUd6QUJGQjhnQTI0WCttSzJmeXJnak1vSFVabFpC?=
 =?utf-8?B?L1RFckh6bDZ3VEc3SmxHL1RrQTIzTU5nYTdxQTdPNHZjMGh5eUVNZDhDWldL?=
 =?utf-8?B?VytPU2tQR0lwU3gvaDN6UGN5ZXhBRTVJTWdabXZhSmFTeThvMnp4dStSbjhp?=
 =?utf-8?B?cmdDZUNXNWs0RUpuYTNaOUliSFhUTzFQYlhBUUZjZGszM1NlcmtHOUhuc1NK?=
 =?utf-8?B?a3daYmdPS24rQmdNV0ZveXNJNnIwSTBmZnJrRUFmZ2hrOTZJVGNxNE9UUVRZ?=
 =?utf-8?B?ZUlpNXJtbVBBdHF0ZWFNaXl1QnJkNEVJL1J2N0QrUkNNWFdWdmQwNjdnMlV6?=
 =?utf-8?B?cGc2dFlOL3h1dittUW43SGNwS1crT3U3WXdYb3VaUUtGSkdXMzBGS3lUbjM2?=
 =?utf-8?B?d2xtWW1oNWR0RHlpcndlTjF1OEM0ZG95eS9JcDJjamxmWjdYVllEMU9Yekdn?=
 =?utf-8?B?SjJabVpLYTViVGVaU0NhVmVCU0YzODJ3VEp2UUY2RjhqUGVHMS92RllZeUxX?=
 =?utf-8?B?aXpuSGZha3pKdStHZDdyT2FwRDVNaWZzQ1phYUpjMi9QZnBmaVZGclRYdHhh?=
 =?utf-8?B?MllGUmgrUzhDTmhoVG45RXErVEQweENuejdiMUJlbHlMWmppTHdxcWMxbDRM?=
 =?utf-8?B?MEdiSmczS0pMQkdUSlZGNzdXMzRaZ1M2czZ1Tm5Uc3EwTUxCalM2UHJjN1VE?=
 =?utf-8?B?WWJvM1lWQmxTbEVjQnZpcUlubTZra2NDZ0w3OW1rQlhheHdFbGlWUGU4M1Zj?=
 =?utf-8?B?R1lQWStkVlNmT2xiUGxROXBLV0ZpSFpQMmkvY29HcGhIeWJwK2ttVVRuODIy?=
 =?utf-8?B?WGRna29HaktNMjhjeEVhM1RDK2JELzJUZWd6TFRsQlByWHZKc0hnL0R1Q0tE?=
 =?utf-8?B?Z01LMFo4aVlZb3kyU1FIVVo4L0xNampPQVp3eUVZLzROcUIyRU9qZVp5Z0FW?=
 =?utf-8?B?NGJtUVp3ZGNHZTc5QmJGMjBSRDVzM2duUnRlODVzYlU3SmwvNmJ2RWNhMDhF?=
 =?utf-8?B?ZGxzOXQ1V1QyRnk4bnhxamNWQzY4SmRlTEwveSt2VnUrQm51V0MwcmNTRGVp?=
 =?utf-8?B?WDJYL0hIc1E5bUJid3BGZWtSWWhoRmFQRVQyL1JSYWRLdjViTEJRTWZGRVo4?=
 =?utf-8?B?d1JqT0tBWDhTTkpNakp6V3hXemNvTXIrS1hJblN4d0ErSGR6c2lzbkJGZ0Vw?=
 =?utf-8?B?MDVtbEcyU2w4bTZCQ1JzL2JOUHZNOG5FVHgyWmkvNUlDOWNtdm13c29pQnRi?=
 =?utf-8?B?Wm9lRXRSaTVnS3kvc05WMUtUNVVDOWF5bC9OY0VJdmdaNGl1dkpSekJCam0v?=
 =?utf-8?B?bWtENVU3YUxxVzRzQXU3V1JQT0JmYTVOSEljanJOVUJlUGdHMlNuWEh2TUw5?=
 =?utf-8?B?dGhsNGxLN3NOcVVMbUR3VFVhMWU4OUJUOElWRkFpdGpyQU5UQVlka2h2Mk1v?=
 =?utf-8?B?Z0pWbk56UVFEWmlWWFd1OXJGOXZDWjBXcDBpMTFVRys5V2dpdUJ0cEs1ekl6?=
 =?utf-8?B?OExNckFnOEd0azZ5NEdvMUtMZElNV05KM0hnMkJZRzFlZFI3UkdLQkgwS1Qx?=
 =?utf-8?Q?7+ST2L5K3RAOH8iyTFSPtUhIY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6205476-cb5f-44b0-9247-08da6fd302b1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 13:22:10.1727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbvanboEq2YveMGXM23g5udQl6HKlTGyfnsUrkOPrACp1RPa/ni37RkWacsfSIi//i1EjkNLAcR0/X7UqDaHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

On 06.07.2022 23:04, Daniel P. Smith wrote:
> This reworks all the dom0 page allocation functions for general domain
> construction. Where possible, common logic between the two was split into a
> separate function for reuse by the two functions.

You absolutely need to mention what behavioral / functional changes there
are (intended), even in case it is "none".

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -320,69 +320,31 @@ static unsigned long __init default_nr_pages(unsigned long avail)
>  }
>  
>  unsigned long __init dom0_compute_nr_pages(
> -    struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
> +    struct boot_domain *bd, struct elf_dom_parms *parms,
> +    unsigned long initrd_len)
>  {
> -    nodeid_t node;
> -    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
> +    unsigned long avail, nr_pages, min_pages, max_pages;
>  
>      /* The ordering of operands is to work around a clang5 issue. */
>      if ( CONFIG_DOM0_MEM[0] && !dom0_mem_set )
>          parse_dom0_mem(CONFIG_DOM0_MEM);
>  
> -    for_each_node_mask ( node, dom0_nodes )
> -        avail += avail_domheap_pages_region(node, 0, 0) +
> -                 initial_images_nrpages(node);
> -
> -    /* Reserve memory for further dom0 vcpu-struct allocations... */
> -    avail -= (d->max_vcpus - 1UL)
> -             << get_order_from_bytes(sizeof(struct vcpu));
> -    /* ...and compat_l4's, if needed. */
> -    if ( is_pv_32bit_domain(d) )
> -        avail -= d->max_vcpus - 1;
> -
> -    /* Reserve memory for iommu_dom0_init() (rough estimate). */
> -    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
> -    {
> -        unsigned int s;
> -
> -        for ( s = 9; s < BITS_PER_LONG; s += 9 )
> -            iommu_pages += max_pdx >> s;
> -
> -        avail -= iommu_pages;
> -    }
> +    avail = dom_avail_nr_pages(bd, dom0_nodes);
>  
> -    if ( paging_mode_enabled(d) || opt_dom0_shadow || opt_pv_l1tf_hwdom )
> +    /* command line overrides configuration */
> +    if (  dom0_mem_set )

Nit: Stray double blanks.

>      {
> -        unsigned long cpu_pages;
> -
> -        nr_pages = get_memsize(&dom0_size, avail) ?: default_nr_pages(avail);
> -
> -        /*
> -         * Clamp according to min/max limits and available memory
> -         * (preliminary).
> -         */
> -        nr_pages = max(nr_pages, get_memsize(&dom0_min_size, avail));
> -        nr_pages = min(nr_pages, get_memsize(&dom0_max_size, avail));
> -        nr_pages = min(nr_pages, avail);
> -
> -        cpu_pages = dom0_paging_pages(d, nr_pages);
> -
> -        if ( !iommu_use_hap_pt(d) )
> -            avail -= cpu_pages;
> -        else if ( cpu_pages > iommu_pages )
> -            avail -= cpu_pages - iommu_pages;

I can't see any of this represented in the new code. Have you gone through
the history of this code, to understand why things are the way they are,
and hence what (corner) cases need to remain behaviorally unchanged?

> @@ -40,6 +42,106 @@ struct vcpu *__init alloc_dom_vcpu0(struct boot_domain *bd)
>  }
>  
>  
> +unsigned long __init dom_avail_nr_pages(
> +    struct boot_domain *bd, nodemask_t nodes)
> +{
> +    unsigned long avail = 0, iommu_pages = 0;
> +    bool is_ctldom = false, is_hwdom = false;
> +    unsigned long nr_pages = bd->meminfo.mem_size.nr_pages;
> +    nodeid_t node;
> +
> +    if ( builder_is_ctldom(bd) )
> +        is_ctldom = true;
> +    if ( builder_is_hwdom(bd) )
> +        is_hwdom = true;
> +
> +    for_each_node_mask ( node, nodes )
> +        avail += avail_domheap_pages_region(node, 0, 0) +
> +                 initial_images_nrpages(node);

I don't think this is suitable for other than Dom0, so I question the
splitting out and generalizing of this logic. For "ordinary" domains
their memory size should be well-defined rather than inferred from
host capacity.

Starting from host capacity also means you become ordering dependent
when it comes to creating (not starting) all the domains: Which one
is to come first? And even with this limited to just Dom0 - is its
size calculated before or after all the other domains were created?

> +    /* Reserve memory for further dom0 vcpu-struct allocations... */

dom0?

> +    avail -= (bd->domain->max_vcpus - 1UL)
> +             << get_order_from_bytes(sizeof(struct vcpu));
> +    /* ...and compat_l4's, if needed. */
> +    if ( is_pv_32bit_domain(bd->domain) )
> +        avail -= bd->domain->max_vcpus - 1;
> +
> +    /* Reserve memory for iommu_dom0_init() (rough estimate). */
> +    if ( is_hwdom && is_iommu_enabled(bd->domain) && !iommu_hwdom_passthrough )

Again the question why this would be Dom0-only.

> +    {
> +        unsigned int s;
> +
> +        for ( s = 9; s < BITS_PER_LONG; s += 9 )
> +            iommu_pages += max_pdx >> s;
> +
> +        avail -= iommu_pages;
> +    }
> +
> +    if ( paging_mode_enabled(bd->domain) ||
> +         (is_ctldom && opt_dom0_shadow) ||
> +         (is_hwdom && opt_pv_l1tf_hwdom) )

An interesting combination of conditions. It (again) looks to me as if
it first needs properly separating Dom0 from hwdom, in an abstract
sense.

> +    {
> +        unsigned long cpu_pages = dom0_paging_pages(bd->domain, nr_pages);
> +
> +        if ( !iommu_use_hap_pt(bd->domain) )
> +            avail -= cpu_pages;
> +        else if ( cpu_pages > iommu_pages )
> +            avail -= cpu_pages - iommu_pages;
> +    }
> +
> +    return avail;
> +}
> +
> +unsigned long __init dom_compute_nr_pages(
> +    struct boot_domain *bd, struct elf_dom_parms *parms,
> +    unsigned long initrd_len)
> +{
> +    unsigned long avail, nr_pages = bd->meminfo.mem_size.nr_pages;
> +
> +    if ( builder_is_initdom(bd) )
> +        return dom0_compute_nr_pages(bd, parms, initrd_len);
> +
> +    avail = dom_avail_nr_pages(bd, node_online_map);
> +
> +    if ( is_pv_domain(bd->domain) && (parms->p2m_base == UNSET_ADDR) )
> +    {
> +        /*
> +         * Legacy Linux kernels (i.e. such without a XEN_ELFNOTE_INIT_P2M
> +         * note) require that there is enough virtual space beyond the initial
> +         * allocation to set up their initial page tables. This space is
> +         * roughly the same size as the p2m table, so make sure the initial
> +         * allocation doesn't consume more than about half the space that's
> +         * available between params.virt_base and the address space end.
> +         */

This duplicates an existing comment (and hence below likely also
existing code) rather than replacing / moving the original. As in
an earlier case - how are the two going to remain in sync?

Jan

