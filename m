Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK5kCOWL5mmmyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA56433B13
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286478.1567566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBK-0002kH-K1; Mon, 20 Apr 2026 20:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286478.1567566; Mon, 20 Apr 2026 20:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBK-0002bc-AM; Mon, 20 Apr 2026 20:25:22 +0000
Received: by outflank-mailman (input) for mailman id 1286478;
 Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue0-0006IQ-Im
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEudz-004tZC-Vu
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:56 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68380-2eae-0a2a0a5409dd-0a2a4501a5ac-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:55 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6839e-c1f2-0a2a45010019-22cac1c59c96-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:55 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:50 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=cpY2maM903g/OQMRmoi/K3FI7pEjR3/A+YruwAnmtiRHf9omKMSl8nfgytOWe/2WJ4y6LMidModJRjxD3299SATM+cYIt1FE6PyfCf+NvghidAp+e73oESRZl4qyDsToAEBWqb9ecanlP/9uCoEgFY+9DDGun6z7hikU3gjJjTSoZJGCyLMN1c8mSrQ8FWwSVogH7Oledm2jlUlKTlogTaryjXH0+3UUdp+qwKD3IuM02wlQwy4h5plrt78CVSM0w41v4T3zrYJX80nJcAuK9h6tqFQY4vkJamCeSbdBo2SdeDkT/ucR69l+T3dYf3ruc2KR9LSiZ19JHnrg2pmrkQ==; s=purelymail1; d=purelymail.com; v=1; bh=3vj2WBNpAfn2BAOUgjc4RDRuR1cwEZPmFeAg8+48xGU=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and move declarations out of p2m.h
Date: Mon, 20 Apr 2026 15:50:07 -0400
Message-Id: <20260420195042.207624-9-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-d62444/1776714655-B7C74FF4-1611EB2B/0/0
X-purgate-type: clean
X-purgate-size: 32837
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:tamas@tklengyel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.853];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9EA56433B13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit renames altp2m functions with a p2m prefix. These functions
were originally defined in p2m.c, hence the p2m prefix. When they were
moved to altp2m.c in commit ae7584f63678, the function names were kept and
the declarations remained in p2m.h. This commit finishes that move by
renaming these functions to have an altp2m prefix and moving the
declarations to altp2m.h.

Since these functions will either be moved to the common altp2m.c, or
implemented separately for ARM, it doesn't seem to make sense to continue
with this naming convention. Therefore, this commit preemptively renames
the x86 implementations of these functions so they can later be implemented
with altp2m function name prefixes in common code or for ARM.

For convenience, here is the full list of renames:
- p2m_init_altp2m -> altp2m_init
- p2m_teardown_altp2m -> altp2m_teardown
- p2m_flush_altp2m -> altp2m_flush
- p2m_altp2m_get_or_propagate -> altp2m_get_or_propagate
- p2m_altp2m_propagate_change -> altp2m_propagate_change
- p2m_get_altp2m -> altp2m_get_altp2m
- p2m_set_altp2m -> altp2m_set_altp2m
- p2m_reset_altp2m -> altp2m_reset_altp2m
- p2m_activate_altp2m -> altp2m_activate_altp2m
- p2m_init_altp2m_by_id -> altp2m_init_by_id
- p2m_init_next_altp2m -> altp2m_init_next_available
- p2m_destroy_altp2m_by_id -> altp2m_destroy_by_id
- p2m_switch_domain_altp2m_by_id -> altp2m_switch_domain_altp2m_by_id
- p2m_change_altp2m_gfn -> altp2m_change_gfn
- p2m_set_altp2m_view_visibility -> altp2m_set_view_visibility

This commit contains only function renames and code movement, and no
functional change is intended.

This is commit 8/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/altp2m.c             |   2 +-
 xen/arch/x86/hvm/hvm.c            |  30 ++++----
 xen/arch/x86/hvm/monitor.c        |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c        |   6 +-
 xen/arch/x86/include/asm/altp2m.h | 116 +++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/p2m.h    | 109 ----------------------------
 xen/arch/x86/mm/altp2m.c          |  76 ++++++++++----------
 xen/arch/x86/mm/mem_access.c      |  13 ++--
 xen/arch/x86/mm/p2m-basic.c       |   4 +-
 xen/arch/x86/mm/p2m-ept.c         |   4 +-
 xen/arch/x86/mm/p2m.h             |   3 -
 xen/common/vm_event.c             |   2 +-
 xen/include/xen/p2m-common.h      |   2 +-
 13 files changed, 186 insertions(+), 183 deletions(-)

diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 8bd174ea8f37..339f82835caf 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -8,7 +8,7 @@
 #include <asm/p2m.h>
=20
 /* Check to see if vcpu should be switched to a different p2m. */
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+void altp2m_check(struct vcpu *v, uint16_t idx)
 {
     /* Not yet implemented */
     BUG();
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index bc35efdf2c02..5b6e91adce17 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1885,15 +1885,15 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned=
 long gla,
=20
     if ( altp2m_active(currd) )
     {
-        p2m =3D p2m_get_altp2m(curr);
+        p2m =3D altp2m_get_altp2m(curr);
=20
         /*
          * Get the altp2m entry if present; or if not, propagate from
          * the host p2m.  NB that this returns with gfn locked in the
          * altp2m.
          */
-        if ( p2m_altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt,
-                                         &p2ma, &page_order) )
+        if ( altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt, &p2ma,
+                                     &page_order) )
         {
             /* Entry was copied from host -- retry fault */
             rc =3D 1;
@@ -2036,7 +2036,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned l=
ong gla,
             paging_mark_pfn_dirty(currd, _pfn(gfn));
             /*
              * If p2m is really an altp2m, unlock it before changing the t=
ype,
-             * as p2m_altp2m_propagate_change() needs to acquire the
+             * as altp2m_propagate_change() needs to acquire the
              * altp2m_list lock.
              */
             if ( p2m !=3D hostp2m )
@@ -4663,7 +4663,7 @@ static int do_altp2m_op(
=20
         /* If the alternate p2m state has changed, handle appropriately */
         if ( d->altp2m_active !=3D ostate &&
-             (ostate || !(rc =3D p2m_init_altp2m_by_id(d, 0))) )
+             (ostate || !(rc =3D altp2m_init_by_id(d, 0))) )
         {
             for_each_vcpu( d, v )
             {
@@ -4674,7 +4674,7 @@ static int do_altp2m_op(
             }
=20
             if ( ostate )
-                p2m_flush_altp2m(d);
+                altp2m_flush(d);
         }
         else if ( rc )
             d->altp2m_active =3D false;
@@ -4729,17 +4729,18 @@ static int do_altp2m_op(
     }
=20
     case HVMOP_altp2m_create_p2m:
-        if ( !(rc =3D p2m_init_next_altp2m(d, &a.u.view.view,
-                                         a.u.view.hvmmem_default_access)) =
)
+        rc =3D altp2m_init_next_available(d, &a.u.view.view,
+                                        a.u.view.hvmmem_default_access);
+        if ( !rc )
             rc =3D __copy_to_guest(arg, &a, 1) ? -EFAULT : 0;
         break;
=20
     case HVMOP_altp2m_destroy_p2m:
-        rc =3D p2m_destroy_altp2m_by_id(d, a.u.view.view);
+        rc =3D altp2m_destroy_by_id(d, a.u.view.view);
         break;
=20
     case HVMOP_altp2m_switch_p2m:
-        rc =3D p2m_switch_domain_altp2m_by_id(d, a.u.view.view);
+        rc =3D altp2m_switch_domain_altp2m_by_id(d, a.u.view.view);
         break;
=20
     case HVMOP_altp2m_set_suppress_ve:
@@ -4871,9 +4872,9 @@ static int do_altp2m_op(
         if ( a.u.change_gfn.pad1 || a.u.change_gfn.pad2 )
             rc =3D -EINVAL;
         else
-            rc =3D p2m_change_altp2m_gfn(d, a.u.change_gfn.view,
-                    _gfn(a.u.change_gfn.old_gfn),
-                    _gfn(a.u.change_gfn.new_gfn));
+            rc =3D altp2m_change_gfn(d, a.u.change_gfn.view,
+                                   _gfn(a.u.change_gfn.old_gfn),
+                                   _gfn(a.u.change_gfn.new_gfn));
         break;
=20
     case HVMOP_altp2m_get_p2m_idx:
@@ -4906,8 +4907,7 @@ static int do_altp2m_op(
         else if ( !altp2m_active(d) )
             rc =3D -EOPNOTSUPP;
         else
-            rc =3D p2m_set_altp2m_view_visibility(d, idx,
-                                                a.u.set_visibility.visible=
);
+            rc =3D altp2m_set_view_visibility(d, idx, a.u.set_visibility.v=
isible);
         break;
     }
=20
diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 84c1c2234ca9..78137220b22a 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -182,7 +182,7 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monit=
or_debug_type type,
 #ifdef CONFIG_ALTP2M
         if ( curr->arch.hvm.fast_single_step.enabled )
         {
-            p2m_altp2m_check(curr, curr->arch.hvm.fast_single_step.p2midx)=
;
+            altp2m_check(curr, curr->arch.hvm.fast_single_step.p2midx);
             curr->arch.hvm.single_step =3D false;
             curr->arch.hvm.fast_single_step.enabled =3D false;
             curr->arch.hvm.fast_single_step.p2midx =3D 0;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0909929c00e0..f2cf95ee500e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2452,7 +2452,7 @@ static void cf_check vmx_vcpu_update_eptp(struct vcpu=
 *v)
     struct ept_data *ept;
=20
     if ( altp2m_active(d) )
-        p2m =3D p2m_get_altp2m(v);
+        p2m =3D altp2m_get_altp2m(v);
     if ( !p2m )
         p2m =3D p2m_get_hostp2m(d);
=20
@@ -2521,7 +2521,7 @@ static int cf_check vmx_vcpu_emulate_vmfunc(const str=
uct cpu_user_regs *regs)
=20
     if ( !cpu_has_vmx_vmfunc && altp2m_active(curr->domain) &&
          regs->eax =3D=3D 0 &&
-         p2m_switch_vcpu_altp2m_by_id(curr, regs->ecx) )
+         altp2m_switch_vcpu_by_id(curr, regs->ecx) )
         rc =3D X86EMUL_OKAY;
=20
     return rc;
@@ -4277,7 +4277,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_re=
gs *regs)
             }
         }
