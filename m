Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBFF5542F5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 08:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353467.580405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3u0m-0003dq-TI; Wed, 22 Jun 2022 06:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353467.580405; Wed, 22 Jun 2022 06:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3u0m-0003UX-Kb; Wed, 22 Jun 2022 06:38:48 +0000
Received: by outflank-mailman (input) for mailman id 353467;
 Wed, 22 Jun 2022 06:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3u0l-0003Ka-47
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 06:38:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5e3d974-f1f5-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 08:38:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 848C021BC4;
 Wed, 22 Jun 2022 06:38:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBDE3134A9;
 Wed, 22 Jun 2022 06:38:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kIg2OPK4smKNUAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Jun 2022 06:38:42 +0000
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
X-Inumbo-ID: f5e3d974-f1f5-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655879923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrITqNYCJEt3p9uYO0wGQLTJBftwCzF3rWhJ29DtcVs=;
	b=LEA/Lbcr+fb+XPiMkM1yGYxA5BbKwaxYNMfiUx71lus0oa+mBHLcgLZJythOp+jufQvJfE
	rRNiACi9JjKfiX9SUsk2QkkTNLoBd1ZQdhkjglt2Stw5sRmEk+20hiki1/6CwdqGn7qXMU
	hU1vE+Rn+gPHaC8ciSxiI7YuVQLY9xI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v3 1/3] virtio: replace restricted mem access flag with callback
Date: Wed, 22 Jun 2022 08:38:36 +0200
Message-Id: <20220622063838.8854-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622063838.8854-1-jgross@suse.com>
References: <20220622063838.8854-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having a global flag to require restricted memory access
for all virtio devices, introduce a callback which can select that
requirement on a per-device basis.

For convenience add a common function returning always true, which can
be used for use cases like SEV.

Per default use a callback always returning false.

As the callback needs to be set in early init code already, add a
virtio anchor which is builtin in case virtio is enabled.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/s390/mm/init.c              |  4 ++--
 arch/x86/mm/mem_encrypt_amd.c    |  4 ++--
 drivers/virtio/Kconfig           |  4 ++++
 drivers/virtio/Makefile          |  1 +
 drivers/virtio/virtio.c          |  4 ++--
 drivers/virtio/virtio_anchor.c   | 18 ++++++++++++++++++
 include/linux/platform-feature.h |  6 +-----
 include/linux/virtio_anchor.h    | 19 +++++++++++++++++++
 include/xen/xen.h                |  4 ++--
 9 files changed, 51 insertions(+), 13 deletions(-)
 create mode 100644 drivers/virtio/virtio_anchor.c
 create mode 100644 include/linux/virtio_anchor.h

diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 6a0ac00d5a42..4a154a084966 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -31,7 +31,6 @@
 #include <linux/cma.h>
 #include <linux/gfp.h>
 #include <linux/dma-direct.h>
-#include <linux/platform-feature.h>
 #include <asm/processor.h>
 #include <linux/uaccess.h>
 #include <asm/pgalloc.h>
@@ -48,6 +47,7 @@
 #include <asm/kasan.h>
 #include <asm/dma-mapping.h>
 #include <asm/uv.h>
+#include <linux/virtio_anchor.h>
 #include <linux/virtio_config.h>
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
@@ -175,7 +175,7 @@ static void pv_init(void)
 	if (!is_prot_virt_guest())
 		return;
 
-	platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
+	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 
 	/* make sure bounce buffers are shared */
 	swiotlb_init(true, SWIOTLB_FORCE | SWIOTLB_VERBOSE);
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index f6d038e2cd8e..97452688f99f 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -20,8 +20,8 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/virtio_config.h>
+#include <linux/virtio_anchor.h>
 #include <linux/cc_platform.h>
-#include <linux/platform-feature.h>
 
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
@@ -245,7 +245,7 @@ void __init sev_setup_arch(void)
 	swiotlb_adjust_size(size);
 
 	/* Set restricted memory access for virtio. */
-	platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
+	virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 }
 
 static unsigned long pg_level_to_pfn(int level, pte_t *kpte, pgprot_t *ret_prot)
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index a6dc8b5846fe..ce93966575a1 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config VIRTIO_ANCHOR
+	bool
+
 config VIRTIO
 	tristate
+	select VIRTIO_ANCHOR
 	help
 	  This option is selected by any driver which implements the virtio
 	  bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
