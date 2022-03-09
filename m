Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DF4D310E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 15:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287881.488161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxQ3-0005Ti-BR; Wed, 09 Mar 2022 14:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287881.488161; Wed, 09 Mar 2022 14:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRxQ3-0005R6-7v; Wed, 09 Mar 2022 14:36:03 +0000
Received: by outflank-mailman (input) for mailman id 287881;
 Wed, 09 Mar 2022 14:36:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRxQ1-0005R0-A0
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 14:36:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36d22fea-9fb6-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 15:35:49 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-ii-71dT0Oput7F-Bez3AGg-1; Wed, 09 Mar 2022 15:35:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6764.eurprd04.prod.outlook.com (2603:10a6:10:10d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 14:35:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:35:55 +0000
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
X-Inumbo-ID: 36d22fea-9fb6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646836558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/69ovZYZIr5K1Q61KTBcqWMzdtZcA0k2GbH+a2AQAus=;
	b=Ssfg0VqoGFgUyXjx6R/PFv2pmq2hgX5+c4Vm9gw1666l5OX6MjAERPXDDLZ7MkG78SHkeL
	UI887MOPRY14Abo7k26GyrnhceD/cNnj3rzTjX3i4Tcg2zFhsMemllJIi1idq4Eyeb5k8t
	6PBaci5tRmucXW2bR/EjdUVtOuh7QM4=
X-MC-Unique: ii-71dT0Oput7F-Bez3AGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7ALvTQre29P4uR6ya5uY190TIPWemUoYan0Cbf6uuvS8GPl5hkpA1qo8Y3p0pZYqWhmGAlCcTWt9pDaFSdZbOBrdVXszgXQY54ejw72ZRL5ROBtK6Rvw5WkhJl6yr2MyeJYF0N6UVN8aNa5BWqDLFTmGCl+IbS650sr5x61WbpKMKgAGPH3R0J0iitDfhAezTyHArqs6EQFydk0srUbHifVd25cU60dwKotH6Y+f+0Cbe69oubSLC/jiuqe4cSYccUCpVYBju2aYbJNxTBvW7EXoZZeL4pfryfq+uumeYtdAxonMa3PwgfY/hX2+/iiN1VZmmlZ0L53iGfmxRhS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/69ovZYZIr5K1Q61KTBcqWMzdtZcA0k2GbH+a2AQAus=;
 b=KePb0yY+ndppQ6lsGou0D1qEW46sfjrdNYsWdTFkm4Us7gqopE1z4Nr2aew0FgZ3Gh5Ch/XJ3MgUhScA/eZbO7BWu1OwARkWklcAl71JI//04e80oWHIeB/WHxBMMYZopHXmcUGiJd/WTVhAzvVbZgdUIz+EyBdP+Rkmhz7Rc7szV6EsV31pimPSvbyarcvjpTG9MHPv5VhVLikiok4RMiLGfIvCttzKZ20UX5FwKMk1S/Rw12JhMAKlO0/dMwhYSIkvReDpsUcueORlFuWxAouhpPNChBLdv1LUTyEr7+eQBMHyvkT1xojfrZkuxd3GGf8HJVmI6spBmCYl2AQnqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2448d6b-ed8b-5c83-b49e-4f8f2582a0c0@suse.com>
Date: Wed, 9 Mar 2022 15:35:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 19/36] xen/arch: introduce cache-coloring allocator
Content-Language: en-US
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>, xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-20-marco.solieri@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220304174701.1453977-20-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24f8faee-31eb-486e-a2a1-08da01da1e5d
X-MS-TrafficTypeDiagnostic: DB8PR04MB6764:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6764D83D65F2094A86F81CD7B30A9@DB8PR04MB6764.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cebOd7GZjjwxdRI1+lcIR1ZFaIyMzoavXUJKwu8pbhGHQ41e3jSmB4Ze1cJji2Rc+N0z91zr+OeawhEkMk5Dg6vZRpZ1WzDHti53J7tL0z7WiFN6DLuyj1Akgyc7RsWwTAMI1rXCDPtudhgkPTCJgRcmUwLY3RhMnhH5rW0643vX/U0eHTJAJRokNu9sEC1LumOD5oSi+UyTcalXXAfsjXeBb+VgWH1De284ojFXKwC7QdCMAgPMDCFFI+tWMFL/Rn1YqVPpFrNqNzEROT/XVfQb1fB0/oDzlK9U+MnPNDxKYXLLM3HcTjYd/HVXWVxpTXYMM9/MBjRHD7fhMbrNbxYjba3HV4lSB4iugq3cnEkPu1/qinmeJrczHistmNGGOb2YL2GA7oOOezkd6neVeq8ADc+hoyBCCLCjDiIC8NA0qLneyzC07INeoeh0Qkgj3MgHtf/f8hAarmkoUvPoYYjdMup6lgexhZRxNiHhEdppUP+AIM09wg2RUV5AmjESeFSkhP/Qs5TVTGKi+fXNPFNOoZNzV/LU8NOe4ygQlZVJNpBZ7Q4Dc+k/plUbNU0elUuekHxmatU39bChYJdBw2gthCpqN8G/4EpQVsKBZN7HXefHzxS+JYeqNGxZRKCt6gJmNs/JfNn4EG3dRyPKYoz5fGKxAt5e/3Njs+8kCYy+wooS93BQErO7stwtBV2NWFyl7YGFxnvvTZ6cvCcNqv3IcyWdGSgTvkh3RFBEyjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(2906002)(26005)(316002)(508600001)(53546011)(6512007)(5660300002)(6666004)(83380400001)(86362001)(6506007)(8936002)(6916009)(30864003)(38100700002)(31696002)(36756003)(31686004)(7416002)(6486002)(4326008)(8676002)(66556008)(66946007)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVFKSTFPalh2d0JKODFFdHhsUTZBcHdXRi9tT0hFVXBhT1FWNmdVWmRRWWtX?=
 =?utf-8?B?V3hXRnpIVGJWUnh1bG8yTjhSZEtsWW83ejd4NHVGVk9LVEw5aDJVcmxZbFpw?=
 =?utf-8?B?alFyS2VCNkw3MG05SWVldmNacUNMcDRiWEIyNk1SOXR2MU40dmtZREF0cHEw?=
 =?utf-8?B?UjAza0dxY05kMHVra0wwMEZ6UXBmYUlBUmtrelFBakJyYnBtZFB5dXQ3ZkpN?=
 =?utf-8?B?WXhndnViOXlvSEV1L01iMEJ4dm1MUExGK2IwT25iK1NCZU1ZVHltb3NSdXg0?=
 =?utf-8?B?alhCUW1INlRPSStvc0QzUklOakVDdFN4em11RTdTT2s0c3ZFeGtMcUlaMG1E?=
 =?utf-8?B?Wk55emZxMVYvRkVhY0lHcE16d3M0RUkrcFZFb3FkRHdINXM5WDBmc0xGMEd3?=
 =?utf-8?B?b25SdGphVGI4eHdqVzhDWm4zQnBnbVIrb0xyejRoTnhBOVpGYkdTZnpCTXd5?=
 =?utf-8?B?eW5zUmZKRXYwWjd3M3JZeHU2eFZJeDNqaGRFR1JXeTdoQ00raERyMlBBTnRS?=
 =?utf-8?B?UEIzdEZlaFJiKzlkbW8rY1RBR2lacEFoM25ZWlJtSWwvZDhmaHJoQ1JDcjhF?=
 =?utf-8?B?dVgydjY2Skg0S2hXNks0Vnk3Y2FKbHlicUMrWHBOQ1Y1aHVsSlkzRG5aV3Zi?=
 =?utf-8?B?YjFqVHNsZWNNeXUvcmNsWEVnbEtGT1NJQkpBeFVvSUFMeHlKc0RGZVdLM1dK?=
 =?utf-8?B?Q1NtMmNKdU5mdDR0UXRTWW0vQnkzN0g3aHhwSUNMUDg1b21pQ3FLbW10ZFNS?=
 =?utf-8?B?UHpyU0dPdGhVWXgybS9ibGFNeEd4dzRWdmt4dUJqdktTaGordTBzcjNBcW5L?=
 =?utf-8?B?NWtDL0ZNTGV0K243aU9ONyt4Si9sdFFyOG16ODJFQWREZ1FrVEpXdFRtSThS?=
 =?utf-8?B?eUsxVGNkclVhOGRiT0RuMXZKVzJ0SEFvcU9iSlZBRlR0cnBiamNLMW1kNXB3?=
 =?utf-8?B?bGt3LzNqY2NoTXpvWWJody8vTDNJMm1SNVpnUmdMWEpuNUNOOHNVYmY0VWhJ?=
 =?utf-8?B?aWhqRW9GNHJnQ0xMQVVMK1FnSnRMcGNHZnNTM25RUkhETmlpQXhGK1diWHNn?=
 =?utf-8?B?aFlHcGwwdEJGTVBJRUxLY1FsVWloRjlPc2RlUjVGY1p1Ni9XckZ1WThUS2Yz?=
 =?utf-8?B?Y2RJRXFJUFJ1eUpwVkplbEZqNVBqSUNCRkFrVTA3ZnJkcEVZdnpVTjNMK0s4?=
 =?utf-8?B?VEorbms1NUVSQnZyZ0twSTNjK20wbkw0Q0sraDJZMjlTV3BjMDdKN1dWbWx2?=
 =?utf-8?B?c2NxMVNCUHJWc0Q5YUlUYVRWRUdTMERndml5RW5ha0N5cjNKR2JlME9sbjNm?=
 =?utf-8?B?U09aZjZ6dCtzaklmOFd5QVk3RnpFY1huenIyUWxkVmdFNlJRMkNMYk94RmZS?=
 =?utf-8?B?aW1LZnBzS1lRSmM2YWFRVFd5bkhGOWkrcXM0L0NNZVphbVRXQmNFSWN4T2ZP?=
 =?utf-8?B?clhmc3JYRDJrZXVCOTRaOE0rcDJvS0tYUEpBYi9OUWsxZlZ5OVVDdHNLOEp1?=
 =?utf-8?B?ei9HNXlqWjRobWFBeHVhb0RyS0Q1d0p1TEJHNEN4M2FtRjJ1T3JQZnIvMGFh?=
 =?utf-8?B?REtXZlQzVWhvOU5iVjNoNDJjd3B0SGpoYUMvSUdHQzBjRXpQaHI2L2NHSEtD?=
 =?utf-8?B?eSt3MkhKVXVwb0JacERvUW1DTFF5M2t3STlPT3RoN3JiZzNGb040UXFZaTN1?=
 =?utf-8?B?cnE2d1l5NGt5Z0hxMGJiQkJ0eXJmbVVaVE1ZL2RGekVTSzNvWGtkeVZIZjkr?=
 =?utf-8?B?ZG9YRXZEblVwWHMybXM3c1VlU0wwUTd4bkdWQ0VRbnk2dDB6TUlGOS9wK3dm?=
 =?utf-8?B?QUU3cnFVOGg0V3RsbU1ueHE1T3BqNFYzRkIwRUdEVlJIRlNRR0d4WEw5SXVs?=
 =?utf-8?B?NjZVOFhkUUpLZkk0T2VxYjhZOEVJTXozZjhsSUQ5TnNSTTBSZHRIKzM4WklO?=
 =?utf-8?B?M0lJZVN1Q1RiMjlBeUtKOTJ6Uk9WWk43ckZnbHQ0NU9Va2lnSUdmYlRUcHBI?=
 =?utf-8?B?d1N2Rm9wMVp6UnpYdkJ0THpTZVFPOUVWM1pKTUxiTXlnRmpSR2FUTitPcXI4?=
 =?utf-8?B?VUFGT240RUc3QVBzNGJYc3hUd0lYanVkRUo1L295WEVjM0ZpQVEzWWFJbmU3?=
 =?utf-8?B?MkJmYnpSbUo0TW9wYmhMOExWVitGTmxSaFVjZE5vejIxZU83VlN3QU85WTJK?=
 =?utf-8?Q?mYKLdHk+FZUWaTtTUI540T4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f8faee-31eb-486e-a2a1-08da01da1e5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 14:35:55.3422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB7UUt7+RfdHimDtfUK7mYl+R4AmSWe10RRbfGw1j5I3SnSxiAJsx7OjYTC6qwRRA2qgYx8/wUPA9C598TM9zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6764

