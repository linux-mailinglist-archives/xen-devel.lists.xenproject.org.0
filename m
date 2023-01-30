Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67557680F56
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 14:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487003.754480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUXx-0005pz-0a; Mon, 30 Jan 2023 13:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487003.754480; Mon, 30 Jan 2023 13:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMUXw-0005o6-Tz; Mon, 30 Jan 2023 13:50:08 +0000
Received: by outflank-mailman (input) for mailman id 487003;
 Mon, 30 Jan 2023 13:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMUXv-0005jQ-II
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 13:50:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2058.outbound.protection.outlook.com [40.107.6.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00bd49ce-a0a5-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 14:50:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9283.eurprd04.prod.outlook.com (2603:10a6:10:36d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Mon, 30 Jan
 2023 13:50:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:50:03 +0000
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
X-Inumbo-ID: 00bd49ce-a0a5-11ed-9ec0-891035b88211
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+/ws3OCV5pc4HpnaadllOz+Kzmlznt3x9Y29sV5GOEX3MedeIcXLIt8EmMJge0EemBYK5RzUkyfVg0niY8YHn09LKQbMNfxaBfGR9c98dm2mrX/nQNCEl1R1w6XXvtjUExN/MIDQ4f4TGkgYpKbhtkS0ZwmVp3YhRX1al/2SRxswl336Bnh7+aVu1WMNJfm6xYsFyMxVwi9dAsMcC4lqlRp+n6ulhmw71ko6Kx2t4TwcUHAzi8YiItPjgYtPPa10N6KImzKRhCHyKCg7p0hKfC+tUM9B9g2NsZUpKVe0vUPbpKgDn6FC49NfibLfHfZIvssh5hi9LuNE5a+Cn7pEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6tMXtP2znewAMpE/XQR/3UQTZC5BMmEej0LC9BJ0/A=;
 b=f/jiLKUaotTXd0fiqtm3TF7KpPYA3TEDI3IklciPfWPsgfgoXBbVesSIPplOQ7MWrLI0PmnlTTvMrBNgPXUvqg6g2Ya/KZAalXkGxl9VC9H+bBKw+M6d7cwxvgo5E0XcbrxyJt02Xq73LzlTa/N/wOgeikktvgckL0PRaIUK5QQHwt9JEBIpPF8iOuTTGl9qpf1JMcqMei7YeyfRo3KccBu+YOler2OAveI7RbRH7+p/EcnR2m8VPChs5JQoD1hsczJZ9zV18Btzb/6+beHAJ/k0ssaPkberstDi7VZ7Muz+3D3VlNVj/aZrH3msC/Rzz0J8DKMXD7oQOxiiESyBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6tMXtP2znewAMpE/XQR/3UQTZC5BMmEej0LC9BJ0/A=;
 b=W6SLw1tUMYgN5VnfBuPlYavziHfyXWKPgJbaAU76gUS46SWGB9TtPsOrRrZDbjSHv4/TpVJlrXQSDjV+ZCF5AdZR0S5LjJ51KgpiaFuq+TYKFAibtA5ypjCmUeSI8+M0aob9zV4apa5Tgom2AF1ZVl8VemnCZ+8ma72sH4BXA/BESIxzwbgjdaf0+3K8rI6sUyqiPRJseBf+hqiutoIr6cYQesGraMW4fai9EDGdMJCu8wqdkXsWID/2tLOiX3YoBmgASEd0yqJi9sYDU4Yh+6l2+lC0U4DCo+8jnYTcOvA/FXN6+CUTrejxdbWqvBU2+jfICcqWXAH9Syf7OO9cRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bdb8c6a8-a677-9bef-c819-904bd944e6da@suse.com>
Date: Mon, 30 Jan 2023 14:50:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/14] xen/riscv: introduce exception context
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <652289358975cf869e4bc0a6a70e3aba7bd2fbf6.1674818705.git.oleksii.kurochko@gmail.com>
 <75328420-0fbd-92ae-40c7-9fee1c31c907@suse.com>
 <792bc4533d3604acd4321b4b15965adec22431a4.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <792bc4533d3604acd4321b4b15965adec22431a4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: e43894ef-23bd-4271-9c2c-08db02c8e322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mn3FpdSJvbQ7a8pIDChTUBc5qkwCvROOWQVg9bv69q3/F8FvyVlaTDDbuyvJk85PspFtBqJw1F2uXmYFayo07fH0ASQ+GbsVbjEJRMANYdjPaJ0zxLoWBjPDINjqo1L1Qebyy35Y3AdHPmNGITpraZ3C4TxpHMDc1JhU7mICFWi82jEu1nGfh02+g3yBnFDi7KhSTr6j4ZIddOfPzCZYuo2Y0lGxWUweeo/3e2BtrMol6bX/M9Zf2/IZcTEc/XuupUvcHeT76xf5EGhlb20AQSz+wfS45hHG+iykdMvMNneRVIaQbZG10YuUBvJeLtWZ4dArWkUCZgDHw6eqJmEkP8hTioQdwhsA1RdvGJ9T/6DCewicqzXf/Od2oe7dzBea7+U7nlaz2++sL+lvRgNSPXODXB4bUuvH55/eMGvXyQwKPYH3lp6PGB9nYwPToqqH3ibWK6AKP8OWC2iOY+Qgm16uXwSvPz6t2E31rcrojyYRe1aiclv4ESwv7M0JmMMrHCE1uPZJYLaq9U13tMTdzroPZjt1EpxeXLROEBsq6O5sddJCwRWjhO7CGY9M2bDRVSExyUm7CqjF3rAK6SN1RmERJHU17CFFE2eNILGUX01GqYoaECYMhIrht+Ad6MjxuN2e4v4E1c6Ebf+YP+Sjfyj0ILr1bQDABRbIxH6gbYLnkgr+Fy993rLE9uoG7uX8n8Mewx1C08529EScYsQD5T9YRlGtfPhhjIdXtlPrU70=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199018)(86362001)(36756003)(2906002)(31696002)(2616005)(66556008)(26005)(54906003)(6512007)(53546011)(6916009)(66476007)(8676002)(66946007)(6506007)(186003)(4326008)(38100700002)(6486002)(316002)(5660300002)(478600001)(8936002)(7416002)(83380400001)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXlZbVdaWkVFOXk0bHF0S3VsQUo3MERqNnBvc1ZCaE93OWcwWHkyTEJRZW1s?=
 =?utf-8?B?UVBBeUtNTll3eEZRRFZVOHoxOEdFcC9jRGtyQ0YyYUtTYllaTSszV0tFcUlh?=
 =?utf-8?B?Ry9udFZhNFR1Tjd2VHFxSlE1dUJjcXdYZ1dxSFJwM3hYd0d4NHBGUUlpWE8r?=
 =?utf-8?B?WXBMbnVWTElZOVQ5UlEyK2RCckV4SUszOSt6THlvUWFVaGhub1hoK1BaSmdt?=
 =?utf-8?B?SnhSbUh6cVJJNFhISllpcW16WTBhZDVTcWFDRWpMSWRwYjBUSm1xVDNDeVJp?=
 =?utf-8?B?ekRwQkJkQnRPV1dJT2MyM2UrTHNXVnA0NWJoSm5HSWlQUGdmaElNTlMySENI?=
 =?utf-8?B?S09GSEhYUExKUkVzQzg1UGVBSnhMQlB6TlNlaXNjeE9NMmpnOGg4WmlNZnhS?=
 =?utf-8?B?UUd6NEhuTE5NclRxSHF1QkFMdGdsblFQeEU5eGc5YVZnRE54dzA2bHNPNWg3?=
 =?utf-8?B?RVhDYjZ5UmpIUkVvcHV1N3hZMHNJMjdaMGZ2LzZlbkFCMlE2RE15bXA5QTZI?=
 =?utf-8?B?UXNmcWdtV1FNT1lhSE5RSlRIMTBoYmtoQ3k1U1BXZERZaUsxVExydzFDNWdB?=
 =?utf-8?B?QUxDQ1RoVWVBU24rZlBTbTBidjhtd1UvY1RBY0liUkFtWHl5a3k1aWJOSzF4?=
 =?utf-8?B?Z3VvMlRUc2JSMEN2dTlydDUzSmI3YzFQUm5kV1d6eU1LdDhYZ3NKcytPNElr?=
 =?utf-8?B?WWNtRWZEQUpKTmRoUmV2RGEzWDd6WVJab1ZQZkFjR3pJOHA0cUFrQm1ZTmEx?=
 =?utf-8?B?anVRTkFpenJYbUxWZWNNT1JCSmV3NWwzUWFtRkNlVVhDRFcxSWVJdW1Zc2pm?=
 =?utf-8?B?V2sxaFluQkpsNzBURzZ1aVlxandPNHdTcjJveWFVOVR2am9RRHVGZGJUeFBE?=
 =?utf-8?B?bDJKaHc5WXNLTVNnUWY5TkZYTE1sdEdwK01rcHlNcElOcXMvN2hQSktDYmdR?=
 =?utf-8?B?UzVmNVJuVlBTRmY1WXYwWXorSDBacHdYQ1Y5U0JLUHZvOExOd2w1Ty9TTEtu?=
 =?utf-8?B?ODFvdHMzdVU0dEdPcnd6ajh2VnVLbVUvdTNpd0NsSWFsS2ROLzZLaFVpL3h4?=
 =?utf-8?B?aTZCeGZUTURrUjl4aklaelVselp1Q3MwbzdFekQ1TDlYL0ViYW92U3BMMG1H?=
 =?utf-8?B?UE5yb2Fwbm13RHBuWWxWdEMzdW45eVQ2V1RGYmQ0R3BCdXNXNExxRGplaHd0?=
 =?utf-8?B?STIvUnNOdHl5WVI2SHlmaWlNQkFzSDJzL0ZQYnRSM08vYVZYcnZlalJZOGlm?=
 =?utf-8?B?TFZLQmNWL0plK2ZDVEcvYlJ6K2VvOHRjSTEzNlJWQ1hIMHlrTXY3QUtCZWJW?=
 =?utf-8?B?bUk0T2h3Kzc5TUhqRVlEL3B6VXpQSG8zQ2NDVU1sbStIZGM3ZE1EZkhTUmYv?=
 =?utf-8?B?d2sybTl4Tk41T1Z2WTV0c3ZTc1BwalhCK3ZDWXpSKzBTZTdMUWd1K3dkMHl0?=
 =?utf-8?B?RG85Uk9Dem1EWkR2VkhINnFHUCtiRzdMZjc4c1JyeXZNUHIvUjVCV21UWkly?=
 =?utf-8?B?TlZzMXJPR2hHeWVOZmtkdWxUZ0tDTjB6ZDVka200MHFMUE1VcnFHWUU5bzhI?=
 =?utf-8?B?QXlaU3NJK1BYRnVwQ0hpcFc5RXF0UXdmcEpoWFNmaDZxSjc1MWlkMmtjMnJD?=
 =?utf-8?B?citQa2Z1VStFOUhIR1h5NTExcEp3d3RZcjZJQVFsVlhwcXg3Q3ptdHA1emNt?=
 =?utf-8?B?QmJrcGVrbnR0N29QWCtKaC92OVh0eUg2TTJQNHA4LytlalowWlpQTktSdWZP?=
 =?utf-8?B?WWhLZ2ZXRUx1YnVpMDJHQnJvWXI5cVl3aDgyRlNtL3FsS2dZVk8zSG9acFRk?=
 =?utf-8?B?OGlPcldGOWo5QjU3REwwVjFISzE3ZjB6MDZac0pKSUFnbmc3OCtiK2lLa2tw?=
 =?utf-8?B?TGlIbkZQNWRjNzBhWndYVDM1ZlpTdFVzWTdmNFAzdnpPcHBuZHBRWVdYMHJt?=
 =?utf-8?B?bUd3UXhiL2crS2xUYW5OUEhNbVBnS0FRd1dERkJqa2Z2MitST253UUVQVnIy?=
 =?utf-8?B?dUtQaTJoN2M5K3oza1dTK3AwQ1lDMEhNNHZYZzhWeDRiSlJpS2dNaU80dEZt?=
 =?utf-8?B?Wkg4RTBQWGkrWVIrWlJaK1NwMkZOTVVkTGNTRUhrdFZ1MTc2ekhRdlhYK0hE?=
 =?utf-8?Q?yaliku+t6rH/AFIeyst5bDKWy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43894ef-23bd-4271-9c2c-08db02c8e322
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:50:03.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4vdVUyATrMvjNzq9BMy5EJFLk1fBDr3fbMMdQC6MwvxUibUrvrFz2nDQe6+qgSeZNu3piFvAfyx4RVP0Nfaa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9283

