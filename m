Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FDC7D5395
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622011.969060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHyq-0002fS-9y; Tue, 24 Oct 2023 14:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622011.969060; Tue, 24 Oct 2023 14:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHyq-0002cG-7F; Tue, 24 Oct 2023 14:02:00 +0000
Received: by outflank-mailman (input) for mailman id 622011;
 Tue, 24 Oct 2023 14:01:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urDo=GG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qvHyo-0002cA-Rm
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:01:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4a4efba-7275-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 16:01:56 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 27A1A4EE0739;
 Tue, 24 Oct 2023 16:01:56 +0200 (CEST)
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
X-Inumbo-ID: e4a4efba-7275-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH] xen/iommu_init: address a violation of MISRA C:2012 Rule 8.3
Date: Tue, 24 Oct 2023 16:01:35 +0200
Message-Id: <cfd803a27efaa529b4e972acc1fa6a8f0e20c9c0.1698155675.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name and emphasize that it is deliberately not used through a
comment followed by the statement '(void) data;'.
This also addresses a violation of MISRA C:2012 Rule 2.7 ("A function should
not contain unused parameters").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/amd/iommu_init.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 9c01a49435..5bfaa6cdd4 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -692,7 +692,7 @@ static void iommu_check_ppr_log(struct amd_iommu *iommu)
     spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
-static void cf_check do_amd_iommu_irq(void *unused)
+static void cf_check do_amd_iommu_irq(void *data)
 {
     struct amd_iommu *iommu;
 
@@ -702,6 +702,11 @@ static void cf_check do_amd_iommu_irq(void *unused)
         return;
     }
 
+    /*
+     * Formal parameter is deliberately unused.
+     */
+    (void) data;
+
     /*
      * No matter from where the interrupt came from, check all the
      * IOMMUs present in the system. This allows for having just one
-- 
2.34.1


