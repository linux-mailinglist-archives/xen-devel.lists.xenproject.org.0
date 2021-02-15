Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF60C31C475
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 00:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85388.160103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBnZt-0005sI-LH; Mon, 15 Feb 2021 23:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85388.160103; Mon, 15 Feb 2021 23:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBnZt-0005rt-GI; Mon, 15 Feb 2021 23:46:53 +0000
Received: by outflank-mailman (input) for mailman id 85388;
 Mon, 15 Feb 2021 23:46:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmGi=HR=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1lBnZs-0005qN-0D
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 23:46:52 +0000
Received: from aibo.runbox.com (unknown [91.220.196.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f471da53-0c34-4266-b0f5-992b90e3e36f;
 Mon, 15 Feb 2021 23:46:44 +0000 (UTC)
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1lBnZi-0000sc-HJ; Tue, 16 Feb 2021 00:46:42 +0100
Received: by submission01.runbox with esmtpsa [Authenticated alias (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lBnZY-0007iB-4j; Tue, 16 Feb 2021 00:46:32 +0100
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
X-Inumbo-ID: f471da53-0c34-4266-b0f5-992b90e3e36f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=sgze2FZO6yCdRuipkR7pE2WcN1p1yyBzt+7Q3Qr39S8=; b=Mq4G7D3yeew6G2d6PlTVZRMF2A
	PWFnsq5E1jdibEdTisiob2FtLL5/VoGqlBy+QpYG+Mcdb+IB3jeA1Vv57Wuh1F3irmZhEq+NBH7Ak
	ESYYpjA/GnGJ2pVYO9IE9wkix3ShdC4ZCAgFm0YxJoRRQFHnokhAzUZj6Xd+guOnCRwcKSrnZMqcV
	1ShtF/YlZ6/zuXzp1F3CHeRQILSTwOnvg4UbOXMwqFmlF5yAi/OfKAEUvmBuYKYw7cR5/Vq/ISp/A
	pExOYIJr5mBiSuw0F0vy+gIi8KUaXJg4D0hVfvkU4n1R9WH91rFiFutmHdp+tu6H1WtpEbiy9oMnU
	bmo7ohQw==;
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
To: xen-devel@lists.xenproject.org
Cc: m.v.b@runbox.com,
	marmarek@invisiblethingslab.com,
	roger.pau@citrix.com,
	jbeulich@suse.com
Subject: [PATCH 1/1] x86/ept: Fix buggy XSA-321 backport
Date: Mon, 15 Feb 2021 18:46:19 -0500
Message-Id: <20210215234619.245422-2-m.v.b@runbox.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215234619.245422-1-m.v.b@runbox.com>
References: <20210215234619.245422-1-m.v.b@runbox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit aims to fix commit a852040fe3ab ("x86/ept: flush cache when
modifying PTEs and sharing page tables"). The aforementioned commit is
for the stable-4.9 branch of Xen and is a backported version of commit
c23274fd0412 ("x86/ept: flush cache when modifying PTEs and sharing page
tables"), which was for Xen 4.14.0-rc5 and which fixes the security
issue reported by XSA-321.

Prior to the latter commit, the function atomic_write_ept_entry in Xen
4.14.y consisted mostly of a call to p2m_entry_modify followed by an
atomic replacement of a page table entry, and the latter commit adds
a call to iommu_sync_cache for a specific condition:

   static int atomic_write_ept_entry(struct p2m_domain *p2m,
                                     ept_entry_t *entryptr, ept_entry_t new,
                                     int level)
   {
       int rc = p2m_entry_modify(p2m, new.sa_p2mt, entryptr->sa_p2mt,
                                 _mfn(new.mfn), _mfn(entryptr->mfn), level + 1);

       if ( rc )
           return rc;

       write_atomic(&entryptr->epte, new.epte);

  +    /* snipped comment block */
  +    if ( !new.recalc && iommu_use_hap_pt(p2m->domain) )
  +        iommu_sync_cache(entryptr, sizeof(*entryptr));
  +
       return 0;
   }

However, the backport to Xen 4.9.y is a bit different because
atomic_write_ept_entry does not consist solely of a call to
p2m_entry_modify, which does not exist in Xen 4.9.y. I am quoting from
Xen 4.8.y for convenience:

   static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
                                     int level)
   {
       int rc;
       unsigned long oldmfn = mfn_x(INVALID_MFN);
       bool_t check_foreign = (new.mfn != entryptr->mfn ||
                               new.sa_p2mt != entryptr->sa_p2mt);

       if ( level )
       {
           ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
           write_atomic(&entryptr->epte, new.epte);
           return 0;
       }

       if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
       {
           rc = -EINVAL;
           if ( !is_epte_present(&new) )
                   goto out;

           if ( check_foreign )
           {
               struct domain *fdom;

               if ( !mfn_valid(new.mfn) )
                   goto out;

               rc = -ESRCH;
               fdom = page_get_owner(mfn_to_page(new.mfn));
               if ( fdom == NULL )
                   goto out;

               /* get refcount on the page */
               rc = -EBUSY;
               if ( !get_page(mfn_to_page(new.mfn), fdom) )
                   goto out;
           }
       }

       if ( unlikely(p2m_is_foreign(entryptr->sa_p2mt)) && check_foreign )
           oldmfn = entryptr->mfn;

       write_atomic(&entryptr->epte, new.epte);

  +    /* snipped comment block */
  +    if ( !new.recalc && iommu_hap_pt_share )
  +        iommu_sync_cache(entryptr, sizeof(*entryptr));
  +
       if ( unlikely(oldmfn != mfn_x(INVALID_MFN)) )
           put_page(mfn_to_page(oldmfn));

       rc = 0;

    out:
       if ( rc )
           gdprintk(XENLOG_ERR, "epte o:%"PRIx64" n:%"PRIx64" rc:%d\n",
                    entryptr->epte, new.epte, rc);
       return rc;
   }

Based on inspection of the p2m_entry_modify function in Xen 4.14.1, it
appears that the part of atomic_write_ept_entry above the call to
write_atomic is encapsulated by p2m_entry_modify, which uncovers one
issue with the backport: In Xen 4.14, if p2m_entry_modify returns early
without an error, then the calls to write_atomic and iommu_sync_cache
will still occur (assuming that the corresponding if condition is
satisfied), whereas in Xen 4.9.y, there is a code path that can skip the
call to iommu_sync_cache, in case the variable level is not zero:

  if ( level )
  {
     ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
     write_atomic(&entryptr->epte, new.epte);
     return 0;
  }

This patch reorganizes the atomic_write_ept_entry to ensure that the
call to iommu_sync_cache is not inadvertently skipped.

Furthermore, in Xen 4.14.1, p2m_entry_modify calls

  put_page(mfn_to_page(oldmfn));

before the potential call to iommu_sync_cache in atomic_write_ept_entry.
I am not sufficiently familiar with Xen to determine if this is a
significant behavioural change, but this patch makes Xen 4.9.y similar
to Xen 4.14.1 in that regard as well, by further re-organizing the code
in atomic_write_ept_entry.

The incorrect backport was detected with a software configuration
consisting of Qubes OS 4.0 running Xen 4.8.5 in conjunction with Linux
5.10.y. Linux 5.10.y has the recently introduced "unpopulated-alloc"
feature.

The "unpopulated-alloc" feature uncovered the following error message in
Xen's log buffer, whenever an HVM domain with PCI passthrough for a USB
controller exposed an external USB SSD's block device to a PVH domain
via xen-blkback/xen-blkfront, and whenever the PVH domain in question made
rapid write accesses to the exposed block device:

  [VT-D]DMAR:[DMA Read] Request device [0000:00:14.0] fault addr 38600000, iommu reg = ...
  [VT-D]DMAR: reason 06 - PTE Read access is not set

This was only observed when EPT page table sharing was enabled for the
IOMMU. Upon debugging this issue further, it was noticed that Xen 4.12.0
had the same issue, but Xen 4.12.4 did not. Bisection led to the commit
that fixed this issue, which was later discovered to not have been
backported correctly to Xen 4.9. This patch has been tested with Xen 4.8
and Qubes OS 4.0.

Signed-off-by: M. Vefa Bicakci <m.v.b@runbox.com>
---
 xen/arch/x86/mm/p2m-ept.c | 57 +++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 036771f43ccd..8492f4c1d321 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -48,7 +48,7 @@ static inline bool_t is_epte_valid(ept_entry_t *e)
 static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
                                   int level)
 {
-    int rc;
+    int rc = 0;
     unsigned long oldmfn = mfn_x(INVALID_MFN);
     bool_t check_foreign = (new.mfn != entryptr->mfn ||
                             new.sa_p2mt != entryptr->sa_p2mt);
@@ -56,37 +56,39 @@ static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
     if ( level )
     {
         ASSERT(!is_epte_superpage(&new) || !p2m_is_foreign(new.sa_p2mt));
-        write_atomic(&entryptr->epte, new.epte);
-        return 0;
-    }
-
-    if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
-    {
-        rc = -EINVAL;
-        if ( !is_epte_present(&new) )
-                goto out;
-
-        if ( check_foreign )
+    } else {
+        if ( unlikely(p2m_is_foreign(new.sa_p2mt)) )
         {
-            struct domain *fdom;
+            rc = -EINVAL;
+            if ( !is_epte_present(&new) )
+                    goto out;
 
-            if ( !mfn_valid(_mfn(new.mfn)) )
-                goto out;
+            if ( check_foreign )
+            {
+                struct domain *fdom;
 
-            rc = -ESRCH;
-            fdom = page_get_owner(mfn_to_page(new.mfn));
-            if ( fdom == NULL )
-                goto out;
+                if ( !mfn_valid(_mfn(new.mfn)) )
+                    goto out;
 
-            /* get refcount on the page */
-            rc = -EBUSY;
-            if ( !get_page(mfn_to_page(new.mfn), fdom) )
-                goto out;
+                rc = -ESRCH;
+                fdom = page_get_owner(mfn_to_page(new.mfn));
+                if ( fdom == NULL )
+                    goto out;
+
+                /* get refcount on the page */
+                rc = -EBUSY;
+                if ( !get_page(mfn_to_page(new.mfn), fdom) )
+                    goto out;
+            }
         }
-    }
 
-    if ( unlikely(p2m_is_foreign(entryptr->sa_p2mt)) && check_foreign )
-        oldmfn = entryptr->mfn;
+        if ( unlikely(p2m_is_foreign(entryptr->sa_p2mt)) && check_foreign )
+            oldmfn = entryptr->mfn;
+
+        if ( unlikely(oldmfn != mfn_x(INVALID_MFN)) )
+            put_page(mfn_to_page(oldmfn));
+
+    }
 
     write_atomic(&entryptr->epte, new.epte);
 
@@ -103,9 +105,6 @@ static int atomic_write_ept_entry(ept_entry_t *entryptr, ept_entry_t new,
     if ( !new.recalc && iommu_hap_pt_share )
         iommu_sync_cache(entryptr, sizeof(*entryptr));
 
-    if ( unlikely(oldmfn != mfn_x(INVALID_MFN)) )
-        put_page(mfn_to_page(oldmfn));
-
     rc = 0;
 
  out:
-- 
2.29.2


