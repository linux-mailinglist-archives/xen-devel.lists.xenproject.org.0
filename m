Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD54AF374
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 14:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269192.463207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnV2-0004Ck-Cg; Wed, 09 Feb 2022 13:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269192.463207; Wed, 09 Feb 2022 13:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnV2-0004AK-9f; Wed, 09 Feb 2022 13:59:12 +0000
Received: by outflank-mailman (input) for mailman id 269192;
 Wed, 09 Feb 2022 13:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHnV0-0004AE-6X
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 13:59:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7396e073-89b0-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 14:59:09 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-TQrOqEf8OtqYhzgNPzM8xA-1; Wed, 09 Feb 2022 14:59:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5267.eurprd04.prod.outlook.com (2603:10a6:208:d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 13:59:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 13:59:06 +0000
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
X-Inumbo-ID: 7396e073-89b0-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644415148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qB6/WtUFvr+uLx+DyCj+rZCpVGdD22v4qDzNr7lmQA=;
	b=ZmrEt4WAfA0L63USHsO5L/dyDNDPAkNxcjgpOb5qR/gAd9LKg1BXOo878BfVGU0HFa+YE5
	0fwygliLi+71eWg9H5XXLuzNKLwbcpWdhpAOPSoObpXgZlU+1zROchW0+bToIHw5a1I5my
	tpzjLTZ7WPlMRzf5GCxWaTcwf4pM10A=
X-MC-Unique: TQrOqEf8OtqYhzgNPzM8xA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrSw0WADfu7316Xr4EESHLgU4gPOorocAoEz44aAoWlztrROU24Rz8SAo16uMDlUrZ35TUxE7Esb0zpqWCusCfIYyD7GewdpzGTMLAwAZBNuTFe6B2uq7cwbubRw73/bZCSjw+yRgzkPcWZ5+m/yBwmaX8IO0kijJBu7qg7oJ9jiE4Q+mwsIXZx6lMlAHVQ47lF9X1O6SoR1Sj8cXlwZWbwZb8c+eKvimiQZUsCDjRujbaIrLrleJAt4KAM7J3OpvYHSIIgG6/IjpJZX0otnClTJ0h2PZF7f3rWf5n5uEwa+bXy6fRkB0Q12Ge33tPmanbHzMMZzdvG42AQiHMx+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qB6/WtUFvr+uLx+DyCj+rZCpVGdD22v4qDzNr7lmQA=;
 b=IV9K9usU7YM0vbB0nNa11g6SnW8brtWHXnb2nGb8s51sqr1v/br+0eskUO+v8xq97U+NTvxMQB96pIAXP2eSEhmpoby/aWfStlUmpolYxFGiiT12BsLer6dQTf7UU0Q2KcRIixbr8ZmJnUB32KVwhBMduYwPbN0+ZTjkOq0bR1mWt/Rj+vPkcC+1wELe53T8bj6KHl0dwGuv3Zo4uKlg1BItkoAvw9QoJyHwknq5mWgaD8v4Z0thpfI7AgYFkznpjI06d4zW4mtjdGJFtUSC8AaOJlbnuqgDQ2DaXvkUBHShxaqv2bVIRiHWlSVqiSoCIaMW1rxumYUJ+wnActq4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d299da87-7abd-6899-27dc-4cae4634d227@suse.com>
Date: Wed, 9 Feb 2022 14:59:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] x86: Set up framebuffer given by Multiboot2
Content-Language: en-US
To: Tu Dinh Ngoc <dinhngoc.tu@irit.fr>
References: <20220209130907.252-1-dinhngoc.tu@irit.fr>
 <20220209130907.252-3-dinhngoc.tu@irit.fr>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220209130907.252-3-dinhngoc.tu@irit.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0036.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cc131d3-5373-45ec-51cc-08d9ebd45623
