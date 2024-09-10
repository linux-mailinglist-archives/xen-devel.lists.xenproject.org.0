Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2031397312C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795235.1204485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoE-0007XN-Lk; Tue, 10 Sep 2024 10:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795235.1204485; Tue, 10 Sep 2024 10:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoE-0007Ts-Gf; Tue, 10 Sep 2024 10:09:18 +0000
Received: by outflank-mailman (input) for mailman id 795235;
 Tue, 10 Sep 2024 10:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoC-0006in-7B
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb837fce-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:14 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 2598F4EE07BD;
 Tue, 10 Sep 2024 12:09:14 +0200 (CEST)
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
X-Inumbo-ID: bb837fce-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962954; bh=0ikbd1ETLLKX3eXMS2E9IBv3xVhKz2tDs8iBpqTgxFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yM4X6JwReqK7YaxCAt5D+XnGr3bcg7n7orUUsG5xusg078Z49zZ2DfWHqHPjnVI1i
	 7H1QBO1ZtKjnNlFmTOw5vMXuex8lR02y0+ppAHh8pxl3v/BRwRscSrnhihJ6ir/S1B
	 RWrr/8ioRhxLSJ/vhv6zT6185hV09wtC9iXx5+Tgi6j8eLbsKNHCRv5QmKjl4pNJO9
	 SWc8ODAqvZ9hokJdHiIM9U57doInWPzy4Sbl7+c7Gm430/VjIGXh/cRyA92i1Yz9OB
	 LYb/+fk6Qqhaz4btPAmHri4DChLNSJB31BF0P7Cx9KDkRDACM4dBN+Kkra6dH0vDs+
	 FUlMY/U1/Loeg==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 04/12] x86/hypercall: address violations of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:56 +0200
Message-Id: <ae38faae9ea48c86f001040e854d5e6acbd41d26.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address violations of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/hypercall.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index 389fa62af2..f6e9e2313b 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -55,7 +55,7 @@ static inline void clobber_regs64(struct cpu_user_regs *regs,
     case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
     case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
     case 2: regs->rsi = 0xdeadbeefdeadf00dUL; fallthrough;
-    case 1: regs->rdi = 0xdeadbeefdeadf00dUL;
+    case 1: regs->rdi = 0xdeadbeefdeadf00dUL; break;
     }
 #endif
 }
@@ -71,7 +71,7 @@ static inline void clobber_regs32(struct cpu_user_regs *regs,
     case 4: regs->esi = 0xdeadf00dU; fallthrough;
     case 3: regs->edx = 0xdeadf00dU; fallthrough;
     case 2: regs->ecx = 0xdeadf00dU; fallthrough;
-    case 1: regs->ebx = 0xdeadf00dU;
+    case 1: regs->ebx = 0xdeadf00dU; break;
     }
 #endif
 }
-- 
2.34.1


