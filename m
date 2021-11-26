Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE245EECD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232893.404185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxm-00062t-1M; Fri, 26 Nov 2021 13:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232893.404185; Fri, 26 Nov 2021 13:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxk-0005Vi-AV; Fri, 26 Nov 2021 13:08:24 +0000
Received: by outflank-mailman (input) for mailman id 232893;
 Fri, 26 Nov 2021 13:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavi-0002zD-Dd
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0ad151d-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:06:12 +0100 (CET)
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
X-Inumbo-ID: a0ad151d-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931972;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OmfIVjvRFySSa8/mzc3J6kH3MJyMsyMFs53apAyPR2A=;
  b=RATjgcQLwPt3aSUc9j5CuIR7R9SPzPY7X3CGFgmddPOH4uC6vETcpcMY
   tI7kM3J0mXk7OGEKv8seNFQ/W4NHzaE5ygjc89rpowp9BDQLOF8v9O5RO
   iXAgl/ht4IZE6lOcIdfORZIkI9CkLHVR9Hv2B1s5MPjV7hFa2qtVUuQAb
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JHqhR5uQ2IHIQG9EIfZMKm1ecScCjhq+z1tYFDsehJYddTebeD3lsy2yAybyGbBsff91CRrmTd
 r5zqVXdJQ0EkM81GgeuAu1T2yKel/eEbb5uWcGwmfnjvHIh6WuHNSQlsCJb7iPStFBC/HJEgSl
 aiuBTzKyQ0H3hs81E8Som1JuEkrq1Ubm1bZIC6QDkY/5zHwDKntnmy1xZ4jiaSJSSFfk/4sjtq
 18RHHwNP1lsJk3p27dAENWYp1ryj4Q+UB4WSt2EG883gN7eemu0iWwDdSiwZPg/nRtIVFZn+cX
 cEmM0YaDwcmXf4RReewiuq5m
X-SBRS: 5.1
X-MesageID: 58193863
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NwEnEq6NpPAr7+JCk6oelQxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 mAaUTuBMqneMzChfox/Po/no00G7Jbcx9Y1TAU6qS01Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zy
 N9s6sbhcjgTGrDToc9FbQICPiolFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTa+PP
 JpHMlKDajzuRw1LA00eFakYwrnz3SDudz5J+VuK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc9paMrJguTqy8I7J/D+yXlYfFBNKM/Vz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:y1sHp64/TIZ7QUCywQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193863"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 46/65] x86/p2m: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:27 +0000
Message-ID: <20211126123446.32324-47-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/mm/hap/hap.c        |  2 +-
 xen/arch/x86/mm/hap/nested_hap.c |  2 +-
 xen/arch/x86/mm/p2m-ept.c        | 32 +++++++++++++++-----------------
 xen/arch/x86/mm/p2m-pt.c         | 19 +++++++++----------
 xen/include/asm-x86/p2m.h        |  4 ++--
 5 files changed, 28 insertions(+), 31 deletions(-)

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
index 50fa2dd9f405..aa8495be4510 100644
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
index ac36afcc1d64..d2c540b81fdf 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -625,7 +625,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
  * - zero if no adjustment was done,
  * - a positive value if at least one adjustment was done.
  */
-static int resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
+static int cf_check resolve_misconfig(struct p2m_domain *p2m, unsigned long gfn)
 {
     struct ept_data *ept = &p2m->ept;
     unsigned int level = ept->wl;
@@ -794,7 +794,7 @@ bool_t ept_handle_misconfig(uint64_t gpa)
  *
  * Returns: 0 for success, -errno for failure
  */
-static int
+static int cf_check
 ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
               unsigned int order, p2m_type_t p2mt, p2m_access_t p2ma,
               int sve)
@@ -1003,10 +1003,9 @@ ept_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
 }
 
 /* Read ept p2m entries */
