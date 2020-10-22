Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5529295AF2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 10:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10281.27289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWK0-0007Jy-1T; Thu, 22 Oct 2020 08:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10281.27289; Thu, 22 Oct 2020 08:51:44 +0000
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
	id 1kVWJz-0007Jd-U0; Thu, 22 Oct 2020 08:51:43 +0000
Received: by outflank-mailman (input) for mailman id 10281;
 Thu, 22 Oct 2020 08:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FtFY=D5=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1kVWJy-0007JW-C8
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:51:42 +0000
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36aba427-d415-4488-ad7f-d20196ac57fd;
 Thu, 22 Oct 2020 08:51:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c16so1068091wmd.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2020 01:51:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a127sm2514868wmh.13.2020.10.22.01.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:51:38 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FtFY=D5=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
	id 1kVWJy-0007JW-C8
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:51:42 +0000
X-Inumbo-ID: 36aba427-d415-4488-ad7f-d20196ac57fd
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 36aba427-d415-4488-ad7f-d20196ac57fd;
	Thu, 22 Oct 2020 08:51:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c16so1068091wmd.2
        for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2020 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=erb5WlpHsJRWwYX0e3SV0gcGv3BO7EJiAnUE12jJHE0=;
        b=KD8AshS9U2fiksKTvv7o0P37aMRbN3UM3FAbfWu9YxAfRMLaL/6Ngf1thLAOjXN2V0
         AIYJ3fir8VO8pp7di2VX7Sl5I1n2yikuLxTQ26ddK5q1xXMh/Sw3+WNhhNG6xIKpM6E9
         Rw+XW1hAnR3LSAc5fIYsSosGFAeu2aCsUaIEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=erb5WlpHsJRWwYX0e3SV0gcGv3BO7EJiAnUE12jJHE0=;
        b=aMAoM9HgL/aMrOmv1Ms9BMaFYTTHJrueL1zFV9hadmv/HlIvxXHwQHOybdkf2gVBy3
         qncDGtKmceqvbW10PTQi/OkqkQh9bHzW1MN0a/ViL1VI2w2UGOtWj7J2RjNFSIITf+eK
         bVp1BeBWlJOe6RgTsuyROOzwOtgo8YO7vkS5dX/Pm7N4prb72SZi809S3+r5sddP5Ny9
         NQlYMwuOfYNNU4GsgScBaGxUuyTXVt/BkH8p9lW9wQhLJLR/nu7lQqrRTHa7dwq8RHFw
         k8GEk6ChL3wVRcgwDv2dvWq5X/BXFvZpFfeHFJneSwYuRWUukChJBsaHIj7l+QTks+O6
         YXGw==
X-Gm-Message-State: AOAM530bc6ECbq2IEhwCSDXN+t2ZXOPiHaCA42lK/92ZWzCgMnwH/Hqk
	J/PFz5rhHolkFVoGWoWQMtJyCw==
X-Google-Smtp-Source: ABdhPJwCnAYthezROMJuiM7f0KJt+lGyOM7pBOyPT6+M7iThubfoowBMxVTwJR24l+gtJ18xepp0pw==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr1468832wmj.52.1603356699036;
        Thu, 22 Oct 2020 01:51:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a127sm2514868wmh.13.2020.10.22.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 01:51:38 -0700 (PDT)
Date: Thu, 22 Oct 2020 10:51:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@linux.ie, sam@ravnborg.org,
	alexander.deucher@amd.com, christian.koenig@amd.com,
	kraxel@redhat.com, l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
	inki.dae@samsung.com, jy0922.shim@samsung.com,
	sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
	krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com,
	robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
	alyssa.rosenzweig@collabora.com, hjc@rock-chips.com,
	heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run,
	eric@anholt.net, oleksandr_andrushchenko@epam.com,
	ray.huang@amd.com, sumit.semwal@linaro.org,
	emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.com,
	linus.walleij@linaro.org, melissa.srw@gmail.com,
	chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 10/10] drm/fb_helper: Support framebuffers in I/O
 memory
