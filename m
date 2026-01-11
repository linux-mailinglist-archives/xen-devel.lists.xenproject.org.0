Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC824D0E10C
	for <lists+xen-devel@lfdr.de>; Sun, 11 Jan 2026 05:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199670.1515924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo8-0005PH-Ez; Sun, 11 Jan 2026 04:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199670.1515924; Sun, 11 Jan 2026 04:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vemo8-0005NR-B0; Sun, 11 Jan 2026 04:12:04 +0000
Received: by outflank-mailman (input) for mailman id 1199670;
 Sun, 11 Jan 2026 04:12:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vemo6-00056N-G8
 for xen-devel@lists.xenproject.org; Sun, 11 Jan 2026 04:12:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo5-001xpY-21;
 Sun, 11 Jan 2026 04:12:01 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vemo5-000Y6K-2F;
 Sun, 11 Jan 2026 04:12:01 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=foxDb3geIou8JW8wuomGx2/i1qOo8eC7hBk0Ml/97QE=; b=U7mKRMHeM/Nu8OcpI71xY6D1sK
	hjbmlC8XouXkW3q6JlNMFecLWP/1Shj1wCzHf8W96hWwTr/UfrST5S8ZnlBpPvoX1YlZWsboOjPvL
	Oo7nhKw8JxSZ3zRpEvwY1Rwko1nmaJ0VecAjWog1NXw2PHlSU0u0Vwz/XD9vJemkrKKk=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v2 4/4] tests: use unit test fragment in vPCI test
Date: Sat, 10 Jan 2026 20:11:45 -0800
Message-ID: <20260111041145.553673-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111041145.553673-1-dmukhin@ford.com>
References: <20260111041145.553673-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Use the new make fragment to generate test harness code for
the vPCI unit test.

Add new prepare-harness target to tests/Rules.mk as an optional step for
setting up mocked environment for building a test.

Fix hypervisor headers used to compile vpci.c against host environment
where necessary.

Fixup emul.h by adding missing mocks to account for new unit test infra.

Update .gitignore to exclude generated test build-time dependencies.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 tools/tests/Rules.mk        |  5 +++-
 tools/tests/vpci/.gitignore |  2 ++
 tools/tests/vpci/Makefile   | 52 ++++++++++++-------------------------
 tools/tests/vpci/emul.h     | 50 +++++++++++++----------------------
 tools/tests/vpci/main.c     |  2 --
 xen/include/xen/irq.h       |  2 ++
 xen/include/xen/list.h      |  2 ++
 xen/include/xen/numa.h      |  2 ++
 xen/include/xen/pci.h       |  2 ++
 xen/include/xen/pfn.h       |  2 ++
 xen/include/xen/spinlock.h  |  2 ++
 xen/include/xen/types.h     |  4 +++
 12 files changed, 56 insertions(+), 71 deletions(-)
 create mode 100644 tools/tests/vpci/.gitignore

diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
index daa9e69301e4..26f3d00b5fb9 100644
--- a/tools/tests/Rules.mk
+++ b/tools/tests/Rules.mk
@@ -11,13 +11,16 @@ $(shell sed -n \
     's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
 endef
 
+.PHONY: prepare-harness
+prepare-harness:
+
 # Generate mock environment by replicating header file hierarchy;
 # each header file will point to a harness header.
 #
 # $1 target
 # $2 list of test harnesses
 define emit-harness-nested-rule
-$(1): $(2)
+$(1): prepare-harness $(2)
 	set -e; \
 	mkdir -p $$(@D); \
 	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
diff --git a/tools/tests/vpci/.gitignore b/tools/tests/vpci/.gitignore
new file mode 100644
index 000000000000..d66c2cd56be6
--- /dev/null
+++ b/tools/tests/vpci/.gitignore
@@ -0,0 +1,2 @@
+/generated
+test-vpci
diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
index 97359ff67f86..695a275675f8 100644
--- a/tools/tests/vpci/Makefile
+++ b/tools/tests/vpci/Makefile
@@ -1,43 +1,23 @@
-XEN_ROOT=$(CURDIR)/../../..
-include $(XEN_ROOT)/tools/Rules.mk
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Unit tests for vPCI.
+#
 
-TARGET := test_vpci
+TESTS := test-vpci
 
-.PHONY: all
-all: $(TARGET)
+XEN_ROOT = $(CURDIR)/../../..
+CFLAGS += -DCONFIG_HAS_VPCI
 
-.PHONY: run
-run: $(TARGET)
-ifeq ($(CC),$(HOSTCC))
-	./$(TARGET)
-else
-	$(warning HOSTCC != CC, will not run test)
-endif
+include $(XEN_ROOT)/tools/tests/Rules.mk
 
-$(TARGET): vpci.c vpci.h list.h main.c emul.h
-	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
+# Do not mock xen/vpci.h header for the test
+prepare-harness:
+	set -e; mkdir -p $(CURDIR)/generated/xen; \
+	ln -sf $(XEN_ROOT)/xen/include/xen/vpci.h $(CURDIR)/generated/xen
 
-.PHONY: clean
-clean:
-	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
+CFLAGS += -I $(XEN_ROOT)/xen/include/
 
-.PHONY: distclean
-distclean: clean
+$(eval $(call vpath-with-harness-deps,vpci.c,$(XEN_ROOT)/xen/drivers/vpci/,emul.h))
 
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
-	$(INSTALL_PROG) $(TARGET) $(DESTDIR)$(LIBEXEC)/tests
-
-.PHONY: uninstall
-uninstall:
-	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
-
-vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
-	# Remove includes and add the test harness header
-	sed -e '/#include/d' -e '1s/^/#include "emul.h"/' <$< >$@
-
-list.h: $(XEN_ROOT)/xen/include/xen/list.h
-vpci.h: $(XEN_ROOT)/xen/include/xen/vpci.h
-list.h vpci.h:
-	sed -e '/#include/d' <$< >$@
+test-vpci: vpci.o main.o
+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index dd048cffbf9d..979e86e2692e 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -34,8 +34,16 @@
 #define ASSERT(x) assert(x)
 #define __must_check __attribute__((__warn_unused_result__))
 #define cf_check
+#define always_inline inline
 
-#include "list.h"
+typedef int64_t s_time_t;
+typedef uint8_t nodeid_t;
+typedef uint8_t u8;
+typedef uint16_t u16;
+typedef uint32_t u32;
+typedef uint64_t u64;
+
+#include <xen/list.h>
 
 typedef bool rwlock_t;
 
@@ -43,10 +51,6 @@ struct domain {
     rwlock_t pci_lock;
 };
 
-struct pci_dev {
-    struct vpci *vpci;
-};
-
 struct vcpu
 {
     struct domain *domain;
@@ -57,35 +61,17 @@ extern const struct pci_dev test_pdev;
 
 typedef bool spinlock_t;
 #define spin_lock_init(l) (*(l) = false)
-#define spin_lock(l) (*(l) = true)
-#define spin_unlock(l) (*(l) = false)
-#define read_lock(l) (*(l) = true)
-#define read_unlock(l) (*(l) = false)
-#define write_lock(l) (*(l) = true)
-#define write_unlock(l) (*(l) = false)
+#define spin_lock(l) (assert(!*(l)), *(l) = true)
+#define spin_unlock(l) (assert(*(l)), *(l) = false)
+#define read_lock(l) (assert(!*(l)), *(l) = true)
+#define read_unlock(l) (assert(*(l)), *(l) = false)
+#define write_lock(l) (assert(!*(l)), *(l) = true)
+#define write_unlock(l) (assert(*(l)), *(l) = false)
 
-typedef union {
-    uint32_t sbdf;
-    struct {
-        union {
-            uint16_t bdf;
-            struct {
-                union {
-                    struct {
-                        uint8_t func : 3,
-                                dev  : 5;
-                    };
-                    uint8_t     extfunc;
-                };
-                uint8_t         bus;
-            };
-        };
-        uint16_t                seg;
-    };
-} pci_sbdf_t;
+#define lock_evaluate_nospec(l) (l)
+#define block_lock_speculation()
 
-#define CONFIG_HAS_VPCI
-#include "vpci.h"
+#include <xen/vpci.h>
 
 #define __hwdom_init
 
diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 2ef8d4e03f1d..3753417e866d 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -189,8 +189,6 @@ main(int argc, char **argv)
     uint32_t r24 = 0;
     uint8_t r28, r30;
     struct mask_data r32;
-    unsigned int i;
-    int rc;
 
     INIT_LIST_HEAD(&vpci.handlers);
     spin_lock_init(&vpci.lock);
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 6071b00f621e..f7fa1d0fa29b 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -1,5 +1,6 @@
 #ifndef __XEN_IRQ_H__
 #define __XEN_IRQ_H__
+#ifdef __XEN__
 
 #include <xen/cpumask.h>
 #include <xen/rcupdate.h>
@@ -208,4 +209,5 @@ unsigned int arch_hwdom_irqs(const struct domain *d);
 void arch_evtchn_bind_pirq(struct domain *d, int pirq);
 #endif
 
+#endif /* __XEN__ */
 #endif /* __XEN_IRQ_H__ */
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 98d8482daba1..06d2fa3aed15 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -7,8 +7,10 @@
 #ifndef __XEN_LIST_H__
 #define __XEN_LIST_H__
 
+#ifdef __XEN__
 #include <xen/bug.h>
 #include <asm/system.h>
+#endif
 
 /*
  * These are non-NULL pointers that will result in faults under normal
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index f6c1f27ca105..80d60fd49178 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -1,5 +1,6 @@
 #ifndef _XEN_NUMA_H
 #define _XEN_NUMA_H
+#ifdef __XEN__
 
 #include <xen/mm-frame.h>
 
@@ -152,4 +153,5 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
 
+#endif /* __XEN__ */
 #endif /* _XEN_NUMA_H */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 130c2a8c1a65..f5965a68ae33 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -14,7 +14,9 @@
 #include <xen/numa.h>
 #include <xen/pci_regs.h>
 #include <xen/pfn.h>
+#ifdef __XEN__
 #include <asm/device.h>
+#endif
 
 /*
  * The PCI interface treats multi-function devices as independent
diff --git a/xen/include/xen/pfn.h b/xen/include/xen/pfn.h
index 1ca9b095e0df..98ff669d7def 100644
--- a/xen/include/xen/pfn.h
+++ b/xen/include/xen/pfn.h
@@ -1,7 +1,9 @@
 #ifndef __XEN_PFN_H__
 #define __XEN_PFN_H__
 
+#ifdef __XEN__
 #include <xen/page-size.h>
+#endif
 
 #define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
 #define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ca9d8c7ec0a1..ad5094c4eb92 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -1,5 +1,6 @@
 #ifndef __SPINLOCK_H__
 #define __SPINLOCK_H__
+#ifdef __XEN__
 
 #include <xen/nospec.h>
 #include <xen/time.h>
@@ -360,4 +361,5 @@ static always_inline void nrspin_lock_irq(rspinlock_t *l)
 #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
 #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
 
+#endif /* __XEN__ */
 #endif /* __SPINLOCK_H__ */
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 73ddccbbd5dc..e5d702b48ac0 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -4,6 +4,7 @@
 #include <xen/stdbool.h>
 #include <xen/stdint.h>
 
+#ifdef __XEN__
 /* Linux inherited types which are being phased out */
 typedef uint8_t u8;
 typedef uint16_t u16;
@@ -15,6 +16,7 @@ typedef uint64_t u64;
 typedef __SIZE_TYPE__ size_t;
 
 typedef signed long ssize_t;
+#endif /* __XEN__ */
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 typedef __UINTPTR_TYPE__ uintptr_t;
@@ -33,6 +35,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
 #define NULL ((void*)0)
 #endif
 
+#ifdef __XEN__
 #define INT8_MIN        (-127-1)
 #define INT16_MIN       (-32767-1)
 #define INT32_MIN       (-2147483647-1)
@@ -52,6 +55,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
 #define LONG_MAX        ((long)(~0UL>>1))
 #define LONG_MIN        (-LONG_MAX - 1)
 #define ULONG_MAX       (~0UL)
+#endif /* __XEN__ */
 
 typedef uint16_t __le16;
 typedef uint16_t __be16;
-- 
2.52.0


