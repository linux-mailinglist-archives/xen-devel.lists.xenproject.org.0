Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPXiIfsBq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4A224FFB
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247983.1546412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7h-0005oT-3Y; Fri, 06 Mar 2026 16:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247983.1546412; Fri, 06 Mar 2026 16:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7g-0005mX-Lm; Fri, 06 Mar 2026 16:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1247983;
 Fri, 06 Mar 2026 16:33:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7d-0003HN-Uh
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:53 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b2c3d4-197a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:33:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483487335c2so79746765e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:52 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:51 -0800 (PST)
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
X-Inumbo-ID: 42b2c3d4-197a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814831; x=1773419631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVTsKCN0wSfASIBvtQYg3brcx2aWUdWXZHC8J7YgVpo=;
        b=C5WD/ptislK0gk/27Z9QRkML3FdDH9WnR76RxuARrWdW9BkVUL1W+G496AY4PHITjV
         rGxEUSVFNJIIMV4Jj3AeXsXyFqcD3Lln91U5glcEL6bUvp+hghhmuyJK0PaV8zBs+PMx
         /hDjHyTUp27QtaxmmXxqHVFGnZjQaK6VgrgPHsEJ3HJ6G9WbSYD32FNW9L4PMnXIWTRZ
         dLYg6gfnIoxHFKTlS9lhBU5upN3cwUUq3A6Pok/Difg7yLhpB2S5afONx1gv7IExWfP1
         kyOF+b5yO893iDOSuFFZ628rd3WwfzlpWAhd3mmCAtAPeO60JJfXZZS+O4Dkny5DCqY9
         jdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814831; x=1773419631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVTsKCN0wSfASIBvtQYg3brcx2aWUdWXZHC8J7YgVpo=;
        b=k0cC2sfWRJRZWL7XXwIdAD9S4lbUlb3aPscNrAHJGQak21YctGp2NrCteT6QbeHFMW
         kzriRWa0i1XTIF5IJMyN93SdboD5vCwoUillyxQt2RHYNADMerTxKPRDoMuK0BrRhhB+
         Np16IRQP/KWLblHnAqQ6YfvlQ6FZBnRutDCrJcBjTovFf0Dl4CdPY8WXF70QVjUhIWDb
         lYURZs2RazVmxidNWTG+uwghYkcrdvsW8FaJtYY26qRvEkAtia1PPKP+zZeriBZjsl8P
         ZcMAr/ZjlRPC8crM/A9Kzixq/4/5WLzeqlhLbBwt0IV5dDJwiia9YJoGyBN4Va/pYtGT
         Q8xA==
X-Gm-Message-State: AOJu0Yy+y7+rX4M9ielRib1c7QeaBJ46p9ihM6jrEZY8vptkP8Lo05ln
	AaNFWy9XTyFuQtl7QOd8NpIKYgK5Un4NyjOb4C0ZNIyC3wj0R2UlAyay0rVzuw==
X-Gm-Gg: ATEYQzyyPYQqkglBhi6jlo/SuDolJ3v0RmAg5Z1dg+i/08HYUS4usGy0iIWKfy718WJ
	iNPPBl9eq5qi1xDLZiYTRNKPIMwa8F+53kG0ZSzN9t7jUiXREgdyi/nYhRK1/mjrnVxdqW7egJD
	TwcWJuYBZ45kNOIzNgVr6YB3rH7mENLqNC9sE3iKbaFjJ9t28IsdSyE8tQ+/Gb2tcqXzUcICQZU
	DUV0XBNeXCxApn/TMgQsMXO+Itg34/MvxpKHfGlycWb7kyC9beFUfruPuzgYtnh63Q4j9RtVvtQ
	S45ouGUZhwRMWyndUB10p527hcEMXGDF4lCVmV0fkMPii1Co4Pk1CJfmwt4YobUNdGZdsiFwiME
	Ti7iUMsHG5102zDseGUTkzJYlV5WTMRQih6Uml5aqsvQf8rYlAHLcX2LQB4EXMGL0Nxd1Tz47vG
	xvSDV9yicdsQ5j1u0CSeXDt4tW8WO1T/PAmFf0QDAqRo2Xg9snS8Gq8U3PxY+LTBPUIA==
X-Received: by 2002:a05:600c:138a:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4852691c5bamr48041945e9.5.1772814831354;
        Fri, 06 Mar 2026 08:33:51 -0800 (PST)
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
Subject: [PATCH v7 11/14] xen/riscv: handle hypervisor timer interrupts
Date: Fri,  6 Mar 2026 17:33:28 +0100
Message-ID: <8a1b9279cf17fbe258af62c95377540c236b292e.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7DD4A224FFB
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
The handler disables further timer interrupts by clearing
SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
can perform its processing.

Update do_trap() to dispatch IRQ_S_TIMER to this new handler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v7:
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
index 244264c92a79..326f2be62823 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 
 #include <asm/cpufeature.h>
 #include <asm/intc.h>
@@ -180,6 +181,15 @@ static void check_for_pcpu_work(void)
     p2m_handle_vmenter();
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
@@ -221,6 +231,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
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
2.53.0


