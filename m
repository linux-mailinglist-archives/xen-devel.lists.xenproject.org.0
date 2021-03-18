Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607443402FB
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 11:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98877.187848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpfo-0007a4-4E; Thu, 18 Mar 2021 10:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98877.187848; Thu, 18 Mar 2021 10:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpfo-0007Zf-0z; Thu, 18 Mar 2021 10:14:36 +0000
Received: by outflank-mailman (input) for mailman id 98877;
 Thu, 18 Mar 2021 10:14:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMpfm-0007ZU-DJ
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 10:14:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f42204a6-c052-46cf-8a96-b10a1d5f3c30;
 Thu, 18 Mar 2021 10:14:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF035AD20;
 Thu, 18 Mar 2021 10:14:32 +0000 (UTC)
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
X-Inumbo-ID: f42204a6-c052-46cf-8a96-b10a1d5f3c30
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616062473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GPmVawULsDWDzc2AL6YzBoU9qI4rbrFjxnykvjGJcYI=;
	b=NEmSx4pvrG7l2F8X//6YOPn/o3iD96gvZjEg5yY6K9Fd+Tn+SZVl5rM3AqYLayF2+8nED1
	ceIr53Mww7wBfDWSkuGjG5YlEGbjrEnHd+2zeIGp93U23cLvK31APitU3tVxDqsugiJvg2
	hg/+EqIJGRdaiJ5/qYjVgvyQR5u5SSI=
Subject: [PATCH 3/4][4.15?] VT-d: re-order register restoring in vtd_resume()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Message-ID: <04332d46-a595-3f42-71f8-a933048982ab@suse.com>
Date: Thu, 18 Mar 2021 11:14:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

For one FECTL must be written last - the interrupt shouldn't be unmasked
without first having written the data and address needed to actually
deliver it. In the common case (when dma_msi_set_affinity() doesn't end
up bailing early) this happens from init_vtd_hw(), but for this to
actually have the intended effect we shouldn't subsequently overwrite
what was written there - this is only benign when old and new settings
match. Instead we should restore the registers ahead of calling
init_vtd_hw(), just for the unlikely case of dma_msi_set_affinity()
bailing early.

In the moved code drop some stray casts as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2594,6 +2594,21 @@ static void vtd_resume(void)
     if ( !iommu_enabled )
         return;
 
+    for_each_drhd_unit ( drhd )
+    {
+        iommu = drhd->iommu;
+        i = iommu->index;
+
+        spin_lock_irqsave(&iommu->register_lock, flags);
+        dmar_writel(iommu->reg, DMAR_FEDATA_REG,
+                    iommu_state[i][DMAR_FEDATA_REG]);
+        dmar_writel(iommu->reg, DMAR_FEADDR_REG,
+                    iommu_state[i][DMAR_FEADDR_REG]);
+        dmar_writel(iommu->reg, DMAR_FEUADDR_REG,
+                    iommu_state[i][DMAR_FEUADDR_REG]);
+        spin_unlock_irqrestore(&iommu->register_lock, flags);
+    }
+
     if ( init_vtd_hw(true) != 0 && force_iommu )
          panic("IOMMU setup failed, crash Xen for security purpose\n");
 
@@ -2605,12 +2620,6 @@ static void vtd_resume(void)
         spin_lock_irqsave(&iommu->register_lock, flags);
         dmar_writel(iommu->reg, DMAR_FECTL_REG,
                     (u32) iommu_state[i][DMAR_FECTL_REG]);
-        dmar_writel(iommu->reg, DMAR_FEDATA_REG,
-                    (u32) iommu_state[i][DMAR_FEDATA_REG]);
-        dmar_writel(iommu->reg, DMAR_FEADDR_REG,
-                    (u32) iommu_state[i][DMAR_FEADDR_REG]);
-        dmar_writel(iommu->reg, DMAR_FEUADDR_REG,
-                    (u32) iommu_state[i][DMAR_FEUADDR_REG]);
         spin_unlock_irqrestore(&iommu->register_lock, flags);
 
         iommu_enable_translation(drhd);


