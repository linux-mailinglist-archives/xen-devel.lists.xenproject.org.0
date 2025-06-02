Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209FACAB27
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002945.1382401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16K-0000Y1-OH; Mon, 02 Jun 2025 09:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002945.1382401; Mon, 02 Jun 2025 09:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16K-0000VJ-JF; Mon, 02 Jun 2025 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 1002945;
 Mon, 02 Jun 2025 09:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16I-0007kh-RD
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:04:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7e47e97-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:04:57 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-551ed563740so5335407e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:57 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:55 -0700 (PDT)
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
X-Inumbo-ID: a7e47e97-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855096; x=1749459896; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3qd7wn/+BTaUGKnbQ/zLRIfyUfmlIN1J0Bwt1qcE10=;
        b=WbGXqU9a88+HORAGiOjUP8+B+eIE86O8z3KV/Bcoxoh19SaPQMYog2NRJ07SdHAyl6
         4VgxgCjJdZcbaX2pR3LeVCZkfmYNxR+i2w9AoFRFM+Xe6GWSVhycM0y12dbRvCIGhqlz
         mZ+lTmJE/1t/QQGjmqGL/tnJ6B35Xp6lPtJ1hsXos/prFL5EtYCU1Yc82R3W0rBfqZKB
         KY0kjDt1EKgXxKuH+G/wQnuuECU6ZXfaLS0ERcDKJVIto2+P0/0zI7cWJmtJQNQHTBYN
         HWMg11afFY4b7ti7V/1bhZZQSEZTU/7MlOkA2netRfJkMNWA2rKZij1EWkoKgDYhxtgQ
         +HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855096; x=1749459896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3qd7wn/+BTaUGKnbQ/zLRIfyUfmlIN1J0Bwt1qcE10=;
        b=j635ycgOAaqvuXveHQ1JJlvnDXaaCoq2njBffEgQO4EezFrbvqW6dXrmP/e/LwpHXU
         bLIJ10Yv2GS9eZg7sV1qcBECLyu+Bul09DZdS3fOu+qn1GRU9LZn+l1fzhd2mhA8Oihr
         T3mESP5aFhgdyTyjPrvIML21l29aTxixd7v5u5SK9gbHYGqkDHxA7BscwYvSTjffMb+Y
         cBhlHuvbh6u14Cv5M09f5tTy2nH2yfwqBBnxAIMsYaSop4jWl8onLommCbZgZVjixzGb
         E5rkavQfjwiKMKVkLmYgi/WE4yIOuSsVc8KxK50MYSy5N0OXSEmojeXBkcu7/KvCBKcC
         qHog==
X-Gm-Message-State: AOJu0YyWzGAGFHfgJqdn5mDliYi5t/W0+Z9BhDeorBaN7fJXYFT1DyLy
	DGafaXQClFJO2d/O1TRv1JZ2L3NBTSLXJPPluviPEYb73C0J5wY6He4ZP4uvVa0x
X-Gm-Gg: ASbGncs0A7F9NGYYhCx6ntSHZ1pqGvNfHx2llE5WcIUZgNfnaXgAYxV5yaUkQcoPTQE
	BSeZe9gE0I5pbMT+47uE+XXsghVwAFohyKbO0RYzU+E1fdrwtydTyW2Tp8MLpk14yh1DgrkqUhf
	I6ph+7MYE0SDN1Gb/lwYJD8RVM2gOyual1SahyZFwiDsN+940L1pGAUq1jJ1KWDdMyUfGUxClwe
	N+1ezCJG4Yma11TBDR1r5SDt/5AZ47Ij+RtwFi/5tCNqRjt6OS+zDCv25GludHQ/xAiBfrA86po
	IcrrHBgwE44Dee5+Q0CRgkCmgyFMUUnyzIR00De91Y1Jr7nmwbUzdTT/hT8G69CFk2UTrdU7ET3
	9GT9Q4r3OKiw1uk0=
X-Google-Smtp-Source: AGHT+IGi3/KfBHShC4Zm7tMGUh4qiGmrbniKVBV5ymlS3Q6WgyqayZLY6h/yrit9MCILP5HY1wYUag==
X-Received: by 2002:a05:6512:2215:b0:553:3127:b00 with SMTP id 2adb3069b0e04-5533b90b7d6mr4336691e87.32.1748855096396;
        Mon, 02 Jun 2025 02:04:56 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 04/10] xen/arm: Prevent crash during disable_nonboot_cpus on suspend
Date: Mon,  2 Jun 2025 12:04:15 +0300
Message-ID: <dd7f6be1cdd8cc4f79ba024936fe8b0407fe99a4.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
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


