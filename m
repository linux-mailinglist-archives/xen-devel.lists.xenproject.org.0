Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC9TMGVAA2ro2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:59:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E952323C
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306897.1578632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoaB-0000qk-HQ; Tue, 12 May 2026 14:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306897.1578632; Tue, 12 May 2026 14:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoaB-0000pB-EK; Tue, 12 May 2026 14:59:39 +0000
Received: by outflank-mailman (input) for mailman id 1306897;
 Tue, 12 May 2026 14:59:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMoaA-0000nk-7x
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 14:59:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoa9-00B61l-Kx
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:59:37 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a03403e-e002-0a2a0a5209dd-0a2a4503a98e-30
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:59:37 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034059-672d-0a2a45030019-d1558029b5cf-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:59:37 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b150559bso44170885e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 07:59:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f3cf0cdsm36745795e9.2.2026.05.12.07.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 07:59:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778597977; x=1779202777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B8notKPIJCgXsLW2/zUhwvqNucwwalfHeP2cxpiywdE=;
        b=G/U/WGIEI/0J686iM8KHKBxa7VKJgmGQvQ/UiMwamOTX1jjgRcClRsh9nm85WgXmra
         xJsgNfhlQHHSu5mzKvbuDegGDzfjRBAOKmaq+ZHfLGnmVHUBHSXS3/jkR71AoJV3Crmd
         /7YLnrcK7jLZTzzg3XmgOaCmjYS2odtn68o87J/NpELoyOveRJmd1U25ONJgydhrbxA1
         CnFajvNRok6SkXlHUdgPGf+ei1PpUOP1Jjp24DdrDn/3QZ/4Z8OyMxkJwO7ZmQgqYPac
         9ahfdqy6H9riPe4qVR2EwWGQUrKDHNOTpRaH+Ml//gHQDnWsxK5ds1Ll6wFQlnhtyeNZ
         3Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597977; x=1779202777;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8notKPIJCgXsLW2/zUhwvqNucwwalfHeP2cxpiywdE=;
        b=Taq/ZaCHb0iiJvyVduyXkBa00AnXMvcBLiYo/lzFYdapjqnqvXeJ/krEs1tZMYPz5E
         rLDrVzPoSnBWuDfhF3wcfkAk2i0ak+hg7HLkg1DxWXZ+ch9pgMWzKvh6wNX5h//Wih4y
         Ayd2FiTcyNfYZKXTP7rMi/swfvrssPVkmhAhj5CZkE53FgwI7JOPSbC+0VlzZe4FThaH
         UTBiH8FYkNrCksJ9sbBogLKiYO1XCK6hAPTyKHHT/Ocjbb+QAeh47fH4vY+P+mB/3RyP
         PBFSgPWE+U/NEB84AmWGpJ8UHvjkyzg+yjc4a2Cxpv2GSMdX6JAymfUL0E1Nm+2lpNJM
         c92Q==
X-Gm-Message-State: AOJu0YzF2WZ/DzjTQorTGd6mlgx3Kw1nq7k/GQBGGeQsRgRPh0P//ZiG
	Ve5mRdkuamZmaQ27iV9mHYaO5LKUcu4TI1jXtGFX0GpLG5NCEBJ1tR5zFCID1uhd+oUWiL7gbMC
	XEGo=
X-Gm-Gg: Acq92OGz0RoUfChJ3sjld8naEIg6oDbcslhKxqMixTTHw5rMzD3J3zs08uonvCa9AY/
	cOpgSu8NPhpQCQqjkIzfBcVs2LeItjP9xmZMCjKDIiOSw5dYKzzHWWEElOETDGX0PWsUu/Y857F
	1XFDKYB7BasoBg+aB7EAMFLuC7ZPi9kcYGEUi2bIY01lNoBGzS4qnwnGu4hdF73lq+tXOFwT6vB
	pJUta1qgyvAI7pbkieQ47YCMeIDibsGVL0An+HMWYf/TBmwqYpnur6icSMKNe+tP0NbGdWaLzFo
	DiRfg+TwkEgQnPHATJZJWSpWKzfTsFGgxSqZ8Y0YOe8wiUv0BRDgFHq1IYztLN0d8IDEwTKqWC6
	FKVS/87aOrFSffgFD7rfUb5QgMvrsJV2kM7dXL1mg4bvNZk7kq3mxs7Os6EmAajNmKmsXkcGIEg
	s9i1yCewhMWMBT8IfEIiirBuJ3/SnkayH4U1fiM7A46p8HYW0p61F6oqcF/aBF7xYbDKpzpFzzL
	Bqfo2LIZWUcP0s=
X-Received: by 2002:a05:600c:8b83:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-48e706acfb7mr221411515e9.3.1778597976920;
        Tue, 12 May 2026 07:59:36 -0700 (PDT)
