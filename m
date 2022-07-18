Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3F577EB3
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369435.600851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDN6M-00007n-1p; Mon, 18 Jul 2022 09:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369435.600851; Mon, 18 Jul 2022 09:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDN6L-00005W-V8; Mon, 18 Jul 2022 09:31:41 +0000
Received: by outflank-mailman (input) for mailman id 369435;
 Mon, 18 Jul 2022 09:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDN6L-00005Q-3Z
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:31:41 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00070.outbound.protection.outlook.com [40.107.0.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d1d3f53-067c-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 11:31:39 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB7619.eurprd04.prod.outlook.com (2603:10a6:20b:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 09:31:38 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:31:38 +0000
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
X-Inumbo-ID: 6d1d3f53-067c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHA1VolOOwFgImxk6BCQNlkuKNma9lp3Y7pJ3OusiYvEgXS3A7lCWO/74ASCOp3wPG7DLUj22E2g89tx/eY5A7XcIb6efKUxVzLCQO/al22FLbOCVWNBjNC3YfDG4vuNMMny6k4h7/H7WJFV/5871WfclL6w8mkKxn833hUWvPLE69GjlLwBiixfQ+auNQ/AhqgACBNmswz2ddie1WVtOFK9AADVc2dKx2vqKAdms84Y/08RKjr9gZaonP948MLmUlgZ/DlKsbMCjhNNAPs9RWRz7mbSpEt2gs5PW1N2hl7RQhL3NAp4DnlcAjpaEbR51rGxgnRkpZ/+YjhUoFTOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPw+CQPEmTurCtoPIeD/mDTuJpK4KoP8XKbF8Tsnrgw=;
 b=GLw72F4RA9lnwEQ50zbFkTeda+on1d/HQiDr0f3WKr2yK96TrI4oiFKBF7ykqE1JtRf43wFnz5l9pCm/qJpW2oAO7NUzdr6dU1D97SHuexdpZOhvsP2kTD4e4naWbXcOtLe+0D2Jx0buLL/ReuqYgNLweF9shs08Ip2txuyjb4DHiX2ncZRRMudqoLYfr3lYt15KiePvH6XcTyGumbym64mr7dQ9kRuIn4v7vgAvtQgWDrrdCJRXIE8Bx8SabfQ8MB5KjPU62ZCHBhm8keVIVexrIeH6tXZ2D3RZoKbP26tqb1L3MGWMA6iXyUxKS+aWwUhf9QKSQKhQ1+up4xclaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPw+CQPEmTurCtoPIeD/mDTuJpK4KoP8XKbF8Tsnrgw=;
 b=gHIz+DB9g5BXgaQ2NewPxbrnbdYMFtlwQc81F+hh2GP25S2BLiQo1M7RQJkXzZZ9oJS0biYbQnXqLtng7IZPrLp6K5Y5GEnVpgbGjkq8vHdQE4dVzIh6N3PJ4sKHPQnjHUm2t9CDRPJYbbRA2221GSzXSgdHPpbr4uGE5uUVnX8rIMMkUNaGLLLTe0apIW3k6uFNdXMfjhHaDD7EQ0qDaezQb8HWUBUzWdsSK2RANstWQ5ofbnx0Z6B4G9MR8aNuTBsg8ybwjBuJkw15mEyiRfZV+zGtA8/EVFdSNyD3KIPAzO6RYZJNsGby5o0D31Bb6q5BIM7b6HlAG/sR9DR2TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07304aef-e278-9da9-ebd9-640ac7933268@suse.com>
Date: Mon, 18 Jul 2022 11:31:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] xen/heap: Split init_heap_pages() in two
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220715170312.13931-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11f0659f-8b12-4276-2dfa-08da68a0507f
X-MS-TrafficTypeDiagnostic: AM9PR04MB7619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sd/sEgumq99JcdBF+CHdZMHZrL+uAkXRY+dVKsyTH/oI6OTYnImXVFvrIbwhqaoLrksc340yhVPjCNPoKEdVo0ClIYkH4nw/iuYk1EOuPMPU8oZVbQIM8DJNYs8NEwVMGxQyAyAS+IK56QVZiGUnbmHDp/DfxMKHhoTvyM/wEZ/+1EI88VZPnILCI6PUtpyYFpYd5inFkJNqcvNSSDfn4QAy1rCh28rh6qKVJie7U26TbR3Iro9UfcaCk5QJ6X1J+kArHciolgzk+7v8wdN6uL+fPSC5PcQtB0iOwf7eaeboc2FAMUAfHDuxdNjin4yyDXHB8ryemTs1I1MuYZOdXKbMhPlPlTXBj3kMd5NZbt2w7S6+M/bBOsgNq7nPjM/sx6HDxVaKUvPxzn1rdIWpEPCGHDQJivZKqksyMCkD+RYNur7qTSszf0u4HeZYCEjAG3GatPEyxA5TsdaRWsgP4JsQUvScZ/MQLH3DYGD6g2dVtWqMkankY5B65LOms9ELiY3asAU0Oi2L6nACaZJMFebkvRbZY1aujugmKitMSBQdkE0Whh6QGMLdMniHOLHy5rLas4mVN7eAHbRNm59YoBQDcDsIJvBpL/QkvUp6v0rv9GA/i8LJqmaUQ/7l2qBtwDkVpNcjCD+9J4NMswi93K6RXnAEkHMeGwA39+kP05oBZxTEv3rH2yxgF4sgG9wtXwoKnTmXQwkJvEhtDS8dD6qWYPPA6wb2kzY1I4mqYo4m04s22ZkJM5+4DIIBZdsjgu/CMb5ljsZOoFHzIStyNzNeS8+mYa3WLRYLm8yRk8r7IEGbqFPmM+zBtW3f02LV9zt1KDEWbLKVevxt4vDBMZOoAllSCJubww6XYYso/j8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(396003)(39860400002)(136003)(4326008)(83380400001)(186003)(38100700002)(36756003)(31686004)(66556008)(66946007)(8676002)(316002)(66476007)(6916009)(54906003)(31696002)(6506007)(2906002)(53546011)(41300700001)(8936002)(6512007)(5660300002)(86362001)(2616005)(6486002)(478600001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2FlSFoyQmFWcDJxZWc1QjIzaXpNZUN4ZThHWDhubHJhVCtoZERuWDR0WEYr?=
 =?utf-8?B?eXh0Njd2M3Z3djZxNFRESFE4SWdSdlVNL3dkZkE4YndFU2ZaVG9qT0kreGFZ?=
 =?utf-8?B?N2lpamVKTXRhUWxXelIxdEo0QzJYUGpOMHV1N0J5SzkwZE1iekZDQ3doaDdW?=
 =?utf-8?B?N1l4bkxZb0dWK05NUExtdFBRc3U0QWxPLzMwWHFOT1RyajM5K0M2bnQrT3Zy?=
 =?utf-8?B?N3FCdEdJd1RpZGMyblBkTlVyRHpQNkFTQkpZY0FCTGxLMTkwK3IwQzF6Yk5J?=
 =?utf-8?B?VUZYWjlPTDdndkhXZ1JVL0VBRU5tZUxKSmFhUlJMM0JPZFVKMTZpNXJUcWZv?=
 =?utf-8?B?dWZ2Q3lHeVhFTnpkTVdwS2hQNysyN3N0YUc5d3RKMXdFYjJoVm9sLzZudVYz?=
 =?utf-8?B?ZGM1Zk5UODdndGNtamhFY1Y0UGpFQ01XVlZIM1NQbVFVSmR0UUNibmN0T281?=
 =?utf-8?B?bkRGTHdWMWMvV2pISFljblc4WGd0VU5sNTgySVQ4M3ZvdFZNa05sUmluRUsy?=
 =?utf-8?B?aTlNNUZWeTdwTWNlakYvRHVPTkpOWEtMeU02eVI5UzcwTnIrVWZodjZnVVlo?=
 =?utf-8?B?NDcvVW9BaEo5OXZXYUFKT1QwWnpkYkZzbHVmYXExbDc1YnRIUGpxakxoWlBR?=
 =?utf-8?B?VVlXV3A5QkxFWW9OalJGUlVwa05nTmF0dm16OHVBYnl5ek1MbmNjRlg0MlVO?=
 =?utf-8?B?aDJjaG4xdzk0eEk0VkhHa3VJS0N2MHU4QTNmZmhxMk5uVkFVVVNiazg2ZzVj?=
 =?utf-8?B?REFJYzArNFdXRktGUEdyTXlkcXJlZ29veDA5VEU5VFlpZHI3ZXhUamJBQXVR?=
 =?utf-8?B?dkxIUmgrSlY4WUZuOStJVW9LVEhYaWQzQkFIN1lqTHdXNEZsVzRqbU1waXlm?=
 =?utf-8?B?d1Z4OWxSaEEvKzRFcGZRam5STVIvRzFyR2UwM0VBbko4WXZhczUyYVNrM2ta?=
 =?utf-8?B?Umk2blNmcWZ3cmVidWs2aGIybWZOY24xK3VNMnlkR25tdjhrckZ1MmovTERD?=
 =?utf-8?B?SndKN2pvY20wOG5aSUVpT2JLMy9UTU5lL3pJV2JoU3prN2liRVg4U2ZwVmZE?=
 =?utf-8?B?VllPM2RBcDgrNThmNld1R3BybDVOYTFjWVFNZXdqbkZNdnhNaFNaNW5oUXQ2?=
 =?utf-8?B?UXZJSWtSTzc5Q1N0ZU9BUDdFNUE2aW1mV3lLYzc2UFJSUUdIVmhsbk5JM0Zi?=
 =?utf-8?B?NGwrUTA1U0pPcmY3aUlZcUlCRDFIbTZCaUo4bHVqWGF5dXRpZitQay9pMm1k?=
 =?utf-8?B?b3pzNXRMdlJ3Vm1CUnU0MU5waFJ2aXordks0Y1JBNWdzbzlWM3lsZkZUOGF1?=
 =?utf-8?B?Um92eElwQ29PdmNFRlhIcTQ2SmQ2NjdWcGxPRUR0WUtqZnZkK0s0V2tFZ1NT?=
 =?utf-8?B?ZTVxbkVSMVd3MGkvNi9oSEFVdzRHcnFSVzlMWDNlMkprSEVCellhRDdNY0Fv?=
 =?utf-8?B?aUVUazdWOUJQbUZwM2RnQTE0UGRWd0pQeEpIenFsT0FoeWFKcDV0YkVEdHdD?=
 =?utf-8?B?YnorWVErbGFRNGtkU2UxOHdIVFg0RVZGaG54SzVjbGtwL1NvMXpObGZOTFo3?=
 =?utf-8?B?NytiV2lGb0JONHh0NjBoZWdRYkJ5QnQvUEc5VWowNDFvNjR3UVZyVTE3T1di?=
 =?utf-8?B?ZE1WYjE2Nk5OQ0FwbGx0UWVYWFBVTklFdmExUG5sZWhudUFrRVpKcjUxTzhx?=
 =?utf-8?B?QlV4ZFI1STVoZ2lNck45QjlMc29xakRYdm9DN3ZBOHhHd1AzRDJVREZOVnNa?=
 =?utf-8?B?bWhTYytVL2R3VTRBNEVrRlpzZEg4WTdCTi9DbXQyUjNSZnloWU55Vm9pOXFM?=
 =?utf-8?B?V2plSHdnVE55T0k5T3ppSU93djdIVUNYaTQrQTl0a2xjV3ErOVMyMlFIdFZY?=
 =?utf-8?B?eEE0eDZBNnVsSzY0WTg1Kzg2SDR3eFBNMmRpZlU3LzhoWTJqckpycVBqZnND?=
 =?utf-8?B?cFdwRG9lZGpPL0pmUElFekpBckRIbnBvejFCMDVNcnpsKzlDUm1LOUc4cTlx?=
 =?utf-8?B?UXhHLzRTeTZiRnNUY1ltMTdOaTc0UXg1T29oUVN1bnJxK2VPbnllUXlzaFF1?=
 =?utf-8?B?TjBTS01EQUtNM0VrRTUwZnU2SGxsd1NpZGtweFNaaGZPSllDcll2ZDFreGNL?=
 =?utf-8?Q?LvzF55JMPoQ0wjd+H7AAMmu1z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f0659f-8b12-4276-2dfa-08da68a0507f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:31:38.2008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxlhLpvGfV8uLK3iW5gHjZbX0YHDuyuG5QzDOxDDT61CGxZUPZrtXYJa3QMPlOtxlZbItfJzIA6MGUZI+4eU4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7619

On 15.07.2022 19:03, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, init_heap_pages() will call free_heap_pages() page
> by page. To reduce the time to initialize the heap, we will want
> to provide multiple pages at the same time.
> 
> init_heap_pages() is now split in two parts:
>     - init_heap_pages(): will break down the range in multiple set
>       of contiguous pages. For now, the criteria is the pages should
>       belong to the same NUMA node.
>     - _init_heap_pages(): will initialize a set of pages belonging to
>       the same NUMA node. In a follow-up patch, new requirements will
>       be added (e.g. pages should belong to the same zone). For now the
>       pages are still passed one by one to free_heap_pages().
> 
> Note that the comment before init_heap_pages() is heavily outdated and
> does not reflect the current code. So update it.
> 
> This patch is a merge/rework of patches from David Woodhouse and
> Hongyan Xia.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
Albeit maybe with ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1778,16 +1778,44 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
>  }
>  
>  /*
> - * Hand the specified arbitrary page range to the specified heap zone
> - * checking the node_id of the previous page.  If they differ and the
> - * latter is not on a MAX_ORDER boundary, then we reserve the page by
> - * not freeing it to the buddy allocator.
> + * This function should only be called with valid pages from the same NUMA
> + * node.
>   */
> +static void _init_heap_pages(const struct page_info *pg,
> +                             unsigned long nr_pages,
> +                             bool need_scrub)
> +{
> +    unsigned long s, e;
> +    unsigned int nid = phys_to_nid(page_to_maddr(pg));
> +
> +    s = mfn_x(page_to_mfn(pg));
> +    e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
> +    if ( unlikely(!avail[nid]) )
> +    {
> +        bool use_tail = IS_ALIGNED(s, 1UL << MAX_ORDER) &&
> +                        (find_first_set_bit(e) <= find_first_set_bit(s));
> +        unsigned long n;
> +
> +        n = init_node_heap(nid, s, nr_pages, &use_tail);
> +        BUG_ON(n > nr_pages);
> +        if ( use_tail )
> +            e -= n;
> +        else
> +            s += n;
> +    }
> +
> +    while ( s < e )
> +    {
> +        free_heap_pages(mfn_to_page(_mfn(s)), 0, need_scrub);
> +        s += 1UL;

... the more conventional s++ or ++s used here?

Jan

