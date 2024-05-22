Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57B8CC1AE
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727591.1132113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lZU-0002sA-4S; Wed, 22 May 2024 12:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727591.1132113; Wed, 22 May 2024 12:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lZU-0002p2-19; Wed, 22 May 2024 12:59:56 +0000
Received: by outflank-mailman (input) for mailman id 727591;
 Wed, 22 May 2024 12:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9lZS-00025w-Ky
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 12:59:54 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e1d14d2-183b-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 14:59:52 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59cf8140d0so815171566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 05:59:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7e02sm1775829466b.105.2024.05.22.05.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 05:59:52 -0700 (PDT)
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
X-Inumbo-ID: 2e1d14d2-183b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716382792; x=1716987592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4YzomDhXXm/vFcq+Eo68VE4aq0MfzRMkOmfWSyEBToo=;
        b=XiTeH/AMKeoFvUO3S2FhER3hpsyFZudjKHisGBdY6Zsb7CWDWIjZ3BKTz5XROc9pyg
         TlbICZJiM5GqgmDhgiHZEGJYTppXk/WiWKs4ej/vD88bekqlXKxhQ7ar89b6VgsOSFKK
         UekXDhfZwvWTi+Z0xuO5h49Tj4bgpIA+3o+xM4ds47rxf1+q7LWg6/erJB6qYGQGpwD9
         gqL/wOpIkWJmQFw9uPUpRN8Y2tBEpWDY/k8S0SlpxTx7yh5A7MNGqH641V3/ik2y+UA+
         anVm190gxQoe1SefDNiVett3CQUk+5rjSXbbJ81plofPPa4Cq+RHXQnW7nwloFVWxCds
         9q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716382792; x=1716987592;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YzomDhXXm/vFcq+Eo68VE4aq0MfzRMkOmfWSyEBToo=;
        b=JjR3eqDRtSmDjR3ArqHjbA0jsXnSLDYUujdAqaQhvT8vr7tIujdYHgoTt8mmmGvL3x
         xveI6Fyd3jLxbTw9JPgQmIqp2gQoCYZDc7WuzsW8W3tweB4H9+l6GpgTV8+rVklsk1nG
         EPhn1d8W4CmKHwskK0MDlpSBFpG8M5Z19DPTzaR6xF5QcOYWOiZrpPxH9jV7bBGYi2RM
         InOVL5fZN1Vnp1/4HQfii+8qUghHvRm4mJ3bdtQc0GfiWVP6nEWutmJyE87ktdlxryTw
         V6WLlFMH+GnfvpjFeJV6MUTt9YNvHyZY06EPSdnW9YK0DU6IT/9O4qIUx8ifBd6ngKYR
         s1MA==
X-Gm-Message-State: AOJu0Yw1bsFjcw6SNXwqfo9CACcn7dpif1LC9kBsDU2xEPyetkbC5pnE
	foSFbffFKV4B3xm1PWSFHpS32On11qxG99oqAKHfScBun6I+XGPruzL4z+75tdUQyAxQMS6Ruas
	=
X-Google-Smtp-Source: AGHT+IF4mcbHXyyQIF7CzBK3CMoIN3r/xzogk7aUVq111GiUwOhUlZ7d20pjVYsARTy/cvZwrqu82A==
X-Received: by 2002:a17:906:3715:b0:a55:a895:46ae with SMTP id a640c23a62f3a-a62281c48b7mr128549666b.63.1716382792354;
        Wed, 22 May 2024 05:59:52 -0700 (PDT)
Message-ID: <df53dd77-9341-4a72-a4ce-33654b2e877d@suse.com>
Date: Wed, 22 May 2024 14:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/2] x86: detect PIT aliasing on ports other than 0x4[0-3]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <14d35449-fc65-4dcf-95db-8d94dd3455fb@suse.com>
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
In-Reply-To: <14d35449-fc65-4dcf-95db-8d94dd3455fb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... in order to also deny Dom0 access through the alias ports (commonly
observed on Intel chipsets). Without this it is only giving the
impression of denying access to PIT. Unlike for CMOS/RTC, do detection
pretty early, to avoid disturbing normal operation later on (even if
typically we won't use much of the PIT).

Like for CMOS/RTC a fundamental assumption of the probing is that reads
from the probed alias port won't have side effects (beyond such that PIT
reads have anyway) in case it does not alias the PIT's.

