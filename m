Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379979A73D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599250.934573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeEe-0006si-Kr; Mon, 11 Sep 2023 10:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599250.934573; Mon, 11 Sep 2023 10:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeEe-0006qQ-Hr; Mon, 11 Sep 2023 10:33:40 +0000
Received: by outflank-mailman (input) for mailman id 599250;
 Mon, 11 Sep 2023 10:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfeEc-0006qK-TM
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:33:38 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa8bd28f-508e-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 12:33:37 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 10:33:34 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 10:33:34 +0000
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
X-Inumbo-ID: aa8bd28f-508e-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNted1NekJJC5U1n5BrTqaM+xNJxU0c9Ae2gp1u4Dyw0TMnNDB8/VhgSB76YeC3Geo87uGJ6HlR+NdUnrj5QOBFVdX2WwoQrTNehNH1JRWX+saFAEI7r1O04sHSSEKUFsCudXXwKXt8un/PkOQSsec4fJ+8jEGZOgqWoNAoS7nyKdmweWsPzTJbxPSbqavqffNxpST7tqbTR9VtvW7ZEyFprmMqcpHvGUIKqwmOeM79kHj+XKAHkrruyVsENlDcUGv+jX73kGm6m7bVn6+w11gDAX0BM8T6ID2hDjU9N8Wmju5ZoU0rb7CGanHuhMXLZ1d6+zOkroaN+jaGDeIGAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1jBjkYGcUXmUOzSRiTBVmfG5X95K5u4lP9o8z8noAQ=;
 b=hXhCxoaDhzm/SSqpb0jSsfULnOWWg2XK22ZYnz03pbPUhEGaFlolMEKtq3kBV/7PVGsgna/NoxxqwgRIqtm3vCNb0xLea+8/DvDlfunedz9HnFJfLx+1IKdDoUkyC2gCJcIO+U3/1Q6DmMpuKRoRfDX6gkUPC6ijPtm7mclPKVvYdZdWotBC4uNpx1lCvssK7NrU327jF1gcM1Ccb2YYeQtw9DwyY/VN6x0EleT6RiWG7Zh9KpRgq7JkBrpF97/MJXGOpdA+Sf46al6FFVsk4DHS1fQgu20b61x9EhCbe28AKfWc2nBXl3HHOT9Q51lIbgwEg7I8zxDWGBbRg30LTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1jBjkYGcUXmUOzSRiTBVmfG5X95K5u4lP9o8z8noAQ=;
 b=gD/P5pCS+C1XdltgVangLKxyrOsVk3/SJypWntJHUlFNgVREyVlB6wQdIqw/f7Yl5CfEvMF2pJuIKjC4oi/7Fiv+E4RkDiPWHdSMaNU13g8Qu2bRMVWLHV1fxvpH+z6qLes8bdd2QH1g4EO9L/U9y6Fm6FhpgcZjjDHeKxFkZ7gT35XUwIO4uLBP3P/z/v+gY0BIGT2+h/3cD/lwSthOTeUNdxaiaQHLBn3oqJ7yOV2nyjhTpK+KMpJtxYsTK+AoyEFd5TDvBSKJiVHGRpPRu0yMnlDw6EFq04z34csvKjKevLv95RRvE7gZMze6cBKEShDLOQTQPF3bWWzwiGQXbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64ef7f9a-8810-bdcc-a4c8-2336de79ad01@suse.com>
