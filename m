Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N9AIAeEzoGnwggQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47D1A5580
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241457.1542536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu3-0007ew-Tr; Thu, 26 Feb 2026 11:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241457.1542536; Thu, 26 Feb 2026 11:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZu3-0007cW-Qf; Thu, 26 Feb 2026 11:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1241457;
 Thu, 26 Feb 2026 11:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZu2-0006E8-93
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:34 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef86abe-1309-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 12:51:33 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so7370705e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:33 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:30 -0800 (PST)
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
X-Inumbo-ID: 7ef86abe-1309-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106693; x=1772711493; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQbN7SP3fjaaAEDIkqEkmnk4ywUJEbwgcsMMvUSaPN0=;
        b=ceT4UyAZvKTKCGcH9s35BtWNIBBKYwaDKDnDLDlhDBOUtMeDt9SWjpJwoo7FyFP24o
         TLM87+A6N8iFS1k4km0NeekHUDFh5v/VF/NokR9UjtPnHw9A838Pu4nynv7BHKK6yhF8
         tA9nreJa0csrx9g5X8g9880N+v4PuLfWOuBUz9M/cQ5b9+sHSwj58SmRiBZak0mn+8IQ
         vBUitBNpDCKKbOeCSu34bnqukE9Dj76AUCg60g6PePZxwMxqBv3Du3UGdnYATKJAKWsn
         ok83wV4Hk9ncIxr/XE3yEmIin/VugFJ2Fkkx/rfRMrKV+dIjZx0VnGRuQy1mI9+mmOw5
         /yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106693; x=1772711493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WQbN7SP3fjaaAEDIkqEkmnk4ywUJEbwgcsMMvUSaPN0=;
        b=vpCQ+cGiEXaJvn6m7xlvsmK+EhdRjcuC/k7Rs40IJsP1iRyKSsxrf6vMSiUWZOmBp8
         tzR886kk1wv5mXIpSpr5peC0w0RLPJjONcn3HpdA+hrrZ/fNZ71Dk0ZOBusOU9egD7iY
         9lK1tNYUDgMmyR6BvGuXPV9v4o+lmEnGvqZheI5S8WsowoQIpWCy589nR9Huq6Awssp2
         hnZd3Go2Gc6S4bxoGEFkD4U5uLMCzR5xB+b1zpsDfzJnxiQNumeSgbRvWFOgczjfJ9Ew
         /k4YhUot/c1NwETSF59ScHrEOLa4LbbsCVXaKif2JjV4UWcWUVWmxLF9FZ6LFtLUXKPS
         +uJw==
X-Gm-Message-State: AOJu0Ywel0ggIB9upZaem4zAmfdTifIt2WwAZNBPmt74JMS3Bzf87S1G
	wnze+mCwP9KocFDWKt34dAf0vxZDDpkafAuaFO+smQrOHoJNUyADHEqAs4HkqA==
X-Gm-Gg: ATEYQzy/e1HZcPwbIaoGXAmC6YTvrPsqF/OIr/VQcblk62o6UnoCdK8z0UHCknEdXV7
	rkJYta2fDvVPl10VAurxpJ275zkh6tF+GBaPP4Qao4M78W30zRU991rANVr0IfM6VKOncVnHtX6
	DSe0Vu9U444T5Iajx1W3DGqj+HHry3KIAx1ndU6tlNv889eIiZrFqD0Tti9WXrqBlNn6U6uS1Wu
	+7kD521+852Us9dL6uRXhPidgwsRAR/pp6VeD5qJGJH6c2Qjqb6/5USWvNstMdXBCg+AiyI9YMW
	hhhzA6ejhElkdZHJFAekkLoOC16lq6aOZZ3jAplTmoSmacscTySfKlR70sG1suuL8/LEBNb3935
	J9gdQvPkpG24JL55FkYSjPAy8hglf6sJ8fK3j+YY55Jco3JM7tvMC+Ik6OMv3bTTEa3dH2fDkZr
	aHw12ye1j1t/ojcfxi1uXq7Osp4aXLsgYVeOTfPoVEYldjtEPmjh8x8cdLS8PyPcaTw4aHLYCGx
	iri
X-Received: by 2002:a05:600c:4751:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-483a963df99mr310294475e9.34.1772106692483;
        Thu, 26 Feb 2026 03:51:32 -0800 (PST)
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
Subject: [PATCH v6 06/14] xen/riscv: introduce basic vtimer infrastructure for guests
Date: Thu, 26 Feb 2026 12:51:06 +0100
Message-ID: <ec5903d84f00e1256af6e1662e79234bd79aa6ab.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772016457.git.oleksii.kurochko@gmail.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8D47D1A5580
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
Changes in v6:
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
index 6988d7032059..56b28750d3aa 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -10,6 +10,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/riscv_encoding.h>
+#include <asm/vtimer.h>
 
 struct csr_masks {
     register_t hedeleg;
@@ -138,11 +139,14 @@ int arch_vcpu_create(struct vcpu *v)
 
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
@@ -156,6 +160,8 @@ int arch_vcpu_create(struct vcpu *v)
 
 void arch_vcpu_destroy(struct vcpu *v)
 {
+    vcpu_timer_destroy(v);
+
     vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
 }
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 5373a498d80b..c0de8612cc25 100644
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


