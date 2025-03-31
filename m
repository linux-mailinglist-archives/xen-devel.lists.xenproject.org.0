Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E6CA769EE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 17:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932762.1334820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGw1-0003Rt-9W; Mon, 31 Mar 2025 15:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932762.1334820; Mon, 31 Mar 2025 15:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzGw1-0003Pp-6O; Mon, 31 Mar 2025 15:20:21 +0000
Received: by outflank-mailman (input) for mailman id 932762;
 Mon, 31 Mar 2025 15:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kof6=WS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tzGw0-0003Pj-Qa
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 15:20:20 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a77c73fb-0e43-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 17:20:18 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac25520a289so770652966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 08:20:18 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac71922ba6fsm644280266b.19.2025.03.31.08.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 08:20:17 -0700 (PDT)
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
X-Inumbo-ID: a77c73fb-0e43-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743434418; x=1744039218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwhXA6mi12VZ957a91yB9GLetoX262m4MEkEn262YHU=;
        b=JP/K4ZzFeFXT9Rkcs8/D75jvPlnaDI+KbNu9pcM15s6me2w4KpilqKyRqS7gOBh+qH
         SGh3mpEFE6hZbu9HYMWyChKGas+l5ARBNlsDANx+UOvBbLXNIw/RLDQORWTtNDoiId1q
         SRj7tr4fd2F1h8xKJ9Z2QF/4Xq99jdbZ/s6H/bI+FkLgdPBI0hDVAkK+Cp5dQvLXpFap
         SzGSWeG3wxsGBq8L+KvnQeTk9BX2eQhPPO2E9+V8SIZ1XT1U8OxkJ5fAdsXAWeXB05Bx
         cJtNc+qX2dBU3YxZ7hyhvq6wVl2e9/bYl83cx+O/p4qGS+taNT6jnzmO+7pCWKrSDUnq
         hQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434418; x=1744039218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwhXA6mi12VZ957a91yB9GLetoX262m4MEkEn262YHU=;
        b=u/Ip7JVOGpr8IaCsULcfWxyAiW3nBuaBgU3fR69DxBj+ejEYsBihxCPYRdK6LB3cbD
         EE/9egcW+wl5Igj/3seDuiROWmQoWkhVW9dqvgcr4WWO32ba2EnkEiJbDrVSvGO6Eu11
         M121IkkqKrsmbAj/cAvKvbRNkT8gv7YS0duCMlOinXeGskR0mcLG0Voo31Q20N0yKkl3
         hpdqehNZDy1l3n4s+vuKI3Trbu3qa4oDzHAQHuvj728lgg8z5Wh7xLyIZqfHIWK+Bqyo
         VPa2Hjwof0xfFHamCf3ZpbjT/7Fnk4Ew9e1h6Wtj+A031PntUqxqIykka5NxOnZQUOTd
         kDXA==
X-Gm-Message-State: AOJu0YzsrquseekTOFmsitjBQRAfMTugy6yPCh4/7T55PEahBwEeDEqF
	SfTDNmaymGzRVWgTEWG2iSApNQbQsAkzFIyHujAW8k02gktvCAxHm2yaZg==
X-Gm-Gg: ASbGncszTE49jJF7YA0FC+AfXlszRusWxvf6rZrm3iL9KBE3kjR8FLH6zXp+2abfoCL
	LggE1hVoZEMz+53pYsYfQaF/VTnuGwW9BqUPGGjPT7tN+ir0B0bORJf9k7Fa+Hvte7H6cNYTopI
	RkgTtej2nbsSP6yjmrjWu+0wWJB2juL6S7y+UEJnTuUd4GyZwwnfg3AmbbTNlCYdcwn/g+XWRug
	JPidfNugGA1MpFtzBMl4vJ3ywgaS9AjbfLFCWbMM3jqQh+E5uQqrDh51lFJFl2F2FjXWj5LT6nS
	poLoxHJAja7v6SF9twLKymOzjPriUBRCwPVlA1gJM3non+3NNVZNWyNYUFKEphT83gctQhRK5DP
	LjX92+sD1RxHrVa/hBff32Vqb
