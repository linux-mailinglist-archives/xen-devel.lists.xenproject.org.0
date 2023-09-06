Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0642479357A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 08:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596254.930073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdmH3-00012x-P8; Wed, 06 Sep 2023 06:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596254.930073; Wed, 06 Sep 2023 06:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdmH3-0000zl-M8; Wed, 06 Sep 2023 06:44:25 +0000
Received: by outflank-mailman (input) for mailman id 596254;
 Wed, 06 Sep 2023 06:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdmH2-0000zf-22
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 06:44:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf61ab47-4c80-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 08:44:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8212.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 06:44:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 06:44:19 +0000
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
X-Inumbo-ID: cf61ab47-4c80-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvBeI8zsJqTcNDCkNBo40VjljPC9h6cEnlW0R75wi/8hFaKLHuUHnI3nsQBpiejbhuBxewACfrz8r5dfJSn39ybIA42F3RusXpJwqFBd7UzRn9Mr+clhsmpIBop1FD2LwJXP+hahntZRSKjamtEx+zEZJTRVittvYz+JTfPZtiiaRy3U35TeSGRDU3KJjF8nUoU6UZCRE47Hobo9gt/cqgsMDBxYE8fuJ7XMdtqZiCr8x1YgT5eQIymnxBd5t6dIr5Y8awA9xNf/e3wK196C5vszsOrb14SmMJVTbWLzWK0LGAuwpzGN2qBK4+61Jg670m8aNV3ZvYgwfcqcWJNe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Em+oenfVRVwqQRq7ulmEQ3tFHmJloNlEfMFSV0WWKkE=;
 b=m4/6YU5YOW0ao1tEIMUaYT8uqNzhIL+A5AygbmvuARulAC4Wjg/I1bMxWxM+kmLYdDiP6XYUUOXwwvCkJmqAkW7HtWyztFxDmLLO0oAhbPjXaBRF4kgP38A633vg/OncPkMKQ4qbEHF+7+/xazWc2BFdGAO/iLJuKc/X4bxdTFdTeP8XRuwbBGrzEC7x0UC0XbIydvN8NhEz/nJ/1kJWYzIDnuh5JnB0lCdHzshc4gpSY1/fAy3RUr5qUWJati915VjHZtsyQgZnDQ/3yaaEh04r8WJL3N2P89Kr9VCj1ufX1EdJpEsJ3ZbdRakpvLqPjYUN0A19dnyt/wKY2SEyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Em+oenfVRVwqQRq7ulmEQ3tFHmJloNlEfMFSV0WWKkE=;
 b=A8msOZLxtfafBrxDOXhYRIdiHjaZcfazhCuqYMeyaYrtFbOr59B/ji1Sj0Q/1MhMJ9gnFTPsGUC8RwIcuTXZYbgKhKDVv41P6QFVOnLSkF/hReJ6unEpXFF7VNfh/2wphRRKs28P4nxLcLXfA5R81Gc8zlJwsnbcC2woT6T856Kgt7bZD2Zx51007QBHsMZptxyO72BBl4t4eRflDSy4hCLQq6rmFLfqkzUGSvJ70zLRpuYvphG4n/LWgCAjerPE0RT98xNUuAlZbyjPT+S5xRHZszjFqooWyo5JORzKFudh2IWCyrN7z+nfdfZluWyo3Q1NIqq0b0uzxxEUXqg0iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e5fc9fe7-83fa-98a0-02db-8d28fc2b0524@suse.com>
