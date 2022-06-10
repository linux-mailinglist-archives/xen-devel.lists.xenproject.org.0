Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C109F545F39
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345959.571699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza62-0001se-3t; Fri, 10 Jun 2022 08:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345959.571699; Fri, 10 Jun 2022 08:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza62-0001ps-01; Fri, 10 Jun 2022 08:34:22 +0000
Received: by outflank-mailman (input) for mailman id 345959;
 Fri, 10 Jun 2022 08:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j0Q=WR=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nza60-0001Ib-5o
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:34:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1ed5fd43-e898-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 10:34:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD28115BF;
 Fri, 10 Jun 2022 01:34:18 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.4.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95D1D3F73B;
 Fri, 10 Jun 2022 01:34:17 -0700 (PDT)
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
X-Inumbo-ID: 1ed5fd43-e898-11ec-bd2c-47488cf2e6aa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen/arm: gicv2: Rename gicv2_map_hwdown_extra_mappings
Date: Fri, 10 Jun 2022 10:33:57 +0200
Message-Id: <20220610083358.101412-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610083358.101412-1-michal.orzel@arm.com>
References: <20220610083358.101412-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... to gicv2_map_hwdom_extra_mappings as the former clearly contains
a typo.

Fixes: 86b93e00c0b6 ("xen/arm: gicv2: Export GICv2m register frames to Dom0 by device tree")
Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/gic-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 2cc2f6bc18..bd773bcc67 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -679,7 +679,7 @@ static void gicv2_irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_m
     spin_unlock(&gicv2.lock);
 }
 
-static int gicv2_map_hwdown_extra_mappings(struct domain *d)
+static int gicv2_map_hwdom_extra_mappings(struct domain *d)
 {
     const struct v2m_data *v2m_data;
 
@@ -1352,7 +1352,7 @@ const static struct gic_hw_operations gicv2_ops = {
     .make_hwdom_madt     = gicv2_make_hwdom_madt,
     .get_hwdom_extra_madt_size = gicv2_get_hwdom_extra_madt_size,
 #endif
-    .map_hwdom_extra_mappings = gicv2_map_hwdown_extra_mappings,
+    .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
 };
-- 
2.25.1


