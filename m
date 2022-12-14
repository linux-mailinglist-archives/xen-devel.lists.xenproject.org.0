Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A81064C76F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:51:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462063.720228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PMP-0005M9-MP; Wed, 14 Dec 2022 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462063.720228; Wed, 14 Dec 2022 10:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PMP-0005J8-JR; Wed, 14 Dec 2022 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 462063;
 Wed, 14 Dec 2022 10:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5PMO-0005J2-Dv
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 10:51:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 470ae627-7b9d-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 11:51:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8971.eurprd04.prod.outlook.com (2603:10a6:20b:40a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 10:51:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 10:51:33 +0000
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
X-Inumbo-ID: 470ae627-7b9d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVklUqsLtCG68hSL1MazJ4CrNzU0ParRIbL2sJW1xDv6SZvN+nBY0TrsMRn4gyGOxrG02KcO76ZnjvVW9ixkGNDT7v7pj2hV8bwbV6fDNJj69rsRN+Eff8vdKytmRkrhZ2guQ5LFdNpxRcL4lkw6gElk1XXrww4phwTXJFpvZniaxDxgGNAbfgMFLgMPItCIDJMB2dkjEemL9JRagY93eKL84hf7UPINpSzIW262PL/UmQu48oaEn7v74Ls65+DclyiqTVBcAuJKHR3uldzgyjqgZOXycmGbamLuS9t5XmTBzJywxpfxpu1IHAr0v6u6i5k0RDErfMfyAX9PLPgs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76LIOYxzyYWLY++n6bI0Ju/ckTO2RIiiredNjz4AO6M=;
 b=hoj+KH7YCQZYjkoDQjvYfJaHb6qFyOp1pB7xeJkTg9oDfj6gBlAUJUNJxOfLPjYUuiyoIvh98SHqGTUj2fV4rp58yyC/ZRrwdBf34ghAygkfLshDNNSuYDWtcykrj0M7nUIRsQ45mdRL7tDCJnQ6uA7aidnv9rE9+ih/be4i7J8v4Bfh8M0JRCcWHnSkFGL0vBvPSswemWbnZ429Oz1vDhhMhwk5Vgtb2zR3GCkL5I0gh/3m1MKdJ8nF2eU/qLzmFOGGkLi6fI5ImNTPyEdB9mNRZfOHY0aYAlisiVzr+CiUWBVZWClg1yZCUXXgG5h0aB08pnDpxjy0wKDJbfZnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76LIOYxzyYWLY++n6bI0Ju/ckTO2RIiiredNjz4AO6M=;
 b=oVFdcz0i/S35kfyXcGohFcWt2Og6MivCMyTQ6q7j84XQvTiOZzj6cYGbEILeQDJ623GjWzd2VlrJ+Szkc6J/+xc2oFX7aFeOt/dlUJMQRKL/7HgY5NzrsELMFGj3LYu0WHKIFSto5B9kpeoeS5Gv9GpkMye3/LfruYfU4pVXpbsW4gUPYNgEY69Muto52Wgx8ORiDXnTDVPf/lzZhzP4Uur4KaX71QWE1PIbyueUm+mqfCT5XtgU55qJfC7RiwlMFHWg/SCFwQ/HxUJWaVwkHqRf2gaWXSp1o7fmx1WI9QmfkIN3geamRb3wcILcd5KP28cpq1rzEcFTW65Lu5ws+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f447c631-720d-0ac0-2f26-21fee800b948@suse.com>
Date: Wed, 14 Dec 2022 11:51:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 2/3] drivers/char: search all buses for xhci
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.932f486c1b08268190342f8918b09fa6a7c3f149.1670724490.git-series.marmarek@invisiblethingslab.com>
 <34d3e4e4067b86183e6d834c8bc93736f058fe19.1670724490.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <34d3e4e4067b86183e6d834c8bc93736f058fe19.1670724490.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 299e5fa3-8f2d-4d31-91b0-08daddc12a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	orPRKE7n9waqPx0x9vCDkM3WztT5noP4lz1oc/1gO5Mk2XQBmnvV8H3tMcNd97NfLMTLdd9QTU4TK2QVMix3GTP1rOGrBa6SlEjMuomdnic1ql0yMvWmdjvQBzw2nMCne/4149XlOi91ypoH1ZHBGmeHRadeI0oVYW0/XYYH8CALOm+95FYC3dANtqrEKeqLqPg/qoLnlH1ZWrR8ckajRb/gsCXXh7B5+8Z/O9R1GVUnJMqv7NxNVu+QYNfzaAhs2HGLmmNv6s4Gfjnucmtt0t75Nd/upMGrZj3QuUB+6HnK3yGdYC1yztm8b/yFzlrrroqb+51qHrrBh1OchxF4BcIjFIB33Lgns3C+hh23sEhy4D4FR/hXEzgrrnkcNBz2AVVkLFg4xZMptAOB7JIhD4vKETiu4h/A7x/b1jioE7OVZCLQxlsL+t6H0C78fBk6KFCB6UuGqXc0ihYWW7mGd70kERZWIVwDQ+n051Hqlw6Ww700byF9TNkFMwRX2W5Ke3qJho1xLfPL48QOX4vi3guUZG3CWKRWUxUrJD8Nbg2fpxkeocuoA6wbIyTRuxHXocKXws8eaXtado/7L17JMyD6XPF4KzCkKLbuJNa2wjfLGaO0tB7SUlUbOv6zhlyB/UGnWvqafmQqztwNonLEJscGNxlNNlyFzie7t21dsIOJurhm54DBfyi5u09VbBvkBRarY8fZir6oLXuRH9gIR/Y+3a/OsMqFLtZyPv2fjyc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(36756003)(6506007)(86362001)(31696002)(41300700001)(478600001)(53546011)(6486002)(38100700002)(66574015)(31686004)(66946007)(66476007)(83380400001)(66556008)(8676002)(6916009)(316002)(5660300002)(54906003)(4326008)(26005)(186003)(6512007)(8936002)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEdoVVRJQVFWR3ZhbnVUditTMU9XNmhMc3pBMWhNNXA3UC9HalBsMFFWWjQ2?=
 =?utf-8?B?clBWL2V0Mk1manNyVThLdVVTRjJoMEthWHdhVWtzdFFhZmcxc0MrYVNhU1NY?=
 =?utf-8?B?b243bXFIUytQeENPVnM3aURnZWg3QjZqMGdaMGtRMjBzRlZqYy9vaXZKWEJH?=
 =?utf-8?B?QWV6ckhDdENjZytCUFNlZHVaQjdZYVNnUXczSFpQOU5nSzlGWkptSWVFVlZ1?=
 =?utf-8?B?OTR1QlpTUmROZ2Q5TTk0QWlkUEx5UmJ3a0xoZ3E0TlpxZ01JR1pmb2ZiWGNv?=
 =?utf-8?B?bUlETmpKcnNxaTJMUEFnZEFEeEd4YXRRS0ZNNDgzMnc3YTVkVG1GU0tXQkdX?=
 =?utf-8?B?V3puWEFvYUJZVXhMa0ZmZjVKLytwVzZIVkkxZUxIeUJxamM5WmREYjRzUmJ6?=
 =?utf-8?B?amYyVllZdHg4anR4Q1VMdzd0eFluNDVUZmpwT1N6emVFMjB2ejFsY1kxYktl?=
 =?utf-8?B?RXVEbWtjeXg1OWxZZkpUNEsySmFHZEtnR3N5eUtGWVBtTHJSZk90VlRXZzVH?=
 =?utf-8?B?dGUzM0pxZDRvL1JuYkFKNE10TXo3eXN2VHAxenlUcnNSeTV2akZTc3YzOTZT?=
 =?utf-8?B?YTYxd2FUcHFtTlF3Y3g3cUc4L1JEWHdFL0orNUJWZGJuc0dzUVhUc1pkWW9D?=
 =?utf-8?B?c0JFM1IyOCtZYzN2a3JnaGdQQnBiUnBuUm1aNmthZjVCZ0xRQ0krSkxRYllq?=
 =?utf-8?B?M21LbGFMYi9UcnRLbVpiSTlzWFpXZ2p0YUlKWC81M2VYTy9xMVFQTUZITmRQ?=
 =?utf-8?B?OERnT014V29qMi9lVk5wNDB4SHJtc2x6cjl6YVpGNEJsS2ZxblZKV1kzSHkv?=
 =?utf-8?B?c3RoS0tRMGt4Y3JjNC9TRW5Rc0VXOXNVeUVtbDdtNUI2OS9RWWpXcHhIMW9n?=
 =?utf-8?B?VGIzOWtxbVNuTGE2amVsdDF3Q01uaml6OWFYVnl3MzlYK2hxOGs4L05UcFNz?=
 =?utf-8?B?NVRwOGRwQitBRisvMHpFalBoVDBabW5ZS3Z3b0pTcnpPS2JBR1lUZWxTVjhE?=
 =?utf-8?B?L1Bmbi93Rk1xNm9xMHhKRlYzKzc2UmNlZlNQcmF1b09vUW9qUVBFZEI5OTZS?=
 =?utf-8?B?bEFkNkpHNzI5NmQ5T1pxZTFzbE5aTzFzUGRMU1I2RzU2MW41YU13Zy9BK0tT?=
 =?utf-8?B?R3ZUTllQWFJxaDRydjNvSkxkSkpITkVlWEgxanBUKzZPR3lnRlZlSmpTeGZt?=
 =?utf-8?B?c1liZDRVSnhFOTlKUlMwTVZtVVNpbHNrbWs3VXJhWWRObjVDaGY3TTk3ZHdB?=
 =?utf-8?B?bDdCZGI2cWlpWWZ5OThVTnZDaU0zZ2dFMGdQb2h0QUN6dXQrQVNUNFlkeVBD?=
 =?utf-8?B?Q1hRd3E2dEVyY3R5ZXlLd1Q2bVUweXUzdGE0aUlPUU5TUDd2ZlpmNGdBL1hy?=
 =?utf-8?B?ZDA0ZnZnYzQ2YVk2eHhCd1NrSE5wRFRZb1VxTzVLdjJ0RzhtL0c4RmJpUkxQ?=
 =?utf-8?B?QkZGZVVhNXhMeDFJQ2ViSnZXa2xHbUlyUEJFVzlxbG9IWVJmL1ZsTUV2YStj?=
 =?utf-8?B?aFdXeU9Vc2FERkNkL3gveUQxWjdhaUZUNzFRNDJWb0ZyTzBjeGF1MnpjT3dm?=
 =?utf-8?B?N2YwOXBORVZwclhkQTVvaDJnTWJKME45Qkkzd0JMZEJMRi9FelJ2Y3J2UXIz?=
 =?utf-8?B?aUw4VDhIQmF6dnBDb2Z0WitTVkdnNzMvK0MvV3dydXJ1Y05CSENSNHpmQkJh?=
 =?utf-8?B?SEM4REJSZUd4UEx0Qk1kSkw4c1Y0Ykx1b0Y0T1dHbEFYVEk3NTFWdVVNazVB?=
 =?utf-8?B?VnV1TWtqeGowWGFEcVhHVHRKQzRRVnRaS3I4VGp3aEVDUU5QOUNLdUtLQ1Uz?=
 =?utf-8?B?MkhuZStpMjF1bHV5MTFSUXRSMnpHeVR5LzVadTBIZERIeVo3TG5DL29RVWJ1?=
 =?utf-8?B?bkpBMndCQXVHUWZKYTlnWU5SSkVYckVsY21BdHhZTmNLMTZCR0ZWTDhnQXZk?=
 =?utf-8?B?UTI4c0IrN1pycXZTdlNDZzJjWCt3MldWNllPb3paQTQwYVpwRjl0ZThwLzNJ?=
 =?utf-8?B?RFo1VS80LzBGeE8wR2NMakZGOUpRWTBYalB3VnR4R0NnVEZuZFFaQ0UvVHpW?=
 =?utf-8?B?d0JtUlZYTFJ3aUIwTHRlalBpQ2dIQlBMYStWbUpvR2VKdzNNUlMzUzQycTJl?=
 =?utf-8?Q?TDeh9eSj8jVPnQGg9f2aPPgw0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299e5fa3-8f2d-4d31-91b0-08daddc12a3b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 10:51:33.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm5LfVCEqQkab6L4b8gG1qlh0mLn9UZnaa83I4xmS/dQnbx/0goZqMqYKKxKNSTapgfGUmMfQPFc5+tP/MqxkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971

