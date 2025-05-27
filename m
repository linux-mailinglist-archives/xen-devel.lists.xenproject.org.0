Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E4AC5146
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 16:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998485.1379205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvbH-0000Br-DU; Tue, 27 May 2025 14:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998485.1379205; Tue, 27 May 2025 14:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJvbH-000090-AG; Tue, 27 May 2025 14:48:19 +0000
Received: by outflank-mailman (input) for mailman id 998485;
 Tue, 27 May 2025 14:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQZn=YL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uJvbF-00008r-30
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 14:48:17 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b982b58-3b09-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 16:48:11 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so581415266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 07:48:10 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8962b2c1asm58390366b.122.2025.05.27.07.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 07:48:08 -0700 (PDT)
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
X-Inumbo-ID: 9b982b58-3b09-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748357289; x=1748962089; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHrRN9zT09E3ejynPxXB+8SYv8/sfMdxs/rspADcXhg=;
        b=IHRveK2P6kDJ53R3JBxOfzw5StthX7rX7xgUeMRa0c+pHXhMzlubKarYTEXsn1+qXn
         CFdiQk319jlp5Hr5SABYSDD1yW1CmjloKaYXlaC8isbAAArtU+aqRyw4jbuj/Wu5cuux
         TozFFgN/zYXr1to5sK/HnGKIDcg/qL1GXhYawyUjEXlVeBjO9QRxQo9qWKHaZJ5utf1q
         JhHjObiqB/AND0Ti95Z70tm44WJkcLC2oanenj1pTlfQYTQrXzVynYMKpN4UCWeDLSjE
         32ccCC7Tvmr4F5GNqnD4HqOnss+2nlwvUbT7mP3LMpR6u/0TNex7R9WufEbCtdJW8qgz
         W34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357289; x=1748962089;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aHrRN9zT09E3ejynPxXB+8SYv8/sfMdxs/rspADcXhg=;
        b=Be7F86dI0sbDluuiW85qKrqGF0rQVHZKqZ0IGsTf3UeqQAEXemUHIZj3kVIYiVMM2r
         ZNwt09Ka2RrBrH4ZgAQ2YdSrzb+B5Rqt8vGf4NAGD/q0oZhw8mi0/9Do0xcJGSQNv0N8
         mt48U0ki5QJKdbBBXQB/OU2e+TH8YvnUooLO9Iy5Cf6hi1jNpdcbNYxoMH6Aaoo84c6z
         CNufdcIHSujFjtz3KqKlIC/ulLR5ygCKtgdSp7GqKHxH3HfaQjCGnY+TfAcnX/cN3D8O
         1OGIw8MBs5pmTTjtIpxw9GF01LqIiend1M7iJKNPixDUg7Q0oaZ06EbNJgkRRGKM6Ys7
         HcpA==
X-Forwarded-Encrypted: i=1; AJvYcCW0/dBDuOkgSqHrgxynqoaHZ0wgCvLdxvIHp9ZA48sYUQdLFXM/mVZ+GqYoW788nt5OLQa6LyESRVE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynyBEKkFHK022o1GGmM7kbPOPRLifWmf8+qGI+XH3JPUCnvDen
	ASDv0Wzj8W7FgcPofgr2aXkSSuK8BFyK/AvhRLmQqR/4hLlwSUqnPxay
X-Gm-Gg: ASbGncskrmkySKbXa5k7/YnZe+BxJ9mHRudBO+9OQwv2rxPhggHHDtx432xRB5lBHjf
	Qoa2ULkiU0VWYTNoJUk5qhBECnme9ouhuERKl/FIG3x+oa+A2RWWo2Ujy36itXVrJpWjrNJ5bx8
	hqrf8Pfnf60YYScRYh2IR/uVZODWgbcoXwIf/DZHxJ8srIc4LDkB6JzKkZkzcUy/Mhiv7ouc84u
	KAbpMC/haydbu/tjmlB321JsorwvUL283Z/vM/pHNEVVY76HpR2A/D79b6k29XlyaWzY9SiAw55
	sowgFr3xYddvkwsBnVLiy/T+hXRwRaLykmYeg910S7HMRkZeDIKxpiUgmuVEDzAfrHzSZ9xqawK
	BYkHK2TtGXcjXtbdYVyM46BSe
