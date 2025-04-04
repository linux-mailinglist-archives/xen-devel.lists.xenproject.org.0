Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E9A7C138
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 18:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938318.1339220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0jWc-0001lY-8L; Fri, 04 Apr 2025 16:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938318.1339220; Fri, 04 Apr 2025 16:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0jWc-0001jC-3f; Fri, 04 Apr 2025 16:04:10 +0000
Received: by outflank-mailman (input) for mailman id 938318;
 Fri, 04 Apr 2025 16:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWoU=WW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u0jWb-0001j6-21
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 16:04:09 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fbac8d5-116e-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 18:04:06 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso6092561a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 09:04:06 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087eedf61sm2495979a12.32.2025.04.04.09.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 09:04:04 -0700 (PDT)
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
X-Inumbo-ID: 6fbac8d5-116e-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743782646; x=1744387446; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClFWFnQbf7k3ml+usxyZfFeRgyo3/7bs/5QUmcCxSSA=;
        b=PLBAFR25GZPZ8cFs8R92K1S+Zi8IXQivghXsxsgZ9ncd320F7RBmmpWoe6VVFw1U5L
         9dYOkhOh9p0p9L6QLYA8oaqpatck6NkPYdpwMOMlyGPX7k5qjlh/VAv6Ay3myjZ7kypg
         YQnOyhT1FqBQETa5uIkt9k/2HbRLJfHJs89cHMRrzCgNLxFDqkyLRDS470lVn15ii7y4
         WHsop74OyfJAALEVCV/mvVKbRBfB6GB7i4yuAVfhjsEVnMgkDmBGvpNApCb0yZUkcWKr
         SVGNqLayLrZ1bkLvQhChp/7bqPuc+oKgWXi4UhT9ii8KKRoK0vum1fau/dcSGNfMfHIn
         lP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743782646; x=1744387446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClFWFnQbf7k3ml+usxyZfFeRgyo3/7bs/5QUmcCxSSA=;
        b=xS7VWjsrzbYcHdHnKyHLPVrkFU/Si+3s9qFYdGIrRnZRBSBU/GZYZOuignRlH9dX8z
         l7RloMYEV1VVj66/5Fjra+pky88aecOzLqqsj+xE2XgqJYJ+FSvQkPQUhBCJHjQJiaVD
         FP5uzbiFUhvlx3r8KoufLvTEw/02qCG4nRSREjfVyX3Zo8/UW1SokvPfcPmb4bSEEp9x
         3SlpeXd8cvNx0XiVx8amiGQwN5hHUsipLICTO3RUVg/a20I3obFk1l5WA5pkCum2YT0K
         hnFQN38aG2IZVAFuwW5pIAKjmlgQVPNTm8OWAg+EdAWzBsv/6GpBr14LFw2v4aVT86EY
         1DCg==
X-Gm-Message-State: AOJu0YyY7MvgRyvEkhWzfrXyTmXSKvgljbpfTqOqgfqRsDko9m6tnw6o
	NuV3yhl930jnIB//0KrP26rmivCoXQSd9X/gdVB2MX/P7/9VKnBqc9QL7w==
X-Gm-Gg: ASbGnctiDEWLeSMOC60//kEBAUjRXVWz/ap4W4M1tlNZwYHAshUwlclcoTxtzHmkkpk
	PvSq5HtBwvClgu1k9AVvwQEXuErr86ZD4DILcKNheRMDJGD2C5Hnq5xeiJeyaHVGmILcq3dnDVu
	42dZuHRPIsynARZp1VWcvgWW/vOTizLW0MHXdV8MMUBCN2iT148MWPgsWIqBVE+Y3tWRCElWya8
	hjNHqop8Ioh0OJ2zn0ju/E4Q99k2qGpoRvzOrK4mt7j1dUS158MdF/qfD5KBKAB8VAite8kJbVk
	D0JjMll26AsnkAKIAgIwcslHyp/qaVTJ5p5JtN7Jb/v5XA08bRr7sNTwsscN/d1yx+fGZruQt7C
	GAe/yUURbltHnMQ==
