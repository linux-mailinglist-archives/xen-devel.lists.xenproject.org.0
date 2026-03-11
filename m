Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOc9HI+tsWmzEQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 18:59:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8CE2685C7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 18:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251421.1548560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0NpW-0006ed-3p; Wed, 11 Mar 2026 17:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251421.1548560; Wed, 11 Mar 2026 17:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0NpW-0006bq-0r; Wed, 11 Mar 2026 17:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1251421;
 Wed, 11 Mar 2026 17:58:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAj5=BL=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w0NpT-0006bk-NY
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 17:58:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0c32813-1d73-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 18:58:42 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4853aec185aso995265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 10:58:42 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541aa73dasm466222415e9.2.2026.03.11.10.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 10:58:40 -0700 (PDT)
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
X-Inumbo-ID: f0c32813-1d73-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773251922; x=1773856722; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlBmTgWfgO6kHetj1uAczCboAc6JSzkfGfAETvDden4=;
        b=BKPVCyZx/qjgmYu7vT7nd1CgNuWjnuBQmNcal/sYhJgZug+M1NFfx25YQukjzemjZj
         ocy80Fpw6VxloLKU6ihrYCowCHlr8xtdiMBhj/qmKnllt2wv/iS+rikstUrIaEi7uZIv
         NDXj2NCRDdQrhnzOXEXODiPEepOZHeLhMaAlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773251922; x=1773856722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlBmTgWfgO6kHetj1uAczCboAc6JSzkfGfAETvDden4=;
        b=U9I3E+e/wuKO9QouaTHfKrn/kJRLSN4ZktULpoRStpnFQy+bYlskVJPe1ov/VKnDn5
         VJRTCAw6scA+/8tsmkXra3xLyv/P1JyRm0B3HAb1iuqX4q8Z9p6PBh1D3wj8yEtk5D3f
         U1j34MGwyZ3T3L7PhzC+A26wUrY1tzgWaSYbo/WlEziowfbOmYS0Blm7XqtA/GZz3MgR
         WOvS/noOAmMUvI21tc7hyeMlLKmUNXSypGsa9IE+GxWn0RZreEYCWkmwVbu51SxWvFzo
         kRJcYoMkOcT92q/jlSyaoXE9v5CkRmhbdn+KWlZiS61Y03UyL9oxhB9vtuhZ36w0G2Qr
         jvQA==
X-Gm-Message-State: AOJu0YwAZ0FCUBAKUI+MRoH70MJ3yEaIUzgdvGSdFUwKBp/9jL8ibJyZ
	Ck2hCditeajw2l73+GtfaIrV0pFOD2D4DiaftL+qP+A8jDiP1gzUhIqLrSJWd4PM4muCuivE1Sg
	yIKud
X-Gm-Gg: ATEYQzzDlqSUDr71xmDF8ZMYsPIdSBYmVs5t/xtiJSm6JcEMVrgK98RKCly433rKYgV
	nCOgzpTnCB6pDNZIIAxeC4II44hz/vB7jiKrMHFwog17nV93eeUHJvITpzg/RbfTqSA7FA/htrI
	xNNXvNPVv/LJjaoe2bv8zlSa2CiqkF5mmlE+xwAqMqaq79bnQGcfvV++BUaVpYHSaXbKZ7MPcOB
	1ZTyJkadVX/Z8gxQmgwLK/ItdXqT/HwQPTx5olzMgLm2tN4q0o4gCAmjec5sot1MRJNsR9KDWhy
	X02N2rIu4uuAjr50cap3vUXDpWHtlHkyVILEnDMcSbc/aS0m6KofXnRpGC1W9SkcZbzkAA3mh9h
	S/jIYYTRW1WL5AZOCz1qXw+UG0cRi2rHL27jlhrxefxCpETX6ihzXWIKkDqTdhRBg4j1kT622Fi
	/+2FmZ1aBOztr5cIJCe4IA150nSk+RtUGOWRZE/HAlTBOJKzADblE84xn7z/QnjxuBUYyu82Q=
X-Received: by 2002:a05:600c:8b0a:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-4854b129f91mr57653585e9.29.1773251921378;
        Wed, 11 Mar 2026 10:58:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4.1 13/14] x86: Clamp bits in eflags more aggressively
Date: Wed, 11 Mar 2026 17:58:38 +0000
Message-Id: <20260311175838.573925-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-14-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-14-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AE8CE2685C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In FRED mode, ERET is stricter than IRET about flags.  Notably this means:

 * The vm86 bit (bit 17) and IOPL (bits 12,13) must be clear.
 * The sticky-1 reserved bit (bit 2) must be set, so dom0_construct() needs to
   set X86_EFLAGS_MBS in order for a PV dom0 to start.
 * All other reserved bits must be clear.

