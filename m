Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FB0ABFBBE
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:56:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992349.1376123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmjt-0007oy-SI; Wed, 21 May 2025 16:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992349.1376123; Wed, 21 May 2025 16:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHmjt-0007n1-P8; Wed, 21 May 2025 16:56:21 +0000
Received: by outflank-mailman (input) for mailman id 992349;
 Wed, 21 May 2025 16:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHmjs-0007kx-87
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:56:20 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83e77f63-3664-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:56:19 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso6999631b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:56:19 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b26eb0a0b19sm9850067a12.74.2025.05.21.09.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:56:16 -0700 (PDT)
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
X-Inumbo-ID: 83e77f63-3664-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747846577; x=1748451377; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDIOiRpQ/UWqZgclLlLXABuivH/D3ZP3P/vQMi7O+1g=;
        b=QChupFmSgSzSRnbgEONq6e63zEA3OLWj8XuDXzvz0a6BxL6yDLhAtyc+3Bd3PfyrVs
         bYRguGmAW8qHKz/aHsJjDRjj+PBWGf7/o2VxVny8EYyVn+GWyWmUjm9AO08IGCC+il8+
         5v8RZkRfoUJgEH5zr4QJEXyIprVtFBQ2p0Abc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846577; x=1748451377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDIOiRpQ/UWqZgclLlLXABuivH/D3ZP3P/vQMi7O+1g=;
        b=lQ6VpvkkSkotGRLJ49JNAp6Amwch7/TGOMR/G7XenmvR/bBt3m0S6PollK5QtKK8W3
         RgMSJ/cN4M4tM/Km5GietSZG4HLuNFlAjriuCG8a+qLkFzz0ObHB4Xiy4GlCanJLm2A9
         65C0J+1KTRf2X2Vda6tYr21iFybIM7v6BGJGZtEFlLixlI2wrymVJcTq12PdDQI+8Fah
         q5cqmsCBlp5NLAui4CK1oiZjrwK1QqBnOhRxkuMHdjAve6AKBHnexwCCMJFIc7V1USSV
         ZKRIhh+FDpyJgQFyZPApjyEKaKR0/ynnoFrzxK/anOiednNqqlHqR9NJWe+ze1f4F1OI
         s5pA==
X-Gm-Message-State: AOJu0YydvYjZEP1GhGw4T4IawiPuc9wGHaErZ31aGwQuAiPodunYL2oz
	mtqb6w/R0/1b9K01yFBw3/VLxVFdlqZEy3iSYG0gukiTdG3EhRPEoEicD0KPuL3RrcbUejRUZNB
	wOxx4
X-Gm-Gg: ASbGncsUCySS+35nH5m3bbwYY3y+MU3VAlcUSaaw8VbRDJPD5XlxJ1vb5OPJUmebIU+
	/2tkJY5TQfzZ7VxK91pUS8ab96hl6a4EFkhZYeMPT+647Tp5RahxqAoIGoALDtqc4HcPx1jBA6m
	w6riJYtc0DF/xPb2d/QkY2xhSKEcWbOtlFTmXbhL+iyoPZwdnor4V1a4+FDoZPZksGPkj1TnIoY
	kWdGBCSv9TG8Q/9naRYNJcECQs5t511UGfWol2OwejSy/Gm0dIDP4Z3ctGYtU3S+4uPfgv/odCe
	8l76SlWmfUPyejcUaiu1GYToie6QW87DPAbGhmuUtQmLNs7/bAu1Nk+bnuDCni1vda9gz2T4gx6
	tTKPfrph8eTnjOxSHUwE=
X-Google-Smtp-Source: AGHT+IGXzgNihnHoIDZ49HYZOtoHdKkHpbangZQmlumpILsL+ggNAnIJfg1eVBtBYPorxJZCtPztZQ==
X-Received: by 2002:a05:6a21:6e4a:b0:1f3:194b:30ae with SMTP id adf61e73a8af0-2162188b7d7mr32339282637.1.1747846577248;
        Wed, 21 May 2025 09:56:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/2] x86/boot: attempt to print trace and panic on AP bring up stall
Date: Wed, 21 May 2025 18:55:04 +0200
Message-ID: <20250521165504.89885-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521165504.89885-1-roger.pau@citrix.com>
References: <20250521165504.89885-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the current AP bring up code Xen can get stuck indefinitely if an AP
freezes during boot after the 'callin' step.  Introduce a 10s timeout while
waiting for APs to finish startup.

On failure of an AP to complete startup send an NMI to trigger the printing
of a stack backtrace on the stuck AP and panic on the BSP.

