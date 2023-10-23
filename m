Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C448D7D3861
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621474.967950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvH6-0004hv-LP; Mon, 23 Oct 2023 13:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621474.967950; Mon, 23 Oct 2023 13:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvH6-0004ew-I5; Mon, 23 Oct 2023 13:47:20 +0000
Received: by outflank-mailman (input) for mailman id 621474;
 Mon, 23 Oct 2023 13:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWHG=GF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1quvH5-0004eh-Ac
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:47:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae685d0f-71aa-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 15:47:18 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 7FFAE4EE0747;
 Mon, 23 Oct 2023 15:47:17 +0200 (CEST)
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
X-Inumbo-ID: ae685d0f-71aa-11ee-98d5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] x86/p2m: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Mon, 23 Oct 2023 15:47:11 +0200
Message-Id: <4566d4517cad99e15bfccc3b0c553a19d615fe3c.1698065062.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name and make function declarations and
definitions consistent. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/p2m.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 40545f5fa8..f2c7d58b59 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -632,7 +632,7 @@ void p2m_change_type_range(struct domain *d,
                            p2m_type_t ot, p2m_type_t nt);
 
 /* Compare-exchange the type of a single p2m entry */
-int p2m_change_type_one(struct domain *d, unsigned long gfn,
+int p2m_change_type_one(struct domain *d, unsigned long gfn_l,
                         p2m_type_t ot, p2m_type_t nt);
 
 /* Synchronously change the p2m type for a range of gfns */
@@ -649,7 +649,7 @@ static inline bool p2m_is_global_logdirty(const struct domain *d)
 #endif
 }
 
-int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
+int p2m_is_logdirty_range(struct p2m_domain *p2m, unsigned long start,
                           unsigned long end);
 
 /* Set mmio addresses in the p2m table (for pass-through) */
@@ -661,9 +661,9 @@ int set_identity_p2m_entry(struct domain *d, unsigned long gfn,
                            p2m_access_t p2ma, unsigned int flag);
 int clear_identity_p2m_entry(struct domain *d, unsigned long gfn);
 /* HVM-only callers can use these directly: */
-int p2m_add_identity_entry(struct domain *d, unsigned long gfn,
+int p2m_add_identity_entry(struct domain *d, unsigned long gfn_l,
                            p2m_access_t p2ma, unsigned int flag);
-int p2m_remove_identity_entry(struct domain *d, unsigned long gfn);
+int p2m_remove_identity_entry(struct domain *d, unsigned long gfn_l);
 
 /* 
  * Populate-on-demand
@@ -924,7 +924,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
                                 p2m_type_t p2mt, p2m_access_t p2ma);
 
 /* Set a specific p2m view visibility */
-int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
+int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
                                    uint8_t visible);
 #else /* !CONFIG_HVM */
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
-- 
2.34.1


