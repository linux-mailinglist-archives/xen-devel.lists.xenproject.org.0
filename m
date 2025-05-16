Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09CAB98E4
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986619.1372170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPx-0008PB-59; Fri, 16 May 2025 09:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986619.1372170; Fri, 16 May 2025 09:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPx-0008NW-1C; Fri, 16 May 2025 09:31:49 +0000
Received: by outflank-mailman (input) for mailman id 986619;
 Fri, 16 May 2025 09:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5m+b=YA=bounce.vates.tech=bounce-md_30504962.682705fa.v1-dc3866fe00dd4d1cb15f5f7e0a1d2dc4@srs-se1.protection.inumbo.net>)
 id 1uFrPv-0007iv-CN
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:31:47 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c81fea-3238-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:31:46 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzMKQ0z9JzMQxf5l
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:31:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dc3866fe00dd4d1cb15f5f7e0a1d2dc4; Fri, 16 May 2025 09:31:38 +0000
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
X-Inumbo-ID: 95c81fea-3238-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747387898; x=1747657898;
	bh=Pu9DXVzNtDp7vBm0SeMKn1Apw+Y0YN30HfO50Yk2htE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=J/nNHdh2qp9sPkOvbrRg/IHWwj+kWKEeaS/iuBP18i/Otyn3yWK/Wbn5U+0OfImI3
	 D1xifpocdfuK61avf3HicCWyAb3t+up1exCbiRwggw+tflsPlGdfWzs3W2dZgryhqs
	 TZjNZzKAxHCFXlssL3caV03s62eDOJxDuhUODK2ZDrTADnN88jd42OVPL6vAS7hYdZ
	 uFXru8ytUsE++ExD1v7XuVwXOyUodgZRn5tNxmG06Z/KY3t5CcMcEP0S8OQnAgldLj
	 hXsah7ld8jgmP4kHcZ71S4moVKJc6JtLW1DTGkklU2MLDsJc33ULlBg90ai9a1z0jj
	 c/DMlMzOh3xjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747387898; x=1747648398; i=teddy.astie@vates.tech;
	bh=Pu9DXVzNtDp7vBm0SeMKn1Apw+Y0YN30HfO50Yk2htE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=E6oc20jCZY9it3AXgPjsovD8HM6gjOfKj+LgN4h+JhBSLEN+erYSegBU1Nmb9R842
	 0gR1VS2S9+7OQxU+egl3eCurI6Jfia4HT4bb8VP4IXxZOpxEIB7QAH68Uj69W7irSe
	 RsRhGk1FVyrEaOxhnjDAz31oIFaikUNuTosPR13tEFGmL5B8TRg60vKksOlBYcmALy
	 8z1nAVMGo9AZlsSbh5ThzsBDtdtj3YttlLdWDCkcc8Nrq0Idw1a3oi8w0kLraMgpE5
	 DmpYfInB+KPOth0mr7lYol6atWm7P3NEcExvx7bTb1HbrZgLA5fambEtPVC31RBw7I
	 O96eR55C3FsEQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2003/16]=20x86/hvm:=20Add=20support=20for=20physical=20address=20ABI?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747387896927
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <ab0f146b8543629823dfd60a340278c206ab1d5d.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dc3866fe00dd4d1cb15f5f7e0a1d2dc4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 09:31:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Guest can tag their hypercalls with 0x40000000 in order to use this
alternative ABI that uses physical addresses instead of linear ones.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
This one is based on the "HVMv2 ABI" RFC, but reworked in a way that is more
compatible with existing guest (guest need to opt-in abi for a specific
hypercall).

Andrew has some plans regarding making a better HVM ABI for that, but it is
a first start for this RFC.
---
 xen/arch/x86/hvm/hvm.c       | 17 ++++++++++++++---
 xen/arch/x86/hvm/hypercall.c | 17 +++++++++++++----
 xen/include/xen/sched.h      |  2 ++
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cb2e13046..0e7c453b24 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3497,7 +3497,11 @@ unsigned int copy_to_user_hvm(void *to, const void *from, unsigned int len)
         return 0;
     }
 
