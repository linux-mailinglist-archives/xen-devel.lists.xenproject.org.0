Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0973653ECF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 12:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468459.727563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8JV5-0000ZD-6Y; Thu, 22 Dec 2022 11:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468459.727563; Thu, 22 Dec 2022 11:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8JV5-0000X0-3u; Thu, 22 Dec 2022 11:12:35 +0000
Received: by outflank-mailman (input) for mailman id 468459;
 Thu, 22 Dec 2022 11:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8JV3-0000Ws-NB
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 11:12:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8714bb79-81e9-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 12:12:31 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB6959.eurprd04.prod.outlook.com (2603:10a6:803:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 11:12:28 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 11:12:28 +0000
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
X-Inumbo-ID: 8714bb79-81e9-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz6Etr+C1gixNJbnfm2+5GNG3nUlaNzaTUT38C7oS48yUOmwFzX5Uu/PKp6apTaFd7qHsEiLMwuN9z9rVaxCBjK9+1e1ZN+Lr/828VW6O2hYhXwnqsydDqyOTsSPHmX0mZZVFdDdaULYz5CUKRy6An6goOGSebcjEvydovZjDeuboh53ApNLr/pxHRPs9fuqbnCWr83cY+nBD6G3ufRf0Nz+BC96HKkXNJdMUoeCyoYVsluAEC5ZpB/Dpm/CYdK4LL8pjSw742Oz3fCfspV8io76c1LthQkOzscbwXy8O8L1zMwfkxOa7U3iako+yMfu1kUxssBMDQYWBOc5ntvBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9tNx9krcrbSUoLjDoEo73RJwG9MuDYhjgjM74lhgOw=;
 b=EekVo9LY5JF3HJA5Sz1DXB4hiTzPgjZnxxATUfgAH48OOtDazWbvYB9FDxYGXeLwH4/alZ5sWlBdjfN5dBcFu/faepHH3bQsbO5NU6r7a0n0ffNJQ739KHS6yBS/cLNrOZTjZnUtdUAUSVw293ACbHejIaAtOpwX05UoMqqVb5khRM8KrXvjoszBsHn7ySkGEToe2jAjIOi/1K7STOd69rlWJL86vWS+wH144L8diSKBeCVzOILvcO7GdqOdieBoqNFFXMBiCusNyBBaB36IXM1GPB6Z5jPkVTryOWEcBxYLI1Yt24wEBk7NYjDpykQjKzI6NgSUa2CPkpr6z7be+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9tNx9krcrbSUoLjDoEo73RJwG9MuDYhjgjM74lhgOw=;
 b=CVyXWZGgTiUKprPqs6l7WgCFfQXfANgR7JqebjB/GUm9CNdMDvv/PqBpqTJJhuxh4wr+P8EYAfP5WM1CpyUxGWKipPJqlBKokWJuY22m4hYVC0Wrg5otzPWRz5Qk0HwsTgRUsOmg4u2xQKzEw4r9J6uX2RkQYq5oYHWaxuA7HPYXksDnDKwxiQnxfUVKQJdi1PPod3g2VaHB4oV29yNW9ZmOnP9IUMvbiMNO/EPt2kQ7sLY+pS+M+TyVuIb40QyYL6QHgt+5+l5RH4Z36s2PvCN3ZzviI06lUP7BOVb8/Y4V3eXp8Ll/aHfjC2flw76OsmhV3qNLUEWDmpUqoUoXRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
Date: Thu, 22 Dec 2022 12:12:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-7-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-7-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6ca374-dacb-4bbd-b305-08dae40d69ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	egkVd98frWm8nGn5wnLjgejYrFOSA5hfXbhLZ/+ivaoI+RdVIZvfBXQsx/Nv8KY/BnJBEmx2QwbZoTjcO5TaTJx7gsVTo+D2GdSOEBh8LOmAEW/hKdT/g1W7iiDX0OuUCiBJgvyxmvpfn7ued3fiJtD4O1aLdflQcuxOkkFAeyOZS4oYEIYLPvMkf9eCnLsBff3ROsubR5Wowic8I3j5dZ1WKE0KrKCRIDI6e4tgch/MjDkG8ThaWJA8kItjFWbjxKlolFB7RNdxRDIGLMjLgbZsN92iAiPaYlkn7U16lsOLlA2grMhxeEQpBpjdnqKbXRPEgj5CIztjVNafNwbNfIPklpA/eZoCOauM/wbs8XYplVS0BPCo2/OUsL8ffdctu2K65iPYIGJQ2stY6eU/tn26KpJsplvFyUUsUovRoPBo0YfvnqAKXTmjPwdY8YflEnzXk+T6YucQZL2bvE0ACbHcjwzNvoAgxRVUl8ervbnxVNoFsrYYDPOyNMry0YyqXhOcdrfGXlTVjGj2SUAYXiLc2eFnFIr9QnbsAdSH/ybq6BCOo68+O/pHdBAqXaEy5fusmeKOzdRKEfamKO2H9ajFxld92DzVFpjmwVjsVLR2Wxis6Ub/xrEXzcr6nQYtF5a4A+fBJRPE8d1hBMPKRExz0+cvm6c9bzQ3JB0cisGe5hhRtEelEveJ2MATV7aAU2CofikSj8zLedkgnAAhJU7+IrADkP28WBr6BUkam+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199015)(38100700002)(31686004)(2906002)(86362001)(31696002)(36756003)(41300700001)(316002)(26005)(2616005)(6512007)(186003)(5660300002)(66476007)(8936002)(66946007)(54906003)(8676002)(478600001)(83380400001)(66556008)(4326008)(6916009)(6486002)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2hHN1BrL0hETnFYS09ZS2xKYStJOWR6djFGQ25WZ2NzUXRNSFNCNDRrZGlD?=
 =?utf-8?B?N01mQjdGWlpjRDlJOU9jekcrek9lRk03MWFVMzNvOVBEOE5zUi9OdS9PWVRT?=
 =?utf-8?B?TlRjOUQ2eDB0M3pxZ2VYL05ob3ZRbE82WWFRTS9XOExpbmdnellDcFJ1bExS?=
 =?utf-8?B?bUdUMXlRdG1tODVNQWNaTE5QZDdEUjZLdmhiSU95VE9SbnRKdHdrU0R6SWYx?=
 =?utf-8?B?em84cWVvTFljQm41UE5QUWp1YVpQaExHaHVKZXZTWUlPeUJidVRLd1MxZU5K?=
 =?utf-8?B?RW5hejVYNmUvc1ZtZTRoZ2EwT3k0eWVNTmJtK1JlQitNNkl6aHY2ME1PRnNV?=
 =?utf-8?B?cHh4YmlHOWFXS3hxYjYwSzVFTlZUc0N0c1BwRW90d2x2c0UxOGRIdG0wZ2lR?=
 =?utf-8?B?OXFTRm83aUNnbitkQTlvMTRiamJvS0Uzc0p2ZktoQUlyS2M4bS9EL25sSUJJ?=
 =?utf-8?B?TUdYNkI5c0dNWmVnMElrN3VxVWIvNHlSQmV5QjNTRW11VWhWTjhhcFA1RWhm?=
 =?utf-8?B?NHYxN0ZKUmdEaU1VT1RFWENWQkh0ckNiZTVHd04rUlgwc2dXTTdBTUcwbHQ5?=
 =?utf-8?B?bDN4MktCTGFpVVVtRWsxYmczNGdUbldYeHE2SGgwb3kxZzdSdlBLN2lBbDdQ?=
 =?utf-8?B?RCttaVprck1EUmdwZHNnTjIrcnlsVkZRYXdXeWVMU2kvR256V3RVVHM2cE5B?=
 =?utf-8?B?T3FRYXlsbjFsYjlldVpKbTNaOWlpcm5xaHpRK3dtTVlmcEVuTVRpR1VZM2p0?=
 =?utf-8?B?QlRpa0o3S2NFeEVJelRxUjYzb2FKTHRkSWNFNWE3ZExsR2ZYdmhxMGcrYmtE?=
 =?utf-8?B?SG1CalpzdmtUY0tVWHBkRGRoaEozRWJnYW1Gd1NLbzV1a09kMnJKcHB4MXZi?=
 =?utf-8?B?eU80WEYvV1A2WHpVVHhRWURuc0F1RlVyb1ppVGUzMnVzcENjTUlkZjJPbnhO?=
 =?utf-8?B?eVhoOW5QdmlpeXZaRTRrVzdhSVVBQlhtR0ZldktwNjJyWDVCNlB4YkpXVmhs?=
 =?utf-8?B?ZlN2b203VVA1enJVZXVKamtyb3hmMnhlZHB3RzN5UFpiMHFXaUxEOW5hdmNG?=
 =?utf-8?B?K2NHZ3RibUpDdWd2MlJldE9YaTVtR2hUKzRuaW9NYXZRbnhkMzBIUitlYko1?=
 =?utf-8?B?cWlPQ2JkaEUwRzhZN2VnMFhhVXk3ZE5ua1JVK0VkTHRIRE9JUFFuNW5XQ2NV?=
 =?utf-8?B?bXVwNXVzTE5qNUtyZkVKZjRTTGE2eS9qSGpkM3lCM240b2JhTXlLUENpN0Jh?=
 =?utf-8?B?cVQrUkgzcmd4RFdCWGx4Uno4SkwycFlnWFRZcm1IM3hrZkF3RUpMYThsRHdo?=
 =?utf-8?B?UG5SYnZRWEpic2F1dE9xcXpJclg3clBYV1RlWExKQ3lCMlVCZTQ2cGoyVHcw?=
 =?utf-8?B?Uy80RGVwQ2poc2swNHNiMmx5c0I1b00rQTZsbUpjNm5sSi92WmFuSFdTSUZM?=
 =?utf-8?B?SFptL3I1c1FiaUhpei9HSW4yTmFjM1NZUVhsSEptTnlRa0E0djhFQU1rOWlH?=
 =?utf-8?B?NDd1ZUIzNXBtejhINzM1OVAzclFRV3pNSlNHaGMrZm5rV0M2WmJKZitoSDgy?=
 =?utf-8?B?MEI4SDRrK1ZwWk0wQnlnVWh5eE4zczFLK29RNVVPcmpLSHZrMFVUTHdyUnow?=
 =?utf-8?B?c2huVlRUd0NmdHJCdHpramR2YkpvaTZZVDFKVVA4YWIvV3Y4ektuTFFhZk5n?=
 =?utf-8?B?aG0yR3IwTVROQXRGb0orQk9wcmxYQlJkT2JyQlpMY0tJODZEWjJFV2poWmhB?=
 =?utf-8?B?UDh3MU1XMGVWbndCOWw5T29vTnZ1MTI5QVA1bWdveUlOckpKTENJMFVGTHFY?=
 =?utf-8?B?MlpBSEFoVjRzK3hmSzA3bDZTNTJrNDF4R2xyUGQrTzdiODhHeGlZQUYvc2hB?=
 =?utf-8?B?dTdwTHhOcDk1VHMvZWR5dWpGdjdkKzFoU2FmdjhxV3VRMlZGcWNPT285ZjlM?=
 =?utf-8?B?aTNJVEF0ZTI5NkxGYkh4dEJnSkZScGc4V3dCNDJiU0JUSG81ek9wRVAyZHBH?=
 =?utf-8?B?WktwQ0RFVmx0UTZmdFNmWWtra05iY0RTOWtCT2VyVGR0SzJjVnJFNTdqZU1t?=
 =?utf-8?B?WVBBMHV0RGZYWW0rakd1MUprMm5JazZ6Y2FYRnRUeWV1cXpPUitSbUlRRVVE?=
 =?utf-8?Q?9o4VI9G7PsTpoKlHLEwBFLPpd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6ca374-dacb-4bbd-b305-08dae40d69ab
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:12:28.7414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEa7u1SxUn0M7Hosb2hIatffd6vk4htMWeQr2PgdrsBsyAAAWr6IcAlDzJtQQ8pv8v4glz2KGIjPxo+HThHpnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6959

