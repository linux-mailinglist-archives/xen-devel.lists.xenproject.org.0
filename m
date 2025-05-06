Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF6AACB83
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977621.1364612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWV-00060d-Ho; Tue, 06 May 2025 16:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977621.1364612; Tue, 06 May 2025 16:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWV-0005tz-Bj; Tue, 06 May 2025 16:52:03 +0000
Received: by outflank-mailman (input) for mailman id 977621;
 Tue, 06 May 2025 16:52:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWT-0005Fd-M9
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:01 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7fe31c-2a9a-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:52:00 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acb615228a4so15460366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:00 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:51:58 -0700 (PDT)
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
X-Inumbo-ID: 6d7fe31c-2a9a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550319; x=1747155119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP/6rOaeZ6U4S6TprvFe/y7WpP4kuiYu4f/W+psScZM=;
        b=Prkyg5Tqmx/wbaQaijdjg8o14QbYPf7RkLQUzgv17WcUaFfmSWh6WuybUUjxHeESWK
         67Kt/eYhlW3/P6oHxbTPk7jKSQlzfTv2ll+pUT0XaZbsnXx44pAhZdLzxtUjUoSQ7AGa
         OLQPY0BzXRWmfuBTJNGCfRusybZdbNviiz0FjJdIhcKr3gMwQBSv10yYJVDSne9Ma3E9
         9fBe2NZpmwDwmNx8gvNHJEvvJ/uefZqzd0gLrx2kSanBjl5fkMLKgSaxTXE5b9+2U7kJ
         VRMkdFxPWJOrhMKhqtb5gxZvrlDj4LPbKoh4zXkktsvqihIgog5Zlcu60lhpbYXwDCMK
         bivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550319; x=1747155119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP/6rOaeZ6U4S6TprvFe/y7WpP4kuiYu4f/W+psScZM=;
        b=WJhDdEqMhbMkQOT7NHn56j2Ju6s32WZTXohrWBj8XOqbmUMb1DuXAWYwC1M58vzSn4
         2h9bD7peo7fvKXaizlpCIKN9oXbBeuEe8oVO+6y04IV1jHD6SJgtsToErFLIUY/ItXFh
         klED/CRW4qJari0tcl3k1JKJrz9VwJcJiSctbH/BXlYaelZHx7hLLYEXQjfew4yGFW8S
         CF8DOG+MScN5EnnUCyRO/Loe0WQQt8uDrIRg3tN7X9zF048t++F5IU6lZzUjt+9HjwxI
         Zr5IhXIBtrm3n75csNJEvT06SDZd2VCf9pXN/hFevTcTF5WBx7lv98/DRrab7HzNVBx6
         6H8w==
X-Gm-Message-State: AOJu0Yy7WcjGpj5n+SKxAV4wQ6ahsmeBL5lFdgP+CLzWqF/VMyw8bt57
	qyyRxJ2ZWoCj8DNZ7jUXPFeFhSRasNZNx151aXNkTpLs5MFOMJCbDsGb/Q==
X-Gm-Gg: ASbGncurxUrBAHjCSN+7lacz1w8G57DKSbbG67fS+HznweRlzO0eD2/yjBfFxMcZxrD
	+jL43mOUBQUDIspWK3bGffDsEl/NMP6L+jfkr5mJfpTIkI8axnDQbTt8IT6Mp52pQsA9Wj1rCw0
	SVHTMSCNQLxLB2qck3ImRikhK8jyuqgMSoBRwISVKT31VCc1Jbycw6KDfrHMI+Yzqpn6M4sBCrv
	dt9R853HIzXZDI4HQN8dwoFkmOPBW8rW7yFm7o+tRcOJOIbpSQMdVM5KHOw86D2J8ksFoP247zH
	iVSsdsdmEv0UjOzWOphG5us6yzoypwpM8WPe2TlIHnYi7mtbCeqcM9LD6q6XMs768wyD6I7qwRT
	Fp7tgueshdU2bnvT7Ugy+
X-Google-Smtp-Source: AGHT+IGrou4QtyM878xmIkaXrEEYa/uriKDowKj66N3imoG9kdeaqYGWx2lXK2Xm8nYhvxA07gpStg==
X-Received: by 2002:a17:907:3e0f:b0:acb:2050:c105 with SMTP id a640c23a62f3a-ad1e794838fmr44600766b.21.1746550319005;
        Tue, 06 May 2025 09:51:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 03/16] xen/riscv: introduce support of Svpbmt extension
