Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA66140ADDB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 14:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186545.335321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fh-0008Td-NQ; Tue, 14 Sep 2021 12:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186545.335321; Tue, 14 Sep 2021 12:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ7fh-0008Q6-IN; Tue, 14 Sep 2021 12:36:21 +0000
Received: by outflank-mailman (input) for mailman id 186545;
 Tue, 14 Sep 2021 12:36:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8exS=OE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQ7ff-00070M-Gi
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 12:36:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe3c330b-c808-4ed7-90ee-e9b4efad6c37;
 Tue, 14 Sep 2021 12:36:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDEF9220E9;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8981613342;
 Tue, 14 Sep 2021 12:36:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0IUlIDOXQGE7MAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Sep 2021 12:36:03 +0000
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
X-Inumbo-ID: fe3c330b-c808-4ed7-90ee-e9b4efad6c37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631622963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ePWQiFmb8Y2hRzTVgAeltcrXsQ9l+i0Wvg5OPdAaKw=;
	b=ENmoeESBNEgQsESshQLy23eluDlQgcGMVMebX2ukzx9cicUzcZ55hXw2Hm8hm9S2QmUXYX
	d+/AzjdPJzw159w9uu27qMLW812t35MSVKqgR64g/OBO+xgPeS8RJmcnQweFqeU9o8yYTl
	0P9H2QKGx4G4Rj1QR8zb0qew770+a2E=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH RFC 3/4] xen: add new stable control hypercall
Date: Tue, 14 Sep 2021 14:35:59 +0200
Message-Id: <20210914123600.1626-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210914123600.1626-1-jgross@suse.com>
References: <20210914123600.1626-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysctl and domctl hypercalls are not stable, so tools using those
need to be in sync with the hypervisor.

In order to decouple (some) tools from the hypervisor add a new stable
hypercall __HYPERVISOR_control_op with (for now) two sub-options:

- XEN_CONTROL_OP_get_version for retrieving the max version of the new
  hypercall supported by the hypervisor
- XEN_CONTROL_OP_get_state_changed_domain for retrieving some state
  data of a domain which changed state (this is needed by Xenstore).
  The returned state just contains the domid, the domain unique id,
  and some flags (existing, shutdown, dying).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/flask/policy/modules/dom0.te  |  2 +-
 xen/arch/arm/traps.c                |  1 +
 xen/arch/x86/hvm/hypercall.c        |  1 +
 xen/arch/x86/hypercall.c            |  1 +
 xen/arch/x86/pv/hypercall.c         |  1 +
 xen/common/Makefile                 |  1 +
 xen/common/control.c                | 52 +++++++++++++++++++
 xen/common/domain.c                 | 38 ++++++++++++++
 xen/common/event_channel.c          |  9 +++-
 xen/include/Makefile                |  1 +
 xen/include/public/control.h        | 80 +++++++++++++++++++++++++++++
 xen/include/public/xen.h            |  1 +
 xen/include/xen/event.h             |  6 +++
 xen/include/xen/hypercall.h         |  5 ++
 xen/include/xen/sched.h             |  2 +
 xen/include/xsm/dummy.h             | 14 +++++
 xen/include/xsm/xsm.h               |  6 +++
 xen/xsm/dummy.c                     |  1 +
 xen/xsm/flask/hooks.c               |  6 +++
 xen/xsm/flask/policy/access_vectors |  2 +
 20 files changed, 227 insertions(+), 3 deletions(-)
 create mode 100644 xen/common/control.c
 create mode 100644 xen/include/public/control.h

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 0a63ce15b6..5c5e4af56c 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -11,7 +11,7 @@ allow dom0_t xen_t:xen {
 	mtrr_del mtrr_read microcode physinfo quirk writeconsole readapic
 	writeapic privprofile nonprivprofile kexec firmware sleep frequency
 	getidle debug getcpuinfo heap pm_op mca_op lockprof cpupool_op
-	getscheduler setscheduler hypfs_op
+	getscheduler setscheduler hypfs_op control_op
 };
 allow dom0_t xen_t:xen2 {
 	resource_op psr_cmt_op psr_alloc pmu_ctrl get_symbol
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 219ab3c3fb..78802a5660 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1397,6 +1397,7 @@ static arm_hypercall_t arm_hypercall_table[] = {
 #ifdef CONFIG_IOREQ_SERVER
     HYPERCALL(dm_op, 3),
 #endif
+    HYPERCALL(control_op, 2),
 };
 
 #ifndef NDEBUG
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 261d8ee8a4..007fcf5cb0 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -154,6 +154,7 @@ static const struct {
 #ifdef CONFIG_HYPFS
     HYPERCALL(hypfs_op),
 #endif
+    HYPERCALL(control_op),
     HYPERCALL(arch_1)
 };
 
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 2370d31d3f..53523bac43 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -74,6 +74,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
     ARGS(hvm_op, 2),
     ARGS(dm_op, 3),
     ARGS(hypfs_op, 5),
+    ARGS(control_op, 2),
     ARGS(mca, 1),
     ARGS(arch_1, 1),
 };
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 9765e674cf..8f81c1e645 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -99,6 +99,7 @@ const pv_hypercall_table_t pv_hypercall_table[] = {
 #ifdef CONFIG_HYPFS
     HYPERCALL(hypfs_op),
 #endif
+    HYPERCALL(control_op),
     HYPERCALL(mca),
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
     HYPERCALL(arch_1),
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 54de70d422..3c44def563 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_ARGO) += argo.o
 obj-y += bitmap.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
