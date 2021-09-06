Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013F6401DD0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 17:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180065.326575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGux-0001Rg-O6; Mon, 06 Sep 2021 15:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180065.326575; Mon, 06 Sep 2021 15:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNGux-0001Ob-Ki; Mon, 06 Sep 2021 15:52:19 +0000
Received: by outflank-mailman (input) for mailman id 180065;
 Mon, 06 Sep 2021 15:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNGuw-0001OS-DT
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 15:52:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5917e309-8132-4e59-9e5d-232a1e1460da;
 Mon, 06 Sep 2021 15:52:17 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-B6XkD3duPKSlItBJVN3VAQ-1;
 Mon, 06 Sep 2021 17:52:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 15:52:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 15:52:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Mon, 6 Sep 2021 15:52:12 +0000
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
X-Inumbo-ID: 5917e309-8132-4e59-9e5d-232a1e1460da
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630943536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7UKcM4S9tKAzyGGYNFS3Wo9PSeC76IYZoeIv6naCYk=;
	b=NP/XvRsOF3kwlIVghVZwNHuFV6xZen329F2RgfzPmeiYtveyYyRaHA1ULTdDn/Akyxfnis
	MbzJwQDm/D6WaQnOGrFrK2AizLjmRqNJf3C57dDjx8Di1hanwzhLsiXhI/ywIJw3bOY69r
	trLOANHfUELv5dc8Bfuo/enF/1a6veM=
