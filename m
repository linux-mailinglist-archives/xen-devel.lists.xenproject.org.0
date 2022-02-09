Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A54AE66A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 03:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268763.462711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHcT9-0000xu-Fe; Wed, 09 Feb 2022 02:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268763.462711; Wed, 09 Feb 2022 02:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHcT9-0000w3-CB; Wed, 09 Feb 2022 02:12:31 +0000
Received: by outflank-mailman (input) for mailman id 268763;
 Wed, 09 Feb 2022 02:12:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0q/=SY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nHcT8-0000vv-1X
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 02:12:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba5b7558-894d-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 03:12:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6FA4615FD;
 Wed,  9 Feb 2022 02:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A1FC004E1;
 Wed,  9 Feb 2022 02:12:25 +0000 (UTC)
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
X-Inumbo-ID: ba5b7558-894d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644372746;
	bh=eYTFPHLYqSlkHdFHZPO17fHDtEBhGQow7GlEeliKdUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ot9Z2qZRodzBKbIOIFgVQTieYfDyGPP8hD1e5gnJdtnzuJIUV6J5lTwuoEDmXKdio
	 01IlhbP8UTDOU6Ieq4lBH2m1vJlh2XpAPUUrFBvRMZwK3RfCFOD8Rf5moAZN6UW3F3
	 uShZcbHnVSn0v3gz901nx1RxZNWoQ3goXszU5BqTH46v+JdWUTizq3tYttx2jsqf0V
	 WFZyqnpW9mkbmveah3m+cZdf90Ke9mV+YVLr0EEzXM4GBz8wC5sc0Ne4wY4QETXyBw
	 RbSakZU7hfWMWBH1I+U8exIcNuEf7A0NkxYjlbQX7tDfjxxnbQWgdXZtPkksD2n08x
	 RuKsF1PV8smvw==
Date: Tue, 8 Feb 2022 18:12:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, ehem+xen@m5p.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC 2/3] xen/arm: efi: Introduce and fill the
 vga_console_info
In-Reply-To: <20220206192839.75711-3-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2202081809060.2091381@ubuntu-linux-20-04-desktop>
References: <20220206192839.75711-1-julien@xen.org> <20220206192839.75711-3-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 6 Feb 2022, Julien Grall wrote:
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

