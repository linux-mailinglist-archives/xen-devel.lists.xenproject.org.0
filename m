Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB02B7565A9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564592.882115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOlX-0007EH-QG; Mon, 17 Jul 2023 13:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564592.882115; Mon, 17 Jul 2023 13:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOlX-0007C7-Nb; Mon, 17 Jul 2023 13:59:55 +0000
Received: by outflank-mailman (input) for mailman id 564592;
 Mon, 17 Jul 2023 13:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLOlX-0007C1-6Q
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:59:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 338f20a4-24aa-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 15:59:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 13:59:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 13:59:50 +0000
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
X-Inumbo-ID: 338f20a4-24aa-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPC7EmbbzjpNI6mbQZAOAFHtEKHL3sUU1+f+vC9/A9tg+76QFkud//xl0EwSBwMOdWYNuRuW3ZJDETxaRnmsUMvRVtRktP5sn9ik6FmCor3H8KcDSag87sEEriM2hwn65Gbi9voHSHyoB86NCWVqWJ137A98jKVn5VoHRl313+RD27Gnhx7cMp4M/mbvbF8PpPuG6ac3SsQ8B+osfi/MHsoafSxywwxKUNzh9zuPINm47VphOVcB0YRGaR9UX55rv47PbkCD8GsCaRvuXiDE9NCu/I7cImww5mzV2dsnpMAlbSS3Fp2zScRHO9l7n3ChzcNCC37A6XF96SG/uc95tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDOT4txEf9S3aTzHJgVmN46yiEOzZHCUO5YUeLGivGw=;
 b=Z2ohyKBxByu8eu2c1QPuL470ljRH0ZpGDTeS3MULf62QedSROaGZVrjqEqqFhrRX6DHmk8B6AexlzuHL9ZwsMs0wuXiw7+taS5FLJCJoJJcz7vmoZshN7atPN0wtRZpiSEm5i7SO36ElugE9arVzlfgcHCC/qsbcmhnGcWZWPvsYOab0NC70l/BDImKbT1bhHmnWbyh/p1q7KXa+KpidX9fYq/2MgQ70mzHokEf42BrPx8/nJlMk92M3VD7MuKO6h61naLE9HByox78i2StrmgGDNRt1gIA6mRHtU8sGzMzZwIjeytbp+kqMGUIC6J6Kq6ZPDbdsb7Ag4yTwQGzW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDOT4txEf9S3aTzHJgVmN46yiEOzZHCUO5YUeLGivGw=;
 b=B9olksETMgSb+XWMDkqWSH6Spvu1afbTRayj9x/s124+576H/+wC1D9gfrbIl/9Nq1HzUeOI9Q24l3Irl7g9fSzKDcWE1xZdPJpJbxeg/metMd5B7TXPQwNL4eCAHo3wpTSD7vwzUfHP7S4pDMku6ZBw9oxC39MawXPKaam9/ZNEMpp8b/Na9V27SRTVocijXlZ/tmJiGwJ4LzeHtDdFyrzmVDzsxDRrS1K8Ggy7m+IH0TYkV18uWtJdMCWOIPRpfg9bVXxPNvwC8EitDhSRNhViMvMsKsiSimcxkkFSRHjYVceJAg2VbixKgMO/GT8sy5p1g2fV6PhtA/yuoU0RlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f24d12ec-3edc-5aea-f399-05ed52ec1cbc@suse.com>
