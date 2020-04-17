Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236E11AE32D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPUSI-0005yt-1d; Fri, 17 Apr 2020 17:07:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lvC5=6B=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jPUSG-0005yg-1Z
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:07:04 +0000
X-Inumbo-ID: d73290f8-80cd-11ea-8d58-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d73290f8-80cd-11ea-8d58-12813bfff9fa;
 Fri, 17 Apr 2020 17:06:55 +0000 (UTC)
IronPort-SDR: 5wKoKo0zsi21mK+IFH/YqNrBPSbYf/mjQ2qMNRxq4Lc+wMYRVkkQREPmYTraWDP7tvC/gxHLTq
 x5lvbIUrZ93w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 10:06:46 -0700
IronPort-SDR: gNCsQVxUsh84c1MR7F0ukbC2h4fyODrZxCM28KtnaYBeAPSjyfY4hiwJ/XhY2ptHvlD/20pC8s
 S3Z2hVB3k0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="428288194"
Received: from keclark-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.135.32.180])
 by orsmga005.jf.intel.com with ESMTP; 17 Apr 2020 10:06:46 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v15 3/3] xen/tools: VM forking toolstack side
Date: Fri, 17 Apr 2020 10:06:33 -0700
Message-Id: <7053228ba34b3e7a6ac62a527222f9cd04fbca67.1587142844.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587142844.git.tamas.lengyel@intel.com>
References: <cover.1587142844.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add necessary bits to implement "xl fork-vm" commands. The command allows the
user to specify how to launch the device model allowing for a late-launch model
in which the user can execute the fork without the device model and decide to
only later launch it.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 docs/man/xl.1.pod.in          |  48 +++++
 tools/libxc/include/xenctrl.h |  14 ++
 tools/libxc/xc_memshr.c       |  26 +++
 tools/libxl/libxl.h           |  12 ++
 tools/libxl/libxl_create.c    | 361 +++++++++++++++++++---------------
 tools/libxl/libxl_dm.c        |   2 +-
 tools/libxl/libxl_dom.c       |  43 +++-
 tools/libxl/libxl_internal.h  |   7 +
 tools/libxl/libxl_types.idl   |   1 +
 tools/libxl/libxl_x86.c       |  42 ++++
 tools/xl/Makefile             |   2 +-
 tools/xl/xl.h                 |   5 +
 tools/xl/xl_cmdtable.c        |  16 ++
 tools/xl/xl_forkvm.c          | 157 +++++++++++++++
 tools/xl/xl_vmcontrol.c       |  14 ++
 15 files changed, 584 insertions(+), 166 deletions(-)
 create mode 100644 tools/xl/xl_forkvm.c

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 09339282e6..010d07b07b 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -708,6 +708,54 @@ above).
 
 =back
 
+=item B<fork-vm> [I<OPTIONS>] I<domain-id>
+
+Create a fork of a running VM.  The domain will be paused after the operation
+and remains paused while forks of it exist.  Experimental and x86 only.
+Forks can only be made of domains with HAP enabled and on Intel hardware.  The
+parent domain must be created with the xl toolstack and its configuration must
+not manually define max_grant_frames, max_maptrack_frames or max_event_channels.
+
+B<OPTIONS>
+
+=over 4
+
+=item B<-p>
+
+Leave the fork paused after creating it.
+
+=item B<--launch-dm>
+
+Specify whether the device model (QEMU) should be launched for the fork. Late
+launch allows to start the device model for an already running fork.
+
+=item B<-C>
+
+The config file to use when launching the device model.  Currently required when
+launching the device model.  Most config settings MUST match the parent domain
+exactly, only change VM name, disk path and network configurations.
+
+=item B<-Q>
+
+The path to the qemu save file to use when launching the device model.  Currently
+required when launching the device model.
+
+=item B<--fork-reset>
+
+Perform a reset operation of an already running fork.  Note that resetting may
+be less performant then creating a new fork depending on how much memory the
+fork has deduplicated during its runtime.
+
+=item B<--max-vcpus>
+
+Specify the max-vcpus matching the parent domain when not launching the dm.
+
+=item B<--allow-iommu>
+
+Allow working a domain with IOMMU attached. Only for forks created with --launch-dm no.
+
+=back
+
 =item B<sharing> [I<domain-id>]
 
 Display the number of shared pages for a specified domain. If no domain is
diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 5f25c5a6d4..0a6ff93229 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -2232,6 +2232,20 @@ int xc_memshr_range_share(xc_interface *xch,
                           uint64_t first_gfn,
                           uint64_t last_gfn);
 