Xen has been overly lax with reserved bit handling.  Adjust
arch_set_info_guest*() and hypercall_iret() which consume flags to clamp the
reserved bits for all guest types.

This is a minor ABI change, but by the same argument as commit
9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"); the reserved
bits would get clamped like this naturally by hardware when the vCPU is run.

The handling of vm86 is also different.  Guests under 32bit Xen really could
use vm86 mode, but Long Mode disallows vm86 mode and IRET simply ignores the
bit.  Xen's behaviour for a PV32 guest trying to use vm86 mode under a 64bit
Xen is to arrange to deliver #GP at the target of the IRET, rather than to
fail the IRET itself.

However there's no filter filtering in arch_set_info_guest() itself, and it
can't arrange to queue a #GP at the target, so do the next best thing and fail
the hypercall.  This is not expected to create an issue for PV guests, as the
result of such an arch_set_info_guest() previously would be to run supposedly
Real Mode code as Protected Mode code.

This allows PV guests to start when Xen is using FRED mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v4.1:
 * Adjust VM handling.
 * Rewrite commit message.

v3:
 * Rewrite the commit message.
v2:
 * New

It turns out that it's simply ignored by IRET in Long Mode (i.e. clearing it
commit 0e47f92b0725 ("x86: force EFLAGS.IF on when exiting to PV guests")
wasn't actually necessary) but ERETU does care.
---
 xen/arch/x86/domain.c                | 24 ++++++++++++++++++++++--
 xen/arch/x86/hvm/domain.c            |  4 ++--
 xen/arch/x86/include/asm/x86-defns.h |  7 +++++++
 xen/arch/x86/pv/dom0_build.c         |  2 +-
 xen/arch/x86/pv/iret.c               |  8 +++++---
 5 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 868c26036dd9..4664264b2f5d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1193,6 +1193,14 @@ int arch_set_info_guest(
 
             if ( !__addr_ok(c.nat->ldt_base) )
                 return -EINVAL;
+
+            /*
+             * IRET in Long Mode discards EFLAGS.VM, but in FRED mode ERET
+             * cares that it is zero.
+             *
+             * Guests can't see FRED, so emulate IRET behaviour.
+             */
+            c.nat->user_regs.rflags &= ~X86_EFLAGS_VM;
         }
 #ifdef CONFIG_COMPAT
         else
@@ -1205,6 +1213,18 @@ int arch_set_info_guest(
 
             for ( i = 0; i < ARRAY_SIZE(c.cmp->trap_ctxt); i++ )
                 fixup_guest_code_selector(d, c.cmp->trap_ctxt[i].cs);
+
+            /*
+             * Under 32bit Xen, PV guests could really use vm86 mode.  Under
+             * 64bit Xen, vm86 mode can't be entered even by PV32 guests.
+             *
+             * For backwards compatibility, compat HYPERCALL_iret will arrange
+             * to deliver #GP at the target of the IRET rather than to fail
+             * the IRET itself, but we can't arrange for the same behaviour
+             * here.  Reject the hypercall as the next best option.
+             */
+            if ( c.cmp->user_regs.eflags & X86_EFLAGS_VM )
+                return -EINVAL;
         }
 #endif
 
@@ -1244,7 +1264,7 @@ int arch_set_info_guest(
         v->arch.user_regs.rax               = c.nat->user_regs.rax;
         v->arch.user_regs.rip               = c.nat->user_regs.rip;
         v->arch.user_regs.cs                = c.nat->user_regs.cs;
-        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
+        v->arch.user_regs.rflags            = (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
         v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
         v->arch.user_regs.ss                = c.nat->user_regs.ss;
         v->arch.pv.es                       = c.nat->user_regs.es;
@@ -1268,7 +1288,7 @@ int arch_set_info_guest(
         v->arch.user_regs.eax               = c.cmp->user_regs.eax;
         v->arch.user_regs.eip               = c.cmp->user_regs.eip;
         v->arch.user_regs.cs                = c.cmp->user_regs.cs;
-        v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
+        v->arch.user_regs.eflags            = (c.cmp->user_regs.eflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
         v->arch.user_regs.esp               = c.cmp->user_regs.esp;
         v->arch.user_regs.ss                = c.cmp->user_regs.ss;
         v->arch.pv.es                       = c.cmp->user_regs.es;
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 155d61db13f8..a0e811ea47a0 100644
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
index 9a11a0a16b4e..075a3646c2a3 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1024,7 +1024,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
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


