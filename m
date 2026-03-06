Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPpqAPgBq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F5224FCB
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247977.1546362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7a-0004Ez-Cs; Fri, 06 Mar 2026 16:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247977.1546362; Fri, 06 Mar 2026 16:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7a-0004CF-4y; Fri, 06 Mar 2026 16:33:50 +0000
Received: by outflank-mailman (input) for mailman id 1247977;
 Fri, 06 Mar 2026 16:33:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7Y-0003HN-7G
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:48 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f2fad62-197a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:33:46 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so110250565e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:46 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:44 -0800 (PST)
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
X-Inumbo-ID: 3f2fad62-197a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814825; x=1773419625; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUa+J5dx/g0jfCQXCa5GsS6lcARiceV/jkoJtxvsNwc=;
        b=FEJfwGK+82JNUSYtm7sbdmwEJsaLrGrJOldr4U9TjjZBc/IbW3KtDjxQdmaTA7KJU8
         NzdwaWERTvYKWp8Y8eAFlTs2ZK/fSCI3mDDGkGfgMbuCNMnd4eiSWZxMP2Kb5yZmvNNV
         8MPo89b5wZGYfl56oP0XFCTc3fDvgCEFtweCus5S1FQxkaYVtDQ8ZvG+/dQqeOU2ce1W
         28LPfEU1bcmgANBQpcPSXdT412ZPs58huHRHSbHi4mSkdhhcx0uem20gerzf9U7JlGY8
         I/7rrSbqlD755pWs+7iZHch5nGYR4xOap6tT8+JS7Us91ySAoR3a0WDe2rC2sYAR3zTG
         TNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814825; x=1773419625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUa+J5dx/g0jfCQXCa5GsS6lcARiceV/jkoJtxvsNwc=;
        b=Z6QOPQMsGUQfwTFVfotGfBbvJa/maJEl9Iy483ktG69nHXb1BcFXbmdsW9dGOSxyaV
         En17BBoF4U8NWOSFLo896X0AIZjNXCELcNcwJSye/Tv8ugbrT3mfQUB3T5kSbSESx2d5
         p5fw68fIX2pBkc/m5qiZrJMb+bDWkDJqopIiWHHDCZldrdX05hr266dxlq/lyc1A+qXh
         iejuX8BWDyClHdqwidf7mnjp5zZEGJBeOK7OTYWCKzI7C335uCDn/D6QmD4RZ1PNh12r
         3fe/xo7HaljEX28wHFbmEkiki/6CUhzi9dn1FGXF0394fUKSDU9t6celYuo6fK4c3Ai7
         lZmA==
X-Gm-Message-State: AOJu0YzZ6utrY3IClM0nINhNUwwmw4n1NDo1MkerSQpfIgn3IqAOHiMs
	PhpobhyEGf82VNqG+sXmtJ5S2wk4zZp2BtryX1FbXTl7QvHjQ9QyE/ckChPjAg==
X-Gm-Gg: ATEYQzxJdu0QCB87WX9mhan8E5/pgCcvpwVvZ7Zvj9NOvkSWvpIfoWZMat1FjotI5iw
	W3ohdYfbqb6mA5wluowndGS2AcPX1Bzz527a/XiJJIyjuBqaWeA8ooDUZFAfho+Niilgki31VEw
	SE2euwW2WdA7WGYWm/H5Y2Z680braq47VisRrW9s/S115mskbR2RfWGMwfvS5V3tMNY1hGSWvgO
	nBypHyVH8SR7fJ7CRPH+4885WXviRahEjpJJKGm/Q6YPctdTjaCapKIbe9+wLkkYJqf1td1ucxh
	BmHnb1TaV2+ghd0rYcGHbds1JE8/IxPDbyJGI7DVP5DO1uGUUST4oIHM/6ZufsJnu8S6kymtxJY
	ubfvV9+lTHRHl9yOn/tc6ugeEbL537EDVmjUuawCi4OmJ4Yii9m0/JZUlwTGrrcIGJ/zRTYmPnV
	JsPduwWpJgnub7LH1Ks8KmnX4FYrmeakbXXY2dmicm5HsWDVJj8kRt1LR3xbAGa6k8AxruGg==
X-Received: by 2002:a05:600c:198f:b0:483:6ff1:18b with SMTP id 5b1f17b1804b1-485268bd6cbmr46440355e9.0.1772814825032;
        Fri, 06 Mar 2026 08:33:45 -0800 (PST)
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
Subject: [PATCH v7 05/14] xen/riscv: introduce basic vtimer infrastructure for guests
Date: Fri,  6 Mar 2026 17:33:22 +0100
Message-ID: <1a5fcf53fa4a3e935b1814c129aa131fe1068168.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A74F5224FCB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
Changes in v6-v7:
 - Nothing changed. Only rebase.
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
index f3e3ad149453..b59e026a9635 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -10,6 +10,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vtimer.h>
 
 struct csr_masks {
     register_t hedeleg;
@@ -148,11 +149,14 @@ int arch_vcpu_create(struct vcpu *v)
 
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
@@ -166,6 +170,8 @@ int arch_vcpu_create(struct vcpu *v)
 
 void arch_vcpu_destroy(struct vcpu *v)
 {
+    vcpu_timer_destroy(v);
+
     vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
 }
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 59d23e4f9247..6c48bf13111d 100644
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


