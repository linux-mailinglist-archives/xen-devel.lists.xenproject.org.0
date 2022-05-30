Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F9A53767A
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 10:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338358.563122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvajY-0004Qi-3Q; Mon, 30 May 2022 08:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338358.563122; Mon, 30 May 2022 08:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvajX-0004Oe-V4; Mon, 30 May 2022 08:26:39 +0000
Received: by outflank-mailman (input) for mailman id 338358;
 Mon, 30 May 2022 08:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e3+D=WG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nvajW-0004OI-F7
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 08:26:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38e6cf57-dff2-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 10:26:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9C0E1F9D1;
 Mon, 30 May 2022 08:26:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B59313AFD;
 Mon, 30 May 2022 08:26:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 41fwGLx/lGLgEgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 May 2022 08:26:36 +0000
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
X-Inumbo-ID: 38e6cf57-dff2-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1653899196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yB78K+idfIOhoquiDkc12+zxCwXF1N7eE1XHWyLJ5vM=;
	b=YJcm463Y7/cO9dzFQpkc+gUhjQ/W8Al+YEIl7aM4VSGo+yG7ynyRFwsOQogzGAAmZVrcW0
	fQlKwqd3mHwiL7MEmM2Qb5vC9q7etJjOCqT7fkUqy+r0ApyqxeRqszQCUChv2Sc+OA1vOg
	+OOdEVeHx0NVPIvbcjLE8cqsPm1ToRI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] xen: replace xen_remap() with memremap()
Date: Mon, 30 May 2022 10:26:34 +0200
Message-Id: <20220530082634.6339-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_remap() is used to establish mappings for frames not under direct
control of the kernel: for Xenstore and console ring pages, and for
grant pages of non-PV guests.

Today xen_remap() is defined to use ioremap() on x86 (doing uncached
mappings), and ioremap_cache() on Arm (doing cached mappings).

Uncached mappings for those use cases are bad for performance, so they
should be avoided if possible. As all use cases of xen_remap() don't
require uncached mappings (the mapped area is always physical RAM),
a mapping using the standard WB cache mode is fine.

As sparse is flagging some of the xen_remap() use cases to be not
appropriate for iomem(), as the result is not annotated with the
__iomem modifier, eliminate xen_remap() completely and replace all
use cases with memremap() specifying the MEMREMAP_WB caching mode.

xen_unmap() can be replaced with memunmap().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/page.h   | 3 ---
 drivers/tty/hvc/hvc_xen.c         | 2 +-
 drivers/xen/grant-table.c         | 6 +++---
 drivers/xen/xenbus/xenbus_probe.c | 8 ++++----
 include/xen/arm/page.h            | 3 ---
 5 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 1fc67df50014..fa9ec20783fa 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -347,9 +347,6 @@ unsigned long arbitrary_virt_to_mfn(void *vaddr);
 void make_lowmem_page_readonly(void *vaddr);
 void make_lowmem_page_readwrite(void *vaddr);
 
-#define xen_remap(cookie, size) ioremap((cookie), (size))
-#define xen_unmap(cookie) iounmap((cookie))
-
 static inline bool xen_arch_need_swiotlb(struct device *dev,
 					 phys_addr_t phys,
 					 dma_addr_t dev_addr)
diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index ebaf7500f48f..7c23112dc923 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -253,7 +253,7 @@ static int xen_hvm_console_init(void)
 	if (r < 0 || v == 0)
 		goto err;
 	gfn = v;
-	info->intf = xen_remap(gfn << XEN_PAGE_SHIFT, XEN_PAGE_SIZE);
+	info->intf = memremap(gfn << XEN_PAGE_SHIFT, XEN_PAGE_SIZE, MEMREMAP_WB);
 	if (info->intf == NULL)
 		goto err;
 	info->vtermno = HVC_COOKIE;
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 1a1aec0a88a1..2f4f0ed5d8f8 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -632,7 +632,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
 	if (xen_auto_xlat_grant_frames.count)
 		return -EINVAL;
 
-	vaddr = xen_remap(addr, XEN_PAGE_SIZE * max_nr_gframes);
+	vaddr = memremap(addr, XEN_PAGE_SIZE * max_nr_gframes, MEMREMAP_WB);
 	if (vaddr == NULL) {
 		pr_warn("Failed to ioremap gnttab share frames (addr=%pa)!\n",
 			&addr);
@@ -640,7 +640,7 @@ int gnttab_setup_auto_xlat_frames(phys_addr_t addr)
 	}
 	pfn = kcalloc(max_nr_gframes, sizeof(pfn[0]), GFP_KERNEL);
 	if (!pfn) {
-		xen_unmap(vaddr);
+		memunmap(vaddr);
 		return -ENOMEM;
 	}
 	for (i = 0; i < max_nr_gframes; i++)
@@ -659,7 +659,7 @@ void gnttab_free_auto_xlat_frames(void)
 	if (!xen_auto_xlat_grant_frames.count)
 		return;
 	kfree(xen_auto_xlat_grant_frames.pfn);
-	xen_unmap(xen_auto_xlat_grant_frames.vaddr);
+	memunmap(xen_auto_xlat_grant_frames.vaddr);
 
 	xen_auto_xlat_grant_frames.pfn = NULL;
 	xen_auto_xlat_grant_frames.count = 0;
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index d367f2bd2b93..58b732dcbfb8 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -752,8 +752,8 @@ static void xenbus_probe(void)
 	xenstored_ready = 1;
 
 	if (!xen_store_interface) {
-		xen_store_interface = xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
-						XEN_PAGE_SIZE);
+		xen_store_interface = memremap(xen_store_gfn << XEN_PAGE_SHIFT,
+					       XEN_PAGE_SIZE, MEMREMAP_WB);
 		/*
 		 * Now it is safe to free the IRQ used for xenstore late
 		 * initialization. No need to unbind: it is about to be
@@ -1009,8 +1009,8 @@ static int __init xenbus_init(void)
 #endif
 			xen_store_gfn = (unsigned long)v;
 			xen_store_interface =
-				xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
-					  XEN_PAGE_SIZE);
+				memremap(xen_store_gfn << XEN_PAGE_SHIFT,
+					 XEN_PAGE_SIZE, MEMREMAP_WB);
 			if (xen_store_interface->connection != XENSTORE_CONNECTED)
 				wait = true;
 		}
diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index 7e199c6656b9..e5c84ff28c8b 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -109,9 +109,6 @@ static inline bool set_phys_to_machine(unsigned long pfn, unsigned long mfn)
 	return __set_phys_to_machine(pfn, mfn);
 }
 
-#define xen_remap(cookie, size) ioremap_cache((cookie), (size))
-#define xen_unmap(cookie) iounmap((cookie))
-
 bool xen_arch_need_swiotlb(struct device *dev,
 			   phys_addr_t phys,
 			   dma_addr_t dev_addr);
-- 
2.35.3


