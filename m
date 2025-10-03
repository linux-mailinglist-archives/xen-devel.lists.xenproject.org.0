Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BABB85D2
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137041.1473494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohD-0005od-Ir; Fri, 03 Oct 2025 22:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137041.1473494; Fri, 03 Oct 2025 22:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4ohD-0005nJ-Eq; Fri, 03 Oct 2025 22:56:15 +0000
Received: by outflank-mailman (input) for mailman id 1137041;
 Fri, 03 Oct 2025 22:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4ofH-0004mK-As
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:54:15 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id debd2545-a0ab-11f0-9809-7dc792cee155;
 Sat, 04 Oct 2025 00:54:08 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so1826319f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:54:08 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:54:07 -0700 (PDT)
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
X-Inumbo-ID: debd2545-a0ab-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532048; x=1760136848; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sn6fXbvwyibf5aUodrVJm6JuvhOw4aWmGnw59RjgLws=;
        b=Ol1uOYN6iFH1Q9ePKse2G7AQDJ3LybFqAL1vtshiUm9TKxNhLXXSSa3/aqfROjeio1
         qx1U+TvZ9MVllMRDSOV0PSeKkffmKwtaIxqG74PcoN5zxuuyOEbKyz46X4WtdS1BfJp6
         bnd1fq6FQrhuzCYg4KZidbeAP0OvRSBqUyqdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532048; x=1760136848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sn6fXbvwyibf5aUodrVJm6JuvhOw4aWmGnw59RjgLws=;
        b=oySh1FH6Srg2wZpZmcaj2Avw8oj4Fw1kAHnawOI0ReWUUFxZkgcCcudBo+ccCMm8Uo
         o05OhQTsa9VlEwtj2dQKMb8g752bXaCwrqRzIbS2Gqi2zuW9DqAQdv7l7m4eZnCl6Tb5
         pHyddNvt2ykiqgExTsvUPSjX7iJ8Udhrt60hlL8CjP5EtMSsqy+M6sM+ytVU8KQwL7Vb
         AxcD9D+5IKGhmqDukncveT3UQC4FDrbmC4jCyU+qwwylHMaOzHmCwDDTV3yg/4V0Qbvo
         2E4+JInFrKGzdJWoDqegD51FG7TIQfAb3LF1H0AIDzjacwfRbv9hutDzqb6LlLY4+M4+
         w6dg==
X-Gm-Message-State: AOJu0YxEiSSA4PigjhSS5P83rGT/6XAcj+1EEUfy21eMNZkYhvaihX36
	6z1v97YMGlyjk+dk3QZ8h8sMMYYXBDBMw4i0YrdWLpK9S+WUPcn9zQDvvbwTCtISo3Xh5MkIV2j
	LT3XAU7FOzC64
X-Gm-Gg: ASbGncuo5cPaUbnqm8NCsvkf/cyMvad9YYYtDPJDbM4be5pZMXHJi/BGlhIlamjdVyc
	mqvvDhRYS4Ngsq00H449+cp2Btvv7AyX66f1cMA1RSNg3evkMGzHhPzBqhnkhxDCORpIQ2Vr4pr
	tU3qDbz9BdQSo7VqliuhHPtXzn6SIWgCD4eKzd5r5mbm9y/0KQy+k141A05tQO0jnsfsZN+Y/Cr
	mqxKjcMtRxQ77WJ1ercYn+bFQk3TVRoNd0XfGQ1LIcbt4UxEBrk+7BJ9zqaJW3pogYsaD3J3z7R
	HnQSpZkXgnu5fFf/t14/bn1z3AR2eLmy4eIfb0w4chG/ADptLatGe0vzl9kxWDZKqaWuL51OZFI
	Exjn+wM7Xg/NemjBBtj/J555adhOzKAvs12cExDMXmysd4d/aQfPQ4UNQN1DlE/ciFZ6SG9HPRc
	er5Q7YNhLdLbN6vxJSR55X3TRpB5stoRU=
X-Google-Smtp-Source: AGHT+IHbMLuoC41nePwr7XwlQNRwJGW5DZ9YhlUUXU/U86EiWOUWA9oDMmV7RihOf5Z2HIlk4mA2ew==
X-Received: by 2002:a05:6000:402b:b0:3ea:6680:8fce with SMTP id ffacd0b85a97d-4256719383emr3027011f8f.48.1759532047882;
        Fri, 03 Oct 2025 15:54:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 22/22] x86: Clamp reserved bits in eflags more aggressively
Date: Fri,  3 Oct 2025 23:53:34 +0100
Message-Id: <20251003225334.2123667-23-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ERETU, unlike IRET, requires the sticky-1 bit (bit 2) be set, and reserved
bits to be clear.  Notably this means that dom0_construct() must set
X86_EFLAGS_MBS it in order for a PV dom0 to start.

Xen has been overly lax with reserved bit handling.  Adjust
arch_set_info_guest*() and hypercall_iret() which consume flags to clamp the
reserved bits for all guest types.

This is a minor ABI change, but by the same argument as commit
9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"), the reserved
bits would get clamped naturally by hardware when the vCPU is run.

This allows PV guests to start when Xen is using FRED mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * Rewrite the commit message.
v2:
 * New

The handling of VM is complicated.

It turns out that it's simply ignored by IRET in Long Mode (i.e. clearing it
commit 0e47f92b0725 ("x86: force EFLAGS.IF on when exiting to PV guests")
wasn't actually necessary) but ERETU does care.

