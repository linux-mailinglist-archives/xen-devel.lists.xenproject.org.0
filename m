Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3256C023E9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149383.1481049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxa2-0004v4-E9; Thu, 23 Oct 2025 15:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149383.1481049; Thu, 23 Oct 2025 15:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxa2-0004tf-AL; Thu, 23 Oct 2025 15:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1149383;
 Thu, 23 Oct 2025 15:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxa0-0004p6-IM
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:50:20 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4be06c-b027-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:50:19 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso13873525e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:50:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898acd69sm4641473f8f.24.2025.10.23.08.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:50:19 -0700 (PDT)
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
X-Inumbo-ID: fa4be06c-b027-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234619; x=1761839419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a9ZNQQ7vTuQm2QNqSsqSv8lrn9EAqULHGC/5EXkGJlU=;
        b=PhhmBufmrDG1smwf4jQwEf9JMYqrsaHF04hdGxlW0UOyG5WA7vWTUDB3hQHtkfoo0O
         jMF20XKh4ytpm5b7bv9C7L4tNt4ujbitPt49R4ojd8bfRLJLZ6UofXeHT1dtHwvJeCcD
         8Xwa/Co98pkgoFdTAG5LJYlbMM9NxOuQFyPklcre3rIiLFkY81zxtOv5YrhJf+W+zvjC
         dnu5IK9CRDiTSnC68ryfw1TTvUTO1XLog3+m0/TcA/X4uOkmJMKi8QokOSbCXdiaTupz
         O0ocO08isRnHw79jCRtf1uMSigyhatoeIQ8Kv5Rb95WHjDyluApMXv/ygST8GMJCJt2E
         PUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234619; x=1761839419;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9ZNQQ7vTuQm2QNqSsqSv8lrn9EAqULHGC/5EXkGJlU=;
        b=w4ZYIEqFKtm7TGS9g/4Afa0o88G1/En1A6IbufZTYPBl3grJgy4dwk6IT6QwWedWns
         3AehOLSFcMvQxLHkJJsn25iGHXn56sLn19vagJG9IH9zZRmy186PzMlIawXqI2a07Ddg
         pG1j3DUDFYQVNzrHYP9rHfQAlVZf8H4nN33D4RtUv2m3FLffIWuspfSWbWnFkGFUjya3
         zVLWHPsQfqWIHMvYsWzI+UCLqUHcf/c1tVWIfNnvlbS/DWklzU23ciaLNx2TzoMvRP2M
         lHQum6es6lFoP61DMTePBwA1g8wVDqghDDDTpkO73bjRr5CYXXgURFYrxfrqg+dGV47M
         8tQg==
X-Gm-Message-State: AOJu0Yw6uR9lBwZ4rmpJ7e3MNlkQ0R2PnHXfGngUomXrpNSC7POPVKYX
	/7jruTtJRzMRnTEQJlSiPk06e873zy9fPrx5HNFmBfqc7412d0M0am+ydrN3FlGapC6sjAQGKd6
	vZKM=
X-Gm-Gg: ASbGncsvYfp9To6cG0W/He5o/FgWMBXfc6E/xduEMdEsLYeIhyQNRfr8lCui42ykaAD
	q2NrNE0HJxjgRppC98uxp5EQzJfTBNoRTZAx7iI4zgwZN1+E8DojEwGsHDJhp3hgkh/p9Tfq5Yp
	wqdwMfk/sIX/oMfNJyuzAkY5PdmfXPEfV6AjhaB08GgEyVt3l3QWqK2dit23HhLkcqOte7qb4KT
	A804zwr5F+1Azj6F58EE9aqKuVdCQ4Q4T8VyuvssZJW5z1XsnDIjePdm5+rpmSY7IDouJN3o96c
	BBv/sXSZMkKcFmD41h47J0f6+FeXFXRgKlLImbUi5xszKnojdtWyrawGAtS0giEoQopgnGbbGBU
	TNuPWrXNg0aZFb8V+MMJF67oss5mF+DAXw6aN06Og30yj9nMM4y3fXywBb2lbniStQJm6rXjBLK
	6+DQwyxB20pveJ0oMrBkuCS9t0snIYkwg5vsgvA1dmY8j5tzTFAmS3guwhektAvVV24tfb9hQ=
X-Google-Smtp-Source: AGHT+IGQBPhlThbmlmJjl0yAMzuSuRiXUtmza9hOPOiw+uoESTecF6URo8jIeblThClQ4hlVqDPrWA==
X-Received: by 2002:a05:600c:4715:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-4711791c8c3mr184939895e9.31.1761234619230;
        Thu, 23 Oct 2025 08:50:19 -0700 (PDT)
Message-ID: <545d98e0-755d-471b-84c5-54f129a5aece@suse.com>
Date: Thu, 23 Oct 2025 17:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.21 2/9] x86/HPET: use single, global, low-priority
 vector for broadcast IRQ
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

Using dynamically allocated / maintained vectors has several downsides:
- possible nesting of IRQs due to the effects of IRQ migration,
- reduction of vectors available for devices,
- IRQs not moving as intended if there's shortage of vectors,
- higher runtime overhead.

