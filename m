Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF5A2FF730
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 22:27:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72427.130433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUd-0005DG-Ib; Thu, 21 Jan 2021 21:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72427.130433; Thu, 21 Jan 2021 21:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2hUd-0005By-9e; Thu, 21 Jan 2021 21:27:51 +0000
Received: by outflank-mailman (input) for mailman id 72427;
 Thu, 21 Jan 2021 21:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOiS=GY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2hUb-0004xo-QD
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 21:27:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 375bebc6-b808-405d-9366-9079a2fcb42e;
 Thu, 21 Jan 2021 21:27:39 +0000 (UTC)
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
X-Inumbo-ID: 375bebc6-b808-405d-9366-9079a2fcb42e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611264458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BoP/rfsovnNtQ8ibuYb5LfKyC6U90NDoKfh3PcApORE=;
  b=C/NB7nW1QOtiRnZHxlxkCU6PabzItyY562WXYRUvc7/CgEv8W3V+CcwR
   cmWQJkYUIe1JnYAoVyqLflQ1sw6Kfi3XKIoeQHReO09ZJciOUVv+ZFIFK
   jOhvdFdgGulL/eyY6u01Xs5wYGquRgWgfogivdHW/Ab7zCFy4xIo5mJxp
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hEJkToRs80NOlG7G50aqfGmIoekXoev5dlNXRccxGlRsPOfz/mYw2svrxzHQU/vHfbRdZvNVYY
 stDBZrWwf4raZ/aUKLZb650XFRwB75NslribDjzupdv3zMm+allu3ZqF/ZD68wNc1LE0y3lFEv
 d4MNeoxLVxu5fFBa+r8IIjM4+P92z1fewLrYstgUo+lZ9NMhjXTiRcYXjBiw8F6tqEfGZrKN1u
 yV8FG6M3B9rhlH/bFeCgAu3t7UPd21SUTq7gd35g/KUKapAjREg+SfUssw+ujVdRNwWJsd8XXK
 wRE=
X-SBRS: 5.1
X-MesageID: 35815969
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,365,1602561600"; 
   d="scan'208";a="35815969"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v7 07/10] tools/libxc: Add xc_vmtrace_* functions
Date: Thu, 21 Jan 2021 21:27:15 +0000
Message-ID: <20210121212718.2441-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210121212718.2441-1-andrew.cooper3@citrix.com>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Add functions in libxc that use the new XEN_DOMCTL_vmtrace interface.

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
index 4185dc3f22..449c89f440 100644
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