X-MC-Unique: B6XkD3duPKSlItBJVN3VAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqCdVsoSwNMZymkJeu6shrlDE7askClulZsXxw6Dr03LBi9DhUNYfy1fWuopynjT20WVdRvju2qHrvvI5zwY7H9sNQamNBQRCD1u8UXPaihz9ymBvoMM/iMLzbgEHIxg+QxJt6D2RAnYGmW2iZ/KXe8a0mSpIMOmd9nPz0G0/zM5iwgTFgqG6l32K6u9Ar63MNYCeELtS9gQAxYhoXZxn15Fm6IZ3kruE6u2+i38Mzs1RrbWOGryS6dtuRZKLRoy7W+6ySZ9Aly4bSG3COP2xoWdgF4A9HNFmXP7I5rZgzNvEazHIEi+UVMRjIkz5A76EwROn+OLfnLB5rYADNLZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=L7UKcM4S9tKAzyGGYNFS3Wo9PSeC76IYZoeIv6naCYk=;
 b=jkg7Kywyvh3UFDR37yqIl2Z/sJVA21A9MSr4GIA7cmvuhFAV0UHen3NjKkr9ZCy4isqyfyCh9P7EVP5ew7eWfbkEnnykkfpUIpKyp5HuTrjsCSn20uuGQDfZz1DfeE6REZ+3/Gx1el437aaTwoOPf8snj7vmf4dxns6xflKNphUDuxL1MRsuHjrEY4pPFmP6RwylFY8WDQrp2e/AjIRXKePaby6SF2UwV1mjacCLPL1KpFGkyEuMUQDcPQ9u4+e5izcjcS9ouZDeVTF5eNa7utuvBEht3/TKVFnD//Z+/562JmvD75sbnUX1krWdq46upc6YofmGf2nVdiZgRAFoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 01/11] xen: Implement xen/alternative-call.h for use in
 common code
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a91e4ad-50c4-205f-3d90-f23c996b2938@suse.com>
Date: Mon, 6 Sep 2021 17:52:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903190629.11917-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70eaedd1-bfd6-462e-d501-08d9714e4ad8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325B7217303F3CD0D0D2333B3D29@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XPBuEpIZJHXJ/zq749VVD0uO1AyOnXa0eT28Ib65HMWa7fcK2VkJyrpah1baaEPUeMRASbvXalkR3s6RX2RE+1eXwFD0VzC2WQV7jYEK6xTOWnwjd3AwIKqTTuGeHhrSHN5CsiYXRLh394YwWdjI7p8El7cRU6WlAHPlOpxmhhRHfwufZ52xTBzdHsleBThHYAJq7Ykb0ZpZbpNt5vG/O/iEszfea4uw7JO7hucDgHAHbzH0vkLhzmy+6sMgG/mDqfn4q8XujUZ1HYBC6dCppHoXldh69Gz8C5hvGI2SQERXxnDGIWP8pYhEbd3KS1DH2znZqJhQ21rhVTku994y9g/9apy1hIv9WCKBLnU9lzwOtoZj6ham2vphgUF7YYenOrT+jCTxlo7idufc3gZ1Hv3mROzxD4SYJVM7oxvNDbfx3KnXFzOZlCSjTqxMA0PPn971eY4lHxPIJudJh19o2hPtl3cVfmrvL4clioqCwlVbXa26WXbcyGDFMnKeNUMflDJLhdWB6VGmIJvitouYXsL6kosVRmsEe6IPdBVp/OWqKxDrlc1FvkRDfk/JSjws+fLClJmNMioZggCWHC1dohRAitqEQ+B2qVOp0GRopesJiLigPlWbt6Kn+7NHrmG9syBbaYsgooXb7Rg0Zlih7+pVX9x183drs+/BgtyWC0gxu4tkuU18JaD2msYDGcT0Bm0AsSLzflJUj46xdycEWJxP6F2+R7N1o6uRYYj+dJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(346002)(39860400002)(396003)(54906003)(53546011)(5660300002)(4326008)(8936002)(956004)(38100700002)(6486002)(2616005)(83380400001)(31696002)(6916009)(8676002)(86362001)(26005)(316002)(36756003)(66946007)(7416002)(31686004)(2906002)(478600001)(66476007)(66556008)(186003)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEt6Vm9xaEtkRjR1QWZGV3hwdk9JSSt4MDFSOThnUEZtTlZCQnIrWllCTko0?=
 =?utf-8?B?ZFlFN2N3QUh1b3RQMVV3RmhadmlRd1pWeG8wS0dZRWxNVkM2eTJlZXVyOHRG?=
 =?utf-8?B?SVc2SklyNEV2Z1ZKMG9Xdm9uYnZ2OERhSWNnMmhBRSticVMyY05JUTdPdEE1?=
 =?utf-8?B?dWw0ZHA5NU8wNVkzK2hPaCtEMlphT2NDR1IrNVBjeE1MN0l4TUNtdUNyYm9a?=
 =?utf-8?B?Ty9naXo3L2tFNU1xYVBlalV3VlVaWW10MG40N3djZ05ndXRaRzBrbUFvdDU3?=
 =?utf-8?B?ckxBbldlRXo5SnhNb09xT1l2WHprZExtdTdXcUp5R2l1Q3l5aHQrakxibXF5?=
 =?utf-8?B?VWRTanQwTEJpcnRlYVY5VGR5RVRlNUFheG1XWGJwaFk5QkNCUGtZUHZYbldq?=
 =?utf-8?B?VFBrWi9wL0dkbTZkd3lXS2h4c1h5TkYxSVVqMS9neHFFWmswTmNETnlacW9o?=
 =?utf-8?B?YlJQNWdzUTB6azFUSzdxOXJTZ1N1UVhET2tJeVcrSlZLRzZaRXdlMlZJem1Z?=
 =?utf-8?B?aWZTbVdMVHJjUjJhWTY2RGZLem5lS0JSRkJCT0lUUkk4cGY5bk91ZmhDcjlJ?=
 =?utf-8?B?WTIrcGIwQTZCeXNheEh5Y3lxN0lCOFlyTmZUZHJOcHJUU3ZIMnJLZXQ0bWZa?=
 =?utf-8?B?bjNpc2ZLUmpzczVYMnlXYWRNMDBnQkVFT2w1cUgwT2N5c2dFY2JpSmFtTkdo?=
 =?utf-8?B?TWpoUVgzdmo1ZXdwalBZNWNrMmpuWGZZSWFzclpzbnpYWE5JWUJPQzlRMHJ3?=
 =?utf-8?B?dzRDNktaekxXeVBCWnUvVTFGd1paOUgycVVoeUJ5VCsvV3ZGdE5rWEd1ZjFM?=
 =?utf-8?B?aHo1LzFSVTNUZjhuZTJ6MFg1SGppNzh5VDZFY1JJOXRsOHhTT1RWOTRkZ0Fn?=
 =?utf-8?B?ZThTN09wS0YrdEJQa3pWNTdENU1VY2tJN281L1h0czJkekVQajlsR3ZLYXhr?=
 =?utf-8?B?SE0zSW1LdnBWMmJMa2tsQXpTN0dVVC9QUkJ5S0ZocmthUFNrOXB5WW5SZlBQ?=
 =?utf-8?B?aGlPOVIzSnN2SkhZaTE1Nm1kRmVhZFN6MUlGTGtOVm5YSWE5UWlEc1oyZko4?=
 =?utf-8?B?NnRma3F2a1BRM2N6TFlzNUx2dFRoMG9IZ05Ic3BSUU1kWVlzbXJJL0sxdTFo?=
 =?utf-8?B?UlNXYXFhcmpzellLcGxnbXJsbGlPR3pxNERLcGg3d3VnWWJXam11K3hoQnM3?=
 =?utf-8?B?R2Rxa1J5M3duYm5oYXBuQ3dBOVJydWRpa040TEJVc2M0d2E3UXl4ME0ybkdo?=
 =?utf-8?B?QVhSTnphZ3dDZ0d5a1kwcmF6S0RqeTl1YnlBTVp0TVlHRjhIY3B5bWRrcFdZ?=
 =?utf-8?B?cDg4dUxkOE80MGxnT242Q3dKTFVCZ3RTcWU5RGNkOHRCU0xucGcvZnFjZUJK?=
 =?utf-8?B?RUtHOWVjV0l2ZFluWGJweUVjYnlGcWM4SE9DU2FQYUFOeWI4TXk1TGIyYUlY?=
 =?utf-8?B?NkV4WEc4c1pSOG4zcHI0QTlOYnM2b2NxeWRLWUJHbFZUYWxVLzBXRGZYdE54?=
 =?utf-8?B?SnhvcllaSkNxdW5BQUFXMVNyYUNGamZDM1Q5cUhtSXRwZVB0YjV0dUdIekpT?=
 =?utf-8?B?a2twQzFCSkpWNjd5UlVTS3R5SXpBZ0dVSTBMZzhWcE1jRVJZSWJyK1pyQUZs?=
 =?utf-8?B?d3hITnYzK202Skh2TVVIRXB1Q3BvbEt4clIxYnU5QmJMd1g5enhGRThxTVlv?=
 =?utf-8?B?NWMxc3JlbUI0N0Q5eHVpc0ZCcTFINmcvVDNmaUlnKzloY2R2dTF5aXBsVzl1?=
 =?utf-8?Q?vQ9KjBXEIKAoFT396tRK/1QLJ+kHwHPzEyibdHx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70eaedd1-bfd6-462e-d501-08d9714e4ad8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 15:52:12.8776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVZidnb6RsPIUEX5vXOxm8KwJoii/LRbYbXp1XbivD5BmsJ8hGwPmGT5YBL8hFn4fNKpiipOjwcXE4Qjox+urg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 03.09.2021 21:06, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/include/xen/alternative-call.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef XEN_ALTERNATIVE_CALL
