Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A487328F73C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7620.20155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VK-0007ZE-Ju; Thu, 15 Oct 2020 16:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7620.20155; Thu, 15 Oct 2020 16:53:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VK-0007VA-20; Thu, 15 Oct 2020 16:53:26 +0000
Received: by outflank-mailman (input) for mailman id 7620;
 Thu, 15 Oct 2020 16:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6ON-0004yr-89
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:15 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46fd3a8f-55f0-4ee0-8179-f6bd7276b904;
 Thu, 15 Oct 2020 16:45:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h20so3822805lji.9
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:10 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:08 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6ON-0004yr-89
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:15 +0000
X-Inumbo-ID: 46fd3a8f-55f0-4ee0-8179-f6bd7276b904
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 46fd3a8f-55f0-4ee0-8179-f6bd7276b904;
	Thu, 15 Oct 2020 16:45:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h20so3822805lji.9
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/fPLWXB55C3rjnJr1JaRD7nWk5g9/E1PMqJP4mwbwZc=;
        b=HitaxQWEsvEv9/Rz9DvKDF6ecJ85ZC9GLKwviZZplNEQWjYaIpccBmQeTM19Dd2R7V
         1kXh8VU1tQevPtf26zRsdREGD2tfhx9Qn0YmijO+CiC1k/LFBEWMmWGSuhn1SgRLP6mf
         BJ8w5GOQ8D7jhxMIdYZn32MP8QoAlExjpexjxUFolKpCck8Dleo5k/g6bNNhzFkdBw9X
         8KqHNDMzkdG5LTGvJQcIU/Cd93rdALS/sUUTISGKgIg0yABiL4kOEV1qSVfhxAQ5kCVb
         Wz8RupR+PmexrOcxslMMqtAGhd2qdvc8FL7x6FTbyxqnYdi/U57R7JsiM74qVDbe7abw
         UAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/fPLWXB55C3rjnJr1JaRD7nWk5g9/E1PMqJP4mwbwZc=;
        b=eQtLWMdwwU43KvqCGiox2k6wrW2v1iOR+GtsQmO4Mz0kDu/0AW8GmLdRNtuKWU2nAw
         ua0FfUsLMQupEAf4ghskU256974DysqHkKGGujzREf6o8cBUF2bnzQ2dcr0oP2CtIxuA
         jl3KdvLL4PNtoU/50IPAL78ZUJ5x7bvJdsIMm+8C26usr37am970DNDRSk9lYXYHcixf
         8UguEjEZuYGMJSl8j0KNy0PkpDGLamoNkcE95/HO9IeI6Y16tLklGsDZHuvirxJlUd2B
         QZy7b3xGUnAwG4FUJTneRLM6Ittl8NQd+60w5eJUxjaOmU5lcFkAbQcgaxYxg+hveb2j
         3ERg==
X-Gm-Message-State: AOAM531DRggBqNyEd8lbJ4+Vd5JRA76zBoVRbf3z9IqepOolcUx4+Qg8
	fxpVpURNZntciKtL6IhY/SlA2l3qZtK5FQ==
X-Google-Smtp-Source: ABdhPJwACpsMFGhkuraX68uLZBKp6BNDpiiOkvIcf85E72rgjoANcmS+h8Z4oafvGu1h220iQ29gKw==
X-Received: by 2002:a2e:9618:: with SMTP id v24mr1687846ljh.191.1602780309232;
        Thu, 15 Oct 2020 09:45:09 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:08 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 16/23] xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
Date: Thu, 15 Oct 2020 19:44:27 +0300
Message-Id: <1602780274-29141-17-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch implements reference counting of foreign entries in
in set_foreign_p2m_entry() on Arm. This is a mandatory action if
we want to run emulator (IOREQ server) in other than dom0 domain,
as we can't trust it to do the right thing if it is not running
in dom0. So we need to grab a reference on the page to avoid it
disappearing.

It is valid to always pass "p2m_map_foreign_rw" type to
guest_physmap_add_entry() since the current and foreign domains
would be always different. A case when they are equal would be
rejected by rcu_lock_remote_domain_by_id().

It was tested with IOREQ feature to confirm that all the pages given
to this function belong to a domain, so we can use the same approach
as for XENMAPSPACE_gmfn_foreign handling in xenmem_add_to_physmap_one().

This involves adding an extra parameter for the foreign domain to
set_foreign_p2m_entry() and a helper to indicate whether the arch
supports the reference counting of foreign entries and the restriction
for the hardware domain in the common code can be skipped for it.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch, was split from:
     "[RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for IOREQ/DM features"
   - rewrite a logic to handle properly reference in set_foreign_p2m_entry()
     instead of treating foreign entries as p2m_ram_rw

Changes V1 -> V2:
   - rebase according to the recent changes to acquire_resource()
   - update patch description
   - introduce arch_refcounts_p2m()
   - add an explanation why p2m_map_foreign_rw is valid
   - move set_foreign_p2m_entry() to p2m-common.h
   - add const to new parameter
