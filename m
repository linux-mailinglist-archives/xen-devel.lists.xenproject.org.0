Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE0650DB9
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 15:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466153.725030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOu-0007Nr-NR; Mon, 19 Dec 2022 14:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466153.725030; Mon, 19 Dec 2022 14:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7HOu-0007GM-GP; Mon, 19 Dec 2022 14:45:56 +0000
Received: by outflank-mailman (input) for mailman id 466153;
 Mon, 19 Dec 2022 14:45:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUwz=4R=citrix.com=prvs=345b0463a=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1p7HOs-0006vj-Nl
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 14:45:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d56f9108-7fab-11ed-91b6-6bf2151ebd3b;
 Mon, 19 Dec 2022 15:45:53 +0100 (CET)
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
X-Inumbo-ID: d56f9108-7fab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671461153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=WR4cdLn2iHdj6dKeKFSaHSmFlU5WqS0U7np8w7Q1nAI=;
  b=Jrp8d/bL2gepys9MftxUMVe6Ahp/lpKCkqoR3pJpSybQEYBlZCYok36q
   s4icvkW4WEIEfBeIMlg4QUOfA5GFBjv1zpgTNyT9WyvGwg1ZW/iFMSk05
   /nHlNCKVJ8jNhk4u1/8uQ+f+CHv+KOpF7LxFgIZ34dGWrX9nslUa6CDKM
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88612821
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZFVFgaiVwCythS0ICPpLECeqX161bxAKZh0ujC45NGQN5FlHY01je
 htvXj+BO/aJNjajc4p1bomw8hwAvMXUn94wHFZoqy48ECkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gaPzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQxDxwGZT7eu9iP/6uiesxw2p0PKO7CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHkfidXpUPTqbs++GzS5AdwzKLsIJzefdniqcB9zhbG/
 ziWpT2R7hcyBuCU9WC7+HKWwe7TnnrEBK1VTI/7+as/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHE9lteJBT5M0crQgMPRiVY3+Pan5gqvjfTEo9PFImc24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9s4DNJWfh0B3iM4ldjBP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlDep3E+PhDOjzG8+KTJrU3YE
 c7HGftA8F5AUfg3pNZIb7x1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYo43K+1Rrlhtsus+VyFm
 +uzwuPWk32zpsWiOHiImWPSRHhWRUUG6Wfe8JcGK7Hdflc7QAnMyZb5mNscRmCspIwN/s+gw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:lUfSF65l5mrtIWgtRQPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="88612821"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Sergey Dyasli
	<sergey.dyasli@citrix.com>
Subject: [PATCH v2 3/3] x86/ucode: load microcode earlier on boot CPU
Date: Mon, 19 Dec 2022 14:45:33 +0000
Message-ID: <20221219144533.19836-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221219144533.19836-1-sergey.dyasli@citrix.com>
References: <20221219144533.19836-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Call early_microcode_init() straight after multiboot modules become
accessible. Modify it to load the ucode directly from the blob bypassing
populating microcode_cache because xmalloc is still not available at
that point during Xen boot.

Introduce early_microcode_init_cache() for populating microcode_cache.
It needs to rescan the modules in order to find the new virtual address
of the ucode blob because it changes during the boot process, e.g.
from 0x00000000010802fc to 0xffff83204dac52fc.

While at it, drop alternative_vcall() from early_microcode_init() since
it's not useful in an __init fuction.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

---
v1 --> v2:
- Don't call microcode_grab_module() the second time, use
  microcode_scan_module() instead
- Use forward declaration of struct multiboot_info
- Don't use alternative calls
- Rename early_microcode_update_cache() to early_update_cache() and
  move it around a bit
---
 xen/arch/x86/cpu/microcode/core.c    | 66 +++++++++++++++++++++++-----
 xen/arch/x86/include/asm/microcode.h |  7 ++-
 xen/arch/x86/include/asm/setup.h     |  3 --
 xen/arch/x86/setup.c                 | 10 +++--
 4 files changed, 68 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 85c05e480d..04b5d346ab 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -27,6 +27,7 @@
 #include <xen/err.h>
 #include <xen/guest_access.h>
 #include <xen/init.h>
