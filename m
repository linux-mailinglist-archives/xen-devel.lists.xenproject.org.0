Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40266602D4C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 15:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425010.672744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okmuv-00081T-DV; Tue, 18 Oct 2022 13:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425010.672744; Tue, 18 Oct 2022 13:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okmuv-0007yv-8y; Tue, 18 Oct 2022 13:46:01 +0000
Received: by outflank-mailman (input) for mailman id 425010;
 Tue, 18 Oct 2022 13:46:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okmuu-0007yp-0t
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 13:46:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 323a8099-4eeb-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 15:45:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7772.eurprd04.prod.outlook.com (2603:10a6:10:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 13:45:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 13:45:56 +0000
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
X-Inumbo-ID: 323a8099-4eeb-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZCBCTlAF6Q1yf6vxWI3jxEZCRuaYM1Bkw6h23ewd28WPnkcuZhTFq807WDwnbSaWaigO3Hqb688M/W27k24xVlJPYJcjvUZ0s4cZ/YkxsTDzFbBtbxUKiykCocyH5K3FuogkN+OZnanErFPCtsgPIbIod2wpBvsrBFMq3YYt2PViGLMTIQHpvv57NuJ3aFG0oaBJAiz6Pd9u+Q8AiUzokcKg+mAPREokSlngM6QNkWNtgdI2CvJA3Fhwd84q0Va4Q8qmyN+5akS7Ukr6tNf5ojqnIK3FAkVeiFgu4oIN578jFh9aqdCDvliaOvpfgD1igHwjgcO0x9kV49/mzgbqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXRxwaWaXAkHACvM+MNdQovDSnV3EImA1Wlpni37DgM=;
 b=YO6+l1dFZnoycpKbkmdH1hj6bz1R2aetMG4n+vTZYNVR9oVFuERd7MFMhi2rcoa0EzvtGWa5rwVUJEoS90QBJ/AtP3k1rLCAE8Ns5CUsv1hV/4l7bFhUGDpGQmL3P80pBNzJvVOgHe3j3+ve/R++vDDtKe5gGZGojJ7ItyZusivlnmEefpm98LJCTsmaBQpn+A9Qi0pXQJCLPxp42X5BfovtDD2bVSavWdk3ftizp8mioRKNGfvt3rltWBiTnxGwR/HH+MluTQykkofLKcHxfVe/MI5ApV67JuU+SrVYWTzsRbGBjBWwifSajjk0Lu8g2X6fyWafsg8JaVl9+YFXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXRxwaWaXAkHACvM+MNdQovDSnV3EImA1Wlpni37DgM=;
 b=o2VOpqlE6YDJKf0xqOyV8wiIJTYECwpw9rO4m/gNDoIea2bHO3c7ZiLZ5hszk/ToTaTLLb2lkYqvUR4v5QEGP1RQQgl/st1/rQy2u3JtuO6zgAlBU3bHsbFtiJ8S7JBghncI7BO7evLXcHIdaVE/aqC3mvwYaH3la+Bdb4JF5Yyw3zHTNiVxEJAnTB6x/ODN5JbgJi/dQ/Pf4KXbH3DcK5CzUJLeYNikPLYUsPYkGJERkHIS/iVu0GwEL/AWey/6jtKIS/UOAAscqEpWPDMYUzOtdAFqkQQpfhj2zNo1CEC0G6SUAZKkI7iVsBoDY4s+G1SBPpuedwgtv1p0J9BpmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <039ba141-766b-a7ea-2124-be396e8433f2@suse.com>
Date: Tue, 18 Oct 2022 15:45:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v6 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221011111708.1272985-1-wei.chen@arm.com>
 <20221011111708.1272985-3-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221011111708.1272985-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: a1611252-ba19-4734-7358-08dab10f14bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lMNLDGvmTjzX1VfQda9ZAxG/+ao1ftFlJL1QMeQexfehYJjjI6wM7kb1ISF5Zl/Iu7JXn1TPbYXN/hf3CiMYzH3KoSB9SQLOr7J0wHApNopjn9qRuJ2ompjmA33wobx7gKKiNSro96DdTMMY9zpCX3PIMyDYFZSuu2VPeluWmP8dPJpQLKnu+xxIDna7jh5CCeE5ylVPLAiZ7g95BmtpjGEHeKSjCCVD4V/9KlRf6HEY1VO+gaNf0vRzv23jaSwBPjFOmyzBL11L8NyHrMtO262Q62YU1+DmsVO7Oq03ahXwIXe0CnPYzgOqaOM/zqtzMQ9RoDQw/XewhDljUVzFIu2p10KAsg2MBQfU8Ty2xZLDoW/h5CONxuoTC2VGsiulCOX5UwzJLAYrfgZBfh0mzT7VsMPzP2Pn6Q5zS3sSioTKUrbMfsek+egwOiB3kvB38Ib+AlhNS+PxBxI4lXkDUkdRpehYkliNW7FfhYjffx5kL0i6sPfRNJP7Jv9hz0rwK70vWeldqu9BbNBy46rcy0WE7y0EYdRSd8SYhpLHjhFHQKbU8dhyQ9Xs34xw/lBIqUqgnXHBCi5R0koMZM65FbQ3VMwLvsMz1DC4oOOKCw7WnehvjoPET6flbF6vA6/LlSaoZrsepnh0xgGe8eFpOsYTxa3ccagHuefrBw5nN3QiUPiFt0pZRBEVD+xiOkw/mbx5v3RE1cydPHagWZuVKyrlqotnXOh5UGlcGfB12S8g09ZWi429KW39GNqvS8sBAxz72Xo3hPxFmfqgi7FeQhWEBXZx0A+tfZMac7Uf5/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(31686004)(6506007)(2906002)(36756003)(8936002)(31696002)(86362001)(53546011)(4326008)(5660300002)(6512007)(26005)(41300700001)(186003)(2616005)(478600001)(8676002)(6486002)(66946007)(83380400001)(66476007)(66556008)(38100700002)(6916009)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk9LdDhkb01oZUFSMDY4eDZqbHhLWEVmRk9PQ3h3TWNzaDVTb0JOUWErUk5W?=
 =?utf-8?B?K2I1cVBCdTNXc1RPTTEwZnIybWJpZ1lwWkVjT1E2eWdmdlM2S0l0Wk5qQ0k5?=
 =?utf-8?B?YUs4TUlXamtjZnBiRy9XblVDbkYxMXBUVkRoTnlCYlNzU1h0Z3hTL3ZLOUUz?=
 =?utf-8?B?MjNtWElyN2VTeWdObmgyWkpwbllSN2s4UFBUcnFDVjRVcE8xUVgxNHJIUmti?=
 =?utf-8?B?anVHb2xlbVdrak04enZXRE54dHBGRE54WGFzSkgxd2VQTmVDUUdlZ1R1M0Rn?=
 =?utf-8?B?a29YaXRwMktucXJybWZTaFFTNndxd1VPeWtsU1hiQ21xenBPMjhEc01oWktE?=
 =?utf-8?B?NGpBWWxxMTR6SzZHREtlNmpWNlNMZGduNitkSldkRVVFZ0d1QXZlQ3pVaTVa?=
 =?utf-8?B?STRKSk1jTUF6bHJXTTlxaUc1NEh1ZjlJZEhLNDFNelJyb1pUaW5WMTRIYUVt?=
 =?utf-8?B?d1JGS1MzUGZSL2NKSFRNNk1BVGVDTWI5YWJsYUYxZ3V4QzYxcy81YUM2b1p4?=
 =?utf-8?B?clVwTDBCbWpEQm9UZXV1SGxWSk8ycU5aaFFoTFYvZXZhRmZFamhWMXcvYjFI?=
 =?utf-8?B?M2dkT0dCZjBaYStYVExyL3hxN3AxTEd1WFNwTDFLL0NXWVAxYzU3TnJXSTJC?=
 =?utf-8?B?akgyZzY0b2E3b3RDTkpBWlY3Q29TRUhYcVJBRC83TTNLeks5bHJsVU5rVzl4?=
 =?utf-8?B?elZCVHB4cVQ3ZlZCdXlibW1jTVFUZVNpNnBidC9IOXlsNWxoeXJPaGR4Vzg0?=
 =?utf-8?B?bXpjOHVBR0lZeldmRVlnQVNCSjJvMndWY205Q3FnamNqTUdQWUEvQUwydnRH?=
 =?utf-8?B?RFBVNDA3cmFuMFMxR1lkNUpFeEthcVgwbysxbEpFYW1rWk0rZWVwOEpSWjhl?=
 =?utf-8?B?OEFFdmV3a0duM0tQaHBOV2s0cm5TVGFxRXI0TnI5Yk9wenpRM3o3Mm9LWWZr?=
 =?utf-8?B?ZkZtTXBJK3NxYXZJM1BYeGJic0lUWGxJZUtoT1dKUERleWdGL1ltaGxoQVgr?=
 =?utf-8?B?SUp1VUlYTWVKRE9sMTlFTWpSSHF0M24wZXJxZzRtRE9WK0k4dXo0Y2Q1YWpk?=
 =?utf-8?B?dDBGNDlrUTJDMzZxeE9pRjdISGdicDlLcTZ1U1k0dDRSVmlYVnhPQTZuNkZM?=
 =?utf-8?B?NFhialdUOE5NRE5RREJzSk51ZzZqTFdnTFZ6NUZJVzN3Y1ZMSlM5YXkxdlBo?=
 =?utf-8?B?SkRycGg4Mm5hUXRxanRrdDdtT0tCWm9keTlSbmp6Yy9EM0VCU0hzZld6bFF2?=
 =?utf-8?B?VUpPeGVRSkN4MUZaTStCVHdQWVFJaGxITnk1a1g0NFBBYjV6ZWFNWkUvYTVQ?=
 =?utf-8?B?Sk9uMnlZUS92SFdvWTZzOXMrS0xKSWtXQUNodFg5R1pHSjkvV2FSblhMcGt5?=
 =?utf-8?B?ZkNia0wrREUrbXV4Rmd2ZG1DZzNhWjNvRDQrQnVaSHFsOWZMeXlzOHNnVzA4?=
 =?utf-8?B?RTZadmhWZllhZldCSjh4RENyaGpQMmNTVVlJSVl6WU9ka1FsMVFsbndJeWl5?=
 =?utf-8?B?WUp3bFh4TUZZd1FCM1lrcW8rUjhnRHhFem1McGtTK1pjaVdFRGc4S2ZJNS9h?=
 =?utf-8?B?YnRRYVZ4VUtab2d4clR4Wjl1Qmo1b3FPd3ZxbnByckxQZzYybkJGYVVJaDMw?=
 =?utf-8?B?dW56alZKb0xpY1JpWkd0eWluVGhYelZ1ZkVYK1pxWTZ5T2MrTGlpQmowdUlq?=
 =?utf-8?B?WXlETHE4czdNSVhuZlIwN292QTlTNzNwOXlrbDZST1hDTFFkd0tsWHVpTDBy?=
 =?utf-8?B?ejRiSkNKelJnSThTeTNtQXh3eGliaUNNaytRYVZOTVRGN2U1UGptRk1Sd3FB?=
 =?utf-8?B?Q1NzNGlqNk1uQVpiS0ZxTUd0Ky9yV1dBUzhuVFlEUVo3STJwT3IxcURWR0pV?=
 =?utf-8?B?Um9kNitlZCtWYnJXRVhSa2kzdDFZN2w5eHM2ZDc1ZzdlTm9QMDJPbENEYmlM?=
 =?utf-8?B?MmpTblhnZjZDS0oxQkxHbVoxa0NYUHYzdjhXNTJhVDlTdG1BVk9DSHJ2Z3Fn?=
 =?utf-8?B?K1dqczlGRENqTTZnNk0vb0ErOEVLdGo0cVhISjJSMVNMNlRiNzRqNTNHcUxP?=
 =?utf-8?B?cTJBbUlLaEYzNDd2MzZnSlRWL2NsRTBOcjcwYzRNWmgvSVRSVlVDUmoxSnJV?=
 =?utf-8?Q?zk05FiPiWiwf4VMxUGUif+0Rv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1611252-ba19-4734-7358-08dab10f14bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 13:45:55.7895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ct+bY3hfPcMcXTGGwLWwWNwC2piecAIJ69deW6dyaHOC9fj6q9Ed3Hc6sjP8l1EzXCrFqvV77U3ENP5C4X8ouQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7772

On 11.10.2022 13:17, Wei Chen wrote:
> v5 -> v6:
>  1. Replace numa_scan_node to numa_process_nodes in commit log.
>  2. Limit the scope of page_num_node, vnuma and page of numa_setup
>     function.
>  3. Use memset to init page_num_node instead of for_each_online_node.
>  4. Use %u instead of %d for nodeid_t and j in numa_setup print
>     messages.

The only instances of nodeid_t typed variable uses that I was able to
find are in dump_numa(). I guess you can leave them that way, but
strictly speaking %u isn't correct to use for nodeid_t (as it promotes
to int, not to unsigned int).

