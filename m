Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F7308379
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77622.140709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3w-0006mP-CL; Fri, 29 Jan 2021 01:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77622.140709; Fri, 29 Jan 2021 01:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J3w-0006lj-2p; Fri, 29 Jan 2021 01:59:04 +0000
Received: by outflank-mailman (input) for mailman id 77622;
 Fri, 29 Jan 2021 01:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Ivb-0004da-Ln
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:50:27 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cffdc12-63bf-48e9-bad9-adeb517486e1;
 Fri, 29 Jan 2021 01:49:23 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f1so10320490lfu.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:23 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:21 -0800 (PST)
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
X-Inumbo-ID: 2cffdc12-63bf-48e9-bad9-adeb517486e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fFcKXS9Qfprk04/IhHYF4gpVEJ521Jn+3XeqQ84RLaY=;
        b=kFCvr/sVKO/jJ/dxndOQ2l0YFo6Iax2350uPWXfxjLqmlnlNttCf5nCpVngACRkRZS
         y22Y6vEr1++n2v57JAcV5jQ67SmAKG3S5q3Awcb9YexXuXW8lNjITs2FylY52hU6Cdhy
         0vUkUlNdxEDz0oumkJWRfkAs9GshXgg6zENa/7iFvUUcdaBx2DdrUR1G1Pf3Ty9IJkpF
         CIsyxF5ty7ZoAeg5uQXTYGCxv6AV81OdjG/qUpLA3HCpGafQoOlKyIurox1e4oJBHdBw
         j/7Ixd2sIHdZPLzpnKlxYazLyEIMfWeGHVgvT+99uEC4fxFo2XsWM9LCaz3HoKmipwsf
         RBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFcKXS9Qfprk04/IhHYF4gpVEJ521Jn+3XeqQ84RLaY=;
        b=lpZYfWj9tRd6s0WYCBYJfVNMNB6uTDV0waxxYyW3qk0dXqQ5sAoEp5bNXPUGX5wfXo
         9WvZ1EM0wsoa0IDjyhMbvcN8+xVIzsk4wQhmNLlOiWC5ZA5Q6r9jNfL98YKW/k0w1As0
         wcnmEt/L97y+7YHWcgYrqL+8O6AjrgZ/9jfk1GiUbRMRc4rqDqdTLyZKEX7Qy9fkJ7Uu
         jhG/tutibsQ8msvvwVxGkqKJRp+6BmSxsK/ExlLZcS6xgX9DTrGavTK0r69FPpxq296t
         ZUPscfDry8T0NEAJHwsHzbHIU+S4OTR1tD2vE74udhkSa83MWB/CAXwXcqK0Mj7bLhDs
         GKmw==
X-Gm-Message-State: AOAM532kgNqnDTwN8Ys7s63gkojR4VVo/qFhNUk0feVlNIEzG2iuLGLN
	+zXwxCLngoIRRlYV6nKVYjbEJDjJspK3bg==
X-Google-Smtp-Source: ABdhPJzPD6cgEQ7Z1niqBhoap25Ndi2W8p4mMyE/6rCqWrL/jUxnue+HDMRSgjGyPvyMVIt5vvO/Yw==
X-Received: by 2002:a05:6512:224f:: with SMTP id i15mr900821lfu.545.1611884962303;
        Thu, 28 Jan 2021 17:49:22 -0800 (PST)
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
Subject: [PATCH V6 16/24] xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
Date: Fri, 29 Jan 2021 03:48:44 +0200
Message-Id: <1611884932-1851-17-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
rejected by rcu_lock_remote_domain_by_id(). Besides the similar
comment in the code put a respective ASSERT() to catch incorrect
usage in future.

It was tested with IOREQ feature to confirm that all the pages given
to this function belong to a domain, so we can use the same approach
as for XENMAPSPACE_gmfn_foreign handling in xenmem_add_to_physmap_one().

This involves adding an extra parameter for the foreign domain to
set_foreign_p2m_entry() and a helper to indicate whether the arch
supports the reference counting of foreign entries and the restriction
for the hardware domain in the common code can be skipped for it.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

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

Changes V2 -> V3:
   - update patch description
   - rename arch_refcounts_p2m() to arch_acquire_resource_check()
   - move comment to x86’s arch_acquire_resource_check()
   - return rc in Arm's set_foreign_p2m_entry()
   - put a respective ASSERT() into Arm's set_foreign_p2m_entry()

Changes V3 -> V4:
   - update arch_acquire_resource_check() implementation on x86
     and common code which uses it, pass struct domain to the function
   - put ASSERT() to x86/Arm set_foreign_p2m_entry()
   - use arch_acquire_resource_check() in p2m_add_foreign()
     instead of open-coding it

Changes V4 -> V5:
   - update x86's arch_acquire_resource_check()
     - use single return statement
     - update comment
   - add Jan's and Julien's R-b, Stefano's A-b

Changes V5 -> V6:
   - no changes

