Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664D281B0B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 20:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2298.6871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOQ3I-0008DE-A7; Fri, 02 Oct 2020 18:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2298.6871; Fri, 02 Oct 2020 18:45:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOQ3I-0008Cs-5l; Fri, 02 Oct 2020 18:45:08 +0000
Received: by outflank-mailman (input) for mailman id 2298;
 Fri, 02 Oct 2020 18:45:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MsM=DJ=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1kOQ3G-0008Cn-EY
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 18:45:06 +0000
Received: from mail-oo1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44bf014e-9d5c-4573-bc79-63611568e82a;
 Fri, 02 Oct 2020 18:45:04 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id c4so592554oou.6
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 11:45:04 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2MsM=DJ=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
	id 1kOQ3G-0008Cn-EY
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 18:45:06 +0000
X-Inumbo-ID: 44bf014e-9d5c-4573-bc79-63611568e82a
Received: from mail-oo1-xc43.google.com (unknown [2607:f8b0:4864:20::c43])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 44bf014e-9d5c-4573-bc79-63611568e82a;
	Fri, 02 Oct 2020 18:45:04 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id c4so592554oou.6
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZSwV/TxvLgtRQyseSFuOz5Dh2qMehSXaFEvs66IqY4=;
        b=W7br+aRlzq45X9zGs9xUATcRIBCFJ3jObJlGFJ+idk77p7qcMftDn2rX4AzxzMUyaZ
         jPMnJ3BMZZ+WrbYH2Gy2fwnEK1jGm82A6yCC8yVPbio7O5XUhQjvdmjfyIcB4m/8rybu
         R71q+9FkhpfjEUqyO5Wt0gDXb1FGwVO9QwW6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZSwV/TxvLgtRQyseSFuOz5Dh2qMehSXaFEvs66IqY4=;
        b=LtRe4bRY8bsP9mqVoK7Wqnm0lLrb7cxIPFuSl6Hn4CXR6+n88TSSUMJQYvf6v27y3f
         wpyfPmKg2bX+0mOe6kaYSqW//YssrUC2ohHPWiJlvZnyegmnreEYhmb3Q/JCN+LvgRcI
         j/IvVfNBKmFP627tROUHevkRLWO5+/rE3TeRMWbvjcG+BROXofl9HYC25XjVtu8kyVB1
         ji4DTrNue33dLEDQ4Yycpj9ooLZZFsLRWx/PwuYG0lhRztfWkrNT5wIYYRAwCOdqzJuF
         36UZvwQtFEp+k+FFr1yCIeyhToK/VxSvs71bMN7ZznQsU26yQQBsPTphYyR5V3j0sI31
         w5hg==
X-Gm-Message-State: AOAM532lCyblLvfrqDe1LLVXb5xmz8k/t99766ZHbTkvm30TOtn1d6K/
	8GwqqEqjF7S+fI4H4Z+//P9tZ6YUqb/BJ5ZLijWmjw==
X-Google-Smtp-Source: ABdhPJxo3CwQVG7zrHO9r4gpqXHDOI3xSmfLTtpn1cgBaJLFnaDvBDsE/URziecJNATSH24FHSy7/SzIzMH/e9gCpWk=
X-Received: by 2002:a4a:3b44:: with SMTP id s65mr2903513oos.85.1601664303475;
 Fri, 02 Oct 2020 11:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de> <20200929151437.19717-7-tzimmermann@suse.de>
 <20201002180500.GM438822@phenom.ffwll.local>
