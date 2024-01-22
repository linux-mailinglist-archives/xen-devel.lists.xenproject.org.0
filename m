Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2368364BE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669920.1042466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRug3-0002Lo-Bx; Mon, 22 Jan 2024 13:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669920.1042466; Mon, 22 Jan 2024 13:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRug3-0002JH-8R; Mon, 22 Jan 2024 13:49:27 +0000
Received: by outflank-mailman (input) for mailman id 669920;
 Mon, 22 Jan 2024 13:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRug1-0007Lx-FT
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:49:25 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cf04a59-b92d-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:49:23 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cd880ceaf2so34543561fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:49:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a05663849cd00b0046e627dbc4csm3035114jab.121.2024.01.22.05.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:49:22 -0800 (PST)
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
X-Inumbo-ID: 0cf04a59-b92d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705931363; x=1706536163; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro3tacV+Cx2+fVIZpZoKa/X2F9kQbo9bRfxSzAFGBaM=;
        b=eEeR5Q8k0zH+TxAn28OQbOUSx5MVJPKHjFWez0XZGTUZ/oAETTlqJguTaHz23d9qqJ
         4CpNWg+wGAo0FsIgcd31Cw000mpOzpJARJlvF5NIhn9SaTzZKkh//zMtcOqOxzkLXxqf
         lFidsM35nUQQK4W+yA1fmrI50aqFvYrHHaqX34CYVvuBr3X84STQeaLdxee4IPpfirDh
         9F5d5GTnXUVPsx22gFQv2Tj0TpOjTALBftPa7yIZfUb9U2d/sPtMMHSvI858PPOz4+UG
         po5mXT6m8cpTOK3XRpv17mjK/lAMzdshUsqjoUBKKzjaS3caeqzayq1qOiYar+/L9h1V
         RTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931363; x=1706536163;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ro3tacV+Cx2+fVIZpZoKa/X2F9kQbo9bRfxSzAFGBaM=;
        b=ckw8htldl1QgQ7gfVgbgcsCqUEyXftCH50vQZI/wStqJDgusuOooT0nFUUYfG77+aO
         xiXW4D+JUUWI1lgodMpYs0NExlliHSNNZCRdovxseLjigwDDwvhtqrszh+y8UWr7S12P
         462MhUuO9BLarks/tGdb0IGsEghJgQqJtJ9loHeqLORa3pKPg8i1XBNAOhodizy6Tdtv
         RSmvdHw8AcYHSq/XRhYsuRp7BWz/3pgS3MZw+uRZgGUZzZsptRceVahspNgG0OPs7Qz6
         VWqoTyIbucXQy4spuX32LJhfZhWJ7yThZGXp+xlt3gzJxrCcz0hOUp+X6MQnxYobpPXY
         RscQ==
X-Gm-Message-State: AOJu0YweoOyHPrWF7lcGzhIBj3ZQWSiQuPDr/rVEB+sU37tYdZBE8LqY
	ASkUoEF77QH+h+qMGPodUvQUZgHZ3SVIWSMWobhlRaT4kH/Pne9Mik+BpsHb+pLBhe9Xb5PY8zw
	=
X-Google-Smtp-Source: AGHT+IHL1dfd46V/LaVagjznxYEfU6kkJwJnBT3ES4IVsZM41AhQHWRiwerW0sYtTUXVhzG2lMIaZA==
X-Received: by 2002:a2e:a54e:0:b0:2cc:c6e0:fbb with SMTP id e14-20020a2ea54e000000b002ccc6e00fbbmr2264172ljn.20.1705931363314;
        Mon, 22 Jan 2024 05:49:23 -0800 (PST)
Message-ID: <34fba5ac-84e2-477f-8333-afd39c54ad71@suse.com>
Date: Mon, 22 Jan 2024 14:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/8] keyhandler: drop regs parameter from handle_keyregs()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
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
In-Reply-To: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation for further removal of regs parameters, drop it here. In
the two places where it's actually needed, retrieve IRQ context if
available, or else guest context.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As an alternative to the new boolean parameter, I wonder if we couldn't
special-case the idle vCPU case: It's only there where we would not have
proper context retrievable via guest_cpu_user_regs().
---
v2: New.

