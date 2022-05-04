Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E697851A4C0
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 17:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320872.541855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHNH-0004KM-Ub; Wed, 04 May 2022 15:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320872.541855; Wed, 04 May 2022 15:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHNH-0004EZ-PE; Wed, 04 May 2022 15:57:11 +0000
Received: by outflank-mailman (input) for mailman id 320872;
 Wed, 04 May 2022 15:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQSl=VM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nmHNG-0003wP-72
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 15:57:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9ea31e3-cbc2-11ec-a406-831a346695d4;
 Wed, 04 May 2022 17:57:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 020191F74C;
 Wed,  4 May 2022 15:57:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 632F013AFD;
 Wed,  4 May 2022 15:57:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WNXUFlOicmLWPAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 04 May 2022 15:57:07 +0000
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
X-Inumbo-ID: d9ea31e3-cbc2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651679828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lMxpONprAdpQbV0uZskDbB1fEIP7YYHFmYdwzZhDVE=;
	b=FZxi5C4az6xiRDRt5zrq3DDmodZF2oavjNsJxai9hYEooOypl2qGaNwDnpiy9Tx+vC7rtJ
	6VsX/43rtog5GY2zI9yxWTXDz0XrgLb2dS1b5YOdmVOPtV5uJQwTW4VSx39BlUI2CPd3R6
	9okDcBlH2MvPKcdeiIkPEin/HR4d5xc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	x86@kernel.org,
	linux-s390@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH v3 2/2] virtio: replace arch_has_restricted_virtio_memory_access()
Date: Wed,  4 May 2022 17:57:03 +0200
Message-Id: <20220504155703.13336-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220504155703.13336-1-jgross@suse.com>
References: <20220504155703.13336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using arch_has_restricted_virtio_memory_access() together
with CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS, replace those
with platform_has() and a new platform feature
PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- move setting of PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS in SEV case
  to sev_setup_arch().
V3:
- remove Hyper-V chunk (Michael Kelley)
- remove include virtio_config.h from mem_encrypt.c (Oleksandr Tyshchenko)
- add comment for PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS (Oleksandr Tyshchenko)
---
 arch/s390/Kconfig                |  1 -
 arch/s390/mm/init.c              | 13 +++----------
 arch/x86/Kconfig                 |  1 -
 arch/x86/mm/mem_encrypt.c        |  7 -------
 arch/x86/mm/mem_encrypt_amd.c    |  4 ++++
 drivers/virtio/Kconfig           |  6 ------
 drivers/virtio/virtio.c          |  5 ++---
 include/linux/platform-feature.h |  6 +++++-
 include/linux/virtio_config.h    |  9 ---------
 9 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index e084c72104f8..f97a22ae69a8 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -772,7 +772,6 @@ menu "Virtualization"
 config PROTECTED_VIRTUALIZATION_GUEST
 	def_bool n
 	prompt "Protected virtualization guest support"
-	select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
 	help
 	  Select this option, if you want to be able to run this
 	  kernel as a protected virtualization KVM guest.
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index 86ffd0d51fd5..2c3b451813ed 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -31,6 +31,7 @@
 #include <linux/cma.h>
 #include <linux/gfp.h>
 #include <linux/dma-direct.h>
+#include <linux/platform-feature.h>
 #include <asm/processor.h>
 #include <linux/uaccess.h>
 #include <asm/pgalloc.h>
@@ -168,22 +169,14 @@ bool force_dma_unencrypted(struct device *dev)
 	return is_prot_virt_guest();
 }
 
