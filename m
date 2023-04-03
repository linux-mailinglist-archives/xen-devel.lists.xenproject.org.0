Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1676D4495
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 14:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517426.802716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJSv-0003yS-98; Mon, 03 Apr 2023 12:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517426.802716; Mon, 03 Apr 2023 12:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJSv-0003vw-5c; Mon, 03 Apr 2023 12:39:17 +0000
Received: by outflank-mailman (input) for mailman id 517426;
 Mon, 03 Apr 2023 12:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjJSt-0003vq-Bt
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 12:39:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89915a07-d21c-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 14:39:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7674.eurprd04.prod.outlook.com (2603:10a6:10:1f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 12:39:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 12:39:10 +0000
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
X-Inumbo-ID: 89915a07-d21c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWlLfxr7YGHGmlmKrz95obtczKkY1oeQ5/h0vLS+ODpFmYmzMlIAnadBrCtRoVmcKvChwGngargD02uF7H7234r7fh4D7xa4JZFWB/YWVpXEI/neAADufIsDcCFCLi402NFl/D5S9uAbJmgluSBKnPMcACkhcxkL+0fD5wu2Vo5yRkIMWy0r2pIwYDxukZBEwnF54iPAl8lpgG+hbXZ7LlG6tuqOeypuTPP3WhqR2kpdeM+G/DBgCVY/8jLNlCiVZI74MISO3pTyDJoTDswZqJxh55ioQxZjhKgqwbf/inCYjmGGe569+MU4hyohqenhhDZb1F+70rx+16DuDNNQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkNr5iDw5JV3J8qNnpUmRp1zna4a5Qb3MIEAArRhfSo=;
 b=cth6HxMJ4PI/GbDW7F48qzEVzyzVTE7tT9b4HASmsQyiX33kb0Hj1vQEUD5b7tYGOTz52BW6J1KKBPkANUKMfdxVu022QQ0Pma0QpqUfFZHxmtwAZFrEK9Zvja80Uwla/2Gh1E8YFpbPhdetVYnqRelrz+x2YCWgTdD+3I7yNsyiVZW0jeYn64px1N5y+yW9Y5LzpGihVLpX0l0StoiJ9U1wp06HCphwzvxvw/3Teirc5kUZcf675RRkmQXgHRkZk7dpflvIoHf+NBfaRqUC4LqLMgnkXIkaDmlpn1jQgX6stzwEW416CZbjfWLg6HlJIDoKxxejsR4usdr1dDPUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkNr5iDw5JV3J8qNnpUmRp1zna4a5Qb3MIEAArRhfSo=;
 b=ehROP3MTKk07w6eSJVVPBduwfGEuNn67O8JK2VxS2BSTIxfBgu1uKoJpIx+hzU7JUshvWxp9pu2hdmmrI5K/aC4gO6zOCxro1iyfsyf5K8wlF7q1cNDMy7KUMckYHy5dS/4ps1DjLbrihR6rFk9uIDyZ1lhXUITRiDpgcN4uaUMgd+EPc4Cxo2msgI3LKRIkT0cQ/9R6ljWuUScssLI7Mu6n5a/eA4gHtADzcY7nT5x7LwL04qnExtYmAg0Pd5AEZUpRC3KSerjjw6QHQgD7TiKH/bIxdWl8XzA5SadlzCazcOJ5rufIZkNv+9gd4kVMlGlHiAoihw0fOJ10k5qLhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d976d34-8a1e-95ad-3bc9-3cb704c1fae7@suse.com>
Date: Mon, 3 Apr 2023 14:39:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH] x86/p2m-pt: do type recalculations with p2m read lock
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403101449.93323-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230403101449.93323-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: cba0af35-addf-4185-71f7-08db34406c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w2SsTqvPKN2/J2avpwsiVBPF0e9qWqIqa7RcFEAAY6LbqU5D/qfzyQeH4qWfuQUkOmHWYtI1NLq2G++hklHqoJyyeqRByeTz2MYBpM7HL43O82nAhIYYIvd75PoIoUV3h29ISRVYjsAGgxj76GzW6AhhHRz4Z1WNeLIxiE2Re/dcZTFFBhWs40rL1vJdtDXj3M8tilhnWMj6a4FrW+/OcH7D+xP4pz2P0jVTwU84J/pVASnSY1ts6iKIxJv32B49zn40fueR+85DxJ3ZXBYt4XZ8qub2p530lfSoSxvpBtQrMbekshyiq4GNkMmObpzfBso1D3eBeoysPJRXl/+4/RbqOsPzNus/s12tyYSuemFFUpWX9U+uw6p9c/j31adnqhMlfOTra5jt8hpIntkhDhHnR6k0GLtF3BmasOrGWwthbZSPvG8ciJy3ZuUylK7wuuRW1ch75D2Pj85cYWUTfiUM37fy3bm67vU+38wGsbXfLU9DFgZ1lf+Zyb4G/uzF5baRFeKOhqtt23TbFpFERDDAhmrqya0rS2NXKkIzhKWTIwtwqqHV5ZLZekuH/Grat27IpMN0l1cNkZbXplsoQNxt1EczarqcM/3w2p7eEjnol8m6uOh9qAvsey2wj30kF70NdkAbena5mAPjocdA7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(38100700002)(5660300002)(31696002)(2616005)(54906003)(316002)(83380400001)(6486002)(186003)(478600001)(53546011)(86362001)(6512007)(26005)(6506007)(41300700001)(36756003)(4326008)(8676002)(6916009)(66476007)(8936002)(66556008)(66946007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGY3MWMzWXZaUzdZVUpkOFVhRnFidlFWSmJTdUMrWGllbkxidFhEd3pGWTlJ?=
 =?utf-8?B?WmN3eG1PSVdNbDZ5MUlSVGplTXBQdWFtNEZ1Q0N6VlNMWXM3bzd4NHg1VEQ4?=
 =?utf-8?B?dXpySkx0WVJLREtVY21TSlBWT1dxRFNvK0VrY21uUmxHaWJFaXNyeXRZN1JK?=
 =?utf-8?B?ZWhFcmxsMFN5K0VHcUZScWN5dVdCaC9QMlRGaGVYWXBmSXV1V2U5NjVzSXVH?=
 =?utf-8?B?RUU5M0RYZlJBd2xLOXBQNWp2N2NSNklQZ3BkM044RmRNaEFnU3ZPbllmNnFi?=
 =?utf-8?B?UXJFcnRMZ1VpR0ZUQnFGVjBjdEtvVlBsYkxDN2N2QkhmOGFPcDdPUlByVDZR?=
 =?utf-8?B?QXhYT2JnNFRqUUFqQWtDUGo5VEVnYnVJL0NLSmQxd1NDb2FvWTFxSnIyUDVv?=
 =?utf-8?B?a0lTSzgzaWo0OUFYS2FjL2RKaVdwZHI5eWhlbHp2bTQvZ3Y0Yi9BbmhSb1pu?=
 =?utf-8?B?Tmo2bkYzbmh0cDdmNHU2TUF0cVV3alNqNU1sVllmazZ2Mm0vQ0ZwaVU1ZFk1?=
 =?utf-8?B?MUVEUDVxdHBSaitmTFhCYnFaNWl5L3JETG0wYVRxRTBIRFEra1RnVjNaQzgy?=
 =?utf-8?B?aW1VZUNGSHJ4S1VOdkRwUkVzYjEyb1JxQ2RIbGxkZzJsVTVGd3Mrcm9MeTI3?=
 =?utf-8?B?NXZ3cmpNUFVJQjdZZE50TTJ4NWZxREZYQi9zN1A2SFdPbWcyRjZMQUdLM1Vl?=
 =?utf-8?B?Nk1HajlqZ1pNbVd3YytQcXdwNTlUZUEzOWUwTGVld1A1OGNRRDIxaVZwdXA2?=
 =?utf-8?B?RitXZm81K3lJNldFa0xHam5jVm9TZmw5MTd0Sy9XR3pkQkc5QmRUeTRST1lt?=
 =?utf-8?B?TjF3TWI3RUl1OCtsRVZYOTFzaGEydHlUK2tGVU83RXpkOUNDdjMxcWkrWU5G?=
 =?utf-8?B?VVhFcWVNNTgvSVlvVzR0cHZ1QlpDR1FHam84TEFyb29jZkVhaFNreW4zWlIr?=
 =?utf-8?B?b0xQRHpwckcreWd4N1o0TUc2UnMzSy9QTFk1SEN2bE1Ydk1xd3pUQ28ySTVl?=
 =?utf-8?B?anNxWStFVGdxUDhGZkRDeTR3WkNhNmJoSVZmdnJCWU04RytKUUNhRzVnVGlP?=
 =?utf-8?B?RlRucU8zZkdqRDIxT3lLekI2cE1KQWNnR05JdEhIU3hWK1FjMTl4MTlwQ0Z4?=
 =?utf-8?B?Y1FtUzYvbXIwWmljaTYyNHZqV0lQT0VSVFJJa1gxOVVVd1VYV1RreEZjbWNL?=
 =?utf-8?B?RHQwcTdxNFVIK01oOWUxQXVrdmdrU0dmQnd4UTE5RW9RYm91WTZWb0t6ZEk0?=
 =?utf-8?B?Q0dJcnNJRVFCVlloNEpHdGlIY3pyZDhyWlp6dXBCNkk4dWZ3c3p0by9yQTAz?=
 =?utf-8?B?Sm9tcWV6dXFoeW5VZUlGMGZmTzVUL2VLdVQzOWVWM05TTUlOVXR3ODhKNHdC?=
 =?utf-8?B?WWh4UERFL1ZRNU9TSkx3REhycE1sbVV5MHREMFVDOXlUMzkxbzFvQ2x2Y3hx?=
 =?utf-8?B?d3FQMzNpcTdkTXh4YkxVOFRMaHB5bU1OSm13aW43OE5pcmdnd1g2eTJUNyt5?=
 =?utf-8?B?Ulg1clFmaDlMTnVWY2YraC9uc2dvSURGQitycjZqUjFMTUM4TjZmZkRFbDhQ?=
 =?utf-8?B?U3dQWTVQenpLM2tNZUxiYk5nUkdvd2NEaFRkRmVLT2NZVFJVYTFQY0NlMGhX?=
 =?utf-8?B?eFRLdTZpclYwQTVKRDVvUkNPU2I1OTA4MWs2WmpqUDVOdEFaUGYxcjJWYmJy?=
 =?utf-8?B?UlJQMGFXdElOUmdzOTA2a081c0N1a1RxZzZ3NW9hZmFGUXl4RWZVT2RaOUxH?=
 =?utf-8?B?WFJiaVRTMGk1L3lJM0pMTDhMOFVSYTBndU5OUG52ZU03YzZ5bm90ZGZscTFx?=
 =?utf-8?B?c2FwUVlRcCs4bnhoMTNNZGxKU2RSamsySTNtcmRQL2p1bVFQZzJEbk5CMm9J?=
 =?utf-8?B?NnFiN1dUc3FqTWNTUzlMa2xIa0lMUmxSL2NGMXBsdTRhbU9QelN2RURrVWp1?=
 =?utf-8?B?a1NlVWIybXQ1WkdpaFF1cjN0a3kzOVhhVWJUTTdIZ05UenVlNWhjb29MclFs?=
 =?utf-8?B?YTJOczhBclRyWjZ5VUlSbXMwSk1DSmVaSUwzaWZ1MXRFNHRqYmZrTWcydXdQ?=
 =?utf-8?B?VURuSldLdkU4ajd1L0NBVEduTGNBS1RoVGYvNVV1Tm16Rjlpc3Rjay9MQjlC?=
 =?utf-8?Q?xw77x3Fe0MnfKYY3ETrVvgPfX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba0af35-addf-4185-71f7-08db34406c43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 12:39:10.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DplGsPZUMXXL/hlB9n1zPu0fTyYp7Nf5kJM20tTTfxjxx7HlFMw3YbXbWXQU05HQxvfvSaOFbIOMHpyc8XSrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7674

On 03.04.2023 12:14, Roger Pau Monne wrote:
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -486,9 +486,6 @@ static int cf_check do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>          p2m_type_t ot, nt;
>          unsigned long mask = ~0UL << (level * PAGETABLE_ORDER);
>  
> -        if ( !valid_recalc(l1, e) )
> -            P2M_DEBUG("bogus recalc leaf at d%d:%lx:%u\n",
> -                      p2m->domain->domain_id, gfn, level);
>          ot = p2m_flags_to_type(l1e_get_flags(e));
>          nt = p2m_recalc_type_range(true, ot, p2m, gfn & mask, gfn | ~mask);
>          if ( nt != ot )

I'm afraid I neither understand why you make this change, nor why you
then leave the other use of valid_recalc() in place.

> @@ -538,9 +535,9 @@ int p2m_pt_handle_deferred_changes(uint64_t gpa)
>       */
>      ASSERT(!altp2m_active(current->domain));
>  
> -    p2m_lock(p2m);
> +    p2m_read_lock(p2m);
>      rc = do_recalc(p2m, PFN_DOWN(gpa));
> -    p2m_unlock(p2m);
> +    p2m_read_unlock(p2m);
>  
>      return rc;
>  }

How can this be safe, when do_recalc() involves p2m_next_level(), which
may install new (intermediate) page tables?

Jan

