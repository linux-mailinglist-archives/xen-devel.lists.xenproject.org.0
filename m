Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE373B13F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 09:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554243.865329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCb6w-0003cS-9v; Fri, 23 Jun 2023 07:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554243.865329; Fri, 23 Jun 2023 07:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCb6w-0003aJ-75; Fri, 23 Jun 2023 07:21:38 +0000
Received: by outflank-mailman (input) for mailman id 554243;
 Fri, 23 Jun 2023 07:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O1Yh=CL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCb6u-0003aD-J4
 for xen-devel@lists.xenproject.org; Fri, 23 Jun 2023 07:21:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 959dad5a-1196-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 09:21:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9113.eurprd04.prod.outlook.com (2603:10a6:10:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 07:21:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 07:21:28 +0000
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
X-Inumbo-ID: 959dad5a-1196-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crttS2Gd+FK2wgIjysEDa4GRj8kYN/TDvrTapI2nUvuR7VqLG6+j8ThUfHedGDgaRudtkcjuq4xi2o1Zk56ywRJw7F9uWVdu0cCAsXn1gGKqVKz71XcHtuYLz+Dhi1mIComZSzhqyYCNlrWxg9OOLyv7H6qKYjXPEdzzzMeB16TXWaE9f3JAvpMokujhGOA64Cs/69/scBpbL+q7AiPfX2XwBkWqeJQjBnwK2Hi5U25yMXIntpT/oVCaIGg7EP2Ej2k4uIqrc8QDzaUYa9x9BJmPkD/ujyC1L4yzd7rFh2bA2yt0yN3Yh/XJrI8aMykt8sWs9MWIrXlLzhp21bPJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjLDupfVjULKpMwZUwyeJwVzkBbpwSa3UNCGEG8SP9w=;
 b=KyGqIqV5xiN3EW8WLylxIqcOcymSML2rcq5yEiTKerU4DvGu17cm+du0ywj0C5nOvYaWRxhqbtoFgwNmF4Cc4tI3LzTXL22WWMDj8avX4qvIykcedayPwfn5/nfhuM2kIF422LPzOucUoqv70tzvYhtA4odx7DmeRGZ1UK3D7tXl7DuprZ+5ptGtd1kA2Awn+HPbe/90XJHWoZjbrvrACo7TsrCzU7O6ClTbThGsiwzOEFK+gIRc5v7wi6imDnmwLdpmGHAyQBRScObeP3rsqnn/du85m6VPmSeX49w+aEC4KpTI0Tsl1TiOWy/H+PtVdL0OWQMqoAJamTPIuvdzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjLDupfVjULKpMwZUwyeJwVzkBbpwSa3UNCGEG8SP9w=;
 b=Wu5X9lZmyixujSJFyE5aWU3uICmbExrRYo0mtKP26ACW4E0rWMgv6jE581zNQPNkVACquR50E9eo/zZHFfc7dSeNSLih2JNP0RP95qv0zgTOh500S+05VVtIPAWFlYFxjt4KXtK9YhtFOxNMlQDwQ1A8+qSu4rmVsb+lBDjhltF+E85M41j2HLk4I4DHkcxMAwk5ttAyzvOsn3rTxQvZUVgUIBCiMbKDIw9/sv7g5b7HxsuxxeVUu4LLTAqtrIH25rsa+NmqQz4KtpGk/D/0BvcsLcnC83xtzU22+eyCqtzfaEwWP5ufX3b/GLZ+b4hBDUzS+OSpDUZ86z3ME/HVSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b815713b-3860-df53-1d57-fbcd30f12764@suse.com>
Date: Fri, 23 Jun 2023 09:21:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/3] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <bac07ac781e8901f558fedb7d2943bda4bb700d4.1687466822.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bac07ac781e8901f558fedb7d2943bda4bb700d4.1687466822.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8c1e2d-788c-4de8-b591-08db73ba73c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v83X1X474W7v6j5h328Yc4/mtGXLxLsoNYDm04+EbNV0b4wxkYSmNFKut7s9QDNTkqmeYnVKZ9v+rC9UdfP5PL8UDdoybUDaxcVuTpSgfMhG+JcJvWl+B0AUVDCQy2N26nHZok9L1QW9MdljiuRilnl136wIuK1Y2+yZYSJnHW74/h/cqZ+BJ+wRs2vSZ7Qcp/1E9V31ZEq6M8DLFWQvdZO+NjyZ13kkPtNsI+ydJ7gvKMDTop4KurKCmmuESemNlhETQYIQ9ly+C5SNBuAC75HIIpKV0a+w+tcQr9XBoLaxzLfPGqRFWCJJI3UyyyHU+FAEbsSvmn/0e0IDzazb3FbLV0WaTbQlz+ryj32IVowLx2qoxkwF8hW+dHr8BumsA56LhOPIpAng08ZXG5HLLEfS1MW1S81V9NcbVuqdsTWWrbHY9RJFf0dnecYpby9ZLV4QXg939cloxO3izb1IbethW+Q/cmp4KkZ/fZ2axdh3gfQGSCQ216w3dSGMVWHMNy+jrZNvwKLU5kt0ezzti23Qt93R5b0s3Rdx6qYsdKuXPbjVW6UBPzt+3Us580IJ1cDhMtSY4b9/8LALVEOUPVPtRd4hHMz6EExjky8oj+BEHYKGaHgk7m8NG0E/KTlgbjtV5KTFAXrLoaGh3SxqsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199021)(31686004)(83380400001)(41300700001)(8676002)(8936002)(316002)(2616005)(186003)(38100700002)(6506007)(53546011)(6512007)(26005)(6486002)(6666004)(54906003)(478600001)(36756003)(31696002)(86362001)(4326008)(66946007)(66556008)(66476007)(6916009)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1EwUk9YZ2dla2p6YWlQTjVBVUhMa0RKYzNjZms4R3N6elp3WjREOWIyQnVs?=
 =?utf-8?B?b2wrTXd4WGFHcVRBWGxLMnh5KzBSMnA0ZFZpMFpYeFFQUjlXZFI4c0FHdGF6?=
 =?utf-8?B?YzNXSjR5aHI5eWh5ajZRbmpvVU1hRXFUMEY1SDgvcmJRSXRVT1ZOTmsyZW1I?=
 =?utf-8?B?NTB5eXBBSlBaTTE5c0NOWkFvUjJCZklybzl0R1BadmdPb3Z4SGtrY1V3R2Va?=
 =?utf-8?B?OExLWUFtMFJDUnlMZGJJbjA1TjVyMElWT2h1a21mK29ldWxraFFZZFBiZDV4?=
 =?utf-8?B?a3UyNzBNUVlJV2pDSHRjWXNpWTlRNEJoc3NWSm44OUdYcXJEek00T2lZdXJH?=
 =?utf-8?B?VHliWmpIYkRrR1B6a1lXQVlWeEY2YzdXd01sTjY2cUNZaENpbTd5em5iSDUy?=
 =?utf-8?B?aUJVSEgya3dRZlBqNUg2ai9XNG1RaDdCZ25rbGRFaDgzalFHeEJCWWI0bm45?=
 =?utf-8?B?WUJBRlVDUStWQ25nMFIxS3JxUEpwbHd0WjVYYmo3MnYwc2NNWkdFOEdpdU5E?=
 =?utf-8?B?azFKREp0RlRSYld6ZEV2anRXUnovSldsVEdxUTJYZUFpWCtkS0djU25VZlM5?=
 =?utf-8?B?WGh5TFV4bVQwL0dDenJiWmVLRVpkN3ZWWXJsMWJ1Y2ZiY0ZQb0xYdXZLQ0wv?=
 =?utf-8?B?bzBpWGU3OFhkbmwxVmlZMUNLNWlsbG9IR3htUENTWTk5RkJuMDVTejZEQ3R0?=
 =?utf-8?B?WjhDT3JEMXRFeUV2eFYvelVzZlpMSEh1akxQcmNiTkxTYStDK09VcjNsckJ3?=
 =?utf-8?B?UkFRa0xUSWd0bW4xT3EvWjBmQWIxYUpDOVVwVXM3dCswcndZUGVDazZkZDBG?=
 =?utf-8?B?R1pYdmJ3MXF5MkNPQTN2QVZwUy9rTHdkdVVkcWtTTjNjM0dHRXBKcXptRW5t?=
 =?utf-8?B?T096Z0pCVStKdTZYUk1JejZMWmpVU2s1Wk5rZ0VxYkNrMkpIRDFhZnV0aEtk?=
 =?utf-8?B?R1dZWGRSaEczYXl3cmxwRGRBeVBSTUpxa20wcmlNempGL3JOYnFLcngzYjd6?=
 =?utf-8?B?cDJHM2pZdm5zK0FrT0tBL1ZsdnF3RnphajdqRktHR0R4R25uSkNPZGhUZy9r?=
 =?utf-8?B?d3lHRlV4UnZqaDNyR2FuZFhZSVo3Z3dmdEN0VzY0SU91WjFzL0JDNWhDNlo3?=
 =?utf-8?B?emtLOFZLSVhIemJJVVhXRkFmcU1TQ29JdFBFRGduQVRwNjY1SUJPL1Q5VEF1?=
 =?utf-8?B?aXVPdjhOZko2Y3IyblQrQWdCLzB6Y1NZRU5KNnY2cXgyaXhvOHBVbVQ2aUZp?=
 =?utf-8?B?UXkrYnd4d0dkRmVBT016TTZ0dnU2ckdCSCtZU2xHU0JUUWlJYjBCNmhQS0U5?=
 =?utf-8?B?dkJ5NW00bkZEamFNYjE3RXZSQnoyQnN5QU9jTHhtbmxaVC9oaHY5dlJTckRr?=
 =?utf-8?B?OTFLWnNmQm5IdkF4N2xtU3REb0lkLytvYVZxWkNXYVZCd21HbGttUDhtZ2N1?=
 =?utf-8?B?NFM1Q1lMTzZLUEVDQjY2b0xNaUVxZXhSKzBlOC9uNUQwMHdoVGhyVDZoc0Jv?=
 =?utf-8?B?SUxibjE4WExGay9PSlcydUdXUUh2Qkh3YVFvOFJvM0wydnJDY0RPNkdFb3A4?=
 =?utf-8?B?VjFNZHlYMmVRc2RqSVA0VGFLMDEvMG9UZy90Q0ptMlJJRTJTU3lXQ1p3M1Nm?=
 =?utf-8?B?QTdQNVgzZmVjZlFWY1o0b0luall6a1BveHRXTFVCeDlFZGpDSGNoN0lBaUlt?=
 =?utf-8?B?SUFRcU1nYTZWMUtVYWVsWXdrR1YyOXIyYlg0L1Z6cUV3RDM1NUdIMEY3WXdK?=
 =?utf-8?B?bHRSRStSWjFUbERwaGVvRGJJTTcxNGpkYi9RQkwraXdTekUxOHhLTDFyejBq?=
 =?utf-8?B?amM1SXl3eHNtcERhbzgzWWlnR25jZTd6cFB1SjJqQlEvOWlLaklPemhyNUUr?=
 =?utf-8?B?cnhnQjR5MXZwdGQyakZDUkNDVTQ1Z2ZJUXhqTkxtT2wyUzEwbTVFdDlWbFJK?=
 =?utf-8?B?OHRrdnNOWEVMdWZnNXREYlB5WndJSTVMb2RscHkwU3FUbkRnNHdoTVk5ZjZU?=
 =?utf-8?B?bEwzbHQxT3ZJL1YxMFhUS0h4WWZMRTVHYXdlV0tmSmMzMnUwNzdPNVFkVTk2?=
 =?utf-8?B?YjhsYkpMTW80Z1hrSjJGRHh6dkhnOFFORzFoS0hUTm8wYmRZUjFnLzFXT3ZV?=
 =?utf-8?Q?GqJM6AOpY3xnLcogKR3nlQ9Nj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8c1e2d-788c-4de8-b591-08db73ba73c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 07:21:24.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ3APBcu2YSM/eDin7onOz3AbNEoO/vczjnUPY/KUOxSjkLGcqRZWOpjUXd9zJviehCdJmHu4rtNswA20Vj+gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9113

