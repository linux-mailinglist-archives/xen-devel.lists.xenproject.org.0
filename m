Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F298B3F0D7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105400.1456348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjO-0005fg-1R; Mon, 01 Sep 2025 22:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105400.1456348; Mon, 01 Sep 2025 22:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjN-0005bH-PF; Mon, 01 Sep 2025 22:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1105400;
 Mon, 01 Sep 2025 22:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjM-0005XP-2Y
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:28 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76fca5fb-8780-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 00:10:27 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f7039aa1eso2190788e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:27 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:25 -0700 (PDT)
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
X-Inumbo-ID: 76fca5fb-8780-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764626; x=1757369426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=claAnoGUSFMYFARQ+oTnePrqKOC6QAQ+IRoEf91ZFiM=;
        b=bl/q8yyy9+exPnPGrmq279pz/L584xBgnnBm8a78VPJ1aEh2Ht5A2y2BgaMus3+YJy
         f5TAcQmYaJ6Xae7tU2lsfgMsh7uoTlNCrV4mRKB0Ub41nmV34sJnghKiYyd6DutS+Q1p
         Ldh6Zswb/RV+dqo/pu+e7Stqp5NcIItGa/2pej4fMkRfV8oixb+GwHfTCerT0TC8SRTD
         b+a3R/mnkootOl5E6WPrlE0fsRltHS67Ig+GpjAeQAsmOZwARH+5keKzIcJAKJR/6DRg
         kJvGvN6GSO3b803ED2mpSyuyqdnTdFHi6NZSYauTrwiFt4AkmgwELx4oUHY5FHLrOgX4
         UVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764626; x=1757369426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=claAnoGUSFMYFARQ+oTnePrqKOC6QAQ+IRoEf91ZFiM=;
        b=MURouoznv9hN/Bi09PJTb8xQ3znN325wa8WrL6iSac7XCdi1ZR7fGnj0N6XKd8YRRf
         zK8qJzRZSqZEpJ8IfIfo/U6KtasIzhznGgJWz3bPLINHHcwnix82tnlYCrsIMohe1eGw
         Lz9ujVk0UuFE3Lmle7SbxElIxHNolSsH6KQ5cbf35emRBHatwOlbquICnpQ9FVbeLd5u
         ucD9WA1Km614993lwY5vwwYLHVYGO1ODY2q2j/SB2MAgI/UkupcO90e4Z5A7oPAWMGER
         qhVPftmMG917DUCI3wTYBBBMNenXXmJ1iz4jD2F8jGF4qTYSxjOxMhXCipkGlAba+nPl
         bS0g==
X-Gm-Message-State: AOJu0YwGpID7Hd0p0G6ma7BrNGj9Uu3VfXxPT37HmROZgrdL8JYabKnv
	p+h/gNx8iP7Iok9pRZ9/EFyBQSi50vbjObqaR18l4JM/9MRnstd76Ra0fFrFQYj6
X-Gm-Gg: ASbGnctmsCvSdQakgvH4Jc6Q8D8LN3NaOC4muNg968DKCK96mKJFwbyooymT5ABHOfo
	SbksPtsD+M+f0z1TZcsSj/V7u2iAvP5W/yvAGC3JD9cQzTgTu6Kw3oNRQGS2Ivm6adw3Giehj4y
	3MoCPMYvqaBoyaRq8EwQhICaHcqkk6ceNGdbnvVvRTrnQjxAkHJ1byPosRNLS3Fh5sGUEU/7FL7
	3xq23yZP0uRFNtTVmBxd3fpyueglHvbgNVsQAwgZV4uRAWskjJC4HwaeSLpRZkTFHQNHIcX6O25
	N84+jk+zu/5TxFTcLt2+ff3CldmUGdn2OKinbR+vz1CSMl76IRg7Mu5LNvFAKdzfEcr1Y2sNCxJ
	4/S1rgd4Qmz8/aVu6RyddlUb6xU6udGdKHUbk6WPKxcuI3bNw565x2+88np9PQRUZ5GRuAbkA
X-Google-Smtp-Source: AGHT+IHlRsA6VSEbFS7n1dHyaPDUYiGqNPk98LgH9nIWFqTNJk8rBvrkVuVXOyy9dbnfiE6iP+ROeQ==
X-Received: by 2002:a19:6b18:0:b0:560:827f:9ff6 with SMTP id 2adb3069b0e04-560827fa7cfmr125919e87.57.1756764626205;
        Mon, 01 Sep 2025 15:10:26 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 04/13] xen/arm: Don't release IRQs on suspend
