Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D911214EBB
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jul 2020 20:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1js9oV-0005ub-W6; Sun, 05 Jul 2020 18:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZHG=AQ=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1js9oT-0005m2-VJ
 for xen-devel@lists.xenproject.org; Sun, 05 Jul 2020 18:56:29 +0000
X-Inumbo-ID: 37203e8c-bef1-11ea-8496-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37203e8c-bef1-11ea-8496-bc764e2007e4;
 Sun, 05 Jul 2020 18:56:21 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 17C21A2081;
 Sun,  5 Jul 2020 20:56:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CE085A2047;
 Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lMswJV0Qiirr; Sun,  5 Jul 2020 20:56:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CBE51A207F;
 Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sJXl2t2dRER2; Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 16632A202C;
 Sun,  5 Jul 2020 20:56:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 422F022C3A;
 Sun,  5 Jul 2020 20:55:19 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yPJWs7im3KH7; Sun,  5 Jul 2020 20:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 9E30D22C20;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
X-Quarantine-ID: <9a2BxL5qECOO>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9a2BxL5qECOO; Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 7412D22C1A;
 Sun,  5 Jul 2020 20:55:08 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 10/11] tools/libxc: add xc_vmtrace_* functions
Date: Sun,  5 Jul 2020 20:55:03 +0200
Message-Id: <07343a2258d2db7dab24653edab84b825103e63d.1593974333.git.michal.leszczynski@cert.pl>
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
Cc: luwei.kang@intel.com, Michal Leszczynski <michal.leszczynski@cert.pl>,
 tamas.lengyel@intel.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Add functions in libxc that use the new XEN_DOMCTL_vmtrace interface.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 tools/libxc/Makefile          |  1 +
 tools/libxc/include/xenctrl.h | 39 +++++++++++++++++++
 tools/libxc/xc_vmtrace.c      | 73 +++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 tools/libxc/xc_vmtrace.c

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index fae5969a73..605e44501d 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -27,6 +27,7 @@ CTRL_SRCS-y       += xc_csched2.c
 CTRL_SRCS-y       += xc_arinc653.c
 CTRL_SRCS-y       += xc_rt.c
 CTRL_SRCS-y       += xc_tbuf.c
+CTRL_SRCS-y       += xc_vmtrace.c
 CTRL_SRCS-y       += xc_pm.c
 CTRL_SRCS-y       += xc_cpu_hotplug.c
 CTRL_SRCS-y       += xc_resume.c
diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 4c89b7294c..34f27fd7d4 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1585,6 +1585,45 @@ int xc_tbuf_set_cpu_mask(xc_interface *xch, xc_cpumap_t mask);
 
 int xc_tbuf_set_evt_mask(xc_interface *xch, uint32_t mask);
 
+/**
+ * Enable processor trace for given vCPU in given DomU.
+ * Allocate the trace ringbuffer with given size.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_pt_enable(xc_interface *xch, uint32_t domid,
+                         uint32_t vcpu);
+
+/**
+ * Disable processor trace for given vCPU in given DomU.
+ * Deallocate the trace ringbuffer.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_pt_disable(xc_interface *xch, uint32_t domid,
+                          uint32_t vcpu);
+
+/**
+ * Get current offset inside the trace ringbuffer.
+ * This allows to determine how much data was written into the buffer.
+ * Once buffer overflows, the offset will reset to 0 and the previous
+ * data will be overriden.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @parm offset current offset inside trace buffer will be written there
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_pt_get_offset(xc_interface *xch, uint32_t domid,
+                             uint32_t vcpu, uint64_t *offset);
+
 int xc_domctl(xc_interface *xch, struct xen_domctl *domctl);
 int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl);
 
diff --git a/tools/libxc/xc_vmtrace.c b/tools/libxc/xc_vmtrace.c
new file mode 100644
index 0000000000..32f90a6203
--- /dev/null
+++ b/tools/libxc/xc_vmtrace.c
@@ -0,0 +1,73 @@
+/******************************************************************************
+ * xc_vmtrace.c
+ *
+ * API for manipulating hardware tracing features
+ *
+ * Copyright (c) 2020, Michal Leszczynski
+ *
+ * Copyright 2020 CERT Polska. All rights reserved.
+ * Use is subject to license terms.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "xc_private.h"
+#include <xen/trace.h>
+
+int xc_vmtrace_pt_enable(
+        xc_interface *xch, uint32_t domid, uint32_t vcpu)
+{
+    DECLARE_DOMCTL;
+    int rc;
+
+    domctl.cmd = XEN_DOMCTL_vmtrace_op;
+    domctl.domain = domid;
+    domctl.u.vmtrace_op.cmd = XEN_DOMCTL_vmtrace_pt_enable;
+    domctl.u.vmtrace_op.vcpu = vcpu;
+
+    rc = do_domctl(xch, &domctl);
+    return rc;
+}
+
+int xc_vmtrace_pt_get_offset(
+        xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t *offset)
+{
+    DECLARE_DOMCTL;
+    int rc;
+
+    domctl.cmd = XEN_DOMCTL_vmtrace_op;
+    domctl.domain = domid;
+    domctl.u.vmtrace_op.cmd = XEN_DOMCTL_vmtrace_pt_get_offset;
+    domctl.u.vmtrace_op.vcpu = vcpu;
+
+    rc = do_domctl(xch, &domctl);
+    if ( !rc )
+        *offset = domctl.u.vmtrace_op.offset;
+    return rc;
+}
+
+int xc_vmtrace_pt_disable(xc_interface *xch, uint32_t domid, uint32_t vcpu)
+{
+    DECLARE_DOMCTL;
+    int rc;
+
+    domctl.cmd = XEN_DOMCTL_vmtrace_op;
+    domctl.domain = domid;
+    domctl.u.vmtrace_op.cmd = XEN_DOMCTL_vmtrace_pt_disable;
+    domctl.u.vmtrace_op.vcpu = vcpu;
+
+    rc = do_domctl(xch, &domctl);
+    return rc;
+}
+
-- 
2.17.1