Date: Tue,  6 May 2025 18:51:33 +0200
Message-ID: <da9273c20dc7ac1c131322e38a8cef361dfd86a9.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Svpbmt extension is necessary for chaning the memory type for a page contains
a combination of attributes that indicate the cacheability, idempotency,
and ordering properties for access to that page.

As a part of the patch the following is introduced:
- Svpbmt memory type defintions: PTE_PBMT_{NOCACHE,IO}.
- PAGE_HYPERVISOR_{NOCACHE,WC}.
- RISCV_ISA_EXT_svpbmt and add a check in runtime that Svpbmt is
  supported by platform.
- Update riscv/booting.txt with information about Svpbmt.
- Update logic of pt_update_entry() to take into account PBMT bits.

Use 'unsigned long' for pte_attr_t as PMBT bits are 61 and 62 and it doesn't
fit into 'unsigned int'. Also, update function prototypes which uses
'unsigned int' for flags/attibutes.

Enable Svpbmt for testing in QEMU as Svpmbt is now mandatory for
Xen work.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - new patch.
---
 automation/scripts/qemu-smoke-riscv64.sh |  1 +
 docs/misc/riscv/booting.txt              |  4 ++++
 xen/arch/riscv/Kconfig                   | 14 ++++++++++++++
 xen/arch/riscv/cpufeature.c              |  2 ++
 xen/arch/riscv/include/asm/cpufeature.h  |  1 +
 xen/arch/riscv/include/asm/fixmap.h      |  2 +-
 xen/arch/riscv/include/asm/mm-types.h    |  8 ++++++++
 xen/arch/riscv/include/asm/page.h        | 17 ++++++++++++++++-
 xen/arch/riscv/pt.c                      | 20 +++++++++++---------
 9 files changed, 58 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/mm-types.h

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index b2e112c942..25f9e4190e 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -7,6 +7,7 @@ rm -f smoke.serial
 
 export TEST_CMD="qemu-system-riscv64 \
     -M virt,aia=aplic-imsic \
+    -cpu rv64,svpbmt=on \
     -smp 1 \
     -nographic \
     -m 2g \
diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
index 3a8474a27d..e100bde575 100644
--- a/docs/misc/riscv/booting.txt
+++ b/docs/misc/riscv/booting.txt
@@ -18,3 +18,7 @@ Xen is run:
 - Zihintpause:
   On a system that doesn't have this extension, cpu_relax() should be
   implemented properly.
+- SVPBMT is mandatory to enable changing the memory attributes of a page.
+  For platforms that do not support SVPBMT, it is necessary to introduce a
+  similar mechanism as described in:
+  https://lore.kernel.org/all/20241102000843.1301099-1-samuel.holland@sifive.com/
diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index d882e0a059..60520dab57 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -10,11 +10,25 @@ config RISCV
 config RISCV_64
 	def_bool y
 	select 64BIT
+	select HAS_SVPBMT
 
 config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config HAS_SVPBMT
+	bool
+	depends on RISCV_64
+	help
+	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
+	  page-based memory types).
+
+	  The memory type for a page contains a combination of attributes
+	  that indicate the cacheability, idempotency, and ordering
+	  properties for access to that page.
+
+	  The Svpbmt extension is only available on 64-bit cpus.
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 3246a03624..b7d5ec6580 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -137,6 +137,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(zbs),
     RISCV_ISA_EXT_DATA(smaia),
     RISCV_ISA_EXT_DATA(ssaia),
+    RISCV_ISA_EXT_DATA(svpbmt),
 };
 
 static const struct riscv_isa_ext_data __initconst required_extensions[] = {
@@ -151,6 +152,7 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(zifencei),
     RISCV_ISA_EXT_DATA(zihintpause),
     RISCV_ISA_EXT_DATA(zbb),
+    RISCV_ISA_EXT_DATA(svpbmt),
 };
 
 static bool __init is_lowercase_extension_name(const char *str)
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 1015b6ee44..768b84b769 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -37,6 +37,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zbs,
     RISCV_ISA_EXT_smaia,
     RISCV_ISA_EXT_ssaia,
+    RISCV_ISA_EXT_svpbmt,
     RISCV_ISA_EXT_MAX
 };
 
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
index e399a15f53..5990c964aa 100644
--- a/xen/arch/riscv/include/asm/fixmap.h
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -33,7 +33,7 @@
 extern pte_t xen_fixmap[];
 
 /* Map a page in a fixmap entry */
