Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9679823E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 08:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597783.932137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUoW-000181-1m; Fri, 08 Sep 2023 06:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597783.932137; Fri, 08 Sep 2023 06:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeUoV-00015Z-VQ; Fri, 08 Sep 2023 06:17:55 +0000
Received: by outflank-mailman (input) for mailman id 597783;
 Fri, 08 Sep 2023 06:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeUoT-00015T-O2
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 06:17:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 710c0de9-4e0f-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 08:17:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8450.eurprd04.prod.outlook.com (2603:10a6:20b:346::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 06:17:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:17:50 +0000
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
X-Inumbo-ID: 710c0de9-4e0f-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+lL0dJDXPNOD1tjcPL0QtqOOstm4RodHXnVg8hlaMARoVLOCTQ0N3RNz+0Rvih5FfPZuCkYPOp4IX4sH5mvMwVCSIlunxmaWJ8RjtZcOvAFD9hr9QkUGzTEWD8ra4naXQpJwatqc2EEh7khchSFRb+itZftYfWkL4CK1fdqtZuj0qVSe6+3t3IlirzYCNSEck6Zo5Z+bvriZVMwFKJUG15hgN2+cRdqmxhqJJnk7YjVgOHENHUZ7JvEuJtJOE2ellb+HzA4XYPRsi3NX8anRNNTzU+wgfFMOzvlGxkjwEf6ijNuSrDo76/81knH/Xs8rOxx5br5vPZ/MHEkGzAGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1iV9rvlr/jPTJH0NXdUnoA3qf0pAnHfvDnppZSjljY=;
 b=k6Nzl3P9/8pU9hiWGYEBC/vFaK3AhH3fH+nZsbXgCe+aqIBNP70+84FwE30l2ec+eMYnYUaGT/oT1HM41gBh45/mQODU0ItsijLBbM5h1rxCM0Pz75ujSpNAOO50RARCMGndqUk+VYasL1SbF6A64Yu8B7IoL0RZrxE2HW59kxOl2DI6n+b6eGzINf/0u9pbG4E/kp9awkCk0gCtPst/MSftNLMRL9CjdM6FeggTeR/hsBYIBl/bd/sFJbbrBU7tSh7+mVJfykTUShRhwBaVg9O8WZfRC/NjiqCVtyfTeWo653VLtAgv9NSXRqMKy6Dj7Voh7G6VkQ1yuZasw3EawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1iV9rvlr/jPTJH0NXdUnoA3qf0pAnHfvDnppZSjljY=;
 b=LzQcsICzJKgKnpha68Te0VKbJ0FphB9u9IiSeeZaoxlIiZedLC4WxxQ9IKte2bhrohExgclJxCYFBYxN/cP0XfUZpFQzWB+h62zQestLJJ0n0PoVLnuXNsSoQru9aZTxl70c5Kgb89SQp5xkFOUr5DUdrC1v/cQi/VHMPTuJqP+4vPEUQaHMH/vZ8FPhWNiCkF14ufW00zv3QoCgNBVb92tvKl+9agz5fH8V6eKCjsxl58ME+3yuVS0u/1Hzln6SBEcluJRxd4beIWNxGsQg0zmXVMqWWOCc7wZJdnKArgqT23u0vWAdUuL9idw3VZT5d3YH4uGrd+k9UNGrOMLCAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <736fe655-f629-b97b-d8ab-b3552e6e62b5@suse.com>
Date: Fri, 8 Sep 2023 08:17:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/5] xen/ppc: Implement bitops.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1693591462.git.sanastasio@raptorengineering.com>
 <63e66eed26da8f957315cb1db05693b1799ee7ad.1693591462.git.sanastasio@raptorengineering.com>
 <003690cf-e34b-2e61-1166-86bcfd9da3b7@suse.com>
 <09e0f475-627c-1a8a-6175-b8d32f744053@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <09e0f475-627c-1a8a-6175-b8d32f744053@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ec4c3c-5182-47a1-6d98-08dbb0335414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2BJ17468VztzyyTzWARDKSHTIDUV7kUlBqBTg/oYxRmZKiHfxB375n1d0gB63Qw/BtX1+BAoyS7Y1mwFpr4+6dsvQgulLgdC9iaVzXfQto7VhWSpOQeZLPhJLXk37S5OeSwXXgr7H6TJva3akya25aIpiR9PrFc3h/RzHWa5S3cB5Byb9dJGz9voOKdrk89MDue1SPi0mhz2RKrFQwLwHKUtIzntf/z871d4GRngmmGYeuR5wuMJ8wUBdFuva0hVCCuCJGGiaX4fICjaTkbGG6u8GXlL6hqgq83l2cO5vk532PqdFPfg0eKFgBTLbUx/esFdmuiwMpWZHY+wTueB3puPZrwaTtGDo+fWMI52d30FhdkFZk113/TgaheuFVGTqlnNyGtuVVMgLr25g56SGPNl0gGXNQWTaowZXD7N/Nduo0Bhpqj90PXCv+41KqKmdXtab6Jy7f2qlr2HomIwsrkKhgqpMx4m2i7VVJAYf4PG2jdodx+wl5CFnW8Yl9hDwrne8rmEQS6YoPQLbKhCTMhjtPwTB1+zKKm+c9GjJEDDB/3cS37wwwTHLqQ4+yYNlF2PoAFP0CsGWWQocVbQ01smM23/+X1GEkKWa8QPcV6WKyT7Ux+v12irF3YD7g6+lFu7q7oNVVgeWGDEX7abRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(31686004)(53546011)(6486002)(6506007)(6512007)(36756003)(31696002)(86362001)(38100700002)(2616005)(26005)(2906002)(478600001)(8676002)(4326008)(8936002)(5660300002)(6916009)(66556008)(66946007)(66476007)(316002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFh4UnNNY0tpcHlRZ2JFcnVENkYvQzZjL0VVK1YyT2IyUFpWdlBBWTdvWWsz?=
 =?utf-8?B?RDNtZFN0emFFdS9HbjlnTTJGRDBpSENOdzV6a1hLbHR1ajFmengyK0QrQmZ1?=
 =?utf-8?B?L2RJTHhwWHlzbjQ1d0dGcCtzbkpSYzdVU0lUOEN2ZGZOSnBUbjd3OGdRcGVo?=
 =?utf-8?B?MytBbEMwZWhZMU44c1ppRWMrdnNRMXJVMmNUcHFBcitXaHdwWVJUaW5xb1Nk?=
 =?utf-8?B?Z2Q0L013T3QzMnU1VTA4UHFWU2FkWFpSQlRqdUZEekJ5R0FZanNtVlZlWGhH?=
 =?utf-8?B?K2NLL0F1UGE0NkxwTDVjQm8yT3pMVS8vQVpNMnF6d0ZzY2gzaDdiVzJuak9x?=
 =?utf-8?B?NjB3TkVLT2JCNXZZQkFhbWcyZG1RNzFtYmcvRUY5VmVRdnlhTzQyeExpalBy?=
 =?utf-8?B?T2NYenN6bE5hZ0VXUmduU3h0MEJ1czJiUFFRWWFVZEc2WEhqUHRpU2pDOFk0?=
 =?utf-8?B?dmFJdUdBSG1sNFdlWlQ0QzMxQlp1RW9qRWljQmxuaFk4L29mSTBNNXEwZVZa?=
 =?utf-8?B?dXF2Zk5IWmExSGhzSWY2SU9mVnRzRFBXNFlvcVJkVHd0YnJPTHpWQzVhWWJy?=
 =?utf-8?B?ZElrenI1aE00bk9sL1QxYVl1SFRPZVNya1BMdHg0VUFQdVhEQlZKN2loRTMr?=
 =?utf-8?B?eERrM2lEb0hsaUdEM3N4S2lvWnppUFVTdkhYRmJia2h6SkRqRERZRWl1dSt5?=
 =?utf-8?B?VlR4TnpaYUIzajYvQ0liQUg0VGxJRSsweXBLdzh5dFVLeFBtV20xRmpTRVNK?=
 =?utf-8?B?MUhwSXpDS29wTDJQek8rVVZJdDQ1aXhBSnhuY1QyMnl5ZERmbG1mZ0E0Z0Nr?=
 =?utf-8?B?c2UrNnlISlhmWUNtSDRoYSttY1ZzblFMK3R0UmMyWUIybW5tdkg5aWNzdFhO?=
 =?utf-8?B?bk9lQWRuL1IzYnpuOUJPLzJnelIxeEp4cmJaQlVzVkdxdExrRkdubkNUNDJ5?=
 =?utf-8?B?M0IxNUt1MWV2bVFGclh6cUNrdUJlWEdtd1gzb0pXTkVKcStkdTJWa0hRNjVQ?=
 =?utf-8?B?ZUdWL1V1MXBadGlvamFUY1lCelpWZXl6K2NJK29ocG54NHo3cFB0andtSnNa?=
 =?utf-8?B?ckJ2TWtONGxZOVFDNlpHY0o1UnJDbkVWZTJCemhnWXZDZStISWEzK2N3VXFl?=
 =?utf-8?B?Ty9PcnV2ODJBMFdZNnNHTDdpNlh0ZTNpaVdJWjlvUnFpYTdhejg3ZG5JRlZI?=
 =?utf-8?B?OWx5OU1SUFpsQzNaa3hUaGtRZTFjSTc4dUlWTGM2TXF5bFlGWUZQSE1sRTNp?=
 =?utf-8?B?NEtZT0RJWFlwVm1vSFo4NHBBSTFzV1NraXJ5QTNBTFAra0t1eENDUnM1UDF6?=
 =?utf-8?B?ZVg4QnZHdmdzcmxIYlNPQTQ2WktYUnlVQ2JDTEVXU29VMGhrbnB0VWlocmw0?=
 =?utf-8?B?N1RtRE9zcnJpY1V0U1plSXJreFhKN0N0cFloUHF5TjJOdG42ck1uRHprbS9V?=
 =?utf-8?B?T24vTFhENHFIYW1TQTRLUmlGOER2VFUrbzYxRmJsY25TMTc0bzVvZ1c4Y0tF?=
 =?utf-8?B?eWU5UXBIbytKdkRlanNDTGUvcXJ0UWp6cDUyZWt6cENOMmp5aU83cEpETmtn?=
 =?utf-8?B?eU9haWc5RHYwdFA5UE5SRUg0ckY3b0Z5LzBjbW1tdU5qaXlFVWhsNk9HK3Vi?=
 =?utf-8?B?aGlSWVNHVHdNYmhBQktrVHRWVWlpdE9ZaE0zTS9uQWxKTzZZVjhoQThiL0JQ?=
 =?utf-8?B?bDBrbEVTVWFoZlgvTjdvSHVlR0JJSkFiOE5XNjFxQWpuclR1VjhYZFNMTWx0?=
 =?utf-8?B?OGl2VkdrU1ZLN0tjYkhxbEgyR3FYUGIxTmJIOGhCTFV3aGpQSnJ5K2xpTlNn?=
 =?utf-8?B?aG1SbUtVeG5sMkpmT0VlTXU5ZWNBZEdkVXFMTWRMT3oyQkhuc1p6L0sxdFE0?=
 =?utf-8?B?alV0ZkF6OE91S09HVFJnSm1MSXMrbGpnZ3NJVE5iMCthWCt5WjJZT2R4cmlQ?=
 =?utf-8?B?RFJoQ0EvdzNJaGJSY0tDc2h3MVBiK1c1QTZUV1FzMExoa0JIbXNVeGtXbkZS?=
 =?utf-8?B?OHJaWXJiOTlCeGVSMWJ1Z1VvTVo4MytwMm83UDNXMVZwZmlCM0xJUUo1VWpX?=
 =?utf-8?B?ZjFkYWk1SWV2VEMrOWRCWmJ5QTIxSkg3UnU1akdGL08vOUYvYXZESDhiNjlr?=
 =?utf-8?Q?g1RUMQTz70HZLPt6qtLGGfpze?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec4c3c-5182-47a1-6d98-08dbb0335414
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:17:50.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ytrrstv8V8tlb0hFpcYReA1PEoAeO6TBZEwqSoKRrJJT3GsQ4tVNpBCXQHApQo6kXlARw9RQSCRa+gabAjN3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8450

On 08.09.2023 01:12, Shawn Anastasio wrote:
> On 9/5/23 10:19 AM, Jan Beulich wrote:
>> On 01.09.2023 20:25, Shawn Anastasio wrote:
>>> +#define DEFINE_TESTOP(fn, op, eh)                                              \
>>> +static inline unsigned long fn(unsigned long mask, volatile unsigned int *_p)  \
>>> +{                                                                              \
>>> +    unsigned long old, t;                                                      \
>>> +    unsigned int *p = (unsigned int *)_p;                                      \
>>> +    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER                                    \
>>> +                   "1: lwarx %0,0,%3,%4\n"                                     \
>>> +                   #op "%I2 %1,%0,%2\n"                                        \
>>> +                   "stwcx. %1,0,%3\n"                                          \
>>> +                   "bne- 1b\n"                                                 \
>>> +                   PPC_ATOMIC_EXIT_BARRIER                                     \
>>> +                   : "=&r" (old), "=&r" (t)                                    \
>>> +                   : "rK" (mask), "r" (p), "n" (eh)                            \
>>> +                   : "cc", "memory" );                                         \
>>> +    return (old & mask);                                                       \
>>> +}
>>> +
>>> +DEFINE_TESTOP(test_and_set_bits, or, 0)
>>
>> Why can't test_and_clear_bits() not use this macro-ization? And if it
>> can't and hence there's only this single use, wouldn't it make sense
>> to avoid going through a macro here, too?
>>
> 
> I've just tried this, but unfortunately the "rK" constraint on the mask
> operand only works when instructions have both a reg/reg/reg as well as
> a reg/reg/imm16 form. This is the case for `or` but not `andc`. I guess
> it would be better to keep the two separate implementations rather than
> try to accomodate both cases in the macro somehow (e.g, by making the
> constraint's type a macro parameter as well).
> 
> I can also change the macro template into a standard function for just
> test_and_set_bits, given that it's the only user as you pointed out.
> 
> As for your previous observation about the superfluous `p` variable, it
> would seem the same applies to the macro here. Other than casting away
> the volatile qualifier on `p_` it doesn't seem to be doing much, so I'm
> inclined to remove it.

Right. Comments like this are generally intended to apply to the entire
patch or even entire series.

Jan