Date: Wed, 6 Sep 2023 08:44:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] xen/ppc: Drop support for pseries/OpenFirmware
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1693949731.git.sanastasio@raptorengineering.com>
 <8c09322cff220d4d102d50b2fc45e9290106d109.1693949731.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c09322cff220d4d102d50b2fc45e9290106d109.1693949731.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 4debd843-db92-4c31-4677-08dbaea4b210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iya3MwKm/+XsyS1wwFwILiiPfC9JUJ+TuY+1qoEo/OhPJS5rbwTN14FWD6qNhC1IIlBDq6+vODxYLcFYYlb3O0lGmPDoHpUg5dOzfMqh0UWKSGJchl3g01WW4dvWH8r4NMGtcz1YbQAsBMHHanwxO86TMrGy1DMf2siV4X/jSRvqYnpSCtcrNn/sx+SxnjGyl85HtUTbE4sISzopieIbStkvhLrM0hSLZRiFT9b5wIMrTEpxuqjZnMmkzokUmtAHJl3bUWdbfS01vi2MNfzWsAb4liKvr2AKuSNa9AGDJ1ob9M4F3XMN0I6kwX7Npfq3jsJT9XAKMgj8oo9O321iHkMvaHz4jd+38MkEsJqdtwiGARd4d73bLiluBZuaDjvnIm+PZCQ+qCai1AQaezfVoqxbqK+KmBGj3TaFxeF8Trts5/ZxCSrKmbXmqh+oXIAcCSMqoooft7572gCr1/RYNkBXPV38KKxkuAiPQa8P/nSu0OuWN1il/cDYCaUlH1qVrcahnRHXnbHCKiJVxnK8NN1l8gfTCULRYC8s+jKmToamTvH3XapqldcCEWCI8XTZ5AJgm4eYxjPF9/VFUOD7lB8UbydXWhRvVQRk8AX995al8HKA1SwykddLup+ybHBW0uFpO2L9WbFp2xKMeFg4xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(41300700001)(38100700002)(6666004)(86362001)(31696002)(478600001)(2616005)(26005)(6512007)(53546011)(6506007)(6486002)(66946007)(66476007)(66556008)(2906002)(6916009)(36756003)(316002)(54906003)(31686004)(8936002)(8676002)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHF5bFplSlZwL0E2dm9VWkxqNXhIOGtPT3NuckM1cklGdHNBVm1OU01XQ2pS?=
 =?utf-8?B?SEhXNFNndGNKY0R6MytSV1IyTFcwK2pkY0JYYktpMGVwZVFBZnVoSkdaVmc2?=
 =?utf-8?B?elJrY2g5TDl3ZEhwQzU3OUVjWXYvN3BTZ25yQ0llejNaY1dWWTE1S25qMGNZ?=
 =?utf-8?B?N1d6V1NDZnlRbkNyRUFYd20vMlR4TUEwWFBwZzc3T0hHWTF4ams0bmVha1lx?=
 =?utf-8?B?MFBmMzNHNWNHMEpYbXAvZkswQ0lZQ2NBVDNIRmhIcjlPdTJmYlZNS0Rlblg3?=
 =?utf-8?B?RkpwQWNHM3oyaG5wNnBUbWsxV1NPT3d3UForYVltWlg3cEt0QngzM3ZwTEZm?=
 =?utf-8?B?alc1TmdUZzJQYS9NWFlCb0E0QWxxL2g2OVFzMDJMY0xRbytxeStTcHVxNnJi?=
 =?utf-8?B?K2xFdmdVWEtMMkZQWjF3eXd3RDJzNlFxcFVja0EvczBwS24rMVMwNm9JVkpz?=
 =?utf-8?B?d1duZ3pxNW81U0FTQ2o0OUk1UzlOejZjVHdlTzcvQVZmM2VIRHZsdWw3Wmgy?=
 =?utf-8?B?QVFOb1lPNzNYcnNRbGhsRXI1c0RkVGI2RlV5RmQyNkVIT01yTU5FZmJEa2hU?=
 =?utf-8?B?MENOUTdHU0hFRXlpU0VvQk84NWZ5aEpKOWZsM0Vid05NMVl0Y1B4YlhIZWg5?=
 =?utf-8?B?NlNRcktmK0ZzcHFYT2pLYTFwek5LWVZrK2ZoN28yMXlXUGdicXRRck9ENVhr?=
 =?utf-8?B?cDRVamtXekdBRjFqd0ZmYXNCNTRsSlozdFN1N0V4N3JwK2tzZ3BYek9xUkVH?=
 =?utf-8?B?L1d3d0JDNFduOENsTjk5RVZjMXhaa3Nkam1aYUVXV01zRTlJZkxuWmt5WXp4?=
 =?utf-8?B?YnYrdTlNV0d5cEdVMHpHbTNUZWZEUGZkQnAyb3U0L2lWOXRaeGFSaURkdHVM?=
 =?utf-8?B?bzA5S2pyS1hrbmhsaEd5YVl0NjF1d2FqQVczWGJML1V0OEVvcjlMVGpqN0U2?=
 =?utf-8?B?ZDU1NDVQZlVKWi9zMnNWajl5R2I4L2ZJNHZMcTY5OXBuaWRzYURtY2Z0WHVG?=
 =?utf-8?B?VUt5cnNSY3NNRktORlhLZHJvbzFxRzV3aEFGZ3JzeFZ1VTJnSkRLTDFoMTlj?=
 =?utf-8?B?b1NRSURYZU9ZQWFISGwrS1ErNXZGRi9LaDBaV213ZUtYWUNVL0g2dVpDSWdN?=
 =?utf-8?B?SC8xZk4rV2lYL0FTaWdxdUNrdm1uUjU0azI2TnZydlNDNUZ4UkE5MW82U2Jz?=
 =?utf-8?B?Y1Vpd0xWdkoyNU0xSDZ4c01RbVVoMEtCVXkrZ3B6Nkk1MjJnYTZqbUIzeXd3?=
 =?utf-8?B?OTUrNVdzc1NaMDJzZGZud3NWS2pZOVhTRDI4YlR6SEljMnA1ZG1md2pFSGxM?=
 =?utf-8?B?b2VScGN1YlZNR2RzMkg5UlZpU3U1Y1pXRWpmeFduaEhESFkwL09jT05RODFt?=
 =?utf-8?B?WjJDYlZaNU5Qb0JlT0JkT0lzYVJENHgwNGd1YkZoSHhvaDBPRTV0VTdjMzNw?=
 =?utf-8?B?eUg2NTEyQU92dklrOW1yVlg4Nk5tY2lqYUVVa1RybGtsUXhmZ2svRjQvOWVL?=
 =?utf-8?B?Wk85K3VBYkRNY1YvTmhUZG1OZzlVZGl0QkdzNGJCMityUG9scGk5NGhRdTdC?=
 =?utf-8?B?UG5OaE9rck9IRThnV3lUbkk5cDZRdVdkdXdSWVJwcDIydTMvYm91RHdJelNP?=
 =?utf-8?B?dFNnWWMrSk13MXFKQlBjNUlGVjNvaWNtL0t4cTRJOGNuc3ozKy9MOU1LcUV5?=
 =?utf-8?B?Tk5hSWpiUDAxRFNITVNUSGVTWFFnQUVVeFZUN3hFSTczYjRrS1pnbUIrZm5q?=
 =?utf-8?B?YytMWmd2T040R2RVbXk0R2JGejBNWjh0TlRZdllaTXgrZi9uUjV6UXl6VE5l?=
 =?utf-8?B?TTZGODQzcFZRT0F3SXp2K3o4UEhodXY5MXNBT1RabmE0b3VyK0lHN3E4ZHlw?=
 =?utf-8?B?ZTFraW1meVlyNnFmVytDa3VBeFVCS2FKTml1QnNxVVYyVGJJNmVLR2VuN2lH?=
 =?utf-8?B?RDdwMkpDU29CakJQNHVtNHM4S1FHcUJxdERMRXphZ3JWWmZzeG9XaHNiUXFq?=
 =?utf-8?B?TFBZNURXemFZZjlRMVE0bnVaaElnWWV4TVdENWVsMXFjUFREYWM4WHJOZGhs?=
 =?utf-8?B?UFA1cXdRSzNZRDFLMW00V1pnZGtXRmw4T2xSdHcxalpzaG5pb2s4SEhKMmps?=
 =?utf-8?Q?KIbsDWelNgUWiAaHp3XY26LEn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4debd843-db92-4c31-4677-08dbaea4b210
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 06:44:19.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbHsL+/oqtEpPTkfrHJCTx8X0HTGuQFGRAQleu4LwaKR06DdBwszWmcBflA5MGHWi4QetjeR/vg/5jhjXnTscg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8212

On 05.09.2023 23:46, Shawn Anastasio wrote:
> Since QEMU's PowerNV support has matured to the point where it is
> now suitable for development, drop support for booting on the
> paravirtualized pseries machine type and its associated interfaces.

I think you want to mention that the pseries functionality was actually
broken by the earlier change, both verbally and by means of a Fixes:
tag. The breakage actually may also want mentioning in patch 1 as well
as the cover letter.

> --- a/xen/arch/ppc/setup.c
> +++ b/xen/arch/ppc/setup.c
> @@ -14,17 +14,12 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>  {
>      if ( r5 )
>      {
> -        /* OpenFirmware boot protocol */
> -        boot_of_init(r5);
> +        /* Unsupported OpenFirmware boot protocol */
> +        __builtin_trap();
>      }
>      else
>      {
> -        /*
> -         * kexec boot protocol
> -         *
> -         * TODO: This currently assumes an OPAL/PowerNV system, but it's also
> -         * possible to be kexec'd on an OF system.
> -         */
> +        /* kexec boot protocol */
>          boot_opal_init((void *)r3);

At least part of the comment may want retaining, as the code only handles
the OPAL case?

Jan

