Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLVFKKGJmGlwJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C3169469
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237346.1539790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE8-0003Eq-DT; Fri, 20 Feb 2026 16:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237346.1539790; Fri, 20 Feb 2026 16:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE7-0002y2-Uz; Fri, 20 Feb 2026 16:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1237346;
 Fri, 20 Feb 2026 16:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTE5-0000QF-OL
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:33 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f079f1ce-0e77-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 17:19:32 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so23237935e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:32 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:31 -0800 (PST)
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
X-Inumbo-ID: f079f1ce-0e77-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604372; x=1772209172; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GY4TsUHAUh5mXYz+TDKp1K01nWPWnDSPZpe5v/E8oY=;
        b=LlE+dgt4BZzmbfveMoQNfmHAMAV2vnqMHXOL7k2C6bd5M89vzB4FQePgenAJadewhq
         aBntHrWVF1uNxkgxO6rFGWkXtpc6hP0gbn54jWlV2w6+ZWEZLLMphqN+VcOYSGEfHOZh
         6mLnQa7GTKJzCqE2InHL0/x8ycNk0CXjIE0+N0hopmTmvnpNUpfV6zp48EC2QgXQTmu+
         X6a9R9akFpalQxlJtMdhKaRAM8FOs5/9mI1W/CanvXEYPC4d545bNbv/x7rCASErym9g
         +aAzx7JuPkC0cZOjgmYbSwMlKszmhDIKQvW+9gIzXB9nkOfvsAWUa270xPr8zefQbD06
         qHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604372; x=1772209172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5GY4TsUHAUh5mXYz+TDKp1K01nWPWnDSPZpe5v/E8oY=;
        b=ZCm9UrF99y3tuZQ9+ZkQ+U9+o2wJFnceIhg+zs3IoJ0m2tD5VDhMNCjT+bwli56lpX
         1ZAhog9q+xVsOKJ1it1GOx0uAE3Dz4DJcWJILbpqWGNyBOkEjxbVL/Sgd7cknYex9KfH
         g8jHBt05RKNf2Hwo2fFAmHOnh7/Z7g7uALu8DX2Re0w+0FE95YRSfxGfdTrj+j0QrSfK
         SDISc3AAsPUckHMLpcSmuIpQZ7PHmpqWwU95X2vb0T5qZx+2NPXtbnKpkcjYGYSLLY1O
         lJTiyXVvKe2/0O4T73LTWGW+LXQMdItPKA+rOL6+Fwsrm8ThprboUyJ0c4f5eBI371EA
         34Wg==
X-Gm-Message-State: AOJu0YygTMeVQrNYYE/IFENnK1Yf/pDjda5iBErKMBMvn2eInFtDQVZM
	6bzNw1QNfqVWRCkSh4/9pzwQK4sxmLqNRKTlytWUpG4K1QIk20MCvaHqTDLM2Q==
X-Gm-Gg: AZuq6aK09UFcT0o71iFCftqyaKz3wOGiwk+hoPZ0gAdnmJcKhlltmctXVB+aMlD8wIu
	11JSFei/BgGUVKV0IDaQei7WyMdPSlafM23PJKoyAlfSA4iAI7OO8FaoV0Khkd0kdIrHqLHd3jC
	lQlJXi4Mq9TEMv3iDQ438fNRdFCseIYq2gsXv+PQOkIqcD/Fl6jHZkSQdjTaFhq9fox++Zz2MjN
	mMzwfRCO737lJG/rsAmNAqahIG3k8U6rMsKL7adQzzh4BGwrR+dEsEs+LVgmzFzOzCzpU2zy5ur
	5xa+tRYn2Zmdu6KngGcbE+p+YtYOadTIBEXpVJBsB9Zp6BdjuCdr3lt4dtcfigRLz8bRBkcrOaQ
	XdpJqq2WKxTMseEbsjqyPTLNrhVOaBkIpeRVGTP5MH9dht52AftVuZbKajW+t2Huk+ooIbFfON/
	+ORBf7M0BGtGDxgfXiWmy46WHeEINgD3j9mky/mk3ajlA966TMgXDhVmCOxCW4Q2oYew==
X-Received: by 2002:a05:600c:820a:b0:483:709e:f22d with SMTP id 5b1f17b1804b1-483a96379c1mr561955e9.27.1771604371507;
        Fri, 20 Feb 2026 08:19:31 -0800 (PST)
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
Subject: [PATCH v5 12/14] xen/riscv: handle hypervisor timer interrupts
Date: Fri, 20 Feb 2026 17:19:07 +0100
Message-ID: <9a17019c5668935afba1f7d932a3ad8a413e2919.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 9B4C3169469
X-Rspamd-Action: no action

Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
The handler disables further timer interrupts by clearing
SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
can perform its processing.

Update do_trap() to dispatch IRQ_S_TIMER to this new handler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v5:
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


