Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38B1878017
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 13:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691470.1077465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjex6-0001bn-2S; Mon, 11 Mar 2024 12:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691470.1077465; Mon, 11 Mar 2024 12:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjex5-0001XA-Vt; Mon, 11 Mar 2024 12:40:23 +0000
Received: by outflank-mailman (input) for mailman id 691470;
 Mon, 11 Mar 2024 12:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXtE=KR=bounce.vates.tech=bounce-md_30504962.65eefbb4.v1-ba8489844df646b8be3e19510b24de5f@srs-se1.protection.inumbo.net>)
 id 1rjex4-0001Rf-IE
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 12:40:22 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85ae7c8b-dfa4-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 13:40:21 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Ttbw42Nt0z1XLHZT
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 12:40:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ba8489844df646b8be3e19510b24de5f; Mon, 11 Mar 2024 12:40:20 +0000
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
X-Inumbo-ID: 85ae7c8b-dfa4-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710160820; x=1710421320;
	bh=Cxgq3bbdihMzzz0i/yJ6y0gLddK7ZJN9AgjAgXDglbY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ewq9IwVliO7fJjXd7JSJPnb4ywN9wTTx2jye8wjZNGU0eoCTC0aZQzrrRQjsWBXdA
	 Wy8yh/dqthYroV9uSuGuv+/sVKrAQRVugZro7WVwTfcM8K4O/X+435G/YNRMN3KmR1
	 nQp2ztlYJh8Qoko8XcoiS3IAY0h39RmQQ9e7wL3rWSDfiHdHM6RQQCwmhASXV7aKCq
	 1YwAXPXqyzoaEujfsDTzpRK+YHtmK0GaC+1M2nMWLYTZxy6BOwTrx362mRc7K1QdK1
	 aDy/0SGoYEIwlm4kojcR8ls8GJsLp08j6QwEyVwTciAMEZWV0cREO7o5dDbrHGppgx
	 MRFt4bIDwMXtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710160820; x=1710421320; i=vaishali.thakkar@vates.tech;
	bh=Cxgq3bbdihMzzz0i/yJ6y0gLddK7ZJN9AgjAgXDglbY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EPJLYuhCeQWHHb/RwHi5+jxffaZLJco29SZ99Rxu7aiAGdwhTJMIgn2ajhSBId+ru
	 rDfYOkvohrFAauPB5AAdF7Kz9qYtx9X5e5u5//iC6ccKKce+wKoWvfWxRL+nMNhW+s
	 1a6SGNT7etd171Jtp78QiTNVFUFSJL5kKz8bc7sefqfBIaOjeZaipZDg7Dp6j0xEA9
	 OtMcqhtHxTwkdLKFsxzgfgGZNU7t6jGqvkeAiIP6/w/OsXXU21zVsDi/YL7Jvignwt
	 PIWS0TWdih6eDTfp1FD34bKCGF8I2oh93wpt5mmbeNTCXs5GJhpDY85BU52kOnPWva
	 ku0dA3aX9OuoA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=202/3]=20x86/svm:=20Drop=20the=20suffix=20=5Fguest=20from=20vmcb=20bit?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710160819329
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <b0e5dde517599e8af5aadbaff7dd4410e83fcf86.1710149462.git.vaishali.thakkar@vates.tech>
In-Reply-To: <cover.1710149462.git.vaishali.thakkar@vates.tech>
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ba8489844df646b8be3e19510b24de5f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240311:md
Date: Mon, 11 Mar 2024 12:40:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The suffix _guest is redundant for asid bit. Drop it
to avoid adding extra code volume.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
Changes since v1:
        - This patch wasn't part of v1. It's been added to
          address Andrew's suggestion.
---
 xen/arch/x86/hvm/svm/asid.c                  | 6 +++---
 xen/arch/x86/hvm/svm/nestedsvm.c             | 8 ++++----
 xen/arch/x86/hvm/svm/svmdebug.c              | 4 ++--
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h | 2 +-
 xen/arch/x86/include/asm/hvm/svm/vmcb.h      | 6 +++---
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 28e0dbc176..d5f70f8848 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -37,14 +37,14 @@ void svm_asid_handle_vmrun(void)
     /* ASID 0 indicates that ASIDs are disabled. */
     if ( p_asid->asid == 0 )
     {
-        vmcb_set_guest_asid(vmcb, 1);
+        vmcb_set_asid(vmcb, 1);
         vmcb->tlb_control =
             cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_ALL;
         return;
     }
 
