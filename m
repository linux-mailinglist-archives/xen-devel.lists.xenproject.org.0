Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBaPKND2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D04F8022
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303827.1577196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMRE-0004dx-8G; Fri, 08 May 2026 14:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303827.1577196; Fri, 08 May 2026 14:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMRC-0004M8-VY; Fri, 08 May 2026 14:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1303827;
 Fri, 08 May 2026 14:44:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMR5-0002xh-Po
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMR5-007XaD-4c
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a0-2eae-0a2a0a5409dd-0a2a450197ec-24
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:15 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6bf-c1f2-0a2a45010019-d155d02ac57a-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:15 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-67e24b8ef55so2587511a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:15 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251454; x=1778856254; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO4ZAVstNY0PwKVvv0ULSFjjKuq4QMczoeLe8/sIixo=;
        b=Hq6NpSLkYSxgc4mnktv23exCUvUP55/20hIf66fgHfmhKf/o5gPPeSsOig+Lev3nFL
         e+rUBJNHAZtPlW51GGAzmyMwQVWRlatp2L3HMlaMxRFYtNimDyX5wCyAzZPf/sJrrHUs
         X6MmdB10AlP/Ra9MsV4c1YnlEOEzmeLra5cnWNha9FTvoNsIjzMprV/L7j8eAmJjSGMC
         ai48FFfa7AdgVuzTTrP2BkSpiWFBG5bpJjRs0d9Fz3HZI6ZHFT/1VvaswoiAmwTY7N4M
         BdjdC/tW9XcukKykRio14J/T/UE4t4QHjeK37G7W9b73t+sAjApoGu/o6VgpAnm+0t5B
         f18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251454; x=1778856254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CO4ZAVstNY0PwKVvv0ULSFjjKuq4QMczoeLe8/sIixo=;
        b=oI4SvIecKyqqYTwwRH0vG2Z4IiMFFsa1RJ0ZEz+HCgA8Hnu+L81A3L6hZOg4WDWnKn
         ODTD3vmZ/PhymOAFZLxN2x2/uibKUP312CueFaNb/dW6TknbGVlO/XKHwzoEYFGpyw6v
         fBLZ9WwFbgkPKbPw0dlV0QGh0EsgZPsEJnl5R0D6JQwAp6hxpUipTEVQVEGtrRwfZyx9
         /rKMpfIFOd8cC5AVqnGqtodyjejiLfFWr+7oJpLR8B3ARFJo8KALyC4z/L5vsK8aqOi5
         DjQMgoal4pQa4lc+5rKeQ44cwwVeCj2mu8Wtl+ES5Q6nExvRl/tPIPOz185fmkmg1tWk
         VOqw==
X-Gm-Message-State: AOJu0YxICrPsWson+f8R7jAf2a1BHdSIGWUbiCj+S6YTc4QwnO5uFq/T
	ajuuZVLRaS7nQPrndLqjxXFtN4Pxf4tMD5u0Ot0bxzX9Z7a5JtJ7Tu+3WjRgRQ==
X-Gm-Gg: Acq92OEELjN2klNpNboTWYvyvzlS/8CKvJ7I+JDa+LzGIAI2r2s4m/Tc0UVFegVpiTI
	ODDzP2Oa5HZIuFHC8iVUKAS4P0rMSVTi0u7tLywdAQKwvPSxxwZZsnzLMS+xkkr8PuNRUpAAehQ
	FiRj4TvvHHifE5u5xq3oowlotqbiJTCcbsBiRRzBIW2Ui1biqwPy+7rF9inimtnJDpg0SOKizCm
	gTvWgECUfGlwZ1VXZuyVsYEdMX7H9Iv2ln05NSyzjglkZVfyXl1TWx6OhIJCHqTMsWkKcaiiRUN
	JxMWaVZi+BuZnw1cS41+KelE4kCpBa5CzXNtfkuuJtFk4YBPTrpnYhsFpLuiY+rb6BPzeTvX64v
	le0nSOxEV0abuXh/3Ml8nMwv1x2m1QBQIgWGp/T7nZZF/8mw8EIA7X6LlmVzw3H66ezwXK7xYGu
	dAzExZPHZRx83Lc7VemA30b2MO+XcN2j4US8m0kAQaMv6ybPT6G++i83pxAyjLpoYiPQ==
X-Received: by 2002:a17:907:1685:b0:bc6:7238:bd4e with SMTP id a640c23a62f3a-bc67239005cmr555296166b.5.1778251454269;
        Fri, 08 May 2026 07:44:14 -0700 (PDT)
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
Subject: [PATCH v2 26/26] xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable callbacks
Date: Fri,  8 May 2026 16:43:28 +0200
Message-ID: <6121dce6347f03030a2de05f29c1780b6fc0cd01.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778251455-B655DFF4-E3379D73/10/73395122804
X-purgate-type: spam
X-purgate-size: 2046
X-Rspamd-Queue-Id: 512D04F8022
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

desc->status is only set once during setup_irq(), but interrupts can be
enabled/disabled at runtime, so update it in the corresponding callbacks.

wmb() in aplic_irq_enable() ensures do_IRQ(), which can fire immediately
after the interrupt is enabled, sees the updated desc->status. No rmb() is
needed on the do_IRQ() side because desc->status is read under a spinlock,
which implies an acquire barrier.

No barrier is needed in aplic_irq_disable() because the hardware disables
the interrupt before the status is updated, so do_IRQ() cannot fire, and
spin_unlock() makes the updated value visible.

Fixes: d4676a1398bc5 ("xen/riscv: implementation of aplic and imsic operations")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
 xen/arch/riscv/aplic.c | 5 +++++
 xen/arch/riscv/irq.c   | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 1976733dfbaa..7933a00772a8 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -161,6 +161,9 @@ static void cf_check aplic_irq_enable(struct irq_desc *desc)
 
     spin_lock(&aplic.lock);
 
+    desc->status &= ~IRQ_DISABLED;
+    wmb();
+
     /* Enable interrupt in IMSIC */
     imsic_irq_enable(desc->irq);
 
@@ -189,6 +192,8 @@ static void cf_check aplic_irq_disable(struct irq_desc *desc)
     /* Disable interrupt in IMSIC */
     imsic_irq_disable(desc->irq);
 
+    desc->status |= IRQ_DISABLED;
+
     spin_unlock(&aplic.lock);
 }
 
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 4481ae23aa8e..f9c10a7c9faf 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -145,9 +145,6 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
         desc->handler->set_affinity(desc, cpumask_of(smp_processor_id()));
 
         desc->handler->startup(desc);
-
-        /* Enable irq */
-        desc->status &= ~IRQ_DISABLED;
     }
 
  err:
-- 
2.54.0


