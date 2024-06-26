Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F2918260
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748857.1156807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShv-0003SQ-Sk; Wed, 26 Jun 2024 13:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748857.1156807; Wed, 26 Jun 2024 13:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShv-0003Oc-KU; Wed, 26 Jun 2024 13:29:07 +0000
Received: by outflank-mailman (input) for mailman id 748857;
 Wed, 26 Jun 2024 13:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMSht-00030P-Tl
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:29:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e9a167e-33c0-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:29:04 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id C54A74EE0757;
 Wed, 26 Jun 2024 15:29:03 +0200 (CEST)
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
X-Inumbo-ID: 0e9a167e-33c0-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 for-4.20 3/7] xen/guest_access: address violations of MISRA rule 20.7
Date: Wed, 26 Jun 2024 15:28:49 +0200
Message-Id: <cfc2067d0389092c0f2d0e688e474b1f0d5013c7.1719407840.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719407840.git.nicola.vetrini@bugseng.com>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/include/xen/guest_access.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index a2146749e396..2e0971c4872c 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -51,9 +51,9 @@
     ((XEN_GUEST_HANDLE(type)) { &(hnd).p->fld })
 
 #define guest_handle_from_ptr(ptr, type)        \
-    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)ptr })
+    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)(ptr) })
 #define const_guest_handle_from_ptr(ptr, type)  \
-    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)ptr })
+    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)(ptr) })
 
 /*
  * Copy an array of objects to guest context via a guest handle,
-- 
2.34.1

