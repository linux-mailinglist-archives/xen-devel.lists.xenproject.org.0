Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0C4B36C77
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094721.1449987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv62-0006Ad-TB; Tue, 26 Aug 2025 14:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094721.1449987; Tue, 26 Aug 2025 14:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqv62-00068A-Pu; Tue, 26 Aug 2025 14:56:26 +0000
Received: by outflank-mailman (input) for mailman id 1094721;
 Tue, 26 Aug 2025 14:56:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uqv60-0005bn-PD
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:56:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4e22372-828c-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:56:22 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 702692124E;
 Tue, 26 Aug 2025 14:56:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1279713A31;
 Tue, 26 Aug 2025 14:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /ckVAxbLrWi7TwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 26 Aug 2025 14:56:22 +0000
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
X-Inumbo-ID: d4e22372-828c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756220182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fgDiJNNiVNaf0p3L3IvjAfpp4z8UuSZA2jh8FWFcSN0=;
	b=qGAEL2F2BM1z21iYQ7eFD6W4myMjqmCXairXJ3Fj9HEmZrz9iLZkcGs/NUgV2ykp4nvnn7
	Whzu+U+xkPL2ocWiXUf6xrBAbjp3GvXWbjI1pFERnmx24bEUGaN+Hst3Gn4d2XnKksaMte
	a/RW1sHpnMY8fQH6607HTh42FMFyh6g=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756220182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fgDiJNNiVNaf0p3L3IvjAfpp4z8UuSZA2jh8FWFcSN0=;
	b=qGAEL2F2BM1z21iYQ7eFD6W4myMjqmCXairXJ3Fj9HEmZrz9iLZkcGs/NUgV2ykp4nvnn7
	Whzu+U+xkPL2ocWiXUf6xrBAbjp3GvXWbjI1pFERnmx24bEUGaN+Hst3Gn4d2XnKksaMte
	a/RW1sHpnMY8fQH6607HTh42FMFyh6g=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] xen: replace XENFEAT_auto_translated_physmap with xen_pv_domain()
Date: Tue, 26 Aug 2025 16:56:07 +0200
Message-ID: <20250826145608.10352-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826145608.10352-1-jgross@suse.com>
References: <20250826145608.10352-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -6.80

Instead of testing the XENFEAT_auto_translated_physmap feature, just
use !xen_pv_domain() which is equivalent.

This has the advantage that a kernel not built with CONFIG_XEN_PV
will be smaller due to dead code elimination.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/xen/page.h    | 14 +++++++-------
 arch/x86/xen/mmu.c                 |  2 +-
 arch/x86/xen/p2m.c                 |  4 ++--
 drivers/xen/balloon.c              |  4 ++--
 drivers/xen/gntdev.c               |  2 +-
 drivers/xen/grant-table.c          |  6 +++---
 drivers/xen/privcmd.c              | 14 ++++++--------
 drivers/xen/unpopulated-alloc.c    |  4 ++--
 drivers/xen/xenbus/xenbus_client.c |  2 +-
 include/xen/grant_table.h          |  4 ++--
 include/xen/mem-reservation.h      |  4 ++--
 include/xen/xen-ops.h              |  7 ++++---
 12 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 85e63d58c074..59f642a94b9d 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -12,9 +12,9 @@
 #include <asm/extable.h>
 #include <asm/page.h>
 
+#include <xen/xen.h>
 #include <xen/interface/xen.h>
 #include <xen/interface/grant_table.h>
