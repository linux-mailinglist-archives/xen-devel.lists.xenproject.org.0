Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB437CF6F6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619249.964033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRJw-0007ng-50; Thu, 19 Oct 2023 11:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619249.964033; Thu, 19 Oct 2023 11:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRJw-0007ku-1U; Thu, 19 Oct 2023 11:36:08 +0000
Received: by outflank-mailman (input) for mailman id 619249;
 Thu, 19 Oct 2023 11:36:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtRJu-0007hs-0z
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:36:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7ac680-6e73-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:36:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Thu, 19 Oct
 2023 11:35:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:35:59 +0000
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
X-Inumbo-ID: ad7ac680-6e73-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwCpU7Zgs8Aqcy8noTKRamaiJ/rkQb3HUCj8efJJYg9MpgqDDTWtBfRZbimU8q1c4Ls6yGXJgCsYn7GdEb/fr9+rCp8/uRItbVD4Cu8kIVNaJm3JXWyzR8Fg+0D/kVcsHiNHHIJLoqAc3GbKHkbl9u0WZLeVCIc9RhwPoKsUqUCKzHiIEYr9hNl5qCPy4GgNv+quH5/0Jshn8ov6Mp5W7T8g7fkvWNeINPWSyohz8piDNwUphO4L+WR/fgzSsPUXqHF805Yw+E5BjzVY+MaOMbJ8YsJYU/N24RfVL4M6xV2pV4kL+9W8jiLDZIURa88XwZGKJILDGnIIWj70SoQxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BABu4yMQDxo7cdmk7s1eP54nwk8eC34OQRoGIquyl+8=;
 b=PecI0Uje+elDySM5adfHwLE91Oj5rIvfWywD/0Y4IFGFcy/E32srYbZf+Rc91TDGZSdNwmNgTbptBLrq0btyNZDI9CXXGs/SU+K8w56aKx/wGiXHXbWKGe319snlgIcDviMNBynV22wDoQ8sTBmHWPcx4VrkQS09Z5lxWHQphBFKJ3mIUi5Deh301G2nmsQ3EfZSzLVy1+VoYW8RO8Bag2Pu8Ykmn0z8Kpiwp27rxQAaRCfbnp9QHQIulGAfrajQHFj9mH2hIRo+dq/SqH+9JgpzoX7J83+GYovIQ3geHq6fRLSPSynxv8LrZMjPO7UM+7T6MWzYId3jzWdSFoEdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BABu4yMQDxo7cdmk7s1eP54nwk8eC34OQRoGIquyl+8=;
 b=KtMET2t85rEbnXs4Hbx0MZcHAwpFgfhvSuhQ1NbG1nl7LzGjKThAlx5CZttEUBcynL0L+H/1hmOdRSUjkLqNY540StD7NLmst1ptJImBU1ZSBtshH1Pq8ycaA1DIbmg4HnhA9gc8KF2B77hJ0CmLLRBtYwnWt8MocxzGDp1fQ57bsKa4d4HqIEUEWXCZFH7jUaxvEROoHvCElG7TER5lkxwwjAKM9cqrF0CL2/BT4D8y22B7fcbM19rOqsxVcFK/ynS3vF1surDxkou2WMcNeevNMTPrrLtOMfMjP7hJMvdmTR7K9XdplpBJXxOvCruyKF9aDBlcU1JHGj+XK7rzfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99fcc71c-eefc-d004-d4d3-6e0d0e76339d@suse.com>
