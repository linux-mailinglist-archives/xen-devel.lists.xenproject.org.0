Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB08653F7A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 12:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468486.727597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8K3f-0005J3-GF; Thu, 22 Dec 2022 11:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468486.727597; Thu, 22 Dec 2022 11:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8K3f-0005G3-CS; Thu, 22 Dec 2022 11:48:19 +0000
Received: by outflank-mailman (input) for mailman id 468486;
 Thu, 22 Dec 2022 11:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8K3e-0005Fx-1d
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 11:48:18 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85590840-81ee-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 12:48:16 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PA4PR04MB7646.eurprd04.prod.outlook.com (2603:10a6:102:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 11:48:14 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 11:48:13 +0000
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
X-Inumbo-ID: 85590840-81ee-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrV0gVuCVWUWYkrRVQj8rX2DeCje3diFpbYQq541LMjj+YPmQ8nwlYw/UYkykXBUC5PLKBizh/acqeXNO4ZhGxKYtjqOj7l2x7A1EItHFQe0LtL5uarZvbNZ5xl/LkciqrabKE2j5vwmjgTUgILKS6MjcdcBpGzmUYH8aHyibAMQu+fKG8ZF1V+0CpujIMDc+ceUoXqZTJBSAk35DxSBuKlpouLnf2jYWC0d7O8GHZQwvyUsXh4b/eSpy+w5Fnv88F3n47AyEMDSw48/UTRWbYcPvsAGbURt/CX/6xUEA15Y23lWi3LmPgbOFth9LOj6hBrfKHtIw9Q2SbZTNuzJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtIJ8y7ibX5utN4VuvApPOMtVFRvcNct+ysXOvcUArA=;
 b=WYGi8+u/ZWWzQ8GIkKmv3uAI7LTVJFeGJOZUTfP/u1mOqmk2eoRi6OFfJ6yBggBUFW129gKtsoa0NGoKwEeDMFnF4x3PI2j41LpQtwU1sjVwzpMPEDZiNYsnA43/UcRTJIMlnQDnFwnzFLW/WdxeV9FB7DiTNMrxZLcGK4b8/dDdlvjcNH56ydfRsdz9JuQ44CsV2LxE9tnXfbeoUD+QfTfPyJIYKoCOkYsJ9iIPGzgAwQjxgvkaK9x2YhSaeMNETCmKTYdS6tcmlNgxQcoYevAS2NoYCue1a8erIBxP3IkTs/VBzMfY93dEboWl1Sv77io8T13YqnVouCOR5mJ2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtIJ8y7ibX5utN4VuvApPOMtVFRvcNct+ysXOvcUArA=;
 b=LyeJYEu93nl/J0mFmSKylLkSGVk48PkUAYfJkwahAhTa/0SlmqO6GAWaCO5hILgpM8is+3gHazKt/OBwpgW2p0YNhnNBkHQBOSOCeFoibs37xGDuTkMZenqjKkvV/S0ZXSL+95NJDv75aX8sW+duf/6muJE2vLonidS6AQ5cwotK35BDHAZ9tkv51q6D4HHdXazp7wzVJvsV0PqpGW+TViMKeMm4O6WasFaZgUVntm5eYHVgLkOjg1zqxh3M9XI650Aot/a3U7FzCot4VLO15FV1x1aAmPz2fj4bnBcammtt4hMWqhlsFe55oi9ZHcL/siScbWVWWL0dhO43SKfN5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bd1de52-9f3b-6654-dbda-37001fce31d7@suse.com>
Date: Thu, 22 Dec 2022 12:48:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 08/22] x86/pv: rewrite how building PV dom0 handles
 domheap mappings
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-9-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-9-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6e85f3-238d-46e5-dd95-08dae412685e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cUMmj3lX5v+3Gi8XrGaWhEvUlCXn5/YFpumPX3uAV6NhKo9HqYn6mXm5BrQZ1XKBfp++aQ5QXa1jPBJYD5iLP/KnyeaVScc8Ec8b1oQ8X5gA4a/vIfMEqkRjYGVOgv9Oeg+RuhqJZkwMtCpNomCdf+Uit538Nl7nDFagov0oaaXqwj8ll0igSHWojd6jeKjaBS7aDnN1rziT6fOnRYDClQG6cA00cmSEIXI9kL5mOQ+b04bvnvEMqYYysf0B+h/Axn1pJHvxdwzCuJI5H9QJu8OY1/VZt3zRlORvzz4Tuxly1PRRhpucDcPYn0yiyRVVluRFpRHtMTqR9+bE8yRkyV9movMMeCCS83ZKKqK+rvTOahRMUD9lskNzCPFyB2FpQOVMl2v+I4EdOvGFl0/76FG/jQyg3javmnqYuUPoU7qSwxnDvSGEyA7WyzwwYRbygwDTniDjJy3ThBxQNcY9IAZxFPVBdITplXuRhwDsgHqZaJysDvepd4Htp0T0tzqQ4feF51NR9c4Py/bDmxoLAilWqzI1nS+OcJR3w5lMofmsATj2TEM4qfsbWzWetklCdrHOCbjvCi3BV2URjffumhY7Eh4fM4Qb10kO1wyVxQHN8aX+c4rhSOuujoYgzABs3fgCYfrDdoqUXI6KJ3np6WlE1z2UdOntChowwxtD1sTYRRaRBZGl/x/3Q58Ky7ZMHT1AjXzOZ3Usw4VuprnqqjnFbuQO52eeDXHCdFAliX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199015)(6916009)(54906003)(38100700002)(6486002)(478600001)(2906002)(31686004)(316002)(31696002)(8936002)(66556008)(2616005)(36756003)(66476007)(66946007)(86362001)(4326008)(8676002)(186003)(26005)(5660300002)(6512007)(41300700001)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjlKaHNkbnExZmtsUDBtSjNnZ1lNYytHTURkSktVMWt4eUU5RUNKVHlneEtw?=
 =?utf-8?B?L1AyaEhKZDI4KzNYMTFGYzlxa3BRYUE2S0hDdHY5RFVyLytLK2FObC80UmRh?=
 =?utf-8?B?MVFjcUlxUVp2aGp3SWFwTDRvMWpxNjJ4ZE40cUZqSFA5ZjRoL2VralJXb0Q1?=
 =?utf-8?B?cVkwdnIyQmlwUjRvSS9UWEo2aGNuWkdtc1NEazhKYTMrbDRyYkVpSk9DQjdw?=
 =?utf-8?B?OVQ3RE1WajkzRjlNNmFUS1V2Z1o1cW1ESzJnSzZDZmp1U3FuQzVxV1lKeVVm?=
 =?utf-8?B?Vy9KMzlNZ1pFMHdhRzhjUFRZaFZ0OUxDZGJVS1FSTHBDdklxZEc2b0o4ZDRx?=
 =?utf-8?B?ZDNFMGUzVjd0MEN6RWg3QVZPTkc5Y1BvRzUwUVo3U3lYekhySldOR1dQaWpt?=
 =?utf-8?B?U0xKYTVnVU9XSjlEYVBQemRsT2lKcEk1TTA4RE02Y2tJWjRrcEJWU2dNQU12?=
 =?utf-8?B?Y1ZacjB2dkNxK2dFTVM3RmhPY2hBTXZGeFZLU2dtWk1wbzlJbktuT3hJN3Rk?=
 =?utf-8?B?ZlJVVXZGemhaREFsdC80alBFTVRlOUp6NjlSWUY5OVlkZDhkNlBjWHAraWp6?=
 =?utf-8?B?Zzhsd01WU0JVWVQ0MnRRNUFVc1YwN0pQMmdoME1JODdjb0tBdjVhNnB5SUZO?=
 =?utf-8?B?NXJBT0RlcHhmZXpvdDA5bFlsQmlsRGc0aDJBMDJRSFhMTUhkRklEcTYvSUc4?=
 =?utf-8?B?bkdUa1VLV0JsR0pxWFVYVkFXU05mTkkzaTNWeFI3NmttSERHb084Sk1CdWNH?=
 =?utf-8?B?eGpmZEg3c0JqWC9uZTBGY0JQOVhwSno4YlEvV1dHejl5bWNZbGNHUEJ5a2Fq?=
 =?utf-8?B?ckRnUTdiTmd1QUJVMEFWQ0ZtNDZmbTBYWW5qb2tLNEgxOWYrZHo4a2Q2Qmtv?=
 =?utf-8?B?WkIwaklhaGYyMmpXOUhNL0d3NnlGYVBmbWxNaE12YjhRdGdFaE1iak1mZUIz?=
 =?utf-8?B?NStuck1TSDhscUtWNis5eUdqZ2NuU2Z1N0tNOElzd1diTWlWMG94L3lMWUpV?=
 =?utf-8?B?T2hZeWlyOUx1alFFNG1qNEJ0dlBmczFoSkljOXY5ZThVaWl1V0pwVlh3WXZK?=
 =?utf-8?B?ZTNRdEVyMlRrNG9odUtyTUFXcy9BWWNDa1BBSkZSUHM4TGpKS05GeVFCNUw1?=
 =?utf-8?B?Q3VqZ0VaTjIvQU1wM1YvWG5BZnB6ZFhERzRyK0VIc21jZnhTVWVFOXZteE0y?=
 =?utf-8?B?V2wrdHZWcXZTK2dxTit1SGlFeXVpU3JkbUJRR1J3QTZVdExlU0lUTlBFeUcv?=
 =?utf-8?B?WkErWlUrSGdTY3J2ZEY1eWo0cTZqYzB5Nk9NUUljZStOLzl2Y3B0TzEwOUdo?=
 =?utf-8?B?bk5sVWNmZ2txWVlDREdlUnpOZGplVmJFODloYm8wUkljU3B1SExnL21YL0Fa?=
 =?utf-8?B?MWhqNUNkUncvb1RuZUVpWEpVcG1kNTd1RzZ3b0xRZGFsQndJTTRCRW9TaHR6?=
 =?utf-8?B?R2F0cnRRRld6T0d2YTZkY1NhVkoxQS94YkNkMTdkeGhlWFBWemJwWFN6OGZm?=
 =?utf-8?B?ckFXQTNMc3djK0dFZnFOdU9xV1JOZm1PZWlVUWJDKzhEKytTdTlzNHJBVEZT?=
 =?utf-8?B?NnozSTIwQ3Vkc1lMaE1mdkJiUjA0bWhBRFp1NkNza3dmS2NkMWJGZWszQ2Fv?=
 =?utf-8?B?WGY1VlVCcTEydi9FZXBuWVRxZVFuc0pNSDBYeVhzMkllTi9TcS9VcExxaXp4?=
 =?utf-8?B?NUI0TzhsRWRaWHJhWFQwUXdNTSt4d3JvYzVtVkF6Z05mbUd4N1Naa1F2enFL?=
 =?utf-8?B?cmZoL3pJY1N3ZVlZbVhmdndwVHpXTUF4cERDOFlsWWdnNjFlZWg2aVRWamla?=
 =?utf-8?B?RndNclZaZTl5eTBXNFZnTXlhazBCMzFnL1VJNDduanJCSGRXMm1jYm4wOHYz?=
 =?utf-8?B?c29ZcHdWc3FmM2o3cko1NWgxZnRmK2lHaGNibjVLOGp1Rnd5REdMR1dVbUVS?=
 =?utf-8?B?WXNhYmZ1aXZTcEp6U29LcnRMTWRjUmNFWnBYUW4wb2RLN1hQR3YxZExUYWVw?=
 =?utf-8?B?N3Q2bnJOdEd3VThrc3NOdEp2a2Zud3EzZTRwK3lGY1h1T0xYWmRYQUJMYWto?=
 =?utf-8?B?TWFtVVZtYW1ZTFFQczg5Rmw4YXlBL0tSNHovblJoYTB4dHFpbVNQYTFod3Qz?=
 =?utf-8?Q?Txo4GSsL4DE2mSAeOtuV9ozRe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6e85f3-238d-46e5-dd95-08dae412685e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:48:13.9032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kp7FnG7wsPouyyJMj/FUEXJj1tu7mAvJ1sBRlJ4kjMqu0J5pczxaRupLjvPSAQrC7mbP71gFcx3I/58Sjc+xTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Building a PV dom0 is allocating from the domheap but uses it like the
