Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA298684D3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 01:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685835.1067203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rekv0-0005gH-SJ; Tue, 27 Feb 2024 00:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685835.1067203; Tue, 27 Feb 2024 00:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rekv0-0005d4-Og; Tue, 27 Feb 2024 00:01:58 +0000
Received: by outflank-mailman (input) for mailman id 685835;
 Tue, 27 Feb 2024 00:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=15Q7=KE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rekuy-0005cy-Lv
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 00:01:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3690d4-d503-11ee-8a58-1f161083a0e0;
 Tue, 27 Feb 2024 01:01:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14D536136C;
 Tue, 27 Feb 2024 00:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7EFC433C7;
 Tue, 27 Feb 2024 00:01:50 +0000 (UTC)
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
X-Inumbo-ID: 6a3690d4-d503-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708992112;
	bh=WHm2jyxlCXyjW+R4esnXtFh6rU+brq2dUnlQPZLjxg0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gK5jRHNkSpsvb7pcLqCMKPMG9jVFhJg68gmgFHnCMWAPdnSoergDzLRWKA6ljO1DP
	 ut5Gb+VXxDfyXCf22DBEn8zTbv63se4YJpDDWWj59Uxu3loUITwV79+drAMwcD8b6J
	 faJ0scQTqKaNfXhfNDWGVcenIyNatSmRgviwYq7JvAf6J16+IEi/jJ2kVNkWBrK0Aa
	 WWoeQmWjRIceOu7PfeZ6QVGm3Fd8ZfYv4G8WfvPzbDkgmfwBDG2GhHrYVwLGTpaBOf
	 tFkzGHm+PsgFlNfHQK3RlKS/OpEIN0w1YOpZ+I71LXE8p5JVLjMtVx5Q1milJYKp/D
	 pUkmnku5GArVA==
Date: Mon, 26 Feb 2024 16:01:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
In-Reply-To: <fb460b92d758891c1de42f7e588d5ffb@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402261553140.247676@ubuntu-linux-20-04-desktop>
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com> <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com> <alpine.DEB.2.22.394.2402231502540.754277@ubuntu-linux-20-04-desktop>
 <fb460b92d758891c1de42f7e588d5ffb@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 24 Feb 2024, Nicola Vetrini wrote:
