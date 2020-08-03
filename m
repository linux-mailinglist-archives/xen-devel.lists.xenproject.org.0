Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C91A23AC43
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f67-0008Ii-5d; Mon, 03 Aug 2020 18:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f66-0008F4-6y
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:06 +0000
X-Inumbo-ID: 32a454ac-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a454ac-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x9so40753131ljc.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VIKpZkxDN7eQd+zJAH4AgFtCzYqVcctBBddhzvbPXqo=;
 b=e3j1/HkO5R1dXvlgaiWw5rxSTHJNvfO+l/S5WMMyuCpZT87m6Yf1MuLXhh7PY9EnyD
 1MGTQ0pNfMRuS/r5cVGQ1Zvx0z0V1D2I3+F+8d8JXrnXvQUxzmVphWWnJ/Tg3gbnRWbf
 cmGIx8NhkU0LyA3pVWBrW7C3WhUcWjxMGmzu9+L+SpY9rmHoAbGVqBk4AK1ElrudJRxT
 m5Z8SetlPA0SefvIYsKN0lmNhoLc/DZJP5fMdsxY+JMflv2Q19W8opgMzLdIyXIdBz03
 05qzhXPYECXlvfzlqXWSyKC9CQxiB4GE/PIIovF+KUx4+JJfziMEcQnE2zMP7UAChF+2
 D0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VIKpZkxDN7eQd+zJAH4AgFtCzYqVcctBBddhzvbPXqo=;
 b=IO6HgMFg8Ul7SRYbre/ySRS8mqEKQZ1EXdrofh/IdWJ+8PsHXXzUXnhNgYsSG98iHJ
 Th/0+XeiG4s5XfPZmNy+5MIZBr42XZVQRaFZ3GoZ2YqIxp4P7as7mw9Bn5S2eJZtsUXR
 hdTKhHXOJ97euwtycajj82jbKppwarYv5dCKotl9dSL1mo9Xg2BDjMhnXQ5ccpwHge9V
 H5UyHOr1WcsxjQ8okPO1Biv8psR+SC49VQDC7SkIOSRJJqPgriJ845qIbX0LNHp/BdKS
 qPxBmElkPXWDl+sOsMFV1dNE5dxaKIVfKSa7akPE6QPA5Fn59GM+m0eSk0vQR+yfq76e
 XkgQ==
X-Gm-Message-State: AOAM531bq8jzLcyTl9XstEyFlGNyxL9MFFIIz0g3oaMHyHajxHDe78/t
 WKImdz+QZCOIlnfsYWZrdOeWy/cZCFE=
X-Google-Smtp-Source: ABdhPJyPm5Z4kwcrUWIHRyaRXM9q/twQEsQ+GzpFpbwRFecJWQKGo/TF3Ea+USDqHv7zgWezKEs7Uw==
X-Received: by 2002:a2e:8346:: with SMTP id l6mr8686276ljh.0.1596478908667;
 Mon, 03 Aug 2020 11:21:48 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:48 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
Date: Mon,  3 Aug 2020 21:21:20 +0300
Message-Id: <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch makes possible to forward Guest MMIO accesses
to a device emulator on Arm and enables that support for
Arm64.

Also update XSM code a bit to let DM op be used on Arm.
New arch DM op will be introduced in the follow-up patch.

Please note, at the moment build on Arm32 is broken
(see cmpxchg usage in hvm_send_buffered_ioreq()) if someone
wants to enable CONFIG_IOREQ_SERVER due to the lack of
cmpxchg_64 support on Arm32.

Please note, this is a split/cleanup of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 tools/libxc/xc_dom_arm.c        |  25 +++++++---
 xen/arch/arm/Kconfig            |   1 +
 xen/arch/arm/Makefile           |   2 +
 xen/arch/arm/dm.c               |  34 +++++++++++++
 xen/arch/arm/domain.c           |   9 ++++
 xen/arch/arm/hvm.c              |  46 +++++++++++++++++-
 xen/arch/arm/io.c               |  67 +++++++++++++++++++++++++-
 xen/arch/arm/ioreq.c            |  86 +++++++++++++++++++++++++++++++++
 xen/arch/arm/traps.c            |  17 +++++++
 xen/common/memory.c             |   5 +-
 xen/include/asm-arm/domain.h    |  80 +++++++++++++++++++++++++++++++
 xen/include/asm-arm/hvm/ioreq.h | 103 ++++++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/mmio.h      |   1 +
 xen/include/asm-arm/p2m.h       |   7 +--
 xen/include/xsm/dummy.h         |   4 +-
 xen/include/xsm/xsm.h           |   6 +--
 xen/xsm/dummy.c                 |   2 +-
 xen/xsm/flask/hooks.c           |   5 +-
 18 files changed, 476 insertions(+), 24 deletions(-)
 create mode 100644 xen/arch/arm/dm.c
 create mode 100644 xen/arch/arm/ioreq.c
 create mode 100644 xen/include/asm-arm/hvm/ioreq.h

diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
index 931404c..b5fc066 100644
--- a/tools/libxc/xc_dom_arm.c
+++ b/tools/libxc/xc_dom_arm.c
@@ -26,11 +26,19 @@
 #include "xg_private.h"
 #include "xc_dom.h"
 
-#define NR_MAGIC_PAGES 4
+
 #define CONSOLE_PFN_OFFSET 0
 #define XENSTORE_PFN_OFFSET 1
 #define MEMACCESS_PFN_OFFSET 2
 #define VUART_PFN_OFFSET 3
+#define IOREQ_SERVER_PFN_OFFSET 4
+
+#define NR_IOREQ_SERVER_PAGES 8
+#define NR_MAGIC_PAGES (4 + NR_IOREQ_SERVER_PAGES)
+
+#define GUEST_MAGIC_BASE_PFN (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT)
+
+#define special_pfn(x)  (GUEST_MAGIC_BASE_PFN + (x))
 
 #define LPAE_SHIFT 9
 
@@ -51,7 +59,7 @@ const char *xc_domain_get_native_protocol(xc_interface *xch,
 static int alloc_magic_pages(struct xc_dom_image *dom)
 {
     int rc, i;
-    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
+    const xen_pfn_t base = special_pfn(0);
     xen_pfn_t p2m[NR_MAGIC_PAGES];
 
     BUILD_BUG_ON(NR_MAGIC_PAGES > GUEST_MAGIC_SIZE >> XC_PAGE_SHIFT);
@@ -71,10 +79,9 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
     dom->xenstore_pfn = base + XENSTORE_PFN_OFFSET;
     dom->vuart_gfn = base + VUART_PFN_OFFSET;
 
-    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);
-    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
-    xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
-    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
+    /* XXX: Check return */
+    xc_clear_domain_pages(dom->xch, dom->guest_domid, special_pfn(0),
+                          NR_MAGIC_PAGES);
 
     xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
             dom->console_pfn);
@@ -88,6 +95,12 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
     xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_EVTCHN,
             dom->xenstore_evtchn);
 
+    /* Tell the domain where the pages are and how many there are. */
+    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_IOREQ_SERVER_PFN,
+                     special_pfn(IOREQ_SERVER_PFN_OFFSET));
+    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_NR_IOREQ_SERVER_PAGES,
+                     NR_IOREQ_SERVER_PAGES);
+
     return 0;
 }
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388..6b8a969 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -13,6 +13,7 @@ config ARM_64
 	def_bool y
 	depends on 64BIT
 	select HAS_FAST_MULTIPLY
+	select IOREQ_SERVER
 
 config ARM
 	def_bool y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7e82b21..617fa3e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -13,6 +13,7 @@ obj-y += cpuerrata.o
 obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
+obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
@@ -27,6 +28,7 @@ obj-y += guest_atomics.o
 obj-y += guest_walk.o
 obj-y += hvm.o
 obj-y += io.o
+obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
 obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
