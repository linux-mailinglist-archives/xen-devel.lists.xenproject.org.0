Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA6B772A46
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578710.906349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2rW-0007Cz-6T; Mon, 07 Aug 2023 16:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578710.906349; Mon, 07 Aug 2023 16:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2rW-0007BH-3B; Mon, 07 Aug 2023 16:13:42 +0000
Received: by outflank-mailman (input) for mailman id 578710;
 Mon, 07 Aug 2023 16:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT2rU-0007B5-Co
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:13:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e5aadd2-353d-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 18:13:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Mon, 7 Aug
 2023 16:13:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 16:13:34 +0000
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
X-Inumbo-ID: 5e5aadd2-353d-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIGsn4o9IN+nOUoG8xhwQRTEaJkU1z3U2A8q2nX+wR7sPhx8z/qOBPv47lntBimvn6ys7yL//KqrtHxQIvJNtxkcXHxnyXDP4TszY3gCcjAoAiZADKRjb9lANvh1Z+369EhYwjBVH53yYc/5XQLytRJAQMux2R+akLXrl5/YUrzOsH/5Gdon7FI16CvYcR8tm1L55qxY6RWgi1U7i7IpKw6RCF98SS7sdyOHTbNfn9pVeg2oFRVD6ezyuOurPv9fsyNjs8Cn6kGMyvlTSzx/m306UdOBs5dBkdxhStBZxXBhTD83RezIWj8HjwvcEohyxQvxszc3pTzVz1jcxelIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9BBDvlTNSHInOuR4isqlN/DZv5qAdgN4AiiOd9csnU=;
 b=AGnUs6vbVHhgcU8TMab+tATw/X0GPPOt4Jj8kdpcclR/ljWx5zf9zKglA11rraxBh5fxgdQIjY9H9NIMRmwr/M4Qf6x4EhMUL/tNIoF/8R3u50/IyMgym+Gvv3iI2j0atbx6qMK4iMXbab4SX3xSJohRG65Ae/oFyBrt3fdGjJDAi2mAWpmhDwaydH3V9bRdn/SWseyEL0B/Ry1mp8kynGDp/kkhqFjBUXFieNta+w8ZBKUxX5jo5LWlzgbNYcZCUpb5d6QEVumjGwrxEhoKjbYAL61IOS3/4W2D86Xil8QPBbH4jNvgqGo1wu4xCrT2j+m5is+SEju5VLLqAxZnAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9BBDvlTNSHInOuR4isqlN/DZv5qAdgN4AiiOd9csnU=;
 b=b8zmMn8Cz9ZLmAIjk3Ppw82mhPVxR4S+I+2KklDQE/ldy3PQQltIEJvLwS4xj4pLbM3X22mV11GZY5q39qMW6cYZ3tw6dgkN9SZa2Ojw4+PM1kmQXl4P0CW66Qy/quwkslfubN637GbeeZfprD4WHOxfVxxbJVfYa8vY+KlQuYZYUIp6pDhfzXiaJtIkICfV/1ZorNQDzMGxqRYBZ1i63HMXcPQy6fNtqQfUiLjzNMTfGGopvhEZuBc/yzNrcax5IqO3YTGUB2dsLUVgSfPsoxorlCWpzdFnsqE9/PmjDAeRl4erbd8E3znZYa8lxhmuQdhFbpBBWsBVO/IXTHZ6gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5e9380a5-7e33-ea70-6aa5-3ce1906a159c@suse.com>
