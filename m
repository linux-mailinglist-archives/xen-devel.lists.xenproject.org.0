Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1308A50EC
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 15:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706211.1103300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwMFC-0001og-5N; Mon, 15 Apr 2024 13:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706211.1103300; Mon, 15 Apr 2024 13:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwMFC-0001mK-2c; Mon, 15 Apr 2024 13:19:34 +0000
Received: by outflank-mailman (input) for mailman id 706211;
 Mon, 15 Apr 2024 13:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vrLP=LU=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1rwMFA-0001mE-Hw
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 13:19:32 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [2a03:3b40:fe:2d4::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb301b69-fb2a-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 15:19:31 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 171AF1BEEE3;
 Mon, 15 Apr 2024 15:19:29 +0200 (CEST)
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
X-Inumbo-ID: cb301b69-fb2a-11ee-b908-491648fe20b8
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1713187170; bh=H7qkdyb/Y4bVUiPoNIOX6jPwjCN1aPjIKdG4tz+fkTw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=09GybjZJ1pkgrpv8t2KOl3uKTKKOq3Mydc0g3n0IOtyEHDRPP38j3ntH7mdKsnlAO
	 6Hqcizz8+UeFHftXQg4reiQDgXnI3Lo5tTfhPMDjy2DPgjpME3XCggOTCFtRPmfU83
	 5xWyfvjSKaNrWlhcEBxmEc51bHRiOeWnoiySR7p+DA8hU9ksIvEokmv5ep0UBNkE1q
	 XvETXhkz88EpVJGcOFb5FwfLqXpnwF5ofgJYpSaAeXve2JZFyP04cGW/pC/uxbLIuy
	 6bMCzD0Dy/wm5IaVr5qHmb86wUL3hZVhs5KYU5uRTnTuHi301uT2VJjFYmHdcqH//1
	 sIs0YspVlj5xg==
Date: Mon, 15 Apr 2024 15:19:27 +0200
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
Message-ID: <20240415151927.0145f742@meshulam.tesarici.cz>
In-Reply-To: <SN6PR02MB415749D379BFCC0749B44900D4092@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240408041142.665563-1-mhklinux@outlook.com>
	<20240415134624.22092bb0@meshulam.tesarici.cz>
	<SN6PR02MB4157C8206FE193B2C5B2A93FD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
	<20240415145023.78e7ce97@meshulam.tesarici.cz>
	<SN6PR02MB415749D379BFCC0749B44900D4092@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 13:03:30 +0000
Michael Kelley <mhklinux@outlook.com> wrote:

> From: Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> Sent: Monday, April 15, 2=
024 5:50 AM
> >=20
> > On Mon, 15 Apr 2024 12:23:22 +0000
> > Michael Kelley <mhklinux@outlook.com> wrote:
> >  =20
> > > From: Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> Sent: Monday, April 1=
5, 2024 4:46 AM =20
> > > >
> > > > Hi Michael,
> > > >
> > > > sorry for taking so long to answer. Yes, there was no agreement on =
the
> > > > removal of the "dir" parameter, but I'm not sure it's because of
> > > > symmetry with swiotlb_sync_*(), because the topic was not really
> > > > discussed.
> > > >
> > > > The discussion was about the KUnit test suite and whether direction=
 is
> > > > a property of the bounce buffer or of each sync operation. Since DM=
A API
> > > > defines associates each DMA buffer with a direction, the direction
> > > > parameter passed to swiotlb_sync_*() should match what was passed to
> > > > swiotlb_tbl_map_single(), because that's how it is used by the gene=
ric
> > > > DMA code. In other words, if the parameter is kept, it should be ke=
pt
> > > > to match dma_map_*().
> > > >
> > > > However, there is also symmetry with swiotlb_tbl_unmap_single(). Th=
is
> > > > function does use the parameter for the final sync. I believe there
> > > > should be a matching initial sync in swiotlb_tbl_map_single(). In
> > > > short, the buffer sync for DMA non-coherent devices should be moved=
 from
> > > > swiotlb_map() to swiotlb_tbl_map_single(). If this sync is not need=
ed,
> > > > then the caller can (and should) include DMA_ATTR_SKIP_CPU_SYNC in
> > > > the flags parameter.
> > > >
> > > > To sum it up:
> > > >
> > > > * Do *NOT* remove the "dir" parameter.
> > > > * Let me send a patch which moves the initial buffer sync.
> > > > =20
> > >
> > > I'm not seeing the need to move the initial buffer sync.  All
> > > callers of swiotlb_tbl_map_single() already have a subsequent
> > > check for a non-coherent device, and a call to
> > > arch_sync_dma_for_device().  And the Xen code has some
> > > special handling that probably shouldn't go in
> > > swiotlb_tbl_map_single().  Or am I missing something? =20
> >=20
> > Oh, sure, there's nothing broken ATM. It's merely a cleanup. The API is
> > asymmetric and thus confusing. You get a final sync by default if you
> > call swiotlb_tbl_unmap_single(),  =20
>=20
> I don't see that final sync in swiotlb_tbl_unmap_single().  It calls
> swiotlb_bounce() to copy the data, but it doesn't deal with
> non-coherent devices or call arch_sync_dma_for_cpu().

Ouch. You're right! The buffer gets only bounced but not synced if
device DMA is non-coherent. So, how is this supposed to work?

Now I'm looking at the code in dma_direct_map_page(), and it calls
arch_sync_dma_for_device() explicitly, _except_ when using SWIOTLB. So,
maybe I should instead review all callers of swiotlb_map(), make sure
that they handle non-coherent devices, and then remove the sync from
swiotlb_map()?

I mean, the current situation seems somewhat disorganized to me.

Petr T

