Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u0LMJPH69GnFGwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 21:11:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C74AF0F3
	for <lists+xen-devel@lfdr.de>; Fri, 01 May 2026 21:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1298878.1573855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wItFy-0006At-SK; Fri, 01 May 2026 19:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1298878.1573855; Fri, 01 May 2026 19:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wItFy-00069B-OY; Fri, 01 May 2026 19:10:34 +0000
Received: by outflank-mailman (input) for mailman id 1298878;
 Fri, 01 May 2026 19:10:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wItFx-000695-0l
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 19:10:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wItFv-00Bf5u-UY
 for xen-devel@lists.xenproject.org; Fri, 01 May 2026 21:10:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f4faa7-e002-0a2a0a5209dd-0a2a450891a0-0
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 21:10:31 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69f4faa7-63b5-0a2a45080019-d1558033e02a-3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 21:10:31 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so35222345e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2026 12:10:31 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82308d77sm170781835e9.14.2026.05.01.12.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2026 12:10:30 -0700 (PDT)
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
        d=citrix.com; s=google; t=1777662631; x=1778267431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6aloAp7jHnwZ3WXl4y8dNSH+C8JTIu98fW6pgEvDoyk=;
        b=MrpYICRWH+glcx43E3o4WWDFW35MwCs3nei7y4a2DNjQILvJ1VAfS9eY0vZtn16sc6
         oklq/sJgiooxr1W/Qoz7BHqEgUqhW9cMzC22wFn1MoIfQKagX0Iz2BKwKawDnGWin0zG
         7lf8zKjKNgJpPMBCNMx+TYJHg6jEdUKcn2lTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777662631; x=1778267431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aloAp7jHnwZ3WXl4y8dNSH+C8JTIu98fW6pgEvDoyk=;
        b=np4KkM+3XOd3im+CwrEuNBHt2KqxpF9QFBn1FwUz54qKZ+K/47z5h0FyDcc3drdQe6
         QWH5WNqGEI1YFk0PihsRnQaz6pRgZzTtfoiOpAVA8AUqSO4SMa1IQIHiwS7PFZ3M7KMX
         h/yWaYKQKdikanUzLkyi9e22+zy2jqak/IeAb77zJRpwxWrRGjStP/Ymel871z/AY2mS
         YwrWkon2eybLHOrOjSibozvCC7q4wu0OUqTZqsOfzTTrTJzUskiGHxfo1p3+7xmWt4H6
         GFKATc6MR5qSXBLwUgWWI/0GSZ6cWK3MN3XX7nEwcneQQ2CCDH3Cra/HnzNW8vOgpFeI
         0Yhg==
X-Gm-Message-State: AOJu0YxOW3um6WJ2p4V9hf5ZSqubAiQClEDlv+83BUDVt0NQdpk4W2Y1
	hHEtGWFBlvwQ8zQBbLvQD3mb83CEFpIRRmocyLJ9Q/eFOiqmZaQxmhJxdIdChAzSvDQdYGYqGXx
	Na/Od
X-Gm-Gg: AeBDievIpviGp64p20h+JuvxNoO7vzcUzF7UYAqXl9ruzBqs9J902KPQbe2bBOfaOVU
	+/hRVqp2tJa0PD+vsa4LjCyO7XqslrKcrIt05MI3Z8UijZyiLKavQwZvTGnGVmJuNtM+DxVyick
	QpZeUx5BHa4eiywWx28jmpCEAWFmxNvCMSloL8NrUPJNxAOdSP5GlHOHwJLkoNUH8O+pdD7lEYG
	OCK74RMUM0WSIhlxuARHJEmPlix8BytDGSkTNw8DEBSBA900GIpYK94vqqjxrfAGn0yPciVAE+q
	32eBdj9Edz1F34LDIaAuIEFozSjBTWp5RP4nXjKWwm+m8LsAmsvJf68W36TUaynYa7eW1tBzdP6
	FOaao79YZnNOjIlfwlyb8SolY7UE7MkW8QknLeCu0MW70bKT3bpqlym/ly2qLB0e0s/1rSgBnX0
	pupO3d7VkVc9e6tBoOu+26E9ux9S5szjmj3hntci0JLOFpPa8ojFodRhGB6EYa5IYRF0vQhKt8x
	4PwpaLR6MD/kyM=
