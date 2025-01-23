Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D74A1A5F9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 15:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876323.1286687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tayTk-0000JN-MI; Thu, 23 Jan 2025 14:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876323.1286687; Thu, 23 Jan 2025 14:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tayTk-0000Gt-Hh; Thu, 23 Jan 2025 14:46:44 +0000
Received: by outflank-mailman (input) for mailman id 876323;
 Thu, 23 Jan 2025 14:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GMDf=UP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tayTi-0000Gf-U0
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 14:46:43 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daeab873-d998-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 15:46:40 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28881d6so1522826a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 06:46:40 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab644adb658sm406169066b.134.2025.01.23.06.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 06:46:38 -0800 (PST)
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
X-Inumbo-ID: daeab873-d998-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737643599; x=1738248399; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apFL10DQbrX/XBE9G0QNbmvukb9vXVmmJc1QbPQYSQE=;
        b=juTyLPpcNW5qFcrJ2DvB26gc9fZuFWvh9cDoqZZoGdrP9j5K7Bi0N6yeXK9fvxQHeT
         bEfg5i4SmP2ILuP67UQw4dA8kGVY3nHJgG9Nyn5Bk577HPjRcZTqd/9SF0M2Bl6psiAa
         wiX8/TgEkhqLKfuN63ndNdaAl+XnEGQa7KRy75szgz6WHszf1o81pjNSi0YzMEGVkgFI
         3IZZsVRfBCguCx5sZjHxH7EmKF8/butVMA/KprxIFIAhDLUXHVdms/DQmPu4umel2UB5
         rkT1qdJUFaaMCzy3VjM4ozMmsGXJ0vt44I+7/IcMP1Q+k+xeajdAPOdV1aa/aCOo/C8S
         NfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737643599; x=1738248399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apFL10DQbrX/XBE9G0QNbmvukb9vXVmmJc1QbPQYSQE=;
        b=OT9YYuE6XqVjrYfeSFHAbZICNF7JLcb9rJNoUdibOg5Q+fC76iAHjWKkI1gMhDbmlF
         188PkRAaVgEq1GcKb7kOgyyV0uvwDguQdas/6WozYoajTiWSAwX3nK3YFBKlBYkFrYra
         4gTNEFfSxQXPyYM77mNLgKgwiC+29pQdFMWFfsGfToyyOQ+/TnB/QarBwBRlXAgXS5zs
         OZn+wl/or74S32rlQfUIpXs0xwY3vQmG3DuQFKzOk4vVGGZJZ8vd5+finSOGKL9EQ4dN
         DXfhSPyGWcmHForlMJBSrcywX5mid8b+SoggWrZTNp+I8gclgwn0R0El3VvJxSCwEH9d
         9phQ==
X-Gm-Message-State: AOJu0YxphXESBkrBk7wPrIrXa+vGElkGxYNLokvvbYsa/tjREP2bnUTS
	IghQ45VSqonllRFkLmIDkgaks8rkfMnliYNAscSP5LzXxCK/3tVUxzBHmw==
X-Gm-Gg: ASbGncvK0V489mc9qgv/Yr6MGI9DZmNgDz6kcIr3O+k2NCkM9Ha+x0PenjfI0aCt2vM
	ygcrRG+JktTAQRGCEVFnekb9AuFhfpFdnPW5QuwYc56TXgPBZLAsP2KYmly5JdC3hWl31J1/LTo
	58c0476dj/pisiR7/kzovpd03qpejI9A1FU+NZRwWjO0zOO3tMGgwfUchc9eQ9BtZDjcIeVh8qL
	LjBUmzEf+1OIz2e76NnqjcQq8luiYisbkaacWFtRe57B9zYa0GSUqfe1xhP92H2dp0/hey0IDqp
	bbABSQ==
X-Google-Smtp-Source: AGHT+IHCaHJz3C4KDH754WRtLVz12bQlQAQKyBJJnRgO1EvPyWOwvrk3Z1dV9imQEFocQKAejL4HQg==
X-Received: by 2002:a05:6402:34ca:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5db7d2dc58bmr56594097a12.1.1737643599105;
        Thu, 23 Jan 2025 06:46:39 -0800 (PST)
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
Subject: [PATCH v3] xen/riscv: identify specific ISA supported by cpu
Date: Thu, 23 Jan 2025 15:46:36 +0100
Message-ID: <ddf678bb829003b2c4a0a85166a29b61e75bcea9.1737643226.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Supported ISA extensions are specified in the device tree within the CPU
node, using two properties: `riscv,isa-extensions` and `riscv,isa`.

