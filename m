Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F014697A95
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 12:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495864.766300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSFpw-00043K-KH; Wed, 15 Feb 2023 11:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495864.766300; Wed, 15 Feb 2023 11:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSFpw-00040y-HU; Wed, 15 Feb 2023 11:20:32 +0000
Received: by outflank-mailman (input) for mailman id 495864;
 Wed, 15 Feb 2023 11:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSFpv-00040m-UQ
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 11:20:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfeffa95-ad22-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 12:20:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8704.eurprd04.prod.outlook.com (2603:10a6:102:21f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 11:20:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 11:20:26 +0000
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
X-Inumbo-ID: bfeffa95-ad22-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAnNdXpkwzhiBfFwlNTkOmY+kA2gMdIav+jSd5wYyveYgNF2P2M03pnGhARNBQ5c0oLFXOUXtckI61iVrabo7iUjVfrPn33+xgAPSrz6/HsaeOgfRG+ec23Y2+bRjfazWHGeeOeC8EsorGH2CeUnSF+OEbuwgxztBGvtQTC+gMcugw4/mjSx3bdvZrL28Gqc7T9Bk9xx9qoNsf0I7vLRpBrol2AwjpcmMy5FrL7ll/pRzoL9KRvFzXLxSoYli9ZUAonM37EmREWew6ZW3syGALMx/N+wQr8vUtnYaA70t4DoxDCdfF3ephsYzkr0+geW04XnDNMEEvinKeqIrxhDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLQBwUo8pTsjmjnQXXWMkKlj6IoehQgr5Q98hhErjCQ=;
 b=PT1LZgkKf2XS1F6gFwvooCOIv72/n813ZnCbG6xqmQjJ+AMHJnn6OHFRe2tyvY+Ik8MbyMMi+JtXrlF2aT6FDWpbprC2vCX57F8LBFzZ/51WCMT46Kh9Qb+vJB3+uRXC+0T+fx4um2xbM+8OqVS34P7pZOMcvtyfJYSHW9lH5lxuMhrt+2DrUHv9MmNnpGxY14OVZVs1WygB1UA1deQVZkxFSHo4KR3xqTkiIEVZh9WNZ2fNvuQY/y27UcsNtLdG8+xG/LHNtWO3nkaYTq4jN8P4sGGLCFMkMZnqHVt8Kw6xlKuPWJG79sNj5wP9FWQ4BtaKvR3uAVHvbsf1jYH2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLQBwUo8pTsjmjnQXXWMkKlj6IoehQgr5Q98hhErjCQ=;
 b=G2+cjToEyp6FpvJzCd3WqGfpMAZSFoNy18zd9J0bngt3EQhVKgQr3/leJRTmmyyK1gxeoIE8MRffBFgFnUvVv6qqEvhsZgAiw73SH5rTAvm2Qe/RitnVkJCpTQlp9ZyUr7H/syFyAtwtuyjBXTQeLJV8yk+LHRe5+VyNXksZ0WVzWmJnIjp268ITpJgmcOShvgxLeLx2ZUfMMRZXt4by5DLLlr+2z3btCACD+ajX91LQtZ1nOycah+vIc0tmT/IJqKBw20JEPhtjlY8OMQsw+56u2bfw9Dwjh08lAwisEMqmc/a5o2xcQcU2hqHIy43CouVZK5oT5yP/ghLn2o48xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a89db71d-dc4d-5b17-1528-4b8a4243addc@suse.com>
Date: Wed, 15 Feb 2023 12:20:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 04/10] xen: add reference counter support
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-5-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220831141040.13231-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 601ad46b-e70f-4f98-6d68-08db0f46a2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dj+LUULEq9RsPbPEq9f0F2xFPsYkUGd2aHgFRgukgxjY7oHYsyLTR3d5LTdZ4C4h4myMY9KMoOPcT7o9QxOiCg8mczdz1wIEIah5ppLqQqTWQbrqlFZ4bDpgOlBxwJApJXQNy0AuCTQt9AaAkB2Czxpi0m713b8G9XgJ4oGaixA1cTnev5kRJq0FUFyYfwvC7zJkVZc39+9dS7pgfl5uFYJz0FcIEeLZLlcdoQlxCwAyRlFLMUYKcoH4muyshBChm841ICsTEcM5gyzTGqWmi/yu62gjSdIW9kcbCBrmDX8hylklMOjQtam/ZVjuJHm7u0euN5plRTFJUrteG7vXuFxN1VCbAibrNsEO1L5i5Lv6wKV1GljVGec00xiRRwp0GRFvU7U8kVpt21M7GOqhOJBF58fUoJU21ulquEOECkG4y+TkIZuKrVyMHdve3jf5MC3pPrMWjFQXrOqMsBz7UkJ72W7exb1jL1ZjLn3qExNm4Nr3KzRasECprFk+v5rO7PlVg9FnGtcPifxJ/+2Cfu3WjZSabUHzwUDe03kUcx7eOfanSZOy4CIPn3Q0G6LnOkNpPWU71MzK0ql1h3ydbkuuYrHqvfJ0nOP+SA7BbZ0g4Do1EngcjAp0gXHtH80MOhZiCkjK6RLT6AZrgdlDh2DGicDVCVFw4ASU1NcVd2j92eOcPuX3o9IoUDGBUHvWDkLZrXsn/aIt0HArVz0oyPfRiQNZotgcDnEN7DzY1TI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(2906002)(186003)(2616005)(26005)(6512007)(53546011)(36756003)(6666004)(6486002)(478600001)(8676002)(31686004)(38100700002)(41300700001)(8936002)(31696002)(66476007)(86362001)(6916009)(66556008)(66946007)(4326008)(54906003)(316002)(66899018)(6506007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1RNd3VFc1VuOHBHSHBuMXNSNkJ6K0JRTmYwclA0UWVjRGFWOXh2SGRvRnFy?=
 =?utf-8?B?OHZCZzBvbHBibUg4NnJWREJnUU9pUjc5US9DK2tCSFdkVlY4RzBhWmpRMU51?=
 =?utf-8?B?bmlYQUFGM0txZ3BRYzRhOXhJWklJR1RwQWpMTnFOd29KZGFCcDczYU82WXp5?=
 =?utf-8?B?eW8raXFTdTFCYWFlb3JZSXVabTdZWGFBRU5nbVJBbks4RkxXd3dsSkJERklH?=
 =?utf-8?B?MDc5VDhyUTkzV3g3NGVwc2tzcWRWclFwVytKdXhERzhhV3lvMklpY1hSbFVT?=
 =?utf-8?B?dDl3bGJyUVFtUlhFTktuQktiZlAvSzkxdUUxOVN4dCs1TktoTTN4eFAvbnkz?=
 =?utf-8?B?dzJDMmRJc0tNUmdxSFRnYXlQd3BGL0lNY0VVMDlaN2tSWnFRNmJyUU1rWXQx?=
 =?utf-8?B?QTFUaS9jUEJMVTBJUUdTR1RlRGFhbnd0MHVib285OUEvclltNVBWUWlYY1Av?=
 =?utf-8?B?U0owZk5lcVJTSkFhTXA4SEZ0MXdsKzdVb1RKZ2tFUVUzUXN3RFlDd0pjek9C?=
 =?utf-8?B?dVQwQmdFekVGb1g2dmhvRkY1OVowVklDaTVoVnJFbnF3Q3V0SVk4U3FPZXVP?=
 =?utf-8?B?QXNSOUZIb1lrc2pZbDl6NnVlRC9hYmJCQVBzNm9TQXFSYUs0NVBhT1gvdWJO?=
 =?utf-8?B?eFhxeE1BSlBCQ04xTjFhL1BGMDFyQ3h3R3UwUjNoeFVzWTlTRjBvVEYrMTlG?=
 =?utf-8?B?dzNVbld6bWhtY3B4U3ZGejU0OVNIN1Fpb3cwbVQybFE5NW9uSXpPa3JKY3RR?=
 =?utf-8?B?RGJiOVRYMkszNktLdTFzenMvVHcyZjFtZUg2RnRkQ0JOVlRBSnhKcFZzYmJV?=
 =?utf-8?B?c0JDSys4Z1dsYXZNeFZQTmU4K0taa1RIL3ZYTllWQlZ3V2ZMK1B4ZXNOR0w3?=
 =?utf-8?B?c05EOHZmOHQvZmczTTc1K2k4ZlpBR3p6dERoNjlDMWUzUmF3MjlOZERPQW9U?=
 =?utf-8?B?V2VjUURlZHREQmJ1ME9lVmVQWWhNckY2b3ZpT0E4UnpXaDM4TE9TbWlPTnFj?=
 =?utf-8?B?aVRQWlAydkdLTUoyNCtQMDNLVWRoeGZicFhoV2xodFVYVFRqYWNqbHhxeDU0?=
 =?utf-8?B?eDd1OTNIQit6ckhQV2RpYmlPNHpnd0JtbU9qc3k2KzZqNXBsTW4zQ2ZyRnFY?=
 =?utf-8?B?ZElDZGt0S2xxMzhCOHlaSXNTREYzYUtBVUE3MzJzM0k2ZisxRE5rQmhsR0dI?=
 =?utf-8?B?SnBlRC8vM3R1Q1drMUxvTEluQ0V2TzU1SFJKUEdVTUlPVGRaam4zRlJvOXJQ?=
 =?utf-8?B?dzZpeGpZNDBYVFhoeGhrK3BaZ3NqS0hTczhVdG5sb3UxUnNmb1E1NUV0MzN4?=
 =?utf-8?B?cFRZMnQ0NDhZWFNOenF5OWppZVk2T2FySklmK1grNzBFbDFqNGF2YUwyVUh3?=
 =?utf-8?B?ZkdYODBXSmI5QUl6Q2htS2FyYm9GUTRmbkN0OFFnS0xWY2FTWFA4bVprZHRR?=
 =?utf-8?B?MkhHU1BOek5NaHlkYXM3cjhNRUplTGtTVmFtRlgrK3oyUW5CUFFBOWpLOW5G?=
 =?utf-8?B?ckhlUlBZVnV0U2wwRVd2NUFaektMVTRObCtFL3NtQkR4cG43MGtpTEt2cWVK?=
 =?utf-8?B?Y240QmJTSzZMb1JyaVM3ZHVOWURGRnpkeG93aEwwMmhWUFhBMVZNQk5Ba2x4?=
 =?utf-8?B?WmxFR0dmU0hVQ0Q1aENiTkFIbURPVEhSNmtnVVZ1UTJLVmZZZUhDdENYVVlG?=
 =?utf-8?B?TmZHWXh6dGdETGFOVmNlNjczaFV0ZE9tK3cxeC85TndBZ0pGNW40NGN1WTJB?=
 =?utf-8?B?dURHUVluQnBYejFRbDg1RENwemN0bSsxV3Ixcm8yTEpYUU9kdDIyU1ZkcXZX?=
 =?utf-8?B?NGU4Tkdzc1JqUHNKdlRRRE5HaWhpS1Rqb1RGanl4WXJKaWRqTGtaYnlIUjRs?=
 =?utf-8?B?Nk1TYTJhMzNmek8yL1IvUjlJSFF4Y1B3WFVaWkx1bm5zcUEvZGhWZC9kaldS?=
 =?utf-8?B?Sk1JcFUxd0U3NmdRTkd1S1pySS9XbWVOYTAyUW5IN2cwQWdCdGpYaW4yWXZY?=
 =?utf-8?B?MklzOER1bHB5ZzJ1WXVEL2hBNHo5OXlLMGE5LzJscHk1b0dHTElVRDJqNW5s?=
 =?utf-8?B?UzlTcytnbE9MZ3doNXJKL0xZc1ZwSDR1T3FmNWR1blNnUkdnYWdjV3dVN1Vt?=
 =?utf-8?Q?WKFNjkXXjQmZ8LcVBK49dv3Ry?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601ad46b-e70f-4f98-6d68-08db0f46a2c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 11:20:25.7257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIsasXu0py0g2qY4eHLHISsd7WzJg/LQIZ9yo1AZhS76oFhpvAz1gTqd4G6iJu4BFtNrVT8C5qH9BgJIGyEOXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8704

On 31.08.2022 16:10, Volodymyr Babchuk wrote:
> --- /dev/null
> +++ b/xen/include/xen/refcnt.h
> @@ -0,0 +1,28 @@
> +#ifndef __XEN_REFCNT_H__
> +#define __XEN_REFCNT_H__
> +
> +#include <asm/atomic.h>
> +
> +typedef atomic_t refcnt_t;

Like Linux has it, I think this would better be a separate struct. At
least in debug builds, i.e. it could certainly use typesafe.h if that
ended up to be a good fit (which I'm not sure it would, so this is
merely a thought).

> +static inline void refcnt_init(refcnt_t *refcnt)
> +{
> +	atomic_set(refcnt, 1);
> +}
> +
> +static inline void refcnt_get(refcnt_t *refcnt)
> +{
> +#ifndef NDEBUG
> +	ASSERT(atomic_add_unless(refcnt, 1, 0) > 0);
> +#else
> +	atomic_add_unless(refcnt, 1, 0);
> +#endif
> +}

I think this wants doing without any #ifdef-ary, e.g.

static inline void refcnt_get(refcnt_t *refcnt)
{
    int ret = atomic_add_unless(refcnt, 1, 0);

    ASSERT(ret > 0);
}

I wonder though whether certain callers may not want to instead know
whether a refcount was successfully obtained, i.e. whether instead of
asserting here you don't want to return a boolean success indicator,
which callers then would deal with (either by asserting or by suitably
handling the case). See get_page() and page_get_owner_and_reference()
for similar behavior we have (and use) already.

> +static inline void refcnt_put(refcnt_t *refcnt, void (*destructor)(refcnt_t *refcnt))
> +{
> +	if ( atomic_dec_and_test(refcnt) )
> +		destructor(refcnt);
> +}

No assertion here as to the count being positive?

Also the entire file wants to use Xen's space indentation, not hard
tabs.

Jan

