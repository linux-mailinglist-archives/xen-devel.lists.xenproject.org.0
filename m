Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3273FB1F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 13:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556083.868330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6th-0001pN-H7; Tue, 27 Jun 2023 11:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556083.868330; Tue, 27 Jun 2023 11:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE6th-0001mZ-Dw; Tue, 27 Jun 2023 11:30:13 +0000
Received: by outflank-mailman (input) for mailman id 556083;
 Tue, 27 Jun 2023 11:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rRYj=CP=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qE6tf-0001mT-QT
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 11:30:11 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [2a03:3b40:fe:2d4::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f971248d-14dd-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 13:30:10 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 0630888EE8;
 Tue, 27 Jun 2023 13:30:06 +0200 (CEST)
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
X-Inumbo-ID: f971248d-14dd-11ee-b237-6b7b168915f2
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1687865407; bh=PMTYuWEHp4RzWxSHWEhXWEo5d5MHLxZfnxLeMEnfGD4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pcG7sqNkBFFgow2Mmh7j1elzlR0/jjXSQNzKLduKGlzVYfZajP/QiJ4lkbDtFwJLi
	 pESn5wq4anP0MZET52ZTEyNhiqUsxP6UEtpu4YIthoSaYFSns/v6oXVDnx7k0HKw2V
	 fYAaQSUKIxmzf+4SjVZDWmH+40O4FvNXNR2gRt4a7LRHTWA5RAf9DfPWrmi6XJhYTD
	 rriJpAd+AMIr+QRiWzJl6V91faWGK5BevB3Xt+t2O00J/1rFoj0fHl+yvxQGUd1PD2
	 VqpnCoIh+9t2srRILgq8MxkRXkjjqcpIMUU0TxphHFBmcdXdM+KPz3HUteGJKKi+tI
	 tEwiLAN1YW+8Q==
Date: Tue, 27 Jun 2023 13:30:06 +0200
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
Message-ID: <20230627133006.16ee11af@meshulam.tesarici.cz>
In-Reply-To: <73f11258-1562-17c1-969e-b134dcb5f35c@arm.com>
References: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
	<a1ef6eeab8b64fac817b9734da4a056f05a68d01.1687859323.git.petr.tesarik.ext@huawei.com>
	<2023062745-routing-palace-d0b4@gregkh>
	<73f11258-1562-17c1-969e-b134dcb5f35c@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Oops, originally sent only to Robin. Restoring the recipient list here...

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

I'm sorry for writing two replies, but I realized too late that this
part is unrelated to the MIPS Octeon platform.

Xen is the only user of an "is SWIOTLB present" interface. IIUC Xen
needs bounce buffers for the PCI frontend driver, but if there is no
other reason to have a SWIOTLB, the system does not set up one at boot.

Yeah, they should probably do things differently. At least this code in
arch/x86/kernel/pci-dma.c is fishy:

	/* XXX: this switches the dma ops under live devices! */
	dma_ops = &xen_swiotlb_dma_ops;

However, I don't think it's up to me to fix that...

To sum it up, I can certainly provide a separate function instead of
overloading the is_swiotlb_active() API.

Thanks for the suggestion!

Petr T

