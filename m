Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A289D76A8F2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 08:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573659.898564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQipK-00018D-03; Tue, 01 Aug 2023 06:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573659.898564; Tue, 01 Aug 2023 06:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQipJ-000150-TQ; Tue, 01 Aug 2023 06:25:49 +0000
Received: by outflank-mailman (input) for mailman id 573659;
 Tue, 01 Aug 2023 06:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jaq7=DS=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qQipH-00011l-KQ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 06:25:47 +0000
Received: from frasgout13.his.huawei.com (unknown [14.137.139.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d240f77-3034-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 08:25:44 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4RFPvW14P7z9y3D6
 for <xen-devel@lists.xenproject.org>; Tue,  1 Aug 2023 14:14:15 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.220.249])
 by APP1 (Coremail) with SMTP id LxC2BwCHOroapchkgAwYAA--.27948S3;
 Tue, 01 Aug 2023 07:25:04 +0100 (CET)
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
X-Inumbo-ID: 3d240f77-3034-11ee-8613-37d641c3527e
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
Subject: [PATCH v7 1/9] swiotlb: bail out of swiotlb_init_late() if swiotlb is already allocated
Date: Tue,  1 Aug 2023 08:23:56 +0200
Message-Id: <2d7e1823e264aa1990899cc95736e78e1ec21084.1690871004.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
References: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwCHOroapchkgAwYAA--.27948S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWxCFyrZr4rWFyUJw18Krg_yoW8Jw1rp3
	47AFyvgFWFg3WxArW7C3ZrAFyjkaykK347urW5Wry3Jry5J34rG34UtrWa934rWFW8WF4S
	yFy5ZFyYv3W2qw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU8ApnDUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

If swiotlb is allocated, immediately return 0, so callers do not have to
check io_tlb_default_mem.nslabs explicitly.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 arch/arm/xen/mm.c    | 10 ++++------
 kernel/dma/swiotlb.c |  3 +++
 2 files changed, 7 insertions(+), 6 deletions(-)

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
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1c0a49e6685a..ee57fd9949dc 100644
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


