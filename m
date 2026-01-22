Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OtyB8hUcmkIiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125EE6A44C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211363.1523005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqj-0002TY-PT; Thu, 22 Jan 2026 16:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211363.1523005; Thu, 22 Jan 2026 16:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqj-0002Mo-Er; Thu, 22 Jan 2026 16:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1211363;
 Thu, 22 Jan 2026 16:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqg-0007Id-Mo
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:58 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a95e4e3-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:57 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b872cf905d3so179241566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:57 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:55 -0800 (PST)
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
X-Inumbo-ID: 1a95e4e3-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100476; x=1769705276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbDTiLjWuEzC7c6gqH8qnfrVym3BHTcxish5wSxW7l4=;
        b=CWdIITF/ZXYEDHdxzK1vj5zcXRYOy2bi/7+MRf0NuKpED8XisHUwoela6pvnuCjcpg
         uXUrpvZwUSzGoa2ibDfHRkfkftdDRhg4htBZl7t8uMznGeMqmDt0YTRx/6b/3RkcPWXr
         6fz15NaeICVHYAHVsF8lXkPS2GdLFGpQMKZxdM/tT7x//UhziauLyCf0FwZLr4Xz7jsf
         svXJ2qtKdJ6KqWPY362vGJn+Hg8ZrfFPA9FAiZTqBuALTqRPqT69hsyC9QwD1D03p42z
         MNNllLPrmnkSY2fYzXrPNlQfH6FpS0fG8YkPnRLXzfoh+UmV0HTPMXQogA2pghfCQAh9
         qsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100476; x=1769705276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TbDTiLjWuEzC7c6gqH8qnfrVym3BHTcxish5wSxW7l4=;
        b=CKyHW2rXrnTRUJeoeBDI27XYMCqsZdftKEglnZjZDfEjgllbqi1jYy8AmmmeCaL7Ik
         3/XUANT9to0+HjGGm8sQ02cqQAP0qFkZKGSTAQvvu1WNq/R5jfU+lGIvuNK4xOgbqwsG
         hndLJgrLdRkYkviJLwkId06sJaCxB4kIf0lsVMcEwPcrQZsHA9TKIiBfRBc/UIq2GmXy
         oRaKatEuQSG+dBVrRHWQNpXp9xBSjFdYGtnJIpCCszNhM7A+uwhbcN8fbVoU7ejkaKtc
         /iRMyx6W3BV34O/0BHAzIhhfQlIBaKs7dMwtj4PlNXOVJwJ9NiizuaE0MXnfVbsofOyU
         Aqfg==
X-Gm-Message-State: AOJu0YxYDi5qMkBQqt2Q5E6P03J1HAxyw/0KND0kJH9gwM+Gd9ofPJen
	cETb2n6wWd1KGYAkq3DCqGGwJ/gEyg+PENY8HGfe9JmpC0cXRy4sM+9ul1B9ig==
X-Gm-Gg: AZuq6aIW9w+6Pc67hjhF/GHnNqgOJSJp643acRmfEH8GPd3f/GUiLFViBkALcaKcwk/
	MPF1eONdBBu/6E+uqyz4nRk16ozXMwnRReHZ4VK9RExbgnqo33Cx/eXStn/pAGE0n9bO0P5rVAZ
	xjdsWkFGATHxCLL+Y9kUIhomYbYn9tEXWpMY812U/P9CFQ3TmZKoTIBA3f38wRi26k9DxBGHWsZ
	XgAiBxM7/8vAFDRyCVIcVHUVQ3krZ9ec33ySR89jZeMPSaFskyWtkHDoNKLfvLnaeQEsz5Mf7sn
	PuRuR4tA84ZxGZHb3sZqlDM7TSt7wgGQZHl4b3brLLW1BOnyTbO7az4WakceugQpeGIOHqxhOA8
	To7sXXZyUZBvnIjLv13xPjdZ9yRB4S8+/apcJ17TnQmRH4Zeh6Lysm9/9KIYWUoRwNGt3bTmJQe
	UfjPXR+VYXH5ngLEPf4WHZq0ByC6mR7ydyjNqxIWdyMsfaZh1f/VxBY3RnVpQBFytj
X-Received: by 2002:a17:906:6a14:b0:b87:173f:631 with SMTP id a640c23a62f3a-b87968e76e5mr1734061466b.25.1769100476195;
        Thu, 22 Jan 2026 08:47:56 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 14/16] xen/riscv: handle hypervisor timer interrupts
Date: Thu, 22 Jan 2026 17:47:29 +0100
Message-ID: <5028577821754b86f633bedb0c32f5490ab6452c.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 125EE6A44C
X-Rspamd-Action: no action

Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
The handler disables further timer interrupts by clearing
SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
can perform its processing.

Update do_trap() to dispatch IRQ_S_TIMER to this new handler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop cause argument of timer_interrupt() as it isn't used inside
   the function and anyway it is pretty clear what is the cause inside
   timer_interrupt().
---
 xen/arch/riscv/traps.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index e9c967786312..53f96f143823 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 
 #include <asm/intc.h>
 #include <asm/processor.h>
@@ -108,6 +109,15 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
     die();
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
@@ -148,6 +158,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
                 intc_handle_external_irqs(cpu_regs);
                 break;
 
+            case IRQ_S_TIMER:
+                timer_interrupt();
+                break;
+
             default:
                 break;
             }
-- 
2.52.0


