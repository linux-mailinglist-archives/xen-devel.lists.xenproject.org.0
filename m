Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE401C64AC6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164118.1491128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0OY-0000G4-SH; Mon, 17 Nov 2025 14:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164118.1491128; Mon, 17 Nov 2025 14:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0OY-0000D3-Om; Mon, 17 Nov 2025 14:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1164118;
 Mon, 17 Nov 2025 14:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0OX-00079j-6y
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:39:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 464e5df0-c3c3-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:39:51 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so723024466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:39:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81172sm1085670266b.15.2025.11.17.06.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:39:49 -0800 (PST)
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
X-Inumbo-ID: 464e5df0-c3c3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390391; x=1763995191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0auAxXnuppooklnSDerPgHwMUEE+NEjFepbTDvIXXk=;
        b=PzefT0+Tt6vUwGzEcU25LGh2cqy/7E1+tWQUJlYz4ZdRKa4jd7ThJo1w1hLrCLjf/8
         D1/RGQVqGPehmg6pWgV5H2Yr/E3uEIhRt5YwgJPPl1PIAa5d29fXbtHcefjPmImfVYqE
         WJQzOhhhxpEob1Qw5t5q3omZbvzF+TlrN+9ouiHkFnx7XJABaiQJITD/ps8+wvXFPL95
         elhCbdEbjZ/PrfXBVXWnF2ZDvGymAWRrwO0EnDwVK4Psto5wMarUahLzNg6gPuC2FfHf
         Rk923IN55wZ9ZPTrYQc/ksiVx4Jm1hNNWxqRxcV1gXE+3XZxOfjSzsCCk73m1S4Wzddc
         F5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390391; x=1763995191;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0auAxXnuppooklnSDerPgHwMUEE+NEjFepbTDvIXXk=;
        b=daLy7+MxLu14K4Wzr9CWR8lS2zZm7Z2bhhBwEExlqmWsznXotW0Iw2sK92yj+zvW9g
         g/92Kx8XZj0YxwCZ0rUxrImNYYhNks7wHkmA6ONRfaJG8MfurNeCOSyhV5BgZx1JMf8X
         q2JCy206BDA3L8VfYpi5AhtdZWEZC+8KLdzNr+RwVmHhWvDQBvDI1Lu92Y58+6O3R0Eo
         snjPnIWoIN4uNMLev/t8XwdsrqKsTL/RWmJ++nUtmVofX3NHBnIWITASunhw4lvdxvRC
         MN89+OUnH5X10V6zVMQxTL9CK+J2jcIPyCw3jnyDLzKw8fYFiwTYKE4LisSX6SY75zxx
         UZNw==
X-Gm-Message-State: AOJu0YxymdIVgfEBlysCSRkzQHl011vbJNiarp+OJ3ItBlrxE9F42Nlh
	+wrkjFXyj0s3xjqGgCCnZgi4kf6sQLXWghnSbysird7nmQlHp7paRq07xCh8gLpahnZPaRiu3Qw
	QG6U=
X-Gm-Gg: ASbGncushpYq+6oW4OjA6FPB0EFEfRqFHCNZx73NxEuTwh+SubYxnuSPDuPjqZDHwMB
	KoW4iSFOwSDCrvvBkU33wBYaMQN914Dx0T5Rr4ReyPa32hv81MSaDIbrr/CC1v+LtDsJE7f452p
	qI8a2uaIlEWVN0tvh5wMCH4vnM1F+MKoe8q095pbDHsMQ2ALhLqd8q5f8m0Vy9B+zl2RbjvpkJ7
	HN57nPtZxXSXOsXIBkCcevyTwMx5WTzUBozqfqGNuY+0l5YVHhxvsZFp6R9r1SBmko790qCci1w
	nM8JP4ZR7E0iOFEd2r94kCVdl529PpOwYYo6BzlpvIkhRG1zc5eq1Hm45QGjo+5jtGAFBWe8KCO
	sliETsRJsauz9eaiJZ2y/axZNeJy6VhX3YKnB9AmvredEnZ0nN65F/ECcJ1cAp/EQkxLaomjNRh
	WznUz03sy25tFW5SVFk9AJ822NUgwJQRCzIrDuDq7D6UnhJMf2et3Pef87lIj+G1Ax
