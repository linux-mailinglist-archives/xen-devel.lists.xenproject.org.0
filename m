Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD43B80F135
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653193.1019560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pg-0000rh-5H; Tue, 12 Dec 2023 15:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653193.1019560; Tue, 12 Dec 2023 15:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4pf-0000i1-VR; Tue, 12 Dec 2023 15:38:03 +0000
Received: by outflank-mailman (input) for mailman id 653193;
 Tue, 12 Dec 2023 15:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0UEi=HX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rD4pe-0000ZM-4R
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:38:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ecebe66-9904-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 16:38:01 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-60-45-193.retail.telecomitalia.it [82.60.45.193])
 by support.bugseng.com (Postfix) with ESMTPSA id DD1994EE0C96;
 Tue, 12 Dec 2023 16:38:00 +0100 (CET)
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
X-Inumbo-ID: 6ecebe66-9904-11ee-98e8-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 4/4] xen/iommu: address leftover violation of MISRA C:2012 Rule 8.2
Date: Tue, 12 Dec 2023 16:37:42 +0100
Message-Id: <443dc3828fd6cdfb97d2e9d0c9ec93bb23228d5b.1702394721.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702394721.git.federico.serafini@bugseng.com>
References: <cover.1702394721.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/iommu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 69d572543c..f53d045e2c 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -296,7 +296,7 @@ struct iommu_ops {
                                  uint64_t rte);
     unsigned int (*read_apic_from_ire)(unsigned int apic, unsigned int reg);
 
-    int (*setup_hpet_msi)(struct msi_desc *);
+    int (*setup_hpet_msi)(struct msi_desc *msi_desc);
 
     void (*adjust_irq_affinities)(void);
     void (*clear_root_pgtable)(struct domain *d);
-- 
2.34.1