X-Google-Smtp-Source: AGHT+IHGHrScA9m+pJ8Kl3SjzxXHbEyGw8gTRnS84zxttGZe4851HCB2+zomF77dLps61INarQfpZg==
X-Received: by 2002:a17:907:c26:b0:ad2:43b6:dd6d with SMTP id a640c23a62f3a-ad85b051c94mr1283502366b.12.1748357289261;
        Tue, 27 May 2025 07:48:09 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------6NkVv0mXUkRV1V7FI08DK8ty"
Message-ID: <9b9d4226-88c0-4286-9157-34788b3e1159@gmail.com>
Date: Tue, 27 May 2025 16:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 09/14] xen/riscv: aplic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <cf642d2ce83fdd9f32638b1c45ad5fef26d4992b.1747843009.git.oleksii.kurochko@gmail.com>
 <058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com>
Content-Language: en-US
In-Reply-To: <058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com>

This is a multi-part message in MIME format.
--------------6NkVv0mXUkRV1V7FI08DK8ty
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/22/25 5:26 PM, Jan Beulich wrote:
> On 21.05.2025 18:03, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -9,19 +9,113 @@
>    * Copyright (c) 2024-2025 Vates
>    */
>   
> +#include <xen/device_tree.h>
>   #include <xen/errno.h>
>   #include <xen/init.h>
>   #include <xen/irq.h>
> +#include <xen/mm.h>
>   #include <xen/sections.h>
>   #include <xen/types.h>
> +#include <xen/vmap.h>
> +
> +#include "aplic-priv.h"
>   
>   #include <asm/device.h>
> +#include <asm/imsic.h>
>   #include <asm/intc.h>
> +#include <asm/riscv_encoding.h>
> +
> +#define APLIC_DEFAULT_PRIORITY  1
> +
> +/* The maximum number of wired interrupt sources supported by APLIC domain. */
> +#define APLIC_MAX_NUM_WIRED_IRQ_SOURCES 1023
> Wait - what's "wired" here? There's only MSI you said elsewhere?

This what was mentioned in DT binding:
   riscv,num-sources:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 1023
     description:
       Specifies the number of wired interrupt sources supported by this
       APLIC domain.

But 'wired' isn't really mention in AIA spec:
   For each possible interrupt source , register sourcecfg[ ] controls the source
   mode for source in this interrupt domain as well as any delegation of the source
   to a child domain.

So IMO it isn't connected to wired or not interrupts. So ...

>
> Further - how's this 1023 related to any of the other uses of that number?
> Is this by chance ARRAY_SIZE(aplic.regs->sourcecfg)? If so, it wants
> expressing like that, to allow making the connection.

...ARRAY_SIZE(aplic.regs->sourcecfg) perfectly match and will be used 
instead of APLIC_MAX_NUM_WIRED_IRQ_SOURCES.