new file mode 100644
index 0000000..2437099
--- /dev/null
+++ b/xen/arch/arm/dm.c
@@ -0,0 +1,34 @@
+/*
+ * Copyright (c) 2019 Arm ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/hypercall.h>
+#include <asm/vgic.h>
+
+int arch_dm_op(struct xen_dm_op *op, struct domain *d,
+               const struct dmop_args *op_args, bool *const_op)
+{
+    return -EOPNOTSUPP;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3116932..658eec0 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -12,6 +12,7 @@
 #include <xen/bitops.h>
 #include <xen/errno.h>
 #include <xen/grant_table.h>
+#include <xen/hvm/ioreq.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -681,6 +682,10 @@ int arch_domain_create(struct domain *d,
 
     ASSERT(config != NULL);
 
+#ifdef CONFIG_IOREQ_SERVER
+    hvm_ioreq_init(d);
+#endif
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
@@ -999,6 +1004,10 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
 
+#ifdef CONFIG_IOREQ_SERVER
+        hvm_destroy_all_ioreq_servers(d);
+#endif
+
     PROGRESS(xen):
         ret = relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 8951b34..0379493 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -51,6 +51,14 @@ static int hvm_allow_set_param(const struct domain *d, unsigned int param)
     case HVM_PARAM_MONITOR_RING_PFN:
         return d == current->domain ? -EPERM : 0;
 
+        /*
+         * XXX: Do we need to follow x86's logic here:
+         * "The following parameters should only be changed once"?
+         */
+    case HVM_PARAM_IOREQ_SERVER_PFN:
+    case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
+        return 0;
+
         /* Writeable only by Xen, hole, deprecated, or out-of-range. */
     default:
         return -EINVAL;
@@ -69,6 +77,11 @@ static int hvm_allow_get_param(const struct domain *d, unsigned int param)
     case HVM_PARAM_CONSOLE_EVTCHN:
         return 0;
 
+        /* XXX: Could these be read by someone? What policy to apply? */
+    case HVM_PARAM_IOREQ_SERVER_PFN:
+    case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
+        return 0;
+
         /*
          * The following parameters are intended for toolstack usage only.
          * They may not be read by the domain.
@@ -82,6 +95,37 @@ static int hvm_allow_get_param(const struct domain *d, unsigned int param)
     }
 }
 
+static int hvmop_set_param(struct domain *d, const struct xen_hvm_param *a)
+{
+    int rc = 0;
+
+    switch ( a->index )
+    {
+    case HVM_PARAM_IOREQ_SERVER_PFN:
+        d->arch.hvm.ioreq_gfn.base = a->value;
+        break;
+    case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
+    {
+        unsigned int i;
+
+        if ( a->value == 0 ||
+             a->value > sizeof(d->arch.hvm.ioreq_gfn.mask) * 8 )
+        {
+            rc = -EINVAL;
+            break;
+        }
+        for ( i = 0; i < a->value; i++ )
+            set_bit(i, &d->arch.hvm.ioreq_gfn.mask);
+
+        break;
+    }
+    }
+
+    d->arch.hvm.params[a->index] = a->value;
+
+    return rc;
+}
+
 long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
@@ -111,7 +155,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( rc )
                 goto param_fail;
 
-            d->arch.hvm.params[a.index] = a.value;
+            rc = hvmop_set_param(d, &a);
         }
         else
         {
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index ae7ef96..436f669 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/hvm/ioreq.h>
 #include <xen/lib.h>
 #include <xen/spinlock.h>
 #include <xen/sched.h>
@@ -107,6 +108,62 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
     return handler;
 }
 
+#ifdef CONFIG_IOREQ_SERVER
+static enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
+                                    struct vcpu *v, mmio_info_t *info)
+{
+    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
+    ioreq_t p = {
+        .type = IOREQ_TYPE_COPY,
+        .addr = info->gpa,
+        .size = 1 << info->dabt.size,
+        .count = 0,
+        .dir = !info->dabt.write,
+        .df = 0,         /* XXX: What's for? */
+        .data = get_user_reg(regs, info->dabt.reg),
+        .state = STATE_IOREQ_READY,
+    };
+    struct hvm_ioreq_server *s = NULL;
+    enum io_state rc;
+
+    switch ( vio->io_req.state )
+    {
+    case STATE_IOREQ_NONE:
+        break;
+    default:
+        printk("d%u wrong state %u\n", v->domain->domain_id,
+               vio->io_req.state);
+        return IO_ABORT;
+    }
+
+    s = hvm_select_ioreq_server(v->domain, &p);
+    if ( !s )
+        return IO_UNHANDLED;
+
+    if ( !info->dabt.valid )
+    {
+        printk("Valid bit not set\n");
+        return IO_ABORT;
+    }
+
+    vio->io_req = p;
+
+    rc = hvm_send_ioreq(s, &p, 0);
+    if ( rc != IO_RETRY || v->domain->is_shutting_down )
+        vio->io_req.state = STATE_IOREQ_NONE;
+    else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
+        rc = IO_HANDLED;
+    else
+        vio->io_completion = HVMIO_mmio_completion;
+
+    /* XXX: Decide what to do */
+    if ( rc == IO_RETRY )
+        rc = IO_HANDLED;
+
+    return rc;
+}
+#endif
+
 enum io_state try_handle_mmio(struct cpu_user_regs *regs,
                               const union hsr hsr,
                               paddr_t gpa)
