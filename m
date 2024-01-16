Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E882F2B3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 17:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667908.1039595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmjY-0005JJ-SC; Tue, 16 Jan 2024 16:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667908.1039595; Tue, 16 Jan 2024 16:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPmjY-0005HO-Or; Tue, 16 Jan 2024 16:56:16 +0000
Received: by outflank-mailman (input) for mailman id 667908;
 Tue, 16 Jan 2024 16:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPmjX-0005HD-LS
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 16:56:15 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2809021b-b490-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 17:56:13 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cd64022164so117390591fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 08:56:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e34-20020a028625000000b0046e3023b444sm3023535jai.32.2024.01.16.08.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 08:56:12 -0800 (PST)
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
X-Inumbo-ID: 2809021b-b490-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705424173; x=1706028973; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/GRuPPUmvfZCzOlb947NDD95I7idQBnhAGh1UNVobI=;
        b=cbz51S264xPyXZh5V5gSKOpndpHnw2YSLd1I/zZq/jSd6w2VXnPe2FBjPq8I0dp9gm
         SVJAb9tfsCv+Yj8NaNoewSeoWmTD4uQJ7f9fUSrouB8zYNcd5gLnVLfle45LattBDlc0
         +YMqpY6/fG6rpTSJiIXmZczor+g5va17Op1MUeTjZPs6orIdhdwxN+oywZq9GS9ntTQj
         ROV+cJalJr/KHEHAsmFUocAJhGS7Oz3B1aiMnMNY4NBtvRmh63QKOi/W5/34r0nbyDTk
         C4/F+E7OCWJa1DS3wM80u6iLxlq3+y8lELqSTliTEyrhfgMEik04rIHqtYStBIXTWTdT
         pWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705424173; x=1706028973;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/GRuPPUmvfZCzOlb947NDD95I7idQBnhAGh1UNVobI=;
        b=CUTOUO3r/Xj2bATjZUazUQEaqJwag1NZumz9L0G6mXlp+HWqQi2KB12Q+FYAPaw1kt
         LI0ZBJ3k/xj1/D74WA3BPsE3BDq7Y5oudzQr2UcoW9bXUeOmeQ9Q1X9AECBVThHFgYEp
         As7YuQsz2X4JoZ9aRdFoRRcozffK5EBW8rBpQTZ0VLzrMprt81BEbWSZkwugNpmdUqfi
         qhhGkcpUYWo35e8QUCREu2upMQemaZttQFq9HHSv+tU76iWm+mdg9kMMeI00u5o7lVjA
         /tD82z0o7RhBX9ycFvYE88KJDOEhw2Gt+Wo/hqzWOezDme+Q8Qdv8VZM92/u6XV2AQ4c
         vG8g==
X-Gm-Message-State: AOJu0YxXKAMF1DMJYI8Sfnynvq3phW0/szK6pMzIG2y5KcGhgLfTB0Bm
	TfvQ1/Hk0/z5rUMKPSMfZqPnIf2KKoY8G3DgB7sWav0rWA==
X-Google-Smtp-Source: AGHT+IG+oU+cC64Kwr7WB7wZmwyAKxA5SizWTm6wyRokJ2f2Mtpb90zOYKpnhkZxS6sqjrNBv/0uSQ==
X-Received: by 2002:a2e:9448:0:b0:2cd:7830:5796 with SMTP id o8-20020a2e9448000000b002cd78305796mr4008932ljh.5.1705424173036;
        Tue, 16 Jan 2024 08:56:13 -0800 (PST)
Message-ID: <34e88794-8a62-4787-baf1-e4443ec45a01@suse.com>
Date: Tue, 16 Jan 2024 17:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HPET: avoid an indirect call
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When this code was written, indirect branches still weren't considered
much of a problem (besides being a little slower). Instead of a function
pointer, pass a boolean to _disable_pit_irq(), thus allowing to
eliminate two ENDBR (one of them in .text).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -563,7 +563,7 @@ static void cf_check handle_rtc_once(uin
     }
 }
 
-void __init cf_check hpet_broadcast_init(void)
+void __init hpet_broadcast_init(void)
 {
     u64 hpet_rate = hpet_setup();
     u32 hpet_id, cfg;
@@ -634,7 +634,7 @@ void __init cf_check hpet_broadcast_init
         hpet_events->flags = HPET_EVT_LEGACY;
 }
 
-void cf_check hpet_broadcast_resume(void)
+void hpet_broadcast_resume(void)
 {
     u32 cfg;
     unsigned int i, n;
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
@@ -89,8 +89,8 @@ void hpet_disable_legacy_replacement_mod
  * Temporarily use an HPET event counter for timer interrupt handling,
  * rather than using the LAPIC timer. Used for Cx state entry.
  */
-void cf_check hpet_broadcast_init(void);
-void cf_check hpet_broadcast_resume(void);
+void hpet_broadcast_init(void);
+void hpet_broadcast_resume(void);
 void cf_check hpet_broadcast_enter(void);
 void cf_check hpet_broadcast_exit(void);
 int hpet_broadcast_is_available(void);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2427,7 +2427,7 @@ void __init early_time_init(void)
 }
 
 /* keep pit enabled for pit_broadcast working while cpuidle enabled */
-static int _disable_pit_irq(void(*hpet_broadcast_setup)(void))
+static int _disable_pit_irq(bool init)
 {
     int ret = 1;
 
@@ -2442,13 +2442,13 @@ static int _disable_pit_irq(void(*hpet_b
      */
     if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_ARAT) )
     {
-        hpet_broadcast_setup();
+        init ? hpet_broadcast_init() : hpet_broadcast_resume();
         if ( !hpet_broadcast_is_available() )
         {
             if ( xen_cpuidle > 0 )
             {
-                printk("%ps() failed, turning to PIT broadcast\n",
-                       hpet_broadcast_setup);
+                printk("hpet_broadcast_%s() failed, turning to PIT broadcast\n",
+                       init ? "init" : "resume");
                 return -1;
             }
             ret = 0;
@@ -2465,7 +2465,7 @@ static int _disable_pit_irq(void(*hpet_b
 
 static int __init cf_check disable_pit_irq(void)
 {
-    if ( !_disable_pit_irq(hpet_broadcast_init) )
+    if ( !_disable_pit_irq(true) )
     {
         xen_cpuidle = 0;
         printk("CPUIDLE: disabled due to no HPET. "
@@ -2526,7 +2526,7 @@ int time_resume(void)
 
     resume_platform_timer();
 
-    if ( !_disable_pit_irq(hpet_broadcast_resume) )
+    if ( !_disable_pit_irq(false) )
         BUG();
 
     init_percpu_time();

