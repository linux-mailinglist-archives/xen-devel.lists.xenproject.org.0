Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B4AC0640
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 09:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993102.1376573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lP-00076N-0p; Thu, 22 May 2025 07:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993102.1376573; Thu, 22 May 2025 07:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI0lO-00074F-Sj; Thu, 22 May 2025 07:54:50 +0000
Received: by outflank-mailman (input) for mailman id 993102;
 Thu, 22 May 2025 07:54:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI0lM-0006LU-MC
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 07:54:48 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07614e74-36e2-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 09:54:46 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so63606155e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 00:54:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f78aeb8csm93578185e9.28.2025.05.22.00.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 00:54:45 -0700 (PDT)
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
X-Inumbo-ID: 07614e74-36e2-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747900485; x=1748505285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzhHFn9O4oOU3Qn2JobHAp8hOeRtdX5BhB0MX7qBcDI=;
        b=LAQw2uPbrKsK3NSB3RJ3ZUi+NCN01DVBvZsKN0gXgKI/4rVNOMEsog5EUJP78qD2y+
         A8NvO+cCROEguh31ireqZKfmku7nPtqUaK6lt55J8BLsHqW+IM10nP9T/Xw6xjn3vQ8u
         wdq7PwkrOu59u1QAgjLnF28Yz0HrOKBScA3K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900485; x=1748505285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzhHFn9O4oOU3Qn2JobHAp8hOeRtdX5BhB0MX7qBcDI=;
        b=K6DKIx/uBfS0iIz/Bb7C58R5bmpxBXk0Ox/6jzP2c+zIROjtl6pBR2FoRk+GeiNErC
         TR7R1xqDD9WamWmUQAfIv+9Or8nWY+ubWIob+ponR5LLgvcUsDU3iDmj84zSgnDHSUI3
         MvgRj5AvFLHKXMF6tdVaqvTchtq53vYVeGGoC2qx4P/JLx6Hfs40ucTB+kEyWM1dasz+
         L3I1aKLVGJNd35Hj0kg9jPU7Sf8DCBQftseHxTlHGQWFi6rtbGxIs1oIUydn4cera03G
         2oDHzoSMtXZQI+cpBNTdVUen2DD3Vlw40in8VaRhiopEUDSp9D+RLm5HNOrFInRRkeJx
         ebYg==
X-Gm-Message-State: AOJu0Yxd4rWDjKGSsG61j9ReIk+vD6q3vJzXZIoWyaJqzMjgHn0exMU1
	KNavkaCeoxQawOcdwKTcW/tSBVVJWpNATdEqyOcGXttRymsnvkMhnHKNd/6hg0w27byHrp241OG
	/Mbwb
X-Gm-Gg: ASbGncui1J14wl/YKRnb4oPDhZpnX1TmQ07FIrrqDnmLzEDFmTEW2IHaBUwbHe6d9bC
	mTtQ320Q/h3IKLPDXkTw50U5RJlc1k99ZeO1LLAR7XU2UiJGmq6irIsCZv/gp/wsI2FbH2By6XU
	LYBGBCyqf/bD+Nuxm2/2YQj6HJpIvnTkCZvc31jGLycUzbZnIn03SvxVdKQ4GYguIOQAYGVtnRU
	lo7l3cIn8tpfdjHcfAXCERrHK2UR3rQR0QSL4jAGJH35rUiFminfTtm2vLkbfPEbXXT+O6cD+hw
	lNP91vgT563HDEh9IESN7T5RkC+agst93FiNIeKI4BH81ifQ0mNyJQDzS7EqCJlsWGjiRknCHq/
	AzMzurNeuv8+q4dkHA6E=
X-Google-Smtp-Source: AGHT+IG61P+oaIK9VJw8B2DaXk4AiHjU8pknx0c2hQqVWKmmd8kHow/r6+OtNqaQNz/VBb1nqJEi6g==
X-Received: by 2002:a05:600c:628c:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-442fd60a536mr247845445e9.3.1747900485527;
        Thu, 22 May 2025 00:54:45 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 3/4] x86/traps: split code to dump execution state to a separate helper
Date: Thu, 22 May 2025 09:54:39 +0200
Message-ID: <20250522075440.99882-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522075440.99882-1-roger.pau@citrix.com>
References: <20250522075440.99882-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that triggers remote CPUs to dump stacks into a separate
function.  Also introduce a parameter that can be set by the caller of the
newly introduced function to force CPUs to dump the full stack, rather than
just dumping the current function name.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/traps.c                 | 62 +++++++++++++++++-----------
 2 files changed, 39 insertions(+), 24 deletions(-)

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
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 22f20629327d..f6646d505644 100644
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
@@ -734,6 +736,38 @@ static int cf_check nmi_show_execution_state(
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
@@ -780,31 +814,11 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
 
         if ( show_remote )
         {
-            unsigned int msecs, pending;
+            cpumask_t *scratch = this_cpu(scratch_cpumask);
 
-            cpumask_andnot(&show_state_mask, &cpu_online_map,
+            cpumask_andnot(scratch, &cpu_online_map,
                            cpumask_of(smp_processor_id()));
-            set_nmi_callback(nmi_show_execution_state);
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