index 0a82d0873248..8e98d24917cc 100644
--- a/drivers/virtio/Makefile
+++ b/drivers/virtio/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
+obj-$(CONFIG_VIRTIO_ANCHOR) += virtio_anchor.o
 obj-$(CONFIG_VIRTIO_PCI_LIB) += virtio_pci_modern_dev.o
 obj-$(CONFIG_VIRTIO_PCI_LIB_LEGACY) += virtio_pci_legacy_dev.o
 obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index 6bace84ae37e..21e753fe1b50 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -2,10 +2,10 @@
 #include <linux/virtio.h>
 #include <linux/spinlock.h>
 #include <linux/virtio_config.h>
+#include <linux/virtio_anchor.h>
 #include <linux/module.h>
 #include <linux/idr.h>
 #include <linux/of.h>
-#include <linux/platform-feature.h>
 #include <uapi/linux/virtio_ids.h>
 
 /* Unique numbering for virtio devices. */
@@ -174,7 +174,7 @@ static int virtio_features_ok(struct virtio_device *dev)
 
 	might_sleep();
 
-	if (platform_has(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS)) {
+	if (virtio_check_mem_acc_cb(dev)) {
 		if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
 			dev_warn(&dev->dev,
 				 "device must provide VIRTIO_F_VERSION_1\n");
diff --git a/drivers/virtio/virtio_anchor.c b/drivers/virtio/virtio_anchor.c
new file mode 100644
index 000000000000..4d6a5d269b55
--- /dev/null
+++ b/drivers/virtio/virtio_anchor.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/virtio.h>
+#include <linux/virtio_anchor.h>
+
+bool virtio_require_restricted_mem_acc(struct virtio_device *dev)
+{
+	return true;
+}
+EXPORT_SYMBOL_GPL(virtio_require_restricted_mem_acc);
+
+static bool virtio_no_restricted_mem_acc(struct virtio_device *dev)
+{
+	return false;
+}
+
+bool (*virtio_check_mem_acc_cb)(struct virtio_device *dev) =
+	virtio_no_restricted_mem_acc;
+EXPORT_SYMBOL_GPL(virtio_check_mem_acc_cb);
diff --git a/include/linux/platform-feature.h b/include/linux/platform-feature.h
index b2f48be999fa..6ed859928b97 100644
--- a/include/linux/platform-feature.h
+++ b/include/linux/platform-feature.h
@@ -6,11 +6,7 @@
 #include <asm/platform-feature.h>
 
 /* The platform features are starting with the architecture specific ones. */
-
-/* Used to enable platform specific DMA handling for virtio devices. */
-#define PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS	(0 + PLATFORM_ARCH_FEAT_N)
-
-#define PLATFORM_FEAT_N				(1 + PLATFORM_ARCH_FEAT_N)
+#define PLATFORM_FEAT_N				(0 + PLATFORM_ARCH_FEAT_N)
 
 void platform_set(unsigned int feature);
 void platform_clear(unsigned int feature);
diff --git a/include/linux/virtio_anchor.h b/include/linux/virtio_anchor.h
new file mode 100644
index 000000000000..432e6c00b3ca
--- /dev/null
+++ b/include/linux/virtio_anchor.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_VIRTIO_ANCHOR_H
+#define _LINUX_VIRTIO_ANCHOR_H
+
+#ifdef CONFIG_VIRTIO_ANCHOR
+struct virtio_device;
+
+bool virtio_require_restricted_mem_acc(struct virtio_device *dev);
+extern bool (*virtio_check_mem_acc_cb)(struct virtio_device *dev);
+
+static inline void virtio_set_mem_acc_cb(bool (*func)(struct virtio_device *))
+{
+	virtio_check_mem_acc_cb = func;
+}
+#else
+#define virtio_set_mem_acc_cb(func) do { } while (0)
+#endif
+
+#endif /* _LINUX_VIRTIO_ANCHOR_H */
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 0780a81e140d..ac5a144c6a65 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -52,12 +52,12 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
 extern u64 xen_saved_max_mem_size;
 #endif
 
-#include <linux/platform-feature.h>
+#include <linux/virtio_anchor.h>
 
 static inline void xen_set_restricted_virtio_memory_access(void)
 {
 	if (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain())
-		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
+		virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
 }
 
 #ifdef CONFIG_XEN_UNPOPULATED_ALLOC
-- 
2.35.3


