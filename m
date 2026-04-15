Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGxbJ3OT32kiWQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158F404D11
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 15:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282449.1565041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Lx-0000Zb-1m; Wed, 15 Apr 2026 13:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282449.1565041; Wed, 15 Apr 2026 13:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0Lw-0000XL-UK; Wed, 15 Apr 2026 13:32:24 +0000
Received: by outflank-mailman (input) for mailman id 1282449;
 Wed, 15 Apr 2026 13:32:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df9364.v1-549f1328209a4bf6a574e4c88ba3cd82@bounce.vates.tech>)
 id 1wD0Lu-0000Vi-R3
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:32:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0Lu-002WU8-7f
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:32:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df9364.v1-549f1328209a4bf6a574e4c88ba3cd82@bounce.vates.tech>)
 id 69df935d-bab6-0a2a0a5309dd-0a2a45068222-44
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:22 +0200
Received: from [198.2.186.1] (helo=mail186-1.suw21.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df9364.v1-549f1328209a4bf6a574e4c88ba3cd82@bounce.vates.tech>)
 id 69df9365-0df0-0a2a45060019-c602ba012713-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:32:21 +0200
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4fwhs05lXXzBsV0jL
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 549f1328209a4bf6a574e4c88ba3cd82; Wed, 15 Apr 2026 13:32:20 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259940; x=1776529940;
	bh=6GgW9zqjU7eafFgo+aMF5dqgD8VnWAi/yFVJIMHbHCg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=M/DcqyVjR/cY6vyn1nwNEyOdFK41VqfPRkEf8M2hmsDIRAFT8OsZ/mMoK9FpeSdCu
	 M4XM5s9vYiVDx7WOixvesMgEEsvJ3iEWNPEn8LAFoUvH2eXy28TGFtJyDiRmxjmaJI
	 SiuAe+e61IuADQEmQc7TtAUGSyoWO+z2PWz9EnR4XLHjdFDSx0He8zcdVD/pBV7o7u
	 8+VgCnCQ02WSqJn81P0c7+zRQPJHTKn89PACppphLIRwwDjroL3TQAK/icmlLEDrLU
	 Fnf1ZH+nWfbnPhD57jfaC4XnPr4ndRFz/NHFxKgtH1tuMFJFsWyNL/69Mnh7wLBxJb
	 bgxaTo/QXk82w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259940; x=1776520440; i=teddy.astie@vates.tech;
	bh=6GgW9zqjU7eafFgo+aMF5dqgD8VnWAi/yFVJIMHbHCg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jithJSCaP3cYKzWK9+hoC7D6Nl4asINeWNx5+ssXORJ6d6cfKP2b9rHme4Nl1PnnW
	 zRsj6HYHAFchkQNHVhBL22Tj+TvmyC/+2/dpX2GEf9anFD1N6HqtMmrxAsTsCpSKFG
	 S5Oedq0nfY7ebLatQHsX2xq/HN0jr2qskwpSJp2Roc60xhwCF/KZJxta2skzvJU6TN
	 YUgrgDzLBKUpcT9GBtQodtK4jG8C1EtfU0LoolYWoIrj6rQAaMSpWhQFPO2J7HogEh
	 4FIcUXORTsJLaUF5Lucy6JUMInZAe+bb/1rZ00JOBqX4zl9koGel8mEonC6I05kDVI
	 DpWuXF/w4DvLw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=204/7]=20x86:=20Set=20v->needs=5Ftlb=5Fflush=20when=20needed?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259938505
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, "Tim Deegan" <tim@xen.org>
Message-Id: <3415abe736e46b3f36ccb045aa5144a371774fba.1776259594.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1776259594.git.teddy.astie@vates.tech>
References: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.549f1328209a4bf6a574e4c88ba3cd82?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776259942-5FB3B3D8-53BADBDA/0/0
X-purgate-type: clean
X-purgate-size: 7788
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:tim@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.883];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1158F404D11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sets v->needs_tlb_flush in where a tlb flush is expected
to be scheduled on the vCPU.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
The goal here is to avoid too much noise in [1], hence it currently
cohexists with hvm_asid_flush_vcpu(), but [1] will drop
hvm_asid_flush_vcpu() and only keep needs_tlb_flush.

