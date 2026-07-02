Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XahINnkvRmpLLQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:29:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD426F5401
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 11:29:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=dPTCulfl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351462.1608629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDjO-00069V-VF; Thu, 02 Jul 2026 09:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351462.1608629; Thu, 02 Jul 2026 09:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfDjO-00066o-SX; Thu, 02 Jul 2026 09:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1351462;
 Thu, 02 Jul 2026 09:29:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfDjN-00066b-Uv
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:29:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfDjM-005BD9-KF
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 11:29:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462f63-e002-0a2a0a5209dd-0a2a4506c242-26
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:29:12 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a462f68-08de-0a2a45060019-d155802dad8f-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 11:29:12 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso8765275e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 02:29:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c635c41dsm63880115e9.5.2026.07.02.02.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 02:29:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1782984552; x=1783589352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rNeLuZWOoZ4GW+Y/apOrOAS/S2cqMXKJ1Ia6qOHbnNw=;
        b=dPTCulflmz29SUvLuAyoL9rb09+33MWaPtqhhbTXGygS2qWs+D8SssEKau4kxE2Weh
         82y1NM01KcSlYbeDpX6LI98rR8Vpbo79sjvP2bOcl8Subd5vDtcMB5VNjBFZMsHsx4Qt
         meIT2xSEAzQmvKcBrtZA25+DvU/7mWYOQo65RDza3x5YR8MhHfKLxtBteZaFGbfRhfkF
         EUxzDbllchRTUNu5cSszAcJpMidkgsdAgC5RnDu0v1Z0aJvkVtCuAKW1/gBh+7/rp9ad
         vEUMmMdL29/LS3y2AqX72VAH2W/A5sR8BdCAOUj4Ghmb/dw0H8c6qh8ubDGKCc0jUy/a
         bnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984552; x=1783589352;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNeLuZWOoZ4GW+Y/apOrOAS/S2cqMXKJ1Ia6qOHbnNw=;
        b=Hzxw6qIVm5bGnoCod8G1LQ9heHJ07qnBwr1XZPffN8VSSvve2aqvj8XqQcWq+9tTDu
         30AN4kejaYoM2y1wwfGxM7d0E/ljMMxZOkF/yNaLxS0cSfXaV6SNTaGYdsmfnPJNiGDa
         p5rSJeTJxerS7cnwGPQZq4+iedeCOLtPUapwCJdHOhdnb3u2/TjRQeWRRDtzhvbL8oNx
         BV1cIqRToUOv3kFk/BfUj1su1d5r5S2NQTelJfVmCKW9M/t74rcmW6ON3+6bnCQU8X/n
         V+6QZwk8OVmfd2ahDsMg8mcuKZ+r/GNdJQsN2vU9u1566PGnn3yRHqCa1jZfJMPl3KQE
         PkXw==
X-Gm-Message-State: AOJu0Yx4aqNsnHYTWXPLLvxxh3N6w0iqVXtraJG0Bf1GbxcZMdwTo9PA
	IFPVI5255M//FK8UncNlyVQXqlwrskblrkcFy4WVN3c/NteQfHh7NO/BuIoXEvIUv/N2ogTFvjE
	0IrIv2w==
X-Gm-Gg: AfdE7cmzOvkoYMCifM3PsjrPV16GXdQWSmab6gywP4hFOzWy15uRcwDm/KFfGJRXQaY
	WNFVSj55V5lO5WUExrCxL0XUuzjebZuJYezMfvH2krJW5k+aYD6Hp2+YV6XQVDiH9Y899noFB/C
	0rjkaEx72iDIJzHyxFkzjQI9SS3+d4F+Bn6p+hbpF/jvsd8w0KMpMYGHH3XVySMkwr+ZrZamZ/+
	lOEKHXMBJHSnBlgrgdlWIhLTyLn9+DOgiBreHK16QW03dviyCJqYNwTiL0yx52ZObEcXlntjtTd
	jh4p2C2ZvWn+UyEzbMqIjpQU0QHqITdCDJ/ySu9A8hT4XgX0C5FYT2wr7SLlAbnysvHyr/iTAp9
	OPE8nufsIAL598tt1ZoFWFVW0bSpq3y2l7Aa/ceSHM9KTxS+gfQ34+rBYj2+b1xFcFfS4NcpW47
	wYMcftefALdTBUzZZZxZtZf1PqYSxUSeMzpPRICWJHTeRE/A9iancQ49+krzosTgEJ7Q/fkW7Sw
	P/DBMpjsoPW7CY=
