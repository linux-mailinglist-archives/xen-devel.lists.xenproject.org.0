Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ACD7AD4E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 11:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607744.946024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiJQ-0006JC-8h; Mon, 25 Sep 2023 09:55:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607744.946024; Mon, 25 Sep 2023 09:55:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiJQ-0006Gz-5O; Mon, 25 Sep 2023 09:55:32 +0000
Received: by outflank-mailman (input) for mailman id 607744;
 Mon, 25 Sep 2023 09:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkiJO-0006Gt-AV
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 09:55:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87f3c60-5b89-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 11:55:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7512.eurprd04.prod.outlook.com (2603:10a6:20b:29e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Mon, 25 Sep
 2023 09:55:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 09:55:26 +0000
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
X-Inumbo-ID: a87f3c60-5b89-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK4j+5klyH6SzsUpDOSfe3u5fMHUzxqET4Q1e6nq4MVr3J/jv+ObvTEXHUSqRtJJC8+FYzB4/B9B3ogb1FItA9vaK/yMiscFqVKa4R0pXDG7vy9EtzpKqbw6MIUXGQdG+uhLNapnO+4RaGE/UisKhTJfByaWEJBm03lDMvf/FkZrR43dq9q6qh7BFSf7hIfjqPlc591XdTvZ0ka21mnvb0fW3ASaJXxj9gWfwRB8PvpBag3TcmDtBdhPLxBTx7vyUDtsY+Q+pw8IVGVxKB4dAE+DnPReLWqlcQxFW2E3GfjewLZS5RXSqBuwC67gAUy/vgyxwl+Wstp4Gvh1A0DI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkhX9fBHFnm8D4sR7SXofUd78KR7Tart4aEfQ+w+b4Q=;
 b=gQFI+0TX6cu9D2TtvT4wiDlsnqdcwln3mrJ2b6GQpx9+ySqWo6ZDygeol4f1GnwEgAKFMVBl4nHyZQZ+g5Y+LqA44NhMCg7zQB+xnoe8uyqs/bqC/Jw8Nnz0fVf+IpwOOAps9Kj0y5cJ+FHvZTmrUkggmTYzv6u2uj4SbUePgTAQBOomioLvEsm9aT4ZVjJHvdXJ++hW40x1P/kYed01HCR9aY7SWG4fRf9P9TkFXdmc8kVXTVHzvERad24wmNq2ZCNO3JhYzZANzDmppQSPcifkbu8g4Y9tiASZlfqaoKL9Q6fNp5RAGniDITUP+GMVuDtQvRtDJ5+Qv1LTHjmvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkhX9fBHFnm8D4sR7SXofUd78KR7Tart4aEfQ+w+b4Q=;
 b=bntvmdbQljVjJo66TN8JzJSZzpLrQAMPdPbLbiZxuqvA1pVYFOwna3ypme40mEH3Z7ThtdIS/I0BKr70HsjUapdNgDybz7Pkwz3b7Jz5T0P0n4SeBIrzh9uwQQHLZbenFrNRHXDgVWDQKN0FX7DeVFJaZSrQuGNS4hxkoyjE/LucOSefKofiISnuydZ7nzEYb2JHzCeIk24RqGOLmHbTy4ddURmrgPThEP4NbCgQPaby73DzIKtZyaUbqm0S1ZIPe0JDsR/ciVFQiD1tqqoOl0iWESt+n4wKY2AwnfXeiKWnlP3hDJ1fRfhaGK6itspaIFlnA/Gkk92/a/FKM5geKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b600963-6196-d6c4-8ab3-ab142c323f7b@suse.com>
Date: Mon, 25 Sep 2023 11:55:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/i8259: do not assume interrupts always target CPU0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230919110637.12078-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230919110637.12078-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 6796d8f4-3a18-499d-930d-08dbbdad8b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GqBYa2QDlFz6BfNTVOcXcKSH/swHWVw8HBVK0FB80MrONIFJxWhVzSW/EG1C4NUUoUDwLDuuW2bjWoevRa+8NY6AywuljLbK+j4GwJuhb7HLF/KD4wjL09b0Kg/Pfc+VGD9MF7LNXxvJsgi0nDfX2eBn9rMJY9p6Pj7jtkkMIF61xSDwt7SV5C9DvlYKBimb4O4D7AFum3Dt2Jm+5/uOxwXjsjJTqaoEC/U6Jd46NLL2qG7L3ot5oe3UxlaocWH5TA0cPOIYu6ncp7JC35lQoN/upb7dQcZR30ZuAYR0mSikfl2LRoS//QuZRtJzI4ApDXJdgJ43zHs9KwkAdUfWjwHEDBWBblBrMH4A6PrwaeFhIYq8VMlawArP+v73+xS/aaQVdForOa1L1Xpm22KcDu4tRjYjyk/8DXvoufEMyLECZFVl+JMguN7nEIJXJLjbwn7xxrFzkzbIQKtSk8Kr5tNE+QvOEXA5AYtL9NnTyxBXd+9W3HRlZTow9Oi70bS8sAq5Y8qhSqLpp7ayyAecBIrbWd1PDY+QpEMHgeMIo2jT7teRy7HLS/iMZcL3SmRWDCkfkrYiJRBBzXDfO91mx/UucYoHdW+4KbMW/tZrQMjNyCbNzToAdxbKPPn/zSNlFzzDQ+nZUzVqlpYXoJe3og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(26005)(83380400001)(8936002)(8676002)(4326008)(66556008)(316002)(478600001)(41300700001)(6916009)(54906003)(66946007)(66476007)(5660300002)(53546011)(2616005)(2906002)(6486002)(6506007)(6512007)(31696002)(86362001)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2F2Y210Z3FGbDQrKzdnRVVGNEVPNEJoU0ViT1FBVlZlNmdXcGhRRUlVYWRP?=
 =?utf-8?B?NDZqU0NoaWRTdThMaG9mUFQrOVkyalFsQXlNWUI5c2tTQVByZmdsQ0xuOGNR?=
 =?utf-8?B?SW5tb0cvamtNYWtNbnZ5SGRqR0pQUk9wVU84ZVNFRW1RNzNFZ2hoaSs3L0dn?=
 =?utf-8?B?bCt6aElUWEFRcVRCSFRDYXJuUlVCc1pTWTJSNFJQTHRaVnlnaDJHckI1Tlhi?=
 =?utf-8?B?QjFINDFoekhvTmNxam1rNlgzc1BPU2M0KzZacFJDSTJnaVpNT0h5dFAyR3Q3?=
 =?utf-8?B?Z3ZOZVJPNGpvV2k0RnZtOURjMWpWTEV0VXdTRHhjZE96Y1BrRlA5NTFSK0JO?=
 =?utf-8?B?anhUbDlxU1gxRWV5WkU5WEhOTnlFL3ZLWDdHRmtvTlFvTm9iVkNGbmxBZGwz?=
 =?utf-8?B?UFgya1huU1d4anJrK1lVT1UvZjFWUEtxZlZGMUtuYnBQUmZkZG5xUWhPY05Z?=
 =?utf-8?B?M3R2N3lPMGRzUXhBdVRtWThVZjBaWXl5TW91aDFoTEJGMnJBMnMvajh1Z1Rt?=
 =?utf-8?B?YkNKODIySnd1anNWb3BXM1hXTjg1WDU4Z2RhaHlIcDdrMTA2R0NVcWQxSGNS?=
 =?utf-8?B?TXQ5aHZVNHlYOUhlVXplL2J1YmNHTytaQW9ieGlvUkhIOGRYTDU5T1I0bHZq?=
 =?utf-8?B?UjAzbUFsSitEMWFGWUpqMGJ2YXpXeTJrVDcvY2ltNUhndUs1dTdSc0E1K25l?=
 =?utf-8?B?T2NjMXV1WGVkYy9JV1FVdTE1Ny9oYXVzOGpKRzB1YmNCWDg0UkcyaUZ0WVpl?=
 =?utf-8?B?YkZVckFVOXlRTTNxZFNlZmJabzRqaHFZVkNvV0NPMXpYS0krdmlGWWEvb1JI?=
 =?utf-8?B?VnlON3JRV3lWVnJnbnpNTEY1d2Vnc1M4ZlZab2VZRlowZW9MT2RzSGlMODdR?=
 =?utf-8?B?cjdaOEVuTUJFVy9pc1lmQzkzWEt5UllIc0RzNnp4SXdrT2I3OHdQV1BKeTNG?=
 =?utf-8?B?bnZTMnpUc3lUYWZuUnJxUnBwZ2pPUHVOYjdGNDMwMkY5NC8vMnhmR3ZHYmFl?=
 =?utf-8?B?WmtiSzBJNmVmcHVsWDVIMGRRbjhhQUxtbGJPRFVqTmppWWpPSnQxWW5xNWY5?=
 =?utf-8?B?bFdUVTgxaHNYWFRKaUlBMDdUL3E1MGVCZ1FXNitZQSs2WXk1UWRFUUE3MHpq?=
 =?utf-8?B?U1Q5NWNVZzFyTWJXM3dBRkZmTUdtYlpwRmlaZk9xSTVUS2YwN3NiaVh1ZHNF?=
 =?utf-8?B?cVFqN0NYZmc3S01mUm82djBiRzVvL3pPd29LNDdqTjJVcDdsdzBrYVNPQWtj?=
 =?utf-8?B?dkVNdnNNckE0WGx5QmltS1paTkJJdTUrZCs4T3NlN0s0WXZMZmpJUzNTMW9u?=
 =?utf-8?B?RURWNnBLanB2SExCaGoyRkNyTzQrSHBuSGV5ZGpITVVueFVFd2p2RDlzUFhz?=
 =?utf-8?B?UE5ndEY5QndSbDJJNDdpcnc4R3IrT3NQQ0tTUHZyWVRqWWVRTkhaS1g3cFZD?=
 =?utf-8?B?TDJUclZNUVAwaHgySThZQVFtYnFNYlBwNlYzeG1nVnNTSVdZemZIZXJ4MXJJ?=
 =?utf-8?B?MkRwTTZvNDdOYkxXU3pjN1NXanBkbmlBcUVvOWNpZzJ5YmVQQWhSUFlIQVJ4?=
 =?utf-8?B?azArdmhycEJHRkFyZ00yRXdZRmd1MmJkS2FHTkdkKzBtTDl3b3BmMkNFRDMy?=
 =?utf-8?B?N05CV01iTHh0cDY2Q0VCSUQ5RGJNbVhEZnpYQWV3SFZ3eFplZ1c1eFBsR2l4?=
 =?utf-8?B?WVpCRmkvbzN0SE03MVVJMGdxOVFnVnlSSjBJUEc2RnU5M3I3NEYwL29YbG1B?=
 =?utf-8?B?UkxwVFhNK21SbHdrdG1pZWNEOHFtZlVwc09xQk02bU96Nnp2dElUM2VVSk45?=
 =?utf-8?B?bGYxUTVnSWpUOXBpVm56WnlWOFBQMm10TkNXOHVtYzFoc1E0MmZ0Mlo3WVNp?=
 =?utf-8?B?b0tPdU1HT2JBN01adDJ5c21nc0FJb0hYKzE0VmFCNXF0TVlPbFNyOHZ0UHQw?=
 =?utf-8?B?bHNDemozdmlDNHRMRloxOFp2Nm9mdS9URC9lSVZrV2xhWWxUdEJHb3JhOXEv?=
 =?utf-8?B?Tmh3cmNvNTVSNlo5VHZlSHZ0RWhpRm5OTElBMUlQa2JJb2tsczBiMGxDSDlR?=
 =?utf-8?B?WEN3Q0JoblVxOEFaUGRneDFiMGxxYWxVZmZEcERmc2FtQXUySElLbHdBbGQ0?=
 =?utf-8?Q?l1bJzYRxC9CQvbD3HF+EZKk8T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6796d8f4-3a18-499d-930d-08dbbdad8b39
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 09:55:26.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRhAIk5Pa+XwQ1Wlmv0DwG8EHvpUIu3gVogECwTrRz/7jtuNlhxEi6IefHPIp/yV1Quu0g8PjzngREuFzeCXBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7512

On 19.09.2023 13:06, Roger Pau Monne wrote:
> Sporadically we have seen the following during AP bringup on AMD platforms
> only:
> 
> microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> CPU60: No irq handler for vector 27 (IRQ -2147483648)
> microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> 
> This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
> also observed i8259 (active) vectors getting delivered to CPUs different than
> 0.
> 
> Adjust the target CPU mask of i8259 interrupt descriptors to contain all
> possible CPUs, so that APs will reserve the vector at startup if any legacy IRQ
> is still delivered through the i8259.  Note that if the IO-APIC takes over
> those interrupt descriptors the CPU mask will be reset.
> 
> Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
> when all i8259 pins are masked, and hence need to be handled on all CPUs.
> Reserve such vectors in order to prevent dynamic interrupt sources from using
> them.
> 
> Finally, handle spurious i8259 interrupts on all CPUs and adjust the printed
> message to display the CPU where the spurious interrupt has been received, so
> it looks like:
> 
> microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> cpu1: spurious 8259A interrupt: IRQ7
> microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> 
> Fixes: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> One theory I have is that the APs at some point (before jumping into Xen code)
> have the local APIC hardware-disabled, and hence are considered valid targets
> by the i8259, but by the time the vector is fetched from the i8259 the
> interrupt has either been masked, or already consumed by a different CPU.

Aiui with LAPIC disabled, IRQs should only be possible to go to CPU0,
for there simply not being any SMP without LAPICs.

Did you check that there are unmasked ExtINT LVT0 on APs? And unmasked
PIC IRQs? (Although, for the latter, it could of course be that by the
time we gain control, they're all masked again, but an IRQ was in the
meantime classified as spurious.)

> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -222,7 +222,8 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq)
>          is_real_irq = false;
>          /* Report spurious IRQ, once per IRQ line. */
>          if (!(spurious_irq_mask & irqmask)) {
> -            printk("spurious 8259A interrupt: IRQ%d.\n", irq);
> +            printk("cpu%u: spurious 8259A interrupt: IRQ%u\n",
> +                   smp_processor_id(), irq);
>              spurious_irq_mask |= irqmask;
>          }

