Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B3D4775C6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 16:22:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248043.427800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsaf-0007lK-5r; Thu, 16 Dec 2021 15:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248043.427800; Thu, 16 Dec 2021 15:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxsaf-0007jE-2r; Thu, 16 Dec 2021 15:22:41 +0000
Received: by outflank-mailman (input) for mailman id 248043;
 Thu, 16 Dec 2021 15:22:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxsad-0007j8-R6
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 15:22:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxsad-0001f3-MG; Thu, 16 Dec 2021 15:22:39 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxsad-0002un-Dr; Thu, 16 Dec 2021 15:22:39 +0000
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
	Subject:Cc:To:From; bh=JJmEh3TREYUIxqaWvyym6nwfJKMOMaOfV5meepyUfKU=; b=4GzHnI
	htSodtFul/w7NZFYQK4tSDWZzKn5wxiruV+gi1JMCf8baDB/Yo58a9H7c/CzeMTT9jLEvsSlyK7nR
	NtbZTfGaCBYo96FeezhAJR5p4yf0rrEF9jowrc5LUXCDBAM9NxsbN+j6OtGs2EQ5M0agKPPhDjsrK
	QSqSfcbJHx8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: arch_mfn_in_directmap: Reconciliate the name and the implementation
Date: Thu, 16 Dec 2021 15:22:20 +0000
Message-Id: <20211216152220.3317-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The name of arch_mfn_in_directmap() suggests that it will check against
that the passed MFN should be in the directmap.

However, the current callers are passing the next MFN and the
implementation will return true for up to one MFN past the directmap.

It would be more meaningful to test the exact MFN rather than the
next one. So rework the implementation and the caller to match the
name.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Looking at the history, it looks like the check in init_node_heap()
was <= and it was simply moved to a new helper without any adjustment
as part of c6fdc9696a "boot allocator: use arch helper for virt_to_mfn
on DIRECTMAP_VIRT region".
---
 xen/arch/x86/include/asm/mm.h | 2 +-
 xen/common/page_alloc.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 5dbcee869624..a38e13e3c11e 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -641,7 +641,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
 {
     unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
 
-    return mfn <= (virt_to_mfn(eva - 1) + 1);
+    return mfn < (virt_to_mfn(eva - 1) + 1);
 }
 
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 38eea879c04a..d4789f81cd31 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -588,7 +588,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
         needed = 0;
     }
     else if ( *use_tail && nr >= needed &&
-              arch_mfn_in_directmap(mfn + nr) &&
+              arch_mfn_in_directmap(mfn + nr - 1) &&
               (!xenheap_bits ||
                !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
@@ -597,7 +597,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
                       PAGE_SIZE - sizeof(**avail) * NR_ZONES;
     }
     else if ( nr >= needed &&
-              arch_mfn_in_directmap(mfn + needed) &&
+              arch_mfn_in_directmap(mfn + needed - 1) &&
               (!xenheap_bits ||
                !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-- 
2.32.0