X-Google-Smtp-Source: AGHT+IHsMJyTYm/ZBPS0YL1Zu9eDazSXmmFEuQTF9HS8IjRJT93hsTHU6CLUwNH1BOZQ757eimQdmg==
X-Received: by 2002:a17:907:7da7:b0:ac6:ba92:79c9 with SMTP id a640c23a62f3a-ac7389d66e1mr957075966b.18.1743434417932;
        Mon, 31 Mar 2025 08:20:17 -0700 (PDT)
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
Subject: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
Date: Mon, 31 Mar 2025 17:20:11 +0200
Message-ID: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/config.h |  8 ++++----
 xen/arch/riscv/include/asm/mm.h     | 12 +++++++++---
 xen/arch/riscv/mm.c                 | 11 ++++++-----
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 7141bd9e46..ec73f436e3 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -41,11 +41,11 @@
  * Start addr          | End addr         | Slot       | area description
  * ============================================================================
  *                   .....                 L2 511          Unused
- *  0xffffffffc0a00000  0xffffffffc0bfffff L2 511          Fixmap
+ *  0xffffffffc1000000  0xffffffffc11fffff L2 511          Fixmap
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0400000  0xffffffffc07fffff L2 511          FDT
+ *  0xffffffffc0a00000  0xffffffffc0dfffff L2 511          FDT
  *                   ..... ( 2 MB gap )
- *  0xffffffffc0000000  0xffffffffc01fffff L2 511          Xen
+ *  0xffffffffc0000000  0xffffffffc07fffff L2 511          Xen
  *                   .....                 L2 510          Unused
  *  0x3200000000        0x7f7fffffff       L2 200-509      Direct map
  *                   .....                 L2 199          Unused
@@ -78,7 +78,7 @@
 
 #define GAP_SIZE                MB(2)
 
-#define XEN_VIRT_SIZE           MB(2)
+#define XEN_VIRT_SIZE           MB(8)
 
 #define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE + GAP_SIZE)
 #define BOOT_FDT_VIRT_SIZE      MB(4)
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 4035cd400a..822c21e02a 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
  */
 static inline unsigned long virt_to_maddr(unsigned long va)
 {
+    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
+    const unsigned long va_vpn = va >> vpn1_shift;
+    const unsigned long xen_virt_starn_vpn =
+        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
+    const unsigned long xen_virt_end_vpn =
+        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
+
     if ((va >= DIRECTMAP_VIRT_START) &&
         (va <= DIRECTMAP_VIRT_END))
         return directmapoff_to_maddr(va - directmap_virt_start);
 
-    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
-    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
-           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
+    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
+    ASSERT((va_vpn >= xen_virt_starn_vpn) && (va_vpn <= xen_virt_end_vpn));
 
     /* phys_offset = load_start - XEN_VIRT_START */
     return phys_offset + va;
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index f2bf279bac..dfa86738f2 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -31,20 +31,21 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 
 /*
- * It is expected that Xen won't be more then 2 MB.
+ * It is expected that Xen won't be more then 8 MB.
  * The check in xen.lds.S guarantees that.
- * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
+ * At least 6 page tables (in case of Sv39) are needed to cover 8 MB.
  * One for each page level table with PAGE_SIZE = 4 Kb.
  *
- * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
+ * Four L0 page table can cover 8 MB(512 entries of
+ * one page table * PAGE_SIZE).
  *
  * It might be needed one more page table in case when Xen load address
  * isn't 2 MB aligned.
  *
- * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
+ * (CONFIG_PAGING_LEVELS + 2) page tables are needed for the identity mapping,
  * except that the root page table is shared with the initial mapping
  */
-#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
+#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS + 2) * 2 + 1)
 
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_root[PAGETABLE_ENTRIES];
-- 
2.49.0