In-Reply-To: <20201002180500.GM438822@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 2 Oct 2020 20:44:52 +0200
Message-ID: <CAKMK7uFVHrqBh1sqQHR56vp2JS77XoCs232B5mkJXXpLhgLW8Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] drm/fb_helper: Support framebuffers in I/O memory
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Qiang Yu <yuq825@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
	Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
	Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Hans de Goede <hdegoede@redhat.com>, Sean Paul <sean@poorly.run>, "Anholt, Eric" <eric@anholt.net>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Huang Rui <ray.huang@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Emil Velikov <emil.velikov@collabora.com>, 
	Luben Tuikov <luben.tuikov@amd.com>, apaneers@amd.com, 
	Linus Walleij <linus.walleij@linaro.org>, Melissa Wen <melissa.srw@gmail.com>, 
	"Wilson, Chris" <chris@chris-wilson.co.uk>, Qinglang Miao <miaoqinglang@huawei.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	"open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>, 
	The etnaviv authors <etnaviv@lists.freedesktop.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, lima@lists.freedesktop.org, 
	Nouveau Dev <nouveau@lists.freedesktop.org>, 
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 2, 2020 at 8:05 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Sep 29, 2020 at 05:14:36PM +0200, Thomas Zimmermann wrote:
> > At least sparc64 requires I/O-specific access to framebuffers. This
> > patch updates the fbdev console accordingly.
> >
> > For drivers with direct access to the framebuffer memory, the callback
> > functions in struct fb_ops test for the type of memory and call the rsp
> > fb_sys_ of fb_cfb_ functions.
> >
> > For drivers that employ a shadow buffer, fbdev's blit function retrieves
> > the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> > interfaces to access the buffer.
> >
> > The bochs driver on sparc64 uses a workaround to flag the framebuffer as
> > I/O memory and avoid a HW exception. With the introduction of struct
> > dma_buf_map, this is not required any longer. The patch removes the rsp
> > code from both, bochs and fbdev.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Argh, I accidentally hit send before finishing this ...

