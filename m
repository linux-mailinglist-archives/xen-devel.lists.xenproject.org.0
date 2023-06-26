Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEE73DBCE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 11:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555384.867134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDits-0001G3-Va; Mon, 26 Jun 2023 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555384.867134; Mon, 26 Jun 2023 09:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDits-0001Cy-SQ; Mon, 26 Jun 2023 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 555384;
 Mon, 26 Jun 2023 09:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDFh=CO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qDitq-0000Ov-M8
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 09:52:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 331ca6ce-1407-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 11:52:45 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.27.55])
 by support.bugseng.com (Postfix) with ESMTPSA id 501624EE0741;
 Mon, 26 Jun 2023 11:52:43 +0200 (CEST)
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
X-Inumbo-ID: 331ca6ce-1407-11ee-8611-37d641c3527e
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
Subject: [XEN PATCH v3 3/6] xen/arm: change parameter name 'pa' in ioremap_addr() definition.
Date: Mon, 26 Jun 2023 11:52:15 +0200
Message-Id: <74fdc69fd08d1a0e35d4f226ea0c47a6f6a3a241.1687771796.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687771796.git.federico.serafini@bugseng.com>
References: <cover.1687771796.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current version of ioremap_addr() function, the declaration
uses the parameter name 'start' (consistenly with the other ioremap_*
function declarations), while the definition uses the parameter name
'pa'.
Change the parameter name 'pa' of function definition to 'start', thus
fixing a violation of MISRA C:2012 Rule 8.3 and keeping the consistency
with other ioremap_* functions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/mm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index e460249736..2e9860a754 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -736,10 +736,10 @@ void *__init arch_vmap_virt_end(void)
  * This function should only be used to remap device address ranges
  * TODO: add a check to verify this assumption
  */
-void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
+void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
 {
-    mfn_t mfn = _mfn(PFN_DOWN(pa));
-    unsigned int offs = pa & (PAGE_SIZE - 1);
+    mfn_t mfn = _mfn(PFN_DOWN(start));
+    unsigned int offs = start & (PAGE_SIZE - 1);
     unsigned int nr = PFN_UP(offs + len);
     void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
 
@@ -1579,7 +1579,7 @@ void put_page_type(struct page_info *page)
     return;
 }
 
-int create_grant_host_mapping(unsigned long addr, mfn_t frame,
+int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
                               unsigned int flags, unsigned int cache_flags)
 {
     int rc;
@@ -1591,7 +1591,7 @@ int create_grant_host_mapping(unsigned long addr, mfn_t frame,
     if ( flags & GNTMAP_readonly )
         t = p2m_grant_map_ro;
 
-    rc = guest_physmap_add_entry(current->domain, gaddr_to_gfn(addr),
+    rc = guest_physmap_add_entry(current->domain, gaddr_to_gfn(gpaddr),
                                  frame, 0, t);
 
     if ( rc )
-- 
2.34.1


