Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76A68F044
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491817.761128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPl1b-0000yc-EY; Wed, 08 Feb 2023 14:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491817.761128; Wed, 08 Feb 2023 14:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPl1b-0000wA-BV; Wed, 08 Feb 2023 14:02:15 +0000
Received: by outflank-mailman (input) for mailman id 491817;
 Wed, 08 Feb 2023 14:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPl1Z-0000w4-3E
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:02:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ed9b241-a7b9-11ed-933c-83870f6b2ba8;
 Wed, 08 Feb 2023 15:02:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7788.eurprd04.prod.outlook.com (2603:10a6:10:1e4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 14:01:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:01:40 +0000
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
X-Inumbo-ID: 2ed9b241-a7b9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMFKslKeH5IXe1oQ+WYUuYMt7cKhJ6DAGRjhldd+8nRhSqGA/5aX4/sO0oS03s4WvqnNNX2p4njmVW+Zlnhgav9EIPLtawY+Ey5gyPHqaXMidavVSMFbKOSLyeONkGKgzYUGVAs2BbuK6sZZiQa3bzv5Ns9zBhevr2V8InO4qpIAlX7iZSDzkQ1vlAyPKBR0GYi50Uq7MIq6G+ToG34RiVuFwBZBpIy2mDglzcVIeUz4tgffHp/IT8UNMzigztrsmniWNvv8X6fl3FAq1hHaOoyKtnof6eh6Nc7eZstTUf55jpmLJEbnmxGHn6rkeZSppODXyPyAnpr4GqW/PY4zoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcJ6Kpoo/jEQgzlnd8Gu/OiW8lE/XFHagJmShQ7+9TI=;
 b=eIQsuXz7NcvRp8G/EO3jTq9Abgj7zGo+a6yjNeY8eTQNTTWUAovT8/tNxUZNa5ENLSFpQptmi2f8yv0oI7tQYxgCf9/YKxK8iVrz42PR0bSL2gKok67St9hah3k4xi4y+tJb8/tubIjvJtemLTqy2e73WfG0whuNKRYWjY128xaOMKVy0DzUpID2yZs23y3tzw29if+glM0bicLU+p+m5golq5LzuuwPY1oGLC7Npwkk053rhGAPNH7ibeVpzMSDG+q0wHxTbEUwRRJsNDYAkcJQsffPWeHy/8DnQywaM7Kr7bOU5egL3Pf5atl4oSH+1A08ELEDW9FpNsHJb4vYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcJ6Kpoo/jEQgzlnd8Gu/OiW8lE/XFHagJmShQ7+9TI=;
 b=XXnii2IC6Z8oLgQ/iXSOaixXgwB51AMsV508oelrrkD/V2oJVYrUMn6kqhru6R99DG/YxJPRZ7P6qwuLjg5nrl/YHIYU2uMJn0vb1TqCvDYwBj3nIovNP55ds9A8v1D4z9pD67YKa4GWY30Bq3GVMI/RPQLXiJZOsTj2t03ux+ekhPlMGoWLjIeyM/MEGDPhJ1xGUPVjsaGLneunTQCL6HSlyGY/RGmOEYIhoP3YP3JRX8luZ9Ie/SPJ28M2ONW9Zwr++cZLyv+gzyT8XGlVP57aN5evsVoQVHudIY9bFJWupfxFQWAJyTwwnI0TfpMheUhAQ1E0Y4SccYb0QyjZwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1331e8eb-652a-3bdd-2c98-ee695b03d12a@suse.com>
Date: Wed, 8 Feb 2023 15:01:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1675779308.git.oleksii.kurochko@gmail.com>
 <404a4d6621a2e5eb276d2fa61188429294d682ba.1675779308.git.oleksii.kurochko@gmail.com>
 <bee6af5c-6000-461b-7642-2864d412e351@suse.com>
 <e69eb6695310ed63eb68291f76ba1ec96626d68b.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e69eb6695310ed63eb68291f76ba1ec96626d68b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a66975-830b-45ba-57d5-08db09dd0020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LzifTmLaC+lyj0BZP8ZSGBdhkjwdzTe43Ky/G/OJAk4NF1uL5gmc+hQtB4oEOmzf7peqdFHyL8CErKHJOFCDZt8lhyb+SvYQYa8Py2d/kQJKTFXoXUaXNT2cx1+N/xgZmvWuz9ZDUp+MjKmemp3bbmfvXMJ1UxInKPi2I/38STXZyzOrgHmEoJBflXTnNxgaRF+KGn+UNzMo92RDAeQlLo+dcgKCImthEv63eyOMTGxrqyCgWri38TW5IPO1GNGKDp/JvHvWGumeC/4dPBsvVP54bA2MLzVtRKNr3pAknHOCfObr0cWqQp7iteSgEsoePL7NlTt/A9gGOQWI/9Apy+XzAD+cLCAi/k3ORK9Z6pYb0GUuLCabGlxTIDYfMAWGCGs0CPOkSvonu2aJrw+rr2Ajj+Bnm+XhVVbXpfTkgQ986tnslys2ZMHChI3ZNN70dh8ZgCX0SYHz20reQPy31BX1iJI9x5HxDDjvVmn6jQDYESOhkPyQ3pAdoBDWaClZ/yl8DC8W/qtRAlfAZmVmm7z2sQwrTzAJmjQiLMVBRSUDKT7vPCjzkGscW27c5GGAYbrJCkQmSGK+7jtNEx3cSuARaWnDgxz49i0uwjSFMPxt/2CNvPlSyl9g7rAA6Q8TOOXmLcMprWkoB4zU9NrftpcegO0s4vVYx9MAX4n3SGZUITNHMCh7ShT9KWWf70cFJs5mI4+VPeZ8Xiv6JK8z3N2L0KYPw7Ouw0IMxFkVQEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199018)(31696002)(6916009)(8676002)(66476007)(66556008)(86362001)(66946007)(4326008)(31686004)(41300700001)(8936002)(316002)(54906003)(5660300002)(38100700002)(6506007)(53546011)(186003)(6512007)(26005)(6486002)(478600001)(2906002)(2616005)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU9pbVpMTWphcldNSjJZTndGYjJqVmhIcGxjNFYwcHdQbzE5MlNmUU41cUh6?=
 =?utf-8?B?RFhEN21wS1g2T3BlcnBIeEtuWURIUy96NDN4VkZGWFFmZHlUWjRzU1Uzbld2?=
 =?utf-8?B?ZU53c1NqblE5cWJJcm5PL043ZmdoNjAyUmJIc1lCSTMxWXIyQWVib0RnSmVE?=
 =?utf-8?B?VnpZUmd0MU9Ob3Q2UVlaVW12NWFJR2hnMUl3b0JTeHVvelFtd1lRZ2pjcHNo?=
 =?utf-8?B?VmExVG9JSHdvSG5Cb3pNSFZieGxKbzNNdzNMeFhweS85cW1HVHRhRDNUT3pP?=
 =?utf-8?B?TGlSQUdQeGU2Q1ByRHR3eHRqNVVKdk9peVZwS1hrc29iNGxjNkY5Z3ZObm1Z?=
 =?utf-8?B?ZWpGS29BSkM2WXRoVXdiR2JIS0NRdVE4aWhOZGViQlJhYUZhWjdCa1lIUVlX?=
 =?utf-8?B?Um9jK2t4TUlvUUN3SEpSUDVSM3M1bDdIb3kwREYvdU9Gc01WTFFmUkkvMFBy?=
 =?utf-8?B?REZoMTB1eHptZGUxMGNQRGpZVzA2QVdrbFZ3QTgwUDI2RHNocnZWclRERmhN?=
 =?utf-8?B?QmtrUjlubG5neDhpaWUzQVdoUXpnZVF3K04wZTRJZ3F0eEM2Z0I4TzhJYnpK?=
 =?utf-8?B?YnpNeUpTNEp5emtrZ1NmbzRmWDFObEdaNnNPRzJ2MzFtbUc3SlR6SURrZ1V2?=
 =?utf-8?B?Rk1Vbkp6cjZRa0V1cDlwNzNhN05TM2tqcFlqU1RBTjNCSlNhK0hXSXhPVWR0?=
 =?utf-8?B?SlZJY1F2MGFaTG0zV3pibVVKSUw1bzhWNlJRVzlXWkZ3S0RUaUJ0OUZZSkRl?=
 =?utf-8?B?RVZHMkVaMXBtOFU2Qm4vbjJhU0JxVEkwM2g1a0ZJa2RiU3FOUVNrY3FKS2JZ?=
 =?utf-8?B?cjRiSFlXRnFDMTRaVFJpQ3dYWnFGNXNjWkVGamZsZldKUEtCZ3FpQjhWc0tk?=
 =?utf-8?B?TzQ5QjVpaTFtckJVdjgvbzlCYWhNSXVDdlRCcFg5VTQxOGgwaENYLzV4QmpF?=
 =?utf-8?B?ek5MQ3FxU1I5Wm5jYkxiQkR2aGhjUDJXUXUzRmdlZWNDUk9Tb3JWVXBPb0VY?=
 =?utf-8?B?ZHU5bERKSThGdDVUK1ZYZnNZVlVVV1JPdmpxWlhJY0lNTFptVXNVdjBHTUx1?=
 =?utf-8?B?cGttTGhtYStFdWlaTnNYVFBhcFV2TkRCTW9UNzlVbkNaa0gzckN5dkZxeXFK?=
 =?utf-8?B?b3cxQ3oyWlJ4WmxVUGUxYlArM3dET3Y4aURUMWZka08xNWZ1Z2t1ZjBDbyt3?=
 =?utf-8?B?cjJyb2tiTTN2SnRJYlIvSVBKMk1IVTRVYlUrV1RsMDMvR00zc0lFYVVGZ0ta?=
 =?utf-8?B?bUUrSndiZDFrSWRYNFZDbG9aSFdOS1kvTUxSN2dXZGVSZXNDcGc4RlVTLzFl?=
 =?utf-8?B?Y2JQQy9qWGNTdDZIc0lVaWFTdDB5QXlHdmNXMmFYSFNlM3o4d1hEbFBoNXo0?=
 =?utf-8?B?cFZOaVF0K1dYL0FUUFE4bkxlNjd4QlJIdW5iYVJDQ2dwTVo5UGtZWitMdGc4?=
 =?utf-8?B?OHc5ckw5YkJ2aXBKT2phWVZnVmEra1VwLzUzUG5DNEs2VTN3dnZmZ2UrU3Jj?=
 =?utf-8?B?NnNzZ0pSWlFJUkpKWkRyek91dEw2SmtYVmY2N1RhRC9NODdrcEtuR09qWExn?=
 =?utf-8?B?Y2puTi9XTjd1eCtVNmJwbk9yYlVaMFJHeFBZNW1SeDVYNGlKWWNrY2RSSjV0?=
 =?utf-8?B?dnRJNklEMEhpQWhPTFZ0RGxyT1BUaVJhSlN5eUlMSnNPcUZmYlpwZFNJSEY5?=
 =?utf-8?B?aC9KWENsNGtJODMzTzhWSjR3bWR4ejR2cHhzV0JiekVQY1pLejRIcEwxY0Zs?=
 =?utf-8?B?cno1bW1KY1A4TmlJaEpDQWZQQVlzSCtTWHpaWHp5WXhPTlRMcHo2SjE2WVpU?=
 =?utf-8?B?cEU3MlgrbG1GY1VNU2YwWk81b2plNG5zTUtUbE8yWFY3NVV5dXE0V3NBVjZU?=
 =?utf-8?B?OXpkV3VucSsrN3lhREdkSWFDUWxIdDl4UnJFQkdsU1hIQWhQd09EdlQ5Z0FK?=
 =?utf-8?B?TTNSQjNwblo1d3BweGFjQ3JjV281dlVycnB2c0VzajIzbGErTnI5OWJGVVdN?=
 =?utf-8?B?dEw4RDhRNUxKa3RoKzMzNkVITGZUQlRzcThTV3RsWnY3R2JtUjgrT09SbUZU?=
 =?utf-8?B?N1AwbXRXZllaVTZnc05EN0ZPNUptK0VxTnJHM0JHODVGeW1FTjdpNnNPMlVl?=
 =?utf-8?Q?XOtZIIbX7FDOddWOXSkIyEm11?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a66975-830b-45ba-57d5-08db09dd0020
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:01:39.8849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3QElFf3XGDRzsyHuXuSttyolg8vQSNpkbZanoS8FqcdeZbdyOPjRrh1NC5HZaC67Ud10sihUylJUM/ujnGB5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7788

