Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DBC64AA2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164050.1491068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Lr-0005ay-8d; Mon, 17 Nov 2025 14:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164050.1491068; Mon, 17 Nov 2025 14:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Lr-0005Zb-51; Mon, 17 Nov 2025 14:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1164050;
 Mon, 17 Nov 2025 14:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0Lq-0005ZT-1t
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:37:06 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e30d29f8-c3c2-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 15:37:05 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b739b3fc2a0so167231766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:37:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4635sm1097379066b.26.2025.11.17.06.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:37:03 -0800 (PST)
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
X-Inumbo-ID: e30d29f8-c3c2-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390224; x=1763995024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AKQeDaPnIv1KfZ5B6JBPXaTggTJ6NzsOedI2MNMCM30=;
        b=LsDfhiB2wCikk4KkLyTIKYREJktRIGeECR1sI3hp+/M51IxKi362k1fFaMLh094B8L
         BlvnGWQGxR+0UJK76coJRK6nfK82go9pyldtl7/KP2yD2Js41qEcayt1qUtQhOLRaHBt
         bfnCDaQXPJuQfmCqzX2weRMtkfd9v+hTLkf0nRvyjSXMtSWRPZUvRU+SEqwvjjPJ3UOA
         uybNKHqD9gFizgTdat/2NZ8uvmVne46NGZnTklUM7Qd4ZnTGnX/YLyOts4WR8RmJPJT9
         qP8VsmrKR/NtBgyPyaWEugokegJ9lKRCFXXfChH+5RnVp0wyFwIBky8fk5gik052uaak
         xPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390224; x=1763995024;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKQeDaPnIv1KfZ5B6JBPXaTggTJ6NzsOedI2MNMCM30=;
        b=N2R17P6ebgplDwmRF8xSwQx150VBX0r+o57SFqbEm2x1NK71dj3V2WPmfYzh2eAbMU
         cgJxMhoBaiu2GlgH5Dk3TsM00tVQetN2LiGAi4sKiFWL4qbSgu7F6fs9HrAoz19Oisdf
         kpYTf/h9msQStD8y2l+pIeepadYeyag2gpnTBNSx7yTOYKmWoV26978i82DiSLiM6rLK
         XDE4S2VCwdyA6xRPNp7gdrVfl6Bjgp9kBGlRqBK7brNrOuja1PVz+yaqJnFlHIlY2S2G
         2fKsuw46Q5PeWxNJ7yZjyfLOUkPRrCAVyWA7giX+eaM85D6k9brDcL/+Dcin24CDLs2N
         C7mQ==
X-Gm-Message-State: AOJu0YymdKT7ULArYFJy3aMptTH+Sb65m0CbETomWOW2THV+2fODuY13
	Di3BO9kLyhijS/lUADb1f7LMBKSmI4BACDh/j3gZQIz1u1MQkSFAQs3mBpriwwd1iQ7gf2QtT9w
	lClA=
X-Gm-Gg: ASbGnctPBhDTxThzJROg3NvryF1xpFpwC8FJ3RgTJBkeZMjYpi7bv2wACADVv2/zK2B
	+9qUgachwspmPylGoFa1iT/403mhqAvVrA7szHn0XaK1d4Y1Mdlr4HID6a0TI0rKrS/GzDWKPOj
	pLoZ3tznfnA4bhEE7U3NmXrhzGZscq6eMdEyM7jp8vF984reqlHEDMHGEEA6jh7GP0tkfJhPTig
	xQsa6C2tGmCk3wZainVwD+5CnEbdsqj3SKNyENXprXt+JbR/lBX7+j0kcCFJ9CghSGA7XjKmawF
	coGOctfkUXo5PN4MB6S9DRAKBRZzPbcGEWjS2wX1CFgZ7RRHulfTXfqU+DtckTxkVamHLCxcIqx
	umh1yZ2R14RuJTq8F7K3kdDW1jO2TAFnl2Kbbi7oeiY3dYmaE7xD+JvbjMkEUlRmDNYEkZVi9x0
	sYeydrPjsi6OEy6gc2ajYTQz85q3/AS3c5rNuztP+XpCVk867NE8Hh623SzdPeGJ49M65HNrTvU
	Ger3EITTLhyUw==
X-Google-Smtp-Source: AGHT+IEkCvQPlPu4gcwC5trd8MEVUbQiQgtKA88WNv5FDtC9Zf0YNwlyJgEtQZ6fQFNQdG4Wr19P5Q==
X-Received: by 2002:a17:907:3cc3:b0:b73:2d99:d8a3 with SMTP id a640c23a62f3a-b736782d0a8mr1464255166b.26.1763390224429;
        Mon, 17 Nov 2025 06:37:04 -0800 (PST)
Message-ID: <1af753e5-33a1-46de-a407-969059e7228f@suse.com>
Date: Mon, 17 Nov 2025 15:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/8] x86/HPET: avoid indirect call to event handler
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
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
In-Reply-To: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's only ever handle_hpet_broadcast() that's used. While we now don't
enable IRQs right away, still play safe and convert the function pointer
to a boolean, to make sure no calls occur too early.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over changes earlier in the series.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -40,7 +40,7 @@ struct hpet_event_channel
     s_time_t      next_event;
     cpumask_var_t cpumask;
     spinlock_t    lock;
-    void          (*event_handler)(struct hpet_event_channel *ch);
+    bool          event_handler;
 
     unsigned int idx;   /* physical channel idx */
     unsigned int cpu;   /* msi target */
@@ -194,7 +194,7 @@ static void evt_do_broadcast(cpumask_t *
        cpumask_raise_softirq(mask, TIMER_SOFTIRQ);
 }
 
-static void cf_check handle_hpet_broadcast(struct hpet_event_channel *ch)
+static void handle_hpet_broadcast(struct hpet_event_channel *ch)
 {
     cpumask_t *scratch = this_cpu(hpet_scratch_cpumask);
     s_time_t now, next_event;
@@ -250,7 +250,7 @@ static void cf_check hpet_interrupt_hand
         return;
     }
 
-    ch->event_handler(ch);
+    handle_hpet_broadcast(ch);
 }
 
 static void hpet_enable_channel(struct hpet_event_channel *ch)
@@ -657,7 +657,7 @@ void __init hpet_broadcast_init(void)
         hpet_events[i].next_event = STIME_MAX;
         spin_lock_init(&hpet_events[i].lock);
         smp_wmb();
-        hpet_events[i].event_handler = handle_hpet_broadcast;
+        hpet_events[i].event_handler = true;
 
         hpet_events[i].msi.msi_attrib.maskbit = 1;
         hpet_events[i].msi.msi_attrib.pos = MSI_TYPE_HPET;
@@ -814,7 +814,9 @@ int hpet_legacy_irq_tick(void)
          (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
          HPET_EVT_LEGACY )
         return 0;
-    hpet_events->event_handler(hpet_events);
+
+    handle_hpet_broadcast(hpet_events);
+
     return 1;
 }
 


