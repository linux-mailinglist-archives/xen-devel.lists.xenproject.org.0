Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09337568EC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 18:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564761.882467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQup-0008Pb-GP; Mon, 17 Jul 2023 16:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564761.882467; Mon, 17 Jul 2023 16:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQup-0008MG-DU; Mon, 17 Jul 2023 16:17:39 +0000
Received: by outflank-mailman (input) for mailman id 564761;
 Mon, 17 Jul 2023 16:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLQuo-0008MA-0e
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 16:17:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70f580ab-24bd-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 18:17:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 16:17:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 16:17:33 +0000
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
X-Inumbo-ID: 70f580ab-24bd-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpYYylBoabO4ciDwjj+hpptOjmBtBA58ob67AhBRT45qGyve7culiR3OjaliEF580ErBqESA4Wz9IvThwghgbR2vKrpg3TcBj5leqRtzJRRhrtuvKaA0zhXdr8qig6vVIQODFSTKS5WaxFX3tqPyGZHjhkcNCoOeumCDTf4HG7g36TnEB/MCaQBKcTv88JAknse0q6mVFnL02M6ENA89XTZz11W4ER08jywkG2NrG6M41MskLRYjQ3jLZC1tAKI1O4XTjo2aDdqEuKgvVvntFjPwmd6gRgXjDouikD2cXGvj9kxWaWuV/tboGTgYiIG43LXIlm/c+5Co93b+WeXNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfMQ76dMLG7HqkhZ0Nido2jSKPWGnx/9sf/gMnJarZo=;
 b=AYCxNtUkn/6cyHMVfPisj/u9ROYQdOByeGmp7YPbchnqgo/xb81fosAVhLuC4Fhn7LvQFMTzxJDDErHmCxqhUVodX5tWnOuCEFpc4qoTRDZwHfbxE+y/Gmbgwi7YiyBovLZn2M23IwYe29vQ4cXDomvpElpg/Z0+jtbgd/jVd44/tcyFFAky8mjLRLvxePNLa/g4Aj64c+1C3Cp+74sxYuGNeKIEyvVWqK2ZFXud5vRPsT1sCPMC4I4Jhken9kao2MaeQ3x42HN0IuGEElwZfGdGAR0ndr1AmPnRSPwB90O8abd6apx7aIHnLJVMhFKUmDrX49BKMPJYzn7R6Litag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfMQ76dMLG7HqkhZ0Nido2jSKPWGnx/9sf/gMnJarZo=;
 b=F9eKZS8S6NHwYK/LH17GlbcSzSkTYYCy1bnmvzqSVw4nhJzTDd2alh6v8NLoPadxnecIumiEPZZAc3PZNB4It4mCVX+OwjuJfGsFx4J5JqB+mfHY3SdM8Lue6v8r1XaR0dFMJQY9bTkDfjXBy2Q9+adZLwaawTrmNTrkDQ+HiXuVqI9hUbvz3NIEgq0N+jPzlB1QdiJco0G/KQUZ461N/SP2qFpTQnHrvIvA+v/ZNlrV3y/WvshTc0hdNXVlf2HFgRzYPl2WRjKN68d/pilLPbeYwXfSTq07LMzFCjzqudSEA0Bt9fsTE49BrSQqIIUejUCDIsvrgNNFtmfwFL63wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa58706f-5033-ef33-5202-bcc418bedb86@suse.com>