On 30.01.2023 12:54, Oleksii wrote:
> Hi Jan,
> 
> On Fri, 2023-01-27 at 15:24 +0100, Jan Beulich wrote:
>> On 27.01.2023 14:59, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/processor.h
>>> @@ -0,0 +1,82 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*****************************************************************
>>> *************
>>> + *
>>> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
>>> + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
>>> + * Copyright 2023 (C) Vates
>>> + *
>>> + */
>>> +
>>> +#ifndef _ASM_RISCV_PROCESSOR_H
>>> +#define _ASM_RISCV_PROCESSOR_H
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +/* On stack VCPU state */
>>> +struct cpu_user_regs
>>> +{
>>> +    unsigned long zero;
>>> +    unsigned long ra;
>>> +    unsigned long sp;
>>> +    unsigned long gp;
>>> +    unsigned long tp;
>>> +    unsigned long t0;
>>> +    unsigned long t1;
>>> +    unsigned long t2;
>>> +    unsigned long s0;
>>> +    unsigned long s1;
>>> +    unsigned long a0;
>>> +    unsigned long a1;
>>> +    unsigned long a2;
>>> +    unsigned long a3;
>>> +    unsigned long a4;
>>> +    unsigned long a5;
>>> +    unsigned long a6;
>>> +    unsigned long a7;
>>> +    unsigned long s2;
>>> +    unsigned long s3;
>>> +    unsigned long s4;
>>> +    unsigned long s5;
>>> +    unsigned long s6;
>>> +    unsigned long s7;
>>> +    unsigned long s8;
>>> +    unsigned long s9;
>>> +    unsigned long s10;
>>> +    unsigned long s11;
>>> +    unsigned long t3;
>>> +    unsigned long t4;
>>> +    unsigned long t5;
>>> +    unsigned long t6;
>>> +    unsigned long sepc;
>>> +    unsigned long sstatus;
>>> +    /* pointer to previous stack_cpu_regs */
>>> +    unsigned long pregs;
>>> +};
>>
>> Just to restate what I said on the earlier version: We have a struct
>> of
>> this name in the public interface for x86. Besides to confusion about
>> re-using the name for something private, I'd still like to understand
>> what the public interface plans are. This is specifically because I
>> think it would be better to re-use suitable public interface structs
>> internally where possible. But that of course requires spelling out
>> such parts of the public interface first.
>>
> I am not sure that I get you here.
> I greped a little bit and found out that each architecture declares
> this structure inside arch-specific folder.
> 
> Mostly the usage of the cpu_user_regs is to save/restore current state
> of CPU during traps ( exceptions/interrupts ) and context_switch().

Arm effectively duplicates the public interface struct vcpu_guest_core_regs
and the internal struct cpu_user_regs (and this goes as far as also
duplicating the __DECL_REG() helper). Personally I find such duplication
odd at the first glance at least; maybe there is a specific reason for this
in Arm. But whether the public interface struct can be re-used can likely
only be known once it was spelled out.

> Also some registers are modified during construction of a domain.
> Thereby I prefer here to see the arch-specific register names instead
> of common.

Not sure what meaning of "common" you imply here. Surely register names
want to be arch-specific, and hence can't be "common" with other arch-es.

Jan

