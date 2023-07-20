Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6D75A84D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566423.885204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOUL-0000s0-Tr; Thu, 20 Jul 2023 07:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566423.885204; Thu, 20 Jul 2023 07:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOUL-0000po-Qv; Thu, 20 Jul 2023 07:54:17 +0000
Received: by outflank-mailman (input) for mailman id 566423;
 Thu, 20 Jul 2023 07:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tOt0=DG=tesarici.cz=petr@srs-se1.protection.inumbo.net>)
 id 1qMOUJ-0000Je-Ri
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:54:16 +0000
Received: from bee.tesarici.cz (bee.tesarici.cz [2a03:3b40:fe:2d4::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dfa7624-26d2-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 09:54:13 +0200 (CEST)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 39C4416840B;
 Thu, 20 Jul 2023 09:54:11 +0200 (CEST)
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
X-Inumbo-ID: 9dfa7624-26d2-11ee-8611-37d641c3527e
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1689839651; bh=BJwL8Mo+1mra8+b/CdY/uUP8gohBFG2ZiuHo+xJAYDU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r9ToG10AhpvW4JM508uc+NskNEr56L4qZdWR6gmLHKXzFc9vG+58URXqJFCt5425C
	 umoUV7zsftWcrElVcdedthF9VDkO4+3bBrDCQuXmLh1KPmziq8R1WnoVI899D7qecV
	 AHvnvQlRfomek07wT+ReyEhXZcbpk3iv0kSeFD5aNam+LwfNmXDZW3DiFy3ctXRhE6
	 nox25YIAihil1b73FwVDreIAAxgcfmQP6vUBpaxgoyLgYXQ89/NFApOls4l6C9YnmN
	 xSBO+gkN270w/xKtiR/cmS/Jtcbask42UH/KfY9+VRFeZRTjgEGXFGUuG/m2Q8o3WS
	 P7gy5dMRggh0A==
Date: Thu, 20 Jul 2023 09:54:10 +0200
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
Subject: Re: [PATCH v4 1/8] swiotlb: make io_tlb_default_mem local to
 swiotlb.c
Message-ID: <20230720095410.16832a9e@meshulam.tesarici.cz>
In-Reply-To: <20230720063744.GA3842@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
	<7f64111986f4f361a2deb4a1a1b6f588e63a851b.1689261692.git.petr.tesarik.ext@huawei.com>
	<20230720063744.GA3842@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jul 2023 08:37:44 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Thu, Jul 13, 2023 at 05:23:12PM +0200, Petr Tesarik wrote:
> > From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > 
> > SWIOTLB implementation details should not be exposed to the rest of the
> > kernel. This will allow to make changes to the implementation without
> > modifying non-swiotlb code.
> > 
> > To avoid breaking existing users, provide helper functions for the few
> > required fields.
> > 
> > As a bonus, using a helper function to initialize struct device allows to
> > get rid of an #ifdef in driver core.
> > 
> > Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
> > ---
> >  arch/arm/xen/mm.c          |  2 +-
> >  arch/mips/pci/pci-octeon.c |  2 +-
> >  arch/x86/kernel/pci-dma.c  |  2 +-
> >  drivers/base/core.c        |  4 +---
> >  drivers/xen/swiotlb-xen.c  |  2 +-
> >  include/linux/swiotlb.h    | 25 +++++++++++++++++++++++-
> >  kernel/dma/swiotlb.c       | 39 +++++++++++++++++++++++++++++++++++++-
> >  7 files changed, 67 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> > index 3d826c0b5fee..0f32c14eb786 100644
> > --- a/arch/arm/xen/mm.c
> > +++ b/arch/arm/xen/mm.c
> > @@ -125,7 +125,7 @@ static int __init xen_mm_init(void)
> >  		return 0;
> >  
> >  	/* we can work with the default swiotlb */
> > -	if (!io_tlb_default_mem.nslabs) {
> > +	if (!is_swiotlb_allocated()) {
> >  		rc = swiotlb_init_late(swiotlb_size_or_default(),
> >  				       xen_swiotlb_gfp(), NULL);
> >  		if (rc < 0)  
> 
> I'd much rather move the already initialized check into
> swiotlb_init_late, which is a much cleaer interface.
> 
> >  	/* we can work with the default swiotlb */
> > -	if (!io_tlb_default_mem.nslabs) {
> > +	if (!is_swiotlb_allocated()) {
> >  		int rc = swiotlb_init_late(swiotlb_size_or_default(),
> >  					   GFP_KERNEL, xen_swiotlb_fixup);
> >  		if (rc < 0)  
> 
> .. and would take care of this one as well.

Oh, you're right! These are the only two places that look at
io_tlb_default_mem.nslabs, and all they need is to avoid double
initialization. Makes perfect sense to move it inside
swiotlb_init_late().

> > +bool is_swiotlb_allocated(void)
> > +{
> > +	return !!io_tlb_default_mem.nslabs;  
> 
> Nit: no need for the !!, we can rely on the implicit promotion to
> bool.  But with the suggestion above the need for this helper
> should go away anyway.

Eh, yes. I initially declared the return type as int and then forgot to
change the return statement. But as you say, the whole function will go
away entirely.

Petr T

