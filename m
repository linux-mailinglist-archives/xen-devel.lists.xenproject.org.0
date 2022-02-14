Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639E4B511E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271718.466403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3h-0001Ir-FB; Mon, 14 Feb 2022 13:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271718.466403; Mon, 14 Feb 2022 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3g-00012f-KQ; Mon, 14 Feb 2022 13:06:24 +0000
Received: by outflank-mailman (input) for mailman id 271718;
 Mon, 14 Feb 2022 13:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2k-0008IH-St
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:27 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c59298a3-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:25 +0100 (CET)
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
X-Inumbo-ID: c59298a3-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=+QYHYC1eoLvldjqb5KMKNFpB/QJHZdfvkMfW0IB8GJg=;
  b=dGvbwJFzOxIeHii8yWuBpkvNvhVzYnZ+oU13Iq9gSWMpQr2zNdIBaYQP
   /vkHN0FUCsVsBO0fvn4QRP3GsEjLwhDjRZcUJVaxVwKU2MCxoJWDQP0zR
   9IV3RRM1Z9gtFaiDfvmHUkpNX57OMSSl9HPtNyDy5N71Gwh3y1Gd3JWPm
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C6Sv2M/yMcWd5uk1UcVDDsDlml2D6fzDMx2LjXFX52Hu9QcWv5sN1dhPbLEi68L49qxmoEgCSk
 yvWMjaeEkbh7r1Pis63iSkFgz1w1dFHGKumlxMMtLzmsQV9fuWLDvBTZL56fVzCOyx49k8uWMc
 t5kkzd4P0s8gP/v/XGfuSa1ajMmeB2+iYoUKgyEQZ26NqWBgxFIImxEYGwni5cHzuQ8TUv+BZg
 SP16gzy3ciunaSBTwwOPWs+wgXEsNFMl1cxmM/iOT7lXFdcHHDcctELGf2Z9TksMuLV8BIS1Fe
 MGQCxQVVzbXcpKjIwtfoVggD
X-SBRS: 5.1
X-MesageID: 64149812
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wPpoL6JAo3pq/N8yFE+R95IlxSXFcZb7ZxGr2PjKsXjdYENSgWBVy
 TAXDT+POvnZYjT2e412OtmzoB5SsJPSm95qTQJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3OutpP0
 I1A7aecbj0nY4jKw9Q+UUFhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gls35wfTa+ED
 yYfQQVvVRHjexkQBlNNT9Ewv9maiFDvbjIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3P8hPOHkhazA+lzD
 HYapw8o9pgR9hSSG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9FCrFnop4uw9eLsT8wYUqQSYfBTUI7ND4yG3YpkKeF40zeEJZYzCcJN0R/
 9xohHVk71nwpZRSv0lewbwgq2jyzqUltiZvum3qspiZxg14fpW5QIej9ELW6/1NRK7AEAXd4
 yhUxpXGtbtUZX1oqMBqaL9TdIxFGt7faGGM6bKRN8VJG8uRF46LItkLvWAWyLZBOccYYz75C
 HI/SisKjKK/yECCNPctC6roUpxC5fG5SbzNC6CFBvITM8MZXFLWo0lTibu4gjmFuFIyips2J
 ZrzWZ/qVR72/4w8l2HoLwrcuJd2rh0DKZT7G8ylkUT9jOb2ibz8Ye5tDWZip9sRtMusyDg5O
 f4FXydT4xkAAuD4fAfN9osfcQIDIXQhXMikoM1LbO+TZAFhHTh5WfPWxLogfa1jnrhUybiUr
 i3sBBcAxQqtn2DDJCWLdmtnNOHlU6FgoC9pJicrJ1uphSQuON798KcFepIrVrA77+g/n+VsR
 vwIdpzYUPRCQzjK4RoHapz5oNAwfRinn1vWbSGkfCI+b9hrQAmQoo3oeQ7m9S8vCCurtJRh/
 +38h12DGZdaHlZsFsfbbv6r3midh3lFlbIgRVbML/lSZF7orNpgJRvug6JlOMoLMxjCmGeXj
 l7EHRcCqODRiIYp692V17ucpoKkHuYiTEpXG27XseS/OSXApzfxxIZBVKCDfCzHVXOy86KnP
 L0Hw/b5OfwBvVBLr4sjTOo7kfNgv4Pi9+1A0wBpPHTXdFD6WLpvL06P0dRLqqAQlKRSvhG7W
 x7X99RXUVlT1BgJzLLFyNIZU9m+
