Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE496A0119E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864707.1275968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQl-0005xd-79; Sat, 04 Jan 2025 01:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864707.1275968; Sat, 04 Jan 2025 01:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQk-0005ro-W9; Sat, 04 Jan 2025 01:58:22 +0000
Received: by outflank-mailman (input) for mailman id 864707;
 Sat, 04 Jan 2025 01:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQi-0005Ay-JH
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c7b92d9-ca3f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 02:58:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A04E95C60A3;
 Sat,  4 Jan 2025 01:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD788C4CEDD;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9E522E7718F;
 Sat,  4 Jan 2025 01:58:14 +0000 (UTC)
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
X-Inumbo-ID: 5c7b92d9-ca3f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955894;
	bh=ixkyuOkiW6UUd6nXZHVzHXwPEUcrn1ATQ8PMz6yYQZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PyyNaLDwe45fuLGzbHvRdggvoPjqnc7oOABO9umAdq0YHmlF9F9p4ZNEwbf9DhaK2
	 XkFz6dmSio1o49I3tdRoBz5QxHLgeix9rOWX5w99edorcTW6d0QIRG47jiq8tedHTo
	 RArzjnB04YlJgCcqf46zII7c1w4ZzncDLjn/anpVQenDj0kQ2de6VeFcXHQ2sWqbgH
	 MD86vHuP6vl9LK4OvupzyFzI3Uhjc8ohjvYyVNUNTaxAaC8hkvTvsvO/SOQ6flZEJ+
	 O80Hm+RhOiZvehVcZh+a2VmX+KEq3AEMTl9em3hCOa/jZfRdE31gL8D8OxUIFTmEpT
	 fpRlULRfg2Fiw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:07 -0800
Subject: [PATCH v3 01/24] xen/ctype: introduce is_console_printable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-1-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=3106;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=4D7ZxUDiCpTccpWinTY9R2Ndh2vzcucBN6SjTgn7Gmg=;
 b=jP4F9CwTPqrv4KtNpzI3kEeh+CKX6i8UdW4ulFgALmAvuDR3hVY/Dlkoa+ubfgC6Air3Fk8m4
 YNzBwH/RNhJD6N4BnvvXA+FuT+K+yoRLo5vUGCDpHTrVfTycZTs7/aS
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

There are several console drivers which have same checks w.r.t. printable
characters. The check is moved to new is_console_printable() function and
re-used in the UART emulation / guest logging code.

Also, MISRA rule 21.13 for ctype.h has been exploited while working on
the code change, reference the rule from ctype.h for future engineers.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vuart.c       | 3 +--
 xen/arch/x86/hvm/hvm.c     | 3 +--
 xen/drivers/char/console.c | 2 +-
 xen/include/xen/ctype.h    | 7 +++++++
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index d5ba483f1e63245e545346ad5045098152b8c152..98a65b99385a2a119725bab8634ed7cf9d926d68 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -79,8 +79,7 @@ static void vuart_print_char(struct vcpu *v, char c)
     struct domain *d = v->domain;
     struct vuart *uart = &d->arch.vuart;
 
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c != '\n') && (c != '\t') )
+    if ( !is_console_printable(c) )
         return ;
 
     spin_lock(&uart->lock);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 922c9b3af64d9132022d37627c54af092275e9cf..c4f1df248c1a7b2b3e5c45cef154e7ca80018dfc 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -561,8 +561,7 @@ static int cf_check hvm_print_line(
     if ( dir != IOREQ_WRITE )
         return X86EMUL_UNHANDLEABLE;
 
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c != '\n') && (c != '\t') )
+    if ( !is_console_printable(c) )
         return X86EMUL_OKAY;
 
     spin_lock(&cd->pbuf_lock);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f3b62c6c45131c58fe5cf0e393e9ef3..4cb397116b44935214801c496b30e44c9399c59a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -674,7 +674,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                 c = *kin++;
                 if ( c == '\n' )
                     break;
-                if ( isprint(c) || c == '\t' )
+                if ( is_console_printable(c) )
                     *kout++ = c;
             } while ( --kcount > 0 );
 
diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
index 773ac27aa44ac65e76e87cdec960450804310249..ceb8f028ddc80b3b688f13422c0362199a03ba9e 100644
--- a/xen/include/xen/ctype.h
+++ b/xen/include/xen/ctype.h
@@ -4,6 +4,8 @@
 /*
  * NOTE! This ctype does not handle EOF like the standard C
  * library is required to.
+ *
+ * See Rule 21.13 in docs/misra/rules.rst.
  */
 
 #define _U	0x01	/* upper */
@@ -51,4 +53,9 @@ static inline unsigned char __toupper(unsigned char c)
 #define tolower(c) ((char)__tolower(c))
 #define toupper(c) ((char)__toupper(c))
 
+static inline unsigned is_console_printable(unsigned char c)
+{
+	return isprint(c) || c == '\n' || c == '\t';
+}
+
 #endif

-- 
2.34.1



