Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F6E925C97
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 13:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752954.1161205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOy1L-0004lL-Sh; Wed, 03 Jul 2024 11:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752954.1161205; Wed, 03 Jul 2024 11:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOy1L-0004iA-Pj; Wed, 03 Jul 2024 11:19:31 +0000
Received: by outflank-mailman (input) for mailman id 752954;
 Wed, 03 Jul 2024 11:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xq3e=OD=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sOy1J-0004i4-Qd
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 11:19:29 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cc225af-392e-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 13:19:28 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f419so2368152a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 04:19:28 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08cf7csm501651566b.155.2024.07.03.04.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 04:19:27 -0700 (PDT)
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
X-Inumbo-ID: 1cc225af-392e-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1720005568; x=1720610368; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pP+GzuzwiUPFuVA4wabuMu0yHI34+ezkA5qv9mNcZfc=;
        b=lpho/iVyzVwndaxKphnwZjnFamQ2RCZjYc2elbZtVQqHleqY3zWuLAbn7sQ/BzwnUa
         vCRaH5HfkMcsEWiRuDp6DuegTcMfo4sDzJxIIlK8n0ZMGzIfN75jXfauTz5sS+m/ENuK
         YJc3fiWSP+KIkCARxGDCbEzRIdJeYjEkKArrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720005568; x=1720610368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP+GzuzwiUPFuVA4wabuMu0yHI34+ezkA5qv9mNcZfc=;
        b=IWxxZq5r/Pcgnk/FxsYAF7XjkjCtHi+48drGmgZeHi4IJbnxnuAZI8qoQ6nrjzrDUN
         75dpew5rDJ6QD+Esr8O0Gs1lbFcx3lLfPRVfQLqFWe3i8wMhdOfqLdky4CNQJfJxxPK2
         zIdx3okMlW98/Wo8cROQMP5ls4lRtfLqRI6E0JyMzYOAMu8bSwKeCPYndX9LfBQ1cwxJ
         CgTxwAQYa8qBPzfZPX2B3pcF6f09taP0DDokPD3D+eYQgH9WoLTwJk/fxIHGmLiOt7kt
         l7jVpk+S8gw5lZEaA2urpS3dHIcX4zQ3aV4wnS3/3lQ8WTpq9nuadbH3vvdH3NgAi7sr
         61UA==
X-Gm-Message-State: AOJu0YwvF0gVq0PyIQqwYx2nAxtGg+xtJl+B/Fog20ptv7Ini4xBGEO1
	2RaAFeuWh2fWigkSRCAvBEBQeg1FcJR0iN+aH/dXdvZ9t5y80SEMBhI+R/rHMalwHRPDPvlOxKN
	olyA=
X-Google-Smtp-Source: AGHT+IHjdpnXQmKNDKCj+3CegtCwTs2s51KNawg8qs47brVRkxkOtOmo0SzUxSkAtndGjQh1i7CSlw==
X-Received: by 2002:a17:906:3ac2:b0:a72:b26c:7792 with SMTP id a640c23a62f3a-a751445f854mr661760066b.69.1720005567604;
        Wed, 03 Jul 2024 04:19:27 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v2] xen/vmap: Document the vmap header
Date: Wed,  3 Jul 2024 12:19:17 +0100
Message-Id: <f8bcfe757b45ce59e1a1203c2675a4266cc15f20.1720005327.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In it's current form it's rather cryptic for uninitiated, so this patch
documents everything in there to make it more palatable.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Removed Doxygen-style markers on comments.
  * Added some missing documentations for the return types of __vmap().
  * s/range of ranges/set of ranges/ in __vmap()
  * Removed rationale from vmap_contig()
  * Fixed "arrray" typo.
  * Moved misplaced comment to vfree()
---
 xen/include/xen/vmap.h | 101 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 0c16baa85f31..1864e1ccfe82 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,34 +1,132 @@
+/*
+ * Interface to map physical memory onto contiguous virtual memory areas.
+ *
+ * Two ranges of linear address space are reserved for this purpose: A general
+ * purpose area (VMAP_DEFAULT) and a livepatch-specific area (VMAP_XEN). The
+ * latter is used when loading livepatches and the former for everything else.
+ */
 #if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
 #define __XEN_VMAP_H__
 
 #include <xen/mm-frame.h>
 #include <xen/page-size.h>
 