As to the port 0x61 accesses: Unlike other accesses we do, this masks
off the top four bits (in addition to the bottom two ones), following
Intel chipset documentation saying that these (read-only) bits should
only be written with zero.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If Xen was running on top of another instance of itself (in HVM mode,
not PVH, i.e. not as a shim), prior to 14f42af3f52d ('x86/vPIT: account
for "counter stopped" time') I'm afraid our vPIT logic would not have
allowed the "Try to further make sure ..." check to pass in the Xen
running on top: We don't respect the gate bit being clear when handling
counter reads. (There are more unhandled [and unmentioned as being so]
aspects of PIT behavior though, yet it's unclear in how far addressing
at least some of them would be useful.)
---
v3: Use PIT_* in dom0_setup_permissions(). Use #define-s introduced by
    new earlier patch.
v2: Use new command line option. Re-base over changes to earlier
    patches. Use ISOLATE_LSB().

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -20,6 +20,7 @@
 #include <asm/p2m.h>
 #include <asm/setup.h>
 #include <asm/spec_ctrl.h>
+#include <io_ports.h>
 
 struct memsize {
     long nr_pages;
@@ -495,7 +496,11 @@ int __init dom0_setup_permissions(struct
     rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
 
     /* Interval Timer (PIT). */
-    rc |= ioports_deny_access(d, 0x40, 0x43);
+    for ( offs = 0, i = ISOLATE_LSB(pit_alias_mask) ?: 4;
+          offs <= pit_alias_mask; offs += i )
+        if ( !(offs & ~pit_alias_mask) )
+            rc |= ioports_deny_access(d, PIT_CH0 + offs, PIT_MODE + offs);
+
     /* PIT Channel 2 / PC Speaker Control. */
     rc |= ioports_deny_access(d, 0x61, 0x61);
 
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -49,6 +49,7 @@ extern unsigned long highmem_start;
 #endif
 
 extern unsigned int i8259A_alias_mask;
+extern unsigned int pit_alias_mask;
 
 extern int8_t opt_smt;
 extern int8_t opt_probe_port_aliases;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -427,6 +427,74 @@ static struct platform_timesource __init
     .resume = resume_pit,
 };
 
+unsigned int __initdata pit_alias_mask;
+
+static void __init probe_pit_alias(void)
+{
+    unsigned int mask = 0x1c;
+    uint8_t val = 0;
+
+    if ( !opt_probe_port_aliases )
+        return;
+
+    /*
+     * Use channel 2 in mode 0 for probing.  In this mode even a non-initial
+     * count is loaded independent of counting being / becoming enabled.  Thus
+     * we have a 16-bit value fully under our control, to write and then check
+     * whether we can also read it back unaltered.
+     */
+
+    /* Turn off speaker output and disable channel 2 counting. */
+    outb(inb(0x61) & 0x0c, 0x61);
+
+    outb(PIT_LTCH_CH(2) | PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY,
+         PIT_MODE);
+
+    do {
+        uint8_t val2;
+        unsigned int offs;
+
+        outb(val, PIT_CH2);
+        outb(val ^ 0xff, PIT_CH2);
+
+        /* Wait for the Null Count bit to clear. */
+        do {
+            /* Latch status. */
+            outb(PIT_RDB | PIT_RDB_NO_COUNT | PIT_RDB_CH2, PIT_MODE);
+
+            /* Try to make sure we're actually having a PIT here. */
+            val2 = inb(PIT_CH2);
+            if ( (val2 & ~(PIT_STATUS_OUT_PIN | PIT_STATUS_NULL_COUNT)) !=
+                 (PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY) )
+                return;
+        } while ( val2 & (1 << 6) );
+
+        /*
+         * Try to further make sure we're actually having a PIT here.
+         *
+         * NB: Deliberately |, not ||, as we always want both reads.
+         */
+        val2 = inb(PIT_CH2);
+        if ( (val2 ^ val) | (inb(PIT_CH2) ^ val ^ 0xff) )
+            return;
+
+        for ( offs = ISOLATE_LSB(mask); offs <= mask; offs <<= 1 )
+        {
+            if ( !(mask & offs) )
+                continue;
+            val2 = inb(PIT_CH2 + offs);
+            if ( (val2 ^ val) | (inb(PIT_CH2 + offs) ^ val ^ 0xff) )
+                mask &= ~offs;
+        }
+    } while ( mask && (val += 0x0b) );  /* Arbitrary uneven number. */
+
+    if ( mask )
+    {
+        dprintk(XENLOG_INFO, "PIT aliasing mask: %02x\n", mask);
+        pit_alias_mask = mask;
+    }
+}
+
 /************************************************************
  * PLATFORM TIMER 2: HIGH PRECISION EVENT TIMER (HPET)
  */
@@ -2416,6 +2484,8 @@ void __init early_time_init(void)
     }
 
     preinit_pit();
+    probe_pit_alias();
+
     tmp = init_platform_timer();
     plt_tsc.frequency = tmp;
 


