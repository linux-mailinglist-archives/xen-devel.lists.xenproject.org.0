Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060592D0B6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 13:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756909.1165644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVYX-0007Uu-9B; Wed, 10 Jul 2024 11:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756909.1165644; Wed, 10 Jul 2024 11:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRVYX-0007T1-5z; Wed, 10 Jul 2024 11:32:17 +0000
Received: by outflank-mailman (input) for mailman id 756909;
 Wed, 10 Jul 2024 11:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lkdt=OK=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1sRVYT-0007Sr-Jj
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 11:32:15 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c228b6d-3eb0-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 13:32:11 +0200 (CEST)
Received: from mordecai.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 4C74C1E33D1;
 Wed, 10 Jul 2024 13:32:10 +0200 (CEST)
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
X-Inumbo-ID: 0c228b6d-3eb0-11ef-8776-851b0ebba9a2
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1720611130; bh=moHes3pnqVk61P66RkEXxoLuJdZ/zT/x933Dj0tPO7U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A0mA/v5z1/FWOl7Z7VV+oN9LRRUp/ACb0HMAtlO3u6hH/6Ph52DVNy502vk3QXxmj
	 l0OSQsKlqu9YVZ7Ve4lEGWsekGte9uAxFm7HdlLz7Y1/hFqPF5IU0Tq/f4PsU5IvvP
	 KNRWuK1Oo8yoNKxRQuz4N9v8QyCi2oAUyUQiz4WeloiEPGZuReLfHnyo2rJbk3QA8U
	 b9bW3haJadDoGY8DZZDYzUKfC/yT2gNj5vmHdsCM7W4cvIH63qehWF0o1ojwsHNkQg
	 /d9V7wTWwF99wHnal5hC0MrnwV10x7Kl7dVvGyx5olfAA+QqSKovJKAlyTuR5jbWzS
	 QV/dvdSNN15kQ==
Date: Wed, 10 Jul 2024 13:32:05 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: mhkelley58@gmail.com, mhklinux@outlook.com, robin.murphy@arm.com,
 joro@8bytes.org, will@kernel.org, jgross@suse.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, m.szyprowski@samsung.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240710133205.63858e7a@mordecai.tesarici.cz>
In-Reply-To: <20240710055520.GA25305@lst.de>
References: <20240708194100.1531-1-mhklinux@outlook.com>
	<20240709111013.6103d3f0@mordecai.tesarici.cz>
	<20240709111812.GB4421@lst.de>
	<20240709210818.28116c53@meshulam.tesarici.cz>
	<20240710055520.GA25305@lst.de>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jul 2024 07:55:20 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Tue, Jul 09, 2024 at 09:08:18PM +0200, Petr Tesa=C5=99=C3=ADk wrote:
> > I'm confused. If you're not a big fan, why are we effectively adding
> > them to more places now than before the patch? =20
>=20
> Because I didn't want to second guess the patch author too much.

Fair enough. I don't have any relevant test cases either, so when/if
somebody encounters an issue, let them change it then.

Thanks!
Petr T

