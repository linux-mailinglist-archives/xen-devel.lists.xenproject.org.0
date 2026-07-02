Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id APLGM/IvRmp/LQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:31:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1046F5461
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:31:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="XpA/o+iu";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351486.1608657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDlO-0000Eu-P5; Thu, 02 Jul 2026 09:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351486.1608657; Thu, 02 Jul 2026 09:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDlO-0000Cd-ML; Thu, 02 Jul 2026 09:31:18 +0000
Received: by outflank-mailman (input) for mailman id 1351486;
 Thu, 02 Jul 2026 09:31:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfDlN-0000CK-5O
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:31:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfDlM-007Lzy-IA
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:31:16 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462fdd-5cb7-0a2a0a5109dd-0a2a4505d4b2-18
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:31:16 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462fe4-3cb2-0a2a45050019-d1558030a59c-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:31:16 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4938d5f86f3so3223875e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:31:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbacbsm7498135f8f.4.2026.07.02.02.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:31:15 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782984676; x=1783589476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DyaH8jfrEj4hQ9whXJcni+qiFjc9whuT9c1Kf2l86fU=;
        b=XpA/o+iuXdyhPnXCCcO+7ch6FVt+jyEjvPZyqNAWDcDfcobpbka3o0RigzWSJGPWZW
         JieXBXo5q3v4YLqpS1YT2/109/3pSBPKmraMZEVITm+t3VBSw9s79pxAU5OGISXKCzM1
         nJ3fgYdrR8Mmomg3jrlFriBO/mXuLcd8l/sc6GB+tRqB0Rh6+y3xbO7n7TMwHlsm0tao
         B4omRz/jKicjb5fxS9tX0VYYKp5o63Eu33u3XBe2fZKYR3B1UvqgRWzLaQZeSF087tn6
         V6SSK5zMDEwxDkI3gUH6zlP5+o2rnvTzaKq13CtXUBhIttK2cSdvAhF+kQm9EJWP2qtF
         LaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984676; x=1783589476;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyaH8jfrEj4hQ9whXJcni+qiFjc9whuT9c1Kf2l86fU=;
        b=O+Y2hvc1SkcKxsy5SHrNBby88xs7KD+OfE6jcllmW2arFAVwHLC4gMAaaCMMwWeYfD
         FYfWoB1qVhb+ax4SkFppY7rEz5dyTGKjBA6GCiV/W8GxCf+sElfitkaTvuYNpa8NzDYU
         2cmVEYU1/soRYh0HCIXc4Lj0YNSmPnTFj++2jrkEvo6WCY7yHU0sfOb1OFRjNhKZaYXL
         NTC3UNkXm5IKssO+lqsPTzB8AHWsChL6Dp+m1gjat1PDmJj+duryWH1lF6Rsuxm3qn5n
         mUm+InAhcB7NSOgErm7IyHaz8FwtwPgCQIs3Q2ydtMIpAl3Uf7wNiC5MkIC9APGP7oCE
         Qtsg==
X-Gm-Message-State: AOJu0YxW29QbOA6ekOAMOE6M4oA7e0/Jg69PGsRbmJyCsmyfDplIlrWs
	9GSzdELsWdNqUCl055DTKlk7CrXxKRRBJbTRx104BNkhGGaJ4iUtYGsTIU1CeSjmK9gUg7ESryV
	ENcY91g==
X-Gm-Gg: AfdE7ck+3G8ILs6CtnYsiP/+qjZhB6/+18JkNCZWG8nlJyQZsjNBLbl9mZih/TFHea+
	z9IQUjZkR9lJ+7UbjJ9U67kHaumTbUozB/3QjbY9hlVQ5bGYVMLjL42WG29PC8eU1EYFzVY2SKL
	0oMeLhrf9CRzJ/i2ASAVWXVQkbsLm2MuP9L2X4295yrEoD60faxIKiBF6wG+MOJtnUHyjTXR8GD
	R0IaTdxf2NxoIc9M0rSPA903PW+713gIR7I0Dy+wVCNaQHHASGLnmXjNYkjjrIP81F9LTCqZ/NC
	xKJVIn16FVGKMZ/OSTeCl/dlWCYey+fJewJXX5kbMjwNy6dZ3u0zYhgQYHOQ7OxM5ZKCPxxr44+
	Awdti1sqf/i6O8zZk0L2oZmSQHfx6oV7fG4Q4G6brWcFlmeHkF+L/Di9Yf3BF5YNDpparu/bSRH
	3BTUB+QaSG1GL9UBWTk7p8clmsF7rM0I1om2ihBt/lkdczb4aQ10NfCo/ktQw6C65spxxmbQ/jd
	BeR
