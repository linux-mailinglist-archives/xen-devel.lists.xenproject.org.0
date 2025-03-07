Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE07A568C1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 14:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904713.1312777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqXbz-0002tH-Ct; Fri, 07 Mar 2025 13:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904713.1312777; Fri, 07 Mar 2025 13:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqXbz-0002sW-9I; Fri, 07 Mar 2025 13:19:35 +0000
Received: by outflank-mailman (input) for mailman id 904713;
 Fri, 07 Mar 2025 08:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lT2w=V2=ffwll.ch=simona.vetter@srs-se1.protection.inumbo.net>)
 id 1tqTHu-0000s3-N0
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:42:34 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a4b0e0a-fb30-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 09:42:29 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43bc38bb6baso9184315e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 00:42:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0194f2sm4703188f8f.54.2025.03.07.00.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 00:42:27 -0800 (PST)
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
X-Inumbo-ID: 1a4b0e0a-fb30-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741336948; x=1741941748; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=US2Wc6icG0i9/47aJ/pkH3GP4es8yYK0BFMiCt7We04=;
        b=j5qCM1yIkKBEdb4LzYrdrMwPkdnC0vuVkIf9HDl/t8+UNKmKOFEn/5HYq1A9mfddRZ
         nepYsMLgNHres99VsG0u/SHGqSTe+YAWFPzdWWATVlTjxQyf09JotI7wQ4uGFbEVRBdD
         xhdFORO8E2cZDe3Ky9r+ew8fPD8ujZmhFM4oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336948; x=1741941748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=US2Wc6icG0i9/47aJ/pkH3GP4es8yYK0BFMiCt7We04=;
        b=qf+YvI+wgdWzbO7KeDvLvjuxWO9dL74QamdaJJOkFFV0cJ+J9FPrPim18tQ91Rh8Yt
         ZxoL8V41pZl2m19FmI56iaTEfTL0jrg1fB7As4eKV2wCO8A8TKU+EwinwZrpqJwELua8
         hWH6JWEEEEsnD9NAQnQ2NjpZYQBkxmYbrDBjshqKPan/7CidBtJ0+47d0rU+A+WweJE8
         Xbv2Smsiikg2VGEKgtFqUVx6zSHuZ+uaafprXevyhVCJ4+CR2dljc7CBrpXGq/5srn1O
         LxUGeQJkgxGidHX18XZNky4ap7cDO53lgVc8+cg0j3fDhnlreg04AWj3Dxr7iQUJZinm
         VzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvaOx7IxO6YXCIsuPP4GMZ0v3SS2zLh9qOoO+yPa1xM+UGCEmQjF3NajmXQhQfjjetk3vMbgfCuo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZti91BNTUoZIn7+LIhWD4zHU/YgvNjMdVMJXVEOMXN8GNOI9C
	SAdOVE6xW+EPDKmmTAF0unyBLuMFffViWMi84JWt14Np1y7+xcN16H7caKNFfzE=
X-Gm-Gg: ASbGncvM+W8Da1PB6F3JvdQbViDEJWlIbw4qOu6jgt8J1jGqKkVanv55nGIi05Bu01H
	OGYmJZW+zgpSKoepYQwz2kmYn/LVsodow9ufxEGOYnTaJlIsCNwKZYRSTMXwwiZeItLWhqlCMxx
	9PGtJQmmwdn+QH+llh/AKGoFR4qeC2SHdMAPcf2Zw+ta61fFxlrGyO5YRd2RzR9cNVXKkaveQOU
	5O06ypcvk9R2xEoMFls1447C+jurn3ZSnz4p4itxsss2kPS1pBCDKv6/uS1CQe+btiCJp3Y4LlE
	3PHQn5kdmysdr8B1WDpyvqrZ4n2+n0bch1CoeX4QGwkyRQjagqJ1qy7u
X-Google-Smtp-Source: AGHT+IHeHcCAYfYIfg5Jap/0uuzQ6Oi2iytybYQTlJnuwARBxYqbc0PxFDylyktyJP3I4EPX9/4QPQ==
X-Received: by 2002:a05:600c:1c19:b0:439:a1ef:c238 with SMTP id 5b1f17b1804b1-43c601e1162mr16070975e9.13.1741336948296;
        Fri, 07 Mar 2025 00:42:28 -0800 (PST)