>> +static struct aplic_priv aplic;
>>   
>>   static struct intc_info __ro_after_init aplic_info = {
>>       .hw_version = INTC_APLIC,
>>   };
>>   
>> +static void __init aplic_init_hw_interrupts(void)
>> +{
>> +    unsigned int i;
>> +
>> +    /* Disable all interrupts */
>> +    for ( i = 0; i < ARRAY_SIZE(aplic.regs->clrie); i++)
>> +        writel(~0U, &aplic.regs->clrie[i]);
>> +
>> +    /* Set interrupt type and default priority for all interrupts */
>> +    for ( i = 0; i < aplic_info.num_irqs; i++ )
>> +    {
>> +        writel(0, &aplic.regs->sourcecfg[i]);
>> +        /*
>> +         * Low bits of target register contains Interrupt Priority bits which
>> +         * can't be zero according to AIA spec.
>> +         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
>> +         */
>> +        writel(APLIC_DEFAULT_PRIORITY, &aplic.regs->target[i]);
>> +    }
>> +
>> +    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &aplic.regs->domaincfg);
>> +}
>> +
>> +static int __init cf_check aplic_init(void)
>> +{
>> +    dt_phandle imsic_phandle;
>> +    const __be32 *prop;
>> +    uint64_t size, paddr;
>> +    const struct dt_device_node *imsic_node;
>> +    const struct dt_device_node *node = aplic_info.node;
>> +    int rc;
>> +
>> +    /* Check for associated imsic node */
>> +    if ( !dt_property_read_u32(node, "msi-parent", &imsic_phandle) )
>> +        panic("%s: IDC mode not supported\n", node->full_name);
>> +
>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>> +    if ( !imsic_node )
>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>> +
>> +    rc = imsic_init(imsic_node);
>> +    if ( rc == IRQ_M_EXT )
>> +        /* Machine mode imsic node, ignore this aplic node */
>> +        return 0;
>> +    else if ( rc )
> As before: No "else" please when the earlier if() ends in an unconditional
> control flow change.
> +        panic("%s: Failded to initialize IMSIC\n", node->full_name);
> +
> +    /* Find out number of interrupt sources */
> +    if ( !dt_property_read_u32(node, "riscv,num-sources",
> +                               &aplic_info.num_irqs) )
> +        panic("%s: failed to get number of interrupt sources\n",
> +              node->full_name);
> +
> +    if ( aplic_info.num_irqs > APLIC_MAX_NUM_WIRED_IRQ_SOURCES )
> +        panic("%s: too big number of riscv,num-source: %u\n",
> +               __func__, aplic_info.num_irqs);
> Is it actually necessary to panic() in this case? Can't you just lower
> .num_irqs instead (rendering higher IRQs,if any, non-functional)?

Good point. I think we can just use aplic_info.num_irqs =ARRAY_SIZE(aplic.regs->sourcecfg);

>
>> +    prop = dt_get_property(node, "reg", NULL);
>> +    dt_get_range(&prop, node, &paddr, &size);
>> +    if ( !paddr )
>> +        panic("%s: first MMIO resource not found\n", node->full_name);
>> +
>> +    aplic.paddr_start = paddr;
>> +    aplic.size = size;
>> +
>> +    aplic.regs = ioremap(paddr, size);
> Doesn't size need to match certain constraints? If too low, you may
> need to panic(), while if too high you may not need to map the entire
> range?
>
> Does paddr perhaps also need to match certain contraints, like having
> the low so many bits clear?

Good question. According to AIA spec:
   4.5. Memory-mapped control region for an interrupt domain
   For each interrupt domain that an APLIC supports, there is a dedicated memory-mapped control
   region for managing interrupts in that domain. This control region is a multiple of 4 KiB in size and
   aligned to a 4-KiB address boundary. The smallest valid control region is 16 KiB. An interrupt domain’s
   control region is populated by a set of 32-bit registers. The first 16 KiB contains the registers listed in
   Table 6

The best what I can do is:
1. Check that the size is a multiple of 4KiB is size and is not less then 16Kib. But nothing I can do with
    the high boundary.
2. Regarding paddr the best I can do it is to check that it is a 4-KiB aligned.

I added the following:
     if ( !IS_ALIGNED(paddr, KB(4)) )
         panic("%s: paddr of memory-mapped control region should be 4Kb "
               "aligned:%#lx\n", __func__, paddr);
     
     if ( !IS_ALIGNED(size, KB(4)) && (size < KB(16)) )
         panic("%s: memory-mapped control region should be a multiple of 4 KiB "
               "in size and the smallest valid control is 16Kb: %#lx\n",
               __func__, size);

Would it be enough?

>> +static struct intc_hw_operations __ro_after_init aplic_ops = {
>> +    .info                = &aplic_info,
>> +    .init                = aplic_init,
>> +};
> Why's this __ro_after_init and not simply const? I can't spot any write
> to it.

It could be const. I added __ro_after_init when I misinterpreted a correct usage of it.
I will return back const instead of __ro_after_init.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -0,0 +1,64 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/asm/include/aplic.h
>> + *
>> + * RISC-V Advanced Platform-Level Interrupt Controller support
>> + *
>> + * Copyright (c) Microchip.
>> + */
>> +
>> +#ifndef ASM__RISCV__APLIC_H
>> +#define ASM__RISCV__APLIC_H
> Wants updating again.
>
>> +#include <xen/types.h>
>> +
>> +#include <asm/imsic.h>
>> +
>> +#define APLIC_DOMAINCFG_IE      BIT(8, UL)
>> +#define APLIC_DOMAINCFG_DM      BIT(2, UL)
> Why UL when ...
>
>> +struct aplic_regs {
>> +    uint32_t domaincfg;
> ... this is just 32 bits wide?

Agree, BIT(x,U) would be more correct.

Thanks.

~ Oleksii


--------------6NkVv0mXUkRV1V7FI08DK8ty
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/25 5:26 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <pre wrap="" class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,113 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include &lt;xen/device_tree.h&gt;
 #include &lt;xen/errno.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/irq.h&gt;
+#include &lt;xen/mm.h&gt;
 #include &lt;xen/sections.h&gt;
 #include &lt;xen/types.h&gt;
+#include &lt;xen/vmap.h&gt;
+
+#include "aplic-priv.h"
 
 #include &lt;asm/device.h&gt;
+#include &lt;asm/imsic.h&gt;
 #include &lt;asm/intc.h&gt;
+#include &lt;asm/riscv_encoding.h&gt;
+
+#define APLIC_DEFAULT_PRIORITY  1
+
+/* The maximum number of wired interrupt sources supported by APLIC domain. */
+#define APLIC_MAX_NUM_WIRED_IRQ_SOURCES 1023
</pre>
      <pre wrap="" class="moz-quote-pre">Wait - what's "wired" here? There's only MSI you said elsewhere?</pre>
    </blockquote>
    <pre>This what was mentioned in DT binding:
  riscv,num-sources:
    $ref: /schemas/types.yaml#/definitions/uint32
    minimum: 1
    maximum: 1023
    description:
      Specifies the number of wired interrupt sources supported by this
      APLIC domain.

But 'wired' isn't really mention in AIA spec:
  For each possible interrupt source , register sourcecfg[ ] controls the source
  mode for source in this interrupt domain as well as any delegation of the source
  to a child domain.

So IMO it isn't connected to wired or not interrupts. So ...
</pre>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <pre wrap="" class="moz-quote-pre">

Further - how's this 1023 related to any of the other uses of that number?
Is this by chance ARRAY_SIZE(aplic.regs-&gt;sourcecfg)? If so, it wants
expressing like that, to allow making the connection.</pre>
    </blockquote>
    <pre>... <span style="white-space: pre-wrap">ARRAY_SIZE(aplic.regs-&gt;sourcecfg) perfectly match and will be used instead
of </span>APLIC_MAX_NUM_WIRED_IRQ_SOURCES<span
    style="white-space: pre-wrap"></span>.

</pre>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static struct aplic_priv aplic;
 
 static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
 };
 
+static void __init aplic_init_hw_interrupts(void)
+{
+    unsigned int i;
+
+    /* Disable all interrupts */
+    for ( i = 0; i &lt; ARRAY_SIZE(aplic.regs-&gt;clrie); i++)
+        writel(~0U, &amp;aplic.regs-&gt;clrie[i]);
+
+    /* Set interrupt type and default priority for all interrupts */
+    for ( i = 0; i &lt; aplic_info.num_irqs; i++ )
+    {
+        writel(0, &amp;aplic.regs-&gt;sourcecfg[i]);
+        /*
+         * Low bits of target register contains Interrupt Priority bits which
+         * can't be zero according to AIA spec.
+         * Thereby they are initialized to APLIC_DEFAULT_PRIORITY.
+         */
+        writel(APLIC_DEFAULT_PRIORITY, &amp;aplic.regs-&gt;target[i]);
+    }
+
+    writel(APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM, &amp;aplic.regs-&gt;domaincfg);
+}
+
+static int __init cf_check aplic_init(void)
+{
+    dt_phandle imsic_phandle;
+    const __be32 *prop;
+    uint64_t size, paddr;
+    const struct dt_device_node *imsic_node;
+    const struct dt_device_node *node = aplic_info.node;
+    int rc;
+
+    /* Check for associated imsic node */
+    if ( !dt_property_read_u32(node, "msi-parent", &amp;imsic_phandle) )
+        panic("%s: IDC mode not supported\n", node-&gt;full_name);
+
+    imsic_node = dt_find_node_by_phandle(imsic_phandle);
+    if ( !imsic_node )
+        panic("%s: unable to find IMSIC node\n", node-&gt;full_name);
+
+    rc = imsic_init(imsic_node);
+    if ( rc == IRQ_M_EXT )
+        /* Machine mode imsic node, ignore this aplic node */
+        return 0;
+    else if ( rc )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">As before: No "else" please when the earlier if() ends in an unconditional
control flow change.</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <pre wrap="" class="moz-quote-pre">+        panic("%s: Failded to initialize IMSIC\n", node-&gt;full_name);
+
+    /* Find out number of interrupt sources */
+    if ( !dt_property_read_u32(node, "riscv,num-sources",
+                               &amp;aplic_info.num_irqs) )
+        panic("%s: failed to get number of interrupt sources\n",
+              node-&gt;full_name);
+
+    if ( aplic_info.num_irqs &gt; APLIC_MAX_NUM_WIRED_IRQ_SOURCES )
+        panic("%s: too big number of riscv,num-source: %u\n",
+               __func__, aplic_info.num_irqs);
</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <blockquote type="cite"> </blockquote>
      <pre wrap="" class="moz-quote-pre">Is it actually necessary to panic() in this case? Can't you just lower
.num_irqs instead (rendering higher IRQs,if any, non-functional)?</pre>
    </blockquote>
    <pre>Good point. I think we can just use aplic_info.num_irqs = <span
    style="white-space: pre-wrap">ARRAY_SIZE(aplic.regs-&gt;sourcecfg);</span>

</pre>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    prop = dt_get_property(node, "reg", NULL);
+    dt_get_range(&amp;prop, node, &amp;paddr, &amp;size);
+    if ( !paddr )
+        panic("%s: first MMIO resource not found\n", node-&gt;full_name);
+
+    aplic.paddr_start = paddr;
+    aplic.size = size;
+
+    aplic.regs = ioremap(paddr, size);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Doesn't size need to match certain constraints? If too low, you may
need to panic(), while if too high you may not need to map the entire
range?

Does paddr perhaps also need to match certain contraints, like having
the low so many bits clear?</pre>
    </blockquote>
    <pre>Good question. According to AIA spec:
  4.5. Memory-mapped control region for an interrupt domain
  For each interrupt domain that an APLIC supports, there is a dedicated memory-mapped control
  region for managing interrupts in that domain. This control region is a multiple of 4 KiB in size and
  aligned to a 4-KiB address boundary. The smallest valid control region is 16 KiB. An interrupt domain’s
  control region is populated by a set of 32-bit registers. The first 16 KiB contains the registers listed in
  Table 6
</pre>
    <pre>The best what I can do is:
1. Check that the size is a multiple of 4KiB is size and is not less then 16Kib. But nothing I can do with
   the high boundary.
2. Regarding paddr the best I can do it is to check that it is a 4-KiB aligned.

I added the following:
    if ( !IS_ALIGNED(paddr, KB(4)) )
        panic("%s: paddr of memory-mapped control region should be 4Kb "
              "aligned:%#lx\n", __func__, paddr);
    
    if ( !IS_ALIGNED(size, KB(4)) &amp;&amp; (size &lt; KB(16)) )
        panic("%s: memory-mapped control region should be a multiple of 4 KiB "
              "in size and the smallest valid control is 16Kb: %#lx\n",
              __func__, size);

Would it be enough?

</pre>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static struct intc_hw_operations __ro_after_init aplic_ops = {
+    .info                = &amp;aplic_info,
+    .init                = aplic_init,
+};
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why's this __ro_after_init and not simply const? I can't spot any write
to it.</pre>
    </blockquote>
    <pre>It could be const. I added __ro_after_init when I misinterpreted a correct usage of it.
I will return back const instead of __ro_after_init.

</pre>
    <blockquote type="cite"
      cite="mid:058d0610-0f48-4366-b1bc-4e31ecc79084@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/asm/include/aplic.h
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ */
+
+#ifndef ASM__RISCV__APLIC_H
+#define ASM__RISCV__APLIC_H
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Wants updating again.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#include &lt;xen/types.h&gt;
+
+#include &lt;asm/imsic.h&gt;
+
+#define APLIC_DOMAINCFG_IE      BIT(8, UL)
+#define APLIC_DOMAINCFG_DM      BIT(2, UL)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Why UL when ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+struct aplic_regs {
+    uint32_t domaincfg;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">... this is just 32 bits wide?</pre>
    </blockquote>
    <pre>Agree, BIT(x,U) would be more correct.

Thanks.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------6NkVv0mXUkRV1V7FI08DK8ty--