X-Received: by 2002:a05:600c:608a:b0:488:acbc:b2e with SMTP id 5b1f17b1804b1-48a9865d2ddmr5509405e9.17.1777662630692;
        Fri, 01 May 2026 12:10:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/boot: Disable interrupts when establishing SSP
Date: Fri,  1 May 2026 20:10:28 +0100
Message-Id: <20260501191028.1250225-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777662631-C0D63DB1-924C0444/0/0
X-purgate-type: clean
X-purgate-size: 4465
X-Rspamd-Queue-Id: D98C74AF0F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,gitlab.com:url,citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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

Gitlab CI reported a crash on boot on Alder Lake hardware.  The bug is years
old, making it an incredibly rare occurance:

  (XEN) *** DOUBLE FAULT ***
  (XEN) ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
  (XEN) CPU:    0
  (XEN) RIP:    e008:[<ffff82d04077bbc4>] arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160
  (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
  (XEN) rax: 0000000000000007   rbx: ffff83049a4b0000   rcx: 00000000000006a2
  (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
  (XEN) rbp: ffff83049a4b7f00   rsp: ffff83049a4b7ef8   r8:  ffff830497e47000
  (XEN) r9:  00000000ffffffff   r10: 00000000900c2121   r11: 000000009a392956
  (XEN) r12: ffff830497e47000   r13: ffff830497e49f40   r14: 0000000000000000
  (XEN) r15: ffff82d0407dad10   cr0: 0000000080050033   cr4: 0000000000f526e0
  (XEN) cr3: 0000000043c16000   cr2: fffffffffffffffc
  (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
  (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
  (XEN) Xen code around <ffff82d04077bbc4> (arch/x86/setup.c#reinit_bsp_stack+0xfa/0x160):
  (XEN)  00 b9 a2 06 00 00 0f 30 <80> 3d 71 26 f1 ff 00 74 3e 48 8d 93 f8 5f 00 00
  (XEN) Valid stack range: ffff83049a4b6000-ffff83049a4b8000, sp=ffff83049a4b7ef8, tss.rsp0=ffff83049a4b7fb0
  (XEN) No stack overflow detected. Skipping stack trace.
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) DOUBLE FAULT -- system shutdown
  (XEN) ****************************************

This is on the instruction boundary after enabling CET (writing MSR_S_CET) and
prior to establishing SSP.  Despite identifying this as a critical window
where any fault was deadly (the CPU tries to push a shadow stack frame at 0,
hence the CR2 value wrapping around to the top of the address space), I
clearly forgot that this meant interrupts too, which are enabled.

Along with regular interrupts, NMIs are a problem.  Unlike other cases needing
NMI safety, we can't use a self NMI and callback, as the stack needs to be
empty at the point of enabling Shadow Stacks.

Disable interrupts, and turn off the watchdog if it's configured.

Note that watchdog_{en,dis}able() do not work here.  They cause the watchdog
NMI to be ignored; they do not inhibit the generation of NMIs.

Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

The only way I can think of doing this in NMI context is to have the NMI LRET
off the NMI stack back to the interrupted context.  But this is horrible to
arrange, not to mention different between IDT and FRED.

Also, the {disable,setup}_lapic_nmi_watchdog() API is horrible but I don't
have time to make it sane right now, and this needs backporting a long way.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2494069238
---
 xen/arch/x86/setup.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d041cbd5f6f1..95ac36beab37 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -908,6 +908,19 @@ static void __init noreturn reinit_bsp_stack(void)
 
     if ( cpu_has_xen_shstk )
     {
+        bool watchdog = (nmi_watchdog == NMI_LOCAL_APIC);
+
+        /*
+         * Between enabling CET and establishing SSP, any fault or interrupt
+         * is fatal.  We must arrange for none to happen.
+         *
+         * TODO: Figure out how to perform CET enablement in NMI context,
+         *       given the constraint that the stack must be empty.
+         */
+        if ( watchdog )
+            disable_lapic_nmi_watchdog();
+        local_irq_disable();
+
         wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
 
         /*
@@ -932,6 +945,13 @@ static void __init noreturn reinit_bsp_stack(void)
         }
         else
             asm volatile ( "setssbsy" ::: "memory" );
+
+        local_irq_enable();
+        if ( watchdog )
+        {
+            nmi_watchdog = NMI_LOCAL_APIC;
+            setup_apic_nmi_watchdog();
+        }
     }
 
     reset_stack_and_jump(init_done);

base-commit: 61f957d48c78df6c5254b6f54d6170d3bd3d717e
-- 
2.39.5


