Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34673091A7
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 04:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78690.143342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqZ-0004qf-Cw; Sat, 30 Jan 2021 03:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78690.143342; Sat, 30 Jan 2021 03:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gqZ-0004ow-21; Sat, 30 Jan 2021 03:22:51 +0000
Received: by outflank-mailman (input) for mailman id 78690;
 Sat, 30 Jan 2021 03:22:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gqX-0004Yr-OA
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 03:22:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38fc887d-6843-4f18-978e-376bf2cf0ca2;
 Sat, 30 Jan 2021 03:22:39 +0000 (UTC)
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
X-Inumbo-ID: 38fc887d-6843-4f18-978e-376bf2cf0ca2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611976959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EvfjqR50MUjZfV+wJxte5vJxLsTztJ8urztBWoZwrE4=;
  b=T5fCMcFbp6lhoi21jmklO0+Zj5v1CyxiUlwGC95aQ373O+cD7vO8PeXg
   Sow3ytcNf9Z03IBHDwVs9IINaiB0sukK+yFr0hn/3TzizBimVyzFG3yMQ
   l45OHobL159FShpTPcamIfncUi4Mz6c+5VrHujOb24st8nbehNh1E1xVm
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: thqUHQusTn2qNPLHjouFvKsPZDyySeKWAzxoJIs6A6+nRIzIVfsG202mqHThpFsVmN9JZPkgPG
 eWFGcpxUCzLwD4YwwHNzNeC7BCsKiOf/T10k3U7Jcynp2nhZjOMSOOqcv67/SskydKZJQWRCep
 KjXkxKkxULgaGTyzepwH6eQu+jX6pVAftqD3FCx2uk1dq5P37nTnV9ARpxcM0nt9epjRP7IIyR
 b5k7Gcx8BYtkvOqZaqxtVtrhE/zLKj4goLSCYhhLyyQMQhvnEAA6XBAXlkWwYQSalwdlvXtbhL
 C3g=
X-SBRS: 5.1
X-MesageID: 36158842
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="36158842"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v8 13/16] tools/libxc: Add xc_vmtrace_* functions
Date: Sat, 30 Jan 2021 02:58:49 +0000
Message-ID: <20210130025852.12430-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130025852.12430-1-andrew.cooper3@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Add functions in libxc that use the new XEN_DOMCTL_vmtrace interface.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v7:
 * Use the name 'vmtrace' consistently.
---
 tools/include/xenctrl.h      |  73 ++++++++++++++++++++++++
 tools/libs/ctrl/Makefile     |   1 +
 tools/libs/ctrl/xc_vmtrace.c | 128 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 202 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_vmtrace.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 3796425e1e..0efcdae8b4 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1583,6 +1583,79 @@ int xc_tbuf_set_cpu_mask(xc_interface *xch, xc_cpumap_t mask);
 
 int xc_tbuf_set_evt_mask(xc_interface *xch, uint32_t mask);
 
