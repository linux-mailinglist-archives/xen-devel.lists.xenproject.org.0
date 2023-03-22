Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C006C4794
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 11:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513297.794118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevge-0007XQ-SL; Wed, 22 Mar 2023 10:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513297.794118; Wed, 22 Mar 2023 10:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevge-0007VY-OV; Wed, 22 Mar 2023 10:27:20 +0000
Received: by outflank-mailman (input) for mailman id 513297;
 Wed, 22 Mar 2023 10:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pevgd-0007VS-S1
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:27:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e400aff-c89c-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 11:27:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9397.eurprd04.prod.outlook.com (2603:10a6:102:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 10:27:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 10:27:13 +0000
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
X-Inumbo-ID: 1e400aff-c89c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+Qj4U1Lo+iiFREuNtEr5MjIQ7QLWSFmooTmm6AXUFPpm3/7S/XM9/ibsPmV5eka15rOeKGq8GpqTZ69jQ6OrLW/ewZbSlyAMp41ts34TyKWOd3CvyApvIvYPH8DG6enpxgoFnx9b4SNT1TeX5P8Ra0hXYjoMBq7vGVbv1d3cBufuTgwljvkZBFP9DseU1vj31uXrPQ0iDde4K+hE58In+k+xwMuCz17wb0BfQiHSN1wcrVPDm8+FDGtk31yG0+FUsGzMEvr8riKuuV7lgvOaxxp02rKItqmjvhK0DFhDvH9QuTCw9rBmPmfpykoMvUlo7PGiRqYSU+6YaBGfaj/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtiQ8vpdfyx3vlDkymM5GOPTXUdgwKUiXshlAOXxcQc=;
 b=GHf0V28Ps1KSkoBvXlZj44HFKvX/BMGZx2bwBNpvaGGsihtlyvRdqLiLVL9XBKKqzqUQn0Zuujy4qNfGU8T96h33Nhl0Dm5QtZpWtpiTU9Az1ksUu5JODdgB+bnFN4a4qcj9W6NZnTd5/bJ8ksBOQ5vgP3dA6sDlvXoEGO58ykY0B2DoNRKG0m1C9rXJiiGPLKCbYPqBHRdb8K4OLeO2lv3hF/gBxE6o5/014DWOgi5lMPhpCmnmK0mgfqZ3MzT2N0dWhEwgdkIBNsmCvQl+XIY1kn6ZgZ87O9CtBdw0U/M8ZDKHOQhESsy510e9Ty4CMHU0yuPS9uvd5/NwzUHMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtiQ8vpdfyx3vlDkymM5GOPTXUdgwKUiXshlAOXxcQc=;
 b=UfEpxglrwThHkzfga9f8bJwwQknCLulR3k3G454MPPBzAhvzMVhfPfoSHXdgZzS8kGaEUO7cy5c9PewhCGl/DB3aTENbkVe6Cw+se2/Defh6ekw0SVRxXfwYfkSqb+I10WD4dvFj4hsQMIWFYeLQnTcJYF36DvzTTKV+O028y/priUpsdG2ruOrY9gkA2ug5xdywMxF/lv/efmYef7btz/rk93jBIf71BV3ZIJUS83wl88qLFiskcFKOpdxJ1b47Z0XHwq3l8SY78VkijAgOhakGgsHZnOYdEWO7veP5IKgZzi0NTL6HkP1mXAvqeRlJSjLHASJJ/XJbNtfGyBxMCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95c763c4-034a-d478-fff9-55df1adbdc43@suse.com>
Date: Wed, 22 Mar 2023 11:27:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/7] xen/riscv: introduce dummy <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <82aa35ce27ca11076bbafbb565e9c85e1ce7624d.1678976127.git.oleksii.kurochko@gmail.com>
 <b28bc3fc-c38d-502b-409b-092e7398dd3a@xen.org>
 <071f2e0971ea53d37b9b645ebce6d169fcc642ff.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <071f2e0971ea53d37b9b645ebce6d169fcc642ff.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce1d658-b847-4b73-9a86-08db2ac00039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZQIdP0aTiQUjIRKJrUvDCGehpvLwxk8H3VUsviTcsmhLMbJDd23bmX+BtL0VVtjGvv9dFtFeTbR6sq4TEln+Q46K21nel2P4bKUr7t3NckTQmRnBj3sN6dzuivuL+GDkxhmhke9ID4OlZQvRWZcr5bp2Eo0JuMP7zEP/17Ed5d3ZpEUHMrYc3/o/oscEzlwvzqfXnjGxWxcy03OONslZ1y9bBCJK0pbPLx05bSls05lkW993ziZ/bPGDAaKjhT02/TgXjvS0i7h2x6TFQ4iW4agoBAROSUjD3B+v4ec3QmClDiLF8YlTow+Vjo93QXBNezivIkLKNhU58as0lbhgqJLpzKE+pkXHsILCEwJNIjcLK03C77l0VnkEJuL2G/ZMh2n6sBbRdLNRZaUL/2XRIKSoj0h+mtwkb0sIRQIOYAbXbLh9F5cZL/KshJYodeNlvvZxs7VHXCO6KNAz3JLkbah3OHjPF2p9ql3g21wix3S6xYeO/v6xFq9jpWlLAmndGJlThuWzR43oH+s0Je0iRwhUydtNhrTfpcBxS2MjAvMFUCLHslbkuhppbbuDNgcVHZNmxknMYGaRPWD+V7Fmh6ZW1EX8oQHqbMIQaeZSvQs7YkAy8gXAqPSP2+hf4aYGlrfaQZa29ha6zDtdG0+fmGnAIwAzo+M752baOBu/yIWq2z1yrfACX+XEZNAY6A2SluGlVBVk3OwVZ5bYQuYR1BUP3oodpuP9VstjjgBiw+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(66946007)(38100700002)(41300700001)(6916009)(4326008)(66476007)(8676002)(66556008)(36756003)(2906002)(8936002)(6506007)(6512007)(53546011)(6486002)(26005)(31686004)(86362001)(186003)(2616005)(5660300002)(83380400001)(316002)(478600001)(31696002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkRwcHdhRFVmc3grQzFwS0NnaDNlSjE5NXI1bGl6RUdLNHZsanBJdWpOSnh1?=
 =?utf-8?B?Z3NhOWZZc1o3RWZxcTg3eEt3eHlWYUxrSExoL2FsKy91OUpDM3BJMTFiOTRP?=
 =?utf-8?B?ODBsajB5TFVDc254OUpsSFFtRU1xcnc4ejNEOFAxK01oZWdxZ04zb3RKNUdW?=
 =?utf-8?B?YjU4NkhoK3J2UzRlRW80VGN6ZVU4aXdUYkt2aGREWE1oS1VpdWVOUWZRbnJk?=
 =?utf-8?B?cFhaTE5XMU82ZHJGU2FPT1dQZHJwbzczSjgyUkliaThRWGJRbndrQ0tUR0Fs?=
 =?utf-8?B?NE9ON3k1eWNjc3U5ZU1vcmJWNVJteWpGQ3dwS1l2dEYyRlU4SUFXeWcxd2xE?=
 =?utf-8?B?SElZZWNHQlp2enpSSFNCMXc5TjdjcXRtZ0FZT0dpNmpRbHJrYzZtbk5WbS9p?=
 =?utf-8?B?bm94Qk5zUSs2V25iTk1aWkdmdGYwZk5XdE80cU5XTWVjclJCTGp5RWVPb1Qv?=
 =?utf-8?B?dk1FT3ZMNzFxY0tkQVdpN1Zia2FUdjN6K013bDhkQzc5UUlTZ0lXTW9zUTBY?=
 =?utf-8?B?N3VCTnF1YUwzYzZVdWpCbXljMHNRNXhXdTFHblhtNmJ6QzBnbzlvTzlNL0RI?=
 =?utf-8?B?YTZCOFBSbzhRQTI4RThBdUJDaWtGUE43RVE1V3A4WnVZUzIySzhEc0lJV1ky?=
 =?utf-8?B?ZFFzOEl3eXRPeFIvY3BmcHBqNkNZVWQyelQ2WFg0aHJZRjBTemtUenlCQ05k?=
 =?utf-8?B?cEQ3MTVHaGFwTWlCNDZuY3lMKzZuMFdoTU9JVkpNek5pSEZ0bUtQWjF2Y0ZI?=
 =?utf-8?B?WHZJNUJDSFFKTTZ4Z0VVc2UyTEpOclBIaUgxelRRYmt1dy8ydEpRc205RlB4?=
 =?utf-8?B?TjNGbk9JZ3VhS2pJQyt6MGZReDhZc1F3UTRTN2lwYm56UzFOV01tRmdvVUV1?=
 =?utf-8?B?aGxCcytoM1o3UU9rc0c0MkNUY1BmZHlhbGpLbDZrOXlnK05oNWI4SFBQRmQ4?=
 =?utf-8?B?OHhOVFBJc0MyaXowcmhKRlhGU2VoeFZFMFp1dzJZajBwcEN1R2NtUThKczkr?=
 =?utf-8?B?QTd6aGpvTmhnTnNKOHV0dE53MzQybGgzZG15NnIvcFJBeDJGSkNUdVFzNmxX?=
 =?utf-8?B?ZEk4blo2NFZ3ejd4SGczRlllVVhxZDVKcDBQdHhBdTlZVkhUSVN0MExLTEs3?=
 =?utf-8?B?SFE2aXIwdGQyQW03bDUrMTJSTlFkYUtxemhjRFgxZ0ZVUnhKU3VaOU40MzNj?=
 =?utf-8?B?L0VrdVFjZDZPT3pEV2dobGRIYzBiU2FvcGNqd1RySXZKR0VoWnB5Zkx1cG1x?=
 =?utf-8?B?UHo4dCtMRGtMRnZCRWJMQkR1SHp4TGpMRjZobmRQdEJieGdBOUJhaVJjTjNS?=
 =?utf-8?B?NDdxSGVuWmJMdldabVkxMWJXaUpWMk8zRXZCTS8reXJYTjhRdXRHQ3Q4VzFz?=
 =?utf-8?B?bVBMQURnbDRONGd5bFkvbGcyTVh0Y29FSFQxeDYwcFBqYXVmbzZFNjBLQllT?=
 =?utf-8?B?T2cwMEFmdCs1dkxmeVFaLzUzNjlMd1o5NXNSYnR3VmhPcEE0eHJoZThRaUxP?=
 =?utf-8?B?VHpWMUZ3UmlacHVUMVZuajhXNlE0enk4MFQyVzZkbVhmVkt1YXhqWGR6MXNI?=
 =?utf-8?B?TUVWOVh5MVo4SHNoWE5mNFVRcFo1MmxHdW9hWWsxK25nU21JeGxsdzMvN1ZU?=
 =?utf-8?B?a0gyZ0ZhMFQ4eDY3dTBBNGcyWUhYdXgram1JWStMdVZOQWpTQ3VoUkZCOE11?=
 =?utf-8?B?b1d1OFlXak00YzRqbE5sVGlLc1J0SjkxUlk3SVdDUE5IVVVYZFc5ZnZnZ0o2?=
 =?utf-8?B?Y1pvczZPZGN0dzF0WG1BTFJTUkhTdkhmM1l6RkhUV1E2M0xQZnJ5UGI3VVVX?=
 =?utf-8?B?empmaHRYQ3AzNExnOWhlSzVVbUc3Yy81c2pVQy9Fc0V3bFFuT2RocVZSODk2?=
 =?utf-8?B?aDdBV0xOUmxVaUZRdGZha2hBYWF0T2F0NG95MTJSRUFhTkl3Tk9hOXhsZnQ0?=
 =?utf-8?B?M0RnaTh0ekZHQlNJbWdLNWNIZjVZNVZvN29tMFRDd2tHOVBXQTBZaTBmT2x0?=
 =?utf-8?B?T0ZGUWcvVnl5TE1PL1ZpUDFEQldMdXlNM3FsMFIzeDQvdHc1TGxFcG5UUisv?=
 =?utf-8?B?S0gzMUpFR2EzMHBLODdDSjVjOGhJMjhFNm5ZZ0RsQ2hMN0MwcGt3K0w5YUNj?=
 =?utf-8?Q?juHns1BoLCb/BFbiPk6coQyi3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce1d658-b847-4b73-9a86-08db2ac00039
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 10:27:13.0169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pC3boo/qnfs0tNRfQThFEiEE9QOCj9jm5iQm747Jhc6+1JQtLvhty/WZT7P57HxMUoLgPOpG+M+fsZhao9NfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9397

On 22.03.2023 11:09, Oleksii wrote:
> On Tue, 2023-03-21 at 17:21 +0000, Julien Grall wrote:
>> On 16/03/2023 14:39, Oleksii Kurochko wrote:
>>> <xen/lib.h> will be used in the patch "xen/riscv: introduce
>>> decode_cause() stuff" and requires <asm/bug.h>
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V5:
>>>   * the patch was introduced in the current patch series (V5)
>>> ---
>>>   xen/arch/riscv/include/asm/bug.h | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>   create mode 100644 xen/arch/riscv/include/asm/bug.h
>>>
>>> diff --git a/xen/arch/riscv/include/asm/bug.h
>>> b/xen/arch/riscv/include/asm/bug.h
>>> new file mode 100644
>>> index 0000000000..e8b1e40823
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/bug.h
>>> @@ -0,0 +1,10 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2012 Regents of the University of California
>>> + * Copyright (C) 2021-2023 Vates
>>
>> I am a bit puzzled with those copyright given the header is empty.
>>
>> But is there any reason this can't be folded in #6 or part of #6
>> moved 
>> forward?
> Initially it was folded in #6 but in this case a build will be failed
> after introduction of #5 as <asm/bug.h> is needed for <xen/lib.h>

But what about the other option Julien mentioned, moving ahead the
later "filling" of asm/bug.h, so it wouldn't be introduced empty and
then (almost immediately) touched again to actually populate it?

Jan