X-Received: by 2002:a05:600c:1f84:b0:492:63c3:8eeb with SMTP id 5b1f17b1804b1-493c2ba53e4mr72531165e9.35.1782984551966;
        Thu, 02 Jul 2026 02:29:11 -0700 (PDT)
Message-ID: <5945d8f4-aece-4572-8e89-60408dd7ac32@suse.com>
Date: Thu, 2 Jul 2026 11:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] x86/time: CMOS RTC may run in binary mode
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
X-purgate-ID: tlsNG-16d1c6/1782984552-C453168D-9984B018/0/0
X-purgate-type: clean
X-purgate-size: 3621
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,rtc.day:url];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 3FD426F5401

Indicating it would always use BCD mode is just wrong (and then the
comment there said the opposite). All halfway recent (and really all 64-
bit capable) systems having a CMOS RTC should properly indicate the mode
in control register B.

Make use of the flag, but provide a fallback mechanism in case people run
into systems not matching the above assumption. Additionally, when binary
mode is indicated and when "cmos-rtc-probe" is in use (but "cmos-rtc-bcd"
isn't), probe whether the clock really runs in binary mode. (This probing,
sadly, can take up to 10 seconds.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -339,6 +339,14 @@ parameter to "stable:socket".
 Specify the event count threshold for raising Corrected Machine Check
 Interrupts.  Specifying zero disables CMCI handling.
 
+### cmos-rtc-bcd (x86)
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to indicate the CMOS Real Time Clock uses BCD mode irrespective of
+control register B indicating binary mode.
+
 ### cmos-rtc-probe (x86)
 > `= <boolean>`
 
--- a/xen/arch/x86/include/asm/mc146818rtc.h
+++ b/xen/arch/x86/include/asm/mc146818rtc.h
@@ -96,7 +96,6 @@ bool is_cmos_port(unsigned int port, uns
 
 #ifndef RTC_PORT
 #define RTC_PORT(x)	(0x70 + (x))
-#define RTC_ALWAYS_BCD	1	/* RTC operates in binary mode */
 #endif
 
 /*
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1250,6 +1250,9 @@ mktime (unsigned int year, unsigned int
         )*60 + sec; /* finally seconds */
 }
 
+static bool __ro_after_init opt_cmos_rtc_bcd;
+boolean_param("cmos-rtc-bcd", opt_cmos_rtc_bcd);
+
 struct rtc_time {
     unsigned int year, mon, day, hour, min, sec;
 };
@@ -1285,7 +1288,7 @@ static bool __get_cmos_time(struct rtc_t
     if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
         century = CMOS_READ(acpi_gbl_FADT.century);
 
-    bcd = RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
+    bcd = opt_cmos_rtc_bcd || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
 
     spin_unlock_irqrestore(&rtc_lock, flags);
 
@@ -1353,6 +1356,48 @@ static bool __init cmos_rtc_probe(void)
     return false;
 }
 
+static inline bool __init attr_const is_bcd(unsigned int x)
+{
+    return (x & 0xf) < 10 && (x >> 4) < 10;
+}
+
+static void __init cmos_rtc_probe_bcd(void)
+{
+    bool bcd;
+    unsigned long flags;
+
+    if ( opt_cmos_rtc_bcd )
+        return;
+
+    spin_lock_irqsave(&rtc_lock, flags);
+    bcd = !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
+    spin_unlock_irqrestore(&rtc_lock, flags);
+
+    if ( bcd )
+        return;
+
+    for ( unsigned int seclo = 0; ; )
+    {
+        struct rtc_time rtc;
+
+        if ( !__get_cmos_time(&rtc) ||
+             !is_bcd(rtc.sec) ||
+             !is_bcd(rtc.min) ||
+             !is_bcd(rtc.hour) ||
+             !is_bcd(rtc.day) ||
+             !is_bcd(rtc.mon) )
+            return;
+
+        if ( seclo > (rtc.sec & 0xf) )
+            break;
+
+        seclo = rtc.sec & 0xf;
+    }
+
+    printk(XENLOG_WARNING "CMOS RTC indicates binary mode but uses BCD\n");
+
+    opt_cmos_rtc_bcd = true;
+}
 
 static unsigned long cmos_rtc_read(void)
 {
@@ -1614,6 +1659,10 @@ static void __init probe_wallclock(void)
     if ( cmos_rtc_probe() )
     {
         wallclock_source = WALLCLOCK_CMOS;
+
+        if ( opt_cmos_rtc_probe )
+            cmos_rtc_probe_bcd();
+
         return;
     }
     if ( efi_enabled(EFI_RS) && efi_get_time() )


