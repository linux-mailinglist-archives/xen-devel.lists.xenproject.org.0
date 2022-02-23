Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4037C4C1B12
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 19:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277709.474510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwZe-00070g-NT; Wed, 23 Feb 2022 18:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277709.474510; Wed, 23 Feb 2022 18:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwZe-0006xo-KI; Wed, 23 Feb 2022 18:41:14 +0000
Received: by outflank-mailman (input) for mailman id 277709;
 Wed, 23 Feb 2022 18:41:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMwZd-0006xi-P5
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 18:41:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwZd-0007ws-IE; Wed, 23 Feb 2022 18:41:13 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwZd-0001AZ-A0; Wed, 23 Feb 2022 18:41:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=gZuPgiqxjVfP/Y7/jxgEUCCMKOsAyvpkD31FqQ8FjqY=; b=A6rgHd
	bgozl/Q+QTO+Qdv5ULWSn4GQSesSUxGCc07L8ClPm5WD/WmnBitB52UhZokGC2vxq5MuuMWqj88z9
	/j958oQYcw2xBZaF3J5u8tbcGRy9bNykbTPLj86avjTDO/jI6RH4HLVQACV4BPqPqsz0U4BxCgZTf
	WD5P16IigGA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/mm: pg_offlined can be defined as bool in free_heap_pages()
Date: Wed, 23 Feb 2022 18:41:10 +0000
Message-Id: <20220223184110.7941-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The local variable pg_offlined in free_heap_pages() can only take two
values. So switch it to a bool.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/page_alloc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e971bf91e0be..72e6cac2365d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1437,8 +1437,9 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_offlined = 0;
+    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn));
     unsigned int zone = page_to_zone(pg);
+    bool pg_offlined = true;
 
     ASSERT(order <= MAX_ORDER);
 
@@ -1447,7 +1448,7 @@ static void free_heap_pages(
     for ( i = 0; i < (1 << order); i++ )
     {
         if ( mark_page_free(&pg[i], mfn_add(mfn, i)) )
-            pg_offlined = 1;
+            pg_offlined = true;
 
         if ( need_scrub )
         {
-- 
2.32.0


