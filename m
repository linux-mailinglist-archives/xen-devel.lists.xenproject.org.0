Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497473B0D0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 08:35:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554219.865289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCaNK-0004ys-4O; Fri, 23 Jun 2023 06:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554219.865289; Fri, 23 Jun 2023 06:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCaNK-0004wk-1C; Fri, 23 Jun 2023 06:34:30 +0000
Received: by outflank-mailman (input) for mailman id 554219;
 Fri, 23 Jun 2023 06:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCaNI-0004we-3Q
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 06:34:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe7851cb-118f-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 08:34:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9324.eurprd04.prod.outlook.com (2603:10a6:10:357::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 06:34:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 06:34:22 +0000
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
X-Inumbo-ID: fe7851cb-118f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSgO1QrWR/Jka0HAoXd8dVzwUppxfLpa47gt/RCH4t4tuagyefFIbKbgMdZm4FOdx9stsepwIbCk+wcA/gM7I4se7i0MPbA+mHhVwAMlqvRBBb+1BZigO/ZMiWrgXmI4vJ1UCoJyoSRRI3Hq5NIz2bTX9arjS6h9l9unpCYypJKXPjpEC8vw+J0XsZm+zBCfSdQdEmmCN98RdKCzSj3l15acjgvGjP398H4gYbJ9R+RoqMuvQbHHmNGdu2RsDL5IhQJKx0uluRqsn7ooSvR2TMvRFJmk6dYH/kUXKmDH0UvWSRuMYQS+4T6cbKf9tdw6nWHC67uwY2YRziPmWYNOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EdVSHky/o+iTh9FJ0jzTnOzH+1V/kyuI4qmjY0voV0=;
 b=QjWCD1LXvOH65/lgkMIA0naVDT9DfutbWXOk/StNH5+eY31pH6yxFaS2t1tTN+T2H8HsYHI8sux/Op5TBPHT1W8zen40lsygIIRRbA1ZOXZsIoO5TXnSfBVulN+BUuQ/sCrnCoTIXXV9Aqw8f9qCfbCx1wVclPw8SJIyo5itW5fKBlwJyd5nco1juY+PpkbYnOJhFs6kHZqZkr6Eg6vF2UOKGVp+SRyPOH7mlcODhzpOgRMQIVOqgce3IxDcik9TGRvuGGxjrus6l98CC4InuWtCvfI1cB0T9sPteD1UARa8tthDG1RZRjTxYPiUT/lU2MnrcKlEym23ZRaCGDcsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EdVSHky/o+iTh9FJ0jzTnOzH+1V/kyuI4qmjY0voV0=;
 b=3LamBdISQ+G+Sj9+qfDQgJCc3vdNtAKTpuv2lL0w2jeE97EgPX2qF8+wSIQmGwvjBsXVzTIJ/nsJvL0ZVfQr1O/Ph0lGE9rlNZ9SnRhc41+nmuY8Nn45cznIZ2n+V3LrizeumBPpn6pjZbI35GScwJfJu1ISXqTNzOSsWcp3U2PpAeeEwZFPxbenEabzCfC1A6OQackZji1K+XUso11ukD4EOqx2wAtQAq0jx5ryLfJtEjkrZ7HeE8K3fU16Gq+2sdXbHjftIgfeImHeLXSBFy4NDBn7nNfi+xygqRtiEGM+9C37K3wo6rDP3wxBCwcx8YxfwzLDlXLSBDyaum2YPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d963f7f9-5170-10b3-138b-489cced1b3db@suse.com>
Date: Fri, 23 Jun 2023 08:34:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
 <bfaba0e5-36e9-b201-30fd-b96add91cb1c@citrix.com>
 <5011cde3-b553-6a17-85aa-a30edf3102fd@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5011cde3-b553-6a17-85aa-a30edf3102fd@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 394ce80d-0c0f-4e73-a986-08db73b3e188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HiZoBimeVK/8pfHfALOihXmvyj1gPrF5mWXCaS4JC32oTtSwr5MI+tH89FkFVLQqZ/L+ibHeVjohIxU2I35l8ZV7MW7HvdwOwClKlf3IuGcSf1wL+whOzc0zYe/v1g/lxoPjMkAvHxmPOPPEQahzFw350uK/vNIqmLsw7BsoNw20jbKjswRZ+vYRWYCjp+Vx3xeLD4CpTiDMrad56uKYNBaQnuoCzqJEGvKAAZy5+7icqbiSZveolITLfdRz3aMIMSwWTUDQCcxw/ghpSjtwgX+hUGqiPU3SQjT7EUvEk4g+juRO3n9spIYgzzutlEFlrGsYBaRdbvRPIMWpD+ohh3PUGxczH4nb1jzFG5PU5VgZNiVStUhAdmKzpto97Q/XH68p8XdLtqJyV8ZEF0uUwrHWehkEn0alQaQNt87mrB5guSePCfuq5yvsYzY/dE9XX4MVRrCBBuVGNDs57RCvrtF3A9aTuiW+sN430RuAA3uwENyhcsH1kLOsoOa/1vt5omeOXBxmJm6QxhC0vIfHOwWjOpii1SoelSCEuuzSGzOe5SpD+PlcaQiYpE8wgocm+55gQrCK0kgvDCBMwMun1TSufaf4HkpMvXojPMxR/UdF0aDlqYKA969AUGVP4Og/ICHRY6pfWcKYI6i5+1I0BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(53546011)(966005)(26005)(6506007)(6512007)(186003)(2616005)(2906002)(8676002)(41300700001)(8936002)(5660300002)(6486002)(478600001)(4326008)(36756003)(66556008)(66946007)(66476007)(6916009)(316002)(86362001)(54906003)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGo4Q1BoSkp0enViM2xjY0RTbDZzd1VTSi9yMnhyK2N5VWszRU11NHc3VDNw?=
 =?utf-8?B?Z1lZS0h6ZG5nYisvbHk2MnI0aWdSU0JGUW1jamo3ZFBYelI0eE1WQzBFSmNO?=
 =?utf-8?B?WnVnY25rSXVrQU42OXJlc08yS3pSaHY1NUI2L0x4YWM4Z3NwbjJPU1ZlbG8y?=
 =?utf-8?B?Y2gzWEh5NFRYNGdMN05kbU4rdTlUMGttR1ZDOTVZcHNxMFZwY1dDL3lEOHpy?=
 =?utf-8?B?N2lSa3VXaFp4VEp0UElaRGtkWE96V3dhYzJTSjlRSFllU2xFVWJkQzFZbEhN?=
 =?utf-8?B?cGxOMExlMXJVaWJublI5enFUbGxLY3FBQ2hFa0QwUnIrRTJKWWlFMTRmOC8y?=
 =?utf-8?B?WXMzc0lWK056eFRIR2ljU1hIdTdoeGZoVUxEZG9EWFl4OVkzNUNtNzZUNW90?=
 =?utf-8?B?bmFZSFdWZHFmb3QwbHFxbWp6b3UxYjdNTnZSb1VLcTZGU0hYNmw0T1JOcFFj?=
 =?utf-8?B?dGVMT2l3YUMvQWxubS9KQzU0Q09JK2VHU0Z2d1BVa0RiMUNNZlkrYWFtZkJ4?=
 =?utf-8?B?M1BTczNsVXVMUllBZXA2K09KaUs4WTJ0cGpaTUpKT2lkSTZMVDdoZEthZTBs?=
 =?utf-8?B?NUY4alMxQzJHcTBnb1dZYVhMek5kUExsNXh3TXViR1FKTzNReE1EMVQwQnhl?=
 =?utf-8?B?OUNkdlNVTXljT3FPOTNweHBEV3Y2NTFEYTJmdUtkWVpuTkEwTHN4WStYd0Vn?=
 =?utf-8?B?dVZqOFBEdkhVdURVdHpodkNRcUpxMitRZExub2tQZVg1cWF5blFLYVB3SVps?=
 =?utf-8?B?SzVCMVNmYmtiYldPYzhxaU95a1FyVGVHcWdoZjJCY3R2b1RjVU9FZmEyMHE3?=
 =?utf-8?B?cHFtUjBnS0NFSUYwakFUK2pmWnBQQXZTM0swUWgvbW5SeFg1RkdKVUFBRnVN?=
 =?utf-8?B?c3BwSlYxWlU4NGFnVDZzYldSYmhXaUxzVTJDWEJmaWRUS1pUM3VZdy92WXJu?=
 =?utf-8?B?dlRScytQZHl5OUdBK3NQbXdIZkliN0o2aWpsNW9UL0Jtdzdhb0FuN0tZVEJM?=
 =?utf-8?B?UFJvY1h6QmkyRlcyM1R6WjBwWncxUDhDZGVnQWxqdStHQzdmMUt1anpaZVYx?=
 =?utf-8?B?NU9VK01CMTduQ3p4cUVReTBkdW5YRzVkUmsrbzhjUkcvU0JZTXlKZ1ZST2sz?=
 =?utf-8?B?OUFTY3p4UUQ2YkVPRWFGaVdOV1dVdDJTSHpaRXhSY2xWbGxHTTMvU1E5OVR6?=
 =?utf-8?B?TXU5NVFZVjRUL2s0cFl2QTNDNnB3V21LQlNrYVNtVzExc2JkTGkzYm9CZHVL?=
 =?utf-8?B?ZjVWYThBdHAzbEtJSkdqMzBZbFdkc2Y5Q01MWEtvNW1hUzhWdkhmNVYrd0JZ?=
 =?utf-8?B?N2RQeDlEZFd4QTV2SFhWakJRLzlyYlhkcXQ0eHZpLy9va2FML1N6VWFOOEh0?=
 =?utf-8?B?YjVJUmV3bjBHNS9DK1R5b3lWeFpRTW5tcW1XL2kxYmkxbHBlYVJ3L2hGT2Ry?=
 =?utf-8?B?Y1VKeGt6VnZ4T1dWaU5xWUgvaXZoSHkrclBLVWVmRHhwajZpZGF6R3QwaWhY?=
 =?utf-8?B?Q1NtZlBHYXhPdFFmTGk4ZDdmZ0dNS0NlSzRqKzlPVnAwY1JUZlJIZXRFb1dp?=
 =?utf-8?B?UG1yeEFoTlhkRE9abzJLZVlXYnNpcThwVzNXQStjUi9hdk43NnV0aDB1Qjg5?=
 =?utf-8?B?MHV1Yi83YnF3WXplQi9zK2N6QU5VZDA2QTdwZUIxbDhsZnowT04rRkNqSitx?=
 =?utf-8?B?QkpIQW5DcFI5aUU5RnJyZzZiZ2FlN1d5RUNxL25aT0NNWiszMHByTk03SFMy?=
 =?utf-8?B?blZwNUtUQ05KbzBneG9NN3UvdlNjSWJTbGdBMzJxZ1hySllCdzQ5Njg2dGVM?=
 =?utf-8?B?R2JZM2VJOWpTbmtINlpQTkVPNEdlZ2Z1eTdrbkNyOUZGaU1kYTkrOVZMTFpS?=
 =?utf-8?B?TjRsbWU2SlJWUDZEY3hUQUx2VlB1ck8vMk9mVHhMS2R2L1JnQ3AvWkFBQXpy?=
 =?utf-8?B?QjgveG52bjNLRG9oSXJYYitZQUZXdEFOOXFnT3ROekZWWTd4YjkxVGt0MzZp?=
 =?utf-8?B?WFRzVFZRVGpvQU5LMDUzWTYvSEdnZ0EvRUN5N01HbzN4WmJKcis5YUphNXV6?=
 =?utf-8?B?aGg5a2g2dU5DUHJpK2x2S210NVk0bW80NXdjaXBIeVY4ZU5iakg5dWFUM2NS?=
 =?utf-8?Q?+nYvfpaNNUM1WiMyIVwsTsrDc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394ce80d-0c0f-4e73-a986-08db73b3e188
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 06:34:22.5256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vV6fZEIjfG2QVouQWmPFDQEdqWtZjgb9j8nW4O0enqhguh5RxQ13aEo6VfqZfN0pkqAYOTQaUABkKYDRO2mHFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9324

On 23.06.2023 03:26, Shawn Anastasio wrote:
> On 6/22/23 5:49 PM, Andrew Cooper wrote:
>> On 22/06/2023 9:57 pm, Shawn Anastasio wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/setup.c
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +#include <xen/init.h>
>>> +
>>> +void __init noreturn start_xen(unsigned long r3, unsigned long r4,
>>> +                               unsigned long r5, unsigned long r6,
>>> +                               unsigned long r7)
>>> +{
>>> +    for ( ;; )
>>> +        /* Set current hardware thread to very low priority */
>>> +        asm volatile("or %r31, %r31, %r31");
>>
>> Is there something magic about the OR instruction, or something magic
>> about %r31?
> 
> Using the OR instruction with all three operands equal is of course a
> no-op, but when using certain registers it can have a separate magic
> side effect.
> 
> `or r31,31,31` is one such form that sets the Program Priority Register
> to "very low" priority. Of course here where we don't have SMP going
> there's not much point in using this over the standard side effect-less
> no-op (`or r0,r0,r0` or just `nop`).
> 
> For a table of these magic OR forms, you can see page 836 of the Power
> ISA 3.0B:
> https://wiki.raptorcs.com/w/images/c/cb/PowerISA_public.v3.0B.pdf

I have 3.1 to hand, and it looks like they were dropped from there?
Otherwise I was meaning to say that it's a shame gas doesn't support
these.

Anyway - I think you want to put this behind a macro named after the
pseudo.

Finally, as a nit: Style above is lacking several blanks. One
between the two semicolons, and a total of three in the asm().

Jan

