Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5717819D91
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657635.1026655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMH-0005yo-38; Wed, 20 Dec 2023 11:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657635.1026655; Wed, 20 Dec 2023 11:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMH-0005uq-06; Wed, 20 Dec 2023 11:03:25 +0000
Received: by outflank-mailman (input) for mailman id 657635;
 Wed, 20 Dec 2023 11:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFuMF-0004rG-1F
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:03:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63ddd643-9f27-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:03:22 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.218.228])
 by support.bugseng.com (Postfix) with ESMTPSA id DD4674EE0C9C;
 Wed, 20 Dec 2023 12:03:20 +0100 (CET)
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
X-Inumbo-ID: 63ddd643-9f27-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 4/7] xen/arm: mem_access: address violations of MISRA C:2012 Rule 16.3
Date: Wed, 20 Dec 2023 12:03:04 +0100
Message-Id: <d7a015aaa54fb4722d4970f0f40789efe4d994f9.1703066935.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703066935.git.federico.serafini@bugseng.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor of the code to have a break statement at the end of the
switch-clause. This addresses violations of Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause").
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/mem_access.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
index 31db846354..fbcb5471f7 100644
--- a/xen/arch/arm/mem_access.c
+++ b/xen/arch/arm/mem_access.c
@@ -168,10 +168,10 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
          * If this was a read then it was because of mem_access, but if it was
          * a write then the original get_page_from_gva fault was correct.
          */
-        if ( flag == GV2M_READ )
-            break;
-        else
+        if ( flag != GV2M_READ )
             goto err;
+
+        break;
     case XENMEM_access_rx2rw:
     case XENMEM_access_rx:
     case XENMEM_access_r:
@@ -179,10 +179,10 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
          * If this was a write then it was because of mem_access, but if it was
          * a read then the original get_page_from_gva fault was correct.
          */
-        if ( flag == GV2M_WRITE )
-            break;
-        else
+        if ( flag != GV2M_WRITE )
             goto err;
+
+        break;
     }
 
     /*
-- 
2.34.1


