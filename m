Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ADC2C4FF0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 09:04:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38304.71046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiCFp-00015z-5y; Thu, 26 Nov 2020 08:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38304.71046; Thu, 26 Nov 2020 08:03:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiCFp-00015a-2r; Thu, 26 Nov 2020 08:03:49 +0000
Received: by outflank-mailman (input) for mailman id 38304;
 Thu, 26 Nov 2020 08:03:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yWto=FA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kiCFm-00015V-QE
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 08:03:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54c554f6-472b-48ee-a02f-e6d373c690f2;
 Thu, 26 Nov 2020 08:03:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A289BAC0C;
 Thu, 26 Nov 2020 08:03:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yWto=FA=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kiCFm-00015V-QE
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 08:03:46 +0000
X-Inumbo-ID: 54c554f6-472b-48ee-a02f-e6d373c690f2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 54c554f6-472b-48ee-a02f-e6d373c690f2;
	Thu, 26 Nov 2020 08:03:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606377822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CjteYFCzzzAJ0LtD9dfouVrr6hZ49DMWJlX7vqKsT9k=;
	b=lAAMy9aRxH5lK8pfQsXHog/IPnkhfo058Sgz6u8W62iUC6T0sXpwv6Q7hcqfIoQ5hzpdN6
	mtWi6ChlvbnJUvnbyWTE92y6rxYhcnsMNzNo9LWfOCTzU9M2Q01WJdXttfS7PJ72aGqbAP
	dziQush9WztfgQ/HnPGFI+00H8qjwhY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A289BAC0C;
	Thu, 26 Nov 2020 08:03:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen: add support for automatic debug key actions in case of crash
Date: Thu, 26 Nov 2020 09:03:40 +0100
Message-Id: <20201126080340.6154-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the host crashes it would sometimes be nice to have additional
debug data available which could be produced via debug keys, but
halting the server for manual intervention might be impossible due to
the need to reboot/kexec rather sooner than later.

Add support for automatic debug key actions in case of crashes which
can be activated via boot- or runtime-parameter.

Depending on the type of crash the desired data might be different, so
support different settings for the possible types of crashes.

The parameter is "crash-debug" with the following syntax:

  crash-debug-<type>=<string>

with <type> being one of:

  panic, hwdom, watchdog, kexeccmd, debugkey

and <string> a sequence of debug key characters with '+' having the
special semantics of a 10 millisecond pause.

So "crash-debug-watchdog=0+0qr" would result in special output in case
of watchdog triggered crash (dom0 state, 10 ms pause, dom0 state,
domain info, run queues).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- switched special character '.' to '+' (Jan Beulich)
- 10 ms instead of 1 s pause (Jan Beulich)
- added more text to the boot parameter description (Jan Beulich)

V3:
- added const (Jan Beulich)
- thorough test of crash reason parameter (Jan Beulich)
- kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
- added dummy get_irq_regs() helper on Arm

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/xen-command-line.pandoc | 39 ++++++++++++++++++++++++++
 xen/common/kexec.c                |  8 ++++--
 xen/common/keyhandler.c           | 46 +++++++++++++++++++++++++++++++
 xen/common/shutdown.c             |  4 +--
 xen/drivers/char/console.c        |  2 +-
 xen/include/asm-arm/irq.h         |  5 ++++
 xen/include/xen/kexec.h           | 10 +++++--
 xen/include/xen/keyhandler.h      | 11 ++++++++
 8 files changed, 117 insertions(+), 8 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b4a0d60c11..294be31abb 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -574,6 +574,45 @@ reduction of features at Xen's disposal to manage guests.
 ### cpuinfo (x86)
 > `= <boolean>`
 