Date: Fri, 7 Mar 2025 09:42:25 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
Message-ID: <Z8qxcTIcD4W5OGwL@phenom.ffwll.local>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 18, 2025 at 03:23:25PM +0100, Thomas Zimmermann wrote:
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
> ---
>  drivers/gpu/drm/drm_dumb_buffers.c | 116 +++++++++++++++++++++++++++++
>  include/drm/drm_dumb_buffers.h     |  14 ++++
>  include/uapi/drm/drm_mode.h        |  46 +++++++++++-
>  3 files changed, 175 insertions(+), 1 deletion(-)
>  create mode 100644 include/drm/drm_dumb_buffers.h
> 
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index 9916aaf5b3f2..600ab281712b 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -25,6 +25,8 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_dumb_buffers.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_mode.h>
>  
> @@ -57,6 +59,120 @@
>   * a hardware-specific ioctl to allocate suitable buffer objects.
>   */
>  
> +static int drm_mode_align_dumb(struct drm_mode_create_dumb *args,
> +			       unsigned long pitch_align,
> +			       unsigned long size_align)
> +{
> +	u32 pitch = args->pitch;
> +	u32 size;
> +
> +	if (!pitch)
> +		return -EINVAL;
> +
> +	if (pitch_align)
> +		pitch = roundup(pitch, pitch_align);
> +
> +	/* overflow checks for 32bit size calculations */
> +	if (args->height > U32_MAX / pitch)
> +		return -EINVAL;
> +
> +	if (!size_align)
> +		size_align = PAGE_SIZE;
> +	else if (!IS_ALIGNED(size_align, PAGE_SIZE))
> +		return -EINVAL;
> +
> +	size = ALIGN(args->height * pitch, size_align);
> +	if (!size)
> +		return -EINVAL;
> +
> +	args->pitch = pitch;
> +	args->size = size;
> +
> +	return 0;
> +}
> +
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
> +		       struct drm_mode_create_dumb *args,
> +		       unsigned long pitch_align,
> +		       unsigned long size_align)
> +{
> +	u64 pitch = 0;
> +	u32 fourcc;
> +
> +	/*
> +	 * The scanline pitch depends on the buffer width and the color
> +	 * format. The latter is specified as a color-mode constant for
> +	 * which we first have to find the corresponding color format.
> +	 *
> +	 * Different color formats can have the same color-mode constant.
> +	 * For example XRGB8888 and BGRX8888 both have a color mode of 32.
> +	 * It is possible to use different formats for dumb-buffer allocation
> +	 * and rendering as long as all involved formats share the same
> +	 * color-mode constant.
> +	 */
> +	fourcc = drm_driver_color_mode_format(dev, args->bpp);
> +	if (fourcc != DRM_FORMAT_INVALID) {
> +		const struct drm_format_info *info = drm_format_info(fourcc);
> +
> +		if (!info)
> +			return -EINVAL;
> +		pitch = drm_format_info_min_pitch(info, 0, args->width);
> +	} else if (args->bpp) {
> +		/*
> +		 * Some userspace throws in arbitrary values for bpp and
> +		 * relies on the kernel to figure it out. In this case we
> +		 * fall back to the old method of using bpp directly. The
> +		 * over-commitment of memory from the rounding is acceptable
> +		 * for compatibility with legacy userspace. We have a number
> +		 * of deprecated legacy values that are explicitly supported.
> +		 */
> +		switch (args->bpp) {
> +		default:
> +			drm_warn(dev, "Unknown color mode %d; guessing buffer size.\n",
> +				 args->bpp);
> +			fallthrough;

We cannot let userspace trigger dmesg warnings (or anything else really
that spams logs). Also I think for future proofing it would be good if we
just reject anything we don't currently know about instead of silently
letting this mess become worse. Hence my vote is to reject unknown bpp
hack values.

> +		case 12:
> +		case 15:
> +		case 30: /* see drm_gem_afbc_get_bpp() */

This is a bit too cryptic to me, I think if you want to do comments I'd
just put a long-form one above each value that explains where we've found
it and why it happens. I'm also assuming these all have depth = 0, which I
guess is something we should check just to keep this as strict as
possible? Or do they have matching depth?

Cheers, Sima

> +		case 10:
> +		case 64: /* used by Mesa */
> +			pitch = args->width * DIV_ROUND_UP(args->bpp, SZ_8);
> +			break;
> +		}
> +	}
> +
> +	if (!pitch || pitch > U32_MAX)
> +		return -EINVAL;
> +
> +	args->pitch = pitch;
> +
> +	return drm_mode_align_dumb(args, pitch_align, size_align);
> +}
> +EXPORT_SYMBOL(drm_mode_size_dumb);
> +
>  int drm_mode_create_dumb(struct drm_device *dev,
>  			 struct drm_mode_create_dumb *args,
>  			 struct drm_file *file_priv)
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
> +		       struct drm_mode_create_dumb *args,
> +		       unsigned long pitch_align,
> +		       unsigned long size_align);
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
>  	__u32 height;
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

