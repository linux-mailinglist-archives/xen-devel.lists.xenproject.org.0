Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A011735110D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104179.198951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRswl-0006Qs-3T; Thu, 01 Apr 2021 08:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104179.198951; Thu, 01 Apr 2021 08:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRswl-0006QE-09; Thu, 01 Apr 2021 08:44:59 +0000
Received: by outflank-mailman (input) for mailman id 104179;
 Thu, 01 Apr 2021 08:44:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRswi-0006Pc-VZ
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:44:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ede36b3-4053-4dfe-8ccb-620126c57cad;
 Thu, 01 Apr 2021 08:44:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 777A5AE8D;
 Thu,  1 Apr 2021 08:44:55 +0000 (UTC)
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
X-Inumbo-ID: 9ede36b3-4053-4dfe-8ccb-620126c57cad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXGl+Z7RFWWbp6so6Tz4DSduWEpNaC1fGMoL4+RAnfw=;
	b=YFqKBl8t+X/fp14wXCvuISzEcX96Oj9LnuDL2GWTfM3/HrsQUMIjDGkExvaym5vw4XqXoX
	4ubzo1mMMNqI4gqSKFqmZNSyI4D5z7MTk/X3mBXtFZUfXTLc0YBDGnqWl2FjrixmG9td7/
	oF04HydMdM6Y2Fme5BTCtNDRK/IaF2k=
Subject: [PATCH 3/6] VT-d: bring print_qi_regs() in line with
 print_iommu_regs()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Message-ID: <c3401f8c-35b5-17d7-ae14-8c58e43b5cb9@suse.com>
Date: Thu, 1 Apr 2021 10:44:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Shorten the names printed. There's also no need to go through a local
variable.

While at it also constify the function's parameter.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -33,18 +33,11 @@
 
 static int __must_check invalidate_sync(struct vtd_iommu *iommu);
 
-static void print_qi_regs(struct vtd_iommu *iommu)
+static void print_qi_regs(const struct vtd_iommu *iommu)
 {
-    u64 val;
-
-    val = dmar_readq(iommu->reg, DMAR_IQA_REG);
-    printk("DMAR_IQA_REG = %"PRIx64"\n", val);
-
-    val = dmar_readq(iommu->reg, DMAR_IQH_REG);
-    printk("DMAR_IQH_REG = %"PRIx64"\n", val);
-
-    val = dmar_readq(iommu->reg, DMAR_IQT_REG);
-    printk("DMAR_IQT_REG = %"PRIx64"\n", val);
+    printk(" IQA = %"PRIx64"\n", dmar_readq(iommu->reg, DMAR_IQA_REG));
+    printk(" IQH = %"PRIx64"\n", dmar_readq(iommu->reg, DMAR_IQH_REG));
+    printk(" IQT = %"PRIx64"\n", dmar_readq(iommu->reg, DMAR_IQT_REG));
 }
 
 static unsigned int qinval_next_index(struct vtd_iommu *iommu)