On 11.12.2022 03:10, Marek Marczykowski-Górecki wrote:
> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -286,39 +286,87 @@ static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
>      return fix_to_virt(FIX_XHCI_END);
>  }
>  
> +static void xhci_bios_handoff(struct dbc *dbc)
> +{
> +    const uint32_t __iomem *xcap;
> +    uint32_t xcap_val;
> +    uint32_t next;
> +    uint32_t id = 0;
> +    const void __iomem *mmio = dbc->xhc_mmio;
> +    const uint32_t __iomem *hccp1 = mmio + 0x10;
> +    const uint32_t LEGACY_ID = 0x1;
> +    int ttl = 48;
> +    int timeout = 10000;
> +
> +    xcap = mmio;
> +    /*
> +     * This is initially an offset to the first capability. All the offsets
> +     * (both in HCCP1 and then next capability pointer) are dword-based.
> +     */
> +    next = (readl(hccp1) & 0xFFFF0000) >> 16;
> +
> +    while ( id != LEGACY_ID && next && ttl-- )
> +    {
> +        xcap += next;
> +        xcap_val = readl(xcap);
> +        id = xcap_val & 0xFF;
> +        next = (xcap_val & 0xFF00) >> 8;
> +    }
> +
> +    if ( id != LEGACY_ID )
> +        return;
> +
> +    xcap_val = readl(xcap);
> +#define XHCI_HC_BIOS_OWNED (1U << 16)
> +#define XHCI_HC_OS_OWNED (1U << 24)
> +    if (xcap_val & XHCI_HC_BIOS_OWNED) {
> +        dbc_error("bios owned\n");
> +        writeb(1, (uint8_t*)xcap + 3);
> +        while ((readl(xcap) & (XHCI_HC_BIOS_OWNED | XHCI_HC_OS_OWNED)) != XHCI_HC_OS_OWNED)
> +        {
> +            cpu_relax();
> +            if (!--timeout)
> +                break;
> +        }
> +        if (!timeout)
> +            dbc_error("handoff timeout\n");
> +        xcap_val = readl(xcap + 1);
> +        xcap_val &= ((0x7 << 1) + (0xff << 5) + (0x7 << 17)); // XHCI_LEGACY_DISABLE_SMI
> +        xcap_val |= (0x7 << 29); // XHCI_LEGACY_SMI_EVENTS
> +        writel(xcap_val, xcap + 1);
> +    }
> +}
> +

