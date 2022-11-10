Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F3624762
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 17:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442023.696070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAht-0001I0-Kx; Thu, 10 Nov 2022 16:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442023.696070; Thu, 10 Nov 2022 16:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAht-0001F6-I7; Thu, 10 Nov 2022 16:47:13 +0000
Received: by outflank-mailman (input) for mailman id 442023;
 Thu, 10 Nov 2022 16:47:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PT5E=3K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1otAhs-0001F0-6Z
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 16:47:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51d6912a-6117-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 17:47:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 10 Nov
 2022 16:47:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 16:47:08 +0000
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
X-Inumbo-ID: 51d6912a-6117-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXBFYXKPP83Bvnc6R/izr2x3zbUqKPju6Hdr1AYFV5koMkbGBWrOjuEKMCs3WJnNzhTw+K/JBKB8wKcWYpyrXjwIEyAC0aCk1CGh2rda7ymQzik3/wdbR6Pbk84ygbNN7WQDcAIA03r2t8yuXpKIULQI9kljRubhoU0LL2emIXhDysUwm7bA9zVWjUD9pxVuV2DZDenRmQhQ+EqISU6WbjBH1quVOJJTKRtYWqeiIZU0nsNnGrZXyvn6GPWqQ2bKQt2xuPYNWL8l5AmahazRhh/l31QWfXO9yV+Gh4YxQeefAeCH0dtUhup/WiTajOkH+gb23GMZqOTRE5+DrVuEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lKcOLx4akakoXrqY8U5a0xwc8cdQmoFqA3mntJ4N3g=;
 b=RIiyK+KMip/qCDYyKm+89qzPQlgBXg/8KZ8Uug43rba5mXUArLsKxng3355BtNiqoarHeJ+ASZ7iEuVt5R6H8i+GEE/Op22fkyC7u6+jC1DMyqdVhqtD92iHhi01rNxcuZZ7vOcKqvAFWeUZSZjSYd6Wrpjt7qyeXXfu3DtREEX4elIhsAVlDnRfIV62NuQPjZvf4fkX4FxKgNpVorwm+SvczRLVL5OwTGF5kSAGvb8wFL2227HvbhAnFlxye7tqzABUN6uMIxx+8d/fVPIhzaeS9s5ktafLcOBVIjSwRHIrk7/sYKaFRbDPgH7ajHSsgI0bLihKhmgBj06nHVGoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lKcOLx4akakoXrqY8U5a0xwc8cdQmoFqA3mntJ4N3g=;
 b=tdGLbV66CIDq4G1HBX/Be1Jd6Rw/gtSw9AYbqnNylSEWv3Nn9klvVEeMERGMER+7aFyYnUGlSO3zYtlcmOZIKa0h8h8dCrWi/E1AUoTvl3l+NOxUeuyyezQKDOQ1FZ8WV7gJz8WdUZ0uuPtnrJWr/MWw5JMfwGTwqBbrvuSFR5C0CDezgXD2xR/V+ymhxY7EhBuMKniDikXt/oGvps7fZa79jF7qsYt6M8zCcWR+oP3wtjLRQq+kd8L5hvQ8XcipRA1p9qB/u9Mq326FcLpRR7ylhyammo55nruezo5HOMaTj2mAYTUxUd1HtoSyHf2TeOGApS3IOQ49qbYV84xTBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7ecb1c6-4340-f44f-4f5e-f74236b900f3@suse.com>
