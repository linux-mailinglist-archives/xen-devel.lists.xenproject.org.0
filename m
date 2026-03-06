Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF/dHPYBq2msZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8D224FAD
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247978.1546368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7b-0004Ox-0p; Fri, 06 Mar 2026 16:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247978.1546368; Fri, 06 Mar 2026 16:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7a-0004Jq-Pa; Fri, 06 Mar 2026 16:33:50 +0000
Received: by outflank-mailman (input) for mailman id 1247978;
 Fri, 06 Mar 2026 16:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7Y-00030j-Vv
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:48 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40449f26-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:48 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-480706554beso102815215e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:48 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:46 -0800 (PST)
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
X-Inumbo-ID: 40449f26-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814827; x=1773419627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wshUHaSMY4kHHsx5qEs6V10my02G5AGEo5sXu7Wg0WM=;
        b=mt3C7V7JKPnDGNQsg1+AoxzHJc/wwFFmfD4nJmLj/VOVxUV2p67UieTLCXfEvbBFft
         MNoIl5xfno7X74Bf9k5E+ICjIVn/1T5Hgntg4lT8IdlB7gt1HqW0zm5cs4OMwbiAUPpZ
         oOvqqTffeBeraYrqg+PKHVe/70+g3hIcPGrL26LxdH92Ucw2J9TzPJYRlaH+SftNjBOD
         BV+x3jpspQ9ClJslLti0l9inZLjf5fk7eaWOqAg3RQJRz3chNbIa7WcrGVDRJqW/B1Wd
         kknaeHoi6Fn3xTJ9M37kvOH/GWCZwqNdo5QW2USpZVSz5q6fu4hcuCXN9gUR0VGnUUtZ
         aipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814827; x=1773419627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wshUHaSMY4kHHsx5qEs6V10my02G5AGEo5sXu7Wg0WM=;
        b=tAhX6FIGYWo/GG8u/R3tfrS2A6tFlyZZu/h+Q0iZ9CVO916et3wsk31EM3sDa/nC8H
         sEcNPEq5tnrl46p+ONTzPxxJ+dHnbCMH3kHyjhIqojWhbFZ0Wd+bdR0PqS1c8D8J4Mdi
         11h83Di8dqnQjB3W6TAFK/wbBy8qwH1rp4klSA1vWlK8T/NNr9NzOVUoJHJ8qPbqMfTg
         zPtbaAkbIGc6cWWmkdYTKkn8Hj9umE7bVnWrbLhrKWPP5qribxE2Z6Jv1X7BIgf9JXCB
         V5mC0gFhP+6ri4htiBM6xciTV6xETFKR2eQTTlrtmnq12W0x9nOMfHfx5y9C1vmTsL/v
         d0Ow==
X-Gm-Message-State: AOJu0YyGkp8+sX/B+qKp2A0Esh9s3zQgJfIj3TlSJAKM9kXLGa+9j/TW
	jSNo3ydku7xo5o5+Q3sW3WMwZU31CPvIHnn+BwQEiY3nbRGGok2T/viAcJprAA==
X-Gm-Gg: ATEYQzwr8GQzgIIkW8qb86HKUPrnntNpOCEco5xF9Y45YHguOi8tpK8ln7yKIaLHE6h
	i/YJJOXZlZ1KJqN3bbu6kE1V4rPLI8tSbvFMvhU6ShZs9ikzuYFIS5sVh/XPDkyxAmOk20h/KZU
	fG0ImcNMx7BSLB6Ze7JE4vk6nbtyJIaeWh0CPsEXq2qb9pDsyLsvCvwdH+tqjmN23pPFfX/30aO
	9nzYSgyPEJIpI6hraBZACXmFxhXYBaKK+UcUBmQabSW4oG0AcGghmb4dLS80h8UhxC3vqphruOz
	rLSNAR9SFIvyA+Gu6qalrVNFcPCUb11yoL7OzrANg4WfXUavl/Q6UxQ79hl+SMUWrv62c2tzdbU
	CD/Xsbnj+25jH1dUIJ2KEkmDSkC1sjeNjY+gzHg9J+Kef8rJ7Nw8TI3yTTvgOX5DxSGcjnkVHD5
	HhXHsXCLtOrQi5bHYMgpnRu7vNKdiMM4amO44bP160l4jnB0nmX5ImYlLAa+8StCq5++aO+CrcZ
	Pvq
X-Received: by 2002:a05:600c:620c:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-4852695b633mr46566025e9.21.1772814827041;
        Fri, 06 Mar 2026 08:33:47 -0800 (PST)
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
Subject: [PATCH v7 07/14] xen/riscv: add vtimer context switch helpers
Date: Fri,  6 Mar 2026 17:33:24 +0100
Message-ID: <cad0ef46b6decf4083b68452e6b0fa2257aea9c4.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2BC8D224FAD
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
Changes in v4-v7:
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