[1] x86/hvm: Transition to needs_tlb_flush logic, use  per-domain ASID

 xen/arch/x86/flushtlb.c        | 4 ++++
 xen/arch/x86/hvm/emulate.c     | 1 +
 xen/arch/x86/hvm/hvm.c         | 1 +
 xen/arch/x86/hvm/svm/svm.c     | 5 +++++
 xen/arch/x86/hvm/vmx/vmcs.c    | 1 +
 xen/arch/x86/hvm/vmx/vmx.c     | 3 +++
 xen/arch/x86/hvm/vmx/vvmx.c    | 1 +
 xen/arch/x86/mm/p2m.c          | 4 ++++
 xen/arch/x86/mm/paging.c       | 1 +
 xen/arch/x86/mm/shadow/multi.c | 1 +
 10 files changed, 22 insertions(+)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 23721bb52c..8ee2385bba 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -324,7 +324,11 @@ unsigned int guest_flush_tlb_flags(const struct domain *d)
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
 {
     unsigned int flags = guest_flush_tlb_flags(d);
+    struct vcpu *v;
 
     if ( flags )
         flush_mask(mask, flags);
+
+    for_each_vcpu(d, v)
+        v->needs_tlb_flush = true;
 }
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index f3aae158e9..3bc1d321cc 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2657,6 +2657,7 @@ static int cf_check hvmemul_tlb_op(
         if ( x86emul_invpcid_type(aux) != X86_INVPCID_INDIV_ADDR )
         {
             hvm_asid_flush_vcpu(current);
+            current->needs_tlb_flush = true;
             break;
         }
         aux = x86emul_invpcid_pcid(aux);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4a81afce02..0f0b0e242f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1613,6 +1613,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     struct domain *d = v->domain;
 
     hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
 
     spin_lock_init(&v->arch.hvm.tm_lock);
     INIT_LIST_HEAD(&v->arch.hvm.tm_list);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 58e927ae04..64c08432fd 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -138,6 +138,8 @@ static void cf_check svm_update_guest_cr(
         {
             if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
                 hvm_asid_flush_vcpu(v);
+                
+            v->needs_tlb_flush = true;
         }
         else if ( nestedhvm_vmswitch_in_progress(v) )
             ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB. */
@@ -944,6 +946,7 @@ static void noreturn cf_check svm_do_resume(void)
         hvm_migrate_pirqs(v);
         /* Migrating to another ASID domain.  Request a new ASID. */
         hvm_asid_flush_vcpu(v);
+        v->needs_tlb_flush = true;
     }
 
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
@@ -2306,6 +2309,8 @@ static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
     /* Safe fallback. Take a new ASID. */
     hvm_asid_flush_vcpu(v);
+    /* Schedule a tlb flush on the VCPU. */
+    v->needs_tlb_flush = true;
 }
 
 static bool cf_check svm_get_pending_event(
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 8e52ef4d49..4efe13e07f 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1904,6 +1904,7 @@ void cf_check vmx_do_resume(void)
         v->arch.hvm.vmx.hostenv_migrated = 1;
 
         hvm_asid_flush_vcpu(v);
+        v->needs_tlb_flush = true;
     }
 
     debug_state = v->domain->debugger_attached
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ec0a790336..0e4f9f9c3d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1511,6 +1511,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
 
             wbinvd();               /* flush possibly polluted cache */
             hvm_asid_flush_vcpu(v); /* invalidate memory type cached in TLB */
+            v->needs_tlb_flush = true; /* invalidate memory type cached in TLB */
             v->arch.hvm.vmx.cache_mode = CACHE_MODE_NO_FILL;
         }
         else
@@ -1520,6 +1521,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, unsigned long value)
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
             hvm_asid_flush_vcpu(v); /* no need to flush cache */
+            v->needs_tlb_flush = true;
         }
     }
 }
@@ -1872,6 +1874,7 @@ static void cf_check vmx_update_guest_cr(
 
         if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
             hvm_asid_flush_vcpu(v);
+        v->needs_tlb_flush = true;
         break;
 
     default:
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index e4cdfe55c1..16d6f1d61b 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1254,6 +1254,7 @@ static void virtual_vmentry(struct cpu_user_regs *regs)
         if ( nvmx->guest_vpid != new_vpid )
         {
             hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
+            v->needs_tlb_flush = true;
             nvmx->guest_vpid = new_vpid;
         }
     }
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index fddecdf978..910623ac93 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -25,6 +25,7 @@
 #include <asm/p2m.h>
 #include <asm/mem_sharing.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/vcpu.h>
 #include <asm/altp2m.h>
 #include <asm/vm_event.h>
 #include <xsm/xsm.h>
@@ -1439,6 +1440,7 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
     vcpu_nestedhvm(v).nv_p2m = NULL;
     p2m_flush_table(p2m);
     hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
 }
 
 void
@@ -1498,6 +1500,7 @@ static void assign_np2m(struct vcpu *v, struct p2m_domain *p2m)
 static void nvcpu_flush(struct vcpu *v)
 {
     hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
     vcpu_nestedhvm(v).stale_np2m = true;
 }
 
@@ -1618,6 +1621,7 @@ void np2m_schedule(int dir)
             {
                 /* This vCPU's np2m was flushed while it was not runnable */
                 hvm_asid_flush_core();
+                curr->needs_tlb_flush = true;
                 vcpu_nestedhvm(curr).nv_p2m = NULL;
             }
             else
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 2396f81ad5..b0b3bef753 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -939,6 +939,7 @@ void paging_update_nestedmode(struct vcpu *v)
         /* TODO: shadow-on-shadow */
         v->arch.paging.nestedmode = NULL;
     hvm_asid_flush_vcpu(v);
+    v->needs_tlb_flush = true;
 }
 
 int __init paging_set_allocation(struct domain *d, unsigned int pages,
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 80cd3299fa..2df2842138 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3165,6 +3165,7 @@ sh_update_linear_entries(struct vcpu *v)
      * without this change, it would fetch the wrong value due to a stale TLB.
      */
     sh_flush_local(d);
+    v->needs_tlb_flush = true;
 }
 
 static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


