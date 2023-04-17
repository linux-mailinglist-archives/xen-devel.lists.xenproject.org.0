Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C376E449C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521902.810907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLgE-0007tj-9n; Mon, 17 Apr 2023 10:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521902.810907; Mon, 17 Apr 2023 10:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLgE-0007rR-73; Mon, 17 Apr 2023 10:01:50 +0000
Received: by outflank-mailman (input) for mailman id 521902;
 Mon, 17 Apr 2023 10:01:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poLgD-0007rL-C7
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:01:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe16::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddafdee3-dd06-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 12:01:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8776.eurprd04.prod.outlook.com (2603:10a6:10:2e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:01:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:01:43 +0000
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
X-Inumbo-ID: ddafdee3-dd06-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TD0yQyxUDGwNrcVDSK/pOJvodLJZP84HMgwMSwXzyPKf7Ule67C/Lxj//6G+0LEOZKGXeDIp6NIaxnAdlGR/jBB9qpcPTBnmyUkkHH3Vx3snHX+8GinpKf6d3SQel2RYX42go0rchcVjLAjCfERfe7gzAp0EJKE9wBMDa23LjYuLHbdXyPReJavwi3mvKf+dfN83uQ69u7OB2lVjmYA8JbrOcMWDI8+GhkB/Y5dKUMopVh4Z7AW0KCSmYBe2sZ8kzK+VT0M9ZsgLbNWdokCfuP2dPQv9ghrqwq1cydU8t2YihfvFCAeyjUusBzDfU2Zm78jhA2/n9UwGGKBC7bmVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/ZIoQayojoYWFXGq/8OJUWDdaphhpR+SRQz0jfU/v0=;
 b=Z8z+Bar7NuaMqR6vwm6Uzl3gn2E+rCKU4EuoobGp4p+u1A9sLkRdSUe29+jQ1ph/gLVfc/7uLb6w3JThaXF66JobHqvemCeFtDyLqFzd0kL3a7nsjyXgk6QbWLsIXX2URak32K+1zLQ5sA88zPHXHb7tovshOSLqf7yu6oTEhuMgySpkenTs9gtT+V38IbXuPKR8V2g5fcJ/zKpbiJwSd5Fb0EUTQu3cZAxjntYJ3Y1whgYpESV298d3XaF1TChnsUZpAUeHJ4RWpAgnKqDg1OK31i9HzNHEJ/2Jpe90O7do44p4UHOhzKxx/9zc6ve2s6M5sQWBkI/keOu7ojPMDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/ZIoQayojoYWFXGq/8OJUWDdaphhpR+SRQz0jfU/v0=;
 b=AekoPhUpqrUV4kX0cjmL+Fr6ZR6/XpjGZSca+1wAlmJFPgBj7cQ8YTAPomZbk52qwkCN98YJfQD1sLcghdJ5axTtJkwXfOxX40Pcl1ORl0QUL3zajMY3F+90+xINOccUIQ6zTbHnRdr4Vch6w0khhbszG6ai/f8sbjcPu0/RwjtBQl1MIHTj2Q0DC0gVHZGFcjBBrZN10uwiIHOzW30Ed8BVa4NToiQ7bcIkZmjB2i7fBkjuQQ/EhzIgfdLVkH9hDJF+G5u5BxvhFNyQdSyIpJ7cT7yO4Ccvgjp33km3Ys8CeqjF6+IQEYFh0vrb2vuoJO0U5+maKSW51h7/wLrnwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd6615fb-dc2d-9885-e3a3-9cf0954f57d3@suse.com>
Date: Mon, 17 Apr 2023 12:01:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen/livepatch: Fix .altinstructions safety checks
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230415022229.3475033-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230415022229.3475033-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: d57ba8c5-2931-4804-35cd-08db3f2abf08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d8TN7u+YgihdH2UfAIqeWKnCTTZueDRN3jc64tWu+eDHy8XQ+JilkgH09699m1p2Wab1qARrs2lpnsTW8i6Nx5jkcIMsRW+Nfrfe4bb3rVg5h9Ry0EeUUz2blWpcQVqzYPpDnjttMuJQco8eAmzh5Ov0HhnLo8dxHwUpdjlWXyPbC5aSk6EIXdSAExp/MOUjBpHBsB5uGRHfP7tVr2vAgCcjnT3QQWXoC47JkDOLPFsBGIpJzaNxPgvosQX2D0zpcalruO42NdFpBeY3L9bbc8po3imnTU+YXrdjDb3canr3lJYGScxFJm55xElAiYvhjBylVsDsDjjJ5pVG2gVBfUfsn3/wC/Gd376fjoAziH/+TC4inc14RRAbUzf5eJAtm1VqewPqzuydyNc6roUXX7bGPfWbjs7BaGptCom96eEaDx7e7j+NDjzxefBnQvpw9p9OWVtIgiPH3oH2sYmVPDV+6DYO4uDzzV021UlRO4xPifsC68rZaOF4+NJ/oKIwFVqa465Nh0+x2gq6mgrY/Uixs+qcbxjAbioHdMc+JwpVibPY6tDYQ8JtyU45TkzDOwb5p2WBBWkeKKhb9Tlo12X9CYyCewp3POjPHXHg/qwJbjz4mjXL3jF/h4VPqNY6FHBlAx6E11RS25RuUxu/PjK9IfaZkcBn94/qhU+IZFhfG7rdmoAOnDuCw/kTnpro
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6486002)(86362001)(478600001)(31696002)(2616005)(36756003)(83380400001)(26005)(6506007)(186003)(53546011)(6512007)(38100700002)(6916009)(66946007)(66476007)(66556008)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(54906003)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nmd0aktwZ0Exc1pmRWlwa09kV0RGV2h5MGZDNlNZV2cvMVl3U1NTZFEyU005?=
 =?utf-8?B?UEJUMzdOb2hGL3hRS1pVNGY4TThoUTZ5Y2dkVHJ6MzN3dnJYMGc0N1pER2Zo?=
 =?utf-8?B?a0UwNFRQQUpFUUJ3NjF4UjFubEJCaUZjU3ZzUGhiV201WUhUK3dQNWVkY0Zo?=
 =?utf-8?B?Y09wZlhQYS9VWkkzUTZBRUNsVjd2ZzFlSjdRWFk5cjRLQ0kvRTN2VTZLTW9P?=
 =?utf-8?B?dklOYXpXUWNmZkVOVGNkRWdZcjVrNmFlMnhMd2xlbDhiZjA1SFExSzkwaGNG?=
 =?utf-8?B?eEU2dFBZQXNheG53aTFRY0FJRDhKUXFUUkdPRVNQdTNGdXU2UE02b2ZJL3Zm?=
 =?utf-8?B?QjJ5QVNSRUlLMTZ1VndDYlh3YWdnbVZ5bDhkQnRuOGl6KzVjckVJRTdERUpt?=
 =?utf-8?B?SGRoYkNyY2xHR1lNaEE3KzdxNHdXOXpNSnRRYmx1Mk9xRXhqOHNIQVVjek9m?=
 =?utf-8?B?MnlJY1FORm1xaHNwZWhxcEJNb3BiT0JIZGdlcHV3eHN0OHpXaVdEOXN6RnVS?=
 =?utf-8?B?akxuMGpmNkdtQS9udTRQbkh2YnpSWlhyMWljYWFTeC9QeDc3LzFVNEJES251?=
 =?utf-8?B?OUp5dG1tQmJ3N3JOU01wM0hQZ0ZPa3NYOG1heVVDaldwL0xWSU0vbGl3amht?=
 =?utf-8?B?c0RUcmJyeWRFOUR4cXZUcVY3Y1VjVEExYnVZZTIwU0lMbHpJN2FNWkIwWFJL?=
 =?utf-8?B?WUNGTStVcExsVHI1ZDZHSEhtTCtLNThsWWxKSEhkcEp1emFTdXU0UTE2ZHlu?=
 =?utf-8?B?TzA0RXIzcHp3dTFMSWo0c0lFY0UzZC9aUmdVZ0d2bFBsZVlQV3UwSEtIZVBW?=
 =?utf-8?B?eER2TnRRMlo3YTJtaERBQUhUa3JXdk5Wck9FV0hDaWRrSDNTSWUzZTltU1RH?=
 =?utf-8?B?QldtQTFXWU5QcDZBTkV6L1RQYUc0Q3JzUzBtOG9LcnRHZGwzSWpyMGEwV3A1?=
 =?utf-8?B?eTYyeVpPWk5BbE9lQVp1THZ2SURHRWhkYmFqbi9HN2FXbzdKTEZZRTMzdXBI?=
 =?utf-8?B?Ky9WSFo1aS80eS9rWktrUVNES2trM25KMUdWaFNIaGNzUWlYNndxSndGN2h4?=
 =?utf-8?B?RERtK1U1V3hvSWpPSzh5SUp0WVpkSC9uandLUTlVeTRsTC96KzRqTENlcDVS?=
 =?utf-8?B?WUNOMWlINys5dHpaUUhDS2NuZmRGY3liK3YyZDFUdk0rK1VMamt1RVRuNzI3?=
 =?utf-8?B?WG1CK251c1BZNEFtU2s5WnQ5SkQwSjd2YVdXeXF1cVEyTnlZM1JwVzQwOXVQ?=
 =?utf-8?B?SERMV0Q0K3F0N3dxS0Mrb2dMSkZ0aXNycEpKaUpDaFJPMmNKeHNlLy9FNVRT?=
 =?utf-8?B?SFdUTHhLek5QQTlmSXFZR2RxWnVrNXFTNHBXaTFENktZanhvTjFUR3NEVHBE?=
 =?utf-8?B?RjB6dGZyeDFkYjNhRkJsQkFUWENaSVprZXg0aXVOS1h5aEdKY29RL2M3alVl?=
 =?utf-8?B?K1A1Vm1peDEwT2Y4RUVBTW9QSDljNnNXYkR0VERZTjZzMDZ1RWNtV21GWHNJ?=
 =?utf-8?B?LzBSWE56M05nZDgwek85ZWlPb2xpVVJUZWNNeC9tQnZyQ1FqbHlrMFVwUDNq?=
 =?utf-8?B?QzVsVk1TeEtuaEJqYjN2cDZlUHUycVhjSU85RStkNGVlMm1YbFNiOVd1K25Z?=
 =?utf-8?B?cjJRWUZaSTFLTlFrUmNxWG1DZnNlUGFKVEJ1aGpVMUVaL2JJWGNHcERRNG95?=
 =?utf-8?B?dFhEbFRpcWxLMjhpYWZCRTZFTzZ6TkNKTU4vK2kvb3g3OXNXVjVIczkyVU1M?=
 =?utf-8?B?V0xKUUpKRUt0V0V6azlWcTU5UXJ5M1dmK0prWXJpN2wxbWhRL0lNSWtlR3ht?=
 =?utf-8?B?L3RmbUJGRGNTSXhMZDA4bjlzOFZoRmJtc0xFWWd2YjBXS1lNYVNHQ3l5d0V0?=
 =?utf-8?B?LzBoNDBPUmUvRnptbUxaMmRUOVUxWWJEOWd4K2JMb1NZTzhpWnBibHdkSkt4?=
 =?utf-8?B?RHhCUG12RHB3NWxZdmZQVzZjVE1YNzdPdklLY282dFZueFhsVDN1RDk3ZVYr?=
 =?utf-8?B?U25TNjJoVXJKaXFpSDlzZlgvdndDNW1meExZQ1EyZ2s4Q1lmVDVUa1hTTUhL?=
 =?utf-8?B?V2ZoZFBVd1VnVnJiUGlhRHNoMlQzUzRKSk9qNmhLOVNHV2U1a0RJZFU4cDk2?=
 =?utf-8?Q?1jkO/FcI6m6+ty+IeqHza/yGS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57ba8c5-2931-4804-35cd-08db3f2abf08
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:01:43.0928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esZ1S3NfsUomP+DpDdbKobGxMhDAGjrPZ/DwNW6gr98hGauj3PVNoAXAX2qhf7r6sPfY7ApSCWjyteRNmHabig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8776