+obj-y += control.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
diff --git a/xen/common/control.c b/xen/common/control.c
new file mode 100644
index 0000000000..f92178d461
--- /dev/null
+++ b/xen/common/control.c
@@ -0,0 +1,52 @@
+/******************************************************************************
+ *
+ * control.c
+ *
+ * Entry point of the stable __HYPERVISOR_control_op hypercall.
+ */
+#include <xen/err.h>
+#include <xen/event.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <public/control.h>
+
+long do_control_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    int ret = 0;
+
+    if ( xsm_control_op(XSM_OTHER, cmd) )
+        return -EPERM;
+
+    switch ( cmd )
+    {
+    case XEN_CONTROL_OP_get_version:
+        if ( !guest_handle_is_null(arg) )
+            return -EINVAL;
+
+        ret = XEN_CONTROL_VERSION;
+        break;
+
+    case XEN_CONTROL_OP_get_state_changed_domain:
+    {
+        struct xen_control_changed_domain info = { };
+
+        if ( get_global_virq_handler(VIRQ_DOM_EXC) != current->domain )
+            return -EPERM;
+
+        ret = domain_get_dom_state_changed(&info);
+        if ( ret )
+            break;
+
+        if ( copy_to_guest(arg, &info, 1) )
+            ret = -EFAULT;
+
+        break;
+    }
+
+    default:
+        ret = -EOPNOTSUPP;
+        break;
+    }
+
+    return ret;
+}
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 14a427e2ef..d6d729c485 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -36,6 +36,7 @@
 #include <asm/debugger.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
+#include <public/control.h>
 #include <public/sched.h>
 #include <public/sysctl.h>
 #include <public/vcpu.h>
@@ -103,6 +104,43 @@ void domain_reset_states(void)
     rcu_read_unlock(&domlist_read_lock);
 }
 
+int domain_get_dom_state_changed(struct xen_control_changed_domain *info)
+{
+    unsigned int dom;
+    struct domain *d;
+
+    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
+            DOMID_FIRST_RESERVED )
+    {
+        d = rcu_lock_domain_by_id(dom);
+
+        if ( test_and_clear_bit(dom, dom_state_changed) )
+        {
+            info->domid = dom;
+            if ( d )
+            {
+                info->state = XEN_CONTROL_CHANGEDDOM_STATE_EXIST;
+                if ( d->is_shut_down )
+                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN;
+                if ( d->is_dying == DOMDYING_dead )
+                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_DYING;
+                info->unique_id = d->unique_id;
+
+                rcu_unlock_domain(d);
+            }
+
+            return 0;
+        }
+
+        if ( d )
+        {
+            rcu_unlock_domain(d);
+        }
+    }
+
+    return -ENOENT;
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index e2a416052b..b5f377c76f 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -894,11 +894,16 @@ static struct domain *global_virq_handlers[NR_VIRQS] __read_mostly;
 
 static DEFINE_SPINLOCK(global_virq_handlers_lock);
 
