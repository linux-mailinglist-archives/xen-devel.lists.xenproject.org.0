Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371364EAD8
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464432.722875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DA-000542-54; Fri, 16 Dec 2022 11:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464432.722875; Fri, 16 Dec 2022 11:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69D9-0004tC-VW; Fri, 16 Dec 2022 11:49:07 +0000
Received: by outflank-mailman (input) for mailman id 464432;
 Fri, 16 Dec 2022 11:49:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D8-0004b9-7Y
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D8-0002ET-5Z; Fri, 16 Dec 2022 11:49:06 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D7-0004sN-US; Fri, 16 Dec 2022 11:49:06 +0000
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
	bh=FDnn4j9oos7o0Yst//etF30Yzyr3SCCSdb3Qh8o9mlo=; b=fHd51aNXlHLmKnuzS89FCVrVMv
	6yxymS4djo7spaS62B+LYP5kO4zqErtz5FVtozvvW0CftDT7ElgEMFpbhc3CRx2lNd74u823ed3Y0
	2ygOzpZZ9Hbci4Q7zxwpwOG4K/JG5ibUf88FCbaP7uRZ5jBeVRf2nw8X3shrWO8zo+Mk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
Date: Fri, 16 Dec 2022 11:48:37 +0000
Message-Id: <20221216114853.8227-7-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyxia@amazon.com>

Before, it assumed the pv cr3 could be accessed via a direct map. This
is no longer true.

Note that we do not map and unmap root_pgt for now since it is still a
xenheap page.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Changes since Hongyan's version:
        * Remove the final dot in the commit title
---
 xen/arch/x86/x86_64/entry.S | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ae012851819a..b72abf923d9c 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -165,7 +165,24 @@ restore_all_guest:
         and   %rsi, %rdi
         and   %r9, %rsi
         add   %rcx, %rdi
-        add   %rcx, %rsi
+
+         /*
+          * Without a direct map, we have to map first before copying. We only
+          * need to map the guest root table but not the per-CPU root_pgt,
+          * because the latter is still a xenheap page.
+          */
+        pushq %r9
+        pushq %rdx
+        pushq %rax
+        pushq %rdi
+        mov   %rsi, %rdi
+        shr   $PAGE_SHIFT, %rdi
+        callq map_domain_page
+        mov   %rax, %rsi
+        popq  %rdi
+        /* Stash the pointer for unmapping later. */
+        pushq %rax
+
         mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
         mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
         mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
@@ -177,6 +194,14 @@ restore_all_guest:
         sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
                 ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
         rep movsq
+
+        /* Unmap the page. */
+        popq  %rdi
+        callq unmap_domain_page
+        popq  %rax
+        popq  %rdx
+        popq  %r9
+
 .Lrag_copy_done:
         mov   %r9, STACK_CPUINFO_FIELD(xen_cr3)(%rdx)
         movb  $1, STACK_CPUINFO_FIELD(use_pv_cr3)(%rdx)
-- 
2.38.1


