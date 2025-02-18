Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D7A3A7A5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 20:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892185.1301178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkTKo-0002Hr-Ta; Tue, 18 Feb 2025 19:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892185.1301178; Tue, 18 Feb 2025 19:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkTKo-0002Fd-Qg; Tue, 18 Feb 2025 19:32:46 +0000
Received: by outflank-mailman (input) for mailman id 892185;
 Tue, 18 Feb 2025 19:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBFm=VJ=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1tkTKo-0002FX-3g
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 19:32:46 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fe2244f-ee2f-11ef-9aa8-95dc52dad729;
 Tue, 18 Feb 2025 20:32:44 +0100 (CET)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4be55c93be1so524723137.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 11:32:44 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e85984c6sm2541496241.16.2025.02.18.11.32.40
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 11:32:41 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-4be55c93be1so524697137.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 11:32:40 -0800 (PST)
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
X-Inumbo-ID: 1fe2244f-ee2f-11ef-9aa8-95dc52dad729
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907162; x=1740511962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb7jRjd6uguB9cG41rTvHpSN+ZVtgW/KmSvyau5JmeE=;
        b=BhTiHawPi5e71JzmhJQ65fHUgJq3X4gsvFIqpA3KBJdB6mDmGMWyoL71OD9k5AOkR8
         ZXcObbpGhfHtsGXQIeOAXp8yMxpQsyrwVETMIBYK+TKCf0iC+jE8GXwcXUC2lRv3zPNq
         UaLNCk/owBHxRtEyWE56YioT0r+mzZimIuy1GJ6vSZMB6Kh1AnkpZmaw20rnHNMe7jGl
         hm3jSpkDefaD9+cvkftLRvVOlcOTXk1vGtyuz0zCuABBhjD1FueCwFWiFu/EXxGVb0jx
         O9/a5wM946glFX3lkQRn95n8F+6fu0/WKDTNrNzPkWqCG/1ikphxH6fGoPMMc3h5kkLK
         M9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH13aaDqY2ASO+klMJsvleRbxwYqv2LyuU7FSa9eMC+qc/NKrak25umq65R6gIJWbweyEWj9YPVXA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTwsp8VbEI8Lu1S7g9kGSxXBEjqGHv9ZTQcWY+5keN4qYrG0BN
	cpEb9Ir1bBOfIyiFPTjciOYcmiGZJ1nLKIK4vtXutntDPtAWdhOBvg69ve2O
X-Gm-Gg: ASbGncuOyl5tt6TAv4lXfEia9MGmlEl7M4k/wVzwmOE/1J2OFNkhM/vbSdZmxp0vSdh
	O2aNdSjDlNGjbV6DXpIcOJ4t1Zr7hjRZEQpPnf1vWUhfKkZnhOnHOX//Wlg9yr9O2Mv4gETWsZZ
	IDxG8/Vr7jGHkncn1WOEXwK7Y7eTbueR5YK4Zuu5CylBwpgRCVApVR5NaK4CpGxDtQxN5p4Ym2i
	dUyh+xA/iqsh+0Jc59PLN0rbNiPxopP7u/Hj4Y1q8nXaxKEXdaQJv7SVEFbrgBaXLs4IMo4BdlU
	o6SEfI0n9XnV/IanNXkevHaujpdZSi752cckTsDq+vVy+o0AvCnh+w==
X-Google-Smtp-Source: AGHT+IE0kgMETq1MHOZx3d5iwG0k56TLY+69UOEjHp7lRednRmuqWyodqWaErhstwg1mgnX3X20wZQ==
X-Received: by 2002:a05:6102:2921:b0:4bb:dc3c:1b3e with SMTP id ada2fe7eead31-4be85bfefeemr648701137.12.1739907161836;
        Tue, 18 Feb 2025 11:32:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0+535BxaX1MIkMeDW/hqNkV8t5LL3n6Cky4OtL2aK9Bjnp3LLxjwTW+iieVMNJPT3M5GED6pBlUA=@lists.xenproject.org
