Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6145EEA4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232789.403846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawX-0005Js-2v; Fri, 26 Nov 2021 13:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232789.403846; Fri, 26 Nov 2021 13:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawW-0004oh-5O; Fri, 26 Nov 2021 13:07:08 +0000
Received: by outflank-mailman (input) for mailman id 232789;
 Fri, 26 Nov 2021 13:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavk-0003W9-Lf
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4486e1c-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:06:18 +0100 (CET)
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
X-Inumbo-ID: a4486e1c-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1fjbUCy704jAqvZkS1xr/U+cwmAU8Nf/lqpWXLu6U00=;
  b=enbaqYIYPy1AuyrHbSPN/4S2Ff7hm1yVe0EAOq1l3qrSFcoWwKiQu32P
   aXsCzGucRPsGYT3h3KdrqPzjLgEcjNal0S0wxhAw+zArIX/Ria9JE8u+q
   jv7eeq1gNbPACxzndjaCrKRf+VTZiThxrB//5RqCid/yQm6w9nd+mjJLI
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xm5SIC1v00MKbrjx8rAQR840+L9k/+Mfv2qdy50VQrsOaGKOIRk3U1oCXRuZzSD2AtaiVzghH3
 De4pQeB1yzSeAxCp5CmXdt7lsYumuIdHfMXz2SNbyUrA7qhlU3V0lM14kVn3t8u2UDO+2YfT2N
 NXl0+Pr1gJtUvkBJBvGaD6fpil/oJ79MyoltluP6t5fFLLJYrJKk0SljDeA/QlYYlbzgN6t9wz
 4iqL7FiKKxLpwE0rwfBWTE6qGxHcrUnrzAM3sAZhCeCLdfmuCfbKxSyOdH+NoiEhsIpxY956tP
 XH2TJxBgDo6bGQZ2ojPDvqbb
X-SBRS: 5.1
X-MesageID: 59064069
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4ewVbaxCsmEb9AO/XLp6t+f6wSrEfRIJ4+MujC+fZmUNrF6WrkUEz
 2EcWziHOqvbNmKnf9t1Ptm39R4BvZ7Uz9AwQVNv/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/5By
 Opnv7afc1c4A4n+3+AmYxVmEAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25EWQ6qGO
 ZtxhTxHZiWYfBkVIxQuLbESrf6CoEb6LhZcgQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYya9pvOecQxzvd25fw0UGdPVgIcD1oPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5OORECnCBtJ6sybp1qHHa5
 xDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmohdBk0bZdYJ2OyC
 KM2he+3zMQIVJdNRfUqC79d9uxwlfSwfTgbfqy8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9WremJOcFzNwdeIqV/4U4A6zalTiMnS+
 XSxBh1RxFbl3CWVIgSWcHFzLrjoWM8n/348OCUtO3eu2mQiPtnzvPtOKcNvcOl17vFnwN51U
 +IBJ5eKDMNQR2mV4D8ad5T88tBvLUz5mQKUMiO5SzEjZJo8FRfR89rpc1K3pikDBya6r+Ukp
 Lik2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xVcEfN3DqX0
 QqSECw0n+iVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPfBbzlZHt41wT+Riwa4kvoa9orZbykJvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDSh/gblw7b4ekxPEintjR8+6CKUBkKMhSB4MCHwGCZ7G/xL
 T8dhfMr
IronPort-HdrOrdr: A9a23:CuJwzKmauO8Uih+XhXSArznhYwnpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59064069"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 44/65] x86/shadow: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:25 +0000
Message-ID: <20211126123446.32324-45-andrew.cooper3@citrix.com>
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
 xen/arch/x86/mm/shadow/common.c  | 11 +++---
 xen/arch/x86/mm/shadow/hvm.c     |  8 ++--
 xen/arch/x86/mm/shadow/multi.c   | 80 ++++++++++++++++++++--------------------
 xen/arch/x86/mm/shadow/multi.h   | 20 +++++-----
 xen/arch/x86/mm/shadow/private.h | 12 +++---
 xen/arch/x86/mm/shadow/pv.c      |  4 +-
 6 files changed, 67 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 8e51168e61b6..7cf6470ae8c3 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1215,7 +1215,7 @@ void shadow_free(struct domain *d, mfn_t smfn)
  * This action is irreversible: the p2m mapping only ever grows.
  * That's OK because the p2m table only exists for translated domains,
  * and those domains can't ever turn off shadow mode. */