---
 xen/arch/arm/p2m.c           | 21 +++++++++++++++++++++
 xen/arch/x86/mm/p2m.c        |  5 +++--
 xen/common/memory.c          |  5 +++--
 xen/include/asm-arm/p2m.h    | 19 +++++++++----------
 xen/include/asm-x86/p2m.h    | 12 +++++++++---
 xen/include/xen/p2m-common.h |  4 ++++
 6 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 4eeb867..370173c 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1380,6 +1380,27 @@ int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
     return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
 }
 
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    struct page_info *page = mfn_to_page(mfn);
+    int rc;
+
+    if ( !get_page(page, fd) )
+        return -EINVAL;
+
+    /*
+     * It is valid to always use p2m_map_foreign_rw here as if this gets
+     * called that d != fd. A case when d == fd would be rejected by
+     * rcu_lock_remote_domain_by_id() earlier.
+     */
+    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_map_foreign_rw);
+    if ( rc )
+        put_page(page);
+
+    return 0;
+}
+
 static struct page_info *p2m_allocate_root(void)
 {
     struct page_info *page;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 6102771..8d03ab4 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1320,7 +1320,8 @@ static int set_typed_p2m_entry(struct domain *d, unsigned long gfn_l,
 }
 
 /* Set foreign mfn in the given guest's p2m table. */
-int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn)
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
 {
     return set_typed_p2m_entry(d, gfn, mfn, PAGE_ORDER_4K, p2m_map_foreign,
                                p2m_get_hostp2m(d)->default_access);
@@ -2620,7 +2621,7 @@ int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
      * will update the m2p table which will result in  mfn -> gpfn of dom0
      * and not fgfn of domU.
      */
-    rc = set_foreign_p2m_entry(tdom, gpfn, mfn);
+    rc = set_foreign_p2m_entry(tdom, fdom, gpfn, mfn);
     if ( rc )
         gdprintk(XENLOG_WARNING, "set_foreign_p2m_entry failed. "
                  "gpfn:%lx mfn:%lx fgfn:%lx td:%d fd:%d\n",
diff --git a/xen/common/memory.c b/xen/common/memory.c
index cf53ca3..fb9ea96 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1099,7 +1099,8 @@ static int acquire_resource(
      *        reference counted, it is unsafe to allow mapping of
      *        resource pages unless the caller is the hardware domain.
      */
-    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) )
+    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) &&
+         !arch_refcounts_p2m() )
         return -EACCES;
 
     if ( copy_from_guest(&xmar, arg, 1) )
@@ -1168,7 +1169,7 @@ static int acquire_resource(
 
         for ( i = 0; !rc && i < xmar.nr_frames; i++ )
         {
-            rc = set_foreign_p2m_entry(currd, gfn_list[i],
+            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
                                        _mfn(mfn_list[i]));
             /* rc should be -EIO for any iteration other than the first */
             if ( rc && i )
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 28ca9a8..d11be80 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -161,6 +161,15 @@ typedef enum {
 #endif
 #include <xen/p2m-common.h>
 
+static inline bool arch_refcounts_p2m(void)
+{
+    /*
+     * The reference counting of foreign entries in set_foreign_p2m_entry()
+     * is supported on Arm.
+     */
+    return true;
+}
+
 static inline
 void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
 {
@@ -392,16 +401,6 @@ static inline gfn_t gfn_next_boundary(gfn_t gfn, unsigned int order)
     return gfn_add(gfn, 1UL << order);
 }
 
-static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
-                                        mfn_t mfn)
-{
-    /*
-     * NOTE: If this is implemented then proper reference counting of
-     *       foreign entries will need to be implemented.
-     */
-    return -EOPNOTSUPP;
-}
-
 /*
  * A vCPU has cache enabled only when the MMU is enabled and data cache
  * is enabled.
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 5f7ba31..6c42022 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -369,6 +369,15 @@ struct p2m_domain {
 #endif
 #include <xen/p2m-common.h>
 
+static inline bool arch_refcounts_p2m(void)
+{
+    /*
+     * The reference counting of foreign entries in set_foreign_p2m_entry()
+     * is not supported on x86.
+     */
+    return false;
+}
+
 /*
  * Updates vCPU's n2pm to match its np2m_base in VMCx12 and returns that np2m.
  */
@@ -634,9 +643,6 @@ int p2m_finish_type_change(struct domain *d,
 int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
                           unsigned long end);
 
-/* Set foreign entry in the p2m table (for priv-mapping) */
-int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
-
 /* Set mmio addresses in the p2m table (for pass-through) */
 int set_mmio_p2m_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order);
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index 58031a6..b4bc709 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -3,6 +3,10 @@
 
 #include <xen/mm.h>
 
+/* Set foreign entry in the p2m table */
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn);
+
 /* Remove a page from a domain's p2m table */
 int __must_check
 guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
-- 
2.7.4


