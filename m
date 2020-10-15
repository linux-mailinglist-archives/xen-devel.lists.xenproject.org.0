Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE4328F7F3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 19:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7704.20289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT7UW-0006HW-Iw; Thu, 15 Oct 2020 17:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7704.20289; Thu, 15 Oct 2020 17:56:40 +0000
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
	id 1kT7UW-0006H7-Fs; Thu, 15 Oct 2020 17:56:40 +0000
Received: by outflank-mailman (input) for mailman id 7704;
 Thu, 15 Oct 2020 17:56:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CmRu=DW=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1kT7UV-0006H2-Ev
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:56:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67309ffa-ba58-40da-a2de-505aa97ad7ec;
 Thu, 15 Oct 2020 17:56:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA02CAC3A;
 Thu, 15 Oct 2020 17:56:36 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CmRu=DW=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
	id 1kT7UV-0006H2-Ev
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 17:56:39 +0000
X-Inumbo-ID: 67309ffa-ba58-40da-a2de-505aa97ad7ec
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 67309ffa-ba58-40da-a2de-505aa97ad7ec;
	Thu, 15 Oct 2020 17:56:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AA02CAC3A;
	Thu, 15 Oct 2020 17:56:36 +0000 (UTC)
Date: Thu, 15 Oct 2020 19:56:34 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
Message-ID: <20201015195634.0221c84e@linux-uq9g>
In-Reply-To: <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
References: <20201015123806.32416-1-tzimmermann@suse.de>
	<20201015123806.32416-6-tzimmermann@suse.de>
	<935d5771-5645-62a6-849c-31e286db1e30@amd.com>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, 15 Oct 2020 16:08:13 +0200 Christian K=C3=B6nig <christian.koenig@a=
md.com>
wrote:

