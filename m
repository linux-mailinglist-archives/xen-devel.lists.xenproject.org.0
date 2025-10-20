Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81BBF0C9C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146136.1478606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnuO-0002x6-6f; Mon, 20 Oct 2025 11:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146136.1478606; Mon, 20 Oct 2025 11:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnuO-0002vI-3O; Mon, 20 Oct 2025 11:18:36 +0000
Received: by outflank-mailman (input) for mailman id 1146136;
 Mon, 20 Oct 2025 11:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnuN-0001y1-4x
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:18:35 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 842da1ca-ada6-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:18:34 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo2582076f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:18:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b97f8sm14777104f8f.36.2025.10.20.04.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:18:33 -0700 (PDT)
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
X-Inumbo-ID: 842da1ca-ada6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959114; x=1761563914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xp3ZzG5lh8bOBtP+FhKCPfyNrES6CNI7e8J4OO1+r18=;
        b=dJduLkdmSR+qE9Wi4WZhd5/c6F2jl2cG0jK3qQpnaJbLrS26rH/+SsCZYu7Wv5Fb83
         qoXNMl7EcN8ApqJMmAVNPaoct7KAHQKtwxIkqZIG8wODBVWQ/EJ7j+ly1jxZLqiO4FS3
         486ejycvEOSx+ZqbN446PnkZs07HX5OzTxCMDDcrK3uN0z89GbRLa0kza34Ggmbh3iBf
         cpHU4WLQS03OnV0mi+eEUKcGTpQddXnUTP4hKzdabfuDVJNcP0KkBm+Ndl/I0LagOSBA
         To7sm6yKEwCsh30zWbpISNafKde453DoFmCg2zfTseEobYVNhlL0IMRIQfdUHzT84JOT
         Xi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959114; x=1761563914;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp3ZzG5lh8bOBtP+FhKCPfyNrES6CNI7e8J4OO1+r18=;
        b=RAehYwv7VO/NjJvAZ+p8sbyaX7qFhSre5AveHKZ9fqr4rbs9u4c+0qKDjtMP3eqNnP
         DRMbFYRJTMEGpxRW7+y68Q0SXuSposPpoa9lMly9Gw1c7iciqLZrkPp9mTrt8HucwQpq
         pPyJeocAPCeaG6/WBRanDbG2+vzW1JYQ80EccXp5JbzTeHb1pm+wm4GdO1ojcbFG/h6X
         GHWIt+mz0RQWbopTx0hJJc9//9cVN2U6RusLLMvntqjgpU8Q5oVr81wMMdNSRGWqK3su
         rcAnclHjnajh8g/fVsYLFLPLly2Qki0Gv494c4Oc6hAN+DWjrHNrHDDjbYPJDHFbTWzI
         xbJA==
X-Gm-Message-State: AOJu0YwiZE1geGKyfV1eual0QonzpkEuRlAdqyX3TPtF9GFx+yHn/vbX
	ONPwf9KREPlZKQB2Sy7WQINCjWNHl5KF8Pe3ipCaCnHCYWPE4RkbRa4jtyFgJ8ADINgxb7O2InW
	58ec=
X-Gm-Gg: ASbGnctVc1GeqltqnkgAphbR1K5lV44RD0uww58zhUkPFHPrrzwMwT5AMBrhyg2QITB
	VtPXRHeaqq2BuC/zBh8ftdtA+J0kr7NdqiEftxynIN/cyis4l8URgkoMBj6neE1Z7XSl80QyH6W
	u7WFagPsTTtwNZozMqKhWNkLHCZKA485OssXLcM3L6jxndtVxHGdWV8tFL7W1ZcZrrfWKGRZOmc
	+Tyydoa8J6VxHn3nXtCqaOhLyavapkd+c3Gt5QO6Vhoy7Vp/v+F5rZ72mHaw3wQRhZItPJTjqN9
	h1t3694Z5o1HcTwNaAkOYVDBHgAFydwEXvUQQ+V1rKLKUlmJ5Hlf5gJ9r2WA1a8M28TjfC5dt21
	wDO053LxdB0X+2McG2O+8cPnmMvz6wNNbnRfZnaZVDrlyc1WXBgyoUAgUvVU14Fw+dqkwJ5DX8H
	kQ8RoTUqz8ukb1wlXhX0TmTo/JeyOVcTdPPt07GkQ1LHpDQa6X42qgh+RSxxGZvc5VBNRsvB0=
X-Google-Smtp-Source: AGHT+IERMekt1Z9Tal+0KY4nEFISAZZNXuyoDQC7eKhFKqV/SBqcnPeOcBTKpr9xTKiruHgXmMfnZg==
X-Received: by 2002:a05:6000:2303:b0:427:6cb:74a4 with SMTP id ffacd0b85a97d-42706cb74a9mr8432642f8f.39.1760959113689;
        Mon, 20 Oct 2025 04:18:33 -0700 (PDT)
Message-ID: <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com>
Date: Mon, 20 Oct 2025 13:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global, low-priority
 vector for broadcast IRQ
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

