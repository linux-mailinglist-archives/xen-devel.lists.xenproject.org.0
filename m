Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCF569426
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 23:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362615.592749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CQB-0006b7-Bx; Wed, 06 Jul 2022 21:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362615.592749; Wed, 06 Jul 2022 21:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9CQB-0006V2-3C; Wed, 06 Jul 2022 21:18:55 +0000
Received: by outflank-mailman (input) for mailman id 362615;
 Wed, 06 Jul 2022 21:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o9CG5-0003HV-CG
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 21:08:29 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c751cda8-fd6f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 23:08:28 +0200 (CEST)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657141523099239.14805637871416;
 Wed, 6 Jul 2022 14:05:23 -0700 (PDT)
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
X-Inumbo-ID: c751cda8-fd6f-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1657141524; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gprjnvHTCj66K/3zl3xhHAr3DXoKXA6PrEBBEZ49G2TOXH1XZxa2Tc6C4UMBoeW1Q66kFf5ub/ut0lmqwSR72NeUBuAUhkeolKv5LIrTrDFI3oESHd5BoMyuE2YvGp7hmGhkzNWOtQd9Rr7bsH6IPNn83jyeMqr9oFaRzLtPkbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657141524; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=WXmYD77YrhMc0tVJJp6RofHh/xQBmFJZqWBf4zSdvRM=; 
	b=kF1fopmFVLXRCb0oG8SdiEpHINmWL3fgc14URNgau+LHLybQa2KwwHlKEYMswFj1y56cIvoxOWT6RjNQAYj88LnO9r6xCPsE/Pvpb1gPIgMNz6j7cBlyxJhffRGOz+0d3ENmlR/WQxFdcSDdaZWyib4iUO0eeat9cisxCKBPqMc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657141524;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=WXmYD77YrhMc0tVJJp6RofHh/xQBmFJZqWBf4zSdvRM=;
	b=Pg4ZizoMIlxabe1CMIbyfMFO6yj6riZclXmO0O+HIaYdhWnOclu+DFPmxWcQaOuu
	u/R8ZTkPzgzFInWByC30mkDUEkoNBhXW0XqwohkreQPmMn68OmN0cgZt0tKXlYizng7
	tEZ+BwCtVrprC7E5i4D075yzfVnJwnAxA8FqThMo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org,
	Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	scott.davis@starlab.io,
	christopher.clark@starlab.io,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 13/18] x86: generalize physmap logic
Date: Wed,  6 Jul 2022 17:04:48 -0400
Message-Id: <20220706210454.30096-14-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706210454.30096-1-dpsmith@apertussolutions.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The existing physmap code is specific to dom0. In this commit, the dom0 physmap
code is generalized for any domain and functions are renamed to reflect their
new general nature.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/include/asm/dom0_build.h |  2 +-
 xen/arch/x86/pv/dom0_build.c          | 10 +++++-----
 xen/arch/x86/pv/shim.c                |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/include/asm/dom0_build.h
index 571b25ea71..f30e4b860a 100644
--- a/xen/arch/x86/include/asm/dom0_build.h
+++ b/xen/arch/x86/include/asm/dom0_build.h
@@ -21,7 +21,7 @@ int dom0_construct_pvh(struct boot_domain *bd);
 unsigned long dom0_paging_pages(const struct domain *d,
                                 unsigned long nr_pages);
 
-void dom0_update_physmap(bool compat, unsigned long pfn,
+void dom_update_physmap(bool compat, unsigned long pfn,
                          unsigned long mfn, unsigned long vphysmap_s);
 
 #endif	/* _DOM0_BUILD_H_ */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 78ebb03b1b..f1ea0575f0 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -34,8 +34,8 @@
 #define L3_PROT (BASE_PROT|_PAGE_DIRTY)
 #define L4_PROT (BASE_PROT|_PAGE_DIRTY)
 
-void __init dom0_update_physmap(bool compat, unsigned long pfn,
-                                unsigned long mfn, unsigned long vphysmap_s)
+void __init dom_update_physmap(
+    bool compat, unsigned long pfn, unsigned long mfn, unsigned long vphysmap_s)
 {
     if ( !compat )
         ((unsigned long *)vphysmap_s)[pfn] = mfn;
@@ -815,7 +815,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
         if ( pfn > REVERSE_START && (vinitrd_start || pfn < initrd_pfn) )
             mfn = alloc_epfn - (pfn - REVERSE_START);
 #endif
-        dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
+        dom_update_physmap(compat, pfn, mfn, vphysmap_start);
         if ( !(pfn & 0xfffff) )
             process_pending_softirqs();
     }
@@ -831,7 +831,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
-            dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
+            dom_update_physmap(compat, pfn, mfn, vphysmap_start);
             ++pfn;
             if ( !(pfn & 0xfffff) )
                 process_pending_softirqs();
@@ -851,7 +851,7 @@ int __init dom0_construct_pv(struct boot_domain *bd)
 #ifndef NDEBUG
 #define pfn (nr_pages - 1 - (pfn - (alloc_epfn - alloc_spfn)))
 #endif
-            dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
+            dom_update_physmap(compat, pfn, mfn, vphysmap_start);
 #undef pfn
             page++; pfn++;
             if ( !(pfn & 0xfffff) )
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 2ee290a392..fb2a7ef393 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -210,7 +210,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
     {                                                                          \
         share_xen_page_with_guest(mfn_to_page(_mfn(param)), d, SHARE_rw);      \
         replace_va_mapping(d, l4start, va, _mfn(param));                       \
-        dom0_update_physmap(compat,                                            \
+        dom_update_physmap(compat,                                             \
                             PFN_DOWN((va) - va_start), param, vphysmap);       \
     }                                                                          \
     else                                                                       \
@@ -238,7 +238,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
         si->console.domU.mfn = mfn_x(console_mfn);
         share_xen_page_with_guest(mfn_to_page(console_mfn), d, SHARE_rw);
         replace_va_mapping(d, l4start, console_va, console_mfn);
-        dom0_update_physmap(compat, (console_va - va_start) >> PAGE_SHIFT,
+        dom_update_physmap(compat, (console_va - va_start) >> PAGE_SHIFT,
                             mfn_x(console_mfn), vphysmap);
         consoled_set_ring_addr(page);
     }
-- 
2.20.1


