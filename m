Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55807C8E833
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173860.1498875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDr-00080x-UQ; Thu, 27 Nov 2025 13:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173860.1498875; Thu, 27 Nov 2025 13:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDr-0007yg-QD; Thu, 27 Nov 2025 13:39:47 +0000
Received: by outflank-mailman (input) for mailman id 1173860;
 Thu, 27 Nov 2025 13:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y8U0=6D=bounce.vates.tech=bounce-md_30504962.6928549c.v1-94f196c9aa194aa6b0a8edddbab13cf8@srs-se1.protection.inumbo.net>)
 id 1vOcDp-0007Up-SZ
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:39:45 +0000
Received: from mail132-18.atl131.mandrillapp.com
 (mail132-18.atl131.mandrillapp.com [198.2.132.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88bb2a28-cb96-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 14:39:44 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-18.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHHbc717RzCf9XsX
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 13:39:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 94f196c9aa194aa6b0a8edddbab13cf8; Thu, 27 Nov 2025 13:39:40 +0000
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
X-Inumbo-ID: 88bb2a28-cb96-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764250781; x=1764520781;
	bh=rQY26kgkkzoiOQAz5X3ssTnjDr7t/ARczzg+WikxsQc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1KGYGl9CHuvdUZleL5NrvP8IpJFgzNkvAVw8mHLPX34C4tlTEBkN5A9eJrzcaas5J
	 0v9bQ6dilEMChuay10yb0gMlb7P4m2xurpiC8/8wJ5t75RppKRWCl5b3EI1jOfDfnr
	 1NbsE450xujjFvecCk44RpRLa7TQNkc0xVoU7uy7dXqRGZSKYzICMMkkPriTo18b1w
	 s8wzkbDyeTqJZO/L+uzxxtkgZipA0HjvpVjyPgAmWnmqNciiCzR5QBmMhTgIO1z7+r
	 YzsMWETTtLKrlogqwjztpqp/jAUmqxWC4qA4IzcVKeA0HvIZdC2i7W7or+P8rCqkm4
	 cDAB9uD3ZX02w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764250781; x=1764511281; i=teddy.astie@vates.tech;
	bh=rQY26kgkkzoiOQAz5X3ssTnjDr7t/ARczzg+WikxsQc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uIt+NxrfhOVCVEW0RN2Xfq0gCa/bwx0wJ9KRcHVXGn1qxvOXK+Md625UUr4PSxM1r
	 VpnBe630Ldep3hX7fke/C8joBhHuPDzUcdap4Uqhoe/T8WSSYHFrjRQAEK4z3sgGLG
	 C0wQdoCOABXIeIr+1dUf4jL9+HriDlusqaqhuLSih4rPeVfta4Xggyk6ji6VcxjrN0
	 x9tbRMi6ZUOJzKnTbVbpjVc3B6Yr1V79VnTINgPt8n3loCNoalCvah/+RY0vfM4VI0
	 t1jmJM+dtGGwmwtGmpuEUe3ZeGuaiJkrp0LWJirjtJVNpI/yafczbLB6momFWYiAFZ
	 6MUyv8aQfzOmg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=204/4]=20x86/hap:=20Migrate=20tlb=20flush=20logic=20to=20p2m->flush=5Ftlb?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764250780179
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <94bf385598cc7d70ecaecfae670e305581ad83b3.1764248710.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1764248710.git.teddy.astie@vates.tech>
References: <cover.1764248710.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.94f196c9aa194aa6b0a8edddbab13cf8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 13:39:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Now that p2m->need_flush is set when modifying the pagetable in a way that
requires it. We can move the tlb flush logic to p2m->tlb_flush.

Introduce hap_tlb_flush to do it, which is called by main p2m logic (e.g p2m_unlock,
p2m_tlb_flush_sync, ...). Drop inline calls of guest_flush_tlb_mask which are now
redundant with what now does p2m->flush_tlb, allowing us to drop guest_flush_tlb_*
as it is now unused.

No function change intended.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
I would like hap_p2m_tlb_flush() to use p2m->dirty_cpumask instead of
p2m->domain->dirty_cpumask. But p2m->dirty_cpumask is updated nowhere
in the current logic, so that doesn't work and p2m->domain->dirty_cpumask
is used instead (which works, even though it is less efficient with np2m).

 xen/arch/x86/flushtlb.c             | 15 ---------------
 xen/arch/x86/include/asm/flushtlb.h |  3 ---
 xen/arch/x86/include/asm/p2m.h      |  3 ---
 xen/arch/x86/mm/hap/hap.c           | 14 +++-----------
 xen/arch/x86/mm/hap/nested_hap.c    |  7 +------
 xen/arch/x86/mm/nested.c            |  2 +-
 xen/arch/x86/mm/p2m-pt.c            | 10 ++--------
 xen/arch/x86/mm/p2m.c               |  2 --
 8 files changed, 7 insertions(+), 49 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 09e676c151..48e0142848 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -320,18 +320,3 @@ void cache_writeback(const void *addr, unsigned int size)
     asm volatile ("sfence" ::: "memory");
 }
 
