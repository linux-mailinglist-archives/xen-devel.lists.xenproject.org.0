Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE09A2CD8F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 21:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883918.1293752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgUdY-00008K-PC; Fri, 07 Feb 2025 20:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883918.1293752; Fri, 07 Feb 2025 20:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgUdY-00006L-Ma; Fri, 07 Feb 2025 20:07:40 +0000
Received: by outflank-mailman (input) for mailman id 883918;
 Fri, 07 Feb 2025 20:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgUdW-00006F-Lc
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 20:07:38 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c2376a4-e58f-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 21:07:35 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab77e266c71so302008666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 12:07:35 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab79c35f53csm22033066b.138.2025.02.07.12.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 12:07:33 -0800 (PST)
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
X-Inumbo-ID: 2c2376a4-e58f-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958855; x=1739563655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH4GpkHGKlMq+Me3rg/vBTsiY76xWNGmWhDsSXWvTqA=;
        b=Yg5LRFEt6GsuI0uK8e97C4iAUgGUp/DBBHJ7A7dYyuWTQ1U1GCAeQJZ0NDqcgImsud
         t5mt7bgHXnXuzYFajGp8juChCbYJOjCg74FAUHBmvgjOyNlG4ftdkFk3ES5iPPrZVAdl
         xYSJ4bkGvZ+CK6R4BduzZDPBwrkhcfpVpvFsvSEblQ/wU5e7jURBThvCnD9AlsntVkRX
         t2qi5w8oWGgpEOlHbQv8ZiUjN9UJoNlpDeVtPCpxJxFbFQsksPduf1GfuG2eOzebhooS
         gFERK9TGC1Kcy56To7x/+tc3r6RekNAUrDw9ZQwxoVxDDaMiNxDt4wvXQp9xCehpruJT
         6TqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958855; x=1739563655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZH4GpkHGKlMq+Me3rg/vBTsiY76xWNGmWhDsSXWvTqA=;
        b=omUS84toz30UDWcwnflQAF0qBYqOzGkQYi2nb3OOze9PHvgzaQyt2jZS4k+RZ3hn9W
         6yjo/NLSkvIiELQiwDwKwBZ0VeeLttCGjVa0bwFtC0r9DTQF6zk52XQUp8K/TSc7O26/
         +P8fYsLtS06aLLRmPlGO+eVy0JBCKXeDUlPyowotsKhDEBQCCRutQEhZKchmVyG0BGsG
         L7QUUuVQQXuyu5gbnxzwRL8h3qmF1jLaPUJk6aWYYJw4k+hUpvwQx2Cpj2OR7zdFvsQ4
         IRAtJPbLBu3GuxJ3f+4sNkKz9/Ag51nKqJYIqwNCwLILQFIy5jaw0CaWNilwXLohQvc4
         /oNQ==
X-Gm-Message-State: AOJu0YxZKBZrLCmAi/idlfuyp2uUT9fbkJsWhUbIJkcSuJfLc+c+9tcM
	KBaqRXs/WwNnOJJ1iUWa1MC8z4EJo7RSTJ93UqJuf4uFcu7nxh5XLJORQQ==
X-Gm-Gg: ASbGncvcv8U2G88361uQgFHpELx41Fd2156yElW/BleDwy36onF+CucZcpzc1fcJvwl
	cZHTNOR3TxY0bcERO9+CRiAZOLRKLXhefjLfzF9ls3zCHqnNAvlnsThj1ROLkBekRrpDnudobJ4
	Q2G9Wa0q6O4wvkGCwFEDc1zZY1PwGhXrDaq+tJssKtaLEk6p+3umQXAczoRirpwz/0j+0nCzA78
	Q9xpDtB4XYueaJyzmCcHhBIWwIRjt0/kyPOL2H407NfyjugNrCu/dJ7swybrvy98AEbtqAarfQi
	95rl91TTNWhK707Y
