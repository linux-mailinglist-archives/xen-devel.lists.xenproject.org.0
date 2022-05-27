Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E9535A99
	for <lists+xen-devel@lfdr.de>; Fri, 27 May 2022 09:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337851.562560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUaq-00088N-RQ; Fri, 27 May 2022 07:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337851.562560; Fri, 27 May 2022 07:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuUaq-00085h-OA; Fri, 27 May 2022 07:41:08 +0000
Received: by outflank-mailman (input) for mailman id 337851;
 Fri, 27 May 2022 07:41:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuUao-00085b-Lh
 for xen-devel@lists.xenproject.org; Fri, 27 May 2022 07:41:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bfc308f-dd90-11ec-837f-e5687231ffcc;
 Fri, 27 May 2022 09:41:03 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-AcT_CfHVMpmY7Fs2hV4vlQ-1; Fri, 27 May 2022 09:41:00 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2868.eurprd04.prod.outlook.com (2603:10a6:203:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 07:40:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 07:40:58 +0000
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
X-Inumbo-ID: 5bfc308f-dd90-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653637262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Db3R6GsmcTxUumRvQ+t3EVrPw3UPI0xvjpYk2TTyieI=;
	b=hxmp36E5JmDOGaLvYkiId9Mi1DNZRZD33esmRg3FVRptZb1WU2pnovu6pImw9pgyatHSiy
	QD96F2FxsJ47pVXO4/9Dt47lR0mWjcQrVV6pmvG6xQNEyUpwNVNC/hSaLn412YDaTIPzyw
	0SZ7oPscYmjGicV85/s1YahMGJi6FQg=
X-MC-Unique: AcT_CfHVMpmY7Fs2hV4vlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dP0jRmOuC5laHJi1vHMSzEDpM54wPXeEC1ZcuK5MP8NiuaH0fo38caZhGHSPV42QdztuYnm1Leqrquai3LiFBXj7sZWg+mCuV5/kS0LUO0prXdxySQHGltTvGH/oA6r3gTLFt0lRY+k0rKRrYSwiXMtkZnKZvaKbqmnsTY69lbrI6tGV9WsvEP0+sCH1tUSHpSzxPtv4hAu2SGMbqfscJRGTT6/7LYSy8Jy2A+Z6w93pcIjU4NYPm6sOs9bs6OedVLywlMKjhw+trxhKSzO/PxE1rZbZY+vwQNTwQZ/qbhmL3/AQ0TrnbDmQ9P5Klbbkom0S2chNUPyusFqOKaXjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3yddbvIOnhvFgG3s8kT9/LJSggHOBAOP5aOkDuNh54=;
 b=C2ykw9p3kJGR+IIhjgRuyNcJYn9/HnkKJ4t4PqJPOu96VkXVirG0xJkYrgEl5DOip53gVeONKHhNNc1UiDvdE3uPn1ucSnKgJN0vCEqQbDJ8H0uQPguhyqhtmalUq1HqvOrRyXOwGoa4j2NXDYe4qXfDZIDHyWkynWGAWnGx6LlZ1wAMKoQ06aO64obxcVcrULgwKDJ+ciP3iNq8lFG4MIh8EvvyKR7sJutHaegdyoxBaFaqFNOwckrrkznl/dnjIkBqyFyr6A7cPYpyfRS1fGWSx0D7t88Mivo/xJsGpRCMb8J7/C0TEju1W1icUdpi86i3oj26JNlzRd0YDtCjhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfe87358-db9d-7c9e-d691-aee33f07bae7@suse.com>
Date: Fri, 27 May 2022 09:40:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 16/21] VT-d: free all-empty page tables
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
 <Ynp2+faOjZguAUVP@Air-de-Roger>
 <597c3630-b69f-e885-bb08-a52d2c6e7f92@suse.com>
 <Yod3vjK44nfgvw8f@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yod3vjK44nfgvw8f@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fe8483b-bd84-41ca-7c45-08da3fb43d50
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2868:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB2868126469114085518F6FE1B3D89@AM5PR0402MB2868.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d3BIyq7ttsVWlLgmVXBsTgXF5rOFMVXdVU9NIc7XCzV9dhEP996RfoncJw22G2QjBVgiupK3VN4BHxH57pMLFmAykBwY5g0aMD3o5xpQJFxwM82yRBMbOcpzKl4lZCgLtBtbC76TnXkcctxU8Mx3skzD4Jk4Q4L5ytDS4c2qMbMhvqSKdnSaGBTZiYDkx6GIe6XWPv5oiL+zfRuG6E8s6GtSJvFsYNQ9nuUScdeE09pn9x5b1GYqBSvxva66QwzG5C38LmNaUdHOVN9kB+UvAJIcTDVV5DfLPLuHLmLGNC+BHgc9iBwSmX2YZf36fhL14rXxWG8wL0EdvuVqc76wJi4MFZBdIWofXfpzugeeX1qn3kh5wbPLrPNOYhZwNLuKDwtzvCLkt0+4wAUBGB8smRLTwE9WXoIeclNMHJmgOksf36uD6tg537PGAV6L0YBZFi5IYzCtckz+6DwD9uZQoi3TdqLnr4EG8sX6V7jk91FUeZw0ziqMef3yc4dFlLE0QPkQ5q13jzQSw6H8NgphcxBWyh7o/XXxzyAXh4t4LRsvNLXds427dsQrp/TEi6y4GJhgEEqCArEvf2JsFyCmBw/lvrqY6eGmHsxIMbSODsiDS+/9JKM0P8s/KL3VdCn+LSetKdZ65JC8Gw1K5QLuQBi52Rk/ZXFfPncKJFk+qc/OTIONuglEL7cifrDwPZFXGTpMcF22J14ZEJWWlrMxLoc88dmjBDkJp5ZMTz7hR24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(316002)(8676002)(54906003)(6916009)(5660300002)(2906002)(31696002)(4326008)(86362001)(83380400001)(31686004)(66556008)(66946007)(6486002)(66476007)(6506007)(6512007)(36756003)(186003)(53546011)(26005)(2616005)(508600001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uUW71NMt1p0wa+PQDxonjWKpf546PgIoG5yn3zm2w0UmCJna9Y4naskJwOJL?=
 =?us-ascii?Q?bUTHG+A9GHW4Ns0wEwvpKNGGyr5NmkUklOEV3aCjJScnWFGmr2DCL9OkY6al?=
 =?us-ascii?Q?9IxFr0NqTbvVDbWZhfptblcLioZb93ZqfGspIhCVMxTLbVzxTEdcTWZ8KfZT?=
 =?us-ascii?Q?U8FPL81/d9hW8DNWNJifbeuER93ACpNdH1IdvzkcsFjwzExitRiISPL4UmsA?=
 =?us-ascii?Q?FgvEckLfNWeWqvA0vIEuF7Kse5qcjDjwozmLC9lIm7cSQQ6WJ+W8bhPD6YYX?=
 =?us-ascii?Q?qf/rON0rRe+l46fraynkOrrQq8jtxRTfKR0e4Gy80GDyT5A1xmXjlZr6iyRp?=
 =?us-ascii?Q?RbiPfMrYMJCH54+dVDuybcM5pr7Qs2z1v5oQlDDB98a0zatnrity28pGEc1X?=
 =?us-ascii?Q?sLqB4ZWe58N0zqKb5G464lLBoSc57XjTOaOgnQwlucuRcxtbNukMvSowzWxv?=
 =?us-ascii?Q?NFT2tbYVSVTWQAwiDGonMMkA809+mC6x5cLKTEahdp3d6sVX2c+JS7jqPcr2?=
 =?us-ascii?Q?iHnGieDXDEBXNInlkDbIQcGCYYnC7t7tiBKp4uGw8oTdo7gjIkai9ZiBEgrw?=
 =?us-ascii?Q?0QCVqYQQWuclqWVCSaQ8ukjEscRGOBMO4TC8DtBAqJ4Dev30qHMq3VqllwpF?=
 =?us-ascii?Q?qnKsvRfbtIeXhELdLxrgDK+MnMiaLoRWjf18QQfSFTDR8ybdFIjsRyaSYp2J?=
 =?us-ascii?Q?Tuzy6rCkdXRw1kxbU/M5vZk+dWGKUszW5224EcrDXNnLRN0M2MhbvT3H5gtS?=
 =?us-ascii?Q?yfmwjNTC9G2AkpmU4Z06h+kbNO7hTQSy77olSSWpAMGg3joAY/WPEfBCOnMs?=
 =?us-ascii?Q?v4W6fC5lc17CnPRD8qVw7Wr4FxILt6WUh1h+wNE3j3Ktoy7UXvPqqJMxEfy9?=
 =?us-ascii?Q?XLyFQlYJRQoNz9zAuP8mP1XW6A860aWd/O4wjunHrKO6vsOJhx7bfcf7PjOz?=
 =?us-ascii?Q?X+2sMzl5Cy6wmlrFzrFxcF+aPNraWk/hS4eOQvomwHFn5u1DE3XA5//loeCH?=
 =?us-ascii?Q?OcDbXVmsKwsXjuntnbsdaRF3GKdKoE0A8E0tq+h3bcb53S6+LXDbuCx832pK?=
 =?us-ascii?Q?894FkV5jbjxruTNwNLoJxfYYNxO6MJwBoxehbGgmxKdpwyw5AdLrBKMhqjQO?=
 =?us-ascii?Q?M9PmOt/v7NR46gNB4/Y0DRs2X6t8m5bFcD1XJ8HHIcVSoK4xh/hjFtIoBOiL?=
 =?us-ascii?Q?gSOxWikGIKlzgjhmmeywARri2ZBZto8R3P0dk9Z1Jl/P8DT2iobFikB8om2C?=
 =?us-ascii?Q?jb97fY9Yu5wdIlpiaqUL89fn2ja6gi/gX0W5zaA3GKjbB3srHWgRxvpJWqGS?=
 =?us-ascii?Q?0Q9cuWj7380pkPGu+Rp/Ij/qNiM+a5WF5eZx2vxN6WuU8fkzQcbuBjttFOqC?=
 =?us-ascii?Q?WOPIuVX7EzvnLkAws1LsxzA/a9hxfEVheHK8xWuAQQV6bGHNc9EKECoycVYZ?=
 =?us-ascii?Q?wkmNzOKZMOuVZOK/+Nu7edknd92V9Hc2ss69gHzmxBQaBaXPvYWGYlkXeo6+?=
 =?us-ascii?Q?odO3M4Ae0C8ojRD5BZ/zcEhrvjrxwMgw3g9dyCZJ7iCqE6X+fLzd7IsDLU7s?=
 =?us-ascii?Q?i02lNsrZZ00RepLmokLg5n5bO7t7lR1GioptQufEuUsG0zh7Mkz4Kf0ka8bC?=
 =?us-ascii?Q?R/29aw5IEOjKeXdYstLr7s8wAJp6QZjFdi+Oinviosj5chLEOCJKH775k0ou?=
 =?us-ascii?Q?Oczj7abqZanZy8UYOQbvpOPtoSJlJGLGfdV3a6bR6sBTvgAiirHgkZJMhMTe?=
 =?us-ascii?Q?RfuQIjmgqQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe8483b-bd84-41ca-7c45-08da3fb43d50
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 07:40:58.3256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFeLOQyKK3CEanawRvZLUseZ+dBw4uwNsHSIVLaVlTeSuh9GgCxUfDrl9P5l85RlkjF9y4f1tfmDo0cbo7UrLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2868

On 20.05.2022 13:13, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 18, 2022 at 12:26:03PM +0200, Jan Beulich wrote:
>> On 10.05.2022 16:30, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Apr 25, 2022 at 10:42:50AM +0200, Jan Beulich wrote:
>>>> @@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
>>>> =20
>>>>      old =3D *pte;
>>>>      dma_clear_pte(*pte);
>>>> +    iommu_sync_cache(pte, sizeof(*pte));
>>>> +
>>>> +    while ( pt_update_contig_markers(&page->val,
>>>> +                                     address_level_offset(addr, level=
),
>>>> +                                     level, PTE_kind_null) &&
>>>> +            ++level < min_pt_levels )
>>>> +    {
>>>> +        struct page_info *pg =3D maddr_to_page(pg_maddr);
>>>> +
>>>> +        unmap_vtd_domain_page(page);
>>>> +
>>>> +        pg_maddr =3D addr_to_dma_page_maddr(domain, addr, level, flus=
h_flags,
>>>> +                                          false);
>>>> +        BUG_ON(pg_maddr < PAGE_SIZE);
>>>> +
>>>> +        page =3D map_vtd_domain_page(pg_maddr);
>>>> +        pte =3D &page[address_level_offset(addr, level)];
>>>> +        dma_clear_pte(*pte);
>>>> +        iommu_sync_cache(pte, sizeof(*pte));
>>>> +
>>>> +        *flush_flags |=3D IOMMU_FLUSHF_all;
>>>> +        iommu_queue_free_pgtable(hd, pg);
>>>> +    }
>>>
>>> I think I'm setting myself for trouble, but do we need to sync cache
>>> the lower lever entries if higher level ones are to be changed.
>>>
>>> IOW, would it be fine to just flush the highest level modified PTE?
>>> As the lower lever ones won't be reachable anyway.
>>
>> I definitely want to err on the safe side here. If later we can
>> prove that some cache flush is unneeded, I'd be happy to see it
>> go away.
>=20
> Hm, so it's not only about adding more cache flushes, but moving them
> inside of the locked region: previously the only cache flush was done
> outside of the locked region.
>=20
> I guess I can't convince myself why we would need to flush cache of
> entries that are to be removed, and that also point to pages scheduled
> to be freed.

As previously said - with a series like this I wanted to strictly be
on the safe side, maintaining the pre-existing pattern of all
modifications of live tables being accompanied by a flush (if flushes
are needed in the first place, of course). As to moving flushes into
the locked region, I don't view this as a problem, seeing in
particular that elsewhere we already have flushes with the lock held
(at the very least the _full page_ one in addr_to_dma_page_maddr(),
but also e.g. in intel_iommu_map_page(), where it could be easily
moved past the unlock).

If you (continue to) think that breaking the present pattern isn't
going to misguide future changes, I can certainly drop these not
really necessary flushes. Otoh I was actually considering to,
subsequently, integrate the flushes into e.g. dma_clear_pte() to
make it virtually impossible to break that pattern. This would
imply that all page table related flushes would then occur with the
lock held.

(I won't separately reply to the similar topic on patch 18.)

>>>> @@ -2182,8 +2210,21 @@ static int __must_check cf_check intel_i
>>>>      }
>>>> =20
>>>>      *pte =3D new;
>>>> -
>>>>      iommu_sync_cache(pte, sizeof(struct dma_pte));
>>>> +
>>>> +    /*
>>>> +     * While the (ab)use of PTE_kind_table here allows to save some w=
ork in
>>>> +     * the function, the main motivation for it is that it avoids a s=
o far
>>>> +     * unexplained hang during boot (while preparing Dom0) on a Westm=
ere
>>>> +     * based laptop.
>>>> +     */
>>>> +    pt_update_contig_markers(&page->val,
>>>> +                             address_level_offset(dfn_to_daddr(dfn), =
level),
>>>> +                             level,
>>>> +                             (hd->platform_ops->page_sizes &
>>>> +                              (1UL << level_to_offset_bits(level + 1)=
)
>>>> +                              ? PTE_kind_leaf : PTE_kind_table));
>>>
>>> So this works because on what we believe to be affected models the
>>> only supported page sizes are 4K?
>>
>> Yes.
>>
>>> Do we want to do the same with AMD if we don't allow 512G super pages?
>>
>> Why? They don't have a similar flaw.
>=20
> So the question was mostly whether we should also avoid the
> pt_update_contig_markers for 1G entries, because we won't coalesce
> them into a 512G anyway.  IOW avoid the overhead of updating the
> contig markers if we know that the resulting super-page is not
> supported by ->page_sizes.

As the comment says, I consider this at least partly an abuse of
PTE_kind_table, so I'm wary of extending this to AMD. But if you
continue to think it's worth it, I could certainly do so there as
well.

Jan


