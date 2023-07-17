Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115B756821
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564707.882336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQJD-0004sn-P2; Mon, 17 Jul 2023 15:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564707.882336; Mon, 17 Jul 2023 15:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQJD-0004qF-KZ; Mon, 17 Jul 2023 15:38:47 +0000
Received: by outflank-mailman (input) for mailman id 564707;
 Mon, 17 Jul 2023 15:38:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLQJC-0004q9-6B
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:38:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 036ef0a1-24b8-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 17:38:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7863.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 15:38:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:38:42 +0000
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
X-Inumbo-ID: 036ef0a1-24b8-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0bBugJ02KXN4tZq2VV+cyPeqL5slpZTti+Y3YUBTwj5/kRxvtrRk60Y+wG7Mul7msgP9IpQcCwqh+CemSf8P3BTog9DAgcfZ3MWmspr1YljBObDS9tuSSdYRL1OPEAKFQKpTPc7yY/QQ/AlB0zZiOTb29DJflcy/tcKwtPV2v6rE24RwpiY4dtaXDBhhfl2gh7ApDsQV0qFOmOq2vnq4OBFb2ZU/n5wVgZCVuYVtvfJ7/0yoLIu6KWNUHJfUkO1SrOCpoyMZlJ/wdzCtltpre23bEOCrIS4WmGtVixfQ/PO3tseYjp9/H/aXAOAbca+EreErMmcZPRoSIE3Sz1QPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoDIoWb9uqbJ5DSc/yd9xNBXFHWJFWzUNhu1LXcVW2Q=;
 b=VZ02S/DJd8Vd88wxRX/ixHAS44FpFRUX9yhJTCBwqEa5GAqXrDk4KsxucrT5tGrmfqE9cRuvzhFxdCHkOJUM9D91DNgQJue8njDtAOMR4gb/nUQWUXQ1Tl8fXbEVYwzErP+FQzVdu9Oan9UUcN7jiLpJhE35O3yVuRZRz9FvPc0eGiJXgrjT+InEaAk6B/ycgCFADVn7sQ8e5pfj8D4RJNQ0X9PhEYiB5wjh4F3X5D6dV6a5zRQYR5JgNrqNS65mtBdou2drxTaNwDOgVxTQosCwGGfk3qlC1W4Y63IssGxKdhGZLQ8h99/fuFxr7csj3BWYzyPejD/y0VpVIEG20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoDIoWb9uqbJ5DSc/yd9xNBXFHWJFWzUNhu1LXcVW2Q=;
 b=ef9EFK1Hu4bJjje6PyCpy3vFxMYhJpVG50A+zfnftDGKyfGwdDZCUC67dccR7EmXwqZC2/Dx0pc+geL/K8OGT97A5JIERp51EfxKRUr7zkVeuQHLB5V5yta5yq7ZAH2M2/GecFpPk3pG67W9kZpX02QnPnrNaAexnbe/EEIEROPFwFHlSyL+FRKGDE3v69L8Np+D89ohZ/vx8K3B1v3XM930kuVzS83TtPMCRwj11SF6fIzxX9sOrCigPbed8Tuzj7X3QGXB4uzDqZNF1CxZ7F6XXmMikpaLWq9HoCJBXNo9rUujSNCJIoO6FXAknaYnxdWGe7umBANanz3A6siQTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f6feb8b-29fe-7a7f-8965-20a12b4dfb25@suse.com>
