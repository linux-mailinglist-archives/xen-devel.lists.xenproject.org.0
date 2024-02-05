Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D33849EA5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676312.1052431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX17H-0007cA-HI; Mon, 05 Feb 2024 15:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676312.1052431; Mon, 05 Feb 2024 15:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX17H-0007ab-EM; Mon, 05 Feb 2024 15:42:39 +0000
Received: by outflank-mailman (input) for mailman id 676312;
 Mon, 05 Feb 2024 15:42:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0y2-0007Hv-45
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:06 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da8776ec-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:33:04 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5111e5e4e2bso7067914e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:04 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:03 -0800 (PST)
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
X-Inumbo-ID: da8776ec-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147184; x=1707751984; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOrP2+p0UdKM7OlT4vC28W6y4WuqTbyr5CWNeFF+F4o=;
        b=YGJW7di8pScrI6ltCOLJMsfXysoG9482jYPNjyBzQC6DGqQdzfw4cfTdxBnzPH+ZUx
         dMIgqEKPMUR9AlX9xN5RzFFthTympLX8KfZvHabgJ+FjDzEkB0xQG/VksCz/WOZnayac
         PxDLO/KkHfCamz/WMeUTuwv3YGtoJ/CwnUv92XH81CgmmJvrOKExMIxRkQUAVnIbKAKs
         6W8hVmjp+UeOxjRT+HP+G0hrFyG/CNELAThHb2rFsGNC/3M6jE+wH1Rdh20Fni0GwsVj
         GtUoynlKL1ZGDbqzW0CD+GI3DE9VjYjdybi7XqBd+ZCcDUyFGSxy6DN7w6uo231OztK/
         q5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147184; x=1707751984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOrP2+p0UdKM7OlT4vC28W6y4WuqTbyr5CWNeFF+F4o=;
        b=A3Wya7rhy4/70rPJA4n9/94QctAY3jwmlJpYGDUpZ4l6JrJiZdx4VyYXjb2JJb8QNW
         CEMuNQTg5kMpbcGWZjMUlPy+wehRO93VmhkQlcfgmQFVnApZA1BTtOILc8VEopQ16KPW
         YpQkbqHf9bYHbfmKTMkLr/YSMmac+fWjaC6O59eDFjdUsQo2+PUKpS9xwfGdeLHjPu3d
         DwDMV7vinx7AoG32eeu9+Xr3BIzZgmIAXX5WjfNDfMpmRXdrl1T7+edd4IaQ3hiidYAT
         uEMPemiVFZvFdH0MCMDAMFE3qChr6zdMXjeEtgWct7dsGE1mauoSkj43/5spWQC1oT/g
         tmiQ==
X-Gm-Message-State: AOJu0YyWW7ZiL6Qm5llLcdSpHHy1dYg4cHgVYAiSxPugA/nCsSfhDOAE
	5jKM/C5Wx3H1fFkDecCe6tqlAQ1WOn8q7oX9S3wmNn0yz1Dt+n7GIPJny6FX
X-Google-Smtp-Source: AGHT+IGbDRXclnbreTILTKBBtioAUKxt0a+2i7VfOI26G3E8gmpVxDgb54h4P+cwwIgyl12KSrt5vA==
X-Received: by 2002:a05:6512:448:b0:511:354a:ca45 with SMTP id y8-20020a056512044800b00511354aca45mr6044525lfk.31.1707147183768;
        Mon, 05 Feb 2024 07:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVO+jxkUlEzqUVVxisF9a+E+MCNu0KdKQsRbW2xTq2iHqcLiOgYUCCypbcXZs8CUMxL/Z2zmvOddU5IeJjljyit5tMdTo351eD1LXUEBl3y2BOlEZ5FRZ3S+BQSfqIqxIDvBiIo80poTfqJMoISnVILUevEIWYV58IcEXPtMvxANWlNxsi9uwfceWKAIJ8a7FqIZVyhlEfeM2/n32FfyhkVW7P8+Sc7SiYhr0ZEMhuA1K5AVcJOeLEWaptYyY1k7kILgEody9wv2SArxun47TMbHDt8FIpW5s0ROgb9dLYnC4VNv9M+mQ2pKnAsIpqMVLBhFhq4
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 22/30] xen/riscv: define an address of frame table
Date: Mon,  5 Feb 2024 16:32:29 +0100
Message-ID: <796853f19b883c474998ba97c1ee66cf224b1bde.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also, the patch adds some helpful macros that assist in avoiding
the redefinition of memory layout for each MMU mode.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - move "#define VPN_BITS (9)" inside CONFIG_RISCV_64 as for SV32 it should be defined differently.
 - drop SLOTN_ENTRY_SIZE and introduce DIRECTMAP_SIZE. It is not needed for now, but will be needed in the
   future.
 - update memory layout table and some related macros.
---
Changes in V3:
 - drop OFFSET_BITS, and use PAGE_SHIFT instead.
 - code style fixes.
 - add comment how macros are useful.
 - move all memory related layout definitions close to comment with memory layout description.
 - make memory layout description generic for any MMU mode.
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/config.h | 105 ++++++++++++++++++++--------
 1 file changed, 77 insertions(+), 28 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 56387ac159..479da15782 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -6,6 +6,16 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