X-Google-Smtp-Source: AGHT+IFxLDXdL0sfTf5zS72oFsBmq5GPi022WrWRgf0cidqTUq+vBOG3RFAPaAz90yq82QRx1uuLvA==
X-Received: by 2002:a17:907:7212:b0:ac3:ed82:77c2 with SMTP id a640c23a62f3a-ac7b6b2b00bmr656513366b.5.1743782645462;
        Fri, 04 Apr 2025 09:04:05 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/riscv: Increase XEN_VIRT_SIZE
Date: Fri,  4 Apr 2025 18:04:00 +0200
Message-ID: <808d1b346bc90dde38fd19a6b92ab78d78e42936.1743766932.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A randconfig job failed with the following issue:
  riscv64-linux-gnu-ld: Xen too large for early-boot assumptions

The reason is that enabling the UBSAN config increased the size of
the Xen binary.

Increase XEN_VIRT_SIZE to reserve enough space, allowing both UBSAN
and GCOV to be enabled together, with some slack for future growth.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Incerease XEN_VIRT_SIZE to 16 Mb to cover also the case if 2M mappings will
   be used for .text (rx), .rodata(r), and .data (rw).
 - Update layout table in config.h.
 - s/xen_virt_starn_vpn/xen_virt_start_vpn
 - Update BUILD_BUG_ON(... != MB(8)) check to "... > GB(1)".
 - Update definition of PGTBL_INITIAL_COUNT and the comment above.
---
 xen/arch/riscv/include/asm/config.h |  8 ++++----
 xen/arch/riscv/include/asm/mm.h     | 12 +++++++++---
 xen/arch/riscv/mm.c                 | 25 ++++++++++++++++---------
 3 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 7141bd9e46..41b8410d10 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -41,11 +41,11 @@
  * Start addr          | End addr         | Slot       | area description
  * ============================================================================
  *                   .....                 L2 511          Unused
- *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
+ *  0xffffffffc1800000  0xffffffffc1afffff L2 511          Fixmap
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0400000  0xffffffffc07fffff L2 511          FDT
+ *  0xffffffffc1200000  0xffffffffc15fffff L2 511          FDT
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0000000  0xffffffffc01fffff L2 511          Xen
+ *  0xffffffffc0000000  0xffffffffc0ffffff L2 511          Xen
  *                   .....                 L2 510          Unused
  *  0x3200000000        0x7f7fffffff       L2 200-509      Direct map
  *                   .....                 L2 199          Unused
@@ -78,7 +78,7 @@
 
 #define GAP_SIZE                MB(2)
 
-#define XEN_VIRT_SIZE           MB(2)
+#define XEN_VIRT_SIZE           MB(16)
 
 #define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE + GAP_SIZE)
 #define BOOT_FDT_VIRT_SIZE      MB(4)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 4035cd400a..511e75c6d4 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
  */
 static inline unsigned long virt_to_maddr(unsigned long va)
 {
+    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
+    const unsigned long va_vpn = va >> vpn1_shift;
+    const unsigned long xen_virt_start_vpn =
+        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
+    const unsigned long xen_virt_end_vpn =
+        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
+
     if ((va >= DIRECTMAP_VIRT_START) &&
         (va <= DIRECTMAP_VIRT_END))
         return directmapoff_to_maddr(va - directmap_virt_start);
 
-    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
-    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
-           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
+    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
+    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));
 
     /* phys_offset = load_start - XEN_VIRT_START */
     return phys_offset + va;
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index f2bf279bac..256afdaaa3 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 
 /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
  * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
- * One for each page level table with PAGE_SIZE = 4 Kb.
  *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Root page table is shared with the initial mapping and is declared
+ * separetely. (look at stage1_pgtbl_root)
  *
- * It might be needed one more page table in case when Xen load address
- * isn't 2 MB aligned.
+ * An amount of page tables between root page table and L0 page table
+ * (in the case of Sv39 it covers L1 table):
+ *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
+ *   the same amount are needed for Xen.
  *
- * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
- * except that the root page table is shared with the initial mapping
+ * An amount of L0 page tables:
+ *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
+ *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
+ *   one L0 is needed for indenity mapping.
+ *
+ *   It might be needed one more page table in case when Xen load
+ *   address isn't 2 MB aligned.
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
+                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)) + 2)
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
-- 
2.49.0


