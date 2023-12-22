Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99181CC18
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659495.1029183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJ8-0001Nm-Kj; Fri, 22 Dec 2023 15:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659495.1029183; Fri, 22 Dec 2023 15:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhJ8-0001Ki-HS; Fri, 22 Dec 2023 15:19:26 +0000
Received: by outflank-mailman (input) for mailman id 659495;
 Fri, 22 Dec 2023 15:19:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDl-0007Ie-I9
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:53 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b73781d9-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:52 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e23a4df33so2371709e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:52 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:51 -0800 (PST)
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
X-Inumbo-ID: b73781d9-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258031; x=1703862831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4dajvonh7p2dNVDQKVaYgfkmYnC6XrrNf5FliBDwEk=;
        b=ODjufzVW60is2uDmnbGJIqgytnGqAyaTeA2MHPATqdVd9R3MSDSX8jW3zCJWIDpR6b
         ug9gMs/ClY5ZxmyKq8hOzpZ3nbVa7paU0W8keKXD9JpfiUkJpfGgUbeTb12SpJzEANMS
         cxUKzTxPVu3X+lkAbNuTXxR3918iFRhNRXyCAgwRw5G53hJUO5sGBz8/O63qybI7Hz1u
         08gr/Zv5ST716X4OVGE+9dZPPLt8XbmBYRA9AWrIiyReQUSLx27N2Frk6Se+ld7cCQ+U
         ujLQHc432mUUEi35cNv7FOFFKSgHtorAEszcStBWJUTuL54QzBqeP0GFkLSN6/kAL2HV
         qEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258031; x=1703862831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4dajvonh7p2dNVDQKVaYgfkmYnC6XrrNf5FliBDwEk=;
        b=ll1edS6cy/N17TI3CCag+JoP22wTXRbQ9FdskwE63xX5CvnH/xhIoSsmm7JzpTBuwX
         7cF49cMHDO41mQZ44WXNC9A+Xb0RuM0/ubvPzVLjLYFnwgdtfNUppo/4nu3Jcv05Yu/W
         Ckm38z8p/Nr7ocFoGaqrI31lxRL34eqorCfTOkuTskVrMovmEqGTdFGD+se0tp7FTtoQ
         1NU1ZR2yPQea3f3GPMkxug/GuJKZ+b18WZOjmo6fh+24scSW/WNLh3ko48igc18f0/XM
         8OBSiVCMCVSy98303SssAIkHDIUUw2IoR9pkX+K9jlg7eVha2V9ONvpBES1ntm+/Bj/K
         atFA==
X-Gm-Message-State: AOJu0YxkWpwMklX8HWueSx2DXX936r5rlZjRIWaFe7FwMm30tAqYQVj9
	7xH40wvIjccGL5PjvnI3DWueq8jh1vs=
X-Google-Smtp-Source: AGHT+IFep3VFmnA/8jd+wAqjCvmLQK9PUeHJroMGSpFKvtKvD1wPEOIRkMbFa3HiLiY5Jdz1I7H3Aw==
X-Received: by 2002:a05:6512:144:b0:50e:3e3d:217c with SMTP id m4-20020a056512014400b0050e3e3d217cmr735545lfo.84.1703258031537;
        Fri, 22 Dec 2023 07:13:51 -0800 (PST)
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
Subject: [PATCH v3 27/34] xen/riscv: define an address of frame table
Date: Fri, 22 Dec 2023 17:13:11 +0200
Message-ID: <d0a357e3b9597479b539e88915731b3f15489c04.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also, the patch adds some helpful macros that assist in avoiding
the redefinition of memory layout for each MMU mode.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/config.h | 85 +++++++++++++++++++----------
 1 file changed, 55 insertions(+), 30 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index f0544c6a20..fb9fc9daaa 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -6,6 +6,14 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
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
@@ -22,25 +30,56 @@
  *
  * It means that:
  *   top VA bits are simply ignored for the purpose of translating to PA.
+#endif
  *
- * ============================================================================
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
- * ============================================================================
+ *       SATP_MODE_SV32   | SATP_MODE_SV39   | SATP_MODE_SV48   | SATP_MODE_SV57
+ *      ==================|==================|==================|=================
+ * BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 | FFFFFF8000000000 | FFFF000000000000
+ * BA1 | 0000000019000000 | 0000003200000000 | 0000640000000000 | 00C8000000000000
+ * BA2 | 0000000018800000 | 0000003100000000 | 0000620000000000 | 00C4000000000000
+ * BA3 | 0000000018400000 | 0000003080000000 | 0000610000000000 | 00C2000000000000
  *
-#endif
+ * ===============================================================================
+ * Start addr     |   End addr          |  Size  | Root PT slot | Area description
+ * ===============================================================================
+ * BA0 + 0x800000 |  FFFFFFFFFFFFFFFF   |1016 MB |     511      | Unused
+ * BA0 + 0x400000 |  BA0 + 0x800000     |  2 MB  |     511      | Fixmap
+ * BA0 + 0x200000 |  BA0 + 0x400000     |  4 MB  |     511      | FDT
+ * BA0            |  BA0 + 0x200000     |  2 MB  |     511      | Xen
+ *                 ...                  |  1 GB  |     510      | Unused
+ * BA1 + 0x000000 |  BA1 + 0x4D80000000 | 309 GB |   200-509    | Direct map
+ *                 ...                  |  1 GB  |     199      | Unused
+ * BA2 + 0x000000 |  BA2 + 0xC0000000   |  3 GB  |   196-198    | Frametable
+ *                 ...                  |  1 GB  |     195      | Unused
+ * BA3 + 0x000000 |  BA3 + 0x40000000   |  1 GB  |     194      | VMAP
+ *                 ...                  | 194 GB |   0 - 193    | Unused
+ * ===============================================================================
  */
+#define VPN_BITS    (9)
+
+#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
+
+#ifdef CONFIG_RISCV_64
+
+#define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + PAGE_SHIFT)
+#define SLOTN(slot)             (_AT(vaddr_t, slot) << SLOTN_ENTRY_BITS)
+#define SLOTN_ENTRY_SIZE        SLOTN(1)
+
+#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
+
+#define FRAMETABLE_VIRT_START   SLOTN(196)
+#define FRAMETABLE_SIZE         GB(3)
+#define FRAMETABLE_NR           (FRAMETABLE_SIZE / sizeof(*frame_table))
+#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
+
+#define VMAP_VIRT_START         SLOTN(194)
+#define VMAP_VIRT_SIZE          GB(1)
+
+#else
+#error "RV32 isn't supported"
+#endif
+
+#define HYPERVISOR_VIRT_START XEN_VIRT_START
 
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
@@ -77,24 +116,10 @@
   name:
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