+### crash-debug-debugkey
+### crash-debug-hwdom
+### crash-debug-kexeccmd
+### crash-debug-panic
+### crash-debug-watchdog
+> `= <string>`
+
+> Can be modified at runtime
+
+Specify debug-key actions in cases of crashes. Each of the parameters applies
+to a different crash reason. The `<string>` is a sequence of debug key
+characters, with `+` having the special meaning of a 10 millisecond pause.
+
+`crash-debug-debugkey` will be used for crashes induced by the `C` debug
+key (i.e. manually induced crash).
+
+`crash-debug-hwdom` denotes a crash of dom0.
+
+`crash-debug-kexeccmd` is an explicit request of dom0 to continue with the
+kdump kernel via kexec. Only available on hypervisors built with CONFIG_KEXEC.
+
+`crash-debug-panic` is a crash of the hypervisor.
+
+`crash-debug-watchdog` is a crash due to the watchdog timer expiring.
+
+It should be noted that dumping diagnosis data to the console can fail in
+multiple ways (missing data, hanging system, ...) depending on the reason
+of the crash, which might have left the hypervisor in a bad state.
+
+So e.g. `crash-debug-watchdog=0+0r` would dump dom0 state twice with 10
+milliseconds between the two state dumps, followed by the run queues of the
+hypervisor, if the system crashes due to a watchdog timeout.
+
+These parameters should be used carefully, as e.g. specifying
+`crash-debug-debugkey=C` would result in an endless loop. Depending on the
+reason of the system crash it might happen that triggering some debug key
+action will result in a hang instead of dumping data and then doing a
+reboot or crash dump.
+
 ### crashinfo_maxaddr
 > `= <size>`
 
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 52cdc4ebc3..ebeee6405a 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -373,10 +373,12 @@ static int kexec_common_shutdown(void)
     return 0;
 }
 
-void kexec_crash(void)
+void kexec_crash(enum crash_reason reason)
 {
     int pos;
 
+    keyhandler_crash_action(reason);
+
     pos = (test_bit(KEXEC_FLAG_CRASH_POS, &kexec_flags) != 0);
     if ( !test_bit(KEXEC_IMAGE_CRASH_BASE + pos, &kexec_flags) )
         return;
@@ -409,7 +411,7 @@ static long kexec_reboot(void *_image)
 static void do_crashdump_trigger(unsigned char key)
 {
     printk("'%c' pressed -> triggering crashdump\n", key);
-    kexec_crash();
+    kexec_crash(CRASHREASON_DEBUGKEY);
     printk(" * no crash kernel loaded!\n");
 }
 
@@ -840,7 +842,7 @@ static int kexec_exec(XEN_GUEST_HANDLE_PARAM(void) uarg)
         ret = continue_hypercall_on_cpu(0, kexec_reboot, image);
         break;
     case KEXEC_TYPE_CRASH:
-        kexec_crash(); /* Does not return */
+        kexec_crash(CRASHREASON_KEXECCMD); /* Does not return */
         break;
     }
 
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 68364e987d..11ab6ecd59 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -3,7 +3,9 @@
  */
 
 #include <asm/regs.h>
+#include <xen/delay.h>
 #include <xen/keyhandler.h>
+#include <xen/param.h>
 #include <xen/shutdown.h>
 #include <xen/event.h>
 #include <xen/console.h>
@@ -507,6 +509,50 @@ void __init initialize_keytable(void)
     }
 }
 
