Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F41B3A3A9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099155.1453076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHH-0006zp-8m; Thu, 28 Aug 2025 15:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099155.1453076; Thu, 28 Aug 2025 15:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHH-0006x0-4D; Thu, 28 Aug 2025 15:11:03 +0000
Received: by outflank-mailman (input) for mailman id 1099155;
 Thu, 28 Aug 2025 15:11:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCq-0003MD-0q
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:28 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9239f747-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:06:27 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45b618b7d33so8990915e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:27 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:26 -0700 (PDT)
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
X-Inumbo-ID: 9239f747-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393587; x=1756998387; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5UHi3JKZZBSQAjqQRZMwCcvh6WCJ8lexuxviuRt49A=;
        b=vZkCzojuoL6rd7ozEovLvwhzM9jV5jezsIHKzopIEEE7PJTA+Iqu43V08Gj+JkRUIk
         Z2YDpccObe94mP3ccBCcWoFQoAedpyQr0YD3RZ53TyWIAxE+73Azj7oOdVE+dJRZiYpU
         fGQl+m1991DbXjw1WTnFNrBjkmppVKU/mkekk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393587; x=1756998387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5UHi3JKZZBSQAjqQRZMwCcvh6WCJ8lexuxviuRt49A=;
        b=F+zQ5HaF3toE4Ik3eVTFNO676S+t9R9HY+AAaAMMCYYDZh6FkIP+tjLx4yGm6/oGRS
         6XAkiIXm8sBZOooo56X0wqg0/Hio8dTAq1SJhJGbhcIqnnlbfK/vmFci73teApPsikgY
         RmKuZeRzDZiA7xx0HWQB/cDMwcJKWRlNtfbx/JjAizGBv11YEnoaqzqKaZH9WKhWyW/y
         dO+KrkTFcJCNcmJiuZ0jBlny/gbx91OIC7iOmQeRW5xEszIK8qTjcsdIb2sAH67UbaBB
         +eC+pxeOoMYmai7lQXMWub2GwxYDcmDzMZ9dnyLoy3LprAlP2hRgeEZSIODiJEnJfkEh
         Eyhg==
X-Gm-Message-State: AOJu0Yxyl5akXLvmuCBFmDjWibPpJ6i43moU205SYPfyWZMVl9A8k5Es
	zRCXGs1Hifi4bGPMOZqybXnSt7oPLmHrF0JmE4VZsvbaM6KB+ZJtDWLCn0n7Vg6JZCPVnVRsZyp
	IReWD
X-Gm-Gg: ASbGncsadCPPmfm/VGH3Ry9o7rJCov6DgGOVbeiAcSUrkYP6l+sCHowceSbKtX+adx7
	7JtwqUd+vJdh2BoyJP+9HA96c17ECePZjCgVxiAtSKKnLShYdTbBovL1UzQW4qMhzP071ZTu8ho
	QMXXOaHFKrB93WTEIXlbqVnuNa85ULyw8JvEmPyUwx/fKyjxgg21YpNgeYnqAjDsmlCnMgiWbbP
	LVIZeHexGQFT/VL6UweYcCHdIDhVq/qJ38LV77X4NbCgtcwHpof+DPITYFEpDB87hytbj3h/+k9
	OWdPIluN0GpcfPhAZlglk2Vn91+4UrdPK3Nvtl6wisEaMZx91MJXm8mGDEHn41n94QYaOlRlutm
	VlnOJs8RIwBIyq/3iRcj0yd4LYOyKpFaAHeWkIP3RJbzw+rDuv5BTDkcfwfYQdoz+BLzENQPlJx
	H9All+tGjl7WrI1zaaO/hOrg==
X-Google-Smtp-Source: AGHT+IFGoJ2SLBkL/auKF9GRrFDbj7sPaf7iO5HhIpsN8Hs1nYMPp9x3mhpXNFRUZ+kyFnEcjie0cA==
X-Received: by 2002:a05:600c:314a:b0:45b:7aae:7a92 with SMTP id 5b1f17b1804b1-45b7aae7dcemr20439225e9.21.1756393586589;
        Thu, 28 Aug 2025 08:06:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 23/23] x86/pv: Adjust eflags handling for FRED mode
Date: Thu, 28 Aug 2025 16:04:09 +0100
Message-Id: <20250828150409.901315-24-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ERETU, unlike IRET, requires the sticky-1 bit (bit 2) be set, and reserved
bits to be clear.  Notably this means that dom0_construct() must set
X86_EFLAGS_MBS it in order for a PV dom0 to start.

Adjust arch_set_info_guest*() and hypercall_iret() which consume flags to
clamp the reserved bits.

This is a minor ABI change, but by the same argument as commit
9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"), this change will
happen naturally when the vCPU schedules.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New

The handling of VM is complicated.

It turns out that it's simply ignored by IRET in Long Mode (i.e. clearing it
commit 0e47f92b0725 ("x86: force EFLAGS.IF on when exiting to PV guests")
wasn't actually necessary) but ERETU does care.

But, it's unclear how to handle this in in arch_set_info().  We must preserve
it for HVM guests (whih can use vm86 mode).  PV32 has special handling but
only in hypercall_iret(), not in arch_set_info().
---
 xen/arch/x86/domain.c                | 4 ++--
 xen/arch/x86/hvm/domain.c            | 4 ++--
 xen/arch/x86/include/asm/x86-defns.h | 7 +++++++
 xen/arch/x86/pv/dom0_build.c         | 2 +-
 xen/arch/x86/pv/iret.c               | 8 +++++---
 5 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 64922869a625..c1880324f7a9 100644
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


