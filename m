Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F1876D03D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574979.900710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzw-0000JX-6T; Wed, 02 Aug 2023 14:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574979.900710; Wed, 02 Aug 2023 14:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzv-0000Dx-Ql; Wed, 02 Aug 2023 14:38:47 +0000
Received: by outflank-mailman (input) for mailman id 574979;
 Wed, 02 Aug 2023 14:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzt-0007ap-7L
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47b43c9a-3142-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 16:38:43 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C89704EE0740;
 Wed,  2 Aug 2023 16:38:42 +0200 (CEST)
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
X-Inumbo-ID: 47b43c9a-3142-11ee-8613-37d641c3527e
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
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 08/11] xen: move declarations to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:14 +0200
Message-Id: <055dce166662183c68fb488fa7f7722a3a5fcd98.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declarations between a switch statement guard and before
any case label are unreachable code, and hence violate Rule 2.1:
"A project shall not contain unreachable code".

Therefore the variable declarations are moved in the smallest enclosing
scope, near other variable definitions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/compat/memory.c |  3 +--
 xen/common/domain.c        | 15 +++++++--------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 8ca63ceda6..d4c4204119 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -85,13 +85,12 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
             struct compat_mem_access_op mao;
             struct compat_mem_acquire_resource mar;
         } cmp;
+        xen_pfn_t *space;
 
         set_xen_guest_handle(nat.hnd, COMPAT_ARG_XLAT_VIRT_BASE);
         split = 0;
         switch ( op )
         {
-            xen_pfn_t *space;
-
         case XENMEM_increase_reservation:
         case XENMEM_decrease_reservation:
         case XENMEM_populate_physmap:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 304aa04fa6..e3aeaf059d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -401,6 +401,13 @@ static int domain_teardown(struct domain *d)
 {
     struct vcpu *v;
     int rc;
+    enum {
+        PROG_none,
+        PROG_gnttab_mappings,
+        PROG_vcpu_teardown,
+        PROG_arch_teardown,
+        PROG_done,
+    };
 
     BUG_ON(!d->is_dying);
 
@@ -435,14 +442,6 @@ static int domain_teardown(struct domain *d)
     case PROG_vcpu_ ## x:                       \
         v = d->teardown.vcpu
 
-        enum {
-            PROG_none,
-            PROG_gnttab_mappings,
-            PROG_vcpu_teardown,
-            PROG_arch_teardown,
-            PROG_done,
-        };
-
     case PROG_none:
         BUILD_BUG_ON(PROG_none != 0);
 
-- 
2.34.1


