Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91DB35110E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:45:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104184.198964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsx3-0006YO-E5; Thu, 01 Apr 2021 08:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104184.198964; Thu, 01 Apr 2021 08:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsx3-0006Xu-9o; Thu, 01 Apr 2021 08:45:17 +0000
Received: by outflank-mailman (input) for mailman id 104184;
 Thu, 01 Apr 2021 08:45:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsx2-0006Xi-Cq
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:45:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0586108-a1c4-4fbc-976c-8edaee73635d;
 Thu, 01 Apr 2021 08:45:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE21BAF28;
 Thu,  1 Apr 2021 08:45:14 +0000 (UTC)
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
X-Inumbo-ID: f0586108-a1c4-4fbc-976c-8edaee73635d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oa+4GqEAwgAdkWZtpOQ4w42vy8M9iwn2JbhahcRbFHk=;
	b=p4bdMQfAUysFNQynw9wXfroabi+6rKY/aIIN+h8kgvJbfnyKUolIWMUHub1Stm3KeUKcQn
	zYBbTrL+x61AgBP/SOdhOY0NZhTcNBYA6CtEUfgt5F8LNTHgez5osoN0kGfcAWSN7CF+S6
	ZLISuj2XfJnjNEY3S3KdqcpJVh0RKN8=
Subject: [PATCH 4/6] VT-d: qinval indexes are only up to 19 bits wide
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Message-ID: <f205b254-9c1c-45fe-48ed-359a7f8d178f@suse.com>
Date: Thu, 1 Apr 2021 10:45:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need for 64-bit accesses to these registers (outside of
initial setup and dumping).

Also remove some stray blanks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -42,14 +42,13 @@ static void print_qi_regs(const struct v
 
 static unsigned int qinval_next_index(struct vtd_iommu *iommu)
 {
-    u64 tail;
+    unsigned int tail = dmar_readl(iommu->reg, DMAR_IQT_REG);
 
-    tail = dmar_readq(iommu->reg, DMAR_IQT_REG);
     tail >>= QINVAL_INDEX_SHIFT;
 
     /* (tail+1 == head) indicates a full queue, wait for HW */
-    while ( ( tail + 1 ) % QINVAL_ENTRY_NR ==
-            ( dmar_readq(iommu->reg, DMAR_IQH_REG) >> QINVAL_INDEX_SHIFT ) )
+    while ( (tail + 1) % QINVAL_ENTRY_NR ==
+            (dmar_readl(iommu->reg, DMAR_IQH_REG) >> QINVAL_INDEX_SHIFT) )
         cpu_relax();
 
     return tail;
@@ -57,12 +56,12 @@ static unsigned int qinval_next_index(st
 
 static void qinval_update_qtail(struct vtd_iommu *iommu, unsigned int index)
 {
-    u64 val;
+    unsigned int val;
 
     /* Need hold register lock when update tail */
     ASSERT( spin_is_locked(&iommu->register_lock) );
     val = (index + 1) % QINVAL_ENTRY_NR;
-    dmar_writeq(iommu->reg, DMAR_IQT_REG, (val << QINVAL_INDEX_SHIFT));
+    dmar_writel(iommu->reg, DMAR_IQT_REG, val << QINVAL_INDEX_SHIFT);
 }
 
 static int __must_check queue_invalidate_context_sync(struct vtd_iommu *iommu,


