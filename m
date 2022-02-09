Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3F4AF304
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269165.463175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnBB-0000an-1C; Wed, 09 Feb 2022 13:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269165.463175; Wed, 09 Feb 2022 13:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnBA-0000Yx-Sn; Wed, 09 Feb 2022 13:38:40 +0000
Received: by outflank-mailman (input) for mailman id 269165;
 Wed, 09 Feb 2022 13:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHnBA-0000Yr-4C
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:38:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96906289-89ad-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:38:39 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-hgNoHuLFNY-iIQPZ5IV_uw-1; Wed, 09 Feb 2022 14:38:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7202.eurprd04.prod.outlook.com (2603:10a6:20b:1da::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 13:38:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 13:38:37 +0000
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
X-Inumbo-ID: 96906289-89ad-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644413918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cdxoP0qrEd4fbAQscg9PUIZpavjxZTYZp9nObyNZY1A=;
	b=BVZ8a70hUwaO+8fm3zy5vZo9eCXr4xXL1+8UO+8NdYZKpC4UbEU0PjQ6PRGvj4v1Q5vJy7
	3n+wcPqa7GBJza2xlyr2AsDMKwYEZuI/gQ9qQqi0y9UjAbQnXuLP6DgOUQzxc8VDHjNNw/
	b5vjfdCjWtKYKtSM+vXUHu6p9oL2B6U=
X-MC-Unique: hgNoHuLFNY-iIQPZ5IV_uw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0vx5vM3GauyzPE/qsM+N7ufpud/UzLzlUxVVjyHjhAIBqPQ1iMt14IehazJQphmoEENVw73xjBgiWVMJa0QSnb46paV9Gh/Jlrl9yuiECFRwyAqiRnD081FBkXNBm3P9jUWY1lTtg9hZKBpXIjLamwS2HhJZ8AuJ6u1TMAD0CZ9Pn8qY4mmP9zkbI25moUX46ONIkbjQOBwpBWy/HnmbzJ0f2mryxtBQBaRuQSX9g3ipiNcudsS4E9rVXVBXa3g6CHvR94eJKlYKRER2eRpqILedLdoRzIMiy5icyf6Ywxsg5hl83zGcNKDGZtA9H9tcL8Orieg1tbjYbKHxrMgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdxoP0qrEd4fbAQscg9PUIZpavjxZTYZp9nObyNZY1A=;
 b=ha+cKjhlO9J0TbKsS0diOlAtaQRJJ9seNu8wzNgtxPtXjEjFFIy1HR73fe+uf68qCGP1599ybJmOXPyM5cu/2IqHxsQkAq06/nyyXPD1y9j5Ahv0g4l3JSv6KHd4KFZSSGl5jKwH2AZ2z3EQXYvrNzn1YAgmSkrshS8WiKro00QXmP3ufxE1n84Us0SArFQwK3OhBmvyhFSWy/l+xUjR62zj1WORSc/MzNbi9ImoxGXJpFjM9iokO9JuYbGsyokdVnkXU8weEGRPZlkXYb+YTs6rNYmQ1e9OFp8ZHwRrPf97oJay0QmnFnww99QksFKCM5PJeNNsQdYHF5MU1wKtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e1d13d6-1001-2757-b626-e8f578fac656@suse.com>
Date: Wed, 9 Feb 2022 14:38:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] x86: Parse Multiboot2 framebuffer information
Content-Language: en-US
To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
References: <20220209130907.252-1-dinhngoc.tu@irit.fr>
 <20220209130907.252-2-dinhngoc.tu@irit.fr>