--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -76,12 +76,12 @@ static struct keyhandler {
 
 static void cf_check keypress_action(void *unused)
 {
-    handle_keypress(keypress_key, NULL);
+    handle_keypress(keypress_key, true);
 }
 
 static DECLARE_TASKLET(keypress_tasklet, keypress_action, NULL);
 
-void handle_keypress(unsigned char key, struct cpu_user_regs *regs)
+void handle_keypress(unsigned char key, bool need_context)
 {
     struct keyhandler *h;
 
@@ -91,7 +91,7 @@ void handle_keypress(unsigned char key,
     if ( !in_irq() || h->irq_callback )
     {
         console_start_log_everything();
-        h->irq_callback ? h->irq_fn(key, regs) : h->fn(key);
+        h->irq_callback ? h->irq_fn(key, need_context) : h->fn(key);
         console_end_log_everything();
     }
     else
@@ -172,7 +172,7 @@ void cf_check dump_execstate(struct cpu_
 }
 
 static void cf_check dump_registers(
-    unsigned char key, struct cpu_user_regs *regs)
+    unsigned char key, bool need_context)
 {
     unsigned int cpu;
 
@@ -185,8 +185,8 @@ static void cf_check dump_registers(
     cpumask_copy(&dump_execstate_mask, &cpu_online_map);
 
     /* Get local execution state out immediately, in case we get stuck. */
-    if ( regs )
-        dump_execstate(regs);
+    if ( !need_context )
+        dump_execstate(get_irq_regs() ?: guest_cpu_user_regs());
     else
         run_in_exception_handler(dump_execstate);
 
@@ -248,8 +248,7 @@ static void cf_check dump_hwdom_register
     }
 }
 
-static void cf_check reboot_machine(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check reboot_machine(unsigned char key, bool unused)
 {
     printk("'%c' pressed -> rebooting machine\n", key);
     machine_restart(0);
@@ -477,8 +476,7 @@ static void cf_check run_all_nonirq_keyh
 static DECLARE_TASKLET(run_all_keyhandlers_tasklet,
                        run_all_nonirq_keyhandlers, NULL);
 
-static void cf_check run_all_keyhandlers(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check run_all_keyhandlers(unsigned char key, bool need_context)
 {
     struct keyhandler *h;
     unsigned int k;
@@ -494,7 +492,7 @@ static void cf_check run_all_keyhandlers
         if ( !h->irq_fn || !h->diagnostic || !h->irq_callback )
             continue;
         printk("[%c: %s]\n", k, h->desc);
-        h->irq_fn(k, regs);
+        h->irq_fn(k, need_context);
     }
 
     watchdog_enable();
@@ -511,17 +509,16 @@ static void cf_check do_debugger_trap_fa
     barrier();
 }
 
-static void cf_check do_debug_key(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_debug_key(unsigned char key, bool need_context)
 {
     printk("'%c' pressed -> trapping into debugger\n", key);
-    if ( regs )
-        do_debugger_trap_fatal(regs);
+    if ( !need_context )
+        do_debugger_trap_fatal(get_irq_regs() ?: guest_cpu_user_regs());
     else
         run_in_exception_handler(do_debugger_trap_fatal);
 }
 
-static void cf_check do_toggle_alt_key(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_alt_key(unsigned char key, bool unused)
 {
     alt_key_handling = !alt_key_handling;
     printk("'%c' pressed -> using %s key handling\n", key,
@@ -586,7 +583,7 @@ void keyhandler_crash_action(enum crash_
         if ( *action == '+' )
             mdelay(10);
         else
-            handle_keypress(*action, NULL);
+            handle_keypress(*action, true);
         action++;
     }
 }
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -134,7 +134,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xe
         {
             if ( copy_from_guest_offset(&c, op->u.debug_keys.keys, i, 1) )
                 goto out;
-            handle_keypress(c, guest_cpu_user_regs());
+            handle_keypress(c, false);
         }
         ret = 0;
         copyback = 0;
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -280,7 +280,7 @@ static int *__read_mostly upper_thresh_a
 static int *__read_mostly lower_thresh_adj = &xenlog_lower_thresh;
 static const char *__read_mostly thresh_adj = "standard";
 
-static void cf_check do_toggle_guest(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_guest(unsigned char key, bool unused)
 {
     if ( upper_thresh_adj == &xenlog_upper_thresh )
     {
@@ -307,13 +307,13 @@ static void do_adj_thresh(unsigned char
            loglvl_str(*upper_thresh_adj));
 }
 
-static void cf_check do_inc_thresh(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_inc_thresh(unsigned char key, bool unused)
 {
     ++*lower_thresh_adj;
     do_adj_thresh(key);
 }
 
-static void cf_check do_dec_thresh(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_dec_thresh(unsigned char key, bool unused)
 {
     if ( *lower_thresh_adj )
         --*lower_thresh_adj;
@@ -532,7 +532,7 @@ static void __serial_rx(char c, struct c
     switch ( console_rx )
     {
     case 0:
-        return handle_keypress(c, regs);
+        return handle_keypress(c, false);
 
     case 1:
         /*
--- a/xen/include/xen/keyhandler.h
+++ b/xen/include/xen/keyhandler.h
@@ -24,9 +24,8 @@ typedef void (keyhandler_fn_t)(unsigned
  *
  * Called in hardirq context with interrupts disabled.
  */
-struct cpu_user_regs;
 typedef void (irq_keyhandler_fn_t)(unsigned char key,
-                                   struct cpu_user_regs *regs);
+                                   bool need_context);
 
 /* Initialize keytable with default handlers. */
 void initialize_keytable(void);
@@ -46,7 +45,7 @@ void register_irq_keyhandler(unsigned ch
                              bool diagnostic);
 
 /* Inject a keypress into the key-handling subsystem. */
-extern void handle_keypress(unsigned char key, struct cpu_user_regs *regs);
+extern void handle_keypress(unsigned char key, bool need_context);
 
 enum crash_reason {
     CRASHREASON_PANIC,


