Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005C23402FA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 11:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98874.187835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpfE-0007TC-Qu; Thu, 18 Mar 2021 10:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98874.187835; Thu, 18 Mar 2021 10:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMpfE-0007Sp-Nm; Thu, 18 Mar 2021 10:14:00 +0000
Received: by outflank-mailman (input) for mailman id 98874;
 Thu, 18 Mar 2021 10:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYlD=IQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMpfD-0007Sh-BF
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 10:13:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff9bc1d-c2c1-4203-9268-4c90312ff026;
 Thu, 18 Mar 2021 10:13:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9C21AC1E;
 Thu, 18 Mar 2021 10:13:57 +0000 (UTC)
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
X-Inumbo-ID: eff9bc1d-c2c1-4203-9268-4c90312ff026
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616062437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jqnxm854ZkzHnoc/cGVME3wbWF5nHrJSeLOnsd7AR3U=;
	b=Hmwoh+M3z8oP9tjzgCwN6Ee6cUFd/1Hxa1TOQ2G5QPHB7x0Zk9NhupoD9q2ORtUjr4WgsS
	Q5BuVPoi6bdoOY/Wt2Nk5E5YBXZOPKwlzjKpNupRaCcVAh7c01gLTyEJqxOrWo1bU6WjZZ
	cRsEfLoel7NpPiL+bstBi/6LipUFxoI=
Subject: [PATCH 2/4][4.15?] VT-d: leave FECTL write to vtd_resume()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Message-ID: <57976bd9-6c50-26c3-1f06-62f1a5546e06@suse.com>
Date: Thu, 18 Mar 2021 11:13:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We shouldn't blindly unmask the interrupt when resuming. vtd_resume()
will restore the intended state.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2092,7 +2092,7 @@ static int adjust_vtd_irq_affinities(voi
 }
 __initcall(adjust_vtd_irq_affinities);
 
-static int __must_check init_vtd_hw(void)
+static int __must_check init_vtd_hw(bool resume)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
@@ -2121,6 +2121,10 @@ static int __must_check init_vtd_hw(void
             disable_qinval(iommu);
         }
 
+        if ( resume )
+            /* FECTL write done by vtd_resume(). */
+            continue;
+
         spin_lock_irqsave(&iommu->register_lock, flags);
         sts = dmar_readl(iommu->reg, DMAR_FECTL_REG);
         sts &= ~DMA_FECTL_IM;
@@ -2320,7 +2324,7 @@ static int __init vtd_setup(void)
     P(iommu_hap_pt_share, "Shared EPT tables");
 #undef P
 
-    ret = init_vtd_hw();
+    ret = init_vtd_hw(false);
     if ( ret )
         goto error;
 
@@ -2590,7 +2594,7 @@ static void vtd_resume(void)
     if ( !iommu_enabled )
         return;
 
-    if ( init_vtd_hw() != 0  && force_iommu )
+    if ( init_vtd_hw(true) != 0 && force_iommu )
          panic("IOMMU setup failed, crash Xen for security purpose\n");
 
     for_each_drhd_unit ( drhd )


