Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E6885B5F4
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683262.1062709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLsF-0002i8-8s; Tue, 20 Feb 2024 08:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683262.1062709; Tue, 20 Feb 2024 08:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLsF-0002g0-63; Tue, 20 Feb 2024 08:53:11 +0000
Received: by outflank-mailman (input) for mailman id 683262;
 Tue, 20 Feb 2024 08:53:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLsD-0002dz-DP
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:53:09 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7785ecbe-cfcd-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:53:07 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d568fbf62so836196f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:53:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:53:06 -0800 (PST)
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
X-Inumbo-ID: 7785ecbe-cfcd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419187; x=1709023987; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r6p6O9Is+mZ3Yah69zqykHr7kyUZhreWLXWu9KFJdS8=;
        b=ZwBgJeQGpqX0OtIPWHS+bbvDztCAt56suCEN8s7ALpN6K+25XNRcKgsMsJpe18TxT5
         995Ho4xLTJ9actib/LxOcRHNAXbarlLdfNFgaHLAN+fTB4801hAFO2WHZ6zZoFiWIyeY
         xaTBeOtDLSgH72JrYs1AVwJH41bvXCcj8SrZEvtV5Dr7/zKmgMVdRsWP7SwspYcjMTA9
         8aGsB04AfnJBEbto3twRCRSc/iSDSdjkktcLwgEbUaIByzE1KtRqpBe2uUv+gyHjdnmw
         cjDvljO5nEgiiS//tGewBa4M+F+E5R+MHiRXZJkJ2f1M5hjgzgyCkLxFP3EewK2s6Bs4
         bbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419187; x=1709023987;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6p6O9Is+mZ3Yah69zqykHr7kyUZhreWLXWu9KFJdS8=;
        b=oUSRWcCl1qPEgw7LANI3N2rdM9bhgjjnykoUqhA4MJYOjTrp/SQZDgOe1PjzR2Q1YC
         tdUIZ3IXkIYtxZ6q6tAv/CqTnXMalYmT3mTx1qRb0gRmfvuBjOWm8CCRDTpA7foOH0rY
         F1HUmGVSpxvUkISUZZKpTIovIivsTfdfhomaAloxf8BEYLr1R+1X2awbHTga/QNYy85n
         gwRtpNy85YgwneAOLg8N/M6HvFIC/uvaDSfZuLkFRfqhwdL2LsbL3vX4o3EjZH6byZBI
         +NQY/9CeV4s3zZ5kH6oSTOlZVBYE82XRW+mvHBixewE/5VmyaCgbBr0h7eentd67Yix/
         yceA==
X-Gm-Message-State: AOJu0YxFTnJJTxXIXXqk8n9mXHVjBMljGIITd70k8IZhE1pHL520HXpy
	leChpNgV4sJbrwEj8OnTAcdIRfHLPX/3A9mHr5vAj7i8Fq8qWDydotOOyWQ3WweGqyXhH15wpC4
	=
X-Google-Smtp-Source: AGHT+IGJcp+HX1PmMQpXJxFiKlDh5AMnw513Hl/8pUFan8/kp8S2U6yj2x7GBWXsGOJUlwYLsqQatQ==
X-Received: by 2002:a5d:6288:0:b0:33d:6bd5:d372 with SMTP id k8-20020a5d6288000000b0033d6bd5d372mr637680wru.15.1708419187200;
        Tue, 20 Feb 2024 00:53:07 -0800 (PST)
Message-ID: <8c76ba07-c850-4e3e-aac8-e5516877d848@suse.com>
Date: Tue, 20 Feb 2024 09:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/8] keyhandler: drop regs parameter from handle_keyregs()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
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
In-Reply-To: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation for further removal of regs parameters, drop it here. In
the two places where it's actually needed, retrieve IRQ context if
available, or else guest context.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
As an alternative to the new boolean parameter, I wonder if we couldn't
special-case the idle vCPU case: It's only there where we would not have
proper context retrievable via guest_cpu_user_regs().
---
v3: Re-base.
v2: New.

--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -73,12 +73,12 @@ static struct keyhandler {
 
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
 
@@ -88,7 +88,7 @@ void handle_keypress(unsigned char key,
     if ( !in_irq() || h->irq_callback )
     {
         console_start_log_everything();
-        h->irq_callback ? h->irq_fn(key, regs) : h->fn(key);
+        h->irq_callback ? h->irq_fn(key, need_context) : h->fn(key);
         console_end_log_everything();
     }
     else
@@ -169,7 +169,7 @@ void cf_check dump_execstate(struct cpu_
 }
 
 static void cf_check dump_registers(
-    unsigned char key, struct cpu_user_regs *regs)
+    unsigned char key, bool need_context)
 {
     unsigned int cpu;
 
@@ -182,8 +182,8 @@ static void cf_check dump_registers(
     cpumask_copy(&dump_execstate_mask, &cpu_online_map);
 
     /* Get local execution state out immediately, in case we get stuck. */
-    if ( regs )
-        dump_execstate(regs);
+    if ( !need_context )
+        dump_execstate(get_irq_regs() ?: guest_cpu_user_regs());
     else
         run_in_exception_handler(dump_execstate);
 
@@ -245,8 +245,7 @@ static void cf_check dump_hwdom_register
     }
 }
 
-static void cf_check reboot_machine(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check reboot_machine(unsigned char key, bool unused)
 {
     printk("'%c' pressed -> rebooting machine\n", key);
     machine_restart(0);
@@ -474,8 +473,7 @@ static void cf_check run_all_nonirq_keyh
 static DECLARE_TASKLET(run_all_keyhandlers_tasklet,
                        run_all_nonirq_keyhandlers, NULL);
 
-static void cf_check run_all_keyhandlers(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check run_all_keyhandlers(unsigned char key, bool need_context)
 {
     struct keyhandler *h;
     unsigned int k;
@@ -491,7 +489,7 @@ static void cf_check run_all_keyhandlers
         if ( !h->irq_fn || !h->diagnostic || !h->irq_callback )
             continue;
         printk("[%c: %s]\n", k, h->desc);
-        h->irq_fn(k, regs);
+        h->irq_fn(k, need_context);
     }
 
     watchdog_enable();
@@ -500,8 +498,7 @@ static void cf_check run_all_keyhandlers
     tasklet_schedule(&run_all_keyhandlers_tasklet);
 }
 
-static void cf_check do_toggle_alt_key(
-    unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_alt_key(unsigned char key, bool unused)
 {
     alt_key_handling = !alt_key_handling;
     printk("'%c' pressed -> using %s key handling\n", key,
@@ -566,7 +563,7 @@ void keyhandler_crash_action(enum crash_
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
@@ -279,7 +279,7 @@ static int *__read_mostly upper_thresh_a
 static int *__read_mostly lower_thresh_adj = &xenlog_lower_thresh;
 static const char *__read_mostly thresh_adj = "standard";
 
-static void cf_check do_toggle_guest(unsigned char key, struct cpu_user_regs *regs)
+static void cf_check do_toggle_guest(unsigned char key, bool unused)
 {
     if ( upper_thresh_adj == &xenlog_upper_thresh )
     {
@@ -306,13 +306,13 @@ static void do_adj_thresh(unsigned char
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
@@ -531,7 +531,7 @@ static void __serial_rx(char c, struct c
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


