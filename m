Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4290C6F6CA5
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529720.824412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYkJ-0003Lb-0N; Thu, 04 May 2023 13:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529720.824412; Thu, 04 May 2023 13:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYkI-0003Ir-Tg; Thu, 04 May 2023 13:11:42 +0000
Received: by outflank-mailman (input) for mailman id 529720;
 Thu, 04 May 2023 13:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puYkH-0003Ie-Ce
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:11:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34299245-ea7d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:11:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 13:11:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 13:11:36 +0000
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
X-Inumbo-ID: 34299245-ea7d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzSqEBGb0UHn+h3Or2FyV13NN5nYKGVPLDaugGq8/nPhvyu7avrqX9orK83eBimLi4EdOrU/YjezCajc2MloRgg6/D+p6lALW2rfNdK0DF/hf3/5+9aW1F8Lp7xU3lhKpgjiIUXwdsrFASiIZDi5rU1r/nAJb7blOiM2y5FbNCia0br8RkoKyJNuRYFhL7MPMkPdoLl0tUqr5/Vh8c5jN0S/cdfJUM/u1gdI7FpxF5IZkImP+xzR3bFFqsR4OY+IZ2P02UB9IhTkn83iNXaFzUyfoAD62JUFQ01wCAqsObumpR9cSNfPXmsj6jhv6voMqxPqx49imfjrEYwxCbYrxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vivl20jtCFC6k7pDANCpn5BJUzOuWxfdeeF4eIOCzUQ=;
 b=LtH4ra8AsQb6hJaMiQNfP/PeuBEo5S3co+OLbJ+3dX344uZdmwCssw5rwJX9c3DPZxzo6YNcE+Hgcdm45bT2q/oAQySWyhO+DfTo3wbeE7yLnV7DbzJbJZHqlhgJaW2Q0zn8bENeVGT1l9btGrLowFIsDtAJjNUEPuUUQi88MCHfLkTES72VGtNsH8768tXHjVSZMoArx4HuLbMrN5nbfQsfGKmPTjTMi90rjHQh/V7yccHZ0KOf7ji/gFlibgJdxQxozWX97LV4NGIKOwk3qHkVFQEYU9FQYn2NAG17eEBr0dq1L3GZCL/LGmpuXbErsmLRYfQRev3ttPMCVifIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vivl20jtCFC6k7pDANCpn5BJUzOuWxfdeeF4eIOCzUQ=;
 b=26ISd0m4R71j7+lGVz9mYBUrmOVToN3KUXD8SdHjNMSsUfRdVlsXIEYM4PF398SLGyWj/7jC68u52wPcEOP/tDBtKiR+UgIX55yR+93Iy6wIiAEKQYlmVA+ATOhOganC2eeaiWlWM5sfa6KCD1qEK0+RmLi8UCYFa3uFIK4pqyX9XqHcFrOOHEerHFf3TTlMLJ4LizBo2U2l+TXuDGoeZCGAluGJezip0QZ9n9zTlum9xC5j/XfzNYZ/CD3GDgRz5biq8zxtqDQxA9JYJWuyoS7s3u/Tfc5uP48H+Txtx9bXerBvScreBIFYe1MxbHLZYL8QNNB7w/5P/zcc6Psc2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com>
