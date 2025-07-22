Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1192DB0E339
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 20:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052973.1421751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueHOv-0003Qe-7f; Tue, 22 Jul 2025 18:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052973.1421751; Tue, 22 Jul 2025 18:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueHOv-0003OO-4U; Tue, 22 Jul 2025 18:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1052973;
 Tue, 22 Jul 2025 18:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ad7=2D=bounce.vates.tech=bounce-md_30504962.687fd366.v1-ad5ab1e21acf480e9a26de76f4bee34f@srs-se1.protection.inumbo.net>)
 id 1ueHOu-0003OI-8Y
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 18:07:40 +0000
Received: from mail132-21.atl131.mandrillapp.com
 (mail132-21.atl131.mandrillapp.com [198.2.132.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bee50cc1-6726-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 20:07:37 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4bmlbp5Xd5z1XYMv1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 18:07:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ad5ab1e21acf480e9a26de76f4bee34f; Tue, 22 Jul 2025 18:07:34 +0000
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
X-Inumbo-ID: bee50cc1-6726-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753207654; x=1753477654;
	bh=+fqFDrAqPfOKUpSeM2IZKZ9q2bcs0r+eoeRy4JZ4Ig8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=pyluUR2Z8cPWogiiheUuXPfoQ/29KaYDcbeppEGotv4mqnCvD9Vcg54CaF+j1GYs6
	 Bja3/dbFal5ygBo139QOL2FU60oUYiha/cOp+zToapC9ICpjxxqJBhaF3L9rDjF/02
	 ImAtpFzsmfaq4j2Ofh0fdp53E2J/00fdFD47gSFGlTfF6HX1QyVE1BhtLpMCo16ZJP
	 +lDMWMJNWM7qKAjDMZePtI1ep/KfnQgyqCgIuD/rUA0ZHlQIBvZXHoehkoq9LUqjcb
	 bSZXqK4qGkx3+trN7tWY9YHQdTuygzlbgBh3wC9N1hGHropr8+CQAjRUrxW4xSvDtL
	 +AsjLrLCdLcxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753207654; x=1753468154; i=teddy.astie@vates.tech;
	bh=+fqFDrAqPfOKUpSeM2IZKZ9q2bcs0r+eoeRy4JZ4Ig8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=uFSkNP1DAF7S4haNI97P8WUX/aJoLZFVskKIpkK4rtCLf3PCkMJOa/bWrwAAEL9nj
	 SmqOGjcqwT3ivRmISNPZh1gwJ1eNRXB5Gzpxk26LvICbVzdAOJWpJegVyA23QS1gq6
	 pyN66pcyqZS+MSo/MuRCxrPpmkeY35147dT/33nhHKCZNgE+ygDNsOvoXFPEbQz7Ej
	 zKLYXP10PX5uBN0kgTh0uRIqiisMVEHirS8fNmLEWo5n/IEzT3rcsYJUF53QFQHMvl
	 z1JBJH77Egr123qyrKOF/rBcyJ4Dy+3JmRl2s5zhp1eaHixG43qybp4zEYrK91KYaW
	 VHm2R7t2Cz2yg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/hvm:=20Replace=20do=5Fsched=5Fop=20calls=20with=20their=20underlying=20logic?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753207653842
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Paul Durrant" <paul@xen.org>
Message-Id: <94a424a73476c3f2b044d61685a5fa5cbc541be0.1753207469.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ad5ab1e21acf480e9a26de76f4bee34f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250722:md
Date: Tue, 22 Jul 2025 18:07:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

do_sched_op(SCHEDOP_yield) just calls vcpu_yield(). Remove the indirection
through the hypercall handler and use the function directly.

Perform the same for SCHEDOP_block.

Not a functional change.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/hvm.c               | 3 ++-
 xen/arch/x86/hvm/svm/svm.c           | 2 +-
 xen/arch/x86/hvm/viridian/viridian.c | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c           | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cb2e13046..5c3e9ad72e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1736,7 +1736,8 @@ void hvm_hlt(unsigned int eflags)
     if ( unlikely(!(eflags & X86_EFLAGS_IF)) )
         return hvm_vcpu_down(curr);
 
-    do_sched_op(SCHEDOP_block, guest_handle_from_ptr(NULL, void));
+    local_event_delivery_enable();
+    vcpu_block();
 
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
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