Date: Mon, 17 Jul 2023 15:59:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a32ac89-eaef-4b5b-b159-08db86ce1659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/sgyiPA/6bQb9gzMgLGVsWR/hUKarbQDv+kGjpP6DcxQH9hS2QsZ0QVIHYn2NCksMvxvmlCNLewUZlnLl3TmEQ2Jc1m/Qw4r/nGAj3OPzpte/q2vr2e5dZhydA0eG6OMy5vJnmiVk7TALURlCsUJsBfJYe5PsTykAU3SNM8ctzPRnWgehQs/EU1u41etI0+mPOSJzgSm4tx+gdhusSvyeJPtifJTTldtLkvzCR7DWf6IqxEOP8WTPvsZu8mpIl8aAZYDAuxw4Za4zNu8C4Yq15zV5KN3I/itZIX07u3bLbd3znoDjGALK+NyrJIKWXAYEZHUGBY++sBqLGBJBMuvaRvrgOMlIdyKkATHh/m4l68X/dhKBfvgqK1DXYAx3fFS5H6OvRIKTnrM0WT9MVikmDZHxslKHlx7541JGEKx/thVJe2x68UVfsdNdJkVwBriTyp7QNju08HWswlJEuTVu6FH0rUAyD2Lp145tdSbGmwgoYDo6+ZbcHZ3smbyv5mI+HtcWqzIucw5LUsUu96ZHBa8AowCsk7BbQvQf/1GN4SMxOegr/tdnWLv+DdIBLY1Mdl6wdbNWWsTyr6jAwNxEqOVLdtH+a0BVvJpqkK5Xe7CK80oSPbbZJ7Oa7GQqiqrsQxMwZC8Z/VSm+TI3tPmEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(6486002)(6506007)(53546011)(26005)(6512007)(36756003)(2616005)(83380400001)(31696002)(86362001)(38100700002)(186003)(8676002)(8936002)(2906002)(41300700001)(478600001)(7416002)(4326008)(316002)(5660300002)(66946007)(66476007)(66556008)(54906003)(110136005)(31686004)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTZFUlRqYktzdGQzbHRoQjMwdVFUS2xqanY2Q2x5Nk9tQmtMc3NuV3NieVFu?=
 =?utf-8?B?aXJ5MnZGVTVNbVNqcTZwNXZBd25WZUFtZmN6VnV0ZzArQzdkSVZzTUFXK1ZY?=
 =?utf-8?B?Z0F0TzJTZEFRQVRRWHFYaGg3Vi9jYVFadHUwUHdVcHFqUjZIV2hnL1J0SjZM?=
 =?utf-8?B?UFRKUldXN2RPS0JvT1JLeUMrTElyaEttTm1ZakFERCtJK0ZNM0o5U01hbXRV?=
 =?utf-8?B?Mzh3SVlEdU9rWG1SdGM1UHhZdkxhOGRtWTJPYlRZanZ1Nk8vbXgzejBvMjla?=
 =?utf-8?B?cGtZVHNtUTBudk1JQ1o2cDNOVUdUcTEvVjhscHV2RkF2N3plOFNOclN1bDF5?=
 =?utf-8?B?UFFUTUFZdUpiYVNpTEZtM0NYeXlqMURQT0h3MG55TDZSc1U0SHFibVNQMkNN?=
 =?utf-8?B?UC9GTFRocUg1bVI5YWU4WTRUYzlVUFBIZnZ3b3hHUG9kZDVOY1dlUHpzWjB1?=
 =?utf-8?B?d3NNUkRwTWhlcDE0eVczcUhvdDBRVFpOUTlJZ2hiQ0JPalRyVkZhWXBlNy9x?=
 =?utf-8?B?Mk1TdVQ5YjdiNE4wc3VCUktqdTJzYkFpV2hkY0xSS0pIOHNLcjRETWJINWN6?=
 =?utf-8?B?VDhGN1Y1MlN3MFBWTVhHbXNKMU1UYVZ4VjdmNTlqOFl3aWdiNFlqNEVTL2Zy?=
 =?utf-8?B?enVjMVJNNC9BNE8xc3IwdUV6Mi81SHZMZU9xYmxoTGkyN3NKci9YZUtVdE5w?=
 =?utf-8?B?K2tqVUhiZTM1UEc3YldUSkpqaHhoOHdxOW9tTWhYQll0cUYrWENZMWZtcTNm?=
 =?utf-8?B?Y2M2ZG9yalhBYTkyVnNZL3BJdDZDdjY3ZXJDY1V2bGdLVE5sQ1VZcnpxcFh3?=
 =?utf-8?B?dE5nTzR6UDFkTzVDVGQraXE5WktKcldFcm4zbFhmQXROckF1R3ZxWUpjZkk5?=
 =?utf-8?B?NHg0L1NHNHg1RDhiVE0yRUlpYnMvVXlodEJ1WFNBbFRaZ3kwN3ZjU3ZGRzkr?=
 =?utf-8?B?S2FwREFteTJXd3N5UnhGTVlBd3F1S1AzZXNxaCtDM3JlLzFGMy8rVmR1akFX?=
 =?utf-8?B?bnhZN3JocVpRZW55aktzQ2ZJMnVNLzJjRnI2NTNzL3ptVE1FWTRFSW03TXNq?=
 =?utf-8?B?QWVxdkdXV3A4eCtrcWRZTnh0Ukk2WHFoNW8yUDZTb2dOdGZ4ZWN4VWVxcDJp?=
 =?utf-8?B?eFF5cXlSOStVZVV4NnhZZm1CYWJ4SmV0NFpjS2NrS2ZxYXEvckpaQ0tsbCtw?=
 =?utf-8?B?TkYySmlWQmFIRlNMT1k2YVJsQmcrVVlZVUFxa20xcVVVb3gwVmFtS25lcGZZ?=
 =?utf-8?B?RFI4ZzJ6UExkMVdvM2QzaGFnNTFTS2NVSExlczBoOVpkM1h3WXp3YVc0WTZX?=
 =?utf-8?B?Sm9FVUF1YU1Ga0tlMEJDai96aGZrVnZoZ0h0OE9tRkpZRUVpWmhyTzNiR0pC?=
 =?utf-8?B?SmtOekRYQUNuT2Jhb25GZHJ0WUY0NVhVUWhrNEZsb3QyTVJvSWdhazJ1MjF5?=
 =?utf-8?B?aFByWERCbTlMNy9tOXVCRjgvTTF2RHgySWZlOGN1cGZYRUZ1VmxseFcrL01F?=
 =?utf-8?B?UGRyVlNMdk15WXVTVHZyWmFCT3d4STdpMlo0WXBmZ3hEQmRROWxFenQra0NK?=
 =?utf-8?B?eDBCazdkSmsvcTdsU0pEOEJTQ3M1dlorR0xqclY4YmdlR2poa3Bjc0NYa083?=
 =?utf-8?B?a0JVL2xPWktwQkpVdzNpRnlzazF0ZEp5ekJ2TnFOaStnOWpJK2dDQm5UVDl3?=
 =?utf-8?B?L1paSGFwQnA2K3hVMXovSUFWNHROR214TFh4WVh2aitZaUs5MnZ0VVhZb0JZ?=
 =?utf-8?B?RXJvRWhZcXFxNmJudjJYMXd0Vk1EaDVKZXVlY29lNmwxVEpKc28vTTVjOGFt?=
 =?utf-8?B?cVAxSEZYaXk5anl4Vk9hOFdsa1FDR1QyMDNLVlFocEFPTVM4VkNlbllGVGR5?=
 =?utf-8?B?NVhoQWJoQXZUL280eExmVGtQWTQxNDAvNnlaM0R4YnBlZ05hSklmUHdyd0JK?=
 =?utf-8?B?amRKTjRuMVlOYjlYSDBDbFRpcVFKckkvd3VnQUNmbDFGeGpMSzFOakxmbitj?=
 =?utf-8?B?bkhhVFlBRDRzLzU4WGtTT1lVaEt2WWVEU2FWVTBlckJNQ3ZxZDI2TnpESS9L?=
 =?utf-8?B?RnFhOFJpMGtvWndIUlh4QjJHWTV0R1g2Z0p1YSsxd1poL29mQUNHZmJqQ0lF?=
 =?utf-8?Q?IA/+wmFZYZ7PfnijNfK1sjGU0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a32ac89-eaef-4b5b-b159-08db86ce1659
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 13:59:50.0680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ts5zJ4txgIo6ArWDlRxmwvY4Y5nqUp78471v9lh03tADWgJ5BknfFu3ssfwl1EOpDPPhjUdwIElXjLEOcJOcKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825

