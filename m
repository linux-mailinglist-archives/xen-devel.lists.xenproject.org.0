Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A62D32E9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47763.84537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAG-0004sH-IX; Tue, 08 Dec 2020 20:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47763.84537; Tue, 08 Dec 2020 20:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAG-0004rL-96; Tue, 08 Dec 2020 20:00:48 +0000
Received: by outflank-mailman (input) for mailman id 47763;
 Tue, 08 Dec 2020 20:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAD-0004on-Jh
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAC-00086I-QG; Tue, 08 Dec 2020 20:00:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihF-0001p0-Id; Tue, 08 Dec 2020 19:30:49 +0000
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
	bh=HD4e8QIuOJKsoYEaJ78yCnUJ89s+VAB/WU9F9pKuq1c=; b=OGMBKZ0qbSoolNUERAOJgtRPOy
	dfRNLmBTJFWj59NT7iboNV42XgSRmilKYne8uoC9ZCA3ePsZW1i6p0zmN+XwlADfWJvnzK8X+UYoh
	a+XlICCQsQktAQZ2av3UyCTpie/ybWp1QEWiemrnUs+jvqg+3QgUcQ+u7AGH2HcYFmBg=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 10/25] libxl: remove unnecessary check from libxl__device_pci_add()
Date: Tue,  8 Dec 2020 19:30:18 +0000
Message-Id: <20201208193033.11306-11-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

The code currently checks explicitly whether the device is already assigned,
but this is actually unnecessary as assigned devices do not form part of
the list returned by libxl_device_pci_assignable_list() and hence the
libxl_pci_assignable() test would have already failed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/libxl_pci.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 78ee641e9aa8..0c2ab5075d9f 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1555,8 +1555,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
 {
     STATE_AO_GC(aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    libxl_device_pci *assigned;
-    int num_assigned, rc;
+    int rc;
     int stubdomid = 0;
     pci_add_state *pas;
 
@@ -1595,19 +1594,6 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         goto out;
     }
 
-    rc = get_all_assigned_devices(gc, &assigned, &num_assigned);
-    if ( rc ) {
-        LOGD(ERROR, domid,
-             "cannot determine if device is assigned, refusing to continue");
-        goto out;
-    }
-    if ( is_pci_in_array(assigned, num_assigned, pci->domain,
-                         pci->bus, pci->dev, pci->func) ) {
-        LOGD(ERROR, domid, "PCI device already attached to a domain");
-        rc = ERROR_FAIL;
-        goto out;
-    }
-
     libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
-- 
2.20.1