Unused new function (introducing a build failure at this point of the series)?

>  static bool __init dbc_init_xhc(struct dbc *dbc)
>  {
>      uint32_t bar0;
>      uint64_t bar1;
>      uint64_t bar_val;
>      uint64_t bar_size;
> -    uint64_t devfn;
> +    unsigned int bus, devfn;
>      uint16_t cmd;
>      size_t xhc_mmio_size;
>  
>      if ( dbc->sbdf.sbdf == 0 )
>      {
> -        /*
> -         * Search PCI bus 0 for the xHC. All the host controllers supported so
> -         * far are part of the chipset and are on bus 0.
> -         */
> -        for ( devfn = 0; devfn < 256; devfn++ )
> -        {
> -            pci_sbdf_t sbdf = PCI_SBDF(0, 0, devfn);
> -            uint8_t hdr = pci_conf_read8(sbdf, PCI_HEADER_TYPE);
> -
> -            if ( hdr == 0 || hdr == 0x80 )
> +        for ( bus = 0; bus < 0x100; bus++ )

Hex here and ...

> +            for ( devfn = 0; devfn < 256; devfn++ )

... dec here looks odd. Now that you want to fully iterate segment 0,
may I suggest to move the function closer to ehci-dbgp.c:find_dbgp(),
making use of pci_device_detect() and iterating over busses, slots,
and functions separately?

Jan

