Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0194370A9
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 06:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214570.373368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdlsf-0006g6-1D; Fri, 22 Oct 2021 04:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214570.373368; Fri, 22 Oct 2021 04:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdlse-0006bg-Ot; Fri, 22 Oct 2021 04:10:08 +0000
Received: by outflank-mailman (input) for mailman id 214570;
 Thu, 21 Oct 2021 18:15:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IF2L=PJ=intel.com=lucas.demarchi@srs-us1.protection.inumbo.net>)
 id 1mdcbF-00047r-Kp
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 18:15:33 +0000
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ded26fba-329a-11ec-8389-12813bfff9fa;
 Thu, 21 Oct 2021 18:15:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:15:19 -0700
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
X-Inumbo-ID: ded26fba-329a-11ec-8389-12813bfff9fa
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252606742"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="252606742"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="527582106"
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/2] drm/i915/gem: stop using PAGE_KERNEL_IO
Date: Thu, 21 Oct 2021 11:15:10 -0700
Message-Id: <20211021181511.1533377-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021181511.1533377-1-lucas.demarchi@intel.com>
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PAGE_KERNEL_IO is only defined for x86 and nowadays is the same as
PAGE_KERNEL. It was different for some time, OR'ing a `_PAGE_IOMAP` flag
in commit be43d72835ba ("x86: add _PAGE_IOMAP pte flag for IO
mappings").  This got removed in commit f955371ca9d3 ("x86: remove the
Xen-specific _PAGE_IOMAP PTE flag"), so today they are just the same.

This is the same that was done in commit ac96b5566926 ("io-mapping.h:
s/PAGE_KERNEL_IO/PAGE_KERNEL/").

There is a subsequent commit with
'Fixes: ac96b5566926 ("io-mapping.h: s/PAGE_KERNEL_IO/PAGE_KERNEL/")' -
but that is not relevant here since is it's actually fixing the different
names for pgprot_writecombine(), which we also don't have today since
all archs expose pgprot_writecombine(). Microblaze, mentioned in that
discussion, gained pgprot_writecombine() in
commit 97ccedd793ac ("microblaze: Provide pgprot_device/writecombine
macros for nommu").

So, just use PAGE_KERNEL, and just use pgprot_writecombine().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20211020090625.1037517-1-lucas.demarchi@intel.com
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 8eb1c3a6fc9c..68fe1837ef54 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -289,7 +289,7 @@ static void *i915_gem_object_map_page(struct drm_i915_gem_object *obj,
 		pgprot = PAGE_KERNEL;
 		break;
 	case I915_MAP_WC:
-		pgprot = pgprot_writecombine(PAGE_KERNEL_IO);
+		pgprot = pgprot_writecombine(PAGE_KERNEL);
 		break;
 	}
 
@@ -333,7 +333,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
 	i = 0;
 	for_each_sgt_daddr(addr, iter, obj->mm.pages)
 		pfns[i++] = (iomap + addr) >> PAGE_SHIFT;
-	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL_IO));
+	vaddr = vmap_pfn(pfns, n_pfn, pgprot_writecombine(PAGE_KERNEL));
 	if (pfns != stack)
 		kvfree(pfns);
 
-- 
2.33.1