=20
-        p2m_set_altp2m(v, idx);
+        altp2m_set_altp2m(v, idx);
     }
=20
     if ( vm_event_is_enabled(v) &&
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index 07e760f60659..9c58a396448d 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -7,12 +7,33 @@
 #ifndef __ASM_X86_ALTP2M_H
 #define __ASM_X86_ALTP2M_H
=20
-#ifdef CONFIG_ALTP2M
=20
 #include <xen/types.h>
 #include <xen/sched.h>         /* for struct vcpu, struct domain */
+
+#include <asm/p2m.h>
 #include <asm/hvm/vcpu.h>      /* for vcpu_altp2m */
=20
+/*
+ * Common alternate p2m declarations that need to be visible
+ * regardless of CONFIG_ALTP2M
+ */
+
+/* Alternate p2m paging */
+bool altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
+                             mfn_t *mfn, p2m_type_t *p2mt, p2m_access_t *p=
2ma,
+                             unsigned int *page_order);
+
+/* Propagate a host p2m change to all alternate p2m's */
+int altp2m_propagate_change(struct domain *d, gfn_t gfn, mfn_t mfn,
+                            unsigned int page_order, p2m_type_t p2mt,
+                            p2m_access_t p2ma);
+
+#ifdef CONFIG_ALTP2M
+
+#define AP2MGET_prepopulate true
+#define AP2MGET_query false
+
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
                                         unsigned int idx)
 {
@@ -39,6 +60,85 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu=
 *v)
     return vcpu_altp2m(v).p2midx;
 }