@@ -123,7 +180,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 
     handler = find_mmio_handler(v->domain, info.gpa);
     if ( !handler )
-        return IO_UNHANDLED;
+    {
+        int rc = IO_UNHANDLED;
+
+#ifdef CONFIG_IOREQ_SERVER
+        rc = try_fwd_ioserv(regs, v, &info);
+#endif
+
+        return rc;
+    }
 
     /* All the instructions used on emulated MMIO region should be valid */
     if ( !dabt.valid )
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
new file mode 100644
index 0000000..a9cc839
--- /dev/null
+++ b/xen/arch/arm/ioreq.c
@@ -0,0 +1,86 @@
+/*
+ * arm/ioreq.c: hardware virtual machine I/O emulation
+ *
+ * Copyright (c) 2019 Arm ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/ctype.h>
+#include <xen/hvm/ioreq.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/trace.h>
+#include <xen/sched.h>
+#include <xen/irq.h>
+#include <xen/softirq.h>
+#include <xen/domain.h>
+#include <xen/domain_page.h>
+#include <xen/event.h>
+#include <xen/paging.h>
+#include <xen/vpci.h>
+
+#include <public/hvm/dm_op.h>
+#include <public/hvm/ioreq.h>
+
+bool handle_mmio(void)
+{
+    struct vcpu *v = current;
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    const union hsr hsr = { .bits = regs->hsr };
+    const struct hsr_dabt dabt = hsr.dabt;
+    /* Code is similar to handle_read */
+    uint8_t size = (1 << dabt.size) * 8;
+    register_t r = v->arch.hvm.hvm_io.io_req.data;
+
+    /* We should only be here on Guest Data Abort */
+    ASSERT(dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
+
+    /* We are done with the IO */
+    /* XXX: Is it the right place? */
+    v->arch.hvm.hvm_io.io_req.state = STATE_IOREQ_NONE;
+
+    /* XXX: Do we need to take care of write here ? */
+    if ( dabt.write )
+        return true;
+
+    /*
+     * Sign extend if required.
+     * Note that we expect the read handler to have zeroed the bits
+     * outside the requested access size.
+     */
+    if ( dabt.sign && (r & (1UL << (size - 1))) )
+    {
+        /*
+         * We are relying on register_t using the same as
+         * an unsigned long in order to keep the 32-bit assembly
+         * code smaller.
+         */
+        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
+        r |= (~0UL) << size;
+    }
+
+    set_user_reg(regs, dabt.reg, r);
+
+    return true;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 8f40d0e..4cdf098 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -18,6 +18,7 @@
 
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/hvm/ioreq.h>
 #include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
@@ -1384,6 +1385,9 @@ static arm_hypercall_t arm_hypercall_table[] = {
 #ifdef CONFIG_HYPFS
     HYPERCALL(hypfs_op, 5),
 #endif
+#ifdef CONFIG_IOREQ_SERVER
+    HYPERCALL(dm_op, 3),
+#endif
 };
 
 #ifndef NDEBUG
@@ -1958,6 +1962,9 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             case IO_UNHANDLED:
                 /* IO unhandled, try another way to handle it. */
                 break;
+            default:
+                /* XXX: Handle IO_RETRY */
+                ASSERT_UNREACHABLE();
             }
         }
 
