Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0611F0C92
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jun 2020 17:53:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhxac-0006v2-GV; Sun, 07 Jun 2020 15:52:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GD2U=7U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jhxaa-0006ux-KR
 for xen-devel@lists.xenproject.org; Sun, 07 Jun 2020 15:52:00 +0000
X-Inumbo-ID: d27eaef8-a8d6-11ea-9b55-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d27eaef8-a8d6-11ea-9b55-bc764e2007e4;
 Sun, 07 Jun 2020 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uKm3YtRbAQtnN5YWAy5mDd8vgO/GnIYjYwufp/rjpG0=; b=tT2saj54rf/8UmIrX9QatBUWBt
 skZs/VAPmV9rhzo3z2/gtUU0WrTfKYEcOzvKUHdcVmg9msMMi/oUyWkfv4HKOuspNg99jwIM8/4og
 TfaDSd9/pZsAx/bM5q/J5sCBlwSOo11TfNTMVyml0x8fVdz8kDUMDGe4qFD6C8gkqjeg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhxaZ-0000Xq-44; Sun, 07 Jun 2020 15:51:59 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jhxaY-0002SO-Qf; Sun, 07 Jun 2020 15:51:59 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14] xen/arm: mm: Access a PT entry before the table is
 unmapped
Date: Sun,  7 Jun 2020 16:51:54 +0100
Message-Id: <20200607155154.15928-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

xen_pt_next_level() will retrieve the MFN from the entry right after the
page-table has been unmapped.

After calling xen_unmap_table(), there is no guarantee the mapping will
still be valid. Depending on the implementation, this may result to a
data abort in Xen.

Re-order the code to retrieve the MFN before the table is unmapped.

Fixes: 53abb9a1dcd9 ("xen/arm: mm: Rework Xen page-tables walk during update")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I spotted this issue while reworking how page-tables are mapped on Arm64
during early boot. However the problem should be already there on Arm32.

I am actually quite amazed we haven't seen any crash on Arm32 because
there is no direct map. So the mapping will not exist after calling
xen_unmap_table().

I suspect this works because unmap_domain_page() doesn't flush the
TLBs. So the TLB still likely have the entry cached (joy!).

This patch is a candidate for Xen 4.14 and should also be backported.
---
 xen/arch/arm/mm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 1b14f4934570..9e2ff7c8005d 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1036,6 +1036,7 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
 {
     lpae_t *entry;
     int ret;
+    mfn_t mfn;
 
     entry = *table + offset;
 
@@ -1053,8 +1054,10 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
     if ( lpae_is_mapping(*entry, level) )
         return XEN_TABLE_SUPER_PAGE;
 
+    mfn = lpae_get_mfn(*entry);
+
     xen_unmap_table(*table);
-    *table = xen_map_table(lpae_get_mfn(*entry));
+    *table = xen_map_table(mfn);
 
     return XEN_TABLE_NORMAL_PAGE;
 }
-- 
2.17.1


