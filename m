Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B982A863
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:33:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665939.1036286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpYn-0007sB-Iw; Thu, 11 Jan 2024 07:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665939.1036286; Thu, 11 Jan 2024 07:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpYn-0007qb-F6; Thu, 11 Jan 2024 07:33:05 +0000
Received: by outflank-mailman (input) for mailman id 665939;
 Thu, 11 Jan 2024 07:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpYm-0007qR-JI
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:33:04 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6dc1c08-b053-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 08:33:02 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so60196421fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:33:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:33:01 -0800 (PST)
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
X-Inumbo-ID: a6dc1c08-b053-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958382; x=1705563182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2kKucQeG9hzCGGVi5VOoQwoW+K7wlDclKUZkgMvdu4E=;
        b=DAyc2LdCGcXPFuiKikfOwaS1lUkyNgmGyLP+t+iwK8P39JIC/U0KnWLd4W3nRgoMBJ
         AuLMnVt0Vv/fbmxFmpZSCjAKh34D6KkpJFu3EFpWHDRRIWhFxVFvyiyqT2oa+oZexEiH
         mxfJaiIv6AkgacfCma2AItwwc/QYdsKeazoiPDV0uDDsT8Z7rCvzFbWcAgcpVSrVhDcX
         479l/EqwoS+8nstZvBx90dFzYKJw6+8YrXMNMhitzAXZFW/12MPiGWbM30DFBHHLzzQn
         EE4a81jFdIlp9yjVrpIvO1v2+0HIC+RGg801Ltm5PRgHbIeRXlY7NNd2Z6EFzyIZOI/p
         KPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958382; x=1705563182;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kKucQeG9hzCGGVi5VOoQwoW+K7wlDclKUZkgMvdu4E=;
        b=kNQUnIC02UuPBsFATpzP9/0P8HNyJOWtjQ+J8rmKr5UKrAUWscuUKSbu7et3MbvOZJ
         9Go5FllLmvpyo0RgF2f9kFa4FjWJJFZwn8wQR3OXG04CFIO3daVOKQ52sbXcLxkhTnDm
         j5iec0Ra8nbE6TJ2cG077IOEd0btNpCJRxoYsfSOOIupywCKaERQ2n/I+Yvfe04kST5E
         JMrIFqK/pHzss1pFPc/xlbLInw/wSabHjIcFiciupDvgvC3IJgYHgkxOa2h7XbY2th8d
         2yf2ymlql2dAf559PvVNJm6QHOFolneLQzkh7Vz8Ug7NZSx5dJ5d9DXBU8Lks6w41LuE
         WiNg==
X-Gm-Message-State: AOJu0YyksScqybK7sQKGq3ucmv+TCJuCD4VK1X3nlmKn4xkj+uPW6epa
	HWcUKVwTCMXkqX8BqYRppYm29JlrQWzxz+pPwIqMaik6Vw==
X-Google-Smtp-Source: AGHT+IFQekxv9tUuiagrg5drhbJERoq26nkI56qXh+ZK1ZGc/hJ3bsOKg5LcG6KpV2NCbTOAozTDLQ==
X-Received: by 2002:a2e:91cb:0:b0:2cc:d7a7:8ecb with SMTP id u11-20020a2e91cb000000b002ccd7a78ecbmr153085ljg.16.1704958381888;
        Wed, 10 Jan 2024 23:33:01 -0800 (PST)
Message-ID: <0087ad97-d315-4891-ab35-7a41e62d2f23@suse.com>
Date: Thu, 11 Jan 2024 08:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/8] serial: drop serial_rx_fn's regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
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


