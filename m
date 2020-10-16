Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F7290291
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 12:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7870.20752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTMfe-000168-TN; Fri, 16 Oct 2020 10:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7870.20752; Fri, 16 Oct 2020 10:09:10 +0000
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
	id 1kTMfe-00015n-PU; Fri, 16 Oct 2020 10:09:10 +0000
Received: by outflank-mailman (input) for mailman id 7870;
 Fri, 16 Oct 2020 10:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFnv=DX=ravnborg.org=sam@srs-us1.protection.inumbo.net>)
 id 1kTMfc-00015i-Lq
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:09:08 +0000
Received: from asavdk3.altibox.net (unknown [109.247.116.14])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc6680c5-20dc-4e99-95ac-c747aa491c1d;
 Fri, 16 Oct 2020 10:09:06 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id DC35220027;
 Fri, 16 Oct 2020 12:08:55 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YFnv=DX=ravnborg.org=sam@srs-us1.protection.inumbo.net>)
	id 1kTMfc-00015i-Lq
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:09:08 +0000
X-Inumbo-ID: cc6680c5-20dc-4e99-95ac-c747aa491c1d
Received: from asavdk3.altibox.net (unknown [109.247.116.14])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cc6680c5-20dc-4e99-95ac-c747aa491c1d;
	Fri, 16 Oct 2020 10:09:06 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by asavdk3.altibox.net (Postfix) with ESMTPS id DC35220027;
	Fri, 16 Oct 2020 12:08:55 +0200 (CEST)
Date: Fri, 16 Oct 2020 12:08:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
	daniel@ffwll.ch, alexander.deucher@amd.com,
	christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
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
Subject: Re: [PATCH v4 09/10] dma-buf-map: Add memcpy and pointer-increment
 interfaces
Message-ID: <20201016100854.GA1042954@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015123806.32416-10-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
	a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
	a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=0A2xud3A4b7FAmx5SMIA:9
	a=7a1rlSNJFqSX5uOf:21 a=OU_kl8OV53ZSq-ss:21 a=CjuIK1q_8ugA:10
	a=E9Po1WZjFZOl8hwRPBS3:22

Hi Thomas.

On Thu, Oct 15, 2020 at 02:38:05PM +0200, Thomas Zimmermann wrote:
> To do framebuffer updates, one needs memcpy from system memory and a
> pointer-increment function. Add both interfaces with documentation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  include/linux/dma-buf-map.h | 72 +++++++++++++++++++++++++++++++------
>  1 file changed, 62 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index 2e8bbecb5091..6ca0f304dda2 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -32,6 +32,14 @@
>   * accessing the buffer. Use the returned instance and the helper functions
>   * to access the buffer's memory in the correct way.
>   *
> + * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> + * actually independent from the dma-buf infrastructure. When sharing buffers
> + * among devices, drivers have to know the location of the memory to access
> + * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> + * solves this problem for dma-buf and its users. If other drivers or
> + * sub-systems require similar functionality, the type could be generalized
> + * and moved to a more prominent header file.
> + *
>   * Open-coding access to :c:type:`struct dma_buf_map <dma_buf_map>` is
>   * considered bad style. Rather then accessing its fields directly, use one
>   * of the provided helper functions, or implement your own. For example,
> @@ -51,6 +59,14 @@
>   *
>   *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>   *
> + * Instances of struct dma_buf_map do not have to be cleaned up, but
> + * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> + * always refer to system memory.
> + *
> + * .. code-block:: c
> + *
> + *	dma_buf_map_clear(&map);
> + *
>   * Test if a mapping is valid with either dma_buf_map_is_set() or
>   * dma_buf_map_is_null().
>   *
> @@ -73,17 +89,19 @@
>   *	if (dma_buf_map_is_equal(&sys_map, &io_map))
>   *		// always false
>   *
> - * Instances of struct dma_buf_map do not have to be cleaned up, but
> - * can be cleared to NULL with dma_buf_map_clear(). Cleared mappings
> - * always refer to system memory.
> + * A set up instance of struct dma_buf_map can be used to access or manipulate
> + * the buffer memory. Depending on the location of the memory, the provided
> + * helpers will pick the correct operations. Data can be copied into the memory
> + * with dma_buf_map_memcpy_to(). The address can be manipulated with
> + * dma_buf_map_incr().
>   *
> - * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its helpers are
> - * actually independent from the dma-buf infrastructure. When sharing buffers
> - * among devices, drivers have to know the location of the memory to access
> - * the buffers in a safe way. :c:type:`struct dma_buf_map <dma_buf_map>`
> - * solves this problem for dma-buf and its users. If other drivers or
> - * sub-systems require similar functionality, the type could be generalized
> - * and moved to a more prominent header file.
> + * .. code-block:: c
> + *
> + *	const void *src = ...; // source buffer
> + *	size_t len = ...; // length of src
> + *
> + *	dma_buf_map_memcpy_to(&map, src, len);
> + *	dma_buf_map_incr(&map, len); // go to first byte after the memcpy
>   */
>  
>  /**
> @@ -210,4 +228,38 @@ static inline void dma_buf_map_clear(struct dma_buf_map *map)
>  	}
>  }
>  
> +/**
> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> + * @dst:	The dma-buf mapping structure
> + * @src:	The source buffer
> + * @len:	The number of byte in src
> + *
> + * Copies data into a dma-buf mapping. The source buffer is in system
> + * memory. Depending on the buffer's location, the helper picks the correct
> + * method of accessing the memory.
> + */
> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> +{
> +	if (dst->is_iomem)
> +		memcpy_toio(dst->vaddr_iomem, src, len);
> +	else
> +		memcpy(dst->vaddr, src, len);
> +}
> +
> +/**
> + * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
> + * @map:	The dma-buf mapping structure
> + * @incr:	The number of bytes to increment
> + *
> + * Increments the address stored in a dma-buf mapping. Depending on the
> + * buffer's location, the correct value will be updated.
> + */
> +static inline void dma_buf_map_incr(struct dma_buf_map *map, size_t incr)
> +{
> +	if (map->is_iomem)
> +		map->vaddr_iomem += incr;
> +	else
> +		map->vaddr += incr;
> +}
> +
>  #endif /* __DMA_BUF_MAP_H__ */
> -- 
> 2.28.0

