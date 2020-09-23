Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5DF2751CE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 08:46:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKyXF-0001WW-KE; Wed, 23 Sep 2020 06:45:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eB7U=DA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKyXD-0001WL-Jh
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 06:45:47 +0000
X-Inumbo-ID: 852c345f-ead3-4ce9-8769-8a80c02d9989
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 852c345f-ead3-4ce9-8769-8a80c02d9989;
 Wed, 23 Sep 2020 06:45:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600843545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TjIt/1n9BC1orQoZ0QREW1u8v4OegKFuF7yOySNGxI=;
 b=OBoT3hUJYZP6rvma/pWNEEeGiUEFhhhBMp4xGdkSoPWvnzdjURa7rgxP2eJAMeajPFA3ZG
 DbFhLINda7AWC1cinRvyjWFE8frxBIZ7sJKVlPy0Q9HFF4j9LBzmyhFPlNDOcq2kO0b1Nb
 9HytrkQUAxFNNqV+x7OWqLfrV4SJD8I=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FB4AAEAA;
 Wed, 23 Sep 2020 06:46:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] tools/init-xenstore-domain: support xenstore pvh stubdom
Date: Wed, 23 Sep 2020 08:45:40 +0200
Message-Id: <20200923064541.19546-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200923064541.19546-1-jgross@suse.com>
References: <20200923064541.19546-1-jgross@suse.com>
MIME-Version: 1.0
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Instead of creating the xenstore-stubdom domain first and parsing the
kernel later do it the other way round. This enables to probe for the
domain type supported by the xenstore-stubdom and to support both, pv
and pvh type stubdoms.

Try to parse the stubdom image first for PV support, if this fails use
HVM. Then create the domain with the appropriate type selected.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/helpers/init-xenstore-domain.c | 119 +++++++++++++++++++--------
 1 file changed, 85 insertions(+), 34 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 22c4be6a3f..c174357c0e 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -18,6 +18,10 @@
 #include "init-dom-json.h"
 #include "_paths.h"
 
+#define LAPIC_BASE_ADDRESS  0xfee00000UL
+#define MB(x)               ((uint64_t)x << 20)
+#define GB(x)               ((uint64_t)x << 30)
+
 static uint32_t domid = ~0;
 static char *kernel;
 static char *ramdisk;
@@ -69,6 +73,8 @@ static int build(xc_interface *xch)
     int rv, xs_fd;
     struct xc_dom_image *dom = NULL;
     int limit_kb = (maxmem ? : (memory + 1)) * 1024;
+    uint64_t mem_size = MB(memory);
+    struct e820entry e820[3];
     struct xen_domctl_createdomain config = {
         .ssidref = SECINITSID_DOMU,
         .flags = XEN_DOMCTL_CDF_xs_domain,
@@ -101,6 +107,66 @@ static int build(xc_interface *xch)
         }
     }
 