> xenheap. This is clearly wrong. Fix.

"Clearly wrong" would mean there's a bug here, at lest under certain
conditions. But there isn't: Even on huge systems, due to running on
idle page tables, all memory is mapped at present.

> @@ -711,22 +715,32 @@ int __init dom0_construct_pv(struct domain *d,
>          v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
>      }
>  
> +#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
> +do {                                                    \
> +    UNMAP_DOMAIN_PAGE(virt_var);                        \

Not much point using the macro when ...

> +    mfn_var = maddr_to_mfn(maddr);                      \
> +    maddr += PAGE_SIZE;                                 \
> +    virt_var = map_domain_page(mfn_var);                \

... the variable gets reset again to non-NULL unconditionally right
away.

> +} while ( false )

This being a local macro and all use sites passing mpt_alloc as the
last argument, I think that parameter wants dropping, which would
improve readability.

> @@ -792,9 +808,9 @@ int __init dom0_construct_pv(struct domain *d,
>              if ( !l3e_get_intpte(*l3tab) )
>              {
>                  maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
> -                l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
> -                clear_page(l2tab);
> -                *l3tab = l3e_from_paddr(__pa(l2tab), L3_PROT);
> +                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
> +                clear_page(l2start);
> +                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);

The l2start you map on the last iteration here can be re-used ...

> @@ -805,9 +821,17 @@ int __init dom0_construct_pv(struct domain *d,
>          unmap_domain_page(l2t);
>      }

... in the code the tail of which is visible here, eliminating a
redundant map/unmap pair.

> @@ -977,8 +1001,12 @@ int __init dom0_construct_pv(struct domain *d,
>       * !CONFIG_VIDEO case so the logic here can be simplified.
>       */
>      if ( pv_shim )
> +    {
> +        l4start = map_domain_page(l4start_mfn);
>          pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
>                            vphysmap_start, si);
> +        UNMAP_DOMAIN_PAGE(l4start);
> +    }

The, at the first glance, redundant re-mapping of the L4 table here could
do with explaining in the description. However, I further wonder in how
far in shim mode eliminating the direct map is actually useful. Which is
to say that I question the need for this change in the first place. Or
wait - isn't this (unlike the rest of this patch) actually a bug fix? At
this point we're on the domain's page tables, which may not cover the
page the L4 is allocated at (if a truly huge shim was configured). So I
guess the change is needed but wants breaking out, allowing to at least
consider whether to backport it.

Jan