Date: Thu, 10 Nov 2022 17:47:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/9] xen/common: add cache coloring allocator for
 domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
 <20221022155120.7000-7-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221022155120.7000-7-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee855d0-adbc-4e36-f6bf-08dac33b34a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c5PJVBPJ8IpJ/xJWU3dVNmSPkMZahoe9q7gSlf27jJOBMI6Ii7abZ7sDNr5zdtVw+AgVKOPhAQgA/V9F1QLaAxWfhbtB9sLexQOClHGFvoBloGvqnMpRvvllD0l//z0khsWmoLe71mAYjY+FnNzMGKPVzZlJ4swToArHKJCPmTEBsM6NQ6dH74YJAUpCO0N8GA2sFAhqMwGutUV0JvBnzol3E35LgRbHPztBAKJ5DYLasEkUGUjmN/20cEAcXfx3XVzi92ny6/pH2O4xkV24QpKGpNtoaJVtW92Ubi2Y3JbTAoNYdL90I3IjxpDPwYTj7l/Pwtyx3EVYz2+zWgvpHiGzFMp9seSUmOtnko6JWOCrb0OLCKfgsJ8QRFk/a3YVhUxMtRpLfCqYCQ3L8oz9u8Mrs+jAq2Rpw2UiPl6AA7Li9aqKVh26yYEyeUtPzXwDbEjOOABtnrpgZiXL3XDDpfK/rsl94QOoiWFrIng8DzYdo/EoYWQHczUvf7LYK5wbFt7IR5KsR5OaLNzE/dlqjexeKcbGg3l1wTeXDE1w7eSTjlPZbEpEJpYubb/p39ObnfjTBWMfb9nLQbQq2fiuPn6ujYVJuW/xL8Bj+UP7I/sGUckwgeoxmaNvGq92CupOwin4j3hNbEbC8spuQ4gM1Q1mmgiWeqIanXXd7mV57RprDcd7EnaVEvUqgZ0oZ4ggtpTibyqGMHFZ0I4jYQzGOgKo5MTj1OiaN7MLfgNv0BGB2nS/D3A7OIq0biA1Fo5f/sTD64q1eO9dcav01f4p+3KphM1R1bEQJP5h9/VUQQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(83380400001)(86362001)(31696002)(478600001)(6486002)(38100700002)(54906003)(41300700001)(8936002)(4326008)(26005)(5660300002)(66476007)(8676002)(2616005)(6916009)(316002)(66556008)(66946007)(186003)(6512007)(2906002)(6506007)(53546011)(7416002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzV4M1pCM3VoNmtNendUaHpsMG1ZS3BOV1dMd3J4cTh4MDlZTkU5UTVBT1Zi?=
 =?utf-8?B?ZFE2ais2Qk5BR3FiVTJFR1BxaU9zQzhvWDZobXU3ckw3eGhUV1RpMzFTWWhM?=
 =?utf-8?B?TzdvcWF5cTFZRFIvVmF5RVcrOHI5ZmtQdFJNUVBnR2VVTDZFU1dtOUU0QmVh?=
 =?utf-8?B?dmdNTFNlVyt0YlJWbXF1SmlUUGdJZzBROHN1OUJRbG5SVzhIc0RpR0xodlZN?=
 =?utf-8?B?eUYrdmJuZk5ta3BvK2h4NFVSM3g4dXRrU2wvc1NOZXhTREsxajA5bzNtc1Bm?=
 =?utf-8?B?bkJGeXVOcXZSR1lhZ0ZxNXFiSUczM1BLejVMVTExYnN6eElUbGNUdVpVd2hy?=
 =?utf-8?B?TEZpbjhlUmVJNkVVVTIreHFaOHg0N1gzSHVNWDJXc051L2JKazQ5L3krTU9j?=
 =?utf-8?B?VGx5ZWRBN3ZNMEJLOEZFNEJ2OHNQTUpJYjlES0FhNmV3enVKcExsR3pNMDl2?=
 =?utf-8?B?cWlYRE8vNVdTWlVXbUprdGczUEdkeWIwTmhLcWl4V202MDVZVjluRXd4Zjdo?=
 =?utf-8?B?MlNuWlFQcUUvNTNGWk1la2xKU0c2YVpUUmFCMnZDVFhieFpzaTNZSnVqeXZP?=
 =?utf-8?B?em1udDZvRUh0TmNWY1BJaExGWmhhZmRCT0svcG9IZER2QXdnMGhTTjdVeXhH?=
 =?utf-8?B?NlhyR3U1d1hFSzJUZHROcXNJejZiWE8vNjlJdndoMHN0OStPVy9FaXVNcnVO?=
 =?utf-8?B?S1NPZ2VqMTBvZlc3MEs5bUV3SWVzRExrUW1hYWNuOTlKM1EzNzdPbzNTcC9C?=
 =?utf-8?B?cWJtWWw4VW5VZnJZaU9vZEtVRmZpdUUrendEd25ReWlQQUw2NEZmdGVzMTNG?=
 =?utf-8?B?U2RRRS9yK0hDVEg1eFlxbmJVOXE1bWNnVGpneEdyVWhGVENzMEs4RWdDT1BS?=
 =?utf-8?B?VVpxbG91TU8xcWxSQk1kS3FEOWdrTmVzdkhYdTJ5VlZ2Z1lLL1pORCs0azhi?=
 =?utf-8?B?N0xEVWNMS0RjR05Cc3FweVZuTkRweC93MGtJU0xsQ1NhQ0JzcXdHc1ZzcGlM?=
 =?utf-8?B?U0lXd01TQUVUU2tlMzlMY0NXbElIVlZqcnRRWjhFMU1ZQjlZRThjRm1kQkpz?=
 =?utf-8?B?M2NQYmZBNTJZbzFIVnpOeVN3MWN3Q05wWkp0SUsxTHRqSWd3TE9pTmtsMkZq?=
 =?utf-8?B?NHU0aUJ6cDJXYUE0SC8wYUMyc1o3TG9vaEloS00yaTl6NkpYRW44R2ZvdHVK?=
 =?utf-8?B?ZUFha0VmR2QwMnJ4RnFYaklGeDdTV1RJWm1tWFNzOWlFWDMxNVVlNDYzdWJi?=
 =?utf-8?B?WG1TdlczUUcySk8rU2N5dzNTVWNROGMyS3JVK3VvdnBORHhaTUZnaUJuUGRk?=
 =?utf-8?B?TGRTZTFxWktIbkV1dkFZdCtpY09Jdm5STlcvTFZVZWU2WS8wWExEelk0SlhT?=
 =?utf-8?B?MkdmQVdGUUNhNEFmSW44dk5xdmZHTjRNNHMwZnFSWnFZa09aZzZRcEJSSkIv?=
 =?utf-8?B?WGVxVU9Ea04vTDQrdzZWYTJrWGNiZzRNTjRIMXVOLzdYZ0I2SkhTejU1NWJI?=
 =?utf-8?B?bjlHNDlzTlFiSG9uTFlkak5yMmZucDFxODNNcFMyQ0FJdnpqRDluS00rdXpU?=
 =?utf-8?B?Y1pnZ2puRUx5djhuUWxXeVczd2FXdTRCcnUwVnhqWHJ0Q1ZRSGxwT0pVQ2Vx?=
 =?utf-8?B?aEJvMHlOd3BGbWhDYktqalE0TlZob1k5Sk83RW42NG15dDA3eWNETG16dTdM?=
 =?utf-8?B?S2RvY0ZudEtNQUNwbkpON3VZR3JOOVc5L1JXMUVqYXlwV0kzVDY4RjJrc1Br?=
 =?utf-8?B?R1BjOXU4dUZxazRudjdwZFR1SHdxelVqKy9kUDU2cXZDTEdSRmJScjNESGJN?=
 =?utf-8?B?endpSUcxTWxrcVlFNlRuVU5zK29KWlQvU2hYa1FURytTQ0NHVC85N2pFS3hE?=
 =?utf-8?B?REdCWEtkeHZOdm5ZeUtjR1B5Wjl6TXJJM0VVTzdNT0ZsR3BUV2EyL3p5QzFJ?=
 =?utf-8?B?Z1FVcTZRZkVNb1o0MXhXb0JyUzZ5cTg4N2Z4VE9BOFZNVjJaWTl5T3VnQW5o?=
 =?utf-8?B?Y3ZFRlpiYThsOW9qcFVTY28rQzlsUi9zaVd1eS9zV25xQU8vWko0YW5zSksz?=
 =?utf-8?B?RUdTS0FOTFBhWmZFYVlLaHo5KzJ3OGNMVEF3bWpEbDAzdEhZSzE3Mm1EaGx2?=
 =?utf-8?Q?hlzkVUI0SdW/TlY054Ct78fsb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee855d0-adbc-4e36-f6bf-08dac33b34a6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 16:47:08.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZY9qgrQnRJftq92yBQh+ftFNy78mU41/QAnqawTLtveAFce9lXd5l1S9kpxIbeo5/bTWzO7K162vFY3yDV8PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8840