+    dom = xc_dom_allocate(xch, NULL, NULL);
+    if ( !dom )
+    {
+        fprintf(stderr, "xc_dom_allocate failed\n");
+        rv = -1;
+        goto err;
+    }
+
+    rv = xc_dom_kernel_file(dom, kernel);
+    if ( rv )
+    {
+        fprintf(stderr, "xc_dom_kernel_file failed\n");
+        goto err;
+    }
+
+    if ( ramdisk )
+    {
+        rv = xc_dom_module_file(dom, ramdisk, NULL);
+        if ( rv )
+        {
+            fprintf(stderr, "xc_dom_module_file failed\n");
+            goto err;
+        }
+    }
+
+    dom->container_type = XC_DOM_HVM_CONTAINER;
+    rv = xc_dom_parse_image(dom);
+    if ( rv )
+    {
+        dom->container_type = XC_DOM_PV_CONTAINER;
+        rv = xc_dom_parse_image(dom);
+        if ( rv )
+        {
+            fprintf(stderr, "xc_dom_parse_image failed\n");
+            goto err;
+        }
+    }
+    else
+    {
+        config.flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
+        config.arch.emulation_flags = XEN_X86_EMU_LAPIC;
+        dom->target_pages = mem_size >> XC_PAGE_SHIFT;
+        dom->mmio_size = GB(4) - LAPIC_BASE_ADDRESS;
+        dom->lowmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
+                          LAPIC_BASE_ADDRESS : mem_size;
+        dom->highmem_end = (mem_size > LAPIC_BASE_ADDRESS) ?
+                           GB(4) + mem_size - LAPIC_BASE_ADDRESS : 0;
+        dom->mmio_start = LAPIC_BASE_ADDRESS;
+        dom->max_vcpus = 1;
+        e820[0].addr = 0;
+        e820[0].size = dom->lowmem_end;
+        e820[0].type = E820_RAM;
+        e820[1].addr = LAPIC_BASE_ADDRESS;
+        e820[1].size = dom->mmio_size;
+        e820[1].type = E820_RESERVED;
+        e820[2].addr = GB(4);
+        e820[2].size = dom->highmem_end - GB(4);
+        e820[2].type = E820_RAM;
+    }
+
     rv = xc_domain_create(xch, &domid, &config);
     if ( rv )
     {
@@ -125,11 +191,15 @@ static int build(xc_interface *xch)
         fprintf(stderr, "xc_evtchn_alloc_unbound failed\n");
         goto err;
     }
-    rv = xc_domain_set_memmap_limit(xch, domid, limit_kb);
-    if ( rv )
+
+    if ( dom->container_type == XC_DOM_PV_CONTAINER )
     {
-        fprintf(stderr, "xc_domain_set_memmap_limit failed\n");
-        goto err;
+        rv = xc_domain_set_memmap_limit(xch, domid, limit_kb);
+        if ( rv )
+        {
+            fprintf(stderr, "xc_domain_set_memmap_limit failed\n");
+            goto err;
+        }
     }
 
     rv = ioctl(xs_fd, IOCTL_XENBUS_BACKEND_SETUP, domid);
@@ -144,45 +214,16 @@ static int build(xc_interface *xch)
     else
         snprintf(cmdline, 512, "--event %d --internal-db", rv);
 
-    dom = xc_dom_allocate(xch, cmdline, NULL);
-    if ( !dom )
-    {
-        fprintf(stderr, "xc_dom_allocate failed\n");
-        goto err;
-    }
-    dom->container_type = XC_DOM_PV_CONTAINER;
+    dom->cmdline = xc_dom_strdup(dom, cmdline);
     dom->xenstore_domid = domid;
     dom->console_evtchn = console_evtchn;
 
-    rv = xc_dom_kernel_file(dom, kernel);
-    if ( rv )
-    {
-        fprintf(stderr, "xc_dom_kernel_file failed\n");
-        goto err;
-    }
-
-    if ( ramdisk )
-    {
-        rv = xc_dom_module_file(dom, ramdisk, NULL);
-        if ( rv )
-        {
-            fprintf(stderr, "xc_dom_module_file failed\n");
-            goto err;
-        }
-    }
-
     rv = xc_dom_boot_xen_init(dom, xch, domid);
     if ( rv )
     {
         fprintf(stderr, "xc_dom_boot_xen_init failed\n");
         goto err;
     }
-    rv = xc_dom_parse_image(dom);
-    if ( rv )
-    {
-        fprintf(stderr, "xc_dom_parse_image failed\n");
-        goto err;
-    }
     rv = xc_dom_mem_init(dom, memory);
     if ( rv )
     {
@@ -195,6 +236,16 @@ static int build(xc_interface *xch)
         fprintf(stderr, "xc_dom_boot_mem_init failed\n");
         goto err;
     }
+    if ( dom->container_type == XC_DOM_HVM_CONTAINER )
+    {
+        rv = xc_domain_set_memory_map(xch, domid, e820,
+                                      dom->highmem_end ? 3 : 2);
+        if ( rv )
+        {
+            fprintf(stderr, "xc_domain_set_memory_map failed\n");
+            goto err;
+        }
+    }
     rv = xc_dom_build_image(dom);
     if ( rv )
     {
-- 
2.26.2


