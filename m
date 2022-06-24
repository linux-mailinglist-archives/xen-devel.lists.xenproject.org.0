Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3894559624
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355324.582949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM3-00049s-G7; Fri, 24 Jun 2022 09:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355324.582949; Fri, 24 Jun 2022 09:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM3-00046B-At; Fri, 24 Jun 2022 09:11:55 +0000
Received: by outflank-mailman (input) for mailman id 355324;
 Fri, 24 Jun 2022 09:11:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4fM2-0003rG-5P
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:11:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fM2-0001zq-0K; Fri, 24 Jun 2022 09:11:54 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fM1-0005kh-Oj; Fri, 24 Jun 2022 09:11:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=cV3cR00UhtGpPQyq5h3uQP1B9sqMJ894didgXHGUxvQ=; b=mai6zIA1l1ESqFE4rwtevFJLVC
	xmfpQdhD6w5EfM2TB8RsVBVTMqd1cd+ZXCzLEPRu5YFDoBY8Yb+39gFFY6ZJHYq+69gs9N1SjA7/q
	Uln3uPJTY9i9nKVpvFwBRuO0SProqo1UVLCGzRaoTUtzS2iBP7pSyLKs9ge3H/Hvsvpw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/7] xen/arm: mm: Add more ASSERT() in {destroy, modify}_xen_mappings()
Date: Fri, 24 Jun 2022 10:11:43 +0100
Message-Id: <20220624091146.35716-5-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220624091146.35716-1-julien@xen.org>
References: <20220624091146.35716-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Both destroy_xen_mappings() and modify_xen_mappings() will take in
parameter a range [start, end[. Both end should be page aligned.

Add extra ASSERT() to ensure start and end are page aligned. Take the
opportunity to rename 'v' to 's' to be consistent with the other helper.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0607c65f95cd..20733afebce4 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1371,14 +1371,18 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
     return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
 }
 
-int destroy_xen_mappings(unsigned long v, unsigned long e)
+int destroy_xen_mappings(unsigned long s, unsigned long e)
 {
-    ASSERT(v <= e);
-    return xen_pt_update(v, INVALID_MFN, (e - v) >> PAGE_SHIFT, 0);
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s <= e);
+    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
 }
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
 {
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s <= e);
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
 }
-- 
2.32.0


