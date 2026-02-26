Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLd2DeEzoGnwggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3421A5581
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241458.1542547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu6-0007w0-B2; Thu, 26 Feb 2026 11:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241458.1542547; Thu, 26 Feb 2026 11:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu6-0007uE-1B; Thu, 26 Feb 2026 11:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1241458;
 Thu, 26 Feb 2026 11:51:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZu4-0006EH-L0
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fee7579-1309-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 12:51:34 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso6970105e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:34 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:33 -0800 (PST)
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
X-Inumbo-ID: 7fee7579-1309-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106694; x=1772711494; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1ZCln4LGxYbhh7EA/lAbVEGbnMzo0d9tLUWjs8DB5k=;
        b=eG2HjWeSENtDPApqBcBWK2jpmataLLKC6cZ4NeqLfxqspG2mlw9dQinywOb05UDLqj
         nzlP9zuzAtslAYo1pP0jHiCJRyT43HSiBMn8gMzKR62IFiTXZWAwYSHmyr8U+6rN37JY
         88GMVCYDw2mPtk3+6OVjVp0CflmygO1Q8/DWum1DaWe3Q4gpJtZd+RCile2VSTub67rD
         jwvYZxkAp1HWEEb2/kX/wJtr3MplsGBcu6DZzTgEPM2BiOze122EqQlOiGLKsmWVvK6z
         oxJuUmvxSaktKl0iWKBAuLHtEpJyEmOwrkuBPm0G84htLnV/pLDNhCqe/xoDPsSPOkj/
         EgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106694; x=1772711494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1ZCln4LGxYbhh7EA/lAbVEGbnMzo0d9tLUWjs8DB5k=;
        b=Enqva28TnEHqbLARebVIfr6FviGa/LCWpWBrsNQ9cPdLv/dzjV/ymR/9iREIgceA/D
         SToceblLQi3RHkXehsCZHM8KLe5C3052wqf65Kv61CIgaA3ICd3uprdve83q22jtOzQJ
         WA57mmhlNT7Druy5xrnTbRg/5HaWB986YX7F3Ogti7A/BqEoJwnbM1UbK4KeUYMTy3Ke
         iKi25mP35IhV0/uBaOZoaVMKi3OtDK03NT/Rts6OaS/Pzb6PoOTuLonZo1eor9D2Fi4X
         Gw89w8IA0AvuwyTo+mc/xWebN+kIMNIFhCVmAZlEops4LloF7/wu07U+UWvFFOvmmN5i
         XSjg==
X-Gm-Message-State: AOJu0YwdI6X1loYif8CjIbJdSX6Cf5MWys+TEhCd8SoeZbtEHQj85LI0
	g8IOTYcKUx+x/krhgkfH1kxl6p1CK9cdAHKd/zHdVDlauCTRSRlNXSIKHu7W3A==
X-Gm-Gg: ATEYQzzJxUkV6+hALaa5ld5euAlanFGq8GuPtFqHFcZO24Ol2CT+rKhyNV7zcbexFsd
	quOkCJ8VFnmX8pgDX9Miu1z2r3wS8LYEAI/722F0OMc4+K80K07Tl9JpNXA6oQqZ5wozMLyRtAE
	M0TKbP3nSa/YP2U4Y8M06d3bOJW/pDv9i7AHxN8Py+xr4YudgdlkhL1OflVe38QZ4mbJx1fhO6F
	UiqCnAQAyQ+If/k3nAPJw9XM2+aZAHnGN3Y+6/pPs3sQvkhyHigHP02CELmSfo9OAtogAP1E5DD
	qUYAq9VwqQtTQr9CQJPMwrdgaTrl688q3xsiCxd6ac1/3zotb/qjUCfPfCcKmA0Hk4a1O6BV5oP
	Vuv5uZw0lCC4tiNPC3f68kiCcJHY9TLYqlfqGtV9dSS8c6zQbBbTq/h2lai7v7YesNzNaRYwiHZ
	lVJPhb0Q4VeTU9X3LSshx2ssImp06BOG8g1V5fDKoQf08/QltGrkcepcasL5mD4FOEzA==
X-Received: by 2002:a05:600c:8b16:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-483a963de73mr420137245e9.35.1772106693973;
        Thu, 26 Feb 2026 03:51:33 -0800 (PST)
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
Subject: [PATCH v6 07/14] xen/riscv: introduce vcpu_kick() implementation
Date: Thu, 26 Feb 2026 12:51:07 +0100
Message-ID: <fae5055def89528c078bacf7e344fd5116f531e5.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CE3421A5581
X-Rspamd-Action: no action

Add a RISC-V implementation of vcpu_kick(), which unblocks the target
vCPU and sends an event check IPI if the vCPU was running on another
processor. This mirrors the behavior of Arm and enables proper vCPU
wakeup handling on RISC-V.

Remove the stub implementation from stubs.c, as it is now provided by
arch/riscv/domain.c.

Since vcpu_kick() calls perfc_incr(vcpu_kick), add perfcounter for
vcpu_kick to handle the case when CONFIG_PERF_COUNTERS=y. Although
CONFIG_PERF_COUNTERS is not enabled by default, it can be enabled,
for example, by randconfig what will lead to CI build issues.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-v6:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add asm/perfc_defn.h to provide vcpu_kick perfcoounter to cover
   the case when CONFIG_PERF_COUNTERS=y.
---
Changes in v2:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
 xen/arch/riscv/domain.c                 | 14 ++++++++++++++
 xen/arch/riscv/include/asm/Makefile     |  1 -
 xen/arch/riscv/include/asm/perfc_defn.h |  3 +++
 xen/arch/riscv/stubs.c                  |  5 -----
 4 files changed, 17 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 56b28750d3aa..fda8cff90f6a 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -1,9 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/cpumask.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/sections.h>
 #include <xen/sched.h>
+#include <xen/smp.h>
 #include <xen/vmap.h>
 
 #include <asm/bitops.h>
@@ -265,6 +267,18 @@ void vcpu_flush_interrupts(struct vcpu *v)
 #endif
 }
 
+void vcpu_kick(struct vcpu *v)
+{
+    bool running = v->is_running;
+
+    vcpu_unblock(v);
+    if ( running && v != current )
+    {
+        perfc_incr(vcpu_kick);
+        smp_send_event_check_mask(cpumask_of(v->processor));
+    }
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index 3824f31c395c..86c56251d5d7 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -7,7 +7,6 @@ generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += irq-dt.h
 generic-y += percpu.h
-generic-y += perfc_defn.h
 generic-y += random.h
 generic-y += softirq.h
 generic-y += vm_event.h
diff --git a/xen/arch/riscv/include/asm/perfc_defn.h b/xen/arch/riscv/include/asm/perfc_defn.h
new file mode 100644
index 000000000000..8a4b945df662
--- /dev/null
+++ b/xen/arch/riscv/include/asm/perfc_defn.h
@@ -0,0 +1,3 @@
+/* This file is intended to be included multiple times. */
+
+PERFCOUNTER(vcpu_kick, "vcpu: notify other vcpu")
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index daadff0138e4..eedf8bf9350a 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -203,11 +203,6 @@ void vcpu_block_unless_event_pending(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
-void vcpu_kick(struct vcpu *v)
-{
-    BUG_ON("unimplemented");
-}
-
 unsigned long
 hypercall_create_continuation(unsigned int op, const char *format, ...)
 {
-- 
2.53.0