+#include <xen/multiboot.h>
 #include <xen/param.h>
 #include <xen/spinlock.h>
 #include <xen/stop_machine.h>
@@ -198,7 +199,8 @@ void __init microcode_scan_module(
         bootstrap_map(NULL);
     }
 }
-void __init microcode_grab_module(
+
+static void __init microcode_grab_module(
     unsigned long *module_map,
     const multiboot_info_t *mbi)
 {
@@ -732,10 +734,54 @@ int microcode_update_one(void)
     return microcode_update_cpu(NULL);
 }
 
+static int __init early_update_cache(const void *data, size_t len)
+{
+    int rc = 0;
+    struct microcode_patch *patch;
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
+int __init early_microcode_init_cache(unsigned long *module_map,
+                                      const struct multiboot_info *mbi)
+{
+    int rc = 0;
+
+    if ( ucode_scan )
+        /* Need to rescan the modules because they might have been relocated */
+        microcode_scan_module(module_map, mbi);
+
+    if ( ucode_mod.mod_end )
+        rc = early_update_cache(bootstrap_map(&ucode_mod),
+                                ucode_mod.mod_end);
+    else if ( ucode_blob.size )
+        rc = early_update_cache(ucode_blob.data, ucode_blob.size);
+
+    return rc;
+}
+
 /* BSP calls this function to parse ucode blob and then apply an update. */
 static int __init early_microcode_update_cpu(void)
 {
-    int rc = 0;
     const void *data = NULL;
     size_t len;
     struct microcode_patch *patch;
@@ -754,7 +800,7 @@ static int __init early_microcode_update_cpu(void)
     if ( !data )
         return -ENOMEM;
 
-    patch = parse_blob(data, len);
+    patch = ucode_ops.cpu_request_microcode(data, len, false);
     if ( IS_ERR(patch) )
     {
         printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
@@ -765,15 +811,11 @@ static int __init early_microcode_update_cpu(void)
     if ( !patch )
         return -ENOENT;
 
-    spin_lock(&microcode_mutex);
-    rc = microcode_update_cache(patch);
-    spin_unlock(&microcode_mutex);
-    ASSERT(rc);
-
-    return microcode_update_one();
+    return microcode_update_cpu(patch);
 }
 
-int __init early_microcode_init(void)
+int __init early_microcode_init(unsigned long *module_map,
+                                const struct multiboot_info *mbi)
 {
     const struct cpuinfo_x86 *c = &boot_cpu_data;
     int rc = 0;
@@ -797,7 +839,9 @@ int __init early_microcode_init(void)
         return -ENODEV;
     }
 
-    alternative_vcall(ucode_ops.collect_cpu_info);
+    microcode_grab_module(module_map, mbi);
+
+    ucode_ops.collect_cpu_info();
 
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 3b0234e9fa..170481d257 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -6,6 +6,8 @@
 
 #include <public/xen.h>
 
+struct multiboot_info;
+
 struct cpu_signature {
     /* CPU signature (CPUID.1.EAX). */
     unsigned int sig;
@@ -21,7 +23,10 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
 int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long len);
-int early_microcode_init(void);
+int early_microcode_init(unsigned long *module_map,
+                         const struct multiboot_info *mbi);
+int early_microcode_init_cache(unsigned long *module_map,
+                               const struct multiboot_info *mbi);
 int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index ae470ea12f..ae0dd3915a 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -44,9 +44,6 @@ void *bootstrap_map(const module_t *mod);
 
 int xen_in_range(unsigned long mfn);
 
-void microcode_grab_module(
-    unsigned long *, const multiboot_info_t *);
-
 extern uint8_t kbd_shift_flags;
 
 #ifdef NDEBUG
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6bb5bc7c84..2d7c815e0a 100644
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
@@ -1762,11 +1768,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     init_IRQ();
 
-    microcode_grab_module(module_map, mbi);
-
     timer_init();
 
-    early_microcode_init();
+    early_microcode_init_cache(module_map, mbi);
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
-- 
2.17.1


