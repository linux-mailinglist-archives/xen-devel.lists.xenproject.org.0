Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D535110B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104175.198928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRswQ-0006H0-HA; Thu, 01 Apr 2021 08:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104175.198928; Thu, 01 Apr 2021 08:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRswQ-0006Gb-CK; Thu, 01 Apr 2021 08:44:38 +0000
Received: by outflank-mailman (input) for mailman id 104175;
 Thu, 01 Apr 2021 08:44:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRswP-0006GT-5t
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:44:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e703b07c-674a-4a5d-8e3e-639abbca8c6f;
 Thu, 01 Apr 2021 08:44:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BED10AE8D;
 Thu,  1 Apr 2021 08:44:35 +0000 (UTC)
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
X-Inumbo-ID: e703b07c-674a-4a5d-8e3e-639abbca8c6f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qi6++u9QBggB8E7CGEoTNUFM2DKPu+n9nR4wGp6C/U=;
	b=RGHEfTZYySo1EMvwvxwxQK9e2SYicqFszHLrDPzRlPxPscjsrTilBG+cu32oDWIgVrNRgj
	rsUB10uiziJIfDY2WELwdwmhKZIh4X6Zcz+sygR227WN06vDZTw6efxHRbT+ARQn9HZfWR
	Xrfptbo+SHJFAOofp2QXx4c+OU8GfQs=
Subject: [PATCH 2/6] VT-d: don't open-code dmar_readl()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Message-ID: <e6cd8e78-81b2-c167-a3ca-5cb374fce7a3@suse.com>
Date: Thu, 1 Apr 2021 10:44:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While at it also drop the unnecessary use of a local variable there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -990,8 +990,7 @@ static void __do_iommu_page_fault(struct
     }
 clear_overflow:
     /* clear primary fault overflow */
-    fault_status = readl(iommu->reg + DMAR_FSTS_REG);
-    if ( fault_status & DMA_FSTS_PFO )
+    if ( dmar_readl(iommu->reg, DMAR_FSTS_REG) & DMA_FSTS_PFO )
     {
         spin_lock_irqsave(&iommu->register_lock, flags);
         dmar_writel(iommu->reg, DMAR_FSTS_REG, DMA_FSTS_PFO);