Nit: Perhaps, to be in line with the other message in context below,
"CPU%u: ..."?

> @@ -349,7 +350,20 @@ void __init init_IRQ(void)
>              continue;
>          desc->handler = &i8259A_irq_type;
>          per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
> -        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
> +
> +        /*
> +         * The interrupt affinity logic never targets interrupts to offline
> +         * CPUs, hence it's safe to use cpumask_all here.
> +         *
> +         * Legacy PIC interrupts are only targeted to CPU0, but depending on
> +         * the platform they can be distributed to any online CPU in hardware.

I'm unaware of such a distribution mechanism. Do you have a reference? (If
I recall correctly, there needs to be a unique entity in the system that
runs the INTA protocol with the [master] PIC.)

> +         * The kernel has no influence on that. So all active legacy vectors
> +         * must be installed on all CPUs.
> +         *
> +         * IO-APIC will change the destination mask if/when taking ownership of
> +         * the interrupt.
> +         */
> +        cpumask_copy(desc->arch.cpu_mask, &cpumask_all);
>          desc->arch.vector = LEGACY_VECTOR(irq);
>      }
>      
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -466,6 +466,14 @@ int __init init_irq_data(void)
>            vector++ )
>          __set_bit(vector, used_vectors);
>  
> +    /*
> +     * Mark i8259 spurious vectors as used to avoid (re)using them.  Otherwise
> +     * it won't be possible to distinguish between device triggered interrupts
> +     * or spurious i8259 ones.
> +     */

You certainly mean {L,IO}APIC device triggered interrupts here? If so, why
would they not be distinguishable? ExtINT IRQs don't set ISR bits, iirc.

> +    __set_bit(LEGACY_VECTOR(7), used_vectors);
> +    __set_bit(LEGACY_VECTOR(15), used_vectors);
> +
>      return 0;
>  }

Assuming no IRQs are handled through the PIC (which ought to be the case on
virtually all systems), we'd have masked all of them before any APs are
brought up. With them masked, aiui even spurious interrupts cannot occur.
Still you're permanently removing close to 1% of an already known scarce
resource. Can we, if at all, do this just temporarily, such that later on
the vectors can become usable again? (See also setup_local_APIC() for
ExtINT setup - only the BSP would ever have LVT0 unmasked once we've
finished with our setup.)

Jan

> @@ -1920,7 +1928,6 @@ void do_IRQ(struct cpu_user_regs *regs)
>                  kind = "";
>              if ( !(vector >= FIRST_LEGACY_VECTOR &&
>                     vector <= LAST_LEGACY_VECTOR &&
> -                   !smp_processor_id() &&
>                     bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
>              {
>                  printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",


