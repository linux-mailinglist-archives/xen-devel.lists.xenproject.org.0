Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a2IoO/YQimnUGQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781EF112B1E
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225792.1532434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVG-0000tc-6G; Mon, 09 Feb 2026 16:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225792.1532434; Mon, 09 Feb 2026 16:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUVF-0000o4-VW; Mon, 09 Feb 2026 16:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1225792;
 Mon, 09 Feb 2026 16:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUVE-0007Zo-1D
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:48 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c311b7df-05d7-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:52:47 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b885e8c6700so780491166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:47 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:46 -0800 (PST)
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
X-Inumbo-ID: c311b7df-05d7-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655966; x=1771260766; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftXQlefZdbz0dncAwMVaBMfjTGZihapLiGK/88smptw=;
        b=B0Fl9Oikdm84wh+lWNu8SEQwSI3fs3ich86nX53CWPZZV6m4bOBw9QBOCHM/9I+6hm
         znXl9GJxzvFAkMlE+RceJeJtvozQUvMkYV/N640MbLk+NYn3zm3Dzo2xigdH45dCFhF2
         fLfl3xS8UNxeJrrHFBtxHSI0braQkUjUZciCBuV1POntaMrRi/wKHWydfTTZ/EQLMrRF
         4wvCove5+oyfM6RFr9pgrGzWzS34OVXq8elrtivle3c0G+AEacfmADXkmpdrOC0W4UUz
         gRB8nGk18BGWNq+8Rhfr6fum26WgNtrjIeGhXt8PJDr14JLGzE7Ie2geK/tauItqk7me
         g3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655966; x=1771260766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftXQlefZdbz0dncAwMVaBMfjTGZihapLiGK/88smptw=;
        b=Sk44xEyp8B90E6TraQOo2FUfvHfgOjt+t/0OeJancWyoiTJvCWGrXcOVDoEX0jccnS
         +YxI8c83BJGZ7/38HG76X498SDNY0/C59hDNSVO0FPIBRAm1x7dONqpX/oCOmTTSeamN
         JiVRqh/2NUuT2Lt/crx9jepQtz9IHQ4jhanGpdC1jJsgFTL74ChyARgPGH5olSxUUZKL
         iwukE/3VJtX4Qcu/lBxcaPuheSQCqng42mJLGPM/0AxoVQge8ezg00Sr0L6IGJGSSZUw
         G7QaJxkaEnbwO2hQVSQ58vclosblZocyXod2mjavl59pUvOCDlaHr0su6+CGvcoTCp3G
         nb2w==
X-Gm-Message-State: AOJu0Yxrqmcpd9ThMqG04GGEpysYeIUCeFTKuYbX5D05Cbfel72c40K2
	TVhFXULs/4iW/Ggn2FqRj7zdFUTE7cLqnA+muzaQnJ+HJfyl8KeMNJYzgselqcyE
X-Gm-Gg: AZuq6aLGheRZEpZk8n6RK+6UDWEeXXBIHooetrr15MzGL/ltH1AjWnb6rxxGGY3E7Wv
	mzB2HgelYDKPkmqT8Dofe/VuELBqSNVJgf6xKIwfqIZFITzVqjn80un27XzzrFyKpYelntwYMYs
	1W4tFKpGumaioHD8k4cQHU5ArYvVRd9XHpzaTBTHx21fTJdTJ+gcQWY0bW8Pfak3BteYOs1wFKW
	LR78oG8jLIrnejaQ/9BhRifZZICczaBgGx7Omnp9dLNe+cRjPoH/PuyT7u15RmglHrtnjHw/KVG
	0G8Mza1a6Idg5uG5XFEJdopdPw6sq/riJ1T5dGL1jW5s83hKLG0iUiJgIn5Bv+8yzkDFl5wsuzm
	ptWOtNuvrhspDmhQ75KoNbLMJjJ/DtHSXiuq97XnWj4UBH5ald7o093PFxJymya6CIRZMIPykOF
	2TBxg29IWQUC60+/0utSURLp76tHggaZC6BA0q3TfXYY0NJmGZ2hD1Mg==
X-Received: by 2002:a17:907:868f:b0:b87:fad:442b with SMTP id a640c23a62f3a-b8edf11f316mr720701766b.3.1770655966298;
        Mon, 09 Feb 2026 08:52:46 -0800 (PST)
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
Subject: [PATCH v3 08/16] xen/riscv: introduce basic vtimer infrastructure for guests
Date: Mon,  9 Feb 2026 17:52:21 +0100
Message-ID: <792ea928d748e9ff7bd331b8e8b0262695a062e9.1770650552.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770650552.git.oleksii.kurochko@gmail.com>
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
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
X-Rspamd-Queue-Id: 781EF112B1E
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
Changes in v3:
 - use one container_of() to get vcpu instead of two container_of()s.
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
 xen/arch/riscv/vtimer.c             | 71 +++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 868514c25006..7439d029cc45 100644
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
index 67437912605a..3f4b062b6ce8 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -10,6 +10,7 @@
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
 #include <asm/setup.h>
+#include <asm/vtimer.h>
 
 #define HEDELEG_DEFAULT (BIT(CAUSE_MISALIGNED_FETCH, U) | \
                          BIT(CAUSE_FETCH_ACCESS, U) | \
@@ -105,11 +106,14 @@ int arch_vcpu_create(struct vcpu *v)
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
index de5aecb862b5..b5a8a9f711ac 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -8,6 +8,7 @@
 #include <public/hvm/params.h>
 
 #include <asm/p2m.h>
+#include <asm/vtimer.h>
 
 struct vcpu_vmid {
     uint64_t generation;
@@ -49,6 +50,8 @@ struct arch_vcpu {
 
     struct cpu_info *cpu_info;
 
+    struct vtimer vtimer;
+
     register_t hcounteren;
     register_t hedeleg;
     register_t henvcfg;
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
index 000000000000..32d142bcdfcd
--- /dev/null
+++ b/xen/arch/riscv/vtimer.c
@@ -0,0 +1,71 @@
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
+    struct vcpu *v = container_of(t, struct vcpu, arch.vtimer);
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
+    struct vcpu *v = container_of(t, struct vcpu, arch.vtimer);
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


