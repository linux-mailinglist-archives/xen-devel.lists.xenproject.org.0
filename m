Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907C388D4E6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 04:06:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698300.1089839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJcX-0004tL-Fm; Wed, 27 Mar 2024 03:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698300.1089839; Wed, 27 Mar 2024 03:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJcX-0004rk-Cx; Wed, 27 Mar 2024 03:06:33 +0000
Received: by outflank-mailman (input) for mailman id 698300;
 Wed, 27 Mar 2024 03:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klda=LB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rpJcV-0004d3-7p
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 03:06:31 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0177300e-ebe7-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 04:06:29 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.nyi.internal (Postfix) with ESMTP id C74C81380165;
 Tue, 26 Mar 2024 23:06:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 26 Mar 2024 23:06:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 23:06:27 -0400 (EDT)
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
X-Inumbo-ID: 0177300e-ebe7-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1711508788; x=1711595188; bh=MbWNAocmC2
	tXBNyeSris83Z/pJQ9bxIJsFcp7jvH5XI=; b=B9XiLJ1Neg+S24LlG51xvdKE3F
	09Eso1tQ6eMCxdX8xfVx09URS4QDwDXRVh0fyn7FIxabsDhRjzljbNXrF0Lq2rTG
	cPi2Xo6LK3zo9eaBCWpFzZVIpvSTNQ65CN69nb8TfJXc/V9uJYnTOLjLWAk8iphm
	IHDf6Ep3ZzOWL+rwAKMeQBR0cDJ7QPw/Cg8axiXh7jb6cfLN1n3ZF0jrEKikMYCg
	Fgni1Mrx7OgrHfiOHwKcoi7z4gAbtX6pAsuCE3qlxdvXp1ew0m6HY6bmMEI6Mgj2
	nvJrKwskZcdUm0fhlo96QhwCPz09U0RvGj2+VF8ooZNuIOfg136ADQP87I6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1711508788; x=
	1711595188; bh=MbWNAocmC2tXBNyeSris83Z/pJQ9bxIJsFcp7jvH5XI=; b=x
	rn9Iqc7z00/ieKDGMeEHf1xO9LKYNU0XBssT6keiTb7RQ9Hws4K0T5mPmvSejNv/
	UXTuHacyb1TwViEI0fJ0LLH/7qJxA0aVOmxvN03bxmQgPWvAMIAYBcmmNtRC2d8s
	zksfLwnyJDoYRjl/5UeEpBCPuzYCS0FdYMTqZUOBd6gf5j9iAGQdwV0gYdqX+kVl
	L2yHAJJt4cyCM7XKkW4gATx7UOSnPXwNjjA6MVafYQUVfUQJd42VMB1GW4jS85wL
	awikQIvHhpI/gObFsUMzSqsvgopC+osgLzTtFcWNSPvWE0nzLQZVGTDhyvwAng7N
	xkQguMh4PqLAY/npi3PpA==
X-ME-Sender: <xms:NI0DZkB1xmdqAqKokIWOE8rKVeKXURKjVHxzPc6gvmKyDuGuBGEx9A>
    <xme:NI0DZmiIzVsUYz8nmb9afgtisHplZX5S89WJ45DG2JEg5aEkHMv31pkQn4K5SDSN5
    vW7lZ0JZXU4JA>
X-ME-Received: <xmr:NI0DZnncUKYLrK2UbFq6A172gjI1Nm5zNdR_404pJvAcfYrtWK43ptApltTdXV5qOyTIn6tAKvSX1MRBasy2-ghLgBlRZWmC0EJPw3fMdGYykUAhJeY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:NI0DZqwB8ug52_A0qWQcpdxwao7sxhvMmNPttlgikr4gASNFw1l7CA>
    <xmx:NI0DZpQCX4tX0DZxHt7entbKHNbZg7slS11YUqGe49UkMqbGlv1inw>
    <xmx:NI0DZlatG-0aai-WFvhZ2vxilJWt7IfYsx-vWj1NounPZlWSq9JQdg>
    <xmx:NI0DZiSjaaSdxjRzuk8xlhig814J8CPPR6opw-nJkRdd5CL2Hwp05w>
    <xmx:NI0DZoGqu7ISBtsYqlNC5hDnT1y_peCtCnt1g79kFsPQSjWEnwhWOw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v3 2/2] xen: fix stubdom PCI addr
