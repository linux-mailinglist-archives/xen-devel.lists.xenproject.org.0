Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C77CF57B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619156.963763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQR3-0005BS-BB; Thu, 19 Oct 2023 10:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619156.963763; Thu, 19 Oct 2023 10:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQR3-00059U-8O; Thu, 19 Oct 2023 10:39:25 +0000
Received: by outflank-mailman (input) for mailman id 619156;
 Thu, 19 Oct 2023 10:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQR1-00059O-Vm
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:39:23 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe02::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c396fc8d-6e6b-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 12:39:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9278.eurprd04.prod.outlook.com (2603:10a6:102:2b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 10:39:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:39:19 +0000
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
X-Inumbo-ID: c396fc8d-6e6b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW/mYG/B+yyK9KiKQxxqROzcTmiUGuImuRBOs0UkzehhfC8hAJ/CAuR2wYiy2am6MSitJtjW5JeoVeaGMo9CatvlHzfvTQEg80Q3PlZIRf8+WXYAL8naLtdl2gS7C5GT+ACwJWqDmeUEeoscSxZTjpKwy4WIKivTwnZ6VHptyO22FINDdMKDjCu2ibJ38Z2KsE9R6Ir5odfdqY7Gbzjrvg3g7NZTGEh9bcC1L3uSD8Ec+WW9c91b4zPgNtwc5o75uZHgco9GR8+FQXzkQpZw6o6SgOBA1V65KF6dX+lBTW9qGTsji6b9e46BNjtfAr9CEUi57b9zx29YI2CirIEbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8SIpwPF5aJzeTuL54KsKhXZBw0b3XmBVdSEEynAM6U=;
 b=NmCg/5d2AUF1FOpbv9ig8Xdk5dAJbftwVUsvjqFByJtlAoBQAR9u+c+pytFz+3Ep5SVM9/q5WH1UWXT9Y61k2XuffPDzDMes9mFzaicwzwh3yryMrLDRwIvnxxhXYWEE/G16bmNP4iQZ/9x4mxwRwuqzsbl8LDO0sN+k1G9j7Hl0JlGiE1EuEJvikz2/CUxLRK5A6Kwa4o20syuVJDHKIzafRljZ5TV7VEpovmJ37+rHY6oD1zJYuHjIMoZtKI4BFnSWmRcGlkkCLTbymJUUUu0GtlUMWWEK59qkWYMrN++JZb+9242QDtHoFe2KYlOyJ2YzF9wDav5rLEpajWRn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8SIpwPF5aJzeTuL54KsKhXZBw0b3XmBVdSEEynAM6U=;
 b=WuB2puVefvEGg49EjeiQ3xrzMSz5NGQZzDZHsupVPwr2Oi/UTYn7qSS6yB+VyGC2cgTQa6rwwVjymJPCjqA1DB5pofk61NlRKQComgQTA4TXwzsbmP0FyAz5rh4Dn8C6hzSOKMZoh9/pLWiiDVgWXSKiOmHTO54rF53lsX+qjYV8O8Y5coDKDwXciuD8mx3/XIb8I7Ywl7pU5Cc83b2MqRrVuWzF81ZLaaLBuaQE9TQZRGzIYNZKUWZ0Xezjl2x6ou2lbASPoj3j3jY21hQo1BzZr2N+jmKK4yXy2DGwR4QA6/WhJaW3PMklajAMeoPv62zzV2ilPYmy3WPxhdQVEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9136bdd4-2ae1-4b7a-b4b8-a66181b2bfe4@suse.com>
Date: Thu, 19 Oct 2023 12:39:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 17/29] xen/asm-generic: introduce stub header percpu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <521647680aa5010629ded799010c8f9e5d22cde3.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <521647680aa5010629ded799010c8f9e5d22cde3.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 640cdf5b-f0a7-405a-046d-08dbd08fa64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sXp/7juRZjQP+pojHXfMCLCQwA2JAAdayh978pynUCdVhBJa3JOxf/whx7uUjEqKNsntWfrOyQoh67vyebY49C1JSsGLNb97isAsUyz/CeGIe+N1nCshYGOjzh3kGT0GjVI5GdB1Ke49fu02bXue2yS5yxlPvEtbJLHCemuguu3cTlFuCRkJbvoqgksEhBpZSrGJQ/xMl2KWdURtMtOKgtAO+lp2DBbDLaURyJZcsMpY5H5oEbead2lAbOR6Y7mlQJCcNpZBnu6KDLz3CYw4EqkLnINXTWaMljuPDQOp4X/iLuacMsZSP2rY7edb0lavrKwSNptmVXGfU5bRebIaC0Zd+DV80KAyIAlszNNnYkdAZIJOeQm4Xb9hxAl5XZKjCHi0Au+YKj6BqLZIORj59iju4jU+NB9KSHIxTz0Ahufx7o/857dtkafpLcuS2QT1wXpxm5uv5DAhlZEw7f1uECfP7T6Eq8vYh84gyIlbMbrRm5HB78xiKvL/Yu6daZybbl56p+No0T5Lz37s3sr26hXIira59XFO4PBVPtO5LodRjOEe2tfSZDmgsqxuoesyz1KrhV2OzaMubTJ5fWj8vBGfnu7Pue+2MpZ01xAZDHv8GqODX5mPHDv/9aZY1YR7gVvy9wK5/3+/e4vGSXs5XdLKdFFsci0A13faNN4z34o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(83380400001)(4326008)(38100700002)(2616005)(6512007)(36756003)(86362001)(2906002)(316002)(31696002)(66476007)(66556008)(8936002)(66946007)(5660300002)(8676002)(54906003)(53546011)(6506007)(6486002)(41300700001)(6916009)(478600001)(26005)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXRCTGxLS0d0SmM4dmRjS1NURjZtZllaODE1S2RWQXI5OTVhYllWODltY21B?=
 =?utf-8?B?VXlWREJsQUEyVGt5SnM2cnltbGlpanNVbjJQMDliZzZNa1BUR1A3dUVJZ210?=
 =?utf-8?B?QXBSS2hSdFk2cG44Y3dxaEY2c2Fha2tLdURwcEVndE1ESW81V1dtbVRlMHBx?=
 =?utf-8?B?dk03VUhjdVhBbmkxVGNGbEVUemxDMzl4Y0R2WURiK24xV2krQWdjcWFqbHBq?=
 =?utf-8?B?TlFNTFRmMGpxMVV3V3pJMXJ3YXNzVWFNQzVwVGw4cEp3TTQyOS9JRHZyZ3Vm?=
 =?utf-8?B?S1k2MFREb2UxMmpMM2M5dERUZnhNaWp2M3ZjT0loVHREOWRzSHhhQWhuVmFM?=
 =?utf-8?B?dndETzhXUDFBMWl3YkVyYzZ5SGVDS3hDQWhmOG1JVEREZDdjaVRYZGR5VitW?=
 =?utf-8?B?SDdwaWtZREg5eEEyKzdPbTFlR2hhR0ZPZXpXbzVsbisvQUx5MXdkVWdhVWU3?=
 =?utf-8?B?aitBNUE3eG13ck5KSHlnTFNYeE1iYnFSNHpCYnJ6U2VwK1h3ZTBxUVkvaG8w?=
 =?utf-8?B?SW1SUjdVNXN4M0VpeDNpUldVbUVLWFJNTkZlNFBmdmpFRnZXLzFtN1RMNkZH?=
 =?utf-8?B?UGhnaEtzQnVtbTdYU1RpcHdBU3dTMHdkYWhFUWxWWjZ4SXZ5bkRjUnFjMTc3?=
 =?utf-8?B?V00zZ3dZalhQbEhyV1E5bEpXSFRFUmYwUVRsOUhONW9uUG5rZEdzSWFvL1BI?=
 =?utf-8?B?U1c4MzVPb3NrdXB0TUg1RjREaHZFY1h1ajZlQ3BPd3BDdEN1U3p4NHMxckxp?=
 =?utf-8?B?TmdHbDdKZHFCekhTYTJDNU9SSHkvQjk5VmhEbGkyZkdyb1dYNDc1c1QyVlZi?=
 =?utf-8?B?RzNTUmxnWmhuWDF2Z2NoTU4vTWdoQUMxNjlINFZFWmRtT1dIL1FiVnM4emJF?=
 =?utf-8?B?SzJHcW5aeGpCaVZudmYyUmM5b0ZHNFZ5MjNtdkg1RHM2UnpsWnNVbW5wenRk?=
 =?utf-8?B?N3JEYTF4MVhUTTBjYUQ2VnU2M2YyOFhOL3dIdkx1VGUzeWtpUEgvMXdDTUNH?=
 =?utf-8?B?MUxGNVJlSjd0c3AraHFKb253VVJUMXZrMWFUOVlXUnFja2ZlUVhIYnVUUUsy?=
 =?utf-8?B?U1VEb1BKdVpEbFNaZyttMHIrK3dyRGdUMFJnZGtlQ2N1cFd1ZVBaaTFUU1RN?=
 =?utf-8?B?Y2Zla283UHdKQ0JzMUppZm1oVVFNcGRRSVhabVppdGg1NFF6VzZIWGdEbE4z?=
 =?utf-8?B?Y292NFViUmNXYi9VblQ0VCsyQkRmR20xaW5EZnpEeVBKREdRQ21FREp5cjJp?=
 =?utf-8?B?ajI0R2lyQzgvcVZJamlEbTFBQVRBN2NWaWFyZFluYnZGZW9kTnJFSnBMNitZ?=
 =?utf-8?B?aHgrOFp6YzdQRXNTaFVBNTBCZkxxNVhwa2h3Z2o5ck5aNkhvVE1zZHp2MFE3?=
 =?utf-8?B?a1F0OTRTUEovcGcvVlFYWWdyWVFEdXRuUU5EUXJ4clZxeFhteStNMDV6ZUFR?=
 =?utf-8?B?Kyt4U2lodlRGZG44OE9DQUNDbXphU1lIK1MrdUUyS1MvV2ZFQmhrc3R4OUZ2?=
 =?utf-8?B?eCtSZlR0MVIrdUdteWVkUEJ6UVJsamFNSWI0WTY5SXIxUHVtSmc2QWJqYmlk?=
 =?utf-8?B?dmpQdnIvUU84RzdtR2QwN0FzMVlGNzdaZStUcGhXVVkreitUV1VZb09PaVVp?=
 =?utf-8?B?TkZaNVNySC9HWmh2S1V3WEhPWXdLWDl6bDgrUGhPZ2Z2TCs3THJjMy9reDBL?=
 =?utf-8?B?Z2UrdGE3c2ZjeXovRjJEajZPdUlxeXFpbnZCam45WVdTNlRJcG5Ec3ZWbjRG?=
 =?utf-8?B?OWdmM1pPZGV4K1BRTnNWWm9LTlhyZUxwUHZUeGtmaXBRcU9GSmhnMThQemEx?=
 =?utf-8?B?Ny80SEVPRW1ZNzlXZ0l1eXNicDVPK1NVT0RMVGVNaWYxMHpsYk8yNnhXV3d1?=
 =?utf-8?B?Q21qUklQc2x3YWo5MUxaR2ttdWpGRnBaWlJSZzFBdzcramdkaGJPWmQ2a2hD?=
 =?utf-8?B?VEx5VEFSWUovL0NoaHZlUVdiTXBnMTd4L0QwUlU3WUJuMElncnIvc3A2Z3J0?=
 =?utf-8?B?aUdHRXNyMVVuL0QxNTBUTjJBNG9OSkZrN1hsb1pJcXZhK0ZWYzJ5QllENnlW?=
 =?utf-8?B?d2lvZ2FnN0pIRVpBakNTY3JubENJVjNGWE91d3ZSZ08rN3Ria0pVZEFXQ1pP?=
 =?utf-8?Q?vpKrred2A38tjn3Xxn1vTlrd2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640cdf5b-f0a7-405a-046d-08dbd08fa64e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:39:19.3096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoahUqWTsg2XUeMFWURTFd2g8/Sa4yl+Gn+fRQYS5JHrlLxSFKPPLZ1IN4te4PU33VAFn4BP3VOPA7tQVNgkFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9278

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/percpu.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_PERCPU_H__
> +#define __ASM_GENERIC_PERCPU_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>
> +
> +extern char __per_cpu_start[], __per_cpu_data_end[];
> +extern unsigned long __per_cpu_offset[NR_CPUS];
> +void percpu_init_areas(void);
> +
> +#define per_cpu(var, cpu)  \
> +    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
> +
> +#define this_cpu(var) \
> +    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[get_processor_id()]))
> +
> +#define per_cpu_ptr(var, cpu)  \
> +    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
> +#define this_cpu_ptr(var) \
> +    (*RELOC_HIDE(var, get_processor_id()))
> +
> +#endif
> +
> +#endif /* __ASM_GENERIC_PERCPU_H__ */

This looks okay, just one request: Please use smp_processor_id(). You
may have seen on the Matrix channel that there's the intention to do
away with the get_processor_id() alias that's used in only very few
places.

Jan

