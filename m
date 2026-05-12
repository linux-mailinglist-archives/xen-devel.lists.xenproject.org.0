Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHgxEkJAA2ro2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:59:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9452321E
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306887.1578624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoZe-0000GJ-9d; Tue, 12 May 2026 14:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306887.1578624; Tue, 12 May 2026 14:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoZe-0000Eh-6Z; Tue, 12 May 2026 14:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1306887;
 Tue, 12 May 2026 14:59:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMoZd-0000EM-7h
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 14:59:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoZc-00B5ja-Kr
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:59:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034037-5cb7-0a2a0a5109dd-0a2a4506e0c2-4
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:59:04 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034038-7371-0a2a45060019-d1558029f084-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:59:04 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488d2079582so59943355e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 07:59:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8e566cf7sm36384185e9.0.2026.05.12.07.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 07:59:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1778597944; x=1779202744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RtTs+7fsFA7jyJwnZMuGqHUYX2G2jVMYQ4upOGKNn6I=;
        b=OPH+LzGLdGsl5lvR3urPIkpn6vtSX76DyKQmdc0SChH/5gl1JfZ5EAHMS6CQOJhmst
         PerqNdZrEChEiB0D/kytk2JLuFrsv0olaSkeSafZ8+0Tmwfgz1cuv6UQed1LrhSLkV3U
         PAS/x0PhbwBEb0asnGAPPU8evwM9cyPjodpVCoXWu8swg/ejjjevTMbRF/afPpEVwsxk
         vI2cIl5dGLRo1tdzp1tYXE3A8G0Yv9qSUriibPkGjCSyiHsAIla+xTdylhH553hJ31wZ
         tBII7otLmxClOijtGIhSYNdFieCVL+Gs4oqI+8cDJc47L/QUv6Tex5KlsD6UI6ZiaAKk
         dSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597944; x=1779202744;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtTs+7fsFA7jyJwnZMuGqHUYX2G2jVMYQ4upOGKNn6I=;
        b=JRca08NTpslnZco/6ZOR2wjuToxze3qd6kOzdIlC7luEdDU42oHvzt9VNJvrKxhWip
         IsRmDD10EZbPn/PKTtRJtWqvkAZwRsUWsnfwOIsSo5KUE03gIazugYrIWA9qkUNd9QeF
         iKJsV0QvRYUJSGPMyeth7jUCAe1PxwCz7GvYWYyU+vpTj+C6fE6KdTg+YVOGErLGNK25
         d1oXN4Vg5ol3yKHv3myu+AI3w3XXsCZb7dSfL16+1ckGRHyI5VGpf71pU4K8gIqtluj7
         5VVpXKpnDsdaYEkIgkyahGeYUV3x5bvak8+uLAoJ9yhPWMSXRX0P71yRTSGk50u1JyGl
         k6gQ==
X-Gm-Message-State: AOJu0YxtGh7IOuYE+lEkAjMuARBqTjyfJW0OT0DkmMS3Vn8mNpLo72Dj
	7XNR08YJoF4TMm+YXslNsq5iedl0Bpe+QzHK7Zz1TFtwK5vpNfMtGTYHTCT9YhPDbtzVMSclV4L
	ngBc=
X-Gm-Gg: Acq92OFf7TOHCOIdq1C22MhW52Z3ITN+/dvF30YcnHyhhGIXyGAPtHjCXCthvOmnnId
	H1lsYX86d5kDKuz41LiarRTAPeQh12OxmXlkaP7fecEQ9luW/WZKDXHsElkuApSN1vjcB7dKU1B
	blygT+3NETvPJPA1s9j3tDd4CE8mAgljSFjE1CxIdH/z8Ak0hPGovfgdYfPDiyfbIZ/pYxtmCDB
	C9nocekemGM27Z+tJ9kNVfV4jovuBGluW9G94397qWdi+zXC7XoKqItOZhvJwVCWbPRQadqBIT2
	X/nLV3PrxDXursiVv9f9gH1oI0T1XWaMmoQX+XxHlcnqLapJAbP6njbk5eSJ5xe/me1g5zuWtRf
	cyrNLmOJ38xx532/KYYyDHPDOZ0aAHlMUKsKv9wCpuC+X5fxX9f2zWo/o2FuUMgsXfWbqRh6nLR
	rSKwX+qT+8/MEvxMhbhbh8Yi1yDRXi0wpio5hyApqr0aM0GNf7QChzePIwJbBynDIHS4ffpdRag
	eDy7VkI5/hYfMg=
X-Received: by 2002:a05:600c:1d18:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-48e51f41b9cmr453681025e9.29.1778597944085;
        Tue, 12 May 2026 07:59:04 -0700 (PDT)
Message-ID: <2c5af8f9-05f6-43c4-afb4-a50cbacd2d49@suse.com>
Date: Tue, 12 May 2026 16:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] x86/time: move BCD_TO_BIN() uses
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
X-purgate-ID: tlsNG-16d1c6/1778597944-8797CD75-EA009AFA/0/0
X-purgate-type: clean
X-purgate-size: 1496
X-Rspamd-Queue-Id: D1D9452321E
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

... outside of __get_cmos_time()'s locked region. There's no need to hold
the lock for these computations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
How come RTC_ALWAYS_BCD is compile-time constant 1? And then even with an
inverted comment? Looks like we've inherited this from Linux, and even in
Linus'es current tree it's still this same way. Yet all half-way recent
chipsets I'm aware of properly implement the DM bit in reg B. Might this
be another 32-bit leftover?

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1257,6 +1257,7 @@ struct rtc_time {
 static bool __get_cmos_time(struct rtc_time *rtc)
 {
     s_time_t start, t1, t2;
+    bool bcd;
     unsigned int century = 0;
     unsigned long flags;
 
@@ -1283,8 +1284,12 @@ static bool __get_cmos_time(struct rtc_t
     rtc->year = CMOS_READ(RTC_YEAR);
     if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
         century = CMOS_READ(acpi_gbl_FADT.century);
-    
-    if ( RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) )
+
+    bcd = RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY);
+
+    spin_unlock_irqrestore(&rtc_lock, flags);
+
+    if ( bcd )
     {
         BCD_TO_BIN(rtc->sec);
         BCD_TO_BIN(rtc->min);
@@ -1294,8 +1299,6 @@ static bool __get_cmos_time(struct rtc_t
         BCD_TO_BIN(rtc->year);
     }
 
-    spin_unlock_irqrestore(&rtc_lock, flags);
-
     if ( century )
     {
         BCD_TO_BIN(century);


