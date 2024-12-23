Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D43E9FAE7A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 13:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862893.1274424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPhyP-00029f-Ko; Mon, 23 Dec 2024 12:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862893.1274424; Mon, 23 Dec 2024 12:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPhyP-00026i-HI; Mon, 23 Dec 2024 12:55:49 +0000
Received: by outflank-mailman (input) for mailman id 862893;
 Mon, 23 Dec 2024 12:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4VI=TQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tPhyO-00026c-3I
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 12:55:48 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 390d6f79-c12d-11ef-99a3-01e77a169b0f;
 Mon, 23 Dec 2024 13:55:44 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so4657849e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Dec 2024 04:55:44 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832050sm1270484e87.250.2024.12.23.04.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 04:55:43 -0800 (PST)
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
X-Inumbo-ID: 390d6f79-c12d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734958544; x=1735563344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ/SnCbPbyKZZ+KRzbtTea38a8WUua4XwqRZo6AEYwA=;
        b=QwGSg+Rbhb2JR1qKjuWA90t0YKVC8DbwrbJmdi2kSkzFWZ/J55JElvcq78/V3fAZ6P
         Qg+Y9HzZZ6R3Q4X3lIDRNYFtCWEzHlTW04XeVcepvv7TeGMgnfvCC9BTNVKpL5Aonj8W
         m/y/nJLWqStRTCbmsTaZXbIz1PAIkjyPFQYAuUWvi9ARJOyjrOMOdxZTpjklLlUYzQrO
         SzT+Z6ZDB3398FJGiqqbIRhWnqBnqPq1iUmy7J6NU3ooMkHXpdI+W0yWHa4VPlXDPPLG
         RCbdc7sjUH+EoB9bYGPfU52+NUt6C3yW+GsuXWKq2Neh2q+ui6oAExeYP4u41/SMvfb4
         gxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734958544; x=1735563344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ/SnCbPbyKZZ+KRzbtTea38a8WUua4XwqRZo6AEYwA=;
        b=F5XrueiF+NoW4TdLHLrv7uWvepq4NZCaPLabVgPp8oCM+TeUqSer/ovndEZfHjYKPx
         4QIs21p0DbH/ustQBm5pjf+HJrhot0ikJI6nZUWJ7py8I0Zuz9AD7lQUYarxb4ChWQ6Z
         lsL3aRVu+dvJHp9NvitWHqF/EfUYqYY215g0aoY7zm8wW/pLcyQqf+0+8gpiCh151ryO
         Ilz85cfZ1SU8HSSzTQ9295vV4sYi06f1vi9wQfDfvIHT9/cPYddk0RqRV/1ccVoJ/ovp
         BnYThA3Y1+s+Txvwjb86GmULB0dp26QN94tW532n0/PwRHKd6VzYzJ6FvEfsXC0eZ/8l
         aARw==
X-Gm-Message-State: AOJu0Yy2o0MiVpqFJGMLBBJMx5+0WMQfpbGTPsNuMtcsEN+C39F9Uqz3
	YjqdPrZ4joU931XhR/wgY2DLWUUAyU+IfziZAOAlSkq+G7WDxx6ffr0ezhu7
X-Gm-Gg: ASbGncug93gV2dR5R7fsDO5kHXiMIkYmSLgxmbANlqO+b5J1PN23dPHwUIwhALVcMng
	aIpt3vDKdiUMVnKcJ2gEZihic99NJyEdcE3E0/7+ksswFGoStLp8SQJqKLHvxtNZ07+2r1cuENW
	gQ5fCR/1R0ULBCtiOP0ofGSHdmGovjlSH1RNWabixY+OR81KXMl+OjNxIntfSQGpJZdKpkOxRCe
	YbZXp3N4WsKRG8FQNn3yZYBJWBrq3AunwKu9QTlHxSKkIIwMzpwetxsoA==
