Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F479A51F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 09:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599090.934351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbl5-0002A8-6L; Mon, 11 Sep 2023 07:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599090.934351; Mon, 11 Sep 2023 07:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbl5-00027q-2x; Mon, 11 Sep 2023 07:54:59 +0000
Received: by outflank-mailman (input) for mailman id 599090;
 Mon, 11 Sep 2023 07:54:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfbl3-00027k-7E
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 07:54:57 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f362f44-5078-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 09:54:56 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM0PR04MB7170.eurprd04.prod.outlook.com (2603:10a6:208:191::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 07:54:53 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 07:54:53 +0000
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
X-Inumbo-ID: 7f362f44-5078-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NG6FaREWGUQRi5mLxvuX4QzAbdXGLPC4d3yIboPwD3rqVN+WdSMVxW/7ZE82BqlGD36Fo2Z9v4wAtbuJnkPtR0L4R21l8NaaOgeK/k30kmZL2ldrSzMOfhGQDfoxWThPlhP/Qk9B7hFz4Pd3R8mNBpaPakiIvkyl0CwGP4S21ofR5AfYvPHBsCq+vtAy4ArRFIYiF+J8H7tggZ4kAW86LKEfvrrFbXilgS9w8zD269ArI4dbMHzq/7nv7HBh7VsMEn+byL5ecbGGM6ykqJAYeJ96DDcLqcgkVSgHFzw7JCoJAeAzp2QkwFXKnDKWH5zEGWvw18y/dXnWmOpIdXkbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZiSXLeVFAdtRK2ZaQzhK7Z8qpa2d+a926zKVRu/02s=;
 b=L1slzabOceTPWhhoZmRgU1mn1rXEXD/2nYGbYnW2UccMkkJ9AiNMf+OewJsUYiS3qUYXFLPqtonb8gvj3mXVQNkJqfey3TS+RikSfRB5Psye27uwvCWAsaYnpofik/JY57P7W87/L4sp7h2kv7Gdhg6yy6CigdxcF9GWYUiNecDJAP8M6T8kjvYSqLuvcnISaci28ya1IIHNC2NH3MFypqFDz+/U9FvU4h+lQ7RXy+tUyxcuaNST16Der3C0ozUV/ThxG6GOunkH+Gcfn8W+/pTM3H9uQNsZXMDvAgnQc5nQiQkyFVr3ENlQVDokYdyWYUquLImcBjjndLuJC5xY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZiSXLeVFAdtRK2ZaQzhK7Z8qpa2d+a926zKVRu/02s=;
 b=cvDT6UDE2Qm5SkProo1KvcrEAptAVFVFMv7c4coB6D52670p2PFkvI1xQzXoj7VehJNX3zXb6syiL/ybwvrlIibHm0ynwuWRqXlBBV/KMD/Xcy6+WUW6cexy1KIZEdHGFGWAxe5dglzAqloK0UtMR6tyDI8s9zN5irdycRYwDKUaPmWd41xfWytilBmdzDPQRevtFh0zjtXr/iImAD8CH80NTZCvCL/XWd1wXkLZlF6YGpSjwIdDlmqRmKhJxJpn74Bty4R+YCnOjEvMwTWp71mLw2HdmxX0BjsXFsveC3byppNrVgQnFSbdH/aP4NhjtIxcr6xeYPtFqkOREfBZtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>
Date: Mon, 11 Sep 2023 09:54:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 1/2] coverage: simplify the logic of choosing the
 number of gcov counters depending on the gcc version