Date: Mon, 17 Jul 2023 17:38:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <8c79f498ffcb0837ff18640dbaf5b66f79186574.1688670018.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c79f498ffcb0837ff18640dbaf5b66f79186574.1688670018.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0243.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c825494-deb2-4197-0e7e-08db86dbe685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qVR2ZdPoXsRil4AzPJ32fzdT9Gt9T8X9wh0qSCJ9pvobJ387eGafgjhz2QwKb6bInYKv0VlvZ8FPpEVagUBiwd/ob0dSrSGHuy2CjG+ZwCiBE8RVWChA8rUKQFUsgYUmTS2CAYjQFP7d8L2Yw1cs+KGpk98OMPjDRk373QeEKXGuUfl4lN61sIT500V7WaVDkpLnI43h7hN82h4rKf2Md6gduLqgpeNAA5eD5ouJW5cNsPmnAygW2VcpJ+UmMt6Fqyic5wonoyylM3J8wPr3ACvurovaR69t8TOtcwpBHQDTYahf4jj1Ow+Xx88rkZwOzPu52/8ZOsxFARBnobXeyj2MTim48am0twCe8x7+3y2bfK9CULUcdgHuuVtRmXCo2vJ6Y2v5cLMCw9/T+EnLdwTXw1UzKJdKsJfc3veDCHcufXQyjKJ2wEntsIXn8rDC4lpONnYqAQDPr1dKFzMTNgPdyzSlSkLztdRf4ahujDgI5KdHXR9g1LRiiE/L/zYoUeFLQ3LhP8X/arshMLcE4XQFoBWjpFGNPoN/mikW7STCaZo6oEQpj1HGEZmjwEGQzkerRXmrEgVXLaSkH3E0Wo4d5HBTv1TfX/sIzUHq45yqhx5M8wUu0eaI+OjKXZe0F2Ss4g+CFvKK8ML8AAVRsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(36756003)(86362001)(38100700002)(2906002)(478600001)(4326008)(6486002)(54906003)(53546011)(6506007)(26005)(6512007)(8676002)(8936002)(316002)(41300700001)(31696002)(66946007)(31686004)(5660300002)(66556008)(6916009)(2616005)(83380400001)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjhyS0EwQUFWV3BMbnNIbDdkTG8vVlFiY3FNNitwWmcwbGdRamRlRS9iZXZF?=
 =?utf-8?B?M3RMaUVRNURTOTBwZkV4aVBKVlJINDc4ZENKU3EyZ3RhTStUUWZpTnk1VC9s?=
 =?utf-8?B?UWExdkdsYTlIdnRTNStUdW8zU3k1MXJ5ek1xbDBtUkR4VlhmMVpqeHVhSUpK?=
 =?utf-8?B?cXVMRXNkeVBaRjE4Q1N6STBRd3IxMjhpdVNGZXNkVVlFeStmRW1hNkFiY0hM?=
 =?utf-8?B?bnRtVTJZWUVsTFVRSDR5UmN0bVlOcmNLcW8wcG0yODhXcWE3TzEydWtpOFRJ?=
 =?utf-8?B?OEFKRUFoamc4NUlhTHNkWXo3TmY4UFBZanF5K3dwRmxFd1pqSk8ydVJMTUJ3?=
 =?utf-8?B?cjAvbmRRcG1STmVQMm1DTVhUSU50RUloTzdCMml4RXhuSFN0cm5xeHljRU1q?=
 =?utf-8?B?am5UWkE0RjMvdFl0YnczV3JlbHNEUnQ1OVBuMExGNXdJOURaRWVUYTBEU3dh?=
 =?utf-8?B?dHk5ai9OZzQxbFBaaVRXZlhLNlpuZ3E3UkRqSy9nRWVOU0JUNC9YSWJVcjFU?=
 =?utf-8?B?dXVMckFkZWRUckZXamU2T1hMeXpkeFlXRFprUUc3Z09DandmcWFuaDRqeU00?=
 =?utf-8?B?ei9kSDBSaXB0RGZ5ZUtCeDZCY0VBaDdTWXhmZ01uMW1UbDdaMTFJak1yM3l4?=
 =?utf-8?B?WUVVUzBkNDZod2grbGVCRDJuOW5hcG0yTVhXUThMVnpiSit6eCtLSmFIYTVG?=
 =?utf-8?B?ZVFOR2Z2SnNoM1huM2NKTTZJQWExU1JYQUhRVFZCTzB2VlpCRlJTeUZjd1Zs?=
 =?utf-8?B?V282VVRhRVlIVVFQeFh5bXRBTktUZE9relVsOG5iYitjZU1kbGo5VG4ybzFy?=
 =?utf-8?B?TWNjbVRFcTI2OWpOWFprNURtOXl4R1ZKL2IvdUhLVCtuT1BZeTg3YWZTK2V1?=
 =?utf-8?B?U0tHK0R3YnRUWUlhb2xaZy9WcGxiN2tESXgzcnJkc05FaDZJeGZqYkFuTEdT?=
 =?utf-8?B?NHhLbjBxYVd2bm03VVRMWUtDUUdFdkZpdlgrL1ZKdjY0QVZKOUNhZmhlNk1i?=
 =?utf-8?B?ckh2QVdTU1A2NWRQMzVnUlJtYzJKVGhlWm5HU3B4UDhrcXBkTWRQL2E2R29V?=
 =?utf-8?B?WEIyeVRBVjRVMWczVStYS2NjTHIydXJzSXN5MENlcE0vZHdNU0FJOGd3a2gy?=
 =?utf-8?B?WGxSN09acmRlaWJMc0h1YVlRSk03TVcvRmE4emtKRVRQQUF4Y3NKbEQxcjBJ?=
 =?utf-8?B?KzJCZWhYUHZ6ZG5UbEp4WWJTaW8vckN5TGExOFdkUzZpM2JBRzlORU9oMmI4?=
 =?utf-8?B?WFpCOHh4aStkQ2pWMmpwTUQ0dVlCYlZSNlk4S3lqaE55Q1NWZzJnRG1oZFpL?=
 =?utf-8?B?emN0VGp2THdzNmZUQ3VndUlIQnp4U3VFYWdlL2wvd0JYcndVdWhhMzFvbTdZ?=
 =?utf-8?B?MzVCdTR3RXBIdEh4NEVBU1ZSUjlvckN5SXFFcjlXeGVFQTBtajRBeTdwVjJp?=
 =?utf-8?B?dXlzS3MzL1dkWERPcU1YTk5kTEZZZSswNzltWlFqengwOTdadnFpNExRTVc1?=
 =?utf-8?B?aXV5b0tJdUVPT01RTzB6cEpwcnJtTmczZUErSVRaS3hFS2w0Zk9tdTh5V1dD?=
 =?utf-8?B?T0pTeUlFQkxkUGI4M3h3RDVVd3dYbFFaK2hiNVZxanc5VnBSQ0lqbVMzdUM1?=
 =?utf-8?B?L3pQNUM0em1KL210ZFV2d2laV3VaV2NqaFhWRDBZRGIwd3JTbldEZHkwaW1X?=
 =?utf-8?B?RVl5d21VMkZHbzErUnZMVFE0cnk4VUdaWGRGUHdwdFhUVmduTGNWRithRjZp?=
 =?utf-8?B?S3NPUnk1cnJ1ZmpFNU1IRXVURm9SalBsZU94WTg3aFJrZGZyVU1QUmJYcDNQ?=
 =?utf-8?B?WURpWUhzT28rUHAyOG1hbzZ2MzFDMWx0MExBVHpycE9FZWUxbktXa3lTVlpH?=
 =?utf-8?B?bVBCaFJJN2hLZkFDODBBcklwUzA0d1RwSzgvdmFDalB4SDZ5TThZcVNpV3VF?=
 =?utf-8?B?T0d5VUJGOUtVVXY3UDBsTHAyQzc5Wkhra1lSUHBncGwrVGRYZDhncVQxekJI?=
 =?utf-8?B?cmo4dzd6ZHpUR3hqSGJVWEpWZncwSlFtcW1TNUtLbnJydnVFSmVMdkppaW04?=
 =?utf-8?B?ZDVsQTFrV1c1ZHBwUlEyVzBjREdRMVI1Y2hmSGZnbUdESXpzTlJ5dXFZUW1K?=
 =?utf-8?Q?g3MyaQo/QyDnczEmSNAqNNLBU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c825494-deb2-4197-0e7e-08db86dbe685
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 15:38:42.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8bZxgD1x05+i2JO8X2wUaV6w1upCzhxq1VSKbYmhScooubEIynGHqV5AX8HHORItInQkqwKEQ41kH22/N5O5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7863