+int xc_memshr_fork(xc_interface *xch,
+                   uint32_t source_domain,
+                   uint32_t client_domain,
+                   bool allow_with_iommu);
+
+/*
+ * Note: this function is only intended to be used on short-lived forks that
+ * haven't yet aquired a lot of memory. In case the fork has a lot of memory
+ * it is likely more performant to create a new fork with xc_memshr_fork.
+ *
+ * With VMs that have a lot of memory this call may block for a long time.
+ */
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t forked_domain);
+
 /* Debug calls: return the number of pages referencing the shared frame backing
  * the input argument. Should be one or greater.
  *
diff --git a/tools/libxc/xc_memshr.c b/tools/libxc/xc_memshr.c
index 97e2e6a8d9..2300cc7075 100644
--- a/tools/libxc/xc_memshr.c
+++ b/tools/libxc/xc_memshr.c
@@ -239,6 +239,32 @@ int xc_memshr_debug_gref(xc_interface *xch,
     return xc_memshr_memop(xch, domid, &mso);
 }
 
+int xc_memshr_fork(xc_interface *xch, uint32_t pdomid, uint32_t domid,
+                   bool allow_with_iommu)
+{
+    xen_mem_sharing_op_t mso;
+
+    memset(&mso, 0, sizeof(mso));
+
+    mso.op = XENMEM_sharing_op_fork;
+    mso.u.fork.parent_domain = pdomid;
+
+    if ( allow_with_iommu )
+        mso.u.fork.flags |= XENMEM_FORK_WITH_IOMMU_ALLOWED;
+
+    return xc_memshr_memop(xch, domid, &mso);
+}
+
+int xc_memshr_fork_reset(xc_interface *xch, uint32_t domid)
+{
+    xen_mem_sharing_op_t mso;
+
+    memset(&mso, 0, sizeof(mso));
+    mso.op = XENMEM_sharing_op_fork_reset;
+
+    return xc_memshr_memop(xch, domid, &mso);
+}
+
 int xc_memshr_audit(xc_interface *xch)
 {
     xen_mem_sharing_op_t mso;
diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
index 71709dc585..d8da347d4e 100644
--- a/tools/libxl/libxl.h
+++ b/tools/libxl/libxl.h
@@ -2666,6 +2666,18 @@ int libxl_psr_get_hw_info(libxl_ctx *ctx, libxl_psr_feat_type type,
                           unsigned int lvl, unsigned int *nr,
                           libxl_psr_hw_info **info);
 void libxl_psr_hw_info_list_free(libxl_psr_hw_info *list, unsigned int nr);
+
+int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid,
+                         bool allow_with_iommu)
+                         LIBXL_EXTERNAL_CALLERS_ONLY;
+
+int libxl_domain_fork_launch_dm(libxl_ctx *ctx, libxl_domain_config *d_config,
+                                uint32_t domid,
+                                const libxl_asyncprogress_how *aop_console_how)
+                                LIBXL_EXTERNAL_CALLERS_ONLY;
+
+int libxl_domain_fork_reset(libxl_ctx *ctx, uint32_t domid)
+                            LIBXL_EXTERNAL_CALLERS_ONLY;
 #endif
 
 /* misc */
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index e7cb2dbc2b..5705b6e3a5 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -538,12 +538,12 @@ out:
     return ret;
 }
 
-int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
-                       libxl__domain_build_state *state,
-                       uint32_t *domid, bool soft_reset)
+static int libxl__domain_make_xs_entries(libxl__gc *gc, libxl_domain_config *d_config,
+                                         libxl__domain_build_state *state,
+                                         uint32_t domid)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    int ret, rc, nb_vm;
+    int rc, nb_vm;
     const char *dom_type;
     char *uuid_string;
     char *dom_path, *vm_path, *libxl_path;
@@ -555,9 +555,6 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
     /* convenience aliases */
     libxl_domain_create_info *info = &d_config->c_info;
-    libxl_domain_build_info *b_info = &d_config->b_info;
-
-    assert(soft_reset || *domid == INVALID_DOMID);
 
     uuid_string = libxl__uuid2string(gc, info->uuid);
     if (!uuid_string) {
@@ -565,137 +562,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         goto out;
     }
 
