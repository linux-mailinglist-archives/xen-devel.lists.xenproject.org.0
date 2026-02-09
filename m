Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHCOKgkSimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:57:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7554B112C40
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225878.1532520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUZs-0007W9-R3; Mon, 09 Feb 2026 16:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225878.1532520; Mon, 09 Feb 2026 16:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUZs-0007T5-O0; Mon, 09 Feb 2026 16:57:36 +0000
Received: by outflank-mailman (input) for mailman id 1225878;
 Mon, 09 Feb 2026 16:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVL-0007Zo-3Y
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:55 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6c7ab38-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:53 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-65815ec51d3so4896157a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:53 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:52 -0800 (PST)
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
X-Inumbo-ID: c6c7ab38-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655973; x=1771260773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imBk95+i3lrNZl16Fz7LHP6T5cVPwdF19P0a+Yv8HIE=;
        b=BiCJhWGliJdA44LISFmZOUGXwVeR5m2VhAPwWpOYct+tygrQbhJ40YsW3VQ5ShbhBE
         3P8SznbEmhCOIQcQKHHyntnT3DbXG9j5PLi53sG/tEZFp8MrgQpaaHco3ZWPgYvyWrGZ
         zLqlHygHR88oMjOQYWyfe0qD8O2KDQ7jGV564BwxOzhAH7rqUt0Wo3VGBpupMoyhTVws
         aVzPztwTlJuP82mzKUGWlrSRNwkmdRrHtzthdo8sSuCcKSZLEIrrO6IQ9zu5Jou4P0ZC
         JwWXayWhI+TMGfRWDbjFXFGilF7KdEm2HZk1BXDldJOtupsSmJOdKltpG8d35IYd4Xdk
         V+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655973; x=1771260773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imBk95+i3lrNZl16Fz7LHP6T5cVPwdF19P0a+Yv8HIE=;
        b=XQPV4nkgkCmUHlvl5imlSELlKgzNiqqxqcRNl5zMcyyEs/Bs8f3gRjkTgu/TemsDAI
         JpubQYQSe0uUaRZqqrJ0mG3NIGZMilYDHFOGcxVOrGY4rjJg53YpsR7G2JIZp/sRfsn9
         MLfv1RxGRdO8+lV7rqYtEOjxx+AJREUW4JlULTPah3LLBparsXgBnUATKLUDiNzUd30E
         azvgc7nzfn5BEeifIchSi9kyFqgBNSQnciw4RlQlcThxcJzyoW33q5yF6Fj1on8qJ/3H
         oOJDCUWG7w2qsdyA3ITj0u2KWvWRV/Bgq1g7fQC+tKVwssJFFF97k5t2K7VaRQDkBrx9
         UXGQ==
X-Gm-Message-State: AOJu0YwvlAfIWOfmf/UfzXeUyDQSnqCb5UY4qKAGeW4KY8g8zpsFeZ2Z
	u++9tNY6mYIeODNyeyx8ZD+mYsiJCfPA3IhDSMTJ/1XFD4byO5LOrsEkGIHf06DN
X-Gm-Gg: AZuq6aLVFPz2lsPPDbTQdk6eZDiKcrlPfqdk3HPUivL5tnAWNMEXmIJzbAIn44SgqVO
	c1dJdZxXACtX23R/OIG2DbY405EecEEyBAwH5+qwaSU3PfwRkcHXQxcDVG6H6h58+wFeKogUzYi
	IWNoRE7Olflf3MWjzI1xjlgOGjRZP0Mko5Fk9wpuZ2uvRofXQOCGyP7OG8KWnu2m3fc5D1/dlzL
	xFCNoDj5hNGALYTYwqMWQfaU/yga4TwuE4xz0WxnAXZW0UKTepE0dRMSYUatm61ITDWrXSkG1uz
	3bAI530CToG7ko2sINPf7Lynj5tXRCNRWn5GkKIOubrkm8UsXLkUtSuxyM0tHlJwsa65qib+NsP
	Bv48I+AWE2bKbzNq4mMpEXcEouUCblicoSWb3I5QJNKjXgeDBuaDJWWwNAm5Z6dEGkepKWiP64S
	EFWCEGSBEcRQBbpaH8TyD52P/iR5v0ukO2bZT8qVG/xrfEwd1Pa3rc+Y5hprKUnF0u
X-Received: by 2002:a17:907:9449:b0:b88:5ef6:17f9 with SMTP id a640c23a62f3a-b8edf15f695mr675946466b.7.1770655972552;
        Mon, 09 Feb 2026 08:52:52 -0800 (PST)
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
Subject: [PATCH v3 14/16] xen/riscv: handle hypervisor timer interrupts
Date: Mon,  9 Feb 2026 17:52:27 +0100
Message-ID: <4658719da8639b382b122bd79124381235d27aaf.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 7554B112C40
X-Rspamd-Action: no action

Introduce timer_interrupt() to process IRQ_S_TIMER interrupts.
The handler disables further timer interrupts by clearing
SIE.STIE and raises TIMER_SOFTIRQ so the generic timer subsystem
can perform its processing.

Update do_trap() to dispatch IRQ_S_TIMER to this new handler.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index 676a2da55811..e8d9ca902d9c 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -10,6 +10,7 @@
 #include <xen/lib.h>
 #include <xen/nospec.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 
 #include <asm/cpufeature.h>
 #include <asm/intc.h>
@@ -176,6 +177,15 @@ static void check_for_pcpu_work(void)
     vcpu_flush_interrupts(current);
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
@@ -217,6 +227,10 @@ void do_trap(struct cpu_user_regs *cpu_regs)
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