-#include <xen/features.h>
 
 /* Xen machine address */
 typedef struct xmaddr {
@@ -162,7 +162,7 @@ static inline unsigned long pfn_to_mfn(unsigned long pfn)
 	 * pfn_to_mfn. This will have to be removed when we figured
 	 * out which call.
 	 */
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return pfn;
 
 	mfn = __pfn_to_mfn(pfn);
@@ -175,7 +175,7 @@ static inline unsigned long pfn_to_mfn(unsigned long pfn)
 
 static inline int phys_to_machine_mapping_valid(unsigned long pfn)
 {
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return 1;
 
 	return __pfn_to_mfn(pfn) != INVALID_P2M_ENTRY;
@@ -210,7 +210,7 @@ static inline unsigned long mfn_to_pfn(unsigned long mfn)
 	 * gfn_to_pfn. This will have to be removed when we figure
 	 * out which call.
 	 */
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return mfn;
 
 	pfn = mfn_to_pfn_no_overrides(mfn);
@@ -242,7 +242,7 @@ static inline xpaddr_t machine_to_phys(xmaddr_t machine)
 /* Pseudo-physical <-> Guest conversion */
 static inline unsigned long pfn_to_gfn(unsigned long pfn)
 {
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return pfn;
 	else
 		return pfn_to_mfn(pfn);
@@ -250,7 +250,7 @@ static inline unsigned long pfn_to_gfn(unsigned long pfn)
 
 static inline unsigned long gfn_to_pfn(unsigned long gfn)
 {
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return gfn;
 	else
 		return mfn_to_pfn(gfn);
@@ -284,7 +284,7 @@ static inline unsigned long bfn_to_local_pfn(unsigned long mfn)
 {
 	unsigned long pfn;
 
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return mfn;
 
 	pfn = mfn_to_pfn(mfn);
diff --git a/arch/x86/xen/mmu.c b/arch/x86/xen/mmu.c
index c4c479373249..3be45bf4bc79 100644
--- a/arch/x86/xen/mmu.c
+++ b/arch/x86/xen/mmu.c
@@ -41,7 +41,7 @@ EXPORT_SYMBOL_GPL(arbitrary_virt_to_machine);
 int xen_unmap_domain_gfn_range(struct vm_area_struct *vma,
 			       int nr, struct page **pages)
 {
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return xen_xlate_unmap_gfn_range(vma, nr, pages);
 
 	if (!pages)
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index 56914e21e303..2dd12b61a230 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -686,7 +686,7 @@ int set_foreign_p2m_mapping(struct gnttab_map_grant_ref *map_ops,
 	int i, ret = 0;
 	pte_t *pte;
 
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return 0;
 
 	if (kmap_ops) {
@@ -769,7 +769,7 @@ int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
 {
 	int i, ret = 0;
 
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return 0;
 
 	for (i = 0; i < count; i++) {
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 2de37dcd7556..49c3f9926394 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -302,7 +302,7 @@ static enum bp_state reserve_additional_memory(void)
          * are not restored since this region is now known not to
          * conflict with any devices.
          */ 
-	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
+	if (xen_pv_domain()) {
 		unsigned long pfn, i;
 
 		pfn = PFN_DOWN(resource->start);
@@ -626,7 +626,7 @@ int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages)
 			 */
 			BUILD_BUG_ON(XEN_PAGE_SIZE != PAGE_SIZE);
 
-			if (!xen_feature(XENFEAT_auto_translated_physmap)) {
+			if (xen_pv_domain()) {
 				ret = xen_alloc_p2m_entry(page_to_pfn(page));
 				if (ret < 0)
 					goto out_undo;
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 1f2160765618..74491967f2ae 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -1183,7 +1183,7 @@ static int __init gntdev_init(void)
 	if (!xen_domain())
 		return -ENODEV;
 
-	use_ptemod = !xen_feature(XENFEAT_auto_translated_physmap);
+	use_ptemod = xen_pv_domain();
 
 	err = misc_register(&gntdev_miscdev);
 	if (err != 0) {
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 04a6b470b15d..478d2ad725ac 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1449,7 +1449,7 @@ static int gnttab_map(unsigned int start_idx, unsigned int end_idx)
 	unsigned int nr_gframes = end_idx + 1;
 	int rc;
 
-	if (xen_feature(XENFEAT_auto_translated_physmap)) {
+	if (!xen_pv_domain()) {
 		struct xen_add_to_physmap xatp;
 		unsigned int i = end_idx;
 		rc = 0;
@@ -1570,7 +1570,7 @@ static int gnttab_setup(void)
 	if (max_nr_gframes < nr_grant_frames)
 		return -ENOSYS;
 
-	if (xen_feature(XENFEAT_auto_translated_physmap) && gnttab_shared.addr == NULL) {
+	if (!xen_pv_domain() && gnttab_shared.addr == NULL) {
 		gnttab_shared.addr = xen_auto_xlat_grant_frames.vaddr;
 		if (gnttab_shared.addr == NULL) {
 			pr_warn("gnttab share frames is not mapped!\n");
@@ -1588,7 +1588,7 @@ int gnttab_resume(void)
 
 int gnttab_suspend(void)
 {
-	if (!xen_feature(XENFEAT_auto_translated_physmap))
+	if (xen_pv_domain())
 		gnttab_interface->unmap_frames();
 	return 0;
 }
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 13a10f3294a8..f52a457b302d 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -271,7 +271,7 @@ static long privcmd_ioctl_mmap(struct file *file, void __user *udata)
 	struct mmap_gfn_state state;
 
 	/* We only support privcmd_ioctl_mmap_batch for non-auto-translated. */
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return -ENOSYS;
 
 	if (copy_from_user(&mmapcmd, udata, sizeof(mmapcmd)))
@@ -353,7 +353,7 @@ static int mmap_batch_fn(void *data, int nr, void *state)
 	struct page **cur_pages = NULL;
 	int ret;
 
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		cur_pages = &pages[st->index];
 
 	BUG_ON(nr < 0);
@@ -535,7 +535,7 @@ static long privcmd_ioctl_mmap_batch(
 			ret = -EINVAL;
 			goto out_unlock;
 		}
-		if (xen_feature(XENFEAT_auto_translated_physmap)) {
+		if (!xen_pv_domain()) {
 			ret = alloc_empty_pages(vma, nr_pages);
 			if (ret < 0)
 				goto out_unlock;
@@ -779,8 +779,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 		goto out;
 	}
 
-	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) &&
-	    xen_feature(XENFEAT_auto_translated_physmap)) {
+	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) && !xen_pv_domain()) {
 		unsigned int nr = DIV_ROUND_UP(kdata.num, XEN_PFN_PER_PAGE);
 		struct page **pages;
 		unsigned int i;
@@ -811,8 +810,7 @@ static long privcmd_ioctl_mmap_resource(struct file *file,
 	if (rc)
 		goto out;
 
-	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) &&
-	    xen_feature(XENFEAT_auto_translated_physmap)) {
+	if (IS_ENABLED(CONFIG_XEN_AUTO_XLATE) && !xen_pv_domain()) {
 		rc = xen_remap_vma_range(vma, kdata.addr, kdata.num << PAGE_SHIFT);
 	} else {
 		unsigned int domid =
@@ -1591,7 +1589,7 @@ static void privcmd_close(struct vm_area_struct *vma)
 	int numgfns = (vma->vm_end - vma->vm_start) >> XEN_PAGE_SHIFT;
 	int rc;
 
-	if (!xen_feature(XENFEAT_auto_translated_physmap) || !numpgs || !pages)
+	if (xen_pv_domain() || !numpgs || !pages)
 		return;
 
 	rc = xen_unmap_domain_gfn_range(vma, numgfns, pages);
diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
index a39f2d36dd9c..d6fc2aefe264 100644
--- a/drivers/xen/unpopulated-alloc.c
+++ b/drivers/xen/unpopulated-alloc.c
@@ -105,7 +105,7 @@ static int fill_list(unsigned int nr_pages)
          * are not restored since this region is now known not to
          * conflict with any devices.
          */
-	if (!xen_feature(XENFEAT_auto_translated_physmap)) {
+	if (xen_pv_domain()) {
 		xen_pfn_t pfn = PFN_DOWN(res->start);
 
 		for (i = 0; i < alloc_pages; i++) {
@@ -184,7 +184,7 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
 		pages[i] = pg;
 
 #ifdef CONFIG_XEN_HAVE_PVMMU
-		if (!xen_feature(XENFEAT_auto_translated_physmap)) {
+		if (xen_pv_domain()) {
 			ret = xen_alloc_p2m_entry(page_to_pfn(pg));
 			if (ret < 0) {
 				unsigned int j;
diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index e73ec225d4a6..2dc874fb5506 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -955,7 +955,7 @@ static const struct xenbus_ring_ops ring_ops_hvm = {
 void __init xenbus_ring_ops_init(void)
 {
 #ifdef CONFIG_XEN_PV
-	if (!xen_feature(XENFEAT_auto_translated_physmap))
+	if (xen_pv_domain())
 		ring_ops = &ring_ops_pv;
 	else
 #endif
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index e279be353e3f..69ac6d80a006 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -164,7 +164,7 @@ gnttab_set_map_op(struct gnttab_map_grant_ref *map, phys_addr_t addr,
 {
 	if (flags & GNTMAP_contains_pte)
 		map->host_addr = addr;
-	else if (xen_feature(XENFEAT_auto_translated_physmap))
+	else if (!xen_pv_domain())
 		map->host_addr = __pa(addr);
 	else
 		map->host_addr = addr;
@@ -181,7 +181,7 @@ gnttab_set_unmap_op(struct gnttab_unmap_grant_ref *unmap, phys_addr_t addr,
 {
 	if (flags & GNTMAP_contains_pte)
 		unmap->host_addr = addr;
-	else if (xen_feature(XENFEAT_auto_translated_physmap))
+	else if (!xen_pv_domain())
 		unmap->host_addr = __pa(addr);
 	else
 		unmap->host_addr = addr;
diff --git a/include/xen/mem-reservation.h b/include/xen/mem-reservation.h
index a2ab516fcd2c..3cbe3df0dfd4 100644
--- a/include/xen/mem-reservation.h
+++ b/include/xen/mem-reservation.h
@@ -39,7 +39,7 @@ static inline void xenmem_reservation_va_mapping_update(unsigned long count,
 							xen_pfn_t *frames)
 {
 #ifdef CONFIG_XEN_HAVE_PVMMU
-	if (!xen_feature(XENFEAT_auto_translated_physmap))
+	if (xen_pv_domain())
 		__xenmem_reservation_va_mapping_update(count, pages, frames);
 #endif
 }
@@ -48,7 +48,7 @@ static inline void xenmem_reservation_va_mapping_reset(unsigned long count,
 						       struct page **pages)
 {
 #ifdef CONFIG_XEN_HAVE_PVMMU
-	if (!xen_feature(XENFEAT_auto_translated_physmap))
+	if (xen_pv_domain())
 		__xenmem_reservation_va_mapping_reset(count, pages);
 #endif
 }
diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
index 9e2a769b0d96..496e6013c689 100644
--- a/include/xen/xen-ops.h
+++ b/include/xen/xen-ops.h
@@ -6,6 +6,7 @@
 #include <linux/notifier.h>
 #include <linux/efi.h>
 #include <linux/virtio_anchor.h>
+#include <xen/xen.h>
 #include <xen/features.h>
 #include <asm/xen/interface.h>
 #include <xen/interface/vcpu.h>
@@ -116,7 +117,7 @@ static inline int xen_remap_domain_gfn_array(struct vm_area_struct *vma,
 					     unsigned int domid,
 					     struct page **pages)
 {
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return xen_xlate_remap_gfn_array(vma, addr, gfn, nr, err_ptr,
 						 prot, domid, pages);
 
@@ -150,7 +151,7 @@ static inline int xen_remap_domain_mfn_array(struct vm_area_struct *vma,
 					     int nr, int *err_ptr,
 					     pgprot_t prot, unsigned int domid)
 {
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return -EOPNOTSUPP;
 
 	return xen_remap_pfn(vma, addr, mfn, nr, err_ptr, prot, domid,
@@ -175,7 +176,7 @@ static inline int xen_remap_domain_gfn_range(struct vm_area_struct *vma,
 					     pgprot_t prot, unsigned int domid,
 					     struct page **pages)
 {
-	if (xen_feature(XENFEAT_auto_translated_physmap))
+	if (!xen_pv_domain())
 		return -EOPNOTSUPP;
 
 	return xen_remap_pfn(vma, addr, &gfn, nr, NULL, prot, domid, false);
-- 
2.43.0


