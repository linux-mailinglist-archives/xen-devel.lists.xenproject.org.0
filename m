Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1431EA4D0
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkON-0006gj-5l; Mon, 01 Jun 2020 13:22:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOM-0006gF-2B
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:14 +0000
X-Inumbo-ID: df4e475e-a40a-11ea-8993-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df4e475e-a40a-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 13:21:59 +0000 (UTC)
IronPort-SDR: OiTlxfAXUtm6i+b2l+ZzI3kOknlRorIT78wliQmC8X7xL8saYQAuXRKZOVfQwoA2mtJDAwL2eV
 eMpEY7raiHSQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:57 -0700
IronPort-SDR: CVuO+4ehU7TfZV95N6Qju9mNN4lwVMxQYdLjW2RpEurT0ArwV6c/GEHsjkX9BPecavBOl1FcS4
 GhG+5ki6KQBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887281"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:56 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 06/13] tools/libxl: adjust
 domcreate_bootloader_done
Date: Mon,  1 Jun 2020 06:21:40 -0700
Message-Id: <0772dc7d3002e02b2c5775b32980a7719a4176b7.1591017086.git.tamas.lengyel@intel.com>
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

Add special handling when only the the device model needs launching for forks.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_create.c   | 9 +++++++++
 tools/libxl/libxl_internal.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 3f0745acc6..ab3ac096ee 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1376,6 +1376,15 @@ static void domcreate_bootloader_done(libxl__egc *egc,
         return;
     }
 
+    if (d_config->dm_restore_file) {
+        dcs->srs.dcs = dcs;
+        dcs->srs.ao = ao;
+        state->forked_vm = true;
+        rc = libxl__domain_build(gc, d_config, domid, state);
+        domcreate_rebuild_done(egc, dcs, rc);
+        return;
+    }
+
     /* Prepare environment for domcreate_stream_done */
     dcs->srs.dcs = dcs;
 
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 19b367daca..eaae955658 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -1376,6 +1376,7 @@ typedef struct {
 
     char *saved_state;
     int dm_monitor_fd;
+    bool forked_vm;
 
     libxl__file_reference pv_kernel;
     libxl__file_reference pv_ramdisk;
-- 
2.25.1