On 16.12.2022 12:48, Julien Grall wrote:
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -165,7 +165,24 @@ restore_all_guest:
>          and   %rsi, %rdi
>          and   %r9, %rsi
>          add   %rcx, %rdi
> -        add   %rcx, %rsi
> +
> +         /*
> +          * Without a direct map, we have to map first before copying. We only
> +          * need to map the guest root table but not the per-CPU root_pgt,
> +          * because the latter is still a xenheap page.
> +          */
> +        pushq %r9
> +        pushq %rdx
> +        pushq %rax
> +        pushq %rdi
> +        mov   %rsi, %rdi
> +        shr   $PAGE_SHIFT, %rdi
> +        callq map_domain_page
> +        mov   %rax, %rsi
> +        popq  %rdi
> +        /* Stash the pointer for unmapping later. */
> +        pushq %rax
> +
>          mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>          mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>          mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
> @@ -177,6 +194,14 @@ restore_all_guest:
>          sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
>                  ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
>          rep movsq
> +
> +        /* Unmap the page. */
> +        popq  %rdi
> +        callq unmap_domain_page
> +        popq  %rax
> +        popq  %rdx
> +        popq  %r9

While the PUSH/POP are part of what I dislike here, I think this wants
doing differently: Establish a mapping when putting in place a new guest
page table, and use the pointer here. This could be a new per-domain
mapping, to limit its visibility.

Jan