As the vector also doesn't need to be of any priority (first and foremost
it really shouldn't be of higher or same priority as the timer IRQ, as
that raises TIMER_SOFTIRQ anyway), simply use the lowest one above the
legacy range. The vector needs reserving early, until it is known whether
it actually is used. If it isn't, it's made available for general use.

With a fixed vector, less updating is now necessary in
set_channel_irq_affinity(); in particular channels don't need transiently
masking anymore, as the necessary update is now atomic. To fully leverage
this, however, we want to stop using hpet_msi_set_affinity() there. With
the transient masking dropped, we're no longer at risk of missing events.

Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.

Should we keep hpet_msi_set_affinity() at all? We'd better not have the
generic IRQ subsystem play with our IRQs' affinities, and fixup_irqs()
isn't relevant here. (If so, this likely would want to be a separate
patch, though.)

The hpet_enable_channel() call could in principle be made (effectively)
conditional, at the price of introducing a check in there. However, as
much as eliminating the masking didn't help with the many excess (early)
IRQs I'm observing on Intel hardware, doing so doesn't help either.

The Fixes: tag indicates where the problem got signficantly worse; in
principle it was there already before (crashing at perhaps 6 or 7 levels
of nested IRQs).
---
v3: Switch to using vector 0x30, to unbreak AMD, including an adjustment
    to AMD IOMMU intremap logic. Adjust condition around assertions in
    set_channel_irq_affinity().
v2: Re-work set_channel_irq_affinity() intensively. Re-base over the
    dropping of another patch. Drop setup_vector_irq() change.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -9,17 +9,19 @@
 #include <xen/timer.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
+#include <xen/cpuidle.h>
 #include <xen/irq.h>
 #include <xen/numa.h>
 #include <xen/param.h>
 #include <xen/sched.h>
 
 #include <asm/apic.h>
-#include <asm/fixmap.h>
 #include <asm/div64.h>
+#include <asm/fixmap.h>
+#include <asm/genapic.h>
 #include <asm/hpet.h>
+#include <asm/irq-vectors.h>
 #include <asm/msi.h>
-#include <xen/cpuidle.h>
 
 #define MAX_DELTA_NS MILLISECS(10*1000)
 #define MIN_DELTA_NS MICROSECS(20)
@@ -251,10 +253,9 @@ static void cf_check hpet_interrupt_hand
     ch->event_handler(ch);
 }
 
-static void cf_check hpet_msi_unmask(struct irq_desc *desc)
+static void hpet_enable_channel(struct hpet_event_channel *ch)
 {
     u32 cfg;
-    struct hpet_event_channel *ch = desc->action->dev_id;
 
     cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
     cfg |= HPET_TN_ENABLE;
@@ -262,6 +263,11 @@ static void cf_check hpet_msi_unmask(str
     ch->msi.msi_attrib.host_masked = 0;
 }
 
+static void cf_check hpet_msi_unmask(struct irq_desc *desc)
+{
+    hpet_enable_channel(desc->action->dev_id);
+}
+
 static void cf_check hpet_msi_mask(struct irq_desc *desc)
 {
     u32 cfg;
@@ -303,15 +309,13 @@ static void cf_check hpet_msi_set_affini
     struct hpet_event_channel *ch = desc->action->dev_id;
     struct msi_msg msg = ch->msi.msg;
 
-    msg.dest32 = set_desc_affinity(desc, mask);
-    if ( msg.dest32 == BAD_APICID )
-        return;
+    /* This really is only for dump_irqs(). */
+    cpumask_copy(desc->arch.cpu_mask, mask);
 
-    msg.data &= ~MSI_DATA_VECTOR_MASK;
-    msg.data |= MSI_DATA_VECTOR(desc->arch.vector);
+    msg.dest32 = cpu_mask_to_apicid(mask);
     msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
     msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
-    if ( msg.data != ch->msi.msg.data || msg.dest32 != ch->msi.msg.dest32 )
+    if ( msg.dest32 != ch->msi.msg.dest32 )
         hpet_msi_write(ch, &msg);
 }
 
@@ -324,7 +328,7 @@ static hw_irq_controller hpet_msi_type =
     .shutdown   = hpet_msi_shutdown,
     .enable	    = hpet_msi_unmask,
     .disable    = hpet_msi_mask,
-    .ack        = ack_nonmaskable_msi_irq,
+    .ack        = irq_actor_none,
     .end        = end_nonmaskable_irq,
     .set_affinity   = hpet_msi_set_affinity,
 };
@@ -343,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
     u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
     irq_desc_t *desc = irq_to_desc(ch->msi.irq);
 