X-Google-Smtp-Source: AGHT+IHTOWvPYxVVD7RA5kSU8GgfImQ+exO1DDMzi846xSJXtrV5asejWWeeSAkByeMjX6jxa6cIxg==
X-Received: by 2002:a17:906:360a:b0:ab7:5c95:3a66 with SMTP id a640c23a62f3a-ab789cbe59bmr383639766b.40.1738958854265;
        Fri, 07 Feb 2025 12:07:34 -0800 (PST)
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
Subject: [PATCH for 4.21 v5] xen/riscv: identify specific ISA supported by cpu
Date: Fri,  7 Feb 2025 21:07:30 +0100
Message-ID: <39eacdb6312988fb746e3dff7e29db2f9fcef614.1738958635.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Supported ISA extensions are specified in the device tree within the CPU
node, using two properties: `riscv,isa-extensions` and `riscv,isa`.

Currently, Xen does not support the `riscv,isa-extensions` property and
will be added in the future.

The `riscv,isa` property is parsed for each CPU, and the common extensions
are stored in the `host_riscv_isa` bitmap.
This bitmap is then used by `riscv_isa_extension_available()` to check
if a specific extension is supported.

The current implementation is based on Linux kernel v6.12-rc3
implementation with the following changes:
 - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
   RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} because
   Xen is going to run on hardware produced after the aforementioned
   extensions were split out of "i".
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
 - Drop handling of uppercase letters of riscv,isa in riscv_isa_parse_string() as
   Xen checks that riscv,isa should be in lowercase according to the device tree
   bindings.
 - Update logic of riscv_isa_parse_string(): now it stops parsing of riscv,isa
   if illegal symbol was found instead of ignoring them.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
- Add IMAFD + zifencei extensions to required_extensions[] as we are using
  -maarch=rv64g* for compilation.
- Add "C" extension to required_extensions[] as if CONFIG_RISCV_ISA_C=y
  then -march will be = rv64gc*.
- Fix typos.
- s/strncmp/memcmp.
- Drop usage of ext_err and reuse ext_end instead.
- Drop tolower() functions as we guarante that riscv,isa will be in lower case.
- Declare req_extns_amount as const.
- Check what riscv_isa_parse_string() returns.
- Add check that Vendor extensions (case 'x') name is alnum.
- Return -EINVAL from riscv_isa_parse_string() if an extension has wrong name.
- Update logic of riscv_isa_parse_string(): now it stop parsing of riscv,isa
  if illegal symbol was found instead of ignoring them.
- Drop ASSERT ASSERT(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX)) as now
  riscv_isa_parse_string() has a check which guarantes that, at least, "rv{32,64}i"
  is in "riscv,isa" thereby this_isa can't be empty.
- Update the commit message.
---
Changes in V4:
- Add "Originally ... " at the start of cpufeature.c.
- Sync required_extensions[] with riscv_isa_ext[] in terms of element
  sorting/ordering.
- Fix identations.
- s/#error/# error.
- With insisting on ISA string being all lowercase, drop handling the
  uppercases in riscv_isa_parse_string().
- check riscv,isa recieved from device tree; it must be in lowercase.
- Update ASSERT() in match_isa_ext(): drop checking of riscv,isa recieved from
  device tree as this check was moved to riscv_fill_hwcap().
- Update is_lowercase_extension_name() to ignore digits as they could be used
  for extension version which is part of the extension name so should be
  skipped.
