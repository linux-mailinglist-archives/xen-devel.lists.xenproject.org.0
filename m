Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3786A1EA4D5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOI-0006dV-JM; Mon, 01 Jun 2020 13:22:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOH-0006ct-2F
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:09 +0000
X-Inumbo-ID: df3da6c4-a40a-11ea-9dbe-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df3da6c4-a40a-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 13:21:59 +0000 (UTC)
IronPort-SDR: C8ptVWxodiBB3EqGFrAnjm23FTmPKQY+qGvbMdzuOQ5cL59d+ufNks+0mr4Q2Eg1YMi1TLCZnn
 BK9utKMQXIig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:56 -0700
IronPort-SDR: CSscI0DActZay7lfaxFXLbg3psQfkSGDofDsdx7FRzi1axZMAj514VZFPcJ4KqOUJ+k4+/WIWn
 WObTr+DekdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887275"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:56 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 05/13] tools/libxl: Add checks for dm_restore_file
Date: Mon,  1 Jun 2020 06:21:39 -0700
Message-Id: <1f439c9d611458426917b5d6b9a350ff7dc6559f.1591017086.git.tamas.lengyel@intel.com>
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

We can skip a bunch of steps a normal domain creation would entail, similar
to how domain restore & soft_reset skips them.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_create.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index c3614e5a30..3f0745acc6 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1294,7 +1294,7 @@ static void initiate_domain_create(libxl__egc *egc,
     if (ret)
         goto error_out;
 
-    if (dbs->restore || dcs->soft_reset) {
+    if (dbs->restore || dcs->soft_reset || d_config->dm_restore_file) {
         LOGD(DEBUG, domid, "restoring, not running bootloader");
         domcreate_bootloader_done(egc, &dcs->bl, 0);
     } else  {
@@ -1370,7 +1370,7 @@ static void domcreate_bootloader_done(libxl__egc *egc,
     dcs->sdss.dm.callback = domcreate_devmodel_started;
     dcs->sdss.callback = domcreate_devmodel_started;
 
-    if (restore_fd < 0 && !dcs->soft_reset) {
+    if (restore_fd < 0 && !dcs->soft_reset && !d_config->dm_restore_file) {
         rc = libxl__domain_build(gc, d_config, domid, state);
         domcreate_rebuild_done(egc, dcs, rc);
         return;
-- 
2.25.1