=20
+/*
+ * Alternate p2m: shadow p2m tables used for alternate memory views
+ */
+
+/* get current alternate p2m table */
+static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
+{
+    unsigned int index =3D vcpu_altp2m(v).p2midx;
+
+    if ( index =3D=3D INVALID_ALTP2M )
+        return NULL;
+
+    BUG_ON(index >=3D v->domain->nr_altp2m);
+
+    return v->domain->altp2m_p2m[index];
+}
+
+/* set current alternate p2m table */
+static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
+{
+    struct p2m_domain *orig;
+
+    BUG_ON(idx >=3D v->domain->nr_altp2m);
+
+    if ( idx =3D=3D vcpu_altp2m(v).p2midx )
+        return false;
+
+    orig =3D altp2m_get_altp2m(v);
+    BUG_ON(!orig);
+    atomic_dec(&orig->active_vcpus);
+
+    vcpu_altp2m(v).p2midx =3D idx;
+    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
+
+    return true;
+}
+
+/* Initialize altp2m views */
+int altp2m_init(struct domain *d);
+
+/* Free altp2m views */
+void altp2m_teardown(struct domain *d);
+
+/* Switch alternate p2m for a single vcpu */
+bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
+
+/* Flush all the alternate p2m's for a domain */
+void altp2m_flush(struct domain *d);
+
+/* Make a specific alternate p2m valid */
+int altp2m_init_by_id(struct domain *d, unsigned int idx);
+
+/* Find an available alternate p2m and make it valid */
+int altp2m_init_next_available(struct domain *d, uint16_t *idx,
+                               xenmem_access_t hvmmem_default_access);
+
+/* Make a specific alternate p2m invalid */
+int altp2m_destroy_by_id(struct domain *d, unsigned int idx);
+
+/* Switch alternate p2m for entire domain */
+int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx);
+
+/* Change a gfn->mfn mapping */
+int altp2m_change_gfn(struct domain *d, unsigned int idx, gfn_t old_gfn,
+                      gfn_t new_gfn);
+
+/* Set a specific p2m view visibility */
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible);
+
+/*
+ * Looks up altp2m entry. If the entry is not found it looks up the entry =
in
+ * hostp2m.
+ * The prepopulate param is used to set the found entry in altp2m.
+ */
+int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *=
mfn,
+                               p2m_type_t *t, p2m_access_t *a,
+                               bool prepopulate);
+
 /* Alternate p2m VCPU */
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
@@ -69,7 +169,21 @@ static inline bool altp2m_supported(void)
     return false;
 }
=20
+static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
+                                             gfn_t gfn, mfn_t *mfn,
+                                             p2m_type_t *t, p2m_access_t *=
a)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+#define altp2m_get_effective_entry(ap2m, gfn, mfn, t, a, prepopulate) \
+        _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
+
 /* Only declaration is needed. DCE will optimise it out when linking. */
+int altp2m_init(struct domain *d);
+void altp2m_teardown(struct domain *d);
+struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
+bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.=
h
index ec871717a9e4..5110b3e77807 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -582,30 +582,6 @@ static inline gfn_t mfn_to_gfn(const struct domain *d,=
 mfn_t mfn)
         return _gfn(mfn_x(mfn));
 }
=20
-#ifdef CONFIG_ALTP2M
-#define AP2MGET_prepopulate true
-#define AP2MGET_query false
-
-/*
- * Looks up altp2m entry. If the entry is not found it looks up the entry =
in
- * hostp2m.
- * The prepopulate param is used to set the found entry in altp2m.
- */
-int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *=
mfn,
-                               p2m_type_t *t, p2m_access_t *a,
-                               bool prepopulate);
-#else
-static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
-                                             gfn_t gfn, mfn_t *mfn,
-                                             p2m_type_t *t, p2m_access_t *=
a)
-{
-    ASSERT_UNREACHABLE();
-    return -EOPNOTSUPP;
-}
-#define altp2m_get_effective_entry(ap2m, gfn, mfn, t, a, prepopulate) \
-        _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
-#endif
-
 /* Init the datastructures for later use by the p2m code */
 int p2m_init(struct domain *d);
=20
@@ -885,91 +861,6 @@ void shadow_p2m_init(struct p2m_domain *p2m);
 void cf_check nestedp2m_write_p2m_entry_post(
     struct p2m_domain *p2m, unsigned int oflags);
