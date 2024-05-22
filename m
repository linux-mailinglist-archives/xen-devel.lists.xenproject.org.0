Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3D8CC1AD
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 14:59:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727588.1132103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lZ3-00028w-TA; Wed, 22 May 2024 12:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727588.1132103; Wed, 22 May 2024 12:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lZ3-00027P-PW; Wed, 22 May 2024 12:59:29 +0000
Received: by outflank-mailman (input) for mailman id 727588;
 Wed, 22 May 2024 12:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9lZ2-00025w-04
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 12:59:28 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e0d845f-183b-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 14:59:25 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a59ad344f7dso806760666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 05:59:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7e02sm1775829466b.105.2024.05.22.05.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 05:59:25 -0700 (PDT)
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
X-Inumbo-ID: 1e0d845f-183b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716382765; x=1716987565; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ot36334SXNG/2Q+xhXO1nt7KGyGP0a+FespoVK2pges=;
        b=f+2OcwC9CSj58JJK5x+RfOLcMLTZ3+ga85Wjo3kJr+kTT8rIxGaivJBce8Tc1QjFZC
         YaklO1mWV5CqZswhziLSgRT8FNTICDvH95FI4BxMdBZ4RW1YofH1Itf3fq4daMrVL9p7
         VIHxMWFBndXJg76UNXjE/tZiiyKWO08GSFdgOrLBXLFu4gcshSKVceGwDZUS5WwDB642
         FpxQ64RkwaSXzIxnh2WdpS14zqsVLdbvZHJPhkTCvuY6D2Mnr/jnvin7Q8dwP1rYYAi+
         Jsf0pAhIXWU7N6oDUtrHknmFMcC0Y7qNl9GGTH5ZpYWaVwIP6ebum0MjZJ4Smy8VM04F
         bqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716382765; x=1716987565;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ot36334SXNG/2Q+xhXO1nt7KGyGP0a+FespoVK2pges=;
        b=GGBwXrN/z5isVONSVELJ+61YD/Qs27tz9zHuJZNM5IK216h67PkB2HjdTH85zBgZrI
         gfVB5txRMme6TWQV48Q98hG8G0pv3eG3gT3CjAdAIjdbCKTaCeWawxvhLfnHsqr4fO1y
         ER/XNl9jaiuxjYijcc3Mebjo3/IykPm3ABMDGD+2uB+QNxeN2rvlNLTtB3M8hx+n8Fkm
         v2a4eH3l0tZ1woJfnjGb7tjFw2ZXxYhtmEpkTX5yNBnnnXwx2PfhGav+BXW7B6H/QoW7
         mRo0+b7gwjT1PMYnu6JfFMmaZC6awDnf9nG7Y4zCGP1+7KLZ53FW1RjFWQymkfzkV+ob
         7rBQ==
X-Gm-Message-State: AOJu0Yw8T+tHkoHP4z3/4W+ukt9cJ3xpJY8QQZPvFxeW9CuFgq4xnt8a
	TpHACuM3RXKi/BoscUTpd6swz5fFrmXDJNE1D81Ocw+3KXa62EGzneau4Om9y91T0MkV4Ehr42Q
	=
X-Google-Smtp-Source: AGHT+IEVYMYlfCgC5O1dvLV7XE9cbvi0a7DkNm9/U+lwVpGbgblJx0gDuYb9X/n1dsRhkK43Vk9qZA==
X-Received: by 2002:a17:906:404:b0:a5a:377e:4c4a with SMTP id a640c23a62f3a-a622816dd71mr119023766b.63.1716382765327;
        Wed, 22 May 2024 05:59:25 -0700 (PDT)
Message-ID: <fb87a1db-4d8f-4e33-8858-71de4de6e276@suse.com>
Date: Wed, 22 May 2024 14:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/2] x86/PIT: supply and use #define-s
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <14d35449-fc65-4dcf-95db-8d94dd3455fb@suse.com>
Content-Language: en-US
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

Help reading of code programming the PIT by introducing constants for
control word, read back and latch commands, as well as status.

Requested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -983,7 +983,7 @@ static unsigned int __init get_8254_time
 
     /*spin_lock_irqsave(&i8253_lock, flags);*/
 
-    outb_p(0x00, PIT_MODE);
+    outb_p(PIT_LTCH_CH(0), PIT_MODE);
     count = inb_p(PIT_CH0);
     count |= inb_p(PIT_CH0) << 8;
 
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -58,4 +58,38 @@ struct time_scale;
 void set_time_scale(struct time_scale *ts, u64 ticks_per_sec);
 u64 scale_delta(u64 delta, const struct time_scale *scale);
 
