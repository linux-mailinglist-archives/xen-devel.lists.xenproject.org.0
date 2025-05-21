Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97295ABFA9D
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992139.1375935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvI-0004sx-HP; Wed, 21 May 2025 16:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992139.1375935; Wed, 21 May 2025 16:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvI-0004nK-CI; Wed, 21 May 2025 16:04:04 +0000
Received: by outflank-mailman (input) for mailman id 992139;
 Wed, 21 May 2025 16:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvG-0004XB-Vf
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:03 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36443578-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:02 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-601956fa3beso7489603a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:02 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:00 -0700 (PDT)
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
X-Inumbo-ID: 36443578-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843441; x=1748448241; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vhh7mLKOS422FBFt4UIWy2zs58dqVadBUh2l97wxS44=;
        b=JHwIyEJ29XJTqw83GuTyLOJbaMX05R8tTSh++dS2c+ScoLs50HZsFbRi0nOIBT/jBB
         9dDpq7V2h4IcQuET7QBQbte1pvIoljRtKe9wApAuWeTccIcrrEjX4/IzQEndcBcsucnA
         WhOt62WIGLV2Hg2YCQeQQ7QlB4KGZYjSj/7kO8oZQNJdySg74+r24VZXzqHkjTmqDwKu
         +8wrAiP8EacctWDo+zrpHM3WEj8TIPzA2pKm3MNxB+ix6+N2sEnNuPfJSiY2gfSaKVQA
         SlH6A3BmPX8KpTpCIWHKVF5x8RlFHa3jvJ8mV9KXMQwDhWY+i6FVgpMDveo/VmxtBBMz
         gtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843441; x=1748448241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vhh7mLKOS422FBFt4UIWy2zs58dqVadBUh2l97wxS44=;
        b=EckL5q5gqnZJyOLGzznq4Vy+ZnU5GhDp8mcJJcqoitV3JKh25rU2m0hnsrFMlnl0Ci
         s2475CXfmssK7+0fun1gYEXz6k7kSMpl5EUHVI3gPyXySl2WJdAW6PDgq7wocq6mw0Jl
         aKB8LNU4rj37feemkZBHsRNV9VJHa5UxFWHZCxKbp6UmE2uIcqHzu2wU2XCGbea/4gaA
         E2DHJGMYYLu0cVIZHh2WUSoSQ92g4yRyu9br9Pvkib9K4KwVwdSuzqlRmvhZhJcisIYU
         zdw/2q2SNNiWWeX7D/geGipgk9yfDh89aqn1xb08/RITGOvFH5og5R59gdCKo9fYXo0j
         4HXg==
X-Gm-Message-State: AOJu0YwsLkzh+Fpnr14bgaH6rm601yf4Eo2p3Uz2/k6ZexSvIDTLeVDr
	gsAGsYEYEGOxtXBq5sjttRi8Ohdb9RThRSAQ2XgMWv3cGkPCWSFz5ceStC8yrg==
X-Gm-Gg: ASbGnctNQmDL3/u4LHNy0LHUUgqm5xdLszhdEiMWAKy1phtowgOpPIbJQsQsoUp9nei
	9v4iGGifF/rsOqrdUQ5RTvNiCeqraM8GKRh4io6Jy6uojHWEjm70JCau8HSuw+sbwujY5c9zWsZ
	JiUpyzaRsmI+KwzywHlGnDmQ9pYqS6Mcf3o1+KDNgimtJMuGX8g7c6GTdUg5sxJULjYS8yHJRQi
	s8pU4UGBzrbqlg6nmjGZTw5uv9TxD4UKvjAl58vKNsJhY+djzlUcmarFLERacmEAEUeNpP/rN5K
	rxjOTPuMw49cxQEufDYG56EDc/OJ94VbZtbe7rq5kLgyT5FKITwuSsAcStFoCZTTXrozwordpNv
	e1Rc/lLYXs1JxD1ukMw==
X-Google-Smtp-Source: AGHT+IFhG7x4HtSEX7BJV/ofoAM1+NoJCsmEJv58pdf+SV/Z03PPdGmhTMEbAKl3/8PMUl63cZdGLA==
X-Received: by 2002:a05:6402:254a:b0:601:9aeb:3d9 with SMTP id 4fb4d7f45d1cf-6019aeb05f4mr15520397a12.20.1747843440712;
        Wed, 21 May 2025 09:04:00 -0700 (PDT)
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
Subject: [PATCH v3 02/14] xen/riscv: introduce support of Svpbmt extension and make it mandatory
Date: Wed, 21 May 2025 18:03:42 +0200
Message-ID: <f1c19b5dec9e00b112d97324d582191fe127eb83.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
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
Changes in v3:
 - Remove dependecy "depends on RISCV_64" for HAS_SVPBMT as it is selected by
   CONFIG_RISCV_64.
 - Move HAS_SVPMBT's help text to commit message as it's not too much sense
   to have it for a prompt-less option.
 - Move definition of PTE_PMBT_{NOCACHE,IO} up closer to arch-specific
   definitions.
 - Update the commit message and subject.
 - Add a comment above PAGE_HYPERVISOR_NOCACHE.
---
Changes in v2:
 - new patch.
---
 automation/scripts/qemu-smoke-riscv64.sh |  1 +
 docs/misc/riscv/booting.txt              |  4 ++++
 xen/arch/riscv/Kconfig                   |  4 ++++
 xen/arch/riscv/cpufeature.c              |  2 ++
 xen/arch/riscv/include/asm/cpufeature.h  |  1 +
 xen/arch/riscv/include/asm/fixmap.h      |  2 +-
 xen/arch/riscv/include/asm/mm-types.h    |  8 ++++++++
 xen/arch/riscv/include/asm/page.h        | 23 ++++++++++++++++++++++-
 xen/arch/riscv/pt.c                      | 20 +++++++++++---------
 9 files changed, 54 insertions(+), 11 deletions(-)
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
index d882e0a059..62c5b7ba34 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -10,11 +10,15 @@ config RISCV
 config RISCV_64
 	def_bool y
 	select 64BIT
+	select HAS_SVPBMT
 
 config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config HAS_SVPBMT
+	bool
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
index bf8988f657..81b91b63d8 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -37,6 +37,16 @@
 #define PTE_ACCESSED                BIT(6, UL)
 #define PTE_DIRTY                   BIT(7, UL)
 #define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
+/*
+ * [62:61] Svpbmt Memory Type definitions:
+ *
+ *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
+ *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
+ *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
+ *  11 - Rsvd   Reserved for future standard use
+ */
+#define PTE_PMBT_NOCACHE            BIT(61, UL)
+#define PTE_PMBT_IO                 BIT(62, UL)
 
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
@@ -46,6 +56,15 @@
 #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+/*
+ * PAGE_HYPERVISOR_NOCACHE is used for ioremap().
+ *
+ * Both PTE_PMBT_IO and PTE_PMBT_NOCACHE are non-cacheable, but the difference
+ * is that IO is non-idempotent and strongly ordered, which makes it a good
+ * candidate for mapping IOMEM.
+ */
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PMBT_IO)
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PMBT_NOCACHE)
 
 /*
  * The PTE format does not contain the following bits within itself;
@@ -58,6 +77,8 @@
 
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
+#define PTE_PBMT_MASK   (PTE_PMBT_NOCACHE | PTE_PMBT_IO)
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
@@ -202,7 +223,7 @@ static inline pte_t read_pte(const pte_t *p)
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


