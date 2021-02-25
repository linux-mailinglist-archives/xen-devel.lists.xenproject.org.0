Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF1325465
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89867.169694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFK9i-0002Nx-6x; Thu, 25 Feb 2021 17:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89867.169694; Thu, 25 Feb 2021 17:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFK9i-0002Nc-3b; Thu, 25 Feb 2021 17:10:26 +0000
Received: by outflank-mailman (input) for mailman id 89867;
 Thu, 25 Feb 2021 17:10:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFK9g-0002NX-5i
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:10:24 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4c4aa5-b865-4005-a0d5-ec71647767c7;
 Thu, 25 Feb 2021 17:10:21 +0000 (UTC)
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
X-Inumbo-ID: bc4c4aa5-b865-4005-a0d5-ec71647767c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614273021;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L+MZGORwjjtnsm6MVooKqC+Umtt9uS/ELwVwq9KToRU=;
  b=ANHDLKz1Dvfa1SMDiJ9yND/PIi2g5diLP+HQlkcb0UjpRwe6P6ZRC+MI
   v4XIbCq+sNjNxihay7+M89KwezssEA3H+njCFBTTy1Ipkzr9f76GBgp3F
   F9AJQX10U5w3oNvUxng2k7rqWVE+VIZH5EWE94XnmOY2fr6x9HLPn2U6t
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1QmICJ5+FmbZvYCr7Gn4YFTT2wy6ieFuBPOquzgfB50euNQqLBWnzyBtY5bQiYEiXn8UNBIqe2
 2A1dIC/zoMUjBd+pI9aGKOXhnnbLy8H+ztFtMcePxrWE3ZQEnqRHmmNMdyQXQXtjt72L9kq+Ca
 oMXaLMR4h/ouK53mDzMwvn7R0MQYGKaGVZj15/DF5U0qwc9WH2vtYi1aUAPuPpYJDmuAx6kclQ
 9RCOGLMLBsUloCC9cl5NI56rHzGrKb0pr8DCMfHugoVCeFRG8oukb54iBa9yzUPghJsNGpPvUD
 UCs=
X-SBRS: 5.2
X-MesageID: 38055929
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,206,1610427600"; 
   d="scan'208";a="38055929"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] dmop: Add XEN_DMOP_nr_vcpus
Date: Thu, 25 Feb 2021 17:09:46 +0000
Message-ID: <20210225170946.4297-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Curiously absent from the stable API/ABIs is an ability to query the number of
vcpus which a domain has.  Emulators need to know this information in
particular to know how many stuct ioreq's live in the ioreq server mappings.

In practice, this forces all userspace to link against libxenctrl to use
xc_domain_getinfo(), which rather defeats the purpose of the stable libraries.

Introduce a DMOP to retrieve this information and surface it in
libxendevicemodel to help emulators shed their use of unstable interfaces.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  This was a surprise discovery in the massive ABI untangling effort
I'm currently doing for XenServer's new build system.

This is one new read-only op to obtain information which isn't otherwise
available under a stable API/ABI.  As such, its risk for 4.15 is very low,
with a very real quality-of-life improvement for downstreams.

I realise this is technically a new feature and we're long past feature
freeze, but I'm hoping that "really lets some emulators move off the unstable
libraries" is sufficiently convincing argument.

It's not sufficient to let Qemu move off unstable libraries yet - at a
minimum, the add_to_phymap hypercalls need stabilising to support PCI
Passthrough and BAR remapping.

