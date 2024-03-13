Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1487A96C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 15:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692457.1079628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPZD-000445-04; Wed, 13 Mar 2024 14:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692457.1079628; Wed, 13 Mar 2024 14:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkPZC-0003zw-SO; Wed, 13 Mar 2024 14:26:50 +0000
Received: by outflank-mailman (input) for mailman id 692457;
 Wed, 13 Mar 2024 14:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkPZC-0003iO-17
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 14:26:50 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ec5274-e145-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 15:26:48 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a46606e82d9so80520066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 07:26:48 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b15-20020a170906194f00b00a4665f829a9sm159681eje.90.2024.03.13.07.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 07:26:45 -0700 (PDT)
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
X-Inumbo-ID: b9ec5274-e145-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710340007; x=1710944807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFFSR65pFy7tOFY4mdTf2IheoUS7iU2c+aO/Mn060yc=;
        b=QLMjrBYC2lzd6v4GSEUcYkCBC7N1YxN9KvrdD4ApwGJBlfHXksWFYuPxyJ3XHSn3UI
         QTfs46ll7xvaCb85uOSTVX0BihQyP3ZOxY0BYpS5RUD8VJFjiVWYmm0V8L7zrNNV1Drk
         zfVwmkPIHUlE9aV0cndoZgHFJ+y44Kq7k5nug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710340007; x=1710944807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFFSR65pFy7tOFY4mdTf2IheoUS7iU2c+aO/Mn060yc=;
        b=AuuM3Zsjpy9bvdE8SciiOvW0QgneuRDik5E9Yh4m2HJyiesYGh3Mg1Yv/ZlZEL5B7i
         3muzHdfTZwy2AAdZKXWK/UP169+No145kiPh8jrU2cfWNxPNtIzi5ATQp+a5iYu/roFS
         EWdU1jptXnRKUaiEVXvFPa/AmfDgy2ef/VhN+UOj+GX5jDKHbhrTueQCyackjhwjDTv+
         YOV09DCC/tJIxZBoxu1iM/FEsMHpbDeSFZBU4Ir6GXNOeX5nxtZyWGg2RuWhstjxz7SJ
         6M/OzwL1IktQb+ZvEkivpP0MoO2HQC2uJm6R0NO1BgU9vdVIgebXerAxy40quqN5gPek
         GMzw==
X-Gm-Message-State: AOJu0Yzu9B71IVvqzopokW51FU5JfSALUWLx0AjNBZ4nWqmWJXGjLvPM
	6BOceBCsKN5L5fK0bjLmuIwXukYEWmX29pbLMJhcMo/swv1qy5LrN/0NuR3Vqbrwf8yQWdY9J9h
	E
X-Google-Smtp-Source: AGHT+IFQgd3CUalZN182faAGInMvRYTR0xKahx3W96taLmSn6lWmik67/EpgCGI52YhhCJ1IjpFOjg==
X-Received: by 2002:a17:906:6a22:b0:a46:2a79:6425 with SMTP id qw34-20020a1709066a2200b00a462a796425mr7357023ejc.22.1710340007107;
        Wed, 13 Mar 2024 07:26:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/entry: Delete RESTORE_ALL
Date: Wed, 13 Mar 2024 14:26:41 +0000
Message-Id: <20240313142641.2150302-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313142641.2150302-1-andrew.cooper3@citrix.com>
References: <20240313142641.2150302-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is only a single user now, and it's the one odd case.  Inline and
simplify it to just the compat case.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

In principle we want to delay the %rsp adjustment until after VERW, but that
turns disp8's into disp32's, making the overall code size larger.  This path
is only for 32bit PV guests anyway, which are well on their way to fully
obsolete.
---
 xen/arch/x86/include/asm/asm_defns.h | 48 ----------------------------
 xen/arch/x86/x86_64/compat/entry.S   | 18 ++++++++++-
 2 files changed, 17 insertions(+), 49 deletions(-)

diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index ec10a8e1dfc6..524ed05d87f6 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -266,54 +266,6 @@ static always_inline void stac(void)
         xor   %r15d, %r15d
 .endm
 
-#define LOAD_ONE_REG(reg, compat) \
-.if !(compat); \
-        movq  UREGS_r##reg(%rsp),%r##reg; \
-.else; \
-        movl  UREGS_r##reg(%rsp),%e##reg; \
-.endif
-
-/*
- * Restore all previously saved registers.
- *
- * @adj: extra stack pointer adjustment to be folded into the adjustment done
- *       anyway at the end of the macro
- * @compat: R8-R15 don't need reloading, but they are clobbered for added
- *          safety against information leaks.
- */
-.macro RESTORE_ALL adj=0, compat=0
-.if !\compat
-        movq  UREGS_r15(%rsp), %r15
-        movq  UREGS_r14(%rsp), %r14
-        movq  UREGS_r13(%rsp), %r13
-        movq  UREGS_r12(%rsp), %r12
-.else
-        xor %r15d, %r15d
-        xor %r14d, %r14d
-        xor %r13d, %r13d
-        xor %r12d, %r12d
-.endif
-        LOAD_ONE_REG(bp, \compat)
-        LOAD_ONE_REG(bx, \compat)
-.if !\compat
-        movq  UREGS_r11(%rsp),%r11
-        movq  UREGS_r10(%rsp),%r10
-        movq  UREGS_r9(%rsp),%r9
-        movq  UREGS_r8(%rsp),%r8
-.else
-        xor %r11d, %r11d
-        xor %r10d, %r10d
-        xor %r9d, %r9d
-        xor %r8d, %r8d
-.endif
-        LOAD_ONE_REG(ax, \compat)
-        LOAD_ONE_REG(cx, \compat)
-        LOAD_ONE_REG(dx, \compat)
-        LOAD_ONE_REG(si, \compat)
-        LOAD_ONE_REG(di, \compat)
-        subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
-.endm
-
 /*
  * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
  *
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 631f4f272ac3..99d6dec296c6 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -158,7 +158,23 @@ FUNC(compat_restore_all_guest)
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         SPEC_CTRL_EXIT_TO_PV    /* Req: a=spec_ctrl %rsp=regs/cpuinfo, Clob: cd */
 
-        RESTORE_ALL adj=8, compat=1
+        /* Opencoded POP_GPRS, restoring only the 32bit registers. */
+        xor   %r15d, %r15d
+        xor   %r14d, %r14d
+        xor   %r13d, %r13d
+        xor   %r12d, %r12d
+        mov   UREGS_rbp(%rsp), %ebp
+        mov   UREGS_rbx(%rsp), %ebx
+        xor   %r11d, %r11d
+        xor   %r10d, %r10d
+        xor   %r9d,  %r9d
+        xor   %r8d,  %r8d
+        mov   UREGS_rax(%rsp), %eax
+        mov   UREGS_rcx(%rsp), %ecx
+        mov   UREGS_rdx(%rsp), %edx
+        mov   UREGS_rsi(%rsp), %esi
+        mov   UREGS_rdi(%rsp), %edi
+        sub   $-(UREGS_rip-UREGS_r15), %rsp
 
         /* Account for ev/ec having already been popped off the stack. */
         SPEC_CTRL_COND_VERW \
-- 
2.30.2


