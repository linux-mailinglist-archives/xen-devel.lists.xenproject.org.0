Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2440A09233
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869631.1281085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFDF-0002PK-3w; Fri, 10 Jan 2025 13:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869631.1281085; Fri, 10 Jan 2025 13:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFDF-0002O0-1F; Fri, 10 Jan 2025 13:38:09 +0000
Received: by outflank-mailman (input) for mailman id 869631;
 Fri, 10 Jan 2025 13:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOMD=UC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tWFDD-0001Tj-64
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:38:07 +0000
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com
 [136.143.188.55]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dec5cbd-cf58-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:38:05 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736516244589260.226896086339;
 Fri, 10 Jan 2025 05:37:24 -0800 (PST)
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
X-Inumbo-ID: 1dec5cbd-cf58-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736516248; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bge0Npc/yvPU1apIcJZbnCEPHtSDLNiWHQEes6IXzR11LFr2g+Rer8Mdno4C3hhz+AMo3UyWLb8U961X9X1weRlakrP3ZPJnbl6RsmZg+cWwirBv4UsEqOLh2eqYPs3r2mnvnZy0zK8AWUlA+Po2A1sagQYaz5fxuAXTWq+FWk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736516248; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TalMMxffA22obSkpHJA9+pUFlwopohYfLzoxicDrWAg=; 
	b=Bus479CXW8jQiMoj/E8VrbpfuMVq2MQnaeAKvoQx64BLfAD0JxSbzv2IU3yJBTDsEbW2jqjRb9XPDhGs1OlXILN43+cP1O32WQAD7lpjdUbfK0AOaRwxbYlYPuUHxpgXhJVMSJql8QDhXEcAWDCEAkDWH/1OIdpAgi/hDtAFkvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736516247;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=TalMMxffA22obSkpHJA9+pUFlwopohYfLzoxicDrWAg=;
	b=EtqP8zZ/pq3H7AitaRFXzFZTH43FLC3HWFT7sJfd/FOg7QNBWH85j+jj77GD863w
	dyYBxwdc/G6IBxFt3GITX+8RWkGrkvPVyHj6RFHFthpJZcGg7gUwIQHW9bHqUqRBXYi
	+zNblgrmL1eKYzXSFggPCviUYRcSZnfdizlrxn7k=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: openxt@googlegroups.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark6@baesystems.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] gnttab: make grant table v2 support configurable
Date: Fri, 10 Jan 2025 13:37:11 +0000
Message-Id: <20250110133711.3958202-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
References: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

If the v2 interface support is not required, disabling this option will remove
substantial amounts of unused code in a critical subsystem.

Disables the v2-only GNTTABOP_get_status_frames grant table op.

Authored-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 docs/misc/xen-command-line.pandoc |  4 +-
 xen/common/Kconfig                | 18 +++++++
 xen/common/compat/grant_table.c   |  4 ++
 xen/common/grant_table.c          | 86 ++++++++++++++++++++++++++++---
 4 files changed, 102 insertions(+), 10 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 08b0053f9c..61570308c5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1278,8 +1278,8 @@ does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
 
 Control various aspects of the grant table behaviour available to guests.
 
-* `max-ver` Select the maximum grant table version to offer to guests.  Valid
-version are 1 and 2.
+* `max-ver` Select the maximum grant table version to offer to guests. Only
+available when CONFIG_GRANT_TABLE_V2 is set. Valid version are 1 and 2.
 * `transitive` Permit or disallow the use of transitive grants.  Note that the
 use of grant table v2 without transitive grants is an ABI breakage from the
 guests point of view.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6166327f4d..378436ca2f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -23,6 +23,24 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config GRANT_TABLE_V2
+	bool "Grant table version 2 support" if EXPERT
+	depends on GRANT_TABLE && X86
+	help
+	  Grant table interface version 2 is not the default. It has never
+	  been implemented for ARM.
+
+	  The version 2 interface enables support for systems with large amounts
+	  of memory and some exotic grant primitives that are not in use by the
+	  supported PV drivers.
+
+	  Disabling this option reduces the amount of complex security-critical
+	  hypervisor code in a subsystem of Xen responsible for approximately
+	  5% of Xen Security Advisories.
+
+	  If you do not require large memory support, say N.
+	  If you are paranoid, say N. If unsure, say Y.
+
 config PDX_COMPRESSION
 	bool "PDX (Page inDeX) compression" if EXPERT && !X86 && !RISCV
 	default ARM || PPC
diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index bbb717bf64..03b99f99dd 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -296,6 +296,9 @@ int compat_grant_table_op(
             break;
 
         case GNTTABOP_get_status_frames:
+#ifndef CONFIG_GRANT_TABLE_V2
+            rc = -ENOSYS;
+#else
             if ( count != 1)
             {
                 rc = -EINVAL;
@@ -328,6 +331,7 @@ int compat_grant_table_op(
                 else
                     i = 1;
             }
+#endif
             break;
 
         default:
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index f70a5333d8..3a32e44f24 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -59,11 +59,13 @@ struct grant_table {
     /* Lock protecting the maptrack limit */
     spinlock_t            maptrack_lock;
     unsigned int          max_version;
+#ifdef CONFIG_GRANT_TABLE_V2
     /*
      * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
      * values are invalid.
      */
     unsigned int          gt_version;
+#endif
     /* Resource limits of the domain. */
     unsigned int          max_grant_frames;
     unsigned int          max_maptrack_frames;
@@ -83,7 +85,9 @@ struct grant_table {
     union {
         void **shared_raw;
         struct grant_entry_v1 **shared_v1;
+#ifdef CONFIG_GRANT_TABLE_V2
         union grant_entry_v2 **shared_v2;
+#endif
     };
     /* State grant table (see include/public/grant_table.h). */
     grant_status_t       **status;
@@ -178,11 +182,20 @@ static int cf_check parse_gnttab_max_maptrack_frames(const char *arg)
                               opt_max_maptrack_frames_val);
 }
 
+#ifdef CONFIG_GRANT_TABLE_V2
+
 #ifndef GNTTAB_MAX_VERSION
 #define GNTTAB_MAX_VERSION 2
 #endif
 #define get_gt_version(gt) ((gt)->gt_version)
 
+#else
+
+#define GNTTAB_MAX_VERSION 1
+#define get_gt_version(gt) 1
+
+#endif
+
 unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
 static bool __read_mostly opt_transitive_grants = true;
 #ifdef CONFIG_PV
@@ -193,7 +206,7 @@ static bool __ro_after_init opt_grant_transfer = true;
 
 static int __init cf_check parse_gnttab(const char *s)
 {
-    const char *ss, *e;
+    const char *ss;
     int val, rc = 0;
 
     do {
@@ -204,12 +217,17 @@ static int __init cf_check parse_gnttab(const char *s)
         if ( !strncmp(s, "max-ver:", 8) ||
              !strncmp(s, "max_ver:", 8) ) /* Alias for original XSA-226 patch */
         {
+#ifdef CONFIG_GRANT_TABLE_V2
+            const char *e;
             long ver = simple_strtol(s + 8, &e, 10);
 
             if ( e == ss && ver >= 1 && ver <= 2 )
                 opt_gnttab_max_version = ver;
             else
                 rc = -EINVAL;
+#else
+            no_config_param("GRANT_TABLE_V2", "max_ver", s, ss);
+#endif
         }
         else if ( (val = parse_boolean("transitive", s, ss)) >= 0 )
             opt_transitive_grants = val;
@@ -313,6 +331,8 @@ nr_maptrack_frames(struct grant_table *t)
     ((t)->shared_v1[(e)/SHGNT_PER_PAGE_V1][(e)%SHGNT_PER_PAGE_V1])
 
 /* Operations providing a single interface agnostic to grant table version */
+#ifdef CONFIG_GRANT_TABLE_V2
+
 #define SHGNT_PER_PAGE_V2 (PAGE_SIZE / sizeof(grant_entry_v2_t))
 #define shared_entry_v2(t, e) \
     ((t)->shared_v2[(e)/SHGNT_PER_PAGE_V2][(e)%SHGNT_PER_PAGE_V2])
@@ -330,6 +350,14 @@ nr_maptrack_frames(struct grant_table *t)
 #define status_entry(t, e) \
     ((t)->status[(e)/STGNT_PER_PAGE][(e)%STGNT_PER_PAGE])
 
+#else /* CONFIG_GRANT_TABLE_V2 */
+
+#define shared_entry_full_frame(gt, ref) ( shared_entry_v1((gt), (ref)).frame )
+#define set_shared_entry(gt, ref, val) \
+    ( shared_entry_v1((gt), (ref)).frame = (val) )
+#define status_addr(gt, ref, flags_addr) (flags_addr)
+
+#endif /* CONFIG_GRANT_TABLE_V2 */
 
 static grant_entry_header_t *
 shared_entry_header(struct grant_table *t, grant_ref_t ref)
@@ -341,10 +369,12 @@ shared_entry_header(struct grant_table *t, grant_ref_t ref)
         block_speculation();
         return (grant_entry_header_t*)&shared_entry_v1(t, ref);
 
+#ifdef CONFIG_GRANT_TABLE_V2
     case 2:
         /* Returned values should be independent of speculative execution */
         block_speculation();
         return &shared_entry_v2(t, ref).hdr;
+#endif
     }
 
     ASSERT_UNREACHABLE();
@@ -734,7 +764,7 @@ static unsigned int nr_grant_entries(struct grant_table *gt)
         /* Make sure we return a value independently of speculative execution */
         block_speculation();
         return f2e(nr_grant_frames(gt), 1);
-
+#ifdef CONFIG_GRANT_TABLE_V2
     case 2:
         BUILD_BUG_ON(f2e(INITIAL_NR_GRANT_FRAMES, 2) <
                      GNTTAB_NR_RESERVED_ENTRIES);
@@ -742,6 +772,7 @@ static unsigned int nr_grant_entries(struct grant_table *gt)
         /* Make sure we return a value independently of speculative execution */
         block_speculation();
         return f2e(nr_grant_frames(gt), 2);
+#endif
 #undef f2e
     }
 
@@ -834,6 +865,7 @@ done:
     return rc;
 }
 
+#ifdef CONFIG_GRANT_TABLE_V2
 static int _set_status_v2(const grant_entry_header_t *shah,
                           grant_status_t *status,
                           struct domain *rd,
@@ -918,7 +950,7 @@ static int _set_status_v2(const grant_entry_header_t *shah,
 done:
     return rc;
 }
-
+#endif
 
 static int _set_status(const grant_entry_header_t *shah,
                        grant_status_t *status,
@@ -929,11 +961,11 @@ static int _set_status(const grant_entry_header_t *shah,
                        int mapflag,
                        domid_t ldomid)
 {
-
-    if ( evaluate_nospec(rgt_version == 1) )
-        return _set_status_v1(shah, rd, act, readonly, mapflag, ldomid);
-    else
+#ifdef CONFIG_GRANT_TABLE_V2
+    if ( evaluate_nospec(rgt_version != 1) )
         return _set_status_v2(shah, status, rd, act, readonly, mapflag, ldomid);
+#endif
+    return _set_status_v1(shah, rd, act, readonly, mapflag, ldomid);
 }
 
 /*
@@ -1796,6 +1828,12 @@ static int
 gnttab_populate_status_frames(struct domain *d, struct grant_table *gt,
                               unsigned int req_nr_frames)
 {
+#ifndef CONFIG_GRANT_TABLE_V2
+    ASSERT_UNREACHABLE();
+
+    return 0;
+}
+#else
     unsigned int i;
     unsigned int req_status_frames;
 
@@ -1898,6 +1936,7 @@ gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
 
     return 0;
 }
+#endif
 
 /*
  * Grow the grant table. The caller must hold the grant table's
@@ -2010,7 +2049,9 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     percpu_rwlock_resource_init(&gt->lock, grant_rwlock);
     spin_lock_init(&gt->maptrack_lock);
 
+#ifdef CONFIG_GRANT_TABLE_V2
     gt->gt_version = 1;
+#endif
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
     gt->max_version = max_grant_version;
@@ -2518,12 +2559,14 @@ release_grant_for_copy(
         td = rd;
         trans_gref = gref;
     }
+#ifdef CONFIG_GRANT_TABLE_V2
     else
     {
         td = (act->src_domid == rd->domain_id)
              ? rd : knownalive_domain_from_domid(act->src_domid);
         trans_gref = act->trans_gref;
     }
+#endif
 
     if ( readonly )
     {
@@ -2613,6 +2656,7 @@ acquire_grant_for_copy(
         sha2 = NULL;
         status = &shah->flags;
     }
+#ifdef CONFIG_GRANT_TABLE_V2
     else
     {
         sha2 = &shared_entry_v2(rgt, gref);
@@ -2748,7 +2792,9 @@ acquire_grant_for_copy(
             act->is_sub_page = true;
         }
     }
-    else if ( !old_pin ||
+    else
+#endif
+    if ( !old_pin ||
               (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask))) )
     {
         if ( (rc = _set_status(shah, status, rd, get_gt_version(rgt), act,
@@ -3165,6 +3211,17 @@ static long
 gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
 {
     gnttab_set_version_t op;
+#ifndef CONFIG_GRANT_TABLE_V2
+
+    if ( copy_from_guest(&op, uop, 1) )
+        return -EFAULT;
+
+    if ( op.version == 1 )
+        return 0;
+
+    /* Behave as before set_version was introduced. */
+    return -ENOSYS;
+#else
     struct domain *currd = current->domain;
     struct grant_table *gt = currd->grant_table;
     grant_entry_v1_t reserved_entries[GNTTAB_NR_RESERVED_ENTRIES];
@@ -3309,8 +3366,10 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         res = -EFAULT;
 
     return res;
+#endif
 }
 
+#ifdef CONFIG_GRANT_TABLE_V2
 static long
 gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
                          unsigned int count)
@@ -3383,6 +3442,7 @@ gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
 
     return 0;
 }
