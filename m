Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJrFKZqJmGlKJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D244416940C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237338.1539734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDz-0001ag-T6; Fri, 20 Feb 2026 16:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237338.1539734; Fri, 20 Feb 2026 16:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDz-0001Tw-Lx; Fri, 20 Feb 2026 16:19:27 +0000
Received: by outflank-mailman (input) for mailman id 1237338;
 Fri, 20 Feb 2026 16:19:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTDy-0000QF-8g
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec58b540-0e77-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 17:19:25 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so17969715e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:25 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:24 -0800 (PST)
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
X-Inumbo-ID: ec58b540-0e77-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604365; x=1772209165; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEV8dCoZsWR/xbos3xux/u5WeUz+dOOsBwMZ7zxnQ6E=;
        b=OwU25nveJCZFvqy+Uz5gvC0VQQqFjKWyquipLJmfvhrgCMvqsPW9qIobD3BhIWSHrp
         vYC6OrFXcDgGKwziAmXEkZy5v2JqkYOySN2yXN/+omUmgBwc5vo66BBGW6s5Yn2Ad8NV
         mD4lFfm/A201zHKmT4+TtlJA3+gxhmbyhbRNLYHowreN7vVMlir/TUIFLnvIXCdgYNCj
         nZoERDBkn6Yulfgk1oQmXtKFUgbmdacHGpGuyeMOcy316jrIr2qd4pmqmmYkhIhZK2G+
         fX9RxMROyUXg/CvWSEjuT5XZHYlPTi/MlXCNFLXRHAaQR9NamWN1ZOZnOOlxCycx4OvD
         loIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604365; x=1772209165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vEV8dCoZsWR/xbos3xux/u5WeUz+dOOsBwMZ7zxnQ6E=;
        b=AMY0eEPT5Og+Ume2NlVWGaRLO2gdOi9uraimkRK7eBpP1xEv5pbo8FbGJQHWKBVPLG
         2thgcfONZFXDndPQPsHwO1N/5zRV6tjA6C1P48v2XQHEwn9UT4/bUHVvjSu7JPeTzYNQ
         Gru7FrWTJFKGm0srrtHcyYwv5y2BwBD/G75OWctGdUGESZsQ9X1I+T/LIf/0gkqTud0r
         C6EAVU2+Ma4p0sApdpOIex+67C0TNh+dtmNjPdypb3sb7lRJ7oIEeIkQ6AP/LShOvibU
         mQOeBW+BYXM6kKm4zzeWDIzVaxHZN9Lvu7XsTq4texuCKU/Ho4b/LcDVM8VNxqGdp+qa
         UBtg==
X-Gm-Message-State: AOJu0YzlHVYOo7fPXLlFNpWRi7Yrfw++RxfOEi9m6blNYfvj8LjzfjcQ
	hSCKJ6QfpPkxtcUL2sm5QdkfgDuLgO5Xb/Wqp79hy7nhGoYg84GbtMPmS26a0g==
X-Gm-Gg: AZuq6aKTD92jjQ3z4KFZM9svAnXp/52n9T79gB1/1G1udBXWn0oz5w/IM4A/d27a29N
	XR5OC2F7i+wlNc5GCve/exlKPmeQeZvQkGgFrk7TMm6qZjyYeVCrEBPXdPzUKIkUwmSIbU/h8Ol
	/Droc2STAfUq6JsWunQKEH6XzNqFuG6l9RhOr3n3urH4VF2Xvnlluy4PZkAAledO4/6cu56/gxh
	WmDfn+hdn1ptIH29nmcBBV++d6DusHxLSEqx08M6bpfvZI9lIxRGpXu+DMtmwW26PqiztM0JATg
	dpYop7L13ib7semZ6J2BJRjbHM7qgDwTLn1NQiXlhofxa8csZPIvhJEixYWEsLPlLuP8wawWEZK
	mwAO4J09kprfbQLno1dRTzstMl9pNMx6k1lQToc9PBq76btGn0ydcK7/7/gxl1b9Wkx8eFuHvTl
	Y/sdZiK4WVrr7bNKyA9JbKvk3X4RC0cfJtlpuBpT0aZN9JVwdHslyNAHAtjZWKJcXUfQ==
X-Received: by 2002:a05:600c:4454:b0:483:80b0:b245 with SMTP id 5b1f17b1804b1-483a95f89c2mr1243105e9.9.1771604364473;
        Fri, 20 Feb 2026 08:19:24 -0800 (PST)
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
Subject: [PATCH v5 06/14] xen/riscv: introduce basic vtimer infrastructure for guests
Date: Fri, 20 Feb 2026 17:19:01 +0100
Message-ID: <79aa5e8baa32ef4dd2ce4b586ba265b24fce58a8.1771590794.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1771590794.git.oleksii.kurochko@gmail.com>
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D244416940C
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Drop copyright line from asm/vtimer.h.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
 - Add vcpu_timer_destroy() to void arch_vcpu_destroy().
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
 xen/arch/riscv/domain.c             | 10 +++-
 xen/arch/riscv/include/asm/domain.h |  3 ++
 xen/arch/riscv/include/asm/vtimer.h | 17 +++++++
 xen/arch/riscv/vtimer.c             | 71 +++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index bc47e83b26d7..ffbd7062e214 100644
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
index 636349c8c7e8..7027b5e9aa20 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -10,6 +10,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vtimer.h>
 
 struct csr_masks {
     register_t hedeleg;
@@ -120,11 +121,14 @@ int arch_vcpu_create(struct vcpu *v)
 
     vcpu_csr_init(v);
 
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
@@ -138,6 +142,8 @@ int arch_vcpu_create(struct vcpu *v)
 
 void arch_vcpu_destroy(struct vcpu *v)
 {
+    vcpu_timer_destroy(v);
+
     vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
 }
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 2a454bfc083c..a30ee450b36a 100644
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
     register_t hideleg;
diff --git a/xen/arch/riscv/include/asm/vtimer.h b/xen/arch/riscv/include/asm/vtimer.h
new file mode 100644
index 000000000000..111863610a92
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vtimer.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
2.53.0