On 06.07.2023 21:04, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/include/asm/config.h
> +++ b/xen/arch/ppc/include/asm/config.h
> @@ -43,7 +43,7 @@
>  
>  #define SMP_CACHE_BYTES (1 << 6)
>  
> -#define STACK_ORDER 2
> +#define STACK_ORDER 0
>  #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)

In which way is this related to the change at hand? Aren't you going to
need to undo this rather sooner than later?

> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -1,30 +1,30 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  
> +#include <asm/asm-defns.h>
> +
>      .section .text.header, "ax", %progbits
>  
>  ENTRY(start)
>      /*
> -     * Depending on how we were booted, the CPU could be running in either
> -     * Little Endian or Big Endian mode. The following trampoline from Linux
> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
> -     * endianness matches the assumption of the assembler (LE, in our case)
> -     * or a branch to code that performs the endian switch in the other case.
> +     * NOTE: argument registers (r3-r9) must be preserved until the C entrypoint
>       */
> -    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
> -    b . + 44          /* Skip trampoline if endian is good  */
> -    .long 0xa600607d  /* mfmsr r11                          */
> -    .long 0x01006b69  /* xori r11,r11,1                     */
> -    .long 0x00004039  /* li r10,0                           */
> -    .long 0x6401417d  /* mtmsrd r10,1                       */
> -    .long 0x05009f42  /* bcl 20,31,$+4                      */
> -    .long 0xa602487d  /* mflr r10                           */
> -    .long 0x14004a39  /* addi r10,r10,20                    */
> -    .long 0xa6035a7d  /* mtsrr0 r10                         */
> -    .long 0xa6037b7d  /* mtsrr1 r11                         */
> -    .long 0x2400004c  /* rfid                               */
> -
> -    /* Now that the endianness is confirmed, continue */
> -1:  b 1b
> +    FIXUP_ENDIAN
> +
> +    /* set up the TOC pointer */
> +    LOAD_IMM32(%r2, .TOC.)
> +
> +    /* set up the initial stack */
> +    LOAD_IMM32(%r1, cpu0_boot_stack)

Wouldn't this (and perhaps also .TOC.) better be calculated in a
PC-relative manner? Or is the plan to have Xen linked to an address
below 4Gb?

> +    li %r11, 0
> +    stdu %r11, -STACK_FRAME_OVERHEAD(%r1)
> +
> +    /* call the C entrypoint */
> +    bl start_xen
> +
> +    /* should never return */
> +    trap
>  
>      .size start, . - start
>      .type start, %function
> +
> +    .section .init.data, "aw", @progbits

What's this good for when no data follows?

> --- /dev/null
> +++ b/xen/arch/ppc/setup.c
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/init.h>
> +
> +/* Xen stack for bringing up the first CPU. */
> +unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);

This yields the entire array as zero-initialized. At which point I
don't see a need for the store in head.S.

> +/* Macro to adjust thread priority for hardware multithreading */
> +#define HMT_very_low()  asm volatile (" or %r31, %r31, %r31 ")

Nit: Style. Wants to be

#define HMT_very_low()  asm volatile ( "or %r31, %r31, %r31" )

Jan

