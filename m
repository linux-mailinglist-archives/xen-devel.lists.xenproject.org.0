Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9387AD027
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 08:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607599.945834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkf4H-0000dX-TU; Mon, 25 Sep 2023 06:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607599.945834; Mon, 25 Sep 2023 06:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkf4H-0000bA-Ql; Mon, 25 Sep 2023 06:27:41 +0000
Received: by outflank-mailman (input) for mailman id 607599;
 Mon, 25 Sep 2023 06:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkf4G-0000b4-Jv
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 06:27:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9da6adcc-5b6c-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 08:27:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9590.eurprd04.prod.outlook.com (2603:10a6:102:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 06:27:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:27:33 +0000
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
X-Inumbo-ID: 9da6adcc-5b6c-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR+BfpqrA+uxwcDHtTbKzou6eMvPgcR95Hk4/GN2pwWNe3HRy90/PJoaKXO38sM4/JBAJcVw3H9GSt0vBghZrXmBD0vqkpzqgFUMOHExLHsAvI3LfjbVGl1LOFiogASv/n+e1nZuABRZ8JZQ3AV4tYi9ETYUlvOZFKXuLN6sI8nMQpLYLZYc3Bpu2SZPX6koWb0h1Jz06FH7nJqSd1R5vLPb3RGkPd0Sy3xjTCfsGqs0GV9kTkmFG00WayHTxc17Q/IhTI34LPbcCcPBw+SsWokbYwUHOiaPrmCQpVJt2F41EYv7mOSM8lMa7PHnGSHUgqPrzezFGCfcF9BibeC8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvuiRjexU03dbnKbKOVxRvKyg68cezPlfdqLGdKR/AQ=;
 b=eaac23IxC+9hZmcM6/dcgl2tCPF3R9VlCDGCj/HXitA7opyYnH+N2h2o/otWeu1DqdVXbBjtfczokxPMer6UYfDV2N/LpDUzAipgNgQAErwyuZ4PBKg30xN7Gd4yU36/lfqnEB3TdjlTaEBIVoNszgWSyYLL1AHoArlhNoLiCEApavS+wd8GR4RCxpBglwTNLSYpLPs5c+ty4hlWV68rLcD8tPiG6KitTAHROLTReeIfbLAV+fqSmltMfsHkgHSXJKGpnaRUQEJFv8z0MeY81YbIQY59+6JVoyaA+/W1CS30iF2/jgxiZHy2LOqJXknJTArd9KjAhVdephwGFLc3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvuiRjexU03dbnKbKOVxRvKyg68cezPlfdqLGdKR/AQ=;
 b=XAS///hNxKfwHtaqJ6bnQeB2YCp/My2w7O1K0m2CO/tf6ZW2xIo6DxIMeUMbL0G/izzm6UCCsa1MDfggTxx2PsRYM3UoHD6vsTkT3WUs0JZH7Fxf6jayKh3Ua/QbBrQ0QbyZFPUlFdrpUby5L/5GfTHxOtxnDEECW3g71yWwTouGxAdZgGVluEbyD/upMd97XAkZr+m48kcFgmvQzFTJKyDequByVbGwqhfZB5nA53d4E72moT61HgQaDR1M4Fput5JBKOB0XKYzGcwacZZOAIsG5BLaLkbKPWCEcBtTUXMF7OgWJgAVeWcfqD18EHokJJbKQLqM67lJO6em9x48fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9966ac8-dfc6-b6c4-bf61-05a8b61f9ac3@suse.com>
Date: Mon, 25 Sep 2023 08:27:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH WIP] xen/public: move incomplete type definitions to xen.h
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <7a880e33ff91d0c76986159e3559c56ee6894d21.1695324653.git.ehem+xen@m5p.com>
 <7aaf91c7-6330-fffc-8df6-4be4b531f456@suse.com>
 <ZQ21//HP/d2Ppdrh@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQ21//HP/d2Ppdrh@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 9151b42a-fb17-41ca-af26-08dbbd90804d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4bksDDkYypJ1RdRm2G9cQEnbh6mz6nx9NQZnhpyogjx6IZ05kNv2rfY+iRyZ3xxy58FoHL7ILV713Ys0rknaSF91tQRsAp8Pw6QqY5epblYGq8/tS6NySTlidOOh0GohaXF6U9cJGP47GewsM387I9SpjJZMjkFXfCTC/z1TkzzwhLoSV19TXRMPTrCQiAo/br+DtEi4G/JU/Yy7/yrbL9sszKHXJdSzIfD7RaaY42jtCNUxdlvhHQojn4tv53sN7Jx/PwAPLYDiJNyLn16z+VMGBPY54lKS+2PskPk5boRksgICJmdHLNAHbaNgn3ZbdKJ/MMY7+I6Bv20hCz4r0JJZZGwKk/0JsSbPOHktUQf7+Oa6P3ViiAd9TxzDEV+u0CPQ2g0mR7wuRqPfyPCq9zcbeP9tPDTNCp7ba1b3sVBzvBe4cQVJ/k7XEMXa01U5gVhSSXbtvUP/t7VD60C7lX1ZwOufmsPYQ3H8cNoomyeSHfdmzqUBrvFq+cGaOwr4s+eYHnnNOn8jD1Qj+Or1ToXAq44EJ6BBx2xOOIfU8aVlpbBsZw6a6nvuSRo3i6jxBa7T78fbWaKHFo9CZovTbdaB+rTU1xSCxlxqb9wT5F/9ZqeSmOqiG+QNzE5ydY1nzxKOcx22iKlj73tHLXdadQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(54906003)(316002)(41300700001)(31686004)(66556008)(66476007)(66946007)(6512007)(8936002)(8676002)(2906002)(4326008)(478600001)(26005)(5660300002)(6486002)(6506007)(38100700002)(53546011)(36756003)(2616005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2RhaWZzVSsyKzRkS3FoN2doZXJ5dFd6azNOZ1hIR2RGNGxMNFQrd2l6TGZ2?=
 =?utf-8?B?dWRwdWNCdnlpamd1dEs4bFJseXdhUWM5YzFHcDl3NjIyalBZNW9Jc1ZsRUJy?=
 =?utf-8?B?L240d3RmYjJJS3ByN28vcXl5a0VBdFZLeHA2bXU5SjFvVUc5Q2Urd1lwUFdU?=
 =?utf-8?B?N2F6ZDI5MTFKUUxqVG8zeFRjNEdHUmR6UlN1V1lTc2ZNR3VCMjhlVys2L2hL?=
 =?utf-8?B?WVV1UWtLam9HdUZ6V3poZURUYW53S3V0cWRiaXZNU3VycjdXZGR5NEczbmJB?=
 =?utf-8?B?Q2FkZm0xV3docHJVSmZCZ2pGdmROcTQxb1hSN2xGd2JPRXEwb1ZTV2c0ODNv?=
 =?utf-8?B?RXlWRXE2SkY2Z1dLbndUQWRKOUwvaTBab0lVTXNRR1lGQmg2c1ViR3p6Wmdx?=
 =?utf-8?B?dllPb2RCbUlPUE5rYkV0QllZK2Y3NWlWZTNSbmNTbUVsWHBTdE96ekRkNmZP?=
 =?utf-8?B?MkpMRndMcm5MK2V6NElBMHF5NmFoQWNHbjM0VWpxV1hJTnlOcm9kQXBpclVV?=
 =?utf-8?B?U3FwSHNOTjREcldKRXNoUVBTZGREb1ByS2xRU0ljRHNHQXdtQ01nT3lMZjJR?=
 =?utf-8?B?ZStxdlpjSEhRRVF4VUN2ZGZwWUMzS2hKVWdRZ3dHYzFoQ0FBNHdZNTBDYTBF?=
 =?utf-8?B?RGdTSEQ1NnZvUks1NGVBbS9tUTRkTFErM0dsOWxKUzBESjZxVTdqYTh5ei9B?=
 =?utf-8?B?MU81dEZDZDdGVHM3T1VyRzRaalZMWlhKYk5KWFFabjJsaWJaRVFjRjVYSlZl?=
 =?utf-8?B?RCtCbnhFd0JJNFdodk5Zem5GMUVKWjdlY0YvSnZnVlZqV29vYkVIMHZxOVVk?=
 =?utf-8?B?WHZBZUVMa2xFRFdEVmZJcm5rQS96UjdGSnVSemZGN0JSYzV0U1Rna3lyOU5s?=
 =?utf-8?B?SVJBVmdVSFkvcDBqdmREdVFqbDNpVk5yOXgzV25lRFZTbFdsNUdJTjU5NEJO?=
 =?utf-8?B?RjBjdkxhSS9sMFNmSytHZTA0bHVzYUl1VkRKRURFaHorTFZkVU5YZUE2RW9U?=
 =?utf-8?B?ZjVvS1ppU2JXWVJoQUdhWitGcko5aGtqbmV6TitFaEpzeU15eWNDbVlFVVYr?=
 =?utf-8?B?KzhGbkwzVjBnUkpQNmtLZldGKy96RnEwRjA4bUdIRE0rTFhST2loQjFNZVdO?=
 =?utf-8?B?TnR4ZU96aERXL0p1eWtFZjMzcm1hWHBDeVBkdTBmd2xpWWp2MmZqTHpBYngx?=
 =?utf-8?B?alErT0Y4d0ZXZ2szb1pIT0VDUmtZTlFLTERrRnF2VkJhOXFkL2QrOURiN2Ry?=
 =?utf-8?B?dytkOCs1MjduVnN2L1pzS2kxQ2JLVkxkdVBQU2YxQzZPQmxiQzlMWVRQZFJu?=
 =?utf-8?B?TWxpc1N0cXgreU44N0plTXZITEZhRjF6K2lmc1kwb2t5ZE5xbmxOM096Y1FV?=
 =?utf-8?B?ZDNuUnUrQnE5MTZrT0pZcW1LZUkzZDExVS95R09sdkM4L0pIZjVLY2MrM1pE?=
 =?utf-8?B?WlRYVkpTR0hPWVRiajdtaGRPT3ZURFM5WUYvMlRVREFNWkhxVWNJUWpyRExI?=
 =?utf-8?B?dVlLREpnSVVMMmZSV0VkOTJEU2VLd3FIZUQ5eThvYmhoOXZzU3B4bFQ4YVZH?=
 =?utf-8?B?UUtrMVpwSzZmQndDOVFqZXJ2MTI5OTF2bm9WcmN5VVFoSmNHRFE5RXhYS0hq?=
 =?utf-8?B?WmJFVGJDeldzakgvZERPa2UrMEE2VjJ2TldYNmQxVzAxenZPVUJBdFhYaXVB?=
 =?utf-8?B?eG5ZcXRTU3c2TWlCWGRKUW1DbjQ4NkVWa3o4TEpXVngwK3E3bWFyYldJb0tO?=
 =?utf-8?B?TldWRWtreFFwYmJNMENBU2g4cFg2SkFGeUNIdmFMU21iVVlCcTB2Z0FLdU1R?=
 =?utf-8?B?cFhVVVk3UlJLMW5mVXNmRzJodmJwNHl3QWlXNUV2eTM5RVNJTFhxYWZuOTJV?=
 =?utf-8?B?QzlVV0h0eGxuWG5vRTV4dlZVNjdka3BPYzRVQmExR3lxR04wVlUwK25XbVRY?=
 =?utf-8?B?b3lQVzd3MzNUeWdRUy8rN00zd0lML295bTNLL3pSdTgrOGZlanJLNFNEaGRB?=
 =?utf-8?B?eWM2eTNlcEdIRTRBZENuTWJOZXcyUVRCTzZ6VHFNaTdKQ29WZEFIU0t0Sldj?=
 =?utf-8?B?UHovcysrTGkrQVJ4MEhwMk9FNFVHMFlXOEFPVUl3aUpLVmNRMXk0R3QzWnRL?=
 =?utf-8?Q?tw7nDFzlu+cxVS1bA0GbVvz87?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9151b42a-fb17-41ca-af26-08dbbd90804d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 06:27:33.0213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oi4i8KdDN/DFGHRRAm0cIoYoK4/6dmUNE9OULnOXoKonby52/wk5hUm5INKU3lyhN1ojhqQehwxbQ2w7Td7dgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9590

