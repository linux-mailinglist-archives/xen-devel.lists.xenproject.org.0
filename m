Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A112C512FA3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 11:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316352.535255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0jR-0004Jj-HZ; Thu, 28 Apr 2022 09:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316352.535255; Thu, 28 Apr 2022 09:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0jR-0004Gl-Dz; Thu, 28 Apr 2022 09:46:41 +0000
Received: by outflank-mailman (input) for mailman id 316352;
 Thu, 28 Apr 2022 09:46:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dcPN=VG=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nk0jQ-0004Gf-FN
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 09:46:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 19192d57-c6d8-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 11:46:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 510141474;
 Thu, 28 Apr 2022 02:46:37 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.12.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4A353F774;
 Thu, 28 Apr 2022 02:46:35 -0700 (PDT)
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
X-Inumbo-ID: 19192d57-c6d8-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: gnttab: cast unused macro arguments to void
Date: Thu, 28 Apr 2022 11:46:25 +0200
Message-Id: <20220428094625.382970-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function unmap_common_complete (common/grant_table.c) defines and sets
a variable ld that is later on passed to a macro:
gnttab_host_mapping_get_page_type().
On Arm this macro does not make use of any arguments causing a compiler
to warn about unused-but-set variable (when -Wunused-but-set-variable
is enabled). Fix it by casting the arguments to void in macro's body.

While there, take the opportunity to modify other macros in this file
that do not make use of all the arguments to prevent similar issues in
the future.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v1:
-standalone patch carved out from a series (other patches already merged)
-v1 was ([3/8] gnttab: Remove unused-but-set variable)
-modify macro on Arm instead of removing ld variable
---
 xen/arch/arm/include/asm/grant_table.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d31a4d6805..5bcd1ec528 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -31,10 +31,11 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
 
 int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
                               unsigned int flags, unsigned int cache_flags);
-#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
+#define gnttab_host_mapping_get_page_type(ro, ld, rd) \
+    ((void)(ro), (void)(ld), (void)(rd), 0)
 int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
                                unsigned long new_gpaddr, unsigned int flags);
-#define gnttab_release_host_mappings(domain) 1
+#define gnttab_release_host_mappings(domain) ((void)(domain), 1)
 
 /*
  * The region used by Xen on the memory will never be mapped in DOM0
@@ -89,10 +90,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
 })
 
 #define gnttab_shared_gfn(d, t, i)                                       \
-    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
+    ((void)(d),                                                          \
+     ((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
 
-#define gnttab_status_gfn(d, t, i)                                       \
-    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
+#define gnttab_status_gfn(d, t, i)                                        \
+    ((void)(d),                                                           \
+     ((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
 
 #define gnttab_need_iommu_mapping(d)                    \
     (is_domain_direct_mapped(d) && is_iommu_enabled(d))
-- 
2.25.1


