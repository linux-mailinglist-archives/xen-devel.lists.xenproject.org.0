Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3060849BBF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676037.1051806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz1D-0002ny-N5; Mon, 05 Feb 2024 13:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676037.1051806; Mon, 05 Feb 2024 13:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz1D-0002kx-Js; Mon, 05 Feb 2024 13:28:15 +0000
Received: by outflank-mailman (input) for mailman id 676037;
 Mon, 05 Feb 2024 13:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWz1C-0001wW-Dd
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:28:14 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696dd4f7-c42a-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:28:13 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so3065680f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:28:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0033b3cf1ff09sm2278382wrw.29.2024.02.05.05.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:28:12 -0800 (PST)
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
X-Inumbo-ID: 696dd4f7-c42a-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707139693; x=1707744493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ydAWDx9h9IVXFzTidsD6Z1TLZe7e5dY/H1Vr9S9PwiE=;
        b=M85Rma8KDEK2bz8CMRFn/wGvt6wJ7J2+5qMwGf5DD1VXe/thRwDw6T2ExVmEWsV29y
         /CePWXA8xEBj77p67SOY9AvGefJh+qJgMwQSn+nVHRX0d8jkURFQmRrmcV7G2d2t5eDB
         LQ8Hym1Xk3EcgfIyMje12GvhpZdivZ7v9O4dIneSoZqk7sXN7pxAJiCbTF76vA9THLnd
         qyHnBVKwRrNjaxtk8XZkLjwf6HRJyAfd7iNz0zAFxHQrPP/oHoHF6H89vFVwOAh0MAPK
         5PJ8o3u6rLjX6fY1b5xuA3v3BiUp5gXtn4sYaHbugQKaPBIU+k8zx2G7SiuVlU7OrOhz
         Z7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139693; x=1707744493;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydAWDx9h9IVXFzTidsD6Z1TLZe7e5dY/H1Vr9S9PwiE=;
        b=Bwo09h8G6bpHZN6lIOTeMqFblWjgd2qXsLl57Ute1Cxo7oPmQIuUbo9+27/0VE8ERe
         IToFXXVuFETD4AoksIU650I+iJp6W0K1NDPGlFVc+ywtOrlDSW3+n9oEhL2W4kKq9JyB
         ZFQzdaRStD2FN8qHAaw+uOCqAF8lXXlKA8yc9mUKpTM0Bx4uhJvK5lW9HTYL8CD8bCJX
         h8g5h2BjZI+eV4PrNAXRZcgx54dA7qOGIgVIGo3XDsSX7lE2aVXvZiRGoYXBUEbWVPiU
         RCHfrWzsWoUl6Muy/3p7NO3eDdhgT6amfFRcuQUTc+j/k7Vc9VZ2PRub+4T0tT6IFEG6
         wUrw==
X-Gm-Message-State: AOJu0Yze5PhHjapHwMAEQQmHHXrzfXqmqJaw2+NgQ3P0kexxCTU9x+/p
	Aj+/1qKpq6o48Prqhms3uLKP/76qQi/Aav3m/ADaWRcb6syTgoWL0hwC5vO0CwzLo4VLLgejzmw
	=
X-Google-Smtp-Source: AGHT+IG9O74TbbFhs8wDKqrVpx4p5dH0NkSqdkZDU59Z6j8Sq5nvwWXjpfokpf2TTmtpmiWYKrMfrw==
X-Received: by 2002:a05:6000:156b:b0:33b:4164:5fbe with SMTP id 11-20020a056000156b00b0033b41645fbemr1659186wrz.20.1707139692820;
        Mon, 05 Feb 2024 05:28:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUZWkTBBEG2t7OzrySSCvjbFwDbr1QH0r1fZRnhkzOu/ApKX7CMgkT6xIEayL91ZcWyMJYO0X5Os1eviVGmpjpr5+IawEty+KY0EZ26glJRyS8BVr/KZEWyN89RNnMyrn1Uu2uYhYM/y/N9rwwjN5jMnAd+jKwlLvM/sWJq
Message-ID: <5258d8a9-a7ef-4342-9b5c-fc0078139bb2@suse.com>
Date: Mon, 5 Feb 2024 14:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/8] keyhandler: drop regs parameter from handle_keyregs()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
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
In-Reply-To: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
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