+/**
+ * Enable vmtrace for given vCPU.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_enable(xc_interface *xch, uint32_t domid, uint32_t vcpu);
+
+/**
+ * Enable vmtrace for given vCPU.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_disable(xc_interface *xch, uint32_t domid, uint32_t vcpu);
+
+/**
+ * Enable vmtrace for a given vCPU, along with resetting status/offset
+ * details.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_reset_and_enable(xc_interface *xch, uint32_t domid,
+                                uint32_t vcpu);
+
+/**
+ * Get current output position inside the trace buffer.
+ *
+ * Repeated calls will return different values if tracing is enabled.  It is
+ * platform specific what happens when the buffer fills completely.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @parm pos current output position in bytes
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_output_position(xc_interface *xch, uint32_t domid,
+                               uint32_t vcpu, uint64_t *pos);
+
+/**
+ * Get platform specific vmtrace options.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @parm key platform-specific input
+ * @parm value platform-specific output
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_get_option(xc_interface *xch, uint32_t domid,
+                          uint32_t vcpu, uint64_t key, uint64_t *value);
+
+/**
+ * Set platform specific vntvmtrace options.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @parm key platform-specific input
+ * @parm value platform-specific input
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_set_option(xc_interface *xch, uint32_t domid,
+                          uint32_t vcpu, uint64_t key, uint64_t value);
+
 int xc_domctl(xc_interface *xch, struct xen_domctl *domctl);
 int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl);
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 6106e36c49..ce9ecae710 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -22,6 +22,7 @@ SRCS-y       += xc_pm.c
 SRCS-y       += xc_cpu_hotplug.c
 SRCS-y       += xc_resume.c
 SRCS-y       += xc_vm_event.c
+SRCS-y       += xc_vmtrace.c
 SRCS-y       += xc_monitor.c
 SRCS-y       += xc_mem_paging.c
 SRCS-y       += xc_mem_access.c
diff --git a/tools/libs/ctrl/xc_vmtrace.c b/tools/libs/ctrl/xc_vmtrace.c
new file mode 100644
index 0000000000..602502367f
--- /dev/null
+++ b/tools/libs/ctrl/xc_vmtrace.c
@@ -0,0 +1,128 @@
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
+
+int xc_vmtrace_enable(
+    xc_interface *xch, uint32_t domid, uint32_t vcpu)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_vmtrace_op,
+        .domain = domid,
+        .u.vmtrace_op = {
+            .cmd = XEN_DOMCTL_vmtrace_enable,
+            .vcpu = vcpu,
+        },
+    };
+
+    return do_domctl(xch, &domctl);
+}
+
+int xc_vmtrace_disable(
+    xc_interface *xch, uint32_t domid, uint32_t vcpu)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_vmtrace_op,
+        .domain = domid,
+        .u.vmtrace_op = {
+            .cmd = XEN_DOMCTL_vmtrace_disable,
+            .vcpu = vcpu,
+        },
+    };
+
+    return do_domctl(xch, &domctl);
+}
+
+int xc_vmtrace_reset_and_enable(
+    xc_interface *xch, uint32_t domid, uint32_t vcpu)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_vmtrace_op,
+        .domain = domid,
+        .u.vmtrace_op = {
+            .cmd = XEN_DOMCTL_vmtrace_reset_and_enable,
+            .vcpu = vcpu,
+        },
+    };
+
+    return do_domctl(xch, &domctl);
+}
+
+int xc_vmtrace_output_position(
+    xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t *pos)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_vmtrace_op,
+        .domain = domid,
+        .u.vmtrace_op = {
+            .cmd = XEN_DOMCTL_vmtrace_output_position,
+            .vcpu = vcpu,
+        },
+    };
+    int rc = do_domctl(xch, &domctl);
+
+    if ( !rc )
+        *pos = domctl.u.vmtrace_op.value;
+
+    return rc;
+}
+
+int xc_vmtrace_get_option(
+    xc_interface *xch, uint32_t domid, uint32_t vcpu,
+    uint64_t key, uint64_t *value)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_vmtrace_op,
+        .domain = domid,
+        .u.vmtrace_op = {
+            .cmd = XEN_DOMCTL_vmtrace_get_option,
+            .vcpu = vcpu,
+            .key = key,
+        },
+    };
+    int rc = do_domctl(xch, &domctl);
+
+    if ( !rc )
+        *value = domctl.u.vmtrace_op.value;
+
+    return rc;
+}
+
+int xc_vmtrace_set_option(
+    xc_interface *xch, uint32_t domid, uint32_t vcpu,
+    uint64_t key, uint64_t value)
+{
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_vmtrace_op,
+        .domain = domid,
+        .u.vmtrace_op = {
+            .cmd = XEN_DOMCTL_vmtrace_set_option,
+            .vcpu = vcpu,
+            .key = key,
+            .value = value,
+        },
+    };
+
+    return do_domctl(xch, &domctl);
+}
-- 
2.11.0