-unsigned int guest_flush_tlb_flags(const struct domain *d)
-{
-    bool shadow = paging_mode_shadow(d);
-    bool asid = is_hvm_domain(d) && (cpu_has_svm || shadow);
-
-    return (shadow ? FLUSH_TLB : 0) | (asid ? FLUSH_HVM_ASID_CORE : 0);
-}
-
-void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
-{
-    unsigned int flags = guest_flush_tlb_flags(d);
-
-    if ( flags )
-        flush_mask(mask, flags);
-}
diff --git a/xen/arch/x86/include/asm/flushtlb.h b/xen/arch/x86/include/asm/flushtlb.h
index 7bcbca2b7f..5be6c4e08d 100644
--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -190,7 +190,4 @@ void flush_area_mask(const cpumask_t *mask, const void *va,
 
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
 
-unsigned int guest_flush_tlb_flags(const struct domain *d);
-void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
-
 #endif /* __FLUSHTLB_H__ */
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 9016e88411..9ee79c9d39 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -886,9 +886,6 @@ void np2m_flush_base(struct vcpu *v, unsigned long np2m_base);
 void hap_p2m_init(struct p2m_domain *p2m);
 void shadow_p2m_init(struct p2m_domain *p2m);
 
-void cf_check nestedp2m_write_p2m_entry_post(
-    struct p2m_domain *p2m, unsigned int oflags);
-
 #ifdef CONFIG_ALTP2M
 
 /*
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 2f69ff9c7b..58254c3039 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -105,8 +105,6 @@ int hap_track_dirty_vram(struct domain *d,
             p2m_change_type_range(d, begin_pfn, begin_pfn + nr_frames,
                                   p2m_ram_rw, p2m_ram_logdirty);
 
-            guest_flush_tlb_mask(d, d->dirty_cpumask);
-
             memset(dirty_bitmap, 0xff, size); /* consider all pages dirty */
         }
         else
@@ -191,7 +189,6 @@ static int cf_check hap_enable_log_dirty(struct domain *d)
      * to be read-only, or via hardware-assisted log-dirty.
      */
     p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
 
     return 0;
 }
@@ -220,7 +217,6 @@ static void cf_check hap_clean_dirty_bitmap(struct domain *d)
      * be read-only, or via hardware-assisted log-dirty.
      */
     p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 /************************************************/
@@ -806,18 +802,14 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
     put_gfn(d, cr3_gfn);
 }
 
-static void cf_check
-hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
+void hap_p2m_tlb_flush(struct p2m_domain *p2m)
 {
-    struct domain *d = p2m->domain;
-
-    if ( oflags & _PAGE_PRESENT )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
+    flush_mask(p2m->domain->dirty_cpumask, FLUSH_HVM_ASID_CORE);
 }
 
 void hap_p2m_init(struct p2m_domain *p2m)
 {
-    p2m->write_p2m_entry_post = hap_write_p2m_entry_post;
+    p2m->tlb_flush = hap_p2m_tlb_flush;
 }
 
 static unsigned long cf_check hap_gva_to_gfn_real_mode(
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index 255fba7e1c..2b4ccc0c81 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -58,12 +58,7 @@
 /*        NESTED VIRT P2M FUNCTIONS         */
 /********************************************/
 
-void cf_check
-nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
-{
-    if ( oflags & _PAGE_PRESENT )
-        guest_flush_tlb_mask(p2m->domain, p2m->dirty_cpumask);
-}
+/* None */
 
 /********************************************/
 /*          NESTED VIRT FUNCTIONS           */
diff --git a/xen/arch/x86/mm/nested.c b/xen/arch/x86/mm/nested.c
index 03741ffae4..ac5d990c6c 100644
--- a/xen/arch/x86/mm/nested.c
+++ b/xen/arch/x86/mm/nested.c
@@ -38,7 +38,7 @@ int p2m_init_nestedp2m(struct domain *d)
         }
         p2m->p2m_class = p2m_nested;
         p2m->write_p2m_entry_pre = NULL;
-        p2m->write_p2m_entry_post = nestedp2m_write_p2m_entry_post;
+        p2m->write_p2m_entry_post = NULL;
         list_add(&p2m->np2m_list, &p2m_get_hostp2m(d)->np2m_list);
     }
 
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 1fea3884be..24918d09e6 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -941,7 +941,7 @@ static void cf_check p2m_pt_change_entry_type_global(
 {
     l1_pgentry_t *tab;
     unsigned long gfn = 0;
-    unsigned int i, changed;
+    unsigned int i;
     const struct domain *d = p2m->domain;
 
     if ( pagetable_get_pfn(p2m_get_pagetable(p2m)) == 0 )
@@ -950,7 +950,7 @@ static void cf_check p2m_pt_change_entry_type_global(
     ASSERT(hap_enabled(d));
 
     tab = map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
-    for ( changed = i = 0; i < (1 << PAGETABLE_ORDER); ++i )
+    for ( i = 0; i < (1 << PAGETABLE_ORDER); ++i )
     {
         l1_pgentry_t e = tab[i];
 
@@ -966,14 +966,10 @@ static void cf_check p2m_pt_change_entry_type_global(
                 ASSERT_UNREACHABLE();
                 break;
             }
-            ++changed;
         }
         gfn += 1UL << (L4_PAGETABLE_SHIFT - PAGE_SHIFT);
     }
     unmap_domain_page(tab);
-
-    if ( changed )
-         guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 static int cf_check p2m_pt_change_entry_type_range(
@@ -1185,5 +1181,3 @@ void p2m_pt_init(struct p2m_domain *p2m)
     p2m->audit_p2m = p2m_pt_audit_p2m;
 #endif
 }
-
-
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 98f8272270..bbdc20cbd9 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2187,8 +2187,6 @@ void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
             dirty_bitmap[i >> 3] |= (1 << (i & 7));
 
     p2m_unlock(p2m);
-
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 /*
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