-    if ( vmcb_get_guest_asid(vmcb) != p_asid->asid )
-        vmcb_set_guest_asid(vmcb, p_asid->asid);
+    if ( vmcb_get_asid(vmcb) != p_asid->asid )
+        vmcb_set_asid(vmcb, p_asid->asid);
 
     vmcb->tlb_control =
         !need_flush ? TLB_CTRL_NO_FLUSH :
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 37548cf05c..adbd49b5a2 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -157,7 +157,7 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_hap_enabled = 0;
     svm->ns_vmcb_guestcr3 = 0;
     svm->ns_vmcb_hostcr3 = 0;
-    svm->ns_guest_asid = 0;
+    svm->ns_asid = 0;
     svm->ns_hostflags.bytes = 0;
     svm->ns_vmexit.exitinfo1 = 0;
     svm->ns_vmexit.exitinfo2 = 0;
@@ -698,11 +698,11 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     /* Convert explicitely to boolean. Deals with l1 guests
      * that use flush-by-asid w/o checking the cpuid bits */
     nv->nv_flushp2m = !!ns_vmcb->tlb_control;
-    if ( svm->ns_guest_asid != ns_vmcb->_guest_asid )
+    if ( svm->ns_asid != ns_vmcb->_asid )
     {
         nv->nv_flushp2m = 1;
         hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
-        svm->ns_guest_asid = ns_vmcb->_guest_asid;
+        svm->ns_asid = ns_vmcb->_asid;
     }
 
     /* nested paging for the guest */
@@ -1046,7 +1046,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /* Keep it. It's maintainted by the l1 guest. */
 
     /* ASID */
-    /* ns_vmcb->_guest_asid = n2vmcb->_guest_asid; */
+    /* ns_vmcb->_asid = n2vmcb->_asid; */
 
     /* TLB control */
     ns_vmcb->tlb_control = 0;
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index 24358c6eea..0d714c728c 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -51,8 +51,8 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
            vmcb->exitcode, vmcb->exit_int_info.raw);
     printk("exitinfo1 = %#"PRIx64" exitinfo2 = %#"PRIx64"\n",
            vmcb->exitinfo1, vmcb->exitinfo2);
-    printk("np_ctrl = %#"PRIx64" guest_asid = %#x\n",
-           vmcb_get_np_ctrl(vmcb), vmcb_get_guest_asid(vmcb));
+    printk("np_ctrl = %#"PRIx64" asid = %#x\n",
+           vmcb_get_np_ctrl(vmcb), vmcb_get_asid(vmcb));
     printk("virtual vmload/vmsave = %d, virt_ext = %#"PRIx64"\n",
            vmcb->virt_ext.fields.vloadsave_enable, vmcb->virt_ext.bytes);
     printk("cpl = %d efer = %#"PRIx64" star = %#"PRIx64" lstar = %#"PRIx64"\n",
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 406fc082b1..7767cd6080 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -51,7 +51,7 @@ struct nestedsvm {
      *     the l1 guest nested page table
      */
     uint64_t ns_vmcb_guestcr3, ns_vmcb_hostcr3;
-    uint32_t ns_guest_asid;
+    uint32_t ns_asid;
 
     bool ns_hap_enabled;
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 76507576ba..5d539fcdcf 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -383,7 +383,7 @@ typedef union
         bool intercepts:1; /* 0:  cr/dr/exception/general intercepts,
                             *     pause_filter_count, tsc_offset */
         bool iopm:1;       /* 1:  iopm_base_pa, msrpm_base_pa */
-        bool asid:1;       /* 2:  guest_asid */
+        bool asid:1;       /* 2:  asid */
         bool tpr:1;        /* 3:  vintr */
         bool np:1;         /* 4:  np_enable, h_cr3, g_pat */
         bool cr:1;         /* 5:  cr0, cr3, cr4, efer */
@@ -413,7 +413,7 @@ struct vmcb_struct {
     u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
     u64 _msrpm_base_pa;         /* offset 0x48 - cleanbit 1 */
     u64 _tsc_offset;            /* offset 0x50 - cleanbit 0 */
-    u32 _guest_asid;            /* offset 0x58 - cleanbit 2 */
+    u32 _asid;                  /* offset 0x58 - cleanbit 2 */
     u8  tlb_control;            /* offset 0x5C - TLB_CTRL_* */
     u8  res07[3];
     vintr_t _vintr;             /* offset 0x60 - cleanbit 3 */
@@ -642,7 +642,7 @@ VMCB_ACCESSORS(pause_filter_thresh, intercepts)
 VMCB_ACCESSORS(tsc_offset, intercepts)
 VMCB_ACCESSORS(iopm_base_pa, iopm)
 VMCB_ACCESSORS(msrpm_base_pa, iopm)
-VMCB_ACCESSORS(guest_asid, asid)
+VMCB_ACCESSORS(asid, asid)
 VMCB_ACCESSORS(vintr, tpr)
 VMCB_ACCESSORS(np_ctrl, np)
 VMCB_ACCESSORS_(np, bool, np)
-- 
2.44.0

