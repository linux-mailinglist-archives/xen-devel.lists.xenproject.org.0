Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F98AE732
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710584.1109859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFkP-0006Q7-MJ; Tue, 23 Apr 2024 12:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710584.1109859; Tue, 23 Apr 2024 12:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFkP-0006Ob-JR; Tue, 23 Apr 2024 12:59:45 +0000
Received: by outflank-mailman (input) for mailman id 710584;
 Tue, 23 Apr 2024 12:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6m9h=L4=bounce.vates.tech=bounce-md_30504962.6627b0ba.v1-e055206ecdee4a869e4f370c6f8c2059@srs-se1.protection.inumbo.net>)
 id 1rzFkO-0006OV-0E
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 12:59:44 +0000
Received: from mail145-32.atl61.mandrillapp.com
 (mail145-32.atl61.mandrillapp.com [198.2.145.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58eac1fc-0171-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 14:59:41 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-32.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VP2JV6DthzP0Jmwh
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 12:59:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e055206ecdee4a869e4f370c6f8c2059; Tue, 23 Apr 2024 12:59:38 +0000
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
X-Inumbo-ID: 58eac1fc-0171-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713877178; x=1714137678;
	bh=F+QRxh4CXlFCVrXkXAQI0kHZB6ikPyZM1KYsxVuHWIg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Siz439Sxac9XaH5fg2F/Wrf+Jrb58hhKaMY/PNEy7FlA+E1vIiRf8JSAuPRzANwL4
	 fwfsG0qDRGcUS9PiKVOfegjX8Q1Q48Gknbp/wOziaIm7/BgBMT9j1+tIMmr4i2+84A
	 /h/cgV0qZn6lPmnsNGQRl3rrm6sKlk7D7K9S6TayCkogQJOlj9B3KQqNn/0pyaFq/R
	 VHlwHyUwGKjIoN3v2e7uExvDXzNIhU9Yg6KlXi7Iw9GHs06nx0ifddF4eoLLhWqEth
	 5zhNf47aLERtPpAThqzG8BsV5gGGhTdA9eelvFw2Br4nGdtwcCILE8kTG4UAVr8Hpb
	 tNIL4QbNZqFBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713877178; x=1714137678; i=teddy.astie@vates.tech;
	bh=F+QRxh4CXlFCVrXkXAQI0kHZB6ikPyZM1KYsxVuHWIg=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Zbp3x8sIacvjpzszJaoC7L2QbWSqHnPn1/9MlaaaPUng9C15ULq0dOtUyedUOInpJ
	 I5/ikIIcrH8k3xBJf/g95cgV3PAPTW+iRkgr1vnFpZu9yTOH5f/xlggWnt2Fgt3I2P
	 T+DVDN/TBcZx4IunF7ekXe0AIN5+IOffVXZOyNIfbRCygrelAGU/M2vkeotSZ3NO7D
	 SugwxeDiuOKJ8k7f3c2fEb646KSb4FnJAToLwBh8BZqbflxezEDn1K1ZeERInmccHC
	 oIVm5YyNZI6C9U+fo0FIuhfh/KEOF61sJ/lplzSmbalV4almLOI/wFq8fHjm6biYiI
	 dzHjrRhoX6uSA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20PATCH=20v1]=20xen/public:=20Add=20initial=20files=20for=20PV-IOMMU?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713877177054
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Message-Id: <1cdd746f1af79970f8c7151d23854d33416772e0.1713876394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e055206ecdee4a869e4f370c6f8c2059?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240423:md
Date: Tue, 23 Apr 2024 12:59:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I am introducing a proposal for a PV-IOMMU hypercall interface.

Some operating systems want to use IOMMU to implement various features (e.g
VFIO) or DMA protection. This proposal aims to provide to guests (notably D=
om0)
a way to access a paravirtualized one.

This proposal is based on what presented on xcp-ng blog [1] with some
notable changes :
 - it is now possible to specify a number of contigous pages to map/unmap,
it replaces the "sub-operation count" parameter of the hypercall that allow=
ed
batching operations but I found it too complex and not really practical
 - it is now possible from the guest to query PV-IOMMU capabilities (max io=
va,
maximum context number, max pages in a single operation)

This patch includes a design document describing the main ideas and a publi=
c
header of the interface to use.

Teddy

---

[1] https://xcp-ng.org/blog/2024/04/18/iommu-paravirtualization-for-xen/

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Rahul Singh <rahul.singh@arm.com>

---
 docs/designs/pv-iommu.md      | 105 +++++++++++++++++++++++++++++++
 xen/include/public/pv-iommu.h | 114 ++++++++++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 docs/designs/pv-iommu.md
 create mode 100644 xen/include/public/pv-iommu.h

diff --git a/docs/designs/pv-iommu.md b/docs/designs/pv-iommu.md
new file mode 100644
index 0000000000..c01062a3ad
--- /dev/null
+++ b/docs/designs/pv-iommu.md
@@ -0,0 +1,105 @@
+# IOMMU paravirtualization for Dom0
+
+Status: Experimental
+
+# Background
+
+By default, Xen only uses the IOMMU for itself, either to make device adre=
ss
+space coherent with guest adress space (x86 HVM/PVH) or to prevent devices
+from doing DMA outside it's expected memory regions including the hypervis=
or
+(x86 PV).
+
+A limitation is that guests (especially privildged ones) may want to use
+IOMMU hardware in order to implement features such as DMA protection and
+VFIO [1] as IOMMU functionality is not available outside of the hypervisor
+currently.
+
+[1] VFIO - "Virtual Function I/O" - https://www.kernel.org/doc/html/latest=
/driver-api/vfio.html
+
+# Design
+
+The operating system may want to have access to various IOMMU features suc=
h as
+context management and DMA remapping. We can create a new hypercall that a=
llows
+the guest to have access to a new paravirtualized IOMMU interface.
+
+This feature is only meant to be available for the Dom0, as DomU have some
+emulated devices that can't be managed on Xen side and are not hardware, w=
e
+can't rely on the hardware IOMMU to enforce DMA remapping.
+
+This interface is exposed under the `iommu_op` hypercall.
+
+In addition, Xen domains are modified in order to allow existence of sever=
al
+IOMMU context including a default one that implement default behavior (e.g
+hardware assisted paging) and can't be modified by guest. DomU cannot have
+contexts, and therefore act as if they only have the default domain.
+
+Each IOMMU context within a Xen domain is identified using a domain-specif=
ic
+context number that is used in the Xen IOMMU subsystem and the hypercall
+interface.
+
+The number of IOMMU context a domain can use is predetermined at domain cr=
eation
+and is configurable through `dom0-iommu=3Dnb-ctx=3DN` xen cmdline.
+
+# IOMMU operations
+
+## Alloc context
+
+Create a new IOMMU context for the guest and return the context number to =
the
+guest.
+Fail if the IOMMU context limit of the guest is reached.
+
+A flag can be specified to create a identity mapping.
+
+## Free context
+
+Destroy a IOMMU context created previously.
+It is not possible to free the default context.
+
+Reattach context devices to default context if specified by the guest.
+
+Fail if there is a device in the context and reattach-to-default flag is n=
ot
+specified.
+
+## Reattach device
+
+Reattach a device to another IOMMU context (including the default one).
+The target IOMMU context number must be valid and the context allocated.
+
+The guest needs to specify a PCI SBDF of a device he has access to.
+
+## Map/unmap page
+
+Map/unmap a page on a context.
+The guest needs to specify a gfn and target dfn to map.
+
+Refuse to create the mapping if one already exist for the same dfn.
+
+## Lookup page
+
+Get the gfn mapped by a specific dfn.
+
+# Implementation considerations
+
+## Hypercall batching
+
+In order to prevent unneeded hypercalls and IOMMU flushing, it is advisabl=
e to
+be able to batch some critical IOMMU operations (e.g map/unmap multiple pa=
ges).
+
+## Hardware without IOMMU support
+
+Operating system needs to be aware on PV-IOMMU capability, and whether it =
is
+able to make contexts. However, some operating system may critically fail =
in
+case they are able to make a new IOMMU context. Which is supposed to happe=
n
+if no IOMMU hardware is available.
+
+The hypercall interface needs a interface to advertise the ability to crea=
te
+and manage IOMMU contexts including the amount of context the guest is abl=
e
+to use. Using these informations, the Dom0 may decide whether to use or no=
t
+the PV-IOMMU interface.
+
+## Page pool for contexts
+
+In order to prevent unexpected starving on the hypervisor memory with a
+buggy Dom0. We can preallocate the pages the contexts will use and make
+map/unmap use these pages instead of allocating them dynamically.
+
diff --git a/xen/include/public/pv-iommu.h b/xen/include/public/pv-iommu.h
new file mode 100644
index 0000000000..45f9c44eb1
--- /dev/null
+++ b/xen/include/public/pv-iommu.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: MIT */
+/*************************************************************************=
*****
+ * pv-iommu.h
+ *
+ * Paravirtualized IOMMU driver interface.
+ *
+ * Copyright (c) 2024 Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#ifndef __XEN_PUBLIC_PV_IOMMU_H__
+#define __XEN_PUBLIC_PV_IOMMU_H__
+
+#include "xen.h"
+#include "physdev.h"
+
+#define IOMMU_DEFAULT_CONTEXT (0)
+
+/**
+ * Query PV-IOMMU capabilities for this domain.
+ */
+#define IOMMUOP_query_capabilities    1
+
+/**
+ * Allocate an IOMMU context, the new context handle will be written to ct=
x_no.
+ */
+#define IOMMUOP_alloc_context         2
+
+/**
+ * Destroy a IOMMU context.
+ * All devices attached to this context are reattached to default context.
+ *
+ * The default context can't be destroyed (0).
+ */
+#define IOMMUOP_free_context          3
+
+/**
+ * Reattach the device to IOMMU context.
+ */
+#define IOMMUOP_reattach_device       4
+
+#define IOMMUOP_map_pages             5
+#define IOMMUOP_unmap_pages           6
+
+/**
+ * Get the GFN associated to a specific DFN.
+ */
+#define IOMMUOP_lookup_page           7
+
+struct pv_iommu_op {
+    uint16_t subop_id;
+    uint16_t ctx_no;
+
+/**
+ * Create a context that is cloned from default.
+ * The new context will be populated with 1:1 mappings covering the entire=
 guest memory.
+ */
+#define IOMMU_CREATE_clone (1 << 0)
+
+#define IOMMU_OP_readable (1 << 0)
+#define IOMMU_OP_writeable (1 << 1)
+    uint32_t flags;
+
+    union {
+        struct {
+            uint64_t gfn;
+            uint64_t dfn;
+            /* Number of pages to map */
+            uint32_t nr_pages;
+            /* Number of pages actually mapped after sub-op */
+            uint32_t mapped;
+        } map_pages;
+
+        struct {
+            uint64_t dfn;
+            /* Number of pages to unmap */
+            uint32_t nr_pages;
+            /* Number of pages actually unmapped after sub-op */
+            uint32_t unmapped;
+        } unmap_pages;
+
+        struct {
+            struct physdev_pci_device dev;
+        } reattach_device;
+
+        struct {
+            uint64_t gfn;
+            uint64_t dfn;
+        } lookup_page;
+
+        struct {
+            /* Maximum number of IOMMU context this domain can use. */
+            uint16_t max_ctx_no;
+            /* Maximum number of pages that can be modified in a single ma=
p/unmap operation. */
+            uint32_t max_nr_pages;
+            /* Maximum device address (iova) that the guest can use for ma=
ppings. */
+            uint64_t max_iova_addr;
+        } cap;
+    };
+};
+
+typedef struct pv_iommu_op pv_iommu_op_t;
+DEFINE_XEN_GUEST_HANDLE(pv_iommu_op_t);
+
+#endif
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
\ No newline at end of file
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