Currently, Xen does not support the `riscv,isa-extensions` property, as
all available device tree source (DTS) files in the Linux kernel (v6.12-rc3)
and DTBs generated by QEMU use only the `riscv,isa` property.
Therefore, only `riscv,isa` parsing is implemented.

The `riscv,isa` property is parsed for each CPU, and the common extensions
are stored in the `host_riscv_isa` bitmap.
This bitmap is then used by `riscv_isa_extension_available()` to check
if a specific extension is supported.

The current implementation is based on Linux kernel v6.12-rc3
implementation with the following changes:
 - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
   RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} as they
   are now part of the riscv,isa string.
 - Remove saving of the ISA for each CPU, only the common available ISA is
   saved.
 - Remove ACPI-related code as ACPI is not supported by Xen.
 - Drop handling of elf_hwcap, since Xen does not provide hwcap to
   userspace.
 - Replace of_cpu_device_node_get() API, which is not available in Xen,
   with a combination of dt_for_each_child_node(), dt_device_type_is_equal(),
   and dt_get_cpuid_from_node() to retrieve cpuid and riscv,isa in
   riscv_fill_hwcap_from_isa_string().
 - Rename arguments of __RISCV_ISA_EXT_DATA() from _name to ext_name, and
   _id to ext_id for clarity.
 - Replace instances of __RISCV_ISA_EXT_DATA with RISCV_ISA_EXT_DATA.
 - Replace instances of __riscv_isa_extension_available with
   riscv_isa_extension_available for consistency. Also, update the type of
   `bit` argument of riscv_isa_extension_available().
 - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
   as other fields are not used in Xen currently.
 - Add check of first 4 letters of riscv,isa string to
   riscv_isa_parse_string() as Xen doesn't do this check before so it is
   necessary to check correctness of riscv,isa string. ( it should start with
   rv{32,64} with taking into account upper and lower case of "rv").
 - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
   as it isn't used, at the moment.
 - Update the comment message about QEMU workaround.
 - Apply Xen coding style.
 - s/pr_info/printk.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
- Drop description of changes in cpufeature.c and leave only in the commit
  message to not deal with possible staleness of them in the future.
- Update for dt_get_cpuid_from_node():
  - update printk() message.
  - add some explanation about if-condition on the start of the function.
  - add dt_cpuid argument for function dt_get_cpuid_from_node() to deal
    with potential truncation issue from paddr_t (dt_read_paddr() returns
    that ) to int.
- Add Zicsr to required_extensions[].
- Drop an argument check at the start of is_lowercase_extension_name()
  as function is static and callers are expected to pass a good pointer.
- Add a comment with some additional explanation about the stop condition
  of checking a case of extension name.
- Omit blanks after opening and closing parentheses in the comments.
- Add missed parentheses in match_isa_ext().
- Drop ASSERT() which checks that first two letters of `isa` string are in
  lower case as after this ASSERT() there is an if-condition which does the
  same.
- Cut part of printk_once()'s message in riscv_isa_parse_string() related
  to riscv,isa-extension as it isn't supported for now and usage of it will
  lead to panic().
- Drop function riscv_fill_hwcap_from_ext_list() at all as Xen isn't going
  to support riscv,isa-extensions for now.
