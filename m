Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGSDOC0VxGmfwAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:02:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985B32987A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 18:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262815.1555198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RcX-0001IW-LK; Wed, 25 Mar 2026 17:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262815.1555198; Wed, 25 Mar 2026 17:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RcX-0001FM-IL; Wed, 25 Mar 2026 17:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1262815;
 Wed, 25 Mar 2026 17:02:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w5RcW-00018Y-0M
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:02:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5RcV-005jek-C5
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 18:02:15 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c41509-bab6-0a2a0a5309dd-0a2a45038590-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:02:15 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c41517-1947-0a2a45030019-d1558029ac02-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:02:15 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-486fb439299so1020355e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:02:15 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487117077cbsm138217235e9.6.2026.03.25.10.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 10:02:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774458134; x=1775062934; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaXXbZJGFw+J/a9/KjyHV/e8LqVzMv38oF803pEEldA=;
        b=smiY0GGz4FIA/6Ohev05TBGT7cyKSsRP2rAUPDurL7VGgGUnL5+dxc3uLSmc11DpdV
         gTK82axJaY70kXMw1Yu4bKSvuWcrW4KQPlx4ed76pw8B5OR3xdcjzPjAll0YkvJ/ntn+
         /VAI3qlR2UF0vKH3eZPlDRQDiUmgl1XLNlhvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458134; x=1775062934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WaXXbZJGFw+J/a9/KjyHV/e8LqVzMv38oF803pEEldA=;
        b=aApead63ykhcZmI8E3DLZRpcQJg9LHI+dcGAo7maEmP9B6gptc1NNMQXxEiFv0BzNY
         z6IeW7CJKoU1TpIj46ivYEFOsQA/s/qOqYunk5r6+QlOhwiefnTqq88svDIo//Z8jz8L
         driVkk9YkBpbWqkrHs4uPaFEkGN2iSuUji8t4zWgcRWi2H2eI82pSXEv7keK3VXr3RSe
         YCibvQtQBq+4M2noIb+p/6zXtmrNoqQzx33tji3Evqn+k9aSGxlse8CWQRVlZIr/3L7o
         63yniz32saeqSGSmhv0kUtSpqRXIT4CHNRsLV+8iTf91S+lgYH/latOJybezFQXchKqP
         UTZw==
X-Gm-Message-State: AOJu0Yy/4SMg7DCPpc+sgvmI72JFfCEKgHv/+nxXNxofP/KQEkjZ6bFR
	W9ZkosqPqARKMjyccMKBdFOJPk9/pa4ZIW06VfEU90ecbcfosI8SkfIFKOE4JBgukkLNL+B5VWL
	HFZfJ
X-Gm-Gg: ATEYQzw4DRAqaRUvU+sUklom0Dw2w0Ve3/CHLGekmsfmVwPyJ6zl2DSHrfLtl2Lz4wM
	Z6PtKX/09URdhTzDHqWBSVHTXxj2eKNX4iymQzrJnxi3y8gCEwzEJujmiIWty3qXgSes0nP27rD
	zGYIxNBNp9rKM1zwoFD3s6w/umUeLLfc/tmvyaqPdVcMXEGrRFtNEnsLifWnOhvum5AtIyptfm3
	dzbFWMYtuo/2AejB6+lt1L6yNysdFMverncM247K/BY57JDcviF21geCKweUULuFSHqAB9DFmq/
	hpI8HDaXfz+qHqTVVsaN46108oN/tSfomRo+ru9oj3hRJP5joltiu+bHTrrVUCO1/h8KcUrc6mu
	Xm1Q0ggJ0KsMMFrnF+Zx5AK58UZZw76ZflXkQVoKCoqKZuHiDqI8dfKD22JeC9YpKk/li3RXGhC
	OWd+jdoLV8bT97Ineu3dXRXZBwogmnyvPBThrXCPEhqg6vaKqh9wGlejDWNw4TD5QpAUynKOtLI
	lTf3vFR3L+i0es=
X-Received: by 2002:a05:600c:a41b:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-48716043a6cmr38693335e9.22.1774458133043;
        Wed, 25 Mar 2026 10:02:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/pv: Provide better SYSCALL backwards compatibility in FRED mode
Date: Wed, 25 Mar 2026 17:02:08 +0000
Message-Id: <20260325170208.1115832-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
References: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1774458135-EA68172C-9DB9FEFA/0/0
X-purgate-type: clean
X-purgate-size: 2865
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[10];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:server fail];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 3985B32987A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In FRED mode, the SYSCALL instruction does not modify %rcx/%r11.  Software
using SYSCALL spills %rcx/%r11 around the invocation, which is why FRED not
doing this goes largely unnoticed.

However, consider the following migration scenario:

 * VM suspends.  Hypercall, so SYSCALL, %rcx/%r11 left unmodified
 * VM moves to a non-FRED system
 * Xen resumes the VM with a real SYSRET instruction

Instead of resuming at the instruction following the SYSCALL instruction, the
VM is resumed at whatever dead value was in %rcx.

In FRED mode, manually adjust %rcx/%r11 when SYSCALL is and SYSRET would have
been used.

Regarding the choice of instructions in eretu_exit_to_guest(), a branch would
be a context dependent 50/50 split (i.e. increased chance of mispredict), and
only saves one instruction.  The CMOVs read the same cacheline that ERETU is
about to process, so are as close to free as we can reasonably get.

Fixes: 76193ef47d91 ("x86/pv: System call handling in FRED mode")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC.  I'm still still completing the testing for this.
---
 xen/arch/x86/traps.c             |  2 ++
 xen/arch/x86/x86_64/entry-fred.S | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index b6b119769722..0013606baa19 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2405,6 +2405,8 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
 
             regs->ssx = l ? FLAT_KERNEL_SS   : FLAT_USER_SS32;
             regs->csx = l ? FLAT_KERNEL_CS64 : FLAT_USER_CS32;
+            regs->rcx = regs->rip;
+            regs->r11 = regs->rflags;
 
             if ( guest_kernel_mode(curr, regs) )
                 pv_hypercall(regs);
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
2.39.5


