Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885AD217816
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 21:41:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jstSu-0007xX-8o; Tue, 07 Jul 2020 19:41:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CHg+=AS=cert.pl=michal.leszczynski@srs-us1.protection.inumbo.net>)
 id 1jstSt-0007no-0j
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 19:41:15 +0000
X-Inumbo-ID: c9b27082-c089-11ea-8de3-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9b27082-c089-11ea-8de3-12813bfff9fa;
 Tue, 07 Jul 2020 19:41:02 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2FD7FA2675;
 Tue,  7 Jul 2020 21:41:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2BA35A26A3;
 Tue,  7 Jul 2020 21:41:00 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xobwEcbRVpKw; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 76F41A269B;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EX9po0wo_flD; Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 534B2A2657;
 Tue,  7 Jul 2020 21:40:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E9C0322303;
 Tue,  7 Jul 2020 21:40:04 +0200 (CEST)
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Zc-6faRX1ri1; Tue,  7 Jul 2020 21:39:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id BA90C2243D;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
X-Quarantine-ID: <vL0WSPJJQuxu>
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vL0WSPJJQuxu; Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
Received: from mq-desktop.cert.pl (unknown [195.187.238.217])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 857A32237F;
 Tue,  7 Jul 2020 21:39:53 +0200 (CEST)
From: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 05/11] tools/libxl: add vmtrace_pt_size parameter
Date: Tue,  7 Jul 2020 21:39:44 +0200
Message-Id: <ac7b950a7ef86cbf0c63fe428ec94e2b6fe27453.1594150543.git.michal.leszczynski@cert.pl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
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
Cc: luwei.kang@intel.com, Wei Liu <wl@xen.org>,
 Michal Leszczynski <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, tamas.lengyel@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Michal Leszczynski <michal.leszczynski@cert.pl>

Allow to specify the size of per-vCPU trace buffer upon
domain creation. This is zero by default (meaning: not enabled).

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/libxl/libxl.h                  |  8 ++++++++
 tools/libxl/libxl_create.c           |  1 +
 tools/libxl/libxl_types.idl          |  4 ++++
 tools/xl/xl_parse.c                  | 22 ++++++++++++++++++++++
 7 files changed, 51 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739c1f..ddef9b6014 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -683,6 +683,19 @@ If this option is not specified then it will default to B<false>.
 
 =back
 
+=item B<processor_trace_buf_kb=KBYTES>
+
+Specifies the size of processor trace buffer that would be allocated
+for each vCPU belonging to this domain. Disabled (i.e.
+B<processor_trace_buf_kb=0> by default. This must be set to
+non-zero value in order to be able to use processor tracing features
+with this domain.
+
+B<NOTE>: In order to use Intel Processor Trace feature, this value
+must be between 8 kB and 4 GB and it must be a power of 2.
+
+=back
+
 =head2 Devices
 
 The following options define the paravirtual, emulated and physical
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 152c7e8e6b..3ce6f2374b 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1117,6 +1117,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.ProcessorTraceBufKb = int(xc.processor_trace_buf_kb)
 
  return nil}
 
@@ -1592,6 +1593,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.processor_trace_buf_kb = C.int(x.ProcessorTraceBufKb)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 663c1e86b4..f4bc16c0fd 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -516,6 +516,7 @@ GicVersion GicVersion
 Vuart VuartType
 }
 Altp2M Altp2MMode
+ProcessorTraceBufKb int
 }
 
 type domainBuildInfoTypeUnion interface {
diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
index 1cd6c38e83..fbf222967a 100644
--- a/tools/libxl/libxl.h
+++ b/tools/libxl/libxl.h
@@ -438,6 +438,14 @@
  */
 #define LIBXL_HAVE_CREATEINFO_PASSTHROUGH 1
 
+/*
+ * LIBXL_HAVE_PROCESSOR_TRACE_BUF_KB indicates that
+ * libxl_domain_create_info has a processor_trace_buf_kb parameter, which
+ * allows to enable pre-allocation of processor tracing buffers of given
+ * size.
+ */
+#define LIBXL_HAVE_PROCESSOR_TRACE_BUF_KB 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 2814818e34..4d6318124a 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -608,6 +608,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .processor_trace_buf_kb = b_info->processor_trace_buf_kb,
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f399..748fde65ab 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -645,6 +645,10 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
 
+    # Size of preallocated processor trace buffers (in KBYTES).
+    # Use zero value to disable this feature.
+    ("processor_trace_buf_kb", integer),
+
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
 )
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 61b4ef7b7e..87e373b413 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1861,6 +1861,28 @@ void parse_config_data(const char *config_source,
         }
     }
 
+    if (!xlu_cfg_get_long(config, "processor_trace_buf_kb", &l, 1) && l) {
+        if (l & (l - 1)) {
+            fprintf(stderr, "ERROR: processor_trace_buf_kb"
+                            " - must be a power of 2\n");
+            exit(1);
+        }
+
+        if (l < 8) {
+            fprintf(stderr, "ERROR: processor_trace_buf_kb"
+                            " - value is too small\n");
+            exit(1);
+        }
+
+        if (l > 1024*1024*4) {
+            fprintf(stderr, "ERROR: processor_trace_buf_kb"
+                            " - value is too large\n");
+            exit(1);
+        }
+
+        b_info->processor_trace_buf_kb = l;
+    }
+
     if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) {
         b_info->num_ioports = num_ioports;
         b_info->ioports = calloc(num_ioports, sizeof(*b_info->ioports));
-- 
2.17.1