>  5. Use min(PADDR_BITS, BITS_PER_LONG - 1) to calculate the shift
>     when only one node is in the system.

This change needs mentioning / justifying in the description.

> +static void cf_check dump_numa(unsigned char key)
> +{
> +    s_time_t now = NOW();
> +    unsigned int i, j, n;
> +    struct domain *d;
> +
> +    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
> +           now);
> +
> +    for_each_online_node ( i )
> +    {
> +        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
> +
> +        printk("NODE%u start->%lu size->%lu free->%lu\n",
> +               i, node_start_pfn(i), node_spanned_pages(i),
> +               avail_node_heap_pages(i));
> +        /* Sanity check phys_to_nid() */
> +        if ( phys_to_nid(pa) != i )
> +            printk("phys_to_nid(%"PRIpaddr") -> %u should be %u\n",
> +                   pa, phys_to_nid(pa), i);
> +    }
> +
> +    j = cpumask_first(&cpu_online_map);
> +    n = 0;
> +    for_each_online_cpu ( i )
> +    {
> +        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
> +        {
> +            if ( n > 1 )
> +                printk("CPU%u...%u -> NODE%u\n", j, j + n - 1, cpu_to_node[j]);
> +            else
> +                printk("CPU%u -> NODE%u\n", j, cpu_to_node[j]);
> +            j = i;
> +            n = 1;
> +        }
> +        else
> +            ++n;
> +    }
> +    if ( n > 1 )
> +        printk("CPU%u...%u -> NODE%u\n", j, j + n - 1, cpu_to_node[j]);
> +    else
> +        printk("CPU%u -> NODE%u\n", j, cpu_to_node[j]);
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    printk("Memory location of each domain:\n");
> +    for_each_domain ( d )
> +    {
> +        const struct page_info *page;
> +        unsigned int page_num_node[MAX_NUMNODES];
> +        const struct vnuma_info *vnuma;
> +
> +        process_pending_softirqs();
> +
> +        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));

Perhaps switch to using %pd here?

> +        memset(page_num_node, 0, sizeof(unsigned int) * MAX_NUMNODES);

Simply (and less fragile) sizeof(page_num_node)?

Jan

