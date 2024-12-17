Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61459F511F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859441.1271630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVO-00036L-UX; Tue, 17 Dec 2024 16:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859441.1271630; Tue, 17 Dec 2024 16:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVO-0002zd-PA; Tue, 17 Dec 2024 16:33:06 +0000
Received: by outflank-mailman (input) for mailman id 859441;
 Tue, 17 Dec 2024 16:33:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVN-0001J8-4v
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:33:05 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 965f96c2-bc94-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:33:03 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-3022598e213so53711771fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:33:03 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:33:02 -0800 (PST)
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
X-Inumbo-ID: 965f96c2-bc94-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453183; x=1735057983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvts/S0YZI4SLhTFRZAtpUtbBID3pS74GNUhShT11II=;
        b=fl9vntodxbl3oqHHhQj73tke07P+h5m4Pjon9TPTe9juQ5KOny7ZvhK8sDciIqgW8g
         olml0Lf52im9WLNCyrDKQsxUQP+EictOakkiGwSC0yogBHko9veeALmrbrOD7mNKRuhC
         mj5SND6QKh9BlmK6jQxhopT/0kkV1jFhiP42iLPVCMsiUFg/Ea9BkdbHmzd2TLJoueGB
         54M5oBVs89EoZmIVhbVeygOqL11d992/1k5kM1SonOym3BPvMuxNG22ksr2pUeyir0YY
         aiQcEAS06RMnols1gKVHjBptLf5SGAc/tvEiC/cVsOhdyDjzFMHF3vuV9cMPA4yjegn/
         jUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453183; x=1735057983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvts/S0YZI4SLhTFRZAtpUtbBID3pS74GNUhShT11II=;
        b=W5a99uS7SFxx2HuwWmoMfOSt6vh2QGhooEKwJBodFPmFC74gAO6axfj8vW9f8ngFES
         I5Erwtl/YwVIfC5jW17W+ymQrQxvIVEwcI/1KxndrcFX8Y6crnKi8tSJnpQuIbZaIP36
         jvqE2s9ljKPw8QZPUYVNA+YshCXzIwSPWLxA5tMlYEUxhIbegaUQxSYoSamcHWWePlac
         MXY/H8a79DqSRiwEIcQeGzfWQUe20H4kDgEi7P9BP/qmWoJRI/+PNaQEWlnE4Kp1kObV
         XwvqJNbtcrQGLU+p916Ol1DJYMTAMRebKkb/llZyLFQlmnRFX0ZO/nKPAVagG/5wQAFo
         I9qw==
X-Gm-Message-State: AOJu0YzZ5m4Q/fE4iKsh8xT9jJwx07D47aecpETPnDQaSHHXD54w9ZHk
	KpoxgcEJsBsG0eHEWekRRCc1b3rc4Cnh8bwUOaW13gLj7GdokwiWGiiFon+B
X-Gm-Gg: ASbGncudfFCTkI0hDhhqdDiXLwMO1Z6Zli/s6L/eVDKDlJ4ZLBhjJ0DjsvNFjKO6Gby
	jTDYg0M5x3weQ9PolTTrAfEVvWULR1OUaN+FmAiUfaxKc1P62/S58O1tSLByNIFOdrdQdMianTx
	D6R3awIQb48m095jGA5dEPPUhb3N/xPEydOW2P37M66zwkD6UVs3rWIn28/mmjMnWMCulEaVZis
	wisbvTlxn18vM01xvh2XG+EufzbpHiAqEneGsO/BIPujI0L9RyCjdh6PQ==
X-Google-Smtp-Source: AGHT+IGK3SASAd8pvE8rDMsmjQYwwLclRrQxWKa1slrklD1OqtzzYxJ/aPlDyDX1ouBW6UB4Szp3Kw==
X-Received: by 2002:a05:651c:212a:b0:304:4cac:d8f7 with SMTP id 38308e7fff4ca-3044cacdb1cmr1479351fa.13.1734453182815;
        Tue, 17 Dec 2024 08:33:02 -0800 (PST)
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
Subject: [PATCH v3 7/7] xen/riscv: relocating and unflattening host device tree
Date: Tue, 17 Dec 2024 17:32:51 +0100
Message-ID: <b25f71d2c5c51ab1c869bc6f58738d938d0f571f.1734452721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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


