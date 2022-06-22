Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD55544D7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 11:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353620.580567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wb6-00040c-C2; Wed, 22 Jun 2022 09:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353620.580567; Wed, 22 Jun 2022 09:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3wb6-0003xV-8p; Wed, 22 Jun 2022 09:24:28 +0000
Received: by outflank-mailman (input) for mailman id 353620;
 Wed, 22 Jun 2022 09:24:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kzGk=W5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o3wb5-0003xM-63
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 09:24:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1be0deed-f20d-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 11:24:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5822.eurprd04.prod.outlook.com (2603:10a6:803:de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Wed, 22 Jun
 2022 09:24:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 09:24:22 +0000
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
X-Inumbo-ID: 1be0deed-f20d-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hviing2ydUWTnaDdbjeMIfhmqKM4t9lI8ht1ptcDcLfsppaXduwwSDsv//b82fBzC+zambR++/SWANg+OJu/n32zqAYGxxHviCWOIsd5SDOglCJX3xwsw6rQPEh+S5fngwoklBO4qLz0Ls8Ht/X0YBsw5vbKgmHsAKWQwbl6yP35gsJXDtodCaSayFCL/qAZrFj1qUiAk7VJDJA4DWlyZgq3zG8ehzmIjedGui20v2zP5PROD4y7Fnx/VgUR+p5x0BeHpLPHl1eA500iQtOXfb6a01E6qZOS9+yt1rtfTgOlv2DOaasCIV0R+e90edHS7hb411qkky1Rz5e/M/+zaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfCsUpOrZvhWMsOu9W4Q/7uuYdHvFdenfDSpKMmnifo=;
 b=aaaiijICug6/CqHooa3HkxTgRdPxRLIN2lHaN6BLpaWAC7LXvLs5cQBEpzDCU+meL2dNCQjfMHhxpzANmnr6xVLsHIw4K9ncAc9iOBkubO6RHepckT8VlZOcAcN/dTiaeQzIRDmPFzya/U/5P01FLPTRKTxZw8hRBPVs1TDL3d0Hedu8nG4O/Bm9WwDzrumJgyT9G7XTuMuuUcecf/XLIcO+XRMwGv5IlO0oOapM2HHsKNc1xDNzpvS/QN2ssRy6mT27M6lgW98uwlkUlzifE3pr2gB9gjFOvV3yhU1WMlmiYkj0j2nkh3TuFLuIPrBQUH3AsUQ+8SdbBoyiB/ldPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfCsUpOrZvhWMsOu9W4Q/7uuYdHvFdenfDSpKMmnifo=;
 b=r+LIQcPV/za0IImnDkRjv7La7KBN82pZbsrALmooyMA4K+/DLOi1sf/INnEJrGmBRV/9+RBXLT0SillxcKlYINzxJ/ckyuIbWBfmvYfYXSAaRDqgKuxny7LfiNEB7q/PSUuHJaxz0LRWhrx+kd1RBHPLBRHS/havIMixuwFrUlAsUfo1iUqtFUdzXDQP/YX6U1+gmKhZcj4klysEzVdV149mTpfsuNbxwH0amUB3L9h+wcsibhT9TaWWnAs0l2heJ7EnUGE7wgENwBX5homXxCJB5lSK10Y3/gyw/UCnxC4+xZc1YaydLSk7hm9UNoUbyoz9xmAei2y3NepeXphEPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
Date: Wed, 22 Jun 2022 11:24:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220620024408.203797-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d80077f3-51bb-41ed-ca58-08da5430fe07
X-MS-TrafficTypeDiagnostic: VI1PR04MB5822:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5822E215C45D414EE9C9E4E0B3B29@VI1PR04MB5822.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LmYEZCEAdWcV3zHa3F9ulNJ0rpkFbQTkRcgZPriw8KVRRxqouHN/TmTRQIVVFmMKLGkFTcnBY3tvZDnkDGXqFpka9ixfm4lq4zowqNWuHfdwXghi4HiiWuSmGqvHMXFGBFPuGetnQWVarKxPrSVVRrjV+otMhDPE4Y/83wa9Aj32LnDUwwA2aNBEDEJo5fFEhTVjohX0lbJDeFgnrnJNLcV8d1KXKhEXKBiP6tqb/OrvBo0OsSs0dURYHtZJLqV/II9xMmvqg1w/UXL+FBf0GoGmwsktdUlzSCx2jFHBsQqQP2FC4l6+8fPEdAUd3kbuYwBhbOIAUPZziQD7In5Om5jXPySClVP7CIfZjIqhD7NXI9N0Vn8XEgQeYTjsvg6ub6F20zJbwyhdo1ylf1bP3wO5luDL0ZJPGgSCbK59xAwfvIZtbIIX6t7zDC4AP8XK6woyhMGGvoJNkGK2wOqGZg1l2b9VMtZw+H/HMW3P5BX5o0NK2VNN46rOGpmeguUPU4RQxF+d+Uvtw32H0/9MXXmkY5hlpMhisCb8rdn2xwJ3pvWfRo4YpSbI6MvlS+1qMo//ULf/ONLu/cFdLdMRJBpuheT307ncfkESG9bU46oyE0JLQ0IXukEQmBljF0C92kkGWh+s7fCPCd5bArwQq3gidgtsJUYOIQd+/MTP8bx2WYt76mecnVBAn2IGH8coloVHYlsyJu/P1hQIT38mRCjRpXg7fMUG4Yx0pdjSPvofLwClmqO8EeVzeAtryrKZKPcQv9MJZ3WkYQE9R+PDe1xwdarzR7rEZQBoun2scDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(136003)(346002)(366004)(6506007)(38100700002)(2906002)(26005)(6512007)(2616005)(53546011)(83380400001)(186003)(8676002)(6916009)(4326008)(6486002)(66476007)(66556008)(5660300002)(31696002)(478600001)(54906003)(41300700001)(8936002)(36756003)(316002)(31686004)(66946007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0J4MnRMcjNyZzh4eWpDVXAxc1BQU1lCR1JrdHc0bXRKeHZuYUl5UVRJTDRG?=
 =?utf-8?B?N1QrbThWaWkzaWxKNlcyV29KMkVlcVhCU01OeWdjUmthcnFKYjFiaHJtZFgr?=
 =?utf-8?B?SW9wQ0JEcVVVUDQ4ekdJSFd2NDJDeTdyWWxVMWFJTUNiYjIvYmNaTEdoY3h0?=
 =?utf-8?B?SGFLcUxVRGhCdFdXS1MrTkV1VnAyYysxSno3VnE3a1QzMlZuZDRyS0FTMk9w?=
 =?utf-8?B?dHVFUzlieE8zcEt1OGNoTUJFM2JSaUtzSFZWQm9sT2YvRTkrdkpPRHhQQWlM?=
 =?utf-8?B?dEdhS2djVnRGV1VDVlRxYU1VbnRvNGhxV0k5Y1ZyTlFhNmE5N1ZVRklJcUNa?=
 =?utf-8?B?Tk9IMVhsbkFLK1diSitkdXVXc1JkeTM4TW9NK2lqQitLSnZLWktqU0x1SWNy?=
 =?utf-8?B?S0wvekVXZHRhSk4ySEhQOHE5TjI4SUYybHlaMXQvWXQ1djNGaVRFcm5vVUFs?=
 =?utf-8?B?M0FLUXNDWTRVTEdsNyszenFER3hhcUlYTkd1Y2RiZUd2ZzBIOGdJMHo5eXBD?=
 =?utf-8?B?d0QrOTk3enp2dmZaWElwM1lxMFdYdC9VT1NMTVo1Q25MRHdDbDN6cDNYc0Jo?=
 =?utf-8?B?b0ZyaU1mUjNQUlBSbWtqS1JWL3o5Q1JRNC9vZ2IxT2xSeHBsOEdyTkFTY2pL?=
 =?utf-8?B?VVQybTUyaTdzYit5Y3Jyc2JET2QxZUhzNTl0SFJVK2RmMGI3QmZCbFJ6aU9B?=
 =?utf-8?B?K0ovMmpOaGU5UTRNQWhZc2N4L0tIY2FaTUJhT1piVVdFd1pZWUdhSzZDR04x?=
 =?utf-8?B?anlNSE1zMy9oRWtHTGRJL2VqUFIvWS8wWW9kUmlMbzl3RHJ2cUlDQnI1eFZP?=
 =?utf-8?B?WDhvQ1RiRmgxV2JwaE91OUp2OHRCNldvdE95TmhtdWsyQmpVeDdvUGh1aEVY?=
 =?utf-8?B?RUVkVUZFNWppWkp6T0VsSDhvU0lVMkVxSEFzTGs2RVBDcUdqaVhtSVBtZ1pv?=
 =?utf-8?B?KzRpdVhrMFNQb3hkV3ZnZzNReDRqTHU4T2RheGNoTks0ZVlGcGNEZTNWTGhF?=
 =?utf-8?B?RWwzWHB0MWFRYnQxNXhWRTVQOWdXWGlpcnVpZDZxUUV6MFhRVU1WTDZ3VXFI?=
 =?utf-8?B?SE1MRk11dW9QQ08ralJUTXI5SzZSdExIZUJlaVFVSERuQXNDSHFXSTV6QkIw?=
 =?utf-8?B?bE15RnRvTHVqWHRmb1lSLzdGYkJ1UlNZSHY0SitMc01JN2l6aEJVWWZoQWFE?=
 =?utf-8?B?UUwyUktCRWFPd3hSOXZhTE1EbkJlZlZHOXV2US90SUdvbEp0RnJaZTEzRWYv?=
 =?utf-8?B?ZThkS2FnQi9QZWZrb1N4M3FLbm5VN2IwTk1STzZrT1A5UW9uK3JOc3BxK0U1?=
 =?utf-8?B?Y2FaaVZaZ1pDVTc5QmZCcWNSMVZVMzNVWVdhdUxvVXNLRGI2S2NuUklLaHhi?=
 =?utf-8?B?T3RhNHVKWjFNWDJUa1ZjVXJCRzByZ2lIaGJLTDM3MFpJL05tcDgzMktBS0l1?=
 =?utf-8?B?SzBEaEVKVG83eHZIbmtreUpodlY4WTZlWGNTRm1ZNFFBcnc5SmNidlQ2cjRl?=
 =?utf-8?B?cGdWSjZzbjNtUTBaRUx6bFhuWHlQSXhCK0tSUGNBVjZnSzQxVzJydjYwV3Fp?=
 =?utf-8?B?bVFrbUNqQTBHYzdNajR5K3NHVWdPMTZNNGhYbzJwVlp3Sm5QL1B3WThXaUZK?=
 =?utf-8?B?RGFrTytOc3hFR2hab2NPaVBaeDFSNTE5WWlRWGYzK0c0SFViendEZVgrMXVV?=
 =?utf-8?B?eFk4TXZYVXJaZGxYSmxjaEtvTmlGY1NTaDV0NkM4Z1JMNFF4eE5vdHZXNDRu?=
 =?utf-8?B?RjA2MUV6VjZhV1NiaVV3eWVmUTRiZWVqOGFxYzYvN2ZDQVlGTW5YZTYzT1NC?=
 =?utf-8?B?OWowUHBTWGVWcWpHbHhKRWxXenlPTk0zbzM1K2w5SG5uUnpFaEtZZ2s5SEVR?=
 =?utf-8?B?ZEZxOStKMllucnh5cDB2OE52djlvbCsxQ1VrUmVJWkxITGM1bTAxT2tCdnUz?=
 =?utf-8?B?SWRkK0NmeVZaUlpweXhQZnIwUHAvK2g4RFJWd21mN1M4SnA0T3ROa2xKV05C?=
 =?utf-8?B?OWNEZDlwK1kxQUw0eityS0MxUFFWdGRibWhuRjNQbmtZZCs3Qmc4SE9waEo2?=
 =?utf-8?B?Nk14YTFjcVJBdmtCeFpqQVFDT2I3RWplN2ZyZVhheEMyc3VqU3hpRUJxQTRM?=
 =?utf-8?B?L1NtNm1xRG5CN01nOGZPaldnSVNQV1ZIenBFdDZIeGdIQU1RandTTXIrNXdD?=
 =?utf-8?B?aGkrencxRTFTbEdzcjZkRGJiK29hZU9PNXNxRlYvR3hYQ1AxQ3BWZlV3MVFL?=
 =?utf-8?B?NnFZTW9xcFNVRmE0a2xKN2cyNldLZkltK1NwM043VVpqMXYwSzhPelc1Mk1N?=
 =?utf-8?B?b1pxT3FSRjdTYnVMVlpsVy9BZFpKNzJhc3FTVmNueDZ5RWgyMm1kdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80077f3-51bb-41ed-ca58-08da5430fe07
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 09:24:22.4839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1OzQZlgmIVgV0pVhNaUpEi/kBfqQOaNi9KgC/aGxh76c+DTTgjh+cAI/K4QCSN0TOTaAmTKfW/3PoHf35j6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5822

On 20.06.2022 04:44, Penny Zheng wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2498,6 +2498,10 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>          }
>  
>          free_heap_pages(pg, order, scrub);
> +
> +        /* Add page on the resv_page_list *after* it has been freed. */
> +        if ( unlikely(pg->count_info & PGC_static) )
> +            put_static_pages(d, pg, order);

Unless I'm overlooking something the list addition done there / ...

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -90,6 +90,15 @@ void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                            bool need_scrub);
>  int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned int nr_mfns,
>                              unsigned int memflags);
> +#ifdef CONFIG_STATIC_MEMORY
> +#define put_static_pages(d, page, order) ({                 \
> +    unsigned int i;                                         \
> +    for ( i = 0; i < (1 << (order)); i++ )                  \
> +        page_list_add_tail((pg) + i, &(d)->resv_page_list); \
> +})

... here isn't guarded by any lock. Feels like we've been there before.
It's not really clear to me why the freeing of staticmem pages needs to
be split like this - if it wasn't split, the list addition would
"naturally" occur with the lock held, I think.

Furthermore careful with the local variable name used here. Consider
what would happen with an invocation of

    put_static_pages(d, page, i);

To common approach is to suffix an underscore to the variable name.
Such names are not supposed to be used outside of macros definitions,
and hence there's then no potential for such a conflict.

Finally I think you mean (1u << (order)) to be on the safe side against
UB if order could ever reach 31. Then again - is "order" as a parameter
needed here in the first place? Wasn't it that staticmem operations are
limited to order-0 regions?

Jan

