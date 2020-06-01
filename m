Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883EC1EA4D2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOV-0006nZ-2e; Mon, 01 Jun 2020 13:22:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOT-0006m3-Sq
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:21 +0000
X-Inumbo-ID: dfe2868b-a40a-11ea-ab1b-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfe2868b-a40a-11ea-ab1b-12813bfff9fa;
 Mon, 01 Jun 2020 13:22:01 +0000 (UTC)
IronPort-SDR: Q/Mehip2yzTT5iUIc/0IwmuMBlveXybEMeJ7RqwJnMIMPACRFzKgM7ZMx39oZU8m6NtGRYSQlv
 WDdgPvOaQahQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:22:00 -0700
IronPort-SDR: kpzPta1L2TR2Hn5MiCYUdBSMcpJ4Q9SEdlvlxVA9nx4wfpYjCo7pZ3UFLt34zhjd2pmBEwP4Si
 Ew8Pd/1LBd+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887319"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:59 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 11/13] tools/libxl: Add VM forking public
 functions
Date: Mon,  1 Jun 2020 06:21:45 -0700
Message-Id: <5c477725d701be72172a6aebf983a1bf956cec40.1591017086.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1591017086.git.tamas.lengyel@intel.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl.h        | 10 +++++++++
 tools/libxl/libxl_create.c | 44 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
index 71709dc585..79792d6e29 100644
--- a/tools/libxl/libxl.h
+++ b/tools/libxl/libxl.h
@@ -2704,6 +2704,16 @@ static inline int libxl_qemu_monitor_command_0x041200(libxl_ctx *ctx,
  */
 int libxl_clear_domid_history(libxl_ctx *ctx);
 
+/*
+ * Experimental VM forking functions
+ */
+int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t *domid)
+                         LIBXL_EXTERNAL_CALLERS_ONLY;
+
+int libxl_domain_fork_launch_dm(libxl_ctx *ctx, libxl_domain_config *d_config,
+                                uint32_t domid,
+                                const libxl_asyncprogress_how *aop_console_how)
+                                LIBXL_EXTERNAL_CALLERS_ONLY;
 #endif /* LIBXL_H */
 
 /*
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 27f790cae1..9190e4e263 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -2339,6 +2339,50 @@ int libxl_domain_soft_reset(libxl_ctx *ctx,
                                 aop_console_how);
 }
 
+/*
+ * The parent domain is expected to be created with default settings for
+ * - max_evtch_port
+ * - max_grant_frames
+ * - max_maptrack_frames
+ */
+int libxl_domain_fork_vm(libxl_ctx *ctx, uint32_t pdomid, uint32_t *domid)
+{
+    int rc;
+    xc_dominfo_t info;
+    struct xen_domctl_createdomain create = {0};
+
+    if ( 1 != xc_domain_getinfo(ctx->xch, pdomid, 1, &info) )
+        return ERROR_INVAL;
+
+    if ( info.domid != pdomid || !info.hvm || !info.hap )
+        return ERROR_INVAL;
+
+    create.flags |= XEN_DOMCTL_CDF_hvm;
+    create.flags |= XEN_DOMCTL_CDF_hap;
+    create.flags |= XEN_DOMCTL_CDF_oos_off;
+    create.arch.emulation_flags = info.arch_config.emulation_flags;
+    create.ssidref = info.ssidref;
+    create.max_vcpus = info.max_vcpu_id + 1;
+    create.max_evtchn_port = 1023;
+    create.max_grant_frames = LIBXL_MAX_GRANT_FRAMES_DEFAULT;
+    create.max_maptrack_frames = LIBXL_MAX_MAPTRACK_FRAMES_DEFAULT;
+
+    if ( (rc = xc_domain_create(ctx->xch, domid, &create)) )
+        return rc;
+
+    if ( (rc = xc_memshr_fork(ctx->xch, pdomid, *domid, false, false)) )
+        xc_domain_destroy(ctx->xch, *domid);
+
+    return rc;
+}
+
+int libxl_domain_fork_launch_dm(libxl_ctx *ctx, libxl_domain_config *d_config,
+                                uint32_t domid,
+                                const libxl_asyncprogress_how *aop_console_how)
+{
+    return do_domain_create(ctx, d_config, &domid, -1, -1, 0, 0, aop_console_how);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


