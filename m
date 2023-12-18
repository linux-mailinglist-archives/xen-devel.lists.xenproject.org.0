Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D9817423
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656099.1024086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEv4-0008Mp-4f; Mon, 18 Dec 2023 14:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656099.1024086; Mon, 18 Dec 2023 14:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEv4-0008KQ-1b; Mon, 18 Dec 2023 14:48:34 +0000
Received: by outflank-mailman (input) for mailman id 656099;
 Mon, 18 Dec 2023 14:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEv2-0007qP-QL
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:48:32 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83794f5b-9db4-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:48:32 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336668a5a8dso1352427f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:48:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j29-20020a5d6e5d000000b003364e437577sm10175351wrz.84.2023.12.18.06.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:48:31 -0800 (PST)
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
X-Inumbo-ID: 83794f5b-9db4-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910911; x=1703515711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fdAJveYHqA2g4CKa3+3oW3cyM7mNTxYeZr4t06ZVD3M=;
        b=Q/j86XPWaYLHKQRauVym+6lRndWRgfI8qqTdUPFPIn/wJas9mBxMUbOiiCDebpJKcX
         mwuoXou8c68OVtBB0emsmonX0tt+YSLVQOSmxuARXAU6h6I/MIl6pJmvYA3SPP57AIbq
         u4riZHKShXFfUFwisjR840MczpziBdFMyWZ1Hta0DgKUtHDoUbR7ReN4AxOooS3WjWTU
         Cf4cKKQUXClFSOieq1ytslMK7kjtNp9NGeYBhFmmzWv6RaDV7G45KiFcQnRrPpBpf+E9
         x03To/tzMnrnm3SjgoYW/BH1QnLScEuwEFAvdepMsBisKsV3SGSrib7IDlc6DukEsyyG
         4cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910911; x=1703515711;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdAJveYHqA2g4CKa3+3oW3cyM7mNTxYeZr4t06ZVD3M=;
        b=i6KLnbGjxhElRyr8IgfO+ViMUWfa0CrpN78y7wJjGoauHKUyGaIw2oNRf9OUgOGJTp
         iDGeedSSYIpEjT491rkZxalU7LXBdn86RPzL3Z/4R43IvuJQgSrpdXJk2knHSWdvJUIY
         Qaqs+Cjccca3jmpV58FHb9jc4iCZkI3CKejAYT1yT07K23VBCLi0SDhV6y+l13o99k+x
         a+Xu30fwpA75E103EhNwSo7xIPcgQLMksI1F96hOZN91MTerrke5qTBQAZwiNnXtdrLc
         WfU0hQ0BwgmgWL9aq5CCGzSMIZjgy5Qc7YtA8J+gpeEl1ECA0f+ix4P0t1fZABYP5bUm
         WIFQ==
X-Gm-Message-State: AOJu0Yz3O6g1l7gnxGvgWjN2NE9VOI3nBzMwmkMLPhV3REsh0AfrUXFy
	n0ZHEaFLkcUjFZ3FbclqhkiC0t3SEJuOCqbiWyrY
X-Google-Smtp-Source: AGHT+IEcRm1OlYQRw4waYkgXv26JzJWDtoeZ7XB0p/wpHi2fh7f4AW0IzQg5clA/hSFMznmjF6/EAA==
X-Received: by 2002:a05:6000:1201:b0:336:4e26:f7e5 with SMTP id e1-20020a056000120100b003364e26f7e5mr3068903wrx.110.1702910911614;
        Mon, 18 Dec 2023 06:48:31 -0800 (PST)
Message-ID: <039b9ceb-4862-4e26-a344-e47fc04bd979@suse.com>
Date: Mon, 18 Dec 2023 15:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] x86: detect PIT aliasing on ports other than 0x4[0-3]
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
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
In-Reply-To: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... in order to also deny Dom0 access through the alias ports. Without
this it is only giving the impression of denying access to PIT. Unlike
for CMOS/RTC, do detection pretty early, to avoid disturbing normal
operation later on (even if typically we won't use much of the PIT).

Like for CMOS/RTC a fundamental assumption of the probing is that reads
from the probed alias port won't have side effects (beyond such that PIT
reads have anyway) in case it does not alias the PIT's.

At to the port 0x61 accesses: Unlike other accesses we do, this masks
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
v2: Use new command line option. Re-base over changes to earlier
    patches. Use ISOLATE_LSB().

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -495,7 +495,11 @@ int __init dom0_setup_permissions(struct
     rc |= ioports_deny_access(d, 0x4D0, 0x4D1);
 
     /* Interval Timer (PIT). */
-    rc |= ioports_deny_access(d, 0x40, 0x43);
+    for ( offs = 0, i = ISOLATE_LSB(pit_alias_mask) ?: 4;
+          offs <= pit_alias_mask; offs += i )
+        if ( !(offs & ~pit_alias_mask) )
+            rc |= ioports_deny_access(d, 0x40 + offs, 0x43 + offs);
+
     /* PIT Channel 2 / PC Speaker Control. */
     rc |= ioports_deny_access(d, 0x61, 0x61);
 
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -47,6 +47,7 @@ extern unsigned long highmem_start;
 #endif
 
 extern unsigned int i8259A_alias_mask;
+extern unsigned int pit_alias_mask;
 
 extern int8_t opt_smt;
 extern int8_t opt_probe_port_aliases;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -425,6 +425,72 @@ static struct platform_timesource __init
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
+    outb((2 << 6) | (3 << 4) | (0 << 1), PIT_MODE); /* Mode 0, LSB/MSB. */
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
+            outb((3 << 6) | (1 << 5) | (1 << 3), PIT_MODE);
+
+            /* Try to make sure we're actually having a PIT here. */
+            val2 = inb(PIT_CH2);
+            if ( (val2 & ~(3 << 6)) != ((3 << 4) | (0 << 1)) )
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
@@ -2414,6 +2480,8 @@ void __init early_time_init(void)
     }
 
     preinit_pit();
+    probe_pit_alias();
+
     tmp = init_platform_timer();
     plt_tsc.frequency = tmp;
 


