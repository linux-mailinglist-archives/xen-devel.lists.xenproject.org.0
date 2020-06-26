Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788520B157
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 14:25:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jonPM-0005l5-CM; Fri, 26 Jun 2020 12:24:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3dG=AH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jonPL-0005kz-09
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 12:24:39 +0000
X-Inumbo-ID: 00242e66-b7a8-11ea-82ac-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00242e66-b7a8-11ea-82ac-12813bfff9fa;
 Fri, 26 Jun 2020 12:24:37 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YNOnRxIV8JqcqbvcQC1FHLkfIUXUMG/6bZiLkUpJrtE9jva1jmW3K2EO4VI73Y2IxVPqkAjKhJ
 jtL8rsQ19CZ/b+Z7w2ZdkSVbiNbZZ1jTSJKHIe5oYQ+4oAR6WBi+oiZakSQ8JUF/SYfR+0OgMx
 +1x8/3Gk/hS5LPuCYKIFsf3ouruxDV2wRIIbX/wVQkm+OYW+AftlZffcy31jkCtrTXbNJjXQPw
 4+g/11kMmhpW6Pon6tltLeD5urm0IkLVvN8hk2QWUNwDGTGl4kU+fe+xEDVBjPfkRzXKjL4c/o
 SPY=
X-SBRS: 2.7
X-MesageID: 21820672
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,283,1589256000"; d="scan'208";a="21820672"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 for-4.14] x86/livepatch: Make livepatching compatible with
 CET Shadow Stacks
Date: Fri, 26 Jun 2020 13:24:08 +0100
Message-ID: <20200626122408.19151-1-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, Paul Durrant <paul@xen.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just like the alternatives infrastructure, the livepatch infrastructure
disables CR0.WP to perform patching, which is not permitted with CET active.

Modify arch_livepatch_{quiesce,revive}() to disable CET before disabling WP,
and reset the dirty bits on all virtual regions before re-enabling CET.

One complication is that arch_livepatch_revive() has to fix up the top of the
shadow stack.  This depends on the functions not being inlined, even under
LTO.  Another limitation is that reset_virtual_region_perms() may shatter the
final superpage of .text depending on alignment.

This logic, and its downsides, are temporary until the patching infrastructure
can be adjusted to not use CR0.WP.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Pawel Wieczorkiewicz <wipawel@amazon.de>
CC: Paul Durrant <paul@xen.org>

For 4.14.  This is a bug in a 4.14 feature, with a very low risk to non-CET
usecases.

v2:
 * nolinline, and extra ifdefary
 * Expand comments
---
 xen/arch/x86/livepatch.c         | 35 +++++++++++++++++++++++++++++++++--
 xen/common/virtual_region.c      | 15 +++++++++++++++
 xen/include/xen/virtual_region.h |  1 +
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 901fad96bf..49f0d902e5 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -12,6 +12,7 @@
 #include <xen/livepatch.h>
 #include <xen/sched.h>
 #include <xen/vm_event.h>
+#include <xen/virtual_region.h>
 
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
@@ -56,18 +57,48 @@ int arch_livepatch_safety_check(void)
     return -EBUSY;
 }
 
-int arch_livepatch_quiesce(void)
+int noinline arch_livepatch_quiesce(void)
 {
+    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
+    if ( cpu_has_xen_shstk )
+        write_cr4(read_cr4() & ~X86_CR4_CET);
+
     /* Disable WP to allow changes to read-only pages. */
     write_cr0(read_cr0() & ~X86_CR0_WP);
 
     return 0;
 }
 
-void arch_livepatch_revive(void)
+void noinline arch_livepatch_revive(void)
 {
     /* Reinstate WP. */
     write_cr0(read_cr0() | X86_CR0_WP);
+
+    /* Clobber dirty bits and reinstate CET, if applicable. */
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && cpu_has_xen_shstk )
+    {
+        unsigned long tmp;
+
+        reset_virtual_region_perms();
+
+        write_cr4(read_cr4() | X86_CR4_CET);
+
+        /*
+         * Fix up the return address on the shadow stack, which currently
+         * points at arch_livepatch_quiesce()'s caller.
+         *
+         * Note: this is somewhat fragile, and depends on both
+         * arch_livepatch_{quiesce,revive}() being called from the same
+         * function, which is currently the case.
+         *
+         * Any error will result in Xen dying with #CP, and its too late to
+         * recover in any way.
+         */
+        asm volatile ("rdsspq %[ssp];"
+                      "wrssq %[addr], (%[ssp]);"
+                      : [ssp] "=&r" (tmp)
+                      : [addr] "r" (__builtin_return_address(0)));
+    }
 }
 
 int arch_livepatch_verify_func(const struct livepatch_func *func)
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index aa23918bce..4fbc02e35a 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -4,6 +4,7 @@
 
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/mm.h>
 #include <xen/rcupdate.h>
 #include <xen/spinlock.h>
 #include <xen/virtual_region.h>
@@ -91,6 +92,20 @@ void unregister_virtual_region(struct virtual_region *r)
     remove_virtual_region(r);
 }
 
+#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_XEN_SHSTK)
+void reset_virtual_region_perms(void)
+{
+    const struct virtual_region *region;
+
+    rcu_read_lock(&rcu_virtual_region_lock);
+    list_for_each_entry_rcu( region, &virtual_region_list, list )
+        modify_xen_mappings((unsigned long)region->start,
+                            ROUNDUP((unsigned long)region->end, PAGE_SIZE),
+                            PAGE_HYPERVISOR_RX);
+    rcu_read_unlock(&rcu_virtual_region_lock);
+}
+#endif
+
 void __init unregister_init_virtual_region(void)
 {
     BUG_ON(system_state != SYS_STATE_active);
diff --git a/xen/include/xen/virtual_region.h b/xen/include/xen/virtual_region.h
index e5e58ed96b..ba408eb87a 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -33,6 +33,7 @@ void setup_virtual_regions(const struct exception_table_entry *start,
 void unregister_init_virtual_region(void);
 void register_virtual_region(struct virtual_region *r);
 void unregister_virtual_region(struct virtual_region *r);
+void reset_virtual_region_perms(void);
 
 #endif /* __XEN_VIRTUAL_REGION_H__ */
 
-- 
2.11.0


