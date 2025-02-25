Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64191A4507A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896051.1304727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3ih-0004RB-LG; Tue, 25 Feb 2025 22:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896051.1304727; Tue, 25 Feb 2025 22:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3ih-0004P3-Ig; Tue, 25 Feb 2025 22:48:07 +0000
Received: by outflank-mailman (input) for mailman id 896051;
 Tue, 25 Feb 2025 22:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3if-0004Ox-L5
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:48:05 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 929b7745-f3ca-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 23:48:04 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38f31f7731fso2985453f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:48:04 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390d6a32299sm93589f8f.55.2025.02.25.14.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:48:02 -0800 (PST)
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
X-Inumbo-ID: 929b7745-f3ca-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740523683; x=1741128483; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HszsDMp0SXDDSQ5GIbpAHMSSuUliCVNPmetYU53L9j0=;
        b=U0/j2Lh5SA/WcbipP6PsvUDLxKRDKqQwWjtDOGlUWKgh3ght4sIScjHL1Idvtxv7pH
         HsmayN2RqEm/sqqH4J/APIf/LaguwLl69jsQIWzkQys0QvYRu+4Q3lllXzIAglXEwCSX
         XGd4XaSuQ9017mzF9xXvVq0QVGFG3CHhsv3QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523683; x=1741128483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HszsDMp0SXDDSQ5GIbpAHMSSuUliCVNPmetYU53L9j0=;
        b=vdANxpqY7DfYY6FHKjAlE0Fu1RDCTueBqLKPZ48Xog1X34hQjnxcNAjxTM10uG9SDF
         KxL4HaOXwiELcrgx28oUp++OHnw3ernhmNHXU4ra/lkWWOPNN0ZewypS2LxmK7173k92
         KvjZ0cXI9WOudkkW2KUn6+QcbAGSz2T9zU5EfEGibEqURpzZQsDc5yZnjGjdqgBmdlNs
         p7TqcaDSH99uecd0ju3Ed/80rA7ETg2f5y4QTB1XPdGYvsdSoi+W630KDmo0W8AbQg+J
         tPgiQOKwuNaFIN4je57RhmEeJO7x1xdowfnZCCjvgxOhhH7yARV5AbWOvU97WuvAACNr
         vqeg==
X-Gm-Message-State: AOJu0YzecetfVZWIX2DCzIhKEVexwl/Jo7WRL7y4gcNsYoMycXmnlVGq
	bfAta4F5hlZ+PS7uD0ymWHstjDmubAfQIo9ZTKxf+2MDB3URAIdK2istGdbj4FmmWItXIzr6PQE
	M
X-Gm-Gg: ASbGnctisO+UNaUyziyRtCw3bqTY0+oK4EmS/ru4Ou6LMg6Bax0B9SJ6iy3X78EhT66
	0OsddigmLinyosrjE4iHJR6kVGBD1zv/qGstXDx8VdpDN0SzoFU+Z8qMekcwOO+4YuWSFARdpAp
	BldopLvFJld5SvSc7hAX64dTUyagH+ss+hqQtB0uWdQ8nQ/xMIANCGMvT0iZIaeAwjdb5kIOGOs
	CN/fyAz5+SjqCXvGSqlhKcT9oIJmhr2ejJxUTGjKS+TnuuV6Qmy/0/kvWrBVWsIxuH9KLnBVwrD
	teMlkf8jtq4pmpwOSOdm6ftNbbKF78XAirSqEcsjYwDncZbY/66DhMo66nU21UYLPWdy1IEz+mv
	5c0O5Ig==
X-Google-Smtp-Source: AGHT+IF2w4/d/ADqyQye3RqwvfH7tSGHVacrsWiA7FP6tTS4ibQgvPnVM+lxtEFinoJjTe9q+RaCJg==
X-Received: by 2002:a05:6000:180f:b0:38f:3e8d:dd42 with SMTP id ffacd0b85a97d-390d4f9cfa1mr532658f8f.53.1740523683276;
        Tue, 25 Feb 2025 14:48:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/elf: Improve code generation in elf_core_save_regs()
Date: Tue, 25 Feb 2025 22:45:59 +0000
Message-Id: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A CALL with 0 displacement is handled specially, and is why this logic
functions even with CET Shadow Stacks active.  Nevertheless a rip-relative LEA
is the more normal way of doing this in 64bit code.

The retrieval of flags modifies the stack pointer so needs to state a
dependency on the stack pointer.  Despite it's name, ASM_CALL_CONSTRAINT is
the way to do this.

read_sreg() forces the answer through a register, causing code generation of
the form:

    mov    %gs, %eax
    mov    %eax, %eax
    mov    %rax, 0x140(%rsi)

Encode the reads directly with a memory operand.  This results in a 16bit
store instead of an 64bit store, but the backing memory is zeroed.

While cleaning this up, drop one piece of trailing whitespace.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This is tidyup from the effort to drop the vm86 regs from cpu_user_regs, but
is fairly unrelated to the rest of the work.
---
 xen/arch/x86/include/asm/x86_64/elf.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86_64/elf.h b/xen/arch/x86/include/asm/x86_64/elf.h
index 00227e0e120c..f33be46ddec9 100644
--- a/xen/arch/x86/include/asm/x86_64/elf.h
+++ b/xen/arch/x86/include/asm/x86_64/elf.h
@@ -34,7 +34,7 @@ typedef struct {
     unsigned long gs;
 } ELF_Gregset;
 
-static inline void elf_core_save_regs(ELF_Gregset *core_regs, 
+static inline void elf_core_save_regs(ELF_Gregset *core_regs,
                                       crash_xen_core_t *xen_core_regs)
 {
     asm ( "movq %%r15, %0" : "=m" (core_regs->r15) );
@@ -54,17 +54,17 @@ static inline void elf_core_save_regs(ELF_Gregset *core_regs,
     asm ( "movq %%rdi, %0" : "=m" (core_regs->rdi) );
 
     /* orig_rax not filled in for now */
-    asm ( "call 0f; 0: popq %0" : "=m" (core_regs->rip) );
-    core_regs->cs = read_sreg(cs);
-    asm ( "pushfq; popq %0" : "=m" (core_regs->rflags) );
+    asm ( "lea (%%rip), %0" : "=r" (core_regs->rip) );
+    asm ( "mov %%cs, %0" : "=m" (core_regs->cs) );
+    asm ( "pushfq; popq %0" : "=m" (core_regs->rflags) ASM_CALL_CONSTRAINT );
     asm ( "movq %%rsp, %0" : "=m" (core_regs->rsp) );
-    core_regs->ss = read_sreg(ss);
+    asm ( "mov %%ss, %0" : "=m" (core_regs->ss) );
     rdmsrl(MSR_FS_BASE, core_regs->thread_fs);
     rdmsrl(MSR_GS_BASE, core_regs->thread_gs);
-    core_regs->ds = read_sreg(ds);
-    core_regs->es = read_sreg(es);
-    core_regs->fs = read_sreg(fs);
-    core_regs->gs = read_sreg(gs);
+    asm ( "mov %%ds, %0" : "=m" (core_regs->ds) );
+    asm ( "mov %%es, %0" : "=m" (core_regs->es) );
+    asm ( "mov %%fs, %0" : "=m" (core_regs->fs) );
+    asm ( "mov %%gs, %0" : "=m" (core_regs->gs) );
 
     asm ( "mov %%cr0, %0" : "=r" (xen_core_regs->cr0) );
     asm ( "mov %%cr2, %0" : "=r" (xen_core_regs->cr2) );
-- 
2.39.5