Message-ID: <383355d1-7032-4445-8a06-cb4411ea797e@suse.com>
Date: Tue, 12 May 2026 16:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 3/5] x86/vRTC: support century field
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
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
In-Reply-To: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1778597977-4086B938-1FA6D66E/0/0
X-purgate-type: clean
X-purgate-size: 8908
X-Rspamd-Queue-Id: 494E952323C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
assume availability of this field (at its conventional index 0x32); OVMF
at least has code to inspect FADT. Hence we ought to have supported it
virtually forever.

As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
struct hvm_hw_rtc to hold its value. Update the field only when involved
values are valid BCD century specifiers. Otherwise (for VMs migrated in
from an older hypervisor) leave handling to the DM.

This makes the Linux rtc-cmos driver report y3k compatibility.

While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.

Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Am I overly paranoid with the checking of the field, considering that
Xen 3.x post-dates year 2000 and hence all firmware nowadays usable guests
have ever run with should have been aware of the field? Or am I, quite the
opposite, still not strict enough?

I can't help the impression that this introduces a latency issue for
the 2nd of gmtime()'s while() loops: We now allow years up into the 99th
century, i.e. over 8000 years away from 1970. 8000 years are very roughly
2^^38 seconds, making for (again very roughly) 5 million iterations there.
Did I get my math wrong, or do we need a prereq change to (vastly) reduce
the number of iterations of that loop (e.g. along the lines of the other
one, first going in 400 year steps)?

Isn't day-of-week handling flawed? If the field is brought out of sync
with the other values, shouldn't it stay respectively out-of-sync? And
isn't it excessive overhead to go through rtc_set_time() when the field
is updated while SET is clear?

Perhaps we ought to also support alarm day/month features?