Using dynamically allocated / maintained vectors has several downsides:
- possible nesting of IRQs due to the effects of IRQ migration,
- reduction of vectors available for devices,
- IRQs not moving as intended if there's shortage of vectors,
- higher runtime overhead.

As the vector also doesn't need to be of any priority (first and foremost
it really shouldn't be of higher or same priority as the timer IRQ, as
that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
and use a vector from the 0x10...0x1f exception vector space. Exception vs
interrupt can easily be distinguished by checking for the presence of an
error code.

With a fixed vector, less updating is now necessary in
set_channel_irq_affinity(); in particular channels don't need transiently
masking anymore, as the necessary update is now atomic. To fully leverage
this, however, we want to stop using hpet_msi_set_affinity() there. With
the transient masking dropped, we're no longer at risk of missing events.

In principle a change to setup_vector_irq() would be necessary, but only
if we used low-prio vectors as direct-APIC ones. Since the change would be
at best benign here, it is being omitted.

Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.

Should we keep hpet_msi_set_affinity() at all? We'd better not have the
generic IRQ subsystem play with our IRQs' affinities ... (If so, this
likely would want to be a separate patch, though.)

The hpet_enable_channel() call could in principle be made (effectively)
conditional, at the price of introducing a check in hpet_enable_channel().
However, as much as eliminating the masking didn't help with the many
excess (early) IRQs I'm observing on Intel hardware, doing so doesn't help
either.

The Fixes: tag indicates where the problem got signficantly worse; in
principle it was there already before (crashing at perhaps 6 or 7 levels
of nested IRQs).
---
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
 static void hpet_disable_channel(struct hpet_event_channel *ch)
 {
     u32 cfg;
@@ -307,15 +313,13 @@ static void cf_check hpet_msi_set_affini
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
 
@@ -328,7 +332,7 @@ static hw_irq_controller hpet_msi_type =
     .shutdown   = hpet_msi_shutdown,
     .enable	    = hpet_msi_unmask,
     .disable    = hpet_msi_mask,
-    .ack        = ack_nonmaskable_msi_irq,
+    .ack        = irq_actor_none,
     .end        = end_nonmaskable_irq,
     .set_affinity   = hpet_msi_set_affinity,
 };
@@ -347,6 +351,12 @@ static int __init hpet_setup_msi_irq(str
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
@@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
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
+
+        if ( iommu_intremap != iommu_intremap_off )
+        {
+            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
 
-    /* We may have missed an interrupt due to the temporary masking. */
-    if ( ch->event_handler && ch->next_event < NOW() )
-        ch->event_handler(ch);
+            ASSERT(rc <= 0);
+            if ( rc > 0 )
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
--- a/xen/arch/x86/include/asm/irq-vectors.h
+++ b/xen/arch/x86/include/asm/irq-vectors.h
@@ -18,6 +18,15 @@
 /* IRQ0 (timer) is statically allocated but must be high priority. */
 #define IRQ0_VECTOR             0xf0
 
+/*
+ * Low-priority (for now statically allocated) vectors, sharing entry
+ * points with exceptions in the 0x10 ... 0x1f range, as long as the
+ * respective exception has an error code.
+ */
+#define FIRST_LOPRIORITY_VECTOR 0x10
+#define HPET_BROADCAST_VECTOR   X86_EXC_AC
+#define LAST_LOPRIORITY_VECTOR  0x1f
+
 /* Legacy PIC uses vectors 0x20-0x2f. */
 #define FIRST_LEGACY_VECTOR     FIRST_DYNAMIC_VECTOR
 #define LAST_LEGACY_VECTOR      (FIRST_LEGACY_VECTOR + 0xf)
@@ -40,7 +49,7 @@
 /* There's no IRQ2 at the PIC. */
 #define IRQ_MOVE_CLEANUP_VECTOR (FIRST_LEGACY_VECTOR + 2)
 
-#define FIRST_IRQ_VECTOR        FIRST_DYNAMIC_VECTOR
+#define FIRST_IRQ_VECTOR        FIRST_LOPRIORITY_VECTOR
 #define LAST_IRQ_VECTOR         LAST_HIPRIORITY_VECTOR
 
 #endif /* _ASM_IRQ_VECTORS_H */
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -158,7 +158,7 @@ void msi_compose_msg(unsigned vector, co
 {
     memset(msg, 0, sizeof(*msg));
 
-    if ( vector < FIRST_DYNAMIC_VECTOR )
+    if ( vector < FIRST_LOPRIORITY_VECTOR )
         return;
 
     if ( cpu_mask )
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1045,7 +1045,13 @@ END(entry_GP)
 
 FUNC(entry_AC)
         ENDBR64
+        /* #AC shares its entry point with the HPET broadcast interrupt. */
+        test  $8, %spl
+        jz    .Lac
+        push  $0
+.Lac:
         movb  $X86_EXC_AC, EFRAME_entry_vector(%rsp)
+        jnz   common_interrupt
         jmp   handle_exception
 END(entry_AC)
 