+#endif
 
 static long
 gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
@@ -3471,6 +3531,7 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
         shared_entry_v1(gt, ref_a) = shared_entry_v1(gt, ref_b);
         shared_entry_v1(gt, ref_b) = shared;
     }
+#ifdef CONFIG_GRANT_TABLE_V2
     else
     {
         grant_entry_v2_t shared;
@@ -3485,6 +3546,7 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
         shared_entry_v2(gt, ref_b) = shared;
         status_entry(gt, ref_b) = status;
     }
+#endif
 
 out:
     if ( act_b != NULL )
@@ -3747,10 +3809,12 @@ long do_grant_table_op(
         rc = gnttab_set_version(guest_handle_cast(uop, gnttab_set_version_t));
         break;
 
+#ifdef CONFIG_GRANT_TABLE_V2
     case GNTTABOP_get_status_frames:
         rc = gnttab_get_status_frames(
             guest_handle_cast(uop, gnttab_get_status_frames_t), count);
         break;
+#endif
 
     case GNTTABOP_get_version:
         rc = gnttab_get_version(guest_handle_cast(uop, gnttab_get_version_t));
@@ -4054,6 +4118,7 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
         flags = sha1->flags;
         *gfn = _gfn(sha1->frame);
     }
+#ifdef CONFIG_GRANT_TABLE_V2
     else
     {
         const grant_entry_v2_t *sha2 = &shared_entry_v2(gt, ref);
@@ -4064,6 +4129,7 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
         else
            *gfn = _gfn(sha2->full_page.frame);
     }
+#endif
 
     if ( !rc && (flags & GTF_type_mask) != GTF_permit_access )
         rc = -ENXIO;
@@ -4080,6 +4146,9 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 static int gnttab_get_status_frame_mfn(struct domain *d,
                                        unsigned int idx, mfn_t *mfn)
 {
+#ifndef CONFIG_GRANT_TABLE_V2
+    ASSERT_UNREACHABLE();
+#else
     const struct grant_table *gt = d->grant_table;
 
     ASSERT(gt->gt_version == 2);
@@ -4113,6 +4182,7 @@ static int gnttab_get_status_frame_mfn(struct domain *d,
     /* Make sure idx is bounded wrt nr_status_frames */
     *mfn = _mfn(virt_to_mfn(
                 gt->status[array_index_nospec(idx, nr_status_frames(gt))]));
+#endif
     return 0;
 }
 
-- 
2.34.1