Date: Thu, 19 Oct 2023 13:35:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 26/29] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <a2663ba600f468bc4d6544bb64354a77c86a40b3.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a2663ba600f468bc4d6544bb64354a77c86a40b3.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b16f0b-9230-440d-3632-08dbd09790e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	knsOItfLKW7bjWZXwjtABelHV35naFhuGsGHFKfHpIi4PTrZavgpYtQVQMXpLceuQMNIzhwudBS/zWk19HVp2CwBxYfb33y7G8urcRNUs+SIAF6ZHinZYt5dhLMbvDGzb/G0x3oVySbuHOydcTYtGW0dhKSo/yLjkxUPJYhX/lr2QLqLN8rwRiS+KwmbUcLRLHkj5SsfthL7QQ5fHu0uEMq7hvNtYPWk1tr6Inuiiog13PLiZn+Df8vPaKWYcb96tFPCtT4l0IFCOjltTSOJAxjfO1Xlq9YmClUFmrpHpElebe58JmgMGoClH/cpJBRs+klN+QsUWgx8dvRWJ/y7xC7yk8Rf5lCpchJDA+Lg9LCPbnFXDUQjQkRw2tECQhVJIUPp+VKqxZIhpPK/3piVSStCxns7As532zrngYR3js0VtZ/Yg69YyQQILeUoWKYRZ33hBMayfBAti66PuyBRHNLCR+SKVIs3Po1GRuBUioCEdEQ5EvUnVnfsIKsAog4FYO0ayvvpCNi0rwPGydCEdO6YrUfabNSTI9Q44js+iu4Gj2LIKZO6ftrYQEMT8NMIeBJqAwgTwvVHARDZS54EZYzpMlomeXShUfwnqH+t0z9rNwmVqXB4CI61wz4MB1ksLvPHFsSQm34v1lHtPym742hLC9pd0qTYJusP0mBnbXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(31686004)(86362001)(6506007)(38100700002)(41300700001)(4326008)(2906002)(31696002)(26005)(6512007)(53546011)(2616005)(36756003)(478600001)(8676002)(5660300002)(6486002)(66476007)(66946007)(66556008)(316002)(54906003)(6916009)(8936002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWRySzBPN2tWblR5K2hNcU9LbEdJTUpNVVpqd3poMlNVSWtwWU4vNEhQT1ZP?=
 =?utf-8?B?c0YzOE5oUjlzRExDd1hUMEJ6Tkx3SHJHNUZHTHhBRUFMUWQzZWJ2VHVwL09x?=
 =?utf-8?B?VWN0QmVsOUx3ak4zelJUeWtOVXIveDVnUXJMWUhINm1UV3ZmOGhOcTgyQ2RQ?=
 =?utf-8?B?NjZpY1MveW9BZU1NZm5sOGhOSThFTmZQVnk1dm94cENxUzM1SDZEWlZOUjBI?=
 =?utf-8?B?MzhSWHdQb2lvdU1MRDBoVjYyRTNIajNxbXpuWVh3Q1lVeGdyaVA4aFBMR1ZH?=
 =?utf-8?B?ZnV3YzR2cVErZDBJakRoeWhmdE9sL2VzVkhPY1FIekdxRVZ1c3A2T2ViTG9r?=
 =?utf-8?B?YXNKK0w5Zks3WU5Dcll3Y0VGKzlKVWJKOFdUQ1J2MnhTVDdhbXFCVFNFcWE2?=
 =?utf-8?B?UHU4OGVwL0ZMWVdLbDB4QVV6clhXRmgwb1N1dWsvRzhpSVlXY0l1bUZmWXFZ?=
 =?utf-8?B?c2w5cU1PZkt6d3M4bnlOMnQrbXZJUjFoakZxUXh0SllVQmlzd3N4eDFLRU9x?=
 =?utf-8?B?NktmOGNNblprL3JqS1FHS3lqQjdhczcxcUVKZFRGbGVrTTVIRnk2cC93SFdH?=
 =?utf-8?B?Ukh5V0lXMnJaUjNqaWgvSHN6MjhCaUI4ZEoyalhPUTZmRW9wdGFEMTZKSUNL?=
 =?utf-8?B?WUV5bU5oTEFXLzRzT2ltMWhPeGlXWWR1clRUUWJJTzhiYXRoWm4xTmRpbUt0?=
 =?utf-8?B?TUtMb09DNkdaUzlKN0Z0QmNJVUgvTnJyUDhUallHNkIvVUJxL3NwL2dhUG9z?=
 =?utf-8?B?VmJlYlBraWgyUThiTGQ4Mmc1ZnUzTzl0Q0JEVlNLYUYvekFUaUUzZDdNZjVV?=
 =?utf-8?B?QjJKTTE4VnQvMlB3dTVxcXozWGlic2NGeXJRcUErMktCUktlRzhxMFAyaDFB?=
 =?utf-8?B?NHlFZk9GcFZFM0pEU3RRRm0vS240WEpwaGpaemVYMTMrVU92VVdkWStjdVlT?=
 =?utf-8?B?YmRiWS9DZHZjZmhDZEFYZGo4L1ZhaW1vOVJRTEJQWitYR2dtZE1oNHBEcThJ?=
 =?utf-8?B?TWJYMFUvZFZBcEI3eEJJZWlzaVZmVnNsU2QvT1pGNzlsTW1rRWpyMC92SExu?=
 =?utf-8?B?eXIyeFpWVkozZDFFWTBrM0tnWldzdEd4TnJadEJzZEdSelZqbm9NQW9XQ0lG?=
 =?utf-8?B?UXp3V2pyWHFURmYvajF1bVlUTFZUdEkrYmM3SmUzTDdIRDNTSGhhZ1Fwdk9V?=
 =?utf-8?B?cmovdlJ1bWhYSzJQNlJ2blVXV0NXVlpoRW5xaytUWEg3SDY2N211czdNSjhx?=
 =?utf-8?B?a2NNWFFyZjMwcnhVRkw1a2NEQXJoc213dm40S2grMnAyWVU1VC9XL2swL25K?=
 =?utf-8?B?Y294enlvWTFMTU5YQlNLbWFRZitYZnNaa1QyZk40NmdhVFpBa2NmeTlHTVBa?=
 =?utf-8?B?VUppVmwvWmpIdno2ZW5yZzU3TyszaTQ0RjJKdWt0TjZhenBxRW5oam13TzNL?=
 =?utf-8?B?Ui9FVTF1Yy9kV2NjekJteDl6RG9LS1FIOFplSGlpbnJnbVgzVkcrYnpwcHhU?=
 =?utf-8?B?am1tNWZqdU1tdjFleGFKdEVEQ2dWYUk5amxiZzlhZFdkRFgraC8xSStPVGNI?=
 =?utf-8?B?Wi9RQUZ4T3Q4R2hjeEx5UStQNTYrK3NwMUtOeGt1MEFZSHNTWUtvbVV2TXp5?=
 =?utf-8?B?WEltaVpVTms3M25GV3Y0VTBvNGw4U1BjNTdGWTJRQ1RsVzlYaHgzMEJkL2xt?=
 =?utf-8?B?cUE5ekVweTBoaDd2RG92d0FnOWRoYlZFMm5ad2tEdUlpZnYzNDAvNFZsZEpS?=
 =?utf-8?B?QTA4RFl6T1BROTQyODh3QzRVTnVVb3o3bERZMzhqLzMyRXliRElGZTlIdFNk?=
 =?utf-8?B?NmpkalNsNFphaFV3dWZSWnFzd0FPSXZ6NUJRSEZOT3llTVNWSUdDZzhSZmov?=
 =?utf-8?B?TkJJOTJZOStpMWN6bk12Wng0NGp5bFRMQmt4UUZyQjExVmx6eHJCbGwwWnJX?=
 =?utf-8?B?eEMzNWNFc1hXRU1lM2tVUkRnTkpDZVlKd2pXTTNOTlhJbHRXNEVZNDhVNFM0?=
 =?utf-8?B?WWYrRTVLR3A0OGx2U3BmTGk2VXJJelc3bkxIakV2ZkpESnNiYU0zK3UwdW9z?=
 =?utf-8?B?eXgzZ1o0OVh5bXZHeDZsRU5sOVFXeDZJTEdqb1JuUHdLOU9EeTJ3WFFBUmJ3?=
 =?utf-8?Q?pGrWK+wHTcJ9gCjpw9vlbHySQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b16f0b-9230-440d-3632-08dbd09790e4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:35:59.3886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKWlj+81deOdNjYA5GJn4NlLgmbUMvcmF0+Nhf9bA6eWIVsuAcVuyAqmHn+zCEfAA+Dqru54YO7u76EHa8mPlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/monitor.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* SPDX-License-Identifier: GPL-2.0 */

???

> +/*
> + * include/asm-GENERIC/monitor.h
> + *
> + * Arch-specific monitor_op domctl handler.
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + * Copyright (c) 2016, Bitdefender S.R.L.
> + *
> + */
> +
> +#ifndef __ASM_GENERIC_MONITOR_H__
> +#define __ASM_GENERIC_MONITOR_H__
> +
> +#include <xen/sched.h>
> +#include <public/domctl.h>

No need for this, I don't think?

> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool allow_userspace)
> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct xen_domctl_monitor_op *mop)
> +{
> +    /* No arch-specific monitor ops on GENERIC. */
> +    return -EOPNOTSUPP;
> +}
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop);
> +
> +static inline
> +int arch_monitor_init_domain(struct domain *d)
> +{
> +    /* No arch-specific domain initialization on GENERIC. */
> +    return 0;
> +}
> +
> +static inline
> +void arch_monitor_cleanup_domain(struct domain *d)
> +{
> +    /* No arch-specific domain cleanup on GENERIC. */
> +}
> +
> +static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
> +{
> +    uint32_t capabilities = 0;
> +
> +    return capabilities;

Just "return 0"?

Jan

