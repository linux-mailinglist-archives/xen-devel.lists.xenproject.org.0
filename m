Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB05E9C32
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 10:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411483.654419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjdQ-00058K-87; Mon, 26 Sep 2022 08:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411483.654419; Mon, 26 Sep 2022 08:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjdQ-00055A-5C; Mon, 26 Sep 2022 08:38:40 +0000
Received: by outflank-mailman (input) for mailman id 411483;
 Mon, 26 Sep 2022 08:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocjdO-000554-JQ
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 08:38:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150040.outbound.protection.outlook.com [40.107.15.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c94a5e0-3d76-11ed-9647-05401a9f4f97;
 Mon, 26 Sep 2022 10:38:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8248.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 08:38:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 08:38:35 +0000
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
X-Inumbo-ID: 9c94a5e0-3d76-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuNLff+fyeulQkHSajmKkQcun0+enQJYq3qT+q8yFibY6o9Pr8I8F3Bz+FzvReqK5bTSilv+TOd6EgrOThKZMZRoog8kHuJpX17T2jmRYPl/Y2dlcHzuUvGTxfmFvMU83lY1ekORE7f1B3gSysO1FXNBvBl519EwbLPpa5vEy6qTn32i2u4ZQJk6BnAhVKKNyGNCHgj5zRBoHRsxtI/dC6p66g1DHyV2y8nviGeVXoZcJSo7ZZPi+57apLjTEHdVVRFynCtH+rJJD5Ws7lZGYKAx2FWN/UzZ5EX7A+OyMg1Uo0YQjfB1YvWLnI29RmnnUwDAgPRP9Py/u6jhYi8eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L4m36y35zpCO6zDxpAOEsE3tVCWNopsMi11EoMNLHc=;
 b=idTnMKD6bylfO0xsvt+CudZogPmf5Zyohu90ENYfMKwLZwiQcKdVyNddD50ltdmn08QzdIflMU0QfwAYHyKQiOatuwjp6H9PdE3R81BpOMcvwN1RV1n6T3ReERysPVrnh1ejifwWHP5Sf2qCA/NBOwjqMKqZE53OsEFzxikoovTzKJonRrF2DS4DeTkSjZX2x3q3bu6pkX5JQAQhGJSyg/EwAKtFvj5Ub1FSDHqZtvlHVVLQtEDoL90o1dUL+tdTniwUq/ggkMffJs1Jm51QUQ/ppXJDN759Jc4j8PtNbBraUkr4t/8P9GOtt0EbU1IFvjQb+tGKyEzzIkyODtJOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L4m36y35zpCO6zDxpAOEsE3tVCWNopsMi11EoMNLHc=;
 b=Gs/5pjwrG+oddNeA4OhsDLCj2/cYAq0dZ8Ia0JCenBoR8ee3RN3G3fCqvrBTWAcNzENC7oIFuZqpOsQK/1kIpTLKYDdSZLbMcFp4vi3/CoAp49EKjVMFfQQV0/XIBDrHZNlTzFV2egp6ZwQEr+o9HYgo3bQpvgGI7XWsDNWxiuA/doXmCuovAxzFH6+DE9xj3rT9RgAK/MzbdwEOKsIgMEuWEofIA6KloPB660C0GuSjYugxbWkOA9EJj5dvMcucAZ6p9cp7sm2H0J5l9T7xkxnbIWSZhmJq8paBlq6Q2VQc/8/s2ynmAsMxA4lICcOgTs4uEgob+7whRsskPnHBzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8a8366f-e656-1628-63cd-d4e0b01dbf57@suse.com>
Date: Mon, 26 Sep 2022 10:38:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/ept: simplify detection of special pages for EMT
 calculation
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220923105648.12587-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220923105648.12587-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9c43f1-5cf9-4ac5-13da-08da9f9a8014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mCxyDfniH80K3GV3tySk85p7LNJ4lpYKyZ2NReV7G3UpCNXMeioa/lO1F5L81XQS0E8qF7qoVhSxuut2NSP5xlYoGoFLhfbRP7b/KkHrd5fdettKgpU+iRhoeS9uyZEqhjl7Vb0C81C2dtC1gPDMUiv3pYMvXfSivnPUUI72XsaXiv/jqvg7yAmnkgu3imIRC3u8ZSPAsxvo80GSPZ6sTOwzgjKN4t0YMqPHyZsHPm6TgREqYIX2Q3IRR1Mj3kuMPg9sEnWVJkBLoabj5fVELKpgFk0aspBr8mcndTP/4nyxV9v0zTGfidutnYcVFx9dPqyVaLWmA/ldAeZCfvb7TaSvYrYhPZYQRmCS1cs1H4j/TqHRkr6pHS82dGeM3rgY/Cf9mrdOEx9viMWc8c79JVzewl3wUdVRlcBLe63IDvrBlnIw7jkhcfWwWuUjvquZ+HgODgevMCOql27mTKiu5PvoXusGJScBAagDH09nW+1cyCBgNLk0y0P+RWiEQLEJS1uk67di2dpeOJG267ikzMZtPbwj1pXIQLgfLuvEQ2NZh51zpeU11OQCBe5Kbvh/8xJ8rpjYAvt8jlWx8u/LoHpiR5JER91+zAOQTHScoGM17aZdtWc3az8OfBDIVBhtG0tWVm/QUFMblkt5Nwn33Z90Bo9kmzI3rGGFeae3dX+D/4Bkw+aZ7e+5ERqVSD0HnbfROB+Kg+npix2eieUSaERjQycYw8027yzSVnWPo9bKduocjsmoKgPARj2bwdaKleRYZB8T0BpfP1ymA+wTwUDRTiRmxMragjnscWxuitw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(2616005)(5660300002)(53546011)(6506007)(41300700001)(86362001)(6666004)(8936002)(66946007)(4326008)(2906002)(31696002)(316002)(6916009)(54906003)(31686004)(6486002)(478600001)(26005)(186003)(6512007)(36756003)(83380400001)(38100700002)(66556008)(66476007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmRveEg2dzJoZzFaMW5mL21NQUFTSVUvK2pqcnFaUzlyYVJoamVGUzB1TGN3?=
 =?utf-8?B?QldOalVkdGRxeFgvVi9zNzlZcHpDTlFtYUR4WnpyRFlZTFhndnQ4S2MvM2lm?=
 =?utf-8?B?ZWRnS2s1QnhIMHhobUdaTEVUTzF3ODJxcEJPVm83T3ZxaCtha2N3Z0huVzBN?=
 =?utf-8?B?NmxZMkltQkpTL3l3c05HYi93ajZJcDloWEd2ZVlwM2FNRUE3MDBCVEtpUENy?=
 =?utf-8?B?U2VVU3YzZXg1MjluRG1lVFhmLzU4R2hwSjYwSzBWNnpIcmRWNzJmVlB4anlS?=
 =?utf-8?B?c1JvU3J6b3JaektMYXBRYlRpRnUxZFYrVDJkbnJRalN2amV0OUE3UnN0WWFz?=
 =?utf-8?B?ems0L3B5VzhOaWxYRk4wSW03MmhUWlZESnQ1N2FkN25rRkdzbVpGWHBlZU5k?=
 =?utf-8?B?QnJiN1BPUHhMRmloMlpkTXBwLzZkWWZBaWJ5UDJRdTlxR0dJVnJOSUJjN3U0?=
 =?utf-8?B?U3kra2VyMnlIa0xCOHVublRWamFZR0JuMDgyUmNOWExmMnNyWGVSVGt0ejU2?=
 =?utf-8?B?K0lkZTRJVnVqQ3hMUHE5TERpZGllaDJ5RUlzTVRoM2hNWDdva3ZwdHFiTzJN?=
 =?utf-8?B?eUpQNnhPRlVGcyt6ZnYyRGlFeWpIUFVBc0JMdkhVQVQ2ZGFvSVpNL0xIampz?=
 =?utf-8?B?OEwrcExhbkZGNzNQR0cwZmNRNS84UkZCNGRpUzBkS0JSZWp6VXB2c2NIb2FC?=
 =?utf-8?B?Mk1iVEs3enFNOU9pU2lDclB5a3FZYmJCMHFhRU44VFdRblhBTHp1RklUUFFG?=
 =?utf-8?B?ek1kL1JlLzZGTUlYSWFMTUlUTkZRRVFnSFZSeURYSlBLNHpaSDdHQy9wcGJp?=
 =?utf-8?B?RHp3WWx0NUxLMUdGWnVYNUMxRFhCRURwalVRTEJjRURpT2dvUFJ6cDdzeHFS?=
 =?utf-8?B?cUlzUFo2OEZQMGdqL3REUkE3L25qZVg1akwyRUkva2lFWTFGekUwdVdkc1FR?=
 =?utf-8?B?NmRsWkFrZmdyZTlqb3dTb3F5YnNSU2c0TjFEbnlaa1BUSGhTVjZDMWhNSFZ2?=
 =?utf-8?B?YnVyakRibDBzU0xOTFlKcGhpZy83VW5qazdCaFhGdDZ4WE1ydmoxM0JHUjFD?=
 =?utf-8?B?S2duS2RHaGx1aXBYQmc2dkszVnlLK05CUzNPS01paWNRek40elNlLzNFVEdG?=
 =?utf-8?B?NDRkeHBWOVd4Uk00aldaeVJaMXF2U01BYzFDYjRjYUJpdi9raHR4SUE5QlZQ?=
 =?utf-8?B?L2ZEcXRDdnZ0WmI0cVkvTStEUExuWWdlVzhmcXptZ05ieCtxaFlOSmY1djhn?=
 =?utf-8?B?Mnl4M2dyZytkR0E1TStLVGROSUFKZ1IwOUFUQlR0cGZUS25IOFA1dkxoaHNp?=
 =?utf-8?B?emJKbEdwWUNMTFNHWFdzZ0pRZ2hRZlZWaWQxdjJBNGFMejdrWnlYZGs0Vndq?=
 =?utf-8?B?Nkxwcit0WGNVTFgwb1JHazBpditpc1h0ZzlZckFFM25YbjE3Q0w2VXNEY3dP?=
 =?utf-8?B?dHFKTEwvUU9weUk1RnpWN3V6cGUraDhVVjF0MXJRbHlxSjJUUnJueEF6RFRu?=
 =?utf-8?B?bE9Wb3g1dDJueCt2K3hOQlRGRFdzb05sOU1LdGFDYXRFR1JiN29NRVkzN3pn?=
 =?utf-8?B?RjVrUUFQZ2Fqd1F5RVNDMXFpNFJ0QlJBZXpCbEpZaGYrd1F2V1B6ak9kbWI4?=
 =?utf-8?B?ZHdRaUdSMUc2ZUh3OFJqcVlZMHk0aUt3MHY5UGVzRm9vRnl3QUZMMFhUeW9p?=
 =?utf-8?B?cTdHU0dvTWhEeURQQkVaNVFrY3BRZjBlc1UzOUJZWGQ1blBPMEk1L2N5d0pO?=
 =?utf-8?B?U1VZSEtHSGVCT1Vqa2ZUVHRhYVJmWlNTczRnYkZPTndOTGk0VmV1NWtsQ1NN?=
 =?utf-8?B?SjRWRk9CVFJlSEZ0Si94OGNBdUdkQVg2cVhYdjdsOFlMSWFXVnJHOXA0TnU5?=
 =?utf-8?B?RHNDZldWTVhuU0k3Yi9Wem0rRFluQ1dSbkdwTThmRHNtTURkM3dCdDBJb2Q2?=
 =?utf-8?B?SkpYQVpHVnpuQ0tWS2ZianNhYnc3djJrQndrWW5kUzJYdW5SV2dwRHJDZTRr?=
 =?utf-8?B?SCtrT0lqTUgwamN0MmtBQklIZVhjbjRpQTZiYjMvT3F2Zk1KV3BLelNSMy9B?=
 =?utf-8?B?OFlyRVV6VW5jdC9ZNTJKNVF5WGJmZmFodjhPQ1pXNjFmNERBNVNtSVNiRDlW?=
 =?utf-8?Q?xvYNSeig/A1arZ/S7cAp66OMb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9c43f1-5cf9-4ac5-13da-08da9f9a8014
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 08:38:35.0019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsFkt2NaQZIrblCR+GC9Coj1Snjvp2DJBOmZMItH7uMcrCIkdN0fzkQaw5V7saWN3Q59UguqhGxhCpgcNTAZ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8248

On 23.09.2022 12:56, Roger Pau Monne wrote:
> The current way to detect whether a page handled to
> epte_get_entry_emt() is special and needs a forced write-back cache
> attribute involves iterating over all the smaller 4K pages for
> superpages.
> 
> Such loop consumes a high amount of CPU time for 1GiB pages (order
> 18): on a Xeon® Silver 4216 (Cascade Lake) at 2GHz this takes an
> average amount of time of 1.5ms.  Note that this figure just accounts
> for the is_special_page() loop, and not the whole code of
> epte_get_entry_emt().  Also the resolve_misconfig() operation that
> calls into epte_get_entry_emt() is done while holding the p2m lock in
> write (exclusive) mode, which blocks concurrent EPT_MISCONFIG faults
> and prevents most guest hypercalls for progressing due to the need to
> take the p2m lock in read mode to access any guest provided hypercall
> buffers.
> 
> Simplify the checking in epte_get_entry_emt() and remove the loop,
> assuming that there won't be superpages being only partially special.
> 
> So far we have no special superpages added to the guest p2m,

We may not be adding them as superpages, but what a guest makes of
the pages it is given access to for e.g. grant handling, or what Dom0
makes of e.g. the (per-CPU) trace buffers is unknown. And I guess
Dom0 ending up with a non-WB mapping of the trace buffers might
impact tracing quite a bit. I don't think we can build on guests not
making any such the subject of a large-range mapping attempt, which
might end up suitable for a superpage mapping (recall that rather
sooner than later we ought to finally re-combine suitable ranges of
contiguous 4k mappings into 2M ones, just like we [now] do in IOMMU
code).

Since for data structures like the ones named above 2M mappings
might be enough (i.e. there might be little "risk" of even needing to
go to 1G ones), could we maybe take a "middle" approach and check all
pages when order == 9, but use your approach for higher orders? The
to-be-added re-coalescing would then need to by taught to refuse re-
coalescing of such ranges to larger than 2M mappings, while still
at least allowing for 2M ones. (Special casing at that boundary is
going to be necessary also for shadow code, at the very least.) But
see also below as to caveats.

> and in
> any case the forcing of the write-back cache attribute is a courtesy
> to the guest to avoid such ranges being accessed as uncached when not
> really needed.  It's not acceptable for such assistance to tax the
> system so badly.

I agree we would better improve the situation, but I don't think we
can do so by ...

> @@ -518,26 +517,19 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
>          return MTRR_TYPE_UNCACHABLE;
>      }
>  
> -    if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
> -         !cache_flush_permitted(d) )
> +    if ( (type != p2m_mmio_direct && !is_iommu_enabled(d) &&
> +          !cache_flush_permitted(d)) ||
> +         /*
> +          * Assume the whole page to be special if the first 4K chunk is:
> +          * iterating over all possible 4K sub-pages for higher order pages is
> +          * too expensive.
> +          */
> +         is_special_page(mfn_to_page(mfn)) )

... building in assumptions like this one. The more that here you may
also produce too weak a memory type (think of a later page in the range
requiring a stronger-ordered memory type).

While it may not help much, ...

>      {
>          *ipat = true;
>          return MTRR_TYPE_WRBACK;
>      }
>  
> -    for ( special_pgs = i = 0; i < (1ul << order); i++ )
> -        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
> -            special_pgs++;
> -
> -    if ( special_pgs )
> -    {
> -        if ( special_pgs != (1ul << order) )
> -            return -1;
> -
> -        *ipat = true;
> -        return MTRR_TYPE_WRBACK;
> -    }

... this logic could be improved to at least bail from the loop once it's
clear that the "-1" return path will be taken. Improvements beyond that
would likely involve adding some data structure (rangeset?) to track
special pages.

Jan