Date: Mon, 17 Jul 2023 18:17:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <85172d385a730e196999b366207e2b2e8a261906.1688670018.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <85172d385a730e196999b366207e2b2e8a261906.1688670018.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: dc213b22-cac8-42b5-c321-08db86e153ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jNb16BF81fTLkGp3wTtbXH7qS4eFLleEp6LHM1fqhIUP1Aty5tS+uNMJX8CxiM6sGHiwzHxGAhXAIzA7LWKifCARhhRVWKWHV3Gy54P1TobdDnzezSTi2MGI25aUHP2OKM8/8vdisziKn+e5jfpfz2xPn6Nz/44cVzveS00HTPWSJX52wSxFLJIOXRSVaVRnbeT1CaITdmfZGQcHA8m5pTjI4gEdbM0XyrmQqOJx6fiyO9TLulg8X2KwAmqzZP6nku9fc9/JuNM0kDVcMq6XgtV4H96UbGcgNffpPO2ik8PVnX7OZVsh8r5SAQPC6ulrwS0o0XvRyFEmhxr8kgxiEhY4+Nhh0Ugk2xBPWQfGftusr+BpTxUpb3zuwklvg3RMCrx66+hxhiEygk1lrM4lE/IdtzuPA90anFqsFl+2U8ET/76KZyCEMU40JFtxZyHavcX46zc0HQEK96tKIlNUlWXE6IvfVZlga6psPFYBlbhS2T3JGgTfccAanD2ggZWqqNPtlwOYX2Cs5GJZLro2C1mds3B7SWxU4tePkNJcWgY8/De3FSvIJVucoVaH1ysmldsrKlzj6AN65cbT/37hyLwb/+1CoWjnLF1l7zk51C5DrFZIfmi1zpH7bbSJ+5yvkoQmOLcLxrtOraebAussaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(31686004)(31696002)(86362001)(2906002)(30864003)(36756003)(6512007)(186003)(83380400001)(6506007)(53546011)(26005)(38100700002)(6486002)(54906003)(316002)(5660300002)(66476007)(6916009)(66946007)(66556008)(2616005)(4326008)(478600001)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzA1Nmlxd085NWV6SXdQc2NrdFRSTWdNY1ZWYXdpQ0ZseTR3SDVSbS9ZZmcy?=
 =?utf-8?B?V25sc1N1NUt4OHp2MkdOVFEveFl2ZnptNHpnNmVuZW1OMi9ISWFDYmJXVmlu?=
 =?utf-8?B?eUdHNGN4MkFzaTk5Wk50U2VWNUw3QVBQZ0lDanllVTZWVGN5MG9MQjk1bzVt?=
 =?utf-8?B?Q3dPR2ptVUswcTBLdkhtSEpLRm4rQzFmeWVVLzR2WndzbmxVRDdFQUNSSUNt?=
 =?utf-8?B?SjhFNU1XbXhlOEd1RzNpSnUzWTBvNG1LQWdPd3dPaWdGbnM4ajFXTE1KZnpy?=
 =?utf-8?B?UVYzYWt1T0lEbnZIblEyRGNDbnByOFI1cXlKNVgrK1psVzlXM0ZGYnJSWWI5?=
 =?utf-8?B?YnluZXdzM3FWR1V1V3RHNFlPNmlxYmthZ3RoUnIwMUE5WDI1RmdMVFgwK3FM?=
 =?utf-8?B?SEZFL2sxdGh3Ym9mOXR1N2JsYmRJeW9ENWxKTWZxdWtKWnZnd3JtRHhNN0hx?=
 =?utf-8?B?dTFPbG9RSXd3UVJMbVdBUTIxU0pLZ2JaVzBsWDJKYTRwaWFDRkZWMFNtYjB5?=
 =?utf-8?B?SVZoN0t2M1krMzFQb2FGZ0hVUzY5VVFqbnFSVkRONTFtV2FIY2E5R3RBNzlC?=
 =?utf-8?B?aFZvc0hmREFzWDdCWm55T2k1ZXQ2ODFJTWdkaGdCM2NKaXpzeDljcFl0V0Ja?=
 =?utf-8?B?ZjQrVllwOFAremxpN2FTR0pBSjJNYnlvelhrL0FkRm02eWdMNTU2dzNJVXkr?=
 =?utf-8?B?OWVXQitHRzhENjQ3UVNDcG4wNkd6bkxKZmN2Z0hUU2JMMVRGbTh2OUJSREpP?=
 =?utf-8?B?SDVybHNSMUdJU2hkaVdJWkNISzB2c3crZ3dYclhIYVp1REhGY09YV2NMeWdJ?=
 =?utf-8?B?YVE1c1RKZGxweVlHSm00VXFTdHR2cWZ1NTlGRWpjZ2VQdTVGckJZN1FTd3p6?=
 =?utf-8?B?MW9ULy96REhwNFhEd3FiOGxEaCtiU3NkWmhwRzRBbDVTWFVJekNBS3JLTzla?=
 =?utf-8?B?VDhhczlkQWFsdmU1ZkMvWTdUbGpXUi8ySXlRRU81dnJZLzZRYUw0VVYzODIv?=
 =?utf-8?B?eGtTN3RRUVQ4anFVSnUwUzgwOXp4R0hSMWl3anhQQWw0d3FGNlN0dmRHMGNs?=
 =?utf-8?B?dndINlhzT1dLaEhvSUxWTXNIUDQ2NGgrdTczOW1EOFQzai9hcm5PeE56Y3h1?=
 =?utf-8?B?TFVlQjI0T1FlU0NpamhKWGNvcUo3K3dTd05hcDB6ZmJvRWpKNFRzYnV3dHY2?=
 =?utf-8?B?YzJudFdSOEZZNnp5VWF5ZHB3dGZ3YkpuNGtMd3ZDclVzb1RCbjhKKzVubC9j?=
 =?utf-8?B?elljc2EyZ0pzUG5tOFkrU0ZnRFN2SmV3VW5NK1hWemlCMmNZa0xlWThZcDd2?=
 =?utf-8?B?bmVwdEZjcTRVbEl5T1R1aFJ1bWw1alVOcm82b1I1ZlVkWTZGN0JEMXZqSDA1?=
 =?utf-8?B?NE1nOEZsS0pNdTdrNUVoenYvVGpKbnpkb3FYMU9ZNjQrQ1M2MnNFeWwza0ZY?=
 =?utf-8?B?M0lubGg5blBiUHVHYSswUnl2bjY0N01zYzVnMnBNTGpWZ2xFNTRGbjlpY1dZ?=
 =?utf-8?B?UEVURVFnWjRSdEtnRGk5UmdIVFcyQmhTQWNrWldWQXhVV2toaEplY2hMRzI3?=
 =?utf-8?B?WEZ2SlZzQ1BUNVVxVFhlNnhIOXlCZmJiQ1hVcXBVanVmSHM1VE50M2oxTGZG?=
 =?utf-8?B?djhyUTRGM092WW00OGhGK0VpTDZidkpIdncvWGdlQmxaRzdzSldia0M3Nkkw?=
 =?utf-8?B?QUtWMzA0c1Yyd1RGakFOOE9nSnFHa3E4U3RRYVBURVBldWwvOFBONVhYNkVq?=
 =?utf-8?B?RVNRejBJUStGWmpsWGU0ZHhKR2J0SmdzaFByckhXWUN0Z05mYW5jQkdFQXVM?=
 =?utf-8?B?Q3o2aHE3NFVDVnJ1aUY3bTdzcUxEaitleU91elczSkd6V0EvalM1SFJ2d1BJ?=
 =?utf-8?B?SW5lSnhzTHFlc2QycHIzT01ybTNQWHF3bTVyWHRkOGU2RGROYkhjaUJxYVVV?=
 =?utf-8?B?ZFY0TnU3T1I1NlNtSW1seEFVMlc2UnhPdmFXNEMyV2ZWRzVmUE05S0NyV1JN?=
 =?utf-8?B?MGs1MjdNRjJIbGo4VDlUSEJqWXNRMno0MTcwcVAwY0ptRXlvM0RxelFVcGpI?=
 =?utf-8?B?Sm5iZWdhS0tTdFVrSWFlTitUWm1ULzVRSEZIRG9nNzc5N3gvRWR6ek9wRitT?=
 =?utf-8?Q?pDE4tvWNz/2Qlr93OfZbAReFM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc213b22-cac8-42b5-c321-08db86e153ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 16:17:33.6582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcPavaUXeicBKyS2jETYUixN28HkCWuk7kpmhxAIXZPpY7EChb9R/zg7QrajfJyWV41Oqz3II82Boaj5bxL3Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 06.07.2023 21:04, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -1,5 +1,7 @@
