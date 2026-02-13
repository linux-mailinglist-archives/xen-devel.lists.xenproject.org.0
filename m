Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOfpMnJRj2kNQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B1138045
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231327.1536620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2t-0000jw-UT; Fri, 13 Feb 2026 16:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231327.1536620; Fri, 13 Feb 2026 16:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2t-0000cR-Bc; Fri, 13 Feb 2026 16:29:31 +0000
Received: by outflank-mailman (input) for mailman id 1231327;
 Fri, 13 Feb 2026 16:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2q-0005Wn-Ij
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:28 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29e3e8cd-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:27 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-480706554beso10850105e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:26 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:25 -0800 (PST)
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
X-Inumbo-ID: 29e3e8cd-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000166; x=1771604966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1EYQt5A3i5QUF1c7sbvdjSw7GZbau53/KdhZnxOwj0=;
        b=hRb/fOhgG76ubhtpx1WqzkkszCFuClqz5ihxcxWFXpQ6YMdiTqj98eplps22lk0bSA
         eqDIDjstkXddwPF1coVBPSdEsLvApiDiJDqVC8N5H3yFBxbgxE+r6zpzaQ/4UOi4FLUU
         QAj0LGxQ0KJ91fMZrMoYDzmN3jPbdaz0SMTm9DUDnGpfhVnw2WXQwhgui0l8eNXY3e+m
         ZlWZun7ElkcYhK/Zfb6AS8HqQGC+Lbhx6Ogi9R+AKQ/3PvrEP9CR3kBBEr1ISmDTbUDc
         ayfUauPr+gveuQFISwvHDzMM7cGtKtIx6c+zIxGYRh9PfELIGXHyNI8bPpH+iqgNIODM
         QRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000166; x=1771604966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1EYQt5A3i5QUF1c7sbvdjSw7GZbau53/KdhZnxOwj0=;
        b=X1ESuqDgQ3AsoGajapiSQ/cxy7jJHta0GYWw3iE9Yai2jQl72Mx2XMRV2fN+Wo9te+
         zfYrr6QXbY4ZMcm1ozmrUqFiihvIuK5/IOPnd6V2qwVLKwOwzpSgtZ/JRq1E0xTQLOCF
         Pm8aIIvEN5or0e1Ie82Slv4dLLA3IPpTrTz9XcFIc4jTpGH/9b3Im8fw/z31Dib6+D9+
         cKk+9K9mRpkuiplKomRhJV1yyqJcxP+zi3smi3kkvhBQtrZ72NYedbk2Br2rIjS3j/1O
         Fy1vDCjJW3NA+CYdk8gt+FLhEeSnf7AU93PveLBeUnwBxxn0qdxIsyLf76eq9o1pTHQ5
         jwUw==
X-Gm-Message-State: AOJu0YxAB8gwWSQEhqlDueLKNO1yIzf650CsFNcselHB7LMz960VDL+N
	cN8uqrB6UMLcbLOYaJy4zm4PyWlo5cVBrv6RFwg8VcqYqZfsjID5J+wIIGPoyMdD
X-Gm-Gg: AZuq6aIGzWTQjUzPUkpP5OJdvW15xOC9oAV+Z4cG2HhF4+eQwqrO40Rhxr+Av7a7a5R
	OiAJL1Q9IwOzSDgO+Y8kKR0tX8puyuzMLd0lggPcl1HEww6tAAiht8pI/avKGoWVpaqrU3Mkwey
	z7tPV2uEwyDVNjXqWs0qbdree3hM0A/tt4JnICcN1HiUBbS9NYx0aOmx8mKZOubCWoDwoVztDXl
	AzA9gt/9ufhAWBPh2lzQd4dSP8411ZLb24Z3LrtuKFPFu6ZAS70ZpfL4E3xov0tzpCwFxdIBR2Y
	ph6HKFmqCmSYS+NO2oZG7plGzjjr/+1rE0EGzHV6QSYQjtxVUbqpQCuugOszuRR+OdrQU6E1Yox
	aFg/Hh9PPS4VqQlbB8MH47C8bID1efgAKpsjIja0nkYXvZlYCZtBdSZMgnWqOxZ3S/O1ovKjvLm
	wLRFzJ7x2sb8m9Wr4a92cA1ySl2YurXQ6oLpwC5QrrTEJjmXkqK7jOShV5gbfyuP4tUKiNLg==
X-Received: by 2002:a05:600c:8486:b0:480:4a4f:c363 with SMTP id 5b1f17b1804b1-48373a1bbd0mr37656235e9.9.1771000165830;
        Fri, 13 Feb 2026 08:29:25 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 14/16] xen/riscv: handle hypervisor timer interrupts
Date: Fri, 13 Feb 2026 17:29:00 +0100
Message-ID: <85118bb05a7a0635241ca15f80dcee8c01eada92.1770999383.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770999383.git.oleksii.kurochko@gmail.com>
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BE7B1138045
X-Rspamd-Action: no action

Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
The handler disables further timer interrupts by clearing
SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
can perform its processing.

Update do_trap() to dispatch IRQ_S_TIMER to this new handler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Drop cause argument of timer_interrupt() as it isn't used inside
   the function and anyway it is pretty clear what is the cause inside
   timer_interrupt().
---
 xen/arch/riscv/traps.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 77738a01c8b5..ce8d346a14d2 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 
 #include <asm/cpufeature.h>
 #include <asm/intc.h>
@@ -178,6 +179,15 @@ static void check_for_pcpu_work(void)
     vcpu_flush_interrupts(c);
 }
 
+static void timer_interrupt(void)
+{
+    /* Disable the timer to avoid more interrupts */
+    csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
+
+    /* Signal the generic timer code to do its work */
+    raise_softirq(TIMER_SOFTIRQ);
+}
+
 void do_trap(struct cpu_user_regs *cpu_regs)
 {
     register_t pc = cpu_regs->sepc;
@@ -219,6 +229,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 intc_handle_external_irqs(cpu_regs);
                 break;
 
+            case IRQ_S_TIMER:
+                timer_interrupt();
+                break;
+
             default:
                 intr_handled = false;
                 break;
-- 
2.52.0