+#define CRASHACTION_SIZE  32
+static char crash_debug_panic[CRASHACTION_SIZE];
+string_runtime_param("crash-debug-panic", crash_debug_panic);
+static char crash_debug_hwdom[CRASHACTION_SIZE];
+string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
+static char crash_debug_watchdog[CRASHACTION_SIZE];
+string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);
+#ifdef CONFIG_KEXEC
+static char crash_debug_kexeccmd[CRASHACTION_SIZE];
+string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);
+#endif
+static char crash_debug_debugkey[CRASHACTION_SIZE];
+string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);
+
+void keyhandler_crash_action(enum crash_reason reason)
+{
+    static const char *const crash_action[CRASHREASON_N] = {
+        [CRASHREASON_PANIC] = crash_debug_panic,
+        [CRASHREASON_HWDOM] = crash_debug_hwdom,
+        [CRASHREASON_WATCHDOG] = crash_debug_watchdog,
+#ifdef CONFIG_KEXEC
+        [CRASHREASON_KEXECCMD] = crash_debug_kexeccmd,
+#endif
+        [CRASHREASON_DEBUGKEY] = crash_debug_debugkey,
+    };
+    const char *action;
+    struct cpu_user_regs *regs = get_irq_regs() ? : guest_cpu_user_regs();
+
+    if ( (unsigned int)reason >= CRASHREASON_N )
+        return;
+    action = crash_action[reason];
+    if ( !action )
+        return;
+
+    while ( *action )
+    {
+        if ( *action == '+' )
+            mdelay(10);
+        else
+            handle_keypress(*action, regs);
+        action++;
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index 912593915b..abde48aa4c 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -43,7 +43,7 @@ void hwdom_shutdown(u8 reason)
     case SHUTDOWN_crash:
         debugger_trap_immediate();
         printk("Hardware Dom%u crashed: ", hardware_domain->domain_id);
-        kexec_crash();
+        kexec_crash(CRASHREASON_HWDOM);
         maybe_reboot();
         break; /* not reached */
 
@@ -56,7 +56,7 @@ void hwdom_shutdown(u8 reason)
     case SHUTDOWN_watchdog:
         printk("Hardware Dom%u shutdown: watchdog rebooting machine\n",
                hardware_domain->domain_id);
-        kexec_crash();
+        kexec_crash(CRASHREASON_WATCHDOG);
         machine_restart(0);
         break; /* not reached */
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 861ad53a8f..acec277f5e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1271,7 +1271,7 @@ void panic(const char *fmt, ...)
 
     debugger_trap_immediate();
 
-    kexec_crash();
+    kexec_crash(CRASHREASON_PANIC);
 
     if ( opt_noreboot )
         machine_halt();
diff --git a/xen/include/asm-arm/irq.h b/xen/include/asm-arm/irq.h
index e45d574598..01d5a7cb02 100644
--- a/xen/include/asm-arm/irq.h
+++ b/xen/include/asm-arm/irq.h
@@ -98,6 +98,11 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
  */
 bool irq_type_set_by_domain(const struct domain *d);
 
+static inline struct cpu_user_regs *get_irq_regs(void)
+{
+    return NULL;
+}
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index e85ba16405..9f7a912e97 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -1,6 +1,8 @@
 #ifndef __XEN_KEXEC_H__
 #define __XEN_KEXEC_H__
 
+#include <xen/keyhandler.h>
+
 #ifdef CONFIG_KEXEC
 
 #include <public/kexec.h>
@@ -48,7 +50,7 @@ void machine_kexec_unload(struct kexec_image *image);
 void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
 void machine_reboot_kexec(struct kexec_image *image);
 void machine_kexec(struct kexec_image *image);
-void kexec_crash(void);
+void kexec_crash(enum crash_reason reason);
 void kexec_crash_save_cpu(void);
 struct crash_xen_info *kexec_crash_save_info(void);
 void machine_crash_shutdown(void);
@@ -82,7 +84,11 @@ void vmcoreinfo_append_str(const char *fmt, ...)
 #define kexecing 0
 
 static inline void kexec_early_calculations(void) {}
-static inline void kexec_crash(void) {}
+static inline void kexec_crash(enum crash_reason reason)
+{
+    keyhandler_crash_action(reason);
+}
+
 static inline void kexec_crash_save_cpu(void) {}
 static inline void set_kexec_crash_area_size(u64 system_ram) {}
 
diff --git a/xen/include/xen/keyhandler.h b/xen/include/xen/keyhandler.h
index 5131e86cbc..dbf797a8b4 100644
--- a/xen/include/xen/keyhandler.h
+++ b/xen/include/xen/keyhandler.h
@@ -48,4 +48,15 @@ void register_irq_keyhandler(unsigned char key,
 /* Inject a keypress into the key-handling subsystem. */
 extern void handle_keypress(unsigned char key, struct cpu_user_regs *regs);
 
+enum crash_reason {
+    CRASHREASON_PANIC,
+    CRASHREASON_HWDOM,
+    CRASHREASON_WATCHDOG,
+    CRASHREASON_KEXECCMD,
+    CRASHREASON_DEBUGKEY,
+    CRASHREASON_N
+};
+
+void keyhandler_crash_action(enum crash_reason reason);
+
 #endif /* __XEN_KEYHANDLER_H__ */
-- 
2.26.2