X-Received: by 2002:a05:6102:b10:b0:4bb:d394:46c5 with SMTP id
 ada2fe7eead31-4be85bb8970mr656557137.9.1739907160582; Tue, 18 Feb 2025
 11:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de> <20250218142542.438557-3-tzimmermann@suse.de>
In-Reply-To: <20250218142542.438557-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 20:32:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
X-Gm-Features: AWEUYZnARFSxvjPUxC-uDBDfMGz-IvL-HNvEMBPwKo8soOA7GylWEHj75pA7v34
Message-ID: <CAMuHMdV939ibJTRSaO-oW2Jz4zbkXGRpUYrmA7e=yQfF7W-k_g@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Tue, 18 Feb 2025 at 15:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Add drm_modes_size_dumb(), a helper to calculate the dumb-buffer
> scanline pitch and allocation size. Implementations of struct
> drm_driver.dumb_create can call the new helper for their size
> computations.
>
> There is currently quite a bit of code duplication among DRM's
> memory managers. Each calculates scanline pitch and buffer size
> from the given arguments, but the implementations are inconsistent
> in how they treat alignment and format support. Later patches will
> unify this code on top of drm_mode_size_dumb() as much as possible.
>
> drm_mode_size_dumb() uses existing 4CC format helpers to interpret
> the given color mode. This makes the dumb-buffer interface behave
> similar the kernel's video= parameter. Current per-driver implementations
> again likely have subtle differences or bugs in how they support color
> modes.
>
> The dumb-buffer UAPI is only specified for known color modes. These
> values describe linear, single-plane RGB color formats or legacy index
> formats. Other values should not be specified. But some user space
> still does. So for unknown color modes, there are a number of known
> exceptions for which drm_mode_size_dumb() calculates the pitch from
> the bpp value, as before. All other values work the same but print
> an error.
>
> v3:
> - document the UAPI semantics
> - compute scanline pitch from for unknown color modes (Andy, Tomi)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> +/**
> + * drm_mode_size_dumb - Calculates the scanline and buffer sizes for dumb buffers
> + * @dev: DRM device
> + * @args: Parameters for the dumb buffer
> + * @pitch_align: Scanline alignment in bytes
> + * @size_align: Buffer-size alignment in bytes
> + *
> + * The helper drm_mode_size_dumb() calculates the size of the buffer
> + * allocation and the scanline size for a dumb buffer. Callers have to
> + * set the buffers width, height and color mode in the argument @arg.
> + * The helper validates the correctness of the input and tests for
> + * possible overflows. If successful, it returns the dumb buffer's
> + * required scanline pitch and size in &args.
> + *
> + * The parameter @pitch_align allows the driver to specifies an
> + * alignment for the scanline pitch, if the hardware requires any. The
> + * calculated pitch will be a multiple of the alignment. The parameter
> + * @size_align allows to specify an alignment for buffer sizes. The
> + * returned size is always a multiple of PAGE_SIZE.
> + *
> + * Returns:
> + * Zero on success, or a negative error code otherwise.
> + */
> +int drm_mode_size_dumb(struct drm_device *dev,
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align)
> +{
> +       u64 pitch = 0;
> +       u32 fourcc;
> +
> +       /*
> +        * The scanline pitch depends on the buffer width and the color
> +        * format. The latter is specified as a color-mode constant for
> +        * which we first have to find the corresponding color format.
> +        *
> +        * Different color formats can have the same color-mode constant.
> +        * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> +        * It is possible to use different formats for dumb-buffer allocation
> +        * and rendering as long as all involved formats share the same
> +        * color-mode constant.
> +        */
> +       fourcc = drm_driver_color_mode_format(dev, args->bpp);
> +       if (fourcc != DRM_FORMAT_INVALID) {
> +               const struct drm_format_info *info = drm_format_info(fourcc);
> +
> +               if (!info)
> +                       return -EINVAL;
> +               pitch = drm_format_info_min_pitch(info, 0, args->width);
> +       } else if (args->bpp) {
> +               /*
> +                * Some userspace throws in arbitrary values for bpp and
> +                * relies on the kernel to figure it out. In this case we
> +                * fall back to the old method of using bpp directly. The
> +                * over-commitment of memory from the rounding is acceptable
> +                * for compatibility with legacy userspace. We have a number
> +                * of deprecated legacy values that are explicitly supported.
> +                */
> +               switch (args->bpp) {
> +               default:
> +                       drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",

%u

> +                                args->bpp);
> +                       fallthrough;
> +               case 12:
> +               case 15:
> +               case 30: /* see drm_gem_afbc_get_bpp() */
> +               case 10:

Perhaps keep them sorted numerically?

> +               case 64: /* used by Mesa */
> +                       pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> +                       break;
> +               }
> +       }
> +
> +       if (!pitch || pitch > U32_MAX)
> +               return -EINVAL;
> +
> +       args->pitch = pitch;
> +
> +       return drm_mode_align_dumb(args, pitch_align, size_align);
> +}
> +EXPORT_SYMBOL(drm_mode_size_dumb);
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>                          struct drm_mode_create_dumb *args,
>                          struct drm_file *file_priv)
> diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
> new file mode 100644
> index 000000000000..6fe36004b19d
> --- /dev/null
> +++ b/include/drm/drm_dumb_buffers.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DRM_DUMB_BUFFERS_H__
> +#define __DRM_DUMB_BUFFERS_H__
> +
> +struct drm_device;
> +struct drm_mode_create_dumb;
> +
> +int drm_mode_size_dumb(struct drm_device *dev,
> +                      struct drm_mode_create_dumb *args,
> +                      unsigned long pitch_align,
> +                      unsigned long size_align);
> +
> +#endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..eea09103b1a6 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1058,7 +1058,7 @@ struct drm_mode_crtc_page_flip_target {
>   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>   * @height: buffer height in pixels
>   * @width: buffer width in pixels
> - * @bpp: bits per pixel
> + * @bpp: color mode
>   * @flags: must be zero
>   * @handle: buffer object handle
>   * @pitch: number of bytes between two consecutive lines
> @@ -1066,6 +1066,50 @@ struct drm_mode_crtc_page_flip_target {
>   *
>   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>   * the kernel fills @handle, @pitch and @size.
> + *
> + * The value of @bpp is a color-mode number describing a specific format
> + * or a variant thereof. The value often corresponds to the number of bits
> + * per pixel for most modes, although there are exceptions. Each color mode
> + * maps to a DRM format plus a number of modes with similar pixel layout.
> + * Framebuffer layout is always linear.
> + *
> + * Support for all modes and formats is optional. Even if dumb-buffer
> + * creation with a certain color mode succeeds, it is not guaranteed that
> + * the DRM driver supports any of the related formats. Most drivers support
> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> + * plane.
> + *
> + * +------------+------------------------+------------------------+
> + * | Color mode | Framebuffer format     | Compatibles            |
> + * +============+========================+========================+
> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_XBGR8888 |
> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> + * |            |                        |  * DRM_FORMAT_BGRX8888 |
> + * +------------+------------------------+------------------------+
> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> + * +------------+------------------------+------------------------+
> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> + * +------------+------------------------+------------------------+
> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_XBGR1555 |
> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> + * |            |                        |  * DRM_FORMAT_BGRX1555 |
> + * +------------+------------------------+------------------------+
> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_R8       |

+ DRM_FORMAT_D8? (and 4/2/1 below)

And DRM_FORMAT_Y8, if/when Tomi's series introducing that is accepted...

> + * +------------+------------------------+------------------------+
> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_R4       |
> + * +------------+------------------------+------------------------+
> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_R2       |
> + * +------------+------------------------+------------------------+
> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_R1       |
> + * +------------+------------------------+------------------------+
> + *
> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> + * legacy user space. Please don't use them in new code. Other modes
> + * are not support.
> + *
> + * Do not attempt to allocate anything but linear framebuffer memory
> + * with single-plane RGB data. Allocation of other framebuffer
> + * layouts requires dedicated ioctls in the respective DRM driver.
>   */
>  struct drm_mode_create_dumb {
>         __u32 height;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

