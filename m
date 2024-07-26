Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416393D64D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765621.1176310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN3V-0003zp-J5; Fri, 26 Jul 2024 15:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765621.1176310; Fri, 26 Jul 2024 15:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXN3V-0003xy-GI; Fri, 26 Jul 2024 15:40:29 +0000
Received: by outflank-mailman (input) for mailman id 765621;
 Fri, 26 Jul 2024 15:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMvR-00084T-28
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:32:09 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37395fc1-4b64-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:32:07 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7a1dac7f0b7so50831785a.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:32:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fafa1aesm17379126d6.133.2024.07.26.08.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:32:05 -0700 (PDT)
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
X-Inumbo-ID: 37395fc1-4b64-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007926; x=1722612726; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N5uFSzBTQXjVPjBVWB2aNudK8NA3i5SjmiiCJAOxYs=;
        b=oJUF7bB8n4OBULxWBwN4LGtJjxxsUveUOVM5DApoLnlJ0tupXEOQul0zcUkoYpXNag
         sUH8FD9yt1KMl91ZLSeM81qjLj4Zyp659UgobctyLBsOEPclbbDVJbt7YUD3Jif4jd/l
         yyuKqTddDN5KyeA84f+Xr6Mgt+rBn0BmprsTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007926; x=1722612726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N5uFSzBTQXjVPjBVWB2aNudK8NA3i5SjmiiCJAOxYs=;
        b=TlxDlqg3UMXwRMe++gkspbAJ2jZUq0Rh7WlwhpeLZeKQA40XA8ltlgesTQvyb7f0hS
         8b8rle7xti14p1/7vvZFdQOHVhT0XEix+K1gPmUJ51ChRFZdhK/2+HPxEEKq/6zLP6qe
         zkt5q0Rd8nXYoKFvozRb8oXXm5sEtG0XCeAchFx838T6yQ8jydvHKbV8uYlF5w3KUJ1N
         Ax0v0kdudiOjYm9mbr4qGHqwTsASQBPT/0v5uJDEqKAh5mxfb8QBuJ3PEKm1UMvsPVKb
         CYBnOpUsag6jbfJrYOgz0ypYttBjQtJDjtvYYW7Yscjm/eQThzxY5COPHv4hSYUTIQRh
         w/4A==
X-Gm-Message-State: AOJu0Yw5F8GIS+TR+VVWnffh+oJeKBSNJjsv7nSHItcVDp3GL5xfvCDS
	8fWuZ8Wy+g2DKKXqHp05clNDKCI7QCed3PnYX6UtxSpTO7RlLkVvpjA40PW643UE6VEHWJfWVrh
	T
X-Google-Smtp-Source: AGHT+IF/3NRsMDjUgIjYnbPd2fhW6tsx++V1EFbAhEJKBkE/No/KxeQ0CEuKp6/ZZy6Hgd5ovaiF9g==
X-Received: by 2002:a05:6214:1247:b0:6b4:dd2a:aa44 with SMTP id 6a1803df08f44-6bb55a83e51mr2216066d6.37.1722007925575;
        Fri, 26 Jul 2024 08:32:05 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 18/22] x86/mm: allow modifying per-CPU entries of remote page-tables
Date: Fri, 26 Jul 2024 17:22:02 +0200
Message-ID: <20240726152206.28411-19-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for modifying the per-CPU page-tables entries of remote CPUs, this
will be required in order to setup the page-tables of CPUs before bringing them
up.  A restriction is added so that remote page-tables can only be modified as
long as the remote CPU is not yet online.

Non functional change, as there's no user introduced that modifies remote
page-tables.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Can be merged with previous patch?
---
 xen/arch/x86/include/asm/mm.h | 15 ++++++++++
 xen/arch/x86/mm.c             | 55 ++++++++++++++++++++++++++---------
 2 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 34407fb0af06..f883468b1a7c 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -637,4 +637,19 @@ void setup_perdomain_slot(const struct vcpu *v, root_pgentry_t *root_pgt);
 int allocate_perdomain_local_l3(unsigned int cpu);
 void free_perdomain_local_l3(unsigned int cpu);
 
+/* Specify the CPU idle root page-table to use for modifications. */
+int map_pages_to_xen_cpu(
+    unsigned long virt,
+    mfn_t mfn,
+    unsigned long nr_mfns,
+    unsigned int flags,
+    unsigned int cpu);
+int modify_xen_mappings_cpu(unsigned long s, unsigned long e, unsigned int nf,
+                            unsigned int cpu);
+static inline int destroy_xen_mappings_cpu(unsigned long s, unsigned long e,
+                                           unsigned int cpu)
+{
+    return modify_xen_mappings_cpu(s, e, _PAGE_NONE, cpu);
+}
+
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c468b46a9d1b..faf2d42745d1 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5021,9 +5021,8 @@ static DEFINE_SPINLOCK(map_pgdir_lock);
  * For virt_to_xen_lXe() functions, they take a linear address and return a
  * pointer to Xen's LX entry. Caller needs to unmap the pointer.
  */
-static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
+static l3_pgentry_t *virt_to_xen_l3e_cpu(unsigned long v, unsigned int cpu)
 {
-    unsigned int cpu = smp_processor_id();
     /* Called before idle_vcpu is populated, fallback to idle_pg_table. */
     root_pgentry_t *root_pgt = idle_vcpu[cpu] ?
         maddr_to_virt(idle_vcpu[cpu]->arch.cr3) : idle_pg_table;
@@ -5062,11 +5061,16 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
     return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
 }
 