=20
-#ifdef CONFIG_ALTP2M
-
-/*
- * Alternate p2m: shadow p2m tables used for alternate memory views
- */
-
-/* get current alternate p2m table */
-static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
-{
-    unsigned int index =3D vcpu_altp2m(v).p2midx;
-
-    if ( index =3D=3D INVALID_ALTP2M )
-        return NULL;
-
-    BUG_ON(index >=3D v->domain->nr_altp2m);
-
-    return v->domain->altp2m_p2m[index];
-}
-
-/* set current alternate p2m table */
-static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
-{
-    struct p2m_domain *orig;
-
-    BUG_ON(idx >=3D v->domain->nr_altp2m);
-
-    if ( idx =3D=3D vcpu_altp2m(v).p2midx )
-        return false;
-
-    orig =3D p2m_get_altp2m(v);
-    BUG_ON(!orig);
-    atomic_dec(&orig->active_vcpus);
-
-    vcpu_altp2m(v).p2midx =3D idx;
-    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
-
-    return true;
-}
-
-/* Switch alternate p2m for a single vcpu */
-bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx);
-
-/* Flush all the alternate p2m's for a domain */
-void p2m_flush_altp2m(struct domain *d);
-
-/* Make a specific alternate p2m valid */
-int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx);
-
-/* Find an available alternate p2m and make it valid */
-int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
-                         xenmem_access_t hvmmem_default_access);
-
-/* Make a specific alternate p2m invalid */
-int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx);
-
-/* Switch alternate p2m for entire domain */
-int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx);
-
-/* Change a gfn->mfn mapping */
-int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
-                          gfn_t old_gfn, gfn_t new_gfn);
-
-/* Set a specific p2m view visibility */
-int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_i=
dx,
-                                   uint8_t visible);
-
-#else /* !CONFIG_ALTP2M */
-struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
-bool p2m_set_altp2m(struct vcpu *v, unsigned int idx);
-#endif /* CONFIG_ALTP2M */
-
-/*
- * Common alternate p2m declarations that need to be visible
- * regardless of CONFIG_ALTP2M
- */
-
-/* Alternate p2m paging */
-bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gf=
n_l,
-                                 mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int *page_or=
der);
-                                =20
-/* Propagate a host p2m change to all alternate p2m's */
-int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
-                                mfn_t mfn, unsigned int page_order,
-                                p2m_type_t p2mt, p2m_access_t p2ma);
 #endif /* CONFIG_HVM */
=20
 /* p2m access to IOMMU flags */
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 8dd3c0f96be0..2dc84b76b8c1 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -24,7 +24,7 @@ altp2m_vcpu_initialise(struct vcpu *v)
         vcpu_pause(v);
=20
     vcpu_altp2m(v).p2midx =3D 0;
-    atomic_inc(&p2m_get_altp2m(v)->active_vcpus);
+    atomic_inc(&altp2m_get_altp2m(v)->active_vcpus);
=20
     altp2m_vcpu_update_p2m(v);
=20
@@ -43,7 +43,7 @@ altp2m_vcpu_destroy(struct vcpu *v)
     if ( v !=3D current )
         vcpu_pause(v);
=20
-    if ( (p2m =3D p2m_get_altp2m(v)) )
+    if ( (p2m =3D altp2m_get_altp2m(v)) )
         atomic_dec(&p2m->active_vcpus);
=20
     altp2m_vcpu_disable_ve(v);
@@ -123,7 +123,7 @@ void altp2m_vcpu_disable_ve(struct vcpu *v)
     }
 }
=20
-int p2m_init_altp2m(struct domain *d)
+int altp2m_init(struct domain *d)
 {
     unsigned int i;
     struct p2m_domain *p2m;
@@ -140,7 +140,7 @@ int p2m_init_altp2m(struct domain *d)
         d->altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
         if ( p2m =3D=3D NULL )
         {
-            p2m_teardown_altp2m(d);
+            altp2m_teardown(d);
             return -ENOMEM;
         }
         p2m->p2m_class =3D p2m_alternate;
@@ -151,7 +151,7 @@ int p2m_init_altp2m(struct domain *d)
     return 0;
 }
