Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B61EA65F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 16:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfltR-0000S6-KL; Mon, 01 Jun 2020 14:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfgE=7O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jfltP-0000RN-NW
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 14:58:23 +0000
X-Inumbo-ID: 560f8602-a418-11ea-9947-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 560f8602-a418-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 14:58:22 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3aa6tkOX8BFo1ojd5/NrdAWpp3pC7JcKZ3SmeR3zZnAv5DKz+B0DAVG6vj7BVrs9BYvyVo7Cxv
 kO5kXiqYsGF2rxoCE6QO1VauM50C2fm8CicaRLYEfnqHjXveI4IhVkV/31BbCXErOMUYma0dIO
 /bEfOmLov3BPZFrLfQwmGloVFUyjerfoC1s1eJ7+2ULXl6P+fq7sOvb7NrCMj6HtfTfHOkcXhZ
 NqXdPG2ZyP8ScGcPVFm1jfJ0bzccrtEuU4AOoMWXn0tHxKN43Ozvk1VIeL28fJlO7aYAU4WBLV
 DFo=
X-SBRS: 2.7
X-MesageID: 19671656
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,461,1583211600"; d="scan'208";a="19671656"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/ucode: Fix errors with start/end_update()
Date: Mon, 1 Jun 2020 15:57:55 +0100
Message-ID: <20200601145755.3661-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c/s 9267a439c "x86/ucode: Document the behaviour of the microcode_ops hooks"
identified several poor behaviours of the start_update()/end_update_percpu()
hooks.

AMD have subsequently confirmed that OSVW don't, and are not expected to,
change across a microcode load, rendering all of this complexity unecessary.

Instead of fixing up the logic to not leave the OSVW state reset in a number
of corner cases, delete the logic entirely.  This in turn allows for the
removal of the poorly-named 'start_update' parameter to
microcode_update_one().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>

This wants backporting to 4.13, hence considering for 4.14 at this point.
---
 xen/arch/x86/acpi/power.c            |  2 +-
 xen/arch/x86/cpu/microcode/amd.c     | 17 -----------------
 xen/arch/x86/cpu/microcode/core.c    | 33 +++------------------------------
 xen/arch/x86/cpu/microcode/private.h | 14 --------------
 xen/arch/x86/smpboot.c               |  2 +-
 xen/include/asm-x86/microcode.h      |  2 +-
 6 files changed, 6 insertions(+), 64 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 0cda362045..dfffe08e18 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -287,7 +287,7 @@ static int enter_state(u32 state)
     console_end_sync();
     watchdog_enable();
 
-    microcode_update_one(true);
+    microcode_update_one();
 
     if ( !recheck_cpu_features(0) )
         panic("Missing previously available feature(s)\n");
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 3f0969e70d..11e24637e7 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -395,26 +395,9 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
     return patch;
 }
 
-#ifdef CONFIG_HVM
-static int start_update(void)
-{
-    /*
-     * svm_host_osvw_init() will be called on each cpu by calling '.end_update'
-     * in common code.
-     */
-    svm_host_osvw_reset();
-
-    return 0;
-}
-#endif
-
 const struct microcode_ops amd_ucode_ops = {
     .cpu_request_microcode            = cpu_request_microcode,
     .collect_cpu_info                 = collect_cpu_info,
     .apply_microcode                  = apply_microcode,
-#ifdef CONFIG_HVM
-    .start_update                     = start_update,
-    .end_update_percpu                = svm_host_osvw_init,
-#endif
     .compare_patch                    = compare_patch,
 };
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index d879d28787..18ebc07b13 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -546,9 +546,6 @@ static int do_microcode_update(void *patch)
     else
         ret = secondary_thread_fn();
 
-    if ( microcode_ops->end_update_percpu )
-        microcode_ops->end_update_percpu();
-
     return ret;
 }
 
@@ -620,16 +617,6 @@ static long microcode_update_helper(void *data)
     }
     spin_unlock(&microcode_mutex);
 
-    if ( microcode_ops->start_update )
-    {
-        ret = microcode_ops->start_update();
-        if ( ret )
-        {
-            microcode_free_patch(patch);
-            goto put;
-        }
-    }
-
     cpumask_clear(&cpu_callin_map);
     atomic_set(&cpu_out, 0);
     atomic_set(&cpu_updated, 0);
@@ -728,28 +715,14 @@ static int __init microcode_init(void)
 __initcall(microcode_init);
 
 /* Load a cached update to current cpu */
-int microcode_update_one(bool start_update)
+int microcode_update_one(void)
 {
-    int err;
-
     if ( !microcode_ops )
         return -EOPNOTSUPP;
 
     microcode_ops->collect_cpu_info();
 
-    if ( start_update && microcode_ops->start_update )
-    {
-        err = microcode_ops->start_update();
-        if ( err )
-            return err;
-    }
-
-    err = microcode_update_cpu(NULL);
-
-    if ( microcode_ops->end_update_percpu )
-        microcode_ops->end_update_percpu();
-
-    return err;
+    return microcode_update_cpu(NULL);
 }
 
 /* BSP calls this function to parse ucode blob and then apply an update. */
@@ -790,7 +763,7 @@ static int __init early_microcode_update_cpu(void)
     spin_unlock(&microcode_mutex);
     ASSERT(rc);
 
-    return microcode_update_one(true);
+    return microcode_update_one();
 }
 
 int __init early_microcode_init(void)
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index dc5c7a81ae..c00ba590d1 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -46,20 +46,6 @@ struct microcode_ops {
     int (*apply_microcode)(const struct microcode_patch *patch);
 
     /*
-     * Optional.  If provided and applicable to the specific update attempt,
-     * is run once by the initiating CPU.  Returning an error will abort the
-     * load attempt.
-     */
-    int (*start_update)(void);
-
-    /*
-     * Optional.  If provided, called on every CPU which completes a microcode
-     * load.  May be called in the case of some errors, and not others.  May
-     * be called even if start_update() wasn't.
-     */
-    void (*end_update_percpu)(void);
-
-    /*
      * Given two patches, are they both applicable to the current CPU, and is
      * new a higher revision than old?
      */
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 13b3dade9c..f878a00760 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -369,7 +369,7 @@ void start_secondary(void *unused)
 
     initialize_cpu_data(cpu);
 
-    microcode_update_one(false);
+    microcode_update_one();
 
     /*
      * If MSR_SPEC_CTRL is available, apply Xen's default setting and discard
diff --git a/xen/include/asm-x86/microcode.h b/xen/include/asm-x86/microcode.h
index 9da63f992e..3b0234e9fa 100644
--- a/xen/include/asm-x86/microcode.h
+++ b/xen/include/asm-x86/microcode.h
@@ -22,6 +22,6 @@ DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 void microcode_set_module(unsigned int idx);
 int microcode_update(XEN_GUEST_HANDLE(const_void), unsigned long len);
 int early_microcode_init(void);
-int microcode_update_one(bool start_update);
+int microcode_update_one(void);
 
 #endif /* ASM_X86__MICROCODE_H */
-- 
2.11.0


