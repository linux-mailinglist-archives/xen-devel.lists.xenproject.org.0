Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E990BE1F12
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:36:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144232.1477696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IWx-0002bO-D9; Thu, 16 Oct 2025 07:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144232.1477696; Thu, 16 Oct 2025 07:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IWx-0002Yp-89; Thu, 16 Oct 2025 07:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1144232;
 Thu, 16 Oct 2025 07:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9ITr-0006T6-1N
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:32:59 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55e0c517-aa62-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 09:32:57 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4710022571cso2744345e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:32:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cda4ecasm13066995e9.4.2025.10.16.00.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:32:56 -0700 (PDT)
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
X-Inumbo-ID: 55e0c517-aa62-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760599977; x=1761204777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DjE8gka2JkJuiym43SgnPm2cUSuJ0d65kAjd/ktU954=;
        b=d6bhth1Y3QfpUjMOMz3xMLcYW4R9Ks5zSYv68Ep7NxXGvGrxQFNSaIVgeq7iVEgMRl
         EbXB180+Wpldmu/zxxveXFm5F1V0U/mPsX+t0Qd4M1CE0uqBCTIldm0fsZZSivoYjFWt
         X6Wu/v2YnnZBtHngYVT9g/tmyBQeWuxjmmlHr3WMU/zNLgUAtBe5HssgUxhWwA+YPCeA
         B4N+a80JXJcLFjnJPPc+1RLro6vHolRo5+cCwwMylHciAUno3Z8cgkE1ctK0IPaQTbN1
         stzR403rygyCQN7Nd03C1bw9DwIO7M0WNgdoUiLmv9NKjXeSUWB7QT0CSDUb8BgF8VdC
         TR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599977; x=1761204777;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjE8gka2JkJuiym43SgnPm2cUSuJ0d65kAjd/ktU954=;
        b=hdxNV52GTkFlEUeGqw51QaMj2P/+wIgneLElkwhNps4ACDvuUfq9QkuxniaIgCQYRm
         7l659OyMXCi/KlaPFGaXWc1sgItcjaCImr1Ry6ab+3fiuSEbbpxMz+NxKQd1aI88W8si
         a8vgmw8/1LClwux98VkpNdGefFQGrEu1v40fOMJyQ1CK8veNWe0WWQRttAgJIxL20Brp
         kl9592LC4a+RgOhlM09Q+TZPN+I3vkitEt49TZf3hQ3G+qY/GB+qDAmmc+sPLX3EkK6y
         hJEdYONA57GcnUCuUVS2tsscoV/OIsTfbjBH/eZ0Djp+VuR29DSZ5WYTJYQQdwxELZqV
         17Fw==
X-Gm-Message-State: AOJu0YwNoWhFLOYkHXrEBzy2eAlPPvu/mKxGGYkNMbx+cpybrlPbop4s
	SCjKtckBAeFTqFrU9ge48Q9ue3p9VatMziWBHqkQuupv6AXobsUCKzsS8EIfr2y8ugq4FWKCy3O
	oMfs=
X-Gm-Gg: ASbGncs0NWeA1yAwZMB0m6Fas3HZ7cbD3xP9bG5fuN1RzND0twi8w7AbbwHXACT+8Un
	IQzkU+fpVcq61biNYk2KakCEbr8aIDjws5lrwZSycZ4JMEXvtXIyhXeogxw1p4zH7hUw6GsbcgX
	P8brvKCWgeHjog0kT5VdTEWNMMhaYbJZG10i+/dN854Yuw9gmmdGnUP2TeUlFGHztOWWgSjoaKi
	sl81JHDUR4/J72Gu1uiWhKk1h1xRDZNXaOuhzQg0E6TdnQbYQr21k+VhvjD4sbkJpI/R1lEYcvN
	P588FCrQSkOahRfV5S/jps9rseUVlWgWxDORcFVpOBMTm5GGkHLNC5DCK6BASz6T0TRqRJERbi6
	lV6xGVsrM+q72slok46eIqVJnya1G9wVm4MkRa4b2NhyC9zr9tuaSgWxYace0SEnVOFxk2YN5Tg
	la5ZkmiPjjc+7gT8a3EIvxrXdB9UmqZp3BG0Xbng8d/uLg3kk1+MysqHSO4081FibgHBYQNNI=
X-Google-Smtp-Source: AGHT+IGanN6vEl768wvh1OFIaksRzZKkRi1RkoP8MrA3NSYqwISK0JR5AqInqjhmFTslkWtI+bItdw==
X-Received: by 2002:a05:600c:83c3:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-47111a3a6e9mr8877025e9.37.1760599976754;
        Thu, 16 Oct 2025 00:32:56 -0700 (PDT)
Message-ID: <a1baa567-6901-48d1-ba9d-f0a688de7eaf@suse.com>
Date: Thu, 16 Oct 2025 09:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 05/10] x86/HPET: avoid indirect call to event handler
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
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
In-Reply-To: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's only ever handle_hpet_broadcast() that's used. While we now don't
enable IRQs right away, still play safe and convert the function pointer
to a boolean, to make sure no calls occur too early.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
     cpumask_t mask;
     s_time_t now, next_event;
@@ -254,7 +254,7 @@ static void cf_check hpet_interrupt_hand
     if ( ch->cpu != cpu )
         return;
 
-    ch->event_handler(ch);
+    handle_hpet_broadcast(ch);
 }
 
 static void cf_check hpet_msi_unmask(struct irq_desc *desc)
@@ -515,7 +515,7 @@ static void set_channel_irq_affinity(str
 
     /* We may have missed an interrupt due to the temporary masking. */
     if ( ch->event_handler && ch->next_event < NOW() )
-        ch->event_handler(ch);
+        handle_hpet_broadcast(ch);
 }
 
 static void hpet_attach_channel(unsigned int cpu,
@@ -643,7 +643,7 @@ void __init hpet_broadcast_init(void)
         hpet_events[i].next_event = STIME_MAX;
         spin_lock_init(&hpet_events[i].lock);
         smp_wmb();
-        hpet_events[i].event_handler = handle_hpet_broadcast;
+        hpet_events[i].event_handler = true;
 
         hpet_events[i].msi.msi_attrib.maskbit = 1;
         hpet_events[i].msi.msi_attrib.pos = MSI_TYPE_HPET;
@@ -794,7 +794,9 @@ int hpet_legacy_irq_tick(void)
          (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
          HPET_EVT_LEGACY )
         return 0;
-    hpet_events->event_handler(hpet_events);
+
+    handle_hpet_broadcast(hpet_events);
+
     return 1;
 }
 


