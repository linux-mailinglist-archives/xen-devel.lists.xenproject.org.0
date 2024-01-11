Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CC182A85D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665931.1036266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpXk-0006nO-Tq; Thu, 11 Jan 2024 07:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665931.1036266; Thu, 11 Jan 2024 07:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpXk-0006ks-Qa; Thu, 11 Jan 2024 07:32:00 +0000
Received: by outflank-mailman (input) for mailman id 665931;
 Thu, 11 Jan 2024 07:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpXi-0006km-Tg
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:31:58 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 805b57fa-b053-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:31:57 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so4746911f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:31:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:31:57 -0800 (PST)
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
X-Inumbo-ID: 805b57fa-b053-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958317; x=1705563117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0ec8vWmu/5aIAhFU+GtuouuNHSKMP58o3QH8ANpxtGg=;
        b=I/KoAXKqYCLKRnuVh9/rtkg/KW4c/RHFFgfayPD1jSp0jPNk7spZhZpKBTVI8uqSYB
         6whUr8nKJBhnAdSJI4iELq/rdr4i3Rn0q0UmsADkUO5XO1e2ScdOaxo2hRidXFJtVZOi
         5pb6qZStGvrMNHJTGV0I4T/SfNi7dqqst8+7Bc1HOkzDkTfxPmS1DM2/WRLc56KU3VEC
         u+twnmqSFiPUWF/vtdI5C+bF+LtbiBUq4+/+YxRAHRrIb4+8Katp1EwierzRDXtPB1Uz
         //Xu1X0HJFx9fLhLjuaJsUKml+sZSmZHPGwfFD586bJaA9oNuzEBqSpMc96tMMsSydYZ
         M4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958317; x=1705563117;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ec8vWmu/5aIAhFU+GtuouuNHSKMP58o3QH8ANpxtGg=;
        b=AOfMA8KE83RQeyx2v8aW8YPrmAitod+2iJDCvPrCS0JrFa8LbInD/rwq3EsAgPatMV
         ZhVauNNkeXlOzcZa034jpDfI0FQIjn4D/E5Kn49HJDRMoJxBdVUJ9lEOWzdkH+U3keNJ
         W59wYkCNJvNzR7ZZ6QOlZ/m+rLHsf3zfPkB2QGTI0jImja9T0HrxfFHxhw9nmX8wpKvQ
         Z3BLvuN0kXE/CxvsPC0hl+MgemqD18wQ/sCYQUXbRd1EEPsgsjxOPgBsbPoDR/vCypD5
         EpW4+AVfSdXTMQkmA7AB42Kdrz/x40zspeRNcIox6VqoiFwXiCxohCM2eRWQCorbv2Qv
         x45g==
X-Gm-Message-State: AOJu0Yx5vQOlyCKrW1C72JvdYmWqDRr47mw001jXR5ihxBS3vsJPnXQc
	GCwv4Y0Q+fp7AdH3ArqOSE7v4GrtiVgXkSbdbBxnWxRheg==
X-Google-Smtp-Source: AGHT+IGhgxIDgO87l4RjWlKzB5FKF5WI1Cp6iqB39lTenwigtQLspP79tdMvxU216jd8w1rdt2tonQ==
X-Received: by 2002:adf:e612:0:b0:32d:cd02:d4f3 with SMTP id p18-20020adfe612000000b0032dcd02d4f3mr149688wrm.40.1704958317480;
        Wed, 10 Jan 2024 23:31:57 -0800 (PST)
Message-ID: <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
Date: Thu, 11 Jan 2024 08:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There are exactly two handlers which care about the registers. Have
handle_keypress() make the pointer available via a per-CPU variable,
thus eliminating the need to pass it to all IRQ key handlers, making
sure that a console-invoked key's handling can still nest inside a
sysctl-invoked one's.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently we may want to eliminate the fn/irq_fn union as well,
along with dropping the now redundant irq_keyhandler_fn_t.

--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -80,6 +80,7 @@ static void cf_check keypress_action(voi
 }
 
 static DECLARE_TASKLET(keypress_tasklet, keypress_action, NULL);
