Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8A14AB6E2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 09:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266567.460261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzmS-0007wz-Kb; Mon, 07 Feb 2022 08:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266567.460261; Mon, 07 Feb 2022 08:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGzmS-0007vA-H8; Mon, 07 Feb 2022 08:53:52 +0000
Received: by outflank-mailman (input) for mailman id 266567;
 Mon, 07 Feb 2022 08:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGzmR-0007uy-Nf
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 08:53:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77b205b2-87f3-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 09:53:50 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-p1sANG96NRaoWJXxRMVpjA-1; Mon, 07 Feb 2022 09:53:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7063.eurprd04.prod.outlook.com (2603:10a6:20b:11e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 08:53:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:53:47 +0000
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
X-Inumbo-ID: 77b205b2-87f3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644224029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbajDJNRxGbgxuYUH8E1+csdYq9ygwMnbguqJxXnRUc=;
	b=Lzr7Unwh8WxFihjJFFb+5XYOrPh2kooGere4IAfokEJEZcgoDd6yB3AnZvBmfguPHuUp8H
	1S5Q0TS9zCPtxy4/YT2iAjmSvTRHy8gAB0RERnXJyVoydQncq1845eZ8X+RtF8+/2xBkX/
	6XEwez5uVyJFr4KD+ga94QCvG2vZm3g=
X-MC-Unique: p1sANG96NRaoWJXxRMVpjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU5iVbImd7RTHkKaWFP+I3kZqMkA00d4JmSYtFY7aQVc7TgwsspzFgXdNu9E7TFUhC4s6Jg9P8azDozkpE/jqnGQaxihfV67ZSGMmINcd61n56Ax4szQg47JT6gW+3zYkKJ4DYWEV4vud4MilkZl2fY1QiLnaOOm1xT0gskiS6MV6vCpSovvXTNLpoamB9NOPNLrVmmMTDxDZISFPDzV5UroTIpRsBEPvsAx/bMUudG5Q+SX8OYBS/THO3O0x0x4/A8aGbU1StBBaH0QZeaLLhQFCfzlIwBc42xFpypy1MCEP15mZ9ojr9FqcK63DT+nKsYqxsXkkqKiqt3LafsYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbajDJNRxGbgxuYUH8E1+csdYq9ygwMnbguqJxXnRUc=;
 b=glZqj8e8vkqJFkxQtIwrdiNRBWCBy63oRM09mx8tUUnNxpqlqThvtrZQ+7YN54E0MvAjvlEW8mQ8+o9FJzmswiEE/sWaEgP2913TitZojHA1gwc+Ooq8GSV6UW03tBRbWOQdqqEtYCymvVO6Qluu3utOMe+mh33oWNK9AYCr1cI+wEdi1WZmI8qCaMMf/+AgATgUNyqPz2CGP8OnxQkfnnLHm66j98h5El5x8LhlDtbUEqekPUoXYfFpu1Y0Z79KKcbGpPJfveVwkKTtJBdDc8WRUhdtewHj6ERxQRUEcgLmh391ylsYkWe/FpjKhaqDnxs0XI2VAnYbagi/UR6mUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6249db03-01b5-e1bb-75ad-5946e16f639d@suse.com>
Date: Mon, 7 Feb 2022 09:53:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 2/3] xen/arm: efi: Introduce and fill the
 vga_console_info
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220206192839.75711-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f85f17e-83f6-482b-790f-08d9ea175ab2
X-MS-TrafficTypeDiagnostic: AM7PR04MB7063:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7063B3650583308937EB9C97B32C9@AM7PR04MB7063.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fodQGPU8sJ1VW62UqGPvapSBPMU0E89APfb1Vmqsm9X3vMPcgRtQLAxt5qwibW7qHBYJhsthoQ7PJkGAtTUsYm8J7dJ/t00UAL79zAxzx3g1/bXrESLCoAq6HztsyGzLyRH1/pxWuUX2YFQqqV0cs4OhExoBREGKb601maUL0WP1e+P5SvSL+EZVkIH6sNF2AEOlm3taF1g3kUuXcJ4l1rjkTMbqqAV1zD6+uPsags/Tr7dpQt1bcPVF9Wx8SWMXTwZj8iuFTED2vBzflbpDltTg5/UVqz2W2A9qEcvYe3KxWHcz1W4g8AD/kDYTFtSv7mTCE3UQC8RclH7HkcHGy4Ej+O6WUZQl0uOaj8EvCvpt9Kx07zULVcSto+qeLfy0ePHVmYOkoQ1QsFXgDkvJfziC/MCQeuP5D6k3EkkO06VhP1JHK9wyRp8eG5bizGr4s8bxGysxIrn9+0hhNvzdMqtqdljsr09Hmgxf+GqVq2iFvyK3LbYfRMonLfguWJj1N58LYpYq4bE7KNfQ7s4xQe4oMWWf1P8gZnOmvWdxkIpwhlAl4BUn8BJo9Q26dbfsogueu9vLrO/NQ/88ryaAyaQwXQ9+VDDdd1uEgIaWQB4UfTWojy4BDT8/YdCoXCLIYGyi9kvZifWSFvsW8zBkcenzbD7VI8x4rO1HaFAIlRU9DzoCHX2kdbUR2kv+CFP6XSpgadAtIugL23vj4A6lC+BL7q6iUDCBdoWauulkI/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(31696002)(86362001)(8936002)(4326008)(8676002)(66556008)(66476007)(6486002)(5660300002)(83380400001)(508600001)(7416002)(6512007)(6916009)(36756003)(26005)(186003)(316002)(6506007)(54906003)(31686004)(53546011)(38100700002)(2906002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjNWUEdlL0h1ZklSckpYYzFrQWpjU25VNlEvcnlIVTlyd0VYd0lmcHJTdWJ0?=
 =?utf-8?B?WG95YW02VGU5QUk3WmlmQUhJd0l0UEg3dzc5U1VOM0VwZnpXVGtIaHF2SEh4?=
 =?utf-8?B?V3hDdVd3SmVsQ1VsdnljSXhHdSthU05EZ3YrUktZSmc0djJ5Nnp0RWdVdm1q?=
 =?utf-8?B?TTJDT2VhdjdrcFRhSGF3dDBwUjlBdWZEYk5JY1EzQytOT0NySjkxQWpnNFhj?=
 =?utf-8?B?bkJQa3I2SXZIRFY1WHlDTVVHSVIvOWorL1o5cEhHSWVZb3FJM0E1UnpnM3VD?=
 =?utf-8?B?WWdxTWpQei9DQm9JRTBrYi9FVnlHM0wrM0VMRTR2cjlxNzlYclM3eGdJbEEy?=
 =?utf-8?B?bThTRHRVenhoS3VVS09aZk9wZk5CSExuL01PcSsvaHI4Y3p2OTd1bDk0a1cx?=
 =?utf-8?B?dDArbi9EamgxTXBzWWVhNmtJNVdPRktoQ0VLd0VUZjdPQkZEdGd1U2NTeGRF?=
 =?utf-8?B?ZWhpZVQ4QTYrVjM1M1ZPaHZvQ25OamI1ZVVKZWZYNlhsVnpuME1wVFgycHlz?=
 =?utf-8?B?S1BCaDh3Y0NzTHJBQjdKQ3h3KzAxQ1RWUXo2bG8zNnZzQnp0K1daREYydXFN?=
 =?utf-8?B?RkV1VVowTWc5RjhwYm40eDExSUdFYmFMSWJGdWJhTDdOK3cxbFBsazdlNW1l?=
 =?utf-8?B?ZXhGKzBSdDJlYURUZUhnM2pEMngxUGdBdmJLWTN3d3U3NEJsSXRmaVlXd1Bh?=
 =?utf-8?B?SmFCYmhCVU1VNHNiYk1GSHRYdGpnZkhaN0lMcTRXYlU1ZzcrQ2lJYzd6dVhD?=
 =?utf-8?B?QWkrWlNNeEVidmJRZHNvWk9vdFlWbVNvbmZZUjFpNTNnZm9SNE5aaHYxcG1J?=
 =?utf-8?B?U2Vmd2tGMzl4UGtTNDNrRS8wTHVrcitOMEUramNJYzBZZnA0a0VrQis2MWdP?=
 =?utf-8?B?eitkS2NxUnFvenB0SUJMWDJFSTVmdHdsVGRQOHl6SHcrWUFDc2VFUW9JM252?=
 =?utf-8?B?OEZrK09USVp4aXRFdTFaYXVQbklTZWhVc2o1N2djdWpCSFJxM2NiZjZpak5J?=
 =?utf-8?B?NXVmWmlhWEdrMXk1SThHVS82VXB2Zk15MGRjNWU4UUlocWNVNVhRcEo0SjVU?=
 =?utf-8?B?dEtRSUVRVFpLYXJCcVVaMUZpeDJrVkI2S3Z2Tzk3dDZuQUw1VXdEZG9wcWR4?=
 =?utf-8?B?TzQrNW5neWNJb3pMYnVXV3kvUDRKMWFFM1c1WEVkSUU1c1I0OCtEc0JlK3lu?=
 =?utf-8?B?TmpCdEVXakV2M1N3NzJENFlROGxoU281NUxRRjU1Ym0vSkMvYm8zUDVzOTBW?=
 =?utf-8?B?UWNYQ29jQytVbnRqYzVzUktZSHNnZlc5QVp4eTJNMWZwUDZJbTRyYkRkd0FB?=
 =?utf-8?B?TmIvVGVPYTRHWFlvdlFFTUtJNXBMa1BMY3dybHhWMkZEWkhoekNuYjNKZmgz?=
 =?utf-8?B?NmhPUDBwbmVTejdVc2pFM0pkUjRZT0RSSnU2RGFiejRUcnV4OVBJOERqMjkw?=
 =?utf-8?B?NEx0Z2lJSUVESjh1MVJLMG92YTZWS3dGbkRid1diR3RqK043SU9RTE9WcWVM?=
 =?utf-8?B?S3E1d0RlRVZaMWRFdWlGZllGS3JWaEFFcm83RFpYQkRoajRPc3lrR1pTbnEy?=
 =?utf-8?B?NnNsR3l0eHY3c1JIdlkzU3RyOUt0dG1iVmJWSWFxNy9sUE9PZGFJR2hudkZv?=
 =?utf-8?B?Y2xob1VVbmEvWE83Y2kxRGFZY3p6WWc5T3Q0a1d6YVQ5ZjhuQ2REeUhOSUtn?=
 =?utf-8?B?NGdwcmdnUkhFVXVqRnJqNG9MalZmU0lxc0ZGZEQxYzNWcnREdXhWWkl1bDN3?=
 =?utf-8?B?K3FpczVZdE9SRlFNTElpUm12VStjZFVyMGMyOEd1K3c3eUdpdnpYbDVPc2tQ?=
 =?utf-8?B?cmxOaEV1NXJDU2QyRS9Ca1JlZzBTN0pGREkxYk5uby9ablJCVC9aeUtVWXRV?=
 =?utf-8?B?SDc1eEY1ZnFnenB4dlV6UnNjalkvUkxhY3ZjM3BXYXdkS2l5MmFWTmxHeXYz?=
 =?utf-8?B?K0ZEOGNtVDZPVnVwaXRFQVRFQmFhOVlYbklmR1R6SE5kRlZReVZxay84bVZJ?=
 =?utf-8?B?MnB6U21SQ09TSHUwVGpQZDJhMW5wQW92TEVMSzVhbGJ3UlJoSUFLejM1ZDQ5?=
 =?utf-8?B?VDJjb3dmWS9jSWVPYzJObm1PQ2R2YW10ajFEWFR2L2V5dTBMVktibG4vY2tX?=
 =?utf-8?B?SXRXSlNsMmxvN3hLTTZ0RlZtOE5TQ1p5UjdEd1k4Z0o4YTFkT1ZpQVdaZVd4?=
 =?utf-8?Q?iUFWlBEBA4dLrtBfnukuyc4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f85f17e-83f6-482b-790f-08d9ea175ab2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:53:47.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdg28+HGF11YwEVUR8UEHReQeeLoKJY1fUfM20BR9mA+Nk4DRBe2HnLFFUK1ruZUMwUBXkWWi1+/ky8l8fEAaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7063

On 06.02.2022 20:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> In a follow-up patch will we want to add support for EFI framebuffer
> in dom0. Yet, Xen may not use the framebuffer, so it would be ideal
> to not have to enable CONFIG_VIDEO/CONFIG_VGA.
> 
> Introduce vga_console_info in a hacky way and move the code
> to fill it up from x86 to common.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
> This is a bit of a hack. Sent early to gather opinion on whether
> we should enable allow Dom0 to use the EFI Framebuffer even
> if Xen is built with CONFIG_VIDEO=n on Arm.

I have no input here; this will need to be settled among you Arm folks.
I have no objection to the code movement, just one nit:

> @@ -1025,6 +1026,77 @@ static void __init efi_get_apple_properties(void)
>      }
>  }
>  
> +static void __init efi_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
> +                                  UINTN info_size,
> +                                  EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info)
> +{
> +#if defined(CONFIG_VIDEO) || defined(CONFIG_ARM)
> +    int bpp = 0;
> +
> +    switch ( mode_info->PixelFormat )
> +    {
> +    case PixelRedGreenBlueReserved8BitPerColor:
> +        vga_console_info.u.vesa_lfb.red_pos = 0;
> +        vga_console_info.u.vesa_lfb.red_size = 8;
> +        vga_console_info.u.vesa_lfb.green_pos = 8;
> +        vga_console_info.u.vesa_lfb.green_size = 8;
> +        vga_console_info.u.vesa_lfb.blue_pos = 16;
> +        vga_console_info.u.vesa_lfb.blue_size = 8;
> +        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
> +        vga_console_info.u.vesa_lfb.rsvd_size = 8;
> +        bpp = 32;
> +        break;
> +    case PixelBlueGreenRedReserved8BitPerColor:
> +        vga_console_info.u.vesa_lfb.red_pos = 16;
> +        vga_console_info.u.vesa_lfb.red_size = 8;
> +        vga_console_info.u.vesa_lfb.green_pos = 8;
> +        vga_console_info.u.vesa_lfb.green_size = 8;
> +        vga_console_info.u.vesa_lfb.blue_pos = 0;
> +        vga_console_info.u.vesa_lfb.blue_size = 8;
> +        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
> +        vga_console_info.u.vesa_lfb.rsvd_size = 8;
> +        bpp = 32;
> +        break;
> +    case PixelBitMask:
> +        bpp = set_color(mode_info->PixelInformation.RedMask, bpp,
> +                        &vga_console_info.u.vesa_lfb.red_pos,
> +                        &vga_console_info.u.vesa_lfb.red_size);
> +        bpp = set_color(mode_info->PixelInformation.GreenMask, bpp,
> +                        &vga_console_info.u.vesa_lfb.green_pos,
> +                        &vga_console_info.u.vesa_lfb.green_size);
> +        bpp = set_color(mode_info->PixelInformation.BlueMask, bpp,
> +                        &vga_console_info.u.vesa_lfb.blue_pos,
> +                        &vga_console_info.u.vesa_lfb.blue_size);
> +        if ( mode_info->PixelInformation.ReservedMask )
> +            bpp = set_color(mode_info->PixelInformation.ReservedMask, bpp,
> +                            &vga_console_info.u.vesa_lfb.rsvd_pos,
> +                            &vga_console_info.u.vesa_lfb.rsvd_size);
> +        if ( bpp > 0 )
> +            break;
> +        /* fall through */
> +    default:
> +        PrintErr(L"Current graphics mode is unsupported!\r\n");
> +        bpp  = 0;
> +        break;
> +    }
> +    if ( bpp > 0 )
> +    {
> +        vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
> +        vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
> +        vga_console_info.u.vesa_lfb.width =
> +            mode_info->HorizontalResolution;
> +        vga_console_info.u.vesa_lfb.height = mode_info->VerticalResolution;
> +        vga_console_info.u.vesa_lfb.bits_per_pixel = bpp;
> +        vga_console_info.u.vesa_lfb.bytes_per_line =
> +            (mode_info->PixelsPerScanLine * bpp + 7) >> 3;
> +        vga_console_info.u.vesa_lfb.lfb_base = gop->Mode->FrameBufferBase;
> +        vga_console_info.u.vesa_lfb.ext_lfb_base = gop->Mode->FrameBufferBase >> 32;
> +        vga_console_info.u.vesa_lfb.lfb_size =
> +            (gop->Mode->FrameBufferSize + 0xffff) >> 16;
> +    }
> +#endif
> +}

While you move this code, could you please insert blank lines between
non-fall-through case blocks, and perhaps another one between the switch()
and the if() blocks? And it looks like
- the "gop" parameter could also do with becoming pointer-to-const,
- the expanded #ifdef could do with a comment briefly explaining why Arm
  needs-special casing.

Jan


