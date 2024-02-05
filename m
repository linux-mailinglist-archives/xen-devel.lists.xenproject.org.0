Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201EA849BC3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:29:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676040.1051815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz1j-0003Or-Ur; Mon, 05 Feb 2024 13:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676040.1051815; Mon, 05 Feb 2024 13:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz1j-0003Mf-SF; Mon, 05 Feb 2024 13:28:47 +0000
Received: by outflank-mailman (input) for mailman id 676040;
 Mon, 05 Feb 2024 13:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWz1i-0003FY-EJ
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:28:46 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c23d31a-c42a-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 14:28:44 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40ef3f351d2so30817615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:28:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0033b3cf1ff09sm2278382wrw.29.2024.02.05.05.28.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:28:43 -0800 (PST)
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
X-Inumbo-ID: 7c23d31a-c42a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707139724; x=1707744524; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=psVWVy2hduK7Z6lfch3dygRM4LRvywrY0uUoZLjxYv8=;
        b=XxsJcSpVeLPdoygIXnZKEQxv3TpI3O4yXTZcxsG7/1DkqBBZmyHUbfnJF0goCAcxyM
         1/opdVEh/awrbMjplAAIwgLEfyiuOOcdxqhYn+u7dQcfXpp4WkDWYo7mu/YI0RwdyaVj
         ANgZCdqhXv4pfRUvjHVpIc0jYugKnXhhOXiqNzv0nI8yBg8Ks3M+7eq4riBG8NpkhtQs
         BruiQ8KKIthtlpVR1olclttMdPpBpyPiAl45l9H4Dj2bCRlFe+Rxvlv9wK5by+WKfp/h
         BLgRgKfZkOLGstdxdMmO4Ox5TJrL2NSSwTOXxp8CprQC8gb3g2l8H2EpCITfstB9fdn5
         BRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139724; x=1707744524;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psVWVy2hduK7Z6lfch3dygRM4LRvywrY0uUoZLjxYv8=;
        b=HZ5ujlHHoob2g6BZlc50WsNM9ta/YpOw95JPYOPCqMAqYjyi7kbJPFLjXPa/4titoi
         O+Pa86BwUsV70BQJSY6xe4YBu6BFl1sBTcxCyF5IQYDFgC268z8blWk5pVlm856gM+QX
         ue7GmPTMqXcy9XzOlAciYDAmvJMo7zLtERAsSbtneBm77Ha7haCrQAoIs7S27sFAtYBM
         ntYvAjjK7MjLQwr+KDnaIbLdWW/JG1vNOPmMe38OATAW73/MzClQZuwc1Vm5BwvHbmlJ
         8VBUYCmZIy5eCjQmPfEq6EhFkhm1i7uz3MuySNuc8KuR0Tgav1RHAowPfKalFych/ctd
         q8rg==
X-Gm-Message-State: AOJu0YzFpNZgjfQKHogK1A6StPMerRSLYG8z2FFhriDJGONbCMWiy9jk
	QR01nWFtDh1UHX//tC+DQpzu0RaSRS1my6TMB9jeNrADz+o4x96gwGJ1hvqwmQ97iaSKYUMH9bw
	=
X-Google-Smtp-Source: AGHT+IGadlMeSymDT4u27ECo2thETBDBX07yTDsj5dYtgL1QRTtoKZr2/2EiQhy21ukKeSs0azWEgQ==
X-Received: by 2002:adf:f54b:0:b0:33b:1ab8:3736 with SMTP id j11-20020adff54b000000b0033b1ab83736mr3609865wrp.1.1707139724189;
        Mon, 05 Feb 2024 05:28:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWrOAgZ6PvaxGE80/qVy3edix+XQ0UT7axQGqqF0eVHZGh63882Z1eDXnGQhaaag+ud2jBLdzd5hcfwRzDCimBcCGIICuJyylauEK4CzgTWpkSHsnnw7kBv3emdxgMgt3Y/8kY2PbZd1ll47wCEwmyGPgafERC3dxUyBvq9
Message-ID: <df7f2df7-d45c-4c96-a84a-5ca816a5b733@suse.com>
Date: Mon, 5 Feb 2024 14:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/8] serial: drop serial_rx_fn's regs parameter
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

It's simply not needed anymore.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