-static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
+static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
+{
+    return virt_to_xen_l3e_cpu(v, smp_processor_id());
+}
+
+static l2_pgentry_t *virt_to_xen_l2e_cpu(unsigned long v, unsigned int cpu)
 {
     l3_pgentry_t *pl3e, l3e;
 
-    pl3e = virt_to_xen_l3e(v);
+    pl3e = virt_to_xen_l3e_cpu(v, cpu);
     if ( !pl3e )
         return NULL;
 
@@ -5100,11 +5104,11 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
     return map_l2t_from_l3e(l3e) + l2_table_offset(v);
 }
 
-static l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
+static l1_pgentry_t *virt_to_xen_l1e_cpu(unsigned long v, unsigned int cpu)
 {
     l2_pgentry_t *pl2e, l2e;
 
-    pl2e = virt_to_xen_l2e(v);
+    pl2e = virt_to_xen_l2e_cpu(v, cpu);
     if ( !pl2e )
         return NULL;
 
@@ -5220,17 +5224,18 @@ mfn_t xen_map_to_mfn(unsigned long va)
     return ret;
 }
 
-int map_pages_to_xen(
+int map_pages_to_xen_cpu(
     unsigned long virt,
     mfn_t mfn,
     unsigned long nr_mfns,
-    unsigned int flags)
+    unsigned int flags,
+    unsigned int cpu)
 {
     bool global = virt < PERCPU_VIRT_START ||
                   virt >= PERCPU_VIRT_SLOT(PERCPU_SLOTS);
     bool locking = system_state > SYS_STATE_boot && global;
     const cpumask_t *flush_mask = global ? &cpu_online_map
-                                         : cpumask_of(smp_processor_id());
+                                         : cpumask_of(cpu);
     l3_pgentry_t *pl3e = NULL, ol3e;
     l2_pgentry_t *pl2e = NULL, ol2e;
     l1_pgentry_t *pl1e, ol1e;
@@ -5257,6 +5262,9 @@ int map_pages_to_xen(
            (virt + nr_mfns * PAGE_SIZE >= PERCPU_VIRT_START &&
             virt + nr_mfns * PAGE_SIZE <  PERCPU_VIRT_SLOT(PERCPU_SLOTS)));
 
+    /* Only allow modifying remote page-tables if the CPU is not online. */
+    ASSERT(cpu == smp_processor_id() || !cpu_online(cpu));
+
     L3T_INIT(current_l3page);
 
     while ( nr_mfns != 0 )
@@ -5266,7 +5274,7 @@ int map_pages_to_xen(
         UNMAP_DOMAIN_PAGE(pl3e);
         UNMAP_DOMAIN_PAGE(pl2e);
 
-        pl3e = virt_to_xen_l3e(virt);
+        pl3e = virt_to_xen_l3e_cpu(virt, cpu);
         if ( !pl3e )
             goto out;
 
@@ -5391,7 +5399,7 @@ int map_pages_to_xen(
             free_xen_pagetable(l2mfn);
         }
 
-        pl2e = virt_to_xen_l2e(virt);
+        pl2e = virt_to_xen_l2e_cpu(virt, cpu);
         if ( !pl2e )
             goto out;
 
@@ -5437,7 +5445,7 @@ int map_pages_to_xen(
             /* Normal page mapping. */
             if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
             {
-                pl1e = virt_to_xen_l1e(virt);
+                pl1e = virt_to_xen_l1e_cpu(virt, cpu);
                 if ( pl1e == NULL )
                     goto out;
             }
@@ -5623,6 +5631,16 @@ int map_pages_to_xen(
     return rc;
 }
 
+int map_pages_to_xen(
+    unsigned long virt,
+    mfn_t mfn,
+    unsigned long nr_mfns,
+    unsigned int flags)
+{
+    return map_pages_to_xen_cpu(virt, mfn, nr_mfns, flags, smp_processor_id());
+}
+
+
 int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return map_pages_to_xen(virt, INVALID_MFN, nr_mfns, MAP_SMALL_PAGES);
@@ -5640,7 +5658,8 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  *
  * It is an error to call with present flags over an unpopulated range.
  */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings_cpu(unsigned long s, unsigned long e, unsigned int nf,
+                            unsigned int cpu)
 {
     bool global = s < PERCPU_VIRT_START ||
                   s >= PERCPU_VIRT_SLOT(PERCPU_SLOTS);
@@ -5658,6 +5677,9 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     ASSERT(global ||
            (e >= PERCPU_VIRT_START && e < PERCPU_VIRT_SLOT(PERCPU_SLOTS)));
 
+    /* Only allow modifying remote page-tables if the CPU is not online. */
+    ASSERT(cpu == smp_processor_id() || !cpu_online(cpu));
+
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     nf &= FLAGS_MASK;
@@ -5674,7 +5696,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         UNMAP_DOMAIN_PAGE(pl2e);
         UNMAP_DOMAIN_PAGE(pl3e);
 
-        pl3e = virt_to_xen_l3e(v);
+        pl3e = virt_to_xen_l3e_cpu(v, cpu);
         if ( !pl3e )
             goto out;
 
@@ -5927,6 +5949,11 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
 #undef flush_area
 
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+{
+    return modify_xen_mappings_cpu(s, e, nf, smp_processor_id());
+}
+
 int destroy_xen_mappings(unsigned long s, unsigned long e)
 {
     return modify_xen_mappings(s, e, _PAGE_NONE);
-- 
2.45.2


