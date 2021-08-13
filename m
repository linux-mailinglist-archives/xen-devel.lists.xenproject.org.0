Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6F3EBDDA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 23:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166918.304687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEeij-0006UW-PT; Fri, 13 Aug 2021 21:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166918.304687; Fri, 13 Aug 2021 21:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEeij-0006Sj-MJ; Fri, 13 Aug 2021 21:28:05 +0000
Received: by outflank-mailman (input) for mailman id 166918;
 Fri, 13 Aug 2021 21:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Iem=NE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mEeii-0006Sd-Ex
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 21:28:04 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 710639fc-84e7-49c3-8e82-5d2ab5e00a5a;
 Fri, 13 Aug 2021 21:28:02 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id c24so22287115lfi.11
 for <xen-devel@lists.xenproject.org>; Fri, 13 Aug 2021 14:28:02 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id br41sm250528lfb.281.2021.08.13.14.28.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Aug 2021 14:28:00 -0700 (PDT)
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
X-Inumbo-ID: 710639fc-84e7-49c3-8e82-5d2ab5e00a5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8KJMZ+WDswslvVk3meizbvx1QEbOYR4SETvZl+Ww/7Y=;
        b=LjauUZOMDkP9fXItd0If8pjVq1zhY+ELYvMVYtxNJUSkbMDszcZf3Z1QZmb/4yu1SA
         ThyJGaPK/31fh/tNkgtmjAbopWQTQFC5M7kpCMCnW5qZhcOegsp+gUUG1ZycbbgSOh5h
         iyV2MAqZoW/yzyg3WuKZ5BTpmb8swvlO/SxgqGOh/xwctgMmEbUDnXT3NZh4j3jxtu8b
         cUnEIuVNbUOXkP9GyPd6wVS2raV0sJSRl2sOuJ3JKE6ub9AgLqRCvV1aIIMDRFvMFx3Y
         JVwS93vGtSoUdQWTCJcnCCeIzFQ1poxMPzg9qicDYhBzCaTtMJuKY0QLd3YafayctrN8
         /1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8KJMZ+WDswslvVk3meizbvx1QEbOYR4SETvZl+Ww/7Y=;
        b=oBISssFL8eL6cySq6c45xh3hAewIXRRL/HOXAkygqJiGGVwpjEYgD9C/2jiUQ7ym3p
         f4NECPDdM7lNpo4YsW1DnZjZWk5yrT9APUl7Zp3FT2Yj9Yy1e6rsXDUjmGGWLkEhC1TM
         3vzvIfpet1msuQiH3cOflBh06mH8wNzxY4jwTms7DvrM/FfcxhGmNXVobSRNJ370oal2
         vFjEJtga8chwZSjxa/BNcY+CXD/7ZO70UPXBFXytoeNhcqfPgAR4PNv7jQCAJaaTYvjD
         DLXJr0E9Ah7lDGvuOaqM4EIxfHaUU1Y4ztLQpTxdGbvO4gnv6zLcL03bIaW8FtN4Co3X
         85qw==
X-Gm-Message-State: AOAM5300EMzR2Rh0Wcv7EI4BlUuykIL8kA61zbX3U31yuSj68AxFF1zW
	hlIT6seMf/vI7YRrFujbHcg6YJCQdEs=
X-Google-Smtp-Source: ABdhPJzpXIFMYWtxSYk/v3v9MUVFm3SvtuMtdQnrU/3XgPz+J2SbQVGC6S6ISn1u3ezlyqVqb1hcUw==
X-Received: by 2002:ac2:50c6:: with SMTP id h6mr2969536lfm.343.1628890081246;
        Fri, 13 Aug 2021 14:28:01 -0700 (PDT)
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
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/grant-table: Add a mechanism for cleaning frame GFN
Date: Sat, 14 Aug 2021 00:27:57 +0300
Message-Id: <1628890077-12545-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Introduce new gnttab_clean_frame_gfn() which purpose is to
locate a GFN corresponding to the passed MFN and remove it
from the gnttab database. This manual updating is only needed
on arch without M2P support.
So, call it from p2m_put_l3_page() on Arm after making sure
that we release a grant table page.

This patch is intended to fix a possible bug on Arm which might
happen when remapping grant-table frame. From the discussion
on the ML:
"The function gnttab_map_frame() is used to map the grant table
frame. If there is an old mapping, it will first remove it.
The function is using the helper gnttab_get_frame_gfn() to find
the corresponding GFN or return INVALID_GFN if not mapped.
On Arm, gnttab_map_frame() is implementing using an array index
by the grant table frame number. The trouble is we don't update
the array when the page is unmapped. So if the GFN is re-used
before the grant-table is remapped, then we will end up to remove
whatever was mapped there (this could be a foreign page...)."

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
You can find the discussion at:
https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/

