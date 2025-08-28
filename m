Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DDBB3A3BE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099193.1453157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHd-00023q-KA; Thu, 28 Aug 2025 15:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099193.1453157; Thu, 28 Aug 2025 15:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHd-00021F-Dd; Thu, 28 Aug 2025 15:11:25 +0000
Received: by outflank-mailman (input) for mailman id 1099193;
 Thu, 28 Aug 2025 15:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCe-0003MD-EB
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:16 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b5178ae-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:06:16 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso795791f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:16 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:14 -0700 (PDT)
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
X-Inumbo-ID: 8b5178ae-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393575; x=1756998375; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgmHnEeI6SxfsGeG6rRdPzhs3Pr505V+8fvY4mIUQ20=;
        b=UeFH2KrrwcE369wqLpu8KeZinEjyJ9eeV2Op4IeYmpcOLV60sFN3vYf8efxAWDMcbL
         pvzQX+x2/DgQt1h2++DNrHSMVVFh+MdVnCsDNFqxnklVO1zkRxGEkxqYSL8TQENjM3KZ
         X4ZWlAcOjU0xuKVK7DzaM541EPT9Fkyuz9Y8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393575; x=1756998375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgmHnEeI6SxfsGeG6rRdPzhs3Pr505V+8fvY4mIUQ20=;
        b=MblAlRFz7uR9eXruGW0Zf1ZGjZijJb82ZCXgCSexSab3LD6YkHwAwXl1PEKc0DykZV
         +RjCt8WSLllhJaFf3AVRcAWi276yetAnKsCMHcg5VJ3EihCqwXwn7kiG+apIDLKMb0sw
         +I+GrN4WthG+tIFB8Bh1yeuPsYKmtZ/jLvXRyG1jfdYpNJE22dR/TNnencLKUh38E1ZG
         gNlVVNKDwwp452ySMJY8F1yOPDRkf342wpx1aZ5SwpD4CvxEzJtqgqcu5rL2toMgjurH
         EfMmhdy7hwTQ/Qbp9bxNZchB8eOE2N8f3Xq00Wln9nSSd9Wfe9rGJwnQVbB6HbVGbVAD
         4yxQ==
X-Gm-Message-State: AOJu0YxEYFfarcDhQyRc4EU0mlbnNd0arQZjva250d1opl9c4ScPA2NS
	/e9nu4bge4XbXuNp4f2X++L6GWu+9mDcGBGzFEkM6o36SRfrFP7JuoRIPxAvno/tZVihAo/+OAn
	GXWpu
X-Gm-Gg: ASbGnctlN2IJklEDjcZ8BInqdOWJa9mQsZqvcwx9tkcxqi9k27PoId9oxzxjKwc1Lef
	6DvDzKwQIs8qpxXe5TVOj7ZxbI0ATqmZVksRknevlhu/AHlDiYc+MjC5qp4l8JtTwErjjLnOD4U
	cmPwn+kjC7foPcOE6pOCdwXuBk1kMXs4X/yDGDvGvMA7m9FRy/sYT9wlxYfQdK6fiMA4fLvt2QB
	y++GCkbCT0HewXLRb+YoxsLiFrJ6ofuIamHQoplAY2DWmY0xlm21dN2NJKPbYPCj2AdueOXAPnN
	wt7PEg2GYk8DyzoGE341yL0ghdxBIFsiC/ztPg+STWSZgFHP4gtbUnWEz10yYnbChgwMeNNWTbY
	c5d36j+xdih7j/POeUFNIgYPN5RUrA+afN/qeaxMGiCyJo8drOWnG+zbr5ys9/n+sG8POborDaG
	Fl
X-Google-Smtp-Source: AGHT+IE6wkCmxSjZlDLFodx9e+bViG30EvRU7WG/WSSoEBbdFGwMfQm59jtAuWXGzfWmgd420HIOxg==
X-Received: by 2002:a05:6000:250e:b0:3b9:55a:9d0c with SMTP id ffacd0b85a97d-3c5da54e97dmr17845560f8f.3.1756393575031;
        Thu, 28 Aug 2025 08:06:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 16/23] x86/entry: Alter how IRET faults are recognised
