Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1686470C1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457129.714985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GvU-0000tf-Sc; Thu, 08 Dec 2022 13:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457129.714985; Thu, 08 Dec 2022 13:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GvU-0000rm-P4; Thu, 08 Dec 2022 13:27:00 +0000
Received: by outflank-mailman (input) for mailman id 457129;
 Thu, 08 Dec 2022 13:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MTro=4G=citrix.com=prvs=334a0184e=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1p3GvS-0000X7-RE
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:26:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbeb36c3-76fb-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 14:26:57 +0100 (CET)
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
X-Inumbo-ID: fbeb36c3-76fb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670506017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mUQ9fo4KGms+nfgI98Sxyt/O96CD/Xb0KR7B0QCJECM=;
  b=INnqoHFDJ6pGoIuwgDhOo57H+q7OD4ytx4e+TixvP+yXTv/AeOT0BQ2x
   cvV0QGaz6TtgGTf/CduTYseo0l/3mKq40bTcjmkPTSveXifyvSodqiELI
   aij/FVZlYm1ZXTM32gbzqVtTG6MIqYQW/4uu4wa2uFpneqJRXijeRbkVj
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86800782
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3+KMYq4cZi/x00BVyapzgQxRtDPHchMFZxGqfqrLsTDasY5as4F+v
 mIeXGyFPvuPa2H0c9EgbN7j9k9VvJCAzIdgSQU/qCg2Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT7AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 O01dDwvagq5vt2ayvWeUvR1tN5/BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAnXTlfDBJ7l6ErLEz4kDYzRBr0airO93QEjCPbZULzh7A+
 TKcl4j/KhI8N9am7BGkyHWxrazhoXPaQ9kRLrLto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9BH4vOSMmSRE/2ubPqsYWlg/WfMw/Ofvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT7FWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YuLFPcrHk1PBTOhwgBdXTAdolma
 P+mnTuEVy5GWcyLMhLpLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/L7LYflI8Rjh+YxITqJt4E7FYc21uvr+g1
 hmAtoVwlDITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:CZI6hqAzYH/3FwblHelW55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgL1+DfKlbbak/DH4BmtJ
 uJc8JFeaDN5VoRt7eH3OFveexQv+Vu88qT9JnjJ28Gd3AMV0n5hT0JcTpyFCdNNW97LKt8Lr
 WwzOxdqQGtfHwGB/7LfEXsD4D41qT2fIuNW29/OyIa
X-IronPort-AV: E=Sophos;i="5.96,227,1665460800"; 
   d="scan'208";a="86800782"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH 2/2] x86/ucode: load microcode earlier on boot CPU
Date: Thu, 8 Dec 2022 13:26:39 +0000
Message-ID: <20221208132639.29942-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221208132639.29942-1-sergey.dyasli@citrix.com>
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Call early_microcode_init() straight after multiboot modules become
accessible. Modify it to load the ucode directly from the blob bypassing
populating microcode_cache because xmalloc is still not available at
that point during Xen boot.

Introduce early_microcode_init_cache() for populating microcode_cache.
It needs to find the new virtual address of the ucode blob because it
changes during boot, e.g. from 0x00000000010802fc to 0xffff83204dac52fc.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c    | 61 ++++++++++++++++++++++++----
 xen/arch/x86/include/asm/microcode.h |  6 ++-
 xen/arch/x86/include/asm/setup.h     |  3 --
 xen/arch/x86/setup.c                 | 10 +++--
 4 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 924a2bd7b5..b04b30ce5e 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -198,7 +198,7 @@ void __init microcode_scan_module(
         bootstrap_map(NULL);
     }
 }
