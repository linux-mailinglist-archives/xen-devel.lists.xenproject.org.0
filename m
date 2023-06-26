Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D073DBD1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 11:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555387.867164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDity-0002CQ-SN; Mon, 26 Jun 2023 09:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555387.867164; Mon, 26 Jun 2023 09:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDity-0002AW-Nv; Mon, 26 Jun 2023 09:52:54 +0000
Received: by outflank-mailman (input) for mailman id 555387;
 Mon, 26 Jun 2023 09:52:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDFh=CO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qDitv-0000Ov-J4
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 09:52:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36049170-1407-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 11:52:50 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.27.55])
 by support.bugseng.com (Postfix) with ESMTPSA id 6EE0D4EE0742;
 Mon, 26 Jun 2023 11:52:48 +0200 (CEST)
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
X-Inumbo-ID: 36049170-1407-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH v3 6/6] xen/arm: change parameter names in replace_grant_host_mapping().
Date: Mon, 26 Jun 2023 11:52:18 +0200
Message-Id: <2c2b9b3c53e556945baab3dd387bf029e12434b6.1687771796.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687771796.git.federico.serafini@bugseng.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current version of replace_grant_host_mapping() function, the
declaration (correctly) uses the parameter names 'gpaddr' and
'new_gpaddr', while the definition uses the parameter names 'addr' and
'new_addr'.
Change the parameter names of the definition to 'gpaddr' and
'new_gpaddr' so that it is clear what type of address is expected and
violations of MISRA C:2012 Rule 8.3 are fixed.

In both declaration and definition of function
replace_grant_host_mapping() change the parameter name 'mfn' to 'frame',
thus improving readability and keeping consistency with name used in
create_grant_host_mapping().

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/include/asm/grant_table.h |  2 +-
 xen/arch/arm/mm.c                      | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index 265e598e56..f2d115b97d 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -38,7 +38,7 @@ static inline bool gnttab_release_host_mappings(const struct domain *d)
 
 int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
                               unsigned int flags, unsigned int cache_flags);
-int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
+int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
                                unsigned long new_gpaddr, unsigned int flags);
 
 /*
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 2e9860a754..0a3e1f3b64 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1600,17 +1600,17 @@ int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
         return GNTST_okay;
 }
 
-int replace_grant_host_mapping(unsigned long addr, mfn_t mfn,
-                               unsigned long new_addr, unsigned int flags)
+int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
+                               unsigned long new_gpaddr, unsigned int flags)
 {
-    gfn_t gfn = gaddr_to_gfn(addr);
+    gfn_t gfn = gaddr_to_gfn(gpaddr);
     struct domain *d = current->domain;
     int rc;
 
-    if ( new_addr != 0 || (flags & GNTMAP_contains_pte) )
+    if ( new_gpaddr != 0 || (flags & GNTMAP_contains_pte) )
         return GNTST_general_error;
 
-    rc = guest_physmap_remove_page(d, gfn, mfn, 0);
+    rc = guest_physmap_remove_page(d, gfn, frame, 0);
 
     return rc ? GNTST_general_error : GNTST_okay;
 }
-- 
2.34.1


