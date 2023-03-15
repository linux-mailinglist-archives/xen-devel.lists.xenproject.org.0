Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47546BA8CE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 08:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509911.786648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcLIf-0005ut-7L; Wed, 15 Mar 2023 07:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509911.786648; Wed, 15 Mar 2023 07:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcLIf-0005s9-2Z; Wed, 15 Mar 2023 07:11:53 +0000
Received: by outflank-mailman (input) for mailman id 509911;
 Wed, 15 Mar 2023 07:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcLId-0005s0-65
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 07:11:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6da52ae-c300-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 08:11:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9586.eurprd04.prod.outlook.com (2603:10a6:10:31e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 07:11:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 07:11:45 +0000
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
X-Inumbo-ID: a6da52ae-c300-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESbbwOv/8r29tGecZZ4KukTJhXpZj+9ZjJwyKO6Y8wKOLBeYyRp2K0LqyZick19147Z+IMKoA09pxnLPw20Bmi1xksYHHrH7fg387cFUucf2jJPAUAqujcwi34MdPh0kNrLB1MGvSF7MRhok+eO3bNvheSNYPB81SqradnVzY5oATxSEDCSml9JgEAj6IrJAvO2uDpB1IkctYIKrKhjq9eRY1j5ziZTEas2NnEDW0AImgSnauuONcRZOg1JHZ6VVTGG9DTvdxMnIYHUp1XJT9fh3XAmiZ4pZ/Vk10GyOc6sebqNR+rBcRU4d1ZphdJaMNZlx8ne/cdXJIvWRBYWCVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umWaP3yPo1uMFAh8XNCRfHSYwRs2jY9LURlRc5AENiY=;
 b=ZxU1Z2BNppJa667uXS29JppvgWsRMXW6trol3v+bE0TD3YTszVk6UNd2WZ1aOMGHg5fQxojoON/mVcKtB4A74znlhCwqSEO5yFRtD4yQA1FBSwtTej94X0U62PK78/g7cc2l2N6Bjpp+Y2p8ovzHi2c7yb/Ep9qQfaUaRKygD/7EDkZxx9lgfSNvCE4HRLu0emu5P6+UAyu1h6gifa/xF7XcMJD0w9KGkVvB3pNAgQhxgqP6FVRCWzfwSXYhxEY+Ht+WoRLmQu+i5kNsbblKoJaTnDZsxJDgysPXo3ozzalsIbpTXB+L6kuGsZtbSjP/t8gLfnZzAGaohW70MnY3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umWaP3yPo1uMFAh8XNCRfHSYwRs2jY9LURlRc5AENiY=;
 b=mAmsign5a9PfUMt1uRfBhW37v2YPDMJW7zb8ndDLQZM2rRbbQ9wvNPZBzx2GB/odyMl0ipozzt2/FcpLJ31iPR8oZVc5loEyWrlBB9VgN8TwoilMmpFoaVuq/gVaUjwRgRF9UFwEOq8PTxa083S58+6LkR9DoEajgGOhG1PxfQmDgksU++RT747y7PnuXdvY1H7OZYBk7Ag/Ah+WrQ8heSuhFnN6oYShZJvPXUqUM/uebQ+okgCKvDCOqno6IOUrE6BcOq2NGhaEN0tws6seVxP7pZ0dFTYI0oUX1WCmR4y8rXHQoS2HVPYkSxg5KkG5F4ZBwP3mZ7CSmnRf8iwrxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62999301-ee27-67e8-2bf5-c02c19ea2d76@suse.com>
Date: Wed, 15 Mar 2023 08:11:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678368234.git.oleksii.kurochko@gmail.com>
 <671cd744b92f14ddc0c47ca471e03e3229cb89ba.1678368234.git.oleksii.kurochko@gmail.com>
 <3df43c25-6c06-0cbb-5452-c989511a7e15@suse.com>
 <192fbcf22a6c6e16498cc208eeb37fc6e08ce56a.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <192fbcf22a6c6e16498cc208eeb37fc6e08ce56a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ccb41f-3668-4566-524e-08db25248916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rC/Qeg2LE4pViO+iPnlI/XNyy/3VAb/nIzCbnChQKU2rsF4z8w9SfbwsKnW81RVWRJnSAxmjlXi5mvSCcfBY/XJP5h/RTNnu8qduzxmMqngC3oZmzadQyLtJNZG1W6YabEgKKkNFav2VBSx5Cs/Yt+WR1mrYNPD20A8BiDjI+NVlJd8ogfxj6+ACCBX+UYaDYEu+4IQRpjFfT+USb28vLOGM5ggUZS9CBmE56NUsgjSHqYXjJMza/nUEdhj+bhFY6ZKeyxu1R2LrVjTWxF7iGLQ6wGGfpTtUOsOImFAd748SEQJwHvbK9hVUYELqsvO9k+p35dw/nHcYKAI1biGgh6PRopONMse3hEzGuaEKjujNCU6hnpgIBCt17le7hpZ78KQuhgPmytvsQTRPtdjUbxgyDAmg7yiC2dj1UzTtyR9VNH6nURVqgjz4kDOiPvQ/etCPE54hkqRHTdssT0mH+ZrTsOfMiGWjp2nOOo6YV6jsnmcKigCnMo4vw5yLuw98t22fSnAE+GGJJru3KlWvViYjRT/V9ex8icEx/cdwV9aPiAl9UhAIReQo426uT2PAj1Ny+b3zdu8+8N0S+X4GVQaRTQgotONT/c5T1487mECvVK2oLIMzHS7leEfZvDF4KnbMwEyGxFD0KFfQd/RTDgZozZBAFwXelYdXkbkGWAZ05thoZAr0IjVlBble3HPSYbdKtj8NKjnUMD0A3ka3Sq8ZQ3I7HZ7OvjZKXBJE+gj3LWB9jQ0U05l9P0FmVv2+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(8936002)(5660300002)(41300700001)(6916009)(4326008)(31696002)(86362001)(36756003)(38100700002)(2906002)(2616005)(31686004)(53546011)(478600001)(186003)(6486002)(83380400001)(26005)(6506007)(6512007)(8676002)(66946007)(66556008)(66476007)(316002)(54906003)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtmNGpKTVNOSWxPZ21DMkxtS1dodWFEMFh5bldnaE1wYm15WnpCK040Z1Z1?=
 =?utf-8?B?ZWN0Wks0dW1iMWxkRWhSQTZEL0tJWDRwRVVwU0lqOHUwMHl5aVFpTjM0VllR?=
 =?utf-8?B?VTVPUjhTNFdCVWlPV0x6NEdVYUx5ZVkrVkE4SEpiQVJibW1aS3FzVE5QSjVa?=
 =?utf-8?B?cVl0aFkwaGFKVTBFQ3FGTFhBWXFKK1g2WGRkM2tHbXhwRFpFdUk3Ynk3R09R?=
 =?utf-8?B?ZmtCeWNVZVpuU3pJeTVoY0RLc2hqSjhDODJrZGlXODM1dEJZZHdTRVptem5v?=
 =?utf-8?B?L3M4aWdOYk1SVjdPMFBJTmIya0hobG51MklTWGpMSDV0WitzaW5nUFlZUUFE?=
 =?utf-8?B?T0tuU1QxQ1huQnZ6WTIrZ01icW56c2JNaE5zRmcyZnhiNnByNWpkUTdYRFR5?=
 =?utf-8?B?U1dQOGZraTA5clBiRVVLR3ZXZUNqamtGcyt6eUJLYmF4ckVPSmF0TW1yZDlB?=
 =?utf-8?B?Z1Z3OHdqVlZmakNoYjloYlRsQ0FKVVFzVlBRSlFYcmJaOVNNN3lpVkc4cHo3?=
 =?utf-8?B?ckpDcFdKd255clVhZVMxcU8ybW9WdVdqVEhHclM4MVZoMXV3aXNFZmFkYmhv?=
 =?utf-8?B?OEV0ZHU0QTR2VkVtOEs2aVZRVUFzczd1RWtvaTBIb3FSZkRoUkJXc3BOcThG?=
 =?utf-8?B?ZjhZOVRHNG1ZSkNwcXJrUGxsTTcwbzBxS3RrRWpwdjJ0WEJKbStqd0Yrb2Ro?=
 =?utf-8?B?UWZaOWVwRUE0YURkdVhYZWcrakdqYjdiNkdpTWxpaGFldG1ZWXMwRUpzREpQ?=
 =?utf-8?B?T1NiMThUY0hUdnFuSG0zMW5NVmVndFRKUSs3UFRoSVBVdWtNQnBEQmxEZXl1?=
 =?utf-8?B?RVN5NU42REhZdWx3ZHBERk16elVPVzJMZmxsSTVoNEJ0ZWxsV2lveWJWRnQv?=
 =?utf-8?B?YVdqdStPSXhackxHMkk5RVJzcXg1TmQvUjB3QThVbjlOV2lCS0pkWXg5bVlm?=
 =?utf-8?B?SDlFL2JOQnZONFJRWkQ5VTV0N2VoT0lQVklFUldERTl2SXhTRnBMR2tuY2J6?=
 =?utf-8?B?R0RqOGpiOGN6V0ZzZndNem0rSjV5cTdWZFpiSVRFUnNFUnZ3MGJNSy9HQnVN?=
 =?utf-8?B?cFJrOXRkcHRkUXMxYWl1cmZHL0pNdWtZaEIyaU9QdDUwOUppbGppNjNORnJT?=
 =?utf-8?B?NVhmcXNFKzVOTk5SVEp3NHA0VDI0WVNqeklMVkh5TVZiWUpPVmRydmlEUEJS?=
 =?utf-8?B?Tk8xUGhFYklJNTdZd3R3d3F4cmlxQ0djTXBaV0xoaW5tcHpSVUIyR0htb2U3?=
 =?utf-8?B?aHZSZWF2c0xhVktpVjhzbG0xcjdUdTdtRm9jcjBPWmllZ25XOCtTbXFTa1Vu?=
 =?utf-8?B?TEM3d2QwMm53Rmh0STFVV3dhOWZjZ2hsSStKWmRrZ1pRWGJQS0xubE1XTmRX?=
 =?utf-8?B?TzF2OEpJZ1FWRHpId0tlbVJBZGp0MUpQV2JWZ0p3QnZobUh1Y1I3VG5ZNHlT?=
 =?utf-8?B?TWRRajhvcmVkcTd4RG9CWVI3QjQ0MUluUDZiRSs4OHdQNURZRnRuWnE5R0My?=
 =?utf-8?B?ZSsyRWdmOVVqNUExejg2RWtINzc5NkcxQmRxM2RjY1pLNW9OY1BsV0xwN2dr?=
 =?utf-8?B?eGFGM1M0ZkpPSWE3dkZEcENaYWlmOS9wMVFQZ0FrZXk4NkFYODRzWFoyZHVa?=
 =?utf-8?B?QXg2U0FOMGcrcElxL0JJdFVZR2RNQjVrWjdLNlhHNjFNNlNtaUJyTFBTOFFn?=
 =?utf-8?B?bTBnd05HMHF3OTFLUmRYTGljbkVoc2tDcWNWcnNUclZqRFNDa3VlTE1wM2R3?=
 =?utf-8?B?MEFxRHRsdjdMYzk1VUxUbjIvZEhwMmZUOEVsQytlMjJ5UVgyM2taN3JnLzZw?=
 =?utf-8?B?azRKNjl6ZytrWE5FOVB3R3RSc29TakVsMkFLK0lVaW1BaUg2Z2RadUl5ZkQz?=
 =?utf-8?B?dXZZbjlXSUNOYU51UHZMK29MVjhTUzlmcEZNMk5pNXppNWcwUTdsR0NKQ0tk?=
 =?utf-8?B?Qk5HaEtyWU9VdDBEeE16ckt2bEFWZ2x6cHM2WCt1ZzRiajRPSjFiZEx0akNR?=
 =?utf-8?B?b3h5ajlOZ1lxU1Z5YlJWTkh0WXZaY2lSaUNEQVhPTVdVQitQei9aZFhpMW96?=
 =?utf-8?B?VkdCOXY2aFpJME10ajFrYlJQT2V0WVNDZEtiRnpMRVNuekZCTlFnVFZFRGVw?=
 =?utf-8?Q?z9DblkJYfS4s/FfK/wNb/HNdp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ccb41f-3668-4566-524e-08db25248916
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 07:11:45.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axwL8d6phj6gekVLQIBC7HNsNKmGHk9PpEsWwMWJOkSJ2p33GAQYOMyPvciBu9AmxgYBvStD3IGBHWXaO4lHcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9586

On 14.03.2023 20:12, Oleksii wrote:
> On Mon, 2023-03-13 at 17:26 +0100, Jan Beulich wrote:
>> On 09.03.2023 14:33, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/common/bug.c
>>> @@ -0,0 +1,107 @@
>>> +#include <xen/bug.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/kernel.h>
>>> +#include <xen/livepatch.h>
>>> +#include <xen/string.h>
>>> +#include <xen/types.h>
>>> +#include <xen/virtual_region.h>
>>> +
>>> +#include <asm/processor.h>
>>> +
>>> +/*
>>> + * Returns a negative value in case of an error otherwise
>>> + * BUGFRAME_{run_fn, warn, bug, assert}
>>> + */
>>> +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
>>> +{
>>> +    const struct bug_frame *bug = NULL;
>>> +    const struct virtual_region *region;
>>> +    const char *prefix = "", *filename, *predicate;
>>> +    unsigned long fixup;
>>> +    unsigned int id = BUGFRAME_NR, lineno;
>>
>> Unnecessary initializer; "id" is set ...
>>
>>> +    region = find_text_region(pc);
>>> +    if ( !region )
>>> +        return -EINVAL;
>>> +
>>> +    for ( id = 0; id < BUGFRAME_NR; id++ )
>>
>> ... unconditionally here.
>>
>>> --- /dev/null
>>> +++ b/xen/include/xen/bug.h
>>> @@ -0,0 +1,162 @@
>>> +#ifndef __XEN_BUG_H__
>>> +#define __XEN_BUG_H__
>>> +
>>> +#define BUGFRAME_run_fn 0
>>> +#define BUGFRAME_warn   1
>>> +#define BUGFRAME_bug    2
>>> +#define BUGFRAME_assert 3
>>> +
>>> +#define BUGFRAME_NR     4
>>> +
>>> +#define BUG_DISP_WIDTH    24
>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>> +
>>> +#include <asm/bug.h>
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +#ifndef BUG_DEBUGGER_TRAP_FATAL
>>> +#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
>>> +#endif
>>> +
>>> +#include <xen/lib.h>
>>> +
>>> +#ifndef BUG_FRAME_STRUCT
>>> +
>>> +struct bug_frame {
>>> +    signed int loc_disp:BUG_DISP_WIDTH;
>>> +    unsigned int line_hi:BUG_LINE_HI_WIDTH;
>>> +    signed int ptr_disp:BUG_DISP_WIDTH;
>>> +    unsigned int line_lo:BUG_LINE_LO_WIDTH;
>>> +    signed int msg_disp[];
>>> +};
>>> +
>>> +#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
>>> +
>>> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
>>> +
>>> +#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0))
>>> &                \
>>> +                       ((1 << BUG_LINE_HI_WIDTH) - 1))
>>> <<                    \
>>> +                      BUG_LINE_LO_WIDTH)
>>> +                                   \
>>> +                     (((b)->line_lo + ((b)->ptr_disp < 0))
>>> &                 \
>>> +                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
>>> +
>>> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
>>> +
>>> +#ifndef BUILD_BUG_ON_LINE_WIDTH
>>> +#define BUILD_BUG_ON_LINE_WIDTH(line) \
>>> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH +
>>> BUG_LINE_HI_WIDTH))
>>> +#endif
>>
>> I still don't see why you have #ifdef here. What I would expect is
>> (as
>> expressed before)
>>
>> #define BUILD_BUG_ON_LINE_WIDTH(line) \
>>     BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH))
>>
>> #else  /* BUG_FRAME_STRUCT */
>>
>> #ifndef BUILD_BUG_ON_LINE_WIDTH
>> #define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)
>> #endif
>>
>> (perhaps shortened to
>>
>> #elif !defined(BUILD_BUG_ON_LINE_WIDTH)
>> #define BUILD_BUG_ON_LINE_WIDTH(line) ((void)(line)
>>
>> )
>>
>>> +#endif /* BUG_FRAME_STRUCT */
>>
>> ... and then the separate conditional further down dropped. Have you
>> found anything speaking against this approach?
> Both options are fine from compilation point of view.
> 
> Lets change it to proposed by you option with '#elif !defined(...)...'
> 
> I'll prepare new patch series and sent it to the mailing list.
> 
> I would like to add the changes from the [PATCH] xen/cpufreq: Remove
> <asm/bug.h> by Jason Andryuk <jandryuk@gmail.com> but I don't know how
> correctly do that. I mean should I added one more Signed-off to the
> patch?

As said in my reply to Jason, I really view his patch as kind of an odd
way to comment on your patch. So no, I don't think you'd need another
S-o-b in this case.

Jan