On 22.10.2022 17:51, Carlo Nonato wrote:
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -661,7 +661,12 @@ static int p2m_create_table(struct p2m_domain *p2m, lpae_t *entry)
>  
>      ASSERT(!p2m_is_valid(*entry));
>  
> -    page = alloc_domheap_page(NULL, 0);
> +    /* If cache coloring is enabled, p2m tables are allocated using the domain
> +     * coloring configuration to prevent cache interference. */
> +    if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +        page = alloc_domheap_page(p2m->domain, MEMF_no_refcount);

Are you sure you don't mean MEMF_no_owner (which implies MEMF_no_refcount)
here? And then ...

> +    else
> +        page = alloc_domheap_page(NULL, 0);

... is it really necessary to keep the two cases separate?

Also nit: Comment style.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -150,6 +150,9 @@
>  #define p2m_pod_offline_or_broken_hit(pg) 0
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
> +#ifdef CONFIG_HAS_CACHE_COLORING
> +#include <asm/coloring.h>
> +#endif
>  
>  #ifndef PGC_static
>  #define PGC_static 0
> @@ -231,6 +234,14 @@ static bool __read_mostly scrub_debug;
>  #define scrub_debug    false
>  #endif
>  
> +/* Memory required for buddy allocator to work with colored one */
> +#ifdef CONFIG_BUDDY_ALLOCATOR_SIZE
> +static unsigned long __initdata buddy_alloc_size =
> +    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
> +#else
> +    static unsigned long __initdata buddy_alloc_size = 0;

