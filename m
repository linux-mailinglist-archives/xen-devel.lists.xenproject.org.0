Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E680B12A78
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 14:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059280.1426380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufdz2-0005NJ-7s; Sat, 26 Jul 2025 12:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059280.1426380; Sat, 26 Jul 2025 12:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufdz2-0005Kx-4q; Sat, 26 Jul 2025 12:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1059280;
 Sat, 26 Jul 2025 12:26:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ufdz0-0005Kr-Nw
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 12:26:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufdz0-002IjE-0i;
 Sat, 26 Jul 2025 12:26:34 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufdyz-00CgtV-2h;
 Sat, 26 Jul 2025 12:26:34 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=QW/0in0rumyjgLuN3TDJ8pQ2bHfalq3y0x45zgyP5OM=; b=EPkLJd
	/q73HoXAtmKrJlmyd6ZOOoDGH6WFXMF7bnID4Yj4flfBLxB3Ildmawyi2z2FwGguNLVKqhaw9qYtr
	ZX7td/Uey5pDkwRKgSa3p81Y5wld0Kk9zhzdhPWuXDPozn7MbcwfPo+keI+bB6OlbHxaaN/htU883
	uJ3zYYOWDi0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] P2M: Don't try to free the existing PTE if we can't allocate a new table
Date: Sat, 26 Jul 2025 13:26:07 +0100
Message-ID: <20250726122607.75950-1-julien@xen.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

When we can't split a superpage (on Arm p2m_split_superpage() returns false,
on x86 ept_split_superpage() returns 0), the caller is expected to clean
any PTE that may have been allocated. However, when we can't allocate
the page-tables 'entry' (arm) / 'ept_entry' still points to a live PTE.
So we will end up to free a PTE that is still used.

In practice for:
  * x86: We don't do any refcounting for 2MB/1GB mappings. So this is
    harmless
  * arm: We do refcounting for 2MB mapping (not for 1GB ones). This is
    only used for static memory.

So there is a security issue on Arm but this doesn't meet the criteria
for an XSA (static memory is not security supported).

Solve the issue by clearing the PTE if we can't allocate the table.

Reported-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

I decided to not split the patch in two as the issue for x86 and
arm is the same. But I am happy to split if this is preferred.
---
 xen/arch/arm/mmu/p2m.c    | 8 ++++++++
 xen/arch/x86/mm/p2m-ept.c | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504fcf..9a1fb44a0204 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -888,7 +888,15 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, lpae_t *entry,
 
     page = p2m_alloc_page(p2m->domain);
     if ( !page )
+    {
+        /*
+         * The caller is in charge to free the sub-tree. So tell the
+         * As we didn't manage to allocate anything, just tell the
+         * caller there is nothing to free by invalidating the PTE.
+         */
+        memset(entry, 0, sizeof(*entry));
         return false;
+    }
 
     page_list_add(page, &p2m->pages);
     table = __map_domain_page(page);
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 62fc8e50689f..1efac27835d2 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -261,7 +261,16 @@ static bool ept_split_super_page(
 
     table = ept_set_middle_entry(p2m, &new_ept);
     if ( !table )
+    {
+        /*
+         * The caller is in charge to free the sub-tree. So tell the
+         * As we didn't manage to allocate anything, just tell the
+         * caller there is nothing to free by invalidating the PTE.
+         */
+        memset(ept_entry, 0, sizeof(*ept_entry));
+
         return 0;
+    }
 
     trunk = 1UL << ((level - 1) * EPT_TABLE_ORDER);
 
-- 
2.47.3