+/* Programmable Interval Timer (8254) */
+
+/* Timer Control Word */
+#define PIT_TCW_CH(n)         ((n) << 6)
+/* Lower bits also Timer Status. */
+#define PIT_RW_MSB            (1 << 5)
+#define PIT_RW_LSB            (1 << 4)
+#define PIT_RW_LSB_MSB        (PIT_RW_LSB | PIT_RW_MSB)
+#define PIT_MODE_EOC          (0 << 1)
+#define PIT_MODE_ONESHOT      (1 << 1)
+#define PIT_MODE_RATE_GEN     (2 << 1)
+#define PIT_MODE_SQUARE_WAVE  (3 << 1)
+#define PIT_MODE_SW_STROBE    (4 << 1)
+#define PIT_MODE_HW_STROBE    (5 << 1)
+#define PIT_BINARY            (0 << 0)
+#define PIT_BCD               (1 << 0)
+
+/* Read Back Command */
+#define PIT_RDB               PIT_TCW_CH(3)
+#define PIT_RDB_NO_COUNT      (1 << 5)
+#define PIT_RDB_NO_STATUS     (1 << 4)
+#define PIT_RDB_CH2           (1 << 3)
+#define PIT_RDB_CH1           (1 << 2)
+#define PIT_RDB_CH0           (1 << 1)
+#define PIT_RDB_RSVD          (1 << 0)
+
+/* Counter Latch Command */
+#define PIT_LTCH_CH(n)        PIT_TCW_CH(n)
+
+/* Timer Status */
+#define PIT_STATUS_OUT_PIN    (1 << 7)
+#define PIT_STATUS_NULL_COUNT (1 << 6)
+/* Lower bits match Timer Control Word. */
+
 #endif /* __X86_TIME_H__ */
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -222,7 +222,7 @@ static void cf_check timer_interrupt(int
 
         spin_lock_irq(&pit_lock);
 
-        outb(0x80, PIT_MODE);
+        outb(PIT_LTCH_CH(2), PIT_MODE);
         count  = inb(PIT_CH2);
         count |= inb(PIT_CH2) << 8;
 
@@ -245,7 +245,8 @@ static void preinit_pit(void)
 {
     /* Set PIT channel 0 to HZ Hz. */
 #define LATCH (((CLOCK_TICK_RATE)+(HZ/2))/HZ)
-    outb_p(0x34, PIT_MODE);        /* binary, mode 2, LSB/MSB, ch 0 */
+    outb_p(PIT_TCW_CH(0) | PIT_RW_LSB_MSB | PIT_MODE_RATE_GEN | PIT_BINARY,
+           PIT_MODE);
     outb_p(LATCH & 0xff, PIT_CH0); /* LSB */
     outb(LATCH >> 8, PIT_CH0);     /* MSB */
 #undef LATCH
@@ -356,7 +357,7 @@ static u64 cf_check read_pit_count(void)
 
     spin_lock_irqsave(&pit_lock, flags);
 
-    outb(0x80, PIT_MODE);
+    outb(PIT_LTCH_CH(2), PIT_MODE);
     count16  = inb(PIT_CH2);
     count16 |= inb(PIT_CH2) << 8;
 
@@ -383,7 +384,8 @@ static s64 __init cf_check init_pit(stru
      */
 #define CALIBRATE_LATCH CALIBRATE_VALUE(CLOCK_TICK_RATE)
     BUILD_BUG_ON(CALIBRATE_LATCH >> 16);
-    outb(0xb0, PIT_MODE);                  /* binary, mode 0, LSB/MSB, Ch 2 */
+    outb(PIT_TCW_CH(2) | PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY,
+         PIT_MODE);
     outb(CALIBRATE_LATCH & 0xff, PIT_CH2); /* LSB of count */
     outb(CALIBRATE_LATCH >> 8, PIT_CH2);   /* MSB of count */
 #undef CALIBRATE_LATCH
@@ -408,7 +410,8 @@ static s64 __init cf_check init_pit(stru
 static void cf_check resume_pit(struct platform_timesource *pts)
 {
     /* Set CTC channel 2 to mode 0 again; initial value does not matter. */
-    outb(0xb0, PIT_MODE); /* binary, mode 0, LSB/MSB, Ch 2 */
+    outb(PIT_TCW_CH(2) | PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY,
+         PIT_MODE);
     outb(0, PIT_CH2);     /* LSB of count */
     outb(0, PIT_CH2);     /* MSB of count */
 }
@@ -2456,7 +2459,8 @@ static int _disable_pit_irq(bool init)
     }
 
     /* Disable PIT CH0 timer interrupt. */
-    outb_p(0x30, PIT_MODE);
+    outb_p(PIT_TCW_CH(0) | PIT_RW_LSB_MSB | PIT_MODE_EOC | PIT_BINARY,
+           PIT_MODE);
     outb_p(0, PIT_CH0);
     outb_p(0, PIT_CH0);
 
@@ -2562,17 +2566,18 @@ int hwdom_pit_access(struct ioreq *ioreq
     case PIT_MODE:
         if ( ioreq->dir == IOREQ_READ )
             return 0; /* urk! */
-        switch ( ioreq->data & 0xc0 )
+        switch ( ioreq->data & PIT_TCW_CH(3) )
         {
-        case 0xc0: /* Read Back */
-            if ( ioreq->data & 0x08 )    /* Select Channel 2? */
-                outb(ioreq->data & 0xf8, PIT_MODE);
-            if ( !(ioreq->data & 0x06) ) /* Select Channel 0/1? */
+        case PIT_RDB: /* Read Back */
+            if ( ioreq->data & PIT_RDB_CH2 )
+                outb(ioreq->data & ~(PIT_RDB_CH1 | PIT_RDB_CH0 | PIT_RDB_RSVD),
+                     PIT_MODE);
+            if ( !(ioreq->data & (PIT_RDB_CH0 | PIT_RDB_CH1)) )
                 return 1; /* no - we're done */
             /* Filter Channel 2 and reserved bit 0. */
-            ioreq->data &= ~0x09;
+            ioreq->data &= ~(PIT_RDB_CH2 | PIT_RDB_RSVD);
             return 0; /* emulate ch0/1 readback */
-        case 0x80: /* Select Counter 2 */
+        case PIT_TCW_CH(2):
             outb(ioreq->data, PIT_MODE);
             return 1;
         }