+#include <asm/riscv_encoding.h>
+
+#ifdef CONFIG_RISCV_64
+#define CONFIG_PAGING_LEVELS 3
+#define RV_STAGE1_MODE SATP_MODE_SV39
+#else
+#define CONFIG_PAGING_LEVELS 2
+#define RV_STAGE1_MODE SATP_MODE_SV32
+#endif
+
 /*
  * RISC-V64 Layout:
  *
@@ -23,25 +33,78 @@
  * It means that:
  *   top VA bits are simply ignored for the purpose of translating to PA.
  *
+ * Amount of slots for Frametable were calculated base on
+ * sizeof(struct page_info) = 48. If the 'struct page_info' is changed,
+ * the table below must be updated.
+ *
  * ============================================================================
- *    Start addr    |   End addr        |  Size  | Slot       |area description
- * ============================================================================
- * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     | Unused
- * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
- * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
- * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
- *                 ...                  |  1 GB  | L2 510     | Unused
- * 0000003200000000 |  0000007F80000000 | 309 GB | L2 200-509 | Direct map
- *                 ...                  |  1 GB  | L2 199     | Unused
- * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 | Frametable
- *                 ...                  |  1 GB  | L2 195     | Unused
- * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     | VMAP
- *                 ...                  | 194 GB | L2 0 - 193 | Unused
+ * Start addr          | End addr         | Slot       | area description
  * ============================================================================
- *
+ *                   .....                 L2 511          Unused
+ *  0xffffffffc0600000  0xffffffffc0800000 L2 511          Fixmap
+ *  0xffffffffc0200000  0xffffffffc0600000 L2 511          FDT
+ *  0xffffffffc0000000  0xffffffffc0200000 L2 511          Xen
+ *                   .....                 L2 510          Unused
+ *  0x3200000000        0x7f40000000       L2 200-509      Direct map
+ *                   .....                 L2 199          Unused
+ *  0x30c0000000        0x31c0000000       L2 195-198      Frametable
+ *                   .....                 L2 194          Unused
+ *  0x3040000000        0x3080000000       L2 193          VMAP
+ *                   .....                 L2 0-192        Unused
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+ * Memory layout is the same as for SV39 in terms of slots, so only start and
+ * end addresses should be shifted by 9
 #endif
  */
 
+#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
+
+#ifdef CONFIG_RISCV_64
+
+#define VPN_BITS (9)
+
+#define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + PAGE_SHIFT)
+#define SLOTN(slot)             (_AT(vaddr_t, slot) << SLOTN_ENTRY_BITS)
+
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+#define XEN_VIRT_START 0xFFFFFFFFC0000000
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+#define XEN_VIRT_START 0xFFFFFF8000000000
+#else
+#error "unsupported RV_STAGE1_MODE"
+#endif
+
+#define DIRECTMAP_SLOT_END      509
+#define DIRECTMAP_SLOT_START    200
+#define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
+#define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) - SLOTN(DIRECTMAP_SLOT_START))
+
+#define FRAMETABLE_SCALE_FACTOR  (PAGE_SIZE/sizeof(struct page_info))
+#define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) / FRAMETABLE_SCALE_FACTOR) + 1)
+
+/*
+ * We have to skip Unused slot between DIRECTMAP and FRAMETABLE (look at mem.
+ * layout), so -1 is needed
+ */
+#define FRAMETABLE_SLOT_START   (DIRECTMAP_SLOT_START - FRAMETABLE_SIZE_IN_SLOTS - 1)
+#define FRAMETABLE_SIZE         (FRAMETABLE_SIZE_IN_SLOTS * SLOTN(1))
+#define FRAMETABLE_VIRT_START   SLOTN(FRAMETABLE_SLOT_START)
+#define FRAMETABLE_NR           (FRAMETABLE_SIZE / sizeof(*frame_table))
+#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
+
+/*
+ * We have to skip Unused slot between Frametable and VMAP (look at mem.
+ * layout), so an additional -1 is needed */
+#define VMAP_SLOT_START         (FRAMETABLE_SLOT_START - 1 - 1)
+#define VMAP_VIRT_START         SLOTN(VMAP_SLOT_START)
+#define VMAP_VIRT_SIZE          GB(1)
+
+#else
+#error "RV32 isn't supported"
+#endif
+
+#define HYPERVISOR_VIRT_START XEN_VIRT_START
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
@@ -75,24 +138,10 @@
 #define CODE_FILL /* empty */
 #endif
 
-#ifdef CONFIG_RISCV_64
-#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
-#else
-#error "RV32 isn't supported"
-#endif
-
 #define SMP_CACHE_BYTES (1 << 6)
 
 #define STACK_SIZE PAGE_SIZE
 
-#ifdef CONFIG_RISCV_64
-#define CONFIG_PAGING_LEVELS 3
-#define RV_STAGE1_MODE SATP_MODE_SV39
-#else
-#define CONFIG_PAGING_LEVELS 2
-#define RV_STAGE1_MODE SATP_MODE_SV32
-#endif
-
 #define IDENT_AREA_SIZE 64
 
 #endif /* __RISCV_CONFIG_H__ */
-- 
2.43.0


