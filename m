Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5463587597A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 22:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690042.1075688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riLTE-0000SA-35; Thu, 07 Mar 2024 21:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690042.1075688; Thu, 07 Mar 2024 21:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riLTD-0000Pv-To; Thu, 07 Mar 2024 21:40:07 +0000
Received: by outflank-mailman (input) for mailman id 690042;
 Thu, 07 Mar 2024 21:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXNf=KN=bounce.vates.tech=bounce-md_30504962.65ea3433.v1-68cdb6bd0a584db49c51c55065d55838@srs-se1.protection.inumbo.net>)
 id 1riLTC-0000KD-KF
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 21:40:06 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f7076b-dccb-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 22:40:04 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4TrN4g4M2JzB5pBbr
 for <xen-devel@lists.xenproject.org>; Thu,  7 Mar 2024 21:40:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 68cdb6bd0a584db49c51c55065d55838; Thu, 07 Mar 2024 21:40:03 +0000
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
X-Inumbo-ID: 41f7076b-dccb-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1709847603; x=1710108103;
	bh=cceUZwddrDnmNjiA/VLcSBuFRH5W1h6hq9ubKjkkGx4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Nf3vYPSabMg0FqmQ9PsDIBIIi/jF2P5Q7FaQbxA+0dejiS0mCe/SNTlRW6Dvfa9IP
	 4dK9/WLu6DqKNGcU+zJ4yaAHoxWi0I4XTxeKFO+Kk5x0xL2xkZY//AZrerOpvtVIkL
	 OHaxAFY4uDGNTr9Zr7pBWGEXhJp/JspMCR5GV1ZhSoLyQbwKaupTtuCJH8SN96X30x
	 Z19Nfo8vzqAX6Kped99IpgH69iK2u8Y/Q4K5l/YPI3t+lw6Y9P3qcAlUfB89xYEtFv
	 HEi1YlC2l6E/YVPDhhj2QXeTJPvZHH32SjAloy1sPzsfCgSkAb0i31Van1K8nINocY
	 NejYkgryOmpwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1709847603; x=1710108103; i=vaishali.thakkar@vates.tech;
	bh=cceUZwddrDnmNjiA/VLcSBuFRH5W1h6hq9ubKjkkGx4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0cgekZOBujBqiZIDtmTYdTBGgVu+Z0SW5lnts6/DjQ0jw54OOdsZwkTBYJubhVRUr
	 k1HZ/uFyQ9VPAW3Q6h1z50Kbi65WsfWWpM747HooKFadtlLvZiuby6+NSZKeiEfRBI
	 VDST4VEjG6f+8TrOAisKBTORO9TlhPLkxMxegqgY1H1BAAAF8EJ/epT8m238SdBpUn
	 BqUF6zRyuGfkHCvgqUgcl3l+QUGwxAit0Ab5Dxa/De7/sc8OrCSu/+dFXylqQM34hT
	 YUO9M9H6cf4ggJ90UGRfb1OazZCcSUMdx9WkMNkaNNfid1sgQ5jhF+J9ygLeFOxfFk
	 mR8407PdUiiWQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/2]=20x86/svm:=20Drop=20the=20=5Fenabled=20suffix=20from=20vmcb=20bits?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1709847602167
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <3c419824febca229cedf2a3bd42cb68d3a3d56a8.1709846387.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1709846387.git.vaishali.thakkar@vates.tech>
References: <cover.1709846387.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.68cdb6bd0a584db49c51c55065d55838?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240307:md
Date: Thu, 07 Mar 2024 21:40:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The suffix is redundant for np/sev/sev-es bits. Drop it
to avoid adding extra code volume.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>i
---
 xen/arch/x86/hvm/svm/nestedsvm.c        | 14 +++++++-------
 xen/arch/x86/hvm/svm/svm.c              |  2 +-
 xen/arch/x86/hvm/svm/vmcb.c             |  2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 18 +++++++++---------
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index e4e01add8c..7e285cf85a 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     if ( nestedhvm_paging_mode_hap(v) )
     {
         /* host nested paging + guest nested paging. */
-        n2vmcb->_np_enable = 1;
+        n2vmcb->_np = 1;
 
         nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
 
@@ -585,7 +585,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     else if ( paging_mode_hap(v->domain) )
     {
         /* host nested paging + guest shadow paging. */
-        n2vmcb->_np_enable = 1;
+        n2vmcb->_np = 1;
         /* Keep h_cr3 as it is. */
         n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
         /* When l1 guest does shadow paging
@@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     else
     {
         /* host shadow paging + guest shadow paging. */
-        n2vmcb->_np_enable = 0;
+        n2vmcb->_np = 0;
         n2vmcb->_h_cr3 = 0x0;
 
         /* TODO: Once shadow-shadow paging is in place come back to here
@@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     }
 
     /* nested paging for the guest */
-    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
+    svm->ns_hap_enabled = !!ns_vmcb->_np;
 
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
+        ns_vmcb->_np = 0;
         /* Throw h_cr3 away. Guest is not allowed to set it or
          * it can break out, otherwise (security hole!) */
         ns_vmcb->_h_cr3 = 0x0;
@@ -1104,7 +1104,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     else
     {
         /* host shadow paging + guest shadow paging. */
-        ns_vmcb->_np_enable = 0;
+        ns_vmcb->_np = 0;
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
index 282fe7cdbe..a8dd87ca36 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -133,7 +133,7 @@ static int construct_vmcb(struct vcpu *v)
 
     if ( paging_mode_hap(v->domain) )
     {
-        vmcb->_np_enable = 1; /* enable nested paging */
+        vmcb->_np = 1; /* enable nested paging */
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