- Clarify printk()'s message when riscv,isa property wasn't found in cpu node.
  Now it contains "for DT's cpu%d node", where %d is cpuid, instead of
  "for cpu%d" to not confuse cpuid number ( if it Xen's cpu id and physical
  cpu's id).
- Updates in riscv_isa_extension_available():
  - Drop local varible `bmap` and initialize `isa_bitmap` in more readable way.
  - Rename argument `bit` of riscv_isa_extension_available() to `id` for
    clearness.
- Update handling of failure of h/w capabilities parsing in riscv_fill_hwcap().
- Introduce has_isa_extensions_property() to check if "riscv,isa-extension" is
  present in any device tree cpu node.
---
Changes in V2:
- Update the list of changes in comparison with Linux on the top of
  cpufeature.c.
- Now really drop all ACPI-related stuff.
  Add #ifdef CONFIG_ACPI #error ... #endif instead.
- Make `id` ( member of riscv_isa_ext_data structure ) not const.
- s/__read_mostly/__ro_after_init for riscv_isa bitmap.
- Update the comment above riscv_isa_ext[] declaration:
  - Drop Linux details.
  - Revised the numbering of the ordering rules for RISC-V ISA extensions.
  - Add comment that extension name must be all lowercase according to
    device tree binding.
- Add __initconst for declarations of riscv_isa_ext[] and
  required_extensions[].
- Move riscv_isa_ext_count for global declaration to match_isa_ext where
  it is really used.
- Add new function is_lowercase_extension_name().
- Updates for match_isa_ext():
  - Move last argument of match_isa_ext() to new line to not violate line
    length.
  - s/int/unsigned int for cycle varible `i`.
  - s/set_bit/__set_bit as no need for atomicity at this stage of boot.
  - Add ASSERT() to be sure that extension name is in lowercase.
  - s/strncasecmp/strncasecmp as extension name must be in a lowercase.
- Updates for riscv_isa_parse_string():
  - Move last argument of riscv_isa_parse_string() to new line to not violate
    line length.
  - Update the checks at the start of the function. Now if CONFIG_RISCV_32=y
    the only rv32 is accepted, or rv64 for CONFIG_RISCV_64=y.
  - Drop ACPI-related stuff.
  - Add blank lines between non-fall-through case blocks.
  - Add blanks in `for loops` before ')'.
  - Update the comment about QEMU workaround for invalid single-letter
    's' & 'u'.
- Updates for riscv_fill_hwcap_from_ext_list():
  - Drop initilizer of cpuid inside dt_for_each_child_node() {...}.
  - Introduce res and return it instead of -EINVAL.
  - Drop `else` and change printk("riscv,isa-extensions isnt supported\n")
    to panic("riscv,isa-extensions isnt supported\n").
  - Drop ( cpuid >= NR_CPUS ) check as cpuid technically could be any
    number. Only cpuid=0 is guaranteed to be.
- Updates for riscv_fill_hwcap_from_isa_string():
  - move cpuid and isa variables to dt_for_each_child_node() {...}.
  - Drop initilizer of cpuid inside dt_for_each_child_node() {...}.
  - Drop ( cpuid >= NR_CPUS ) check as cpuid technically could be any
    number. Only cpuid=0 is guaranteed to be.
  - Add ASSERT() to be sure that `this_isa` isn't null to prevent ending up
    with extensions not supported by one of the CPUs.
- Updates for riscv_isa_extension_available():
  - Code style fixes.
  - Drop conditional operator used in return as functions returns bool.
- s/extenstion/extensions, s/extenstion/extenstion.
- Drop RISCV_ISA_EXT_SxAIA as it isn't used.
- Move definitions of RISCV_ISA_EXT_{a,c,d,...,v} to enum riscv_isa_ext_id.
- Move macros RISCV_ISA_EXT_MAX to enum riscv_isa_ext_id.
- Update the comment above definition of RISCV_ISA_EXT_BASE.
- Fix code style ( violation of line length ) for
  riscv_isa_extension_available().
- Sync commit message with the comment on the start of cpufeature.c
---
 xen/arch/riscv/Makefile                 |   1 +
 xen/arch/riscv/cpufeature.c             | 482 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  57 +++
 xen/arch/riscv/setup.c                  |   3 +
 4 files changed, 543 insertions(+)
 create mode 100644 xen/arch/riscv/cpufeature.c
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index a5eb2aed4b..b0c8270a99 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,3 +1,4 @@
+obj-y += cpufeature.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += mm.o
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
new file mode 100644
index 0000000000..d4fa5a22a5
--- /dev/null
+++ b/xen/arch/riscv/cpufeature.c
@@ -0,0 +1,482 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Taken for Linux kernel v6.12-rc3.
+ *
+ * Copyright (C) 2015 ARM Ltd.
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2024 Vates
+ */
+
+#include <xen/bitmap.h>
+#include <xen/ctype.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sections.h>
+
+#include <asm/cpufeature.h>
+
+#ifdef CONFIG_ACPI
+#error "cpufeature.c functions should be updated to support ACPI"
+#endif
+
+struct riscv_isa_ext_data {
+    unsigned int id;
+    const char *name;
+};
+
+#define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
+{                                               \
+    .id = ext_id,                               \
+    .name = #ext_name,                          \
+}
+
+/* Host ISA bitmap */
+static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
+
+static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
+                                         unsigned long *dt_cpuid)
+{
+    const __be32 *prop;
+    unsigned int reg_len;
+
+    /*
+     * For debug purpose check dt_n_size_cells(cpu) value.
+     *
+     * Based on DT's bindings [1] and RISC-V's DTS files in kernel #size-cells
+     * for cpu node is expected to be 0.
+     *
+     * [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt
+     */
+    if ( dt_n_size_cells(cpu) != 0 )
+        printk("DT's cpu node `%s`: #size-cells %d\n",
+               dt_node_full_name(cpu), dt_n_size_cells(cpu));
+
+    prop = dt_get_property(cpu, "reg", &reg_len);
+    if ( !prop )
+    {
+        printk("cpu node `%s`: has no reg property\n", dt_node_full_name(cpu));
+        return -EINVAL;
+    }
+
+    if ( reg_len < dt_cells_to_size(dt_n_addr_cells(cpu)) )
+    {
+        printk("cpu node `%s`: reg property too short\n",
+               dt_node_full_name(cpu));
+        return -EINVAL;
+    }
+
+    /*
+     * It is safe to convert `paddr_t` to `unsigned long` as dt_read_paddr()
+     * in the context of this function returns cpuid which according to RISC-V
+     * specification could be from 0 to ((1ULL << (MXLEN)) - 1), where
+     * MXLEN=32 for RV32 and MXLEN=64 for RV64.
+    */
+    *dt_cpuid = dt_read_paddr(prop, dt_n_addr_cells(cpu));
+
+    return 0;
+}
+
+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * The specification uses vague wording, such as should, when it comes to
+ * ordering, so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other extensions by an
+ *    underscore.
+ *
+ * 2. Additional standard extensions (starting with 'Z') must be sorted after
+ *    single-letter extensions and before any higher-privileged extensions.
+ *
+ * 3. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they must be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 4. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 6. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
+ *
+ * Extension name must be all lowercase (according to device-tree binding)
+ * and strncmp() is used in match_isa_ext() to compare extension names instead
+ * of strncasecmp().
+ */
+const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
+    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+};
+
+static const struct riscv_isa_ext_data __initconst required_extensions[] = {
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+};
+
+static bool is_lowercase_extension_name(const char *str)
+{
+    /*
+     * `str` could contain full riscv,isa string from device tree so one
+     * of the stop condionitions is checking for '_' as extensions are
+     * separated by '_'.
+     */
+    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
+        if ( !islower(str[i]) )
+            return false;
+
+    return true;
+}
+
+static void __init match_isa_ext(const char *name, const char *name_end,
+                                 unsigned long *bitmap)
+{
+    const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
+
+    for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
+    {
+        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+
+        /*
+         * `name` (according to device tree binding) and
+         * `ext->name` (according to initialization of riscv_isa_ext[]
+         * elements) must be all in lowercase.
+         *
+         * Just to be sure that it is true, ASSERT() is added.
+         */
+        ASSERT(is_lowercase_extension_name(name) &&
+               is_lowercase_extension_name(ext->name));
+
+        if ( (name_end - name == strlen(ext->name)) &&
+             !strncmp(name, ext->name, name_end - name) )
+        {
+            __set_bit(ext->id, bitmap);
+            break;
+        }
+    }
+}
+
+static int __init riscv_isa_parse_string(const char *isa,
+                                         unsigned long *out_bitmap)
+{
+    if ( (isa[0] != 'r') && (isa[1] != 'v') )
+        return -EINVAL;
+
+#if defined(CONFIG_RISCV_32)
+    if ( isa[2] != '3' && isa[3] != '2' )
+        return -EINVAL;
+#elif defined(CONFIG_RISCV_64)
+    if ( isa[2] != '6' && isa[3] != '4' )
+        return -EINVAL;
+#else
+    #error "unsupported RISC-V bitness"
+#endif
+
+    isa += 4;
+
+    while ( *isa )
+    {
+        const char *ext = isa++;
+        const char *ext_end = isa;
+        bool ext_err = false;
+
+        switch ( *ext )
+        {
+        case 'x':
+        case 'X':
+            printk_once("Vendor extensions are ignored in riscv,isa\n");
+            /*
+             * To skip an extension, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             */
+            for ( ; *isa && *isa != '_'; ++isa )
+                ;
+            ext_err = true;
+            break;
+
+        case 's':
+            /*
+             * Workaround for invalid single-letter 's' & 'u' (QEMU):
+             *   Before QEMU 7.1 it was an issue with misa to ISA string
+             *   conversion:
+             *     https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
+             *   Additional details of the workaround on Linux kernel side:
+             *     https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
+             *
+             * No need to set the bit in riscv_isa as 's' & 'u' are
+             * not valid ISA extensions. It works unless the first
+             * multi-letter extension in the ISA string begins with
+             * "Su" and is not prefixed with an underscore.
+             */
+            if ( ext[-1] != '_' && ext[1] == 'u' )
+            {
+                ++isa;
+                ext_err = true;
+                break;
+            }
+            fallthrough;
+        case 'S':
+        case 'z':
+        case 'Z':
+            /*
+             * Before attempting to parse the extension itself, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             *
+             * Next, as the extensions version is currently ignored, we
+             * eliminate that portion. This is done by parsing backwards from
+             * the end of the extension, removing any numbers. This may be a
+             * major or minor number however, so the process is repeated if a
+             * minor number was found.
+             *
+             * ext_end is intended to represent the first character *after* the
+             * name portion of an extension, but will be decremented to the last
+             * character itself while eliminating the extensions version number.
+             * A simple re-increment solves this problem.
+             */
+            for ( ; *isa && *isa != '_'; ++isa )
+                if ( unlikely(!isalnum(*isa)) )
+                    ext_err = true;
+
+            ext_end = isa;
+            if ( unlikely(ext_err) )
+                break;
+
+            if ( !isdigit(ext_end[-1]) )
+                break;
+
+            while ( isdigit(*--ext_end) )
+                ;
+
+            if ( tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1]) )
+            {
+                ++ext_end;
+                break;
+            }
+
+            while ( isdigit(*--ext_end) )
+                ;
+
+            ++ext_end;
+            break;
+
+        default:
+            /*
+             * Things are a little easier for single-letter extensions, as they
+             * are parsed forwards.
+             *
+             * After checking that our starting position is valid, we need to
+             * ensure that, when isa was incremented at the start of the loop,
+             * that it arrived at the start of the next extension.
+             *
+             * If we are already on a non-digit, there is nothing to do. Either
+             * we have a multi-letter extension's _, or the start of an
+             * extension.
+             *
+             * Otherwise we have found the current extension's major version
+             * number. Parse past it, and a subsequent p/minor version number
+             * if present. The `p` extension must not appear immediately after
+             * a number, so there is no fear of missing it.
+             */
+            if ( unlikely(!isalpha(*ext)) )
+            {
+                ext_err = true;
+                break;
+            }
+
+            if ( !isdigit(*isa) )
+                break;
+
+            while ( isdigit(*++isa) )
+                ;
+
+            if ( tolower(*isa) != 'p' )
+                break;
+
+            if ( !isdigit(*++isa) )
+            {
+                --isa;
+                break;
+            }
+
+            while ( isdigit(*++isa) )
+                ;
+
+            break;
+        }
+
+        /*
+         * The parser expects that at the start of an iteration isa points to the
+         * first character of the next extension. As we stop parsing an extension
+         * on meeting a non-alphanumeric character, an extra increment is needed
+         * where the succeeding extension is a multi-letter prefixed with an "_".
+         */
+        if ( *isa == '_' )
+            ++isa;
+
+        if ( unlikely(ext_err) )
+            continue;
+
+        match_isa_ext(ext, ext_end, out_bitmap);
+    }
+
+    return 0;
+}
+
+static void __init riscv_fill_hwcap_from_isa_string(void)
+{
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    const struct dt_device_node *cpu;
+
+    if ( !cpus )
+    {
+        printk("Missing /cpus node in the device tree?\n");
+        return;
+    }
+
+    dt_for_each_child_node(cpus, cpu)
+    {
+        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+        const char *isa;
+        unsigned long cpuid;
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
+            continue;
+
+        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
+        {
+            printk("Unable to find \"riscv,isa\" devicetree entry "
+                   "for DT's cpu%ld node\n", cpuid);
+            continue;
+        }
+
+        riscv_isa_parse_string(isa, this_isa);
+
+        /*
+         * In the unpriv. spec is mentioned:
+         *   A RISC-V ISA is defined as a base integer ISA, which must be
+         *   present in any implementation, plus optional extensions to
+         *   the base ISA.
+         * What means that isa should contain, at least, I or E thereby
+         * this_isa can't be empty too.
+         *
+         * Ensure that this_isa is not empty, so riscv_isa won't be empty
+         * during initialization. This prevents ending up with extensions
+         * not supported by one of the CPUs.
+         */
+        ASSERT(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX));
+
+        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
+            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+        else
+            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+    }
+}
+
+static bool __init has_isa_extensions_property(void)
+{
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    const struct dt_device_node *cpu;
+
+    if ( !cpus )
+    {
+        printk("Missing /cpus node in the device tree?\n");
+        return false;
+    }
+
+    dt_for_each_child_node(cpus, cpu)
+    {
+        const char *isa;
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
+            continue;
+
+        return true;
+    }
+
+    return false;
+}
+
+bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
+                                   enum riscv_isa_ext_id id)
+{
+    if ( !isa_bitmap )
+        isa_bitmap = riscv_isa;
+
+    if ( id >= RISCV_ISA_EXT_MAX )
+        return false;
+
+    return test_bit(id, isa_bitmap);
+}
+
+void __init riscv_fill_hwcap(void)
+{
+    unsigned int i;
+    size_t req_extns_amount = ARRAY_SIZE(required_extensions);
+    bool all_extns_available = true;
+
+    riscv_fill_hwcap_from_isa_string();
+
+    if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
+    {
+        const char *failure_msg = has_isa_extensions_property() ?
+                                    "\"riscv,isa-extension\" isn't supported" :
+                                    "\"riscv,isa\" parsing failed";
+
+        panic("HW capabilities parsing failed: %s\n", failure_msg);
+    }
+
+    for ( i = 0; i < req_extns_amount; i++ )
+    {
+        const struct riscv_isa_ext_data ext = required_extensions[i];
+
+        if ( !riscv_isa_extension_available(NULL, ext.id) )
+        {
+            printk("Xen requires extension: %s\n", ext.name);
+            all_extns_available = false;
+        }
+    }
+
+    if ( !all_extns_available )
+        panic("Look why the extensions above are needed in "
+              "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
+}
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 0000000000..f5bb612146
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ASM__RISCV__CPUFEATURE_H
+#define ASM__RISCV__CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+#include <xen/stdbool.h>
+
+/*
+ * These macros represent the logical IDs of each multi-letter RISC-V ISA
+ * extension and are used in the ISA bitmap. The logical IDs start from
+ * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
+ * letter extensions and are used in enum riscv_isa_ext_id.
+ *
+ * New extensions should just be added to the bottom, rather than added
+ * alphabetically, in order to avoid unnecessary shuffling.
+ */
+#define RISCV_ISA_EXT_BASE  26
+
+enum riscv_isa_ext_id {
+    RISCV_ISA_EXT_a,
+    RISCV_ISA_EXT_c,
+    RISCV_ISA_EXT_d,
+    RISCV_ISA_EXT_f,
+    RISCV_ISA_EXT_h,
+    RISCV_ISA_EXT_i,
+    RISCV_ISA_EXT_m,
+    RISCV_ISA_EXT_q,
+    RISCV_ISA_EXT_v,
+    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
+    RISCV_ISA_EXT_ZICSR,
+    RISCV_ISA_EXT_ZIFENCEI,
+    RISCV_ISA_EXT_ZIHINTPAUSE,
+    RISCV_ISA_EXT_ZIHPM,
+    RISCV_ISA_EXT_ZBB,
+    RISCV_ISA_EXT_SMAIA,
+    RISCV_ISA_EXT_SSAIA,
+    RISCV_ISA_EXT_MAX
+};
+
+void riscv_fill_hwcap(void);
+
+bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
+                                   enum riscv_isa_ext_id id);
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* ASM__RISCV__CPUFEATURE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 38ca4f3baa..380461a054 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -13,6 +13,7 @@
 
 #include <public/version.h>
 
+#include <asm/cpufeature.h>
 #include <asm/early_printk.h>
 #include <asm/fixmap.h>
 #include <asm/sbi.h>
@@ -121,6 +122,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
         panic("Booting using ACPI isn't supported\n");
     }
 
+    riscv_fill_hwcap();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.48.1