Message-ID: <20201022085135.GV401619@phenom.ffwll.local>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-11-tzimmermann@suse.de>
 <20201022080534.GT401619@phenom.ffwll.local>
 <794e6ab4-041b-55f9-e95e-55ef0526edd5@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <794e6ab4-041b-55f9-e95e-55ef0526edd5@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 

On Thu, Oct 22, 2020 at 10:37:56AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> On 22.10.20 10:05, Daniel Vetter wrote:
> > On Tue, Oct 20, 2020 at 02:20:46PM +0200, Thomas Zimmermann wrote:
> >> At least sparc64 requires I/O-specific access to framebuffers. This
> >> patch updates the fbdev console accordingly.
> >>
> >> For drivers with direct access to the framebuffer memory, the callback
> >> functions in struct fb_ops test for the type of memory and call the rsp
> >> fb_sys_ of fb_cfb_ functions. Read and write operations are implemented
> >> internally by DRM's fbdev helper.
> >>
> >> For drivers that employ a shadow buffer, fbdev's blit function retrieves
> >> the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> >> interfaces to access the buffer.
> >>
> >> The bochs driver on sparc64 uses a workaround to flag the framebuffer as
> >> I/O memory and avoid a HW exception. With the introduction of struct
> >> dma_buf_map, this is not required any longer. The patch removes the rsp
> >> code from both, bochs and fbdev.
> >>
> >> v5:
> >> 	* implement fb_read/fb_write internally (Daniel, Sam)
> >> v4:
> >> 	* move dma_buf_map changes into separate patch (Daniel)
> >> 	* TODO list: comment on fbdev updates (Daniel)
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Tested-by: Sam Ravnborg <sam@ravnborg.org>
> >> ---
> >>  Documentation/gpu/todo.rst        |  19 ++-
> >>  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
> >>  drivers/gpu/drm/drm_fb_helper.c   | 227 ++++++++++++++++++++++++++++--
> >>  include/drm/drm_mode_config.h     |  12 --
> >>  4 files changed, 230 insertions(+), 29 deletions(-)
> >>
> >> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> >> index 7e6fc3c04add..638b7f704339 100644
> >> --- a/Documentation/gpu/todo.rst
> >> +++ b/Documentation/gpu/todo.rst
> >> @@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
> >>  ------------------------------------------------
> >>  
> >>  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
> >> -atomic modesetting and GEM vmap support. Current generic fbdev emulation
> >> -expects the framebuffer in system memory (or system-like memory).
> >> +atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
> >> +expected the framebuffer in system memory or system-like memory. By employing
> >> +struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
> >> +as well.
> >>  
> >>  Contact: Maintainer of the driver you plan to convert
> >>  
> >>  Level: Intermediate
> >>  
> >> +Reimplement functions in drm_fbdev_fb_ops without fbdev
> >> +-------------------------------------------------------
> >> +
> >> +A number of callback functions in drm_fbdev_fb_ops could benefit from
> >> +being rewritten without dependencies on the fbdev module. Some of the
> >> +helpers could further benefit from using struct dma_buf_map instead of
> >> +raw pointers.
> >> +
> >> +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
> >> +
> >> +Level: Advanced
> >> +
> >> +
> >>  drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
> >>  -----------------------------------------------------------------
> >>  
> >> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> >> index 13d0d04c4457..853081d186d5 100644
> >> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> >> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> >> @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
> >>  	bochs->dev->mode_config.preferred_depth = 24;
> >>  	bochs->dev->mode_config.prefer_shadow = 0;
> >>  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> >> -	bochs->dev->mode_config.fbdev_use_iomem = true;
> >>  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
> >>  
> >>  	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> >> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> >> index 6212cd7cde1d..1d3180841778 100644
> >> --- a/drivers/gpu/drm/drm_fb_helper.c
> >> +++ b/drivers/gpu/drm/drm_fb_helper.c
> >> @@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
> >>  }
> >>  
> >>  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> >> -					  struct drm_clip_rect *clip)
> >> +					  struct drm_clip_rect *clip,
> >> +					  struct dma_buf_map *dst)
> >>  {
> >>  	struct drm_framebuffer *fb = fb_helper->fb;
> >>  	unsigned int cpp = fb->format->cpp[0];
> >>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> >>  	void *src = fb_helper->fbdev->screen_buffer + offset;
> >> -	void *dst = fb_helper->buffer->map.vaddr + offset;
> >>  	size_t len = (clip->x2 - clip->x1) * cpp;
> >>  	unsigned int y;
> >>  
> >> -	for (y = clip->y1; y < clip->y2; y++) {
> >> -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> >> -			memcpy(dst, src, len);
> >> -		else
> >> -			memcpy_toio((void __iomem *)dst, src, len);
> >> +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
> >>  
> >> +	for (y = clip->y1; y < clip->y2; y++) {
> >> +		dma_buf_map_memcpy_to(dst, src, len);
> >> +		dma_buf_map_incr(dst, fb->pitches[0]);
> >>  		src += fb->pitches[0];
> >> -		dst += fb->pitches[0];
> >>  	}
> >>  }
> >>  
> >> @@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
> >>  			ret = drm_client_buffer_vmap(helper->buffer, &map);
> >>  			if (ret)
> >>  				return;
> >> -			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
> >> +			drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
> >>  		}
> >> +
> >>  		if (helper->fb->funcs->dirty)
> >>  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
> >>  						 &clip_copy, 1);
> >> @@ -2027,6 +2026,206 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> >>  		return -ENODEV;
> >>  }
> >>  
> >> +static bool drm_fbdev_use_iomem(struct fb_info *info)
> >> +{
> >> +	struct drm_fb_helper *fb_helper = info->par;
> >> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> >> +
> >> +	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
> >> +}
> >> +
> >> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count, 
> >> +				   loff_t pos)
> >> +{
> >> +	const char __iomem *src = info->screen_base + pos;
> > 
> > Maybe a bit much a bikeshed, but I'd write this in terms of drm objects,
> > like the dirty_blit function, using the dma_buf_map (instead of the
> > fb_info parameter). And then instead of
> > screen_base and screen_buffer suffixes give them _mem and _iomem suffixes.
> 
> Screen_buffer can be a shadow buffer. Until the blit worker (see
> drm_fb_helper_dirty_work() ) completes, it might be more up to date than
> the real buffer that's stored in the client.
> 
> The orignal fbdev code supported an fb_sync callback to synchronize with
> outstanding screen updates (e.g., HW blit ops), but fb_sync is just
> overhead here. Copying from screen_buffer or screen_base always returns
> the most up-to-date image.
> 
> > 
> > Same for write below. Or I'm not quite understanding why we do it like
> > this here - I don't think this code will be used outside of the generic
> > fbdev code, so we can always assume that drm_fb_helper->buffer is set up.
> 
> It's similar as in the read case. If we write to the client's buffer, an
> outstanding blit worker could write the now-outdated shadow buffer over
> the user's newly written framebuffer data.
> 
> Thinking about it, we might want to schedule the blit worker at the end
> of each fb_write, so that the data makes it into the HW buffer in time.

Hm ok, makes some sense. I think there's some potential for cleanup if we
add a dma_buf_map drm_fb_helper->uapi_map which points at the right thing
always. That could then also the drm_fbdev_use_iomem() helper and make
this all look really neat.

But maybe a follow up clean up patch, if you're bored. As-is:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

While looking at this I also noticed a potential small issue in an earlier
patch.

> > The other thing I think we need is some minimal testcases to make sure.
> > The fbtest tool used way back seems to have disappeared, I couldn't find
> > a copy of the source anywhere anymore.
> 
> As discussed on IRC, I'll add some testcase to the igt test. I'll share
> the link here when done.
> 
> Best regards
> Thomas
> 
> > 
> > With all that: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Cheers, Daniel
> > 
> >> +	size_t alloc_size = min(count, PAGE_SIZE);
> >> +	ssize_t ret = 0;
> >> +	char *tmp;
> >> +
> >> +	tmp = kmalloc(alloc_size, GFP_KERNEL);
> >> +	if (!tmp)
> >> +		return -ENOMEM;
> >> +
> >> +	while (count) {
> >> +		size_t c = min(count, alloc_size);
> >> +
> >> +		memcpy_fromio(tmp, src, c);
> >> +		if (copy_to_user(buf, tmp, c)) {
> >> +			ret = -EFAULT;
> >> +			break;
> >> +		}
> >> +
> >> +		src += c;
> >> +		buf += c;
> >> +		ret += c;
> >> +		count -= c;
> >> +	}
> >> +
> >> +	kfree(tmp);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static ssize_t fb_read_screen_buffer(struct fb_info *info, char __user *buf, size_t count,
> >> +				     loff_t pos)
> >> +{
> >> +	const char *src = info->screen_buffer + pos;
> >> +
> >> +	if (copy_to_user(buf, src, count))
> >> +		return -EFAULT;
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> >> +				 size_t count, loff_t *ppos)
> >> +{
> >> +	loff_t pos = *ppos;
> >> +	size_t total_size;
> >> +	ssize_t ret;
> >> +
> >> +	if (info->state != FBINFO_STATE_RUNNING)
> >> +		return -EPERM;
> >> +
> >> +	if (info->screen_size)
> >> +		total_size = info->screen_size;
> >> +	else
> >> +		total_size = info->fix.smem_len;
> >> +
> >> +	if (pos >= total_size)
> >> +		return 0;
> >> +	if (count >= total_size)
> >> +		count = total_size;
> >> +	if (total_size - count < pos)
> >> +		count = total_size - pos;
> >> +
> >> +	if (drm_fbdev_use_iomem(info))
> >> +		ret = fb_read_screen_base(info, buf, count, pos);
> >> +	else
> >> +		ret = fb_read_screen_buffer(info, buf, count, pos);
> >> +
> >> +	if (ret > 0)
> >> +		*ppos = ret;
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> >> +				    loff_t pos)
> >> +{
> >> +	char __iomem *dst = info->screen_base + pos;
> >> +	size_t alloc_size = min(count, PAGE_SIZE);
> >> +	ssize_t ret = 0;
> >> +	u8 *tmp;
> >> +
> >> +	tmp = kmalloc(alloc_size, GFP_KERNEL);
> >> +	if (!tmp)
> >> +		return -ENOMEM;
> >> +
> >> +	while (count) {
> >> +		size_t c = min(count, alloc_size);
> >> +
> >> +		if (copy_from_user(tmp, buf, c)) {
> >> +			ret = -EFAULT;
> >> +			break;
> >> +		}
> >> +		memcpy_toio(dst, tmp, c);
> >> +
> >> +		dst += c;
> >> +		buf += c;
> >> +		ret += c;
> >> +		count -= c;
> >> +	}
> >> +
> >> +	kfree(tmp);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static ssize_t fb_write_screen_buffer(struct fb_info *info, const char __user *buf, size_t count,
> >> +				      loff_t pos)
> >> +{
> >> +	char *dst = info->screen_buffer + pos;
> >> +
> >> +	if (copy_from_user(dst, buf, count))
> >> +		return -EFAULT;
> >> +
> >> +	return count;
> >> +}
> >> +
> >> +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
> >> +				  size_t count, loff_t *ppos)
> >> +{
> >> +	loff_t pos = *ppos;
> >> +	size_t total_size;
> >> +	ssize_t ret;
> >> +	int err;
> >> +
> >> +	if (info->state != FBINFO_STATE_RUNNING)
> >> +		return -EPERM;
> >> +
> >> +	if (info->screen_size)
> >> +		total_size = info->screen_size;
> >> +	else
> >> +		total_size = info->fix.smem_len;
> >> +
> >> +	if (pos > total_size)
> >> +		return -EFBIG;
> >> +	if (count > total_size) {
> >> +		err = -EFBIG;
> >> +		count = total_size;
> >> +	}
> >> +	if (total_size - count < pos) {
> >> +		if (!err)
> >> +			err = -ENOSPC;
> >> +		count = total_size - pos;
> >> +	}
> >> +
> >> +	/*
> >> +	 * Copy to framebuffer even if we already logged an error. Emulates
> >> +	 * the behavior of the original fbdev implementation.
> >> +	 */
> >> +	if (drm_fbdev_use_iomem(info))
> >> +		ret = fb_write_screen_base(info, buf, count, pos);
> >> +	else
> >> +		ret = fb_write_screen_buffer(info, buf, count, pos);
> >> +
> >> +	if (ret > 0)
> >> +		*ppos = ret;
> >> +
> >> +	if (err)
> >> +		return err;
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> >> +				  const struct fb_fillrect *rect)
> >> +{
> >> +	if (drm_fbdev_use_iomem(info))
> >> +		drm_fb_helper_cfb_fillrect(info, rect);
> >> +	else
> >> +		drm_fb_helper_sys_fillrect(info, rect);
> >> +}
> >> +
> >> +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> >> +				  const struct fb_copyarea *area)
> >> +{
> >> +	if (drm_fbdev_use_iomem(info))
> >> +		drm_fb_helper_cfb_copyarea(info, area);
> >> +	else
> >> +		drm_fb_helper_sys_copyarea(info, area);
> >> +}
> >> +
> >> +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> >> +				   const struct fb_image *image)
> >> +{
> >> +	if (drm_fbdev_use_iomem(info))
> >> +		drm_fb_helper_cfb_imageblit(info, image);
> >> +	else
> >> +		drm_fb_helper_sys_imageblit(info, image);
> >> +}
> >> +
> >>  static const struct fb_ops drm_fbdev_fb_ops = {
> >>  	.owner		= THIS_MODULE,
> >>  	DRM_FB_HELPER_DEFAULT_OPS,
> >> @@ -2034,11 +2233,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
> >>  	.fb_release	= drm_fbdev_fb_release,
> >>  	.fb_destroy	= drm_fbdev_fb_destroy,
> >>  	.fb_mmap	= drm_fbdev_fb_mmap,
> >> -	.fb_read	= drm_fb_helper_sys_read,
> >> -	.fb_write	= drm_fb_helper_sys_write,
> >> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> >> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> >> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> >> +	.fb_read	= drm_fbdev_fb_read,
> >> +	.fb_write	= drm_fbdev_fb_write,
> >> +	.fb_fillrect	= drm_fbdev_fb_fillrect,
> >> +	.fb_copyarea	= drm_fbdev_fb_copyarea,
> >> +	.fb_imageblit	= drm_fbdev_fb_imageblit,
> >>  };
> >>  
> >>  static struct fb_deferred_io drm_fbdev_defio = {
> >> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> >> index 5ffbb4ed5b35..ab424ddd7665 100644
> >> --- a/include/drm/drm_mode_config.h
> >> +++ b/include/drm/drm_mode_config.h
> >> @@ -877,18 +877,6 @@ struct drm_mode_config {
> >>  	 */
> >>  	bool prefer_shadow_fbdev;
> >>  
> >> -	/**
> >> -	 * @fbdev_use_iomem:
> >> -	 *
> >> -	 * Set to true if framebuffer reside in iomem.
> >> -	 * When set to true memcpy_toio() is used when copying the framebuffer in
> >> -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> >> -	 *
> >> -	 * FIXME: This should be replaced with a per-mapping is_iomem
> >> -	 * flag (like ttm does), and then used everywhere in fbdev code.
> >> -	 */
> >> -	bool fbdev_use_iomem;
> >> -
> >>  	/**
> >>  	 * @quirk_addfb_prefer_xbgr_30bpp:
> >>  	 *
> >> -- 
> >> 2.28.0
> >>
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

