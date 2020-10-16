Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B0290422
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 13:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8011.21297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTO0V-0003iF-B8; Fri, 16 Oct 2020 11:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8011.21297; Fri, 16 Oct 2020 11:34:47 +0000
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
	id 1kTO0V-0003hj-6t; Fri, 16 Oct 2020 11:34:47 +0000
Received: by outflank-mailman (input) for mailman id 8011;
 Fri, 16 Oct 2020 11:34:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cG/=DX=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kTO0T-0003gv-4l
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 11:34:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e7ace9f-9464-4395-977e-fd3266d0afc0;
 Fri, 16 Oct 2020 11:34:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 936D2AD7C;
 Fri, 16 Oct 2020 11:34:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9cG/=DX=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kTO0T-0003gv-4l
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 11:34:45 +0000
X-Inumbo-ID: 4e7ace9f-9464-4395-977e-fd3266d0afc0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4e7ace9f-9464-4395-977e-fd3266d0afc0;
	Fri, 16 Oct 2020 11:34:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 936D2AD7C;
	Fri, 16 Oct 2020 11:34:42 +0000 (UTC)
Date: Fri, 16 Oct 2020 13:34:40 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: luben.tuikov@amd.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, ray.huang@amd.com, kraxel@redhat.com,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, lima@lists.freedesktop.org,
 oleksandr_andrushchenko@epam.com, krzk@kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org,
 alyssa.rosenzweig@collabora.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, bskeggs@redhat.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org,
 sean@poorly.run, apaneers@amd.com, linux-arm-kernel@lists.infradead.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 tomeu.vizoso@collabora.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 kyungmin.park@samsung.com, miaoqinglang@huawei.com, yuq825@gmail.com,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com
Subject: Re: [PATCH v4 10/10] drm/fb_helper: Support framebuffers in I/O
 memory
Message-ID: <20201016133440.65cadb6d@linux-uq9g>
In-Reply-To: <20201016105854.GB1042954@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-11-tzimmermann@suse.de>
 <20201016105854.GB1042954@ravnborg.org>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, 16 Oct 2020 12:58:54 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Thomas.
>=20
> On Thu, Oct 15, 2020 at 02:38:06PM +0200, Thomas Zimmermann wrote:
> > At least sparc64 requires I/O-specific access to framebuffers. This
> > patch updates the fbdev console accordingly.
> >=20
> > For drivers with direct access to the framebuffer memory, the callback
> > functions in struct fb_ops test for the type of memory and call the rsp
> > fb_sys_ of fb_cfb_ functions.
> >=20
> > For drivers that employ a shadow buffer, fbdev's blit function retrieves
> > the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> > interfaces to access the buffer.
> >=20
> > The bochs driver on sparc64 uses a workaround to flag the framebuffer as
> > I/O memory and avoid a HW exception. With the introduction of struct
> > dma_buf_map, this is not required any longer. The patch removes the rsp
> > code from both, bochs and fbdev.
> >=20
> > v4:
> > 	* move dma_buf_map changes into separate patch (Daniel)
> > 	* TODO list: comment on fbdev updates (Daniel)
>=20
> I have been offline for a while so have not followed all the threads on
> this. So may comments below may well be addressed but I failed to see
> it.
>=20
> If the point about fb_sync is already addressed/considered then:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

It has not been brought up yet. See below.

