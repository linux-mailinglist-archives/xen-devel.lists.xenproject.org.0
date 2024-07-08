Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E09929B4F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 06:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754991.1163250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQfzi-0002RQ-Pm; Mon, 08 Jul 2024 04:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754991.1163250; Mon, 08 Jul 2024 04:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQfzi-0002Pv-N5; Mon, 08 Jul 2024 04:28:54 +0000
Received: by outflank-mailman (input) for mailman id 754991;
 Mon, 08 Jul 2024 04:28:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3k7x=OI=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1sQfzg-0002Pp-UP
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 04:28:53 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 923a60d8-3ce2-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 06:28:48 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-b985-910f-39e1-703f.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:b985:910f:39e1:703f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id C9E381E1B09;
 Mon,  8 Jul 2024 06:28:46 +0200 (CEST)
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
X-Inumbo-ID: 923a60d8-3ce2-11ef-8776-851b0ebba9a2
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1720412928; bh=1pPgaaAUuuvdjbvYPtznmd4G2eWylFU6nvLlq3caKLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bGYZm3GJbhcqN6KWJO6/rE2w8EeV+lF3OIJ8bEMkcrtNulH0q61e0gZgIJhwCG4Kn
	 kNhOjURA3dbzNo3tTDH+HAugNR2yRSIeytI52xUtesIyclt6L9F3RUWSpkhVlk+qob
	 YlqHN7lp8V13++PYy+Y5VZbYx/4ggIKzj2L23SZB93IxpeOFA772wfxgmUWIdUY+qY
	 rQEbyBptSnAZRgHlHeKNpZeGNfIp8Z9JOlQPyruAIZJQAhliyNc7E8xpmANTmQyjKF
	 wiWZ8BYwYKKTKVj2dSd8+bPK8xFV9h7ViNLOK6Qwx9cZbBXk/ZrxcPDZFWjfcwzwhN
	 gGK6uuFMvPhfQ==
Date: Mon, 8 Jul 2024 06:28:45 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Christoph Hellwig <hch@lst.de>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "will@kernel.org" <will@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240708062845.10e379b3@meshulam.tesarici.cz>
In-Reply-To: <SN6PR02MB4157141FBF8252BDEAD831C1D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240701165746.1358-1-mhklinux@outlook.com>
	<20240706055019.GA13280@lst.de>
	<SN6PR02MB4157141FBF8252BDEAD831C1D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 7 Jul 2024 02:11:48 +0000
Michael Kelley <mhklinux@outlook.com> wrote:

> From: Christoph Hellwig <hch@lst.de> Sent: Friday, July 5, 2024 10:50 PM
> >=20
> > Hi Michael,
> >=20
> > I like the idea behind this, but can you respin it to avoid some of
> > the added code duplication.  We have a lot of this pattern:
> >=20
> > 	pool =3D swiotlb_find_pool(dev, paddr);
> > 	if (pool)
> > 		swiotlb_foo(dev, ...
> >=20
> > duplicated in all three swiotlb users.  If we rename the original
> > swiotlb_foo to __swiotlb_foo and add a little inline wrapper this is
> > de-duplicated and also avoids exposing swiotlb_find_pool to the
> > callers. =20
>=20
> This works pretty well. It certainly avoids the messiness of declaring
> a "pool" local variable and needing a separate assignment before the
> "if" statement, in each of the 9 call sites. The small downside is that
> it looks like a swiotlb function is called every time, even though
> there's usually an inline bailout. But that pattern occurs throughout
> the kernel, so not a big deal.
>=20
> I initially coded this change as a separate patch that goes first. But
> the second patch ends up changing about 20 lines that are changed
> by the first patch. It's hard to cleanly tease them apart. So I've gone
> back to a single unified patch. But let me know if you think it's worth
> the extra churn to break them apart.
>=20
> >=20
> > If we then stub out swiotlb_find_pool to return NULL for !CONFIG_SWIOTL=
B,
> > we also don't need extra stubs for all the __swiotlb_ helpers as the
> > compiler will eliminate the calls as dead code. =20
>=20
> Yes, this works as long as the declarations for the __swiotlb_foo
> functions are *not* under CONFIG_SWIOTLB. But when compiling with
> !CONFIG_SWIOTLB on arm64 with gcc-8.5.0, two tangentially related
> compile errors occur. iommu_dma_map_page() references
> swiotlb_tlb_map_single(). The declaration for the latter is under
> CONFIG_SWIOTLB. A similar problem occurs with dma_direct_map_page()
> and swiotlb_map(). Do later versions of gcc not complain when the
> reference is in dead code? Or are these just bugs that occurred because
> !CONFIG_SWIOTLB is rare? If the latter, I can submit a separate patch to
> move the declarations out from under CONFIG_SWIOTLB.
>=20
> >=20
> > I might be missing something, but what is the reason for using the
> > lower-level __swiotlb_find_pool in swiotlb_map and xen_swiotlb_map_page?
> > I can't see a reason why the simple checks in swiotlb_find_pool itself
> > are either wrong or a performance problem there.   =20
>=20
> Yes, swiotlb_find_pool() could be used instead of __swiotlb_find_pool().
>=20
> > Because if we don't
> > need these separate calls we can do away with __swiotlb_find_pool
> > for !CONFIG_SWIOTLB_DYNAMIC and simplify swiotlb_find_pool quite
> > a bit like this:
> >=20
> > 	...
> >=20
> > 	if (!mem)
> > 		return NULL;
> >=20
> > 	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC)) { =20
>=20
> The "IS_ENABLED" doesn't work because the dma_uses_io_tlb
> field in struct dev is under CONFIG_SWIOTLB_DYNAMIC. I guess
> it could be moved out, but that's going further afield. So I'm back
> to using #ifdef.
>=20
> > 		smp_rmb();
> > 		if (!READ_ONCE(dev->dma_uses_io_tlb))
> > 			return NULL;
> > 		return __swiotlb_find_pool(dev, paddr);
> > 	}
> >=20
> > 	if (paddr < mem->defpool.start || paddr >=3D mem->defpool.end)
> > 		return NULL;
> > 	return &dev->dma_io_tlb_mem->defpool; =20
>=20
> Petr Tesa=C5=99=C3=ADk had commented [1] on my original RFC suggesting th=
at
> __swiotlb_find_pool() be used here instead of open coding it. With
> the changes you suggest, __swiotlb_find_pool() is needed only in
> the CONFIG_SWIOTLB_DYNAMIC case, and I would be fine with just
> open coding the address of defpool here. Petr -- are you OK with
> removing __swiotlb_find_pool when !CONFIG_SWIOTLB_DYNAMIC,
> since this is the only place it would be used?

Yes. I have never had strong opinion about it, I merely saw the
opportunity when it was low-hanging fruit, but it's definitely not
worth adding complexity.

Petr T