On 14.07.2023 16:20, Luca Fancellu wrote:
> 
> 
>> On 14 Jul 2023, at 12:49, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>
>> The macro 'testop' expands to a function that declares the local
>> variable 'oldbit', which is written before being set, but is such a
>> way that is not amenable to automatic checking.
>>
>> Therefore, a deviation comment, is introduced to document this situation.
>>
>> A similar reasoning applies to macro 'guest_testop'.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> docs/misra/safe.json                     | 16 ++++++++++++++++
>> xen/arch/arm/arm64/lib/bitops.c          |  3 +++
>> xen/arch/arm/include/asm/guest_atomics.h |  3 +++
>> 3 files changed, 22 insertions(+)
>>
>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>> index 244001f5be..4cf7cbf57b 100644
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -20,6 +20,22 @@
>>         },
>>         {
>>             "id": "SAF-2-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.R9.1"
>> +            },
>> +            "name": "Rule 9.1: initializer not needed",
>> +            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
>> +        },
>> +        {
>> +            "id": "SAF-3-safe",
>> +            "analyser": {
>> +                "eclair": "MC3R1.R9.1"
>> +            },
>> +            "name": "Rule 9.1: initializer not needed",
>> +            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
>> +        },
> 
> Since the rule and the justification are the same, you can declare only once and use the same tag on top of the offending lines, so /* SAF-2-safe MC3R1.R9.1 */,

+1

I'm puzzled by the wording vs comment placement though: The comments
are inserted ahead of the macro invocations, so there are no "following
local variables". Plus does this imply the comment would suppress the
checking on _all_ of them, rather than just the one that was confirmed
to be safe? What if another new one was added, that actually introduces
a problem?

> also, I remember some maintainers not happy about the misra rule being put after the tag, now I don’t recall who

Me, at least. The annotations should be tool-agnostic imo, or else the
more tools we use, the longer these comments might get.

Jan

