Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E299203ED9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:12:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQw0-0003Ny-3h; Mon, 22 Jun 2020 18:12:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnQvy-0003Nh-DG
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:12:42 +0000
X-Inumbo-ID: f6199f74-b4b3-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6199f74-b4b3-11ea-bca7-bc764e2007e4;
 Mon, 22 Jun 2020 18:12:41 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B0790A28AD;
 Mon, 22 Jun 2020 20:12:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A75DAA289F;
 Mon, 22 Jun 2020 20:12:39 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id if3INixpMjEY; Mon, 22 Jun 2020 20:12:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 12584A28AD;
 Mon, 22 Jun 2020 20:12:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Zfd4oL12jK0T; Mon, 22 Jun 2020 20:12:38 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id E9E0EA289F;
 Mon, 22 Jun 2020 20:12:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D1E102025C;
 Mon, 22 Jun 2020 20:12:08 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id chpGD0rJx_CV; Mon, 22 Jun 2020 20:12:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1E4C221CDD;
 Mon, 22 Jun 2020 20:12:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ia2NYqSLHUCw; Mon, 22 Jun 2020 20:12:03 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id F0C3C21CBE;
 Mon, 22 Jun 2020 20:12:02 +0200 (CEST)
Date: Mon, 22 Jun 2020 20:12:02 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <1478140470.11443872.1592849522947.JavaMail.zimbra@cert.pl>
In-Reply-To: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
Subject: [PATCH v3 5/7] tools/libxc: add xc_vmtrace_* functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: tools/libxc: add xc_vmtrace_* functions
Thread-Index: fAatEklvenYpYrSWj77J6AQD/dj+xEE0T8id
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add functions in libxc that use the new HVMOP_vmtrace interface.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 tools/libxc/Makefile          |  1 +
 tools/libxc/include/xenctrl.h | 39 +++++++++++++++
 tools/libxc/xc_vmtrace.c      | 94 +++++++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
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
index 113ddd935d..66966f6c17 100644
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
index 0000000000..79aad2d9a8
--- /dev/null
+++ b/tools/libxc/xc_vmtrace.c
@@ -0,0 +1,94 @@
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
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_vmtrace_op_t, arg);
+    int rc = -1;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->cmd = HVMOP_vmtrace_pt_enable;
+    arg->domain = domid;
+    arg->vcpu = vcpu;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
+int xc_vmtrace_pt_get_offset(
+        xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t *offset)
+{
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_vmtrace_op_t, arg);
+    int rc = -1;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->cmd = HVMOP_vmtrace_pt_get_offset;
+    arg->domain = domid;
+    arg->vcpu = vcpu;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    if ( rc == 0 )
+    {
+        *offset = arg->offset;
+    }
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
+int xc_vmtrace_pt_disable(xc_interface *xch, uint32_t domid, uint32_t vcpu)
+{
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_vmtrace_op_t, arg);
+    int rc = -1;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->cmd = HVMOP_vmtrace_pt_disable;
+    arg->domain = domid;
+    arg->vcpu = vcpu;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
-- 
2.20.1


