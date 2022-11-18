Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0A962F582
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445743.701085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow131-0004RI-AQ; Fri, 18 Nov 2022 13:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445743.701085; Fri, 18 Nov 2022 13:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow131-0004OM-6d; Fri, 18 Nov 2022 13:04:47 +0000
Received: by outflank-mailman (input) for mailman id 445743;
 Fri, 18 Nov 2022 13:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LL5N=3S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ow12z-0004OG-Kx
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:04:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9241450d-6741-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 14:04:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8218.eurprd04.prod.outlook.com (2603:10a6:10:24a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 13:04:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Fri, 18 Nov 2022
 13:04:42 +0000
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
X-Inumbo-ID: 9241450d-6741-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HawpZIVSqHL36vPume5E1DjIWvXsc5hJxoFE+au7uUmtc0+B/GC5FIqnfn4sx8U65xyCoTNFDYCQLVKOQx0Z6Bg+oVO7Jinlao34oVgOvdaRWUL+DmWpVsRIp1kHJ1LE0yK04ji7wnsaQAnPPt6SEMFdbzpyKWu3mImyttVC5wfpXYdPNyYSnckzGhAQI0klloCmSYPlBLAjpLyF/D8m7hWhGLyr0zDvZEOlEfaOTc3KB1syBMKThjsG7Q0K+t/M+mZIQ5I9Pb8kukg9ufko+vrNuWAUux3Gdc/QoaMvlMqfLdyzoYwWF9Ss19z43eIhbG4KLZfHufgPIldradzJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDMxY7Qucnf0dQdZtGjTa9VTDvqXuaXH7mTj8w423DQ=;
 b=HoIiDrqjpPfjQoS55LldzMucCHQ4sAGxRAs23gowj3HyHfkORnddehjYguPEiGMkYUv4ripr7KjAZIo+Dk3gEv0MnnMalLM/5/imlMaHCySK1m41m0dORinh02vgkGDVRbp/FdTe/8LEIGLeipOSEzpXJKobEFmyiqWCRWTs2uVPA8NSGqGxMRF0/TmPZba6oiUEQ3tF5haaSwGg6Bw3sTzGqQc6MXDraqG0qgQBvXKPRy5qtsLPg8+vxgUmm2E1oPXVhTlylymR8jITWudftcsvvDvdLA+zF2Cxac3ap7iF9mecSRxha6FJFubsZit5Ker0GYTs1VSbI8hqi2FbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDMxY7Qucnf0dQdZtGjTa9VTDvqXuaXH7mTj8w423DQ=;
 b=hzYYNT0BpUto6cK2o/bPpH8CwZ9lGFZxdpuVlIHsGd+Hk2mNGmpvS62h+BznjryZ/LKxruYcsttwnXxMqCnnaOG3l2fFgt0AcSG7bHcikZ/7IrKt6mue0uDH6boRQUUJ4glOXNxlcJdiJ1rgbhF//eewR3yDOJnkHvm2qBKyJUWnbbwvaa47ArI8kj+IU53RtMD5tPXOWVVCIhEDjhXc96EEAxiWyAjD4x3Xz/DqBRsbMoHQw03OBRbgKTfx+adsnTlFaa9U5CsqRpMFgmXkSnQj8g3FsRfWsbO+Xpl0XKyxc/zxcwgvC83F0klSEWWCUWgD+R0llV2Q9haqpEKCvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d2d0d0a0-6ee6-d9da-992d-99bf52be8119@suse.com>
Date: Fri, 18 Nov 2022 14:04:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] efifb: ignore frame buffer with physical address 0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221118123925.25363-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221118123925.25363-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d5d2a1-5e1b-452a-c07d-08dac9657575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fc/w64UA/pLSsLmV2loCTgDG45uvC6OADvo8g0Uwe5lKqTwoVeUmbulR1Dg2X5XAzckPL1+2YtkKgLLJeQJlUi9KkbyT7+XhSWhmleCmWABYSAFNOjkIzdXJWlj2EcuqJrdmD1THWSDxfuyc9rZZv+ZSGO03w/iuOpZpGpSjLd53t1MoFovaWDdIAW8ug0sagE37H55homr1Hl1bVLC8zcegaiJNoMIHHyjZXxVdJ+FmOh4XOQpVsTwtN2QTZdeuxaYjGxk1DtgsXCPXYjZYGSUG+2GfGb8zZxrarNDawZMoPMDjB8pp3MHLLWbfKicqnWcb+4lMxYGuTVSQvw1Y0Wy0gBY4Lbho3JuBcWaVUipFU/a1I1F8ppUnvvWpXifgnU1d0dC+Zt3ahOl4ZVR2kpopf/CmharAOcAESizu82SXJgDM18K3cIVKsruVF7QwzKv63vyIzu9wxSKmJutCUK9YAv3LRDLKS8Ja4JecjKi1RQm9hYhUw1R+c7tnf/NnbewdpnW2KfqxacwMizhq6JBOIP6vZSbcXfC9JmcNGBpn8tID2ZkhhWMAZiTX52OoQWJ1og8l8Tfw1NOAFGnIUz5lI+jH48D5LNPAW5Noy2x9nOYEtsl5YoqCzJgHBBfE4R0V2K1EBl1dbZZbfo/W/Vg+11HWVpWGqhaF9wHUbUmXbKoMAdZyIDaKh1DiQwPmykJFpCibh9JR+g0cX2EHyTGztwVVMuuJfTFrIEoNvcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(2906002)(26005)(53546011)(54906003)(6916009)(316002)(8936002)(186003)(2616005)(36756003)(5660300002)(4326008)(66556008)(8676002)(66946007)(66476007)(6512007)(41300700001)(31696002)(38100700002)(31686004)(86362001)(6486002)(478600001)(83380400001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHpXbGkrT2NnY3NRNjlITjQ3WnFIbHluOUZOQkJJTC9EUUR2T21JUHdvV0xD?=
 =?utf-8?B?QXptUkJmK3ExT3hIT2plcjI2cXJoTDh5Yk5lV2hkMU5UK2R4MW9JMzZTdEVP?=
 =?utf-8?B?dDV0ZDNpMVphaVlKZEIvdGRzcE52ODNqWmE0bHlFRE8ySlV1KzZrS0RkbjNi?=
 =?utf-8?B?WUhwVmNFeVlvb0tTSSs5cHlOb3dQTXRlK2dNL0w0L0hVZ0F6ZWZ4ckxzYkFT?=
 =?utf-8?B?eTJqZm1GS2V0TVlETk1YRjM2TXhmZ3pFT3dyWVlJRXFkS1NScHoxVzMxTGhS?=
 =?utf-8?B?Qnk0SWNqN1BTQnZXcUNJOXJBL2dmbzhsYlkyc09EWDFVL1EydUtKTUY4Tk9x?=
 =?utf-8?B?NW5Ha25lR0daeXhiMG9obGZlUU05RmRDUVFZeG5JMEtoRmhvMXdZUzVEMjJl?=
 =?utf-8?B?SWRuZ3lVeXlVWStONlRFeS80RVlNWjh3dWU3UlJ0Qlh2aW5MNlZGaHRIM3ZG?=
 =?utf-8?B?V3ZJd0hnbjR2cEFWbWQrNDlWR0VnbU9wUG5wNSt4LzQwTzgyWkgzS1h6VHlw?=
 =?utf-8?B?UmZra1djZGNZczRUYm50QWEwZnZxRWV6VWxHTjNSV0FiUkZ3b0EvdGhIVTFr?=
 =?utf-8?B?VlRQYWpVaDZ3SHRuK0FKa040WXRoRmVWdjNJcWQ3RTM5QVZEVlI5YzQweEJR?=
 =?utf-8?B?MGtyU1RLQkVQbFlSZTllckh5THpEQ0lCUEc2TXhSVWl6Wm96SzI5b1g3R0lV?=
 =?utf-8?B?YkpBeXhWT1pxaTRZOFlyNndsQXptOTJzRGVRVENPYThYdUZPcW54NFFWbC9E?=
 =?utf-8?B?K1pXaERUVXRhUDRtKzJOYjIxTkV2bW93a09HRFZCaVVIUXZSS0RVU0lkcG9n?=
 =?utf-8?B?S3ljZ0M5anpYc2tJQzAzR2hIbTZDbm10VGxaMjBlNlZLR3d5S1o1NjYvYnJY?=
 =?utf-8?B?MEFnTnZuUmFNc2NsU0lRRjY0Vk4zN2tvcWdUSmxPZXNLUlZpSEFCTTRkdGRo?=
 =?utf-8?B?L01aY2EzblovQ3dhZE1WRlpuSWtVUTdjS1IzeVRkVnVCMWUvRUxnVStLdG1B?=
 =?utf-8?B?eGh5NStrdlA4Mm1hUGh2ZjlEYm1tRTgxUFdBL0V6dDZKdDhuSE13TFRUOU4x?=
 =?utf-8?B?c2t0bTFmcmVhNGFpRlM3NndvTDJnS2lIT3pCNEFkK1A5cFpQWWJJdmFVMEVT?=
 =?utf-8?B?eXRuUlU4dzBnd2JCamFXaXBKOVh5bEFHc1l1QzVCZlpQcFNXL1JKVDQxTTJO?=
 =?utf-8?B?ZjRjdnBzcWx3a1dzV01ZNDl0d3hKUkdVT1VjYWhsenY3U1llaklwZ0czQUZC?=
 =?utf-8?B?cE1sdnBBK0hwQm1UOXdhcm5GSXR6UDRONjZHNHhZRVFHejRIandWeFBRNGJQ?=
 =?utf-8?B?MWZQakhGeGpHa1VuZWt0NlppRzJvUDBqZ2llSm9URnR4bDNuRE4zdUFqOWJu?=
 =?utf-8?B?Vi9iNU1CWFdPVjE3YWtldytSczFXVXMrWURoUHp3ZE9aQ0U1YmU1b1l4QzR1?=
 =?utf-8?B?S1BXdktOUEwvQzV6OGxHVWtJWGt2QWI5QUZlSE5BT3Z5b2lsS2x6bzk3QldF?=
 =?utf-8?B?MHZNdzIxdWxNS0ZiQXNuc2VvZmlxZ2pmN3ZnejhkQ2ZMM2xpbkZXNVNQWmRL?=
 =?utf-8?B?anpXUzlWSFdqRWpTdmxNbURKQy9NWVJob1BsTkN1bGwyanlaNmpXUzZFblBv?=
 =?utf-8?B?ZTN1eWRmSmErUWtBTklLMWdYWlRXdkliZzJyRzkwU0lERmFiM0FvNlNKWHB3?=
 =?utf-8?B?OUVaZUdzSjlSdDVzck5iRTVqV2NMWlVLSkI2Z1JraVZaMW5yZ2UvMHRnK3c0?=
 =?utf-8?B?NU5FUkFUYmFLWHhFSXZGYVNSMUErdWlyQnphY3pFVm1EL1gzNHlBTlJ0cXY1?=
 =?utf-8?B?TXp2SWx1b0FyYWJYQ1l6bCtwWVRRSlBSaDV1Yk8ybkxTVHh1L0UvQ2J1bmdQ?=
 =?utf-8?B?VWlua3lCZzNxMk9WaVZSa3I0aXZoV05vYmsxVWI4K29DU0pwdUFNTkN6dUg5?=
 =?utf-8?B?WkVOWWd5RG5FbDFmelJna0pWSGR5VmRraGhRUjl6S3FJTG9zR0Y2dGVoM2lC?=
 =?utf-8?B?aXRUNGY0WmF4STZMQnpEK3MzUWdOL3J2R01lSkhZWmE0bDZSUmF5RkhVMDRh?=
 =?utf-8?B?WldXRHF1ZW5hK3pqbHBUdFNrd0tFVlhob2hKZm16NTh0dWFHbFVoOFFkTGRs?=
 =?utf-8?Q?fjhR05L6fFyPc1ZjrvItmSOHk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d5d2a1-5e1b-452a-c07d-08dac9657575
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:04:42.6815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XygH5//Gv7uJ6vbjaKBUcEFutreJGvssMRvmR/L9UPgOMzUWaWoK/hUZU/Kvp7Xr2q/dSsOZpcAwDezfTlbEOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8218

On 18.11.2022 13:39, Roger Pau Monne wrote:
> On one of my boxes when the HDMI cable is not plugged in the
> FrameBufferBase of the EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE structure is
> set to 0 by the firmware (while some of the other fields looking
> plausible).
> 
> Such (bogus address) ends up mapped in vesa_init(), and since it
> overlaps with a RAM region the whole system goes down pretty badly,
> see:
> 
> (XEN) vesafb: framebuffer at 0x0000000000000000, mapped to 0xffff82c000201000, using 35209k, total 35209k
> (XEN) vesafb: mode is 0x37557x32, linelength=960, font 8x16

Interesting mode - should we check for non-zero values there as well,
perhaps?

> (XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:0:8:16
> (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) �ERROR: Class:0; Subclass:0; Operation: 0
> ERROR: No ConOut
> ERROR: No ConIn
> 
> Do like Linux and prevent using the EFI Frame Buffer if the base
> address is 0.  This is inline with the logic in Linuxes
> fb_base_is_valid() function at drivers/video/fbdev/efifb.c v6.0.9.
> 
> See also Linux commit 133bb070e94ab41d750c6f2160c8843e46f11b78 for
> further reference.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Other options would be doing the check in vesa_init(), but that would
> also then apply to other framebuffers and won't be strictly limited to
> the EFI fb.

Well, zero is wrong uniformly, so it wouldn't seem unreasonable to
put the check there. But I'm happy to keep it in EFI code for now.

> We could also check in vesa_init() whether the framebuffer overlaps
> with any RAM region, but I think that should be in addition to the
> change done here.

Indeed.

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -552,7 +552,7 @@ static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>          bpp  = 0;
>          break;
>      }
> -    if ( bpp > 0 )
> +    if ( bpp > 0 && gop->Mode->FrameBufferBase )
>      {
>          vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
>          vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */

A few lines up from here, just out of patch context, there is a
PrintErr() which imo is bogus/misleading when also encountering a
zero fb base. I'd like to suggest that you put the new check early
in the function (perhaps extended by a zero check of other
applicable fields, as per above), returning right away alongside
another new PrintErr().

Jan