On 22.06.2023 22:57, Shawn Anastasio wrote:
> On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
> including an early serial console are provided by Open Firmware.
> Implement the required interfaces to call into Open Firmware and write
> to the serial console.
> 
> Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
> 64-bit Little Endian mode, a thunk is required to save/restore
> any potentially-clobbered registers as well as to perform the
> required endianness switch. Thankfully, linux already has such
> a routine, which was imported into ppc64/of-call.S.
> 
> Support for bare metal (PowerNV) will be implemented in a future
> patch.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Just two minor remarks; I can't really review most of this for
lack of knowledge.

> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -1,4 +1,6 @@
>  obj-$(CONFIG_PPC64) += ppc64/
> +obj-y += boot-of.init.o
> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-y += setup.o

While you've followed Julien's earlier comment partly, I think,
sorting still isn't alphabetical. If you mean ppc64/ to
explicitly be first, you will want to introduce a separating
blank line.

> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/of-call.S
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Adapted from Linux's arch/powerpc/kernel/entry_64.S, with the
> + * following copyright notice:
> + *
> + *  PowerPC version
> + *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
> + *  Rewritten by Cort Dougan (cort@cs.nmt.edu) for PReP
> + *    Copyright (C) 1996 Cort Dougan <cort@cs.nmt.edu>
> + *  Adapted for Power Macintosh by Paul Mackerras.
> + *  Low-level exception handlers and MMU support
> + *  rewritten by Paul Mackerras.
> + *    Copyright (C) 1996 Paul Mackerras.
> + *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
> + */
> +
> +#include <asm/asm-offsets.h>
> +#include <asm/asm-defns.h>
> +#include <asm/msr.h>
> +
> +/* size of minimum stack frame that can hold an entire cpu_user_regs struct */
> +#define STACK_SWITCH_FRAME_SIZE (UREGS_sizeof + STACK_FRAME_OVERHEAD)
> +
> +    .section .init.text, "ax", @progbits
> +
> +ENTRY(enter_of)
> +    mflr %r0
> +    std %r0, 16(%r1)
> +    stdu %r1,-STACK_SWITCH_FRAME_SIZE(%r1) /* Save SP and create stack space */
> +
> +    /*
> +     * Because PROM is running in 32b mode, it clobbers the high order half
> +     * of all registers that it saves.  We therefore save those registers
> +     * PROM might touch to the stack.  (%r0, %r3-%r13 are caller saved)
> +     */
> +    SAVE_GPR(2, %r1)
> +    SAVE_GPR(13, %r1)
> +    SAVE_NVGPRS(%r1)
> +    mfcr %r10
> +    mfmsr %r11
> +    std %r10, UREGS_cr(%r1)
> +    std %r11, UREGS_msr(%r1)
> +
> +    /* Put PROM address in SRR0 */
> +    mtsrr0 %r4
> +
> +    /* Setup our trampoline return addr in LR */
> +    bcl 20, 31,.+4
> +0:  mflr %r4
> +    addi %r4, %r4,(1f - 0b)
> +    mtlr %r4
> +
> +    /* Prepare a 32-bit mode big endian MSR */
> +    LOAD_IMM64(%r12, MSR_SF | MSR_LE)
> +    andc %r11, %r11, %r12
> +    mtsrr1 %r11
> +    rfid

I think readability would improve if you reserved a minimum number
of characters (6?) for the mnemonics, padding with blanks when
they're shorter. (This, if you'd be willing to switch, would then
also apply to patch 1, iirc.)

Jan

