Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD101544D6C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 15:23:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345494.571058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzI7V-0002Dz-9F; Thu, 09 Jun 2022 13:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345494.571058; Thu, 09 Jun 2022 13:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzI7V-0002Aw-5b; Thu, 09 Jun 2022 13:22:41 +0000
Received: by outflank-mailman (input) for mailman id 345494;
 Thu, 09 Jun 2022 13:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzI7T-0002Aq-P9
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 13:22:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b61de5b-e7f7-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 15:22:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 13:22:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 13:22:35 +0000
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
X-Inumbo-ID: 3b61de5b-e7f7-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUy45xmj+wOaIf05OIMvbNbmoJi1nUcWdS5OcvjKJlR1y1ic5BKGB4Nj+fNh6PLoiXEeP6nDdU9u8aengt6kMBQZpuP44mJV1FBs61VHZ3LvPaUNSAwUOfC7DxU/L0pI/a+4MSARgD6JNI4Cj3pI0d+lmirVEHilg8drEN0gPgGUJWDcrtTJARnI7FNNbtQGBqiibWjvqbj0aJ63GbBJEIA6Yk0xa6WdUUAR+pMqjj+LjidgcB/rTObGxGmTr4ZyiqkDt+Yyr4o8F0ellXuYUl8LfQKmDZ406MuYFCuoh62eyd6fy8PS0c8H/wq+z5fmwto7v0S+QQk8zg1P3gr2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VD4+4dZlvMlKysfjtIuJX1niQ8S7rQhVurNDguliCo4=;
 b=k8LK15mzT8ZIjI3WEbNsEJbD7iMyWcBSNiLKa8E4yCQSdCws0GQJCbyH678QPU8ASZyH70QWHueEGQnWLwcs3cOkWHKPjrZ00vrvL1NSuiYMNo/kqVi5/dc9FkJJjoDfcDHgnxhDPwQS3m4rWElMC12lPqL84toQ/YIi2vbBxa9mL9s+vRDqc+5MybTEBu1wFYTYUT6i1dMmqEfbAElDY+Rv8idABDl9qngKziIAWD3YNWcyTVtJPJsXa727gaeJSuqetpr1bBTIswzkcAIieDIbOWp4wN8NmubVaBLkCIJpPyHijZGGeHk/NVswSocoreYfZ0iPT7vZWsZO48c8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VD4+4dZlvMlKysfjtIuJX1niQ8S7rQhVurNDguliCo4=;
 b=kkTEkvA4H56Xk6mYh0wvV34zAQmlazzYjO40fFJB/dFnnBTpdaK+tqe4YN8gyAzOok4sPLlCW0Hr8x+uMLxeJFRGacdxAzWJd++U/kFQBj3F444SXXGIBBh7Y9utl4uh4knmqEIi4xQ0krHf2cOs+9aIjew7x2mpvokCPdPvkJN7ceuZ7qf9aIfML5v29dUUrKkBHG1nQGmsEFrEjOsJEYgPk4/MWzbvP+p35TOQbumHVJClsVbriHu/+l4MjHTJseaf781cavTi96qUCVI6CHnib20Rc/TnMeRbUKUKQMEUwswv2kHkCFqKmM4ZVgTPXSr1fhmpF32RRIQRkOZTww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4462bfdf-fc24-12df-0f16-7c09d0618d0f@suse.com>
Date: Thu, 9 Jun 2022 15:22:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] xen/heap: pass order to free_heap_pages() in heap
 init
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220609083039.76667-1-julien@xen.org>
 <20220609083039.76667-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220609083039.76667-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0041.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 789cc5c2-6876-4a51-c546-08da4a1b1dad