-void send_global_virq(uint32_t virq)
+struct domain *get_global_virq_handler(uint32_t virq)
 {
     ASSERT(virq_is_global(virq));
 
-    send_guest_global_virq(global_virq_handlers[virq] ?: hardware_domain, virq);
+    return global_virq_handlers[virq] ?: hardware_domain;
+}
+
+void send_global_virq(uint32_t virq)
+{
+    send_guest_global_virq(get_global_virq_handler(virq), virq);
 }
 
 int set_global_virq_handler(struct domain *d, uint32_t virq)
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 95daa8a289..adf61f40c3 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -4,6 +4,7 @@ compat-arch-$(CONFIG_X86) := x86_32
 
 headers-y := \
     compat/arch-$(compat-arch-y).h \
+    compat/control.h \
     compat/elfnote.h \
     compat/event_channel.h \
     compat/features.h \
diff --git a/xen/include/public/control.h b/xen/include/public/control.h
new file mode 100644
index 0000000000..0b2a032e96
--- /dev/null
+++ b/xen/include/public/control.h
@@ -0,0 +1,80 @@
+/******************************************************************************
+ * Xen Control Hypercall
+ *
+ * Copyright (c) 2021, SUSE Software Solutions Germany GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __XEN_PUBLIC_CONTROL_H__
+#define __XEN_PUBLIC_CONTROL_H__
+
+#include "xen.h"
+
+/*
+ * Definitions for the __HYPERVISOR_control_op hypercall.
+ */
+
+/* Highest version number of the control interface currently defined. */
+#define XEN_CONTROL_VERSION      1
+
+/*
+ * Hypercall operations.
+ */
+
+/*
+ * XEN_CONTROL_OP_get_version
+ *
+ * Read highest interface version supported by the hypervisor.
+ *
+ * arg: NULL
+ *
+ * Possible return values:
+ * >0: highest supported interface version
+ * <0: negative Xen errno value
+ */
+#define XEN_CONTROL_OP_get_version                  0
+
+/*
+ * XEN_CONTROL_OP_get_state_changed_domain
+ *
+ * Get information about a domain having changed state and reset the state
+ * change indicator for that domain. This function is usable only by a domain
+ * having registered the VIRQ_DOM_EXC event (normally Xenstore).
+ *
+ * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
+ *
+ * Possible return values:
+ * 0: success
+ * <0 : negative Xen errno value
+ */
+#define XEN_CONTROL_OP_get_state_changed_domain     1
+struct xen_control_changed_domain {
+    domid_t domid;
+    uint16_t state;
+#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domain is existing. */
+#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
+#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domain dying. */
+    uint32_t pad1;           /* Returned as 0. */
+    uint64_t unique_id;      /* Unique domain identifier. */
+    uint64_t pad2[6];        /* Returned as 0. */
+};
+
+#endif /* __XEN_PUBLIC_CONTROL_H__ */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index e373592c33..1344fbcc36 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -131,6 +131,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
 #define __HYPERVISOR_hypfs_op             42
+#define __HYPERVISOR_control_op           43
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 21c95e14fd..c770f29e8e 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -43,6 +43,12 @@ void send_guest_global_virq(struct domain *d, uint32_t virq);
  */
 int set_global_virq_handler(struct domain *d, uint32_t virq);
 