X-MS-TrafficTypeDiagnostic: AM0PR04MB5267:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB52679008AE5EA679159730A3B32E9@AM0PR04MB5267.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QX1aAbQeTPdyQXopKWr9YvSlBVQ537iY+cLqGkI4DdXRv1Ih8YzWJELJWyO7AyHY2nTBHeRxGDDw86Rn3h0wypAc/J4XgNrLWDUCqlcPFSDNeZk3fQ0ztf6pi62Gohh2RE5LArDj1js3YDPpj4RprpRMN6WIIDRzViJ9gc7G8re2/AlQkVd9jU27Z6saq+1M13ogSDdAMbn9QZMB08iXCNaTOIYWtKOHJRtSqJx2TZ+i1A8U8XC/yM8cTmD4m1Gs6zHL0gX2zop1vFpiojBcdXGth/45lJT1BNm079d/mLS0CPbuFzkk5YuJmTDaXsDTLy/dB/wui/YvAHG3wbDP1bOb2AcrHwtpRUdwLJipYxBWVM5B59JGfj3k8pAv30h15zG/jgmtI9wKijL8cA+UD70h7/WxgIWQJff0DVr09Ee/64l/5IwC8g8N8u2s7ePYR8TLZTct7z6Eid7LVar7wFOnclqBaJ3pUbXzqc2zTjKHLSe6cCtpvkr3MoA98WUYvQmYA7sTP2b5e53PWSU8TnjbVcHuoKoZl030Nmwxhf4X0eW0/Rxi86JSzDsvMSFej4PYfNtAjnDoYHnpMEqUuLlZg47T/s8YllzKPzHcMq0Z9yiya8AUxOdlsP33OUDucbtnlSI/E+L033216fAdKXlimR/kBjUm+piVKKQTFJWMBX351xKzOL6TXbK10psFzFDWyTMU14HcDuhbDalGckAPXwmJ8PBSDaIR6HhxQOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(86362001)(316002)(31696002)(6916009)(6512007)(6486002)(508600001)(53546011)(2616005)(6506007)(4326008)(66946007)(2906002)(66476007)(8936002)(8676002)(36756003)(31686004)(83380400001)(186003)(5660300002)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkR3andiZnRqQkdXUlVqU25TZDZscEFRNFgzVDF1YzdzVjlHT2tVUWhreHB0?=
 =?utf-8?B?RDdaVmNFa0c5VlBtMjB4YkFqazJFcFBFODcxY2JyRmR4Si9GWTNHOVBWNldv?=
 =?utf-8?B?ZlFhL01ha1VPUGovQm5jZEt5QTVSUFpDR29hMGV3Yjdnd05DR1VpVUgyREt5?=
 =?utf-8?B?Mm5CL1gwNWx0U2dPTVU4MDUvcWxrYTJxbjdHSTR2OFQ1SGJBNkovbC9Eclgz?=
 =?utf-8?B?OXZRQnlEa1c1bko0bkZEYnJVUDhiQnJaeVh3bG5GY1NFNFU4NGY5eGJtK3ND?=
 =?utf-8?B?aGlvUGZpVDNJamlxd2dJeWpyWVJRZWhuZHk1bzJrTDJTQnhoODFIa3Yxa25k?=
 =?utf-8?B?Y0tmTGZQSW1pRzc4Nm9kWGovazdvNTFUQzRuTmVLczZsT043czlkSEtQUlBK?=
 =?utf-8?B?WmpJTkZqemE2SCt5L2MwOU9IT3ZZRU83djg2OHNSQjdXdGMvUDF5RHJSZVlK?=
 =?utf-8?B?NUZrQk9jazlZeGpTTGFMUVBPcTBuMWlZUFBON3psWWdvTlBWNmlVelEyV0Za?=
 =?utf-8?B?YlFKU0FnWlU4Rm9WbDAwUHl1RlhNOUpTNnJHZ0Vza0t4RnlXaFE1STRTbWp6?=
 =?utf-8?B?bS9NeHhiZE55M2EzR0xtVnphTXBNTlRlQTlvUi9jcEw4MUtjMXJCSWs3dllJ?=
 =?utf-8?B?QkdXSTFMVkFvM3drY3hXbkhkRFNFZGZOVnE4ZTlNaDVhRDVabzYvM0tzVk5Y?=
 =?utf-8?B?ZHN5OGVJTjZRYllIQjZNQWpwRDBnUzdPQUhpZTVZRnJCbXRsem91THl1Vnls?=
 =?utf-8?B?Y2d6emZxYUVLeVV4UnRxbC9MTWJESHFETXBCQ3NXWXlScUlPWnlzdHNoWHgy?=
 =?utf-8?B?NlVHd1I3SzdHN252QUVOTlc2bFE2NG5SZnhFOE9nSWplTi84MVFvNjFYQWR5?=
 =?utf-8?B?ZWZDbTR3SjlzV2wvMit0TU9YalFBcm5xa3dTelFETnk2YkwvTExxOWdOT1Qv?=
 =?utf-8?B?bFVxUjk2WGtsSzNMUms0WCtsMXdLaGJPNWljRGVaM3Y4ZndnUVY5SU8weWla?=
 =?utf-8?B?amNEMnJzYXZPSVpqTFFHSElXWS8wQ0FDbGYzVXZLWHJ0czFqNUt0eWltd2l3?=
 =?utf-8?B?RTBpYm94TkZnQUQwVTkzZWJQd3l4MGtmZmxLb1hvN3lrZE5aazF4V0dVUnZC?=
 =?utf-8?B?UG9xUHR6QUxFb2hjc0JUN0NUQk10MnU0d2c2dElCMlVPSlJwRytzUEt0Nnlh?=
 =?utf-8?B?c2Q3WTV4R2M0T3ZyWGhWTnRCWHdtc3dHVVczbkVVZElRNnRVUVJ3V0E5OHJY?=
 =?utf-8?B?dkF5ZnBScU83MnV3S3crWVE0RldWTmIzNFpsZDl2UXRhSStRdkZPUjN2WUJG?=
 =?utf-8?B?WHQ2R25rQkMvVHgxbitnQ2l3Q2RIYVdQaVRHRDNTUU9pM2cwNWE4ZjBGVG5T?=
 =?utf-8?B?Rzd5TTY5bG81ajVPWWxtbk53R0RtNHVLQ055OFJCU2h4OXEvK1pydzB1RGdO?=
 =?utf-8?B?SVhNQ1dTZ3BCdlhSVE9zUytlenRpekJJMU1JOTI1c2VENURaY3BTYjhlbFRS?=
 =?utf-8?B?QjhaamxBNm9qNkhxQy9ZdFBxZEtXR2hCR3Budi91NER1SzFOSVRKUUtPbXM5?=
 =?utf-8?B?QW1NZlhoVFM3aC9ISlBPQmRmNXY4aGJUZHd3VWM3enNUQndNaGlyN0ROR243?=
 =?utf-8?B?dW4reHE2QWpZRW1Oek5OOC9WWUs3ZGpkYkZNK1FkdlFSUnR3TWZqL3hZYWhL?=
 =?utf-8?B?YzlBR2R6b2NjWmlEUXdndkxjbmY0RVIrb00xOWs1blpLS1k0YmYwL04wOEwz?=
 =?utf-8?B?NGxpNmJuQ01CS21xWk5LQUxjRnJDbzFPeFd6SklYVmtiUHBuUTVTRjdLZDJC?=
 =?utf-8?B?R3IwQjNLZ1VQNVFQbXdERDdIbkF5M1dUMGZ5NzNjQ2FEZFhwUWI5TlRwZXA4?=
 =?utf-8?B?cUp6ZHFIRmpUbzZ0TjkrM2ptKy9WYzk2a3JFZTFYUUM2cGY4QnJrQzF6dHZx?=
 =?utf-8?B?VkxTZ0pXYU9Ra000ZExxYnArdHJRY0hyVWFqeDJWZHlHaUVkU25sczYzcjdS?=
 =?utf-8?B?Y0svd1pOZkoxNmRRMjRBdHptT0lFWTU2M3c2UnhOaHErM1g3TlMyWEZSZTJP?=
 =?utf-8?B?aGdTSTlubmV4ZWFqazIxaUMvYWRHQ3VaajRyL2Uzdm16cCtyTTgrZCs1MEpq?=
 =?utf-8?B?MzFZa0FYUnNYQlZ1QVVkSi9WTmhJU1FzTWU2RFhwTm9LK1JGU0JFTCtWMnhK?=
 =?utf-8?Q?amdqZRtgQPizb98WZplojkY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc131d3-5373-45ec-51cc-08d9ebd45623
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 13:59:06.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHA1nH+PQIhI3Tz+DK0U/YhDOdNmiIvAENhLE5PYRrFlgMR+WGlo8yhMC9klFTbvE9hyIXDfXFiRKhxySPqo7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5267