> Am 15.10.20 um 14:38 schrieb Thomas Zimmermann:
> > The new functions ttm_bo_{vmap,vunmap}() map and unmap a TTM BO in kern=
el
> > address space. The mapping's address is returned as struct dma_buf_map.
> > Each function is a simplified version of TTM's existing kmap code. Both
> > functions respect the memory's location ani/or writecombine flags.
> >
> > On top TTM's functions, GEM TTM helpers got drm_gem_ttm_{vmap,vunmap}(),
> > two helpers that convert a GEM object into the TTM BO and forward the c=
all
> > to TTM's vmap/vunmap. These helpers can be dropped into the rsp GEM obj=
ect
> > callbacks.
> >
> > v4:
> > 	* drop ttm_kmap_obj_to_dma_buf() in favor of vmap helpers (Daniel,
> > 	  Christian)
>=20
> Bunch of minor comments below, but over all look very solid to me.
>=20
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >   drivers/gpu/drm/drm_gem_ttm_helper.c | 38 +++++++++++++++
> >   drivers/gpu/drm/ttm/ttm_bo_util.c    | 72 ++++++++++++++++++++++++++++
> >   include/drm/drm_gem_ttm_helper.h     |  6 +++
> >   include/drm/ttm/ttm_bo_api.h         | 28 +++++++++++
> >   include/linux/dma-buf-map.h          | 20 ++++++++
> >   5 files changed, 164 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c
> > b/drivers/gpu/drm/drm_gem_ttm_helper.c index 0e4fb9ba43ad..db4c14d78a30
> > 100644 --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> > @@ -49,6 +49,44 @@ void drm_gem_ttm_print_info(struct drm_printer *p,
> > unsigned int indent, }
> >   EXPORT_SYMBOL(drm_gem_ttm_print_info);
> >  =20
> > +/**
> > + * drm_gem_ttm_vmap() - vmap &ttm_buffer_object
> > + * @gem: GEM object.
> > + * @map: [out] returns the dma-buf mapping.
> > + *
> > + * Maps a GEM object with ttm_bo_vmap(). This function can be used as
> > + * &drm_gem_object_funcs.vmap callback.
> > + *
> > + * Returns:
> > + * 0 on success, or a negative errno code otherwise.
> > + */
> > +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> > +		     struct dma_buf_map *map)
> > +{
> > +	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> > +
> > +	return ttm_bo_vmap(bo, map);
> > +
> > +}
> > +EXPORT_SYMBOL(drm_gem_ttm_vmap);
> > +
> > +/**
> > + * drm_gem_ttm_vunmap() - vunmap &ttm_buffer_object
> > + * @gem: GEM object.
> > + * @map: dma-buf mapping.
> > + *
> > + * Unmaps a GEM object with ttm_bo_vunmap(). This function can be used=
 as
> > + * &drm_gem_object_funcs.vmap callback.
> > + */
> > +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> > +			struct dma_buf_map *map)
> > +{
> > +	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> > +
> > +	ttm_bo_vunmap(bo, map);
> > +}
> > +EXPORT_SYMBOL(drm_gem_ttm_vunmap);
> > +
> >   /**
> >    * drm_gem_ttm_mmap() - mmap &ttm_buffer_object
> >    * @gem: GEM object.
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c index bdee4df1f3f2..80c42c774c7d
> > 100644 --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -32,6 +32,7 @@
> >   #include <drm/ttm/ttm_bo_driver.h>
> >   #include <drm/ttm/ttm_placement.h>
> >   #include <drm/drm_vma_manager.h>
> > +#include <linux/dma-buf-map.h>
> >   #include <linux/io.h>
> >   #include <linux/highmem.h>
> >   #include <linux/wait.h>
> > @@ -526,6 +527,77 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
> >   }
> >   EXPORT_SYMBOL(ttm_bo_kunmap);
> >  =20
> > +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> > +{
> > +	struct ttm_resource *mem =3D &bo->mem;
> > +	int ret;
> > +
> > +	ret =3D ttm_mem_io_reserve(bo->bdev, mem);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (mem->bus.is_iomem) {
> > +		void __iomem *vaddr_iomem;
> > +		unsigned long size =3D bo->num_pages << PAGE_SHIFT;
>=20
> Please use uint64_t here and make sure to cast bo->num_pages before=20
> shifting.
>=20
> We have an unit tests of allocating a 8GB BO and that should work on a=20
> 32bit machine as well :)
>=20
> > +
> > +		if (mem->bus.addr)
> > +			vaddr_iomem =3D (void *)(((u8 *)mem->bus.addr));
> > +		else if (mem->placement & TTM_PL_FLAG_WC)
>=20
> I've just nuked the TTM_PL_FLAG_WC flag in drm-misc-next. There is a new=
=20
> mem->bus.caching enum as replacement.
>=20
> > +			vaddr_iomem =3D ioremap_wc(mem->bus.offset, size);
> > +		else
> > +			vaddr_iomem =3D ioremap(mem->bus.offset, size);
> > +
> > +		if (!vaddr_iomem)
> > +			return -ENOMEM;
> > +
> > +		dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
> > +
> > +	} else {
> > +		struct ttm_operation_ctx ctx =3D {
> > +			.interruptible =3D false,
> > +			.no_wait_gpu =3D false
> > +		};
> > +		struct ttm_tt *ttm =3D bo->ttm;
> > +		pgprot_t prot;
> > +		void *vaddr;
> > +
> > +		BUG_ON(!ttm);
>=20
> I think we can drop this, populate will just crash badly anyway.
>=20
> > +
> > +		ret =3D ttm_tt_populate(bo->bdev, ttm, &ctx);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/*
> > +		 * We need to use vmap to get the desired page protection
> > +		 * or to make the buffer object look contiguous.
> > +		 */
> > +		prot =3D ttm_io_prot(mem->placement, PAGE_KERNEL);
>=20
> The calling convention has changed on drm-misc-next as well, but should=20
> be trivial to adapt.

