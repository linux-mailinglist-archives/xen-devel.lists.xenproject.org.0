Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51485B601
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683271.1062730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLsd-0003ow-UF; Tue, 20 Feb 2024 08:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683271.1062730; Tue, 20 Feb 2024 08:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLsd-0003mc-Qu; Tue, 20 Feb 2024 08:53:35 +0000
Received: by outflank-mailman (input) for mailman id 683271;
 Tue, 20 Feb 2024 08:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLsc-0002F1-Hp
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:53:34 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 868ac1f3-cfcd-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:53:32 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412698cdd77so8099685e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:53:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:53:32 -0800 (PST)
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
X-Inumbo-ID: 868ac1f3-cfcd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419212; x=1709024012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uPp0elCmf96AfayiOwn8U2QJcfk2O81aOrNPDxDcp70=;
        b=CxZovJAV5o3cIq+PVjJeqWA671HKoDoc5D9KDuXqyRtBYbzZEkgnRb5fFEqdfcYUum
         6JivygeyVIJQvjQWoSJz86C2gi/KP0WSHM+FRddzXMTa+qfFX3YYMBBFVr0atoAgSCeX
         8Y1pawcF4RDU3T2ZGGy7J5BQErRAJp1WJvnoMaRYny+1+idV8zKf3CTzgxl7MEUwTELs
         JhW1MRCho6Ziz5aZmQ4g7AJ27HIYN55oH+Rcqh7zO+XNOPi9AgLwbi2hbteXEA3EOTkC
         NpvcqvsjhAlLNADFTFI/x2tZfq1849QCvLl7Q/c9OGLxH9DMmqYyuAhR8csLPK2GT4lb
         9n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419212; x=1709024012;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPp0elCmf96AfayiOwn8U2QJcfk2O81aOrNPDxDcp70=;
        b=vk2MtnlFsFjvpK4ZMd5CC2CR1XNEbnhIOrBXV+duJIQEqQWgnN4zCg/L4TO4YIOJQ+
         Mc7A8lFEoGMUP4S4x3xpNi7cDoDEviF0ikvtE+qYcq+DQRzilWAdJYZ4q6ppVhoo12LH
         0FiPBF2kKINvbeYPgPsU40Tp/rgfPuD3olkqVFsSayQzxIJPIwvilCVkk/BEd4FkFrob
         O5FWTgFE49DyZsdzCw3NHLP9lepRKpyyZlymw/p1q+GDld4EjCnSgFqhdUze0e1D6e8p
         4C4CsKCLjL8bN+iFPpQPl31Kv/awR5uG+xUH+hNU4dNkIQupH0eXlD5Vu5sp0EeaAq04
         G9/A==
X-Gm-Message-State: AOJu0YzFNyDVEfKFR4sM/b1DkkFvbKjACFZmww0iwOP+sUXDvv3bIf9m
	iTdG/rxGWjOxWTTMTB0szBRT3uRHUiKVHg+NJuVn91gr9Y6rWZnn+sDuLScoQW5RLUBEjbzt64s
	=
X-Google-Smtp-Source: AGHT+IFHtjbHbKo4h5YKKP2rg1k+1j2Twm/B3b+aRITSLkoDCKBr6vLlArxlwCAT4vJ98Z5XQY+t1w==
X-Received: by 2002:a05:600c:45d1:b0:412:6de4:cbe1 with SMTP id s17-20020a05600c45d100b004126de4cbe1mr1344836wmo.15.1708419212431;
        Tue, 20 Feb 2024 00:53:32 -0800 (PST)
Message-ID: <9836c01a-7f9f-4f8e-ba7d-1a7ab7e2e4e1@suse.com>
Date: Tue, 20 Feb 2024 09:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/8] serial: drop serial_rx_fn's regs parameter
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

It's simply not needed anymore.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Re-base over earlier (new/split) patches.

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -526,7 +526,7 @@ static void switch_serial_input(void)
     printk("\n");
 }
 
-static void __serial_rx(char c, struct cpu_user_regs *regs)
+static void __serial_rx(char c)
 {
     switch ( console_rx )
     {
@@ -578,7 +578,7 @@ static void __serial_rx(char c, struct c
 #endif
 }
 
-static void cf_check serial_rx(char c, struct cpu_user_regs *regs)
+static void cf_check serial_rx(char c)
 {
     static int switch_code_count = 0;
 
@@ -594,10 +594,10 @@ static void cf_check serial_rx(char c, s
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


