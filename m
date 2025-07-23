Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19870B0EE0B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 11:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053628.1422387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVQG-0007fw-W7; Wed, 23 Jul 2025 09:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053628.1422387; Wed, 23 Jul 2025 09:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVQG-0007ds-TG; Wed, 23 Jul 2025 09:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1053628;
 Wed, 23 Jul 2025 09:05:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqtW=2E=bounce.vates.tech=bounce-md_30504962.6880a5f4.v1-fb427a3363674315bd01b4d0db7342d7@srs-se1.protection.inumbo.net>)
 id 1ueVQF-0007Wy-PZ
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 09:05:59 +0000
Received: from mail132-21.atl131.mandrillapp.com
 (mail132-21.atl131.mandrillapp.com [198.2.132.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ec88e3e-67a4-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 11:05:58 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4bn7XN72cNz1XLW09
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 09:05:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fb427a3363674315bd01b4d0db7342d7; Wed, 23 Jul 2025 09:05:56 +0000
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
X-Inumbo-ID: 3ec88e3e-67a4-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753261557; x=1753531557;
	bh=+gszZElYn+lb5gI2E7OsKENBYfCudiALczJKzBzKwao=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=N0s7Y+EPjW/iVAGx+8pLw73vyjx9FytIfT6Jq0UIeclSyXorhQTULJbXFhujRbt8V
	 7EOFI+nN5aBoDSarECBH4U/uKrjpgm5kbM6EegXPK/IoLdUNlonImpyFKfnRggx3q/
	 XArQzKs1gkLgs0676c2Mgl2thd+BRCwnRiUk2a+s7/JkHCBRjYEKzQgFLizGpM0NfG
	 JIKcDIY3BMFL1ij6Bvdfcg4/oZluHPzInhmXzJem/va9sQK34ApnpktBnI7hVXe3mX
	 1ro1Iu3dKeVIRiRNQQtWeeiKjhg6dYJsKQe9qs/nH+Q85gS7W1KnevvPskqBEowjfI
	 6TtasuIeGtwBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753261557; x=1753522057; i=teddy.astie@vates.tech;
	bh=+gszZElYn+lb5gI2E7OsKENBYfCudiALczJKzBzKwao=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=S6RdVNCf8QeeNQpMwU1syxjK7A+HcRgKbWvlP//ixtYDekq9pjGqlDZKO0ASjgrmn
	 /kgR0IWvqVm/1nxlOg8kq/Ngn1jDx0RBmCVaRzXZrM6txF3vBxuV2GU7dD2anBwg0Q
	 pM8G68sLojKcqu6xvZKYzLADlDF0yTRnuKg4cetUVQ1+TKDbrJh3DxBmvldOV5WLKX
	 rOpSfJBlkqTu568tDrJLGpr4gpszxrokWxzLAR1ifOPraayBgLzYE4W/GhpL++oneS
	 8qPmJsRAEEuCV5A0HIy0s/rbNHJbNMp2DHvy/hdIt4XSkRSYL2IBasBCHv1ATlZQ9C
	 wlJ5X5ME00OtQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20x86/hvm:=20Replace=20do=5Fsched=5Fop=20calls=20with=20their=20underlying=20logic?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753261555355
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Paul Durrant" <paul@xen.org>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>
Message-Id: <584b490f7f26a746fd2c74be977a4769f73880bb.1753261165.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fb427a3363674315bd01b4d0db7342d7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250723:md
Date: Wed, 23 Jul 2025 09:05:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

do_sched_op(SCHEDOP_yield) just calls vcpu_yield(). Remove the indirection
through the hypercall handler and use the function directly.

Perform the same for SCHEDOP_block.

Not a functional change.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - For SCHEDOP_block case: export and use vcpu_block_enable_events instead
---
 xen/arch/x86/hvm/hvm.c               | 2 +-
 xen/arch/x86/hvm/svm/svm.c           | 2 +-
 xen/arch/x86/hvm/viridian/viridian.c | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c           | 2 +-
 xen/common/sched/core.c              | 2 +-
 xen/include/xen/sched.h              | 1 +
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cb2e13046..e2720daf1e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1736,7 +1736,7 @@ void hvm_hlt(unsigned int eflags)
     if ( unlikely(!(eflags & X86_EFLAGS_IF)) )
         return hvm_vcpu_down(curr);
 
-    do_sched_op(SCHEDOP_block, guest_handle_from_ptr(NULL, void));
+    vcpu_block_enable_events();
 
     TRACE(TRC_HVM_HLT, /* pending = */ vcpu_runnable(curr));
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e33a38c1e4..b0bcd4b1e7 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2159,7 +2159,7 @@ static void svm_vmexit_do_pause(struct cpu_user_regs *regs)
      * Do something useful, like reschedule the guest
      */
     perfc_incr(pauseloop_exits);
-    do_sched_op(SCHEDOP_yield, guest_handle_from_ptr(NULL, void));
+    vcpu_yield();
 }
 
 static void
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index 33d54e587e..7ea6c90168 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -959,7 +959,7 @@ int viridian_hypercall(struct cpu_user_regs *regs)
         /*
          * See section 14.5.1 of the specification.
          */
-        do_sched_op(SCHEDOP_yield, guest_handle_from_ptr(NULL, void));
+        vcpu_yield();
         break;
 
     case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE:
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d8879c304e..1b9fbc4f4e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4768,7 +4768,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     case EXIT_REASON_PAUSE_INSTRUCTION:
         perfc_incr(pauseloop_exits);
-        do_sched_op(SCHEDOP_yield, guest_handle_from_ptr(NULL, void));
+        vcpu_yield();
         break;
 
     case EXIT_REASON_XSETBV:
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 9043414290..b1e831df9d 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1431,7 +1431,7 @@ void vcpu_block(void)
     }
 }
 
-static void vcpu_block_enable_events(void)
+void vcpu_block_enable_events(void)
 {
     local_event_delivery_enable();
     vcpu_block();
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..45bc40ed07 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1030,6 +1030,7 @@ static inline bool vcpu_cpu_dirty(const struct vcpu *v)
 }
 
 void vcpu_block(void);
+void vcpu_block_enable_events(void);
 void vcpu_unblock(struct vcpu *v);
 
 void vcpu_pause(struct vcpu *v);
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