Date: Wed, 27 Mar 2024 04:05:15 +0100
Message-ID: <35049e99da634a74578a1ff2cb3ae4cc436ede33.1711506237.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.527f002866de2be7c275c5000b6e5edfeb7e8368.1711506237.git-series.marmarek@invisiblethingslab.com>
References: <cover.527f002866de2be7c275c5000b6e5edfeb7e8368.1711506237.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running in a stubdomain, the config space access via sysfs needs to
use BDF as seen inside stubdomain (connected via xen-pcifront), which is
different from the real BDF. For other purposes (hypercall parameters
etc), the real BDF needs to be used.
Get the in-stubdomain BDF by looking up relevant PV PCI xenstore
entries.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- reduce 'path' size
- add two missing error_setg() calls
- coding style
Changes in v2:
- use xs_node_scanf
- use %d instead of %u to read values written as %d
- add a comment from another iteration of this patch by Jason Andryuk
---
 hw/xen/xen-host-pci-device.c | 76 ++++++++++++++++++++++++++++++++++++-
 hw/xen/xen-host-pci-device.h |  6 +++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1..eaf32f2 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -9,6 +9,8 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-bus-helper.h"
 #include "xen-host-pci-device.h"
 
 #define XEN_HOST_PCI_MAX_EXT_CAP \
@@ -33,13 +35,73 @@
 #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
 #define IORESOURCE_MEM_64       0x00100000
 
+/*
+ * Non-passthrough (dom0) accesses are local PCI devices and use the given BDF
+ * Passthough (stubdom) accesses are through PV frontend PCI device.  Those
+ * either have a BDF identical to the backend's BDF (xen-backend.passthrough=1)
+ * or a local virtual BDF (xen-backend.passthrough=0)
+ *
+ * We are always given the backend's BDF and need to lookup the appropriate
+ * local BDF for sysfs access.
+ */
+static void xen_host_pci_fill_local_addr(XenHostPCIDevice *d, Error **errp)
+{
+    unsigned int num_devs, len, i;
+    unsigned int domain, bus, dev, func;
+    char *be_path = NULL;
+    char path[16];
+
+    be_path = qemu_xen_xs_read(xenstore, 0, "device/pci/0/backend", &len);
+    if (!be_path) {
+        error_setg(errp, "Failed to read device/pci/0/backend");
+        goto out;
+    }
+
+    if (xs_node_scanf(xenstore, 0, be_path, "num_devs", NULL,
+                      "%d", &num_devs) != 1) {
+        error_setg(errp, "Failed to read or parse %s/num_devs", be_path);
+        goto out;
+    }
+
+    for (i = 0; i < num_devs; i++) {
+        snprintf(path, sizeof(path), "dev-%d", i);
+        if (xs_node_scanf(xenstore, 0, be_path, path, NULL,
+                          "%x:%x:%x.%x", &domain, &bus, &dev, &func) != 4) {
+            error_setg(errp, "Failed to read or parse %s/%s", be_path, path);
+            goto out;
+        }
+        if (domain != d->domain ||
+                bus != d->bus ||
+                dev != d->dev ||
+                func != d->func)
+            continue;
+        snprintf(path, sizeof(path), "vdev-%d", i);
+        if (xs_node_scanf(xenstore, 0, be_path, path, NULL,
+                          "%x:%x:%x.%x", &domain, &bus, &dev, &func) != 4) {
+            error_setg(errp, "Failed to read or parse %s/%s", be_path, path);
+            goto out;
+        }
+        d->local_domain = domain;
+        d->local_bus = bus;
+        d->local_dev = dev;
+        d->local_func = func;
+        goto out;
+    }
+    error_setg(errp, "Failed to find PCI device %x:%x:%x.%x in xenstore",
+               d->domain, d->bus, d->dev, d->func);
+
+out:
+    free(be_path);
+}
+
 static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
                                     const char *name, char *buf, ssize_t size)
 {
     int rc;
 
     rc = snprintf(buf, size, "/sys/bus/pci/devices/%04x:%02x:%02x.%d/%s",
-                  d->domain, d->bus, d->dev, d->func, name);
+                  d->local_domain, d->local_bus, d->local_dev, d->local_func,
+                  name);
     assert(rc >= 0 && rc < size);
 }
 
@@ -342,6 +404,18 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     d->dev = dev;
     d->func = func;
 
+    if (xen_is_stubdomain) {
+        xen_host_pci_fill_local_addr(d, errp);
+        if (*errp) {
+            goto error;
+        }
+    } else {
+        d->local_domain = d->domain;
+        d->local_bus = d->bus;
+        d->local_dev = d->dev;
+        d->local_func = d->func;
+    }
+
     xen_host_pci_config_open(d, errp);
     if (*errp) {
         goto error;
diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
index 4d8d34e..270dcb2 100644
--- a/hw/xen/xen-host-pci-device.h
+++ b/hw/xen/xen-host-pci-device.h
@@ -23,6 +23,12 @@ typedef struct XenHostPCIDevice {
     uint8_t dev;
     uint8_t func;
 
+    /* different from the above in case of stubdomain */
+    uint16_t local_domain;
+    uint8_t local_bus;
+    uint8_t local_dev;
+    uint8_t local_func;
+
     uint16_t vendor_id;
     uint16_t device_id;
     uint32_t class_code;
-- 
git-series 0.9.1