On 22.09.2023 17:42, Elliott Mitchell wrote:
> On Fri, Sep 22, 2023 at 10:21:21AM +0200, Jan Beulich wrote:
>> On 21.09.2023 18:18, Elliott Mitchell wrote:
>>>  As such these incomplete definitions should be
>>> in xen.h next to their hypercalls, rather than spread all over.
>>
>> Perhaps s/incomplete definitions/forward declarations/.
>>
>> There's a downside to the movement, though: You now introduce items
>> into the namespace which may be entirely unused. The two contradicting
>> goals need weighing as to their usefulness.
> 
> For the case which this is part of, they're not 100% unused.
> 
>>> trap_info_t is particularly notable since even though the hypercall is
>>> x86-only, the wrapper is likely to be visible to generic source code.
>>
>> Why would it be?
> 
> Related to converting ARM to using inline assembly-language wrappers
> instead of the current declarations+small assembly wrapper function.
> 
> The first step is you split the Linux header
> arch/x86/include/asm/xen/hypercall.h.  The upper portion (the x86
> inline assembly language) remains in arch/x86/include, all the
> HYPERVISOR_*() wrappers go into include/xen/$somewhere.  Several months
> ago I sent a candidate header to implement _hypercall#() for ARM.
> 
> Problem is:
> static inline int
> HYPERVISOR_set_trap_table(struct trap_info *table)
> {
>         return _hypercall1(int, set_trap_table, table);
> }
> Without without `struct trap_info;` somewhere, this fails.
> 
> Now, this isn't used on ARM, but this is tricky to guess.  Someone
> setting this up won't know whether any given function is absent due to
> being legacy and unlikely to ever be on non-x86.  Versus simply not /yet/
> being available on non-x86 (vPCI).
> 
> Perhaps xen/include/public/xen.h should only conditionally #define some
> of the __HYPERVISOR_* constants.  Likely there should be a way to force
> all the hypercall numbers to be available (for linting).  Yet as the
> current Linux header hints, perhaps there should be a way to disable the
> PV constants even on x86.

Downstream consumers of the public headers are free to adjust them to their
needs. The upstream form wants to remain sufficiently generic, which to me
includes not exposing types which aren't relevant for a particular arch.

Jan