-static struct page_info *
+static struct page_info *cf_check
 shadow_alloc_p2m_page(struct domain *d)
 {
     struct page_info *pg;
@@ -1251,7 +1251,7 @@ shadow_alloc_p2m_page(struct domain *d)
     return pg;
 }
 
-static void
+static void cf_check
 shadow_free_p2m_page(struct domain *d, struct page_info *pg)
 {
     struct domain *owner = page_get_owner(pg);
@@ -2290,7 +2290,8 @@ void shadow_prepare_page_type_change(struct domain *d, struct page_info *page,
 /* Reset the up-pointers of every L3 shadow to 0.
  * This is called when l3 shadows stop being pinnable, to clear out all
  * the list-head bits so the up-pointer field is properly inititalised. */
-static int sh_clear_up_pointer(struct vcpu *v, mfn_t smfn, mfn_t unused)
+static int cf_check sh_clear_up_pointer(
+    struct vcpu *v, mfn_t smfn, mfn_t unused)
 {
     mfn_to_page(smfn)->up = 0;
     return 0;
@@ -2490,7 +2491,7 @@ static void sh_update_paging_modes(struct vcpu *v)
     v->arch.paging.mode->update_cr3(v, 0, false);
 }
 
-void shadow_update_paging_modes(struct vcpu *v)
+void cf_check shadow_update_paging_modes(struct vcpu *v)
 {
     paging_lock(v->domain);
     sh_update_paging_modes(v);
@@ -3075,7 +3076,7 @@ static bool flush_vcpu(const struct vcpu *v, const unsigned long *vcpu_bitmap)
 }
 
 /* Flush TLB of selected vCPUs.  NULL for all. */
-bool shadow_flush_tlb(const unsigned long *vcpu_bitmap)
+bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap)
 {
     static DEFINE_PER_CPU(cpumask_t, flush_cpumask);
     cpumask_t *mask = &this_cpu(flush_cpumask);
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index ea99dd714fc3..e99eb3432cce 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -797,9 +797,9 @@ sh_remove_all_shadows_and_parents(struct domain *d, mfn_t gmfn)
      * It means extra emulated writes and slows down removal of mappings. */
 }
 
-static void sh_unshadow_for_p2m_change(struct domain *d, unsigned long gfn,
-                                       l1_pgentry_t old, l1_pgentry_t new,
-                                       unsigned int level)
+static void cf_check sh_unshadow_for_p2m_change(
+    struct domain *d, unsigned long gfn, l1_pgentry_t old, l1_pgentry_t new,
+    unsigned int level)
 {
     mfn_t omfn = l1e_get_mfn(old);
     unsigned int oflags = l1e_get_flags(old);
@@ -882,7 +882,7 @@ static void sh_unshadow_for_p2m_change(struct domain *d, unsigned long gfn,
 }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
-static void
+static void cf_check
 sh_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
 {
     struct domain *d = p2m->domain;
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 7b8f4dd13b03..c1918e4e1f47 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -369,7 +369,7 @@ static void sh_audit_gw(struct vcpu *v, const walk_t *gw)
 
 #if GUEST_PAGING_LEVELS == 2
 /* From one page of a multi-page shadow, find the next one */
-static inline mfn_t sh_next_page(mfn_t smfn)
+static inline mfn_t cf_check sh_next_page(mfn_t smfn)
 {
     struct page_info *pg = mfn_to_page(smfn), *next;
     struct page_list_head h = PAGE_LIST_HEAD_INIT(h);
@@ -399,8 +399,7 @@ guest_index(void *ptr)
     return (u32)((unsigned long)ptr & ~PAGE_MASK) / sizeof(guest_l1e_t);
 }
 
-static u32
-shadow_l1_index(mfn_t *smfn, u32 guest_index)
+static u32 cf_check shadow_l1_index(mfn_t *smfn, u32 guest_index)
 {
 #if (GUEST_PAGING_LEVELS == 2)
     ASSERT(mfn_to_page(*smfn)->u.sh.head);
@@ -412,8 +411,7 @@ shadow_l1_index(mfn_t *smfn, u32 guest_index)
 #endif
 }
 
-static u32
-shadow_l2_index(mfn_t *smfn, u32 guest_index)
+static u32 cf_check shadow_l2_index(mfn_t *smfn, u32 guest_index)
 {
 #if (GUEST_PAGING_LEVELS == 2)
     int i;
@@ -432,14 +430,12 @@ shadow_l2_index(mfn_t *smfn, u32 guest_index)
 
 #if GUEST_PAGING_LEVELS >= 4
 
-static u32
-shadow_l3_index(mfn_t *smfn, u32 guest_index)
+static u32 cf_check shadow_l3_index(mfn_t *smfn, u32 guest_index)
 {
     return guest_index;
 }
 
-static u32
-shadow_l4_index(mfn_t *smfn, u32 guest_index)
+static u32 cf_check shadow_l4_index(mfn_t *smfn, u32 guest_index)
 {
     return guest_index;
 }
@@ -922,7 +918,7 @@ do {                                                                    \
 /**************************************************************************/
 /* Create a shadow of a given guest page.
  */
-static mfn_t
+static mfn_t cf_check
 sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shadow_type)
 {
     struct domain *d = v->domain;
@@ -1457,7 +1453,8 @@ void sh_unhook_64b_mappings(struct domain *d, mfn_t sl4mfn, int user_only)
  */
 
 #if GUEST_PAGING_LEVELS >= 4
-static int validate_gl4e(struct vcpu *v, void *new_ge, mfn_t sl4mfn, void *se)
+static int cf_check validate_gl4e(
+    struct vcpu *v, void *new_ge, mfn_t sl4mfn, void *se)
 {
     shadow_l4e_t new_sl4e;
     guest_l4e_t new_gl4e = *(guest_l4e_t *)new_ge;
@@ -1516,7 +1513,8 @@ static int validate_gl4e(struct vcpu *v, void *new_ge, mfn_t sl4mfn, void *se)
 }
 
 
-static int validate_gl3e(struct vcpu *v, void *new_ge, mfn_t sl3mfn, void *se)
+static int cf_check validate_gl3e(
+    struct vcpu *v, void *new_ge, mfn_t sl3mfn, void *se)
 {
     struct domain *d = v->domain;
     shadow_l3e_t new_sl3e;
@@ -1550,7 +1548,8 @@ static int validate_gl3e(struct vcpu *v, void *new_ge, mfn_t sl3mfn, void *se)
 }
 #endif // GUEST_PAGING_LEVELS >= 4
 
-static int validate_gl2e(struct vcpu *v, void *new_ge, mfn_t sl2mfn, void *se)
+static int cf_check validate_gl2e(
+    struct vcpu *v, void *new_ge, mfn_t sl2mfn, void *se)
 {
     struct domain *d = v->domain;
     shadow_l2e_t new_sl2e;
@@ -1597,7 +1596,8 @@ static int validate_gl2e(struct vcpu *v, void *new_ge, mfn_t sl2mfn, void *se)
     return result;
 }
 
-static int validate_gl1e(struct vcpu *v, void *new_ge, mfn_t sl1mfn, void *se)
+static int cf_check validate_gl1e(
+    struct vcpu *v, void *new_ge, mfn_t sl1mfn, void *se)
 {
     struct domain *d = v->domain;
     shadow_l1e_t new_sl1e;
@@ -2087,8 +2087,8 @@ static DEFINE_PER_CPU(int,trace_extra_emulation_count);
 #endif
 static DEFINE_PER_CPU(guest_pa_t,trace_emulate_write_val);
 
-static void trace_emulate_write_val(const void *ptr, unsigned long vaddr,
-                                    const void *src, unsigned int bytes)
+static void cf_check trace_emulate_write_val(
+    const void *ptr, unsigned long vaddr, const void *src, unsigned int bytes)
 {
 #if GUEST_PAGING_LEVELS == 3
     if ( vaddr == this_cpu(trace_emulate_initial_va) )
@@ -2142,9 +2142,8 @@ static inline void trace_shadow_emulate(guest_l1e_t gl1e, unsigned long va)
  * shadow code (and the guest should retry) or 0 if it is not (and the
  * fault should be handled elsewhere or passed to the guest). */
 
-static int sh_page_fault(struct vcpu *v,
-                          unsigned long va,
-                          struct cpu_user_regs *regs)
+static int cf_check sh_page_fault(
+    struct vcpu *v, unsigned long va, struct cpu_user_regs *regs)
 {
     struct domain *d = v->domain;
     walk_t gw;
@@ -2896,7 +2895,7 @@ static int sh_page_fault(struct vcpu *v,
  * instruction should be issued on the hardware, or false if it's safe not
  * to do so.
  */
-static bool sh_invlpg(struct vcpu *v, unsigned long linear)
+static bool cf_check sh_invlpg(struct vcpu *v, unsigned long linear)
 {
     mfn_t sl1mfn;
     shadow_l2e_t sl2e;
@@ -3028,9 +3027,8 @@ static bool sh_invlpg(struct vcpu *v, unsigned long linear)
 
 #ifdef CONFIG_HVM
 
-static unsigned long
-sh_gva_to_gfn(struct vcpu *v, struct p2m_domain *p2m,
-    unsigned long va, uint32_t *pfec)
+static unsigned long cf_check sh_gva_to_gfn(
+    struct vcpu *v, struct p2m_domain *p2m, unsigned long va, uint32_t *pfec)
 /* Called to translate a guest virtual address to what the *guest*
  * pagetables would map it to. */
 {
@@ -3194,8 +3192,7 @@ sh_update_linear_entries(struct vcpu *v)
  * Removes v->arch.paging.shadow.shadow_table[].
  * Does all appropriate management/bookkeeping/refcounting/etc...
  */
-static void
-sh_detach_old_tables(struct vcpu *v)
+static void cf_check sh_detach_old_tables(struct vcpu *v)
 {
     struct domain *d = v->domain;
     mfn_t smfn;
@@ -3214,8 +3211,7 @@ sh_detach_old_tables(struct vcpu *v)
     }
 }
 
-static void
-sh_update_cr3(struct vcpu *v, int do_locking, bool noflush)
+static void cf_check sh_update_cr3(struct vcpu *v, int do_locking, bool noflush)
 /* Updates vcpu->arch.cr3 after the guest has changed CR3.
  * Paravirtual guests should set v->arch.guest_table (and guest_table_user,
  * if appropriate).
@@ -3523,7 +3519,8 @@ int sh_rm_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
 #endif /* OOS */
 
 #if defined(CONFIG_HVM) && (SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC)
-static int sh_guess_wrmap(struct vcpu *v, unsigned long vaddr, mfn_t gmfn)
+static int cf_check sh_guess_wrmap(
+    struct vcpu *v, unsigned long vaddr, mfn_t gmfn)
 /* Look up this vaddr in the current shadow and see if it's a writeable
  * mapping of this gmfn.  If so, remove it.  Returns 1 if it worked. */
 {
@@ -3587,8 +3584,8 @@ static int sh_guess_wrmap(struct vcpu *v, unsigned long vaddr, mfn_t gmfn)
 }
 #endif
 
-int sh_rm_write_access_from_l1(struct domain *d, mfn_t sl1mfn,
-                               mfn_t readonly_mfn)
+int cf_check sh_rm_write_access_from_l1(
+    struct domain *d, mfn_t sl1mfn, mfn_t readonly_mfn)
 /* Excises all writeable mappings to readonly_mfn from this l1 shadow table */
 {
     shadow_l1e_t *sl1e;
@@ -3624,7 +3621,8 @@ int sh_rm_write_access_from_l1(struct domain *d, mfn_t sl1mfn,
 }
 
 
-int sh_rm_mappings_from_l1(struct domain *d, mfn_t sl1mfn, mfn_t target_mfn)
+int cf_check sh_rm_mappings_from_l1(
+    struct domain *d, mfn_t sl1mfn, mfn_t target_mfn)
 /* Excises all mappings to guest frame from this shadow l1 table */
 {
     shadow_l1e_t *sl1e;
@@ -3675,7 +3673,7 @@ void sh_clear_shadow_entry(struct domain *d, void *ep, mfn_t smfn)
     }
 }
 
-int sh_remove_l1_shadow(struct domain *d, mfn_t sl2mfn, mfn_t sl1mfn)
+int cf_check sh_remove_l1_shadow(struct domain *d, mfn_t sl2mfn, mfn_t sl1mfn)
 /* Remove all mappings of this l1 shadow from this l2 shadow */
 {
     shadow_l2e_t *sl2e;
@@ -3698,7 +3696,7 @@ int sh_remove_l1_shadow(struct domain *d, mfn_t sl2mfn, mfn_t sl1mfn)
 }
 
 #if GUEST_PAGING_LEVELS >= 4
-int sh_remove_l2_shadow(struct domain *d, mfn_t sl3mfn, mfn_t sl2mfn)
+int cf_check sh_remove_l2_shadow(struct domain *d, mfn_t sl3mfn, mfn_t sl2mfn)
 /* Remove all mappings of this l2 shadow from this l3 shadow */
 {
     shadow_l3e_t *sl3e;
@@ -3720,7 +3718,7 @@ int sh_remove_l2_shadow(struct domain *d, mfn_t sl3mfn, mfn_t sl2mfn)
     return done;
 }
 
-int sh_remove_l3_shadow(struct domain *d, mfn_t sl4mfn, mfn_t sl3mfn)
+int cf_check sh_remove_l3_shadow(struct domain *d, mfn_t sl4mfn, mfn_t sl3mfn)
 /* Remove all mappings of this l3 shadow from this l4 shadow */
 {
     shadow_l4e_t *sl4e;
@@ -3750,7 +3748,7 @@ int sh_remove_l3_shadow(struct domain *d, mfn_t sl4mfn, mfn_t sl3mfn)
  * and in the meantime we unhook its top-level user-mode entries. */
 
 #if GUEST_PAGING_LEVELS == 3
-static void sh_pagetable_dying(paddr_t gpa)
+static void cf_check sh_pagetable_dying(paddr_t gpa)
 {
     struct vcpu *v = current;
     struct domain *d = v->domain;
@@ -3831,7 +3829,7 @@ static void sh_pagetable_dying(paddr_t gpa)
     put_gfn(d, l3gfn);
 }
 #else
-static void sh_pagetable_dying(paddr_t gpa)
+static void cf_check sh_pagetable_dying(paddr_t gpa)
 {
     struct vcpu *v = current;
     struct domain *d = v->domain;
@@ -3930,7 +3928,7 @@ static const char *sh_audit_flags(struct vcpu *v, int level,
     return NULL;
 }
 
-int sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
 {
     guest_l1e_t *gl1e, *gp;
     shadow_l1e_t *sl1e;
@@ -3998,7 +3996,7 @@ int sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
     return done;
 }
 
-int sh_audit_fl1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
+int cf_check sh_audit_fl1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
 {
     guest_l1e_t *gl1e, e;
     shadow_l1e_t *sl1e;
@@ -4024,7 +4022,7 @@ int sh_audit_fl1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
     return 0;
 }
 
-int sh_audit_l2_table(struct vcpu *v, mfn_t sl2mfn, mfn_t x)
+int cf_check sh_audit_l2_table(struct vcpu *v, mfn_t sl2mfn, mfn_t x)
 {
     struct domain *d = v->domain;
     guest_l2e_t *gl2e, *gp;
@@ -4076,7 +4074,7 @@ int sh_audit_l2_table(struct vcpu *v, mfn_t sl2mfn, mfn_t x)
 }
 
 #if GUEST_PAGING_LEVELS >= 4
-int sh_audit_l3_table(struct vcpu *v, mfn_t sl3mfn, mfn_t x)
+int cf_check sh_audit_l3_table(struct vcpu *v, mfn_t sl3mfn, mfn_t x)
 {
     struct domain *d = v->domain;
     guest_l3e_t *gl3e, *gp;
@@ -4124,7 +4122,7 @@ int sh_audit_l3_table(struct vcpu *v, mfn_t sl3mfn, mfn_t x)
     return 0;
 }
 
-int sh_audit_l4_table(struct vcpu *v, mfn_t sl4mfn, mfn_t x)
+int cf_check sh_audit_l4_table(struct vcpu *v, mfn_t sl4mfn, mfn_t x)
 {
     struct domain *d = v->domain;
     guest_l4e_t *gl4e, *gp;
diff --git a/xen/arch/x86/mm/shadow/multi.h b/xen/arch/x86/mm/shadow/multi.h
index 0bd6a2d5b787..5bcd6ae1a8da 100644
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -59,10 +59,10 @@ extern void
 SHADOW_INTERNAL_NAME(sh_unhook_64b_mappings, GUEST_LEVELS)
     (struct domain *d, mfn_t sl4mfn, int user_only);
 
-extern int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, GUEST_LEVELS)
     (struct domain *d, mfn_t sl1mfn, mfn_t readonly_mfn);
-extern int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, GUEST_LEVELS)
     (struct domain *d, mfn_t sl1mfn, mfn_t target_mfn);
 
@@ -70,30 +70,30 @@ extern void
 SHADOW_INTERNAL_NAME(sh_clear_shadow_entry, GUEST_LEVELS)
     (struct domain *d, void *ep, mfn_t smfn);
 
-extern int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, GUEST_LEVELS)
     (struct domain *d, mfn_t sl2mfn, mfn_t sl1mfn);
-extern int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_remove_l2_shadow, GUEST_LEVELS)
     (struct domain *d, mfn_t sl3mfn, mfn_t sl2mfn);
-extern int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_remove_l3_shadow, GUEST_LEVELS)
     (struct domain *d, mfn_t sl4mfn, mfn_t sl3mfn);
 
 #if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
-int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l1_table, GUEST_LEVELS)
     (struct vcpu *v, mfn_t sl1mfn, mfn_t x);
-int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_fl1_table, GUEST_LEVELS)
     (struct vcpu *v, mfn_t sl1mfn, mfn_t x);
-int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l2_table, GUEST_LEVELS)
     (struct vcpu *v, mfn_t sl2mfn, mfn_t x);
-int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l3_table, GUEST_LEVELS)
     (struct vcpu *v, mfn_t sl3mfn, mfn_t x);
-int
+int cf_check
 SHADOW_INTERNAL_NAME(sh_audit_l4_table, GUEST_LEVELS)
     (struct vcpu *v, mfn_t sl4mfn, mfn_t x);
 #endif
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index e4db8d32546a..3dc024e30f20 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -420,15 +420,15 @@ static inline int sh_remove_write_access(struct domain *d, mfn_t readonly_mfn,
 #endif
 
 /* Functions that atomically write PV guest PT entries */
-void sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new,
-                          mfn_t gmfn);
-intpte_t sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t old,
-                                intpte_t new, mfn_t gmfn);
+void cf_check sh_write_guest_entry(
+    struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn);
+intpte_t cf_check sh_cmpxchg_guest_entry(
+    struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn);
 
 /* Update all the things that are derived from the guest's CR0/CR3/CR4.
  * Called to initialize paging structures if the paging mode
  * has changed, and when bringing up a VCPU for the first time. */
-void shadow_update_paging_modes(struct vcpu *v);
+void cf_check shadow_update_paging_modes(struct vcpu *v);
 
 /* Unhook the non-Xen mappings in this top-level shadow mfn.
  * With user_only == 1, unhooks only the user-mode mappings. */
@@ -922,7 +922,7 @@ static inline int sh_check_page_has_no_refs(struct page_info *page)
 }
 
 /* Flush the TLB of the selected vCPUs. */
-bool shadow_flush_tlb(const unsigned long *vcpu_bitmap);
+bool cf_check shadow_flush_tlb(const unsigned long *vcpu_bitmap);
 
 #endif /* _XEN_SHADOW_PRIVATE_H */
 
diff --git a/xen/arch/x86/mm/shadow/pv.c b/xen/arch/x86/mm/shadow/pv.c
index f51f980f2694..ed10d5479c5e 100644
--- a/xen/arch/x86/mm/shadow/pv.c
+++ b/xen/arch/x86/mm/shadow/pv.c
@@ -28,7 +28,7 @@
  * Write a new value into the guest pagetable, and update the shadows
  * appropriately.
  */
-void
+void cf_check
 sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
 {
     paging_lock(v->domain);
@@ -42,7 +42,7 @@ sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
  * appropriately.  Returns the previous entry found, which the caller is
  * expected to check to see if the cmpxchg was successful.
  */
-intpte_t
+intpte_t cf_check
 sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t old,
                        intpte_t new, mfn_t gmfn)
 {
-- 
2.11.0


