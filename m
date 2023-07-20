Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002BC75A6A0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 08:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566342.885061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNIS-0008SL-6Y; Thu, 20 Jul 2023 06:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566342.885061; Thu, 20 Jul 2023 06:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNIS-0008Ph-3p; Thu, 20 Jul 2023 06:37:56 +0000
Received: by outflank-mailman (input) for mailman id 566342;
 Thu, 20 Jul 2023 06:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8fF=DG=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1qMNIQ-0008Pb-2r
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 06:37:54 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1af9e55-26c7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 08:37:49 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6AB1267373; Thu, 20 Jul 2023 08:37:44 +0200 (CEST)
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
X-Inumbo-ID: f1af9e55-26c7-11ee-8611-37d641c3527e
Date: Thu, 20 Jul 2023 08:37:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr Tesarik <petrtesarik@huaweicloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Petr Tesarik <petr.tesarik.ext@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, James Seo <james@equiv.tech>,
	James Clark <james.clark@arm.com>,
	Kees Cook <keescook@chromium.org>,
	"moderated list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"open list:XEN SWIOTLB SUBSYSTEM" <iommu@lists.linux.dev>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>, petr@tesarici.cz
Subject: Re: [PATCH v4 1/8] swiotlb: make io_tlb_default_mem local to
 swiotlb.c
Message-ID: <20230720063744.GA3842@lst.de>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com> <7f64111986f4f361a2deb4a1a1b6f588e63a851b.1689261692.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f64111986f4f361a2deb4a1a1b6f588e63a851b.1689261692.git.petr.tesarik.ext@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 13, 2023 at 05:23:12PM +0200, Petr Tesarik wrote:
> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> 
> SWIOTLB implementation details should not be exposed to the rest of the
> kernel. This will allow to make changes to the implementation without
> modifying non-swiotlb code.
> 
> To avoid breaking existing users, provide helper functions for the few
> required fields.
> 
> As a bonus, using a helper function to initialize struct device allows to
> get rid of an #ifdef in driver core.
> 
> Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
> ---
>  arch/arm/xen/mm.c          |  2 +-
>  arch/mips/pci/pci-octeon.c |  2 +-
>  arch/x86/kernel/pci-dma.c  |  2 +-
>  drivers/base/core.c        |  4 +---
>  drivers/xen/swiotlb-xen.c  |  2 +-
>  include/linux/swiotlb.h    | 25 +++++++++++++++++++++++-
>  kernel/dma/swiotlb.c       | 39 +++++++++++++++++++++++++++++++++++++-
>  7 files changed, 67 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 3d826c0b5fee..0f32c14eb786 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -125,7 +125,7 @@ static int __init xen_mm_init(void)
>  		return 0;
>  
>  	/* we can work with the default swiotlb */
> -	if (!io_tlb_default_mem.nslabs) {
> +	if (!is_swiotlb_allocated()) {
>  		rc = swiotlb_init_late(swiotlb_size_or_default(),
>  				       xen_swiotlb_gfp(), NULL);
>  		if (rc < 0)

I'd much rather move the already initialized check into
swiotlb_init_late, which is a much cleaer interface.

>  	/* we can work with the default swiotlb */
> -	if (!io_tlb_default_mem.nslabs) {
> +	if (!is_swiotlb_allocated()) {
>  		int rc = swiotlb_init_late(swiotlb_size_or_default(),
>  					   GFP_KERNEL, xen_swiotlb_fixup);
>  		if (rc < 0)

.. and would take care of this one as well.

> +bool is_swiotlb_allocated(void)
> +{
> +	return !!io_tlb_default_mem.nslabs;

Nit: no need for the !!, we can rely on the implicit promotion to
bool.  But with the suggestion above the need for this helper
should go away anyway.

