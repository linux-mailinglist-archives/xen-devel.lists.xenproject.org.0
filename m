Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8747F20F4BC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:35:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFU1-0007vo-36; Tue, 30 Jun 2020 12:35:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/Ev=AL=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jqFTz-0007rV-SD
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:35:27 +0000
X-Inumbo-ID: 26eac194-bace-11ea-8610-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26eac194-bace-11ea-8610-12813bfff9fa;
 Tue, 30 Jun 2020 12:35:17 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2E156A37F2;
 Tue, 30 Jun 2020 14:35:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DBA3EA37EA;
 Tue, 30 Jun 2020 14:35:14 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6c6ZlYgi4yYs; Tue, 30 Jun 2020 14:35:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id EB504A37EF;
 Tue, 30 Jun 2020 14:35:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DLC0qsDeFUTK; Tue, 30 Jun 2020 14:35:13 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C1F57A37E6;
 Tue, 30 Jun 2020 14:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id B009A22620;
 Tue, 30 Jun 2020 14:34:43 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id REfR4kavPwNO; Tue, 30 Jun 2020 14:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 0D78E22625;
 Tue, 30 Jun 2020 14:34:38 +0200 (CEST)
X-Quarantine-ID: <SG5vQoo2xMmh>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SG5vQoo2xMmh; Tue, 30 Jun 2020 14:34:37 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id D1D2A224C7;
 Tue, 30 Jun 2020 14:34:37 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 03/10] tools/libxl: add vmtrace_pt_size parameter
Date: Tue, 30 Jun 2020 14:33:46 +0200
Message-Id: <5f4f4b1afa432258daff43f2dc8119b6a441fff4.1593519420.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, luwei.kang@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Allow to specify the size of per-vCPU trace buffer upon
domain creation. This is zero by default (meaning: not enabled).

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 docs/man/xl.cfg.5.pod.in             | 10 ++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libxl/libxl.h                  |  8 ++++++++
 tools/libxl/libxl_create.c           |  1 +
 tools/libxl/libxl_types.idl          |  2 ++
 tools/xl/xl_parse.c                  | 20 ++++++++++++++++++++
 xen/common/domain.c                  | 12 ++++++++++++
 xen/include/public/domctl.h          |  1 +
 9 files changed, 57 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739c1f..78f434b722 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -278,6 +278,16 @@ memory=8096 will report significantly less memory available for use
 than a system with maxmem=8096 memory=8096 due to the memory overhead
 of having to track the unused pages.
 
+=item B<vmtrace_pt_size=BYTES>
+
+Specifies the size of processor trace buffer that would be allocated
+for each vCPU belonging to this domain. Disabled (i.e. B<vmtrace_pt_size=0>
+by default. This must be set to non-zero value in order to be able to
+use processor tracing features with this domain.
+
+B<NOTE>: The size value must be between 4 kB and 4 GB and it must
+be also a power of 2.
+
 =back
 
 =head3 Guest Virtual NUMA Configuration
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 935d3bc50a..ecace9634e 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1117,6 +1117,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.VmtracePtOrder = int(xc.vmtrace_pt_order)
 
  return nil}
 
@@ -1592,6 +1593,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.vmtrace_pt_order = C.int(x.VmtracePtOrder)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 663c1e86b4..f9b07ac862 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -516,6 +516,7 @@ GicVersion GicVersion
 Vuart VuartType
 }
 Altp2M Altp2MMode
+VmtracePtOrder int
 }
 
 type domainBuildInfoTypeUnion interface {
diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
index 71709dc585..891e8e28d6 100644
--- a/tools/libxl/libxl.h
+++ b/tools/libxl/libxl.h
@@ -438,6 +438,14 @@
  */
 #define LIBXL_HAVE_CREATEINFO_PASSTHROUGH 1
 
+/*
+ * LIBXL_HAVE_VMTRACE_PT_ORDER indicates that
+ * libxl_domain_create_info has a vmtrace_pt_order parameter, which
+ * allows to enable pre-allocation of processor tracing buffers
+ * with the given order of size.
+ */
+#define LIBXL_HAVE_VMTRACE_PT_ORDER 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 75862dc6ed..651d1f4c0f 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -608,6 +608,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .vmtrace_pt_order = b_info->vmtrace_pt_order,
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f399..1c5dd43e4d 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -645,6 +645,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
 
+    ("vmtrace_pt_order", integer),
+
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
 )
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7b7e..4eba224590 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1861,6 +1861,26 @@ void parse_config_data(const char *config_source,
         }
     }
 
+    if (!xlu_cfg_get_long(config, "vmtrace_pt_size", &l, 1) && l) {
+        int32_t shift = 0;
+
+        if (l & (l - 1))
+        {
+            fprintf(stderr, "ERROR: pt buffer size must be a power of 2\n");
+            exit(1);
+        }
+
+        while (l >>= 1) ++shift;
+
+        if (shift <= XEN_PAGE_SHIFT)
+        {
+            fprintf(stderr, "ERROR: too small pt buffer\n");
+            exit(1);
+        }
+
+        b_info->vmtrace_pt_order = shift - XEN_PAGE_SHIFT;
+    }
+
     if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) {
         b_info->num_ioports = num_ioports;
         b_info->ioports = calloc(num_ioports, sizeof(*b_info->ioports));
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0a33e0dfd6..27dcfbac8c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -338,6 +338,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->vmtrace_pt_order && !vmtrace_supported )
+    {
+        dprintk(XENLOG_INFO, "Processor tracing is not supported\n");
+        return -EINVAL;
+    }
+
     return arch_sanitise_domain_config(config);
 }
 
@@ -443,6 +449,12 @@ struct domain *domain_create(domid_t domid,
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
+
+        if ( config->vmtrace_pt_order )
+        {
+            uint32_t shift_val = config->vmtrace_pt_order + PAGE_SHIFT;
+            d->vmtrace_pt_size = (1ULL << shift_val);
+        }
     }
 
     if ( (err = arch_domain_create(d, config)) != 0 )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 59bdc28c89..7b8289d436 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
+    uint8_t vmtrace_pt_order;
 
     struct xen_arch_domainconfig arch;
 };
-- 
2.20.1


