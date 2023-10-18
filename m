Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E7F7CDF9C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618619.962498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7V9-0001kT-FZ; Wed, 18 Oct 2023 14:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618619.962498; Wed, 18 Oct 2023 14:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7V9-0001eT-9Y; Wed, 18 Oct 2023 14:26:23 +0000
Received: by outflank-mailman (input) for mailman id 618619;
 Wed, 18 Oct 2023 14:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7V8-0001YJ-FI
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f62fdc0-6dc2-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:26:22 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 06ADC4EE073F;
 Wed, 18 Oct 2023 16:26:20 +0200 (CEST)
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
X-Inumbo-ID: 4f62fdc0-6dc2-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/7] x86/mtrr: address violation of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:25:55 +0200
Message-Id: <d1fbcb647c82032660ffa547a0da073c3e625b7c.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638486.git.federico.serafini@bugseng.com>
References: <cover.1697638486.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/mtrr.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
index 14246e3387..1d2744eceb 100644
--- a/xen/arch/x86/include/asm/mtrr.h
+++ b/xen/arch/x86/include/asm/mtrr.h
@@ -48,7 +48,7 @@ struct mtrr_state {
 };
 extern struct mtrr_state mtrr_state;
 
-extern void cf_check mtrr_save_fixed_ranges(void *);
+extern void cf_check mtrr_save_fixed_ranges(void *info);
 extern void mtrr_save_state(void);
 extern int mtrr_add(unsigned long base, unsigned long size,
                     unsigned int type, char increment);
@@ -68,14 +68,14 @@ extern void mtrr_aps_sync_begin(void);
 extern void mtrr_aps_sync_end(void);
 extern void mtrr_bp_restore(void);
 
-extern bool_t mtrr_var_range_msr_set(struct domain *, struct mtrr_state *,
+extern bool_t mtrr_var_range_msr_set(struct domain *d, struct mtrr_state *m,
                                      uint32_t msr, uint64_t msr_content);
-extern bool_t mtrr_fix_range_msr_set(struct domain *, struct mtrr_state *,
+extern bool_t mtrr_fix_range_msr_set(struct domain *d, struct mtrr_state *m,
                                      uint32_t row, uint64_t msr_content);
-extern bool_t mtrr_def_type_msr_set(struct domain *, struct mtrr_state *,
+extern bool_t mtrr_def_type_msr_set(struct domain *d, struct mtrr_state *m,
                                     uint64_t msr_content);
 #ifdef CONFIG_HVM
-extern void memory_type_changed(struct domain *);
+extern void memory_type_changed(struct domain *d);
 #else
 static inline void memory_type_changed(struct domain *d) {}
 #endif
-- 
2.34.1