-void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
+void set_fixmap(unsigned int map, mfn_t mfn, pte_attr_t flags);
 /* Remove a mapping from a fixmap entry */
 void clear_fixmap(unsigned int map);
 
diff --git a/xen/arch/riscv/include/asm/mm-types.h b/xen/arch/riscv/include/asm/mm-types.h
new file mode 100644
index 0000000000..fa512064b8
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mm-types.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_RISCV_MM_TYPES_H
+#define ASM_RISCV_MM_TYPES_H
+
+typedef unsigned long pte_attr_t;
+
+#endif /* ASM_RISCV_MM_TYPES_H */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index bf8988f657..2af4823170 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -46,6 +46,8 @@
 #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PMBT_IO)
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PMBT_NOCACHE)
 
 /*
  * The PTE format does not contain the following bits within itself;
@@ -56,8 +58,21 @@
 #define PTE_SMALL       BIT(10, UL)
 #define PTE_POPULATE    BIT(11, UL)
 
+/*
+ * [62:61] Svpbmt Memory Type definitions:
+ *
+ *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
+ *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
+ *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
+ *  11 - Rsvd   Reserved for future standard use
+ */
+#define PTE_PMBT_NOCACHE    BIT(61, UL)
+#define PTE_PMBT_IO         BIT(62, UL)
+
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
+#define PTE_PBMT_MASK   (PTE_PMBT_NOCACHE | PTE_PMBT_IO)
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
@@ -202,7 +217,7 @@ static inline pte_t read_pte(const pte_t *p)
     return read_atomic(p);
 }
 
-static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
+static inline pte_t pte_from_mfn(mfn_t mfn, pte_attr_t flags)
 {
     unsigned long pte = (mfn_x(mfn) << PTE_PPN_SHIFT) | flags;
     return (pte_t){ .pte = pte };
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 918b1b91ab..82c8c73c3e 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -25,7 +25,7 @@ static inline mfn_t get_root_page(void)
  * See the comment about the possible combination of (mfn, flags) in
  * the comment above pt_update().
  */
-static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
+static bool pt_check_entry(pte_t entry, mfn_t mfn, pte_attr_t flags)
 {
     /* Sanity check when modifying an entry. */
     if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
@@ -260,7 +260,7 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
  */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
                            mfn_t mfn, unsigned int *target,
-                           unsigned int flags)
+                           pte_attr_t flags)
 {
     int rc;
     /*
@@ -328,17 +328,19 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
         pte.pte = 0;
     else
     {
+        const pte_attr_t attrs = PTE_ACCESS_MASK | PTE_PBMT_MASK;
+
         /* We are inserting a mapping => Create new pte. */
         if ( !mfn_eq(mfn, INVALID_MFN) )
             pte = pte_from_mfn(mfn, PTE_VALID);
-        else /* We are updating the permission => Copy the current pte. */
+        else /* We are updating the attributes => Copy the current pte. */
         {
             pte = *ptep;
-            pte.pte &= ~PTE_ACCESS_MASK;
+            pte.pte &= ~attrs;
         }
 
-        /* update permission according to the flags */
-        pte.pte |= (flags & PTE_ACCESS_MASK) | PTE_ACCESSED | PTE_DIRTY;
+        /* Update attributes of PTE according to the flags. */
+        pte.pte |= (flags & attrs) | PTE_ACCESSED | PTE_DIRTY;
     }
 
     write_pte(ptep, pte);
@@ -353,7 +355,7 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
 
 /* Return the level where mapping should be done */
 static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
-                            unsigned int flags)
+                            pte_attr_t flags)
 {
     unsigned int level = 0;
     unsigned long mask;
@@ -407,7 +409,7 @@ static DEFINE_SPINLOCK(pt_lock);
  * inserting will be done.
  */
 static int pt_update(vaddr_t virt, mfn_t mfn,
-                     unsigned long nr_mfns, unsigned int flags)
+                     unsigned long nr_mfns, pte_attr_t flags)
 {
     int rc = 0;
     unsigned long vfn = PFN_DOWN(virt);
@@ -535,7 +537,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 }
 
 /* Map a 4k page in a fixmap entry */
-void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+void set_fixmap(unsigned int map, mfn_t mfn, pte_attr_t flags)
 {
     if ( map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags | PTE_SMALL) != 0 )
         BUG();
-- 
2.49.0