Date: Thu, 4 May 2023 15:11:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP)
 driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-5-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7dbdf3-3dd3-4983-5ba9-08db4ca11698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w+mtcKiVR+xmriAsIpd5sBxv46mpA5dLp1ih9jZY/fRnviN/qAsDASPM4dVJ6dSv55jt0ARvEkvxwFtIn/aBC6tdMW3RoiPg/gBXc+pikr2GP99B1ZLvtEBj1WsKehGrz+eMjM5RPKrogUyNNN7hkyxMQ0KaC74sErEtyHlceZdyi+cB+eUjUey+6zqyRPRQw2LTyfBn9PfPe5Dm8mUuGhiI/2P1lRiwK3bzyjyg0wFJgy3GqKiIfw7pdTmYXFEHrPjfeyyBAT9ZrF7j3by5iYtfy7p3ENE2K2qFKYa7KLFbtizDamGtxGodN6szBUExaae1AMcovIpiYBKalw446MApuSOq3DNBkajC9w/ZRwfC3e8OqzRl9ie39/ik/iCj4lfvJm2ROi5QSTGmGkLFAkoR3kuzsEXRfeDAxIbRKBLNowDEHp6o2GFt5Lvl6zPkq7Wo2lVtpUyMnfxrOoThgNn+bbglu69lQVIM2gD8Z3pJTR6Y6hcNUzem0TrhOLl9qC2jMGMT8f7wnEtbCKxpdGe7V+R3xols56zMUU6UF7QlP+tmI/Cf3EZhdFNbnQGOqq4dRZmTE56uaW9WNeF3cNTgenhYuULl5htuHBEDtgTFc+YrzBMGsKDiSsMnJTHuXXdeTCTT6hgWuMNL2jrHHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(478600001)(5660300002)(8676002)(38100700002)(8936002)(2616005)(6916009)(54906003)(86362001)(6512007)(6506007)(26005)(6666004)(31696002)(66476007)(66556008)(66946007)(36756003)(6486002)(4326008)(83380400001)(31686004)(316002)(186003)(2906002)(53546011)(41300700001)(30864003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUR3YnlpSmt1OW5PM0tMbGR4YlBsOUZuZXFhV2lHVkJDeGZwckc1T01MeTZl?=
 =?utf-8?B?QjcwUHJDdmFBV0JtRFQvc2lUeVhsMHdLMHNLY2xNQk9jbEowMFNuVFFUbnFN?=
 =?utf-8?B?SkloMk9yNUMrUjVXTnNWaEFDUHc0K2MrQXRWR1VVc3hXWjFLZjNQaTM3WlRv?=
 =?utf-8?B?SXNKdTE1cXhxQ0x3a3hROXlUOEF1M2tKUXdjRXBzbTZ5c0pkWmZSenJxL1pH?=
 =?utf-8?B?UDVVZ2lJc1NIOW42NkVVRXRzU2xwTDBuWXFEYnkrbmQ3dVlYbnFaMDhXN0wx?=
 =?utf-8?B?S0RRU3RMUnN6N3YwMFRSOVBwc0t4bmluNkEwU1NWQ0xoZHhCb2pScjlhMGN5?=
 =?utf-8?B?ZzBiZ2FxUHhJeDc4MFpWR2E1QmJNdkI3QUxtSC9OS1MwUXczb09aL1ZXKzVM?=
 =?utf-8?B?VmZaVkVBWGpmNnBlREtpeDNkUWErYlJRNkV3cWJHSGR3YkFmWXFFRUJ6QnZi?=
 =?utf-8?B?ZVJLTjlyTi9QMDgwWUllMkNPdGp1bGJqTUpSaVNJL21FNEh6bGF6V2FEcFZG?=
 =?utf-8?B?VU9GQm0zZ3owQjdmdFQ0ZGZRL2lJSHYyWW11bXdhQk9MKzVzRXhIa2RGcG90?=
 =?utf-8?B?UG5oVmxhRzUwUU5hdDhRS0hhSXZCdmlSczlKeHJsbzhScjVDdytPNStFWFpD?=
 =?utf-8?B?WmZPaXlBckkwSUM1MnZaYm1HN05xMkg5am1HRVRrY3lVN3ZVTkFCWHU2Ti9I?=
 =?utf-8?B?OG9GWXVqNVVHMi96b2xIK2drakZtV01JSVVFT3h3ekswclhQZlU1b2RlVXdD?=
 =?utf-8?B?amlwR3hsYnlIYmlRVkRKRTZ5NmFIS1MwaUJCS2t4RTRSOHFBTUVRMlVkK0px?=
 =?utf-8?B?V001THRXV1dCQnl2TXk5ZkdDVlNNdnU4RDVuMkhwVkE3a2Q0UFdtcTlqcDls?=
 =?utf-8?B?T2VLUTNVTG5EaENUdzZsUFZlMk1UK0RSN0hWempLQXVSVTM2VmJSL0l1R1lp?=
 =?utf-8?B?aHRtQWN3eXFSMkRGdHkrWFJKZ1BlMVI3RDBiUmtueW9HVlg4ZnhGaytwM3pR?=
 =?utf-8?B?VmV0MEsyZk03dG43alBXY2YzNExka29RazhHamtNSXNGMnFGOGpib0pCcWtK?=
 =?utf-8?B?cGs2YnhIVy9IdDFabkJhUUdtQjY0NVp4RnoxN2ZtWlQ0Mmg5QUtKNHN1ZGJP?=
 =?utf-8?B?cE0yOHRhZTJUSmd2VEpCTWZPbmlZUCtCZW9GMThjT0NTSGFUNUxkYlVSRmVX?=
 =?utf-8?B?UjIvUHBXYXFPRjNKZjBVaTlSNHFLYy9scUlVYlRZMVVKdWl4QnY0UEJ2Zk5C?=
 =?utf-8?B?RXpXNkJ5ckpwYXhXWkJta3BpRm1jd2EvWUh1bVJaK2pNbnQ3YzB3cjRsNFJW?=
 =?utf-8?B?Q0pjcnU4WWRQVlR2cVFFQURWZmZJUStjcVc5dHVuaUcyTCtrWERIY29LQlVJ?=
 =?utf-8?B?SnhvYmtJUXNyZHhHdVdFQ2oxWGpDcmhrcmxvT1JyQm1sZ0M1V0RWc09wTEZh?=
 =?utf-8?B?RG9ZTkpuL3lUL1lXT3JCUW5EVWpRRU5kdDZhTjdKcGN4bEhCMVlVVklsWE05?=
 =?utf-8?B?azkwNEF4cEZDdWl0dnlPM2tBN0lvOHVkSVR3ajU4NHQrKytMYmtrblY1Yktz?=
 =?utf-8?B?aFBGZ09oUGg5aWNEeVYzU1lwRThJL0NPSFMrRnBOUi9GcUtoUEF3L1RjZlhI?=
 =?utf-8?B?V0N0MjJ3bWpFb0JSaE11RWs3RFY1Z2t2UnkxVFdLeVJ4RXBySFd4RktMS051?=
 =?utf-8?B?YWhVejQ1eTQ4a1N2MDRHY1JDWllUK3RLcWxQYS9INW5nYnBvSXF1SDRtYWd6?=
 =?utf-8?B?NkdmN05nZjl2SmZEb21ONHBPMXBJUXpqTVRrbEZZZHRhN080UzhtbDNmUmJP?=
 =?utf-8?B?MEg2dzhlTjNRM2p1dUhiZ0lsVHhUZ0o5U0NWb2RMWGp5eUpLNlMzeDVnL1By?=
 =?utf-8?B?cTRrSm5YN0ZVSlhGd202RVFHMlptclJXcGEwZnAzM1JoQ2xCVWY5OEtGS0kw?=
 =?utf-8?B?MDRpeVJtWncxd1F2MkJaN2dEbG1QNGhNcEwyTWFtcUZ3NGxXT0dLeTJVVTVo?=
 =?utf-8?B?TUZqQkRJT1hTdVRkRjV1bTBWRm5mLzhEMEtJa2VTb2Rwc1FuaU9paEliSU8y?=
 =?utf-8?B?U1RXcWFzaXBVd2RjSDNsMFNPL2NXeE5DQ090K0ZNeWo2UnpmamRyc1FGcWZu?=
 =?utf-8?Q?HyxSM8M6V45VQO7UimoNClBlT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7dbdf3-3dd3-4983-5ba9-08db4ca11698
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:11:35.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14EQqvdH1cDAfBqfCgPZ3jbidm6LapNVtCNYV7ssd5WUvsBz1D08iNbaWaUREr5hIOOyCgV5D0zDCMOTr7WI/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

On 01.05.2023 21:30, Jason Andryuk wrote:
> For cpufreq=xen:hwp, placing the option inside the governor wouldn't
> work.  Users would have to select the hwp-internal governor to turn off
> hwp support.

I'm afraid I don't understand this, and you'll find a comment towards
this further down. Even when ...

>  hwp-internal isn't usable without hwp, and users wouldn't
> be able to select a different governor.  That doesn't matter while hwp
> defaults off, but it would if or when hwp defaults to enabled.

... it starts defaulting to enabled, selecting another governor can
simply have the side effect of turning off hwp.

> Write to disable the interrupt - the linux pstate driver does this.  We
> don't use the interrupts, so we can just turn them off.  We aren't ready
> to handle them, so we don't want any.  Unclear if this is necessary.
> SDM says it's default disabled.

Definitely better to be on the safe side.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -499,7 +499,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
>  available support.
>  
>  ### cpufreq
> -> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
> +> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<hdc>][,[<hwp>]][,[<maxfreq>]][,[<minfreq>]][,[verbose]]]} | dom0-kernel`

Considering you use a special internal governor, the 4 governor alternatives are
meaningless for hwp. Hence at the command line level recognizing "hwp" as if it
was another governor name would seem better to me. This would then also get rid
of one of the two special "no-" prefix parsing cases (which I'm not overly
happy about).

Even if not done that way I'm puzzled by the way you spell out the interaction
of "hwp" and "hdc": As you say in the description, "hdc" is meaningful only when
"hwp" was specified, so even if not merged with the governors group "hwp" should
come first, and "hdc" ought to be rejected if "hwp" wasn't first specified. (The
way you've spelled it out it actually looks to be kind of the other way around.)

Strictly speaking "maxfreq" and "minfreq" also should be objected to when "hwp"
was specified.

Overall I'm getting the impression that beyond your "verbose" related adjustment
more is needed, if you're meaning to get things closer to how we parse the
option (splitting across multiple lines to help see what I mean):

`= none
 | {{ <boolean> | xen } [:{powersave|performance|ondemand|userspace}
                          [{,hwp[,hdc]|[,maxfreq=<maxfreq>[,minfreq=<minfreq>]}]
                          [,verbose]]}
 | dom0-kernel`

(We're still parsing in a more relaxed way, e.g. minfreq may come ahead of
maxfreq, but better be more tight in the doc than too relaxed.)

Furthermore while max/min freq don't apply directly, there are still two MSRs
controlling bounds at the package and logical processor levels.

> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -0,0 +1,506 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
> + *
> + * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <xen/xmalloc.h>
> +#include <asm/io.h>
> +#include <asm/msr.h>
> +#include <acpi/cpufreq/cpufreq.h>
> +
> +static bool feature_hwp;
> +static bool feature_hwp_notification;
> +static bool feature_hwp_activity_window;
> +static bool feature_hwp_energy_perf;
> +static bool feature_hwp_pkg_level_ctl;
> +static bool feature_hwp_peci;
> +
> +static bool feature_hdc;

Most (all?) of these want to be __ro_after_init, I expect.

> +__initdata bool opt_cpufreq_hwp = false;
> +__initdata bool opt_cpufreq_hdc = true;

Nit (style): Please put annotations after the type.

> +#define HWP_ENERGY_PERF_BALANCE         0x80
> +#define IA32_ENERGY_BIAS_BALANCE        0x7
> +#define IA32_ENERGY_BIAS_MAX_POWERSAVE  0xf
> +#define IA32_ENERGY_BIAS_MASK           0xf
> +
> +union hwp_request
> +{
> +    struct
> +    {
> +        uint64_t min_perf:8;
> +        uint64_t max_perf:8;
> +        uint64_t desired:8;
> +        uint64_t energy_perf:8;
> +        uint64_t activity_window:10;
> +        uint64_t package_control:1;
> +        uint64_t reserved:16;
> +        uint64_t activity_window_valid:1;
> +        uint64_t energy_perf_valid:1;
> +        uint64_t desired_valid:1;
> +        uint64_t max_perf_valid:1;
> +        uint64_t min_perf_valid:1;

The boolean fields here would probably better be of type "bool". I also
don't see the need for using uint64_t for any of the other fields -
unsigned int will be quite fine, I think. Only ...

> +    };
> +    uint64_t raw;

... this wants to keep this type. (Same again below then.)

> +bool __init hwp_available(void)
> +{
> +    unsigned int eax, ecx, unused;
> +    bool use_hwp;
> +
> +    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
> +    {
> +        hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
> +                    boot_cpu_data.cpuid_level);
> +        return false;
> +    }
> +
> +    if ( boot_cpu_data.cpuid_level < 0x16 )
> +    {
> +        hwp_info("HWP disabled: cpuid_level %#x < 0x16 lacks CPU freq info\n",
> +                 boot_cpu_data.cpuid_level);
> +        return false;
> +    }
> +
> +    cpuid(CPUID_PM_LEAF, &eax, &unused, &ecx, &unused);
> +
> +    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) &&
> +         !(ecx & CPUID6_ECX_IA32_ENERGY_PERF_BIAS) )
> +    {
> +        hwp_verbose("HWP disabled: No energy/performance preference available");
> +        return false;
> +    }
> +
> +    feature_hwp                 = eax & CPUID6_EAX_HWP;
> +    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
> +    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
> +    feature_hwp_energy_perf     =
> +        eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE;
> +    feature_hwp_pkg_level_ctl   = eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST;
> +    feature_hwp_peci            = eax & CPUID6_EAX_HWP_PECI;
> +
> +    hwp_verbose("HWP: %d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
> +                feature_hwp, feature_hwp_notification,
> +                feature_hwp_activity_window, feature_hwp_energy_perf,
> +                feature_hwp_pkg_level_ctl, feature_hwp_peci);
> +
> +    if ( !feature_hwp )
> +        return false;
> +
> +    feature_hdc = eax & CPUID6_EAX_HDC;
> +
> +    hwp_verbose("HWP: Hardware Duty Cycling (HDC) %ssupported%s\n",
> +                feature_hdc ? "" : "not ",
> +                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disabled"
> +                            : "");
> +
> +    feature_hdc = feature_hdc && opt_cpufreq_hdc;
> +
> +    hwp_verbose("HWP: HW_FEEDBACK %ssupported\n",
> +                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");

You report this, but you don't really use it?

> +    use_hwp = feature_hwp && opt_cpufreq_hwp;

There's a lot of output you may produce until you make it here, which is
largely meaningless when opt_cpufreq_hwp == false. Is there a reason you
don't check that flag first thing in the function?

> +static void hdc_set_pkg_hdc_ctl(bool val)
> +{
> +    uint64_t msr;
> +
> +    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
> +    {
> +        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");
> +
> +        return;
> +    }
> +
> +    if ( val )
> +        msr |= IA32_PKG_HDC_CTL_HDC_PKG_ENABLE;
> +    else
> +        msr &= ~IA32_PKG_HDC_CTL_HDC_PKG_ENABLE;
> +
> +    if ( wrmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
> +        hwp_err("error wrmsr_safe(MSR_IA32_PKG_HDC_CTL): %016lx\n", msr);
> +}
> +
> +static void hdc_set_pm_ctl1(bool val)
> +{
> +    uint64_t msr;
> +
> +    if ( rdmsr_safe(MSR_IA32_PM_CTL1, msr) )
> +    {
> +        hwp_err("error rdmsr_safe(MSR_IA32_PM_CTL1)\n");
> +
> +        return;
> +    }
> +
> +    if ( val )
> +        msr |= IA32_PM_CTL1_HDC_ALLOW_BLOCK;
> +    else
> +        msr &= ~IA32_PM_CTL1_HDC_ALLOW_BLOCK;
> +
> +    if ( wrmsr_safe(MSR_IA32_PM_CTL1, msr) )
> +        hwp_err("error wrmsr_safe(MSR_IA32_PM_CTL1): %016lx\n", msr);
> +}

For both functions: Elsewhere you also log the affected CPU in hwp_err().
Without this I'm not convinced the logging here is very useful. In fact I
wonder whether hwp_err() shouldn't take care of this and/or the "error"
part of the string literal. A HWP: prefix might also not be bad ...

> +static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
> +{
> +    uint32_t base_khz, max_khz, bus_khz, edx;
> +
> +    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
> +
> +    /* aperf/mperf scales base. */
> +    policy->cpuinfo.perf_freq = base_khz * 1000;
> +    policy->cpuinfo.min_freq = base_khz * 1000;
> +    policy->cpuinfo.max_freq = max_khz * 1000;
> +    policy->min = base_khz * 1000;
> +    policy->max = max_khz * 1000;
> +    policy->cur = 0;

What is the comment intended to be telling me here?

> +static void cf_check hwp_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    uint64_t val;
> +
> +    /*
> +     * Package level MSR, but we don't have a good idea of packages here, so
> +     * just do it everytime.
> +     */
> +    if ( rdmsr_safe(MSR_IA32_PM_ENABLE, val) )
> +    {
> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_PM_ENABLE)\n", policy->cpu);
> +        data->curr_req.raw = -1;
> +        return;
> +    }
> +
> +    /* Ensure we don't generate interrupts */
> +    if ( feature_hwp_notification )
> +        wrmsr_safe(MSR_IA32_HWP_INTERRUPT, 0);
> +
> +    hwp_verbose("CPU%u: MSR_IA32_PM_ENABLE: %016lx\n", policy->cpu, val);
> +    if ( !(val & IA32_PM_ENABLE_HWP_ENABLE) )
> +    {
> +        val |= IA32_PM_ENABLE_HWP_ENABLE;
> +        if ( wrmsr_safe(MSR_IA32_PM_ENABLE, val) )
> +        {
> +            hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_PM_ENABLE, %lx)\n",
> +                    policy->cpu, val);
> +            data->curr_req.raw = -1;
> +            return;
> +        }
> +    }
> +
> +    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
> +    {
> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
> +                policy->cpu);
> +        data->curr_req.raw = -1;
> +        return;
> +    }
> +
> +    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
> +    {
> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
> +        data->curr_req.raw = -1;
> +        return;
> +    }
> +
> +    if ( !feature_hwp_energy_perf ) {

Nit: Brace placement.

> +        if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, val) )
> +        {
> +            hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
> +            data->curr_req.raw = -1;
> +
> +            return;
> +        }
> +
> +        data->energy_perf = val & IA32_ENERGY_BIAS_MASK;
> +    }

In order to not need to undo the "enable" you've already done, maybe that
should move down here? With all the sanity checking you do here, maybe
you should also check that the write of the enable bit actually took
effect?

> +/* val 0 - highest performance, 15 - maximum energy savings */
> +static void hwp_energy_perf_bias(const struct hwp_drv_data *data)
> +{
> +    uint64_t msr;
> +    uint8_t val = data->energy_perf;
> +
> +    ASSERT(val <= IA32_ENERGY_BIAS_MAX_POWERSAVE);
> +
> +    if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
> +    {
> +        hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
> +
> +        return;
> +    }
> +
> +    msr &= ~IA32_ENERGY_BIAS_MASK;
> +    msr |= val;
> +
> +    if ( wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
> +        hwp_err("error wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS): %016lx\n", msr);
> +}
> +
> +static void cf_check hwp_write_request(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
> +    union hwp_request hwp_req = data->curr_req;
> +
> +    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));
> +    if ( wrmsr_safe(MSR_IA32_HWP_REQUEST, hwp_req.raw) )
> +    {
> +        hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_HWP_REQUEST, %lx)\n",
> +                policy->cpu, hwp_req.raw);
> +        rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw);
> +    }
> +
> +    if ( !feature_hwp_energy_perf )
> +        hwp_energy_perf_bias(data);
> +
> +}
> +
> +static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
> +                                       unsigned int target_freq,
> +                                       unsigned int relation)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
> +    /* Zero everything to ensure reserved bits are zero... */
> +    union hwp_request hwp_req = { .raw = 0 };
> +
> +    /* .. and update from there */
> +    hwp_req.min_perf = data->minimum;
> +    hwp_req.max_perf = data->maximum;
> +    hwp_req.desired = data->desired;
> +    if ( feature_hwp_energy_perf )
> +        hwp_req.energy_perf = data->energy_perf;
> +    if ( feature_hwp_activity_window )
> +        hwp_req.activity_window = data->activity_window;
> +
> +    if ( hwp_req.raw == data->curr_req.raw )
> +        return 0;
> +
> +    data->curr_req = hwp_req;
> +
> +    hwp_verbose("CPU%u: wrmsr HWP_REQUEST %016lx\n", cpu, hwp_req.raw);
> +    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
> +
> +    return 0;
> +}

If I'm not mistaken these 3 functions can only be reached from the user
space tool (via set_cpufreq_para()). On that path I don't think there
should be any hwp_err(); definitely not in non-verbose mode. Instead it
would be good if a sensible error code could be reported back. (Same
then for hwp_cpufreq_update() and its helper.)

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -46,8 +46,17 @@ extern struct cpuinfo_x86 boot_cpu_data;
>  #define cpu_has(c, bit)		test_bit(bit, (c)->x86_capability)
>  #define boot_cpu_has(bit)	test_bit(bit, boot_cpu_data.x86_capability)
>  
> -#define CPUID_PM_LEAF                    6
> -#define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1
> +#define CPUID_PM_LEAF                                6
> +#define CPUID6_EAX_HWP                               (_AC(1, U) <<  7)
> +#define CPUID6_EAX_HWP_NOTIFICATION                  (_AC(1, U) <<  8)
> +#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               (_AC(1, U) <<  9)
> +#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE (_AC(1, U) << 10)
> +#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         (_AC(1, U) << 11)
> +#define CPUID6_EAX_HDC                               (_AC(1, U) << 13)
> +#define CPUID6_EAX_HWP_PECI                          (_AC(1, U) << 16)
> +#define CPUID6_EAX_HW_FEEDBACK                       (_AC(1, U) << 19)

Perhaps better without open-coding BIT()?

I also find it a little odd that e.g. bit 17 is left out here despite you
declaring the 5 "valid" bits in union hwp_request (which are qualified by
this CPUID bit afaict).

> +#define CPUID6_ECX_APERFMPERF_CAPABILITY             0x1
> +#define CPUID6_ECX_IA32_ENERGY_PERF_BIAS             0x8

Why not the same form here?

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -151,6 +151,13 @@
>  
>  #define MSR_PKRS                            0x000006e1
>  
> +#define MSR_IA32_PM_ENABLE                  0x00000770
> +#define  IA32_PM_ENABLE_HWP_ENABLE          (_AC(1, ULL) <<  0)
> +
> +#define MSR_IA32_HWP_CAPABILITIES           0x00000771
> +#define MSR_IA32_HWP_INTERRUPT              0x00000773
> +#define MSR_IA32_HWP_REQUEST                0x00000774

I think for new MSRs being added here in particular Andrew would like to
see the IA32 infixes omitted. (I'd extend this then to
CPUID6_ECX_IA32_ENERGY_PERF_BIAS as well.)

> @@ -165,6 +172,11 @@
>  #define  PASID_PASID_MASK                   0x000fffff
>  #define  PASID_VALID                        (_AC(1, ULL) << 31)
>  
> +#define MSR_IA32_PKG_HDC_CTL                0x00000db0
> +#define  IA32_PKG_HDC_CTL_HDC_PKG_ENABLE    (_AC(1, ULL) <<  0)

The name has two redundant infixes, which looks odd, but then I can't
suggest any better without going too much out of sync with the SDM.

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -565,6 +565,38 @@ static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
>  
>  static int __init cpufreq_handle_common_option(const char *name, const char *val)
>  {
> +    if (!strcmp(name, "hdc")) {
> +        if (val) {
> +            int ret = parse_bool(val, NULL);
> +            if (ret != -1) {
> +                opt_cpufreq_hdc = ret;
> +                return 1;
> +            }
> +        } else {
> +            opt_cpufreq_hdc = true;
> +            return 1;
> +        }
> +    } else if (!strcmp(name, "no-hdc")) {
> +        opt_cpufreq_hdc = false;
> +        return 1;
> +    }

I think recognizing a "no-" prefix would want to be separated out, and be
restricted to val being NULL. It would result in val being pointed at the
string "no" (or "off" or anything else parse_bool() recognizes as negative
indicator).

Yet if, as suggested above, "hwp" became a "fake" governor also when
parsing the command line, "hdc" could actually be handled in its
handle_option() hook.

Jan

