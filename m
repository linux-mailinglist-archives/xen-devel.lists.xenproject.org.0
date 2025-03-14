Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B67A617A6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914961.1320571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8ss-00029f-OA; Fri, 14 Mar 2025 17:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914961.1320571; Fri, 14 Mar 2025 17:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8ss-000274-Kb; Fri, 14 Mar 2025 17:31:46 +0000
Received: by outflank-mailman (input) for mailman id 914961;
 Fri, 14 Mar 2025 17:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt8nP-0003IK-3g
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:26:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 697c3ddf-00f9-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:26:06 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-abbb12bea54so470398766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:26:06 -0700 (PDT)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aeb24sm250677566b.9.2025.03.14.10.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:26:05 -0700 (PDT)
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
X-Inumbo-ID: 697c3ddf-00f9-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741973166; x=1742577966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOjAhdF7qm8ksHnQkFS3/1fokHq1z8lXtNWmszHnXSE=;
        b=d81bqqgmBJso9gkC6tpSq/i/bgIqqf2qcnZqYuQBDH2EqSFaN3qzFNOul1DmQ+m1ZJ
         XcH6cPRES+mxBG6BE9sSGm/L0cG7j7umZihcfSr92YPVtL/fV8NW8Nwpc4y1tHOt9FlV
         PxmW7Z1TccvfsMxW4pWFKtZAR8v7B4SYSj/+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973166; x=1742577966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOjAhdF7qm8ksHnQkFS3/1fokHq1z8lXtNWmszHnXSE=;
        b=onvfNBZQvTEWTF0JIz/R9cLxyWSj7uw0QgGogYaVp9asc9h9QOqQy17xLfVyr6ygCT
         kk0iGrS+2e3ibaNOF3IiWTMTyoxgZfmMNt5pxPE/35llOosB9+UVx9nu8T6I3Rc/d0Uw
         rxPrYza252DrQ+L/VZo3cWQv02lS/DFwT0pAiOqBZZ9JDhciI5Kb4sk+pYOK7x0fyE6K
         5yFbxs0Si9WCbPBaNAPoNwGjTB3yUquzsiL8eAB/4toWpYtX4F5lzV8qik4FFNfAS16m
         tQBzB85QtQI8XtMa8nGtoN219VGojEAi5ZHPUn/GCbFSCkvcRgrne8n02X90OwQIlXL/
         V7Lg==
X-Gm-Message-State: AOJu0YywwUlAjnOXnqj58btz0VMBctPPLGAkuCg7kpNHl7lVk+iQt86F
	31KwWAvCK0YaCQCjjPH3/jxr510aLHtV20R8fjwRWEKMai+BtDuZa+jHWLTisYSdqgavyNj9Nip
	l
X-Gm-Gg: ASbGncv8DYNaMB/mxc6a2VTmvOb3B1MAylqu5b7K3S/a5XN2WHQq+ol2418YM6zwxc2
	Ed2mOggfV7+AHNtATsKR4byQ2dkTXuVO3FUOwtz3YCYY3/3M3GkF4x4hV8Z4KJoDSCRTdhIztyn
	p8+0SPb4cTTTuwntmz9bX6yFk6QnbLTtl6MMYVVsRjKvjieX60k5uwmtv05VaiYsX0ylHdUxAuZ
	DU9yNH3WaQ58yIYHtOCCICtiETaI9V4ct4gZM9oCuzxx/35uYkiEJDbCWc9OmZZvjDIKWhBqdg4
	c7ViWY0UainClPfJLicNl64FvQctFdDSXLkIOSGU79ZKXeM6ydxhTSsMyI7qhpWvteA=
X-Google-Smtp-Source: AGHT+IFTtWZo8oNgpaaF/0kjmDvlIbxSdV9ixIZGHstTxzXk8JN8Qx0wCV70Trz4hr56UcZiaQbMnQ==
X-Received: by 2002:a17:907:868c:b0:ac2:8a4:b9db with SMTP id a640c23a62f3a-ac33017726fmr415971366b.16.1741973165827;
        Fri, 14 Mar 2025 10:26:05 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 09/11] tools/xc: Add `node` argument to xc_domain_claim_pages()
Date: Fri, 14 Mar 2025 17:25:00 +0000
Message-ID: <20250314172502.53498-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a node argument to make an exact-node claim. NUMA_NO_NODE means to
make a regular any-node claim.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xenctrl.h       |  1 +
 tools/libs/ctrl/xc_domain.c   | 13 ++++++++++++-
 tools/libs/guest/xg_dom_x86.c |  8 +++++---
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 495598123133..2b63992e1246 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1322,6 +1322,7 @@ int xc_domain_populate_physmap_exact(xc_interface *xch,
 
 int xc_domain_claim_pages(xc_interface *xch,
                                uint32_t domid,
+                               unsigned int node,
                                unsigned long nr_pages);
 
 int xc_domain_memory_exchange_pages(xc_interface *xch,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 2ddc3f4f426d..f2c6eda875dc 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -20,6 +20,7 @@
  */
 
 #include "xc_private.h"
+#include "xenguest.h"
 #include <xen/memory.h>
 #include <xen/hvm/hvm_op.h>
 
@@ -1072,13 +1073,23 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
 
 int xc_domain_claim_pages(xc_interface *xch,
                                uint32_t domid,
+                               unsigned int node,
                                unsigned long nr_pages)
 {
     int err;
+    unsigned int mem_flags = 0;
+
+    if ( node != XC_NUMA_NO_NODE )
+    {
+        if ( node >= 0xFF )
+            return -EINVAL;
+        mem_flags = XENMEMF_exact_node(node);
+    }
+
     struct xen_memory_reservation reservation = {
         .nr_extents   = nr_pages,
         .extent_order = 0,
-        .mem_flags    = 0, /* no flags */
+        .mem_flags    = mem_flags,
         .domid        = domid
     };
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index cba01384ae75..ac05106a8c1c 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -1199,6 +1199,7 @@ static int meminit_pv(struct xc_dom_image *dom)
     if ( dom->claim_enabled )
     {
         rc = xc_domain_claim_pages(dom->xch, dom->guest_domid,
+                                   XC_NUMA_NO_NODE,
                                    dom->total_pages);
         if ( rc )
             return rc;
@@ -1327,7 +1328,8 @@ static int meminit_pv(struct xc_dom_image *dom)
 
     /* Ensure no unclaimed pages are left unused.
      * OK to call if hadn't done the earlier claim call. */
-    xc_domain_claim_pages(dom->xch, dom->guest_domid, 0 /* cancel claim */);
+    xc_domain_claim_pages(dom->xch, dom->guest_domid, XC_NUMA_NO_NODE,
+                          0 /* cancel claim */);
 
     return rc;
 }
@@ -1442,7 +1444,7 @@ static int meminit_hvm(struct xc_dom_image *dom)
      * allocated is pointless.
      */
     if ( claim_enabled ) {
-        rc = xc_domain_claim_pages(xch, domid,
+        rc = xc_domain_claim_pages(xch, domid, XC_NUMA_NO_NODE,
                                    target_pages - dom->vga_hole_size);
         if ( rc != 0 )
         {
@@ -1642,7 +1644,7 @@ static int meminit_hvm(struct xc_dom_image *dom)
  out:
 
     /* ensure no unclaimed pages are left unused */
-    xc_domain_claim_pages(xch, domid, 0 /* cancels the claim */);
+    xc_domain_claim_pages(xch, domid, XC_NUMA_NO_NODE, 0 /* cancel claim */);
 
     return rc;
 }
-- 
2.48.1