On 15.04.2023 04:22, Andrew Cooper wrote:
> The prior check has && vs || mixups, making it tautologically false and thus
> providing no safety at all.  There are boundary errors too.
> 
> First start with a comment describing how the .altinstructions and
> .altinstr_replacement sections interact, and perform suitable cross-checking.
> 
> Second, rewrite the alt_instr loop entirely from scratch.  Origin sites have
> non-zero size, and must be fully contained within .text.

Or .init.text, which may be worth making explicit (perhaps also in the
respective code comment). Or am I misremembering and livepatch blobs,
unlike e.g. Linux modules, don't support the concept of .init.* sections?

>  Any non-zero sized
> replacements must be fully contained within .altinstr_replacement.

Yes, but if they're all zero-sized, in principle no .altinstr_replacement
section could be there. Not sure though whether that's worth supporting
as a special case.

Furthermore, ...

> Fixes: f8a10174e8b1 ("xsplice: Add support for alternatives")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> As a further observation, .altinstr_replacement shouldn't survive beyond its
> use in apply_alternatives(), but the disp32 relative references (for x86 at
> least) in alt_instr force .altinstr_replacement to be close to the payload
> while being applied.

... if .altinstr_replacement is retained right now anyway, isn't it legal
to fold it with another section (e.g. .text) while linking?

> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -803,28 +803,82 @@ static int prepare_payload(struct payload *payload,
>      if ( sec )
>      {
>  #ifdef CONFIG_HAS_ALTERNATIVE
> +        /*
> +         * (As of April 2023), Alternatives are formed of:
> +         * - An .altinstructions section with an array of struct alt_instr's.
> +         * - An .altinstr_replacement section containing instructions bytes.

Since this is generic code, perhaps drop "bytes"? (Or else use "instruction
bytes"?)

> +         * An individual alt_instr contains:
> +         * - An orig reference, pointing into .text with a nonzero length
> +         * - A repl reference, pointing into .altinstr_replacement
> +         *
> +         * It is legal to have zero-length replacements, meaning it is legal
> +         * for the .altinstr_replacement section to be empty too.  An
> +         * implementation detail means that a zero-length replacement's repl
> +         * reference will be the start of the .altinstr_replacement section.

"will" or "may"? And especially if indeed "will", is it really worth mentioning
this here in this way, posing a fair risk of the comment going stale entirely
unnoticed?

> +         */
> +        const struct livepatch_elf_sec *repl_sec;
>          struct alt_instr *a, *start, *end;
>  
>          if ( !section_ok(elf, sec, sizeof(*a)) )
>              return -EINVAL;
>  
> +        /* Tolerate an empty .altinstructions section... */
> +        if ( sec->sec->sh_size == 0 )
> +            goto alt_done;
> +
> +        /* ... but otherwise, there needs to be something to alter... */
> +        if ( payload->text_size == 0 )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH "%s Alternatives provided, but no .text\n",
> +                   elf->name);
> +            return -EINVAL;
> +        }
> +
> +        /* ... and something to be altered to. */
> +        repl_sec = livepatch_elf_sec_by_name(elf, ".altinstr_replacement");
> +        if ( !repl_sec )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH "%s .altinstructions provided, but no .altinstr_replacement\n",
> +                   elf->name);
> +            return -EINVAL;
> +        }
> +
>          start = sec->load_addr;
>          end = sec->load_addr + sec->sec->sh_size;
>  
>          for ( a = start; a < end; a++ )
>          {
> -            const void *instr = ALT_ORIG_PTR(a);
> -            const void *replacement = ALT_REPL_PTR(a);
> +            const void *orig = ALT_ORIG_PTR(a);
> +            const void *repl = ALT_REPL_PTR(a);
> +
> +            /* orig must be fully within .text. */
> +            if ( orig               < payload->text_addr ||
> +                 a->orig_len        > payload->text_size ||
> +                 orig + a->orig_len > payload->text_addr + payload->text_size )
> +            {
> +                printk(XENLOG_ERR LIVEPATCH
> +                       "%s Alternative orig %p+%#x outside payload text %p+%#lx\n",
> +                       elf->name, orig, a->orig_len, payload->text_addr, payload->text_size);
> +                return -EINVAL;
> +            }
>  
> -            if ( (instr < region->start && instr >= region->end) ||
> -                 (replacement < region->start && replacement >= region->end) )
> +            /*
> +             * repl must be fully within .altinstr_replacement, even if they
> +             * happen to both have zero length.

Who is "they ... both" here? Surely it doesn't matter here whether "orig_len"
is zero.

Jan