On 04.03.2022 18:46, Marco Solieri wrote:
> @@ -438,6 +441,263 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
>  
>  
>  
> +static DEFINE_SPINLOCK(heap_lock);

Please take the opportunity and shrink the number of consecutive blank lines
above here.

> +
> +#ifdef CONFIG_COLORING
> +/*************************
> + * COLORED SIDE-ALLOCATOR
> + *
> + * Pages are stored by their color in separated lists. Each list defines a color
> + * and it is initialized during end_boot_allocator, where each page's color
> + * is calculated and the page itself is put in the correct list.
> + * After initialization we have N list where N is the number of maximum
> + * available colors on the platform.
> + * All the lists' heads are stored as element in an array with size N-1 using
> + * the following schema:
> + * array[X] = head of color X, where X goes from 0 to N-1
> + */
> +typedef struct page_list_head color_list;

color_list_t, to make it easy to recognize this as a type (rather than
a variable name)?

> +static color_list *color_heap;

__ro_after_init or, if Arm still hasn't got support for  that, at least
__read_mostly.

> +static long total_avail_col_pages;

Can this go negative? If not, unsigned long please.

> +static u64 col_num_max;

No new uses of u<N> or s<N> please. They're being phased out, and C99
types should be used instead.

> +static bool color_init_state = true;

