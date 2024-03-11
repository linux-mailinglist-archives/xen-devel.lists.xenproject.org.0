Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D2878016
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 13:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691469.1077459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjex5-0001To-Mh; Mon, 11 Mar 2024 12:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691469.1077459; Mon, 11 Mar 2024 12:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjex5-0001Rw-Ie; Mon, 11 Mar 2024 12:40:23 +0000
Received: by outflank-mailman (input) for mailman id 691469;
 Mon, 11 Mar 2024 12:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jO/g=KR=bounce.vates.tech=bounce-md_30504962.65eefbb2.v1-baf6d3bc498b4aa2b7c9b531ba09262f@srs-se1.protection.inumbo.net>)
 id 1rjex4-0001Rf-B4
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 12:40:22 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 850c4a39-dfa4-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 13:40:20 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4Ttbw25VXTzB5p4t7
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 12:40:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 baf6d3bc498b4aa2b7c9b531ba09262f; Mon, 11 Mar 2024 12:40:18 +0000
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
X-Inumbo-ID: 850c4a39-dfa4-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710160818; x=1710421318;
	bh=KPvVYpZqmz9UEvKzcaJVoJvfsDLmwkcYJ6FKhk1ss8M=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=p8vkAxuq10vAoTKmOECat0acqO3h0gyDSE5tOZGKhyhHeK6yW0bt1/vTVyB5hAzhu
	 DEvaDkFsMGjUCIeKjppdaYImhnS0rkK3hnGYGnvGgZYzW1UUaB+tFrC9M6uQyzhted
	 fAHpwepwzZ4CwtKgfCdYNtyCVCwBSmtkJuzxNr9RiL1WGxP0DmBqxfMQ8h+8tpXUY5
	 rfrE1nmDEb873seGyZzezc8lQs6lRvU/LXeGSzgZVxKvsCmtVQ6SmE+euxUVhnv2iF
	 1ANNl62BXTg08KIQvY5FkDwvRQBtCV+UQBW2lX5LRB/LgJqUV/WpZ+l8xBYCcDU0Xr
	 oWvUIEC+XJ5Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710160818; x=1710421318; i=vaishali.thakkar@vates.tech;
	bh=KPvVYpZqmz9UEvKzcaJVoJvfsDLmwkcYJ6FKhk1ss8M=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Cyq8/FCo8+YTOdXDgwufyuTDg1AEd/gg8eckxOZfZ5FnhjH+vLPNhPbhBembxFAHc
	 i7EN6kbZxqZfMZxPVM4daspvLW2ZOcPDoXVgVLzbcuzM9Z4LSNb6k31RK29bbOko4O
	 zpQFa85KGaDPRqR9wChnnEJexbbvv98Em1dN7/SIlJ0FATPeXrMUWCbtbvUmQ5O6nR
	 1yKhKkPeqw84QvUMaGIVOGTLAC8xsnUCpkIjy07+HL9uvY1Qm9zdw4abjKtb3HsiBn
	 kTbLBJZ//hsXhodi36G6PQ+tSq7pjwqf/nN94OYAHarnjEwHDDPCGmgFxUdeMsr9RV
	 u3L8/WGYG/AmA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=201/3]=20x86/svm:=20Drop=20the=20=5Fenabled=20suffix=20from=20vmcb=20bits?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710160817615
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <8e6d8cac54ca05f1202580b574c548e08988d8f6.1710149462.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1710149462.git.vaishali.thakkar@vates.tech>
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.baf6d3bc498b4aa2b7c9b531ba09262f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240311:md
Date: Mon, 11 Mar 2024 12:40:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The suffix is redundant for np/sev/sev-es bits. Drop it
to avoid adding extra code volume. While we're here, drop
the double negations in one of the instances of _np bit
and replace 0/1 with false/true in the use cases of _np.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
        - Address Andrew and Jan's reviews related to dropping
          double negation and replacing 0/1 with false/true
        - Fix the typo around signed-off-by
---
 xen/arch/x86/hvm/svm/nestedsvm.c        | 14 +++++++-------
 xen/arch/x86/hvm/svm/svm.c              |  2 +-
 xen/arch/x86/hvm/svm/vmcb.c             |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 18 +++++++++---------
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index e4e01add8c..37548cf05c 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( nestedhvm_paging_mode_hap(v) )
     {
         /* host nested paging + guest nested paging. */
-        n2vmcb->_np_enable = 1;
+        n2vmcb->_np = true;
 
         nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
 
@@ -585,7 +585,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     else if ( paging_mode_hap(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
-        n2vmcb->_np_enable = 1;
+        n2vmcb->_np = true;
         /* Keep h_cr3 as it is. */
         n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
         /* When l1 guest does shadow paging
@@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     else
     {
         /* host shadow paging + guest shadow paging. */
-        n2vmcb->_np_enable = 0;
+        n2vmcb->_np = false;
         n2vmcb->_h_cr3 = 0x0;
 
         /* TODO: Once shadow-shadow paging is in place come back to here
@@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     }
 
     /* nested paging for the guest */
-    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
+    svm->ns_hap_enabled = ns_vmcb->_np;
 
     /* Remember the V_INTR_MASK in hostflags */
     svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
@@ -1084,7 +1084,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     if ( nestedhvm_paging_mode_hap(v) )
     {
         /* host nested paging + guest nested paging. */
-        ns_vmcb->_np_enable = n2vmcb->_np_enable;
+        ns_vmcb->_np = n2vmcb->_np;
         ns_vmcb->_cr3 = n2vmcb->_cr3;
         /* The vmcb->h_cr3 is the shadowed h_cr3. The original
          * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
@@ -1093,7 +1093,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     else if ( paging_mode_hap(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
-        ns_vmcb->_np_enable = 0;
+        ns_vmcb->_np = false;
         /* Throw h_cr3 away. Guest is not allowed to set it or
          * it can break out, otherwise (security hole!) */
         ns_vmcb->_h_cr3 = 0x0;
@@ -1104,7 +1104,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     else
     {
         /* host shadow paging + guest shadow paging. */
-        ns_vmcb->_np_enable = 0;
+        ns_vmcb->_np = false;
         ns_vmcb->_h_cr3 = 0x0;
         /* The vmcb->_cr3 is the shadowed cr3. The original
          * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b551eac807..1b38f6a494 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -473,7 +473,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
 
     if ( paging_mode_hap(v->domain) )
     {
-        vmcb_set_np_enable(vmcb, 1);
+        vmcb_set_np(vmcb, 1);
         vmcb_set_g_pat(vmcb, MSR_IA32_CR_PAT_RESET /* guest PAT */);
         vmcb_set_h_cr3(vmcb, pagetable_get_paddr(p2m_get_pagetable(p2m)));
     }
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 282fe7cdbe..770a0228d4 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -133,7 +133,7 @@ static int construct_vmcb(struct vcpu *v)
 
     if ( paging_mode_hap(v->domain) )
     {
-        vmcb->_np_enable = 1; /* enable nested paging */
+        vmcb->_np = true; /* enable nested paging */
         vmcb->_g_pat = MSR_IA32_CR_PAT_RESET; /* guest PAT */
         vmcb->_h_cr3 = pagetable_get_paddr(
             p2m_get_pagetable(p2m_get_hostp2m(v->domain)));
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 91221ff4e2..76507576ba 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
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