-#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
-
-int arch_has_restricted_virtio_memory_access(void)
-{
-	return is_prot_virt_guest();
-}
-EXPORT_SYMBOL(arch_has_restricted_virtio_memory_access);
-
-#endif
-
 /* protected virtualization */
 static void pv_init(void)
 {
 	if (!is_prot_virt_guest())
 		return;
 
+	platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
+
 	/* make sure bounce buffers are shared */
 	swiotlb_force = SWIOTLB_FORCE;
 	swiotlb_init(1);
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4bed3abf444d..eeb7c6c8eec5 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1515,7 +1515,6 @@ config X86_CPA_STATISTICS
 config X86_MEM_ENCRYPT
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	select DYNAMIC_PHYSICAL_MASK
-	select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
 	def_bool n
 
 config AMD_MEM_ENCRYPT
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 50d209939c66..18a55a0f1ca2 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -12,7 +12,6 @@
 #include <linux/swiotlb.h>
 #include <linux/cc_platform.h>
 #include <linux/mem_encrypt.h>
-#include <linux/virtio_config.h>
 
 /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
 bool force_dma_unencrypted(struct device *dev)
@@ -76,9 +75,3 @@ void __init mem_encrypt_init(void)
 
 	print_mem_encrypt_feature_info();
 }
-
-int arch_has_restricted_virtio_memory_access(void)
-{
-	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
-}
-EXPORT_SYMBOL_GPL(arch_has_restricted_virtio_memory_access);
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 6169053c2854..39b71084d36b 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -21,6 +21,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/virtio_config.h>
 #include <linux/cc_platform.h>
+#include <linux/platform-feature.h>
 
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
@@ -206,6 +207,9 @@ void __init sev_setup_arch(void)
 	size = total_mem * 6 / 100;
 	size = clamp_val(size, IO_TLB_DEFAULT_SIZE, SZ_1G);
 	swiotlb_adjust_size(size);
+
+	/* Set restricted memory access for virtio. */
+	platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);
 }
 
 static unsigned long pg_level_to_pfn(int level, pte_t *kpte, pgprot_t *ret_prot)
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index b5adf6abd241..a6dc8b5846fe 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -6,12 +6,6 @@ config VIRTIO
 	  bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
 	  or CONFIG_S390_GUEST.
 
-config ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
-	bool
-	help
-	  This option is selected if the architecture may need to enforce
-	  VIRTIO_F_ACCESS_PLATFORM
-
 config VIRTIO_PCI_LIB
 	tristate
 	help
diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
index 22f15f444f75..371e16b18381 100644
--- a/drivers/virtio/virtio.c
+++ b/drivers/virtio/virtio.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/idr.h>
 #include <linux/of.h>
+#include <linux/platform-feature.h>
 #include <uapi/linux/virtio_ids.h>
 
 /* Unique numbering for virtio devices. */
@@ -170,12 +171,10 @@ EXPORT_SYMBOL_GPL(virtio_add_status);
 static int virtio_features_ok(struct virtio_device *dev)
 {
 	unsigned status;
-	int ret;
 
 	might_sleep();
 
-	ret = arch_has_restricted_virtio_memory_access();
-	if (ret) {
+	if (platform_has(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS)) {
 		if (!virtio_has_feature(dev, VIRTIO_F_VERSION_1)) {
 			dev_warn(&dev->dev,
 				 "device must provide VIRTIO_F_VERSION_1\n");
diff --git a/include/linux/platform-feature.h b/include/linux/platform-feature.h
index 6ed859928b97..b2f48be999fa 100644
--- a/include/linux/platform-feature.h
+++ b/include/linux/platform-feature.h
@@ -6,7 +6,11 @@
 #include <asm/platform-feature.h>
 
 /* The platform features are starting with the architecture specific ones. */
-#define PLATFORM_FEAT_N				(0 + PLATFORM_ARCH_FEAT_N)
+
+/* Used to enable platform specific DMA handling for virtio devices. */
+#define PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS	(0 + PLATFORM_ARCH_FEAT_N)
+
+#define PLATFORM_FEAT_N				(1 + PLATFORM_ARCH_FEAT_N)
 
 void platform_set(unsigned int feature);
 void platform_clear(unsigned int feature);
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index b341dd62aa4d..79498298519d 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -559,13 +559,4 @@ static inline void virtio_cwrite64(struct virtio_device *vdev,
 		_r;							\
 	})
 
-#ifdef CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
-int arch_has_restricted_virtio_memory_access(void);
-#else
-static inline int arch_has_restricted_virtio_memory_access(void)
-{
-	return 0;
-}
-#endif /* CONFIG_ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS */
-
 #endif /* _LINUX_VIRTIO_CONFIG_H */
-- 
2.35.3


