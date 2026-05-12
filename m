Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JFtATFAA2ro2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:58:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940552320F
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 16:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306883.1578615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoZK-0008IE-US; Tue, 12 May 2026 14:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306883.1578615; Tue, 12 May 2026 14:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoZK-0008Gl-RQ; Tue, 12 May 2026 14:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1306883;
 Tue, 12 May 2026 14:58:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMoZJ-0008Gd-FN
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 14:58:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoZI-001UUo-SJ
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 16:58:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034015-2eae-0a2a0a5409dd-0a2a4505cdba-38
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:58:44 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034024-aaa8-0a2a45050019-d155dd2bd5dc-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 16:58:44 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso3076242f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 07:58:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549120ec0asm32552049f8f.17.2026.05.12.07.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 07:58:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1778597924; x=1779202724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vb/ECc+CQkgyVidhmMkxB17AGrIKgu+mPY3rejswq4s=;
        b=AdKyJosijduxu28veENhrg152LJlxB9mD4NRq/mmLOeNAEqLnebMaICtVpHUNf2QwB
         IDIrvdCqqSi607iPeHq0Yn5kdn3Cx2j4ohRrRJRq+ur1QZMQhP1X2CucvECyQOFYIphP
         9HJc+kZVEwX6EtgOAgVOXYPwHr7u6VoUSlpT5AQfdkSTr5SJVtRnKfvrhMU49ZHJzt2r
         n5AjNEvt7uFQkZPWcseQYskiScXbQRPBPGqkRhQZoEBX2qUEHUAriJWMRcoBMd3gj1QG
         rhKj22yohOb9VEuVVsIlDX6tUcpwXgSx0W05K1bi3dghh60BJZtjk3tlp26sg10E8vc/
         2Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597924; x=1779202724;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb/ECc+CQkgyVidhmMkxB17AGrIKgu+mPY3rejswq4s=;
        b=hmHuCCdnGflSS8oWQmsdfWgjlGJwvgNp75FTeweE/Zkw+HDANepS6gCQg5XqbhLj7O
         n3+zyr8Wnnt2sL/dT/1IFGi6nrEYoPruSxLzA7T2qixJcPgDNAjBYnhiVbNOAAWI0NMJ
         /LHsR2c2famS400VcPxoPkEG2M26bQ94wLBDcD3lcXO5mKHhkpgh1sdp7pj+b2lwgF3t
         9+mG3M3WXwhgIpQ6Jg83Ql7eIuyMxBpziMKIXKGAzvoaeCsVSeAUR+1NDOuLz+bgNYLN
         5IZzBpByzL1c5YSJFty8QOCfNGGPhk6f3W5hDhyxDNDhY3QFIBcjk/ScmfG5oDW8ZbNK
         PyZQ==
X-Gm-Message-State: AOJu0YzoNRJ6pMzH1ImJ3OPyGPpD1bovGQ4kbE5zF2gDlbRaP3v1tBQJ
	30yTy++FcFiHL1MXTgnZFSKmNPb5J4YdKunDQHi0S9fk+w6ZY1+9PFnGNG7Fm+3azVjGSB8Rjws
	H7cQ=
X-Gm-Gg: Acq92OEFJ9zeRBV0TdzLE/7r1HOPOicqYiWqFWGteIrzkPwZV0b8s4iX9CjBIl/82v7
	bVH2HahbcHsufEwPlOQ2mQjLhsP1hd/55ERCzo4w2gkaQHDkFyPWhgmNkHjUduOpk9tMnvs6E0Y
	+/WYIXqO5h4T66hm7AIDGwMYTA8B9gWiE2KTzC9rjTrwMPjR4aBdRx52fYZRc4+mTECrH9Np05A
	3kM0qzgX9WizZ1JkXefRILYvbJ1AO8LNcY8jKhwi1AQufcmi3dm5utXQ/uCzUFfRjLgN9H7bGR3
	fZX00qQv1KhbWXZ3/KGQSCLzsyN1lQeA5N97uvKFeDf0P+mxanYTViY56T7yeqojbYcX0NzXJon
	MYxSZCGdXqAH2Ufr2fewdRRHwlBDcdRZRahKifuvr2L5p/lFYl9N9G+E+sh6cJxOV53oZCoNol6
	Vla/sbGRxZDf5E2tyOlUkypNpglttLrDxi4nqwxLY5n7FhjTgD3JUSO5vAA/RbdtVOj242yoh48
	fCpWVXgVlw/bXHrniYQT6dKGA==
X-Received: by 2002:a05:6000:310a:b0:44a:52d5:e4f1 with SMTP id ffacd0b85a97d-45b115c7b81mr5059543f8f.5.1778597924266;
        Tue, 12 May 2026 07:58:44 -0700 (PDT)
Message-ID: <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
Date: Tue, 12 May 2026 16:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 1/5] x86/time: use RTC century byte when available
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
X-purgate-ID: tlsNG-c201ff/1778597924-D8145443-669DBB71/0/0
X-purgate-type: clean
X-purgate-size: 1198
X-Rspamd-Queue-Id: 6940552320F
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
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

Without this the present logic will misbehave from 2070 onwards.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1257,6 +1257,7 @@ struct rtc_time {
 static bool __get_cmos_time(struct rtc_time *rtc)
 {
     s_time_t start, t1, t2;
+    unsigned int century = 0;
     unsigned long flags;
 
     spin_lock_irqsave(&rtc_lock, flags);
@@ -1280,6 +1281,8 @@ static bool __get_cmos_time(struct rtc_t
     rtc->day  = CMOS_READ(RTC_DAY_OF_MONTH);
     rtc->mon  = CMOS_READ(RTC_MONTH);
     rtc->year = CMOS_READ(RTC_YEAR);
+    if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
+        century = CMOS_READ(acpi_gbl_FADT.century);
     
     if ( RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) )
     {
@@ -1293,7 +1296,12 @@ static bool __get_cmos_time(struct rtc_t
 
     spin_unlock_irqrestore(&rtc_lock, flags);
 
-    if ( (rtc->year += 1900) < 1970 )
+    if ( century )
+    {
+        BCD_TO_BIN(century);
+        rtc->year += century * 100;
+    }
+    else if ( (rtc->year += 1900) < 1970 )
         rtc->year += 100;
 
     return t1 <= SECONDS(1) && t2 < MILLISECS(3);


