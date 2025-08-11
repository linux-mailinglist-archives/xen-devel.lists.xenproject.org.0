Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53CCB216C5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077947.1438988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRw-0006bs-WC; Mon, 11 Aug 2025 20:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077947.1438988; Mon, 11 Aug 2025 20:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRw-0006Zg-Sl; Mon, 11 Aug 2025 20:48:56 +0000
Received: by outflank-mailman (input) for mailman id 1077947;
 Mon, 11 Aug 2025 20:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZRv-0005co-NW
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:48:55 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9863a886-76f4-11f0-a327-13f23c93f187;
 Mon, 11 Aug 2025 22:48:55 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso7470419a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:48:55 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:53 -0700 (PDT)
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
X-Inumbo-ID: 9863a886-76f4-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945334; x=1755550134; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3qd7wn/+BTaUGKnbQ/zLRIfyUfmlIN1J0Bwt1qcE10=;
        b=kB1jbKl/DEHDketgCQPVFERAjE0SPcL4FMHCQy5fbVRw5LmrtsnyRO09jBUxa8Lw2j
         6cedYJTwrVdfJ3EGFyu9+bfNbOO77qvaizD9BkkZZpzyR6Iz8Xv3a1rJOG0DXlWNo6Py
         ZR6V+iGxoXFv36zzKVIZxAKjEc1XurqSn2CBou86iDCbDsbLsdW9mFRiSQ3w0T6WWrK/
         pHgqox5ueR8i1JAjTnaYuKY/hNNDRivpurbhGTlha4A2DksykKx3YYOKg1mWz82ThmrF
         4ZXcGFXPXbESUal9r8RDMqba7SUywDq02PVOwz513H6tFQr3Mu4xvS5wbdQSrbOZyjm7
         1KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945334; x=1755550134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3qd7wn/+BTaUGKnbQ/zLRIfyUfmlIN1J0Bwt1qcE10=;
        b=EPL/o3iYrKqiEthiryZKv0t/cBsGwjPMgaMx6O8uC9mFSdgjMFNjMF18L2hyiMnTOz
         hTl+pBNuazZyEm2MxVLKhL2v6nwtgOTaweunBFfrzSQWrIzeJoDa4DsnmsR829ABj2fR
         4ybWVi/GwPuEGtDblwUveu/Xhv03Nd/Q8t/o8ui7MWmJxtqAclhCIHNHlHgOw9xs8nCN
         ai//jb0/lmweQ96LexpMjDk3FNXf1HJzn9AuAJoBfJEeL4MXzEnfWAsZocPSU6SawJ6g
         8kjWMfzoLZmWkBwUw9s3Ego3KYL3ljBAB4J4yX9xHFVFVaIA5sEetAscWqUauK21VC51
         bLVQ==
X-Gm-Message-State: AOJu0Yw3dkpAqXNIjKBBgTZ6VhqzI5YAVd0S24i1NjA9YP9MAyekrw4i
	Kx6UyenSfyvNyNR+lqYUgF+e/f0xlsMX8AmRuxIVLVyJpJlXpnjnIh9yJJQQXA==
X-Gm-Gg: ASbGncvJbAAQ2sh/Tqv70UkTLjCU3M/KVB1L/gX6MyuMvBo5nPXCBueSXE79U/Xyuak
	CHUeiNELwvjXojT6Y5AOG7i41iHW1kNliPNhOw1pE8pzB9VzdMFx3wOlDb0wOydFyLlnkR+y5Br
	0HKH9pZuF7Bd9DOB0BskOFru8suJNzfsILKIotGeMGiLuI1X9pUaOi1j2/M1a8TrDn4tXCWR1Xi
	nWudb40ViLxL4CKmSlbj3HCEJT6qt5g44osOL32XbNkvGPPuLBz78z0C/c+mn6SWBmTvkKWiLVb
	5VZgpsY1Xgbux4hGYrlHgqRaYzhfBuZujodQrx1W3wx41GvkaMV7HeGdRxRcdJtbr0zQtA+gBNW
	dj6oPJdJ2hkrJydp3b6dOjxXRp/aYCyGhzGM9JeVEpyl2bDVUT94qhxUKIbARiGBkdLg=
X-Google-Smtp-Source: AGHT+IHyc4RdgDDPGpJFPoO/+5S4rhYm2JlYjM24gD7Vc95QPmXWGO9du6N0t/9Ny5v0LhPnvvAfWA==
X-Received: by 2002:a17:907:60cc:b0:ae3:a812:a780 with SMTP id a640c23a62f3a-afa1e1ed74fmr73582466b.61.1754945333973;
        Mon, 11 Aug 2025 13:48:53 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 04/12] xen/arm: Prevent crash during disable_nonboot_cpus on suspend
Date: Mon, 11 Aug 2025 23:48:00 +0300
Message-ID: <98957da5c5068ae8340a21a9aa15a962905a8a22.1754943874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
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
Changes in V4:
  - removed the prior tasklet-based workaround in favor of a more
    straightforward and safer solution
  - reworked the approach by adding explicit system state checks around
    request_irq and release_irq calls, skips these calls during suspend
    and resume states to avoid unsafe memory operations when IRQs are
    disabled
---
 xen/arch/arm/gic.c           |  6 ++++++
 xen/arch/arm/tee/ffa_notif.c |  2 +-
 xen/arch/arm/time.c          | 18 ++++++++++++------
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index a018bd7715..9856cb1592 100644
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
@@ -461,6 +464,9 @@ static int cpu_gic_callback(struct notifier_block *nfb,
     switch ( action )
     {
     case CPU_DYING:
+        if ( system_state == SYS_STATE_suspend )
+            break;
+
         /* This is reverting the work done in init_maintenance_interrupt */
         release_irq(gic_hw_ops->info->maintenance_irq, NULL);
         break;
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 00efaf8f73..06f715a82b 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -347,7 +347,7 @@ void ffa_notif_init_interrupt(void)
 {
     int ret;
 
-    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
+    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI && system_state != SYS_STATE_resume )
     {
         /*
          * An error here is unlikely since the primary CPU has already
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index ad984fdfdd..b2e07ade43 100644
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
@@ -338,8 +341,11 @@ static void deinit_timer_interrupt(void)
 {
     disable_physical_timers();
 
-    release_irq(timer_irq[TIMER_HYP_PPI], NULL);
-    release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
+    if ( system_state != SYS_STATE_suspend )
+    {
+        release_irq(timer_irq[TIMER_HYP_PPI], NULL);
+        release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
+    }
 }
 
 /* Wait a set number of microseconds */
-- 
2.48.1