> > ---
> >  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
> >  drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++--
> >  include/drm/drm_mode_config.h     |  12 --
> >  include/linux/dma-buf-map.h       |  72 ++++++++--
> >  4 files changed, 265 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> > index 13d0d04c4457..853081d186d5 100644
> > --- a/drivers/gpu/drm/bochs/bochs_kms.c
> > +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> > @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
> >       bochs->dev->mode_config.preferred_depth = 24;
> >       bochs->dev->mode_config.prefer_shadow = 0;
> >       bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> > -     bochs->dev->mode_config.fbdev_use_iomem = true;
> >       bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
> >
> >       bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 343a292f2c7c..f345a314a437 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -388,24 +388,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
> >  }
> >
> >  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> > -                                       struct drm_clip_rect *clip)
> > +                                       struct drm_clip_rect *clip,
> > +                                       struct dma_buf_map *dst)
> >  {
> >       struct drm_framebuffer *fb = fb_helper->fb;
> >       unsigned int cpp = fb->format->cpp[0];
> >       size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> >       void *src = fb_helper->fbdev->screen_buffer + offset;
> > -     void *dst = fb_helper->buffer->map.vaddr + offset;
> >       size_t len = (clip->x2 - clip->x1) * cpp;
> >       unsigned int y;
> >
> > -     for (y = clip->y1; y < clip->y2; y++) {
> > -             if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> > -                     memcpy(dst, src, len);
> > -             else
> > -                     memcpy_toio((void __iomem *)dst, src, len);
> > +     dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
> >
> > +     for (y = clip->y1; y < clip->y2; y++) {
> > +             dma_buf_map_memcpy_to(dst, src, len);
> > +             dma_buf_map_incr(dst, fb->pitches[0]);
> >               src += fb->pitches[0];
> > -             dst += fb->pitches[0];
> >       }
> >  }
> >
> > @@ -433,8 +431,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
> >                       ret = drm_client_buffer_vmap(helper->buffer, &map);
> >                       if (ret)
> >                               return;
> > -                     drm_fb_helper_dirty_blit_real(helper, &clip_copy);
> > +                     drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
> >               }
> > +
> >               if (helper->fb->funcs->dirty)
> >                       helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
> >                                                &clip_copy, 1);
> > @@ -771,6 +770,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
> >  }
> >  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> >
> > +static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
> > +                                   size_t count, loff_t *ppos)
> > +{
> > +     unsigned long p = *ppos;
> > +     u8 *dst;
> > +     u8 __iomem *src;
> > +     int c, err = 0;
> > +     unsigned long total_size;
> > +     unsigned long alloc_size;
> > +     ssize_t ret = 0;
> > +
> > +     if (info->state != FBINFO_STATE_RUNNING)
> > +             return -EPERM;
> > +
> > +     total_size = info->screen_size;
> > +
> > +     if (total_size == 0)
> > +             total_size = info->fix.smem_len;
> > +
> > +     if (p >= total_size)
> > +             return 0;
> > +
> > +     if (count >= total_size)
> > +             count = total_size;
> > +
> > +     if (count + p > total_size)
> > +             count = total_size - p;
> > +
> > +     src = (u8 __iomem *)(info->screen_base + p);
> > +
> > +     alloc_size = min(count, PAGE_SIZE);
> > +
> > +     dst = kmalloc(alloc_size, GFP_KERNEL);
> > +     if (!dst)
> > +             return -ENOMEM;
> > +
> > +     while (count) {
> > +             c = min(count, alloc_size);
> > +
> > +             memcpy_fromio(dst, src, c);
> > +             if (copy_to_user(buf, dst, c)) {
> > +                     err = -EFAULT;
> > +                     break;
> > +             }
> > +
> > +             src += c;
> > +             *ppos += c;
> > +             buf += c;
> > +             ret += c;
> > +             count -= c;
> > +     }
> > +
> > +     kfree(dst);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     return ret;
> > +}
> > +
> > +static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> > +                                    size_t count, loff_t *ppos)
> > +{
> > +     unsigned long p = *ppos;
> > +     u8 *src;
> > +     u8 __iomem *dst;
> > +     int c, err = 0;
> > +     unsigned long total_size;
> > +     unsigned long alloc_size;
> > +     ssize_t ret = 0;
> > +
> > +     if (info->state != FBINFO_STATE_RUNNING)
> > +             return -EPERM;
> > +
> > +     total_size = info->screen_size;
> > +
> > +     if (total_size == 0)
> > +             total_size = info->fix.smem_len;
> > +
> > +     if (p > total_size)
> > +             return -EFBIG;
> > +
> > +     if (count > total_size) {
> > +             err = -EFBIG;
> > +             count = total_size;
> > +     }
> > +
> > +     if (count + p > total_size) {
> > +             /*
> > +              * The framebuffer is too small. We do the
> > +              * copy operation, but return an error code
> > +              * afterwards. Taken from fbdev.
> > +              */
> > +             if (!err)
> > +                     err = -ENOSPC;
> > +             count = total_size - p;
> > +     }
> > +
> > +     alloc_size = min(count, PAGE_SIZE);
> > +
> > +     src = kmalloc(alloc_size, GFP_KERNEL);
> > +     if (!src)
> > +             return -ENOMEM;
> > +
> > +     dst = (u8 __iomem *)(info->screen_base + p);
> > +
> > +     while (count) {
> > +             c = min(count, alloc_size);
> > +
> > +             if (copy_from_user(src, buf, c)) {
> > +                     err = -EFAULT;
> > +                     break;
> > +             }
> > +             memcpy_toio(dst, src, c);
> > +
> > +             dst += c;
> > +             *ppos += c;
> > +             buf += c;
> > +             ret += c;
> > +             count -= c;
> > +     }
> > +
> > +     kfree(src);
> > +
> > +     if (err)
> > +             return err;
> > +
> > +     return ret;
> > +}

The duplication is a bit annoying here, but can't really be avoided. I
do think though we should maybe go a bit further, and have drm
implementations of this stuff instead of following fbdev concepts as
closely as possible. So here roughly:

- if we have a shadow fb, construct a dma_buf_map for that, otherwise
take the one from the driver
- have a full generic implementation using that one directly (and
checking size limits against the underlying gem buffer)
- ideally also with some testcases in the fbdev testcase we have (very
bare-bones right now) in igt

But I'm not really sure whether that's worth all the trouble. It's
just that the fbdev-ness here in this copied code sticks out a lot :-)

