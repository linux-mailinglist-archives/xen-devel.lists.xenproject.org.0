Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5A740218
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 19:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556223.868570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECQS-0008Iq-66; Tue, 27 Jun 2023 17:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556223.868570; Tue, 27 Jun 2023 17:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qECQS-0008GD-3J; Tue, 27 Jun 2023 17:24:24 +0000
Received: by outflank-mailman (input) for mailman id 556223;
 Tue, 27 Jun 2023 17:24:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rRYj=CP=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qECQQ-0008Fp-PE
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 17:24:22 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [2a03:3b40:fe:2d4::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 733da51f-150f-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 19:24:20 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id A106C8CA7A;
 Tue, 27 Jun 2023 19:24:17 +0200 (CEST)
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
X-Inumbo-ID: 733da51f-150f-11ee-8611-37d641c3527e
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1687886658; bh=9vOPDa2+EN3LYAg4BMAohZm6Jl+lEOuMGaVCuwssnaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cNk0Wgm3mOOYkdgD7o2P8zkmXB9DlvZdjG1JAbNclP/xyBhjIkW/MPZDpjjOIIR/4
	 B9+HxmW+8I3uNmUoF2WJM3IeX5oZSGC91EY5GZSR8WKa47+bB0udthwtHptF4jFmDq
	 lFCLX6B2Yr/tH2MwMKBIsmuFeha/poInE0dXhO4Y7A7lA05YKl5OI/Eyk1xSheX2cy
	 h14303BG8tneIYkRKh6qzWOQX7gkga2Yzn2C/EfYREZxN+VAdmn3fVxCXSQk6+WedL
	 KZR5SVZBabIZT9t27FMrWa5mVOrttNHWaNXGkP2NNngdNbplu/tQyrPCNag/3ednN1
	 lN2OqtGQuTTlA==
Date: Tue, 27 Jun 2023 19:24:14 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Petr Tesarik <petrtesarik@huaweicloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND
 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Juergen Gross <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kees Cook <keescook@chromium.org>, Saravana
 Kannan <saravanak@google.com>, "moderated list:XEN HYPERVISOR ARM"
 <xen-devel@lists.xenproject.org>, "moderated list:ARM PORT"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, "open list:XEN SWIOTLB SUBSYSTEM"
 <iommu@lists.linux.dev>, Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 1/7] swiotlb: make io_tlb_default_mem local to
 swiotlb.c
Message-ID: <20230627192414.6b78fdb8@meshulam.tesarici.cz>
In-Reply-To: <20230627154802.GA29567@lst.de>
References: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
	<a1ef6eeab8b64fac817b9734da4a056f05a68d01.1687859323.git.petr.tesarik.ext@huawei.com>
	<2023062745-routing-palace-d0b4@gregkh>
	<73f11258-1562-17c1-969e-b134dcb5f35c@arm.com>
	<20230627133006.16ee11af@meshulam.tesarici.cz>
	<20230627154802.GA29567@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Jun 2023 17:48:02 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Tue, Jun 27, 2023 at 01:30:06PM +0200, Petr Tesa=C5=99=C3=ADk wrote:
> > Xen is the only user of an "is SWIOTLB present" interface. IIUC Xen
> > needs bounce buffers for the PCI frontend driver, but if there is no
> > other reason to have a SWIOTLB, the system does not set up one at boot.=
 =20
>=20
> Please take a look at my "unexport swiotlb_active v2" series that
> unfortunately missed the 6.5 merge window waiting for reviews.

I noticed it, but it seems I missed the part which completely removes
pci_xen_swiotlb_init_late().

Then we're left only with a reference from xen_mm_init() in
arch/arm/xen/mm.c, and I believe this one can also be solved
differently.

Petr T