Date: Mon, 11 Sep 2023 12:33:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 1/2] coverage: simplify the logic of choosing the
 number of gcov counters depending on the gcc version
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Javi Merino <javi.merino@cloud.com>
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f40f16bad7553f63d81574eac39e1fddaeec0be4.1694189143.git.javi.merino@cloud.com>
 <93c7ff14-2aa8-09a6-f04d-9dbb3969f470@suse.com>
 <4073db4a-0ccd-7047-4d34-25ad18100f12@citrix.com>
 <37f70cdf-a25f-5315-c005-0811ca801e3a@suse.com>
 <27b478c4-16a0-2e1e-b580-ebfcbd29d1c0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <27b478c4-16a0-2e1e-b580-ebfcbd29d1c0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b3c5c9-2ed5-4652-04ac-08dbb2b28d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9XfFg+gdz7vzKs/d2RE8yu1N/rAuiuQk4RR79tC4cxdw6d0xjfkVRCmerzBuendG3WGb03etG2JWUp5TF5cfso7PQ5D+WwcglFXQ5NsseJxJh32wq2zxkyKNHa+egzZYFX2A53yg+pX5/6jdwaqw4W2A+8hPDRnL1BTT/glUgbcwdJbXyU/hU9UBa/IuIGdLvoQcbL6OAPrKze6/bJGcAWEtuWoqTjjAMenMeTYIbfHJg5vOKllyPN1EpAsPDzUJooiaYRKj1tGu7FrH0/kzMgrRqPXtvjGplYezswkElc9aIFCrKHCKW2b33Huxc/Qf8a81xY1joCIDbNBI4ayoAMyOASSERh2BjepOyfy0WVw9Av0AfdRLfa2cYzohEucyhnbDUJIN5p+wO8NbaO+RYjDOi5PYAoB8M6hFPAD6tr0lfGn/bnUCBVdlBduShtrDOJT5c/DxhOm3QginU4JXNBnbiQrqs48SLjLl7F+7OOEIMt0I1tvgbMUwafH8Z8W22ORVIVgRIAYefWLiCHxkWiJijp7J2FaYSg33fkEcWEC+3rAb+P7cX8tOFkF+vsLxGUCUkhIUpDiTDADt1db/2IQSm9k1FzS4lzLZypkgMdjo129tX4xVOnHM0SgBeuK4uwJPz1sSsZ+L86gg4uLMcA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(186009)(1800799009)(451199024)(53546011)(6486002)(6506007)(41300700001)(316002)(2906002)(36756003)(478600001)(86362001)(31696002)(66476007)(54906003)(66556008)(6916009)(38100700002)(66946007)(5660300002)(83380400001)(2616005)(8936002)(8676002)(4326008)(26005)(31686004)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmZNSWtEdEZOeWlYUHZRSUYyR3A4YXN4b2ptSnhsMDhhb1QyYTVZTGJSZVNP?=
 =?utf-8?B?L0hyZ2Fzb3FJRU1BU2QrNXp5U1MwWXhHcmxmQThNNXdzV0hNUFE2cXFvOWZl?=
 =?utf-8?B?UDZYU29IUjFUL3duN1VKSHNOeklRaWV5UFVFdlVlN3ZGNmxDbEM4bHlzVlBM?=
 =?utf-8?B?VmpKSWpKaEhKT2d0cndaN3R3Qy9mUnhxVGNDSFhlSHRHdVV3Ym5sQXFFRVcy?=
 =?utf-8?B?emFhYU9LbFp5dDI1UDJCMHVvWXRwKzBVa203VUtPTWpMWW14M0hDUURwZVVy?=
 =?utf-8?B?VEpkc3Q4S05CQzI2RU1OQXpwdCtQeTJkaHhBMHhXaVUzY0pRY2drWFlZQjJQ?=
 =?utf-8?B?WUg2dEt3UUMydHR5WG82UXI2aGlhRGlDUkZjRUhEMHA0TGNLUFFDd1pNM2Vo?=
 =?utf-8?B?bThFeThXZjNjdGpuNFVrNGxpekoxVmhMTG1wVkpydExCTGJveWo5NlRMc29p?=
 =?utf-8?B?THNPalY0OGg5Z1hsT2JMYmFUdVZrYjc3TW1IajVkNXdnd0lRTXFoN0N3ZTVV?=
 =?utf-8?B?TXdIM2kvL1lxcFdyN0thM0toc3hkbmp1SUdUMjBuZGRUS25mbzVGL1B1dzho?=
 =?utf-8?B?bzhqaVRod0htZ0VKL3M0ODh4MjBRRnhaTTlSQkVvZDVrRjljbk44aS9GL1hZ?=
 =?utf-8?B?aUNxankxSmh6eWpaalVSeG5UcHYxbWFFSGlhbjNCdm83VFdMbWVyV1Axa25z?=
 =?utf-8?B?QXp6UUZ6VkxWditHazNTSnFZbm91UDZuUnRzVUhCTU1SbE5XdktJQTc3SzZx?=
 =?utf-8?B?NytvUkxyZGFOZGNENEhJaHdCSXBFc2FIdzh3RkFZRHY2Lzl1MS96N3FzdXB1?=
 =?utf-8?B?NU1yZktMQjFzOUp0cWlFU0RZaGVhNmtwTFU2WFZhTjFIZnZzWFpmRnpDc1N1?=
 =?utf-8?B?MjB5akpqVndUQU5vbyt6VnNmRUJlTytmdGg1aEtUWTBUVjk4Y2RrbTQ3SDRw?=
 =?utf-8?B?NXdsc2ZNNFRiMVhnY3FkTEkrZlFZQW45OGwwMmJJcTBacFl6VC9lTU4yMGtt?=
 =?utf-8?B?bnVod2JrQ1pwdWRsYVJobUIxcDlPV2dBWENxYjRqT09wYWNxVWRMdUpZQnpH?=
 =?utf-8?B?WnowK0RZNXo2N05FQVRoNlFjK1hDN1BMaUxzNzFUYmVRa0c0Y2JJRDFxazRl?=
 =?utf-8?B?VS94SXJlR2g2RXFvVW5MT0FYa1djWURVSzVyTXpCZG5ZWTE3dytGVVZhMGtp?=
 =?utf-8?B?Q0U5aWsvVUpSWkozMW5sMTJZYUYwcGhTa1BJZlJaa25RUEh0Um1RWUpJc1Zh?=
 =?utf-8?B?M1M3WUlWaEdJSEd2dTJCdVFxTGU3Ny9HRzJzSVdLV2RhamZ0RldmOGhLSGxk?=
 =?utf-8?B?cnlFRVNXMWQ2SDZYSG1LU0lnSkdwbG9kSVNEbXRVRW5BK3RqazZRY29CNEhH?=
 =?utf-8?B?aFlOR095bmFEeC9nNlpPRnNVTDgyZnhSd1hNRW9td3AwTTFHOVRINHBLMTMr?=
 =?utf-8?B?YjNRc1RBSi9Eb1g4UDJ3bzdQY2pmR2QvR3EzQ2ZGemZoNk9Ca2JJRWRoU0h4?=
 =?utf-8?B?dzRWVU0ydmNDMm5hR0ZNcmNxMHpkQ3VJbHVoby9QVno4aU1uR1gxZTVvRzNX?=
 =?utf-8?B?bm1FUmtrdlVNQnRHdTlaYUE5bmhodU5yQTRJNFo3Z21RalZGKzN0bWFpc3No?=
 =?utf-8?B?MFFGNWV6M1BndDhjL2ZNVEZkOENrM2pIZXVjS1orSENqK2ViMFp2eWhvL0wy?=
 =?utf-8?B?eW5Zam4rR2g4QUdZNzh2Wk5HUURPZ0J4ZE9mL2RZcUc2eTFiTXBESDVlNnBP?=
 =?utf-8?B?UjlNQ0FmYkloZm5VbGVCZVArRUlIdm9wbk5HUDlraXUyejd3Skg1bkNBREp5?=
 =?utf-8?B?RXNyUnNwZEZ2MXJPSzk1YjlOU0FNVVZSQWQvVmUxUkROM1FzYmlRa3RERFNS?=
 =?utf-8?B?R1greHpnekY1TTEzdHZUdXdqaWdJRkJ5MHFsZExCa25nVEZwcWs1RU1rTnVm?=
 =?utf-8?B?ZE5EOE1Cb1c4cnROVlRFMVBwNGhnblQ2b1kxQzUzQnVYdjZ3Y1hRMjhsc2Z1?=
 =?utf-8?B?S1dvVjRqcU41cUs1d2tRdWVXSGZZUXZHczFDamdEbEtvMXZtbUhsUE1OQnZw?=
 =?utf-8?B?SGp5bFNRTXhnUCt4VysrMUtqcGNwc0VjS2tNbkdGWGJqUXhIQ0JTQnpLVEtR?=
 =?utf-8?Q?O3cH97vTUgeIAYYqDph6mjM5L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b3c5c9-2ed5-4652-04ac-08dbb2b28d30
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:33:34.7008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZV/lPrLgfn8Smk4XSjy8QbPwgG7EKX6ySBnwVXwaPFNpAN6vtA4ZYKHPnJIwGjMxnd5eNWrVLoaGX3FGznsEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