- Alight ternanry operator properly in riscv_fill_hwcap().
- Update the commit message: add information that handling of uppercase letters
  in riscv,isa are dropped in riscv_isa_parsing_string() becase Xen checks that
  riscv,isa must be all in lowercase according to device tree binding.
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
 xen/arch/riscv/cpufeature.c             | 494 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  57 +++
 xen/arch/riscv/setup.c                  |   3 +
 4 files changed, 555 insertions(+)
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
index 0000000000..e0117865b9
--- /dev/null
+++ b/xen/arch/riscv/cpufeature.c
@@ -0,0 +1,494 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Originally taken for Linux kernel v6.12-rc3.
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
+# error "cpufeature.c functions should be updated to support ACPI"
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
+     */
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
+    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
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
+    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
+    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
+    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
+    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
+    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+#ifdef CONFIG_RISCV_ISA_C
+    RISCV_ISA_EXT_DATA(c, RISCV_ISA_EXT_c),
+#endif
+    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
+    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
+    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+};
+
+static bool is_lowercase_extension_name(const char *str)
+{
+    /*
+     * `str` could contain full riscv,isa string from device tree so one
+     * of the stop conditions is checking for '_' as extensions are
+     * separated by '_'.
+     */
+    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
+        if ( !isdigit(str[i]) && !islower(str[i]) )
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
+         * `ext->name` (according to initialization of riscv_isa_ext[]
+         * elements) must be all in lowercase.
+         */
+        ASSERT(is_lowercase_extension_name(ext->name));
+
+        if ( (name_end - name == strlen(ext->name)) &&
+             !memcmp(name, ext->name, name_end - name) )
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
+# error "unsupported RISC-V bitness"
+#endif
+
+    /*
+     * In unpriv. specification (*_20240411) is mentioned the following:
+     * (1) A RISC-V ISA is defined as a base integer ISA, which must be
+     *     present in any implementation, plus optional extensions to
+     *     the base ISA.
+     * (2) Chapter 6 describes the RV32E and RV64E subset variants of
+     *     the RV32I or RV64I base instruction sets respectively, which
+     *     have been added to support small microcontrollers, and which
+     *     have half the number of integer registers.
+     *
+     * What means that isa should contain, at least, I or E.
+     *
+     * As Xen isn't expected to be run on microcontrollers and according
+     * to device tree binding the first extension should be "i".
+     */
+    if ( isa[4] != 'i' )
+        return -EINVAL;
+
+    isa += 4;
+
+    while ( *isa )
+    {
+        const char *ext = isa++;
+        const char *ext_end = isa;
+
+        switch ( *ext )
+        {
+        case 'x':
+            printk_once("Vendor extensions are ignored in riscv,isa\n");
+            /*
+             * To skip an extension, we find its end.
+             * As multi-letter extensions must be split from other multi-letter
+             * extensions with an "_", the end of a multi-letter extension will
+             * either be the null character or the "_" at the start of the next
+             * multi-letter extension.
+             */
+            for ( ; *isa && *isa != '_'; ++isa )
+                if ( unlikely(!isalnum(*isa)) )
+                    goto riscv_isa_parse_string_err;
+
+            ext_end = NULL;
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
+                ext_end = NULL;
+                break;
+            }
+            fallthrough;
+        case 'z':
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
+                    goto riscv_isa_parse_string_err;
+
+            ext_end = isa;
+
+            if ( !isdigit(ext_end[-1]) )
+                break;
+
+            while ( isdigit(*--ext_end) )
+                ;
+
+            if ( ext_end[0] != 'p' || !isdigit(ext_end[-1]) )
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
+                goto riscv_isa_parse_string_err;
+
+            if ( !isdigit(*isa) )
+                break;
+
+            while ( isdigit(*++isa) )
+                ;
+
+            if ( *isa != 'p' )
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
+        if ( unlikely(!ext_end) )
+            continue;
+
+        match_isa_ext(ext, ext_end, out_bitmap);
+    }
+
+    return 0;
+
+riscv_isa_parse_string_err:
+    printk("illegal symbol %c in riscv,isa string\n", *isa);
+    return -EINVAL;
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
+        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
+            if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
+                panic("According to DT binding riscv,isa must be lowercase\n");
+
+        if ( riscv_isa_parse_string(isa, this_isa) )
+            panic("Check riscv,isa in dts file\n");
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
+    const size_t req_extns_amount = ARRAY_SIZE(required_extensions);
+    bool all_extns_available = true;
+
+    riscv_fill_hwcap_from_isa_string();
+
+    if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
+    {
+        const char *failure_msg = has_isa_extensions_property() ?
+                                  "\"riscv,isa-extension\" isn't supported" :
+                                  "\"riscv,isa\" parsing failed";
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


