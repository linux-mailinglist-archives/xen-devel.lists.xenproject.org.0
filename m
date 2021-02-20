Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF2320688
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 18:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87299.164412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDWSQ-0007Z6-K3; Sat, 20 Feb 2021 17:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87299.164412; Sat, 20 Feb 2021 17:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDWSQ-0007Yh-Gz; Sat, 20 Feb 2021 17:54:18 +0000
Received: by outflank-mailman (input) for mailman id 87299;
 Sat, 20 Feb 2021 17:54:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lDWSO-0007Yc-VP
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 17:54:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDWSO-0008Bj-Nm; Sat, 20 Feb 2021 17:54:16 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lDWSO-0004eO-Ct; Sat, 20 Feb 2021 17:54:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=RJigxHaZepnMNBSs3OPcIQq+qRZ5q9ZXmLPqClu0lEs=; b=Hfvu0tiQOQjiWWryFJ6AV6vJs3
	ywpi4Eu8T/Nbtp8aqVNwRHDxNhk50HhnEIj2nw2wBCaXh9kuMT3miO2W+WjbNflfXoGwkaAgl0j52
	xWy5NmvSxgdZ1O8vHIuj0iJXnobj/23q+rzJ2H1FEPZsVrOAP/sWROPeltwAf/UxWLJ0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to clean to PoC
Date: Sat, 20 Feb 2021 17:54:13 +0000
Message-Id: <20210220175413.14640-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

At the moment, flush_page_to_ram() is both cleaning and invalidate to
PoC the page. However, the cache line can be speculated and pull in the
cache right after as it is part of the direct map.

So it is pointless to try to invalidate the line in the data cache.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 59f8a3f15fd1..2f11d214e184 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -529,7 +529,7 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     void *v = map_domain_page(_mfn(mfn));
 
-    clean_and_invalidate_dcache_va_range(v, PAGE_SIZE);
+    clean_dcache_va_range(v, PAGE_SIZE);
     unmap_domain_page(v);
 
     /*
-- 
2.17.1


