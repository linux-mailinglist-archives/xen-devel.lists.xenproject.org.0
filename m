Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAGCLieEy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:21:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC3366072
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268672.1557905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UMB-0007QL-7L; Tue, 31 Mar 2026 08:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268672.1557905; Tue, 31 Mar 2026 08:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UMB-0007Oh-40; Tue, 31 Mar 2026 08:21:51 +0000
Received: by outflank-mailman (input) for mailman id 1268672;
 Tue, 31 Mar 2026 08:21:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w7UM9-0007OG-IH
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:21:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UM8-00AxBH-UO
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:21:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69cb8417-bab6-0a2a0a5309dd-0a2a4507b9b6-30
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:21:48 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69cb841c-fd74-0a2a45070019-d155802eb5c8-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:21:48 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48704db565eso68667515e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:21:48 -0700 (PDT)
Received: from andrew-laptop.home ([2a01:cb15:80df:da00:ec5b:e128:36bf:56b1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887adadf4fsm12957915e9.11.2026.03.31.01.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 01:21:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774945308; x=1775550108; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DU+l8B0GE1vEY8ASsI9rW+ZnbwyOq7iyyV/9tiDTUYQ=;
        b=aTneldfpoSt5a/nzQaMTE8gRZ1Gsl/Ynxx8OM48wooQrYw4deN27C6MIGVYuGyRs/F
         HkW+aLIaXfJBnasghe0fD2QkcoqeniI2QB76dvzwYt2+ZRTjrQa2goEWvYGJIKrly5Ds
         majKGj/6W756PFYQSrLbXLR3Bu8lmqNu3n0uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945308; x=1775550108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU+l8B0GE1vEY8ASsI9rW+ZnbwyOq7iyyV/9tiDTUYQ=;
        b=AIp6NkI3U269tYyCdm0eMvyX0ZmFjOhQJaB+lCxYbMJfvLNMKQ1z24ihhF96XYPloe
         BS7ELWbtoyQrHrCfYdKTSOB9tFE9iZjywfU3BbUMO6RAcF0oIBse+kHPKOmrIzu3Ix4d
         BoQj6oxgoUUc122TbU0JR0BMY+EqJOBiwB+5SUSV0kLG95axCdgNbWD6CoLAqTpro2+S
         ukHXoPGwKBhaxJ9B2IRsrfpKcJfRKmSIeMGBKli6QpGdivE3qCrCJbugn2zgybQnLdcZ
         qgvXdhemy4Aiq2QCyuQrcRwAFk1eHuOzTxQMTIlBpHHtFQCBlke4eHHXmPFGvUsyAk6P
         E+sw==
X-Gm-Message-State: AOJu0YzusM8IfUarNjtdgbdN827pXiBSsxnRp0wIEi0f8tpwaygbijIF
	Pi2BO3ZKsO2i9YuSA08v2rg8DALnxj0UJq2T/eO4ymO/mnPcHifpcUpWDgZ7cqtPnxRAnxY88H9
	9ZBTS
X-Gm-Gg: ATEYQzxRk3yRusEklAE4ISxMwOYfn2mkLxNW17gfitLEnFCXtbLdwY8FJhG+3ZMDG9u
	KyTOaKdr74e2js4rOS+8vVFKxVRAelFSjlnFvokNp2Ye5ey1eiaB4QbhB0iy4+CkQN7jWrZ0y6O
	NfI5ruyKGvCmqoxKVvVtVDiUKQNZGibTR2Pv0MzaflnBjjailsoUIXP/tLKl/V0q7ng/umyBaqs
	2NQydeKUHR2jN//cWEgmBVovusp+PbGWRk0Rq75L7v+hpGPPvtBvJMgIp/zrSGVdhS2dQak6IzC
	O6GpsTUfU3tmbeIB45GD4q002Zb7AqeO3FKun0+4rBaq4Q8cdGLQJNwrz3qKd0oLRE19DgXmKAN
	PIWqPI4SmxTPy1PZRqbpTf6eY+/YM24tBd4dAqrvhQt9LJu6S86gzwzQS/h4/3VN6koj8zRALrF
	pBXXuBTMvC0225EPwPnZXOWE4s3/Plkz0XWVAVrlKSujxv
X-Received: by 2002:a05:600c:c168:b0:485:35a4:939f with SMTP id 5b1f17b1804b1-48727eddeacmr250819025e9.28.1774945307186;
        Tue, 31 Mar 2026 01:21:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/pv: Provide better SYSCALL backwards compatibility in FRED mode
Date: Tue, 31 Mar 2026 09:21:42 +0100
Message-Id: <20260331082142.13254-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774945308-55EB3303-DA90FA0A/0/0
X-purgate-type: clean
X-purgate-size: 3856
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2EFC3366072
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In FRED mode, the SYSCALL instruction does not modify %rcx/%r11.  Software
using SYSCALL spills %rcx/%r11 around the invocation, which is why FRED not
doing this goes largely unnoticed.

Nevertheless, there is a difference in the guest immediately following cases
where Xen would use SYSRET in non-FRED mode.  These are:

 * HYPERCALL_iret with VGCF_in_syscall set.
 * Delivery to a registered entrypoint.  In the PV ABI this is always SYSRET'd
   to, with %rcx/%r11 provided on the stack.

Debugging or snapshotting activities will observe the stale contents of
%rcx/%r11 in FRED mode, rather than the %rip/eflags value they'd have in
IDT mode.  Manually adjust them when SYSRET would have been used.

Regarding the choice of instructions in eretu_exit_to_guest(), a branch would
be a context dependent 50/50 split (i.e. increased chance of mispredict), and
only saves one instruction.  The CMOVs read the same cacheline that ERETU is
about to process, so are as close to free as we can reasonably get.

Fixes: 76193ef47d91 ("x86/pv: System call handling in FRED mode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rewrite the commit message.
 * Set TRAP_syscall in the SYSCALL path.
---
 xen/arch/x86/traps.c             |  9 +++++----
 xen/arch/x86/x86_64/entry-fred.S | 12 +++++++++++-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 8aa1e4181bd1..656ad337ab90 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2392,10 +2392,6 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
              * The guest isn't aware of FRED, so recreate the legacy
              * behaviour.
              *
-             * The non-FRED SYSCALL path sets TRAP_syscall in entry_vector to
-             * signal that SYSRET can be used, but this isn't relevant in FRED
-             * mode.
-             *
              * When setting the selectors, clear all upper metadata again for
              * backwards compatibility.  In particular fred_ss.swint becomes
              * pend_DB on ERETx, and nothing else in the pv_hypercall() would
@@ -2411,9 +2407,14 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 
             regs->ssx = l ? FLAT_KERNEL_SS   : FLAT_USER_SS32;
             regs->csx = l ? FLAT_KERNEL_CS64 : FLAT_USER_CS32;
+            regs->rcx = regs->rip;
+            regs->r11 = regs->rflags;
 
             if ( guest_kernel_mode(curr, regs) )
+            {
+                regs->entry_vector |= TRAP_syscall;
                 pv_hypercall(regs);
+            }
             else if ( (l ? curr->arch.pv.syscall_callback_eip
                          : curr->arch.pv.syscall32_callback_eip) == 0 )
             {
diff --git a/xen/arch/x86/x86_64/entry-fred.S b/xen/arch/x86/x86_64/entry-fred.S
index 2fa57beb930c..e9c84423dacd 100644
--- a/xen/arch/x86/x86_64/entry-fred.S
+++ b/xen/arch/x86/x86_64/entry-fred.S
@@ -4,6 +4,7 @@
 
 #include <asm/asm_defns.h>
 #include <asm/page.h>
+#include <asm/processor.h>
 
         .section .text.entry, "ax", @progbits
 
@@ -26,7 +27,16 @@ FUNC(entry_FRED_R3, 4096)
 END(entry_FRED_R3)
 
 FUNC(eretu_exit_to_guest)
-        POP_GPRS
+        /*
+         * PV guests aren't aware of FRED.  If Xen in IDT mode would have used
+         * a SYSRET instruction, preserve the legacy behaviour for %rcx/%r11
+         */
+        testb   $TRAP_syscall >> 8, UREGS_entry_vector + 1(%rsp)
+
+        POP_GPRS /* Preserves flags */
+
+        cmovnz  EFRAME_rip(%rsp), %rcx
+        cmovnz  EFRAME_eflags(%rsp), %r11
 
         /*
          * Exceptions here are handled by redirecting either to
-- 
2.34.1