On 09.02.2022 14:09, Tu Dinh Ngoc wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -551,16 +551,55 @@ struct boot_video_info {
>  extern struct boot_video_info boot_vid_info;
>  #endif
>  
> -static void __init parse_video_info(void)
> +static void __init parse_video_info(multiboot_info_t *mbi)

The parameter can be pointer-to-const afaict.

>  {
>  #ifdef CONFIG_VIDEO
>      struct boot_video_info *bvi = &bootsym(boot_vid_info);
>  
> +    /*
> +     * fb detection will be in this order:
> +     *  - efifb (as efifb probe sets a new GOP mode before parse_video_info is called,
> +     *    we must use this mode instead of the one given by mbifb)
> +     *  - mbifb
> +     *  - vesafb
> +     */

This ordering needs justification, first and foremost because this way
you risk regressions when VESAFB data is also available. There would be
no such risk if you made mbifb lowest priority.

Style: Comments should start with an upper case letter. There are very
few exceptions to this (e.g. when a comment starts with an
identifier referring elsewhere), but here there's no problem with
starting the comment "FB detection ...".

>      /* vga_console_info is filled directly on EFI platform. */
>      if ( efi_enabled(EFI_BOOT) )
>          return;
>  
> -    if ( (bvi->orig_video_isVGA == 1) && (bvi->orig_video_mode == 3) )
> +    if ( mbi->flags & MBI_FB )

Even with MBI_FB's value corrected in patch 1 - what about the flag
being set from an MB1 bootloader? I'd be hesitant to trust that the
data is dependable upon everywhere.

> +    {
> +        uint64_t lfb_rgb_bitmap = 0;

I don't think you really need this initializer.

> +        vga_console_info.video_type = XEN_VGATYPE_VESA_LFB;
> +        vga_console_info.u.vesa_lfb.width = mbi->fb.width;
> +        vga_console_info.u.vesa_lfb.height = mbi->fb.height;
> +        vga_console_info.u.vesa_lfb.bytes_per_line = mbi->fb.pitch;
> +        vga_console_info.u.vesa_lfb.bits_per_pixel = mbi->fb.bpp;
> +        vga_console_info.u.vesa_lfb.lfb_base = mbi->fb.addr;
> +        vga_console_info.u.vesa_lfb.lfb_size = (mbi->fb.pitch * mbi->fb.height + 0xffff) >> 16;
> +
> +        vga_console_info.u.vesa_lfb.red_pos = mbi->fb.red_pos;
> +        vga_console_info.u.vesa_lfb.red_size = mbi->fb.red_size;
> +        lfb_rgb_bitmap |= (((uint64_t)1 << mbi->fb.red_size) - 1) << mbi->fb.red_pos;

1ull is both shorter and avoids using a cast.

> +        vga_console_info.u.vesa_lfb.green_pos = mbi->fb.green_pos;
> +        vga_console_info.u.vesa_lfb.green_size = mbi->fb.green_size;
> +        lfb_rgb_bitmap |= (((uint64_t)1 << mbi->fb.green_size) - 1) << mbi->fb.green_pos;
> +        vga_console_info.u.vesa_lfb.blue_pos = mbi->fb.blue_pos;
> +        vga_console_info.u.vesa_lfb.blue_size = mbi->fb.blue_size;
> +        lfb_rgb_bitmap |= (((uint64_t)1 << mbi->fb.blue_size) - 1) << mbi->fb.blue_pos;
> +
> +        /* assume non-weird bit format */
> +        vga_console_info.u.vesa_lfb.rsvd_pos = find_first_zero_bit(&lfb_rgb_bitmap, sizeof(lfb_rgb_bitmap) * __CHAR_BIT__);
> +        vga_console_info.u.vesa_lfb.rsvd_size = mbi->fb.bpp - mbi->fb.red_size - mbi->fb.green_size - mbi->fb.blue_size;

The comment really is about this 2nd assignment afaict, so it would better
move down. I'm not convinced "assume" is enough, though. I think the data
should simply not be used if the color placement doesn't match our
expectations.

Also these are overly long lines again.

Finally if lfb_rgb_bitmap was "unsigned long" (and hence still at least
64 bits, as we're on a 64-bit architecture) you could use the simpler
(because not requiring the address to be taken)
find_first_set_bit(~lfb_rgb_bitmap), provided of course lfb_rgb_bitmap
doesn't have all bits set.

> +        if (vga_console_info.u.vesa_lfb.rsvd_pos >= mbi->fb.bpp || vga_console_info.u.vesa_lfb.rsvd_size < 0) {

Style: Missing blanks, line length, and brace placement.

Jan


