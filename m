Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E879ED36A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855083.1268176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVL-0000TB-06; Wed, 11 Dec 2024 17:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855083.1268176; Wed, 11 Dec 2024 17:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVK-0000OE-Po; Wed, 11 Dec 2024 17:28:06 +0000
Received: by outflank-mailman (input) for mailman id 855083;
 Wed, 11 Dec 2024 17:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVJ-0007J6-Gk
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:28:05 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4722f73b-b7e5-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 18:28:04 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso1396545366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:28:04 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:28:02 -0800 (PST)
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
X-Inumbo-ID: 4722f73b-b7e5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938083; x=1734542883; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVUeGYT1/F6OE3Cc8TjMGFB+HbFqEqO/qxv449JXpGc=;
        b=HCWkt8Ic8xaYwSk49tmcqrKvGfvT2dO4IUidbkqpU3s6I4vfcTAi1Bq67ITpfKa/4E
         BjIKQQUmXeEE86MJ+iWnkJxX+kfSl9LDWfvyrUgp89EPZHP2GpS3vg3UN7uqG9Lv+K3m
         ctVDK1KKpIC9eT63F0PsPLbfKzXKUKgjK3gJmFqMonf9kD7QLRWbcwQ71njFeQxYaDbO
         uDT4nN/qc7/zc2tfStBK5x2B4q/iwr7AZibT47U5QdGikBwH/2UpiglEipj5z+Re2phJ
         3yaYt3CXrxiDbmY+srWQaaKIhCOj5LZ+CEsAlpCfJd2EQfSvZrbzcDokpmriLkxOcrui
         k1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938083; x=1734542883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVUeGYT1/F6OE3Cc8TjMGFB+HbFqEqO/qxv449JXpGc=;
        b=LeoXpqqSd+zlLogdX8nLJS9WS4C1V1liX/KcYz6WMQLZBAWC/ZcZnTAYLlMoejl5s1
         hTr46quNkqGfwQ5wNppqXrMLBsvA2OG2HdvqJerCCZ9icN8C1TuVdBicPT0eVZbc3kEY
         UwdCz3EkgLJqVE2I8ONjKkA1xLi2jd1qgyfeTp3aU8kMEWUuQ0tMpdrvCiiPfE0dLZyd
         dLxMUR+Zzvtnj2E55oDITUx6vCtlKhO+jzrGkspnHubCr+E7SFi66637yWKBlsE+VKE9
         Wgrr1Ubty2WGJaaCxp//vjiBDeGhCR2yfwKljUn6gCOzGu88huY4lB8ncEC8ESIrkgnE
         t3Yw==
X-Gm-Message-State: AOJu0YwNbd2+5YQHJoH3OB27Fg5QZgqspm500t5ZQDFdFoBlqR7fs/WT
	2VqsVDhhcsgcUe3QTx4pU/LlIiUI4cKLYf9Fub3pF75T/LdgqG7aslDYPfJk
X-Gm-Gg: ASbGncscme+breO1q1yUtCmQok2Tsd8QVrDQu4WvfJ2fhoMC5a3rqOO/iPFp+IAw+EO
	w42vuRZGLQ2ofxRSCvjQ8KkhZwJzvu9//4sIk+VApOBpEGHuZRrxbz7wNJnCRebPzpUIb/yl3sF
	Rvrc4dwio3bn2/AOHInZ/8lCAsNwx00xDm0xi5vWgzBCB1hJ3XrmYU5uIyen3er2He+VBmboa6A
	lLLiw/nGbykaINFkljJ+q5qTMd4jqvpF2wChD5SDao2Z3/ihvvTlt8=
X-Google-Smtp-Source: AGHT+IHk81CkV2ksl1MLimg86CXEDzadwLfuTlvYafnNlthU8knKAYe1HaxlGYqoNPeORU4oJS52nA==
X-Received: by 2002:a17:906:3299:b0:aa6:6510:f27e with SMTP id a640c23a62f3a-aa6b115bc46mr379902766b.14.1733938082630;
        Wed, 11 Dec 2024 09:28:02 -0800 (PST)
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
Subject: [PATCH v2 7/7] xen/riscv: relocating and unflattening host device tree
Date: Wed, 11 Dec 2024 18:27:51 +0100
Message-ID: <8906108d2e29637a42d5e127e393337d6b259b30.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733937787.git.oleksii.kurochko@gmail.com>
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce relocate_fdt() and call it to relocate FDT to Xen heap
instead of using early mapping as it is expected that discard_initial_modules()
( is supposed to call in the future ) discards the FDT boot module and
remove_early_mappings() destroys the early mapping.

Unflatten a device tree, creating the tree of struct device_node.
It also fills the "name" and "type" pointers of the nodes so the normal
device-tree walking functions can be used.

Set device_tree_flattened to NULL in the case when acpi_disabled is
equal to false.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Move introduction of relocate_fdt() to the current patch with the following
   change:
    - use xvmalloc() instead of xmalloc_bytes() in relocate_fdt();
 - Drop the check of returned fdt_size from boot_fdt_info() to be in sync
   with Arm and boot_fdt_info() will panic anyway if something wrong with
   DTB.
 - Update the commit message.
---
 xen/arch/riscv/setup.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index bea3f27c4d..fb6bbba684 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/bootfdt.h>
 #include <xen/compile.h>
@@ -8,6 +9,7 @@
 #include <xen/mm.h>
 #include <xen/shutdown.h>
 #include <xen/vmap.h>
+#include <xen/xvmalloc.h>
 
 #include <public/version.h>
 
@@ -52,10 +54,24 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
     }
 }
 
+/* Relocate the FDT in Xen heap */
+static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
+{
+    void *fdt = xvmalloc_array(uint8_t, dtb_size);
+
+    if ( !fdt )
+        panic("Unable to allocate memory for relocating the Device-Tree.\n");
+
+    copy_from_paddr(fdt, dtb_paddr, dtb_size);
+
+    return fdt;
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
     const char *cmdline;
+    size_t fdt_size;
 
     remove_identity_mapping();
 
@@ -80,8 +96,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
                           _end - _start, false) )
         panic("Failed to add BOOTMOD_XEN\n");
 
-    if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
-        BUG();
+    fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);
 
     cmdline = boot_fdt_cmdline(device_tree_flattened);
     printk("Command line: %s\n", cmdline);
@@ -99,6 +114,18 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
      */
     system_state = SYS_STATE_boot;
 
+    if ( acpi_disabled )
+    {
+        printk("Booting using Device Tree\n");
+        device_tree_flattened = relocate_fdt(dtb_addr, fdt_size);
+        dt_unflatten_host_device_tree();
+    }
+    else
+    {
+        device_tree_flattened = NULL;
+        panic("Booting using ACPI isn't supported\n");
+    }
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.1