> > +
> >  /**
> >   * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
> >   * @info: fbdev registered by the helper
> > @@ -2043,6 +2172,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> >               return -ENODEV;
> >  }
> >
> > +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> > +                              size_t count, loff_t *ppos)
> > +{
> > +     struct drm_fb_helper *fb_helper = info->par;
> > +     struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +             return drm_fb_helper_sys_read(info, buf, count, ppos);
> > +     else
> > +             return drm_fb_helper_cfb_read(info, buf, count, ppos);
> > +}
> > +
> > +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
> > +                               size_t count, loff_t *ppos)
> > +{
> > +     struct drm_fb_helper *fb_helper = info->par;
> > +     struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +             return drm_fb_helper_sys_write(info, buf, count, ppos);
> > +     else
> > +             return drm_fb_helper_cfb_write(info, buf, count, ppos);
> > +}
> > +
> > +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> > +                               const struct fb_fillrect *rect)
> > +{
> > +     struct drm_fb_helper *fb_helper = info->par;
> > +     struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +             drm_fb_helper_sys_fillrect(info, rect);
> > +     else
> > +             drm_fb_helper_cfb_fillrect(info, rect);
> > +}
> > +
> > +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> > +                               const struct fb_copyarea *area)
> > +{
> > +     struct drm_fb_helper *fb_helper = info->par;
> > +     struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +             drm_fb_helper_sys_copyarea(info, area);
> > +     else
> > +             drm_fb_helper_cfb_copyarea(info, area);
> > +}
> > +
> > +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> > +                                const struct fb_image *image)
> > +{
> > +     struct drm_fb_helper *fb_helper = info->par;
> > +     struct drm_client_buffer *buffer = fb_helper->buffer;
> > +
> > +     if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +             drm_fb_helper_sys_imageblit(info, image);
> > +     else
> > +             drm_fb_helper_cfb_imageblit(info, image);
> > +}

I think a todo.rst entry to make the new generic functions the real ones, and
drivers not using the sys/cfb ones anymore would be a good addition.
It's kinda covered by the move to the generic helpers, but maybe we
can convert a few more drivers over to these here. Would also allow us
to maybe flatten the code a bit and use more of the dma_buf_map stuff
directly (instead of reusing crusty fbdev code written 20 years ago or
so).

> > +
> >  static const struct fb_ops drm_fbdev_fb_ops = {
> >       .owner          = THIS_MODULE,
> >       DRM_FB_HELPER_DEFAULT_OPS,
> > @@ -2050,11 +2239,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
> >       .fb_release     = drm_fbdev_fb_release,
> >       .fb_destroy     = drm_fbdev_fb_destroy,
> >       .fb_mmap        = drm_fbdev_fb_mmap,
> > -     .fb_read        = drm_fb_helper_sys_read,
> > -     .fb_write       = drm_fb_helper_sys_write,
> > -     .fb_fillrect    = drm_fb_helper_sys_fillrect,
> > -     .fb_copyarea    = drm_fb_helper_sys_copyarea,
> > -     .fb_imageblit   = drm_fb_helper_sys_imageblit,
> > +     .fb_read        = drm_fbdev_fb_read,
> > +     .fb_write       = drm_fbdev_fb_write,
> > +     .fb_fillrect    = drm_fbdev_fb_fillrect,
> > +     .fb_copyarea    = drm_fbdev_fb_copyarea,
> > +     .fb_imageblit   = drm_fbdev_fb_imageblit,
> >  };
> >
> >  static struct fb_deferred_io drm_fbdev_defio = {
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > index 5ffbb4ed5b35..ab424ddd7665 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -877,18 +877,6 @@ struct drm_mode_config {
> >        */
> >       bool prefer_shadow_fbdev;
> >
> > -     /**
> > -      * @fbdev_use_iomem:
> > -      *
> > -      * Set to true if framebuffer reside in iomem.
> > -      * When set to true memcpy_toio() is used when copying the framebuffer in
> > -      * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> > -      *
> > -      * FIXME: This should be replaced with a per-mapping is_iomem
> > -      * flag (like ttm does), and then used everywhere in fbdev code.
> > -      */
> > -     bool fbdev_use_iomem;
> > -
> >       /**
> >        * @quirk_addfb_prefer_xbgr_30bpp:
> >        *
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h

I think the below should be split out as a prep patch.

> > index 2e8bbecb5091..6ca0f304dda2 100644
> > --- a/include/linux/dma-buf-map.h
> > +++ b/include/linux/dma-buf-map.h
> > @@ -32,6 +32,14 @@
> >   * accessing the buffer. Use the returned instance and the helper functions
> >   * to access the buffer's memory in the correct way.
> >   *
> > + * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> > + * actually independent from the dma-buf infrastructure. When sharing buffers
> > + * among devices, drivers have to know the location of the memory to access
> > + * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> > + * solves this problem for dma-buf and its users. If other drivers or
> > + * sub-systems require similar functionality, the type could be generalized
> > + * and moved to a more prominent header file.
> > + *
> >   * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
> >   * considered bad style. Rather then accessing its fields directly, use one
> >   * of the provided helper functions, or implement your own. For example,
> > @@ -51,6 +59,14 @@
> >   *
> >   *   dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> >   *
> > + * Instances of struct dma_buf_map do not have to be cleaned up, but
> > + * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> > + * always refer to system memory.
> > + *
> > + * .. code-block:: c
> > + *
> > + *   dma_buf_map_clear(&map);
> > + *
> >   * Test if a mapping is valid with either dma_buf_map_is_set() or
> >   * dma_buf_map_is_null().
> >   *
> > @@ -73,17 +89,19 @@
> >   *   if (dma_buf_map_is_equal(&sys_map, &io_map))
> >   *           // always false
> >   *
> > - * Instances of struct dma_buf_map do not have to be cleaned up, but
> > - * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> > - * always refer to system memory.
> > + * A set up instance of struct dma_buf_map can be used to access or manipulate
> > + * the buffer memory. Depending on the location of the memory, the provided
> > + * helpers will pick the correct operations. Data can be copied into the memory
> > + * with dma_buf_map_memcpy_to(). The address can be manipulated with
> > + * dma_buf_map_incr().
> >   *
> > - * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> > - * actually independent from the dma-buf infrastructure. When sharing buffers
> > - * among devices, drivers have to know the location of the memory to access
> > - * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> > - * solves this problem for dma-buf and its users. If other drivers or
> > - * sub-systems require similar functionality, the type could be generalized
> > - * and moved to a more prominent header file.
> > + * .. code-block:: c
> > + *
> > + *   const void *src = ...; // source buffer
> > + *   size_t len = ...; // length of src
> > + *
> > + *   dma_buf_map_memcpy_to(&map, src, len);
> > + *   dma_buf_map_incr(&map, len); // go to first byte after the memcpy
> >   */
> >
> >  /**
> > @@ -210,4 +228,38 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
> >       }
> >  }
> >
> > +/**
> > + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> > + * @dst:     The dma-buf mapping structure
> > + * @src:     The source buffer
> > + * @len:     The number of byte in src
> > + *
> > + * Copies data into a dma-buf mapping. The source buffer is in system
> > + * memory. Depending on the buffer's location, the helper picks the correct
> > + * method of accessing the memory.
> > + */
> > +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> > +{
> > +     if (dst->is_iomem)
> > +             memcpy_toio(dst->vaddr_iomem, src, len);
> > +     else
> > +             memcpy(dst->vaddr, src, len);
> > +}
> > +
> > +/**
> > + * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
> > + * @map:     The dma-buf mapping structure
> > + * @incr:    The number of bytes to increment
> > + *
> > + * Increments the address stored in a dma-buf mapping. Depending on the
> > + * buffer's location, the correct value will be updated.
> > + */
> > +static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
> > +{
> > +     if (map->is_iomem)
> > +             map->vaddr_iomem += incr;
> > +     else
> > +             map->vaddr += incr;
> > +}
> > +
> >  #endif /* __DMA_BUF_MAP_H__ */
> > --
> > 2.28.0

Aside from the details I think looks all reasonable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