> Hi Stefano,
> 
> On 2024-02-24 00:05, Stefano Stabellini wrote:
> > On Fri, 23 Feb 2024, Nicola Vetrini wrote:
> > > On 2024-02-19 16:14, Nicola Vetrini wrote:
> > > > The cache clearing and invalidation helpers in x86 and Arm didn't
> > > > comply with MISRA C Rule 17.7: "The value returned by a function
> > > > having non-void return type shall be used". On Arm they
> > > > were always returning 0, while some in x86 returned -EOPNOTSUPP
> > > > and in common/grant_table the return value is saved.
> > > >
> > > > As a consequence, a common helper arch_grant_cache_flush that returns
> > > > an integer is introduced, so that each architecture can choose whether
> > > to
> > > > return an error value on certain conditions, and the helpers have either
> > > > been changed to return void (on Arm) or deleted entirely (on x86).
> > > >
> > > > Signed-off-by: Julien Grall <julien@xen.org>
> > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > ---
> > > > The original refactor idea came from Julien Grall in [1]; I edited that
> > > > proposal
> > > > to fix build errors.
> > > >
> > > > I did introduce a cast to void for the call to flush_area_local on x86,
> > > > because
> > > > even before this patch the return value of that function wasn't checked
> > > in
> > > > all
> > > > but one use in x86/smp.c, and in this context the helper (perhaps
> > > > incidentally)
> > > > ignored the return value of flush_area_local.
> > > >
> > > > [1]
> > > >
> > > https://lore.kernel.org/xen-devel/09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org/
> > > > ---
> > > >  xen/arch/arm/include/asm/page.h     | 33 ++++++++++++++++++-----------
> > > >  xen/arch/x86/include/asm/flushtlb.h | 23 ++++++++++----------
> > > >  xen/common/grant_table.c            |  9 +-------
> > > >  3 files changed, 34 insertions(+), 31 deletions(-)
> > > >
> > > 
> > > I'll put this patch in the backlog at the moment: too many intricacies
> > > while
> > > trying to untangle xen/flushtlb from xen/mm.h, and there are easier cases
> > > that
> > > can be done faster. If someone is interested I can post the partial work
> > > I've
> > > done so far, even though it doesn't
> > > build on x86.
> > 
> > I understand that the blocker is:
> > 
> > diff --git a/xen/arch/arm/include/asm/page.h
> > b/xen/arch/arm/include/asm/page.h
> > index 69f817d1e6..e90c9de361 100644
> > --- a/xen/arch/arm/include/asm/page.h
> > +++ b/xen/arch/arm/include/asm/page.h
> > @@ -123,6 +123,7 @@
> > 
> >  #ifndef __ASSEMBLY__
> > 
> > +#include <public/grant_table.h>
> >  #include <xen/errno.h>
> >  #include <xen/types.h>
> >  #include <xen/lib.h>
> > 
> > 
> > And the headers disentagling required to solve it, right?
> > 
> > 
> > Let me ask a silly question. public/grant_table.h seems needed by
> > arch_grant_cache_flush. Can we move arch_grant_cache_flush somewhere
> > else? It is not like page.h is a perfect fit for it anyway.
> > 
> > For instance, can we move it to
> > 
> > xen/arch/arm/include/asm/grant_table.h
> > 
> > ?
> 
> Yes, this is what was suggested and what I was trying to accomplish.
> Basically my plan is:
> 
> 1. move the arch_grant_cache_flush helper to asm/grant_table.h for both
> architectures
> 2. pull out of xen/mm.h this hunk (note the inclusion of asm/flushtlb in the
> middle of the file) because there is a build error on tlbflush_current_time()
> induced in some .c file (don't remember which) by the earlier movement

It looks like it would be easier to resolve the build error on
tlbflush_current_time() in another way. What's the build error exactly?
Looking at the implementation of tlbflush_current_time on the various
arches I couldn't find any potential issues.

I just moved the implementation of arch_grant_cache_flush to arch
specific headers and it seemed to have worked for me. See below. Maybe I
am building with a different kconfig.


diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d3c518a926..2c5c07e061 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -76,6 +76,20 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
 #define gnttab_need_iommu_mapping(d)                    \
     (is_domain_direct_mapped(d) && is_iommu_enabled(d))
 
+static inline int arch_grant_cache_flush(unsigned int op, const void *p,
+                                         unsigned long size)
+{
+    if ( (op & GNTTAB_CACHE_INVAL) && (op & GNTTAB_CACHE_CLEAN) )
+        clean_and_invalidate_dcache_va_range(p, size);
+    else if ( op & GNTTAB_CACHE_INVAL )
+        invalidate_dcache_va_range(p, size);
+    else if ( op & GNTTAB_CACHE_CLEAN )
+        clean_dcache_va_range(p, size);
+
+    /* ARM callers assume that dcache_* functions cannot fail. */
+    return 0;
+}
+
 #endif /* __ASM_GRANT_TABLE_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 69f817d1e6..aea692a24d 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -159,13 +159,13 @@ static inline size_t read_dcache_line_bytes(void)
  * if 'range' is large enough we might want to use model-specific
  * full-cache flushes. */
 
-static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
+static inline void invalidate_dcache_va_range(const void *p, unsigned long size)
 {
     size_t cacheline_mask = dcache_line_bytes - 1;
     unsigned long idx = 0;
 
     if ( !size )
-        return 0;
+        return;
 
     /* Passing a region that wraps around is illegal */
     ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
@@ -188,17 +188,15 @@ static inline int invalidate_dcache_va_range(const void *p, unsigned long size)
         asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p + idx));
 
     dsb(sy);           /* So we know the flushes happen before continuing */