X-Received: by 2002:a05:600c:3317:b0:490:55d9:149a with SMTP id 5b1f17b1804b1-493bc278166mr87474535e9.18.1782984675774;
        Thu, 02 Jul 2026 02:31:15 -0700 (PDT)
Message-ID: <eee7754d-a7ef-477c-a74d-2104291103bb@suse.com>
Date: Thu, 2 Jul 2026 11:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/4] x86/vRTC: support century field
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
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
In-Reply-To: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1782984676-0FF1F2B8-7CD43C0D/0/0
X-purgate-type: clean
X-purgate-size: 9785
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D1046F5461

Both ROMBIOS and SeaBIOS (with CONFIG_QEMU=y, as we build it) blindly
assume availability of this field (at its conventional index 0x32); OVMF
at least has code to inspect FADT. Hence we ought to have supported it
virtually forever.

As the index is beyond RTC_CMOS_SIZE, leverage the padding field in
struct hvm_hw_rtc to hold its value. Update the field only when involved
values are valid BCD century specifiers. Otherwise (for VMs migrated in
from an older hypervisor) leave handling to the DM.

This makes the Linux rtc-cmos driver report y3k compatibility.

In the new rtc_check(), besides checking the new fields also check the
pre-existing pad0 field.

While extending xen-hvmctx.c:dump_rtc() also add RTC offset there.

Fixes: 4ca161214355 ("[HVM] Move RTC emulation into the hypervisor")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Am I overly paranoid with the checking of the field, considering that
Xen 3.x post-dates year 2000 and hence all firmware nowadays usable guests
have ever run with should have been aware of the field? Or am I, quite the
opposite, still not strict enough?

Now that we extend struct hvm_hw_rtc, should we perhaps save not only the
century, but also its index?

Likely more sanity checking could be added to rtc_check(), but that's for
a separate patch imo.

Isn't day-of-week handling flawed? If the field is brought out of sync
with the other values, shouldn't it stay respectively out-of-sync? And
isn't it excessive overhead to go through rtc_set_time() when the field
is updated while SET is clear?

Perhaps we ought to also support alarm day/month features?
---
v2: Don't re-purpose pad0 field of struct hvm_hw_rtc.

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
     printf("              0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x, index 0x%02x\n",
            r.cmos_data[8], r.cmos_data[9], r.cmos_data[10], r.cmos_data[11], 
            r.cmos_data[12], r.cmos_data[13], r.cmos_index);
-
+    printf("         century 0x%02x  offset %"PRId64"\n", r.century, r.rtc_offset);
 }
 
 static void dump_hpet(void)
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -482,16 +482,27 @@ static int rtc_ioport_write(void *opaque
         data &= 0x7f;
         s->hw.cmos_index = data;
         spin_unlock(&s->lock);
-        return (data < RTC_CMOS_SIZE);
+        return data < RTC_CMOS_SIZE || (s->has_century && data == RTC_CENTURY);
     }
 
-    if ( s->hw.cmos_index >= RTC_CMOS_SIZE )
+    switch ( s->hw.cmos_index )
     {
+    case 0 ... RTC_CMOS_SIZE - 1:
+        orig = s->hw.cmos_data[s->hw.cmos_index];
+        break;
+
+    case RTC_CENTURY:
+        if ( s->has_century )
+        {
+            orig = s->hw.century;
+            break;
+        }
+        fallthrough;
+    default:
         spin_unlock(&s->lock);
         return 0;
     }
 