IronPort-HdrOrdr: A9a23:Qa61dqnU6+TUEIgrYkd11ElM9YjpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149812"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 50/70] x86/p2m: CFI hardening
Date: Mon, 14 Feb 2022 12:51:07 +0000
Message-ID: <20220214125127.17985-51-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/p2m.h   |  4 ++--
 xen/arch/x86/mm/hap/hap.c        |  2 +-
 xen/arch/x86/mm/hap/nested_hap.c |  2 +-
 xen/arch/x86/mm/p2m-ept.c        | 32 +++++++++++++++-----------------
 xen/arch/x86/mm/p2m-pt.c         | 19 +++++++++----------
 5 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 6e2206874d62..787374426371 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -820,8 +820,8 @@ void np2m_flush_base(struct vcpu *v, unsigned long np2m_base);
 void hap_p2m_init(struct p2m_domain *p2m);
 void shadow_p2m_init(struct p2m_domain *p2m);
 
-void nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m,
-                                    unsigned int oflags);
+void cf_check nestedp2m_write_p2m_entry_post(
+    struct p2m_domain *p2m, unsigned int oflags);
 
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 9d67a47f5fe9..c19e337d6585 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -778,7 +778,7 @@ static void cf_check hap_update_paging_modes(struct vcpu *v)
     put_gfn(d, cr3_gfn);
 }
 