-void __init microcode_grab_module(
+static void __init microcode_grab_module(
     unsigned long *module_map,
     const multiboot_info_t *mbi)
 {
@@ -733,9 +733,35 @@ int microcode_update_one(void)
 }
 
 /* BSP calls this function to parse ucode blob and then apply an update. */
-static int __init early_microcode_update_cpu(void)
+static int __init early_microcode_update_cache(const void *data, size_t len)
 {
     int rc = 0;
+    const struct microcode_patch *patch;
+
+    if ( !data )
+        return -ENOMEM;
+
+    patch = parse_blob(data, len);
+    if ( IS_ERR(patch) )
+    {
+        printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
+               PTR_ERR(patch));
+        return PTR_ERR(patch);
+    }
+
+    if ( !patch )
+        return -ENOENT;
+
+    spin_lock(&microcode_mutex);
+    rc = microcode_update_cache(patch);
+    spin_unlock(&microcode_mutex);
+    ASSERT(rc);
+
+    return rc;
+}
+
+static int __init early_microcode_update_cpu(void)
+{
     const void *data = NULL;
     size_t len;
     const struct microcode_patch *patch;
@@ -754,7 +780,9 @@ static int __init early_microcode_update_cpu(void)
     if ( !data )
         return -ENOMEM;
 
-    patch = parse_blob(data, len);
+    alternative_vcall(ucode_ops.collect_cpu_info);
+
+    patch = alternative_call(ucode_ops.cpu_request_microcode, data, len, false);
     if ( IS_ERR(patch) )
     {
         printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
@@ -765,15 +793,28 @@ static int __init early_microcode_update_cpu(void)
     if ( !patch )
         return -ENOENT;
 
-    spin_lock(&microcode_mutex);
-    rc = microcode_update_cache(patch);
-    spin_unlock(&microcode_mutex);
-    ASSERT(rc);
+    return microcode_update_cpu(patch);
+}
+
+int __init early_microcode_init_cache(unsigned long *module_map,
+                                      const multiboot_info_t *mbi)
+{
+    int rc = 0;
+
+    /* Need to rescan the modules because they might have been relocated */
+    microcode_grab_module(module_map, mbi);
+
+    if ( ucode_mod.mod_end )
+        rc = early_microcode_update_cache(bootstrap_map(&ucode_mod),
+                                          ucode_mod.mod_end);
+    else if ( ucode_blob.size )
+        rc = early_microcode_update_cache(ucode_blob.data, ucode_blob.size);
 
-    return microcode_update_one();
+    return rc;
 }
 
-int __init early_microcode_init(void)
+int __init early_microcode_init(unsigned long *module_map,
+                                const multiboot_info_t *mbi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -797,6 +838,8 @@ int __init early_microcode_init(void)
         return -ENODEV;
     }
 
+    microcode_grab_module(module_map, mbi);
+
     alternative_vcall(ucode_ops.collect_cpu_info);
 
     if ( ucode_mod.mod_end || ucode_blob.size )
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 3b0234e9fa..c5f9897535 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -3,6 +3,7 @@
 
 #include <xen/types.h>
 #include <xen/percpu.h>
+#include <xen/multiboot.h>
 
 #include <public/xen.h>
 
@@ -21,7 +22,10 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
 int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long len);
-int early_microcode_init(void);
+int early_microcode_init(unsigned long *module_map,
+                         const multiboot_info_t *mbi);
+int early_microcode_init_cache(unsigned long *module_map,
+                               const multiboot_info_t *mbi);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 21037b7f31..82ee51c2dc 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -45,9 +45,6 @@ void *bootstrap_map(const module_t *mod);
 
 int xen_in_range(unsigned long mfn);
 
-void microcode_grab_module(
-    unsigned long *, const multiboot_info_t *);
-
 extern uint8_t kbd_shift_flags;
 
 #ifdef NDEBUG
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e05189f649..9955e1e6fa 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1178,6 +1178,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         mod[i].reserved = 0;
     }
 
+    /*
+     * TODO: load ucode earlier once multiboot modules become accessible
+     * at an earlier stage.
+     */
+    early_microcode_init(module_map, mbi);
+
     if ( xen_phys_start )
     {
         relocated = true;
@@ -1774,11 +1780,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     init_IRQ();
 
-    microcode_grab_module(module_map, mbi);
-
     timer_init();
 
-    early_microcode_init();
+    early_microcode_init_cache(module_map, mbi);
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.17.1


