Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083576A8535
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 16:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505049.777588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxL-0001XQ-52; Thu, 02 Mar 2023 15:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505049.777588; Thu, 02 Mar 2023 15:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkxK-0001Ri-UD; Thu, 02 Mar 2023 15:34:54 +0000
Received: by outflank-mailman (input) for mailman id 505049;
 Thu, 02 Mar 2023 15:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZMsQ=62=desiato.srs.infradead.org=BATV+9a0490e5ac528e462c30+7130+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pXkxJ-0001Jv-8F
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 15:34:53 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2cdbef2-b90f-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 16:34:49 +0100 (CET)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pXkx4-00FL3n-2o; Thu, 02 Mar 2023 15:34:40 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXkx4-004uzW-2S; Thu, 02 Mar 2023 15:34:38 +0000
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
X-Inumbo-ID: c2cdbef2-b90f-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7HuQae7CBMvNWNUtKmsp3irMJUgtZo+bY0Gg/sxTvcA=; b=dq8AgLqqnaLPtRWcENWM2cS34S
	VPG6QR36tiZ4IOJIl0WR5V140YJiSV4QwUoMXWjQyPcG8gmcMFdqz1bC9CEY9jbPh2WHAPw/ucBhm
	oM5fK7TlM8bdPU3fRvBsq+nMkLRvvLB/dH3AaAvQKW5WaIRw5OUlj8kvCwKojnlO2HKmcNRn143qM
	0uwwkElqhMVAy1aetnMgnlnmrGE2KR2hViX+Ee56aT3ouBn9iCrBS05fxonTB8AVe2TmyMuz8OS6+
	UeVLolZ2i4CLzzk1CtUbzuHZB0zIkPT+bqYEMfBVyJVAn66km008aM1dnhq2FS/bFH9hrsUv5RLUt
	n31ldh3Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	vikram.garhwal@amd.com,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v1 19/25] hw/xen: Only advertise ring-page-order for xen-block if gnttab supports it
Date: Thu,  2 Mar 2023 15:34:29 +0000
Message-Id: <20230302153435.1170111-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302153435.1170111-1-dwmw2@infradead.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

Whem emulating Xen, multi-page grants are distinctly non-trivial and we
have elected not to support them for the time being. Don't advertise
them to the guest.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/block/xen-block.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 87299615e3..f5a744589d 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -83,7 +83,8 @@ static void xen_block_connect(XenDevice *xendev, Error **errp)
             g_free(ring_ref);
             return;
         }
-    } else if (order <= blockdev->props.max_ring_page_order) {
+    } else if (qemu_xen_gnttab_can_map_multi() &&
+               order <= blockdev->props.max_ring_page_order) {
         unsigned int i;
 
         nr_ring_ref = 1 << order;
@@ -255,8 +256,12 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
     }
 
     xen_device_backend_printf(xendev, "feature-flush-cache", "%u", 1);
-    xen_device_backend_printf(xendev, "max-ring-page-order", "%u",
-                              blockdev->props.max_ring_page_order);
+
+    if (qemu_xen_gnttab_can_map_multi()) {
+        xen_device_backend_printf(xendev, "max-ring-page-order", "%u",
+                                  blockdev->props.max_ring_page_order);
+    }
+
     xen_device_backend_printf(xendev, "info", "%u", blockdev->info);
 
     xen_device_frontend_printf(xendev, "virtual-device", "%lu",
-- 
2.39.0


