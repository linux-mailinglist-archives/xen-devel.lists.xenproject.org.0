Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0E8214EB7
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9oR-0005pw-4m; Sun, 05 Jul 2020 18:56:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZHG=AQ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1js9oO-0005m2-V1
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:56:24 +0000
X-Inumbo-ID: 37202e88-bef1-11ea-b7bb-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37202e88-bef1-11ea-b7bb-bc764e2007e4;
 Sun, 05 Jul 2020 18:56:21 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5FD30A20CE;
 Sun,  5 Jul 2020 20:56:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 24D36A20BB;
 Sun,  5 Jul 2020 20:56:16 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4qVLccuKoIX3; Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 324E6A20AB;
 Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4DItugEelIB2; Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E8472A2026;
 Sun,  5 Jul 2020 20:56:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 3428022C37;
 Sun,  5 Jul 2020 20:55:19 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oP-w6INSIyUv; Sun,  5 Jul 2020 20:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8C7A122C29;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
X-Quarantine-ID: <wHWEk28cd5CO>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wHWEk28cd5CO; Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 698F522C20;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 09/11] x86/domctl: add XEN_DOMCTL_vmtrace_op
Date: Sun,  5 Jul 2020 20:55:02 +0200
Message-Id: <f3ec05eb4908f774683e96553ec32d68fac0d0ac.1593974333.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593974333.git.michal.leszczynski@cert.pl>
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Implement domctl to manage the runtime state of
processor trace feature.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/arch/x86/domctl.c       | 48 +++++++++++++++++++++++++++++++++++++
 xen/include/public/domctl.h | 26 ++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 6f2c69788d..a041b724d8 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -322,6 +322,48 @@ void arch_get_domain_info(const struct domain *d,
     info->arch_config.emulation_flags = d->arch.emulation_flags;
 }
 
+static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
+                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    int rc;
+    struct vcpu *v;
+
+    if ( !vmtrace_supported )
+        return -EOPNOTSUPP;
+
+    if ( !is_hvm_domain(d) )
+        return -EOPNOTSUPP;
+
+    if ( op->vcpu >= d->max_vcpus )
+        return -EINVAL;
+
+    v = domain_vcpu(d, op->vcpu);
+    rc = 0;
+
+    switch ( op->cmd )
+    {
+    case XEN_DOMCTL_vmtrace_pt_enable:
+    case XEN_DOMCTL_vmtrace_pt_disable:
+        vcpu_pause(v);
+        spin_lock(&d->vmtrace_lock);
+
+        rc = vmtrace_control_pt(v, op->cmd == XEN_DOMCTL_vmtrace_pt_enable);
+
+        spin_unlock(&d->vmtrace_lock);
+        vcpu_unpause(v);
+        break;
+
+    case XEN_DOMCTL_vmtrace_pt_get_offset:
+        rc = vmtrace_get_pt_offset(v, &op->offset);
+        break;
+
+    default:
+        rc = -EOPNOTSUPP;
+    }
+
+    return rc;
+}
+
 #define MAX_IOPORTS 0x10000
 
 long arch_do_domctl(
@@ -337,6 +379,12 @@ long arch_do_domctl(
     switch ( domctl->cmd )
     {
 
+    case XEN_DOMCTL_vmtrace_op:
+        ret = do_vmtrace_op(d, &domctl->u.vmtrace_op, u_domctl);
+        if ( !ret )
+            copyback = true;
+	break;
+
     case XEN_DOMCTL_shadow_op:
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 7b8289d436..f836cb5970 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1136,6 +1136,28 @@ struct xen_domctl_vuart_op {
                                  */
 };
 
+/* XEN_DOMCTL_vmtrace_op: Perform VM tracing related operation */
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+struct xen_domctl_vmtrace_op {
+    /* IN variable */
+    uint32_t cmd;
+/* Enable/disable external vmtrace for given domain */
+#define XEN_DOMCTL_vmtrace_pt_enable      1
+#define XEN_DOMCTL_vmtrace_pt_disable     2
+#define XEN_DOMCTL_vmtrace_pt_get_offset  3
+    domid_t domain;
+    uint32_t vcpu;
+    uint64_aligned_t size;
+
+    /* OUT variable */
+    uint64_aligned_t offset;
+};
+typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
+DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1217,6 +1239,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vuart_op                      81
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
+#define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1277,6 +1300,9 @@ struct xen_domctl {
         struct xen_domctl_monitor_op        monitor_op;
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+        struct xen_domctl_vmtrace_op        vmtrace_op;
+#endif
         uint8_t                             pad[128];
     } u;
 };
-- 
2.17.1


