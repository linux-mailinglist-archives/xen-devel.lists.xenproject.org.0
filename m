Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D252873FACE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 13:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556073.868309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6bH-0007AF-Mf; Tue, 27 Jun 2023 11:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556073.868309; Tue, 27 Jun 2023 11:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6bH-00078Y-Ju; Tue, 27 Jun 2023 11:11:11 +0000
Received: by outflank-mailman (input) for mailman id 556073;
 Tue, 27 Jun 2023 11:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rRYj=CP=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qE6bF-00078S-9i
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 11:11:09 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e5d5669-14db-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 13:11:04 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 8C5948C9CB;
 Tue, 27 Jun 2023 13:11:01 +0200 (CEST)
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
X-Inumbo-ID: 4e5d5669-14db-11ee-b237-6b7b168915f2
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1687864261; bh=qV5FgT4RgSJppKtj0fLN/J7cUeZK9GPTjiJP3fPSLqg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gjFY6ZJmmGKpykzVlsS77fpY32kAzzHLfddjKOGLIrtTY1sRj1XTgGb6CUYpBqlnR
	 imB7mHimhNMwspVUHmIKcQ8Y0HXaUGDkHBp/D9bPQbjM/D+ZEeO16xMudTMMfH7PqQ
	 PVKMOyjp718f6Jq5gC2N5P9/n0EqDfu7iZbW+wN+uUzOxQwga+bgmDJQNKt7AMOfQm
	 hBW7r7pIi48iOcROYf/m1SZa6iv6yiuGnOQ6g1G1ALFlIXupl4u+XiSYvbUimKHDR3
	 0fuJtcV4xwQLNeWpXtYdoz4z9GX7+FH8MF1QOBR+NdXzUxvGRAgSZH/KaQumsOtEmU
	 Vdnpw+LVD4PcQ==
Date: Tue, 27 Jun 2023 13:11:00 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Petr Tesarik
 <petrtesarik@huaweicloud.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Juergen Gross
 <jgross@suse.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski
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
Message-ID: <20230627131100.661d5297@meshulam.tesarici.cz>
In-Reply-To: <73f11258-1562-17c1-969e-b134dcb5f35c@arm.com>
References: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
	<a1ef6eeab8b64fac817b9734da4a056f05a68d01.1687859323.git.petr.tesarik.ext@huawei.com>
	<2023062745-routing-palace-d0b4@gregkh>
	<73f11258-1562-17c1-969e-b134dcb5f35c@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jun 2023 11:55:00 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> On 27/06/2023 11:24 am, Greg Kroah-Hartman wrote:
> > On Tue, Jun 27, 2023 at 11:54:23AM +0200, Petr Tesarik wrote:  
> >> +/**
> >> + * is_swiotlb_active() - check if the software IO TLB is initialized
> >> + * @dev:	Device to check, or %NULL for the default IO TLB.
> >> + */
> >>   bool is_swiotlb_active(struct device *dev)
> >>   {
> >> -	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> >> +	struct io_tlb_mem *mem = dev
> >> +		? dev->dma_io_tlb_mem
> >> +		: &io_tlb_default_mem;  
> > 
> > That's impossible to read and maintain over time, sorry.
> > 
> > Please use real "if () else" lines, so that it can be maintained over
> > time.  
> 
> Moreover, it makes for a horrible interface anyway. If there's a need 
> for a non-specific "is SWIOTLB present at all?" check unrelated to any 
> particular device (which arguably still smells of poking into 
> implementation details...), please encapsulate it in its own distinct 
> helper like, say, is_swiotlb_present(void).
> 
> However, the more I think about it, the more I doubt that logic like 
> octeon_pci_setup() can continue to work properly at all if SWIOTLB 
> allocation becomes dynamic... :/

Good, so I'm not alone. I don't know enough of the Octeon hardware to
understand how much magic is behind these PCI BARs and why one of them
should be (sometimes) programmed the way it is.

OTOH it doesn't seem to me that this platform forces DMA through
SWIOTLB. At least all calls to swiotlb_init() under arch/mips take this
form:

	swiotlb_init(true, SWIOTLB_VERBOSE);

This makes me believe that this PCI BAR setup is merely an optimization.

However, if nobody has a clear answer, a fallback solution is to stay
on the safe side and add a flag to struct io_tlb_mem whether SWIOTLB
can grow dynamically. The helper function would then set this flag and
make sure that on this Octeon platform, the SWIOTLB stays restricted to
the default pool.

Hopefully, Thomas Bogendoerfer can shed some light on that code.

Petr T

