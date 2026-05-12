Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEBTOIJAA2ro2AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:00:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E7523244
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306906.1578642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoae-0002KW-PO; Tue, 12 May 2026 15:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306906.1578642; Tue, 12 May 2026 15:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMoae-0002Il-Ln; Tue, 12 May 2026 15:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1306906;
 Tue, 12 May 2026 15:00:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMoac-0002Fv-R3
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:00:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMoac-00AJkn-7g
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:00:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034076-bab6-0a2a0a5309dd-0a2a4508cdb2-0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:00:06 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034076-63b5-0a2a45080019-d155dd36ac8c-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:00:06 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso3656599f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:00:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491304387sm32459259f8f.21.2026.05.12.08.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:00:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1778598005; x=1779202805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2L5XWk37Hty4eGHWvaxUEX6h6h0l+D2/1Nxh6sBvqFg=;
        b=D/oRAY/Z1bkF+oIGgGRd4+OFrQSm96a6pXz5gi6UnrF4kIPoPz57Dcsy4kAGyZNcXE
         +2hvOMwtFof7EJ5yYXXeHmuvRau8mnnno641O0P24NUhA4vT7ilYL4jHIwscWHSOyhG3
         2gyOAuk0Cz4109RZOeOn5ABb3ZSmfqW3HxD3Rwsne3jk3WYPZvj6J+j9xqJtgI1JdAu8
         uC41ue9axhLZB1RDpRIcuxhoEZ3x24sSv8PbVP5kdlAWqxJxrMaSESRDyjLZtBZoO4DP
         Lb4uDiq3N7Q60/nm4cw40ZUCYbXiSEg3ZEBT+kfnLuw6uMr0/U/m5Wlux/cVILEeYEt5
         QPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598005; x=1779202805;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L5XWk37Hty4eGHWvaxUEX6h6h0l+D2/1Nxh6sBvqFg=;
        b=d0AaBMnSKWLqwk8ws34rplh8xyror5+862NSRDmGSN08O+XVNQoSyMk9cQzUKETa+C
         OGoWHU29hlcS9y3q6WJq7U39rSK9XDNDKdllgUxtmop7EsYnr8m3D9KW2aW64pTK33+2
         FNqbjwbvI0bWY4o6jzj9jhKsMvSG+1AMmGIvNGfJ6ZUYdeoejtd63/63JfOq1OFPpbmD
         wYo76UHmlk8JuCJPTHLn+6lNKmwh8xZ2yFB3t/e4xABAFNADQ9ck75RP18RuCc9wApN6
         9B9kPhXRuA9IXF/5pYi+cxa6uofbdM7EBg8Wr4C41ic+LeZOsXOavvywoZy7g3pQLJDn
         bFTw==
X-Gm-Message-State: AOJu0YyJRH76MG4LCklmOjIsOaU9LpYecqUSg+CFbs23HiNOus/eZzR0
	vycGJ3/VWJ6qK4BUfSyaKn2ZNzs4w1yZvg/u94B4RvhFdGS1312o22owjl7FpH9LCQXKK1CNO0m
	uaM4=
X-Gm-Gg: Acq92OEkFAuJTpSKE2Ax2pMdSD6fGnuUVKZXXHdhGgupqgK8gtVjH3eS+CAldgOGG0F
	Cq3eoSof11vR2TWYaZdcUAWr8WZVzDdjRc6Zl9mVlnuDNDEm/JLzy84YbRRijmGnXkZdAJzEK5J
	XYcIpN3C2PAOVJRAaqwZMDmT/tp2qHYxhg3kDh2vl1fmMAGBWswyS6kSlJmkoHhGfGjwHN7NmwV
	xjJpAsOQ6kxbrsBYEtFHGOav3YXZXY2plIpzioEBiQn1io+hZtEnX0lOFT6YnvAiQseqiVgKh40
	yd77lM4L1CKHa3LAiLZ2LZnex3g6hKgXmJdLveDs5PT4KS/+GrO5ie/ZXzZXwyTEjw857XY/1DO
	qZXvM0HaGdZJXS6KsYpExNq/sxoGT3N/9I5y3x09cVormFaN4krRbD85ZoDzXeWcpsyF23jdjXK
	T4DpSFx5Fk+bcgajHwSQKU4PQdmkjRX29+ysn71rMps/+oSmymSG/2Ux1wxcARoRMvF7set+Pf
X-Received: by 2002:a05:6000:1a85:b0:43c:fdd:ea96 with SMTP id ffacd0b85a97d-45462c342e0mr30075541f8f.26.1778598005512;
        Tue, 12 May 2026 08:00:05 -0700 (PDT)
Message-ID: <dac2443b-3ef4-4508-aa49-1e7d68a72d02@suse.com>
Date: Tue, 12 May 2026 17:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] x86/vRTC: use available macros for BCD <-> BIN conversion
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
X-purgate-ID: tlsNG-c1860d/1778598006-C5386DB1-604F2D14/0/0
X-purgate-type: clean
X-purgate-size: 889
X-Rspamd-Queue-Id: 554E7523244
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

There's no need to open-code these. No functional change intended, even if
the | changes to + in to_bcd().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -253,18 +253,18 @@ static void cf_check rtc_update_timer2(v
 
 static unsigned int to_bcd(const RTCState *s, unsigned int a)
 {
-    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
-        return a;
+    if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY) )
+        BIN_TO_BCD(a);
 
-    return ((a / 10) << 4) | (a % 10);
+    return a;
 }
 
 static unsigned int from_bcd(const RTCState *s, unsigned int a)
 {
-    if ( s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY )
-        return a;
+    if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_DM_BINARY) )
+        BCD_TO_BIN(a);
 
-    return ((a >> 4) * 10) + (a & 0x0f);
+    return a;
 }
 
 /*