+static DEFINE_PER_CPU(struct cpu_user_regs *, keypress_regs);
 
 void handle_keypress(unsigned char key, struct cpu_user_regs *regs)
 {
@@ -91,7 +92,16 @@ void handle_keypress(unsigned char key,
     if ( !in_irq() || h->irq_callback )
     {
         console_start_log_everything();
-        h->irq_callback ? h->irq_fn(key, regs) : h->fn(key);
+        if ( h->irq_callback )
+        {
+            struct cpu_user_regs *old = this_cpu(keypress_regs);
+
+            this_cpu(keypress_regs) = regs;
+            h->irq_fn(key);
+            this_cpu(keypress_regs) = old;
+        }
+        else
+            h->fn(key);
         console_end_log_everything();
     }
     else
@@ -171,8 +181,7 @@ void cf_check dump_execstate(struct cpu_
     watchdog_enable();
 }
 
-static void cf_check dump_registers(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check dump_registers(unsigned char key)
 {
     unsigned int cpu;
 
@@ -185,8 +194,8 @@ static void cf_check dump_registers(
     cpumask_copy(&dump_execstate_mask, &cpu_online_map);
 
     /* Get local execution state out immediately, in case we get stuck. */
-    if ( regs )
-        dump_execstate(regs);
+    if ( this_cpu(keypress_regs) )
+        dump_execstate(this_cpu(keypress_regs));
     else
         run_in_exception_handler(dump_execstate);
 
@@ -248,8 +257,7 @@ static void cf_check dump_hwdom_register
     }
 }
 
-static void cf_check reboot_machine(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check reboot_machine(unsigned char key)
 {
     printk("'%c' pressed -> rebooting machine\n", key);
     machine_restart(0);
@@ -477,8 +485,7 @@ static void cf_check run_all_nonirq_keyh
 static DECLARE_TASKLET(run_all_keyhandlers_tasklet,
                        run_all_nonirq_keyhandlers, NULL);
 
-static void cf_check run_all_keyhandlers(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check run_all_keyhandlers(unsigned char key)
 {
     struct keyhandler *h;
     unsigned int k;
@@ -494,7 +501,7 @@ static void cf_check run_all_keyhandlers
         if ( !h->irq_fn || !h->diagnostic || !h->irq_callback )
             continue;
         printk("[%c: %s]\n", k, h->desc);
-        h->irq_fn(k, regs);
+        h->irq_fn(k);
     }
 
     watchdog_enable();
@@ -511,17 +518,16 @@ static void cf_check do_debugger_trap_fa
     barrier();
 }
 
-static void cf_check do_debug_key(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_debug_key(unsigned char key)
 {
     printk("'%c' pressed -> trapping into debugger\n", key);
-    if ( regs )
-        do_debugger_trap_fatal(regs);
+    if ( this_cpu(keypress_regs) )
+        do_debugger_trap_fatal(this_cpu(keypress_regs));
     else
         run_in_exception_handler(do_debugger_trap_fatal);
 }
 
-static void cf_check do_toggle_alt_key(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_alt_key(unsigned char key)
 {
     alt_key_handling = !alt_key_handling;
     printk("'%c' pressed -> using %s key handling\n", key,
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -280,7 +280,7 @@ static int *__read_mostly upper_thresh_a
 static int *__read_mostly lower_thresh_adj = &xenlog_lower_thresh;
 static const char *__read_mostly thresh_adj = "standard";
 
-static void cf_check do_toggle_guest(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_guest(unsigned char key)
 {
     if ( upper_thresh_adj == &xenlog_upper_thresh )
     {
@@ -307,13 +307,13 @@ static void do_adj_thresh(unsigned char
            loglvl_str(*upper_thresh_adj));
 }
 
-static void cf_check do_inc_thresh(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_inc_thresh(unsigned char key)
 {
     ++*lower_thresh_adj;
     do_adj_thresh(key);
 }
 
-static void cf_check do_dec_thresh(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_dec_thresh(unsigned char key)
 {
     if ( *lower_thresh_adj )
         --*lower_thresh_adj;
--- a/xen/include/xen/keyhandler.h
+++ b/xen/include/xen/keyhandler.h
@@ -24,9 +24,7 @@ typedef void (keyhandler_fn_t)(unsigned
  *
  * Called in hardirq context with interrupts disabled.
  */
-struct cpu_user_regs;
-typedef void (irq_keyhandler_fn_t)(unsigned char key,
-                                   struct cpu_user_regs *regs);
+typedef void irq_keyhandler_fn_t(unsigned char key);
 
 /* Initialize keytable with default handlers. */
 void initialize_keytable(void);
@@ -46,6 +44,7 @@ void register_irq_keyhandler(unsigned ch
                              bool diagnostic);
 
 /* Inject a keypress into the key-handling subsystem. */
+struct cpu_user_regs;
 extern void handle_keypress(unsigned char key, struct cpu_user_regs *regs);
 
 enum crash_reason {