>=20
>=20
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  Documentation/gpu/todo.rst        |  19 ++-
> >  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
> >  drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++--
> >  include/drm/drm_mode_config.h     |  12 --
> >  4 files changed, 220 insertions(+), 29 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> > index 7e6fc3c04add..638b7f704339 100644
> > --- a/Documentation/gpu/todo.rst
> > +++ b/Documentation/gpu/todo.rst
> > @@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
> >  ------------------------------------------------
> > =20
> >  Most drivers can use drm_fbdev_generic_setup(). Driver have to impleme=
nt
> > -atomic modesetting and GEM vmap support. Current generic fbdev emulati=
on
> > -expects the framebuffer in system memory (or system-like memory).
> > +atomic modesetting and GEM vmap support. Historically, generic fbdev
> > emulation +expected the framebuffer in system memory or system-like
> > memory. By employing +struct dma_buf_map, drivers with frambuffers in I=
/O
> > memory can be supported +as well.
> > =20
> >  Contact: Maintainer of the driver you plan to convert
> > =20
> >  Level: Intermediate
> > =20
> > +Reimplement functions in drm_fbdev_fb_ops without fbdev
> > +-------------------------------------------------------
> > +
> > +A number of callback functions in drm_fbdev_fb_ops could benefit from
> > +being rewritten without dependencies on the fbdev module. Some of the
> > +helpers could further benefit from using struct dma_buf_map instead of
> > +raw pointers.
> > +
> > +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
> > +
> > +Level: Advanced
> > +
> > +
> >  drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
> >  -----------------------------------------------------------------
> > =20
> > diff --git a/drivers/gpu/drm/bochs/bochs_kms.c
> > b/drivers/gpu/drm/bochs/bochs_kms.c index 13d0d04c4457..853081d186d5
> > 100644 --- a/drivers/gpu/drm/bochs/bochs_kms.c
> > +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> > @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
> >  	bochs->dev->mode_config.preferred_depth =3D 24;
> >  	bochs->dev->mode_config.prefer_shadow =3D 0;
> >  	bochs->dev->mode_config.prefer_shadow_fbdev =3D 1;
> > -	bochs->dev->mode_config.fbdev_use_iomem =3D true;
> >  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order =3D
> > true;=20
> >  	bochs->dev->mode_config.funcs =3D &bochs_mode_funcs;
> Good to see this workaround gone again!
>=20
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c
> > b/drivers/gpu/drm/drm_fb_helper.c index 6212cd7cde1d..462b0c130ebb 1006=
44
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct
> > work_struct *work) }
> > =20
> >  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper
> > *fb_helper,
> > -					  struct drm_clip_rect *clip)
> > +					  struct drm_clip_rect *clip,
> > +					  struct dma_buf_map *dst)
> >  {
> >  	struct drm_framebuffer *fb =3D fb_helper->fb;
> >  	unsigned int cpp =3D fb->format->cpp[0];
> >  	size_t offset =3D clip->y1 * fb->pitches[0] + clip->x1 * cpp;
> >  	void *src =3D fb_helper->fbdev->screen_buffer + offset;
> > -	void *dst =3D fb_helper->buffer->map.vaddr + offset;
> >  	size_t len =3D (clip->x2 - clip->x1) * cpp;
> >  	unsigned int y;
> > =20
> > -	for (y =3D clip->y1; y < clip->y2; y++) {
> > -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> > -			memcpy(dst, src, len);
> > -		else
> > -			memcpy_toio((void __iomem *)dst, src, len);
> > +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip
> > rect */=20
> > +	for (y =3D clip->y1; y < clip->y2; y++) {
> > +		dma_buf_map_memcpy_to(dst, src, len);
> > +		dma_buf_map_incr(dst, fb->pitches[0]);
> >  		src +=3D fb->pitches[0];
> > -		dst +=3D fb->pitches[0];
> >  	}
> >  }
> > =20
> > @@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct
> > work_struct *work) ret =3D drm_client_buffer_vmap(helper->buffer, &map);
> >  			if (ret)
> >  				return;
> > -			drm_fb_helper_dirty_blit_real(helper,
> > &clip_copy);
> > +			drm_fb_helper_dirty_blit_real(helper,
> > &clip_copy, &map); }
> > +
> >  		if (helper->fb->funcs->dirty)
> >  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
> >  						 &clip_copy, 1);
> > @@ -755,6 +754,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info
> > *info, }
> >  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
> > =20
> So far everything looks good.
>=20
> > +static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user
> > *buf,
> > +				      size_t count, loff_t *ppos)
> > +{
> > +	unsigned long p =3D *ppos;
> > +	u8 *dst;
> > +	u8 __iomem *src;
> > +	int c, err =3D 0;
> > +	unsigned long total_size;
> > +	unsigned long alloc_size;
> > +	ssize_t ret =3D 0;
> > +
> > +	if (info->state !=3D FBINFO_STATE_RUNNING)
> > +		return -EPERM;
> > +
> > +	total_size =3D info->screen_size;
> > +
> > +	if (total_size =3D=3D 0)
> > +		total_size =3D info->fix.smem_len;
> > +
> > +	if (p >=3D total_size)
> > +		return 0;
> > +
> > +	if (count >=3D total_size)
> > +		count =3D total_size;
> > +
> > +	if (count + p > total_size)
> > +		count =3D total_size - p;
> > +
> > +	src =3D (u8 __iomem *)(info->screen_base + p);
> screen_base is a char __iomem * - so this cast looks semi redundant.

I took the basic code from fbdev. Maybe there's a reason for the case,
otherwise I'll remove it.

>=20
> > +
> > +	alloc_size =3D min(count, PAGE_SIZE);
> > +
> > +	dst =3D kmalloc(alloc_size, GFP_KERNEL);
> > +	if (!dst)
> > +		return -ENOMEM;
> > +
> Same comment as below about fb_sync.
>=20
>=20
> > +	while (count) {
> > +		c =3D min(count, alloc_size);
> > +
> > +		memcpy_fromio(dst, src, c);
> > +		if (copy_to_user(buf, dst, c)) {
> > +			err =3D -EFAULT;
> > +			break;
> > +		}
> > +
> > +		src +=3D c;
> > +		*ppos +=3D c;
> > +		buf +=3D c;
> > +		ret +=3D c;
> > +		count -=3D c;
> > +	}
> > +
> > +	kfree(dst);
> > +
> > +	if (err)
> > +		return err;
> > +
> > +	return ret;
> > +}
> > +
> > +static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char
> > __user *buf,
> > +				       size_t count, loff_t *ppos)
> > +{
> > +	unsigned long p =3D *ppos;
> > +	u8 *src;
> > +	u8 __iomem *dst;
> > +	int c, err =3D 0;
> > +	unsigned long total_size;
> > +	unsigned long alloc_size;
> > +	ssize_t ret =3D 0;
> > +
> > +	if (info->state !=3D FBINFO_STATE_RUNNING)
> > +		return -EPERM;
> > +
> > +	total_size =3D info->screen_size;
> > +
> > +	if (total_size =3D=3D 0)
> > +		total_size =3D info->fix.smem_len;
> > +
> > +	if (p > total_size)
> > +		return -EFBIG;
> > +
> > +	if (count > total_size) {
> > +		err =3D -EFBIG;
> > +		count =3D total_size;
> > +	}
> > +
> > +	if (count + p > total_size) {
> > +		/*
> > +		 * The framebuffer is too small. We do the
> > +		 * copy operation, but return an error code
> > +		 * afterwards. Taken from fbdev.
> > +		 */
> > +		if (!err)
> > +			err =3D -ENOSPC;
> > +		count =3D total_size - p;
> > +	}
> > +
> > +	alloc_size =3D min(count, PAGE_SIZE);
> > +
> > +	src =3D kmalloc(alloc_size, GFP_KERNEL);
> > +	if (!src)
> > +		return -ENOMEM;
> > +
> > +	dst =3D (u8 __iomem *)(info->screen_base + p);
> > +
>=20
> The fbdev variant call the fb_sync callback here.
> noveau and gma500 implments the fb_sync callback - but no-one else.

These drivers implement some form of HW acceleration. If they have a HW
blit/draw/etc op queued up, they have to wait for it to complete. Otherwise,
the copied memory would contain an old state. The fb_sync acts as the fence.

Fbdev only uses software copying, so the fb_sync is not required.

=46rom what I heard, the HW acceleration is not useful on modern machines. I
hope to convert more drivers to generic fbdev after these patches for
I/O-memory support have been merged.

>=20
>=20
> > +	while (count) {
> > +		c =3D min(count, alloc_size);
> > +
> > +		if (copy_from_user(src, buf, c)) {
> > +			err =3D -EFAULT;
> > +			break;
> > +		}
> > +		memcpy_toio(dst, src, c);
> When we rewrite this part to use dma_buf_map_memcpy_to() then we can
> merge the two variants of helper_{sys,cfb}_read()?
> Which is part of the todo - so OK

I'm not sure if dma_buf_map is a good fit here. The I/O-memory function does
an additional copy between system memory and I/O memory. Of course, the top
and bottom of both functions are similar and could probably be shared.

Best regards
Thomas

> > +
> > +		dst +=3D c;
> > +		*ppos +=3D c;
> > +		buf +=3D c;
> > +		ret +=3D c;
> > +		count -=3D c;
> > +	}
> > +
> > +	kfree(src);
> > +
> > +	if (err)
> > +		return err;
> > +
> > +	return ret;
> > +}
> > +
> >  /**
> >   * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
> >   * @info: fbdev registered by the helper
> > @@ -2027,6 +2156,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *inf=
o,
> > struct vm_area_struct *vma) return -ENODEV;
> >  }
> > =20
> > +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *bu=
f,
> > +				 size_t count, loff_t *ppos)
> > +{
> > +	struct drm_fb_helper *fb_helper =3D info->par;
> > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		return drm_fb_helper_sys_read(info, buf, count, ppos);
> > +	else
> > +		return drm_fb_helper_cfb_read(info, buf, count, ppos);
> > +}
> > +
> > +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char
> > __user *buf,
> > +				  size_t count, loff_t *ppos)
> > +{
> > +	struct drm_fb_helper *fb_helper =3D info->par;
> > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		return drm_fb_helper_sys_write(info, buf, count, ppos);
> > +	else
> > +		return drm_fb_helper_cfb_write(info, buf, count, ppos);
> > +}
> > +
> > +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> > +				  const struct fb_fillrect *rect)
> > +{
> > +	struct drm_fb_helper *fb_helper =3D info->par;
> > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		drm_fb_helper_sys_fillrect(info, rect);
> > +	else
> > +		drm_fb_helper_cfb_fillrect(info, rect);
> > +}
> > +
> > +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> > +				  const struct fb_copyarea *area)
> > +{
> > +	struct drm_fb_helper *fb_helper =3D info->par;
> > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		drm_fb_helper_sys_copyarea(info, area);
> > +	else
> > +		drm_fb_helper_cfb_copyarea(info, area);
> > +}
> > +
> > +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> > +				   const struct fb_image *image)
> > +{
> > +	struct drm_fb_helper *fb_helper =3D info->par;
> > +	struct drm_client_buffer *buffer =3D fb_helper->buffer;
> > +
> > +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> > +		drm_fb_helper_sys_imageblit(info, image);
> > +	else
> > +		drm_fb_helper_cfb_imageblit(info, image);
> > +}
> > +
> >  static const struct fb_ops drm_fbdev_fb_ops =3D {
> >  	.owner		=3D THIS_MODULE,
> >  	DRM_FB_HELPER_DEFAULT_OPS,
> > @@ -2034,11 +2223,11 @@ static const struct fb_ops drm_fbdev_fb_ops =3D=
 {
> >  	.fb_release	=3D drm_fbdev_fb_release,
> >  	.fb_destroy	=3D drm_fbdev_fb_destroy,
> >  	.fb_mmap	=3D drm_fbdev_fb_mmap,
> > -	.fb_read	=3D drm_fb_helper_sys_read,
> > -	.fb_write	=3D drm_fb_helper_sys_write,
> > -	.fb_fillrect	=3D drm_fb_helper_sys_fillrect,
> > -	.fb_copyarea	=3D drm_fb_helper_sys_copyarea,
> > -	.fb_imageblit	=3D drm_fb_helper_sys_imageblit,
> > +	.fb_read	=3D drm_fbdev_fb_read,
> > +	.fb_write	=3D drm_fbdev_fb_write,
> > +	.fb_fillrect	=3D drm_fbdev_fb_fillrect,
> > +	.fb_copyarea	=3D drm_fbdev_fb_copyarea,
> > +	.fb_imageblit	=3D drm_fbdev_fb_imageblit,
> >  };
> > =20
> >  static struct fb_deferred_io drm_fbdev_defio =3D {
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_confi=
g.h
> > index 5ffbb4ed5b35..ab424ddd7665 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -877,18 +877,6 @@ struct drm_mode_config {
> >  	 */
> >  	bool prefer_shadow_fbdev;
> > =20
> > -	/**
> > -	 * @fbdev_use_iomem:
> > -	 *
> > -	 * Set to true if framebuffer reside in iomem.
> > -	 * When set to true memcpy_toio() is used when copying the
> > framebuffer in
> > -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> > -	 *
> > -	 * FIXME: This should be replaced with a per-mapping is_iomem
> > -	 * flag (like ttm does), and then used everywhere in fbdev code.
> > -	 */
> > -	bool fbdev_use_iomem;
> > -
> >  	/**
> >  	 * @quirk_addfb_prefer_xbgr_30bpp:
> >  	 *
> > --=20
> > 2.28.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

