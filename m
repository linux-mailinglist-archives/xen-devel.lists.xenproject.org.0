Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E07BF0D29
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146198.1478673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo1q-0007EQ-Ie; Mon, 20 Oct 2025 11:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146198.1478673; Mon, 20 Oct 2025 11:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo1q-00079J-9n; Mon, 20 Oct 2025 11:26:18 +0000
Received: by outflank-mailman (input) for mailman id 1146198;
 Mon, 20 Oct 2025 11:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnvY-0001y1-QE
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:19:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b030de25-ada6-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:19:48 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso21402135e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:19:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a0f88sm14360924f8f.7.2025.10.20.04.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:19:47 -0700 (PDT)
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
X-Inumbo-ID: b030de25-ada6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959188; x=1761563988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CR7zFEwvrxzSG3gB+46rCvPXK38/dK1o+Nvm/MzzJ9E=;
        b=KU37/lenM3sFxXsCG7bWjyd56Lab/YJ7K6KDTHxjLUxriGFt4jS/6528MyWhd2EuHl
         GiXuP5jUDXfyzSAKgwCcCxF6Wn1n+oS9ZupoDFOxmO8DzlXNId1OQyyUdVhH5ULRFVFR
         L2x/3ZlDBO0BWVUwM4t9JqefQ7d8bSa0Kb2ouV6/S54EbYzOAaGGLvYNGE5ZLfRYQc/U
         uYLvlVGQKZl46uVEH0Imes1poM+7Bt4jR57kWatTSp7BRkkl5ZUYQBcXAw1hco8mry7F
         wMvRiUTR4F3eRqyVSnnO1zmj4VA8LzvScFWbKN86XuvoM7LcKgdL6B+hCjy/cFiOSSUE
         b4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959188; x=1761563988;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR7zFEwvrxzSG3gB+46rCvPXK38/dK1o+Nvm/MzzJ9E=;
        b=VMCyGFYaptIEFXWs3dvFy8mLpz7wlbtcCGmGE22bFQeOGtBlr1dC6qOPjdDm+SAPrY
         J/Xrphr5vqkEptMUojeV26CG0WaJrBM1C5YO0w7jqHFf8D/K37F80l3b8eHRbJ1o4nMP
         14kG+FGTYQFX3c3G3EnAB+VIbCnh6rNRpqpb+EhwvSN4FQSR1HrFNZwQo3wV5wy77m/n
         dGuNemw0S77t5G8zn/gibOuX4p4ilwsiggjvjs7q5eITB4KordunxGzEzDfwX5Aq+bVR
         yE0IVLhnQQZNxSscVXEYQXSy9BsbNMFDigngGUXlRW9jICXcuhDKzwS43ajzxQ7NOBJz
         yImg==
X-Gm-Message-State: AOJu0Yxo2Dhzxj4iJoB+rj0p7LYlD7ooEJsa7JODbpp2SeL9TYdPdc+l
	j7FNjvEXADbVuf7D0AvG0dhBysHRQThTofovYQte8jHkJ2pUfKVBzxgUcLyH28VCzdqfcsDwpTo
	rEH8=
X-Gm-Gg: ASbGncvGTPFnwTvn/2qBEJBIVmpF8tyihHj5DB0q0FZj05IadvbylqVoSzGdtPr7QEZ
	bqW5ZfuW8xVOq2QYTXBdGVqjNTRRH88VmvK/RffpG57gf/gvW+HIeP2evOcvXt51ySnjnKkbeB3
	8onTEIEJre688Q/MJfYZnUMeDqXMVp6eNPNFtvLUIALSWh5jtHYGSX/SDhSRoJI9mMQ6GCW6IoL
	hXjnbX8L+k2ffEXAM7UhJY3lahaBidCRf8kBBAnWAIjNYCMnaFa7cA/1emMQ/Vvvk1Sc9rs8NHN
	YG6HQ+wNF3IptQdVi3wi1kfoEc80e+rsyO3vvaEnEnqnv/yh/Uo3uzaD7/DAAHJndy5ilRiKo7P
	53wO84BUUcJNdoP+oNI3TH+di9/nGTkrbKq+p4yNartbNyn3J4JcIny/nqXpmGJXa9czkqBcpQJ
	NhgFo/jXhTyPAnDk8KK8Ap5ym+vQLuSQpgE52hKbTkpicA1MZ5iJo+WYAo0r9gUbqXBwXzJRQ=
X-Google-Smtp-Source: AGHT+IEd49XdP31L+DSylBiy/DOCgThBkpasnl3hoODQF5+iU+ABD66x9VEEnjzlv83dAxeMPWlKDQ==
X-Received: by 2002:a05:600c:4e86:b0:471:13fc:4ad3 with SMTP id 5b1f17b1804b1-4711787847bmr109747565e9.2.1760959187605;
        Mon, 20 Oct 2025 04:19:47 -0700 (PDT)
Message-ID: <ce20e740-5f5c-48c2-a1a2-b0029be268b7@suse.com>
Date: Mon, 20 Oct 2025 13:19:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/9] x86/HPET: avoid indirect call to event handler
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
In-Reply-To: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
@@ -808,7 +808,9 @@ int hpet_legacy_irq_tick(void)
          (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
          HPET_EVT_LEGACY )
         return 0;
-    hpet_events->event_handler(hpet_events);
+
+    handle_hpet_broadcast(hpet_events);
+
     return 1;
 }
 


