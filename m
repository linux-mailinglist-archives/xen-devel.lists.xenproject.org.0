Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F288AEA4F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710790.1110261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpV-0005T0-Oe; Tue, 23 Apr 2024 15:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710790.1110261; Tue, 23 Apr 2024 15:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpV-0005Ql-LY; Tue, 23 Apr 2024 15:13:09 +0000
Received: by outflank-mailman (input) for mailman id 710790;
 Tue, 23 Apr 2024 15:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpT-0004ry-VY
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd4867f2-0183-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:13:07 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 8ED0A4EE0742;
 Tue, 23 Apr 2024 17:13:04 +0200 (CEST)
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
X-Inumbo-ID: fd4867f2-0183-11ef-909a-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH 02/10] xen/page-defs: address violation of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:44 +0200
Message-Id: <d093a4e47ac0c7029e0a1a6144fca922fe7466e0.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/page-defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/page-defs.h b/xen/include/xen/page-defs.h
index 540f8b0b6452..682da6b7b476 100644
--- a/xen/include/xen/page-defs.h
+++ b/xen/include/xen/page-defs.h
@@ -4,7 +4,8 @@
 /* Helpers for different page granularities. */
 #define PAGE_SIZE_GRAN(gran)        ((paddr_t)1 << PAGE_SHIFT_##gran)
 #define PAGE_MASK_GRAN(gran)        (-PAGE_SIZE_GRAN(gran))
-#define PAGE_ALIGN_GRAN(gran, addr) ((addr + ~PAGE_MASK_##gran) & PAGE_MASK_##gran)
+#define PAGE_ALIGN_GRAN(gran, addr) (((addr) + ~PAGE_MASK_##gran) & \
+                                     PAGE_MASK_##gran)
 
 #define PAGE_SHIFT_4K               12
 #define PAGE_SIZE_4K                PAGE_SIZE_GRAN(4K)
-- 
2.34.1