@@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
  */
 void leave_hypervisor_to_guest(void)
 {
+#ifdef CONFIG_IOREQ_SERVER
+    /*
+     * XXX: Check the return. Shall we call that in
+     * continue_running and context_switch instead?
+     * The benefits would be to avoid calling
+     * handle_hvm_io_completion on every return.
+     */
+    local_irq_enable();
+    handle_hvm_io_completion(current);
+#endif
     local_irq_disable();
 
     check_for_vcpu_work();
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 9283e5e..0000477 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -8,6 +8,7 @@
  */
 
 #include <xen/domain_page.h>
+#include <xen/hvm/ioreq.h>
 #include <xen/types.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -30,10 +31,6 @@
 #include <public/memory.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_IOREQ_SERVER
-#include <xen/hvm/ioreq.h>
-#endif
-
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #endif
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 4e2f582..e060b0a 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -11,12 +11,64 @@
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
 #include <public/hvm/params.h>
+#include <public/hvm/dm_op.h>
+#include <public/hvm/ioreq.h>
 #include <xen/serial.h>
 #include <xen/rbtree.h>
 
+struct hvm_ioreq_page {
+    gfn_t gfn;
+    struct page_info *page;
+    void *va;
+};
+
+struct hvm_ioreq_vcpu {
+    struct list_head list_entry;
+    struct vcpu      *vcpu;
+    evtchn_port_t    ioreq_evtchn;
+    bool             pending;
+};
+
+#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
+#define MAX_NR_IO_RANGES  256
+
+#define MAX_NR_IOREQ_SERVERS 8
+#define DEFAULT_IOSERVID 0
+
+struct hvm_ioreq_server {
+    struct domain          *target, *emulator;
+
+    /* Lock to serialize toolstack modifications */
+    spinlock_t             lock;
+
+    struct hvm_ioreq_page  ioreq;
+    struct list_head       ioreq_vcpu_list;
+    struct hvm_ioreq_page  bufioreq;
+
+    /* Lock to serialize access to buffered ioreq ring */
+    spinlock_t             bufioreq_lock;
+    evtchn_port_t          bufioreq_evtchn;
+    struct rangeset        *range[NR_IO_RANGE_TYPES];
+    bool                   enabled;
+    uint8_t                bufioreq_handling;
+};
+
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
+
+    /* Guest page range used for non-default ioreq servers */
+    struct {
+        unsigned long base;
+        unsigned long mask;
+        unsigned long legacy_mask; /* indexed by HVM param number */
+    } ioreq_gfn;
+
+    /* Lock protects all other values in the sub-struct and the default */
+    struct {
+        spinlock_t              lock;
+        struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
+    } ioreq_server;
 };
 
 #ifdef CONFIG_ARM_64
@@ -93,6 +145,29 @@ struct arch_domain
 #endif
 }  __cacheline_aligned;
 
+enum hvm_io_completion {
+    HVMIO_no_completion,
+    HVMIO_mmio_completion,
+    HVMIO_pio_completion,
+    HVMIO_realmode_completion
+};
+
+struct hvm_vcpu_io {
+    /* I/O request in flight to device model. */
+    enum hvm_io_completion io_completion;
+    ioreq_t                io_req;
+
+    /*
+     * HVM emulation:
+     *  Linear address @mmio_gla maps to MMIO physical frame @mmio_gpfn.
+     *  The latter is known to be an MMIO frame (not RAM).
+     *  This translation is only valid for accesses as per @mmio_access.
+     */
+    struct npfec        mmio_access;
+    unsigned long       mmio_gla;
+    unsigned long       mmio_gpfn;
+};
+
 struct arch_vcpu
 {
     struct {
@@ -206,6 +281,11 @@ struct arch_vcpu
      */
     bool need_flush_to_ram;
 
+    struct hvm_vcpu
+    {
+        struct hvm_vcpu_io hvm_io;
+    } hvm;
+
 }  __cacheline_aligned;
 
 void vcpu_show_execution_state(struct vcpu *);
diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
new file mode 100644
index 0000000..83a560c
--- /dev/null
+++ b/xen/include/asm-arm/hvm/ioreq.h
@@ -0,0 +1,103 @@
+/*
+ * hvm.h: Hardware virtual machine assist interface definitions.
+ *
+ * Copyright (c) 2016 Citrix Systems Inc.
+ * Copyright (c) 2019 Arm ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_ARM_HVM_IOREQ_H__
+#define __ASM_ARM_HVM_IOREQ_H__
+
+#include <public/hvm/ioreq.h>
+#include <public/hvm/dm_op.h>
+
+#define has_vpci(d) (false)
+
+bool handle_mmio(void);
+
+static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
+{
+    /* XXX */
+    BUG();
+    return true;
+}
+
+static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
+{
+    return p->addr;
+}
+
+static inline paddr_t hvm_mmio_last_byte(const ioreq_t *p)
+{
+    unsigned long size = p->size;
+
+    return p->addr + size - 1;
+}
+
+struct hvm_ioreq_server;
+
+static inline int p2m_set_ioreq_server(struct domain *d,
+                                       unsigned int flags,
+                                       struct hvm_ioreq_server *s)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline void msix_write_completion(struct vcpu *v)
+{
+}
+
+static inline void handle_realmode_completion(void)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
+{
+}
+
+static inline void hvm_get_ioreq_server_range_type(struct domain *d,
+                                                   ioreq_t *p,
+                                                   uint8_t *type,
+                                                   uint64_t *addr)
+{
+    *type = (p->type == IOREQ_TYPE_PIO) ?
+             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
+    *addr = p->addr;
+}
+
+static inline void arch_hvm_ioreq_init(struct domain *d)
+{
+}
+
+static inline void arch_hvm_ioreq_destroy(struct domain *d)
+{
+}
+
+#define IOREQ_IO_HANDLED     IO_HANDLED
+#define IOREQ_IO_UNHANDLED   IO_UNHANDLED
+#define IOREQ_IO_RETRY       IO_RETRY
+
+#endif /* __ASM_X86_HVM_IOREQ_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h
index 8dbfb27..7ab873c 100644
--- a/xen/include/asm-arm/mmio.h
+++ b/xen/include/asm-arm/mmio.h
@@ -37,6 +37,7 @@ enum io_state
     IO_ABORT,       /* The IO was handled by the helper and led to an abort. */
     IO_HANDLED,     /* The IO was successfully handled by the helper. */
     IO_UNHANDLED,   /* The IO was not handled by the helper. */
