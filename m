Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3D8BD1C5
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717737.1120230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40ZR-0000RQ-A0; Mon, 06 May 2024 15:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717737.1120230; Mon, 06 May 2024 15:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40ZR-0000Pc-6Q; Mon, 06 May 2024 15:48:05 +0000
Received: by outflank-mailman (input) for mailman id 717737;
 Mon, 06 May 2024 15:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vH2P=MJ=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1s40ZP-0000PW-JY
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:48:03 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052ce61e-0bc0-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 17:48:02 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 47CBA1BCF87;
 Mon,  6 May 2024 17:48:01 +0200 (CEST)
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
X-Inumbo-ID: 052ce61e-0bc0-11ef-909c-e314d9c70b13
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1715010481; bh=srKPK1Kv8jhLdWZU61PvI/zI+CBs9Hz1Jinnh4TWed0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ECcH26Kdga6BoqJP6f+Wr+EsWEcynNVu+MHNOUyx0ZeT1iuDJEzAAL7byUxVrwX1M
	 UExDmtTSdATmlM+3jKvFhbWmH05siHZcrDSPyu7vTSesVho3ko0xZvWv3cNZ1UER4k
	 aBpoT8yMJqZXisepfMjMbeC2fxdN1P15ao5K71IT1OPdOydZtC7mmi4r42Zvd+fK5A
	 15SxAgr7mippmhpjnBqZWIjY58fcg228e/mSsR25JZy9DK7uRcA5jQkwGWR9kCFsP1
	 yXD42vVTQnYkoTfVLxJmu6PYVWR9KwXyCOSWpkWTXcnlKecTFtXhvPRPV7q4SoO/+g
	 AUzlzM0tRqd6Q==
Date: Mon, 6 May 2024 17:48:00 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: mhkelley58@gmail.com
Cc: mhklinux@outlook.com, robin.murphy@arm.com, joro@8bytes.org,
 will@kernel.org, jgross@suse.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, hch@lst.de, m.szyprowski@samsung.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, roberto.sassu@huaweicloud.com
Subject: Re: [PATCH 2/2] iommu/dma: Fix zero'ing of bounce buffer padding
 used by untrusted devices
Message-ID: <20240506174800.74ce570b@meshulam.tesarici.cz>
In-Reply-To: <20240408041142.665563-2-mhklinux@outlook.com>
References: <20240408041142.665563-1-mhklinux@outlook.com>
	<20240408041142.665563-2-mhklinux@outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

V Sun,  7 Apr 2024 21:11:42 -0700
mhkelley58@gmail.com naps=C3=A1no:

