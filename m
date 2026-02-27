Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJwXFfIlommI0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26541BEF1A
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243150.1543209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74q-0002cP-Lj; Fri, 27 Feb 2026 23:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243150.1543209; Fri, 27 Feb 2026 23:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw74q-0002WH-4Q; Fri, 27 Feb 2026 23:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1243150;
 Fri, 27 Feb 2026 23:16:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw74o-0008WD-45
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:54 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670b5881-1432-11f1-b164-2bf370ae4941;
 Sat, 28 Feb 2026 00:16:53 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4398e850783so1818829f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:53 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm9680306f8f.10.2026.02.27.15.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:16:51 -0800 (PST)
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
X-Inumbo-ID: 670b5881-1432-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234213; x=1772839013; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/38gQJt4Duoysgo51k9uCF7ZRs4cy2MMdxCGTZF0sM=;
        b=GwO9z+1DaK9BHfSRVqY8Diu6eVJb4bJSYHwF8F5cOUbWPqQs1wN1++kMotfSrKBAl8
         +eWXfnAeSgAFW5GXsipzHoFWtOdungSB+Y85070W6Q0NonZJEJfI32bUjSSsPx7ij2UP
         NOA1QMmhq1Za0WeUEBhFI96PJkcSD3LktowuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234213; x=1772839013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x/38gQJt4Duoysgo51k9uCF7ZRs4cy2MMdxCGTZF0sM=;
        b=YxDvAZ7w5aKNTlES29maHt7pMKvVLeGnSMSQY6OifS2dj0TUEf298ncQdbgArykNrZ
         lU5FF/GSUTB2s7lGaBW4rdsqvLp+VJg8/Np4pzvoN+udem5dN8m4UpBa0KhBY8znVhzn
         HuiCxb4xKKcncKPEVMg89g4ewNrtnTyrm0wWhALnLeO3wMKHld0xUlG3sNNSXu2LAHAy
         Wuce0oROHYCZRr+i9feqo+Sj236B8S3eMV3GPe28N0Z8pE+oYq/MZUdYueupk6gggr6s
         hysC3Of69D7TmkEwGPxQS/qd2Bijw45LZc59r3XutGSnlA3bjadd+PEEBzNBHgPSCnYu
         M/2w==
X-Gm-Message-State: AOJu0YyN05C3f0WS2jlsOyM/JZXfKYPl1A4v+7r4NmrK/4SvXWNpsEjJ
	NokQXvlrv9bCPoGLxflE11boSNWbsq9+Dn1OY0/HR44IkHXRXOdVrOW7c3OcfIyHGWVkB/k1tg8
	qC4tM
X-Gm-Gg: ATEYQzwxTcOMy3RAOZ141Knqh9zIAnYodc0jirAuUS9onALlU5hCYvYmbCFj7xVFZgl
	m0ATV0aDiU8qLhXXOWWsqXqFirhWmottTk9dPJBklSZ1gIuOuqiGSlfQciBNI4rNESHW3hTFk6Z
	YuCGx7b17o7i1d+97K9dey/Zm0wU/wAjh7jBaDj59wuaxMElxgVJyfborxDKM/5OUmeMEu8DgdL
	7WmLU5cvTXA/vywBKFF/225gchmGtQDHCsStFRKAGxiYHngbQ6Vyke/GLU7B3L89AdibFij3lQ8
	tatM4zxzlWuEDmKlgVSG73Xf6C6lvEfT8dGdeaQ9mt8flve3qmAgQO18fDX9q1g+8DOVGjFX8pB
	nK46ZLK1C/Q9dljwDMyv5GIoBBreZKixb9jqOujmqO2Wdp7mS1qbJ+w4K9vtTPhoW3hvuHXuXBp
	keoM0LyMZnZsfLa0Mi4HWun+sGpg7kmYsU8HYRgf3o9cfyQL8hxqtVbGO0MERlJ/gMaswR6xG4r
	yUHn2Kmvw==
X-Received: by 2002:a5d:5703:0:b0:439:9203:595a with SMTP id ffacd0b85a97d-4399de2fd89mr5736542f8f.43.1772234212143;
        Fri, 27 Feb 2026 15:16:52 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 13/14] x86: Clamp reserved bits in eflags more aggressively
Date: Fri, 27 Feb 2026 23:16:35 +0000
Message-Id: <20260227231636.3955109-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
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
X-Rspamd-Queue-Id: C26541BEF1A
X-Rspamd-Action: no action

ERETU, unlike IRET, requires the sticky-1 bit (bit 2) be set, and reserved
bits to be clear.  Notably this means that dom0_construct() must set
X86_EFLAGS_MBS in order for a PV dom0 to start.

Xen has been overly lax with reserved bit handling.  Adjust
arch_set_info_guest*() and hypercall_iret() which consume flags to clamp the
reserved bits for all guest types.

This is a minor ABI change, but by the same argument as commit
9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()"); the reserved
bits would get clamped like this naturally by hardware when the vCPU is run.

This allows PV guests to start when Xen is using FRED mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Still slightly RFC.  Testing still in progress.

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
index 9c1f6ef76d52..1372a65d8123 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1244,7 +1244,7 @@ int arch_set_info_guest(
         v->arch.user_regs.rax               = c.nat->user_regs.rax;
         v->arch.user_regs.rip               = c.nat->user_regs.rip;
         v->arch.user_regs.cs                = c.nat->user_regs.cs;
-        v->arch.user_regs.rflags            = c.nat->user_regs.rflags;
+        v->arch.user_regs.rflags            = (c.nat->user_regs.rflags & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
         v->arch.user_regs.rsp               = c.nat->user_regs.rsp;
         v->arch.user_regs.ss                = c.nat->user_regs.ss;
         v->arch.pv.es                       = c.nat->user_regs.es;
@@ -1268,7 +1268,7 @@ int arch_set_info_guest(
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


