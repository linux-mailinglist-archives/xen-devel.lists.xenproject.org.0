Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECA82A860
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665936.1036276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpYL-0007MX-AT; Thu, 11 Jan 2024 07:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665936.1036276; Thu, 11 Jan 2024 07:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpYL-0007KL-7N; Thu, 11 Jan 2024 07:32:37 +0000
Received: by outflank-mailman (input) for mailman id 665936;
 Thu, 11 Jan 2024 07:32:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpYK-0006km-78
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:32:36 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96d048ed-b053-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:32:35 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so2976199f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:32:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.32.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:32:34 -0800 (PST)
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
X-Inumbo-ID: 96d048ed-b053-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958355; x=1705563155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wA+BZrWdWKLSqnO5cn9IF1o10HKUmp9PaScVUp+oxcs=;
        b=GWHihiTglGv0/HCNKtwjOULUdNmcLNt1HROFvWHzZgz61z3eobUFE6pkx42TvC/Ixb
         Bj+WLsNeVlkUxhf1wdbHbuGEMFJN0miAnjDc0xgjYanmVbTnRhf8e2jrMzscBcdzFUr/
         BVhjzYcJ0BV7PIB1owtHDAo+e1zVj/KyL8qC0cuHJP1gE/lJnr47YfHkMG/JyaecUnCT
         swyw+vkEggCIQW5I9q8NdnKiwYy5/Zl/26RCVDfi60Kgl7Ft2W9q6fC5Xv/3jMTIZvcW
         LSSnOaIwqboExZjqvtKZKcYEn/PS7EW2Sv/hBx1crnUQzS3sEH+r3/V4xpRlerwkYq25
         UJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958355; x=1705563155;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wA+BZrWdWKLSqnO5cn9IF1o10HKUmp9PaScVUp+oxcs=;
        b=bfddBHLwF0o4K68/PglgnQGDk/s+JLz/a4zKDuQ/+EAMBJ00AwlJZxlQBSiSyhoPNn
         jJ6i+adAGi+b2CYWhDIiArdeM4kBYSFS3xK/0aMwj6qysegm1CJTmmUO1dmGw237laHz
         VjVO262Wh7YhZPlETv85v1XBgAHudgPF7y30CoKRsGLIRR3JVN/3CJoC7dYZLvPzpoJK
         fpY55Y4ky9a2tbEpmFNgtLQ+M47VXvvEeL4KyIo50F7fJDcACm67MIuNvEJLWp9/jOON
         Lss72Nu9RGv4/qlWnMo8PWfYF/hRANT1zMt7q9cqIfy6AFvQs2Vz+0S8aFjrGSgGhi/W
         fVdQ==
X-Gm-Message-State: AOJu0Yw1Ey4BOEBacZApr/f1WyjeeurtGsHABmuuwm7uWASAMuNpoujR
	I+PBXgpbFKryA94U5gaspHmH5sn6qHxzkjjIgAy4fBkblA==
X-Google-Smtp-Source: AGHT+IFtYbsBF5PPDoQ/YjTSVY769vqpu8ell/GA9dVTLANxBaEpgyWgzA0r2mIm0j986nNwl3zCpA==
X-Received: by 2002:a5d:53cf:0:b0:336:61e1:a325 with SMTP id a15-20020a5d53cf000000b0033661e1a325mr160157wrw.35.1704958355022;
        Wed, 10 Jan 2024 23:32:35 -0800 (PST)
Message-ID: <4c6d11b0-32dd-4ce3-a157-a848b6fc3154@suse.com>
Date: Thu, 11 Jan 2024 08:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/8] IRQ: generalize [gs]et_irq_regs()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
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
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move functions (and their data) to common code, and invoke the functions
on Arm as well. This is in preparation of dropping the register
parameters from handler functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To limit visibility of the per-CPU data item, we may want to consider
making the functions out-of-line ones (in common/irq.c).

--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -221,6 +221,7 @@ void do_IRQ(struct cpu_user_regs *regs,
 {
     struct irq_desc *desc = irq_to_desc(irq);
     struct irqaction *action;
+    struct cpu_user_regs *old_regs = set_irq_regs(regs);
 
     perfc_incr(irqs);
 
@@ -288,6 +289,7 @@ out:
 out_no_end:
     spin_unlock(&desc->lock);
     irq_exit();
+    set_irq_regs(old_regs);
 }
 
 void release_irq(unsigned int irq, const void *dev_id)
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -70,27 +70,6 @@ extern bool opt_noirqbalance;
 
 extern int opt_irq_vector_map;
 
-/*
- * Per-cpu current frame pointer - the location of the last exception frame on
- * the stack
- */
-DECLARE_PER_CPU(struct cpu_user_regs *, __irq_regs);
-
-static inline struct cpu_user_regs *get_irq_regs(void)
-{
-	return this_cpu(__irq_regs);
-}
-
-static inline struct cpu_user_regs *set_irq_regs(struct cpu_user_regs *new_regs)
-{
-	struct cpu_user_regs *old_regs, **pp_regs = &this_cpu(__irq_regs);
-
-	old_regs = *pp_regs;
-	*pp_regs = new_regs;
-	return old_regs;
-}
-
-
 #define platform_legacy_irq(irq)	((irq) < 16)
 
 void cf_check event_check_interrupt(struct cpu_user_regs *regs);
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -53,8 +53,6 @@ static DEFINE_SPINLOCK(vector_lock);
 
 DEFINE_PER_CPU(vector_irq_t, vector_irq);
 
-DEFINE_PER_CPU(struct cpu_user_regs *, __irq_regs);
-
 static LIST_HEAD(irq_ratelimit_list);
 static DEFINE_SPINLOCK(irq_ratelimit_lock);
 static struct timer irq_ratelimit_timer;
--- a/xen/common/irq.c
+++ b/xen/common/irq.c
@@ -1,6 +1,8 @@
 #include <xen/irq.h>
 #include <xen/errno.h>
 
+DEFINE_PER_CPU(struct cpu_user_regs *, irq_regs);
+
 int init_one_irq_desc(struct irq_desc *desc)
 {
     int err;
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -131,6 +131,26 @@ void cf_check irq_actor_none(struct irq_
 #define irq_disable_none irq_actor_none
 #define irq_enable_none irq_actor_none
 
+/*
+ * Per-cpu interrupted context register state - the top-most interrupt frame
+ * on the stack.
+ */
+DECLARE_PER_CPU(struct cpu_user_regs *, irq_regs);
+
+static inline struct cpu_user_regs *get_irq_regs(void)
+{
+	return this_cpu(irq_regs);
+}
+
+static inline struct cpu_user_regs *set_irq_regs(struct cpu_user_regs *new_regs)
+{
+	struct cpu_user_regs *old_regs, **pp_regs = &this_cpu(irq_regs);
+
+	old_regs = *pp_regs;
+	*pp_regs = new_regs;
+	return old_regs;
+}
+
 struct domain;
 struct vcpu;
 