From: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <20220209130907.252-2-dinhngoc.tu@irit.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 073fae14-9581-46fa-7657-08d9ebd17985
X-MS-TrafficTypeDiagnostic: AM8PR04MB7202:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB7202CE41ED8358898B2186D8B32E9@AM8PR04MB7202.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4W4O7XSY2HkNaNGfGhFQD/zxg7UeInz3r2NNv9TQLMIuzufYPEzGclBkLP6gaC+/pACKa5PDCYWrenyDtZE5N/3aTcPAknh5Pkbr5qw3Q+CeVuT0J2tHG2dJKJOcHzXOCrr0XaOxSZ/e+BHmJHlHW2d866+ae8iL7GY+KrNZOf/Q7PNXSrX/W0qbPV2sTEPm3/0kmnx+3KujQbwMX/IHqijh3RHoeiH61i6rxPlGcyTPrq1rskZJGofr5jX/WwQOHAhBdwdcbYxnY2UrIDWKQ+qbzNvoE1GNOaNrHVNPEck4U7isl538ymj0TUc98GAx16wbss344oqSwrPgkruSS8JlQoeWX4NAFnF7dZ5NtBeaP0yoF3MOOhAYZK1OLBtE70Gc6r92IUBo/YnmbqapInHJug29Od/GePOOxb01NBDAd8zS8XYpJ1VyRRQygrc71yP/V6ulA7+a8aRdyJ1wrmuwJ+64CSoF4l08wJbfidnWueIitd5iFTGQLBOC4+Ahmuf/WdLik6s7G2PdemvT5n3NliRsm5DCf0wRGMf0nbhQmn1YZKY5lsmBCYRYSOdoUCF32cxaMaqfi7HmPFg58XwC0kiHEOm82IreSOaMgcREjT3jdVpcRPgTeGHxE27A+LX6E4bTffk59QOcwHubssEUuZRsJLK7EJXWW4AgcqNM4TQHXf83K1egamDjtz58th3HcMsbHv8OJQDvTU5evfu+t0zf3Dwml4m51lqJQCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(26005)(508600001)(2616005)(6486002)(53546011)(6512007)(31696002)(6506007)(86362001)(6666004)(83380400001)(66476007)(66556008)(38100700002)(4326008)(8676002)(66946007)(316002)(6916009)(36756003)(2906002)(31686004)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEZsdEQ1dlFxQS95K2tDZE1IQlR4MENlVmp2cXE5Q3VrVDdhWVlNQmhocWQy?=
 =?utf-8?B?L0oybGdzWllEOEVlUmFVekpVY1BERzNRMXV4d0pIUjlSQytsOFdLbEFTWUZZ?=
 =?utf-8?B?MWU0SzFUeFZOYjlxTVhqRlNiUDFsdlZmeVZ2Y0dXeUdxMDlZTERicFBPZXlU?=
 =?utf-8?B?ZEdvSXZpek9VNlRXRzBMYXZyVDM4R0dCVnNNVVBhOGNLUGhrT29kUGVPNmNN?=
 =?utf-8?B?QmN3d0RWenFsM2pNM3pNMGRLcXZjSnUySEZhZFU4MDZFTVR6QTB0R0RJRi9q?=
 =?utf-8?B?NWFNaGtDN1NId1kvZ3VvS1hRb0d4SlpLT1dGYnFmR3NuS0w2VnhTbEd3Z3k3?=
 =?utf-8?B?eEZOTEVMd1VTQzYwOFMrdUdHU0ZRRjdTR0wvdDU1cDRESnRVUGRDa09xSFJt?=
 =?utf-8?B?QWIyc0hHYWtIb2tnRnBoYUFhbzV5QTdEeUEzUCtHQXhQRHAxSlhaK29IdldB?=
 =?utf-8?B?RnA5cUlYcXh0cURsNVM2czhkQUE4eStiOWNqaFk0R2VCZUtnbmVvNy9Pcnhp?=
 =?utf-8?B?L01rYlVzSkx5YUhmZDJ1L1hOWVhrSVI5dWpmVWNieks4Zkc0N2orai8wQXJ1?=
 =?utf-8?B?TDA4UWtYS29aRHZXSS9hOFZ1T3VsbVl4RjE4TUxTUVZIK1R4RFFqek15M3Nh?=
 =?utf-8?B?a3lTT0EzZWxNQ3lKUE1BdFFTMzV5bUhERm43blYwb0ZqNmk3OE9WaEc4NnhZ?=
 =?utf-8?B?Y3AxMzRiRExtTG1TVGxrMTBxc3V6NStrajJWUVAyR25kSDdSZTlsN3dlNUNj?=
 =?utf-8?B?MmpnUW5yYTFyeDA3ZFFpdm16bmt3QWo2L2E3MXMvcDN4ZjZJTDBsUUV0ZG9h?=
 =?utf-8?B?Z3FaaURCdWFhZ1BXWFg3N0tMWTNLQStjR2JyeTBUdnFDZmlBZ25zZGxMdlBR?=
 =?utf-8?B?LzJiUGIxNEdJb0l2ZEhTTUN5OXd2S01wbFpBZnVjK2pRYUpxZVQ1SW1HMTM0?=
 =?utf-8?B?cjRBZjk5MUpvSU9zOTNKTWtyZXNkdEROZ05qcnB4YlFLazBoQzdPWXVGNDYw?=
 =?utf-8?B?WWM5Y3EvdHpBVGNpTGhxTXlTdHdySjFvcVlUQVdza2x4K1hZNFV5SGhqb1hD?=
 =?utf-8?B?bWJLRGFFTWREdElPRlZBcjNHOTZXVmJPZ0JqSFFHSWZoc2tKdjJFckRyWGRh?=
 =?utf-8?B?RUw4bE0yeUZNam1CRmkvZlFoeElVbXpDRlF1UkFjWGJ5UC9PVU1sR09Hc2R6?=
 =?utf-8?B?YU8wYTVLNkVoZTZuUk1zZXMvMjdpeUkzSjIyc2NHM3R5QlhaZlM2RG95SktM?=
 =?utf-8?B?SWxLWjlZelpOTXJRYnZUVFBJa2dRczNYNStodUZpN21lWjZGYTBjcE9Ha25x?=
 =?utf-8?B?SEFsS29MVWJ5a2x2bEk0OEZDTnNRKzcxYllJRUtPREZWRUhQeGFsMTRCU2NS?=
 =?utf-8?B?eitjZERvN21zWk5UWFBaS2ZiNmxtc2lOV2Qvcm9RdDFCQkRvcndQTjg0MzQ2?=
 =?utf-8?B?L3Q3Y1J5S0FmWHppaFA1ZFByRElRUDg3bUN4LzIrMlZrUE0zK0dYRUFhRXZJ?=
 =?utf-8?B?Mnl6dW1XbWVTOW9VbkUvRlg3OGszOWpreWdNQSt6V2MweW9mWVAzWnRrZWl6?=
 =?utf-8?B?SHQzbVNmK1BwY295Ynl1dTdJQ2p5b3AzSjlGVDU3azhmMDFUU1lRUndyWVlq?=
 =?utf-8?B?NDlnKy9LSVloYzExZHRSNUo0bmMxRDNjZ3h2d2VtVXl0R2cwTkJmODhmcjlF?=
 =?utf-8?B?akh6K3duZnJ1MS9XVWhibnp6RGt4L1dXbUZmL0dNWUlOdm9ITDYrbDQ1S21Z?=
 =?utf-8?B?SFc3OSttVmpGM0gzQTYveEVJMmRnRXd0Ukdqc0ViMWZ5U3JIOUNXSVJHNHhy?=
 =?utf-8?B?THhCdlk2dVBINEFYTnpMVEh6SHpsQ1lzaVpCZlY3TGRDUzZkeDM2M3QxMENi?=
 =?utf-8?B?ZTBOeG9CY2NNWnlDVmJKd0RtMEJEd3c3TExBOHp3SXpYSlVnVXE1TnFhVFU3?=
 =?utf-8?B?SkdVS0llSGlOUUkrL0ZXTk1ZbzJZSVZadzh5WmtIVHRBZG82TXlVYWRpMlRS?=
 =?utf-8?B?VWV1VkVRV1hIQzJWTDRNSUZ0SG43Z0M4SklMb0dVRlFQZ0ZEWnN1UmRDOGpF?=
 =?utf-8?B?SS9BeFBIVTBySXNKeW1tVkFwYXJGeFVoUmpQM0JWMDYvMjR6N3piSXdDa05O?=
 =?utf-8?B?TTFhVWh5bmpCWjRYZVB1SVVKTjBmbm4vTy9KdVgvZTVFMFl3b2wzcXFUSmF4?=
 =?utf-8?Q?FOb/B+J792W0LG8dpbjlNFg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073fae14-9581-46fa-7657-08d9ebd17985
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:38:37.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29piD8hByLglMdERFWVyhJn3Jwq6I7INUVLJMEfI2BUmDdqv0Rdnf31iCC9J7Vm77H2WUrwwAh6GEMVcyUgqnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7202

