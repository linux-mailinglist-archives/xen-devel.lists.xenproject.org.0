Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wECuCgENBmrSeQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 19:57:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2FC545930
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 19:57:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309149.1580272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNaIO-0001eg-Nc; Thu, 14 May 2026 17:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309149.1580272; Thu, 14 May 2026 17:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNaIO-0001cG-Kl; Thu, 14 May 2026 17:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1309149;
 Thu, 14 May 2026 17:56:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wNaIM-0001cA-Vh
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 17:56:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNaIM-00GS1i-6v
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 19:56:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a060caf-5cb7-0a2a0a5109dd-0a2a45059080-32
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:56:26 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a060cc9-aaa8-0a2a45050019-d155802edd8e-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:56:26 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso53602635e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 10:56:25 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c88495sm8335235e9.4.2026.05.14.10.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 10:56:24 -0700 (PDT)
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
        d=citrix.com; s=google; t=1778781385; x=1779386185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3fGRidiZ0yfRYQMPdYfRMNwaMmmyOBVWWMsI1nxEsU=;
        b=NVuNxaOraSLu95dRLoOZaB9RSiVgMB2lsIBWgKc8/LaxHCCX44sxX120jmtZ2CjpF6
         M4VOLBKMI9hxVj+F7enTdo+Yqu7/HBnKwc140E4Z1jcs57JY24UCkJHtvLZ76DTElS1C
         Bw6f3qytkLzyXsa+LdbvYptkcQfhT9uzF4t0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778781385; x=1779386185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3fGRidiZ0yfRYQMPdYfRMNwaMmmyOBVWWMsI1nxEsU=;
        b=CbvEuNGVppApnKMKPF+1WCJnvgJGVufhfib6DHy5g816cUgKDO88b2O7NjaS3CDDga
         b3Zj9Q39P3iMAGHgL/mNCKhNv2j57x/iVflU+kLCnu19bxZPpl1rSY+cfkL39iwrtW1L
         8PseZ4wiSFITePXW4BqU65Rwl2bOX06brN8NCEoLlzwsZWGD6NJwt13j72DYg8iNp1WN
         tU8uAupYzhEUTj0E10aHmLJCmJhLEJkokoexA767dpc2JoZsRFklpqkt5HNtNwYvWWMt
         G3KRRh7FgKWsXWcV+ESORG3FHLnJb2DvVtAV1Tmg0EoAuFjVDzKF/qeyI2r+6dA1xUNA
         cLyw==
X-Gm-Message-State: AOJu0YzIXFMfLwyP5qLqR8ZOdtSalU9dFYEWyBWBvpF/WKZjnA1b9tA0
	CJx6D64OfwGjM8ovxRLSW3tgFtvQpu3nPXjOfqsU/EmbDgii/+NtYw1dAYVWQJjoS4Y4SaAVEMi
	QIp0rSMs=
X-Gm-Gg: Acq92OHcuVc+aa4wFvbSWlt9HBlYFGvrYy/RQmkwuFabHiLVCkX3rGOgl2CmtSF4GUY
	U2cYwJWhkpjHvfCpLPJWJTgagwjTm3fvKENPBg+8EepdpLBSClYT41rSylHCgwQc3dfuFdiOsfd
	8vHmFY0oc1CT405o1OZ4l8syqGBQnWNGictHNYz19Q5Gx6gX8T5roQ7Ct1YN18OeTsHq1w6G2We
	wg4zTx+r1b5+pOlZaS4D8+9xDDXnmOCoVVWuDP5XyjkyXTZhdY3f461rvruX3CC2nlT8ZAdS1zV
	8/KCNzIaOqPo7Us8M75n88bbxTTOqcuZbjsfanKyRMzXTjOODJWRFhAqRbUQam46B0TZ6E0zuc2
	Gp3yC68HT5B3ZmwqctWAqJxDAZWeMW1duE8uDU06QTQIEhP8GKLWrSIqx0yvQQb+CXVV6xPXWn5
	alVXmOKvHUbHhgKdS33n6Xljr1SXT5ilPciNaqwjxaelTl4a48RqI2wYoYAySO5FCmKtz/L8muz
	3/y
X-Received: by 2002:a05:600c:a4f:b0:48f:e230:2a1f with SMTP id 5b1f17b1804b1-48fe661ede2mr5069785e9.30.1778781385272;
        Thu, 14 May 2026 10:56:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
Date: Thu, 14 May 2026 18:56:23 +0100
Message-Id: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778781386-E2F94443-541C8930/10/73395122804
X-purgate-type: spam
X-purgate-size: 6213
X-Rspamd-Queue-Id: 7E2FC545930
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,vates.tech,amd.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:abdelkareem.abdelsaamad@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>

Starting with Zen4, AMD CPUs can virtualise NMIs for a guest.  On older
hardware, determining when an NMI is safe to deliver is a challenge and Xen
does not handle all corner cases correctly.

With vNMI, there is an enablement bit and two new bits of state in the VMCB; a
pending bit, and a blocked bit.  These directly map to the CPU state for
handling NMIs, and are maintained by hardware during the running of the vCPU.

