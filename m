Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8768B5DFC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714272.1115435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TCu-0004t8-VP; Mon, 29 Apr 2024 15:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714272.1115435; Mon, 29 Apr 2024 15:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TCu-0004qj-S6; Mon, 29 Apr 2024 15:46:20 +0000
Received: by outflank-mailman (input) for mailman id 714272;
 Mon, 29 Apr 2024 15:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7+Y=MC=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1s1TCt-0004iz-Jz
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:46:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ebf7aab-063f-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:46:18 +0200 (CEST)
Received: from LAPTOP-EFA9O91E.localdomain
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 07FCA4EE0738;
 Mon, 29 Apr 2024 17:46:17 +0200 (CEST)
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
X-Inumbo-ID: 9ebf7aab-063f-11ef-909b-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [XEN PATCH] xen/mem_access: address violations of MISRA C: 2012 Rule 8.4
Date: Mon, 29 Apr 2024 17:45:41 +0200
Message-Id: <a3d4e07433932624266ac9b675daf0b70734696d.1714405386.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change #ifdef CONFIG_MEM_ACCESS by OR-ing defined(CONFIG_ARM),
allowing asm/mem_access.h to be included in all ARM build configurations.
This is to address the violation of MISRA C: 2012 Rule 8.4 which states:
"A compatible declaration shall be visible when an object or function
with external linkage is defined". Functions p2m_mem_access_check
and p2m_mem_access_check_and_get_page when CONFIG_MEM_ACCESS is not
defined in ARM builds don't have visible declarations in the file
containing their definitions.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/include/xen/mem_access.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 87d93b31f6..ec0630677d 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,7 +33,7 @@
  */
 struct vm_event_st;
 
-#ifdef CONFIG_MEM_ACCESS
+#if defined(CONFIG_MEM_ACCESS) || defined(CONFIG_ARM)
 #include <asm/mem_access.h>
 #endif
 
-- 
2.25.1


