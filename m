Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B54C1B0D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 19:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277702.474499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwX6-0005dY-8h; Wed, 23 Feb 2022 18:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277702.474499; Wed, 23 Feb 2022 18:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwX6-0005b9-52; Wed, 23 Feb 2022 18:38:36 +0000
Received: by outflank-mailman (input) for mailman id 277702;
 Wed, 23 Feb 2022 18:38:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMwX5-0005b3-6g
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 18:38:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwX4-0007sk-Qe; Wed, 23 Feb 2022 18:38:34 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwX4-00011Z-HL; Wed, 23 Feb 2022 18:38:34 +0000
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
	Subject:Cc:To:From; bh=db7wQhcHM2KaSYp1tp69mT23OXkzBHsFL2ieMLVezOk=; b=spwTFC
	65CC+Z+WizJsZSAGziIK92DnA031XRMW3/SgHYcZFFZrxZ5eNehyrnW/YVxUtxluUP55QSN9BHvdM
	+FXdCxks+hM3jMeQyKzxPQagot0AjOtWsaEIMzPCrGiIgHR4QqzFin5HrVRPBCd/7Tst3YMUqVBP3
	J0DccSyY/C8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/mm: Remove always true ASSERT() in free_heap_pages()
Date: Wed, 23 Feb 2022 18:38:31 +0000
Message-Id: <20220223183831.5951-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

free_heap_pages() has an ASSERT() checking that node is >= 0. However
node is defined as an unsigned int. So it cannot be negative.

Therefore remove the check as it will always be true.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I have looked at the history. AFAICT, node has always be defined
as unsigned int. So the ASSERT() may have never been useful (?).
---
 xen/common/page_alloc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 46357182375a..e971bf91e0be 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1441,7 +1441,6 @@ static void free_heap_pages(
     unsigned int zone = page_to_zone(pg);
 
     ASSERT(order <= MAX_ORDER);
-    ASSERT(node >= 0);
 
     spin_lock(&heap_lock);
 
-- 
2.32.0