---
---
 xen/arch/arm/p2m.c           | 26 ++++++++++++++++++++++++++
 xen/arch/x86/mm/p2m.c        |  9 ++++++---
 xen/common/memory.c          |  9 ++-------
 xen/include/asm-arm/p2m.h    | 19 +++++++++----------
 xen/include/asm-x86/p2m.h    | 14 +++++++++++---
 xen/include/xen/p2m-common.h |  4 ++++
 6 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 4eeb867..d41c4fa 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1380,6 +1380,32 @@ int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
     return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
 }
 
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    struct page_info *page = mfn_to_page(mfn);
+    int rc;
+
+    ASSERT(arch_acquire_resource_check(d));
+
+    if ( !get_page(page, fd) )
+        return -EINVAL;
+
+    /*
+     * It is valid to always use p2m_map_foreign_rw here as if this gets
+     * called then d != fd. A case when d == fd would be rejected by
+     * rcu_lock_remote_domain_by_id() earlier. Put a respective ASSERT()
+     * to catch incorrect usage in future.
+     */
+    ASSERT(d != fd);
+
+    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_map_foreign_rw);
+    if ( rc )
+        put_page(page);
+
+    return rc;
+}
+
 static struct page_info *p2m_allocate_root(void)
 {
     struct page_info *page;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index c1dd45b..2091aed 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1323,8 +1323,11 @@ static int set_typed_p2m_entry(struct domain *d, unsigned long gfn_l,
 }
 
 /* Set foreign mfn in the given guest's p2m table. */
-int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn)
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
 {
+    ASSERT(arch_acquire_resource_check(d));
+
     return set_typed_p2m_entry(d, gfn, mfn, PAGE_ORDER_4K, p2m_map_foreign,
                                p2m_get_hostp2m(d)->default_access);
 }
@@ -2587,7 +2590,7 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
      * hvm fixme: until support is added to p2m teardown code to cleanup any
      * foreign entries, limit this to hardware domain only.
      */
-    if ( !is_hardware_domain(tdom) )
+    if ( !arch_acquire_resource_check(tdom) )
         return -EPERM;
 
     if ( foreigndom == DOMID_XEN )
@@ -2643,7 +2646,7 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
      * will update the m2p table which will result in  mfn -> gpfn of dom0
      * and not fgfn of domU.
      */
-    rc = set_foreign_p2m_entry(tdom, gpfn, mfn);
+    rc = set_foreign_p2m_entry(tdom, fdom, gpfn, mfn);
     if ( rc )
         gdprintk(XENLOG_WARNING, "set_foreign_p2m_entry failed. "
                  "gpfn:%lx mfn:%lx fgfn:%lx td:%d fd:%d\n",
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8eb05b1..33296e6 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1139,12 +1139,7 @@ static int acquire_resource(
     xen_pfn_t mfn_list[32];
     int rc;
 
-    /*
-     * FIXME: Until foreign pages inserted into the P2M are properly
-     *        reference counted, it is unsafe to allow mapping of
-     *        resource pages unless the caller is the hardware domain.
-     */
-    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) )
+    if ( !arch_acquire_resource_check(currd) )
         return -EACCES;
 
     if ( copy_from_guest(&xmar, arg, 1) )
@@ -1212,7 +1207,7 @@ static int acquire_resource(
 
         for ( i = 0; !rc && i < xmar.nr_frames; i++ )
         {
-            rc = set_foreign_p2m_entry(currd, gfn_list[i],
+            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
                                        _mfn(mfn_list[i]));
             /* rc should be -EIO for any iteration other than the first */
             if ( rc && i )
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
index 28ca9a8..4f8b3b0 100644
--- a/xen/include/asm-arm/p2m.h
+++ b/xen/include/asm-arm/p2m.h
@@ -161,6 +161,15 @@ typedef enum {
 #endif
 #include <xen/p2m-common.h>
 
+static inline bool arch_acquire_resource_check(struct domain *d)
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
index 5d7836d..7d63f57 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -382,6 +382,17 @@ struct p2m_domain {
 #endif
 #include <xen/p2m-common.h>
 
+static inline bool arch_acquire_resource_check(struct domain *d)
+{
+    /*
+     * FIXME: Until foreign pages inserted into the P2M are properly
+     * reference counted, it is unsafe to allow mapping of
+     * resource pages unless the caller is the hardware domain
+     * (see set_foreign_p2m_entry()).
+     */
+    return !paging_mode_translate(d) || is_hardware_domain(d);
+}
+
 /*
  * Updates vCPU's n2pm to match its np2m_base in VMCx12 and returns that np2m.
  */
@@ -647,9 +658,6 @@ int p2m_finish_type_change(struct domain *d,
 int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
                           unsigned long end);
 
-/* Set foreign entry in the p2m table (for priv-mapping) */
-int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
-
 /* Set mmio addresses in the p2m table (for pass-through) */
 int set_mmio_p2m_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order);
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index 3753bc0..a322e73 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -3,6 +3,10 @@
 
 #include <xen/mm-frame.h>
 
+/* Set foreign entry in the p2m table */
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn);
+
 /* Remove a page from a domain's p2m table */
 int __must_check
 guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
-- 
2.7.4