+/*
+ * get_global_virq_handler: Get domain handling a global virq.
+ *  @virq:     Virtual IRQ number (VIRQ_*), must be global
+ */
+struct domain *get_global_virq_handler(uint32_t virq);
+
 /*
  * send_guest_pirq:
  *  @d:        Domain to which physical IRQ should be sent
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 3771487a30..1876e0b26f 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -160,6 +160,11 @@ do_hypfs_op(
     unsigned long arg4);
 #endif
 
+extern long
+do_control_op(
+    unsigned int cmd,
+    XEN_GUEST_HANDLE_PARAM(void) arg);
+
 #ifdef CONFIG_COMPAT
 
 extern int
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 2ae26bc50e..2795906a8f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -24,6 +24,7 @@
 #include <xen/vpci.h>
 #include <xen/wait.h>
 #include <public/xen.h>
+#include <public/control.h>
 #include <public/domctl.h>
 #include <public/sysctl.h>
 #include <public/vcpu.h>
@@ -731,6 +732,7 @@ void domain_resume(struct domain *d);
 int domain_soft_reset(struct domain *d, bool resuming);
 
 void domain_reset_states(void);
+int domain_get_dom_state_changed(struct xen_control_changed_domain *info);
 
 int vcpu_start_shutdown_deferral(struct vcpu *v);
 void vcpu_end_shutdown_deferral(struct vcpu *v);
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 214b5408b1..e3c9b27acc 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -17,6 +17,7 @@
 
 #include <xen/sched.h>
 #include <xsm/xsm.h>
+#include <public/control.h>
 #include <public/hvm/params.h>
 
 /* Cannot use BUILD_BUG_ON here because the expressions we check are not
@@ -157,6 +158,19 @@ static XSM_INLINE int xsm_sysctl(XSM_DEFAULT_ARG int cmd)
     return xsm_default_action(action, current->domain, NULL);
 }
 
+static XSM_INLINE int xsm_control_op(XSM_DEFAULT_ARG uint32_t cmd)
+{
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    switch ( cmd )
+    {
+    case XEN_CONTROL_OP_get_version:
+    case XEN_CONTROL_OP_get_state_changed_domain:
+        return xsm_default_action(XSM_XS_PRIV, current->domain, NULL);
+    default:
+        return xsm_default_action(XSM_PRIV, current->domain, NULL);
+    }
+}
+
 static XSM_INLINE int xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 16b90be2c5..21965d3df9 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -125,6 +125,7 @@ struct xsm_operations {
 
     int (*page_offline)(uint32_t cmd);
     int (*hypfs_op)(void);
+    int (*control_op)(uint32_t cmd);
 
     long (*do_xsm_op) (XEN_GUEST_HANDLE_PARAM(void) op);
 #ifdef CONFIG_COMPAT
@@ -539,6 +540,11 @@ static inline int xsm_hypfs_op(xsm_default_t def)
     return xsm_ops->hypfs_op();
 }
 
+static inline int xsm_control_op(xsm_default_t def, uint32_t cmd)
+{
+    return xsm_ops->control_op(cmd);
+}
+
 static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_ops->do_xsm_op(op);
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index de44b10130..0190463523 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -104,6 +104,7 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
 
     set_to_dummy_if_null(ops, page_offline);
     set_to_dummy_if_null(ops, hypfs_op);
+    set_to_dummy_if_null(ops, control_op);
     set_to_dummy_if_null(ops, hvm_param);
     set_to_dummy_if_null(ops, hvm_control);
     set_to_dummy_if_null(ops, hvm_param_altp2mhvm);
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 1465db125a..5966e35c5c 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1181,6 +1181,11 @@ static inline int flask_hypfs_op(void)
     return domain_has_xen(current->domain, XEN__HYPFS_OP);
 }
 
+static inline int flask_control_op(void)
+{
+    return domain_has_xen(current->domain, XEN__CONTROL_OP);
+}
+
 static int flask_add_to_physmap(struct domain *d1, struct domain *d2)
 {
     return domain_has_perm(d1, d2, SECCLASS_MMU, MMU__PHYSMAP);
@@ -1815,6 +1820,7 @@ static struct xsm_operations flask_ops = {
 
     .page_offline = flask_page_offline,
     .hypfs_op = flask_hypfs_op,
+    .control_op = flask_control_op,
     .hvm_param = flask_hvm_param,
     .hvm_control = flask_hvm_param,
     .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 6359c7fc87..3ca91ac23c 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -69,6 +69,8 @@ class xen
     cpupool_op
 # hypfs hypercall
     hypfs_op
+# control hypercall
+    control_op
 # XEN_SYSCTL_scheduler_op with XEN_DOMCTL_SCHEDOP_getinfo, XEN_SYSCTL_sched_id, XEN_DOMCTL_SCHEDOP_getvcpuinfo
     getscheduler
 # XEN_SYSCTL_scheduler_op with XEN_DOMCTL_SCHEDOP_putinfo, XEN_DOMCTL_SCHEDOP_putvcpuinfo
-- 
2.26.2


