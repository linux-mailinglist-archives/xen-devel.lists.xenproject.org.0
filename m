Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E151C68E
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 19:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322312.543588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmfdb-0000vX-Le; Thu, 05 May 2022 17:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322312.543588; Thu, 05 May 2022 17:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmfdb-0000su-Hq; Thu, 05 May 2022 17:51:39 +0000
Received: by outflank-mailman (input) for mailman id 322312;
 Thu, 05 May 2022 17:51:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmfdZ-0000sn-Kb
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 17:51:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmfdY-0003ax-T4; Thu, 05 May 2022 17:51:36 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmfdY-00032l-Ie; Thu, 05 May 2022 17:51:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=G739xfSEhj+8itXA1Tf1a5FxiO1AuRF+za7m94KqYVE=; b=jcFXk0
	SROVch46PQ0OqT+u8Y6Loj5WVzR3QlCY6PW0RCkPk7amm8fPqKPsHIlcRfQylMXQYD2WQYlvn6tUQ
	DDKAvKprBq3zupeBIM6rQCa66l86K7zQqeVn1/OqkIwXwAeLZMbbPotnExs3Fh52lr/agRFdUxR3M
	HiCYYRtVamI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen: io: Fix race between sending an I/O and domain shutdown
Date: Thu,  5 May 2022 18:51:31 +0100
Message-Id: <20220505175131.81457-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Xen provides hypercalls to shutdown (SCHEDOP_shutdown{,_code}) and
resume a domain (XEN_DOMCTL_resumedomain). They can be used for checkpoint
where the expectation is the domain should continue as nothing happened
afterwards.

hvmemul_do_io() and handle_pio() will act differently if the return
code of hvm_send_ioreq() (resp. hvmemul_do_pio_buffer()) is X86EMUL_RETRY.

In this case, the I/O state will be reset to STATE_IOREQ_NONE (i.e
no I/O is pending) and/or the PC will not be advanced.

If the shutdown request happens right after the I/O was sent to the
IOREQ, then emulation code will end up to re-execute the instruction
and therefore forward again the same I/O (at least when reading IO port).

This would be problem if the access has a side-effect. A dumb example,
is a device implementing a counter which is incremented by one for every
access. When running shutdown/resume in a loop, the value read by the
OS may not be the old value + 1.

Add an extra boolean in the structure hvm_vcpu_io to indicate whether
the I/O was suspend. This is then used in place of checking the domain
is shutting down in hvmemul_do_io() and handle_pio() as they should
act on suspend (i.e. vcpu_start_shutdown_deferral() returns false) rather
than shutdown.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

"paused" is not quite the right word in the description but I haven't found
a word that would avoid to tie the problem to shutdown only.
---
 xen/arch/arm/ioreq.c       | 3 ++-
 xen/arch/x86/hvm/emulate.c | 3 ++-
 xen/arch/x86/hvm/io.c      | 7 ++++---
 xen/common/ioreq.c         | 4 ++++
 xen/include/xen/sched.h    | 5 +++++
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index bdd536e873e5..1338c86adb43 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -92,10 +92,11 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
 
     p.data = get_user_reg(regs, info->dabt.reg);
     vio->req = p;
+    vio->suspended = false;
     vio->info.dabt_instr = instr;
 
     rc = ioreq_send(s, &p, 0);
-    if ( rc != IO_RETRY || v->domain->is_shutting_down )
+    if ( rc != IO_RETRY || vio->suspended )
         vio->req.state = STATE_IOREQ_NONE;
     else if ( !ioreq_needs_completion(&vio->req) )
         rc = IO_HANDLED;
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index e8d510e0be91..cb221f70e8f0 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -236,6 +236,7 @@ static int hvmemul_do_io(
     ASSERT(p.count);
 
     vio->req = p;
+    vio->suspended = false;
 
     rc = hvm_io_intercept(&p);
 
@@ -331,7 +332,7 @@ static int hvmemul_do_io(
         else
         {
             rc = ioreq_send(s, &p, 0);
-            if ( rc != X86EMUL_RETRY || currd->is_shutting_down )
+            if ( rc != X86EMUL_RETRY || vio->suspended )
                 vio->req.state = STATE_IOREQ_NONE;
             else if ( !ioreq_needs_completion(&vio->req) )
                 rc = X86EMUL_OKAY;
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index f70bfde90143..0309d05cfdfc 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -138,10 +138,11 @@ bool handle_pio(uint16_t port, unsigned int size, int dir)
 
     case X86EMUL_RETRY:
         /*
-         * We should not advance RIP/EIP if the domain is shutting down or
-         * if X86EMUL_RETRY has been returned by an internal handler.
+         * We should not advance RIP/EIP if the vio was suspended (e.g.
+         * because the domain is shutting down) or if X86EMUL_RETRY has
+         * been returned by an internal handler.
          */
-        if ( curr->domain->is_shutting_down || !vcpu_ioreq_pending(curr) )
+        if ( vio->suspended || !vcpu_ioreq_pending(curr) )
             return false;
         break;
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 5c94e74293ce..4617aef29b7e 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1251,6 +1251,7 @@ int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
     struct ioreq_vcpu *sv;
+    struct vcpu_io *vio = &curr->io;
 
     ASSERT(s);
 
@@ -1258,7 +1259,10 @@ int ioreq_send(struct ioreq_server *s, ioreq_t *proto_p,
         return ioreq_send_buffered(s, proto_p);
 
     if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )
+    {
+        vio->suspended = true;
         return IOREQ_STATUS_RETRY;
+    }
 
     list_for_each_entry ( sv,
                           &s->ioreq_vcpu_list,
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ed8539f6d297..6b724e7947c7 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -159,6 +159,11 @@ enum vio_completion {
 struct vcpu_io {
     /* I/O request in flight to device model. */
     enum vio_completion  completion;
+    /*
+     * Indicate whether the I/O was not handled because the domain
+     * is about to be paused.
+     */
+    bool                 suspended;
     ioreq_t              req;
     /* Arch specific info pertaining to the io request */
     struct arch_vcpu_io  info;
-- 
2.32.0


