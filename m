Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7676AA3F122
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 10:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894344.1303062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlPn7-0005xc-Vd; Fri, 21 Feb 2025 09:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894344.1303062; Fri, 21 Feb 2025 09:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlPn7-0005uv-St; Fri, 21 Feb 2025 09:57:53 +0000
Received: by outflank-mailman (input) for mailman id 894344;
 Fri, 21 Feb 2025 09:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YbDz=VM=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1tlPn6-0005un-IZ
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 09:57:52 +0000
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e585ee9-f03a-11ef-9896-31a8f345e629;
 Fri, 21 Feb 2025 10:57:49 +0100 (CET)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-8641bc78952so482066241.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 01:57:49 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8581c6csm3765810241.8.2025.02.21.01.57.45
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 01:57:46 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-8622c3be2f4so467763241.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 01:57:45 -0800 (PST)
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
X-Inumbo-ID: 4e585ee9-f03a-11ef-9896-31a8f345e629
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131866; x=1740736666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRmDUg88sJqiPwLbbhmS638djtZJpa1TX+xwhTJhivE=;
        b=Nm84iqxeDWVQloH+x0Ojd3e7sAc7pNxb8+MVT4j0Vfdb6WceIL9FTeBfrvaZO/JosO
         8qLtjcDp/CZCwyYEA8F+3np54czKEz20ykaDVVjz1AN6/5NSGIVhKbPhkkkW/5hU2Khz
         G88CkTIEtYvnu7QwH0+pky5C7CttF1leaWa7qBpAZryjGpJb0vfQ4Y2BUbhB+lNUKM7G
         MCm8fWap+Jc/V6gbPzpmWAxXzIJlsMZmyoMY40XxY37tQoT54YrDdShMlNdHACe3rkwB
         Jfcwqed/ew3QmJXQi4YA8CLRDG8jmEepo27VhJULJ/wJzLoqETErhaq9lGQggekw2KFB
         /U3A==
X-Forwarded-Encrypted: i=1; AJvYcCW+5BPOeWZjSpnl+KgDcbTykfZtuNteMxHv8hi4MSq2TZlcgMS5Ex+ueWFUZ9lMXQpgxzk3GN+7A00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpwPxQe4FrxaBzRoHigGY3hx/hxL1aScFCKMqVt/r7oJQgJw4w
	h6OpVhTGqPDlAfEfqxEPx15umwyJtc4zgEflZprKYgNMiKmx94bPd+aTiXRz
X-Gm-Gg: ASbGncuA0H90HSmX4P81ztekVaRYyBAzUgsfFj0JvG61Do/MtCd/jN+VmbUEGSy4x/8
	c9BBKoz5lwZE0CWUkSP0spv57nOyuY39gQSRs0v613ZxVStHB/aXw+0sm6mzNuNrpItG/lZx/nw
	yEHMgBI/cUOFVkGlfMr5Sg+fNSS1HQs2FAseEa46HnG0aASMjTL2et9yntJdGAOh+HP7KhsnLsn
	Q9GjDnID9AN/RbgEqrLzQn11y9Etwuek+j1XwjJQKS6RPO6RTEaLH1DbA1gjnXKSbfSpV6Z0Jy7
	L/BZYuePTUnuvNZqDw/OJUOujR9QmYutKtDRcCWINTsy/pq9yfxS8sNLdZT3WAJW
X-Google-Smtp-Source: AGHT+IFLsvQE7dHtlOmbPr9cnAdzCaih6PIwJv452vy6mj9UOInXXMvpyjarljzDBwDscNpUdGao8w==
X-Received: by 2002:a05:6102:c04:b0:4bd:3519:44be with SMTP id ada2fe7eead31-4bfc0105e4dmr1529263137.15.1740131866532;
        Fri, 21 Feb 2025 01:57:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0dnFl71g+JCRdfByBBbxkO5XQX3ut3s2xmBIDUuULiPkLNy2X9kTD1ho0m6YWE/d788K28WRfWPU=@lists.xenproject.org
X-Received: by 2002:a05:6102:441c:b0:4b1:1eb5:8ee3 with SMTP id
 ada2fe7eead31-4bfc0277734mr1360564137.22.1740131865660; Fri, 21 Feb 2025
 01:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20250218142542.438557-1-tzimmermann@suse.de> <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com> <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
 <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com> <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
In-Reply-To: <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Feb 2025 10:57:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
X-Gm-Features: AWEUYZnV-ULUCYHgs2rYqHTa6wPlfKvTAAqMyxRQ0em_d1IVN8Mw0n8NQD9eWqI
Message-ID: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 21 Feb 2025 at 10:19, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
> > This change also first calls the drm_driver_color_mode_format(), which
> > could change the behavior even more, but afaics at the moment does not.
>
> Because currently each driver does its own thing, it can be hard to
> write user space that reliably allocates on all drivers. That's why it's
> important that parameters are not just raw numbers, but have
> well-defined semantics. The raw bpp is meaningless; it's also important
> to know which formats are associated with each value. Otherwise, you
> might get a dumb buffer with a bpp of 15, but it will be displayed
> incorrectly. This patch series finally implements this and clearly
> documents the assumptions behind the interfaces. The assumptions
> themselves have always existed.
>
> The color modes in drm_driver_color_mode_format() are set in stone and
> will not change incompatibly. It's already a user interface. I've taken
> care that the results do not change incompatibly compared to what the
> dumb-buffer ioctl currently assumes. (C1-C4 are special, see below.)
>
> > Although, maybe some platform does width * DIV_ROUND_UP(bpp, 8) even
> > for bpp < 8, and then this series changes it for 1, 2 and 4 bpps (but
> > not for 3, 5, 6, 7, if I'm not mistaken).
>
> True. 1, 2 and 4 would currently over-allocate significantly on some
> drivers and the series will reduce this to actual requirements. Yet our
> most common memory managers, gem-dma and gem-shmem, compute the sizes
> correctly.
>
> But there are currently no drivers that support C4, C2 or C1 formats;
> hence there's likely no user space either. I know that Geert is
> interested in making a driver that uses these formats on very low-end
> hardware (something Atari or Amiga IIRC). Over-allocating on such
> hardware is likely not an option.

Note that the gud and ssd130x drivers do support R1, and I believe
work is underway to add grayscale formats to ssd130x.

> The other values (3, 5, 6, 7) have no meaning I know of. 6 could be
> XRGB2222, but I not aware of anything using that. We don't even have a
> format constant for this.

Yeah, e.g. Amiga supports 3, 5, 6, and 7 bpp, but that is using
bitplanes.  There is already some sort of consensus to not expose
bitplanes to userspace in DRM, so limiting to 1, 2, 4, and 8 bpp
(which can be converted from C[1248]) is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