X-MS-TrafficTypeDiagnostic: DB9PR04MB9578:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB957850C9FA09DEA72C47EE39B3A79@DB9PR04MB9578.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qK5j6l1YoRSMVq2IwxL3Ed1pIz/iuVbaNw/uHtkulrWY1cK1+dunXlRLLfvaTZ/hRw1fyjToD5eYl7I2Wz9ISasOaiZzJaE+4iqbr1mJ5GeLnK0amWMuFvx7jVXeThTpFWyaNO1KsLldib/LkdX5JYSO+U/TwKfRX/96sBWEeqXh7RKPdlCPT1iUZLL0FepzPdIo7lwgw3/tF4Q8SV3dJ9cN5IhcIzS0ckuPlNJuISKgzJA7l3XpWKnpqCsLGTpH3GPlemwipQKixarV2Fc42+SjhkSneW1WpJ6iaaujWrocOOk3WBFBcF4XJ/u3L8XAE+T/dfioBZDpq2F5WA88NaDCcwY0e427nGEPsruF+1CxhlzirW/lZGFJFUVOmfnaqY+qUlHEpsJwX5ix4NJTo3EVPEh5Ym5BXvOII8O5PrOSuX2jU5C31v9aP5CjDIVtdEPzNDDdS8yKWwWyWW/zAERb0jRle8C9JH9VVLEnS8+UHceVqlIxI0EMUoCxRlbdEAdawrzunB3xB/qcMV/yVaGqjb+DBBuPXQJTBmXAP35UvFj6mwgDXeOfy6DOv6N7sg17PxYC2rb0Uzdhk38uk46Cv2hcajIvCFtcU4dGrZ5WN6SjXtyctJDmtcJtbZroIZCfskUasmUQlBeKgzcrJnVtrHO6qiHLj0EapZYTEX8tlOkLjR8+ekzUHohnRq9djtJYeZo1IEGLsPKPbCnU3NZV6vvg7DkNuA9LHLAQt/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(38100700002)(186003)(31686004)(6916009)(316002)(4326008)(54906003)(66946007)(83380400001)(66476007)(66556008)(8676002)(36756003)(26005)(31696002)(53546011)(6512007)(508600001)(6666004)(86362001)(2906002)(6506007)(6486002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlB4R1NQYlNqMXJ0UEJyelFKKzh0bXRPUEtTSmkvVmFITnVpWDVqcEg4RjRE?=
 =?utf-8?B?MFRjdUp5dlVrbVh4RGh3T3lVaHRWOFhnZ1I4ekE5TFBqWHF3aUY4TWxhQ04z?=
 =?utf-8?B?MnBBSEJXUWcrT3ZqY01pRFo3bDJtaG5tc003ZmZ4TURaNmEzT25Ha1pyVm9H?=
 =?utf-8?B?VitxR0ZBSHNsTStlYUlaRjRVaEJFNXJhdEhiZkJuWGdBQUd1Sm0zYVhPdnNV?=
 =?utf-8?B?dTIzR2Q5RjRRbExtRXpyZFhrSVhMRmUrYkpBUytJSEEvNzFtNG9lTGgvL3E0?=
 =?utf-8?B?dXdFMnVZWG1LNURZVEhhbU1iaEFRcm5mKytxc2xWLzFaSDRBUzZIVSt3Vzlx?=
 =?utf-8?B?U0Q1UnNkL2Qzdm5xaEpQVkRUR1M5UzFYSzFoQmpKeU9LRSt2aTI0eEczMWdW?=
 =?utf-8?B?bXM5b0VtRUd4LzhhQ3BtbDV0NmxiZ3lYMmNUNDVDV25HWFh2SWNMWFJxR0VT?=
 =?utf-8?B?S01hbmRieWUrNEVpOHVmK0dPc0piaVlWUEFkNWROakJFM096cUxuTk9ib0h5?=
 =?utf-8?B?ZFh3TlBLcHVmbnVhQ0RiOEFPYXQxbTN5TlpSajE2SzlwUkRLNjJVb1dPQzdE?=
 =?utf-8?B?VlFYMFBhcS9qdThDQkpyby8veERrOFdVME9qL3kxNjZMUjM0Q3gwZkN6VWpp?=
 =?utf-8?B?YUkzMTdEZEFDWXNlbXBUN1VJQ0p4b2ozNW52N2EvMWpEZXRtcURJNjdLNEY4?=
 =?utf-8?B?cXRDVVZrSDRHRitjOEhnRWJWOFo3TTdPNDBPZE16ZHUxV1NXWmtWTzFKVE9U?=
 =?utf-8?B?eDMyUHJ2WjRpc29Salk4eTlubDBpRytCSmJPdTk2anlieTlrbjBrZmRFV3kw?=
 =?utf-8?B?cFNJNkpvbG9FVjg4U3QwdWNrc3BMM1lmaEtJYmxNZ3FKc0xCbm5ndUhSQ1VQ?=
 =?utf-8?B?Wm1pUXdib1NwS0ZKM0lsVStFYitnRUhKTXNqNnVzUitZT1NOWnBJZXh6WnBn?=
 =?utf-8?B?QzI3TVNWOXl0SDVCdmNNcmhsSjV5OGxvRVc1YkgzcTJiczZud1pSbEs0Q1dZ?=
 =?utf-8?B?aXNxb085K3JuQTBXVHFzR3NIZlJJeGhOWTVxLzFUa3lWMWdYVlRJbktOT010?=
 =?utf-8?B?aUY3ZmFQcHFsRVVBd2d0dGRMNGpZeTRMU1RrT1ZRVTVmVHRsTmZNd1NRZVlV?=
 =?utf-8?B?TW1zNUQya0tQQmFia2F0UDUxc2VWcjRYMWZmYko4NndpOHJvMVNJMXJoMldS?=
 =?utf-8?B?S0pXekRUTmc5bzcrcXR6bGl0SzlEQytwMkZ3TnJTenRjMWptTGpROU03N3Br?=
 =?utf-8?B?WWR5K2ZWbVdHSlhzaUROYWdnS0VOTklISisxRzdTcVZSZXdIWEFMOVIvbDlF?=
 =?utf-8?B?TThzNCtTMWI3eDJsWG9LUWtDNEdWMUdkaDVjWklTYVFDUWN2WFFHeGlRdWJI?=
 =?utf-8?B?UmcrV0NYS0diamgxbzk1eUNIODQrNUlCSjBWbWJDblVmbFpoQWk0ZVQ3b3Z0?=
 =?utf-8?B?d2x0dzlUV1N6RjlkUHpUVmpVTGltZmlXbXY5V2JoRW9ld2lrK01VQU85VlFP?=
 =?utf-8?B?NHVsTlp6MTlJbTB6YlcrOVRiczVFUzRWY0kxMmdkU3MweVJPNS94MFFvN0pn?=
 =?utf-8?B?M05hUlkyUDlxOFg4Z0o4a09vWGpMSW9RRVlCMEVOdS9tTmpVU1ZkRWVKMkNv?=
 =?utf-8?B?dE11dnRqYXh2dnhBOHRjdG9SanQ5VnE5aU1uZElvdFBHcXFxSXlqU2FWeEhs?=
 =?utf-8?B?ZXNQanZCRUhET3FIaHhmcU9QVUVtdHNKY0k0Z3hHTVlwVVdwRU56czdQQlNU?=
 =?utf-8?B?Q0ptODdaUnI3VXNpU1pVSUFXdjQ4YXUzZ01aS0FnNzNyVUhMcldrekdzUTl2?=
 =?utf-8?B?ZkVyQ0J0YlN6RHRNaEVhdlR2ZUhRNEFXSFVGOVNmZ1ZHSXpGMDZrbnFEb3No?=
 =?utf-8?B?bFVQSVFtVWxNOXI2djZpY21vVWNNcjdUVCtRREtocUJiMTE4djZQdVY2WnZW?=
 =?utf-8?B?czM4TSsxZnZraTVlNDBmbTl6cldxQjRzWXJncXRtU2VsUlpvRGNJT3kwcmdB?=
 =?utf-8?B?cGZXRW5iZzFkbnpLWFhYZFZFRVh1Y0Q0a2ZoQlA5aEd6NENvZ09PY3ZBYWMr?=
 =?utf-8?B?ZUlSQ0NvSnYwYXZtYWkvWFEvYU5UaXgvVVBzcWNTcFBUVzVOWVNCcjlpK0NW?=
 =?utf-8?B?eDVmVXBtRC9aZWhhUHdPemxYTWNZbkhPcTJvdHA2aktvdUpPU1VFeHdiTUsz?=
 =?utf-8?B?aGZxS3lGb2RWUEtNQ3l6eVNCb0Z0RkpYZUU0SWZ6T085YmREbG9NT1kyMnZ2?=
 =?utf-8?B?SC9YYkx6YVhPVlMzQTU0WEZMUGJvSFVlM1ROVm5RUloxc2doNHhyKzJuV0JY?=
 =?utf-8?B?VFdwSVNkMGwxanJUdGloZ0wzY1RhSTlFWXMxQ0wvTExoL3l2Z1VWZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789cc5c2-6876-4a51-c546-08da4a1b1dad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 13:22:35.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1DTgde+9gZF9/K8yTGXsQwE/t7KZKgMdLkvCplv202/HreVYiOSEfL+E7Xb+eWx6uN6NUgg2E+bTf0C3o393A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578

On 09.06.2022 10:30, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> The idea is to split the range into multiple aligned power-of-2 regions
> which only needs to call free_heap_pages() once each. We check the least
> significant set bit of the start address and use its bit index as the
> order of this increment. This makes sure that each increment is both
> power-of-2 and properly aligned, which can be safely passed to
> free_heap_pages(). Of course, the order also needs to be sanity checked
> against the upper bound and MAX_ORDER.
> 
> Testing on a nested environment on c5.metal with various amount
> of RAM. Time for end_boot_allocator() to complete:
>             Before         After
>     - 90GB: 1426 ms        166 ms
>     -  8GB:  124 ms         12 ms
>     -  4GB:   60 ms          6 ms
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/common/page_alloc.c | 39 +++++++++++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index a1938df1406c..bf852cfc11ea 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1779,16 +1779,28 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>  
>  /*
>   * init_contig_heap_pages() is intended to only take pages from the same
> - * NUMA node.
> + * NUMA node and zone.
> + *
> + * For the latter, it is always true for !CONFIG_SEPARATE_XENHEAP since
> + * free_heap_pages() can only take power-of-two ranges which never cross
> + * zone boundaries. But for separate xenheap which is manually defined,
> + * it is possible for a power-of-two range to cross zones, so we need to
> + * check that as well.
>   */
> -static bool is_contig_page(struct page_info *pg, unsigned int nid)
> +static bool is_contig_page(struct page_info *pg, unsigned int nid,
> +                           unsigned int zone)
>  {
> +#ifdef CONFIG_SEPARATE_XENHEAP
> +    if ( zone != page_to_zone(pg) )
> +        return false;
> +#endif
> +
>      return (nid == (phys_to_nid(page_to_maddr(pg))));
>  }
>  
>  /*
>   * This function should only be called with valid pages from the same NUMA
> - * node.
> + * node and the same zone.
>   *
>   * Callers should use is_contig_page() first to check if all the pages
>   * in a range are contiguous.
> @@ -1817,8 +1829,22 @@ static void init_contig_heap_pages(struct page_info *pg, unsigned long nr_pages,
>  
>      while ( s < e )
>      {
> -        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
> -        s += 1UL;
> +        /*
> +         * For s == 0, we simply use the largest increment by checking the
> +         * index of the MSB set. For s != 0, we also need to ensure that the

"The MSB" reads as it it was not in line with the code; at least I would,
short of it being spelled out, assume it can only be the page's address
which is meant (as is the case for LSB below). But it's the MSB of the
range's size.

> +         * chunk is properly sized to end at power-of-two alignment. We do this
> +         * by checking the LSB set and use its index as the increment. Both
> +         * cases need to be guarded by MAX_ORDER.
> +         *
> +         * Note that the value of ffsl() and flsl() starts from 1 so we need
> +         * to decrement it by 1.
> +         */
> +        int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
> +
> +        if ( s )
> +            inc_order = min(inc_order, ffsl(s) - 1);
> +        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);
> +        s += (1UL << inc_order);
>      }
>  }
>  
> @@ -1856,12 +1882,13 @@ static void init_heap_pages(
>      for ( i = 0; i < nr_pages; )
>      {
>          unsigned int nid = phys_to_nid(page_to_maddr(pg));
> +        unsigned int zone = page_to_zone(pg);
>          unsigned long left = nr_pages - i;
>          unsigned long contig_pages;
>  
>          for ( contig_pages = 1; contig_pages < left; contig_pages++ )
>          {
> -            if ( !is_contig_page(pg + contig_pages, nid) )
> +            if ( !is_contig_page(pg + contig_pages, nid, zone) )
>                  break;
>          }

Coming back to your reply to my comment on patch 1: I think this
addition of the node check is actually an argument for inlining the
function's body here (and then dropping the function). That way the
separate-Xen-heap aspect is visible at the place where it matters,
rather than requiring an indirection via looking at the helper
function (and leaving a dead parameter in the opposite case). But as
said - I'm not going to insist as long as the helper function has a
suitable name (representing what it does and not misguiding anyone
with the common "contig"-means-addresses implication).

Jan