=20
-void p2m_teardown_altp2m(struct domain *d)
+void altp2m_teardown(struct domain *d)
 {
     unsigned int i;
     struct p2m_domain *p2m;
@@ -207,13 +207,13 @@ int altp2m_get_effective_entry(struct p2m_domain *ap2=
m, gfn_t gfn, mfn_t *mfn,
     return 0;
 }
=20
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+void altp2m_check(struct vcpu *v, uint16_t idx)
 {
     if ( altp2m_active(v->domain) )
-        p2m_switch_vcpu_altp2m_by_id(v, idx);
+        altp2m_switch_vcpu_by_id(v, idx);
 }
=20
-bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
+bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx)
 {
     struct domain *d =3D v->domain;
     bool rc =3D false;
@@ -225,7 +225,7 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsig=
ned int idx)
=20
     if ( d->arch.altp2m_eptp[idx] !=3D mfn_x(INVALID_MFN) )
     {
-        if ( p2m_set_altp2m(v, idx) )
+        if ( altp2m_set_altp2m(v, idx) )
             altp2m_vcpu_update_p2m(v);
         rc =3D 1;
     }
@@ -246,9 +246,9 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsig=
ned int idx)
  * the host's entry to the altp2m (retaining page order), and indicate
  * that the caller should re-try the faulting instruction.
  */
-bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gf=
n_l,
-                                 mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int *page_or=
der)
+bool altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
+                             mfn_t *mfn, p2m_type_t *p2mt, p2m_access_t *p=
2ma,
+                             unsigned int *page_order)
 {
     p2m_type_t ap2mt;
     p2m_access_t ap2ma;
@@ -319,8 +319,8 @@ enum altp2m_reset_type {
     ALTP2M_DEACTIVATE
 };
=20
-static void p2m_reset_altp2m(struct domain *d, unsigned int idx,
-                             enum altp2m_reset_type reset_type)
+static void altp2m_reset_altp2m(struct domain *d, unsigned int idx,
+                                enum altp2m_reset_type reset_type)
 {
     struct p2m_domain *p2m;
=20
@@ -344,7 +344,7 @@ static void p2m_reset_altp2m(struct domain *d, unsigned=
 int idx,
     p2m_unlock(p2m);
 }
=20
-void p2m_flush_altp2m(struct domain *d)
+void altp2m_flush(struct domain *d)
 {
     unsigned int i;
=20
@@ -352,7 +352,7 @@ void p2m_flush_altp2m(struct domain *d)
=20
     for ( i =3D 0; i < d->nr_altp2m; i++ )
     {
-        p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
+        altp2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] =3D mfn_x(INVALID_MFN);
         d->arch.altp2m_visible_eptp[i] =3D mfn_x(INVALID_MFN);
     }
@@ -360,8 +360,8 @@ void p2m_flush_altp2m(struct domain *d)
     altp2m_list_unlock(d);
 }
=20
-static int p2m_activate_altp2m(struct domain *d, unsigned int idx,
-                               p2m_access_t hvmmem_default_access)
+static int altp2m_activate_altp2m(struct domain *d, unsigned int idx,
+                                  p2m_access_t hvmmem_default_access)
 {
     struct p2m_domain *hostp2m, *p2m;
     int rc;
@@ -399,9 +399,9 @@ static int p2m_activate_altp2m(struct domain *d, unsign=
ed int idx,
     p2m_unlock(p2m);
=20
     return rc;
-}
+ }
=20
-int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx)
+int altp2m_init_by_id(struct domain *d, unsigned int idx)
 {
     int rc =3D -EINVAL;
     struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
@@ -413,14 +413,14 @@ int p2m_init_altp2m_by_id(struct domain *d, unsigned =
int idx)
=20
     if ( d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =3D=3D
          mfn_x(INVALID_MFN) )
-        rc =3D p2m_activate_altp2m(d, idx, hostp2m->default_access);
+        rc =3D altp2m_activate_altp2m(d, idx, hostp2m->default_access);
=20
     altp2m_list_unlock(d);
     return rc;
 }
