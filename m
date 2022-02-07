Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71B4AC8EF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 19:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267399.461148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH9BI-0000Im-AB; Mon, 07 Feb 2022 18:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267399.461148; Mon, 07 Feb 2022 18:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH9BI-0000G0-6R; Mon, 07 Feb 2022 18:56:08 +0000
Received: by outflank-mailman (input) for mailman id 267399;
 Mon, 07 Feb 2022 18:56:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nH9BH-0000Fu-4E
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 18:56:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH9B8-00025U-3B; Mon, 07 Feb 2022 18:55:58 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH9B7-0004kB-T8; Mon, 07 Feb 2022 18:55:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=PvXddK7ZLsr1uVljwtgdIfh5FouFoHEvfXArANRrzWc=; b=EwAk9gWqppOalFZZpA0XFh6o88
	EdlRweI7hCIiA9XZFThkoiT4V6l2ke/mgos0ksAtAxs/FijevmQUYVBuci7B9WjgMMPC8LFgxt7bc
	orGCJ9Zhe2vNTSSk7AxOpdGu8y0rfywNQP/jzwPeN7t1ktP8oRhK8Lu8V6MtBDjbwimQ=;
Message-ID: <adabf0a7-63b6-6c3b-2701-408848f30261@xen.org>
Date: Mon, 7 Feb 2022 18:55:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH RFC 2/3] xen/arm: efi: Introduce and fill the
 vga_console_info
To: Jan Beulich <jbeulich@suse.com>
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
 <6249db03-01b5-e1bb-75ad-5946e16f639d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6249db03-01b5-e1bb-75ad-5946e16f639d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/02/2022 08:53, Jan Beulich wrote:
> On 06.02.2022 20:28, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In a follow-up patch will we want to add support for EFI framebuffer
>> in dom0. Yet, Xen may not use the framebuffer, so it would be ideal
>> to not have to enable CONFIG_VIDEO/CONFIG_VGA.
>>
>> Introduce vga_console_info in a hacky way and move the code
>> to fill it up from x86 to common.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>
>> This is a bit of a hack. Sent early to gather opinion on whether
>> we should enable allow Dom0 to use the EFI Framebuffer even
>> if Xen is built with CONFIG_VIDEO=n on Arm.
> 
> I have no input here; this will need to be settled among you Arm folks.
> I have no objection to the code movement, just one nit:
> 
>> @@ -1025,6 +1026,77 @@ static void __init efi_get_apple_properties(void)
>>       }
>>   }
>>   
>> +static void __init efi_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>> +                                  UINTN info_size,
>> +                                  EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info)
>> +{
>> +#if defined(CONFIG_VIDEO) || defined(CONFIG_ARM)
>> +    int bpp = 0;
>> +
>> +    switch ( mode_info->PixelFormat )
>> +    {
>> +    case PixelRedGreenBlueReserved8BitPerColor:
>> +        vga_console_info.u.vesa_lfb.red_pos = 0;
>> +        vga_console_info.u.vesa_lfb.red_size = 8;
>> +        vga_console_info.u.vesa_lfb.green_pos = 8;
>> +        vga_console_info.u.vesa_lfb.green_size = 8;
>> +        vga_console_info.u.vesa_lfb.blue_pos = 16;
>> +        vga_console_info.u.vesa_lfb.blue_size = 8;
>> +        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
>> +        vga_console_info.u.vesa_lfb.rsvd_size = 8;
>> +        bpp = 32;
>> +        break;
>> +    case PixelBlueGreenRedReserved8BitPerColor:
>> +        vga_console_info.u.vesa_lfb.red_pos = 16;
>> +        vga_console_info.u.vesa_lfb.red_size = 8;
>> +        vga_console_info.u.vesa_lfb.green_pos = 8;
>> +        vga_console_info.u.vesa_lfb.green_size = 8;
>> +        vga_console_info.u.vesa_lfb.blue_pos = 0;
>> +        vga_console_info.u.vesa_lfb.blue_size = 8;
>> +        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
>> +        vga_console_info.u.vesa_lfb.rsvd_size = 8;
>> +        bpp = 32;
>> +        break;
>> +    case PixelBitMask:
>> +        bpp = set_color(mode_info->PixelInformation.RedMask, bpp,
>> +                        &vga_console_info.u.vesa_lfb.red_pos,
>> +                        &vga_console_info.u.vesa_lfb.red_size);
>> +        bpp = set_color(mode_info->PixelInformation.GreenMask, bpp,
>> +                        &vga_console_info.u.vesa_lfb.green_pos,
>> +                        &vga_console_info.u.vesa_lfb.green_size);
>> +        bpp = set_color(mode_info->PixelInformation.BlueMask, bpp,
>> +                        &vga_console_info.u.vesa_lfb.blue_pos,
>> +                        &vga_console_info.u.vesa_lfb.blue_size);
>> +        if ( mode_info->PixelInformation.ReservedMask )
>> +            bpp = set_color(mode_info->PixelInformation.ReservedMask, bpp,
>> +                            &vga_console_info.u.vesa_lfb.rsvd_pos,
>> +                            &vga_console_info.u.vesa_lfb.rsvd_size);
>> +        if ( bpp > 0 )
>> +            break;
>> +        /* fall through */
>> +    default:
>> +        PrintErr(L"Current graphics mode is unsupported!\r\n");
>> +        bpp  = 0;
>> +        break;
>> +    }
>> +    if ( bpp > 0 )
>> +    {
>> +        vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
>> +        vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
>> +        vga_console_info.u.vesa_lfb.width =
>> +            mode_info->HorizontalResolution;
>> +        vga_console_info.u.vesa_lfb.height = mode_info->VerticalResolution;
>> +        vga_console_info.u.vesa_lfb.bits_per_pixel = bpp;
>> +        vga_console_info.u.vesa_lfb.bytes_per_line =
>> +            (mode_info->PixelsPerScanLine * bpp + 7) >> 3;
>> +        vga_console_info.u.vesa_lfb.lfb_base = gop->Mode->FrameBufferBase;
>> +        vga_console_info.u.vesa_lfb.ext_lfb_base = gop->Mode->FrameBufferBase >> 32;
>> +        vga_console_info.u.vesa_lfb.lfb_size =
>> +            (gop->Mode->FrameBufferSize + 0xffff) >> 16;
>> +    }
>> +#endif
>> +}
> 
> While you move this code, could you please insert blank lines between
> non-fall-through case blocks, and perhaps another one between the switch()
> and the if() blocks? And it looks like
> - the "gop" parameter could also do with becoming pointer-to-const,

I can do that.

> - the expanded #ifdef could do with a comment briefly explaining why Arm
>    needs-special casing.
Agree. I will wait input with the others regarding the #ifdef approach 
before respinning this patch.

Cheers,

-- 
Julien Grall

