Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC7B16E2F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:11:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065125.1430463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPJU-0005et-Rz; Thu, 31 Jul 2025 09:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065125.1430463; Thu, 31 Jul 2025 09:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPJU-0005dN-OC; Thu, 31 Jul 2025 09:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1065125;
 Thu, 31 Jul 2025 09:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5T6H=2M=bounce.vates.tech=bounce-md_30504962.688b3320.v1-6b59eabfb27f412c99be3ac79d2bb4a9@srs-se1.protection.inumbo.net>)
 id 1uhPJT-0005by-PJ
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:10:59 +0000
Received: from mail180-9.suw31.mandrillapp.com
 (mail180-9.suw31.mandrillapp.com [198.2.180.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 444d7b0b-6dee-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 11:10:57 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-9.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4bt3GS196XzK5vt5M
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 09:10:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6b59eabfb27f412c99be3ac79d2bb4a9; Thu, 31 Jul 2025 09:10:56 +0000
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
X-Inumbo-ID: 444d7b0b-6dee-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753953056; x=1754223056;
	bh=Cj7PyLO60S9KrkOrp6wSCUS2OhITkAAO+4opcA6d0i0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=xeIFPIKR2b1pf2oLf7r7IRFvbon7KMVbaZyP3xJL8q4g/S8YnluZ5lcL0A2J4Bh+W
	 G2aW0A5i18W1EHju0AtyNUYrGgR8qdVjPsn1O4Ipfo87Zq3AzxGYyhyYQ79Ii/qJ76
	 jXR56qMIq8/FjAaHBUgSIkvOn1nqIYv8nZ3a9HwzOgDkzZz0C1pkEDo0Zqd/YRLB+L
	 qCgf6p9kT5pAHey6JkfeVWfTVZ1Gq37pnPi5xJqSd4qW7Mhqui7riOaz0WWq+ex5Zk
	 Uj8k8W/kCa9Ns+weKJEinFImnpYSz2oDO3Sa7wyvqQp4po4K3U++UQbwgDRJ9wklyA
	 OachwMMVrkhBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753953056; x=1754213556; i=teddy.astie@vates.tech;
	bh=Cj7PyLO60S9KrkOrp6wSCUS2OhITkAAO+4opcA6d0i0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=tRUBcDm+f+vXuoarDay6aXDpt4I2ZmigpW2ewM9xUwm/s0jj5LZzdjuGH111AD/Oe
	 x3C9WbeqmBSgWiK5A2y2kbUOYAn7klhCfPwS9MxvrX7vZ2/Si9QC3QZt9GwvZXMLVe
	 y2olUEdeI3JizoU2p3Az4kIqjteHdIKR3g/M36WRCAn1Rd8Fvux6UX/Xk+cOWubxHE
	 KkHxUPhshDRpzxeGH4f7/iMa/F0pyTUkB/hzgRanzrrT4onszLD7SROkL6oM4BlP1N
	 pd6JubzmfUyzIW+JlYxmsfXcP+Wne+yhgmFWQu3T9VlQatXQJv4ZxiRh/wmYy4KgQF
	 0pmusYTWdQdyw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3]=20x86/hvm:=20Replace=20do=5Fsched=5Fop=20calls=20with=20their=20underlying=20logic?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753953054839
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Paul Durrant" <paul@xen.org>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>
Message-Id: <584b490f7f26a746fd2c74be977a4769f73880bb.1753261165.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6b59eabfb27f412c99be3ac79d2bb4a9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250731:md
Date: Thu, 31 Jul 2025 09:10:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

do_sched_op(SCHEDOP_yield) just calls vcpu_yield(). Remove the indirection
through the hypercall handler and use the function directly.

Export vcpu_block_enable_events() to perform the same for SCHEDOP_block.

Not a functional change.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v3:
 - Ajusted commit message (Andrew)

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


