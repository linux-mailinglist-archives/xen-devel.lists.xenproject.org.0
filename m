Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F786A4F997
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901869.1309829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknL-0007dB-Q8; Wed, 05 Mar 2025 09:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901869.1309829; Wed, 05 Mar 2025 09:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknL-0007bR-Mp; Wed, 05 Mar 2025 09:12:03 +0000
Received: by outflank-mailman (input) for mailman id 901869;
 Wed, 05 Mar 2025 09:12:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknK-0006ew-1n
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:02 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e54738f8-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:12:00 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5496301c6afso692341e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:00 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:11:59 -0800 (PST)
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
X-Inumbo-ID: e54738f8-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165920; x=1741770720; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRks+rWb+OIlYB2/kwqZs9XahqYYzmw08LLO1JIt0RI=;
        b=WMyptCCFjqVPIuWB/xIruCHKPgSbX71PCVBIDyabxTmopwHQycsh4L2nMG603GrHAA
         QcvBQwmftH3Ti6INQVhV7nW/gHwivU9eCao8KJTqLBQ7PDIbWIhxUABIBIlPl/Q3BfoP
         t7GvbJuFZcwaRHpwoGFt3AiOjbXD0LMJE3y4bKmZAY2x1BTlcFMgpr9c4LIDEoJFLjC9
         fx6rIt1jBMA1WSQ3joNcxmQZegrAvcCu0fXGptYRgxgZUaa8O7jkfKdYCY6ve9O3nawg
         WCw8Ug6cwYLZYKMPJZdlIv0ZD2Xq4anDR/B6QGsx4s73yvT/AQ2Oe1i7/swPSPQMh8QT
         WSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165920; x=1741770720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRks+rWb+OIlYB2/kwqZs9XahqYYzmw08LLO1JIt0RI=;
        b=ufDX2NvZOcUEmOHlNJsJyzU0SF3jhqidqTfG2cqiBKCT8J1cyNQddUN/2r86wDEryo
         7X5EbCA0Tm6bVcJn/ohpLgHQ0gGbBtCpdCJEp27s889pSUiO16tBA6dV56nPbaiQbzYb
         axrXfZdIlNq1ETmJF2jk2KaAt5/rM6fAI1zSQHZqgmJoOUXYeomEknHjdFTl2VV0CGoH
         pK72RB2KMKbj4RJXwW+UbhZheTlZMzwgDX+LIu0XlfU4EMu3+G9sD+ZoAH3sm9Ucp0AP
         jQ1Q0S72omgmfhel0FaF/PsPiu0m+8J1L4DxfLGfE306838nV3PhbHG5zgi9dUYeFdNm
         apcg==
X-Gm-Message-State: AOJu0YxKrKWeSXbudYjwNpyXIXsokAbHIeSBh6PV2okN2ch62ly6BjXL
	ZVJYs810NZKDwS3bGFf233jb368VMZ1fk0J1du3WeKApF/f1IopMgORCL+AI
X-Gm-Gg: ASbGnctgkqp59TxQL/dy+Se9vbC9yYtR+0IWzE1QF4QtHsJJLA0xQC7QmT2qgGuVj/6
	FOGN03IvgGiS4HB1gsjjHyEgrVqFY15dHrCma3egIA2aBfyUXuIqDxDBsv/20PWFwEmcAK1Gt/d
	r+9uTFj87B0X/e6JmGV8a/ztTn0qFXAEPAv4w05itrMEGqSp9eMTkBWEyTC22DRmoihDmYK2p6E
	r2mZd02BQWBVJSH1nx3GNCotDvdNZ+RxZW3LTJEd5ZPe4s9ZjSRzp21dvoUNzh3cMqAb5IUgoxR
	hJYX3QRtZnUSpFUHK4WlxkCHcGwvj6AS4y1ZkdG5vP+E9xqIaA==
X-Google-Smtp-Source: AGHT+IEcZGdsEAbkUwhCCTEVH6cqDWPFh5mffdCfKlFAQCELmtoZxqoKEfiRPyfvNPZRr9np5hHkIw==
X-Received: by 2002:a05:6512:10c9:b0:549:7394:2ccc with SMTP id 2adb3069b0e04-5497d590109mr680411e87.26.1741165919444;
        Wed, 05 Mar 2025 01:11:59 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 04/16] xen/cpu: prevent disable_nonboot_cpus crash on ARM64
Date: Wed,  5 Mar 2025 11:11:12 +0200
Message-ID: <e6cc20510acf49d90c08007a2308ef3dcaccc368.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
#define ASSERT_ALLOC_CONTEXT()

This patch introduces a new tasklet to perform the CPU_DYING call chain for
a particular CPU. However, we cannot call take_cpu_down from the tasklet
because the __cpu_disable function disables local IRQs, causing the system
to crash inside spin_lock_irq, which is called after the tasklet function
invocation inside do_tasklet_work:

void _spin_lock_irq(spinlock_t *lock)
{
    ASSERT(local_irq_is_enabled());

To resolve this, take_cpu_down is split into two parts. The first part triggers
the CPU_DYING call chain, while the second part, __cpu_disable, is invoked from
stop_machine_run.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
This patch was introduced in patch series V3.
---
 xen/common/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index f09af0444b..99d4c0c579 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -48,6 +48,10 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
 
 static DEFINE_RWLOCK(cpu_add_remove_lock);
 
+#ifdef CONFIG_ARM_64
+static DEFINE_PER_CPU(struct tasklet, cpu_down_tasklet);
+#endif
+
 bool get_cpu_maps(void)
 {
     return read_trylock(&cpu_add_remove_lock);
@@ -101,6 +105,14 @@ static void cf_check _take_cpu_down(void *unused)
     __cpu_disable();
 }
 
+#ifdef CONFIG_ARM_64
+static int cf_check cpu_disable_stop_machine(void *unused)
+{
+    __cpu_disable();
+    return 0;
+}
+#endif
+
 static int cf_check take_cpu_down(void *arg)
 {
     _take_cpu_down(arg);
@@ -128,6 +140,14 @@ int cpu_down(unsigned int cpu)
 
     if ( system_state < SYS_STATE_active || system_state == SYS_STATE_resume )
         on_selected_cpus(cpumask_of(cpu), _take_cpu_down, NULL, true);
+#ifdef CONFIG_ARM_64
+    else if ( system_state == SYS_STATE_suspend )
+    {
+        tasklet_schedule_on_cpu(&per_cpu(cpu_down_tasklet, cpu), cpu);
+        if ( (err = stop_machine_run(cpu_disable_stop_machine, NULL, cpu)) < 0 )
+            goto fail;
+    }
+#endif
     else if ( (err = stop_machine_run(take_cpu_down, NULL, cpu)) < 0 )
         goto fail;
 
@@ -247,3 +267,26 @@ void enable_nonboot_cpus(void)
 
     cpumask_clear(&frozen_cpus);
 }
+
+#ifdef CONFIG_ARM_64
+
+static void cf_check cpu_down_t_action(void *unused)
+{
+    cpu_notifier_call_chain(smp_processor_id(), CPU_DYING, NULL, true);
+}
+
+static int __init init_cpu_down_tasklet(void)
+{
+    unsigned int cpu;
+
+    for_each_possible_cpu(cpu) {
+        struct tasklet *t = &per_cpu(cpu_down_tasklet, cpu);
+
+        tasklet_init(t, cpu_down_t_action, NULL);
+    }
+
+    return 0;
+}
+__initcall(init_cpu_down_tasklet);
+
+#endif /* CONFIG_ARM_64 */
-- 
2.43.0


