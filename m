Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E08A4F9B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 14:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706167.1103244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLn4-0001Sh-VN; Mon, 15 Apr 2024 12:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706167.1103244; Mon, 15 Apr 2024 12:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwLn4-0001R5-Se; Mon, 15 Apr 2024 12:50:30 +0000
Received: by outflank-mailman (input) for mailman id 706167;
 Mon, 15 Apr 2024 12:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vrLP=LU=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1rwLn3-0001Qz-3b
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 12:50:30 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb1534fb-fb26-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 14:50:26 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 9439E1BF928;
 Mon, 15 Apr 2024 14:50:24 +0200 (CEST)
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
X-Inumbo-ID: bb1534fb-fb26-11ee-94a3-07e782e9044d
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1713185424; bh=M2HaBAuTKrviowlzyI5h8oMxT5Sg+xhz7eOEBl7jJB0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c8k06kIOXmMJv7e2ISjtiEV6tNW/S+yPRdzSor2v9Ruz3mcCQpiNe24AiI1zjWSko
	 MqS/+pJZVWvHolsHemuBN7L2IifbIPIQlS1hAn3mEEoYHiMKEUQyG0UZq1O/FcUlEO
	 45fdUvgFPHC9mwNNPMarBaLqlbtpAsgga/rVRGdXEWqBpIFLXuWCWI3zwCCKRPD3Vc
	 XEopKqj+lIjr5amlK43aRwFu+zO95cwkxZaXrklAnO7RVMzUDaodKHArz0nxXer6h7
	 YEVLNNwFVU99aeGT/khpEWzFh9IPgCptc4SEhlTqI6ISRsUsLBAItVnPmeN/bB3LFO
	 lCIGSEtpA+baA==
Date: Mon, 15 Apr 2024 14:50:23 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "mhkelley58@gmail.com" <mhkelley58@gmail.com>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "hch@lst.de" <hch@lst.de>, "m.szyprowski@samsung.com"
 <m.szyprowski@samsung.com>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "roberto.sassu@huaweicloud.com"
 <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH 1/2] swiotlb: Remove alloc_size argument to
 swiotlb_tbl_map_single()
Message-ID: <20240415145023.78e7ce97@meshulam.tesarici.cz>
In-Reply-To: <SN6PR02MB4157C8206FE193B2C5B2A93FD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240408041142.665563-1-mhklinux@outlook.com>
	<20240415134624.22092bb0@meshulam.tesarici.cz>
	<SN6PR02MB4157C8206FE193B2C5B2A93FD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 12:23:22 +0000
Michael Kelley <mhklinux@outlook.com> wrote:

> From: Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> Sent: Monday, April 15, 2=
024 4:46 AM
> >=20
> > Hi Michael,
> >=20
> > sorry for taking so long to answer. Yes, there was no agreement on the
> > removal of the "dir" parameter, but I'm not sure it's because of
> > symmetry with swiotlb_sync_*(), because the topic was not really
> > discussed.
> >=20
> > The discussion was about the KUnit test suite and whether direction is
> > a property of the bounce buffer or of each sync operation. Since DMA API
> > defines associates each DMA buffer with a direction, the direction
> > parameter passed to swiotlb_sync_*() should match what was passed to
> > swiotlb_tbl_map_single(), because that's how it is used by the generic
> > DMA code. In other words, if the parameter is kept, it should be kept
> > to match dma_map_*().
> >=20
> > However, there is also symmetry with swiotlb_tbl_unmap_single(). This
> > function does use the parameter for the final sync. I believe there
> > should be a matching initial sync in swiotlb_tbl_map_single(). In
> > short, the buffer sync for DMA non-coherent devices should be moved from
> > swiotlb_map() to swiotlb_tbl_map_single(). If this sync is not needed,
> > then the caller can (and should) include DMA_ATTR_SKIP_CPU_SYNC in
> > the flags parameter.
> >=20
> > To sum it up:
> >=20
> > * Do *NOT* remove the "dir" parameter.
> > * Let me send a patch which moves the initial buffer sync.
> >  =20
>=20
> I'm not seeing the need to move the initial buffer sync.  All
> callers of swiotlb_tbl_map_single() already have a subsequent
> check for a non-coherent device, and a call to=20
> arch_sync_dma_for_device().  And the Xen code has some=20
> special handling that probably shouldn't go in
> swiotlb_tbl_map_single().  Or am I missing something?

Oh, sure, there's nothing broken ATM. It's merely a cleanup. The API is
asymmetric and thus confusing. You get a final sync by default if you
call swiotlb_tbl_unmap_single(), but you don't get an initial sync by
default if you call swiotlb_tbl_map_single(). This is difficult to
remember, so potential new users of the API may incorrectly assume that
an initial sync is done, or that a final sync is not done.

And yes, when moving the code, all current users of
swiotlb_tbl_map_single() should specify DMA_ATTR_SKIP_CPU_SYNC.

Petr T

