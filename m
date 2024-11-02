Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8FB9BA1B1
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 18:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829559.1244558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HtG-0005CK-FN; Sat, 02 Nov 2024 17:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829559.1244558; Sat, 02 Nov 2024 17:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7HtG-0005A0-AY; Sat, 02 Nov 2024 17:26:22 +0000
Received: by outflank-mailman (input) for mailman id 829559;
 Sat, 02 Nov 2024 17:26:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RajI=R5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t7HtF-0004r4-7a
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 17:26:21 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ef6b234-993f-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 18:26:14 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730568360842714.6163680866581;
 Sat, 2 Nov 2024 10:26:00 -0700 (PDT)
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
X-Inumbo-ID: 8ef6b234-993f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhlZjZiMjM0LTk5M2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTY4Mzc1LjA0MDUwMSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730568367; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gOXvqeIJINXmDJf/CC0P5TlgB3n0EUwvGeb85hEV3ewSRZFI1GOG1Kv0dEwF4cw3zEjQC0aO2A1bJe4YcKq7pBRlyywkOMvGNym+OwxYxllX+4fcfptq1HDgUUoL0hFhW0vc5xgwh8F6CsdLZtNoP5MEPj+OKExfrAUQjX6VDPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730568367; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gr0Bo47Cp6rQWLc3HgBA4fLt5SBG4Kw79tWuOGibWjw=; 
	b=YEHhRXWhPRKmxq7TQtkZ+2NLoZaFumFTmmeQ137suNCGxKEPtACcFjD81jKRKwYwiwMrWuc/DIAlfmsAzMo50Gx0til4OmfzmjCFJZVCRIEzq6AoVPUhP42On9AlUbS9myf4F3ho0Q28wGN21+qMbQAPdMJ9OkNoHpwp5zHhlZg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730568367;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=Gr0Bo47Cp6rQWLc3HgBA4fLt5SBG4Kw79tWuOGibWjw=;
	b=RSOHPynlurMFkn2C/yLIJc7VqCGWAZbSj0T8VUjlBC1zsODpkFSCXw4fA1BkvS5g
	KlAsWOBO82LVMkBk5FtJai825y1aPt9oiDzPk520On/6eE9gd/nF7OHrI8jLmIoqEc9
	gT1DaT+I26byylqYUu8mQ1JaGDCURtkPG/WQGbcM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 01/12] x86/boot: introduce boot module types
Date: Sat,  2 Nov 2024 13:25:40 -0400
Message-Id: <20241102172551.17233-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241102172551.17233-1-dpsmith@apertussolutions.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces module types for the types of boot modules that may be
passed to Xen. These include xen, kernel, ramdisk, microcode, and xsm policy.
This reduces the need for hard coded order assumptions and global variables to
be used by consumers of boot modules, such as domain construction.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v7:
- merged the addition of microcode and xsm boot mod types

Changes since v5:
- added guard around initrd type assignment
- removed a missed rebase artifact
---
 xen/arch/x86/cpu/microcode/core.c   |  1 +
 xen/arch/x86/include/asm/bootinfo.h | 12 ++++++++++++
 xen/arch/x86/setup.c                |  4 ++++
 xen/xsm/xsm_policy.c                |  1 +
 4 files changed, 18 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1fa6cbf3d364..f46464241557 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -845,6 +845,7 @@ static int __init early_microcode_load(struct boot_info *bi)
             printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
             return -ENODEV;
         }
+        bi->mods[idx].type = BOOTMOD_MICROCODE;
 
         size = bi->mods[idx].mod->mod_end;
         data = bootstrap_map_bm(&bi->mods[idx]);
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 6237da7e4d86..fc74e3b224e7 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -14,9 +14,21 @@
 /* Max number of boot modules a bootloader can provide in addition to Xen */
 #define MAX_NR_BOOTMODS 63
 
+/* Boot module binary type / purpose */
+enum bootmod_type {
+    BOOTMOD_UNKNOWN,
+    BOOTMOD_XEN,
+    BOOTMOD_KERNEL,
+    BOOTMOD_RAMDISK,
+    BOOTMOD_MICROCODE,
+    BOOTMOD_XSM_POLICY,
+};
+
 struct boot_module {
     /* Transitionary only */
     module_t *mod;
+
+    enum bootmod_type type;
 };
 
 /*
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 5db57e1b1af2..fac08b6242e9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -316,6 +316,7 @@ static struct boot_info *__init multiboot_fill_boot_info(
 
     /* Variable 'i' should be one entry past the last module. */
     bi->mods[i].mod = &mods[bi->nr_modules];
+    bi->mods[i].type = BOOTMOD_XEN;
 
     return bi;
 }
@@ -1217,6 +1218,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     bitmap_fill(module_map, bi->nr_modules);
     __clear_bit(0, module_map); /* Dom0 kernel is always first */
+    bi->mods[0].type = BOOTMOD_KERNEL;
 
     if ( pvh_boot )
     {
@@ -2097,6 +2099,8 @@ void asmlinkage __init noreturn __start_xen(void)
            cpu_has_nx ? "" : "not ");
 
     initrdidx = find_first_bit(module_map, bi->nr_modules);
+    if ( initrdidx < bi->nr_modules )
+        bi->mods[initrdidx].type = BOOTMOD_RAMDISK;
     if ( bitmap_weight(module_map, bi->nr_modules) > 1 )
         printk(XENLOG_WARNING
                "Multiple initrd candidates, picking module #%u\n",
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 35f36c6f2359..4c195411d05b 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -59,6 +59,7 @@ int __init xsm_multiboot_policy_init(
                    _policy_len,_policy_start);
 
             __clear_bit(i, bi->module_map);
+            bi->mods[i].type = BOOTMOD_XSM_POLICY;
             break;
 
         }
-- 
2.30.2