+/* Identifiers for the linear ranges tracked by vmap */
 enum vmap_region {
+    /*
+     * Region used for general purpose RW mappings. Mapping/allocating memory
+     * here can induce extra allocations for the supporting page tables.
+     */
     VMAP_DEFAULT,
+    /*
+     * Region used for loading livepatches. Can't use VMAP_DEFAULT because it
+     * must live close to the running Xen image. The caller also ensures all
+     * page tables are already in place with adequate PTE flags.
+     */
     VMAP_XEN,
+    /* Sentinel value for bounds checking */
     VMAP_REGION_NR,
 };
 
+/*
+ * Runtime initialiser for each vmap region type
+ *
+ * Must only be called once per vmap region type.
+ *
+ * @param type  Designation of the region to initialise.
+ * @param start Start address of the `type` region.
+ * @param end   End address (not inclusive) of the `type` region
+ */
 void vm_init_type(enum vmap_region type, void *start, void *end);
 
+/*
+ * Maps a set of physical ranges onto a single virtual range
+ *
+ * `mfn` is an array of `nr` physical ranges, each of which is `granularity`
+ * pages wide. `type` defines which vmap region to use for the mapping and
+ * `flags` is the PTE flags the page table leaves are meant to have.
+ *
+ * Typically used via the vmap() and vmap_contig() helpers.
+ *
+ * @param mfn          Array of mfns
+ * @param granularity  Number of contiguous pages each mfn represents
+ * @param nr           Number of mfns in the `mfn` array
+ * @param align        Alignment of the virtual area to map
+ * @param flags        PTE flags for the leaves of the PT tree.
+ * @param type         Which region to create the mappings on
+ * @return Pointer to the mapped area on success; NULL otherwise.
+ */
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
              unsigned int align, unsigned int flags, enum vmap_region type);
+
+/*
+ * Map an array of pages contiguously into the VMAP_DEFAULT vmap region
+ *
+ * @param[in] mfn Pointer to the base of an array of mfns
+ * @param[in] nr  Number of mfns in the array
+ * @return Pointer to the mapped area on success; NULL otherwise.
+ */
 void *vmap(const mfn_t *mfn, unsigned int nr);
+
+/*
+ * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
+ *
+ * @param mfn Base mfn of the physical region
+ * @param nr  Number of mfns in the physical region
+ * @return Pointer to the mapped area on success; NULL otherwise.
+ */
 void *vmap_contig(mfn_t mfn, unsigned int nr);
+
+/*
+ * Unmaps a range of virtually contiguous memory from one of the vmap regions
+ *
+ * The system remembers internally how wide the mapping is and unmaps it all.
+ * It also can determine the vmap region type from the `va`.
+ *
+ * @param va Virtual base address of the range to unmap
+ */
 void vunmap(const void *va);
 
+/*
+ * Allocate `size` octets of possibly non-contiguous physical memory and map
+ * them contiguously in the VMAP_DEFAULT vmap region
+ *
+ * @param size Pointer to the base of an array of mfns
+ * @return Pointer to the mapped area on success; NULL otherwise.
+ */
 void *vmalloc(size_t size);
+
+/* Same as vmalloc(), but for the VMAP_XEN vmap region. */
 void *vmalloc_xen(size_t size);
 
+/* Same as vmalloc(), but set the contents to zero before returning */
 void *vzalloc(size_t size);
+
+/*
+ * Unmap and free memory from vmalloc(), vmalloc_xen() or vzalloc()
+ *
+ * The system remembers internally how wide the mapping is and unmaps it all.
+ *
+ * @param va Virtual base address of the range to free and unmap
+ */
 void vfree(void *va);
 
+/*
+ * Analogous to vmap_contig(), but for IO memory
+ *
+ * Unlike vmap_contig(), it ensures architecturally correct cacheability
+ * settings are set for the mapped IO memory.
+ *
+ * @param pa  Physical base address of the MMIO region.
+ * @param len Length of the MMIO region in octets.
+ * @return Pointer to the mapped area on success; NULL otherwise.
+ */
 void __iomem *ioremap(paddr_t pa, size_t len);
 
 /* Return the number of pages in the mapping starting at address 'va' */
 unsigned int vmap_size(const void *va);
 
+/* Analogous to vunmap(), but for IO memory mapped via ioremap() */
 static inline void iounmap(void __iomem *va)
 {
     unsigned long addr = (unsigned long)(void __force *)va;
@@ -36,7 +134,10 @@ static inline void iounmap(void __iomem *va)
     vunmap((void *)(addr & PAGE_MASK));
 }
 
+/* Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
 void *arch_vmap_virt_end(void);
+
+/* Initialises the VMAP_DEFAULT virtual range */
 static inline void vm_init(void)
 {
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
-- 
2.34.1