Date: Tue,  2 Sep 2025 01:10:08 +0300
Message-ID: <293acbb653b5f4d5bf71dc459f9de3e729bff3e1.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

If we call disable_nonboot_cpus on ARM64 with system_state set
to SYS_STATE_suspend, the following assertion will be triggered:

```
(XEN) [   25.582712] Disabling non-boot CPUs ...
(XEN) [   25.587032] Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:714
[...]
(XEN) [   25.975069] Xen call trace:
(XEN) [   25.978353]    [<00000a000022e098>] xfree+0x130/0x1a4 (PC)
(XEN) [   25.984314]    [<00000a000022e08c>] xfree+0x124/0x1a4 (LR)
(XEN) [   25.990276]    [<00000a00002747d4>] release_irq+0xe4/0xe8
(XEN) [   25.996152]    [<00000a0000278588>] time.c#cpu_time_callback+0x44/0x60
(XEN) [   26.003150]    [<00000a000021d678>] notifier_call_chain+0x7c/0xa0
(XEN) [   26.009717]    [<00000a00002018e0>] cpu.c#cpu_notifier_call_chain+0x24/0x48
(XEN) [   26.017148]    [<00000a000020192c>] cpu.c#_take_cpu_down+0x28/0x34
(XEN) [   26.023801]    [<00000a0000201944>] cpu.c#take_cpu_down+0xc/0x18
(XEN) [   26.030281]    [<00000a0000225c5c>] stop_machine.c#stopmachine_action+0xbc/0xe4
(XEN) [   26.038057]    [<00000a00002264bc>] tasklet.c#do_tasklet_work+0xb8/0x100
(XEN) [   26.045229]    [<00000a00002268a4>] do_tasklet+0x68/0xb0
(XEN) [   26.051018]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
(XEN) [   26.057585]    [<00000a0000277e30>] start_secondary+0x21c/0x220
(XEN) [   26.063978]    [<00000a0000361258>] 00000a0000361258
```

This happens because before invoking take_cpu_down via the stop_machine_run
function on the target CPU, stop_machine_run requests
the STOPMACHINE_DISABLE_IRQ state on that CPU. Releasing memory in
the release_irq function then triggers the assertion:

/*
 * Heap allocations may need TLB flushes which may require IRQs to be
 * enabled (except when only 1 PCPU is online).
 */

This patch adds system state checks to guard calls to request_irq
and release_irq. These calls are now skipped when system_state is
SYS_STATE_{resume,suspend}, preventing unsafe operations during
suspend/resume handling.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V6:
- skipping of IRQ release during system suspend is now handled
  inside release_irq().

Changes in V4:
  - removed the prior tasklet-based workaround in favor of a more
    straightforward and safer solution
  - reworked the approach by adding explicit system state checks around
    request_irq and release_irq calls, skips these calls during suspend
    and resume states to avoid unsafe memory operations when IRQs are
    disabled
---
 xen/arch/arm/gic.c           |  3 +++
 xen/arch/arm/irq.c           |  3 +++
 xen/arch/arm/tee/ffa_notif.c |  2 +-
 xen/arch/arm/time.c          | 11 +++++++----
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index a018bd7715..c64481faa7 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -388,6 +388,9 @@ void gic_dump_info(struct vcpu *v)
 
 void init_maintenance_interrupt(void)
 {
+    if ( system_state == SYS_STATE_resume )
+        return;
+
     request_irq(gic_hw_ops->info->maintenance_irq, 0, maintenance_interrupt,
                 "irq-maintenance", NULL);
 }
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 02ca82c089..361496a6d0 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -300,6 +300,9 @@ void release_irq(unsigned int irq, const void *dev_id)
     unsigned long flags;
     struct irqaction *action, **action_ptr;
 
+    if ( system_state == SYS_STATE_suspend )
+        return;
+
     desc = irq_to_desc(irq);
 
     spin_lock_irqsave(&desc->lock,flags);
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 86bef6b3b2..4835e25619 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -363,7 +363,7 @@ void ffa_notif_init_interrupt(void)
 {
     int ret;
 
-    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
+    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI && system_state != SYS_STATE_resume )
     {
         /*
          * An error here is unlikely since the primary CPU has already
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index ad984fdfdd..8267fa5191 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -320,10 +320,13 @@ void init_timer_interrupt(void)
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
     disable_physical_timers();
 
-    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
-                "hyptimer", NULL);
-    request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
-                   "virtimer", NULL);
+    if ( system_state != SYS_STATE_resume )
+    {
+        request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
+                    "hyptimer", NULL);
+        request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
+                    "virtimer", NULL);
+    }
 
     check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
     check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
-- 
2.48.1


