Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2498A30749
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 10:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885235.1295023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmjB-0001BZ-Ua; Tue, 11 Feb 2025 09:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885235.1295023; Tue, 11 Feb 2025 09:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thmjB-000199-RO; Tue, 11 Feb 2025 09:38:49 +0000
Received: by outflank-mailman (input) for mailman id 885235;
 Tue, 11 Feb 2025 09:38:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thmjA-00018y-Ar
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 09:38:48 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb527d7d-e85b-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 10:38:42 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab7d58aa674so169817966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 01:38:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7b033e39csm531510866b.85.2025.02.11.01.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:38:42 -0800 (PST)
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
X-Inumbo-ID: fb527d7d-e85b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739266722; x=1739871522; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOQr0Lk6Qwx75Yf1mmyJ/RnLlPawpG4+YTjWCePjt8g=;
        b=BsVRgs2xegnitNBI1b8/7++RiPCzj9Hqk0BxhmIFixod0OJtPCGaxItvJpAIKUXft1
         GJUtE3AYJUiy25OAxfqHlwbMTUH7baCX/kvVHU0t28wV/vMMEfvZ1yLvyKda1kkwBKSp
         dyKPWzs9PlT/R+LIzC9a5sTNOM1KkVKsljpiTtJnFI/5JR92lf0AIZxPxeim03w6mAB0
         NaeMJnHSgOju3f36TqdXLc7i9Yp0Whr51cRCf4bN6onbd5Ijoav/sMOrrBSjxXDZFcCB
         0QIOiNCFjNzwEZhOM2DFAS8WkB9HVih0Mgtu1aaSQPJtZCmzGwfzWyudAZjPLAnNF/Iv
         WNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266722; x=1739871522;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOQr0Lk6Qwx75Yf1mmyJ/RnLlPawpG4+YTjWCePjt8g=;
        b=R45eUS0MOXS7oWqLQydcBZvPSXEhOVdI/b/4kcjg8PG3L6frhH9FNCiWt52uP0FVb0
         GRqC958KAPAPP8Nqf3KI9lqfG4RUCighMeLXCWxhSsvXMRzsMGeicNzFCQnzFopcBPTQ
         wzEgCSPOCi/qyRJr/0kAGnCOd2eOrQo4UvKZO8Il3jkAHxKxnCjEGJOstuULyO8ScgKQ
         1BnIF6H5njXi1EXJHz25wiXEQFliCynrdLi8//RIia7N8NWczrYZPtXGM80yDaPjHOOZ
         LqWw1l+Lj85TQtR5C8oIfUfU9wc07/DzGmcfkwmbee3qMyz+x6kgkO0Dw+qIHrevh252
         yYaw==
X-Gm-Message-State: AOJu0YxTOOv8bbJuuHCtuzXsfyvgbtiVxzyiGjvmRBUmXA60Iishm1wG
	G08fAHvLxQRK/ru6VPemjftMYoYHEMxgUXnXfJyEGlV3vYhiWmD+gA/ku0xmaGIEwhk0QFu/ic8
	=
X-Gm-Gg: ASbGnctCWBiAsuLtQ9YDkFySUrZiXZhOna9TA/rcsoNjwCUJdUASag5tN9OG1WGwhUZ
	CJDln2A5NswTO45vZw5SKu4PcmIa5weoHASGrgaBjTzaPJxQH0SNzs+IniTKjsFBD1GEki8d1/Q
	MqFmLR4K7DvS8jlbqkSF9ma7www26PFi030Cof1a8ew00YrA0sbUHKL0ETtAhzIoK5vUvlqkUqI
	xPg+8EJcFnpCjVVug3cEfsXenun81Rvn/0ziTOm9HMVbT/dPRY+QyziYfNrG8Lio45F2SLYgi2F
	XUTR/48EdayhAKWDTgVh8b9JsTpQQn1GkDl9ZtRp9wqs7nORjbMbax5HzEjWaYw4+vDmoLgYmuy
	n
