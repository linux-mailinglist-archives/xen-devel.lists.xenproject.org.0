Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA7E8C61C3
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721956.1125706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799t-00058r-98; Wed, 15 May 2024 07:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721956.1125706; Wed, 15 May 2024 07:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s799s-000553-VH; Wed, 15 May 2024 07:34:40 +0000
Received: by outflank-mailman (input) for mailman id 721956;
 Wed, 15 May 2024 07:34:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opSn=MS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s799r-0004nt-Iu
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:34:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 959f3b2c-128d-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 09:34:38 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id 85EC14EE0747;
 Wed, 15 May 2024 09:34:37 +0200 (CEST)
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
X-Inumbo-ID: 959f3b2c-128d-11ef-909d-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 3/4] x86_64/uaccess: address violations of MISRA C Rule 20.7
Date: Wed, 15 May 2024 09:34:32 +0200
Message-Id: <b131427dc03c4b89141bab7648523b81bf5186a6.1715757982.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715757982.git.nicola.vetrini@bugseng.com>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

xlat_malloc_init is touched for consistency, despite the construct
being already deviated.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/include/asm/x86_64/uaccess.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86_64/uaccess.h b/xen/arch/x86/include/asm/x86_64/uaccess.h
index ba79f950fba9..c6fa3fd381bc 100644
--- a/xen/arch/x86/include/asm/x86_64/uaccess.h
+++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
@@ -26,15 +26,16 @@ void free_compat_arg_xlat(struct vcpu *v);
 #define xlat_page_start ((unsigned long)COMPAT_ARG_XLAT_VIRT_BASE)
 #define xlat_page_size  COMPAT_ARG_XLAT_SIZE
 #define xlat_page_left_size(xlat_page_current) \
-    (xlat_page_start + xlat_page_size - xlat_page_current)
+    (xlat_page_start + xlat_page_size - (xlat_page_current))
 
 #define xlat_malloc_init(xlat_page_current)    do { \
-    xlat_page_current = xlat_page_start; \
+    (xlat_page_current) = xlat_page_start; \
 } while (0)
 
 extern void *xlat_malloc(unsigned long *xlat_page_current, size_t size);
 
-#define xlat_malloc_array(_p, _t, _c) ((_t *) xlat_malloc(&_p, sizeof(_t) * _c))
+#define xlat_malloc_array(_p, _t, _c) ((_t *) xlat_malloc(&(_p), \
+                                                          sizeof(_t) * (_c)))
 
 /*
  * Valid if in +ve half of 48-bit address space, or above Xen-reserved area.
-- 
2.34.1


