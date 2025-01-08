Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B16FA05EA4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867317.1278801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4k-00066l-7p; Wed, 08 Jan 2025 14:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867317.1278801; Wed, 08 Jan 2025 14:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVX4k-00064Y-4F; Wed, 08 Jan 2025 14:30:26 +0000
Received: by outflank-mailman (input) for mailman id 867317;
 Wed, 08 Jan 2025 14:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4i-0005q4-Fv
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:24 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18164900-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:22 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso28527767a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:22 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806fedbc5sm26174702a12.60.2025.01.08.06.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:21 -0800 (PST)
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
X-Inumbo-ID: 18164900-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346622; x=1736951422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnNXiTCnO2oI7NIqZptnHGJdzylt9AXPh1CWa13TEiA=;
        b=FC7QP65mjEy1fJdcsJMrafQN8ioREVGHQIv5ax2znGKCGVzECKEq0oJPgw5qoaowod
         I3+NyutkfUuAR+O/lVql8qsC1uPcx340b0MbkrESIqkij9nhfhJNgs+cHgnDokpBxrqI
         KZbQW1ImSZG2PM9t+xD2KousOHAUmxkwu6iZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346622; x=1736951422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnNXiTCnO2oI7NIqZptnHGJdzylt9AXPh1CWa13TEiA=;
        b=kZugjbZTIKoxzDG4qqvF8vTCz7TIbj+Hh+C6qQwt/GmUGaJa/bSFmHW4lNXhPi5J5I
         /hZbs6iKMFLIRelIz6/ImE91nUDNwzx6A40v0b3b/eOFmSmJwwb2+WX2ZKgYlc2qRCac
         67K6fiu1Jy5Zz5mTC2kURmXtexA6oDEQU3DoOAnnBOQDeqHN2rREhxslxibC0jmNtOWH
         QnnDZLnt7QtdrhjSVkZx0nIWB9T76jD6cuQxxOk8XLx31uBEgmHGtElvbWZN1APAU7Kw
         nXXHCrqFV319uFYvMBUM0oG9ZQ3q9Gb04MHufBUnaOH6YNcLSQqpDGKlXpBw/CDUrqL0
         Brwg==
X-Gm-Message-State: AOJu0YxPsuTh8gmni87I/N0Qvq/kQpJd67dyA168r2u5wjnoSZQopasE
	7szyWyd+p+eA8g9i8xHgCyMSBuMy57Od4tmTNJDkZrm3ipGzQnCIVxRZLmSGGL5XXh5V1ug/wjz
	j
X-Gm-Gg: ASbGnct8giAIyd9MwpbWtFjYy1jaRXbWBr7BRe7UjvWYA7/VI9UpkaQ8XxtpI+DZGWP
	jXWVhNMC5aaVFwAzhuyT2tp1Sv6bG3nmDNkTKTQEnGVdbVGPq9WDm6a3Hvrgu0asm9MC66g6etO
	klY2BXh+XbqA0BumzmyNm8jGxZ52ViG8p1RkV6kYsL+EJbdoiW4eRCis9tHsDuFnkiPOliGcNd/
	JDOmF4FvSepBrzsO0j7E9bJVRdhQLQTjeXcI3DIaj+CEbNb59RZUnjcsN75uQ5iyZ4=
X-Google-Smtp-Source: AGHT+IGa3LmhX/D9qTWm6MbvyZnXvkrTaVWZCrfqraIRjPTXr6wQWOSJ3Tvv9PwmOh1fQtJcwh+aJg==
X-Received: by 2002:a05:6402:26d3:b0:5d9:a59:854a with SMTP id 4fb4d7f45d1cf-5d972e07f98mr2912632a12.13.1736346621921;
        Wed, 08 Jan 2025 06:30:21 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 02/18] x86/domain: limit window where curr_vcpu != current on context switch
Date: Wed,  8 Jan 2025 15:26:42 +0100
Message-ID: <20250108142659.99490-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On x86 Xen will perform lazy context switches to the idle vCPU, where the
previously running vCPU context is not overwritten, and only current is updated
to point to the idle vCPU.  The state is then disjunct between current and
curr_vcpu: current points to the idle vCPU, while curr_vcpu points to the vCPU
whose context is loaded on the pCPU.

While on that lazy context switched state, certain calls (like
map_domain_page()) will trigger a full synchronization of the pCPU state by
forcing a context switch.  Note however how calling any of such functions
inside the context switch code itself is very likely to trigger an infinite
recursion loop.

Attempt to limit the window where curr_vcpu != current in the context switch
code, as to prevent and infinite recursion loop around sync_local_execstate().

This is required for using map_domain_page() in the vCPU context switch code,
otherwise using map_domain_page() in that context ends up in a recursive
sync_local_execstate() loop:

map_domain_page() -> sync_local_execstate() -> map_domain_page() -> ...

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/domain.c | 58 +++++++++++++++++++++++++++++++++++--------
 xen/arch/x86/traps.c  |  2 --
 2 files changed, 48 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 78a13e6812c9..1f680bf176ee 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1982,16 +1982,16 @@ static void load_default_gdt(unsigned int cpu)
     per_cpu(full_gdt_loaded, cpu) = false;
 }
 
-static void __context_switch(void)
+static void __context_switch(struct vcpu *n)
 {
     struct cpu_user_regs *stack_regs = guest_cpu_user_regs();
     unsigned int          cpu = smp_processor_id();
     struct vcpu          *p = per_cpu(curr_vcpu, cpu);
-    struct vcpu          *n = current;
     struct domain        *pd = p->domain, *nd = n->domain;
 
     ASSERT(p != n);
     ASSERT(!vcpu_cpu_dirty(n));
+    ASSERT(p == current);
 
     if ( !is_idle_domain(pd) )
     {
@@ -2036,6 +2036,18 @@ static void __context_switch(void)
 
     write_ptbase(n);
 
+    /*
+     * It's relevant to set both current and curr_vcpu back-to-back, to avoid a
+     * window where calls to mapcache_current_vcpu() during the context switch
+     * could trigger a recursive loop.
+     *
+     * Do the current switch immediately after switching to the new guest
+     * page-tables, so that current is (almost) always in sync with the
+     * currently loaded page-tables.
+     */
+    set_current(n);
+    per_cpu(curr_vcpu, cpu) = n;
+
 #ifdef CONFIG_PV
     /* Prefetch the VMCB if we expect to use it later in the context switch */
     if ( using_svm() && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
@@ -2048,8 +2060,6 @@ static void __context_switch(void)
     if ( pd != nd )
         cpumask_clear_cpu(cpu, pd->dirty_cpumask);
     write_atomic(&p->dirty_cpu, VCPU_CPU_CLEAN);
-
-    per_cpu(curr_vcpu, cpu) = n;
 }
 
 void context_switch(struct vcpu *prev, struct vcpu *next)
@@ -2081,16 +2091,36 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
 
     local_irq_disable();
 
-    set_current(next);
-
     if ( (per_cpu(curr_vcpu, cpu) == next) ||
          (is_idle_domain(nextd) && cpu_online(cpu)) )
     {
+        /*
+         * Lazy context switch to the idle vCPU, set current == idle.  Full
+         * context switch happens if/when sync_local_execstate() is called.
+         */
+        set_current(next);
         local_irq_enable();
     }
     else
     {
-        __context_switch();
+        /*
+         * curr_vcpu will always point to the currently loaded vCPU context, as
+         * it's not updated when doing a lazy switch to the idle vCPU.
+         */
+        struct vcpu *prev_ctx = per_cpu(curr_vcpu, cpu);
+
+        if ( prev_ctx != current )
+        {
+            /*
+             * Doing a full context switch to a non-idle vCPU from a lazy
+             * context switched state.  Adjust current to point to the
+             * currently loaded vCPU context.
+             */
+            ASSERT(current == idle_vcpu[cpu]);
+            ASSERT(!is_idle_vcpu(next));
+            set_current(prev_ctx);
+        }
+        __context_switch(next);
 
         /* Re-enable interrupts before restoring state which may fault. */
         local_irq_enable();
@@ -2156,15 +2186,23 @@ int __sync_local_execstate(void)
 {
     unsigned long flags;
     int switch_required;
+    unsigned int cpu = smp_processor_id();
+    struct vcpu *p;
 
     local_irq_save(flags);
 
-    switch_required = (this_cpu(curr_vcpu) != current);
+    p = per_cpu(curr_vcpu, cpu);
+    switch_required = (p != current);
 
     if ( switch_required )
     {
-        ASSERT(current == idle_vcpu[smp_processor_id()]);
-        __context_switch();
+        ASSERT(current == idle_vcpu[cpu]);
+        /*
+         * Restore current to the previously running vCPU, __context_switch()
+         * will update current together with curr_vcpu.
+         */
+        set_current(p);
+        __context_switch(idle_vcpu[cpu]);
     }
 
     local_irq_restore(flags);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 87b30ce4df2a..487b8c5a78c5 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2232,8 +2232,6 @@ void __init trap_init(void)
 
 void activate_debugregs(const struct vcpu *curr)
 {
-    ASSERT(curr == current);
-
     write_debugreg(0, curr->arch.dr[0]);
     write_debugreg(1, curr->arch.dr[1]);
     write_debugreg(2, curr->arch.dr[2]);
-- 
2.46.0