X-Google-Smtp-Source: AGHT+IHlp0VNEOdRbJwigtrJoi5SNxxcLPkuQjBB3x8ZYNdnqZgbGjyGhJJ75mjZ8QbqT8KcjHpxuQ==
X-Received: by 2002:a17:907:9411:b0:ab7:b84c:361 with SMTP id a640c23a62f3a-ab7b84c05e6mr858744766b.25.1739266722256;
        Tue, 11 Feb 2025 01:38:42 -0800 (PST)
Message-ID: <0396a0fa-e318-493a-9858-30f63304cc99@suse.com>
Date: Tue, 11 Feb 2025 10:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC DO-NOT-APPLY] x86/IRQ: don't pass offline CPU(s) to
 on_selected_cpus()
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

on_selected_cpus() asserts that it's only passed online CPUs. Between
__cpu_disable() removing a CPU from the online map and fixup_eoi()
cleaning up for the CPU being offlined there's a window, though, where
the CPU in question can still appear in an action's cpu_eoi_map. Remove
offline CPUs, as they're (supposed to be) taken care of by fixup_eoi().

Move the entire tail of desc_guest_eoi() into a new helper, thus
streamlining processinf also for other call sites when the sole
remaining CPU is the local one. Move and split the assertion, to be a
functionally equivalent replacement for the earlier BUG_ON() in
__pirq_guest_unbind(). Note that we can't use scratch_cpumask there, in
particular in the context of a timer handler and with data held there
needing to stay intact across process_pending_softirqs().

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While this builds okay, for now I didn't even consider testing it: Both
aspects below (plus the ugly locking arrangement) speak against dealing
with the issue this way, imo. Cc-ing REST rather than just x86 for this
reason.

RFC: Don't we need {get,put}_cpu_maps() around quite a few more uses of
     cpu_online_map (e.g. _clear_irq_vector() when called from
     destroy_irq(), or about every caller of smp_call_function())? Roger
     suggests using stop-machine context for CPU {on,off}lining, but I
     seem to vaguely recall that there was a reason not to do so at
     least for the offlining part.

RFC: I doubt process_pending_softirqs() is okay to use from a timer
     handler. (Callers of, in particular, {desc,pirq}_guest_eoi() would
     also need checking for process_pending_softirqs() to be okay to use
     in their contexts.)

--- unstable.orig/xen/arch/x86/irq.c	2021-04-08 11:10:47.000000000 +0200
+++ unstable/xen/arch/x86/irq.c	2025-02-11 09:54:38.532567287 +0100
@@ -6,6 +6,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/cpu.h>
 #include <xen/delay.h>
 #include <xen/errno.h>
 #include <xen/event.h>
@@ -1183,7 +1184,7 @@ static inline void clear_pirq_eoi(struct
     }
 }
 
