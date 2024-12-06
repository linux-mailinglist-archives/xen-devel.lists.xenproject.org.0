Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF39E6661
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 05:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849417.1264094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA3-0006ey-6f; Fri, 06 Dec 2024 04:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849417.1264094; Fri, 06 Dec 2024 04:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQA2-0006La-S9; Fri, 06 Dec 2024 04:41:50 +0000
Received: by outflank-mailman (input) for mailman id 849417;
 Fri, 06 Dec 2024 04:41:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQ9x-0004Kb-Vk
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 617c78bd-b38c-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 05:41:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3DC0C5C7300;
 Fri,  6 Dec 2024 04:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A1DAC4CED2;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 790DFE77178;
 Fri,  6 Dec 2024 04:41:37 +0000 (UTC)
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
X-Inumbo-ID: 617c78bd-b38c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460097;
	bh=7koQaWLewXvB3SCK9dZyYM5ZVrnylbZtaIV5UaNbJIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hoHmD/h87nsVaTNuOwWGeJIP/ib+VrDqptGul4bHy+1jdGv6d0tesKtcPvEI/oaJe
	 5gYgVFGmwqoGY8HEbJxfhSqIJt2tDg0S2l/0824jsFFymZXukR9QdzTePCDTnKjc38
	 iodnbyM/HB9js6hJlTSJe5RkFB7ZexvdPVAjq3rXZkcAG4deVzj6gZX9VlOuUI2FN4
	 JCNQptf8RThz9o2L6YpvS5+FNqMfWtdvEWOzE6i8ERk9pL/nbNWc2BWNUTGXcEJyoC
	 1S96uEz9GWNeT1az2qZFamB5BR34pQ6pLzl92zrJhvSY57uAbe/pxoQ2Gi6vSMfzZa
	 Pbpxih71Gdd6A==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:33 -0800
Subject: [PATCH v2 03/35] xen/ctype: introduce isconsole()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-3-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460094; l=2965;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=VA1l2CgJQ6KceeM+tuMGN+rK6UFSe0FXEY/EUwUiYwI=;
 b=JGqXyT0nbX97Vn2mSNHSEgjpczcuciXKVCHfEW8CEpXFPzirY37JgpYwVuNT3Xh6fyHyQupM6
 JwhVvYBYibZAg7WSsrLhqzDPlyDVc9R3X0g80jgVMZyQ7FNV0dbt/mw
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

There are several console drivers which have same checks w.r.t. printable
characters. The check is moved to new isconsole() macro and re-used in
the console drivers.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vuart.c       | 3 +--
 xen/arch/x86/hvm/hvm.c     | 3 +--
 xen/drivers/char/console.c | 2 +-
 xen/include/xen/ctype.h    | 3 +++
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index d5ba483f1e63245e545346ad5045098152b8c152..ac76e2327bb84f05ea5716c6f5550f94812d2827 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -79,8 +79,7 @@ static void vuart_print_char(struct vcpu *v, char c)
     struct domain *d = v->domain;
     struct vuart *uart = &d->arch.vuart;
 
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c != '\n') && (c != '\t') )
+    if ( !isconsole(c) )
         return ;
 
     spin_lock(&uart->lock);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74e58c653e6f697e7e563fd076bbbafaf257137d..493b699c708949b2109c26573a107565543f5d45 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -561,8 +561,7 @@ static int cf_check hvm_print_line(
     if ( dir != IOREQ_WRITE )
         return X86EMUL_UNHANDLEABLE;
 
-    /* Accept only printable characters, newline, and horizontal tab. */
-    if ( !isprint(c) && (c != '\n') && (c != '\t') )
+    if ( !isconsole(c) )
         return X86EMUL_OKAY;
 
     spin_lock(&cd->pbuf_lock);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f3b62c6c45131c58fe5cf0e393e9ef3..bb56953bab681a13da8d41431aba4632f1919df9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -674,7 +674,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                 c = *kin++;
                 if ( c == '\n' )
                     break;
-                if ( isprint(c) || c == '\t' )
+                if ( isconsole(c) )
                     *kout++ = c;
             } while ( --kcount > 0 );
 
diff --git a/xen/include/xen/ctype.h b/xen/include/xen/ctype.h
index 773ac27aa44ac65e76e87cdec960450804310249..deebaad96ede34f16f61ece862c788232c1d1efd 100644
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
@@ -30,6 +32,7 @@ extern const unsigned char _ctype[];
 #define isspace(c)	((__ismask(c)&(_S)) != 0)
 #define isupper(c)	((__ismask(c)&(_U)) != 0)
 #define isxdigit(c)	((__ismask(c)&(_D|_X)) != 0)
+#define isconsole(c)	(isprint(c) || (c) == '\n' || (c) == '\t')
 
 #define isascii(c) (((unsigned char)(c))<=0x7f)
 #define toascii(c) (((unsigned char)(c))&0x7f)

-- 
2.34.1