+    IO_RETRY,       /* Retry the emulation for some reason */
 };
 
 typedef int (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 5fdb6e8..5823f11 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
                                         mfn_t mfn)
 {
     /*
-     * NOTE: If this is implemented then proper reference counting of
-     *       foreign entries will need to be implemented.
+     * XXX: handle properly reference. It looks like the page may not always
+     * belong to d.
      */
-    return -EOPNOTSUPP;
+
+    return guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_ram_rw);
 }
 
 /*
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 2368ace..317455a 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -713,14 +713,14 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int
     }
 }
 
+#endif /* CONFIG_X86 */
+
 static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* CONFIG_X86 */
-
 #ifdef CONFIG_ARGO
 static XSM_INLINE int xsm_argo_enable(const struct domain *d)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index a80bcf3..2a9b39d 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -177,8 +177,8 @@ struct xsm_operations {
     int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
     int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
     int (*pmu_op) (struct domain *d, unsigned int op);
-    int (*dm_op) (struct domain *d);
 #endif
+    int (*dm_op) (struct domain *d);
     int (*xen_version) (uint32_t cmd);
     int (*domain_resource_map) (struct domain *d);
 #ifdef CONFIG_ARGO
@@ -688,13 +688,13 @@ static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int
     return xsm_ops->pmu_op(d, op);
 }
 
+#endif /* CONFIG_X86 */
+
 static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->dm_op(d);
 }
 
-#endif /* CONFIG_X86 */
-
 static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
 {
     return xsm_ops->xen_version(op);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index d4cce68..e3afd06 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -148,8 +148,8 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
     set_to_dummy_if_null(ops, ioport_permission);
     set_to_dummy_if_null(ops, ioport_mapping);
     set_to_dummy_if_null(ops, pmu_op);
-    set_to_dummy_if_null(ops, dm_op);
 #endif
+    set_to_dummy_if_null(ops, dm_op);
     set_to_dummy_if_null(ops, xen_version);
     set_to_dummy_if_null(ops, domain_resource_map);
 #ifdef CONFIG_ARGO
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index a314bf8..645192a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1662,14 +1662,13 @@ static int flask_pmu_op (struct domain *d, unsigned int op)
         return -EPERM;
     }
 }
+#endif /* CONFIG_X86 */
 
 static int flask_dm_op(struct domain *d)
 {
     return current_has_perm(d, SECCLASS_HVM, HVM__DM);
 }
 
-#endif /* CONFIG_X86 */
-
 static int flask_xen_version (uint32_t op)
 {
     u32 dsid = domain_sid(current->domain);
@@ -1872,8 +1871,8 @@ static struct xsm_operations flask_ops = {
     .ioport_permission = flask_ioport_permission,
     .ioport_mapping = flask_ioport_mapping,
     .pmu_op = flask_pmu_op,
-    .dm_op = flask_dm_op,
 #endif
+    .dm_op = flask_dm_op,
     .xen_version = flask_xen_version,
     .domain_resource_map = flask_domain_resource_map,
 #ifdef CONFIG_ARGO
-- 
2.7.4