On 09.02.2022 14:09, Tu Dinh Ngoc wrote:
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -156,6 +156,8 @@ static multiboot_info_t *mbi2_reloc(u32 mbi_in)
>      multiboot_info_t *mbi_out;
>      u32 ptr;
>      unsigned int i, mod_idx = 0;
> +    u64 fbaddr;
> +    u8 fbtype;

Style: Despite adjacent pre-existing code doing so, new code should
not be using u<N> anymore, but use uint<N>_t instead.

> @@ -254,6 +256,26 @@ static multiboot_info_t *mbi2_reloc(u32 mbi_in)
>              ++mod_idx;
>              break;
>  
> +        case MULTIBOOT2_TAG_TYPE_FRAMEBUFFER:
> +            fbaddr = get_mb2_data(tag, framebuffer, framebuffer_addr);
> +            fbtype = get_mb2_data(tag, framebuffer, framebuffer_type);
> +            if (fbaddr == 0 || fbtype != MULTIBOOT2_FRAMEBUFFER_TYPE_RGB)

Style: Blanks needed immediately inside the parentheses.

> +                break;
> +            mbi_out->flags |= MBI_FB;
> +            mbi_out->fb.addr = fbaddr;
> +            mbi_out->fb.pitch = get_mb2_data(tag, framebuffer, framebuffer_pitch);
> +            mbi_out->fb.width = get_mb2_data(tag, framebuffer, framebuffer_width);
> +            mbi_out->fb.height = get_mb2_data(tag, framebuffer, framebuffer_height);
> +            mbi_out->fb.bpp = get_mb2_data(tag, framebuffer, framebuffer_bpp);
> +            mbi_out->fb.type = fbtype;
> +            mbi_out->fb.red_pos = get_mb2_data(tag, framebuffer, framebuffer_red_field_position);
> +            mbi_out->fb.red_size = get_mb2_data(tag, framebuffer, framebuffer_red_mask_size);
> +            mbi_out->fb.green_pos = get_mb2_data(tag, framebuffer, framebuffer_green_field_position);
> +            mbi_out->fb.green_size = get_mb2_data(tag, framebuffer, framebuffer_green_mask_size);
> +            mbi_out->fb.blue_pos = get_mb2_data(tag, framebuffer, framebuffer_blue_field_position);
> +            mbi_out->fb.blue_size = get_mb2_data(tag, framebuffer, framebuffer_blue_mask_size);
> +            break;

