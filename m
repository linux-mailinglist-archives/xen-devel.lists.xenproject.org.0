Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323CAB9A2E
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986846.1372361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLR-0003q3-Dm; Fri, 16 May 2025 10:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986846.1372361; Fri, 16 May 2025 10:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLR-0003ns-Aq; Fri, 16 May 2025 10:31:13 +0000
Received: by outflank-mailman (input) for mailman id 986846;
 Fri, 16 May 2025 10:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oPam=YA=bounce.vates.tech=bounce-md_30504962.6827123c.v1-a32b69adad444adc87b2b2c102ecc179@srs-se1.protection.inumbo.net>)
 id 1uFsER-0000kS-Md
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:23:59 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e002a537-323f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:23:57 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzNTm6PzCzMQxhrj
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:23:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a32b69adad444adc87b2b2c102ecc179; Fri, 16 May 2025 10:23:56 +0000
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
X-Inumbo-ID: e002a537-323f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747391036; x=1747661036;
	bh=GO5Dri+xVh1Y4JynkAC/L1FcSze9E66ZA2NqARyadRc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CTsn8QblBtzpLm3VnaNNXup9lAPub+fkhhWKiAhhTfvNWKRnXm2TQzfStGqLP1rSU
	 YwepmnGjvEe9hSf9gVjxCnMeODo5XCv0i6hXtZiYK2gjmtWqpYE+sHNjBkebOI0+kC
	 RejD5hpi2d4QqZ+Iv3POZfuLj7KYHQBx3EI4XP0N2+Q/aqRsyisjygaAfkX+VeXFH1
	 zPa7DBvlcnfIzI31UO6K8LkPsxb6EeLDkXxkJf+TjH1AG0Fq0MCGOw1OpTHrDqIjr+
	 jUHKxnTVxT4zIJDolYrlTv/QXYoYtdzVMEnqWoRDNPoCIy2XyoIrMdf25V1U8An48p
	 aqbChmRJttnWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747391036; x=1747651536; i=teddy.astie@vates.tech;
	bh=GO5Dri+xVh1Y4JynkAC/L1FcSze9E66ZA2NqARyadRc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KmfPe3kbcFhlEze4gm87u0qrqVZ/Q7Jzz6D8zsaXa1rhkaRrsckO0GxfoL8crxXsm
	 MLlr8lGVAEumN3uvJldnU4AVj9GfYBO+Wil4oyatq/Pach06Qm0nbxurs9F8KwSrlL
	 RJ20DXPUEhByd6WqvQBlcx5w45cXs6hxdxHPn27xzs+h5S0ktcReCH8JcHp9vJxRpr
	 nS8WA01vwGk38RyR6eiGjJIFthakTz9nI0Als0NXasbvhlk+L3pW4pHTMy0RT8HQGB
	 TRQmlMQEiGMbuYQIjPLvuY1IHfVOjfGCZJ53gDqwxItka4wNvQfuHURXdYqmphtJfQ
	 V1gxZpKawphOw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2010/16]=20xl/coco:=20Introduce=20confidential=20computing=20support?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747391035719
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Christian Lindig" <christian.lindig@citrix.com>, "David Scott" <dave@recoil.org>, "Vaishali Thakkar" <vaishali.thakkar@suse.com>
Message-Id: <85b52eb462e171b420d6c8e7c748af763504e9f2.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a32b69adad444adc87b2b2c102ecc179?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:23:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Vaishali Thakkar <vaishali.thakkar@suse.com>

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@suse.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 tools/include/libxl.h            |  5 ++++
 tools/include/xenctrl.h          |  4 ++++
 tools/include/xenguest.h         |  1 +
 tools/libs/ctrl/xc_domain.c      | 36 +++++++++++++++++++++++++++++
 tools/libs/guest/Makefile.common |  2 ++
 tools/libs/guest/xg_dom_boot.c   | 33 +++++++++++++++++++++++++++
 tools/libs/guest/xg_dom_coco.c   | 35 ++++++++++++++++++++++++++++
 tools/libs/guest/xg_dom_coco.h   | 39 ++++++++++++++++++++++++++++++++
 tools/libs/guest/xg_dom_x86.c    |  1 +
 tools/libs/light/libxl_cpuid.c   |  1 +
 tools/libs/light/libxl_create.c  |  4 ++++
 tools/libs/light/libxl_dom.c     |  1 +
 tools/libs/light/libxl_types.idl |  1 +
 tools/libs/util/libxlu_disk_l.c  | 13 ++++-------
 tools/libs/util/libxlu_disk_l.h  |  7 ++----
 tools/misc/xen-cpuid.c           |  1 +
 tools/ocaml/libs/xc/xenctrl.ml   |  1 +
 tools/ocaml/libs/xc/xenctrl.mli  |  1 +
 tools/xl/xl_parse.c              |  2 ++
 19 files changed, 175 insertions(+), 13 deletions(-)
 create mode 100644 tools/libs/guest/xg_dom_coco.c
 create mode 100644 tools/libs/guest/xg_dom_coco.h

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b7ad7735ca..e75179b604 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -178,6 +178,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_EVENT_CHANNELS 1
 
