Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA9087AB7E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 17:41:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692628.1079960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRfW-0008Vf-Re; Wed, 13 Mar 2024 16:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692628.1079960; Wed, 13 Mar 2024 16:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRfW-0008U8-Ou; Wed, 13 Mar 2024 16:41:30 +0000
Received: by outflank-mailman (input) for mailman id 692628;
 Wed, 13 Mar 2024 16:41:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6MGe=KT=bounce.vates.tech=bounce-md_30504962.65f1d735.v1-f8f7fb8bad3e41d192062b60b34287b4@srs-se1.protection.inumbo.net>)
 id 1rkRfU-0008TO-Ud
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 16:41:28 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 887fec5c-e158-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 17:41:26 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Tvx9K4d6Cz1XLJlW
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 16:41:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f8f7fb8bad3e41d192062b60b34287b4; Wed, 13 Mar 2024 16:41:25 +0000
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
X-Inumbo-ID: 887fec5c-e158-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710348085; x=1710608585;
	bh=Zy65FkuCvNCvRgOvJCYiFpYTdL1M/+sk4RyW/gW0XNw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dcCRpZdN/62ZxP+p09/Tr+Ta5Ud27/2rmiCFV3nkC/76X/GWzK6dLLQrwCq1OPu8l
	 qy/dQn6hRGYcKItbXp/XPH45ejpf6vW1NtS8fnVPJQriGHaB90oMuq2OQoeQt5M0qV
	 BjxfeB9AKJx6XLmS4JjkzB3Fml/cKOxBjSsbLDTIhjulyCmQwC70pXXIGmKi4R/Diy
	 YPBK4ZsWV67ZAOC/ckEtD+ZZEFupTE8NStGr/d8qX4X4oTDpvXmcuycMBbONPd+TH2
	 03F8zeKkP1Pg1byrxIS/RfqeIQ8UJXqhJFuHgydTEnsdjkwyJJVnMt/WCFDMUuEZqC
	 U/Ff/MSIGv63w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710348085; x=1710608585; i=vaishali.thakkar@vates.tech;
	bh=Zy65FkuCvNCvRgOvJCYiFpYTdL1M/+sk4RyW/gW0XNw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KLtXYWwV30uVfAgwBvYw5asP4U3O9E4iku42+JWVrl8h2t7LGjorhTa6iDNkuJHEP
	 OZ4cCTTCWfhrid/tYUSu1b1DZR892MXbsE9BjX0FciCU8hwxnXZf31sThgB0gvFKka
	 5KK/w9hU/AJ6pJFQMdVs6W7jmZcyxB2i/KfkdCskYxwI+WfsDBIl2bq1jA57cKA6Gk
	 hj3ol6HGSndbPC94AstaOMgWQEfabYTRp/D1flapBJavYg7mB2QOH3SkWztwvqOR4q
	 6AOn1Qx6HU0n+C7O5wi52yMWh/5A2n/BJ0z8zj0i+jrzAZ6jEqa66bD4PftB9iCbz4
	 7IcIeniDsY3KA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=201/3]=20x86/svm:=20Drop=20the=20=5Fenabled=20suffix=20from=20vmcb=20bits?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710348084444
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <ae1ac50228caee9ed2182cadd05a7cb7bf705f50.1710347950.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1710347950.git.vaishali.thakkar@vates.tech>
References: <cover.1710347950.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f8f7fb8bad3e41d192062b60b34287b4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240313:md
Date: Wed, 13 Mar 2024 16:41:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The suffix is redundant for np/sev/sev-es bits. Drop it
to avoid adding extra code volume.

Also, while we're here, drop the double negations in one
of the instances of _np bit, replace 0/1 with false/true
in the use cases of _np and use VMCB accessors instead
of open coding.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
        - Address Andrew and Jan's reviews related to dropping
          double negation and replacing 0/1 with false/true
        - Fix the typo around signed-off-by
Changes since v2:
        - Use VMCB accessors instead of open coding for the
          code that's touched by this commit
