Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9092D32B0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 20:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47690.84464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihH-0000y8-CL; Tue, 08 Dec 2020 19:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47690.84464; Tue, 08 Dec 2020 19:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihG-0000vx-TR; Tue, 08 Dec 2020 19:30:50 +0000
Received: by outflank-mailman (input) for mailman id 47690;
 Tue, 08 Dec 2020 19:30:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmihD-0000me-Rc
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 19:30:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihD-0007Lr-3J; Tue, 08 Dec 2020 19:30:47 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihC-0001p0-S0; Tue, 08 Dec 2020 19:30:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=PWEJza/r2oRNQ2L9vbvH4x3sSK+2PBgCX1brH2xdXO4=; b=HHKbrMRjImxkQgQAxgoYtuuAkK
	GipesqIQm+HUBkbFZ8A2LveyGLCka5/dk0P4VFfDelXj/oY5rSbcNdQaZ6LxehkQYxCk7yl3WY76/
	CEfiVCKdmDPagpOjOIz8lfJQ8aWhXhXk/f+HaTB65qP1FbGWWrB8tacX7ULuBUtDatOo=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 07/25] libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
Date: Tue,  8 Dec 2020 19:30:15 +0000
Message-Id: <20201208193033.11306-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Both 'domid' and 'pci' are available in 'pci_remove_state' so there is no
need to also pass them as separate arguments.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/libxl_pci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index b6d3bd29b718..bcc4d2ef9686 100644
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
2.20.1