-    if (!soft_reset) {
-        struct xen_domctl_createdomain create = {
-            .ssidref = info->ssidref,
-            .max_vcpus = b_info->max_vcpus,
-            .max_evtchn_port = b_info->event_channels,
-            .max_grant_frames = b_info->max_grant_frames,
-            .max_maptrack_frames = b_info->max_maptrack_frames,
-        };
-
-        if (info->type != LIBXL_DOMAIN_TYPE_PV) {
-            create.flags |= XEN_DOMCTL_CDF_hvm;
-            create.flags |=
-                libxl_defbool_val(info->hap) ? XEN_DOMCTL_CDF_hap : 0;
-            create.flags |=
-                libxl_defbool_val(info->oos) ? 0 : XEN_DOMCTL_CDF_oos_off;
-        }
-
-        assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
-        LOG(DETAIL, "passthrough: %s",
-            libxl_passthrough_to_string(info->passthrough));
-
-        if (info->passthrough != LIBXL_PASSTHROUGH_DISABLED)
-            create.flags |= XEN_DOMCTL_CDF_iommu;
-
-        if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
-            create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
-
-        /* Ultimately, handle is an array of 16 uint8_t, same as uuid */
-        libxl_uuid_copy(ctx, (libxl_uuid *)&create.handle, &info->uuid);
-
-        ret = libxl__arch_domain_prepare_config(gc, d_config, &create);
-        if (ret < 0) {
-            LOGED(ERROR, *domid, "fail to get domain config");
-            rc = ERROR_FAIL;
-            goto out;
-        }
-
-        for (;;) {
-            uint32_t local_domid;
-            bool recent;
-
-            if (info->domid == RANDOM_DOMID) {
-                uint16_t v;
-
-                ret = libxl__random_bytes(gc, (void *)&v, sizeof(v));
-                if (ret < 0)
-                    break;
-
-                v &= DOMID_MASK;
-                if (!libxl_domid_valid_guest(v))
-                    continue;
-
-                local_domid = v;
-            } else {
-                local_domid = info->domid; /* May not be valid */
-            }
-
-            ret = xc_domain_create(ctx->xch, &local_domid, &create);
-            if (ret < 0) {
-                /*
-                 * If we generated a random domid and creation failed
-                 * because that domid already exists then simply try
-                 * again.
-                 */
-                if (errno == EEXIST && info->domid == RANDOM_DOMID)
-                    continue;
-
-                LOGED(ERROR, local_domid, "domain creation fail");
-                rc = ERROR_FAIL;
-                goto out;
-            }
-
-            /* A new domain now exists */
-            *domid = local_domid;
-
-            rc = libxl__is_domid_recent(gc, local_domid, &recent);
-            if (rc)
-                goto out;
-
-            /* The domid is not recent, so we're done */
-            if (!recent)
-                break;
-
-            /*
-             * If the domid was specified then there's no point in
-             * trying again.
-             */
-            if (libxl_domid_valid_guest(info->domid)) {
-                LOGED(ERROR, local_domid, "domain id recently used");
-                rc = ERROR_FAIL;
-                goto out;
-            }
-
-            /*
-             * The domain is recent and so cannot be used. Clear domid
-             * here since, if xc_domain_destroy() fails below there is
-             * little point calling it again in the error path.
-             */
-            *domid = INVALID_DOMID;
-
-            ret = xc_domain_destroy(ctx->xch, local_domid);
-            if (ret < 0) {
-                LOGED(ERROR, local_domid, "domain destroy fail");
-                rc = ERROR_FAIL;
-                goto out;
-            }
-
-            /* The domain was successfully destroyed, so we can try again */
-        }
-
-        rc = libxl__arch_domain_save_config(gc, d_config, state, &create);
-        if (rc < 0)
-            goto out;
-    }
-
-    /*
-     * If soft_reset is set the the domid will have been valid on entry.
-     * If it was not set then xc_domain_create() should have assigned a
-     * valid value. Either way, if we reach this point, domid should be
-     * valid.
-     */
-    assert(libxl_domid_valid_guest(*domid));
-
-    ret = xc_cpupool_movedomain(ctx->xch, info->poolid, *domid);
-    if (ret < 0) {
-        LOGED(ERROR, *domid, "domain move fail");
-        rc = ERROR_FAIL;
-        goto out;
-    }
-
-    dom_path = libxl__xs_get_dompath(gc, *domid);
+    dom_path = libxl__xs_get_dompath(gc, domid);
     if (!dom_path) {
         rc = ERROR_FAIL;
         goto out;
@@ -703,12 +570,12 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
     vm_path = GCSPRINTF("/vm/%s", uuid_string);
     if (!vm_path) {
-        LOGD(ERROR, *domid, "cannot allocate create paths");
+        LOGD(ERROR, domid, "cannot allocate create paths");
         rc = ERROR_FAIL;
         goto out;
     }
 
-    libxl_path = libxl__xs_libxl_path(gc, *domid);
+    libxl_path = libxl__xs_libxl_path(gc, domid);
     if (!libxl_path) {
         rc = ERROR_FAIL;
         goto out;
@@ -719,10 +586,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
     roperm[0].id = 0;
     roperm[0].perms = XS_PERM_NONE;
-    roperm[1].id = *domid;
+    roperm[1].id = domid;
     roperm[1].perms = XS_PERM_READ;
 
-    rwperm[0].id = *domid;
+    rwperm[0].id = domid;
     rwperm[0].perms = XS_PERM_NONE;
 
 retry_transaction:
@@ -740,7 +607,7 @@ retry_transaction:
                     noperm, ARRAY_SIZE(noperm));
 
     xs_write(ctx->xsh, t, GCSPRINTF("%s/vm", dom_path), vm_path, strlen(vm_path));
-    rc = libxl__domain_rename(gc, *domid, 0, info->name, t);
+    rc = libxl__domain_rename(gc, domid, 0, info->name, t);
     if (rc)
         goto out;
 
@@ -830,7 +697,7 @@ retry_transaction:
 
     vm_list = libxl_list_vm(ctx, &nb_vm);
     if (!vm_list) {
-        LOGD(ERROR, *domid, "cannot get number of running guests");
+        LOGD(ERROR, domid, "cannot get number of running guests");
         rc = ERROR_FAIL;
         goto out;
     }
@@ -854,7 +721,7 @@ retry_transaction:
             t = 0;
             goto retry_transaction;
         }
-        LOGED(ERROR, *domid, "domain creation ""xenstore transaction commit failed");
+        LOGED(ERROR, domid, "domain creation ""xenstore transaction commit failed");
         rc = ERROR_FAIL;
         goto out;
     }
@@ -866,6 +733,155 @@ retry_transaction:
     return rc;
 }
 
