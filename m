Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0167BE1F1B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144257.1477716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IXK-0003uo-0I; Thu, 16 Oct 2025 07:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144257.1477716; Thu, 16 Oct 2025 07:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IXJ-0003tR-TI; Thu, 16 Oct 2025 07:36:33 +0000
Received: by outflank-mailman (input) for mailman id 1144257;
 Thu, 16 Oct 2025 07:36:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9IT1-0006tj-89
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:32:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 377a78da-aa62-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 09:32:06 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so4193555e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:32:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711442d3ddsm10102325e9.5.2025.10.16.00.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:32:05 -0700 (PDT)
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
X-Inumbo-ID: 377a78da-aa62-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760599926; x=1761204726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rKpTq2ffZAsnBRLXECm8mxV5KD3b0PiuTaOk80DCvHo=;
        b=IRYnbWtf/V9Q+Habm/dXXWfE/FkSvzeNpnI9fGbcb3734l+7S3kN6SKdgTu4k6+oIB
         xU8ThwRTIpB8Nhw0Dp/Jc7tuPha9SIinUeRU7/NhAQy+LNs2sEFxqfj86f9W+q7rmi0o
         vjNvjLUb5XEwKdAkRguUthVQ61Q9iKInbaCH3GuiBkj2eTVTpC2zTYCxoXtLXAjo7wvV
         YOg9aIYeKpOsxduzihZSL+pbBeXuGW3fckMw6BNNe+fNvhALB6RwYWQ9xIUkfivchCqu
         biN6CwV5TjelYb5dF3sCcTK8nNdod0SuEXt1awtxvn+yDthhryKZgkxruBkiRW7CQjlP
         vt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599926; x=1761204726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKpTq2ffZAsnBRLXECm8mxV5KD3b0PiuTaOk80DCvHo=;
        b=nSZG1BaP1rkxUzMbLVufGjUQ1F7VjhKHBnTGiMoK+VQa6OrFJBtBHjw33cUNOoS7vG
         FZsawwqs9DLlQly+Pqk4r/hFi3euGzfgql3OByx1nwB7HJ3hcMTBMzNgUpZ1tERURYV3
         xBHLObmELH50UhbZy7xxX1IyoASl39mvu4a/uEpbFypu3uLhb6UU00ARTk3+TCt/N6KU
         4BGq1HIZ8FREFI2PPWLfTCjXxaOUcKPBy2SqHKe7LQOpz5mYx8Q0jOsaDEYQFni35iyU
         FIWa99QBP6g9BayqIGzsBW7/pEYYcxJflCxF5Jp5Y6VDllAEK0BhMvFVx7WwVOWHD3kt
         RHyg==
X-Gm-Message-State: AOJu0YwHlBYtzRkNXSaWOECy4zyAmKSPKCMICVKMg5n9wzmcX48HLnn2
	U87Bedn5YyKTqwpzNRAwFIY+Nj0UQPiGKX9kgaGAnF5S9YT9OTwPID8nO9E5pmhF5KVsXmegmTT
	6oGo=
X-Gm-Gg: ASbGncti4bNjAK64mPguZP4L7nsL0F+P/jNqSpjY9gGRMsMAeutBQSs09xS+HJ1Kaly
	M5LrwFZBWmcIuBWhLCGBfanNn5pJ4t3ZIPKtUd0KpwhXZjzjJZ99y09N6/f1x4MW4E7GAx+uAZW
	brpPraheOHnlfAU+MD4zpO5G2ox+9bUDudzyPdaiUSK8Khw/QYeMiAWdS5DbxfhpIHTLrtgKvrr
	HtXuPwBYKSVu6xbM1ODfG3pKOxaA649BOAv8toQgfjbop6zINcDjM9AVzXZin/qO35ve2l7wTZb
	qk17qgK4uzJ4YKsLMKZsXGeepzs/hLlDrwXxD3vlA5yodwW2U8ROlrDbLYu8vE2Yzb8r6MRAzZE
	4FavMJnxaPNRk2HYqQJrNI5xLvS8QvAK9oJM/ZtNYC4W+8Yry295BTXVBv1aFhMSm2Z0JwzUTkr
	k1KL3Bg1oGN3vpw/V9E1o5IKvzMsb+CSQEshXpfL2YeXLBmdWamysZT5yoZsZIC9r1x8lTREw=
X-Google-Smtp-Source: AGHT+IFsTTq5kY0m4KKJdirhTJfN554145+ptMQvZpsOe5DVY74MsO1YcWCjzYwlV+0a3xPIsHxdEw==
X-Received: by 2002:a05:600c:1e8c:b0:46e:326e:4501 with SMTP id 5b1f17b1804b1-46fa9a9ea20mr205904315e9.10.1760599925801;
        Thu, 16 Oct 2025 00:32:05 -0700 (PDT)
Message-ID: <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
Date: Thu, 16 Oct 2025 09:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.21 03/10] x86/HPET: use single, global, low-priority
 vector for broadcast IRQ
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.

The Fixes: tag indicates where the problem got signficantly worse; in
principle it was there already before (crashing at perhaps 6 or 7 levels
of nested IRQs).

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
@@ -307,15 +309,13 @@ static void cf_check hpet_msi_set_affini
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
 
@@ -328,7 +328,7 @@ static hw_irq_controller hpet_msi_type =
     .shutdown   = hpet_msi_shutdown,
     .enable	    = hpet_msi_unmask,
     .disable    = hpet_msi_mask,
-    .ack        = ack_nonmaskable_msi_irq,
+    .ack        = irq_actor_none,
     .end        = end_nonmaskable_irq,
     .set_affinity   = hpet_msi_set_affinity,
 };
@@ -347,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
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
@@ -457,7 +463,7 @@ static struct hpet_event_channel *hpet_g
     /*
      * Try the least recently used channel first.  It may still have its IRQ's
      * affinity set to the desired CPU.  This way we also limit having multiple
-     * of our IRQs raised on the same CPU, in possibly a nested manner.
+     * of our IRQs raised on the same CPU.
      */
     ch = per_cpu(lru_channel, cpu);
     if ( ch && !test_and_set_bit(HPET_EVT_USED_BIT, &ch->flags) )
@@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
     spin_lock(&desc->lock);
     hpet_msi_mask(desc);
     hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
+    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
     hpet_msi_unmask(desc);
     spin_unlock(&desc->lock);
 
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
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
         if ( !irq_desc_initialized(desc) )
             continue;
         vector = irq_to_vector(irq);
-        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
-             vector <= LAST_HIPRIORITY_VECTOR )
+        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
+                        ? LAST_HIPRIORITY_VECTOR
+                        : LAST_LOPRIORITY_VECTOR) )
             cpumask_set_cpu(cpu, desc->arch.cpu_mask);
         else if ( !cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
             continue;
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
 