-static void cf_check set_eoi_ready(void *data);
+static bool invoke_set_eoi_ready(struct irq_desc *desc, bool wait);
 
 static void cf_check irq_guest_eoi_timer_fn(void *data)
 {
@@ -1224,18 +1225,13 @@ static void cf_check irq_guest_eoi_timer
 
     switch ( action->ack_type )
     {
-        cpumask_t *cpu_eoi_map;
-
     case ACKTYPE_UNMASK:
         if ( desc->handler->end )
             desc->handler->end(desc, 0);
         break;
 
     case ACKTYPE_EOI:
-        cpu_eoi_map = this_cpu(scratch_cpumask);
-        cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
-        spin_unlock_irq(&desc->lock);
-        on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
+        invoke_set_eoi_ready(desc, false);
         return;
     }
 
@@ -1468,6 +1464,49 @@ static void cf_check set_eoi_ready(void
     flush_ready_eoi();
 }
 
+/*
+ * Locking is somewhat special here: In all cases the function is invoked with
+ * desc's lock held.  When @wait is true, the function tries to avoid unlocking.
+ * It always returns whether the lock is still held.
+ */
+static bool invoke_set_eoi_ready(struct irq_desc *desc, bool wait)
+{
+    const irq_guest_action_t *action = guest_action(desc);
+    cpumask_t cpu_eoi_map;
+
+    cpumask_copy(&cpu_eoi_map, action->cpu_eoi_map);
+
+    if ( __cpumask_test_and_clear_cpu(smp_processor_id(), &cpu_eoi_map) )
+    {
+        ASSERT(action->ack_type == ACKTYPE_EOI);
+        __set_eoi_ready(desc);
+        spin_unlock(&desc->lock);
+        flush_ready_eoi();
+        local_irq_enable();
+    }
+    else if ( wait && cpumask_empty(&cpu_eoi_map) )
+        return true;
+    else
+    {
+        ASSERT(action->ack_type == ACKTYPE_EOI);
+        spin_unlock_irq(&desc->lock);
+    }
+
+    if ( cpumask_empty(&cpu_eoi_map) )
+        return false;
+
+    while ( !get_cpu_maps() )
+        process_pending_softirqs();
+
+    cpumask_and(&cpu_eoi_map, &cpu_eoi_map, &cpu_online_map);
+    if ( !cpumask_empty(&cpu_eoi_map) )
+        on_selected_cpus(&cpu_eoi_map, set_eoi_ready, desc, wait);
+
+    put_cpu_maps();
+
+    return false;
+}
+
 void pirq_guest_eoi(struct pirq *pirq)
 {
     struct irq_desc *desc;
@@ -1481,7 +1520,6 @@ void pirq_guest_eoi(struct pirq *pirq)
 void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq)
 {
     irq_guest_action_t *action = guest_action(desc);
-    cpumask_t           cpu_eoi_map;
 
     if ( unlikely(!action) ||
          unlikely(!test_and_clear_bool(pirq->masked)) ||
@@ -1502,24 +1540,7 @@ void desc_guest_eoi(struct irq_desc *des
         return;
     }
 
-    ASSERT(action->ack_type == ACKTYPE_EOI);
-        
-    cpumask_copy(&cpu_eoi_map, action->cpu_eoi_map);
-
-    if ( __cpumask_test_and_clear_cpu(smp_processor_id(), &cpu_eoi_map) )
-    {
-        __set_eoi_ready(desc);
-        spin_unlock(&desc->lock);
-        flush_ready_eoi();
-        local_irq_enable();
-    }
-    else
-    {
-        spin_unlock_irq(&desc->lock);
-    }
-
-    if ( !cpumask_empty(&cpu_eoi_map) )
-        on_selected_cpus(&cpu_eoi_map, set_eoi_ready, desc, 0);
+    invoke_set_eoi_ready(desc, false);
 }
 
 int pirq_guest_unmask(struct domain *d)
@@ -1734,7 +1755,6 @@ static irq_guest_action_t *__pirq_guest_
     struct domain *d, struct pirq *pirq, struct irq_desc *desc)
 {
     irq_guest_action_t *action = guest_action(desc);
-    cpumask_t           cpu_eoi_map;
     int                 i;
 
     if ( unlikely(action == NULL) )
@@ -1765,12 +1785,7 @@ static irq_guest_action_t *__pirq_guest_
         if ( test_and_clear_bool(pirq->masked) &&
              (--action->in_flight == 0) &&
              (action->nr_guests != 0) )
-        {
-            cpumask_copy(&cpu_eoi_map, action->cpu_eoi_map);
-            spin_unlock_irq(&desc->lock);
-            on_selected_cpus(&cpu_eoi_map, set_eoi_ready, desc, 0);
-            spin_lock_irq(&desc->lock);
-        }
+            invoke_set_eoi_ready(desc, false);
         break;
     }
 
@@ -1796,14 +1811,8 @@ static irq_guest_action_t *__pirq_guest_
      * would need to flush all ready EOIs before returning as otherwise the
      * desc->handler could change and we would call the wrong 'end' hook.
      */
-    cpumask_copy(&cpu_eoi_map, action->cpu_eoi_map);
-    if ( !cpumask_empty(&cpu_eoi_map) )
-    {
-        BUG_ON(action->ack_type != ACKTYPE_EOI);
-        spin_unlock_irq(&desc->lock);
-        on_selected_cpus(&cpu_eoi_map, set_eoi_ready, desc, 1);
+    if ( !invoke_set_eoi_ready(desc, true) )
         spin_lock_irq(&desc->lock);
-    }
 
     BUG_ON(!cpumask_empty(action->cpu_eoi_map));
 