+/*
+ * The libxl_domain_build_info has the coco field.
+*/
+#define LIBXL_HAVE_BUILDINFO_COCO 1
+
 /*
  * libxl_domain_build_info has the u.hvm.ms_vm_genid field.
  */
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 4955981231..aae228da44 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -46,6 +46,7 @@
 #include <xen/xsm/flask_op.h>
 #include <xen/kexec.h>
 #include <xen/platform.h>
+#include <xen/hvm/coco.h>
 
 #include "xentoollog.h"
 #include "xen-barrier.h"
@@ -1682,6 +1683,9 @@ int xc_hvm_param_get(xc_interface *handle, uint32_t dom, uint32_t param, uint64_
 int xc_set_hvm_param(xc_interface *handle, uint32_t dom, int param, unsigned long value);
 int xc_get_hvm_param(xc_interface *handle, uint32_t dom, int param, unsigned long *value);
 
+int xc_coco_platform_status(xc_interface *handle, coco_platform_status_t *status);
+int xc_coco_prepare_initial_mem(xc_interface *handle, coco_prepare_initial_mem_t *cmd);
+
 /* HVM guest pass-through */
 int xc_assign_device(xc_interface *xch,
                      uint32_t domid,
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b77..9d36fa5665 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -219,6 +219,7 @@ struct xc_dom_image {
     xen_paddr_t lowmem_end;
     xen_paddr_t highmem_end;
     xen_pfn_t vga_hole_size;
+    bool coco; /* 1 if this is a confidential computing guest, 0 otherwise */
 
     /* If unset disables the setup of the IOREQ pages. */
     bool device_model;
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 2ddc3f4f42..66b6c146f4 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -20,8 +20,10 @@
  */
 
 #include "xc_private.h"
+#include "xenctrl.h"
 #include <xen/memory.h>
 #include <xen/hvm/hvm_op.h>
+#include <xen/hvm/coco.h>
 
 int xc_domain_create(xc_interface *xch, uint32_t *pdomid,
                      struct xen_domctl_createdomain *config)
@@ -1496,6 +1498,40 @@ int xc_get_hvm_param(xc_interface *handle, uint32_t dom, int param, unsigned lon
     return 0;
 }
 
+int xc_coco_platform_status(xc_interface *handle, coco_platform_status_t *status)
+{
+    DECLARE_HYPERCALL_BUFFER(coco_platform_status_t, arg);
+    int rc;
+
+    arg = xc_hypercall_buffer_alloc(handle, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+    memcpy(arg, status, sizeof(coco_platform_status_t));
+
+    rc = xencall2(handle->xcall, __HYPERVISOR_coco_op, XEN_COCO_platform_status,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(handle, arg);
+    return rc;
+}
+
+int xc_coco_prepare_initial_mem(xc_interface *handle, coco_prepare_initial_mem_t *cmd)
+{
+    DECLARE_HYPERCALL_BUFFER(coco_prepare_initial_mem_t, arg);
+    int rc;
+
+    arg = xc_hypercall_buffer_alloc(handle, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+    memcpy(arg, cmd, sizeof(coco_prepare_initial_mem_t));
+
+    rc = xencall2(handle->xcall, __HYPERVISOR_coco_op, XEN_COCO_prepare_initial_mem,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(handle, arg);
+    return rc;
+}
+
 int xc_domain_setdebugging(xc_interface *xch,
                            uint32_t domid,
                            unsigned int enable)
diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
index a026a2f662..64ede46a05 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -41,6 +41,8 @@ endif
 # new domain builder
 OBJS-y                 += xg_dom_core.o
 OBJS-y                 += xg_dom_boot.o
+# TODO: add something like CONFIG_COCO ?
+OBJS-y                 += xg_dom_coco.o
 OBJS-y                 += xg_dom_elfloader.o
 OBJS-$(CONFIG_X86)     += xg_dom_bzimageloader.o
 OBJS-$(CONFIG_X86)     += xg_dom_decompress_lz4.o
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 5c7e12221d..6566784161 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -32,9 +32,13 @@
 
 #include "xg_private.h"
 #include "xg_core.h"
+#include "xg_dom_coco.h"
 #include <xen/hvm/params.h>
 #include <xen/grant_table.h>
 
+#define round_pgup(_p)    (((_p)+(PAGE_SIZE_X86-1))&PAGE_MASK_X86)
+#define round_pgdown(_p)  ((_p)&PAGE_MASK_X86)
+
 /* ------------------------------------------------------------------------ */
 
 static int setup_hypercall_page(struct xc_dom_image *dom)
@@ -201,6 +205,35 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
     if ( (rc = dom->arch_hooks->bootlate(dom)) != 0 )
         return rc;
 
+    // Encrypt domain pages
+    if ( dom->coco )
+    {
+        struct xc_dom_seg initrd_seg = {
+            .pfn = dom->initrd_start >> XC_DOM_PAGE_SHIFT(dom),
+            .pages = dom->initrd_len >> XC_DOM_PAGE_SHIFT(dom)
+        };
+
+        if ( (rc = xg_dom_coco_encrypt_seg(dom->xch, dom, dom->kernel_seg, "kernel") != 0) )
+            return rc;
+        if ( initrd_seg.pages && (rc = xg_dom_coco_encrypt_seg(dom->xch, dom, initrd_seg, "ramdisk") != 0) )
+            return rc;
+        if ( (rc = xg_dom_coco_encrypt_seg(dom->xch, dom, dom->start_info_seg, "start_info") != 0) )
+            return rc;
+        
+        for ( int i = 0; i < MAX_ACPI_MODULES; i++ )
+        {
+            struct xc_dom_seg seg;
+            seg.pfn = dom->acpi_modules[i].guest_addr_out >> XC_DOM_PAGE_SHIFT(dom);
+            seg.pages = round_pgup(dom->acpi_modules[i].length) >> XC_DOM_PAGE_SHIFT(dom);
+
+            if ( !seg.pfn || !seg.pages )
+                continue;
+
+            if ( (rc = xg_dom_coco_encrypt_seg(dom->xch, dom, seg, "acpi module")) != 0 )
+                return rc;
+        }
+    }
+
     /* let the vm run */
     if ( (rc = dom->arch_hooks->vcpu(dom)) != 0 )
         return rc;
diff --git a/tools/libs/guest/xg_dom_coco.c b/tools/libs/guest/xg_dom_coco.c
new file mode 100644
index 0000000000..f47b59fa49
--- /dev/null
+++ b/tools/libs/guest/xg_dom_coco.c
@@ -0,0 +1,35 @@
+/*
+ * Confidential computing support.
+ * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
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
+#include "xg_private.h"
+#include "xenctrl.h"
+#include "xg_dom_coco.h"
+
+int xg_dom_coco_encrypt_seg(xc_interface *xch, struct xc_dom_image *dom,
+                            struct xc_dom_seg seg, const char *name)
+{
+    coco_prepare_initial_mem_t cmd;
+    DPRINTF("coco: Encrypting pfn:[%"PRI_xen_pfn"-%"PRI_xen_pfn"] (%s)\n",
+            seg.pfn, seg.pfn + seg.pages, name);
+    
+    cmd.domid = dom->guest_domid;
+    cmd.gfn = seg.pfn;
+    cmd.count = seg.pages;
+    
+    return xc_coco_prepare_initial_mem(xch, &cmd);
+}
\ No newline at end of file
diff --git a/tools/libs/guest/xg_dom_coco.h b/tools/libs/guest/xg_dom_coco.h
new file mode 100644
index 0000000000..eac0fa66e3
--- /dev/null
+++ b/tools/libs/guest/xg_dom_coco.h
@@ -0,0 +1,39 @@
+/*
+ * Copyright (c) 2006 Isaku Yamahata <yamahata at valinux co jp>
+ *                    VA Linux Systems Japan K.K.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef XC_DOM_COCO_H
+#define XC_DOM_COCO_H
+
+#include "xg_private.h"
+#include "xenctrl.h"
+
+int xg_dom_coco_encrypt_seg(xc_interface *xch, struct xc_dom_image *dom,
+                            struct xc_dom_seg seg, const char *name);
+
+#endif /* XC_DOM_COCO_H */
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
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index cba01384ae..93407bf192 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -103,6 +103,7 @@ struct xc_dom_image_x86 {
 #define MAPPING_MAX 2
     struct xc_dom_x86_mapping maps[MAPPING_MAX];
     const struct xc_dom_params *params;
+    bool coco;
 
     /* PV: Pointer to the in-guest P2M. */
     void *p2m_guest;
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 063fe86eb7..9891c42a5b 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -342,6 +342,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
         MSR_ENTRY(0x10a, CPUID_REG_EAX),
         MSR_ENTRY(0x10a, CPUID_REG_EDX),
+        CPUID_ENTRY(0x8000001f, NA, CPUID_REG_EAX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e03599ea99..185f7946f4 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -93,6 +93,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
 
     libxl_defbool_setdefault(&b_info->device_model_stubdomain, false);
     libxl_defbool_setdefault(&b_info->vpmu, false);
+    libxl_defbool_setdefault(&b_info->coco, false);
 
     if (libxl_defbool_val(b_info->device_model_stubdomain) &&
         !b_info->device_model_ssidref)
@@ -667,6 +668,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         if (libxl_defbool_val(b_info->vpmu))
             create.flags |= XEN_DOMCTL_CDF_vpmu;
 
+        if (libxl_defbool_val(b_info->coco))
+            create.flags |= XEN_DOMCTL_CDF_coco;
+
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
         LOG(DETAIL, "passthrough: %s",
             libxl_passthrough_to_string(info->passthrough));
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 94fef37401..778dac2286 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1081,6 +1081,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     }
 
     dom->container_type = XC_DOM_HVM_CONTAINER;
+    dom->coco = libxl_defbool_val(info->coco);
 
     /* The params from the configuration file are in Mb, which are then
      * multiplied by 1 Kb. This was then divided off when calling
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9bb2969931..bb27e27148 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -637,6 +637,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("nested_hvm",       libxl_defbool),
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
+    ("coco",             libxl_defbool),
     ("tee",              libxl_tee_type),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
diff --git a/tools/libs/util/libxlu_disk_l.c b/tools/libs/util/libxlu_disk_l.c
index 0c180fff52..4924162a51 100644
--- a/tools/libs/util/libxlu_disk_l.c
+++ b/tools/libs/util/libxlu_disk_l.c
@@ -1,10 +1,7 @@
 #line 1 "libxlu_disk_l.c"
-#line 31 "libxlu_disk_l.l"
 #define _GNU_SOURCE
 
-
-
-#line 7 "libxlu_disk_l.c"
+#line 4 "libxlu_disk_l.c"
 
 #define  YY_INT_ALIGNED short int
 
@@ -1257,9 +1254,9 @@ static int vdev_and_devtype(DiskParseContext *dpc, char *str) {
 #undef DPC /* needs to be defined differently the actual lexer */
 #define DPC ((DiskParseContext*)yyextra)
 
-#line 1260 "libxlu_disk_l.c"
+#line 1257 "libxlu_disk_l.c"
 
-#line 1262 "libxlu_disk_l.c"
+#line 1259 "libxlu_disk_l.c"
 
 #define INITIAL 0
 #define LEXERR 1
@@ -1541,7 +1538,7 @@ YY_DECL
 #line 188 "libxlu_disk_l.l"
  /*----- the scanner rules which do the parsing -----*/
 
-#line 1544 "libxlu_disk_l.c"
+#line 1541 "libxlu_disk_l.c"
 
 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
@@ -1920,7 +1917,7 @@ YY_RULE_SETUP
 #line 306 "libxlu_disk_l.l"
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
-#line 1923 "libxlu_disk_l.c"
+#line 1920 "libxlu_disk_l.c"
 			case YY_STATE_EOF(INITIAL):
 			case YY_STATE_EOF(LEXERR):
 				yyterminate();
diff --git a/tools/libs/util/libxlu_disk_l.h b/tools/libs/util/libxlu_disk_l.h
index c868422568..027fd96c49 100644
--- a/tools/libs/util/libxlu_disk_l.h
+++ b/tools/libs/util/libxlu_disk_l.h
@@ -3,12 +3,9 @@
 #define xlu__disk_yyIN_HEADER 1
 
 #line 5 "libxlu_disk_l.h"
-#line 31 "libxlu_disk_l.l"
 #define _GNU_SOURCE
 
-
-
-#line 11 "libxlu_disk_l.h"
+#line 8 "libxlu_disk_l.h"
 
 #define  YY_INT_ALIGNED short int
 
@@ -699,6 +696,6 @@ extern int yylex (yyscan_t yyscanner);
 
 #line 306 "libxlu_disk_l.l"
 
-#line 702 "libxlu_disk_l.h"
+#line 699 "libxlu_disk_l.h"
 #undef xlu__disk_yyIN_HEADER
 #endif /* xlu__disk_yyHEADER_H */
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 4c4593528d..10a2e603e9 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -37,6 +37,7 @@ static const struct {
     { "CPUID 0x00000007:1.edx",     "7d1" },
     { "MSR_ARCH_CAPS.lo",         "m10Al" },
     { "MSR_ARCH_CAPS.hi",         "m10Ah" },
+    { "CPUID 0x8000001f.eax",      "e1fa" },
 };
 
 #define COL_ALIGN "24"
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a923..256adf0054 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -70,6 +70,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_COCO
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae..9ca55af05a 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -63,6 +63,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_COCO
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 089a88935a..0ddec0815b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2993,6 +2993,8 @@ skip_usbdev:
 
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
 
+    xlu_cfg_get_defbool(config, "coco", &b_info->coco, 0);
+
     xlu_cfg_destroy(config);
 }
 
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