X-Google-Smtp-Source: AGHT+IG9dgAgdipcXC/EhIFV2j2Hx95fMyUeXKzGksp4jaH2e+ltPjQaZyef1keZ4a9X8AqeOl49vA==
X-Received: by 2002:a17:907:9714:b0:b73:9937:e96b with SMTP id a640c23a62f3a-b739937ead7mr389975666b.52.1763390390958;
        Mon, 17 Nov 2025 06:39:50 -0800 (PST)
Message-ID: <5e09670f-dd80-4dfe-a8d6-182545b744ee@suse.com>
Date: Mon, 17 Nov 2025 15:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 7/8] x86/HPET: drop .set_affinity hook
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

No IRQ balancing is supposed to be happening on the broadcast IRQs. The
only entity responsible for fiddling with the CPU affinities is
set_channel_irq_affinity(). They shouldn't even be fiddled with when
offlining a CPU: A CPU going down can't at the same time be idle. Some
properties (->arch.cpu_mask in particular) may transiently reference an
offline CPU, but that'll be adjusted as soon as a channel goes into active
use again.

Along with adjusting fixup_irqs() (in a more general way, i.e. covering all
vectors which are marked in use globally), also adjust section placement of
used_vectors.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -294,22 +294,6 @@ static int hpet_msi_write(struct hpet_ev
 
 #define hpet_msi_shutdown hpet_msi_mask
 
-static void cf_check hpet_msi_set_affinity(
-    struct irq_desc *desc, const cpumask_t *mask)
-{
-    struct hpet_event_channel *ch = desc->action->dev_id;
-    struct msi_msg msg = ch->msi.msg;
-
-    /* This really is only for dump_irqs(). */
-    cpumask_copy(desc->arch.cpu_mask, mask);
-
-    msg.dest32 = cpu_mask_to_apicid(mask);
-    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
-    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
-    if ( msg.dest32 != ch->msi.msg.dest32 )
-        hpet_msi_write(ch, &msg);
-}
-
 /*
  * IRQ Chip for MSI HPET Devices,
  */
@@ -321,7 +305,6 @@ static hw_irq_controller hpet_msi_type =
     .disable    = hpet_msi_mask,
     .ack        = irq_actor_none,
     .end        = end_nonmaskable_irq,
-    .set_affinity   = hpet_msi_set_affinity,
 };
 
 static int __hpet_setup_msi_irq(struct irq_desc *desc)
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -51,7 +51,7 @@ static vmask_t global_used_vector_map;
 
 struct irq_desc __read_mostly *irq_desc = NULL;
 
-static DECLARE_BITMAP(used_vectors, X86_IDT_VECTORS);
+static DECLARE_BITMAP(used_vectors, X86_IDT_VECTORS) __ro_after_init;
 
 static DEFINE_SPINLOCK(vector_lock);
 
@@ -2630,13 +2630,17 @@ void fixup_irqs(void)
         spin_lock(&desc->lock);
 
         vector = irq_to_vector(irq);
-        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
-             vector <= LAST_HIPRIORITY_VECTOR &&
-             desc->handler == &no_irq_type )
+        if ( (vector >= FIRST_HIPRIORITY_VECTOR &&
+              vector <= LAST_HIPRIORITY_VECTOR &&
+              desc->handler == &no_irq_type) ||
+             test_bit(vector, used_vectors) )
         {
             /*
              * This can in particular happen when parking secondary threads
              * during boot and when the serial console wants to use a PCI IRQ.
+             *
+             * Globally used vectors (like the HPET broadcast IRQ ones), need
+             * to be left alone in any event.
              */
             spin_unlock(&desc->lock);
             continue;