=20
-int p2m_init_next_altp2m(struct domain *d, uint16_t *idx,
-                         xenmem_access_t hvmmem_default_access)
+int altp2m_init_next_available(struct domain *d, uint16_t *idx,
+                               xenmem_access_t hvmmem_default_access)
 {
     int rc =3D -EINVAL;
     unsigned int i;
@@ -438,7 +438,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *id=
x,
         if ( d->arch.altp2m_eptp[i] !=3D mfn_x(INVALID_MFN) )
             continue;
=20
-        rc =3D p2m_activate_altp2m(d, i, a);
+        rc =3D altp2m_activate_altp2m(d, i, a);
=20
         if ( !rc )
             *idx =3D i;
@@ -450,7 +450,7 @@ int p2m_init_next_altp2m(struct domain *d, uint16_t *id=
x,
     return rc;
 }
=20
-int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
+int altp2m_destroy_by_id(struct domain *d, unsigned int idx)
 {
     struct p2m_domain *p2m;
     int rc =3D -EBUSY;
@@ -472,7 +472,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned=
 int idx)
=20
         if ( !_atomic_read(p2m->active_vcpus) )
         {
-            p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
+            altp2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
             d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =3D
                 mfn_x(INVALID_MFN);
             d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)]=
 =3D
@@ -488,7 +488,7 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned=
 int idx)
     return rc;
 }
=20
-int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
+int altp2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
 {
     struct vcpu *v;
     int rc =3D -EINVAL;
@@ -506,7 +506,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, un=
signed int idx)
     if ( d->arch.altp2m_visible_eptp[idx] !=3D mfn_x(INVALID_MFN) )
     {
         for_each_vcpu( d, v )
-            if ( p2m_set_altp2m(v, idx) )
+            if ( altp2m_set_altp2m(v, idx) )
                 altp2m_vcpu_update_p2m(v);
=20
         rc =3D 0;
@@ -519,8 +519,8 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, un=
signed int idx)
     return rc;
 }
=20
-int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
-                          gfn_t old_gfn, gfn_t new_gfn)
+int altp2m_change_gfn(struct domain *d, unsigned int idx, gfn_t old_gfn,
+                      gfn_t new_gfn)
 {
     struct p2m_domain *hp2m, *ap2m;
     p2m_access_t a;
@@ -571,11 +571,11 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned =
int idx,
     p2m_unlock(ap2m);
     p2m_unlock(hp2m);
     return rc;
-}
+ }
=20
-int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
-                                mfn_t mfn, unsigned int page_order,
-                                p2m_type_t p2mt, p2m_access_t p2ma)
+int altp2m_propagate_change(struct domain *d, gfn_t gfn, mfn_t mfn,
+                            unsigned int page_order, p2m_type_t p2mt,
+                            p2m_access_t p2ma)
 {
     struct p2m_domain *p2m;
     unsigned int i;
@@ -605,7 +605,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t=
 gfn,
         {
             if ( !reset_count++ )
             {
-                p2m_reset_altp2m(d, i, ALTP2M_RESET);
+                altp2m_reset_altp2m(d, i, ALTP2M_RESET);
                 last_reset_idx =3D i;
             }
             else
@@ -617,7 +617,7 @@ int p2m_altp2m_propagate_change(struct domain *d, gfn_t=
 gfn,
                          d->arch.altp2m_eptp[i] =3D=3D mfn_x(INVALID_MFN) =
)
                         continue;
=20
-                    p2m_reset_altp2m(d, i, ALTP2M_RESET);
+                    altp2m_reset_altp2m(d, i, ALTP2M_RESET);
                 }
=20
                 ret =3D 0;
@@ -768,8 +768,8 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bo=
ol *suppress_ve,
     return rc;
 }
