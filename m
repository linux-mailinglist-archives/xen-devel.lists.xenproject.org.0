Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D251D4DE
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 11:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322794.544227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuU1-0005RM-72; Fri, 06 May 2022 09:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322794.544227; Fri, 06 May 2022 09:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuU1-0005Oq-3V; Fri, 06 May 2022 09:42:45 +0000
Received: by outflank-mailman (input) for mailman id 322794;
 Fri, 06 May 2022 09:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFy9=VO=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmuTz-00059C-M8
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 09:42:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id dee23dd7-cd20-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 11:42:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 150D8153B;
 Fri,  6 May 2022 02:42:40 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.2.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EB373FA31;
 Fri,  6 May 2022 02:42:38 -0700 (PDT)
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
X-Inumbo-ID: dee23dd7-cd20-11ec-8fc4-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 1/2] xen/arm: gnttab: use static inlines for gnttab_{release_}host_mapping*
Date: Fri,  6 May 2022 11:42:24 +0200
Message-Id: <20220506094225.181815-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506094225.181815-1-michal.orzel@arm.com>
References: <20220506094225.181815-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function unmap_common_complete (common/grant_table.c) defines and sets
a variable ld that is later on passed to a macro:
gnttab_host_mapping_get_page_type().
On Arm this macro does not make use of any arguments causing a compiler
to warn about unused-but-set variable (when -Wunused-but-set-variable
is enabled). Fix it by converting this macro to a static inline
helper and using the boolean return type.

While there, also convert macro gnttab_release_host_mappings.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
- mark parameters as const
---
 xen/arch/arm/include/asm/grant_table.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d31a4d6805..5ccaf6d51f 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -29,12 +29,22 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
 #endif
 }
 
+static inline bool gnttab_host_mapping_get_page_type(const bool ro,
+                                                     const struct domain *ld,
+                                                     const struct domain *rd)
+{
+    return false;
+}
+
+static inline bool gnttab_release_host_mappings(const struct domain *d)
+{
+    return true;
+}
+
 int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
                               unsigned int flags, unsigned int cache_flags);
-#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
 int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
                                unsigned long new_gpaddr, unsigned int flags);
-#define gnttab_release_host_mappings(domain) 1
 
 /*
  * The region used by Xen on the memory will never be mapped in DOM0
-- 
2.25.1