> +#define XEN_ALTERNATIVE_CALL
> +
> +/*
> + * Some subsystems in Xen may have multiple implementions, which can be
> + * resolved to a single implementation at boot time.  By default, this will
> + * result in the use of function pointers.
> + *
> + * Some architectures may have mechanisms for dynamically modifying .text.
> + * Using this mechnaism, function pointers can be converted to direct calls
> + * which are typically more efficient at runtime.
> + *
> + * For architectures to support:
> + *
> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
> + *   requirements are to emit a function pointer call at build time, and stash
> + *   enough metadata to simplify the call at boot once the implementation has
> + *   been resolved.
> + * - Select ALTERNATIVE_CALL in Kconfig.
> + *
> + * To use:
> + *
> + * Consider the following simplified example.
> + *
> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
> + *
> + *  2) const struct foo_ops __initconst foo_a_ops = { ... };
> + *     const struct foo_ops __initconst foo_b_ops = { ... };
> + *
> + *     void foo_init(void)
> + *     {
> + *         ...
> + *         if ( use_impl_a )
> + *             ops = *foo_a_ops;
> + *         else if ( use_impl_b )
> + *             ops = *foo_b_ops;
> + *         ...
> + *     }
> + *
> + *  3) alternative_call(ops.bar, ...);
> + *
> + * There needs to a single ops object (1) which will eventually contain the
> + * function pointers.  This should be populated in foo's init() function (2)
> + * by one of the available implementations.  To call functions, use
> + * alternative_{,v}call() referencing the main ops object (3).
> + */
> +
> +#ifdef CONFIG_ALTERNATIVE_CALL
> +
> +#include <asm/alternative.h>
> +
> +#define __alt_call_maybe_initdata __initdata

My v3 comment here was:

"I think it wants (needs) clarifying that this may only be used if
 the ops object is used exclusively in alternative_{,v}call()
 instances (besides the original assignments to it, of course)."

I realize this was slightly too strict, as other uses from .init.*
are of course also okay, but I continue to think that - in
particular with the example using it - there should be a warning
about this possible pitfall. Or am I merely unable to spot the
wording change somewhere in the comment?

Jan


