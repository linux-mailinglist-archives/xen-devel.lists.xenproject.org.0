Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70F691B8CF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 09:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750551.1158661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN6KD-0006xn-Sv; Fri, 28 Jun 2024 07:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750551.1158661; Fri, 28 Jun 2024 07:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sN6KD-0006w0-Pe; Fri, 28 Jun 2024 07:47:17 +0000
Received: by outflank-mailman (input) for mailman id 750551;
 Fri, 28 Jun 2024 07:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DBTR=N6=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1sN6KA-0006vu-NL
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 07:47:15 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [2a03:3b40:fe:2d4::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06f235d-3522-11ef-b4bb-af5377834399;
 Fri, 28 Jun 2024 09:47:12 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id E7D851D8D35;
 Fri, 28 Jun 2024 09:47:09 +0200 (CEST)
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
X-Inumbo-ID: a06f235d-3522-11ef-b4bb-af5377834399
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1719560830; bh=5ABgD9l3EPOUU6jm+gY3zAzc/yQqRQCNjAF+JnVqObA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ph70L+uT/DAzbwgpXZ98YCI0PdG5EwmgkmsqPguQEP0YOpMbT2rLDIizYB2bn9azV
	 XZUf4hFMrQBrHaaPx9NJ0HB/Y3l1CNnOuzCg23Wiz7VeAdR58J+oD/edxNunQJewth
	 HGq96j8oOk0LzMLn9+R7BJNAe6bcwsZ0a1VW+3u1NxYvU8xXV9Q2ZnkHpRLPyEGMj7
	 qNa6juUJL0gtrvkzQwBc63MI5TOFwMp+RXARGs+m+zf5GyPbVt3AUObC30fJasUJRO
	 iQVOrDYOKaIajMpRC9oht/oPM7anlz0Qj4szdUDUot78hLSr0N8R/9k7VaudClHJqW
	 JnXDXZtOhxSxw==
Date: Fri, 28 Jun 2024 09:47:08 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: "hch@lst.de" <hch@lst.de>
Cc: Michael Kelley <mhklinux@outlook.com>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Message-ID: <20240628094708.3a454619@meshulam.tesarici.cz>
In-Reply-To: <20240628060129.GA26206@lst.de>
References: <20240607031421.182589-1-mhklinux@outlook.com>
	<SN6PR02MB41577686D72E206DB0084E90D4D62@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240627060251.GA15590@lst.de>
	<20240627085216.556744c1@meshulam.tesarici.cz>
	<SN6PR02MB4157E61B49C8435E38AC968DD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240627152513.GA23497@lst.de>
	<SN6PR02MB4157D9B1A64FF78461D6A7EDD4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240628060129.GA26206@lst.de>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

V Fri, 28 Jun 2024 08:01:29 +0200
"hch@lst.de" <hch@lst.de> naps=C3=A1no:

> On Thu, Jun 27, 2024 at 04:02:59PM +0000, Michael Kelley wrote:
> > > > Conceptually, it's still being used as a boolean function based on
> > > > whether the return value is NULL.  Renaming it to swiotlb_get_pool()
> > > > more accurately describes the return value, but obscures the
> > > > intent of determining if it is a swiotlb buffer.  I'll think about =
it.
> > > > Suggestions are welcome. =20
> > >=20
> > > Just keep is_swiotlb_buffer as a trivial inline helper that returns
> > > bool. =20
> >=20
> > I don't understand what you are suggesting.  Could you elaborate a bit?
> > is_swiotlb_buffer() can't be trivial when CONFIG_SWIOTLB_DYNAMIC
> > is set. =20
>=20
> Call the main function that finds and retuns the pool swiotlb_find_pool,
> and then have a is_swiotlb_buffer wrapper that just returns bool.
>=20

I see. That's not my point. After applying Michael's patch, the return
value is always used, except here:

bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr)
{
	return !dev_is_dma_coherent(dev) ||
	       is_swiotlb_buffer(dev, dma_to_phys(dev, dma_addr));
}

I don't think this one occurrence in the entire source tree is worth a
separate inline function.

If nobody has a better idea, I'm not really offended by keeping the
original name, is_swiotlb_buffer(). It would just become the only
function which starts with "is_" and provides more information in the
return value than a simple yes/no, and I thought there must be an
unwritten convention about that.

Petr T