X-Google-Smtp-Source: AGHT+IH1aKOh0uD1a1RooaRNTaGqLpVpvq2yb99DULlhH0EspzRb8TXcRlPHml5Jf5qN3VALsf7PIg==
X-Received: by 2002:a05:6512:6709:b0:542:297f:4f67 with SMTP id 2adb3069b0e04-542297f4f9amr2819474e87.0.1734958543526;
        Mon, 23 Dec 2024 04:55:43 -0800 (PST)
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
Subject: [PATCH for 4.21 v1 1/1] xen/riscv: identify specific ISA supported by cpu
Date: Mon, 23 Dec 2024 13:55:40 +0100
Message-ID: <ee14c485c6c6402a2d1706278b21bf3fcf821af9.1734957957.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734957957.git.oleksii.kurochko@gmail.com>
References: <cover.1734957957.git.oleksii.kurochko@gmail.com>
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
   riscv_isa_extension_available for consistency.
 - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
   as other fields are not used in Xen currently.
 - Add check of first 4 letters of riscv,isa string to
   riscv_isa_parse_string() as Xen doesn't do this check before so it is
   necessary to check correctness of riscv,isa string. ( it should start with
   rv{32,64} with taking into account upper and lower case of "rv").
 - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
   as it isn't used, at the moment.
 - Apply Xen coding style.
 - s/pr_info/printk.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile                 |   1 +
 xen/arch/riscv/cpufeature.c             | 466 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  63 ++++
 xen/arch/riscv/setup.c                  |   3 +
 4 files changed, 533 insertions(+)
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
index 0000000000..52ec05bd03
--- /dev/null
+++ b/xen/arch/riscv/cpufeature.c
@@ -0,0 +1,466 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Taken for Linux kernel v6.12-rc3 and modified by
+ * Oleksii Kurochko <oleksii.kurochko@gmail.com>:
+ *
+ * - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
+ *   RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} as they
+ *   are now part of the riscv,isa string.
+ * - Remove saving of the ISA for each CPU, only the common available ISA is
+ *   saved.
+ * - Remove ACPI-related code as ACPI is not supported by Xen.
+ * - Drop handling of elf_hwcap, since Xen does not provide hwcap to
+ *   userspace.
+ * - Replace of_cpu_device_node_get() API, which is not available in Xen,
+ *   with a combination of dt_for_each_child_node(), dt_device_type_is_equal(),
+ *   and dt_get_cpuid_from_node() to retrieve cpuid and riscv,isa in
+ *   riscv_fill_hwcap_from_isa_string().
+ * - Rename arguments of __RISCV_ISA_EXT_DATA() from _name to ext_name, and
+ *   _id to ext_id for clarity.
+ * - Replace instances of __RISCV_ISA_EXT_DATA with RISCV_ISA_EXT_DATA.
+ * - Replace instances of __riscv_isa_extension_available with
+ *   riscv_isa_extension_available for consistency.
+ * - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
+ *   as other fields are not used in Xen currently.
+ * - Add check of first 4 letters of riscv,isa string to
+ *   riscv_isa_parse_string() as Xen doesn't do this check before so it is
+ *   necessary to check correctness of riscv,isa string. ( it should start with
+ *   rv{32,64} with taking into account upper and lower case of "rv").
+ * - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
+ *   as it isn't used, at the moment.
+ * - s/pr_info/printk.
+ * - Apply Xen coding style.
+ *
+ * Copyright (C) 2015 ARM Ltd.
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2024 Vates
+ */
+
+#include <xen/acpi.h>
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
+struct riscv_isa_ext_data {
+    const unsigned int id;
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
+static __read_mostly DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
+
+static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu)
+{
+    const __be32 *prop;
+    unsigned int reg_len;
+
+    if ( dt_n_size_cells(cpu) != 0 )
+        printk("cpu node `%s`: #size-cells %d\n",
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
+    return dt_read_paddr(prop, dt_n_addr_cells(cpu));
+}
+
+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * Ordinarily, for in-kernel data structures, this order is unimportant but
+ * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
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
+ * 3. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 5. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
+ */
+const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
+static const struct riscv_isa_ext_data required_extensions[] = {
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+};
+
+static const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
+
+static void __init match_isa_ext(const char *name, const char *name_end, unsigned long *bitmap)
+{
+    for ( int i = 0; i < riscv_isa_ext_count; i++ )
+    {
+        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+
+        if ( (name_end - name == strlen(ext->name)) &&
+             !strncasecmp(name, ext->name, name_end - name) )
+        {
+            set_bit(ext->id, bitmap);
+            break;
+        }
+    }
+}
+
+static int __init riscv_isa_parse_string(const char *isa, unsigned long *out_bitmap)
+{
+    if ( isa[0] != 'r' && isa[0] != 'R' )
+        return -EINVAL;
+
+    if ( isa[1] != 'v' && isa[1] != 'V' )
+        return -EINVAL;
+
+    if ( isa[2] != '3' && isa[3] != '2' &&
+         isa[2] != '6' && isa[3] != '4' )
+        return -EINVAL;
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
+            if ( acpi_disabled )
+                printk_once("Vendor extensions are ignored in riscv,isa."
+                            "Use riscv,isa-extensions instead\n");
+            /*
+             * To skip an extension, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             */
+            for ( ; *isa && *isa != '_'; ++isa)
+                ;
+            ext_err = true;
+            break;
+        case 's':
+            /*
+             * Workaround for invalid single-letter 's' & 'u' (QEMU).
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
+            for ( ; *isa && *isa != '_'; ++isa)
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
+static int __init riscv_fill_hwcap_from_ext_list(void)
+{
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    const struct dt_device_node *cpu;
+
+    if ( !cpus )
+    {
+        printk("Missing /cpus node in the device tree?\n");
+        return -EINVAL;
+    }
+
+    dt_for_each_child_node(cpus, cpu)
+    {
+        const char *isa;
+        int cpuid = 0;
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        cpuid = dt_get_cpuid_from_node(cpu);
+        if ( cpuid < 0 )
+            continue;
+
+        if ( cpuid >= NR_CPUS )
+        {
+            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);
+            continue;
+        }
+
+        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
+        {
+            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
+                   "for cpu%d\n", cpuid);
+            continue;
+        }
+        else
+            printk("riscv,isa-extensions isnt supported\n");
+    }
+
+    return -EOPNOTSUPP;
+}
+
+static void __init riscv_fill_hwcap_from_isa_string(void)
+{
+    const char *isa;
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    const struct dt_device_node *cpu;
+    int cpuid = 0;
+
+    if ( !acpi_disabled )
+        panic("%s should be updated correspondingly to support ACPI\n", __func__);
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
+
+        if ( !dt_device_type_is_equal(cpu, "cpu") )
+            continue;
+
+        cpuid = dt_get_cpuid_from_node(cpu);
+        if ( cpuid < 0 )
+            continue;
+
+        if ( cpuid >= NR_CPUS )
+        {
+            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);
+            continue;
+        }
+
+        if ( acpi_disabled )
+        {
+            if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
+            {
+                printk("Unable to find \"riscv,isa\" devicetree entry\n");
+                continue;
+            }
+        } else
+            panic("there is no support for ACPI\n");
+
+        riscv_isa_parse_string(isa, this_isa);
+
+        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
+            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+        else
+            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+    }
+}
+
+bool riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
+{
+    const unsigned long *bmap = (isa_bitmap) ? isa_bitmap : riscv_isa;
+
+    if (bit >= RISCV_ISA_EXT_MAX)
+        return false;
+
+    return test_bit(bit, bmap) ? true : false;
+}
+
+void __init riscv_fill_hwcap(void)
+{
+    unsigned int i;
+    size_t req_extns_amount = ARRAY_SIZE(required_extensions);
+    bool all_extns_available = true;
+
+    if ( !acpi_disabled )
+        riscv_fill_hwcap_from_isa_string();
+    else {
+        int ret = riscv_fill_hwcap_from_ext_list();
+
+        if ( ret )
+        {
+            printk("Falling back to deprecated \"riscv,isa\"\n");
+            riscv_fill_hwcap_from_isa_string();
+        }
+    }
+
+    for ( i = 0; i < req_extns_amount; i++ )
+    {
+        const struct riscv_isa_ext_data ext = required_extensions[i];
+
+        if ( !riscv_isa_extension_available(NULL, ext.id) )
+        {
+            printk("Xen requires extenstion: %s\n", ext.name);
+            all_extns_available = false;
+        }
+    }
+
+    if ( !all_extns_available )
+        panic("Look why the extenstions above are needed in booting.txt\n");
+}
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 0000000000..9b2ed1e914
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef ASM__RISCV__CPUFEATURE_H
+#define ASM__RISCV__CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+#define RISCV_ISA_EXT_a     ('a' - 'a')
+#define RISCV_ISA_EXT_c     ('c' - 'a')
+#define RISCV_ISA_EXT_d     ('d' - 'a')
+#define RISCV_ISA_EXT_f     ('f' - 'a')
+#define RISCV_ISA_EXT_h     ('h' - 'a')
+#define RISCV_ISA_EXT_i     ('i' - 'a')
+#define RISCV_ISA_EXT_m     ('m' - 'a')
+#define RISCV_ISA_EXT_q     ('q' - 'a')
+#define RISCV_ISA_EXT_v     ('v' - 'a')
+
+/*
+ * Increse this to higher value as kernel support more ISA extensions.
+ */
+#define RISCV_ISA_EXT_MAX   128
+
+#define RISCV_ISA_EXT_SxAIA     RISCV_ISA_EXT_SSAIA
+
+/*
+ * These macros represent the logical IDs of each multi-letter RISC-V ISA
+ * extension and are used in the ISA bitmap. The logical IDs start from
+ * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
+ * letter extensions. The maximum, RISCV_ISA_EXT_MAX, is defined in order
+ * to allocate the bitmap and may be increased when necessary.
+ *
+ * New extensions should just be added to the bottom, rather than added
+ * alphabetically, in order to avoid unnecessary shuffling.
+ */
+#define RISCV_ISA_EXT_BASE  26
+
+enum riscv_isa_ext_id {
+    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
+    RISCV_ISA_EXT_ZICSR,
+    RISCV_ISA_EXT_ZIFENCEI,
+    RISCV_ISA_EXT_ZIHINTPAUSE,
+    RISCV_ISA_EXT_ZIHPM,
+    RISCV_ISA_EXT_ZBB,
+    RISCV_ISA_EXT_SMAIA,
+    RISCV_ISA_EXT_SSAIA,
+    RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
+};
+
+void riscv_fill_hwcap(void);
+
+bool riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
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
2.47.1


