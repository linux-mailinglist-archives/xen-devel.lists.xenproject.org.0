Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805330B374
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 00:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80188.146485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibW-0007Pd-9k; Mon, 01 Feb 2021 23:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80188.146485; Mon, 01 Feb 2021 23:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ibW-0007PC-6A; Mon, 01 Feb 2021 23:27:34 +0000
Received: by outflank-mailman (input) for mailman id 80188;
 Mon, 01 Feb 2021 23:27:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6ibV-0007P6-0R
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 23:27:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 913af046-38af-40b3-83dc-937cf1f68d92;
 Mon, 01 Feb 2021 23:27:31 +0000 (UTC)
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
X-Inumbo-ID: 913af046-38af-40b3-83dc-937cf1f68d92
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612222050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yyB7IEX91e5BgUihcc8rw4F6xaxM9TfCWmmgF4h+/LI=;
  b=CFvMY5+F9R9VND5Itfx6LGX5uIasTK2hc2ad+UkucMAcUUe+FEFu6D9b
   8HXi0UYtHqaogOfgJIqLMdgGdKcfPM7GflrX86NOYqZGt3V0iwxsjrQ3/
   sANxYNBPDMTccchXDbqgDqusqZH6s7Lm0eZTa0ynYQPrei31+D4ifyL5Q
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YEENkP44gzMZtTh5zS4/cGoSBfGzd33S8ERdyX2jzq/bBs4QGabWaOEJ/mFSIEyph8x50neiVi
 KAqLlL3R861Wfcm5JFExOEOYhMujndOEyXK/FYmoAN/ZIwaMmS5mLNN/gjg/RFORH1EhPyU8Yr
 eissbn/PAIMQh+HA2acPq90Wn6tiyhpPlnyhnW+ucL00bIE/+mUSRI2mt1Kj0ZIo2VvECq5F+e
 HwR2ZNjl995nSiQ+ZIN+Gej3vnjNVHHc56sxbh4D5y06SN1JBILuqUy5xsp83leAHnbuFm8Wih
 44E=
X-SBRS: 5.1
X-MesageID: 36523025
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,393,1602561600"; 
   d="scan'208";a="36523025"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Tamas K
 Lengyel" <tamas@tklengyel.com>
Subject: [PATCH v9 03/11] tools/[lib]xl: Add vmtrace_buf_size parameter
Date: Mon, 1 Feb 2021 23:26:55 +0000
Message-ID: <20210201232703.29275-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210201232703.29275-1-andrew.cooper3@citrix.com>
References: <20210201232703.29275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Michał Leszczyński <michal.leszczynski@cert.pl>

Allow to specify the size of per-vCPU trace buffer upon
domain creation. This is zero by default (meaning: not enabled).

Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Tamas K Lengyel <tamas@tklengyel.com>

v8:
 * Rebase over vmtrace_size change.
v7:
 * Use the name 'vmtrace' consistently.
---
 docs/man/xl.cfg.5.pod.in             | 9 +++++++++
 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/include/libxl.h                | 7 +++++++
 tools/libs/light/libxl_create.c      | 1 +
 tools/libs/light/libxl_types.idl     | 4 ++++
 tools/xl/xl_parse.c                  | 4 ++++
 7 files changed, 28 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7cdb8595d3..040374dcd6 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -681,6 +681,15 @@ Windows).
 
 If this option is not specified then it will default to B<false>.
 
+=item B<vmtrace_buf_kb=KBYTES>
+
+Specifies the size of vmtrace buffer that would be allocated for each
+vCPU belonging to this domain.  Disabled (i.e.  B<vmtrace_buf_kb=0>) by
+default.
+
+B<NOTE>: Acceptable values are platform specific.  For Intel Processor
+Trace, this value must be a power of 2 between 4k and 16M.
+
 =back
 
 =head2 Devices
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 63e2876463..4c60d27a9c 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1114,6 +1114,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 
  return nil}
 
@@ -1589,6 +1590,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 5851c38057..cb13002fdb 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -514,6 +514,7 @@ GicVersion GicVersion
 Vuart VuartType
 }
 Altp2M Altp2MMode
+VmtraceBufKb int
 }
 
 type domainBuildInfoTypeUnion interface {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f48d0c5e8a..a7b673e89d 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -489,6 +489,13 @@
 #define LIBXL_HAVE_PHYSINFO_CAP_VMTRACE 1
 
 /*
+ * LIBXL_HAVE_VMTRACE_BUF_KB indicates that libxl_domain_create_info has a
+ * vmtrace_buf_kb parameter, which allows to enable pre-allocation of
+ * processor tracing buffers of given size.
+ */
+#define LIBXL_HAVE_VMTRACE_BUF_KB 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 9848d65f36..46f68da697 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -607,6 +607,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index dacb7df6b7..5b85a7419f 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -648,6 +648,10 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
 
+    # Size of preallocated vmtrace trace buffers (in KBYTES).
+    # Use zero value to disable this feature.
+    ("vmtrace_buf_kb", integer),
+
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
 )
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 867e4d068a..1893cfc086 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1863,6 +1863,10 @@ void parse_config_data(const char *config_source,
         }
     }
 
+    if (!xlu_cfg_get_long(config, "vmtrace_buf_kb", &l, 1) && l) {
+        b_info->vmtrace_buf_kb = l;
+    }
+
     if (!xlu_cfg_get_list(config, "ioports", &ioports, &num_ioports, 0)) {
         b_info->num_ioports = num_ioports;
         b_info->ioports = calloc(num_ioports, sizeof(*b_info->ioports));
-- 
2.11.0