Content-Language: en-US
To: Javi Merino <javi.merino@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM0PR04MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d833c9-2651-4aef-709a-08dbb29c61fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dqwEPJjKCdfO3gW/3J3lf0g2ZWar1Qn76AKcxUHZWnIWWUr4s4100+PIrcE/nKmiOt4QUA2DPtrwVJea1PGUBr+WWWp54qfscBtnOt2zdWngpEY9EU+5ValKRpck3ckrROoSHfLCydkPLFqH+YFFnk4U4RhPPMS5WLJ5IFL/0QGGQx7cE9aNQw83uHBPBF5yyAvV1u/B6N8wi5zPlvnT/89ChxWU+jOgfGVD0NlGTwobSxt6x0aMEtmqribWyIl3uiq0a9xZr5VfWm7GVKKgWJfLJN9cfnnibSdya/Pq5N4JWnJGFpS4IPu47CkxHvIPMacMpiz84L7Rly1njMzabXHh3C4tzyVObx8MkT8hzMsws6CGMIMsb3uS1B/wxdW+2a2TvQj/5TI+NXdEq0RsjE2ywjO6hEF7pzCWeWhig8ale0+SZ/k2fqUeUzpRE63KtOjZ1T1iqh6L85l8g63OJN2oo8ndNRmYGdJNCTWJsh9BZe+AOh/gInMrKPVdKYGZOfFwlwftvWm5tRMOzEKX8/oBVLC4l78AtUV14mSdOV1Vu5GB67AkDaVhGz8FAhT/GTAOejN+3bmIkXKcPXBYvpUGeE8WYyMRBZTKdutnTux/YAWOE1G42a/vDsRbaQxOptA40RL/RSK8HiB3lsy7JA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(31686004)(53546011)(6506007)(6486002)(41300700001)(36756003)(86362001)(31696002)(38100700002)(26005)(2616005)(2906002)(6512007)(83380400001)(478600001)(316002)(8936002)(8676002)(5660300002)(4326008)(6916009)(66946007)(66556008)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVZ3d1BhNW0xRmNDY2dIM2xKVHkvSnQ2MlZwSm9lNy8yWXJtRmtRY055cVZh?=
 =?utf-8?B?NHFBTFhWT3lxYmJiR25RaGNDT3R3Y0xIK24zNU9VVnB3NFRRRjFTT2FSeEY1?=
 =?utf-8?B?VUZKWC9Za0tKdnQ2WWw5ZTNiZnBZVU4yT0U5TllUTlcwenVOak51L0M5SUdL?=
 =?utf-8?B?Z2xyMXdZWEgybnh2S1Z0SWhhSU9ESnluTTAyeHExYmp3RmhPYmEwbEloQWlM?=
 =?utf-8?B?OTdPRHVhMEZYOVkxVjZTOE8rWXc0U0xQVlZmVXdhM1NEWUlhRXhOalBzd2Ns?=
 =?utf-8?B?YjJYNFBhdEVON3lzbHNySVBiaCtNejFjSzRHUzFNcGpYSkEzeEhSakxxaTVy?=
 =?utf-8?B?VU5SeFBaYnBhZElFMGpyeE9oNnUzR1hoWjZBOGovalJIc0xmY3NlQTIrNEFz?=
 =?utf-8?B?QnF3SWxSQ1d3TUkwcnBYSGN2Q29FZFVzSEJpMmZCOEFVRE1RQUduNENzcm1X?=
 =?utf-8?B?WHNsa1hjMVRtbFcycTI0SXFCcGk4Z3psODRPNG9GL1FXOGRLWmZNM05tMEw0?=
 =?utf-8?B?LzhrU1FFNXA3Q21rVDUrakZjWUJNNlg1K3BURzFWMmdJdUVGY3M2c25ldzJa?=
 =?utf-8?B?UTd3dytFYUVhU0lRNm9SWHUya2Z6UEZFbXVGcEc2ZDBUMG1VZzF6bTJsYjZm?=
 =?utf-8?B?U2psdURsQTlCd3hyZHVPZytqRFplY25pYnJJeG9DcEJSaEJJai83TkdaTGpK?=
 =?utf-8?B?VWUvemdLR1duNUZtaVIxU3FtZ05jei9DcmV1VEVHZU8yVlFoRzlBMTdUMmIy?=
 =?utf-8?B?NzZwMEJJWTg4Q1A4UzNtcUJjekJJSlQzdmExcXpUNWVFeFpZRnNTZmlGOUxV?=
 =?utf-8?B?OEhlRkVUMmtBL1lJYUUrVHNRNFhlUjYrYlMvT251T3dyMHZPTTRtTE92M0k4?=
 =?utf-8?B?WEJwVjBGdWl6dnUxNnFjK3dxajU2R0RvY2VIaHVQY0ozSjR3T3kzK2NvUUdl?=
 =?utf-8?B?WnJzdG9EM25za3ozYnVhWm1BMFVQL3Z3TzBUVkQ2VVlycVNKYjVkM0pBRTNU?=
 =?utf-8?B?N2FOVThYc01qUFE5bzhhQlQ5dFZmMnZjZE81SUVxa0U5N0pTam5COTBnR2pq?=
 =?utf-8?B?TDF4OVBJcGYxaGRmVUxpNFl3ay84TUJjTDMxclNqOU1Ib0pBeUtIWUVKamZw?=
 =?utf-8?B?RHl3VnVKb0Z6MWNnTG1xb1IxbEs1NkdmOG03b2lsQ3VXQlAydzB3OGZNUE9O?=
 =?utf-8?B?MGxEUUhoajIxMVhCUnovOEN1aXdRcWhzRTExYlNDZlNFYXd3c3hXQUs0eGdU?=
 =?utf-8?B?WjBCWktDZlFHakxEc2tqc0R4aWJYT0Z1cGRuVXR2UEhlQ292dkcvNHRNVFNE?=
 =?utf-8?B?MFlkMHJpVktmZlBiWVh4NFRnQ2drYURhVjFOMkFlQkljSUNtSjlvMUw3QW5h?=
 =?utf-8?B?dU5CT3N3TzducFRmODBDMGhnTnV1SHpGSW4wQVBqN0dINWpWLzRJNk1kdnBF?=
 =?utf-8?B?MEZTZ2hIakI5eTVSSGhHVmJaU2Q2TW9KaXh2UittMVFHd1hmdnZnYXFYbkNX?=
 =?utf-8?B?SnlEdHFwUnExSSsxMlljVjRzejVaNFVETnFPclFwV0hNZEVvOWR0c3BqMjFh?=
 =?utf-8?B?WXJBeDNHTFdqUHROL0o5ZGtQam5ScHlZS1o2clhVWml5QVY5dzRCcE1XREFC?=
 =?utf-8?B?ZFd6MEduVjJiVDZwdXRYSWZqdU9WY05LM2pHcHFKS1hzOGdGUzhSa3VCN2VN?=
 =?utf-8?B?K1A1VEpHTndON2NSWjNoKzNxWlVKUFpVNzlBdEVwY1dLeFI1SXhsZHFDQk85?=
 =?utf-8?B?YnhvV09SSHJkd0tGZlBaYnZ0NFlUMTV6cVRLZ0RUTlZlQU91QnBxMjAvZWJm?=
 =?utf-8?B?b1JuUWFxVHFvNnFXRzFhem9HTEdCSFlDdEJvcGxFWDdVWUdaUUxoZXp2YlV5?=
 =?utf-8?B?eTRDZE9IU0szWGxHd2tBWjBOcE8xVnNHWStDRlNVMDVBKzJ3ZTNpUk9Bb29W?=
 =?utf-8?B?c0Z0VEIyNmVFbzlqb2RQYXFnTmU5R0Yvb3phOVE1OWIwYlM2VEF2dzJxb09q?=
 =?utf-8?B?QVM5NzgzbE10U1JvNGRYcGZDZDBNYkNHV0VoRzhubHYyR1diUm9yZjNRSENZ?=
 =?utf-8?B?bEU0SWRuajRTYTlYZmxqelVrY0RZcjUxWSswTkEyeEtDVDA2TjR2WDlQSXNi?=
 =?utf-8?Q?u3a6jd24h4lNLkVVIaISd7KY7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d833c9-2651-4aef-709a-08dbb29c61fb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 07:54:53.3419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hNt3pqWb8NvZDtlh7St0l/yVFf5pz09pSovb//8OHo9Sc+ADOdl+3o9LZToRTIlRKImiE6wNpctba9HtKc+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7170