>  obj-$(CONFIG_PPC64) += ppc64/
>  
> +obj-y += boot-of.init.o
> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o

While in this case I could accept the name as is to be the same as Arm's,
as said before it would be nice if new files could avoid underscores (and
use dashes instead) unless strictly required by something.

Also, with boot-of.c using early_printk.c, shouldn't the latter also
build into early_printk.init.o?

> --- /dev/null
> +++ b/xen/arch/ppc/boot-of.c
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright IBM Corp. 2005, 2006, 2007

Judging from the years the file was taken from somewhere. Is the license
there permitting "2.0 or later"? (For files [partly] taken from somewhere,
a clarification as to the originals' licenses would be helpful to have in
the description, or maybe in the post-commit-message area.)

> + * Copyright Raptor Engineering, LLC
> + *
> + * Authors: Jimi Xenidis <jimix@watson.ibm.com>
> + *          Hollis Blanchard <hollisb@us.ibm.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
> +#include <xen/init.h>
> +#include <xen/stdarg.h>
> +#include <xen/types.h>
> +#include <asm/boot.h>
> +#include <asm/byteorder.h>
> +#include <asm/early_printk.h>
> +
> +#define ADDR(x) (uint32_t)(unsigned long)(x)

Besides needing to be wrapped in parentheses, this likely needs a comment:
It is hard to see how in 64-bit code uint32_t can suffice as an address.
Unless (see the question on patch 1) you intend to link/run Xen at an
address firmly below 4Gb, now and going forward.

