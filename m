Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F16518557
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 15:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319641.539947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsTl-000748-Vx; Tue, 03 May 2022 13:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319641.539947; Tue, 03 May 2022 13:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsTl-00070s-RT; Tue, 03 May 2022 13:22:13 +0000
Received: by outflank-mailman (input) for mailman id 319641;
 Tue, 03 May 2022 13:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nlsTk-0006lA-BJ
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 13:22:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a0e3f69-cae4-11ec-a406-831a346695d4;
 Tue, 03 May 2022 15:22:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0C3B1F749;
 Tue,  3 May 2022 13:22:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6806513ABE;
 Tue,  3 May 2022 13:22:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iNYLGIIscWIASAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 03 May 2022 13:22:10 +0000
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
X-Inumbo-ID: 0a0e3f69-cae4-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651584131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpkV8V5Y+6Vb55bRfQcavzTocu4t1BaNWLiM7KsOY1Y=;
	b=ubKL3UxTpmVXRWOdBpBxP1Blc7iCSFjpprMuVtEqjUkNxvt5KgAL1kIcTNjkGyUG/j5v7g
	eP8pHFW6Rm0suxVOYcYDsv/lL+qGJmUY9KnmCMOK0w391MnS/4uG7jTU1+tHyDmy49tmTD
	f4U0Tn/Uxnm7o0c9V2tpCWb8OLMoFfk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jbeulich@suse.com,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] x86/pat: add functions to query specific cache mode availability
Date: Tue,  3 May 2022 15:22:07 +0200
Message-Id: <20220503132207.17234-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220503132207.17234-1-jgross@suse.com>
References: <20220503132207.17234-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some drivers are using pat_enabled() in order to test availability of
special caching modes (WC and UC-). This will lead to false negatives
in case the system was booted e.g. with the "nopat" variant and the
BIOS did setup the PAT MSR supporting the queried mode, or if the
system is running as a Xen PV guest.

Add test functions for those caching modes instead and use them at the
appropriate places.

For symmetry reasons export the already existing x86_has_pat_wp() for
modules, too.

Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with pat_enabled()")
Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/memtype.h           |  2 ++
 arch/x86/include/asm/pci.h               |  2 +-
 arch/x86/mm/init.c                       | 25 +++++++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c |  8 ++++----
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/memtype.h b/arch/x86/include/asm/memtype.h
index 9ca760e430b9..d00e0be854d4 100644
--- a/arch/x86/include/asm/memtype.h
+++ b/arch/x86/include/asm/memtype.h
@@ -25,6 +25,8 @@ extern void memtype_free_io(resource_size_t start, resource_size_t end);
 extern bool pat_pfn_immune_to_uc_mtrr(unsigned long pfn);
 
 bool x86_has_pat_wp(void);
+bool x86_has_pat_wc(void);
+bool x86_has_pat_uc_minus(void);
 enum page_cache_mode pgprot2cachemode(pgprot_t pgprot);
 
 #endif /* _ASM_X86_MEMTYPE_H */
diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
index f3fd5928bcbb..a5742268dec1 100644
--- a/arch/x86/include/asm/pci.h
+++ b/arch/x86/include/asm/pci.h
@@ -94,7 +94,7 @@ int pcibios_set_irq_routing(struct pci_dev *dev, int pin, int irq);
 
 
 #define HAVE_PCI_MMAP
-#define arch_can_pci_mmap_wc()	pat_enabled()
+#define arch_can_pci_mmap_wc()	x86_has_pat_wc()
 #define ARCH_GENERIC_PCI_MMAP_RESOURCE
 
 #ifdef CONFIG_PCI
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 71e182ebced3..b6431f714dc2 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -77,12 +77,31 @@ static uint8_t __pte2cachemode_tbl[8] = {
 	[__pte2cm_idx(_PAGE_PWT | _PAGE_PCD | _PAGE_PAT)] = _PAGE_CACHE_MODE_UC,
 };
 
-/* Check that the write-protect PAT entry is set for write-protect */
+static bool x86_has_pat_mode(unsigned int mode)
+{
+	return __pte2cachemode_tbl[__cachemode2pte_tbl[mode]] == mode;
+}
+
+/* Check that PAT supports write-protect */
 bool x86_has_pat_wp(void)
 {
-	return __pte2cachemode_tbl[__cachemode2pte_tbl[_PAGE_CACHE_MODE_WP]] ==
-	       _PAGE_CACHE_MODE_WP;
+	return x86_has_pat_mode(_PAGE_CACHE_MODE_WP);
+}
+EXPORT_SYMBOL_GPL(x86_has_pat_wp);
+
+/* Check that PAT supports WC */
+bool x86_has_pat_wc(void)
+{
+	return x86_has_pat_mode(_PAGE_CACHE_MODE_WC);
+}
+EXPORT_SYMBOL_GPL(x86_has_pat_wc);
+
+/* Check that PAT supports UC- */
+bool x86_has_pat_uc_minus(void)
+{
+	return x86_has_pat_mode(_PAGE_CACHE_MODE_UC_MINUS);
 }
+EXPORT_SYMBOL_GPL(x86_has_pat_uc_minus);
 
 enum page_cache_mode pgprot2cachemode(pgprot_t pgprot)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 0c5c43852e24..f43ecf3f63eb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -76,7 +76,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & ~(I915_MMAP_WC))
 		return -EINVAL;
 
-	if (args->flags & I915_MMAP_WC && !pat_enabled())
+	if (args->flags & I915_MMAP_WC && !x86_has_pat_wc())
 		return -ENODEV;
 
 	obj = i915_gem_object_lookup(file, args->handle);
@@ -757,7 +757,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
 
 	if (HAS_LMEM(to_i915(dev)))
 		mmap_type = I915_MMAP_TYPE_FIXED;
-	else if (pat_enabled())
+	else if (x86_has_pat_wc())
 		mmap_type = I915_MMAP_TYPE_WC;
 	else if (!i915_ggtt_has_aperture(to_gt(i915)->ggtt))
 		return -ENODEV;
@@ -813,7 +813,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 		break;
 
 	case I915_MMAP_OFFSET_WC:
-		if (!pat_enabled())
+		if (!x86_has_pat_wc())
 			return -ENODEV;
 		type = I915_MMAP_TYPE_WC;
 		break;
@@ -823,7 +823,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 		break;
 
 	case I915_MMAP_OFFSET_UC:
-		if (!pat_enabled())
+		if (!x86_has_pat_uc_minus())
 			return -ENODEV;
 		type = I915_MMAP_TYPE_UC;
 		break;
-- 
2.35.3