+int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
+                       libxl__domain_build_state *state,
+                       uint32_t *domid, bool soft_reset)
+{
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    int ret, rc;
+
+    /* convenience aliases */
+    libxl_domain_create_info *info = &d_config->c_info;
+    libxl_domain_build_info *b_info = &d_config->b_info;
+
+    assert(soft_reset || *domid == INVALID_DOMID);
+
+    if (!soft_reset) {
+        struct xen_domctl_createdomain create = {
+            .ssidref = info->ssidref,
+            .max_vcpus = b_info->max_vcpus,
+            .max_evtchn_port = b_info->event_channels,
+            .max_grant_frames = b_info->max_grant_frames,
+            .max_maptrack_frames = b_info->max_maptrack_frames,
+        };
+
+        if (info->type != LIBXL_DOMAIN_TYPE_PV) {
+            create.flags |= XEN_DOMCTL_CDF_hvm;
+            create.flags |=
+                libxl_defbool_val(info->hap) ? XEN_DOMCTL_CDF_hap : 0;
+            create.flags |=
+                libxl_defbool_val(info->oos) ? 0 : XEN_DOMCTL_CDF_oos_off;
+        }
+
+        assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
+        LOG(DETAIL, "passthrough: %s",
+            libxl_passthrough_to_string(info->passthrough));
+
+        if (info->passthrough != LIBXL_PASSTHROUGH_DISABLED)
+            create.flags |= XEN_DOMCTL_CDF_iommu;
+
+        if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
+            create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
+
+        /* Ultimately, handle is an array of 16 uint8_t, same as uuid */
+        libxl_uuid_copy(ctx, (libxl_uuid *)&create.handle, &info->uuid);
+
+        ret = libxl__arch_domain_prepare_config(gc, d_config, &create);
+        if (ret < 0) {
+            LOGED(ERROR, *domid, "fail to get domain config");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        for (;;) {
+            uint32_t local_domid;
+            bool recent;
+
+            if (info->domid == RANDOM_DOMID) {
+                uint16_t v;
+
+                ret = libxl__random_bytes(gc, (void *)&v, sizeof(v));
+                if (ret < 0)
+                    break;
+
+                v &= DOMID_MASK;
+                if (!libxl_domid_valid_guest(v))
+                    continue;
+
+                local_domid = v;
+            } else {
+                local_domid = info->domid; /* May not be valid */
+            }
+
+            ret = xc_domain_create(ctx->xch, &local_domid, &create);
+            if (ret < 0) {
+                /*
+                 * If we generated a random domid and creation failed
+                 * because that domid already exists then simply try
+                 * again.
+                 */
+                if (errno == EEXIST && info->domid == RANDOM_DOMID)
+                    continue;
+
+                LOGED(ERROR, local_domid, "domain creation fail");
+                rc = ERROR_FAIL;
+                goto out;
+            }
+
+            /* A new domain now exists */
+            *domid = local_domid;
+
+            rc = libxl__is_domid_recent(gc, local_domid, &recent);
+            if (rc)
+                goto out;
+
+            /* The domid is not recent, so we're done */
+            if (!recent)
+                break;
+
+            /*
+             * If the domid was specified then there's no point in
+             * trying again.
+             */
+            if (libxl_domid_valid_guest(info->domid)) {
+                LOGED(ERROR, local_domid, "domain id recently used");
+                rc = ERROR_FAIL;
+                goto out;
+            }
+
+            /*
+             * The domain is recent and so cannot be used. Clear domid
+             * here since, if xc_domain_destroy() fails below there is
+             * little point calling it again in the error path.
+             */
+            *domid = INVALID_DOMID;
+
+            ret = xc_domain_destroy(ctx->xch, local_domid);
+            if (ret < 0) {
+                LOGED(ERROR, local_domid, "domain destroy fail");
+                rc = ERROR_FAIL;
+                goto out;
+            }
+
+            /* The domain was successfully destroyed, so we can try again */
+        }
+
+        rc = libxl__arch_domain_save_config(gc, d_config, state, &create);
+        if (rc < 0)
+            goto out;
+    }
+
+    /*
+     * If soft_reset is set the the domid will have been valid on entry.
+     * If it was not set then xc_domain_create() should have assigned a
+     * valid value. Either way, if we reach this point, domid should be
+     * valid.
+     */
+    assert(libxl_domid_valid_guest(*domid));
+
+    ret = xc_cpupool_movedomain(ctx->xch, info->poolid, *domid);
+    if (ret < 0) {
+        LOGED(ERROR, *domid, "domain move fail");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    rc = libxl__domain_make_xs_entries(gc, d_config, state, *domid);
+
+out:
+    return rc;
+}
+
 static int store_libxl_entry(libxl__gc *gc, uint32_t domid,
                              libxl_domain_build_info *b_info)
 {
@@ -1191,16 +1207,32 @@ static void initiate_domain_create(libxl__egc *egc,
     ret = libxl__domain_config_setdefault(gc,d_config,domid);
     if (ret) goto error_out;
 
-    ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
-                             dcs->soft_reset);
-    if (ret) {
-        LOGD(ERROR, domid, "cannot make domain: %d", ret);
+    if ( !d_config->dm_restore_file )
+    {
+        ret = libxl__domain_make(gc, d_config, &dcs->build_state, &domid,
+                                 dcs->soft_reset);
         dcs->guest_domid = domid;
+
+        if (ret) {
+            LOGD(ERROR, domid, "cannot make domain: %d", ret);
+            ret = ERROR_FAIL;
+            goto error_out;
+        }
+    } else if ( dcs->guest_domid != INVALID_DOMID ) {
+        domid = dcs->guest_domid;
+
+        ret = libxl__domain_make_xs_entries(gc, d_config, &dcs->build_state, domid);
+        if (ret) {
+            LOGD(ERROR, domid, "cannot make domain: %d", ret);
+            ret = ERROR_FAIL;
+            goto error_out;
+        }
+    } else {
+        LOGD(ERROR, domid, "cannot make domain");
         ret = ERROR_FAIL;
         goto error_out;
     }
 
-    dcs->guest_domid = domid;
     dcs->sdss.dm.guest_domid = 0; /* means we haven't spawned */
 
     /* post-4.13 todo: move these next bits of defaulting to
@@ -1236,7 +1268,7 @@ static void initiate_domain_create(libxl__egc *egc,
     if (ret)
         goto error_out;
 
-    if (restore_fd >= 0 || dcs->soft_reset) {
+    if (restore_fd >= 0 || dcs->soft_reset || d_config->dm_restore_file) {
         LOGD(DEBUG, domid, "restoring, not running bootloader");
         domcreate_bootloader_done(egc, &dcs->bl, 0);
     } else  {
@@ -1312,7 +1344,16 @@ static void domcreate_bootloader_done(libxl__egc *egc,
     dcs->sdss.dm.callback = domcreate_devmodel_started;
     dcs->sdss.callback = domcreate_devmodel_started;
 
-    if (restore_fd < 0 && !dcs->soft_reset) {
+    if (restore_fd < 0 && !dcs->soft_reset && !d_config->dm_restore_file) {
+        rc = libxl__domain_build(gc, d_config, domid, state);
+        domcreate_rebuild_done(egc, dcs, rc);
+        return;
+    }
+
+    if ( d_config->dm_restore_file ) {
+        dcs->srs.dcs = dcs;
+        dcs->srs.ao = ao;
+        state->forked_vm = true;
         rc = libxl__domain_build(gc, d_config, domid, state);
         domcreate_rebuild_done(egc, dcs, rc);
         return;
@@ -1510,6 +1551,7 @@ static void domcreate_rebuild_done(libxl__egc *egc,
     /* convenience aliases */
     const uint32_t domid = dcs->guest_domid;
     libxl_domain_config *const d_config = dcs->guest_config;
+    libxl__domain_build_state *const state = &dcs->build_state;
 
     if (ret) {
         LOGD(ERROR, domid, "cannot (re-)build domain: %d", ret);
@@ -1517,6 +1559,9 @@ static void domcreate_rebuild_done(libxl__egc *egc,
         goto error_out;
     }
 
+    if ( d_config->dm_restore_file )
+        state->saved_state = GCSPRINTF("%s", d_config->dm_restore_file);
+
     store_libxl_entry(gc, domid, &d_config->b_info);
 
     libxl__multidev_begin(ao, &dcs->multidev);
@@ -1947,7 +1992,7 @@ static void domain_create_cb(libxl__egc *egc,
                              libxl__domain_create_state *dcs,
                              int rc, uint32_t domid);
 
-static int do_domain_create(libxl_ctx *ctx, libxl_domain_config *d_config,
+int libxl__do_domain_create(libxl_ctx *ctx, libxl_domain_config *d_config,
                             uint32_t *domid, int restore_fd, int send_back_fd,
                             const libxl_domain_restore_params *params,
                             const libxl_asyncop_how *ao_how,
@@ -1960,6 +2005,8 @@ static int do_domain_create(libxl_ctx *ctx, libxl_domain_config *d_config,
     GCNEW(cdcs);
     cdcs->dcs.ao = ao;
     cdcs->dcs.guest_config = d_config;
+    cdcs->dcs.guest_domid = *domid;
+
     libxl_domain_config_init(&cdcs->dcs.guest_config_saved);
     libxl_domain_config_copy(ctx, &cdcs->dcs.guest_config_saved, d_config);
     cdcs->dcs.restore_fd = cdcs->dcs.libxc_fd = restore_fd;
@@ -2204,8 +2251,8 @@ int libxl_domain_create_new(libxl_ctx *ctx, libxl_domain_config *d_config,
                             const libxl_asyncprogress_how *aop_console_how)
 {
     unset_disk_colo_restore(d_config);
-    return do_domain_create(ctx, d_config, domid, -1, -1, NULL,
-                            ao_how, aop_console_how);
+    return libxl__do_domain_create(ctx, d_config, domid, -1, -1, NULL,
+                                  ao_how, aop_console_how);
 }
 
 int libxl_domain_create_restore(libxl_ctx *ctx, libxl_domain_config *d_config,
@@ -2221,8 +2268,8 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libxl_domain_config *d_config,
         unset_disk_colo_restore(d_config);
     }
 
-    return do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd,
-                            params, ao_how, aop_console_how);
+    return libxl__do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd,
+                                   params, ao_how, aop_console_how);
 }
 
 int libxl_domain_soft_reset(libxl_ctx *ctx,
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f4007bbe50..b615f1fc88 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2803,7 +2803,7 @@ static void device_model_spawn_outcome(libxl__egc *egc,
 
     libxl__domain_build_state *state = dmss->build_state;
 
-    if (state->saved_state) {
+    if (state->saved_state && !state->forked_vm) {
         ret2 = unlink(state->saved_state);
         if (ret2) {
             LOGED(ERROR, dmss->guest_domid, "%s: failed to remove device-model state %s",
diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index 71cb578923..3bc7117b99 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -249,9 +249,12 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     libxl_domain_build_info *const info = &d_config->b_info;
     libxl_ctx *ctx = libxl__gc_owner(gc);
     char *xs_domid, *con_domid;
-    int rc;
+    int rc = 0;
     uint64_t size;
 
+    if ( state->forked_vm )
+        goto skip_fork;
+
     if (xc_domain_max_vcpus(ctx->xch, domid, info->max_vcpus) != 0) {
         LOG(ERROR, "Couldn't set max vcpu count");
         return ERROR_FAIL;
@@ -362,7 +365,6 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
         }
     }
 
-
     rc = libxl__arch_extra_memory(gc, info, &size);
     if (rc < 0) {
         LOGE(ERROR, "Couldn't get arch extra constant memory size");
@@ -374,6 +376,11 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
         return ERROR_FAIL;
     }
 
+    rc = libxl__arch_domain_create(gc, d_config, domid);
+    if ( rc )
+        goto out;
+
+skip_fork:
     xs_domid = xs_read(ctx->xsh, XBT_NULL, "/tool/xenstored/domid", NULL);
     state->store_domid = xs_domid ? atoi(xs_domid) : 0;
     free(xs_domid);
@@ -385,8 +392,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     state->store_port = xc_evtchn_alloc_unbound(ctx->xch, domid, state->store_domid);
     state->console_port = xc_evtchn_alloc_unbound(ctx->xch, domid, state->console_domid);
 
-    rc = libxl__arch_domain_create(gc, d_config, domid);
-
+out:
     return rc;
 }
 
@@ -444,6 +450,9 @@ int libxl__build_post(libxl__gc *gc, uint32_t domid,
     char **ents;
     int i, rc;
 
+    if ( state->forked_vm )
+        goto skip_fork;
+
     if (info->num_vnuma_nodes && !info->num_vcpu_soft_affinity) {
         rc = set_vnuma_affinity(gc, domid, info);
         if (rc)
@@ -466,6 +475,7 @@ int libxl__build_post(libxl__gc *gc, uint32_t domid,
         }
     }
 
+skip_fork:
     ents = libxl__calloc(gc, 12 + (info->max_vcpus * 2) + 2, sizeof(char *));
     ents[0] = "memory/static-max";
     ents[1] = GCSPRINTF("%"PRId64, info->max_memkb);
@@ -728,14 +738,16 @@ static int hvm_build_set_params(xc_interface *handle, uint32_t domid,
                                 libxl_domain_build_info *info,
                                 int store_evtchn, unsigned long *store_mfn,
                                 int console_evtchn, unsigned long *console_mfn,
-                                domid_t store_domid, domid_t console_domid)
+                                domid_t store_domid, domid_t console_domid,
+                                bool forked_vm)
 {
     struct hvm_info_table *va_hvm;
     uint8_t *va_map, sum;
     uint64_t str_mfn, cons_mfn;
     int i;
 
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM) {
+    if ( info->type == LIBXL_DOMAIN_TYPE_HVM && !forked_vm )
+    {
         va_map = xc_map_foreign_range(handle, domid,
                                       XC_PAGE_SIZE, PROT_READ | PROT_WRITE,
                                       HVM_INFO_PFN);
@@ -1051,6 +1063,23 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     struct xc_dom_image *dom = NULL;
     bool device_model = info->type == LIBXL_DOMAIN_TYPE_HVM ? true : false;
 
+    if ( state->forked_vm )
+    {
+        rc = hvm_build_set_params(ctx->xch, domid, info, state->store_port,
+                                  &state->store_mfn, state->console_port,
+                                  &state->console_mfn, state->store_domid,
+                                  state->console_domid, state->forked_vm);
+
+        if ( rc )
+            return rc;
+
+        return xc_dom_gnttab_seed(ctx->xch, domid, true,
+                                  state->console_mfn,
+                                  state->store_mfn,
+                                  state->console_domid,
+                                  state->store_domid);
+    }
+
     xc_dom_loginit(ctx->xch);
 
     /*
@@ -1175,7 +1204,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     rc = hvm_build_set_params(ctx->xch, domid, info, state->store_port,
                                &state->store_mfn, state->console_port,
                                &state->console_mfn, state->store_domid,
-                               state->console_domid);
+                               state->console_domid, false);
     if (rc != 0) {
         LOG(ERROR, "hvm build set params failed");
         goto out;
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 5f39e44cb9..d05ff31e83 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -1374,6 +1374,7 @@ typedef struct {
 
     char *saved_state;
     int dm_monitor_fd;
+    bool forked_vm;
 
     libxl__file_reference pv_kernel;
     libxl__file_reference pv_ramdisk;
@@ -4818,6 +4819,12 @@ _hidden int libxl__domain_pvcontrol(libxl__egc *egc,
 /* Check whether a domid is recent */
 int libxl__is_domid_recent(libxl__gc *gc, uint32_t domid, bool *recent);
 
+_hidden int libxl__do_domain_create(libxl_ctx *ctx, libxl_domain_config *d_config,
+                                    uint32_t *domid, int restore_fd, int send_back_fd,
+                                    const libxl_domain_restore_params *params,
+                                    const libxl_asyncop_how *ao_how,
+                                    const libxl_asyncprogress_how *aop_console_how);
+
 #endif
 
 /*
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index f7c473be74..2bb5e6319e 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -958,6 +958,7 @@ libxl_domain_config = Struct("domain_config", [
     ("on_watchdog", libxl_action_on_shutdown),
     ("on_crash", libxl_action_on_shutdown),
     ("on_soft_reset", libxl_action_on_shutdown),
+    ("dm_restore_file", string, {'const': True}),
     ], dir=DIR_IN)
 
 libxl_diskinfo = Struct("diskinfo", [
diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index f8bc828e62..7a0bd62fa7 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -2,6 +2,7 @@
 #include "libxl_arch.h"
 
 #include <xc_dom.h>
+#include <xen-xsm/flask/flask.h>
 
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
@@ -842,6 +843,47 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+/*
+ * The parent domain is expected to be created with default settings for
+ * - max_evtch_port
+ * - max_grant_frames
+ * - max_maptrack_frames
+ */
+int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t max_vcpus, uint32_t *domid,
+                         bool allow_with_iommu)
+{
+    int rc;
+    struct xen_domctl_createdomain create = {0};
+    create.flags |= XEN_DOMCTL_CDF_hvm;
+    create.flags |= XEN_DOMCTL_CDF_hap;
+    create.flags |= XEN_DOMCTL_CDF_oos_off;
+    create.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+    create.ssidref = SECINITSID_DOMU;
+    create.max_vcpus = max_vcpus;
+    create.max_evtchn_port = 1023;
+    create.max_grant_frames = LIBXL_MAX_GRANT_FRAMES_DEFAULT;
+    create.max_maptrack_frames = LIBXL_MAX_MAPTRACK_FRAMES_DEFAULT;
+
+    if ( (rc = xc_domain_create(ctx->xch, domid, &create)) )
+        return rc;
+
+    if ( (rc = xc_memshr_fork(ctx->xch, pdomid, *domid, allow_with_iommu)) )
+        xc_domain_destroy(ctx->xch, *domid);
+
+    return rc;
+}
+
+int libxl_domain_fork_launch_dm(libxl_ctx *ctx, libxl_domain_config *d_config,
+                                uint32_t domid,
+                                const libxl_asyncprogress_how *aop_console_how)
+{
+    return libxl__do_domain_create(ctx, d_config, &domid, -1, -1, 0, 0, aop_console_how);
+}
+
+int libxl_domain_fork_reset(libxl_ctx *ctx, uint32_t domid)
+{
+    return xc_memshr_fork_reset(ctx->xch, domid);
+}
 
 /*
  * Local variables:
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index af4912e67a..073222233b 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -15,7 +15,7 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 CFLAGS_XL += $(CFLAGS_libxenlight)
 CFLAGS_XL += -Wshadow
 
-XL_OBJS-$(CONFIG_X86) = xl_psr.o
+XL_OBJS-$(CONFIG_X86) = xl_psr.o xl_forkvm.o
 XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
 XL_OBJS += xl_parse.o xl_cpupool.o xl_flask.o
 XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 06569c6c4a..1105c34b15 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -31,6 +31,7 @@ struct cmd_spec {
 };
 
 struct domain_create {
+    uint32_t ddomid; /* fork launch dm for this domid */
     int debug;
     int daemonize;
     int monitor; /* handle guest reboots etc */
@@ -45,6 +46,7 @@ struct domain_create {
     const char *config_file;
     char *extra_config; /* extra config string */
     const char *restore_file;
+    const char *dm_restore_file;
     char *colo_proxy_script;
     bool userspace_colo_proxy;
     int migrate_fd; /* -1 means none */
@@ -128,6 +130,8 @@ int main_pciassignable_remove(int argc, char **argv);
 int main_pciassignable_list(int argc, char **argv);
 #ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
 int main_restore(int argc, char **argv);
+int main_fork_launch_dm(int argc, char **argv);
+int main_fork_reset(int argc, char **argv);
 int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
@@ -212,6 +216,7 @@ int main_psr_cat_cbm_set(int argc, char **argv);
 int main_psr_cat_show(int argc, char **argv);
 int main_psr_mba_set(int argc, char **argv);
 int main_psr_mba_show(int argc, char **argv);
+int main_fork_vm(int argc, char **argv);
 #endif
 int main_qemu_monitor_command(int argc, char **argv);
 
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 08335394e5..e5d2097c2b 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -187,6 +187,22 @@ struct cmd_spec cmd_table[] = {
       "Restore a domain from a saved state",
       "- for internal use only",
     },
+#if defined(__i386__) || defined(__x86_64__)
+    { "fork-vm",
+      &main_fork_vm, 0, 1,
+      "Fork a domain from the running parent domid. Experimental. Most config settings must match parent.",
+      "[options] <Domid>",
+      "-h                           Print this help.\n"
+      "-C <config>                  Use config file for VM fork.\n"
+      "-Q <qemu-save-file>          Use qemu save file for VM fork.\n"
+      "--launch-dm <yes|no|late>    Launch device model (QEMU) for VM fork.\n"
+      "--fork-reset                 Reset VM fork.\n"
+      "--max-vcpus                  Specify max-vcpus matching the parent domain when not launching dm\n"
+      "--allow-iommu                Allow forking a domain with IOMMU attached (only with --launch-dm no)\n"
+      "-p                           Do not unpause fork VM after operation.\n"
+      "-d                           Enable debug messages.\n"
+    },
+#endif
 #endif
     { "dump-core",
       &main_dump_core, 0, 1,
diff --git a/tools/xl/xl_forkvm.c b/tools/xl/xl_forkvm.c
new file mode 100644
index 0000000000..8ff1a59d3f
--- /dev/null
+++ b/tools/xl/xl_forkvm.c
@@ -0,0 +1,157 @@
+/*
+ * Copyright 2020 Intel Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include <fcntl.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/utsname.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <libxl.h>
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+#include "xl_parse.h"
+
+int main_fork_vm(int argc, char **argv)
+{
+    int rc, debug = 0;
+    uint32_t domid_in = INVALID_DOMID, domid_out = INVALID_DOMID;
+    int launch_dm = 1;
+    bool reset = 0;
+    bool pause = 0;
+    bool allow_iommu = 0;
+    const char *config_file = NULL;
+    const char *dm_restore_file = NULL;
+    uint32_t max_vcpus = 0;
+
+    int opt;
+    static struct option opts[] = {
+        {"launch-dm", 1, 0, 'l'},
+        {"fork-reset", 0, 0, 'r'},
+        {"max-vcpus", 1, 0, 'm'},
+        {"allow-iommu", 1, 0, 'i'},
+        COMMON_LONG_OPTS
+    };
+
+    SWITCH_FOREACH_OPT(opt, "phdC:Q:l:rm:i", opts, "fork-vm", 1) {
+    case 'd':
+        debug = 1;
+        break;
+    case 'p':
+        pause = 1;
+        break;
+    case 'm':
+        max_vcpus = atoi(optarg);
+        break;
+    case 'C':
+        config_file = optarg;
+        break;
+    case 'Q':
+        dm_restore_file = optarg;
+        break;
+    case 'l':
+        if ( !strcmp(optarg, "no") )
+            launch_dm = 0;
+        if ( !strcmp(optarg, "yes") )
+            launch_dm = 1;
+        if ( !strcmp(optarg, "late") )
+            launch_dm = 2;
+        break;
+    case 'r':
+        reset = 1;
+        break;
+    case 'i':
+        allow_iommu = 1;
+        break;
+    default:
+        fprintf(stderr, "Unimplemented option(s)\n");
+        return EXIT_FAILURE;
+    }
+
+    if (argc-optind == 1) {
+        domid_in = atoi(argv[optind]);
+    } else {
+        help("fork-vm");
+        return EXIT_FAILURE;
+    }
+
+    if (launch_dm)
+    {
+        if (!config_file || !dm_restore_file) {
+            fprintf(stderr, "Currently you must provide both -C and -Q options\n");
+            return EXIT_FAILURE;
+        }
+
+        if (allow_iommu) {
+            fprintf(stderr, "Forking a domain with an IOMMU is only possible with --launch-dm no\n");
+            return EXIT_FAILURE;
+        }
+    }
+
+    if (reset) {
+        domid_out = domid_in;
+        if (libxl_domain_fork_reset(ctx, domid_in) == EXIT_FAILURE)
+            return EXIT_FAILURE;
+    }
+
+    if (launch_dm == 2 || reset) {
+        domid_out = domid_in;
+        rc = EXIT_SUCCESS;
+    } else {
+        if ( !max_vcpus )
+        {
+            fprintf(stderr, "Currently you must parent's max_vcpu for this option\n");
+            return EXIT_FAILURE;
+        }
+
+        rc = libxl_domain_fork_vm(ctx, domid_in, max_vcpus, &domid_out, allow_iommu);
+    }
+
+    if (rc == EXIT_SUCCESS) {
+        if ( launch_dm ) {
+            struct domain_create dom_info;
+            memset(&dom_info, 0, sizeof(dom_info));
+            dom_info.ddomid = domid_out;
+            dom_info.dm_restore_file = dm_restore_file;
+            dom_info.debug = debug;
+            dom_info.paused = pause;
+            dom_info.config_file = config_file;
+            dom_info.migrate_fd = -1;
+            dom_info.send_back_fd = -1;
+            rc = create_domain(&dom_info) < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+        } else if ( !pause )
+            rc = libxl_domain_unpause(ctx, domid_out, NULL);
+    }
+
+    if (rc == EXIT_SUCCESS)
+        fprintf(stderr, "fork-vm command successfully returned domid: %u\n", domid_out);
+    else if ( domid_out != INVALID_DOMID )
+        libxl_domain_destroy(ctx, domid_out, 0);
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 17b4514c94..c64123d0a1 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -676,6 +676,12 @@ int create_domain(struct domain_create *dom_info)
 
     int restoring = (restore_file || (migrate_fd >= 0));
 
+#if defined(__i386__) || defined(__x86_64__)
+    /* VM forking */
+    uint32_t ddomid = dom_info->ddomid; // launch dm for this domain iff set
+    const char *dm_restore_file = dom_info->dm_restore_file;
+#endif
+
     libxl_domain_config_init(&d_config);
 
     if (restoring) {
@@ -928,6 +934,14 @@ start:
          * restore/migrate-receive it again.
          */
         restoring = 0;
+#if defined(__i386__) || defined(__x86_64__)
+    } else if ( ddomid ) {
+        d_config.dm_restore_file = dm_restore_file;
+        ret = libxl_domain_fork_launch_dm(ctx, &d_config, ddomid,
+                                          autoconnect_console_how);
+        domid = ddomid;
+        ddomid = INVALID_DOMID;
+#endif
     } else if (domid_soft_reset != INVALID_DOMID) {
         /* Do soft reset. */
         ret = libxl_domain_soft_reset(ctx, &d_config, domid_soft_reset,
-- 
2.20.1