> +/* OF entrypoint*/
> +static unsigned long __initdata of_vec;
> +
> +/* OF device handles*/
> +static int __initdata bof_chosen;
> +static int __initdata of_out;
> +
> +static int __init of_call(const char *service, uint32_t nargs, uint32_t nrets,
> +                   int32_t rets[], ...)

Nit: Indentation.

> +{
> +    int rc;
> +    va_list args;
> +    int i;

unsigned int?

> +    struct of_service s = { 0 };
> +
> +    s.ofs_service = cpu_to_be32(ADDR(service));
> +    s.ofs_nargs = cpu_to_be32(nargs);
> +    s.ofs_nrets = cpu_to_be32(nrets);
> +
> +    /* copy all the params into the args array */

Nit: Style (comments want to start with a capital letter). Again below.

> +    va_start(args, rets);
> +
> +    for ( i = 0; i < nargs; i++ )
> +        s.ofs_args[i] = cpu_to_be32(va_arg(args, uint32_t));
> +
> +    va_end(args);
> +
> +    rc = enter_of(&s, of_vec);
> +
> +    /* copy all return values to the output rets array */
> +    for ( i = 0; i < nrets; i++ )
> +        rets[i] = be32_to_cpu(s.ofs_args[i + nargs]);
> +
> +    return rc;
> +}
> +
> +static int __init of_finddevice(const char *devspec)
> +{
> +    int rets[1] = { OF_FAILURE };

Hmm, of_call() uses int32_t. Again below several times.

> +    of_call("finddevice", 1, 1, rets, devspec);

This could do with using ARRAY_SIZE(rets). Same again below.

Also don't you need to wrap devspec in ADDR()? Similar issues
then again below.

> +    return rets[0];
> +}
> +
> +static int __init of_getprop(int ph, const char *name, void *buf, uint32_t buflen)
> +{
> +    int rets[1] = { OF_FAILURE };
> +
> +    of_call("getprop", 4, 1, rets, ph, ADDR(name), buf, buflen);
> +    return rets[0];
> +}
> +
> +int __init of_write(int ih, const char *addr, uint32_t len)
> +{
> +    int rets[1] = { OF_FAILURE };
> +
> +    of_call("write", 3, 1, rets, ih, addr, len);
> +    return rets[0];
> +}
> +
> +static void __init of_putchar(char c)
> +{
> +    if ( c == '\n' )
> +    {
> +        char buf = '\r';
> +        of_write(of_out, &buf, 1);
> +    }
> +    of_write(of_out, &c, 1);
> +}
> +
> +void __init boot_of_init(unsigned long vec)
> +{
> +    of_vec = vec;
> +
> +    /* Get a handle to the default console */
> +    bof_chosen = of_finddevice("/chosen");
> +    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
> +    of_out = be32_to_cpu(of_out);
> +
> +    early_printk_init(of_putchar);
> +}