I am sure that gnttab_clean_frame_gfn() is not needed on x86 which
has M2P support. But, I was thinking where to keep it, but couldn't
find any suitable place other than common grant_table.c.
I thought, new function could be neither placed in arch header as
static inline nor in "new" arch C file without reworking common
grant_table.c by moving all involved stuff (struct declarations,
helpers, etc) to the common header to make them visible from
the outside.
---
 xen/arch/arm/p2m.c            | 20 ++++++++++++++++----
 xen/common/grant_table.c      | 42 ++++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/grant_table.h |  4 ++++
 3 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index eff9a10..e921be2 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2,6 +2,7 @@
 #include <xen/domain_page.h>
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
+#include <xen/grant_table.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
@@ -718,8 +719,10 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
  * TODO: Handle superpages, for now we only take special references for leaf
  * pages (specifically foreign ones, which can't be super mapped today).
  */
-static void p2m_put_l3_page(const lpae_t pte)
+static void p2m_put_l3_page(struct p2m_domain *p2m, const lpae_t pte)
 {
+    mfn_t mfn = lpae_get_mfn(pte);
+
     ASSERT(p2m_is_valid(pte));
 
     /*
@@ -731,11 +734,20 @@ static void p2m_put_l3_page(const lpae_t pte)
      */
     if ( p2m_is_foreign(pte.p2m.type) )
     {
-        mfn_t mfn = lpae_get_mfn(pte);
-
         ASSERT(mfn_valid(mfn));
         put_page(mfn_to_page(mfn));
     }
+
+#ifdef CONFIG_GRANT_TABLE
+    /*
+     * Check whether we deal with grant-table page which GFN is stored
+     * in the gnttab database, so also needs to be marked as invalid.
+     * As the grant-table page is xen_heap page and its entry has known
+     * p2m type, detect it and let the gnttab code do the job.
+     */
+    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
+        gnttab_clean_frame_gfn(p2m->domain, mfn);
+#endif
 }
 
 /* Free lpae sub-tree behind an entry */
@@ -768,7 +780,7 @@ static void p2m_free_entry(struct p2m_domain *p2m,
         p2m->stats.mappings[level]--;
         /* Nothing to do if the entry is a super-page. */
         if ( level == 3 )
-            p2m_put_l3_page(entry);
+            p2m_put_l3_page(p2m, entry);
         return;
     }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index fab77ab..4559524 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -4104,6 +4104,48 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
     return rc;
 }
 
+/*
+ * The only purpose of this function is to locate GFN corresponding to
+ * the passed MFN and remove it from the gnttab database.
+ */
+void gnttab_clean_frame_gfn(struct domain *d, mfn_t mfn)
+{
+    struct grant_table *gt = d->grant_table;
+    unsigned int i;
+    mfn_t tmp;
+
+    grant_write_lock(gt);
+
+    for ( i = 0; i < gt->max_grant_frames; i++ )
+    {
+        if ( gt->shared_raw[i] == NULL )
+            continue;
+
+        tmp = _mfn(virt_to_mfn(gt->shared_raw[i]));
+        if ( mfn_eq(tmp, mfn) )
+        {
+            gnttab_set_frame_gfn(gt, false, i, INVALID_GFN);
+            goto unlock;
+        }
+    }
+
+    for ( i = 0; i < grant_to_status_frames(gt->max_grant_frames); i++ )
+    {
+        if ( gt->status[i] == NULL )
+            continue;
+
+        tmp = _mfn(virt_to_mfn(gt->status[i]));
+        if ( mfn_eq(tmp, mfn) )
+        {
+            gnttab_set_frame_gfn(gt, true, i, INVALID_GFN);
+            goto unlock;
+        }
+    }
+
+unlock:
+    grant_write_unlock(gt);
+}
+
 static void gnttab_usage_print(struct domain *rd)
 {
     int first = 1;
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 9f8b7e6..62bae72 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -63,6 +63,8 @@ int gnttab_acquire_resource(
     struct domain *d, unsigned int id, unsigned int frame,
     unsigned int nr_frames, xen_pfn_t mfn_list[]);
 
+void gnttab_clean_frame_gfn(struct domain *d, mfn_t mfn);
+
 #else
 
 #define opt_max_grant_frames 0
@@ -108,6 +110,8 @@ static inline int gnttab_acquire_resource(
     return -EINVAL;
 }
 
+static inline void gnttab_clean_frame_gfn(struct domain *d, mfn_t mfn) {}
+
 #endif /* CONFIG_GRANT_TABLE */
 
 #endif /* __XEN_GRANT_TABLE_H__ */
-- 
2.7.4