On 11.09.2023 11:59, Andrew Cooper wrote:
> On 11/09/2023 10:53 am, Jan Beulich wrote:
>> On 11.09.2023 11:48, Andrew Cooper wrote:
>>> On 11/09/2023 8:54 am, Jan Beulich wrote:
>>>> On 08.09.2023 18:20, Javi Merino wrote:
>>>>> The current structure of choosing the correct file based on the
>>>>> compiler version makes us make 33 line files just to define a
>>>>> constant.  The changes after gcc 4.7 are minimal, just the number of
>>>>> counters.
>>>>>
>>>>> Fold the changes in gcc_4_9.c, gcc_5.c and gcc_7.c into gcc_4_7.c to
>>>>> remove a lot of the boilerplate and keep the logic of choosing the
>>>>> GCOV_COUNTER in gcc_4_7.c.
>>>>>
>>>>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
>>>>> ---
>>>>>  xen/common/coverage/Makefile  |  6 +-----
>>>>>  xen/common/coverage/gcc_4_7.c | 17 +++++++++--------
>>>>>  xen/common/coverage/gcc_4_9.c | 33 ---------------------------------
>>>>>  xen/common/coverage/gcc_5.c   | 33 ---------------------------------
>>>>>  xen/common/coverage/gcc_7.c   | 30 ------------------------------
>>>>>  5 files changed, 10 insertions(+), 109 deletions(-)
>>>>>  delete mode 100644 xen/common/coverage/gcc_4_9.c
>>>>>  delete mode 100644 xen/common/coverage/gcc_5.c
>>>>>  delete mode 100644 xen/common/coverage/gcc_7.c
>>>>>
>>>>> diff --git a/xen/common/coverage/Makefile b/xen/common/coverage/Makefile
>>>>> index 63f98c71d6..d729afc9c7 100644
>>>>> --- a/xen/common/coverage/Makefile
>>>>> +++ b/xen/common/coverage/Makefile
>>>>> @@ -1,11 +1,7 @@
>>>>>  obj-y += coverage.o
>>>>>  ifneq ($(CONFIG_CC_IS_CLANG),y)
>>>>>  obj-y += gcov_base.o gcov.o
>>>>> -obj-y += $(call cc-ifversion,-lt,0407, \
>>>>> -		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
>>>>> -		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>>>>> -		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
>>>>> -		gcc_5.o, gcc_7.o))))
>>>>> +obj-y += $(call cc-ifversion,-lt,0407, gcc_3_4.o, gcc_4_7.o)
>>>>>  else
>>>>>  obj-y += llvm.o
>>>>>  endif
>>>>> diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
>>>>> index 25b4a8bcdc..ddbc9f4bb0 100644
>>>>> --- a/xen/common/coverage/gcc_4_7.c
>>>>> +++ b/xen/common/coverage/gcc_4_7.c
>>>>> @@ -18,15 +18,16 @@
>>>>>  
>>>>>  #include "gcov.h"
>>>>>  
>>>>> -/*
>>>>> - * GCOV_COUNTERS will be defined if this file is included by other
>>>>> - * source files.
>>>>> - */
>>>>> -#ifndef GCOV_COUNTERS
>>>>> -# if !(GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>>>>> -#  error "Wrong version of GCC used to compile gcov"
>>>>> -# endif
>>>>> +#if (GCC_VERSION >= 40700 && GCC_VERSION < 40900)
>>>>>  #define GCOV_COUNTERS 8
>>>>> +#elif (GCC_VERSION >= 40900 && GCC_VERSION < 50000)
>>>>> +#define GCOV_COUNTERS 9
>>>>> +#elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
>>>>> +#define GCOV_COUNTERS 10
>>>>> +#elif GCC_VERSION >= 70000
>>>>> +#define GCOV_COUNTERS 9
>>>>> +#else
>>>>> +#error "Wrong version of GCC used to compile gcov"
>>>>>  #endif
>>>> How about inverse order:
>>>>
>>>> #if GCC_VERSION >= 70000
>>>> #define GCOV_COUNTERS 9
>>>> #elif GCC_VERSION >= 50000
>>>> #define GCOV_COUNTERS 10
>>>> #elif GCC_VERSION >= 40900
>>>> #define GCOV_COUNTERS 9
>>>> #elif GCC_VERSION >= 40700
>>>> #define GCOV_COUNTERS 8
>>>> #else
>>>> #error "Wrong version of GCC used to compile gcov"
>>>> #endif
>>> Forward order is the one that results in a smaller diff when inserting
>>> new entries.
>> Hmm, even in forward order one prior #elif will need touching
> 
>  #if GCC_VERSION < 40700
>  #define GCOV_COUNTERS 8
>  #elif GCC_VERSION < 40900
>  #define GCOV_COUNTERS 9
>  #elif GCC_VERSION < 50000
>  #define GCOV_COUNTERS 10
>  #elif GCC_VERSION < 70000
>  #define GCOV_COUNTERS 9
> +#elif GCC_VERSION < FOO
> +#define GCOV_COUNTERS BAR
>  #else
>  #error "Wrong version of GCC used to compile gcov"
>  #endif

But that doesn't achieve the same as the other construct: No #error for
gcc earlier than 4.7, and your (presumed; i.e. taking just patch context
without the two added lines) construct would fail to build for gcc 7. We
want an open upper bound but a determined lower one.

Jan

