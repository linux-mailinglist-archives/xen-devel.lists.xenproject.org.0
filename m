Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D275A890
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566440.885234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOcW-0004SQ-MT; Thu, 20 Jul 2023 08:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566440.885234; Thu, 20 Jul 2023 08:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOcW-0004Qi-Jn; Thu, 20 Jul 2023 08:02:44 +0000
Received: by outflank-mailman (input) for mailman id 566440;
 Thu, 20 Jul 2023 08:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tOt0=DG=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qMOcV-0004Qa-Cy
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:02:43 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [2a03:3b40:fe:2d4::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccfac78a-26d3-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 10:02:42 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 3ECD7164269;
 Thu, 20 Jul 2023 10:02:39 +0200 (CEST)
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
X-Inumbo-ID: ccfac78a-26d3-11ee-b23a-6b7b168915f2
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1689840159; bh=D7uejbPnusryYbx96m6L7cjLYp5Gmplm0qfp8geBlY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y5azLUXFqHfPiDcwLhK9RwnD6ejtiZ+5Q02Bj+zd22Fr+LTkHaT722JMUBsOsMObf
	 d/uJjgs0CGt4ina28Lmi+hf5m9guZ+TRvuODDbwcLdrHc3ABi2F9r9nWpfci2kQrla
	 Z2yA0zYxxpDaId3rWBew7EufpvEwO7go1DmYHTMzHoRlZ7WPskE92l6RVNhUeRWnKg
	 fKAg7BCd5Gjf6KvOFOw4bkEQUU4pOxankJGS7I9GPQu8i9MLEdtCZumfu7B6IuuFen
	 OKCplt0boWwWvjkRP8KQZMs+QBemLE/Tga0vCGYkGNdPfyg0bvUJ2CxXY0zZ+Agu45
	 DanUaK6MSjTxA==
Date: Thu, 20 Jul 2023 10:02:38 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Petr Tesarik <petrtesarik@huaweicloud.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Juergen Gross <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Petr
 Tesarik <petr.tesarik.ext@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede
 <hdegoede@redhat.com>, James Seo <james@equiv.tech>, James Clark
 <james.clark@arm.com>, Kees Cook <keescook@chromium.org>, "moderated
 list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>, "moderated
 list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, "open list:XEN SWIOTLB SUBSYSTEM"
 <iommu@lists.linux.dev>, Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v4 8/8] swiotlb: search the software IO TLB only if a
 device makes use of it
Message-ID: <20230720100238.58f11c06@meshulam.tesarici.cz>
In-Reply-To: <20230720064744.GA4395@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
	<a8d31d3fffa0867dce2b44b98dc2714289edfdc9.1689261692.git.petr.tesarik.ext@huawei.com>
	<20230720064744.GA4395@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jul 2023 08:47:44 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Any reason this can't just do a list_empty_careful on the list
> instead of adding yet another field that grows struct device?

On which list?

The dma_io_tlb_pools list only contains transient pools, but a device
may use bounce buffers from a regular pool.

The dma_io_tlb_mem.pools list will always be non-empty, unless the
system runs without SWIOTLB.

On a system which does have a SWIOTLB, the flag allows to differentiate
between devices that actually use bounce buffers and devices that do
not (e.g. because they do not have any addressing limitations).

Petr T