When vNMI is enabled, have svm_{get,set}set_interrupt_shadow() work in terms
of the vnmi_blocking bit rather than the IRET intercept.  This allows an
emulated IRET instruction to re-enable NMIs.

When injecting a new NMI, simply set the vnmi_pending bit; hardware will
deliver the NMI to the guest at the next suitable juncture.

One complication is that, when delivering a second NMI before the first has
completed, the mix between common HVM logic and SVM specific logic will try to
open an NMI window, malfunctioning as it does so.  When vNMI is enabled, short
circuit this to not consider NMIs blocked.

Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.22.  This is somewhat overdue and makes a concrete improvement to NMI
handling on recent AMD hardware.

v6:
 * Plumb through svm_{get,set}set_interrupt_shadow() so that emulated IRET
   works, as requested several times during review of earlier revisions.
 * Expand the commit message

The !vNMI case is even more broken than I'd realised.  Besides the "what if
the IRET faults?" problem, svm_enable_intr_window() basically ignores the NMI
case and simply re-enters the VM.  This causes the pending NMI to only be
injected next time there is a VMExit.
---
 xen/arch/x86/hvm/svm/intr.c | 19 +++++++++++++++++++
 xen/arch/x86/hvm/svm/svm.c  | 23 +++++++++++++++++------
 xen/arch/x86/hvm/svm/vmcb.c |  2 ++
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 6453a46b8508..cf0621d2f628 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
     u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
     intinfo_t event;
 
+    if ( vmcb->_vintr.fields.vnmi_enable )
+    {
+        vmcb->_vintr.fields.vnmi_pending = true;
+        return;
+    }
+
     event.raw = 0;
     event.v = true;
     event.type = X86_ET_NMI;
@@ -142,6 +148,19 @@ void asmlinkage svm_intr_assist(void)
             return;
 
         intblk = hvm_interrupt_blocked(v, intack);
+
+        /*
+         * When vNMI is active, NMIs can be injected by setting vnmi_pending
+         * and hardware will deliver them at the next appropriate opportunity.
+         * Consider them not blocked, to avoid trying to open an NMI Window.
+         *
+         * Correctness here relies on the fact that all vNMI capable hardware
+         * has vGIF, and vGIF is always activated when appropriate.
+         */
+        if ( intblk == hvm_intblk_nmi_iret &&
+             vmcb->_vintr.fields.vnmi_enable )
+            intblk = hvm_intblk_none;
+
         if ( intblk == hvm_intblk_svm_gif )
         {
             ASSERT(nestedhvm_enabled(v->domain));
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f49d2ebbfdd5..49fcdd906cf8 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -499,7 +499,9 @@ static unsigned cf_check int svm_get_interrupt_shadow(struct vcpu *v)
     if ( vmcb->int_stat.intr_shadow )
         intr_shadow |= HVM_INTR_SHADOW_MOV_SS | HVM_INTR_SHADOW_STI;
 
-    if ( vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET )
+    if ( vmcb->_vintr.fields.vnmi_enable
+         ? vmcb->_vintr.fields.vnmi_blocking
+         : (vmcb_get_general1_intercepts(vmcb) & GENERAL1_INTERCEPT_IRET) )
         intr_shadow |= HVM_INTR_SHADOW_NMI;
 
     return intr_shadow;
@@ -509,15 +511,23 @@ static void cf_check svm_set_interrupt_shadow(
     struct vcpu *v, unsigned int intr_shadow)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
+    bool block_nmi = intr_shadow & HVM_INTR_SHADOW_NMI;
 
     vmcb->int_stat.intr_shadow =
         !!(intr_shadow & (HVM_INTR_SHADOW_MOV_SS|HVM_INTR_SHADOW_STI));
 
-    general1_intercepts &= ~GENERAL1_INTERCEPT_IRET;
-    if ( intr_shadow & HVM_INTR_SHADOW_NMI )
-        general1_intercepts |= GENERAL1_INTERCEPT_IRET;
-    vmcb_set_general1_intercepts(vmcb, general1_intercepts);
+    if ( vmcb->_vintr.fields.vnmi_enable )
+        vmcb->_vintr.fields.vnmi_blocking = block_nmi;
+    else
+    {
+        uint32_t gen1 = vmcb_get_general1_intercepts(vmcb);
+
+        gen1 &= ~GENERAL1_INTERCEPT_IRET;
+        if ( block_nmi )
+            gen1 |= GENERAL1_INTERCEPT_IRET;
+
+        vmcb_set_general1_intercepts(vmcb, gen1);
+    }
 }
 
 static int cf_check svm_guest_x86_mode(struct vcpu *v)
@@ -2460,6 +2470,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_tsc_ratio, "TSC Rate MSR");
     P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
     P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
+    P(cpu_has_svm_vnmi, "Virtual NMI");
     P(cpu_has_svm_bus_lock, "Bus Lock Filter");
 #undef P
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 514e530cbda7..975a1eaef806 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -185,6 +185,8 @@ static int construct_vmcb(struct vcpu *v)
     if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
         v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
 
+    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
+
     return 0;
 }
 
-- 
2.39.5