> From: Michael Kelley <mhklinux@outlook.com>
>=20
> iommu_dma_map_page() allocates swiotlb memory as a bounce buffer when
> an untrusted device wants to map only part of the memory in an
> granule. The goal is to disallow the untrusted device having
> DMA access to unrelated kernel data that may be sharing the granule.
> To meet this goal, the bounce buffer itself is zero'ed, and any
> additional swiotlb memory up to alloc_size after the bounce buffer
> end (i.e., "post-padding") is also zero'ed.
>=20
> However, as of commit 901c7280ca0d ("Reinstate some of "swiotlb: rework
> "fix info leak with DMA_FROM_DEVICE"""), swiotlb_tbl_map_single()
> always initializes the contents of the bounce buffer to the original
> memory. Zero'ing the bounce buffer is redundant and probably wrong per
> the discussion in that commit. Only the post-padding needs to be
> zero'ed.
>=20
> Also, when the DMA min_align_mask is non-zero, the allocated bounce
> buffer space may not start on a granule boundary. The swiotlb memory
> from the granule boundary to the start of the allocated bounce buffer
> might belong to some unrelated bounce buffer. So as described in the
> "second issue" in [1], it can't be zero'ed to protect against untrusted
> devices. But as of commit XXXXXXXXXXXX ("swiotlb: extend buffer
> pre-padding to alloc_align_mask if necessary"), swiotlb_tbl_map_single()

This is now commit af133562d5af.

> allocates pre-padding slots when necessary to meet min_align_mask
> requirements, making it possible to zero the pre-padding area as well.
>=20
> Finally, iommu_dma_map_page() uses the swiotlb for untrusted devices
> and also for certain kmalloc() memory. Current code does the zero'ing
> for both cases, but it is needed only for the untrusted device case.
>=20
> Fix all of this by updating iommu_dma_map_page() to zero both the
> pre-padding and post-padding areas, but not the actual bounce buffer.
> Do this only in the case where the bounce buffer is used because
> of an untrusted device.
>=20
> [1] https://lore.kernel.org/all/20210929023300.335969-1-stevensd@google.c=
om/
>=20
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
> I've wondered if this code for zero'ing the pre- and post-padding
> should go in swiotlb_tbl_map_single(). The bounce buffer proper is
> already being initialized there. But swiotlb_tbl_map_single()
> would need to test for an untrusted device (or have a "zero the
> padding" flag passed in as part of the "attrs" argument), which
> adds complexity. Thoughts?

Historically, swiotlb has never cared about exposing data from a
previous user of a bounce buffer. I assume that's because it was
pointless to make an attempt at protecting system memory from a
malicious device that can do DMA to any address anyway. The situation
has changed with hardware IOMMUs, and that could be why the zeroing is
only done in the IOMMU path.

In short, if anybody can explain the value of concealing potentially
sensitive data from devices that are not behind an IOMMU, let's move
the zeroing to swiotlb. Otherwise, let's keep what we have.

Other than that (and the missing commit id), the patch looks good to me.

Reviewed-by: Petr Tesarik <petr@tesarici.cz>

Petr T

>=20
> The commit ID of Petr's patch is X'ed out above because Petr's patch
> hasn't gone into Linus' tree yet. We can add the real commit ID once
> this patch is ready to go in.
>=20
> Also I've haven't used any "Fixes:" tags. This patch really should
> be backported only if all the other recent swiotlb fixes get
> backported, and I'm unclear on whether that will happen.
>=20
>  drivers/iommu/dma-iommu.c | 29 ++++++++++++++++-------------
>  include/linux/iova.h      |  5 +++++
>  2 files changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index c21ef1388499..ecac39b3190d 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1154,9 +1154,6 @@ static dma_addr_t iommu_dma_map_page(struct device =
*dev, struct page *page,
>  	 */
>  	if (dev_use_swiotlb(dev, size, dir) &&
>  	    iova_offset(iovad, phys | size)) {
> -		void *padding_start;
> -		size_t padding_size, aligned_size;
> -
>  		if (!is_swiotlb_active(dev)) {
>  			dev_warn_once(dev, "DMA bounce buffers are inactive, unable to map un=
aligned transaction.\n");
>  			return DMA_MAPPING_ERROR;
> @@ -1164,24 +1161,30 @@ static dma_addr_t iommu_dma_map_page(struct devic=
e *dev, struct page *page,
> =20
>  		trace_swiotlb_bounced(dev, phys, size);
> =20
> -		aligned_size =3D iova_align(iovad, size);
>  		phys =3D swiotlb_tbl_map_single(dev, phys, size,
>  					      iova_mask(iovad), dir, attrs);
> =20
>  		if (phys =3D=3D DMA_MAPPING_ERROR)
>  			return DMA_MAPPING_ERROR;
> =20
> -		/* Cleanup the padding area. */
> -		padding_start =3D phys_to_virt(phys);
> -		padding_size =3D aligned_size;
> +		/*
> +		 * Untrusted devices should not see padding areas with random
> +		 * leftover kernel data, so zero the pre- and post-padding.
> +		 * swiotlb_tbl_map_single() has initialized the bounce buffer
> +		 * proper to the contents of the original memory buffer.
> +		 */
> +		if (dev_is_untrusted(dev)) {
> +			size_t start, virt =3D (size_t)phys_to_virt(phys);
> =20
> -		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
> -		    (dir =3D=3D DMA_TO_DEVICE || dir =3D=3D DMA_BIDIRECTIONAL)) {
> -			padding_start +=3D size;
> -			padding_size -=3D size;
> -		}
> +			/* Pre-padding */
> +			start =3D iova_align_down(iovad, virt);
> +			memset((void *)start, 0, virt - start);
> =20
> -		memset(padding_start, 0, padding_size);
> +			/* Post-padding */
> +			start =3D virt + size;
> +			memset((void *)start, 0,
> +			       iova_align(iovad, start) - start);
> +		}
>  	}
> =20
>  	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index 83c00fac2acb..d2c4fd923efa 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -65,6 +65,11 @@ static inline size_t iova_align(struct iova_domain *io=
vad, size_t size)
>  	return ALIGN(size, iovad->granule);
>  }
> =20
> +static inline size_t iova_align_down(struct iova_domain *iovad, size_t s=
ize)
> +{
> +	return ALIGN_DOWN(size, iovad->granule);
> +}
> +
>  static inline dma_addr_t iova_dma_addr(struct iova_domain *iovad, struct=
 iova *iova)
>  {
>  	return (dma_addr_t)iova->pfn_lo << iova_shift(iovad);