I'd prefer not to duplicate the op handling between ARM and x86, and if this
weren't a release window, I'd submit a prereq patch to dedup the common dmop
handling.  That can wait to 4.16 at this point.  Also, this op ought to work
against x86 PV guests, but fixing that up will also need this rearrangement
into common code, so needs to wait.
---
 tools/include/xendevicemodel.h               | 10 ++++++++++
 tools/libs/devicemodel/core.c                | 15 +++++++++++++++
 tools/libs/devicemodel/libxendevicemodel.map |  1 +
 xen/arch/arm/dm.c                            | 10 ++++++++++
 xen/arch/x86/hvm/dm.c                        | 11 +++++++++++
 xen/include/public/hvm/dm_op.h               | 15 +++++++++++++++
 xen/include/xlat.lst                         |  1 +
 7 files changed, 63 insertions(+)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index c06b3c84b9..33698d67f3 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -358,6 +358,16 @@ int xendevicemodel_pin_memory_cacheattr(
     uint32_t type);
 
 /**
+ * Query for the number of vCPUs that a domain has.
+ * @parm dmod a handle to an open devicemodel interface.
+ * @parm domid the domain id to be serviced.
+ * @parm vcpus Number of vcpus.
+ * @return 0 on success and fills @p vcpus, or -1 on failure.
+ */
+int xendevicemodel_nr_vcpus(
+    xendevicemodel_handle *dmod, domid_t domid, unsigned int *vcpus);
+
+/**
  * This function restricts the use of this handle to the specified
  * domain.
  *
diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index 30bd79f8ba..8e619eeb0a 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -630,6 +630,21 @@ int xendevicemodel_pin_memory_cacheattr(
     return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
 }
 
+int xendevicemodel_nr_vcpus(
+    xendevicemodel_handle *dmod, domid_t domid, unsigned int *vcpus)
+{
+    struct xen_dm_op op = {
+        .op = XEN_DMOP_nr_vcpus,
+    };
+
+    int rc = xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+    if ( rc )
+        return rc;
+
+    *vcpus = op.u.nr_vcpus.vcpus;
+    return 0;
+}
+
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid)
 {
     return osdep_xendevicemodel_restrict(dmod, domid);
diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
index 733549327b..f7f9e3d932 100644
--- a/tools/libs/devicemodel/libxendevicemodel.map
+++ b/tools/libs/devicemodel/libxendevicemodel.map
@@ -42,4 +42,5 @@ VERS_1.3 {
 VERS_1.4 {
 	global:
 		xendevicemodel_set_irq_level;
+		xendevicemodel_nr_vcpus;
 } VERS_1.3;
diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 785413372c..d689e336fd 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -38,6 +38,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
         [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
         [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
+        [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -122,6 +123,15 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
 
+    case XEN_DMOP_nr_vcpus:
+    {
+        struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
+
+        data->vcpus = d->max_vcpus;
+        rc = 0;
+        break;
+    }
+
     default:
         rc = ioreq_server_dm_op(&op, d, &const_op);
         break;
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 612749442e..f4f0910463 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -359,6 +359,7 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
         [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
         [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
+        [XEN_DMOP_nr_vcpus]                         = sizeof(struct xen_dm_op_nr_vcpus),
     };
 
     rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -606,6 +607,15 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
 
+    case XEN_DMOP_nr_vcpus:
+    {
+        struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
+
+        data->vcpus = d->max_vcpus;
+        rc = 0;
+        break;
+    }
+
     default:
         rc = ioreq_server_dm_op(&op, d, &const_op);
         break;
@@ -641,6 +651,7 @@ CHECK_dm_op_map_mem_type_to_ioreq_server;
 CHECK_dm_op_remote_shutdown;
 CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
+CHECK_dm_op_nr_vcpus;
 
 int compat_dm_op(domid_t domid,
                  unsigned int nr_bufs,
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index 1f70d58caa..ee97997238 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -449,6 +449,20 @@ struct xen_dm_op_set_irq_level {
 };
 typedef struct xen_dm_op_set_irq_level xen_dm_op_set_irq_level_t;
 
+/*
+ * XEN_DMOP_nr_vcpus: Query the number of vCPUs a domain has.
+ *
+ * The number of vcpus a domain has is fixed from creation time.  This bound
+ * is applicable to e.g. the vcpuid parameter of XEN_DMOP_inject_event, or
+ * number of struct ioreq objects mapped via XENMEM_acquire_resource.
+ */
+#define XEN_DMOP_nr_vcpus 20
+
+struct xen_dm_op_nr_vcpus {
+    uint32_t vcpus; /* OUT */
+};
+typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -472,6 +486,7 @@ struct xen_dm_op {
         xen_dm_op_remote_shutdown_t remote_shutdown;
         xen_dm_op_relocate_memory_t relocate_memory;
         xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
+        xen_dm_op_nr_vcpus_t nr_vcpus;
     } u;
 };
 
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 398993d5f4..cbbd20c958 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -107,6 +107,7 @@
 ?	dm_op_set_pci_intx_level	hvm/dm_op.h
 ?	dm_op_set_pci_link_route	hvm/dm_op.h
 ?	dm_op_track_dirty_vram		hvm/dm_op.h
+?	dm_op_nr_vcpus			hvm/dm_op.h
 !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op.h
 ?	vcpu_hvm_context		hvm/hvm_vcpu.h
 ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
-- 
2.11.0