-static void
+static void cf_check
 hap_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
 {
     struct domain *d = p2m->domain;
diff --git a/xen/arch/x86/mm/hap/nested_hap.c b/xen/arch/x86/mm/hap/nested_hap.c
index d8a7b3b40167..dbe5ad23a112 100644
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -71,7 +71,7 @@
 /*        NESTED VIRT P2M FUNCTIONS         */
 /********************************************/
 
-void
+void cf_check
 nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
 {
     if ( oflags & _PAGE_PRESENT )
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index a8a6ad629528..70a401c3a7ea 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -624,7 +624,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
  * - zero if no adjustment was done,
  * - a positive value if at least one adjustment was done.
  */
-static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
+static int cf_check resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
 {
     struct ept_data *ept = &p2m->ept;
     unsigned int level = ept->wl;
@@ -793,7 +793,7 @@ bool_t ept_handle_misconfig(uint64_t gpa)
  *
  * Returns: 0 for success, -errno for failure
  */
-static int
+static int cf_check
 ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
               unsigned int order, p2m_type_t p2mt, p2m_access_t p2ma,
               int sve)
@@ -1002,10 +1002,9 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
 }
 
 /* Read ept p2m entries */
-static mfn_t ept_get_entry(struct p2m_domain *p2m,
-                           gfn_t gfn_, p2m_type_t *t, p2m_access_t* a,
-                           p2m_query_t q, unsigned int *page_order,
-                           bool_t *sve)
+static mfn_t cf_check ept_get_entry(
+    struct p2m_domain *p2m, gfn_t gfn_, p2m_type_t *t, p2m_access_t *a,
+    p2m_query_t q, unsigned int *page_order, bool *sve)
 {
     ept_entry_t *table =
         map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
@@ -1165,8 +1164,8 @@ void ept_walk_table(struct domain *d, unsigned long gfn)
     return;
 }
 
-static void ept_change_entry_type_global(struct p2m_domain *p2m,
-                                         p2m_type_t ot, p2m_type_t nt)
+static void cf_check ept_change_entry_type_global(
+    struct p2m_domain *p2m, p2m_type_t ot, p2m_type_t nt)
 {
     unsigned long mfn = p2m->ept.mfn;
 
@@ -1177,10 +1176,9 @@ static void ept_change_entry_type_global(struct p2m_domain *p2m,
         ept_sync_domain(p2m);
 }
 
-static int ept_change_entry_type_range(struct p2m_domain *p2m,
-                                       p2m_type_t ot, p2m_type_t nt,
-                                       unsigned long first_gfn,
-                                       unsigned long last_gfn)
+static int cf_check ept_change_entry_type_range(
+    struct p2m_domain *p2m, p2m_type_t ot, p2m_type_t nt,
+    unsigned long first_gfn, unsigned long last_gfn)
 {
     unsigned int i, wl = p2m->ept.wl;
     unsigned long mask = (1 << EPT_TABLE_ORDER) - 1;
@@ -1224,7 +1222,7 @@ static int ept_change_entry_type_range(struct p2m_domain *p2m,
     return rc < 0 ? rc : 0;
 }
 
-static void ept_memory_type_changed(struct p2m_domain *p2m)
+static void cf_check ept_memory_type_changed(struct p2m_domain *p2m)
 {
     unsigned long mfn = p2m->ept.mfn;
 
@@ -1283,7 +1281,7 @@ void ept_sync_domain(struct p2m_domain *p2m)
     ept_sync_domain_mask(p2m, d->dirty_cpumask);
 }
 
-static void ept_tlb_flush(struct p2m_domain *p2m)
+static void cf_check ept_tlb_flush(struct p2m_domain *p2m)
 {
     ept_sync_domain_mask(p2m, p2m->domain->dirty_cpumask);
 }
@@ -1346,7 +1344,7 @@ static void ept_disable_pml(struct p2m_domain *p2m)
     vmx_domain_update_eptp(p2m->domain);
 }
 
-static void ept_enable_hardware_log_dirty(struct p2m_domain *p2m)
+static void cf_check ept_enable_hardware_log_dirty(struct p2m_domain *p2m)
 {
     struct p2m_domain *hostp2m = p2m_get_hostp2m(p2m->domain);
 
@@ -1355,7 +1353,7 @@ static void ept_enable_hardware_log_dirty(struct p2m_domain *p2m)
     p2m_unlock(hostp2m);
 }
 
-static void ept_disable_hardware_log_dirty(struct p2m_domain *p2m)
+static void cf_check ept_disable_hardware_log_dirty(struct p2m_domain *p2m)
 {
     struct p2m_domain *hostp2m = p2m_get_hostp2m(p2m->domain);
 
@@ -1364,7 +1362,7 @@ static void ept_disable_hardware_log_dirty(struct p2m_domain *p2m)
     p2m_unlock(hostp2m);
 }
 
-static void ept_flush_pml_buffers(struct p2m_domain *p2m)
+static void cf_check ept_flush_pml_buffers(struct p2m_domain *p2m)
 {
     /* Domain must have been paused */
     ASSERT(atomic_read(&p2m->domain->pause_count));
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index ef3f8e02a415..eaba2b0fb4e6 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -399,7 +399,7 @@ static int p2m_pt_set_recalc_range(struct p2m_domain *p2m,
  * GFN. Propagate the re-calculation flag down to the next page table level
  * for entries not involved in the translation of the given GFN.
  */
-static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
+static int cf_check do_recalc(struct p2m_domain *p2m, unsigned long gfn)
 {
     void *table;
     unsigned long gfn_remainder = gfn;
@@ -573,7 +573,7 @@ static void check_entry(mfn_t mfn, p2m_type_t new, p2m_type_t old,
 }
 
 /* Returns: 0 for success, -errno for failure */
-static int
+static int cf_check
 p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
                  unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma,
                  int sve)
@@ -774,7 +774,7 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
     return rc;
 }
 
-static mfn_t
+static mfn_t cf_check
 p2m_pt_get_entry(struct p2m_domain *p2m, gfn_t gfn_,
                  p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
                  unsigned int *page_order, bool_t *sve)
@@ -943,8 +943,8 @@ p2m_pt_get_entry(struct p2m_domain *p2m, gfn_t gfn_,
     return (p2m_is_valid(*t) || p2m_is_any_ram(*t)) ? mfn : INVALID_MFN;
 }
 
-static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
-                                            p2m_type_t ot, p2m_type_t nt)
+static void cf_check p2m_pt_change_entry_type_global(
+    struct p2m_domain *p2m, p2m_type_t ot, p2m_type_t nt)
 {
     l1_pgentry_t *tab;
     unsigned long gfn = 0;
@@ -983,10 +983,9 @@ static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
          guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
-static int p2m_pt_change_entry_type_range(struct p2m_domain *p2m,
-                                          p2m_type_t ot, p2m_type_t nt,
-                                          unsigned long first_gfn,
-                                          unsigned long last_gfn)
+static int cf_check p2m_pt_change_entry_type_range(
+    struct p2m_domain *p2m, p2m_type_t ot, p2m_type_t nt,
+    unsigned long first_gfn, unsigned long last_gfn)
 {
     unsigned long mask = (1 << PAGETABLE_ORDER) - 1;
     unsigned int i;
@@ -1025,7 +1024,7 @@ static int p2m_pt_change_entry_type_range(struct p2m_domain *p2m,
 }
 
 #if P2M_AUDIT
-static long p2m_pt_audit_p2m(struct p2m_domain *p2m)
+static long cf_check p2m_pt_audit_p2m(struct p2m_domain *p2m)
 {
     unsigned long entry_count = 0, pmbad = 0;
     unsigned long mfn, gfn, m2pfn;
-- 
2.11.0


