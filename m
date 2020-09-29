Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC927BD52
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 08:48:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN9QV-0006wN-1V; Tue, 29 Sep 2020 06:47:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yHZB=DG=huawei.com=yanaijie@srs-us1.protection.inumbo.net>)
 id 1kN9QT-0006wI-HW
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 06:47:49 +0000
X-Inumbo-ID: 093f2dc9-556a-491a-acf9-94b34892d329
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 093f2dc9-556a-491a-acf9-94b34892d329;
 Tue, 29 Sep 2020 06:47:40 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CE388C25261604B34474;
 Tue, 29 Sep 2020 14:47:37 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 29 Sep 2020
 14:47:28 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>, 
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
 <hpa@zytor.com>, <xen-devel@lists.xenproject.org>
CC: Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] x86/xen: only unlock when USE_SPLIT_PTE_PTLOCKS is true
Date: Tue, 29 Sep 2020 14:48:28 +0800
Message-ID: <20200929064828.3606720-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When USE_SPLIT_PTE_PTLOCKS is false, xen_pte_lock() actually do nothing
but returns NULL. So xen_pte_unlock() should not actually unlock.
Otherwise a NULL pointer dereference will be triggered.

Fixes: 74260714c56d ("xen: lock pte pages while pinning/unpinning")
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/x86/xen/mmu_pv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index eda78144c000..c70cbdf5c0fa 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -656,8 +656,10 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
 
 static void xen_pte_unlock(void *v)
 {
+#if USE_SPLIT_PTE_PTLOCKS
 	spinlock_t *ptl = v;
 	spin_unlock(ptl);
+#endif
 }
 
 static void xen_do_pin(unsigned level, unsigned long pfn)
-- 
2.25.4