Nit: Bogus indentation. I wonder anyway whether if wouldn't better
be

static unsigned long __initdata buddy_alloc_size =
#ifdef CONFIG_BUDDY_ALLOCATOR_SIZE
    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
#else
    0;
#endif

or

static unsigned long __initdata buddy_alloc_size
#ifdef CONFIG_BUDDY_ALLOCATOR_SIZE
    = CONFIG_BUDDY_ALLOCATOR_SIZE << 20
#endif
    ;

> +static void free_color_heap_page(struct page_info *pg)
> +{
> +    struct page_info *pos;
> +    unsigned int color = page_to_color(pg);
> +    colored_pages_t *head = color_heap(color);
> +
> +    spin_lock(&heap_lock);
> +
> +    pg->count_info = PGC_state_free | PGC_colored;
> +    page_set_owner(pg, NULL);
> +    free_colored_pages[color]++;
> +
> +    page_list_for_each( pos, head )
> +    {
> +        if ( page_to_maddr(pos) < page_to_maddr(pg) )
> +            break;
> +    }

I continue to view such loops as problematic. With them in place I don't
think this feature can move to being (security) supported, so I think this
and similar places want annotating with a FIXME or alike comment.

> +    page_list_add_next(pg, pos, head);
> 
> +    spin_unlock(&heap_lock);
> +}
> +
> +static struct page_info *alloc_color_heap_page(unsigned int memflags,
> +                                               const unsigned int *colors,
> +                                               unsigned int num_colors)
> +{
> +    struct page_info *pg = NULL;
> +    unsigned int i, color;
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        struct page_info *tmp;
> +
> +        if ( page_list_empty(color_heap(colors[i])) )
> +            continue;
> +
> +        tmp = page_list_first(color_heap(colors[i]));
> +        if ( !pg || page_to_maddr(tmp) > page_to_maddr(pg) )
> +            pg = tmp;
> +    }
> +
> +    if ( !pg )
> +    {
> +        spin_unlock(&heap_lock);
> +        return NULL;
> +    }
> +
> +    pg->count_info = PGC_state_inuse | PGC_colored;
> +
> +    if ( !(memflags & MEMF_no_tlbflush) )
> +        accumulate_tlbflush(&need_tlbflush, pg, &tlbflush_timestamp);
> +
> +    init_free_page_fields(pg);
> +    flush_page_to_ram(mfn_x(page_to_mfn(pg)),
> +                      !(memflags & MEMF_no_icache_flush));
> +
> +    color = page_to_color(pg);

You don't really need to retrieve the color here, do you? You could as
well latch it in the loop above.

> +static void dump_color_heap(void)
> +{
> +    unsigned int color;
> +
> +    printk("Dumping coloring heap info\n");
> +    for ( color = 0; color < get_max_colors(); color++ )
> +        printk("Color heap[%u]: %lu pages\n", color, free_colored_pages[color]);
> +}
> +
> +integer_param("buddy-alloc-size", buddy_alloc_size);

This would preferably live next to the variable it controls, e.g. (taking
the earlier comment into account)

static unsigned long __initdata buddy_alloc_size =
#ifdef CONFIG_CACHE_COLORING
    CONFIG_BUDDY_ALLOCATOR_SIZE << 20;
integer_param("buddy-alloc-size", buddy_alloc_size);
#else
    0;
