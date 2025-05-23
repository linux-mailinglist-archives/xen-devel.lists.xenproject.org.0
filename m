Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E4AC1E8F
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 10:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995380.1377835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINfe-0003MM-4K; Fri, 23 May 2025 08:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995380.1377835; Fri, 23 May 2025 08:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uINfe-0003EU-0h; Fri, 23 May 2025 08:22:26 +0000
Received: by outflank-mailman (input) for mailman id 995380;
 Fri, 23 May 2025 08:22:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSxL=YH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uINfd-0003CJ-3G
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 08:22:25 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e303ee5-37af-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 10:22:24 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso68743475e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 01:22:24 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f3dd99f9sm131732165e9.40.2025.05.23.01.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 01:22:23 -0700 (PDT)
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
X-Inumbo-ID: 0e303ee5-37af-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747988544; x=1748593344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9OhwSh2sFBPinPT7yDdzAD3rTaDbrlVbBuLtIBte3k=;
        b=ceLdLcdf1ycaNA83FNfFso/brLkJPC71VSciLYuaDbdF8FNap5lfx8uxk2ikgjeU84
         N3JydetGlK8O5KLxznxVBtm0VdTG23LNkwY60Pz/lZDbSf3qpSKJWtnpdYKUw8SGZxJt
         9h+lmborOXtB2JqGSuoSoN+wNlYCGx4FzEfo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988544; x=1748593344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9OhwSh2sFBPinPT7yDdzAD3rTaDbrlVbBuLtIBte3k=;
        b=nqIuMwWo2J/r4q6r1HINXwLn8/GKNcWc+40tPxSy8o/PicP5U6AfEoGgejidEvtwtM
         y8Fyt/9zE+ziWEQsQRtPO91qveGzmUYpWjq0ACLJLd/jyKqjRIQkHCfM3slJCeodzgsF
         8nm6J/idKnerdOe113UCF0b/fCfHqaqbxQmRxqHgWSi/3VvTJDTO8YYL6/xHFpvP6vIH
         P8hAiHGgNEYKmv66tgOS/tDlnS0y3friX2KqF29YFf0w5Ev4TL+DWep1iKgLnZ2MYTuY
         hRTgJAHN7kuLc4UX9LbTvnpgCP1dEMCKVhWoUffoGS1rCkKjGl7kh/EoBM/sL+hXrpRD
         ALnA==
X-Gm-Message-State: AOJu0Yz4Y8Nv5/4yc6Fo6/gc1mgjXdvrZbHfxI3qn66kVofywSHVjE+Z
	MZuybqdwR4j4P0aiExqAZZcxuvau77F/u13a0MxFho6FYhXWVQJLHdOJMZft9xz9EqUG3gZlGBX
	4xA/p
X-Gm-Gg: ASbGncvi0sQ+JzfXhg2sul2svTtYZdk1U4+aFQWYHN4oafBXOZvMZkU2vGtmrb8XsHw
	5EIx8O4mY1hIgSE913ujLBaDvCtQVdla8AxDRHtEoz1AcvhVazw6cc2MML6WxnaXSJDWC/UpsSx
	MxHpskf0L21x3t/9gJrfTP7wLN/fB5SDTS7AZ6rSmRLVfmDCYlBvsbzRTRptbaa5MfJYUYEPFFw
	1ssPSvfr6TUQz4BQTyUJ7CpoaUIgBESt9KGRWz6fPf6DRzCKcf7k02pDJUXz9M6mFmfvEpIeoUT
	iEcebj/01MNMRrOUJ6g6C2PndnShlZzjGCDLNPKglmrAV8i58A9qpnVz9r8Lz9vTUbTNOfF0aDJ
	djIa09Ned3d7zRP4kpu8=
X-Google-Smtp-Source: AGHT+IENE8YAu5CgQBp8ad8E9VUooRZ67jjAeumiY9NWwvm4KNgrBaatHEO+EhUp5AHbWMiYfXkIsg==
X-Received: by 2002:a05:600c:a378:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-442fd64e32amr260346245e9.18.1747988543765;
        Fri, 23 May 2025 01:22:23 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/3] x86/traps: split code to dump execution state to a separate helper
Date: Fri, 23 May 2025 10:21:34 +0200
Message-ID: <20250523082135.18088-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523082135.18088-1-roger.pau@citrix.com>
References: <20250523082135.18088-1-roger.pau@citrix.com>
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
Changes since v2:
 - Use parameter opt_show_all variable.
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/arch/x86/traps.c                 | 63 ++++++++++++++++++----------
 2 files changed, 41 insertions(+), 23 deletions(-)

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
index 22f20629327d..559bb1d2029b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -734,6 +734,43 @@ static int cf_check nmi_show_execution_state(
     return 1;
 }
 
+void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
+{
+    unsigned int msecs, pending;
+
+    /*
+     * Overwrite the global variable, caller is expected to panic after having
+     * dumped the execution state.
+     */
+    if ( show_all )
+        opt_show_all = true;
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
@@ -780,31 +817,11 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
 
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