The sending of the NMI re-uses the code already present in fatal_trap(), by
moving it to a separate function.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/smpboot.c               |  8 ++++
 xen/arch/x86/traps.c                 | 66 +++++++++++++++++-----------
 3 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index eacd425c5350..10d8078cc1ca 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -371,6 +371,7 @@ void show_registers(const struct cpu_user_regs *regs);
 #define dump_execution_state() run_in_exception_handler(show_execution_state)
 void show_page_walk(unsigned long addr);
 void noreturn fatal_trap(const struct cpu_user_regs *regs, bool show_remote);
+void show_execution_state_nmi(const cpumask_t *mask, bool show_all);
 
 extern void mtrr_ap_init(void);
 extern void mtrr_bp_init(void);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 48ce996ba414..77dce3e3e22b 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1370,6 +1370,7 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm)
 int __cpu_up(unsigned int cpu)
 {
     int apicid, ret;
+    s_time_t start;
 
     if ( (apicid = x86_cpu_to_apicid[cpu]) == BAD_APICID )
         return -ENODEV;
@@ -1388,10 +1389,17 @@ int __cpu_up(unsigned int cpu)
     time_latch_stamps();
 
     set_cpu_state(CPU_STATE_ONLINE);
+    start = NOW();
     while ( !cpu_online(cpu) )
     {
         cpu_relax();
         process_pending_softirqs();
+        if ( NOW() > start + SECONDS(10) )
+        {
+            /* AP is stuck, send NMI and panic. */
+            show_execution_state_nmi(cpumask_of(cpu), true);
+            panic("CPU%u: Stuck while starting up\n", cpu);
+        }
     }
 
     return 0;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index c94779b4ad4f..9b9e3726e2fb 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -714,13 +714,15 @@ static cpumask_t show_state_mask;
 static bool opt_show_all;
 boolean_param("async-show-all", opt_show_all);
 
+static bool force_show_all;
+
 static int cf_check nmi_show_execution_state(
     const struct cpu_user_regs *regs, int cpu)
 {
     if ( !cpumask_test_cpu(cpu, &show_state_mask) )
         return 0;
 
-    if ( opt_show_all )
+    if ( opt_show_all || force_show_all )
         show_execution_state(regs);
     else if ( guest_mode(regs) )
         printk(XENLOG_ERR "CPU%d\t%pv\t%04x:%p in guest\n",
@@ -734,6 +736,40 @@ static int cf_check nmi_show_execution_state(
     return 1;
 }
 
+void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
+{
+    unsigned int msecs, pending;
+
+    force_show_all = show_all;
+
+    watchdog_disable();
+    console_start_sync();
+
+    cpumask_copy(&show_state_mask, mask);
+    set_nmi_callback(nmi_show_execution_state);
+    /* Ensure new callback is set before sending out the NMI. */
+    smp_wmb();
+    send_IPI_mask(mask, APIC_DM_NMI);
+
+    /* Wait at most 10ms for some other CPU to respond. */
+    msecs = 10;
+    pending = cpumask_weight(&show_state_mask);
+    while ( pending && msecs-- )
+    {
+        unsigned int left;
+
+        mdelay(1);
+        left = cpumask_weight(&show_state_mask);
+        if ( left < pending )
+        {
+            pending = left;
+            msecs = 10;
+        }
+    }
+    if ( pending )
+        printk("Non-responding CPUs: {%*pbl}\n", CPUMASK_PR(&show_state_mask));
+}
+
 const char *vector_name(unsigned int vec)
 {
     static const char names[][4] = {
@@ -780,33 +816,11 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
 
         if ( show_remote )
         {
-            unsigned int msecs, pending;
+            cpumask_t *scratch = this_cpu(scratch_cpumask);
 
-            cpumask_andnot(&show_state_mask, &cpu_online_map,
+            cpumask_andnot(scratch, &cpu_online_map,
                            cpumask_of(smp_processor_id()));
-            set_nmi_callback(nmi_show_execution_state);
-            /* Ensure new callback is set before sending out the NMI. */
-            smp_wmb();
-            smp_send_nmi_allbutself();
-
-            /* Wait at most 10ms for some other CPU to respond. */
-            msecs = 10;
-            pending = cpumask_weight(&show_state_mask);
-            while ( pending && msecs-- )
-            {
-                unsigned int left;
-
-                mdelay(1);
-                left = cpumask_weight(&show_state_mask);
-                if ( left < pending )
-                {
-                    pending = left;
-                    msecs = 10;
-                }
-            }
-            if ( pending )
-                printk("Non-responding CPUs: {%*pbl}\n",
-                       CPUMASK_PR(&show_state_mask));
+            show_execution_state_nmi(scratch, false);
         }
     }
 
-- 
2.49.0


