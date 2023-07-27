Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85728765335
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571052.893961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzlp-0007Um-Qp; Thu, 27 Jul 2023 12:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571052.893961; Thu, 27 Jul 2023 12:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzlp-0007Rz-NK; Thu, 27 Jul 2023 12:07:05 +0000
Received: by outflank-mailman (input) for mailman id 571052;
 Thu, 27 Jul 2023 12:07:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0z/=DN=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qOzlo-00079h-Cg
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:07:04 +0000
Received: from frasgout13.his.huawei.com (unknown [14.137.139.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17a2d36d-2c76-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 14:07:02 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4RBTjl4nZ5z9xFHD
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 19:55:39 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.209.69])
 by APP2 (Coremail) with SMTP id GxC2BwBnGkGaXcJkfMYUBQ--.33878S3;
 Thu, 27 Jul 2023 13:06:23 +0100 (CET)
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
X-Inumbo-ID: 17a2d36d-2c76-11ee-8613-37d641c3527e
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Petr Tesarik <petr.tesarik.ext@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	James Seo <james@equiv.tech>,
	James Clark <james.clark@arm.com>,
	Kees Cook <keescook@chromium.org>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM),
	linux-mm@kvack.org (open list:SLAB ALLOCATOR)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	petr@tesarici.cz
Subject: [PATCH v6 1/9] swiotlb: bail out of swiotlb_init_late() if swiotlb is already allocated
Date: Thu, 27 Jul 2023 14:05:29 +0200
Message-Id: <04fd8e9caf7acf45651e1bea3878f59f0b390b9e.1690459412.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
References: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwBnGkGaXcJkfMYUBQ--.33878S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWxCFyrZr4rWFyUXry5urg_yoW8uFykp3
	43AFyvgF4jgas7ArW5C3WDZF1Yka1kK347urW5Wr13Jr15Jw45Kr1DKrWakrWrWFW8WF4S
	yFy8ZF1Fv3W2qw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjjNt3UUUUU==
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

If swiotlb is allocated, immediately return 0, so callers do not have to
check io_tlb_default_mem.nslabs explicitly.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 arch/arm/xen/mm.c         | 10 ++++------
 arch/x86/kernel/pci-dma.c | 12 ++++++------
 kernel/dma/swiotlb.c      |  3 +++
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 3d826c0b5fee..882cd70c7a2f 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -125,12 +125,10 @@ static int __init xen_mm_init(void)
 		return 0;
 
 	/* we can work with the default swiotlb */
-	if (!io_tlb_default_mem.nslabs) {
-		rc = swiotlb_init_late(swiotlb_size_or_default(),
-				       xen_swiotlb_gfp(), NULL);
-		if (rc < 0)
-			return rc;
-	}
+	rc = swiotlb_init_late(swiotlb_size_or_default(),
+			       xen_swiotlb_gfp(), NULL);
+	if (rc < 0)
+		return rc;
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index de6be0a3965e..08988b0a1c91 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -86,16 +86,16 @@ static void __init pci_xen_swiotlb_init(void)
 
 int pci_xen_swiotlb_init_late(void)
 {
+	int rc;
+
 	if (dma_ops == &xen_swiotlb_dma_ops)
 		return 0;
 
 	/* we can work with the default swiotlb */
-	if (!io_tlb_default_mem.nslabs) {
-		int rc = swiotlb_init_late(swiotlb_size_or_default(),
-					   GFP_KERNEL, xen_swiotlb_fixup);
-		if (rc < 0)
-			return rc;
-	}
+	rc = swiotlb_init_late(swiotlb_size_or_default(),
+			       GFP_KERNEL, xen_swiotlb_fixup);
+	if (rc < 0)
+		return rc;
 
 	/* XXX: this switches the dma ops under live devices! */
 	dma_ops = &xen_swiotlb_dma_ops;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 2b83e3ad9dca..66fc8ec9ae45 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -384,6 +384,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	bool retried = false;
 	int rc = 0;
 
+	if (io_tlb_default_mem.nslabs)
+		return 0;
+
 	if (swiotlb_force_disable)
 		return 0;
 
-- 
2.25.1


