Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF7B8364C3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669925.1042475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRugb-00036C-Jg; Mon, 22 Jan 2024 13:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669925.1042475; Mon, 22 Jan 2024 13:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRugb-00033i-Gt; Mon, 22 Jan 2024 13:50:01 +0000
Received: by outflank-mailman (input) for mailman id 669925;
 Mon, 22 Jan 2024 13:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRuga-00033S-BC
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:50:00 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 223ddf2a-b92d-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 14:49:59 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso34229151fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:49:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a05663849cd00b0046e627dbc4csm3035114jab.121.2024.01.22.05.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:49:58 -0800 (PST)
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
X-Inumbo-ID: 223ddf2a-b92d-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705931399; x=1706536199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fK812nh3pwQPfsrNIv1f+BF+0piaboacJxzlQr2GGy0=;
        b=R4fqUeCDcja18SrSTNOLMA2HKNfrm9StTtSf2UQX83E/RYsogow/JVmx4H4SLjWN/w
         qsl3lsBImX07uGtZy2ogiuIXjpAGYjy9PqnobZaOUBR8Kbb3kM4lVhlfYIX6/v12cgOP
         jIYzUvRXJVBViQyaQ4/HUJEwzfDFdto+wMDTf9/cMIrUmk+/T85jxwiU0bmA6xuBo+ta
         N9qWaANmPxr2qQPlzDZsKPDdfDGnaqmmwZlA0ZDldX2Yoa3nJtN+IsOD3KYDM2vFUWaA
         eQVItdgND5dBq9VJIaPR+8gsGKbo2FrCod4nzDVHu4rp/3zq9dl5RBcQnfIgNQdKi5yP
         HtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931399; x=1706536199;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fK812nh3pwQPfsrNIv1f+BF+0piaboacJxzlQr2GGy0=;
        b=JTTrTg0zc7Ip4pDyEVfrU8nUEhc6Tsw1HdbsU6tbM/+yP6MksfvLf9yeJAgmR8sHb6
         a2Wpmmrc6TWIA/TkMV53ovvpo3/q80wPdmLLPkPJMkI9E7YFZtlGHUfqcQBaaAz4Jwel
         3u/DFivQ5nlIk/R9aljgm07dYNXsm1uyo2zSC1w54dxYFn1xhs5vq7Ertt6xmHPmQvIk
         Il3WngTiexs4e0z/v4bc8o+/VlKyotNQqSqLjBzsdO/IPEcqW+/d9DKOtwBUPVaW3EQF
         N5X1RTj5aUEGFkDE7qN5REPXhIpe1diLtsRucTnmOdMVq4vjYhDYbK3QasmdDQnhUhJO
         w0JA==
X-Gm-Message-State: AOJu0YzLLLdxbnypixbd47p2QTrlcMuonpxuJaojOqpygUaSr8QAXxzN
	T+MerZXGhAi1lmMhze7TXAo5EYXa1Yb/hP+ERNzNIKTarKFBGaDv9KKjmYDqHLQoMKlpjV867tA
	=
X-Google-Smtp-Source: AGHT+IE96fWGY9pXTRhdgZ9fOaNrkfVlRgARYOkoM9WlLoFdZqXQPkZr3zU0l/ezxypZ6QqAzAIrDg==
X-Received: by 2002:a2e:8201:0:b0:2cd:1d5d:322b with SMTP id w1-20020a2e8201000000b002cd1d5d322bmr1673216ljg.57.1705931399219;
        Mon, 22 Jan 2024 05:49:59 -0800 (PST)
Message-ID: <851cd74b-0fba-44b7-9f81-cd49c25b748f@suse.com>
Date: Mon, 22 Jan 2024 14:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/8] serial: drop serial_rx_fn's regs parameter
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

It's simply not needed anymore.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over earlier (new/split) patches.

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -527,7 +527,7 @@ static void switch_serial_input(void)
     printk("\n");
 }
 
-static void __serial_rx(char c, struct cpu_user_regs *regs)
+static void __serial_rx(char c)
 {
     switch ( console_rx )
     {
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