Yes, I think we should enable Dom0 to use the EFI framebuffer even if
Xen is built with CONFIG_VIDEO=n. I think CONFIG_VIDEO should be about
Xen's support for video output, not the guest's support for video
(including dom0's).

If we want to enable a super-minimal build of Xen with EFI support but
without VIDEO support even for Dom0, we could introduce a separate
Kconfig option for it. Probably not worth it.


> ---
>  xen/arch/arm/efi/efi-boot.h |  6 ---
>  xen/arch/arm/setup.c        |  4 ++
>  xen/arch/x86/efi/efi-boot.h | 72 ------------------------------------
>  xen/common/efi/boot.c       | 74 ++++++++++++++++++++++++++++++++++++-
>  xen/include/xen/vga.h       |  2 +-
>  5 files changed, 78 insertions(+), 80 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index ae8627134e5a..17a3d46c59ae 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -1000,12 +1000,6 @@ static void __init efi_arch_console_init(UINTN cols, UINTN rows)
>  {
>  }
>  
> -static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
> -                                       UINTN info_size,
> -                                       EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info)
> -{
> -}
> -
>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
>  {
>      __flush_dcache_area(vaddr, size);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed48a..a336ee58179c 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -71,6 +71,10 @@ static unsigned long opt_xenheap_megabytes __initdata;
>  integer_param("xenheap_megabytes", opt_xenheap_megabytes);
>  #endif
>  
> +#ifndef CONFIG_VIDEO
> +struct xen_vga_console_info vga_console_info;
> +#endif
> +
>  domid_t __read_mostly max_init_domid;
>  
>  static __used void init_done(void)
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index f69509a2103a..cba3fa75a475 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -3,7 +3,6 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> -#include <xen/vga.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
>  #include <asm/microcode.h>
> @@ -497,77 +496,6 @@ static void __init efi_arch_console_init(UINTN cols, UINTN rows)
>  #endif
>  }
>  
> -static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
> -                                       UINTN info_size,
> -                                       EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info)
> -{
> -#ifdef CONFIG_VIDEO
> -    int bpp = 0;
> -
> -    switch ( mode_info->PixelFormat )
> -    {
> -    case PixelRedGreenBlueReserved8BitPerColor:
> -        vga_console_info.u.vesa_lfb.red_pos = 0;
> -        vga_console_info.u.vesa_lfb.red_size = 8;
> -        vga_console_info.u.vesa_lfb.green_pos = 8;
> -        vga_console_info.u.vesa_lfb.green_size = 8;
> -        vga_console_info.u.vesa_lfb.blue_pos = 16;
> -        vga_console_info.u.vesa_lfb.blue_size = 8;
> -        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
> -        vga_console_info.u.vesa_lfb.rsvd_size = 8;
> -        bpp = 32;
> -        break;
> -    case PixelBlueGreenRedReserved8BitPerColor:
> -        vga_console_info.u.vesa_lfb.red_pos = 16;
> -        vga_console_info.u.vesa_lfb.red_size = 8;
> -        vga_console_info.u.vesa_lfb.green_pos = 8;
> -        vga_console_info.u.vesa_lfb.green_size = 8;
> -        vga_console_info.u.vesa_lfb.blue_pos = 0;
> -        vga_console_info.u.vesa_lfb.blue_size = 8;
> -        vga_console_info.u.vesa_lfb.rsvd_pos = 24;
> -        vga_console_info.u.vesa_lfb.rsvd_size = 8;
> -        bpp = 32;
> -        break;
> -    case PixelBitMask:
> -        bpp = set_color(mode_info->PixelInformation.RedMask, bpp,
> -                        &vga_console_info.u.vesa_lfb.red_pos,
> -                        &vga_console_info.u.vesa_lfb.red_size);
> -        bpp = set_color(mode_info->PixelInformation.GreenMask, bpp,
> -                        &vga_console_info.u.vesa_lfb.green_pos,
> -                        &vga_console_info.u.vesa_lfb.green_size);
> -        bpp = set_color(mode_info->PixelInformation.BlueMask, bpp,
> -                        &vga_console_info.u.vesa_lfb.blue_pos,
> -                        &vga_console_info.u.vesa_lfb.blue_size);
> -        if ( mode_info->PixelInformation.ReservedMask )
> -            bpp = set_color(mode_info->PixelInformation.ReservedMask, bpp,
> -                            &vga_console_info.u.vesa_lfb.rsvd_pos,
> -                            &vga_console_info.u.vesa_lfb.rsvd_size);
> -        if ( bpp > 0 )
> -            break;
> -        /* fall through */
> -    default:
> -        PrintErr(L"Current graphics mode is unsupported!\r\n");
> -        bpp  = 0;
> -        break;
> -    }
> -    if ( bpp > 0 )
> -    {
> -        vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
> -        vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
> -        vga_console_info.u.vesa_lfb.width =
> -            mode_info->HorizontalResolution;
> -        vga_console_info.u.vesa_lfb.height = mode_info->VerticalResolution;
> -        vga_console_info.u.vesa_lfb.bits_per_pixel = bpp;
> -        vga_console_info.u.vesa_lfb.bytes_per_line =
> -            (mode_info->PixelsPerScanLine * bpp + 7) >> 3;
> -        vga_console_info.u.vesa_lfb.lfb_base = gop->Mode->FrameBufferBase;
> -        vga_console_info.u.vesa_lfb.ext_lfb_base = gop->Mode->FrameBufferBase >> 32;
> -        vga_console_info.u.vesa_lfb.lfb_size =
> -            (gop->Mode->FrameBufferSize + 0xffff) >> 16;
> -    }
> -#endif
> -}
> -
>  static void __init efi_arch_memory_setup(void)
>  {
>      unsigned int i;
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 80e4e32623c4..2bc38ae40fff 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -20,6 +20,7 @@
>  #endif
>  #include <xen/string.h>
>  #include <xen/stringify.h>
> +#include <xen/vga.h>
>  #ifdef CONFIG_X86
>  /*
>   * Keep this arch-specific modified include in the common file, as moving
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
> +
>  static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop_mode)
>  {
>      EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info;
> @@ -1042,7 +1114,7 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>      /* Get graphics and frame buffer info. */
>      status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
>      if ( !EFI_ERROR(status) )
> -        efi_arch_video_init(gop, info_size, mode_info);
> +        efi_video_init(gop, info_size, mode_info);
>  }
>  
>  #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
> diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
> index f72b63d446b1..39b4c2eae198 100644
> --- a/xen/include/xen/vga.h
> +++ b/xen/include/xen/vga.h
> @@ -11,7 +11,7 @@
>  
>  #include <xen/video.h>
>  
> -#ifdef CONFIG_VGA
> +#if defined(CONFIG_VGA) || defined(CONFIG_ARM)
>  extern struct xen_vga_console_info vga_console_info;
>  #endif
>  
> -- 
> 2.32.0
> 