#endif

(Assuming buddy_alloc_size is indeed used anywhere outside any #ifdef
CONFIG_CACHE_COLORING in the first place.)

> @@ -1926,24 +2106,49 @@ static unsigned long avail_heap_pages(
>  void __init end_boot_allocator(void)
>  {
>      unsigned int i;
> +    unsigned long buddy_pages;
>  
> -    /* Pages that are free now go to the domain sub-allocator. */
> -    for ( i = 0; i < nr_bootmem_regions; i++ )
> +    buddy_pages = PFN_DOWN(buddy_alloc_size);

Any reason this can't be the initializer of the variable?

> +    if ( !IS_ENABLED(CONFIG_CACHE_COLORING) )
>      {
> -        struct bootmem_region *r = &bootmem_region_list[i];
> -        if ( (r->s < r->e) &&
> -             (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
> +        /* Pages that are free now go to the domain sub-allocator. */
> +        for ( i = 0; i < nr_bootmem_regions; i++ )
>          {
> -            init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> -            r->e = r->s;
> -            break;
> +            struct bootmem_region *r = &bootmem_region_list[i];
> +            if ( (r->s < r->e) &&

Even if you're only re-indenting the original code (which personally I'd
prefer if it was avoided), please add the missing blank line between
declaration and statement here.

> +                (phys_to_nid(pfn_to_paddr(r->s)) == cpu_to_node(0)) )
> +            {
> +                init_heap_pages(mfn_to_page(_mfn(r->s)), r->e - r->s);
> +                r->e = r->s;
> +                break;
> +            }
>          }
>      }
> +
>      for ( i = nr_bootmem_regions; i-- > 0; )
>      {
> -        struct bootmem_region *r = &bootmem_region_list[i];
> +        struct bootmem_region *r;
> +
> +        if ( IS_ENABLED(CONFIG_CACHE_COLORING) )
> +            r = &bootmem_region_list[nr_bootmem_regions - i - 1];

If you want to handle things low-to-high, why don't you alter the
earlier loop rather than skipping (and re-indenting) it? However,
considering that in alloc_color_heap_page() you prefer pages at
higher addresses, I continue to find it odd that here you want to
process low address pages first.

> +        else
> +            r = &bootmem_region_list[i];
> +
> +        if ( buddy_pages && (r->s < r->e) )
> +        {
> +            unsigned long pages = MIN(r->e - r->s, buddy_pages);
> +            init_heap_pages(mfn_to_page(_mfn(r->s)), pages);

Nit: Blank line between declaration(s) and statement(s) please. Also:
Any reason the type-safe min() cannot be used here?

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -297,6 +297,37 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
>      }
>      head->tail = page;
>  }
> +static inline void
> +_page_list_add(struct page_info *new, struct page_info *prev,
> +               struct page_info *next)
> +{
> +    new->list.prev = page_to_pdx(prev);
> +	new->list.next = page_to_pdx(next);
> +	prev->list.next = page_to_pdx(new);
> +	next->list.prev = page_to_pdx(new);

Nit: Several hard tabs here, and ...

> +}
> +static inline void
> +page_list_add_next(struct page_info *new, struct page_info *prev,
> +                   struct page_list_head *head)
> +{
> +	struct page_info *next = page_list_next(prev, head);

... one more here (and at least one more further down).

Afaict you're passing a NULL "pos" in here from free_color_heap_page()
if the list was previously empty and page lists aren't simply "normal"
(xen/list.h) lists. I don't consider it valid to call page_list_next()
with a NULL first argument, even if it looks as if this would work
right now as long as the list is empty (but I think we'd see a NULL
prev here also if all other pages looked at by free_color_heap_page()
are at lower addresses). So perhaps ...

> +    if ( !next )
> +        page_list_add_tail(new, head);
> +    else
> +        _page_list_add(new, prev, next);

    if ( !prev )
        page_list_add_tail(new, head);
    else
        _page_list_add(new, prev, page_list_next(prev, head));

?

> +}
> +static inline void
> +page_list_add_prev(struct page_info *new, struct page_info *next,
> +                   struct page_list_head *head)
> +{
> +	struct page_info *prev = page_list_prev(next, head);
> +
> +    if ( !prev )
> +        page_list_add(new, head);
> +    else
> +        _page_list_add(new, prev, next);
> +}

This function looks to not be used anywhere.

Jan

