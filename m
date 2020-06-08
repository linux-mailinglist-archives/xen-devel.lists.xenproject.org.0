Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0731F2069
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 22:03:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiNzV-0004Rz-EH; Mon, 08 Jun 2020 20:03:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmkZ=7V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jiNzU-0004Ro-1h
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 20:03:28 +0000
X-Inumbo-ID: 1d19e757-a9c3-11ea-b2b4-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d19e757-a9c3-11ea-b2b4-12813bfff9fa;
 Mon, 08 Jun 2020 20:03:26 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vrPx+l5c6c1DQApKmkH6KuR7ukEc+x/2qf/ndpPZ+F0DZF33YblI2d2PGxzfYArUPJGQFvuD/Q
 V/VH14OawbstzgOp/uX9/W1g1jtmbtW3707NsIgLAPErbOArL6TEP1qjCnRKMLZqNpbDgc2ZRD
 3Gn1jka14moTRxDHNUG2Rx/LcVYknILDUun3kYavZhg/SxWkhel9JWDyiZODMPVIo2qVj0M7BQ
 NrNxucq9e9K6FBchWtHfjUy/16lCdmusdc3wexBnkIbidpeKw89JHBtgPgwnSBw/UFAYO3p/YD
 JUY=
X-SBRS: 2.7
X-MesageID: 19811629
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19811629"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] x86/livepatch: Make livepatching compatible with CET
 Shadow Stacks
Date: Mon, 8 Jun 2020 21:02:59 +0100
Message-ID: <20200608200259.17681-1-andrew.cooper3@citrix.com>
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
and reset the dirty bits on all virtual regions before re-enabling CET.  One
complication is that arch_livepatch_revive() has to fix up the top of the
shadow stack.

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

A better longterm plan (but definitely 4.15 material now) would be to create a
separate set of writeable mappings to perform the patching on, at which point
we don't need to disable CET, play with WP, or retroactively clear dirty bits.

Do we ever write into .rodata?  AFAICT, we introduce new fuctions for
references to new .rodata, rather than modifying existing .rodata.  If however
we do modify .rodata, then the virtual regions need extending with information
about .rodata so we can zap those dirty bits as well.
---
 xen/arch/x86/livepatch.c         | 28 ++++++++++++++++++++++++++++
 xen/common/virtual_region.c      | 13 +++++++++++++
 xen/include/xen/virtual_region.h |  1 +
 3 files changed, 42 insertions(+)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 901fad96bf..10231a4e40 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -12,6 +12,7 @@
 #include <xen/livepatch.h>
 #include <xen/sched.h>
 #include <xen/vm_event.h>
+#include <xen/virtual_region.h>
 
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
@@ -58,6 +59,10 @@ int arch_livepatch_safety_check(void)
 
 int arch_livepatch_quiesce(void)
 {
+    /* If Shadow Stacks are in use, disable CR4.CET so we can modify CR0.WP. */
+    if ( cpu_has_xen_shstk )
+        write_cr4(read_cr4() & ~X86_CR4_CET);
+
     /* Disable WP to allow changes to read-only pages. */
     write_cr0(read_cr0() & ~X86_CR0_WP);
 
@@ -68,6 +73,29 @@ void arch_livepatch_revive(void)
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
+         */
+        asm volatile ("rdsspq %[ssp];"
+                      "wrssq %[addr], (%[ssp]);"
+                      : [ssp] "=&r" (tmp)
+                      : [addr] "r" (__builtin_return_address(0)));
+    }
 }
 
 int arch_livepatch_verify_func(const struct livepatch_func *func)
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index aa23918bce..84d993d8f8 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -4,6 +4,7 @@
 
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/mm.h>
 #include <xen/rcupdate.h>
 #include <xen/spinlock.h>
 #include <xen/virtual_region.h>
@@ -91,6 +92,18 @@ void unregister_virtual_region(struct virtual_region *r)
     remove_virtual_region(r);
 }
 
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


