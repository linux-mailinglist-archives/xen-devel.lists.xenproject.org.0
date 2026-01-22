Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBYLK8BUcmkIiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612EA6A406
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211351.1522945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqb-0000V0-FR; Thu, 22 Jan 2026 16:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211351.1522945; Thu, 22 Jan 2026 16:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqb-0000QD-6G; Thu, 22 Jan 2026 16:47:53 +0000
Received: by outflank-mailman (input) for mailman id 1211351;
 Thu, 22 Jan 2026 16:47:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqZ-0007Ij-2k
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:51 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15ab09f6-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:47:49 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b87cc82fd85so200576466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:48 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:47 -0800 (PST)
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
X-Inumbo-ID: 15ab09f6-f7b2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100468; x=1769705268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c7RQ6OyPVY512X4e6H+NfNdqywFVdT5uOFctDjaxTg=;
        b=VooXe8WAyLXjDW+yhJ90+guS+IIAI6WBzr+WJVtYthd6oo0CaZjPvp+aE29zOxq9nk
         U2t17X45KKW2Vob85B+1UKjMKQvIFb6pZGrlprUdeJWuw5wyeJzf7490EGmCefD9hBp1
         vj/4tSuP83SgDnkeDrCaMm0Th9JW/pAztWGGef35foCBz/wdmvQ9iTgslvZq2isCl7hz
         0kzp9ybZYrYrEGvcbIru85WipIXA6zcyIx83A3AEF5uLf4jXmqjGaqOODInchLQkHWqf
         Yf2wvJbKzy04sQnllC9oDaWDOLVzkEY7AorKY3STraE46ydxK3M0W/Zq+Tt2eBmlimyU
         NhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100468; x=1769705268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5c7RQ6OyPVY512X4e6H+NfNdqywFVdT5uOFctDjaxTg=;
        b=SEKuRwcieNk3RGx70o2jV5jGkZaXZYyz5B9ihvl+IakNNQM03nbLafmhWb+0q1BljP
         Se6e367DMz0fYJ0kobcwu1kXCsMqc/N4iWTcdVojjgITZYeW0Z2ph+dq97bheHfk2hHK
         6Vo6Rme03f4W3Cizii/pyvzljIU3xinBE9B4XFXdyDYc+P2lZGxsISK7VOak2BKWn3mM
         29rldNYetS2pcFldJrfSs1zc9FVH4up5tOWelRyq4kFVUgOuLkTk1+b3w0Py2qXJNTkk
         cJ4zXw+V8Rl7zkrcSeOIwv2FBK4wH6gFLDehQd2K4G3/SZWOO/Rxjiwyhs4gGoK7l+Px
         lBPA==
X-Gm-Message-State: AOJu0YytG2NH1KylYuLmIvIHNrMtdGU48LUq4+iJBeSd0yFVWkdLsCjD
	CBduFHZv/tsiYY6uibpEuZIDgOGN43qVLN502Xlr6Wy9JE5fqsFWxzAcFCy5Ig==
X-Gm-Gg: AZuq6aJDd84EQWQYuin9Hk3m36/e/bxvvmKSikyQNOxDoXiyhDJzJSLe+luaNXwuk/3
	qFOwqNYA0MhW09OA+XCl1QRYvCmC8G+vSiC3YUCW/x2yALP67a/zeua0vcG3LhbLjM2ES8zyZqB
	kTgEZIuw8109MYbxFURH52W2RL9HrGLmxgfF8B+OwVWx5vNRx5ZHePQXjXiZXU6Uk07x+je6fCY
	p+Zm7ud4dAe/y8dHjOmnYtR3emevA7GQfID03hFIxKNVWQxP/EZJ0XzhsMo2jog4XgP1zDUObWi
	aB6PfxGpA4wPan1jqo6tTtSvDlV0LX0Z29yAEJr1HGo3H7/cYuzHtgBUjWck+XUVwa52eDpYtMt
	hHeMvYRJlWpvNgxJF8VYR5tXYeRwPUfCok0tBqX4XUYImq9YBRyhiPvk1xRkaXOqMxTz/Z0CBEj
	cFSkxlsa9mGLauPvRngbual//U9Usj21QM0pIGNcA3ZD49rPWVTHfgXA==
X-Received: by 2002:a17:906:f584:b0:b73:278a:a499 with SMTP id a640c23a62f3a-b879690c3ccmr1747464466b.15.1769100467976;
        Thu, 22 Jan 2026 08:47:47 -0800 (PST)
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
Subject: [PATCH v2 07/16] xen/riscv: introduce basic vtimer infrastructure for guests
Date: Thu, 22 Jan 2026 17:47:22 +0100
Message-ID: <381c200edaff013d999c6314c20e8cc8bdb5b041.1769099885.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769099883.git.oleksii.kurochko@gmail.com>
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,microchip.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 612EA6A406
X-Rspamd-Action: no action

Lay the groundwork for guest timer support by introducing a per-vCPU
virtual timer backed by Xen’s common timer infrastructure.

The virtual timer is programmed in response to the guest SBI
sbi_set_timer() call and injects a virtual supervisor timer interrupt
into the vCPU when it expires.