-static mfn_t ept_get_entry(struct p2m_domain *p2m,
-                           gfn_t gfn_, p2m_type_t *t, p2m_access_t* a,
-                           p2m_query_t q, unsigned int *page_order,
-                           bool_t *sve)
+static mfn_t cf_check ept_get_entry(
+    struct p2m_domain *p2m, gfn_t gfn_, p2m_type_t *t, p2m_access_t* a,
+    p2m_query_t q, unsigned int *page_order, bool_t *sve)
 {
     ept_entry_t *table =
         map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
@@ -1166,8 +1165,8 @@ void ept_walk_table(struct domain *d, unsigned long gfn)
     return;
 }
 
-static void ept_change_entry_type_global(struct p2m_domain *p2m,
-                                         p2m_type_t ot, p2m_type_t nt)
+static void cf_check ept_change_entry_type_global(
+    struct p2m_domain *p2m, p2m_type_t ot, p2m_type_t nt)
 {
     unsigned long mfn = p2m->ept.mfn;
 
@@ -1178,10 +1177,9 @@ static void ept_change_entry_type_global(struct p2m_domain *p2m,
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
@@ -1225,7 +1223,7 @@ static int ept_change_entry_type_range(struct p2m_domain *p2m,
     return rc < 0 ? rc : 0;
 }
 
-static void ept_memory_type_changed(struct p2m_domain *p2m)
+static void cf_check ept_memory_type_changed(struct p2m_domain *p2m)
 {
     unsigned long mfn = p2m->ept.mfn;
 
@@ -1284,7 +1282,7 @@ void ept_sync_domain(struct p2m_domain *p2m)
     ept_sync_domain_mask(p2m, d->dirty_cpumask);
 }
 
-static void ept_tlb_flush(struct p2m_domain *p2m)
+static void cf_check ept_tlb_flush(struct p2m_domain *p2m)
 {
     ept_sync_domain_mask(p2m, p2m->domain->dirty_cpumask);
 }
@@ -1347,7 +1345,7 @@ static void ept_disable_pml(struct p2m_domain *p2m)
     vmx_domain_update_eptp(p2m->domain);
 }
 
-static void ept_enable_hardware_log_dirty(struct p2m_domain *p2m)
+static void cf_check ept_enable_hardware_log_dirty(struct p2m_domain *p2m)
 {
     struct p2m_domain *hostp2m = p2m_get_hostp2m(p2m->domain);
 
@@ -1356,7 +1354,7 @@ static void ept_enable_hardware_log_dirty(struct p2m_domain *p2m)
     p2m_unlock(hostp2m);
 }
 
-static void ept_disable_hardware_log_dirty(struct p2m_domain *p2m)
+static void cf_check ept_disable_hardware_log_dirty(struct p2m_domain *p2m)
 {
     struct p2m_domain *hostp2m = p2m_get_hostp2m(p2m->domain);
 
@@ -1365,7 +1363,7 @@ static void ept_disable_hardware_log_dirty(struct p2m_domain *p2m)
     p2m_unlock(hostp2m);
 }
 
-static void ept_flush_pml_buffers(struct p2m_domain *p2m)
+static void cf_check ept_flush_pml_buffers(struct p2m_domain *p2m)
 {
     /* Domain must have been paused */
     ASSERT(atomic_read(&p2m->domain->pause_count));
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 09c99d78aa40..0a8f64f7046d 100644
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
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index 357a8087481e..eaaf0ea0bfec 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -820,8 +820,8 @@ void np2m_flush_base(struct vcpu *v, unsigned long np2m_base);
 void hap_p2m_init(struct p2m_domain *p2m);
 void shadow_p2m_init(struct p2m_domain *p2m);
 
-void nestedp2m_write_p2m_entry_post(struct p2m_domain *p2m,
-                                    unsigned int oflags);
+void cf_check nestedp2m_write_p2m_entry_post(
+    struct p2m_domain *p2m, unsigned int oflags);
 
 /*
  * Alternate p2m: shadow p2m tables used for alternate memory views
-- 
2.11.0