This variable looks to be local to init_col_heap_pages() - please move
it there (provided it's needed in the first place: it's no clear why
you don't use an initcall instead).

> +#define page_to_head(pg) (&color_heap[color_from_page(pg)])
> +#define color_to_head(col) (&color_heap[col])
> +
> +/* Add page in list in order depending on its physical address. */
> +static void page_list_add_order(struct page_info *pg, struct list_head *head)

I guess you mean struct page_list_head * here?

> +{
> +    struct page_info *pos;
> +
> +    /* Add first page after head */
> +    if ( page_list_empty(head) )
> +    {
> +        page_list_add(pg, head);
> +        return;
> +    }
> +
> +    /* Add non-first page in list in ascending order */
> +    page_list_for_each_reverse(pos, head)
> +    {
> +        /* Get pg position */
> +        if ( page_to_maddr(pos) <= page_to_maddr(pg) )

Wouldn't it be a bug if the two were equal? If so, perhaps better
ASSERT() or even BUG_ON() accordingly?

> +        {
> +            /* Insert pg between pos and pos->list.next */
> +            page_list_add(pg, &pos->list);

The 2nd parameter of page_list_add() is struct page_list_head *, not
struct page_list_entry *. I guess you won't get away without introducing
a new accessor.

> +            break;
> +        }
> +
> +        /*
> +         * If pos is the first element it means that pg <= pos so we have
> +         * to insert pg after head.
> +         */
> +        if ( page_list_first(head) == pos )
> +        {
> +            page_list_add(pg, head);
> +            break;
> +        }

The way it's written it's not immediately obvious that the passed in page
would actually be put anywhere on the list by the time the function
returns. Furthermore this if() doesn't look to be necessary to be
evaluated on every loop iteration. Instead it could apparently live
_after_ the loop, requiring use of "return" instead of "break" further up.

> +    }
> +}

This function dealing with a page at a time while linearly scanning the
list looks to be pretty inefficient, the more that it'll be a common
case that callers have to deal with multiple pages at a time. Sadly it is
not clear how many colors there may be (without hunting down the origin
of max_col_num, which get_max_colors() returns, in the earlier 18
patches), and hence how long these lists may grow.

> +/* Alloc one page based on domain color configuration */
> +static struct page_info *alloc_col_heap_page(
> +    unsigned int memflags, struct domain *d)
> +{
> +    struct page_info *pg, *tmp;
> +    bool need_tlbflush = false;
> +    uint32_t cur_color;
> +    uint32_t tlbflush_timestamp = 0;
> +    uint32_t *colors = 0;

Please consult ./CODING_STYLE for when it is appropriate to use fixed-
width types.

> +    int max_colors;
> +    int i;

I don't suppose either of these can go negative, so unsigned int please.
(Just like other remarks - please consider applicable to the entire
series.)

> +    colors = d->colors;
> +    max_colors = d->max_colors;

Please make these the initializers of the variables, which will also
avoid using 0 where NULL is meant above. It also looks as if these were
the only two uses of "d" in the function. If so, please consider making
colors and max_colors the function parameters instead. Or else d likely
wants to be pointer to const (and colors as well as it looks; generally
please use const on pointed-to types wherever possible).

> +    spin_lock(&heap_lock);
> +
> +    tmp = pg = NULL;
> +
> +    /* Check for the first pg on non-empty list */
> +    for ( i = 0; i < max_colors; i++ )
> +    {
> +        if ( !page_list_empty(color_to_head(colors[i])) )
> +        {
> +            tmp = pg = page_list_last(color_to_head(colors[i]));
> +            cur_color = d->colors[i];
> +            break;
> +        }
> +    }
> +
> +    /* If all lists are empty, no requests can be satisfied */
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }

I'm not convinced this is a useful thing to have. The identical
construct below the subsequent loop will deal with this case quite fine
afaict.

> +    /* Get the highest page from the lists compliant to the domain color(s) */
> +    for ( i += 1; i < max_colors; i++ )

Perhaps easier as

    while ( ++i < max_colors )

?

> +    {
> +        if ( page_list_empty(color_to_head(colors[i])) )
> +        {
> +            printk(XENLOG_INFO "List empty\n");

This is liable to be too noisy even if converted to dprintk(). Please
drop.

> +            continue;
> +        }
> +        tmp = page_list_last(color_to_head(colors[i]));
> +        if ( page_to_maddr(tmp) > page_to_maddr(pg) )
> +        {
> +            pg = tmp;
> +            cur_color = colors[i];

You only ever write this variable - please drop such, or introduce them
only once actually needed (if e.g. in a later patch).

> +        }
> +    }
> +
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    pg->count_info = PGC_state_inuse;
> +
> +    if ( !(memflags & MEMF_no_tlbflush) )
> +        accumulate_tlbflush(&need_tlbflush, pg,
> +                            &tlbflush_timestamp);
> +
> +    /* Initialise fields which have other uses for free pages. */
> +    pg->u.inuse.type_info = 0;
> +    page_set_owner(pg, NULL);

This would now become the 3rd instance - time to consider a small
helper function?

> +    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> +                      !(memflags & MEMF_no_icache_flush));
> +
> +    page_list_del(pg, page_to_head(pg));
> +    total_avail_col_pages--;
> +
> +    spin_unlock(&heap_lock);
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    return pg;
> +}
> +
> +struct page_info *alloc_col_domheap_page(
> +    struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *pg;
> +
> +    ASSERT(!in_irq());
> +
> +    /* Get page based on color selection */
> +    pg = alloc_col_heap_page(memflags, d);
> +
> +    if ( !pg )
> +    {
> +        printk(XENLOG_INFO "ERROR: Colored Page is null\n");
> +        return NULL;
> +    }
> +
> +    /* Assign page to domain */
> +    if ( d && !(memflags & MEMF_no_owner) &&
> +        assign_page(pg, 0, d, memflags) )
> +    {
> +        free_col_heap_page(pg);
> +        return NULL;
> +    }
> +
> +    return pg;
> +}

