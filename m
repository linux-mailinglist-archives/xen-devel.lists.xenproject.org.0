Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BD54DA26
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 08:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350416.576764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1iax-0004cl-0D; Thu, 16 Jun 2022 06:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350416.576764; Thu, 16 Jun 2022 06:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1iaw-0004Zv-Sz; Thu, 16 Jun 2022 06:03:06 +0000
Received: by outflank-mailman (input) for mailman id 350416;
 Thu, 16 Jun 2022 06:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZtRg=WX=bombadil.srs.infradead.org=BATV+c9d26d7972d0db0217a7+6871+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1o1iau-0004Zp-J7
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 06:03:05 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa8191a8-ed39-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 08:03:02 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o1iaq-000fho-44; Thu, 16 Jun 2022 06:03:00 +0000
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
X-Inumbo-ID: fa8191a8-ed39-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iOBMPze3s2Lts4x7hCuI3brE8gqb/oK3vC99y6kJxTs=; b=FAJ6hHlfYq4a8A6nEmnUqy7YFQ
	H6/hQfIR6XVi3ZDAKoGfGTCP9dXBPMyzxG4Lsa0dRw/WjSE0HqqXy2alHlxN+uDU0JHEIsw+2JXvC
	b6kwpx1G1peN6Il1mC6O3gBJp5q8UWXHLbsyWvbj51yVdVpKRLOP82DAY66mybij8zNOC+uzjTlTy
	q7VP7rb3smIlUDJg8oqBQL3nhYJe12nt0DoK1OlYM+9g3TTif1VAm2XvNGh41lCUbfmhpYUZbDuSC
	51k4GsSN3PmkQnngV8M9IYsuldfh1KvfxBW2ks3xs7mDwA5shOfORFQA4WXu99U0joY+rxSv1Vawd
	M6XM+gjQ==;
Date: Wed, 15 Jun 2022 23:03:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	viresh.kumar@linaro.org, hch@infradead.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2] xen: don't require virtio with grants for non-PV
 guests
Message-ID: <YqrHlNOiRxxc8xcq@infradead.org>
References: <20220616053715.3166-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220616053715.3166-1-jgross@suse.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jun 16, 2022 at 07:37:15AM +0200, Juergen Gross wrote:
> Commit fa1f57421e0b ("xen/virtio: Enable restricted memory access using
> Xen grant mappings") introduced a new requirement for using virtio
> devices: the backend now needs to support the VIRTIO_F_ACCESS_PLATFORM
> feature.
> 
> This is an undue requirement for non-PV guests, as those can be operated
> with existing backends without any problem, as long as those backends
> are running in dom0.
> 
> Per default allow virtio devices without grant support for non-PV
> guests.
> 
> Add a new config item to always force use of grants for virtio.

What �'d really expect here is to only set the limitations for the
actual grant-based devic.  Unfortunately
PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS is global instead of per-device,
but this is what coms closest to that intention without major
refactoring:

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 1f9c3ba328333..07eb69f9e7df3 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -443,8 +443,6 @@ static int __init xen_guest_init(void)
 	if (!xen_domain())
 		return 0;
 
-	xen_set_restricted_virtio_memory_access();
-
 	if (!acpi_disabled)
 		xen_acpi_guest_init();
 	else
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 8b71b1dd76396..517a9d8d8f94d 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -195,8 +195,6 @@ static void __init xen_hvm_guest_init(void)
 	if (xen_pv_domain())
 		return;
 
-	xen_set_restricted_virtio_memory_access();
-
 	init_hvm_pv_info();
 
 	reserve_shared_info();
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index e3297b15701c6..f33a4421e7cd6 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -109,8 +109,6 @@ static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc);
 
 static void __init xen_pv_init_platform(void)
 {
-	xen_set_restricted_virtio_memory_access();
-
 	populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));
 
 	set_fixmap(FIX_PARAVIRT_BOOTMAP, xen_start_info->shared_info);
diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index fc01424840017..f9bbacb5b5456 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/platform-feature.h>
 #include <linux/dma-map-ops.h>
 #include <linux/of.h>
 #include <linux/pfn.h>
@@ -333,6 +334,8 @@ void xen_grant_setup_dma_ops(struct device *dev)
 		goto err;
 	}
 
+	/* XXX: this really should be per-device instead of blobal */
+	platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
 	dev->dma_ops = &xen_grant_dma_ops;
 
 	return;
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 0780a81e140de..a99bab8175234 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,14 +52,6 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
-#include <linux/platform-feature.h>
-
-static inline void xen_set_restricted_virtio_memory_access(void)
-{
-	if (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain())
-		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
-}
-
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
 int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
 void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);