-
-    return 0;
 }
 
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
+static inline void clean_dcache_va_range(const void *p, unsigned long size)
 {
     size_t cacheline_mask = dcache_line_bytes - 1;
     unsigned long idx = 0;
 
     if ( !size )
-        return 0;
+        return;
 
     /* Passing a region that wraps around is illegal */
     ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
@@ -211,18 +209,16 @@ static inline int clean_dcache_va_range(const void *p, unsigned long size)
             idx += dcache_line_bytes, size -= dcache_line_bytes )
         asm volatile (__clean_dcache_one(0) : : "r" (p + idx));
     dsb(sy);           /* So we know the flushes happen before continuing */
-    /* ARM callers assume that dcache_* functions cannot fail. */
-    return 0;
 }
 
-static inline int clean_and_invalidate_dcache_va_range
+static inline void clean_and_invalidate_dcache_va_range
     (const void *p, unsigned long size)
 {
     size_t cacheline_mask = dcache_line_bytes - 1;
     unsigned long idx = 0;
 
     if ( !size )
-        return 0;
+        return;
 
     /* Passing a region that wraps around is illegal */
     ASSERT(((uintptr_t)p + size - 1) >= (uintptr_t)p);
@@ -235,8 +231,6 @@ static inline int clean_and_invalidate_dcache_va_range
             idx += dcache_line_bytes, size -= dcache_line_bytes )
         asm volatile (__clean_and_invalidate_dcache_one(0) : : "r" (p + idx));
     dsb(sy);         /* So we know the flushes happen before continuing */
-    /* ARM callers assume that dcache_* functions cannot fail. */
-    return 0;
 }
 
 /* Macros for flushing a single small item.  The predicate is always
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index bb0ad58db4..d0c9120b5f 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -182,21 +182,6 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 }
 
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
-static inline int invalidate_dcache_va_range(const void *p,
-                                             unsigned long size)
-{ return -EOPNOTSUPP; }
-static inline int clean_and_invalidate_dcache_va_range(const void *p,
-                                                       unsigned long size)
-{
-    unsigned int order = get_order_from_bytes(size);
-    /* sub-page granularity support needs to be added if necessary */
-    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
-    return 0;
-}
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
-{
-    return clean_and_invalidate_dcache_va_range(p, size);
-}
 
 unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
diff --git a/xen/arch/x86/include/asm/grant_table.h b/xen/arch/x86/include/asm/grant_table.h
index 5c23cec90c..60a6dbb231 100644
--- a/xen/arch/x86/include/asm/grant_table.h
+++ b/xen/arch/x86/include/asm/grant_table.h
@@ -72,4 +72,20 @@ static inline void gnttab_clear_flags(struct domain *d,
 #define gnttab_need_iommu_mapping(d)                \
     (!paging_mode_translate(d) && need_iommu_pt_sync(d))
 
+static inline int arch_grant_cache_flush(unsigned int op, const void *p,
+                                     unsigned long size)
+{
+    unsigned int order;
+
+    if ( !(op & GNTTAB_CACHE_CLEAN) )
+        return -EOPNOTSUPP;
+
+    order = get_order_from_bytes(size);
+    /* sub-page granularity support needs to be added if necessary */
+    (void) flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
+
+    return 0;
+}
+
+
 #endif /* __ASM_GRANT_TABLE_H__ */
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 37b178a67b..0df663944f 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3575,14 +3575,7 @@ static int _cache_flush(const gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref
     v = map_domain_page(mfn);
     v += cflush->offset;
 
-    if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op & GNTTAB_CACHE_CLEAN) )
-        ret = clean_and_invalidate_dcache_va_range(v, cflush->length);
-    else if ( cflush->op & GNTTAB_CACHE_INVAL )
-        ret = invalidate_dcache_va_range(v, cflush->length);
-    else if ( cflush->op & GNTTAB_CACHE_CLEAN )
-        ret = clean_dcache_va_range(v, cflush->length);
-    else
-        ret = 0;
+    ret = arch_grant_cache_flush(cflush->op, v, cflush->length);
 
     if ( d != owner )
     {