=20
-int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_i=
dx,
-                                   uint8_t visible)
+int altp2m_set_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                               uint8_t visible)
 {
     int rc =3D 0;
=20
diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e5548e64d8d0..0492356d99ad 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -81,7 +81,7 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
     struct p2m_domain *p2m =3D NULL;
=20
     if ( altp2m_active(d) )
-        p2m =3D p2m_get_altp2m(v);
+        p2m =3D altp2m_get_altp2m(v);
     if ( !p2m )
         p2m =3D p2m_get_hostp2m(d);
=20
@@ -145,7 +145,7 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long gl=
a,
     int rc;
=20
     if ( altp2m_active(d) )
-        p2m =3D p2m_get_altp2m(v);
+        p2m =3D altp2m_get_altp2m(v);
     if ( !p2m )
         p2m =3D p2m_get_hostp2m(d);
=20
@@ -252,9 +252,10 @@ bool p2m_mem_access_check(paddr_t gpa, unsigned long g=
la,
     return (p2ma !=3D p2m_access_n2rwx);
 }
=20
-static int p2m_set_altp2m_mem_access(struct domain *d, struct p2m_domain *=
hp2m,
-                                     struct p2m_domain *ap2m, p2m_access_t=
 a,
-                                     gfn_t gfn)
+static int altp2m_set_altp2m_mem_access(struct domain *d,
+                                        struct p2m_domain *hp2m,
+                                        struct p2m_domain *ap2m, p2m_acces=
s_t a,
+                                        gfn_t gfn)
 {
     mfn_t mfn;
     p2m_type_t t;
@@ -281,7 +282,7 @@ static int set_mem_access(struct domain *d, struct p2m_=
domain *p2m,
=20
     if ( ap2m )
     {
-        rc =3D p2m_set_altp2m_mem_access(d, p2m, ap2m, a, gfn);
+        rc =3D altp2m_set_altp2m_mem_access(d, p2m, ap2m, a, gfn);
         /* If the corresponding mfn is invalid we will want to just skip i=
t */
         if ( rc =3D=3D -ESRCH )
             rc =3D 0;
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index ce14066fedaf..433e7d08b78f 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -128,7 +128,7 @@ int p2m_init(struct domain *d)
         return rc;
     }
=20
-    rc =3D altp2m_supported() ? p2m_init_altp2m(d) : 0;
+    rc =3D altp2m_supported() ? altp2m_init(d) : 0;
     if ( rc )
     {
         p2m_teardown_hostp2m(d);
@@ -198,7 +198,7 @@ void p2m_final_teardown(struct domain *d)
     if ( is_hvm_domain(d) )
     {
         if ( altp2m_supported() )
-            p2m_teardown_altp2m(d);
+            altp2m_teardown(d);
         /*
          * We must tear down nestedp2m unconditionally because
          * we initialise it unconditionally.
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 84159198f3a0..a6f61a9dd3d7 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -773,7 +773,7 @@ bool ept_handle_misconfig(uint64_t gpa)
     int rc;
=20
     if ( altp2m_active(curr->domain) )
-        p2m =3D p2m_get_altp2m(curr);
+        p2m =3D altp2m_get_altp2m(curr);
=20
     p2m_lock(p2m);
=20
@@ -997,7 +997,7 @@ out:
=20
     if ( altp2m_supported() && entry_written && p2m_is_hostp2m(p2m) )
     {
-        ret =3D p2m_altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt=
, p2ma);
+        ret =3D altp2m_propagate_change(d, _gfn(gfn), mfn, order, p2mt, p2=
ma);
         if ( !rc )
             rc =3D ret;
     }
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 635f5a7f45cd..64218878067e 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -19,9 +19,6 @@ static inline int p2m_init_logdirty(struct p2m_domain *p2=
m) { return 0; }
 static inline void p2m_free_logdirty(struct p2m_domain *p2m) {}
 #endif
=20
-int p2m_init_altp2m(struct domain *d);
-void p2m_teardown_altp2m(struct domain *d);
-
 void p2m_flush_table_locked(struct p2m_domain *p2m);
 int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t=
 mfn,
                                   unsigned int page_order);
diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index cf0258223f50..77e0c8a0b240 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -433,7 +433,7 @@ static int vm_event_resume(struct domain *d, struct vm_=
event_domain *ved)
             /* Check for altp2m switch */
             if ( IS_ENABLED(CONFIG_ALTP2M) &&
                  rsp.flags & VM_EVENT_FLAG_ALTERNATE_P2M )
-                p2m_altp2m_check(v, rsp.altp2m_idx);
+                altp2m_check(v, rsp.altp2m_idx);
=20
             if ( rsp.flags & VM_EVENT_FLAG_SET_REGISTERS )
                 vm_event_set_registers(v, &rsp);
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b9896..6da330acca1f 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -25,7 +25,7 @@ int unmap_mmio_regions(struct domain *d,
                        mfn_t mfn);
=20
 /* Check to see if vcpu should be switched to a different p2m. */
-void p2m_altp2m_check(struct vcpu *v, uint16_t idx);
+void altp2m_check(struct vcpu *v, uint16_t idx);
=20
 /*
  * Populate-on-Demand
--=20
2.34.1