Considering that bof_chosen is used just here, why does it need to be
a file-scope variable?

> --- /dev/null
> +++ b/xen/arch/ppc/early_printk.c
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/init.h>
> +#include <asm/boot.h>
> +
> +static void (*putchar_func)(char);

__initdata? (Connected to the question of building into .init.o.)

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright IBM Corp. 2005, 2006, 2007
> + * Copyright Raptor Engineering, LLC
> + *
> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
> + *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> + *          Timothy Pearson <tpearson@raptorengineering.com>
> + *          Shawn Anastasio <sanastasio@raptorengineering.com>
> + */
> +
> +#ifndef _ASM_PPC_PROCESSOR_H
> +#define _ASM_PPC_PROCESSOR_H
> +
> +#include <xen/config.h>

No need to - this is force-included by the Makefile machinery.

> +#include <xen/types.h>

Note this. Why ...

> +#define IOBMP_BYTES          8192
> +#define IOBMP_INVALID_OFFSET 0x8000
> +
> +/* Processor Version Register (PVR) field extraction */
> +
> +#define PVR_VER(pvr) (((pvr) >> 16) & 0xFFFF) /* Version field */
> +#define PVR_REV(pvr) (((pvr) >> 0) & 0xFFFF)  /* Revison field */
> +
> +#define __is_processor(pv) (PVR_VER(mfspr(SPRN_PVR)) == (pv))
> +
> +/*
> + * IBM has further subdivided the standard PowerPC 16-bit version and
> + * revision subfields of the PVR for the PowerPC 403s into the following:
> + */
> +
> +#define PVR_FAM(pvr)  (((pvr) >> 20) & 0xFFF) /* Family field */
> +#define PVR_MEM(pvr)  (((pvr) >> 16) & 0xF)   /* Member field */
> +#define PVR_CORE(pvr) (((pvr) >> 12) & 0xF)   /* Core field */
> +#define PVR_CFG(pvr)  (((pvr) >> 8) & 0xF)    /* Configuration field */
> +#define PVR_MAJ(pvr)  (((pvr) >> 4) & 0xF)    /* Major revision field */
> +#define PVR_MIN(pvr)  (((pvr) >> 0) & 0xF)    /* Minor revision field */
> +
> +/* Processor Version Numbers */
> +
> +#define PVR_403GA    0x00200000
> +#define PVR_403GB    0x00200100
> +#define PVR_403GC    0x00200200
> +#define PVR_403GCX   0x00201400
> +#define PVR_405GP    0x40110000
> +#define PVR_STB03XXX 0x40310000
> +#define PVR_NP405H   0x41410000
> +#define PVR_NP405L   0x41610000
> +#define PVR_601      0x00010000
> +#define PVR_602      0x00050000
> +#define PVR_603      0x00030000
> +#define PVR_603e     0x00060000
> +#define PVR_603ev    0x00070000
> +#define PVR_603r     0x00071000
> +#define PVR_604      0x00040000
> +#define PVR_604e     0x00090000
> +#define PVR_604r     0x000A0000
> +#define PVR_620      0x00140000
> +#define PVR_740      0x00080000
> +#define PVR_750      PVR_740
> +#define PVR_740P     0x10080000
> +#define PVR_750P     PVR_740P
> +#define PVR_7400     0x000C0000
> +#define PVR_7410     0x800C0000
> +#define PVR_7450     0x80000000
> +#define PVR_8540     0x80200000
> +#define PVR_8560     0x80200000
> +/*
> + * For the 8xx processors, all of them report the same PVR family for
> + * the PowerPC core. The various versions of these processors must be
> + * differentiated by the version number in the Communication Processor
> + * Module (CPM).
> + */
> +#define PVR_821  0x00500000
> +#define PVR_823  PVR_821
> +#define PVR_850  PVR_821
> +#define PVR_860  PVR_821
> +#define PVR_8240 0x00810100
> +#define PVR_8245 0x80811014
> +#define PVR_8260 PVR_8240
> +
> +/* 64-bit processors */
> +#define PVR_NORTHSTAR 0x0033
> +#define PVR_PULSAR    0x0034
> +#define PVR_POWER4    0x0035
> +#define PVR_ICESTAR   0x0036
> +#define PVR_SSTAR     0x0037
> +#define PVR_POWER4p   0x0038
> +#define PVR_970       0x0039
> +#define PVR_POWER5    0x003A
> +#define PVR_POWER5p   0x003B
> +#define PVR_970FX     0x003C
> +#define PVR_POWER6    0x003E
> +#define PVR_POWER7    0x003F
> +#define PVR_630       0x0040
> +#define PVR_630p      0x0041
> +#define PVR_970MP     0x0044
> +#define PVR_970GX     0x0045
> +#define PVR_POWER7p   0x004A
> +#define PVR_POWER8E   0x004B
> +#define PVR_POWER8NVL 0x004C
> +#define PVR_POWER8    0x004D
> +#define PVR_POWER9    0x004E
> +#define PVR_POWER10   0x0080
> +#define PVR_BE        0x0070
> +#define PVR_PA6T      0x0090
> +
> +/* Macro to adjust thread priority for hardware multithreading */
> +#define HMT_very_low()  asm volatile (" or %r31, %r31, %r31 ")
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>

