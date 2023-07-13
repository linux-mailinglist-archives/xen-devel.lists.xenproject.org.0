Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6B7526C9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 17:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563254.880405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyCC-0005AZ-3A; Thu, 13 Jul 2023 15:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563254.880405; Thu, 13 Jul 2023 15:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyCC-00057e-05; Thu, 13 Jul 2023 15:25:32 +0000
Received: by outflank-mailman (input) for mailman id 563254;
 Thu, 13 Jul 2023 15:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mYz=C7=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qJyCA-0003b5-II
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 15:25:30 +0000
Received: from frasgout12.his.huawei.com (unknown [14.137.139.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eca0539-2191-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 17:25:28 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4R1ylN4SXlz9xFqk
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 23:12:32 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.218.161])
 by APP1 (Coremail) with SMTP id LxC2BwA3k94BF7BkxG6BBA--.7207S6;
 Thu, 13 Jul 2023 16:25:00 +0100 (CET)
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
X-Inumbo-ID: 7eca0539-2191-11ee-8611-37d641c3527e
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
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	petr@tesarici.cz
Subject: [PATCH v4 4/8] swiotlb: add a flag whether a SWIOTLB is allowed to grow
Date: Thu, 13 Jul 2023 17:23:15 +0200
Message-Id: <80501ecd65a7089ccfe9577a666dcaaddcafb4e7.1689261692.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwA3k94BF7BkxG6BBA--.7207S6
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW8XF1fKr1fZr13Wr4UArb_yoW5CFWUpF
	15Aa1UKF42qF1xArZ7CwnxJF929a1vkay7urWY9ry5Ar13Gr13tF4DKay5tryFqr4jvF4S
	vFyIvr4YyFnFvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
	GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3l19UUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

Mark the default SWIOTLB as able to grow and restricted DMA pools as
unable.

However, if the address of the default memory pool is explicitly queried,
make the default SWIOTLB also unable to grow. This is currently used to set
up PCI BAR movable regions on some Octeon MIPS boards which may not be able
to use a SWIOTLB pool elsewhere in physical memory. See octeon_pci_setup()
for more details.

If a remap function is specified, it must be also called on any dynamically
allocated pools, but there are some issues:

- The remap function may block, so it should not be called from an atomic
  context.
- There is no corresponding unremap() function if the memory pool is
  freed.
- The only in-tree implementation (xen_swiotlb_fixup) requires that the
  number of slots in the memory pool is a multiple of SWIOTLB_SEGSIZE.

Keep it simple for now and disable growing the SWIOTLB if a remap function
was specified.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/swiotlb.h | 2 ++
 kernel/dma/swiotlb.c    | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d669e11e2827..81f8c901e888 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -102,6 +102,7 @@ struct io_tlb_pool {
  * @debugfs:	The dentry to debugfs.
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
+ * @can_grow:	%true if more pools can be allocated dynamically.
  * @total_used:	The total number of slots in the pool that are currently used
  *		across all areas. Used only for calculating used_hiwater in
  *		debugfs.
@@ -114,6 +115,7 @@ struct io_tlb_mem {
 	struct dentry *debugfs;
 	bool force_bounce;
 	bool for_alloc;
+	bool can_grow;
 #ifdef CONFIG_DEBUG_FS
 	atomic_long_t total_used;
 	atomic_long_t used_hiwater;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a80b77de8829..16e5b9a82902 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -332,6 +332,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 
 	io_tlb_default_mem.force_bounce =
 		swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
+	io_tlb_default_mem.can_grow = !remap;
 
 	if (!default_nareas)
 		swiotlb_adjust_nareas(num_possible_cpus());
@@ -399,6 +400,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		return 0;
 
 	io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
+	io_tlb_default_mem.can_grow = !remap;
 
 	if (!default_nareas)
 		swiotlb_adjust_nareas(num_possible_cpus());
@@ -1074,6 +1076,7 @@ EXPORT_SYMBOL_GPL(is_swiotlb_active);
  */
 phys_addr_t default_swiotlb_start(void)
 {
+	io_tlb_default_mem.can_grow = false;
 	return io_tlb_default_pool.start;
 }
 
@@ -1236,6 +1239,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 					 false, nareas);
 		mem->force_bounce = true;
 		mem->for_alloc = true;
+		mem->can_grow = false;
 		mem->pool = pool;
 		mem->nslabs = nslabs;
 
-- 
2.25.1


