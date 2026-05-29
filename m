Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE5NDPSKGWosxggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DB4602701
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322000.1588405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwck-0001zo-Uq; Fri, 29 May 2026 12:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322000.1588405; Fri, 29 May 2026 12:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwck-0001xK-R4; Fri, 29 May 2026 12:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1322000;
 Fri, 29 May 2026 12:47:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwcj-0001wS-Sn
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:47:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwcj-005WAo-9T
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:47:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198ae5-bab6-0a2a0a5309dd-0a2a4505ac7e-30
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:47:37 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198ae8-aaa8-0a2a45050019-a0658308bf90-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:47:37 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id C536C439EC36;
 Fri, 29 May 2026 08:46:31 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/7] xen/mm: device-tree: Widen static page counts to unsigned long
Date: Fri, 29 May 2026 13:43:59 +0100
Message-Id: <34af659daf1f1aaad7e4e355341875a7522d4594.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1780058857-E2F94443-F34F4712/0/0
X-purgate-type: clean
X-purgate-size: 4672
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: F2DB4602701
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As the domstatic memory plumbing supports unsigned long nr_mfns,
update the device tree handlers to no longer truncate to unsigned int:

- xen/common/device-tree/static-memory.c:
  - append_static_memory_to_bank() Widen nr_pages to unsigned long

- xen/common/device-tree/static-shmem.c:
  - process_shm(): Widen loop variable to unsigned long.

- xen/common/device-tree/dom0less-build.c, static-shmem.c,
  - alloc_xenstore_page() and acquire_shared_memory_bank():
    Update checks narrowing pages to UINT_MAX to ULONG_MAX.

- xen/arch/arm/include/asm/p2m.h: guest_physmap_add_pages():
  Accept and pass-through unsigned long nr_pages(used for static maps)

Already correct:
- struct paging_domain.p2m_total_pages is unsigned long.
- p2m_set_allocation() takes unsigned long pages.
- arch_get_paging_mempool_size() uses (uint64_t)... << PAGE_SHIFT.
- p2m_insert_mapping(), map_regions_p2mt(), unmap_regions_p2mt(),
  map_mmio_regions() and unmap_mmio_regions() all already take
  unsigned long nr.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/arch/arm/include/asm/p2m.h          | 2 +-
 xen/common/device-tree/dom0less-build.c | 2 +-
 xen/common/device-tree/static-memory.c  | 2 +-
 xen/common/device-tree/static-shmem.c   | 9 ++++-----
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 4a4913716bdd..f719b8f1291f 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -348,7 +348,7 @@ guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
 static inline int guest_physmap_add_pages(struct domain *d,
                                           gfn_t gfn,
                                           mfn_t mfn,
-                                          unsigned int nr_pages)
+                                          unsigned long nr_pages)
 {
     return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
 }
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index eacfd93087ae..16c72682db54 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -592,7 +592,7 @@ static int __init alloc_xenstore_page(struct domain *d)
     gfn_t gfn;
     int rc;
 
-    if ( (UINT_MAX - d->max_pages) < 1 )
+    if ( (ULONG_MAX - d->max_pages) < 1 )
     {
         printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages by 1 page.\n",
                d);
diff --git a/xen/common/device-tree/static-memory.c b/xen/common/device-tree/static-memory.c
index e04d6cc06505..3abc62f080e5 100644
--- a/xen/common/device-tree/static-memory.c
+++ b/xen/common/device-tree/static-memory.c
@@ -11,7 +11,7 @@ static bool __init append_static_memory_to_bank(struct domain *d,
                                                 paddr_t size)
 {
     int res;
-    unsigned int nr_pages = PFN_DOWN(size);
+    unsigned long nr_pages = PFN_DOWN(size);
     gfn_t sgfn;
 
     /*
diff --git a/xen/common/device-tree/static-shmem.c b/xen/common/device-tree/static-shmem.c
index 4c4cc1b123ac..64ed04e68487 100644
--- a/xen/common/device-tree/static-shmem.c
+++ b/xen/common/device-tree/static-shmem.c
@@ -96,7 +96,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
      * into domain_tot_pages().
      */
     nr_pfns = PFN_DOWN(psize);
-    if ( (UINT_MAX - d->max_pages) < nr_pfns )
+    if ( (ULONG_MAX - d->max_pages) < nr_pfns )
     {
         printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
                d, nr_pfns);
@@ -313,7 +313,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         uint32_t addr_cells;
         paddr_t gbase, pbase, psize;
         int ret = 0;
-        unsigned int i;
         const char *role_str;
         const char *shm_id;
 
@@ -362,11 +361,11 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                 return -EINVAL;
             }
 
-            for ( i = 0; i < PFN_DOWN(psize); i++ )
-                if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
+            for ( unsigned long page = 0; page < PFN_DOWN(psize); page++ )
+                if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), page)) )
                 {
                     printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
-                        d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
+                           d, mfn_x(mfn_add(maddr_to_mfn(pbase), page)));
                     return -EINVAL;
                 }
 
-- 
2.39.5