+    clear_irq_vector(ch->msi.irq);
+    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
+    if ( ret )
+        return ret;
+    cpumask_setall(desc->affinity);
+
     if ( iommu_intremap != iommu_intremap_off )
     {
         ch->msi.hpet_id = hpet_blockid;
@@ -472,19 +482,50 @@ static struct hpet_event_channel *hpet_g
 static void set_channel_irq_affinity(struct hpet_event_channel *ch)
 {
     struct irq_desc *desc = irq_to_desc(ch->msi.irq);
+    struct msi_msg msg = ch->msi.msg;
 
     ASSERT(!local_irq_is_enabled());
     spin_lock(&desc->lock);
-    hpet_msi_mask(desc);
-    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
-    hpet_msi_unmask(desc);
+
+    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
+
+    /*
+     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
+     * actual update below (either of the IRTE or of [just] message address;
+     * with interrupt remapping message address/data don't change) now being
+     * atomic, we can avoid masking the IRQ around the update.  As a result
+     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
+     * keeps setting the new deadline only afterwards).
+     */
+    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
+
     spin_unlock(&desc->lock);
 
-    spin_unlock(&ch->lock);
+    msg.dest32 = cpu_physical_id(ch->cpu);
+    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
+    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
+    if ( msg.dest32 != ch->msi.msg.dest32 )
+    {
+        ch->msi.msg = msg;
 
-    /* We may have missed an interrupt due to the temporary masking. */
-    if ( ch->event_handler && ch->next_event < NOW() )
-        ch->event_handler(ch);
+        if ( iommu_intremap != iommu_intremap_off )
+        {
+            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
+
+            ASSERT(rc <= 0);
+            if ( rc >= 0 )
+            {
+                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
+                ASSERT(msg.address_lo ==
+                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
+            }
+        }
+        else
+            hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
+    }
+
+    hpet_enable_channel(ch);
+    spin_unlock(&ch->lock);
 }
 
 static void hpet_attach_channel(unsigned int cpu,
@@ -622,6 +663,12 @@ void __init hpet_broadcast_init(void)
         hpet_events->flags = HPET_EVT_LEGACY;
 }
 
+void __init hpet_broadcast_late_init(void)
+{
+    if ( !num_hpets_used )
+        free_lopriority_vector(HPET_BROADCAST_VECTOR);
+}
+
 void hpet_broadcast_resume(void)
 {
     u32 cfg;
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
@@ -90,6 +90,7 @@ void hpet_disable_legacy_replacement_mod
  * rather than using the LAPIC timer. Used for Cx state entry.
  */
 void hpet_broadcast_init(void);
+void hpet_broadcast_late_init(void);
 void hpet_broadcast_resume(void);
 void cf_check hpet_broadcast_enter(void);
 void cf_check hpet_broadcast_exit(void);
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -116,6 +116,7 @@ void cf_check call_function_interrupt(vo
 void cf_check irq_move_cleanup_interrupt(void);
 
 uint8_t alloc_hipriority_vector(void);
+void free_lopriority_vector(uint8_t vector);
 
 void set_direct_apic_vector(uint8_t vector, void (*handler)(void));
 void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void));
--- a/xen/arch/x86/include/asm/irq-vectors.h
+++ b/xen/arch/x86/include/asm/irq-vectors.h
@@ -22,6 +22,9 @@
 #define FIRST_LEGACY_VECTOR     FIRST_DYNAMIC_VECTOR
 #define LAST_LEGACY_VECTOR      (FIRST_LEGACY_VECTOR + 0xf)
 
+/* HPET broadcast is statically allocated and wants to be low priority. */
+#define HPET_BROADCAST_VECTOR   (LAST_LEGACY_VECTOR + 1)
+
 #ifdef CONFIG_PV32
 #define HYPERCALL_VECTOR        0x82
 #endif
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -468,6 +468,12 @@ int __init init_irq_data(void)
           vector++ )
         __set_bit(vector, used_vectors);
 
+    /*
+     * Prevent the HPET broadcast vector from being used, until it is known
+     * whether it's actually needed.
+     */
+    __set_bit(HPET_BROADCAST_VECTOR, used_vectors);
+
     return 0;
 }
 
@@ -991,6 +997,13 @@ void alloc_direct_apic_vector(uint8_t *v
     spin_unlock(&lock);
 }
 
+/* This could free any vectors, but is needed only for low-prio ones. */
+void __init free_lopriority_vector(uint8_t vector)
+{
+    ASSERT(vector < FIRST_HIPRIORITY_VECTOR);
+    clear_bit(vector, used_vectors);
+}
+
 static void cf_check irq_ratelimit_timer_fn(void *data)
 {
     struct irq_desc *desc, *tmp;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2675,6 +2675,8 @@ static int __init cf_check disable_pit_i
                "Force enable with 'cpuidle'.\n");
     }
 
+    hpet_broadcast_late_init();
+
     return 0;
 }
 __initcall(disable_pit_irq);
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -551,6 +551,13 @@ int cf_check amd_iommu_msi_msg_update_ir
         for ( i = 1; i < nr; ++i )
             msi_desc[i].remap_index = msi_desc->remap_index + i;
         msg->data = data;
+        /*
+         * While the low address bits don't matter, "canonicalize" the address
+         * by zapping the bits that were transferred to the IRTE.  This way
+         * callers can check for there actually needing to be an update to
+         * wherever the address is put.
+         */
+        msg->address_lo &= ~(MSI_ADDR_DESTMODE_MASK | MSI_ADDR_DEST_ID_MASK);
     }
 
     return rc;


