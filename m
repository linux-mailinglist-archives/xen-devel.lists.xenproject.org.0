Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E052E763256
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570246.891913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOauZ-0005gb-HA; Wed, 26 Jul 2023 09:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570246.891913; Wed, 26 Jul 2023 09:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOauZ-0005eo-ED; Wed, 26 Jul 2023 09:34:27 +0000
Received: by outflank-mailman (input) for mailman id 570246;
 Wed, 26 Jul 2023 09:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+seJ=DM=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qOauY-0005ea-Fk
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:34:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b3990e4-2b97-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 11:34:24 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.229.19])
 by support.bugseng.com (Postfix) with ESMTPSA id 658754EE0738;
 Wed, 26 Jul 2023 11:34:22 +0200 (CEST)
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
X-Inumbo-ID: 9b3990e4-2b97-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2] xen: use parameter name 'mcs' in arch_do_multicall_call()
Date: Wed, 26 Jul 2023 11:34:14 +0200
Message-Id: <e71bac85a2b7f92a6438f97048cc6cddc917768d.1690362993.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declaration and definition consistent using the same
parameter name ('mcs' do denote a pointer to an 'mc_state').
This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
of an object or function shall use the same names and type qualifiers".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - added forgotten changes about x86.
---
 xen/arch/arm/traps.c        | 4 ++--
 xen/arch/x86/hypercall.c    | 6 +++---
 xen/include/xen/multicall.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index d1ef787638..eab2fcfc02 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1470,9 +1470,9 @@ static bool check_multicall_32bit_clean(struct multicall_entry *multi)
     return true;
 }
 
-enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+enum mc_disposition arch_do_multicall_call(struct mc_state *mcs)
 {
-    struct multicall_entry *multi = &state->call;
+    struct multicall_entry *multi = &mcs->call;
 
     if ( multi->op >= ARRAY_SIZE(hypercall_args) )
     {
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index cc9a6a9d59..01cd73040d 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -203,15 +203,15 @@ int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
     return rc;
 }
 
-enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+enum mc_disposition arch_do_multicall_call(struct mc_state *mcs)
 {
     const struct domain *currd = current->domain;
 
     if ( is_pv_domain(currd) )
-        return pv_do_multicall_call(state);
+        return pv_do_multicall_call(mcs);
 
     if ( is_hvm_domain(currd) )
-        return hvm_do_multicall_call(state);
+        return hvm_do_multicall_call(mcs);
 
     return mc_exit;
 }
diff --git a/xen/include/xen/multicall.h b/xen/include/xen/multicall.h
index ac8238660a..5bebeca7b2 100644
--- a/xen/include/xen/multicall.h
+++ b/xen/include/xen/multicall.h
@@ -25,6 +25,6 @@ enum mc_disposition {
     mc_continue,
     mc_exit,
     mc_preempt,
-} arch_do_multicall_call(struct mc_state *mc);
+} arch_do_multicall_call(struct mc_state *mcs);
 
 #endif /* __XEN_MULTICALL_H__ */
-- 
2.34.1