But, it's unclear how to handle this in in arch_set_info().  We must preserve
it for HVM guests (which can use vm86 mode).  PV32 has special handling but
only in hypercall_iret(), not in arch_set_info().
---
 xen/arch/x86/domain.c                | 4 ++--
 xen/arch/x86/hvm/domain.c            | 4 ++--
 xen/arch/x86/include/asm/x86-defns.h | 7 +++++++
 xen/arch/x86/pv/dom0_build.c         | 2 +-
 xen/arch/x86/pv/iret.c               | 8 +++++---
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ce08f91be3af..423d0a6af4f3 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1273,7 +1273,7 @@ int arch_set_info_guest(
         v->arch.user_regs.rax               = c.nat->user_regs.rax;
         v->arch.user_regs.rip               = c.nat->user_regs.rip;
         v->arch.user_regs.cs                = c.nat->user_regs.cs;
-        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
+        v->arch.user_regs.rflags            = (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
         v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
         v->arch.user_regs.ss                = c.nat->user_regs.ss;
         v->arch.pv.es                       = c.nat->user_regs.es;
@@ -1297,7 +1297,7 @@ int arch_set_info_guest(
         v->arch.user_regs.eax               = c.cmp->user_regs.eax;
         v->arch.user_regs.eip               = c.cmp->user_regs.eip;
         v->arch.user_regs.cs                = c.cmp->user_regs.cs;
-        v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
+        v->arch.user_regs.eflags            = (c.cmp->user_regs.eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
         v->arch.user_regs.esp               = c.cmp->user_regs.esp;
         v->arch.user_regs.ss                = c.cmp->user_regs.ss;
         v->arch.pv.es                       = c.cmp->user_regs.es;
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 048f29ae4911..1e874d598952 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -194,7 +194,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
         uregs->rsi    = regs->esi;
         uregs->rdi    = regs->edi;
         uregs->rip    = regs->eip;
-        uregs->rflags = regs->eflags;
+        uregs->rflags = (regs->eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
 
         v->arch.hvm.guest_cr[0] = regs->cr0;
         v->arch.hvm.guest_cr[3] = regs->cr3;
@@ -245,7 +245,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
         uregs->rsi    = regs->rsi;
         uregs->rdi    = regs->rdi;
         uregs->rip    = regs->rip;
-        uregs->rflags = regs->rflags;
+        uregs->rflags = (regs->rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
 
         v->arch.hvm.guest_cr[0] = regs->cr0;
         v->arch.hvm.guest_cr[3] = regs->cr3;
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 0a0ba83de786..edeb0b4ff95a 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -27,6 +27,13 @@
     (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_AF |   \
      X86_EFLAGS_ZF | X86_EFLAGS_SF | X86_EFLAGS_OF)
 
+#define X86_EFLAGS_ALL                                          \
+    (X86_EFLAGS_ARITH_MASK | X86_EFLAGS_TF | X86_EFLAGS_IF |    \
+     X86_EFLAGS_DF | X86_EFLAGS_OF | X86_EFLAGS_IOPL |          \
+     X86_EFLAGS_NT | X86_EFLAGS_RF | X86_EFLAGS_VM |            \
+     X86_EFLAGS_AC | X86_EFLAGS_VIF | X86_EFLAGS_VIP |          \
+     X86_EFLAGS_ID)
+
 /*
  * Intel CPU flags in CR0
  */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21158ce1812e..f9bbbea2ff70 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1021,7 +1021,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
     regs->rip = parms.virt_entry;
     regs->rsp = vstack_end;
     regs->rsi = vstartinfo_start;
-    regs->eflags = X86_EFLAGS_IF;
+    regs->eflags = X86_EFLAGS_IF | X86_EFLAGS_MBS;
 
     /*
      * We don't call arch_set_info_guest(), so some initialisation needs doing
diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index d3a1fb2c685b..39ce316b8d91 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -80,8 +80,9 @@ long do_iret(void)
 
     regs->rip    = iret_saved.rip;
     regs->cs     = iret_saved.cs | 3; /* force guest privilege */
-    regs->rflags = ((iret_saved.rflags & ~(X86_EFLAGS_IOPL|X86_EFLAGS_VM))
-                    | X86_EFLAGS_IF);
+    regs->rflags = ((iret_saved.rflags & X86_EFLAGS_ALL &
+                     ~(X86_EFLAGS_IOPL | X86_EFLAGS_VM)) |
+                    X86_EFLAGS_IF | X86_EFLAGS_MBS);
     regs->rsp    = iret_saved.rsp;
     regs->ss     = iret_saved.ss | 3; /* force guest privilege */
 
@@ -143,7 +144,8 @@ int compat_iret(void)
     if ( VM_ASSIST(v->domain, architectural_iopl) )
         v->arch.pv.iopl = eflags & X86_EFLAGS_IOPL;
 
-    regs->eflags = (eflags & ~X86_EFLAGS_IOPL) | X86_EFLAGS_IF;
+    regs->eflags = ((eflags & X86_EFLAGS_ALL & ~X86_EFLAGS_IOPL) |
+                    X86_EFLAGS_IF | X86_EFLAGS_MBS);
 
     if ( unlikely(eflags & X86_EFLAGS_VM) )
     {
-- 
2.39.5