-    rc = hvm_copy_to_guest_linear((unsigned long)to, from, len, 0, NULL);
+    if ( evaluate_nospec(current->hcall_physaddr) )
+        rc = hvm_copy_to_guest_phys((unsigned long)to, from, len, current);
+    else
+        rc = hvm_copy_to_guest_linear((unsigned long)to, from, len, 0, NULL);
+
     return rc ? len : 0; /* fake a copy_to_user() return code */
 }
 
@@ -3511,7 +3515,10 @@ unsigned int clear_user_hvm(void *to, unsigned int len)
         return 0;
     }
 
-    rc = hvm_copy_to_guest_linear((unsigned long)to, NULL, len, 0, NULL);
+    if ( evaluate_nospec(current->hcall_physaddr) )
+        rc = hvm_copy_to_guest_phys((unsigned long)to, NULL, len, current);
+    else
+        rc = hvm_copy_to_guest_linear((unsigned long)to, NULL, len, 0, NULL);
 
     return rc ? len : 0; /* fake a clear_user() return code */
 }
@@ -3526,7 +3533,11 @@ unsigned int copy_from_user_hvm(void *to, const void *from, unsigned int len)
         return 0;
     }
 
-    rc = hvm_copy_from_guest_linear(to, (unsigned long)from, len, 0, NULL);
+    if ( evaluate_nospec(current->hcall_physaddr) )
+        rc = hvm_copy_from_guest_phys(to, (unsigned long)from, len);
+    else
+        rc = hvm_copy_from_guest_linear(to, (unsigned long)from, len, 0, NULL);
+
     return rc ? len : 0; /* fake a copy_from_user() return code */
 }
 
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 6f8dfdff4a..b891089cda 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -160,8 +160,13 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx)",
                     eax, regs->rdi, regs->rsi, regs->rdx, regs->r10, regs->r8);
 
-        call_handlers_hvm64(eax, regs->rax, regs->rdi, regs->rsi, regs->rdx,
-                            regs->r10, regs->r8);
+        if ( eax & 0x40000000U )
+            curr->hcall_physaddr = true;
+
+        call_handlers_hvm64(eax & ~0x40000000U, regs->rax, regs->rdi, regs->rsi,
+                            regs->rdx, regs->r10, regs->r8);
+
+        curr->hcall_physaddr = false;
 
         if ( !curr->hcall_preempted && regs->rax != -ENOSYS )
             clobber_regs(regs, eax, hvm, 64);
@@ -172,9 +177,13 @@ int hvm_hypercall(struct cpu_user_regs *regs)
                     regs->ebx, regs->ecx, regs->edx, regs->esi, regs->edi);
 
         curr->hcall_compat = true;
-        call_handlers_hvm32(eax, regs->eax, regs->ebx, regs->ecx, regs->edx,
-                            regs->esi, regs->edi);
+        if ( eax & 0x40000000U )
+            curr->hcall_physaddr = true;
+
+        call_handlers_hvm32(eax & ~0x40000000U, regs->eax, regs->ebx, regs->ecx,
+                            regs->edx, regs->esi, regs->edi);
         curr->hcall_compat = false;
+        curr->hcall_physaddr = false;
 
         if ( !curr->hcall_preempted && regs->eax != -ENOSYS )
             clobber_regs(regs, eax, hvm, 32);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c..4ce9253284 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -240,6 +240,8 @@ struct vcpu
     bool             hcall_compat;
     /* Physical runstate area registered via compat ABI? */
     bool             runstate_guest_area_compat;
+    /* A hypercall is using the physical address ABI? */
+    bool             hcall_physaddr;
 #endif
 
 #ifdef CONFIG_IOREQ_SERVER
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


