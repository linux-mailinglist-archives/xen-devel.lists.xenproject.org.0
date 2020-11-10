Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794182ADD6F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 18:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23573.50455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoM-0003B4-SW; Tue, 10 Nov 2020 17:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23573.50455; Tue, 10 Nov 2020 17:52:06 +0000
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
	id 1kcXoM-00039z-Lj; Tue, 10 Nov 2020 17:52:06 +0000
Received: by outflank-mailman (input) for mailman id 23573;
 Tue, 10 Nov 2020 17:52:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXoL-0002u0-0u
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:05 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 211ddd09-1534-4663-b83c-5ff3fc69c787;
 Tue, 10 Nov 2020 17:51:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoD-0006ZM-RD; Tue, 10 Nov 2020 17:51:57 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoD-0007RC-JQ; Tue, 10 Nov 2020 17:51:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXoL-0002u0-0u
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:05 +0000
X-Inumbo-ID: 211ddd09-1534-4663-b83c-5ff3fc69c787
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 211ddd09-1534-4663-b83c-5ff3fc69c787;
	Tue, 10 Nov 2020 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=9Gg5nhEEC5gWYbJbNF9Cn78tfQpb6QS4wTBLfSwSCiY=; b=5somhVGtlDPmd6swL+YBqjBTs7
	YDIJCX0JIztUus0a59dW3RPGcatS+P2swvxwhI5MEMftFMGiD/Q3yAYU+Nd0lkTPtlWqIMvgGHEL7
	j8/uK4j7Y7qv5+4BRljlWhfBmmb+lkNRcPO6ILH5RbxJYH5wgKf0hl8yPNnm+j4/a1/I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoD-0006ZM-RD; Tue, 10 Nov 2020 17:51:57 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoD-0007RC-JQ; Tue, 10 Nov 2020 17:51:57 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 08/24] libxl: remove unnecessary check from libxl__device_pci_add()
Date: Tue, 10 Nov 2020 17:51:31 +0000
Message-Id: <20201110175147.7067-9-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

The code currently checks explicitly whether the device is already assigned,
but this is actually unnecessary as assigned devices do not form part of
the list returned by libxl_device_pci_assignable_list() and hence the
libxl_pci_assignable() test would have already failed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index fdafd2c9bafb..f9f8374d7d36 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1536,8 +1536,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
 {
     STATE_AO_GC(aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    libxl_device_pci *assigned;
-    int num_assigned, rc;
+    int rc;
     int stubdomid = 0;
     pci_add_state *pas;
 
@@ -1576,19 +1575,6 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
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