... another time here? Or is the first one perhaps too early?

> +/* User-accessible registers: nost of these need to be saved/restored
> + * for every nested Xen invocation. */

Nit: Comment style. Multi-line comments want to be

/*
 * User-accessible registers: most of these need to be saved/restored
 * for every nested Xen invocation.
 */

(also note the s/nost/most/ I did)

> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -18,6 +18,15 @@ ENTRY(start)
>      li %r11, 0
>      stdu %r11, -STACK_FRAME_OVERHEAD(%r1)
>  
> +    /* clear .bss */
> +    LOAD_IMM32(%r14, __bss_start)
> +    LOAD_IMM32(%r15, __bss_end)

Question regarding addressing again.

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/of-call.S
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Adapted from Linux's arch/powerpc/kernel/entry_64.S, with the
> + * following copyright notice:
> + *
> + *  PowerPC version
> + *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
> + *  Rewritten by Cort Dougan (cort@cs.nmt.edu) for PReP
> + *    Copyright (C) 1996 Cort Dougan <cort@cs.nmt.edu>
> + *  Adapted for Power Macintosh by Paul Mackerras.
> + *  Low-level exception handlers and MMU support
> + *  rewritten by Paul Mackerras.
> + *    Copyright (C) 1996 Paul Mackerras.
> + *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
> + */
> +
> +#include <asm/asm-offsets.h>
> +#include <asm/asm-defns.h>
> +#include <asm/msr.h>
> +
> +/* size of minimum stack frame that can hold an entire cpu_user_regs struct */
> +#define STACK_SWITCH_FRAME_SIZE UREGS_sizeof
> +
> +    .section .init.text, "ax", @progbits
> +
> +ENTRY(enter_of)
> +    mflr %r0
> +    std %r0, 16(%r1)
> +    stdu %r1,-STACK_SWITCH_FRAME_SIZE(%r1) /* Save SP and create stack space */
> +
> +    /*
> +     * Because PROM is running in 32b mode, it clobbers the high order half
> +     * of all registers that it saves.  We therefore save those registers
> +     * PROM might touch to the stack.  (%r0, %r3-%r13 are caller saved)
> +     */
> +    SAVE_GPR(2, %r1)
> +    SAVE_GPR(13, %r1)
> +    SAVE_NVGPRS(%r1)
> +    mfcr %r10
> +    mfmsr %r11
> +    std %r10, UREGS_cr(%r1)
> +    std %r11, UREGS_msr(%r1)
> +
> +    /* Put PROM address in SRR0 */
> +    mtsrr0 %r4
> +
> +    /* Setup our trampoline return addr in LR */
> +    bcl 20, 31,.+4
> +0:  mflr %r4
> +    addi %r4, %r4,(1f - 0b)

Nit: Missing blank after last comma. I also wonder whether the parentheses
are doing any good here.

Jan

