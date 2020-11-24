Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F552C30A4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 20:18:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36879.68967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdp8-0003PV-74; Tue, 24 Nov 2020 19:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36879.68967; Tue, 24 Nov 2020 19:17:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khdp7-0003OE-VI; Tue, 24 Nov 2020 19:17:57 +0000
Received: by outflank-mailman (input) for mailman id 36879;
 Tue, 24 Nov 2020 19:17:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khdp6-0003NJ-IB
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp5-000473-MH; Tue, 24 Nov 2020 19:17:55 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khdp5-0001af-EV; Tue, 24 Nov 2020 19:17:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp6-0003NJ-IB
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 19:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Ab1xFXjavoHWImv5EdYjiLsTfFXo0yohVYFMNSfSBu8=; b=XhYSWVF0+rPXX327YXZdWgIakp
	hwNMBq11dVZDKNTIM1BiXi5SO/7j2c9rqUefBht0MR1ONR9FEJ6+ELuaXw2ZNaDKvdRND+BA4ZURu
	9WF7A9N0zZHn8PBV0g7BcM53MGzaFZVF+N8cnaT6twdxkh0VpmoNefvIcFnw7mnxCAlI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp5-000473-MH; Tue, 24 Nov 2020 19:17:55 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com ([86.183.162.145] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khdp5-0001af-EV; Tue, 24 Nov 2020 19:17:55 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Eslam Elnikety <elnikety@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 2/3] libxl: add a 'disable_fifo_evtchn' flag to libxl_domain_build_info ...
Date: Tue, 24 Nov 2020 19:17:50 +0000
Message-Id: <20201124191751.11472-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201124191751.11472-1-paul@xen.org>
References: <20201124191751.11472-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

...to control setting the domain create flag XEN_DOMCTL_CDF_disable_fifo.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v4:
 - New in v4
---
 tools/include/libxl.h            | 8 ++++++++
 tools/libs/light/libxl_create.c  | 5 +++++
 tools/libs/light/libxl_types.idl | 1 +
 3 files changed, 14 insertions(+)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 1ea5b4f446e8..fe0aad632c08 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -444,6 +444,14 @@
  */
 #define LIBXL_HAVE_DISK_SAFE_REMOVE 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_DISABLE_EVTCHN_FIFO indicates that
+ * libxl_domain_build_info has a disable_evtchn_fifo (boolean) field
+ * to determine whether the EVTCHNOPs to initialize and manipulate FIFO
+ * event channels are exposed to the guest.
+ */
+#define LIBXL_HAVE_BUILDINFO_DISABLE_EVTCHN_FIFO 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 321a13e519b5..abbbd91442c0 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -263,6 +263,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     if (!b_info->event_channels)
         b_info->event_channels = 1023;
 
+    libxl_defbool_setdefault(&b_info->disable_evtchn_fifo, false);
+
     libxl__arch_domain_build_info_setdefault(gc, b_info);
     libxl_defbool_setdefault(&b_info->dm_restrict, false);
 
@@ -609,6 +611,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_maptrack_frames = b_info->max_maptrack_frames,
         };
 
+        if (libxl_defbool_val(b_info->disable_evtchn_fifo))
+            create.flags |= XEN_DOMCTL_CDF_disable_fifo;
+
         if (info->type != LIBXL_DOMAIN_TYPE_PV) {
             create.flags |= XEN_DOMCTL_CDF_hvm;
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9d3f05f39978..fa3f6ec3425e 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -541,6 +541,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("iomem",            Array(libxl_iomem_range, "num_iomem")),
     ("claim_mode",	     libxl_defbool),
     ("event_channels",   uint32),
+    ("disable_evtchn_fifo",libxl_defbool),
     ("kernel",           string),
     ("cmdline",          string),
     ("ramdisk",          string),
-- 
2.20.1