Date: Mon, 7 Aug 2023 18:13:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/9] xen/ppc: Implement atomic.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <8035b9659a5930c00802dd36ab52574695d6b419.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8035b9659a5930c00802dd36ab52574695d6b419.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: ec5ba9ac-5f24-4814-b7a6-08db97613fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nhYtqt7x+7P+03qFDQhRufMFj+vThEpORdctHCk0USETSKdkUhoqGUlobohpRr1ZV+bxmMBh1ZWsqusZxAiiCoien/AVbghst5I/rW9P8yDTs2/V7LcJ5G+VcPe9O2nLAk295T+ttsoxgGxazxjIJowViO9CFo5p4FrFlxt/TWJoPCeOU5+UU/In9dewtYwegYlU2yYPBbkQsqFsmFPiM6CgcxzASB6EETyZdkdJcKGyEarQWa8HPVaKtfpG1Y3LyNccz9nCw26abmJ1tXJZWY0+LqBknJYwkwybNAnboxzUZTti+eLvIlIWUadXn6PCehDJA+IV3Jgml2wheGtPWEGNF2vsETLWQIcvxmTR71sQ88YzTrX0DdLnVfa/BZM1hjXOsvHma3r8oxN0z8rIQ2mBYJxAYFazs3eCv2nDUuSo3Vxz4SHQ2UekLrXH1f7ZbPyNXESXZQztEe0J01q9rJXefSb98oUwMjVPaJBIq8kbE34WFGXNzl/kNyOYtOr+e/IJ9twwto4H6RdOenWYV0cXuC/sEsHf2VZ+xZeKZ3fFFwvXLnztePkRUM/GfFmipZxs/owNyZmXU/w2cqcdaiIvtXsHLx9bGLpZaOyz1x5AnWOPDWLHDZrjOgxh4Do7ua7jboBiCNMbcUa0KyMOwMm2411YlO3Wx5JHzQDPGPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(1800799003)(186006)(2906002)(36756003)(83380400001)(5660300002)(2616005)(54906003)(6666004)(38100700002)(6486002)(66476007)(66556008)(6916009)(66946007)(6512007)(4326008)(316002)(31686004)(41300700001)(31696002)(86362001)(8936002)(8676002)(26005)(6506007)(478600001)(53546011)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlVTam5pUTd4LzNWd2pxcTY0b3hORmlMcTZ5RzBYcUhldlpQVy8xeDAvbWc2?=
 =?utf-8?B?dnNkVzBlR1ZRSzMycm16cTZ2WUFOTzgvK3R6RjV5ejg0MktjVElJTC9ERjB0?=
 =?utf-8?B?TThXQUFQaWhyYzlFSEx0SlMyYmRYQXRmeFk3cHVMcit6TzhDaGo5WnpJeUpB?=
 =?utf-8?B?SFVqNjIxcWc5bm5OY1Zub3A1MEFvWmd5Sk1KOUFWMEpRTXBobVA0S0NUUy9s?=
 =?utf-8?B?VkZDNUdJa2RrUHpGWFFHVzlENGlIQWcwNW12cVpjUjk2OCtnZEdpdlNXUDlv?=
 =?utf-8?B?YU8vUkw2UjZJNGJUV2xlUjJseGlvd2NxdGdqaWJQY25BRDcvTmYxUElRNVE0?=
 =?utf-8?B?ZENLRXRGWUU5aUN5bGJ0RVZMTXZleDQzY2VXclVjQlJhTnVyMnY0d1RxcFpl?=
 =?utf-8?B?RUZ3em1xSk1hbTUyWW9lQ0pTb3gvRUhPSXJwS2ZmVG5QSENMTHNDYTZveVgy?=
 =?utf-8?B?RmhuMldZejVEZVVyN2Z1bWtIYlh2RWZzWFZUOHI5aElWM211NGl5UWx2ZEpW?=
 =?utf-8?B?RjRsUHJJREttVTUramFXMWd0bWRkYUxPbXBZa1VMUjE4SUROUkkyY3d4U01m?=
 =?utf-8?B?a1BndTk3dm1uS1NWZTQ1OHJnUTdQZkVRR2t4d3I5dERGOFdJcFJQSHgzWE9Y?=
 =?utf-8?B?TmxpZnVKcnRRY1p0RGdsbllpR1cwNzJHMzByRlFmeEtmVDNDMkFVRmtrTUYy?=
 =?utf-8?B?cWltQ0dZeVNXcnZLRE1ZeHZPN1UzN0dnS1piU3ZEZ3VSdkdtalkySjV4ZkVy?=
 =?utf-8?B?OWgyRTBDSFlBU1g4dWk3WXR0dHM4a1EvVTJpWXU1Zk5KRjlza2tqakNXL05r?=
 =?utf-8?B?Q1JLOFNDbEIvSjZlYytvZFNUam03dEIydnZ4bjl5NHBpWEZRL1NqcFFEOFZ2?=
 =?utf-8?B?elVGUC91WkdQdm5CL3VWTWxpSzFrd2tGZm83cXRQQm4yMjZ3K0lDNWNNYjZi?=
 =?utf-8?B?TnkrYjFuZ2hyUzBnTjBoM080cDNuVFBvZU1rcHh0WVNjcFBPQm1yeWU1bGJY?=
 =?utf-8?B?YkNQYXlLK0tvelZ3UDE1WlA4VVJ0NmEzdTFZRmdZNkthVmkwdi9pT3VIdEtn?=
 =?utf-8?B?elhmTEtSMlZRVTdwK1A4Tzl5Zkk2TWZ1VVVGWHBwWUttbUVYQnRPM00yVkJI?=
 =?utf-8?B?Mng1SXhVUXd2TGZsckE2UndQZDZrWXBhUk9zdG95QTBMK21QMkd0V0srOWpY?=
 =?utf-8?B?L3VvMDBBVk41azZpSm04cVZ0NkF0aWs4U0dvUG5zNmZKb3l0Uy92ZjJWOFMy?=
 =?utf-8?B?VHo1Um9sTDR2aU1YR1A4RUVhVEZLeG5haGtmU1dodjE1YjJRelR5SXRGM2JX?=
 =?utf-8?B?R3cwb0RHR003SVRlSlNVK0ltQ01IcmprRHZQZldpa3NpRE1od3V2SWM2TzRv?=
 =?utf-8?B?OCtoK3Z2eGxGWi81T3B3M2ozcFlaRW5WNjZqN0F3NlhGdHNzNE5Tb0sxcm1u?=
 =?utf-8?B?MDdnQ3Qvek8rbTZPdnMySmlYQWpVRUxTQzlHVXQrS2hUUnM4ZGd1RjlsVVJn?=
 =?utf-8?B?RldkS1R1UmhEeFFhY1lBNllIa1lRbFh1bWczYmt5anJaTUxDQlFWM0FValJK?=
 =?utf-8?B?QnM2cWw1SEJkQmxBMzA0R08rWnhpNnp5U3BxTFdxSDhsTTBTMCs4dFJERXRw?=
 =?utf-8?B?blRTSTBILzdQMnVLWWhDMmIyeDNWWWF4NVVXemtDVzBEV0Nla1FYaWxvYUd4?=
 =?utf-8?B?T1VCT2hndDFBV0t5RFA2U3VzZUVENFY0MmhMbmoyUXJUS3NVNmV1SFZwU05t?=
 =?utf-8?B?RWJPQUpZZUQvVjY3dDNCLzJPTk51b29odHFSb2tTWG1BTU5JdGNYSk9VWjV3?=
 =?utf-8?B?YUQ5ZXJ3SFNVdHNVVVJ3Q1dVNHY3ODd4YklacWdJdk40M0lPMEhDVGhBM0hJ?=
 =?utf-8?B?KzF1QkVLU3MvTGMrSGZPSlY5ZXJjeXNBaXJ3RmNCOFdhaE5oaW80QnNhdUpq?=
 =?utf-8?B?R1E3ZWUzajVlL05sRkFLRldGSkYvVVpSZHFvbFdhL2orcHI2TjAvN0lUUThG?=
 =?utf-8?B?TStHYnNNY0ZPMXNtTzFQcjZlSnhFUWx3THUyMytvOTRvdlJYbkVzZHkyQ1RD?=
 =?utf-8?B?MndqdGtjL0tEZ0ovWVdRSms0dFlSZVRxUjhPMVpkT3F5bHFPZW5TbHVuNVpC?=
 =?utf-8?Q?WhpgJp63eLEwiEB8ZDXBjdE1m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5ba9ac-5f24-4814-b7a6-08db97613fd5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 16:13:34.3268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlMQG9yMrTJMHnV5GZTi64P5BcRT8KK3SV1RR6bj4fz4WRgrhDeZ2r39dQiYuCx7N3oFThxInBQinKV8VfJfgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726

