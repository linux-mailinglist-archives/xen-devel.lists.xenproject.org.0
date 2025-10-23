Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282AC023F8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149403.1481069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxbD-00064R-35; Thu, 23 Oct 2025 15:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149403.1481069; Thu, 23 Oct 2025 15:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxbD-00062w-07; Thu, 23 Oct 2025 15:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1149403;
 Thu, 23 Oct 2025 15:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxbB-0005s8-L0
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:51:33 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25ff1f71-b028-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:51:33 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42966ce6dbdso683658f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:51:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57cesm4840745f8f.17.2025.10.23.08.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:51:32 -0700 (PDT)
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
X-Inumbo-ID: 25ff1f71-b028-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234693; x=1761839493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Cp/OnTGttesfQdpppyi71qgWTMBvTIXz79fP5OO8Os=;
        b=UplUv+CdUACd7PJm13hLdEqQZXGjjkVe+ITIw4W1VAOsdwWOZFIR4dbXzAkmcRQy91
         Wiw6UJGffJWO5yjrNTWUumRTGNbvma5kYQmZk9zAIA62Y6MQWaJhvV5CTMfn4eQTZYKU
         W6j++PUN/2ohplkU+YhEQyKZMFJRfmaq4Wx8coFz3kjk+ugY4yZf5LxtZtP2n5VqbFsv
         AVnSlayXHWEuEDjA/93kcecT21MfnmeX28KnFJCyCP0rcM2x7ZHRAzfqUie5AoZvZoAA
         hc6R2vobhtB3zLZcIvt/RbPVMH2LaTDuUp513C9iF4qt7Dgve7ELj3HQMKCPWuyPefSW
         6M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234693; x=1761839493;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Cp/OnTGttesfQdpppyi71qgWTMBvTIXz79fP5OO8Os=;
        b=O5evsT/v2Vh5T9OC2auNbr62UkEK7E1Rw319CruShkcRfD5EXZau37bjIJmt3xQPHq
         lgSszdsN+qKWjvUiJyz0MEJdsJRvqLxmT0qBkep2RaPHE7Cp1aLfkY619TSnT1rIuw55
         sCyr/sPBRuQBzQXA8pEPNLDOtmHjDoKcLRT7cELdnCx51GNYKRTTkeVgKjcpXwSJv7XY
         xZfikp/FfaSSM72Xj60iYlP2hKIkQ/GLBjhNh+zGWGJhcmIRfvSY/BPD5EahSYgqDvW+
         m4ND7bRQ4Kz0y12vm4nXb+1cf5Xs063UGIQWWiWaOX0WTNNLlaOzRVEwtdjVfKip1wlr
         A+gQ==
X-Gm-Message-State: AOJu0YyeY+r7CwcaJBIs7Eayhp7Yr+IJUdjWQHz8L4bAyR+q+iYxhu8u
	EWaJXdlTkk09/z3glo2IO/YQqldN9zdSU70rS/RqtBpvOhX0ClCy8xjeEToPKRRMHT23GUn9KqY
	6pAY=
X-Gm-Gg: ASbGncvJhi4xYLN/zp9fKZpKq0xVmsIWtu97P5EguBcTjSOTurGOmlwBIE4/2dZQRM9
	QBOPFvcdnvdGXK7U2NlDcmFO2/JcDqDzd3ezT2zD4ZdEpcYrIcw4zdFD657qhGeTwTJsQG2oL+I
	gC7wyOWPgb2/g9HeDIdFYdOKNGo3cQGOlDEbwtJA2jEWbpIy4Me4ovm0kE7riVYoDSq6tyyP8iZ
	zt446+66rCc+cR29R9+bfvSgnKbvWVkYIvlBbXhdrD9OTMKBO/t5YeO0jzAvpf2lrOmg8asot6Y
	sq7RlWuTyOd+pZ5GMphvqopuYIP42daMDeZYBLXoq+cNoJdarIZpYOyvwFqvhzW/dlW+HJV+Dhy
	NDAYYMKI8z3GsdX9yBqLG2kACf53uTpMFNhrhGWrCNZGf2ZEH2aK9olR2iLkedYxI2EYfS/IIaP
	2EidCEBp76R38Rz0F+LeQTbC+N/t5EFy5e1Q4GZg9Wukgb6zlL4E5g/pFMmUgU
X-Google-Smtp-Source: AGHT+IGLFPt8XWzNziO8+TFnxf6btUr/x7MpRprI+egs57Qzic0bKY+EnzRQm2pRkFNcZvzYpSuh3g==
X-Received: by 2002:a05:6000:200f:b0:428:3e7f:88c3 with SMTP id ffacd0b85a97d-4283e7f8a82mr12867040f8f.50.1761234692571;
        Thu, 23 Oct 2025 08:51:32 -0700 (PDT)
Message-ID: <1a79b0dc-56ee-4dd2-905e-bf989e6a6aed@suse.com>
Date: Thu, 23 Oct 2025 17:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/9] x86/HPET: avoid indirect call to event handler
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
In-Reply-To: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
@@ -653,7 +653,7 @@ void __init hpet_broadcast_init(void)
         hpet_events[i].next_event = STIME_MAX;
         spin_lock_init(&hpet_events[i].lock);
         smp_wmb();
-        hpet_events[i].event_handler = handle_hpet_broadcast;
+        hpet_events[i].event_handler = true;
 
         hpet_events[i].msi.msi_attrib.maskbit = 1;
         hpet_events[i].msi.msi_attrib.pos = MSI_TYPE_HPET;
@@ -810,7 +810,9 @@ int hpet_legacy_irq_tick(void)
          (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
          HPET_EVT_LEGACY )
         return 0;
-    hpet_events->event_handler(hpet_events);
+
+    handle_hpet_broadcast(hpet_events);
+
     return 1;
 }
 