---
 xen/arch/x86/hvm/svm/nestedsvm.c        | 14 +++++++-------
 xen/arch/x86/hvm/svm/svm.c              |  2 +-
 xen/arch/x86/hvm/svm/vmcb.c             |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 20 ++++++++++----------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index e4e01add8c..07630d74d3 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( nestedhvm_paging_mode_hap(v) )
     {
         /* host nested paging + guest nested paging. */
-        n2vmcb->_np_enable = 1;
+        vmcb_set_np(n2vmcb, true);
 
         nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
 
@@ -585,7 +585,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     else if ( paging_mode_hap(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
-        n2vmcb->_np_enable = 1;
+        vmcb_set_np(n2vmcb, true);
         /* Keep h_cr3 as it is. */
         n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
         /* When l1 guest does shadow paging
@@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     else
     {
         /* host shadow paging + guest shadow paging. */
-        n2vmcb->_np_enable = 0;
+        vmcb_set_np(n2vmcb, false);
         n2vmcb->_h_cr3 = 0x0;
 
         /* TODO: Once shadow-shadow paging is in place come back to here
@@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     }
 
     /* nested paging for the guest */
-    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
+    svm->ns_hap_enabled = vmcb_get_np(ns_vmcb);
 
     /* Remember the V_INTR_MASK in hostflags */
     svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
@@ -1084,7 +1084,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     if ( nestedhvm_paging_mode_hap(v) )
     {
         /* host nested paging + guest nested paging. */
-        ns_vmcb->_np_enable = n2vmcb->_np_enable;
+        vmcb_set_np(ns_vmcb, vmcb_get_np(n2vmcb));
         ns_vmcb->_cr3 = n2vmcb->_cr3;
         /* The vmcb->h_cr3 is the shadowed h_cr3. The original
          * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
@@ -1093,7 +1093,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     else if ( paging_mode_hap(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
-        ns_vmcb->_np_enable = 0;
+        vmcb_set_np(ns_vmcb, false);
         /* Throw h_cr3 away. Guest is not allowed to set it or
          * it can break out, otherwise (security hole!) */
         ns_vmcb->_h_cr3 = 0x0;
@@ -1104,7 +1104,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     else
     {
         /* host shadow paging + guest shadow paging. */
-        ns_vmcb->_np_enable = 0;
+        vmcb_set_np(ns_vmcb, false);
         ns_vmcb->_h_cr3 = 0x0;
         /* The vmcb->_cr3 is the shadowed cr3. The original
          * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b551eac807..b1ab0b568b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -473,7 +473,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
     if ( paging_mode_hap(v->domain) )
     {
-        vmcb_set_np_enable(vmcb, 1);
+        vmcb_set_np(vmcb, true);
         vmcb_set_g_pat(vmcb, MSR_IA32_CR_PAT_RESET /* guest PAT */);
         vmcb_set_h_cr3(vmcb, pagetable_get_paddr(p2m_get_pagetable(p2m)));
     }
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 282fe7cdbe..4e1f61dbe0 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -133,7 +133,7 @@ static int construct_vmcb(struct vcpu *v)
 
     if ( paging_mode_hap(v->domain) )
     {
-        vmcb->_np_enable = 1; /* enable nested paging */
+        vmcb_set_np(vmcb, true); /* enable nested paging */
         vmcb->_g_pat = MSR_IA32_CR_PAT_RESET; /* guest PAT */
         vmcb->_h_cr3 = pagetable_get_paddr(
             p2m_get_pagetable(p2m_get_hostp2m(v->domain)));
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 91221ff4e2..bf2b8d9a94 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -385,7 +385,7 @@ typedef union
         bool iopm:1;       /* 1:  iopm_base_pa, msrpm_base_pa */
         bool asid:1;       /* 2:  guest_asid */
         bool tpr:1;        /* 3:  vintr */
-        bool np:1;         /* 4:  np_enable, h_cr3, g_pat */
+        bool np:1;         /* 4:  np, h_cr3, g_pat */
         bool cr:1;         /* 5:  cr0, cr3, cr4, efer */
         bool dr:1;         /* 6:  dr6, dr7 */
         bool dt:1;         /* 7:  gdtr, idtr */
@@ -473,12 +473,12 @@ struct vmcb_struct {
     intinfo_t exit_int_info;    /* offset 0x88 */
     union {                     /* offset 0x90 - cleanbit 4 */
         struct {
-            bool _np_enable     :1;
-            bool _sev_enable    :1;
-            bool _sev_es_enable :1;
-            bool _gmet          :1;
-            bool _np_sss        :1;
-            bool _vte           :1;
+            bool _np        :1;
+            bool _sev       :1;
+            bool _sev_es    :1;
+            bool _gmet      :1;
+            bool _np_sss    :1;
+            bool _vte       :1;
         };
         uint64_t _np_ctrl;
     };
@@ -645,9 +645,9 @@ VMCB_ACCESSORS(msrpm_base_pa, iopm)
 VMCB_ACCESSORS(guest_asid, asid)
 VMCB_ACCESSORS(vintr, tpr)
 VMCB_ACCESSORS(np_ctrl, np)
-VMCB_ACCESSORS_(np_enable, bool, np)
-VMCB_ACCESSORS_(sev_enable, bool, np)
-VMCB_ACCESSORS_(sev_es_enable, bool, np)
+VMCB_ACCESSORS_(np, bool, np)
+VMCB_ACCESSORS_(sev, bool, np)
+VMCB_ACCESSORS_(sev_es, bool, np)
 VMCB_ACCESSORS_(gmet, bool, np)
 VMCB_ACCESSORS_(vte, bool, np)
 VMCB_ACCESSORS(h_cr3, np)
-- 
2.44.0