On 08.09.2023 18:20, Javi Merino wrote:
> The current structure of choosing the correct file based on the
> compiler version makes us make 33 line files just to define a
> constant.  The changes after gcc 4.7 are minimal, just the number of
> counters.
> 
> Fold the changes in gcc_4_9.c, gcc_5.c and gcc_7.c into gcc_4_7.c to
> remove a lot of the boilerplate and keep the logic of choosing the
> GCOV_COUNTER in gcc_4_7.c.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  xen/common/coverage/Makefile  |  6 +-----
>  xen/common/coverage/gcc_4_7.c | 17 +++++++++--------
>  xen/common/coverage/gcc_4_9.c | 33 ---------------------------------
>  xen/common/coverage/gcc_5.c   | 33 ---------------------------------
>  xen/common/coverage/gcc_7.c   | 30 ------------------------------
>  5 files changed, 10 insertions(+), 109 deletions(-)
>  delete mode 100644 xen/common/coverage/gcc_4_9.c
>  delete mode 100644 xen/common/coverage/gcc_5.c
>  delete mode 100644 xen/common/coverage/gcc_7.c
> 
> diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
> index 63f98c71d6..d729afc9c7 100644
> --- a/xen/common/coverage/Makefile
> +++ b/xen/common/coverage/Makefile
> @@ -1,11 +1,7 @@
>  obj-y += coverage.o
>  ifneq ($(CONFIG_CC_IS_CLANG),y)
>  obj-y += gcov_base.o gcov.o
> -obj-y += $(call cc-ifversion,-lt,0407, \
> -		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
> -		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
> -		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
> -		gcc_5.o, gcc_7.o))))
> +obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
>  else
>  obj-y += llvm.o
>  endif
> diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
> index 25b4a8bcdc..ddbc9f4bb0 100644
> --- a/xen/common/coverage/gcc_4_7.c
> +++ b/xen/common/coverage/gcc_4_7.c
> @@ -18,15 +18,16 @@
>  
>  #include "gcov.h"
>  
> -/*
> - * GCOV_COUNTERS will be defined if this file is included by other
> - * source files.
> - */
> -#ifndef GCOV_COUNTERS
> -# if !(GCC_VERSION >= 40700 && GCC_VERSION < 40900)
> -#  error "Wrong version of GCC used to compile gcov"
> -# endif
> +#if (GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>  #define GCOV_COUNTERS 8
> +#elif (GCC_VERSION >= 40900 && GCC_VERSION < 50000)
> +#define GCOV_COUNTERS 9
> +#elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
> +#define GCOV_COUNTERS 10
> +#elif GCC_VERSION >= 70000
> +#define GCOV_COUNTERS 9
> +#else
> +#error "Wrong version of GCC used to compile gcov"
>  #endif

How about inverse order:

#if GCC_VERSION >= 70000
#define GCOV_COUNTERS 9
#elif GCC_VERSION >= 50000
#define GCOV_COUNTERS 10
#elif GCC_VERSION >= 40900
#define GCOV_COUNTERS 9
#elif GCC_VERSION >= 40700
#define GCOV_COUNTERS 8
#else
#error "Wrong version of GCC used to compile gcov"
#endif

Otherwise a nit and a question: Parentheses would want using consistently.
And wouldn't it make sense to combine the two ranges resulting in 9 being
chosen? (Imo in the alternative layout that's less desirable.)

Since the adjustment would be easy to make, I'd be fine doing so while
committing, and then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

As an unrelated remark: gcc_3_4.c is clearly outdated as well, simply by
its name. Imo it would have wanted to be gcc_4_1.c the latest as of commit
03f22f0070f3 ("README: adjust gcc version requirement"), i.e. for over 10
years.

Jan