So this is really only providing a single order-0 page. From the cover
letter it didn't sound like you were aiming at such a limited use case.
It's also not listed under "Known limitations" there that large pages
don't even have provisions made for.

> +void free_col_heap_page(struct page_info *pg)
> +{
> +    /* This page is not a guest frame any more. */
> +    pg->count_info = PGC_state_free;
> +
> +    page_set_owner(pg, NULL);
> +    total_avail_col_pages++;
> +    page_list_add_order( pg, page_to_head(pg) );

Nit: Stray blanks immediately inside the parentheses.

> +}

How does this fit into the get_page() / put_page() machinery? You
don't alter free_domheap_pages(), after all.

> +static inline void init_col_heap_pages(struct page_info *pg, unsigned long nr_pages)

Why inline? I guess this might be to silence the compiler warning
about the function being unused, but then this only means that you
want to introduce the function once it's needed. Then it would
also be possible to tell whether the function wants to be __init.

Additionally the line is too long.

> +{
> +    int i;
> +
> +    if ( color_init_state )
> +    {
> +        col_num_max = get_max_colors();
> +        color_heap = xmalloc_array(color_list, col_num_max);
> +        BUG_ON(!color_heap);
> +
> +        for ( i = 0; i < col_num_max; i++ )
> +        {
> +            printk(XENLOG_INFO "Init list for color: %u\n", i);

Again too noisy. Such may be okay in a RFC series, but should have been
dropped for a "normal" submission.

> +            INIT_PAGE_LIST_HEAD(&color_heap[i]);
> +        }
> +
> +        color_init_state = false;
> +    }
> +
> +    printk(XENLOG_INFO "Init color heap pages with %lu pages for a given size of 0x%"PRIx64"\n",

While you shouldn't split the format string across lines, you should
take all other available measures to limit line length. Furthermore
please consider using the shorter %#x form here and elsewhere. Overall:

    printk(XENLOG_INFO
           "Init color heap with %lu pages for a given size of 0x%"PRIx64"\n",

And even then the two values logged are redundant with one another,
so things can further be shortened here.

> +            nr_pages, nr_pages * PAGE_SIZE);

Nit: Indentation.

> +    printk(XENLOG_INFO "Paging starting from: 0x%"PRIx64"\n", page_to_maddr(pg));
> +    total_avail_col_pages += nr_pages;
> +
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        pg->colored = true;
> +        page_list_add_order(pg, page_to_head(pg));
> +        pg++;
> +    }
> +}
> +
> +static inline bool is_page_colored(struct page_info *pg)
> +{
> +        return pg->colored;

Nit: Indentation again (and more instance below).

> +}
> +
> +static void dump_col_heap(unsigned char key)
> +{
> +    struct page_info *pg;
> +    unsigned long size;
> +    unsigned int i;
> +
> +    printk("Colored heap info\n");
> +    for ( i = 0; i < col_num_max; i++ )
> +    {
> +        printk("Heap[%u]: ", i);
> +        size = 0;
> +        page_list_for_each( pg, color_to_head(i) )
> +        {
> +            BUG_ON(!(color_from_page(pg) == i));
> +            size++;
> +        }

How long is this going to take on a decently sized system? At the
very least you'll need to call process_pending_softirqs() every
once in a while. But this may be taking too long this way anyway.

> +        printk("%lu pages -> %lukB free\n", size, size << (PAGE_SHIFT - 10));

Again the same information is being logged twice.

> +    }
> +
> +    printk("Total number of pages: %lu\n", total_avail_col_pages);

Since the value logged isn't calculated locally, may I suggest to
merge this into the initial printk()?

> +}
> +#else /* !CONFIG_COLORING */
> +#define init_col_heap_pages(x, y) init_heap_pages(x, y)
> +
> +inline struct page_info *alloc_col_domheap_page(
> +	struct domain *d, unsigned int memflags)
> +{
> +	return NULL;
> +}
> +
> +inline void free_col_heap_page(struct page_info *pg)
> +{
> +	return;
> +}
> +
> +static inline bool is_page_colored(struct page_info *pg)
> +{
> +        return false;
> +}

Why are any of these needed? And if any are needed, please drop
inline once again.

> @@ -2600,6 +2859,9 @@ static void cf_check dump_heap(unsigned char key)
>  static __init int cf_check register_heap_trigger(void)
>  {
>      register_keyhandler('H', dump_heap, "dump heap info", 1);
> +#ifdef CONFIG_COLORING
> +    register_keyhandler('c', dump_col_heap, "dump coloring heap info", 1);

'c' already has a use on x86. Please avoid such collisions, even if
initially you're targeting Arm only. I don't see why a separate key
is needed anyway - can't you just extend dump_heap()?

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -131,6 +131,11 @@ unsigned int online_page(mfn_t mfn, uint32_t *status);
>  int offline_page(mfn_t mfn, int broken, uint32_t *status);
>  int query_page_offline(mfn_t mfn, uint32_t *status);
>  
> +/* Colored suballocator. */
> +struct page_info *alloc_col_domheap_page(
> +    struct domain *d, unsigned int memflags);
> +void free_col_heap_page(struct page_info *pg);

These two should imo represent a pair, i.e. be named similarly.

Jan


