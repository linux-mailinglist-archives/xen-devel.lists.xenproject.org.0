Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5B923E60
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 15:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752445.1160661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOdAm-00080C-5T; Tue, 02 Jul 2024 13:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752445.1160661; Tue, 02 Jul 2024 13:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOdAm-0007yH-1m; Tue, 02 Jul 2024 13:03:52 +0000
Received: by outflank-mailman (input) for mailman id 752445;
 Tue, 02 Jul 2024 13:03:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQ9e=OC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sOdAk-0007y8-KQ
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 13:03:50 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83ea7ab1-3873-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 15:03:45 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6cb130027aso239027266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 06:03:45 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm5625496a12.34.2024.07.02.06.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 06:03:44 -0700 (PDT)
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
X-Inumbo-ID: 83ea7ab1-3873-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719925425; x=1720530225; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4AWlEyGxZfZi6Jz3s6/CNY+kNFhjrm2ODyfXc/oCv00=;
        b=TXoCRbPXMOsTFDGvnicmV0/YHAnZEduBJM+XVTP5BZMvUKx7m4EpLuRVXxHlLSvEjp
         5aP9YDtM8QaWvRfHhHhhT46FldEpIYiKyf/QkPKcx/f4sMKH7ROUwBTSCJ+Mwio5zF2Q
         xVLbGTdOE2elA7gKZlWCIsYZS2hbxA6LOuDLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719925425; x=1720530225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AWlEyGxZfZi6Jz3s6/CNY+kNFhjrm2ODyfXc/oCv00=;
        b=Dc2yFLWIp095Q1uSVVlHLW1+4xNo7dWtcfUCoXYd8LRzcpvfz6LTl8hcNTIW8lImtV
         /X+FOaEnzqJQYAH/gWX8VAFlOuy654z5ToyS8KwlAF5gDhVPO38t0uMoY/oEtWqDqCPK
         jhBrqa+Qp2cYL62CDInLe/QwXs8n1Frs76VXx1sSLpAZWD4y1Mx/D8fIFt15FtPQvjqW
         4HdOZ3YbCBi5APq2Lt+FpABjuFeBtp3GB4mwBzcP7XAMx4/+/7iBhr6s4Tqz+wTOS4gZ
         SFntK8m0mL+J+BwxcDOJTHVnIMfs2/EOPOZW+Mpjo6wWAWws8h8nP3zVCAhXpUSzIwu/
         qNmw==
X-Gm-Message-State: AOJu0YxI8rR/eZTJ/cTdDZi1AQIXpmNDZ1XSvc1tUzEkCXHYStSlDWKA
	Dc78UDK6y7zzC/8KbweDA4OcHQt9dd4/Phdo/ZNeTI6ks7jv+2OxhaKZQTgzk6yMuEaXRG42CMm
	bEBI=
X-Google-Smtp-Source: AGHT+IFYmeDf73XTYBvQYwinSpcD/DBSCP968BB9mVJ9rqU6Sau7jS9gkjGPHpDcZ0MY+1Y8mqGeQA==
X-Received: by 2002:a05:6402:84b:b0:57c:5f77:1136 with SMTP id 4fb4d7f45d1cf-5879f69b7bemr7532495a12.24.1719925424763;
        Tue, 02 Jul 2024 06:03:44 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.19?] xen/vmap: Document the vmap header
Date: Tue,  2 Jul 2024 14:03:41 +0100
Message-Id: <b19a5ca7abd27bd4f31a0d87573687297dd7df58.1719849287.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In it's current form it's rather cryptic for uninitiated, so this patch
documents everything in there to make it more palatable.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/include/xen/vmap.h | 100 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
index 0c16baa85f31..2ab8030d6d00 100644
--- a/xen/include/xen/vmap.h
+++ b/xen/include/xen/vmap.h
@@ -1,34 +1,131 @@
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
 
+/** Identifiers for the linear ranges tracked by vmap */
 enum vmap_region {
+    /*
+     * Region used for general purpose RW mappings. Mapping/allocating memory
+     * here can induce extra allocations for the supporting page tables.
+     */
     VMAP_DEFAULT,
+    /**
+     * Region used for loading livepatches. Can't use VMAP_DEFAULT because it
+     * must live close to the running Xen image. The caller also ensures all
+     * page tables are already in place with adequate PTE flags.
+     */
     VMAP_XEN,
+    /** Sentinel value for bounds checking */
     VMAP_REGION_NR,
 };
 
+/**
+ * Runtime initialiser for each vmap region type
+ *
+ * Must only be called once per vmap region type.
+ *
+ * @param type  Designation of the region to initialise.
+ * @param start Start address of the `type` region.
+ * @param end   End address (not inclusive) of the `type` region
+ */
 void vm_init_type(enum vmap_region type, void *start, void *end);
 
+/**
+ * Maps a range of physical ranges onto a single virtual range
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
+ */
 void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
              unsigned int align, unsigned int flags, enum vmap_region type);
+
+/**
+ * Map an arrray of pages contiguously into the VMAP_DEFAULT vmap region
+ *
+ * @param[in] mfn Pointer to the base of an array of mfns
+ * @param[in] nr  Number of mfns in the array
+ */
 void *vmap(const mfn_t *mfn, unsigned int nr);
+
+/**
+ * Maps physically contiguous pages onto the VMAP_DEFAULT vmap region
+ *
+ * Used when the directmap is unavailable (i.e: due to secret hiding)
+ *
+ * @param mfn Base mfn of the physical region
+ * @param nr  Number of mfns in the physical region
+ */
 void *vmap_contig(mfn_t mfn, unsigned int nr);
+
+/**
+ * Unmaps a range of virtually contiguous memory from one of the vmap regions
+ *
+ * The system remembers internally how wide the mapping is and unmaps it all.
+ * It also can determine the vmap region type from the `va`.
+ *
+ * @param va Virtual base address of the range to unmap
+ */
 void vunmap(const void *va);
 
+/**
+ * Allocate `size` octets of possibly non-contiguous physical memory and map
+ * them contiguously in the VMAP_DEFAULT vmap region
+ *
+ * The system remembers internally how wide the mapping is and unmaps it all.
+ *
+ * @param size Pointer to the base of an array of mfns
+ * @return Pointer to the mapped area on success; NULL otherwise.
+ */
 void *vmalloc(size_t size);
+
+/** Same as vmalloc(), but for the VMAP_XEN vmap region. */
 void *vmalloc_xen(size_t size);
 
+/** Same as vmalloc(), but set the contents to zero before returning */
 void *vzalloc(size_t size);
+
+/**
+ * Unmap and free memory from vmalloc(), vmalloc_xen() or vzalloc()
+ *
+ * @param va Virtual base address of the range to free and unmap
+ */
 void vfree(void *va);
 
+/**
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
 
+/** Analogous to vunmap(), but for IO memory mapped via ioremap() */
 static inline void iounmap(void __iomem *va)
 {
     unsigned long addr = (unsigned long)(void __force *)va;
@@ -36,7 +133,10 @@ static inline void iounmap(void __iomem *va)
     vunmap((void *)(addr & PAGE_MASK));
 }
 
+/** Pointer to 1 octet past the end of the VMAP_DEFAULT virtual area */
 void *arch_vmap_virt_end(void);
+
+/** Initialises the VMAP_DEFAULT virtual range */
 static inline void vm_init(void)
 {
     vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
-- 
2.34.1


