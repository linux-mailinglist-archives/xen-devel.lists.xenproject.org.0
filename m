Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E402B355C2F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 21:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106274.203277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrPL-0005Bm-31; Tue, 06 Apr 2021 19:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106274.203277; Tue, 06 Apr 2021 19:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrPK-0005BN-W5; Tue, 06 Apr 2021 19:30:38 +0000
Received: by outflank-mailman (input) for mailman id 106274;
 Tue, 06 Apr 2021 19:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTrPJ-0005BI-Fv
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 19:30:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrPI-0005lS-2f; Tue, 06 Apr 2021 19:30:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrPH-0001Rg-KB; Tue, 06 Apr 2021 19:30:35 +0000
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
	bh=x4BrDhgOv8YmGzD+ftCZACZopXD6GRxTjZmC0jrBQLM=; b=n0wktH0f3NmU0il91SKdTEdpYt
	BYo9yeAFLqHa5Cvz4DGgqHO82fOrAYvRvI8WlfPl1jWTY4MbyqezmgohHRdCVNIxl7x/dMy25qOJN
	lESxgOhYCKRF/EOvWuyk6hDEBqCq7bQhQqLCBQ1DskrPl0/kJKSEPDlRHthhLZp5Dbew=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/page_alloc: Don't hold the heap_lock when clearing PGC_need_scrub
Date: Tue,  6 Apr 2021 20:30:32 +0100
Message-Id: <20210406193032.16976-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Currently, the heap_lock is held when clearing PGC_need_scrub in
alloc_heap_pages(). However, this is unnecessary because the only caller
(mark_page_offline()) that can concurrently modify the count_info is
using cmpxchg() in a loop.

Therefore, rework the code to avoid holding the heap_lock and use
test_and_clear_bit() instead.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/page_alloc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 68e47d963842..70146a00ec8b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1038,16 +1038,12 @@ static struct page_info *alloc_heap_pages(
     {
         for ( i = 0; i < (1U << order); i++ )
         {
-            if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
+            if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
             {
                 if ( !(memflags & MEMF_no_scrub) )
                     scrub_one_page(&pg[i]);
 
                 dirty_cnt++;
-
-                spin_lock(&heap_lock);
-                pg[i].count_info &= ~PGC_need_scrub;
-                spin_unlock(&heap_lock);
             }
             else if ( !(memflags & MEMF_no_scrub) )
                 check_one_page(&pg[i]);
-- 
2.17.1