Thanks for quickly reviewing these patches. My drm-tip seems out of date
(last Sunday). TTM is moving fast these days and I still have to get used to
that. :)

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
> > +		vaddr =3D vmap(ttm->pages, bo->num_pages, 0, prot);
> > +		if (!vaddr)
> > +			return -ENOMEM;
> > +
> > +		dma_buf_map_set_vaddr(map, vaddr);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_vmap);
> > +
> > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *m=
ap)
> > +{
> > +	if (dma_buf_map_is_null(map))
> > +		return;
> > +
> > +	if (map->is_iomem)
> > +		iounmap(map->vaddr_iomem);
> > +	else
> > +		vunmap(map->vaddr);
> > +	dma_buf_map_clear(map);
> > +
> > +	ttm_mem_io_free(bo->bdev, &bo->mem);
> > +}
> > +EXPORT_SYMBOL(ttm_bo_vunmap);
> > +
> >   static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
> >   				 bool dst_use_tt)
> >   {
> > diff --git a/include/drm/drm_gem_ttm_helper.h
> > b/include/drm/drm_gem_ttm_helper.h index 118cef76f84f..7c6d874910b8 100=
644
> > --- a/include/drm/drm_gem_ttm_helper.h
> > +++ b/include/drm/drm_gem_ttm_helper.h
> > @@ -10,11 +10,17 @@
> >   #include <drm/ttm/ttm_bo_api.h>
> >   #include <drm/ttm/ttm_bo_driver.h>
> >  =20
> > +struct dma_buf_map;
> > +
> >   #define drm_gem_ttm_of_gem(gem_obj) \
> >   	container_of(gem_obj, struct ttm_buffer_object, base)
> >  =20
> >   void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int inden=
t,
> >   			    const struct drm_gem_object *gem);
> > +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> > +		     struct dma_buf_map *map);
> > +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> > +			struct dma_buf_map *map);
> >   int drm_gem_ttm_mmap(struct drm_gem_object *gem,
> >   		     struct vm_area_struct *vma);
> >  =20
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > index 37102e45e496..2c59a785374c 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -48,6 +48,8 @@ struct ttm_bo_global;
> >  =20
> >   struct ttm_bo_device;
> >  =20
> > +struct dma_buf_map;
> > +
> >   struct drm_mm_node;
> >  =20
> >   struct ttm_placement;
> > @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
> > unsigned long start_page, */
> >   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> >  =20
> > +/**
> > + * ttm_bo_vmap
> > + *
> > + * @bo: The buffer object.
> > + * @map: pointer to a struct dma_buf_map representing the map.
> > + *
> > + * Sets up a kernel virtual mapping, using ioremap or vmap to the
> > + * data in the buffer object. The parameter @map returns the virtual
> > + * address as struct dma_buf_map. Unmap the buffer with ttm_bo_vunmap(=
).
> > + *
> > + * Returns
> > + * -ENOMEM: Out of memory.
> > + * -EINVAL: Invalid range.
> > + */
> > +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> > +
> > +/**
> > + * ttm_bo_vunmap
> > + *
> > + * @bo: The buffer object.
> > + * @map: Object describing the map to unmap.
> > + *
> > + * Unmaps a kernel map set up by ttm_bo_vmap().
> > + */
> > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map
> > *map); +
> >   /**
> >    * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
> >    *
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > index fd1aba545fdf..2e8bbecb5091 100644
> > --- a/include/linux/dma-buf-map.h
> > +++ b/include/linux/dma-buf-map.h
> > @@ -45,6 +45,12 @@
> >    *
> >    *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> >    *
> > + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> > + *
> > + * .. code-block:: c
> > + *
> > + *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > + *
> >    * Test if a mapping is valid with either dma_buf_map_is_set() or
> >    * dma_buf_map_is_null().
> >    *
> > @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct
> > dma_buf_map *map, void *vaddr) map->is_iomem =3D false;
> >   }
> >  =20
> > +/**
> > + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to an
> > address in I/O memory
> > + * @map:		The dma-buf mapping structure
> > + * @vaddr_iomem:	An I/O-memory address
> > + *
> > + * Sets the address and the I/O-memory flag.
> > + */
> > +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> > +					       void __iomem *vaddr_iomem)
> > +{
> > +	map->vaddr_iomem =3D vaddr_iomem;
> > +	map->is_iomem =3D true;
> > +}
> > +
> >   /**
> >    * dma_buf_map_is_equal - Compares two dma-buf mapping structures for
> > equality
> >    * @lhs:	The dma-buf mapping structure
>=20
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

