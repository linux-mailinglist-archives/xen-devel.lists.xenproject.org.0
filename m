Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oInjOJyJmGlvJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDA169437
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237340.1539762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE4-0002QY-HS; Fri, 20 Feb 2026 16:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237340.1539762; Fri, 20 Feb 2026 16:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTE4-0002Oa-7p; Fri, 20 Feb 2026 16:19:32 +0000
Received: by outflank-mailman (input) for mailman id 1237340;
 Fri, 20 Feb 2026 16:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTE2-0000Q4-Km
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:30 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee24eed1-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:28 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4376de3f128so1538330f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:28 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:26 -0800 (PST)
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
X-Inumbo-ID: ee24eed1-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604368; x=1772209168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IfTwwNG5f/qMELUo5yc+EiwaE+xRpKyZnUpo6oHC2Y=;
        b=GiVLboqsfP9FtiMLzd6SitTgbusn9BpMkwkS7BorYQybvOkD8VOeKCN2z1t7XV5o8I
         8exVXha4ZG8Y2/zyuMGO7CtWzyLnQ/pl8v2TDTuq13kSpXTAhwYHFshmIGpSaJLznrfE
         UTIAfLWkdBw+6wsZMtPzTOFQnpXuluvCf8LUygOcKgIj3e/C7wzrz7gmwLfU8+0Sc/Xz
         aAAOYbcBd2UVcIqqwYglU98xJ8QIzXSUuN9ENpd4tGc9wJilBgl16wwc0QVVpe521DOy
         K3B1BZGSxTNgpB3WXZa6hSuWRo2PLx03+VqY5YjjJ4LUOxrKdOmvSxyV5meCJswME5xr
         2WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604368; x=1772209168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8IfTwwNG5f/qMELUo5yc+EiwaE+xRpKyZnUpo6oHC2Y=;
        b=IPx/AnUw/nIBX6yac0tnXdHDFbZvnDVblMU20c1Ns2sLEkp8ZH/NsFhNOJ4HwivbAS
         WUHUbcUuwhj/nKLKh81fndY1+sZFuFQ0imEQYDeo0aMVN/8Cm4DlW4WhkjcR1Xs34tuI
         w3/c8364iWO4ij2mW+XPxG+HOzDD77lrzxh96ZHAkQ7FghvJ/BRvMmvm1zAr7O/mY7c6
         c/LTJrO0MPCCbt468Vxu60cePTvesdmylM2VWafhIUu54+/qETBNipx9cNS0dTNVt31j
         sG40o6NxftiPFtOp97kqdWrciqcjrPoPUyKOifQ1M/DOj5Nmjpre40ibKumTSN/3MngY
         oFUQ==
X-Gm-Message-State: AOJu0YzpGUm6u2tTMKSnsAiqew1ZLT3uB1Z/rx4yAuP7zN/Dc4pXhXge
	7i0U6sS8qOie28Aysj7ygBcNu8jiRlwSfJwNc++kC7QXf2lNiFGqm04MJXYT6A==
X-Gm-Gg: AZuq6aKkv9g44R3TALCaLDKOTwxo+Ts76UitVjzWBcdeNqMlV5r6cL2hnJYFVTlwu9c
	MLAm8Hd5ofYLpff8g7ecMuJSZtIHKNmwfzKezcsWNxgVTsPtboMpukgyO9QkgK3gvEW151tbFiU
	3zEIRfXrXVa0KYqb6Q6SHavSD9GMZCIzArvRkQ1NZOHUxUBWGnvvdB5BzNsMGyFuLyLHEgXd35U
	bOg9zE4A4U6re9UuqNeJs48aYIfSFLBLaVKdAPDmDYFvA4301tuAvoxUHYLqYqJF8U5434S7rIz
	4VNGYhtrvqBYmv+7ler3s/HSfjVKVVflqst+enQfQ3srlW2zwtNAHMDSUXRVIDPilnsCE8REktH
	l6o9widPrCRQmwQBQeSin/HcCp68lN2cuqrz9be1o7qqyufy4N7LJB16boEEBIYO+Y96xqVwLVz
	6gXllrNDs7TMEXUiaIDgRI1pLlehpWbTSB2oRumhnOZOH6/vvhF84ih8K5bFFUXHXw6r7Vkg==
X-Received: by 2002:a05:6000:4026:b0:437:681e:cbc3 with SMTP id ffacd0b85a97d-4396f15e475mr839815f8f.13.1771604366958;
        Fri, 20 Feb 2026 08:19:26 -0800 (PST)
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
Subject: [PATCH v5 08/14] xen/riscv: add vtimer context switch helpers
Date: Fri, 20 Feb 2026 17:19:03 +0100
Message-ID: <26ead013f23bef85423680f37f4e671c1f6ee8cd.1771590794.git.oleksii.kurochko@gmail.com>
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
X-Rspamd-Queue-Id: 99DDA169437
X-Rspamd-Action: no action

Introduce vtimer_ctxt_switch_from() and vtimer_ctxt_switch_to() to handle
virtual timer state across vCPU context switches.

At present, vtimer_ctxt_switch_from() is a no-op because the RISC-V SSTC
extension, which provides a virtualization-aware timer, is not yet
supported. Xen therefore relies the virtual (SBI-based) timer.

The virtual timer uses Xen's internal timer infrastructure and must be
associated with the pCPU on which the vCPU is currently running so that
timer events can be delivered efficiently. As a result, vtimer_ctxt_switch_to()
migrates the timer to the target pCPU when a vCPU is scheduled in.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v5:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - s/vtimer_ctx_switch_to/vtimer_ctxt_switch_to
 - s/vtimer_ctx_switch_from/vtimer_ctxt_switch_from
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Align the parameters names for  vtimer_ctx_switch_from() and vtimer_ctx_switch_to() in
   declarations to match the ones in the defintions to make Misra happy.
 - s/vtimer_save/vtimer_ctx_switch_from.
 - s/vtimer_restore/vtimer_ctx_switch_to.
 - Update the commit message.
---
 xen/arch/riscv/include/asm/vtimer.h |  3 +++
 xen/arch/riscv/vtimer.c             | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
index 111863610a92..b4d48d1a1732 100644
--- a/xen/arch/riscv/include/asm/vtimer.h
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -14,4 +14,7 @@ void vcpu_timer_destroy(struct vcpu *v);
 
 void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
 
+void vtimer_ctxt_switch_from(struct vcpu *p);
+void vtimer_ctxt_switch_to(struct vcpu *n);
+
 #endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
index 32d142bcdfcd..afd8a53a7387 100644
--- a/xen/arch/riscv/vtimer.c
+++ b/xen/arch/riscv/vtimer.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/sched.h>
 #include <xen/timer.h>
 
@@ -69,3 +70,17 @@ void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
     migrate_timer(&t->timer, smp_processor_id());
     set_timer(&t->timer, expires);
 }
+
+void vtimer_ctxt_switch_from(struct vcpu *p)
+{
+    ASSERT(!is_idle_vcpu(p));
+
+    /* Nothing to do at the moment as SSTC isn't supported now. */
+}
+
+void vtimer_ctxt_switch_to(struct vcpu *n)
+{
+    ASSERT(!is_idle_vcpu(n));
+
+    migrate_timer(&n->arch.vtimer.timer, n->processor);
+}
-- 
2.53.0


