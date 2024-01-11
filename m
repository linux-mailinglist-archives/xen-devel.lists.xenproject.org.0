Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30182A848
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665907.1036226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpRs-00037H-Jr; Thu, 11 Jan 2024 07:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665907.1036226; Thu, 11 Jan 2024 07:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpRs-00034h-G4; Thu, 11 Jan 2024 07:25:56 +0000
Received: by outflank-mailman (input) for mailman id 665907;
 Thu, 11 Jan 2024 07:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpRr-00034Z-Nk
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:25:55 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fe86f9-b052-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:25:54 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so60129541fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:25:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o10-20020a056000010a00b00336cbbf2e0fsm441141wrx.27.2024.01.10.23.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:25:54 -0800 (PST)
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
X-Inumbo-ID: a7fe86f9-b052-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704957954; x=1705562754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2kKucQeG9hzCGGVi5VOoQwoW+K7wlDclKUZkgMvdu4E=;
        b=P9JwASPq42J3f3OERQWWicQ9bPcc2MSyXzRXVe/q53QzuNJd+Jzu2Lq/tR+sCtY0HH
         M3IYmukj0s6hNEavp4e5XSf7DQPwHOnJdpuB4JeGeNnlbvuMlLTUZXadTfC1Leo2f2jx
         rZhVkU0SUFEDnndk5zJMOBJ4tBu88UwNPXPqk4+tHszv5KZPLHZ9wQU/WD0YWFxuaBtc
         SbRkmrqF9JaJdxGO8k91K49Pa5KqsWTD9NkIVcyccaIgv8FNAC5krT6Ql44pMNaJR3v3
         FDyGeSPNuDOWcur7/g3EyfehdiV1FgxfcGTelU/yExP66Nlngb2cVLvQvhZ2iR+gQalF
         wxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704957954; x=1705562754;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kKucQeG9hzCGGVi5VOoQwoW+K7wlDclKUZkgMvdu4E=;
        b=q3xV/3MSi92rWvEYyNpKkDkbGBM6TFTmCKREzYYo442gFxcrF7OGQwAtvAiTJXkdOn
         HnrGI/orfGnmxYUDqvvDx0/dlm/W8Fs53zHC3cPgOwgKvZZEco5MzYss+ReBxC70Ki6S
         Z3cDC61lumHHXkdH6lCfx3FMIRgxJOeo4i6Z7/hLx1NicrYBKG+2GxbdHii6+XfCcsy+
         g6xkWKrM9m9BsD4ZwztK9HOVQw/RbDgu653oraZ7C4gif0/QeQzyK6Vd5UjpgQtWysNh
         9u1uAi9/MM1h5bXTGJA1Shyk+RWjiko9+d/dFihLx+BDshbWHBYu4kOgA7Mm1pPIbVNB
         o2og==
X-Gm-Message-State: AOJu0YywSOaJjq+lE0W04Hx5bbcpW2ehQGMSGrkw7aLmC3QtJvL0JB2p
	8IWGDN2A/bFERHoRsbRqHAvPH4+WGPoj44X2MMXCRYntEQ==
X-Google-Smtp-Source: AGHT+IF4liWdDvfwb1UVGsXXM5DbkozxfiiAy6C/RW1K8AXp6tqlZPfz89MnEWTGaPWetzBiAJsHdg==
X-Received: by 2002:a05:651c:204f:b0:2cc:78c5:7ffa with SMTP id t15-20020a05651c204f00b002cc78c57ffamr119364ljo.7.1704957954283;
        Wed, 10 Jan 2024 23:25:54 -0800 (PST)
Message-ID: <9ab12fd0-4b71-4ef7-9ab4-0ab38a4c94c6@suse.com>
Date: Thu, 11 Jan 2024 08:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/8] serial: drop serial_rx_fn's regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <5d6089a4-c597-49ce-b042-24f13922f581@suse.com>
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
In-Reply-To: <5d6089a4-c597-49ce-b042-24f13922f581@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In the one place where it's needed, get_irq_regs() can be used instead.
This is in preparation of dropping the register parameters from IRQ
handler functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -527,12 +527,12 @@ static void switch_serial_input(void)
     printk("\n");
 }
 
-static void __serial_rx(char c, struct cpu_user_regs *regs)
+static void __serial_rx(char c)
 {
     switch ( console_rx )
     {
     case 0:
-        return handle_keypress(c, regs);
+        return handle_keypress(c, get_irq_regs());
 
     case 1:
         /*
@@ -579,7 +579,7 @@ static void __serial_rx(char c, struct c
 #endif
 }
 
-static void cf_check serial_rx(char c, struct cpu_user_regs *regs)
+static void cf_check serial_rx(char c)
 {
     static int switch_code_count = 0;
 
@@ -595,10 +595,10 @@ static void cf_check serial_rx(char c, s
     }
 
     for ( ; switch_code_count != 0; switch_code_count-- )
-        __serial_rx(switch_code, regs);
+        __serial_rx(switch_code);
 
     /* Finally process the just-received character. */
-    __serial_rx(c, regs);
+    __serial_rx(c);
 }
 
 static void cf_check notify_dom0_con_ring(void *unused)
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -68,7 +68,7 @@ void serial_rx_interrupt(struct serial_p
     spin_unlock_irqrestore(&port->rx_lock, flags);
 
     if ( fn != NULL )
-        (*fn)(c & 0x7f, regs);
+        fn(c & 0x7f);
 }
 
 void serial_tx_interrupt(struct serial_port *port, struct cpu_user_regs *regs)
--- a/xen/drivers/char/xen_pv_console.c
+++ b/xen/drivers/char/xen_pv_console.c
@@ -118,7 +118,7 @@ size_t pv_console_rx(struct cpu_user_reg
     {
         c = cons_ring->in[MASK_XENCONS_IDX(cons++, cons_ring->in)];
         if ( cons_rx_handler )
-            cons_rx_handler(c, regs);
+            cons_rx_handler(c);
         recv++;
     }
 
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -15,7 +15,7 @@
 struct cpu_user_regs;
 
 /* Register a character-receive hook on the specified COM port. */
-typedef void (*serial_rx_fn)(char c, struct cpu_user_regs *regs);
+typedef void (*serial_rx_fn)(char c);
 void serial_set_rx_handler(int handle, serial_rx_fn fn);
 
 /* Number of characters we buffer for a polling receiver. */