Date: Thu, 28 Aug 2025 16:04:02 +0100
Message-Id: <20250828150409.901315-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now we have two IRET instructions that can fault for guest reasons, and
the pre exception table gives handle_exception as the fixup for both.

Instead, we can have compat_restore_all_guest() use restore_all_guest()'s IRET
which gives us just a single position to handle specially.

In exception_with_ints_disabled(), remove search_pre_exception_table() and use
a simpler check.  Explain how the recovery works, because this isn't the first
time I've had to figure it out.

The reference to iret_to_guest highlights that any checking here is specific
to CONFIG_PV, so exclude it in !PV builds.

Later in exception_with_ints_disabled(), it suffices to load %ecx rather than
%rcx, and remove a stray semi-colon from the rep movsq.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/x86_64/compat/entry.S |  3 +--
 xen/arch/x86/x86_64/entry.S        | 31 ++++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index d7b381ea546d..39925d80a677 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -167,8 +167,7 @@ FUNC(compat_restore_all_guest)
             scf=STK_REL(CPUINFO_scf,      CPUINFO_rip), \
             sel=STK_REL(CPUINFO_verw_sel, CPUINFO_rip)
 
-.Lft0:  iretq
-        _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+        jmp     iret_to_guest
 END(compat_restore_all_guest)
 
 /* Callers can cope with both %rax and %rcx being clobbered. */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index c02245ac064c..01b431793b7b 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -241,8 +241,9 @@ iret_exit_to_guest:
         SPEC_CTRL_COND_VERW     /* Req: %rsp=eframe                    Clob: efl */
 
         addq  $8,%rsp
-.Lft0:  iretq
-        _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+
+LABEL(iret_to_guest, 0)
+        iretq
 END(restore_all_guest)
 
 /*
@@ -920,10 +921,23 @@ handle_exception_saved:
 exception_with_ints_disabled:
         testb $3,UREGS_cs(%rsp)         # interrupts disabled outside Xen?
         jnz   FATAL_exception_with_ints_disabled
-        movq  %rsp,%rdi
-        call  search_pre_exception_table
-        testq %rax,%rax                 # no fixup code for faulting EIP?
-        jz    .Ldispatch_exceptions
+
+#ifndef CONFIG_PV
+        /* No PV?  No IRETs-to-guest to worry about. */
+        jmp .Ldispatch_exceptions
+#else
+        /* Check to see if the exception was on the IRET to guest context. */
+        lea   iret_to_guest(%rip), %rax
+        cmp   %rax, UREGS_rip(%rsp)
+        jne   .Ldispatch_exceptions
+
+        /*
+         * Recovery is at handle_exception.  It may be necessary to make space
+         * on the interrupted stack for ec/ev, after which the current ec/ev
+         * is copied to make it appear as if this exception occurred in guest
+         * context.
+         */
+        lea   handle_exception(%rip), %rax
         movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
 
 #ifdef CONFIG_XEN_SHSTK
@@ -940,13 +954,14 @@ exception_with_ints_disabled:
         movq  %rsp,%rsi
         subq  $8,%rsp
         movq  %rsp,%rdi
-        movq  $UREGS_kernel_sizeof/8,%rcx
-        rep;  movsq                     # make room for ec/ev
+        mov   $UREGS_kernel_sizeof/8, %ecx
+        rep movsq                       # make room for ec/ev
 1:      movq  UREGS_error_code(%rsp),%rax # ec/ev
         movq  %rax,UREGS_kernel_sizeof(%rsp)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %r13b, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp   restore_all_xen           # return to fixup code
+#endif /* !CONFIG_PV */
 
 /* No special register assumptions. */
 FATAL_exception_with_ints_disabled:
-- 
2.39.5


