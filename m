Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E046D1A1
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242144.418863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoY-0007Z7-19; Wed, 08 Dec 2021 11:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242144.418863; Wed, 08 Dec 2021 11:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuoX-0007X5-SJ; Wed, 08 Dec 2021 11:08:45 +0000
Received: by outflank-mailman (input) for mailman id 242144;
 Wed, 08 Dec 2021 11:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuoW-0006Yt-GP
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:08:44 +0000
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 346da667-5817-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 12:08:43 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id r138so1736993pgr.13
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:08:43 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id a16sm2254924pgm.57.2021.12.08.03.08.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:08:41 -0800 (PST)
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
X-Inumbo-ID: 346da667-5817-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=74fcl84eMF3trMMN2JVz1x4AFBWc9HU1GFAGLmUM5eE=;
        b=VKlr4hE6P3/KVxbIhcLJDA0sF52nL0lnTLSlQue1EOi6nOPZmlq7+N6t34Z4nlAn6S
         6NYswFiLZFVt72m7dLmKsXjcv49Tzn4Vfnpcat4WRibMq/7lLfmYUvxqlDrF2qI/vqdA
         5aiicTqsTeo5rZI/iqEDgXPe0X06ShRim5daAufoj+27dBC6vjm3F6QWqdhhrBeccdlx
         vioUF/TKnCwOTAFHjtjXkA2ZHEBTUJBfBC9YS2QXCQak02LJEkZyHt3r3mxI7EG3xklk
         0XSnYu5Z2L1fze0kQgB0lt62j14Jn3CZPbd5zi5beWbTOrpQnWraqlF9nD9BmgP3hxz8
         xxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=74fcl84eMF3trMMN2JVz1x4AFBWc9HU1GFAGLmUM5eE=;
        b=ETyW2lETc1herkLk/EiUKJV11X5B1Oas8zxXRMNOp4rg5v72qYkew7jPQAOurEcIk2
         BNKwIVNv67+tftEx5pL8/AxngnKxU28po8UGf3rNr+5MuKtE2n/H4bDF/MW8N+ZANr9C
         IZg0ZzRAnm/rWBD/6eIj4PXLnzJe3tJsoQN7VtJQKTkq3xfkrzBz0uBQXjc9dkil27Nk
         z+XprFGkxMg9Bh4CZNsRFY5HG3z8qfo6dKZ18qbMc4DjZHZJpKbMa7UCxG7+DYCAkDfW
         8755+04V/51WSe436gTZXYOi+GDnW0PskJB5YoWCbqKIhCdqhc8tGfFKNljVufuMuZez
         rrdQ==
X-Gm-Message-State: AOAM532JwxB2IizVr4Ix2Ni1OgNKbYk8NJyNo+yBUZZYM/mik4WilOhK
	1+L2IObTvqa50cjIjo8vOEo=
X-Google-Smtp-Source: ABdhPJwdwD0NWVFtmrZKBdCkBw1nVwlMCHpLBoT9j05zLnwJyoppx7uciS4Kg9RdTDjqkCWrZh05WA==
X-Received: by 2002:a63:e43:: with SMTP id 3mr29449478pgo.73.1638961722423;
        Wed, 08 Dec 2021 03:08:42 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 03/11] x86/entry: Switch the stack after error_entry() returns
Date: Wed,  8 Dec 2021 19:08:25 +0800
Message-Id: <20211208110833.65366-4-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

error_entry() calls sync_regs() to settle/copy the pt_regs and switches
the stack directly after sync_regs().  But error_entry() itself is also
a function call, the switching has to handle the return address of it
together, which causes the work complicated and tangly.

Switching to the stack after error_entry() makes the code simpler and
intuitive.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index f8faff3ca61e..6baa7413f7eb 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -323,6 +323,8 @@ SYM_CODE_END(ret_from_fork)
 .macro idtentry_body cfunc has_error_code:req
 
 	call	error_entry
+	movq	%rax, %rsp			/* switch stack settled by sync_regs() */
+	ENCODE_FRAME_POINTER
 	UNWIND_HINT_REGS
 
 	movq	%rsp, %rdi			/* pt_regs pointer into 1st argument*/
@@ -981,14 +983,10 @@ SYM_CODE_START_LOCAL(error_entry)
 	/* We have user CR3.  Change to kernel CR3. */
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%rax
 
+	leaq	8(%rsp), %rdi			/* arg0 = pt_regs pointer */
 .Lerror_entry_from_usermode_after_swapgs:
 	/* Put us onto the real thread stack. */
-	popq	%r12				/* save return addr in %12 */
-	movq	%rsp, %rdi			/* arg0 = pt_regs pointer */
 	call	sync_regs
-	movq	%rax, %rsp			/* switch stack */
-	ENCODE_FRAME_POINTER
-	pushq	%r12
 	ret
 
 	/*
@@ -1020,6 +1018,7 @@ SYM_CODE_START_LOCAL(error_entry)
 	 */
 .Lerror_entry_done_lfence:
 	FENCE_SWAPGS_KERNEL_ENTRY
+	leaq	8(%rsp), %rax			/* return pt_regs pointer */
 	ret
 
 .Lbstep_iret:
@@ -1040,12 +1039,9 @@ SYM_CODE_START_LOCAL(error_entry)
 	 * Pretend that the exception came from user mode: set up pt_regs
 	 * as if we faulted immediately after IRET.
 	 */
-	popq	%r12				/* save return addr in %12 */
-	movq	%rsp, %rdi			/* arg0 = pt_regs pointer */
+	leaq	8(%rsp), %rdi			/* arg0 = pt_regs pointer */
 	call	fixup_bad_iret
-	mov	%rax, %rsp
-	ENCODE_FRAME_POINTER
-	pushq	%r12
+	mov	%rax, %rdi
 	jmp	.Lerror_entry_from_usermode_after_swapgs
 SYM_CODE_END(error_entry)
 
-- 
2.19.1.6.gb485710b


