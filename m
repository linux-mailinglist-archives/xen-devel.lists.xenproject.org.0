Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297CC75F537
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568815.888856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtqz-0003FF-Ud; Mon, 24 Jul 2023 11:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568815.888856; Mon, 24 Jul 2023 11:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtqz-0003CO-Qu; Mon, 24 Jul 2023 11:35:53 +0000
Received: by outflank-mailman (input) for mailman id 568815;
 Mon, 24 Jul 2023 11:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNtqx-0003CE-RU
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:35:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3da005f9-2a16-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:35:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8828.eurprd04.prod.outlook.com (2603:10a6:20b:40b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 11:35:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 11:35:48 +0000
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
X-Inumbo-ID: 3da005f9-2a16-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS+qhRa1z7Wuaz4sbnhHQjnJeJEFnxr4SZLJC1sUP/mFwsAC8hx231j8z8M1fLizvxf56LVrP7u8Lmur8Or1iKfsgOEWGzoXH43hSbVkyvTbIC160cy/UL+vV7S0xzEoYmOeu63Em2LrsTd0V/H1DOKw0pK819bVTBAB6c1YY+dST0IVmswIVXqSyfYTjaDf8rfggzVFfwS7LABNEXF50hBRFD62Dh6R9OxY5E74XjylBzC7gfDZf2CwxG59pfqYbArGYe7OFn+cFg/+jXjuziFHgcj2UwKL2zUF9EY7reYHhoM95ZXGr6RXWMcPQ1BQraAkwSyHpgJ2bfvh9BkJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LrX9uyBmCeBB48YcEAKjAYONyqob2RuDkUInzMw1MU=;
 b=Xvs4W44Eb008/nx1gdqCYBr1meX4GGSlY5pBfE9GZmlCMElH2RMLQNHJKmmO1DmBtXvQ7eynEmubudNc3PpSjMvMD5yyDN+1BRCKGwnDv/Yc/WaSfdh6WiG/5qiXoYxPQ7Y9YQaxkEa2cpCl3/yndNvbQ2lIxAoheRKqqPzs/6j/dyUsoUQbE7TftUBeTMt2m0GxQGJ//1hOI/iUy3LO5YJVS9mky1S2gXHrGZ0BieIcIYTRoJea5VhdMkF1/ulgUy+yWAVZPc8Cv7z+V3OmE1S4YpRgV7R7Tl9JOds54QAilrE8DeyLet+5/rZUanxieI94UB54RTCvwB3zL2vrsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LrX9uyBmCeBB48YcEAKjAYONyqob2RuDkUInzMw1MU=;
 b=SDZKHsk2nxhV28Vq1b0FVrqujHYXpFVGTKVrrenTzKOsYZ4MVRBL24gB7nJE6RNGam8sZkn/TEnqIhpEp59wya7poreCx5ljC/ChctPdWA8Gg7FCnxQdXbtclQY+6Jh3c8XVU0XhYMKT8SICe1xa8KhNZKjamVRJIMbGU1WbWzuZrt7X4jiOh4Z3eAVBLFEr5YGAEWJFeu9d9pYdglAgAwxCgtaMoAigzsgBB5e+4ILXtlBG5uEK0DX+ryWi7U73xHhHW8Xopx2BEN/QMLjmqDGOo8/LlTkCbaJ+Zb+ZUGu18vTU5XcaIkSE88+LLRS1jMRcQEhd2+VAhyZFK94A+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ae78f2b-2cc6-1810-4384-feadc295fa81@suse.com>
Date: Mon, 24 Jul 2023 13:35:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <f326168638ae05f5f387e4fa018ac2ed057bac8c.1689958538.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f326168638ae05f5f387e4fa018ac2ed057bac8c.1689958538.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a19d6c2-48b7-4225-bfd0-08db8c3a208e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	avtHxGqYxKpTRc5Yav0ZfBd231mobYHnbt4RoWZQH2y74BPwhWzYZ83TOs3nIwYMd8xu8HYb65MUsS1akzg5ZX/0ROyYz01nK2ypC2ZZddFYwYL9LLG9IpAbTvowCRw54c8rZpsn5eCYRWMwOYkFsd3F2RzJczfkdehSS+cDoYUxRZoNJbVlwUaMissNXEaWITHX2w/qSWUQlkUWlrjYdvKw+96J9SqgbgST2BymU0tXMF6dBA1FhJFbjSLRqBvLr7DJODKRltPrK6jatpyzpuhOl5KCtu0znO0GiRamtUrcLy4V9prOqsBLqZmhoJfHpEjxuc6npvIlc2FTJGdTdpAEiU1CKMEm+VRADG+NXkW8+aAN4TBIgqI52dVbay3bbZlSgryKesyeji+xbrF8W+Crj86W6D9TaelPso6woOszdGJaH+/KnjnedOVp4VDABcRTOjXRLTqh61zxgKTu/SlELpbfvkAgJamgi3YPwcRVsdWrpC28j5heYZjeOrw8wNB5o9xvj4NLZi3uZEtAh0A78m8HOAy92n2JrXXIUMjHhu3ztoBTvQy2ov4sy/mP8QgauAFiHXgXVYWdLpD2ylesVqa8GJaSq6rYzCjjkOmD+2adlM8Ex6nMC+7o8aiDybYmf6lqbU39GsKQB6f/vQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199021)(83380400001)(38100700002)(36756003)(86362001)(31696002)(54906003)(478600001)(2906002)(186003)(6506007)(26005)(6512007)(6486002)(31686004)(5660300002)(8936002)(8676002)(316002)(41300700001)(66946007)(66476007)(66556008)(6916009)(4326008)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGtPV210YXRDemFkTzdIQ1VxdXExVTFkRU00M3F0ZGxjQkFxQ2Fxamp2OGFF?=
 =?utf-8?B?bng4Y1JDYUxpM3A5VFVGRU41VVpRbXVOUm9LRm50TTExRk5VU1FvOTFzbGxO?=
 =?utf-8?B?UlZDUEY3RlhUSFdLR3hUVWZyTGxsTHlOc05ENU9GbVd5N0RKUllUYXk1NE9D?=
 =?utf-8?B?alRsaXNPb3JUNG40T0xVTmJwMkpSNkRqUENScHdlV2lXMnRHNXpHNDY3MEF6?=
 =?utf-8?B?TXhlelp1V3BpL3JpYVIyeDlLa3Frd2dhNDJQcVc4VEI4OHBZM2lmVG1xUE1s?=
 =?utf-8?B?dzNjdStFaTNrU216NzlRb3VRM1hDS21FYjdxcmVleUNLU2k3ZG1Qa0g3eHFQ?=
 =?utf-8?B?UWpOMnc5UDNEeTU1Wm9JUGxma3VtcEVDbDB3OEdZb2h1RXpobjF5UGRZaEFs?=
 =?utf-8?B?d2VLMVdKc2xhWmYvRHdQRUpUNkZUUUNWNC9LMzFPZEVwQ0hWY2syVVorZWVR?=
 =?utf-8?B?azVQeC9OMTB0UjltVUlyMVpHWUlibG1qTHhMN2JZTmU2cS94U0pHSDIxcVBL?=
 =?utf-8?B?MmJHZ2tQeVNQQ0drdFc2Mi9pSXZYdDNJMHNjbEdWVkh3bThGbm1aa2ZYL1h0?=
 =?utf-8?B?enNwUFR0VkxTRVNiTnJGakNXdHJ0WHEwVXJPblllemN1LzVLd1l1MW9IK2Mr?=
 =?utf-8?B?STB5RlVuUkZ3SkJpY0IzMGw1UzBoRTJWL01Za241TC9qTFpvNDhDby85NGNz?=
 =?utf-8?B?aWZ4b3FDWWVtbHU0TkFjMmc1TytSZFp2S3ptMDF0cVphZWg0cFNHUEQ0UUJR?=
 =?utf-8?B?S0dWOFBNTmlsRUljWTdMWFZJZHJvWWRiSzJueVFlM2V1eWZEbStsU0Ztc1Z2?=
 =?utf-8?B?UDNFMmtVbnBwUEh5OXphSU42Yks5R0NkdEhTUlJBbVFULys4eXYxSTZHM1Qr?=
 =?utf-8?B?VW9ZcTZiNFIxU3o1OGtkajJoTGM1Q0ZGaW9PWEE5SnE3L0c2cFBMclZCYTNx?=
 =?utf-8?B?akYwbklNQXdlcnNtcnlXVUdhUXdHUDM4SXBvclM0N3llbTF3cDdBVFBSVzh6?=
 =?utf-8?B?WVRIQ0p2U29QMEt1NFhRNmNOT1FkTEs4WU9SUVlHMS9tYnBhN0hKWVA3MXJJ?=
 =?utf-8?B?UmxRWEJkWE8yZXpPM0k5Q0FleHZCVGVNRU9WaHNCZmVxcG5CQThoL3BWb1hj?=
 =?utf-8?B?NkhJM0xtUGFqcVR3d2NtSnp3SDdibkhDaitOVWNRZmVpUUJ5VXY2S3Q0dGQv?=
 =?utf-8?B?ZFFZeHd6Nm95eEllMzdzSGpWQXpNcEo2NWlFYXRzRWd0TU9tVnVPK1BhcVRP?=
 =?utf-8?B?c1E3aXA5L0V2VjErNU9xR0J0YXU5NTM5aitxUTZwU2p5RjhySGVERW9YaWhI?=
 =?utf-8?B?SWNmQlNtcGhRdFlOY0R5d08rYWZNTlZCanh1Z1JKTVBrek1ZYXovMVhQSXFh?=
 =?utf-8?B?ZGw5cjZOTm5ySGZ4OUUwYy85Z0ZoM3RWbW8rL0thKzUxZkR4MEJUNGtpKzY1?=
 =?utf-8?B?VGkyeDY5S0VzZnNkRms2bmN1T28yTnFDVjRNNEVYam5IM2U3Mi9nTVpxWU5h?=
 =?utf-8?B?MHlHc2ZhMlF0RlFSUTlNZVlyeUJKMTlMTUdlM3A1Z0g1N3l6MFRsNENEcE9p?=
 =?utf-8?B?VEI1aXFUT3YwODV2NlIwV1FobUlhc1V2alR3cFVxZFFVbUNaREs4TzA2L0cz?=
 =?utf-8?B?N0NqdmV5UTJielp4cVVNQ0MzUnI1YkFQeXFRYjF6TjVBMDZJV052Y0hxYjFs?=
 =?utf-8?B?MDA1SHp5dVFXTktHeHIyS0drMDdHTkdISTBiM2ZCT3JkY0JaaGZzSE0yZDNQ?=
 =?utf-8?B?ekZFNGhkMjhsbW11cGlhV0trMS8zcEJCRnpyUmozaDlwTVFaMFZXUEpzU2xw?=
 =?utf-8?B?a3JqempwOWtTWjhBY0xjcUJZcVJ3ZXhCbHdhd2RtWVNTd2pUZkJzeEpmdVBN?=
 =?utf-8?B?enc0WkwzUngyRStBcEprQm5yUWJOdE9yR296QVJodDUxcnJFK3RPWlBZZmpW?=
 =?utf-8?B?dFBuTnVFbXlOMHAvaXVxZ3ErNExQUkNqdS92bHBCdVJrbjlaKzFmM05jWDdG?=
 =?utf-8?B?dEU3QVlOam9POUxQem9seVRMYVl3alN6bmtMVGQyRE5sTzV1QTVlZldMenAz?=
 =?utf-8?B?UVgzRVVrREVKSEJZYUtnemw5d0I4d29ZdVJlR1dyWnYxUmpwbTMvT0RvUmw1?=
 =?utf-8?Q?hdsM64hjx+q/bd0CmZcUKDS3p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a19d6c2-48b7-4225-bfd0-08db8c3a208e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 11:35:48.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FF716Q8LVtGVeSk+FU8oZTZ/DYP7eYTvyHw7MdI5DH5gXIFGpLkQkqkTwUkWf2dmRluZE5bImSYGasrnyy9qkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8828

On 21.07.2023 19:02, Shawn Anastasio wrote:
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

Acked-by: Jan Beulich <jbeulich@suse.com>
with the same remark as for patch 2, plus ...

> --- a/xen/arch/ppc/include/asm/asm-defns.h
> +++ b/xen/arch/ppc/include/asm/asm-defns.h
> @@ -37,4 +37,21 @@
>      .long 0xa6037b7d; /* mtsrr1 r11                         */                 \
>      .long 0x2400004c  /* rfid                               */
>  
> +
> +/* Taken from Linux kernel source (arch/powerpc/boot/crt0.S) */

... the introduction of a double blank line here dropped (which I'll
take care of while committing).

Jan

