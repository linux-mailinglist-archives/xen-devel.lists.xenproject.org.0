Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CBE4C1B71
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 20:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277755.474575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMx09-000434-BV; Wed, 23 Feb 2022 19:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277755.474575; Wed, 23 Feb 2022 19:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMx09-000411-8Y; Wed, 23 Feb 2022 19:08:37 +0000
Received: by outflank-mailman (input) for mailman id 277755;
 Wed, 23 Feb 2022 19:08:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMx07-00040v-NW
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 19:08:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMx07-0008S9-ML; Wed, 23 Feb 2022 19:08:35 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMx07-0002xC-DE; Wed, 23 Feb 2022 19:08:35 +0000
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
	Subject:Cc:To:From; bh=ms66EeFpnDlrLxveB85xTVbo3f8VYA2lVaSo3C96Zkc=; b=af0ZqY
	zr4NI5IHb3MKBxe8s6LSrQ1XyhnsTgXN/Uff88qARXBwTkw49ILRlVC9Q8JuK9mX/OhMl3NPSQTA8
	b62TTssQZV5S8o0+XaJapUjaH3W9Tq6/DS/pLdmCeMHn1jpgh/YoeSMMDGsw3J0+manMydS+GLirZ
	yUj6F1hDNg8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2] xen/mm: pg_offlined can be defined as bool in free_heap_pages()
Date: Wed, 23 Feb 2022 19:08:33 +0000
Message-Id: <20220223190833.24710-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The local variable pg_offlined in free_heap_pages() can only take two
values. So switch it to a bool.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - pg_offlined should be initialized to false rather than true
---
 xen/common/page_alloc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e971bf91e0be..319029140f30 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1437,8 +1437,9 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_offlined = 0;
+    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn));
     unsigned int zone = page_to_zone(pg);
+    bool pg_offlined = false;
 
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


