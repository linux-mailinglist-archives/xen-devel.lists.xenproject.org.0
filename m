Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC95304C8
	for <lists+xen-devel@lfdr.de>; Sun, 22 May 2022 18:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335180.559320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsov7-0001Cq-IR; Sun, 22 May 2022 16:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335180.559320; Sun, 22 May 2022 16:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nsov7-0001Ad-EM; Sun, 22 May 2022 16:59:09 +0000
Received: by outflank-mailman (input) for mailman id 335180;
 Sun, 22 May 2022 16:59:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nsov5-0001AX-KI
 for xen-devel@lists.xenproject.org; Sun, 22 May 2022 16:59:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nsov5-0003kU-HT; Sun, 22 May 2022 16:59:07 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nsov5-0007oz-8o; Sun, 22 May 2022 16:59:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=2OHKG4CNbHIABlE0qBztVW9rVs14MrnSgfvgveIJfz4=; b=vn91Za
	+LRukmHabTBmMjPQTvan6t9BHUGjRiGadxUAfoO26ziG8Za1t9s6jaQHArGatwZ3tk8cIBW8Iy2nE
	6/WFiqXKRkEt8t9I4OWgjKcWmLuNK/GlQkzmUy/iNjuzU1cOH12p0JdlEcCA4PCWYVB1Cok/Bu6Fy
	Yxv+Pc/TTNI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/iommu: dt: Check the return value of xsm_deassign_dtdevice()
Date: Sun, 22 May 2022 17:59:00 +0100
Message-Id: <20220522165900.83104-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

xsm_deasign_dtdevice() will indicate whether the caller is allowed
to issue the operation. So the return value has to be checked.

Spotted by clang static analyzer.

Fixes: fe36cccc483c ("xen/passthrough: Extend XEN_DOMCTL_*assign_device to support DT device")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Platform device-passthrough is not security supported. Hence why this is
sent directly to xen-devel.
---
 xen/drivers/passthrough/device_tree.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 98f2aa0dad68..1c32d7b50cce 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -269,6 +269,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
             break;
 
         ret = xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
+        if ( ret )
+            break;
 
         if ( d == dom_io )
             return -EINVAL;
-- 
2.32.0


