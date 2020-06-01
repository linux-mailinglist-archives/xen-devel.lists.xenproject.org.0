Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C311A1EA4CD
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOX-0006qK-Hi; Mon, 01 Jun 2020 13:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOW-0006p5-35
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:24 +0000
X-Inumbo-ID: dfe083bc-a40a-11ea-9dbe-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfe083bc-a40a-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 13:22:00 +0000 (UTC)
IronPort-SDR: XjUeCg2bF3qGzFJsbJOzRBFy5uuT9p5WuMZvn6HKmpY+KcPBONBM9i/zpgJ8EVPH1wyjeJpI/c
 dOBtgNG4c3Sg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:58 -0700
IronPort-SDR: zRzIgK3NLGrwOWakh5KTlXg84PUXiwRHwTb+oRhNxnL4DfIGf/h+7YZJJwdivG0FiLCHJuVfck
 sgCu+QJko7dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887296"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:57 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 08/13] tools/libxl: Adjust libxl__build_post
Date: Mon,  1 Jun 2020 06:21:42 -0700
Message-Id: <ae698f3706244fc09db85c84db82ddf78e96c155.1591017086.git.tamas.lengyel@intel.com>
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

Skips parts not relevant to VM forks.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_dom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index 1b55097a1a..52d49437cc 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -455,6 +455,9 @@ int libxl__build_post(libxl__gc *gc, uint32_t domid,
     char **ents;
     int i, rc;
 
+    if (state->forked_vm)
+        goto skip_fork;
+
     if (info->num_vnuma_nodes && !info->num_vcpu_soft_affinity) {
         rc = set_vnuma_affinity(gc, domid, info);
         if (rc)
@@ -475,6 +478,7 @@ int libxl__build_post(libxl__gc *gc, uint32_t domid,
         }
     }
 
+skip_fork:
     ents = libxl__calloc(gc, 12 + (info->max_vcpus * 2) + 2, sizeof(char *));
     ents[0] = "memory/static-max";
     ents[1] = GCSPRINTF("%"PRId64, info->max_memkb);
-- 
2.25.1