While a dedicated struct vtimer is not strictly required at present,
it is expected to become necessary once SSTC support is introduced.
In particular, it will need to carry additional state such as whether
SSTC is enabled, the next compare value (e.g. for the VSTIMECMP CSR)
to be saved and restored across context switches, and time delta state
(e.g. HTIMEDELTA) required for use cases such as migration. Introducing
struct vtimer now avoids a later refactoring.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop domain_vtimer_init() as it does nothing.
 - Drop "struct vcpu *v;" from struct vtimer as it could be taken
   from arch_vcpu using container_of().
 - Drop vtimer_initialized, use t->status == TIMER_STATUS_invalid
   instead to understand if timer was or wasn't initialized.
 - Drop inclusion of xen/domain.h as xen/sched.h already includes it.
 - s/ xen/time.h/ xen.timer.h in vtimer.c.
 - Drop ULL in if-conidtion in vtimer_set_timer() as with the cast
   it isn't necessary to have suffix ULL.
 - Add migrate timer to vtimer_set_timer() to be sure that vtimer
   will occur on pCPU it was ran, so the signalling to that vCPU
   will (commonly) be cheaper.
 - Check if the timeout has already expired and just inject the event
   in vtimer_vtimer_set_timer().
 - Drop const for ticks argument of vtimer_set_timer().
 - Merge two patches to one:
   - xen/riscv: introduce vtimer
   - xen/riscv: introduce vtimer_set_timer() and vtimer_expired()
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/domain.c             |  8 +++-
 xen/arch/riscv/include/asm/domain.h |  3 ++
 xen/arch/riscv/include/asm/vtimer.h | 20 ++++++++
 xen/arch/riscv/vtimer.c             | 73 +++++++++++++++++++++++++++++
 5 files changed, 103 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 8863d4b15605..5bd180130165 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -22,6 +22,7 @@ obj-y += traps.o
 obj-y += vmid.o
 obj-y += vm_event.o
 obj-y += vsbi/
+obj-y += vtimer.o
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index c078d595df9c..e38c0db62cac 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -9,6 +9,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vtimer.h>
 
 #define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
                          BIT(CAUSE_FETCH_ACCESS, U) | \
@@ -111,11 +112,14 @@ int arch_vcpu_create(struct vcpu *v)
     if ( is_idle_vcpu(v) )
         return rc;
 
+    if ( (rc = vcpu_vtimer_init(v)) )
+        goto fail;
+
     /*
-     * As the vtimer and interrupt controller (IC) are not yet implemented,
+     * As interrupt controller (IC) is not yet implemented,
      * return an error.
      *
-     * TODO: Drop this once the vtimer and IC are implemented.
+     * TODO: Drop this once IC is implemented.
      */
     rc = -EOPNOTSUPP;
     goto fail;
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index fa083094b43e..482429d4ef33 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -8,6 +8,7 @@
 #include <public/hvm/params.h>
 
 #include <asm/p2m.h>
+#include <asm/vtimer.h>
 
 struct vcpu_vmid {
     uint64_t generation;
@@ -51,6 +52,8 @@ struct arch_vcpu
 
     struct cpu_info *cpu_info;
 
+    struct vtimer vtimer;
+
     /* CSRs */
     register_t hedeleg;
     register_t hideleg;
diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
new file mode 100644
index 000000000000..0d1555511755
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * (c) 2023-2024 Vates
+ */
+
+#ifndef ASM__RISCV__VTIMER_H
+#define ASM__RISCV__VTIMER_H
+
+#include <xen/timer.h>
+
+struct vtimer {
+    struct timer timer;
+};
+
+int vcpu_vtimer_init(struct vcpu *v);
+void vcpu_timer_destroy(struct vcpu *v);
+
+void vtimer_set_timer(struct vtimer *t, uint64_t ticks);
+
+#endif /* ASM__RISCV__VTIMER_H */
diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
new file mode 100644
index 000000000000..b6599fa383b8
--- /dev/null
+++ b/xen/arch/riscv/vtimer.c
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/sched.h>
+#include <xen/timer.h>
+
+#include <asm/vtimer.h>
+
+static void vtimer_expired(void *data)
+{
+    struct vtimer *t = data;
+    struct arch_vcpu *avcpu = container_of(t, struct arch_vcpu, vtimer);
+    struct vcpu *v = container_of(avcpu, struct vcpu, arch);
+
+    vcpu_set_interrupt(v, IRQ_VS_TIMER);
+}
+
+int vcpu_vtimer_init(struct vcpu *v)
+{
+    struct vtimer *t = &v->arch.vtimer;
+
+    init_timer(&t->timer, vtimer_expired, t, v->processor);
+
+    return 0;
+}
+
+void vcpu_timer_destroy(struct vcpu *v)
+{
+    struct vtimer *t = &v->arch.vtimer;
+
+    if ( t->timer.status == TIMER_STATUS_invalid )
+        return;
+
+    kill_timer(&v->arch.vtimer.timer);
+}
+
+void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
+{
+    struct arch_vcpu *avcpu = container_of(t, struct arch_vcpu, vtimer);
+    struct vcpu *v = container_of(avcpu, struct vcpu, arch);
+    s_time_t expires = ticks_to_ns(ticks - boot_clock_cycles);
+
+    vcpu_unset_interrupt(v, IRQ_VS_TIMER);
+
+    /*
+     * According to the RISC-V sbi spec:
+     *   If the supervisor wishes to clear the timer interrupt without
+     *   scheduling the next timer event, it can either request a timer
+     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
+     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
+     *   bit.
+     */
+    if ( ticks == ((uint64_t)~0) )
+    {
+        stop_timer(&t->timer);
+
+        return;
+    }
+
+    if ( expires < NOW() )
+    {
+        /*
+         * Simplify the logic if the timeout has already expired and just
+         * inject the event.
+         */
+        stop_timer(&t->timer);
+        vcpu_set_interrupt(v, IRQ_VS_TIMER);
+
+        return;
+    }
+
+    migrate_timer(&t->timer, smp_processor_id());
+    set_timer(&t->timer, expires);
+}
-- 
2.52.0


