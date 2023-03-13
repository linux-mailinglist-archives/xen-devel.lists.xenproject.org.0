Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793FF6B7E35
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 17:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509356.784956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pblSI-0004ml-Cm; Mon, 13 Mar 2023 16:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509356.784956; Mon, 13 Mar 2023 16:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pblSI-0004kL-A6; Mon, 13 Mar 2023 16:55:26 +0000
Received: by outflank-mailman (input) for mailman id 509356;
 Mon, 13 Mar 2023 16:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pblSH-0004jd-8g
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 16:55:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2228681-c1bf-11ed-b461-930f4c7d94ae;
 Mon, 13 Mar 2023 17:55:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9795.eurprd04.prod.outlook.com (2603:10a6:10:4e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:55:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:55:11 +0000
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
X-Inumbo-ID: d2228681-c1bf-11ed-b461-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsJT/JtwUHt38nbr/RwKlJgrjqxoGJ21QLUxaTFHzxkNEHWS+zXY+V8ucdyfJIH7LPp0goRcFOEYdf78O9AGt7iTLhqZIWaZ5D7Qg8gxHShKHW0mK+5VRQAiLACX1FhKQElCbM5AZbBvLhd5BOOIbXRqdXhw2fA7YWL66BBs2Z2YSqj2IEi4jBrjGxQEjZK85VS50Y/N9YCynDRW3qqzeBBAkFBepi1TRo4RaWyC8mUyFN0NKh2jREJMZOVrhBXpc15gjvAGxbOfVjC6yqwQQocH71y1adAUWP9ysyTVL1/Krtmw0/r2it9ndhhHF/LjOIJo2eSRLA+fRPj/YnikOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDtnIO33SPjLrOn2eD85FCIXxvvtSiJuPNHVXbgMZAY=;
 b=Exw1P4P6Z1XHbINUJYRg5IoMC/gC8XwfdZwWxqqVIcwYHO2s8STbDIcnxJg4gUX8oLURQbv6HYXJgNZLols3L7OcqjWLfnWbQ1ZS1zrm6BN92D+8pElFo5NNPdhKyUTCkEsJ0tP4HKCKP23yQ/pPE9TH3avrVYaFlXGjBtqknkNKuSEhzr2Q5S4XzbzSt0CoDq95dfq/3GNLJ0Ca66s0eKSUBoNF67bYvP0o/zyuM+7GBxPTiAqgRLPcX5ZU8JGqLGKBpxZSBm6FirlExkBPGQN2lr6hTons0uVd+sVUF4s8AvJHRL9KtT1swVGsbYxXDfXi+r7lZ50UxuPooKrrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDtnIO33SPjLrOn2eD85FCIXxvvtSiJuPNHVXbgMZAY=;
 b=HbU7n+BC8bnHGWwBqjO586Y1Iw8VAMZGRv5Xo9N6gLSY03358F9SVkam4l+pAidubpDYbNdxTS/s/zP9pAUyUFnx1615drriM59LCFf4SOZYQwgZq0QP4Qyl6bxsmMLVjZm4Gdpd27Sp3Z6t2zDLXdJeKRoBaiI07vYirCAyfNb31+IomF7aNEllqwoIZD9JnhTOIEU3FatQ8C+kYa+Kas+0fR84j6PPqsVYwx9sbZwccFfz+yAnAioi4zsD2nsNBvwt8RFY92cW3/6WeQ5SSTfa95UcOd/dYOkCfbRL/dKRhpjfqzWvlDz4lXpjK9kVvc1myBhmZlGtoAj8vdNvWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2bcd9829-498b-228a-2a86-67f8c6e859aa@suse.com>
Date: Mon, 13 Mar 2023 17:55:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/grants: repurpose command line max options
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230313121632.86789-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230313121632.86789-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 767a859d-1923-4f11-eaab-08db23e3b550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qnGBhh956aCucr5bDmJVh2oFvP+NVz0tF3Yk4jKwnaFm+cvN2jFTq5xHt536/mcUGcVv5QGqBQKAnX/zkpwDwIwLUpoY1MwOsnIdeh959pZ5NWSaNiBdXi0jgF46sD1BBXplCS2vvq6CZP193FPmE+IdCQQ9Wi1ENEX3K9Nh5o61a4L+y+wyTrFHwgrzmI+CYvnnsA2mMdTUOt7CZX/JdSSugknFRIQdZ87o6u6PA/NBlYu+yECi2KIGHWWSmhZuu/vpqCD/gc6Qun0Omr2pFrzPsDz0D3BDCQvcVCIsig0a1+EqY+XbrLVLX89na/zZZ+bll/L1Q8ew0AJMrgXxOipkuF4TgDfCzDFrR7Mc7SGPAU4DUPWty9G6fZtKWUuP45NyMc/7Myb0sEJNAYJUxLX9ta67dAXrm2sTFm20U1NoM9pADDI3fP7K7S/8/1CMM6zlGaBBq2O6dlCaKf7vtUXWGBCS80kIiB0+XX4DiZTrGiHaXtc3was7eMxymADdsF+3Q4+86ZoxnsJqMlBV0ACu1RiU913cixpuf3r0gqm9CXirGwYayE8BOkhxQuwV7fkuCUCgfO9ngVkOyer+FVdq9mY2wCgyOJybT+Yd5205DXXgpj3y5arC4kyP5L7jj+nSftVdWNWdyYiY/IuRv6dY1JTBbvQsilovpGBVJOLTSHXokXpurFzmCOIMsER1g/GpEc5BUBCoOUfos0y8B1uKn/BA7MNh3ZsXmOZX8oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(6916009)(4326008)(66946007)(8676002)(66476007)(66556008)(83380400001)(86362001)(186003)(2616005)(38100700002)(31696002)(54906003)(36756003)(478600001)(316002)(6506007)(26005)(53546011)(6512007)(6486002)(5660300002)(8936002)(31686004)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlBwbktTaTJ0cEZYS0RLT2lFVlZLNnk0UzFFM0cxNVB0bHV3SzlKZEFqTWIr?=
 =?utf-8?B?dXJDQlFzNTlXQ0xVNlBFY3BLVTRyZ1dVV2RhQVhOMGdqeWc2QUUxL3ZGWURZ?=
 =?utf-8?B?ejFCeHE3cHYrVDlnWmt4cDBZRU13eHc3Q2Z6RmpVK1pqNGlUSVNmRWxwOWNo?=
 =?utf-8?B?a2l1dWI4N0cyRDVRN01jTVA2SkJNdUxRSTZBQkRwMVNMaE9rWUZjTXpPM3g5?=
 =?utf-8?B?eEdncE9FQnlSQ1YvSlBYRUppemRydmYwRnEvL0RRNjRBMjExR3J1MDRpR3lm?=
 =?utf-8?B?SW1MRVltYi81Y1lGSjBaNXFxcldwdFhkVGE1QWtReGJaZ0JpbU93RklkT0d4?=
 =?utf-8?B?Q2VtVVFVdkFGYkkzbGFqT1ROQThHWFRqRTdVeWtxelpwSW9HZTE2MDM0RzhY?=
 =?utf-8?B?bStZRkVWMzh2OGZIOEdOSU5zMjIxQWswKzJ6Vzdtc0M1SzUxaG9PTDUvWFoz?=
 =?utf-8?B?Qk9zTnJla0VOTmc2NzRFb0xzNmZSZnhiR1J4UTl5azdWdzRISzFSaU5oVEpJ?=
 =?utf-8?B?TXlIbmZoTDBnalVsVWJBWWs1ZkFUdi9LZHpGVlZYdkY3YWlFRGM0NGFrNjJz?=
 =?utf-8?B?a05VVmh0WkRjUVlsVGp2TjFPQWNPS1J3MzBQakVqUTV2ejNPbjVZNkY1ZmNM?=
 =?utf-8?B?ZzRpNmdTK0NsTGxvVWNFWGU2Q09ITSt1QmlaMUU0QnRibTI1K1dhR01od2NG?=
 =?utf-8?B?Z0ZCSnowNlpiOVd6Tlc1bzZDd2ZWUmZmemFhdzJoSkpodnZrNlJyVzhoTEVT?=
 =?utf-8?B?Y2NEUE54akx5SXRidTVqT09aOTBXc1dOaStJcExiSEpkQ3YxdkZ0L2MyY1RJ?=
 =?utf-8?B?eVIyV01QeDQ1czBFejJ4b1dHU1JJYVlUNE16VEFsUC80Nng0N0Y0VVpZV3Z4?=
 =?utf-8?B?QVQ2YUovcUViY2JVUzJBSW9sQ3YvMHlrR3kvRVV5bWwwUWJ0NXBNMkdBNitE?=
 =?utf-8?B?VnZha3pMMWllc1Z1Mk5yM2N6ZWZzWWNmdTdqNGtVcVpIYVgvL2RUSVdPMmdq?=
 =?utf-8?B?dWI1M0RTZ1YyMEJwdDU2Ry9aYnB1b0lIejRqNWc4elVZSmV0VEJobUpzRnNP?=
 =?utf-8?B?VDlDNVlxQzRjK3FoTDZmb1BYUDNweVdoUkE0SHF4U2dVNVZEQ1M1dEZ1N2V3?=
 =?utf-8?B?RlhyU09zMGZRa0oxZ1pKeXowK2JCbXg0ZGZiajNaZ1BpYVF5MElpYW9wY0RF?=
 =?utf-8?B?Nk0vM1lGb05ua0dlenduMkJHSVkvVnQ1V1JWT2VEWG9QaEt0NXNzVFovNWQ2?=
 =?utf-8?B?TUhtYitrT1kwSGdoQmdTMnhkZUd1Mk5uS0k0Y1JBcHhZOTBoZVIxSXdUb3oz?=
 =?utf-8?B?ZDc5c1dlZDYxTUlXOHZTOHF1N1hkb3ZJOEhJOGk5MHVpeGtzRWlYSVFHdWdI?=
 =?utf-8?B?azdQRlBqcStaYnlCUjlZNzU2NGlYd1JhMWJWRTBZaXFpNUNLZjFBVTh1TFlu?=
 =?utf-8?B?azl3S0Z6ZGh1T2pDWVE5UGI2cHVvUEVhUk95T1ZEQndIYmVLQXZ1czVkRE1W?=
 =?utf-8?B?UUtKUTNwSGp6MjVyYkVQWGxxQlNZUGh2YXc0TXdJZ1cxc2pISHQraDFNSVMr?=
 =?utf-8?B?SzF4U2tmZElPMmYyQ0VCZzlzODBTOXpkd0J6YkhjM1l1eWxSNjZ4WnFnb3Rq?=
 =?utf-8?B?SnlpZ2pBMXU5b3Q5SHdOWU1DYWU5MmttYm0wRkM5MGkxWkdVOHNlME5pcnNx?=
 =?utf-8?B?azBlVzdXSEp4UEI2SmFGeDVER2dnM0RJUG1ETlFJcXFpaWV5MlNwaUl3eVN5?=
 =?utf-8?B?V29pVHpSR2NRak5wK2tuNUY5TWEweGdmcUNzQnlHVUorMFV4dEwyYk5udkNk?=
 =?utf-8?B?NnNaeVhzSitKd051NENxSEZBMnYzK3dqTjhwK0o1NHBkTm1XVGpWWE9keHZn?=
 =?utf-8?B?eTNyZlpvWGdubDJsZGpyanl3NU50YWJPaWRQclZ1elNpMnpxdU43Y05mUisy?=
 =?utf-8?B?cjJqQzA5aGU3R2g3TWRFNHBETkVFdnF3am83Y2RjOTlNNXpPS2dlZ1dTdTFp?=
 =?utf-8?B?bWU3eFRuL3p4YXJOR0NadFJoenZ1My9GQlZMcStyNnAxUWFUNlRrakh1UVk3?=
 =?utf-8?B?QkkrR0svOVFrZ2hEakdMVXoxUERSNmNqYkRRazF3bDIwWllzb0hTOUx3VnNk?=
 =?utf-8?Q?/BVlDCETvs8q2DS+RSqSI/x1Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767a859d-1923-4f11-eaab-08db23e3b550
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:55:11.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQuiM7dWqMnu14o4UQFqbkJvX2xm0VgYoTW7pzEnErhtBnUyPpbUJ+WX0nW6DEI23nZEMovBIeWNzd5l/mZEfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9795

On 13.03.2023 13:16, Roger Pau Monne wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1232,9 +1232,8 @@ The usage of gnttab v2 is not security supported on ARM platforms.
>  
>  > Can be modified at runtime
>  
> -Specify the maximum number of frames which any domain may use as part
> -of its grant table. This value is an upper boundary of the per-domain
> -value settable via Xen tools.
> +Specify the default maximum number of frames which any domain may use as part
> +of its grant table unless a different value is specified at domain creation.
>  
>  Dom0 is using this value for sizing its grant table.

dom0less DomU-s do as well, at the very least, also ...

> @@ -1245,9 +1244,10 @@ Dom0 is using this value for sizing its grant table.
>  
>  > Can be modified at runtime
>  
> -Specify the maximum number of frames to use as part of a domains
> -maptrack array. This value is an upper boundary of the per-domain
> -value settable via Xen tools.
> +Specify the default maximum number of frames to use as part of a domains
> +maptrack array unless a different value is specified at domain creation.
> +
> +Dom0 is using this value for sizing its maptrack array.

... here. And even ordinary DomU-s appear to default to that in the
absence of a specific value in the guest config. IOW at the very least
the info you add should not be misleading. Better would be if the pre-
existing info was adjusted at the same time.

I also wonder about the specific wording down here: While the max grant
table size can indeed be queried, this isn't the case for the maptrack
array. A domain also doesn't need to know its size, so maybe "This value
is used to size all domains' maptrack arrays, unless overridden by their
guest config"?

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1956,18 +1956,15 @@ int grant_table_init(struct domain *d, int max_grant_frames,
>          return -EINVAL;
>      }
>  
> -    /* Default to maximum value if no value was specified */
> +    /* Apply defaults if no value was specified */
>      if ( max_grant_frames < 0 )
>          max_grant_frames = opt_max_grant_frames;
>      if ( max_maptrack_frames < 0 )
>          max_maptrack_frames = opt_max_maptrack_frames;
>  
> -    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES ||
> -         max_grant_frames > opt_max_grant_frames ||
> -         max_maptrack_frames > opt_max_maptrack_frames )
> +    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES )
>      {
> -        dprintk(XENLOG_INFO, "Bad grant table sizes: grant %u, maptrack %u\n",
> -                max_grant_frames, max_maptrack_frames);
> +        dprintk(XENLOG_INFO, "Bad grant table size %u\n", max_grant_frames);
>          return -EINVAL;
>      }

I think I agree with the relaxation done here, but I also think this not
introducing security concerns wants spelling out in the description: My
understanding is that even in disaggregated environments we assume only
fully privileged entities can create domains.

Jan

