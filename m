Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0FC8AEA4E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710789.1110252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpT-0005C5-Gi; Tue, 23 Apr 2024 15:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710789.1110252; Tue, 23 Apr 2024 15:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpT-00059a-Dz; Tue, 23 Apr 2024 15:13:07 +0000
Received: by outflank-mailman (input) for mailman id 710789;
 Tue, 23 Apr 2024 15:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpS-0003wh-1w
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb56fa57-0183-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:13:04 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 872D54EE073F;
 Tue, 23 Apr 2024 17:13:00 +0200 (CEST)
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
X-Inumbo-ID: fb56fa57-0183-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH 01/10] libelf: address violations of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:43 +0200
Message-Id: <250b556fc0516e4a20b24161dad3032e2ac3db80.1713885065.git.nicola.vetrini@bugseng.com>
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
 xen/common/libelf/libelf-private.h | 2 +-
 xen/include/xen/libelf.h           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 98cac65bc50d..197d7a7623a3 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -26,7 +26,7 @@
 /* we would like to use elf->log_callback but we can't because
  * there is no vprintk in Xen */
 #define elf_msg(elf, fmt, args ... ) \
-   if (elf->verbose) printk(fmt, ## args )
+   if ((elf)->verbose) printk(fmt, ## args )
 #define elf_err(elf, fmt, args ... ) \
    printk(fmt, ## args )
 
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index 9ac530acc2a8..a0675a4dc352 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -288,7 +288,7 @@ bool elf_access_ok(struct elf_binary * elf,
 #define elf_store_val(elf, type, ptr, val)                              \
     ({                                                                  \
         typeof(type) elf_store__val = (val);                            \
-        elf_ptrval elf_store__targ = ptr;                               \
+        elf_ptrval elf_store__targ = (ptr);                             \
         if (elf_access_ok((elf), elf_store__targ,                       \
                           sizeof(elf_store__val))) {			\
             elf_memcpy_unchecked((void*)elf_store__targ, &elf_store__val, \
-- 
2.34.1