-    orig = s->hw.cmos_data[s->hw.cmos_index];
     switch ( s->hw.cmos_index )
     {
     case RTC_SECONDS_ALARM:
@@ -507,6 +518,7 @@ static int rtc_ioport_write(void *opaque
     case RTC_DAY_OF_MONTH:
     case RTC_MONTH:
     case RTC_YEAR:
+    case RTC_CENTURY:
         /* if in set mode, just write the register */
         if ( (s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
             s->hw.cmos_data[s->hw.cmos_index] = data;
@@ -515,7 +527,10 @@ static int rtc_ioport_write(void *opaque
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
@@ -591,7 +606,16 @@ static void rtc_set_time(RTCState *s)
     tm->tm_wday = from_bcd(s, s->hw.cmos_data[RTC_DAY_OF_WEEK]);
     tm->tm_mday = from_bcd(s, s->hw.cmos_data[RTC_DAY_OF_MONTH]);
     tm->tm_mon = from_bcd(s, s->hw.cmos_data[RTC_MONTH]) - 1;
-    tm->tm_year = from_bcd(s, s->hw.cmos_data[RTC_YEAR]) + 100;
+    tm->tm_year = from_bcd(s, s->hw.cmos_data[RTC_YEAR]);
+    if ( s->has_century )
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
@@ -629,6 +653,12 @@ static void rtc_copy_date(RTCState *s)
     s->hw.cmos_data[RTC_DAY_OF_MONTH] = to_bcd(s, tm->tm_mday);
     s->hw.cmos_data[RTC_MONTH] = to_bcd(s, tm->tm_mon + 1);
     s->hw.cmos_data[RTC_YEAR] = to_bcd(s, tm->tm_year % 100);
+
+    if ( s->has_century )
+    {
+        s->hw.century = get_year(tm->tm_year) / 100;
+        BIN_TO_BCD(s->hw.century);
+    }
 }
 
 static int update_in_progress(RTCState *s)
@@ -663,13 +693,17 @@ static uint32_t rtc_ioport_read(RTCState
     case RTC_DAY_OF_MONTH:
     case RTC_MONTH:
     case RTC_YEAR:
+    case RTC_CENTURY:
         /* if not in set mode, adjust cmos before reading*/
         if (!(s->hw.cmos_data[RTC_REG_B] & RTC_SET))
         {
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
@@ -718,7 +752,8 @@ static int cf_check handle_rtc_io(
         *val = 0xff;
         return X86EMUL_OKAY;
     }
-    else if ( vrtc->hw.cmos_index < RTC_CMOS_SIZE )
+    else if ( vrtc->hw.cmos_index < RTC_CMOS_SIZE ||
+              (vrtc->has_century && vrtc->hw.cmos_index == RTC_CENTURY) )
     {
         *val = rtc_ioport_read(vrtc);
         return X86EMUL_OKAY;
@@ -760,6 +795,32 @@ static int cf_check rtc_save(struct vcpu
     return rc;
 }
 
+static int cf_check rtc_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const struct hvm_save_descriptor *desc =
+        (const struct hvm_save_descriptor *)&h->data[h->cur];
+    struct hvm_hw_rtc s;
+
+    if ( !has_vrtc(d) )
+        return -ENODEV;
+
+    if ( hvm_load_entry_zeroextend(RTC, h, &s) != 0 )
+        return -ENODATA;
+
+    if ( s.pad0 )
+        return -EINVAL;
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(s.pad1); ++i )
+        if ( s.pad1[i] )
+            return -EINVAL;
+
+    if ( desc->length >= endof_field(struct hvm_hw_rtc, century) &&
+         ((s.century & 0xf) >= 10 || (s.century >> 4) >= 10) )
+        return -EINVAL;
+
+    return 0;
+}
+
 /* Reload the hardware state from a saved domain */
 static int cf_check rtc_load(struct domain *d, hvm_domain_context_t *h)
 {
@@ -793,12 +854,18 @@ static int cf_check rtc_load(struct doma
     check_update_timer(s);
     alarm_timer_update(s);
 
+    if ( !s->hw.century )
+    {
+        s->has_century = false;
+        s->hw.century = 0;
+    }
+
     spin_unlock(&s->lock);
 
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, NULL, rtc_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, rtc_check, rtc_load, 1, HVMSR_PER_DOM);
 
 void rtc_reset(struct domain *d)
 {
@@ -873,6 +940,12 @@ void rtc_init(struct domain *d)
     s->hw.cmos_data[RTC_REG_C] = 0;
     s->hw.cmos_data[RTC_REG_D] = RTC_VRT;
 
+    /*
+     * By default we make the century byte available, unless an incoming save
+     * record says otherwise.
+     */
+    s->has_century = true;
+
     s->current_tm = gmtime(get_localtime(d));
     s->start_time = NOW();
 
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -109,6 +109,8 @@ typedef struct RTCState {
 
     bool use_timer;
 
+    bool has_century;
+
     spinlock_t lock;
 } RTCState;
 
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
@@ -488,6 +488,8 @@ struct hvm_hw_rtc {
     uint8_t pad0;
     /* RTC offset from host time */
     int64_t rtc_offset;
+    uint8_t century;
+    uint8_t pad1[7];
 };
 
 DECLARE_HVM_SAVE_TYPE(RTC, 11, struct hvm_hw_rtc);