Some of these lines are overly long. Much like you don't have
frambuffer_ prefixes on multiboot_info_t field names, you could
omit them on multiboot2_tag_framebuffer_t, which would reduce line
length some already. You're likely still not going to get around
wrapping some of the lines.

> --- a/xen/include/xen/multiboot.h
> +++ b/xen/include/xen/multiboot.h
> @@ -42,6 +42,7 @@
>  #define MBI_BIOSCONFIG (_AC(1,u) << 8)
>  #define MBI_LOADERNAME (_AC(1,u) << 9)
>  #define MBI_APM        (_AC(1,u) << 10)
> +#define MBI_FB         (_AC(1,u) << 11)

From what I can see in grub's multiboot.h bit 11 is VBE_INFO, while
bit 12 is FRAMEBUFFER_INFO.

> @@ -101,6 +102,22 @@ typedef struct {
>  
>      /* Valid if flags sets MBI_APM */
>      u32 apm_table;
> +
> +    /* Valid if flags sets MBI_FB */
> +    struct {
> +        u64 addr;
> +        u32 pitch;
> +        u32 width;
> +        u32 height;
> +        u8 bpp;
> +        u8 type;
> +        u8 red_pos;
> +        u8 red_size;
> +        u8 green_pos;
> +        u8 green_size;
> +        u8 blue_pos;
> +        u8 blue_size;
> +    } fb;
>  } multiboot_info_t;

What you add is not MB1-compatible (VBE fields come first). Furthermore
the addition means mbi_reloc() will suddenly copy more data, which I
don't think can be assumed to be fully compatible.

Jan


