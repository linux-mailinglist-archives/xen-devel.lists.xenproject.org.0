Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63042C1247
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 18:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34930.66264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFtp-0006R0-3j; Mon, 23 Nov 2020 17:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34930.66264; Mon, 23 Nov 2020 17:45:12 +0000
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
	id 1khFto-0006OX-NF; Mon, 23 Nov 2020 17:45:12 +0000
Received: by outflank-mailman (input) for mailman id 34930;
 Mon, 23 Nov 2020 17:45:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khFtk-0006Iw-PQ
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtk-0006Yh-0b; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtj-0000at-U9; Mon, 23 Nov 2020 17:45:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0006Iw-PQ
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=QpeMsaNDODuqzK/3ooOCFKLwmrQNIi9uPeHe1VKXhiI=; b=4AA71pzOYbruA2LTRlY/huEYI
	w6QfVxPvHhFP1y29Q8iGK/O0XhnPBdGQDZvtyhwaEOLFnQh0BVC0TiBbczx0kq/OY+t0oi5WH24X/
	Rtu28U357CSPJF/5/GtAl1jJAy1PRUzkLSAF42a4DcjLN1sT89LfdKy5Le9RQObbRJS+w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0006Yh-0b; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtj-0000at-U9; Mon, 23 Nov 2020 17:45:07 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 06/23] libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
Date: Mon, 23 Nov 2020 17:44:46 +0000
Message-Id: <20201123174503.6800-7-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Both 'domid' and 'pci' are available in 'pci_remove_state' so there is no
need to also pass them as separate arguments.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index de617e95eb..41e4b2b571 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1871,14 +1871,14 @@ static void pci_remove_stubdom_done(libxl__egc *egc,
 static void pci_remove_done(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 
-static void do_pci_remove(libxl__egc *egc, uint32_t domid,
-                          libxl_device_pci *pci, int force,
-                          pci_remove_state *prs)
+static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
 {
     STATE_AO_GC(prs->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
     libxl_device_pci *assigned;
+    uint32_t domid = prs->domid;
     libxl_domain_type type = libxl__domain_type(gc, domid);
+    libxl_device_pci *pci = prs->pci;
     int rc, num;
     uint32_t domainid = domid;
 
@@ -2275,7 +2275,6 @@ static void device_pci_remove_common_next(libxl__egc *egc,
     EGC_GC;
 
     /* Convenience aliases */
-    libxl_domid domid = prs->domid;
     libxl_device_pci *const pci = prs->pci;
     libxl__ao_device *const aodev = prs->aodev;
     const unsigned int pfunc_mask = prs->pfunc_mask;
@@ -2293,7 +2292,7 @@ static void device_pci_remove_common_next(libxl__egc *egc,
             } else {
                 pci->vdevfn = orig_vdev;
             }
-            do_pci_remove(egc, domid, pci, prs->force, prs);
+            do_pci_remove(egc, prs);
             return;
         }
     }
-- 
2.11.0