--- a/tools/libacpi/static_tables.c
+++ b/tools/libacpi/static_tables.c
@@ -33,6 +33,8 @@ struct acpi_20_facs Facs = {
 #define ACPI_PM_TMR_BLK_BIT_WIDTH           0x20
 #define ACPI_PM_TMR_BLK_BIT_OFFSET          0x00
 
+#define CMOS_CENTURY 0x32 /* Conventional index used also without ACPI */
+
 struct acpi_fadt Fadt = {
     .header = {
         .signature    = ACPI_FADT_SIGNATURE,
@@ -88,7 +90,9 @@ struct acpi_fadt Fadt = {
         .register_bit_width  = ACPI_PM_TMR_BLK_BIT_WIDTH,
         .register_bit_offset = ACPI_PM_TMR_BLK_BIT_OFFSET,
         .address             = ACPI_PM_TMR_BLK_ADDRESS_V1,
-    }
+    },
+
+    .century = CMOS_CENTURY,
 };
 
 struct acpi_20_rsdt Rsdt = {
--- a/tools/misc/xen-hvmctx.c
+++ b/tools/misc/xen-hvmctx.c
@@ -311,7 +311,7 @@ static void dump_rtc(void)
     printf("              0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x 0x%2.2x, index 0x%2.2x\n",
            r.cmos_data[8], r.cmos_data[9], r.cmos_data[10], r.cmos_data[11], 
            r.cmos_data[12], r.cmos_data[13], r.cmos_index);
-
+    printf("         century 0x%02x  offset %"PRId64"\n", r.century, r.rtc_offset);
 }
 
 static void dump_hpet(void)
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -47,6 +47,12 @@
 #define epoch_year     1900
 #define get_year(x)    ((x) + epoch_year)
 
+static inline bool is_century(unsigned int x)
+{
+    /* Constant below should match epoch_year above, just as BCD value. */
+    return x >= 0x19 && (x & 0xf) < 10 && (x >> 4) < 10;
+}
+
 enum rtc_mode {
    rtc_mode_no_ack,
    rtc_mode_strict
@@ -482,16 +488,32 @@ static int rtc_ioport_write(void *opaque
         data &= 0x7f;
         s->hw.cmos_index = data;
         spin_unlock(&s->lock);
+        /* RTC_CENTURY always forwarded to DM. */
         return (data < RTC_CMOS_SIZE);
     }
 
-    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
+    switch ( s->hw.cmos_index )
     {
+    case 0 ... RTC_CMOS_SIZE - 1:
+        orig = s->hw.cmos_data[s->hw.cmos_index];
+        break;
+
+    case RTC_CENTURY:
+        orig = s->hw.century;
+        if ( !is_century(orig) || !is_century(data) )
+        {
+            /* Prevent further use of the field. */
+            s->hw.century = 0;
+            spin_unlock(&s->lock);
+            return 0;
+        }
+        break;
+
+    default:
         spin_unlock(&s->lock);
         return 0;
     }
 
-    orig = s->hw.cmos_data[s->hw.cmos_index];
     switch ( s->hw.cmos_index )
     {
     case RTC_SECONDS_ALARM:
@@ -507,6 +529,7 @@ static int rtc_ioport_write(void *opaque
     case RTC_DAY_OF_MONTH:
     case RTC_MONTH:
     case RTC_YEAR:
+    case RTC_CENTURY:
         /* if in set mode, just write the register */
         if ( (s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
             s->hw.cmos_data[s->hw.cmos_index] = data;
@@ -515,7 +538,10 @@ static int rtc_ioport_write(void *opaque
             /* Fetch the current time and update just this field. */
             s->current_tm = gmtime(get_localtime(d));
             rtc_copy_date(s);
-            s->hw.cmos_data[s->hw.cmos_index] = data;
+            if ( s->hw.cmos_index != RTC_CENTURY )
+                s->hw.cmos_data[s->hw.cmos_index] = data;
+            else
+                s->hw.century = data;
             rtc_set_time(s);
         }
         alarm_timer_update(s);
@@ -591,7 +617,16 @@ static void rtc_set_time(RTCState *s)
     tm->tm_wday = from_bcd(s, s->hw.cmos_data[RTC_DAY_OF_WEEK]);
     tm->tm_mday = from_bcd(s, s->hw.cmos_data[RTC_DAY_OF_MONTH]);
     tm->tm_mon = from_bcd(s, s->hw.cmos_data[RTC_MONTH]) - 1;
-    tm->tm_year = from_bcd(s, s->hw.cmos_data[RTC_YEAR]) + 100;
+    tm->tm_year = from_bcd(s, s->hw.cmos_data[RTC_YEAR]);
+    if ( is_century(s->hw.century) )
+    {
+        unsigned int century = s->hw.century;
+
+        BCD_TO_BIN(century);
+        tm->tm_year += century * 100 - epoch_year;
+    }
+    else
+        tm->tm_year += 100;
 
     after = mktime(get_year(tm->tm_year), tm->tm_mon + 1, tm->tm_mday,
                    tm->tm_hour, tm->tm_min, tm->tm_sec);
@@ -629,6 +664,12 @@ static void rtc_copy_date(RTCState *s)
     s->hw.cmos_data[RTC_DAY_OF_MONTH] = to_bcd(s, tm->tm_mday);
     s->hw.cmos_data[RTC_MONTH] = to_bcd(s, tm->tm_mon + 1);
     s->hw.cmos_data[RTC_YEAR] = to_bcd(s, tm->tm_year % 100);
+
+    if ( is_century(s->hw.century) )
+    {
+        s->hw.century = get_year(tm->tm_year) / 100;
+        BIN_TO_BCD(s->hw.century);
+    }
 }
 
 static int update_in_progress(RTCState *s)
@@ -656,6 +697,13 @@ static uint32_t rtc_ioport_read(RTCState
 
     switch ( s->hw.cmos_index )
     {
+    case RTC_CENTURY:
+        if ( !is_century(s->hw.century) )
+        {
+            ret = UINT32_MAX;
+            break;
+        }
+        fallthrough;
     case RTC_SECONDS:
     case RTC_MINUTES:
     case RTC_HOURS:
@@ -669,7 +717,10 @@ static uint32_t rtc_ioport_read(RTCState
             s->current_tm = gmtime(get_localtime(d));
             rtc_copy_date(s);
         }
-        ret = s->hw.cmos_data[s->hw.cmos_index];
+        if ( s->hw.cmos_index != RTC_CENTURY )
+            ret = s->hw.cmos_data[s->hw.cmos_index];
+        else
+            ret = s->hw.century;
         break;
     case RTC_REG_A:
         ret = s->hw.cmos_data[s->hw.cmos_index];
@@ -718,10 +769,12 @@ static int cf_check handle_rtc_io(
         *val = 0xff;
         return X86EMUL_OKAY;
     }
-    else if ( vrtc->hw.cmos_index < RTC_CMOS_SIZE )
+    else if ( vrtc->hw.cmos_index < RTC_CMOS_SIZE ||
+              vrtc->hw.cmos_index == RTC_CENTURY )
     {
         *val = rtc_ioport_read(vrtc);
-        return X86EMUL_OKAY;
+        if ( *val != UINT32_MAX )
+            return X86EMUL_OKAY;
     }
 
     return X86EMUL_UNHANDLEABLE;
@@ -873,6 +926,8 @@ void rtc_init(struct domain *d)
     s->hw.cmos_data[RTC_REG_C] = 0;
     s->hw.cmos_data[RTC_REG_D] = RTC_VRT;
 
+    s->hw.century = 0x20; /* Arbitrary initial value satisfying is_century() */
+
     s->current_tm = gmtime(get_localtime(d));
     s->start_time = NOW();
 
--- a/xen/arch/x86/include/asm/mc146818rtc.h
+++ b/xen/arch/x86/include/asm/mc146818rtc.h
@@ -37,6 +37,9 @@ bool is_cmos_port(unsigned int port, uns
 #define RTC_REG_C               12
 #define RTC_REG_D               13
 
+/* Conventional index used without (and typically also with) ACPI. */
+#define RTC_CENTURY             0x32
+
 /**********************************************************************
  * register details
  **********************************************************************/
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -485,7 +485,7 @@ struct hvm_hw_rtc {
     uint8_t cmos_data[RTC_CMOS_SIZE];
     /* Index register for 2-part operations */
     uint8_t cmos_index;
-    uint8_t pad0;
+    uint8_t century;
     /* RTC offset from host time */
     int64_t rtc_offset;
 };