On 08.02.2023 13:00, Oleksii wrote:
> On Tue, 2023-02-07 at 16:07 +0100, Jan Beulich wrote:
>> On 07.02.2023 15:46, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/bug.h
>>> @@ -0,0 +1,38 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2012 Regents of the University of California
>>> + * Copyright (C) 2021-2023 Vates
>>> + *
>>> + */
>>> +#ifndef _ASM_RISCV_BUG_H
>>> +#define _ASM_RISCV_BUG_H
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +#define BUG_FN_REG t0
>>> +
>>> +#define BUG_INSTR "ebreak"
>>> +
>>> +#define INSN_LENGTH_MASK        _UL(0x3)
>>> +#define INSN_LENGTH_32          _UL(0x3)
>>
>> I assume these are deliberately over-simplified (not accounting for
>> wider than 32-bit insns in any way)?
> The base instruction set has a fixed length of 32-bit naturally aligned
> instructions.
> 
> There are extensions of variable length ( where each instruction can be
> any number of 16-bit parcels in length ) but they aren't used in Xen
> and Linux kernel ( where these definitions were taken from ).

Can there then please be a comment here about this (current) assumption?

>>> +#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
>>> +#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
>>> +#define COMPRESSED_INSN_MASK    _UL(0xffff)
>>> +
>>> +#define GET_INSN_LENGTH(insn)                               \
>>> +({                                                          \
>>> +    unsigned long len;                                      \
>>> +    len = ((insn & INSN_LENGTH_MASK) == INSN_LENGTH_32) ?   \
>>> +        4UL : 2UL;                                          \
>>> +    len;                                                    \
>>
>> Any reason for the use of "unsigned long" (not "unsigned int") here?
>>
> There is no specific reason (at least I don't see it now). It looks
> like it can be used here even smaller type than 'unsigned int' as len,
> in current case, can be either 4 or 2.

Often working with more narrow types isn't as efficient, so using
(signed/unsigned) int is generally best unless there are specific
reasons to use a wider or more narrow type.

>>> @@ -97,7 +98,136 @@ static void do_unexpected_trap(const struct
>>> cpu_user_regs *regs)
>>>      die();
>>>  }
>>>  
>>> +void show_execution_state(const struct cpu_user_regs *regs)
>>> +{
>>> +    early_printk("implement show_execution_state(regs)\n");
>>> +}
>>> +
>>> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>>> +{
>>> +    struct bug_frame *start, *end;
>>> +    struct bug_frame *bug = NULL;
>>
>> const?
> regs aren't changed in the function so I decided to put it as const.

Hmm, a misunderstanding? I was asking whether there is a reason not
to have the three local variables be "pointer to const". As a rule
of thumb, const should be added to pointed-to types whenever possible.
That way it's very obvious even when looking only in passing that the
value/array pointed to isn't supposed to be modified through the
variable (or function parameter).

>>> +    unsigned int id = 0;
>>> +    const char *filename, *predicate;
>>> +    int lineno;
>>> +
>>> +    unsigned long bug_frames[] = {
>>> +        (unsigned long)&__start_bug_frames[0],
>>> +        (unsigned long)&__stop_bug_frames_0[0],
>>> +        (unsigned long)&__stop_bug_frames_1[0],
>>> +        (unsigned long)&__stop_bug_frames_2[0],
>>> +        (unsigned long)&__stop_bug_frames_3[0],
>>> +    };
>>> +
>>> +    for ( id = 0; id < BUGFRAME_NR; id++ )
>>> +    {
>>> +        start = (struct  bug_frame *)bug_frames[id];
>>> +        end = (struct  bug_frame *)bug_frames[id + 1];
>>
>> Nit: Stray double blanks. But I'd like to suggest that you get away
>> without casts here in the first place. Such casts are always a
>> certain
>> risk going forward.
> Do you mean that it is better to re-write bug_frame[] to:
>     struct bug_frane bug_frames[] = {
>         &__start_bug_frame[0],
>         ...

Yes - the fewer casts the better. Also as per above, as much const as
possible. And I expect the array can actually also be static rather
than living on the stack.

>>> +        while ( start != end )
>>> +        {
>>> +            if ( (vaddr_t)bug_loc(start) == pc )
>>> +            {
>>> +                bug = start;
>>> +                goto found;
>>> +            }
>>> +
>>> +            start++;
>>> +        }
>>> +    }
>>> +
>>> + found:
>>> +    if ( bug == NULL )
>>> +        return -ENOENT;
>>> +
>>> +    if ( id == BUGFRAME_run_fn )
>>> +    {
>>> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs-
>>>> BUG_FN_REG;
>>> +
>>> +        fn(regs);
>>> +
>>> +        goto end;
>>> +    }
>>> +
>>> +    /* WARN, BUG or ASSERT: decode the filename pointer and line
>>> number. */
>>> +    filename = bug_file(bug);
>>> +    lineno = bug_line(bug);
>>> +
>>> +    switch ( id )
>>> +    {
>>> +    case BUGFRAME_warn:
>>> +        /*
>>> +         * TODO: change early_printk's function to early_printk
>>> with format
>>> +         *       when s(n)printf() will be added.
>>> +         */
>>> +        early_printk("Xen WARN at ");
>>> +        early_printk(filename);
>>> +        early_printk(":");
>>> +        // early_printk_hnum(lineno);
>>
>> What's this? At the very least the comment is malformed.
> It's an old code that should be removed.

Removed? I.e. the line number will never be logged?

Jan