On 03.08.2023 01:02, Shawn Anastasio wrote:
> Implement atomic.h for PPC, based off of the original Xen 3.2
> implementation.

Since likely that originally came from Linux, did you cross check that
Linux hasn't gained any bug fixes in the meantime?

Other than this just a couple of nits; I'm not really qualified to
review in particular the inline assembly here, I'm afraid.

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/atomic.h
> @@ -0,0 +1,387 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * PowerPC64 atomic operations
> + *
> + * Copyright (C) 2001 Paul Mackerras <paulus@au.ibm.com>, IBM
> + * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
> + * Copyright Raptor Engineering LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
> +
> +#ifndef _ASM_PPC64_ATOMIC_H_
> +#define _ASM_PPC64_ATOMIC_H_

To fit the name, no "64" please.

> +#include <xen/atomic.h>
> +
> +#include <asm/memory.h>
> +#include <asm/system.h>
> +
> +static inline int atomic_read(const atomic_t *v)
> +{
> +    return *(volatile int *)&v->counter;
> +}
> +
> +static inline int _atomic_read(atomic_t v)
> +{
> +    return v.counter;
> +}
> +
> +static inline void atomic_set(atomic_t *v, int i)
> +{
> +    v->counter = i;
> +}
> +
> +static inline void _atomic_set(atomic_t *v, int i)
> +{
> +    v->counter = i;
> +}
> +
> +void __bad_atomic_read(const volatile void *p, void *res);
> +void __bad_atomic_size(void);
> +
> +#define build_atomic_read(name, insn, type)                                    \
> +    static inline type name(const volatile type *addr)                         \
> +    {                                                                          \
> +        type ret;                                                              \
> +        asm volatile ( insn "%U1%X1 %0,%1" : "=r"(ret) : "m<>"(*addr) );       \

As I think I had mentioned before, asm() contraints want a blank between
closing quote and opend paren. I.e. like this

        asm volatile ( insn "%U1%X1 %0,%1" : "=r" (ret) : "m<>" (*addr) );

> +#define read_atomic(p)                                                         \
> +    ({                                                                         \
> +        union {                                                                \
> +            typeof(*(p)) val;                                                  \
> +            char c[0];                                                         \
> +        } x_;                                                                  \
> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
> +        x_.val;                                                                \
> +    })
> +
> +#define write_atomic(p, x)                                                     \
> +    do                                                                         \
> +    {                                                                          \
> +        typeof(*(p)) x_ = (x);                                                 \
> +        write_atomic_size(p, &x_, sizeof(*(p)));                               \
> +    } while ( 0 )

Up to here you use underscore-suffixed locals, but then ...

> +#define add_sized(p, x)                                                        \
> +    ({                                                                         \
> +        typeof(*(p)) __x = (x);                                                \

... you have even two prefixing underscores here.

> +        switch ( sizeof(*(p)) )                                                \
> +        {                                                                      \
> +        case 1:                                                                \
> +            add_u8_sized((uint8_t *) (p), __x);                                \
> +            break;                                                             \
> +        case 2:                                                                \
> +            add_u16_sized((uint16_t *) (p), __x);                              \
> +            break;                                                             \
> +        case 4:                                                                \
> +            add_u32_sized((uint32_t *) (p), __x);                              \
> +            break;                                                             \
> +        default:                                                               \
> +            __bad_atomic_size();                                               \
> +            break;                                                             \
> +        }                                                                      \
> +    })
> +
> +static inline void atomic_add(int a, atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile ( "1: lwarx %0,0,%3\n"
> +                   "add %0,%2,%0\n"
> +                   "stwcx. %0,0,%3\n"
> +                   "bne- 1b"
> +                   : "=&r"(t), "=m"(v->counter)
> +                   : "r"(a), "r"(&v->counter), "m"(v->counter) : "cc" );

"+m" and then drop the last input?

> +static inline int atomic_dec_if_positive(atomic_t *v)
> +{
> +    int t;
> +
> +    asm volatile(PPC_ATOMIC_ENTRY_BARRIER
> +                 "1:    lwarx    %0,0,%1        # atomic_dec_if_positive\n"
> +                 "addic.    %0,%0,-1\n"
> +                 "blt-    2f\n"
> +                 "stwcx.    %0,0,%1\n"
> +                 "bne-    1b\n"
> +                 PPC_ATOMIC_EXIT_BARRIER
> +                 "2:" : "=&r"(t)
> +                 : "r"(&v->counter) : "cc", "memory");

Missing blanks near the parentheses. Would also be nice if the padding
blanks actually vertically aligned the operands.

> +    return t;
> +}
> +
> +static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
> +                                             atomic_t *v)
> +{
> +    atomic_t rc;
> +    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter, sizeof(int));
> +    return rc;
> +}
> +
> +#define arch_cmpxchg(ptr, o, n)                                                \
> +    ({                                                                         \
> +        __typeof__(*(ptr)) _o_ = (o);                                          \
> +        __typeof__(*(ptr)) _n_ = (n);                                          \

Problematic leading underscores again.

> +        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long) _o_,             \
> +                                       (unsigned long) _n_, sizeof(*(ptr)));   \
> +    })
> +
> +static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
> +{
> +    return arch_cmpxchg(&v->counter, old, new);
> +}
> +
> +#define ATOMIC_OP(op, insn, suffix, sign) \
> +    static inline void atomic_##op(int a, atomic_t *v)                           \
> +    {                                                                            \
> +        int t;                                                                   \
> +        asm volatile ( "1: lwarx %0,0,%3\n"                                      \
> +                       insn "%I2" suffix " %0,%0,%2\n"                         \
> +                       "stwcx. %0,0,%3 \n"                                       \
> +                       "bne- 1b\n"                                               \
> +                       : "=&r"(t), "+m"(v->counter)                              \
> +                       : "r" #sign(a), "r"(&v->counter)                          \
> +                       : "cc" );                                                 \
> +    }
> +
> +ATOMIC_OP(and, "and", ".", K)
> +
> +static inline int atomic_sub_and_test(int i, atomic_t *v)
> +{
> +    return atomic_sub_return(i, v) == 0;
> +}
> +
> +static inline int atomic_inc_and_test(atomic_t *v)
> +{
> +    return atomic_add_return(1, v) == 0;
> +}
> +
> +static inline int atomic_dec_and_test(atomic_t *v)
> +{
> +    return atomic_sub_return(1, v) == 0;
> +}
> +
> +static inline int atomic_add_negative(int i, atomic_t *v)
> +{
> +    return atomic_add_return(i, v) < 0;
> +}
> +
> +static inline int __atomic_add_unless(atomic_t *v, int a, int u)
> +{
> +	int c, old;
> +
> +	c = atomic_read(v);
> +	while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)

Btw, no real need to parenthesize v in cases like this one. Otoh a needs
parenthesizing.

Jan

