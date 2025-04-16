Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C6A8B689
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955428.1349214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4znt-0008Pr-Vf; Wed, 16 Apr 2025 10:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955428.1349214; Wed, 16 Apr 2025 10:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4znt-0008OH-RV; Wed, 16 Apr 2025 10:15:37 +0000
Received: by outflank-mailman (input) for mailman id 955428;
 Wed, 16 Apr 2025 10:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Wc4=XC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4zns-000866-8e
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:15:36 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb9fb92f-1aab-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 12:15:33 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so108565566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 03:15:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3d1282eesm99750266b.109.2025.04.16.03.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 03:15:32 -0700 (PDT)
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
X-Inumbo-ID: bb9fb92f-1aab-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744798534; x=1745403334; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P357dqztHkV+NDHjbwlyXnPq3Ml4M1a0yf6gPLD1WTc=;
        b=QL1jvjxqUSKObZVEmNKLaY3Zv+ggdDiXzB/MEJkTKeHZyZUH+f+pu1WBpz9B4A3Qsi
         hoMtp5jTKWVcw6JqWFnEBYfiFHBGVXrQjhL710LOUnk+HwB2PrHk2imp5lluns11hEs7
         LdKG6/nonYifCXN27hAf2DY1WTJw75EsE6f0JnanjRJYWyJsKkI2ROamLT4w9jNnQsHz
         UHMgK1P2LO4shmFWgCVKHcUNU/VqqTdr3dLgFVVSaWucOmICdqbKhA7BNlJ49HqkS2Kc
         KTjcBFVmVC0+JNmh3VTSBqWPWv2raVOPBEz5AURBu58GW9DTs2A+Armcn32phFsqCrif
         6ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798534; x=1745403334;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P357dqztHkV+NDHjbwlyXnPq3Ml4M1a0yf6gPLD1WTc=;
        b=kTNBrBMjxA1KKtjQP5R50FJkWVdzUk6mil0Ibce0AkclJ66IFjjJfWEsT8x9i7PJWs
         7uAORW7A2Lc8sB/keAK75eHXMmGK8kbH3tJVxraawPhzolVflORHYnk5y9uyfdyGvkUo
         F4AgIDTORJZCS96czLIDcOYY4QYCMy8STHYyYMEQzcqSkCDhdCk8J8LvxbnfsEWBe575
         SjpS65Rgf3W2pMvL4p/XJ3ruxycR599Ji3EfS9CdaHP2hpitEAh2XgGM6xNvAaVTw/jg
         P08jQx3wh7JEs4hI0oPvgzKyq0Ql6a40qWO3Ex+Ie0/awVynr0n5CfmD6SusgB5uaZKr
         tKGg==
X-Forwarded-Encrypted: i=1; AJvYcCWT1rkXRvqgzDJ+m5uzOBPbJ9zk5vIWOVsDRYwpcK7XOcV55IWm6g4FDseDU77pQi/9Vw/7b+1C+nY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRFwI0f0e6L1Z9LxEnqKL/DiQ71dWuY4Z+PxMARocsSHfdQ9Hz
	y/TP5JfqES2XkdCXDFHcAEaLn9ZZc8y7S853EZ8NKayCHYSD6gAj
X-Gm-Gg: ASbGnctRKhGEs4VChMhfflcXiMvRN0/zPpUMd6fECAySvg9jitukqkETLaQD6y1hpHD
	dAfXVC4QZ9WLyqRAgfNji3U2ZOa7xjow9foDqUebNxkb10lWoZeTCtmGN2mW/dbkgbV8QLSZ7uB
	2BNofjSQl5MV/deWUtGP7ZTLFknTIypXgTxOn4224VyK8V/85wPvmFHD3tzxR3Y1wKoQ0y3pzJe
	0BWxgyM//J3+3dJMiaTR5S1SfmDpM0M43qKxDJnOZooz6bQfsYblYw5yV5aAQe3zquWp9YYLPVx
	fEXYCW4p+5MGi4TKFO2gRrjXwJz0HLdh0sggGlLUVUIGSaoynIX02YbJzFFPQMyda6zFTfkig6j
	571w7v8eq0A4w+9Vc
X-Google-Smtp-Source: AGHT+IFTRYCiTy4LF+fCE37EAEfnBQhiGIYAqvQHwiaD0zCNJwCo/b5Csw+gWRaz2LHoc+dWmSUs1w==
X-Received: by 2002:a17:907:6e90:b0:ac1:791c:153a with SMTP id a640c23a62f3a-acb429e1548mr80602066b.27.1744798532919;
        Wed, 16 Apr 2025 03:15:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------SfsmbpGnclB31etoHmDRSJCQ"
Message-ID: <a54ef262-92fc-453d-898e-70636c2918fd@gmail.com>
Date: Wed, 16 Apr 2025 12:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/14] xen/riscv: aplic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <1d023045be49ae93d41d552f9c9a79972fa4e84b.1744126720.git.oleksii.kurochko@gmail.com>
 <a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com>

This is a multi-part message in MIME format.
--------------SfsmbpGnclB31etoHmDRSJCQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/14/25 12:04 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -9,19 +9,112 @@
>>    * Copyright (c) 2024-2025 Vates
>>    */
>>   
>> +#include <xen/device_tree.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>> +#include <xen/mm.h>
>>   #include <xen/sections.h>
>>   #include <xen/types.h>
>> +#include <xen/vmap.h>
>>   
>> +#include <asm/aplic.h>
>>   #include <asm/device.h>
>> +#include <asm/imsic.h>
>>   #include <asm/intc.h>
>> +#include <asm/riscv_encoding.h>
>> +
>> +#define APLIC_DEFAULT_PRIORITY  1
>> +
>> +static struct aplic_priv aplic;
>>   
>>   static struct intc_info __ro_after_init aplic_info = {
>>       .hw_version = INTC_APLIC,
>>   };
>>   
>> +static void __init aplic_init_hw_interrupts(void)
>> +{
>> +    int i;
>> +
>> +    /* Disable all interrupts */
>> +    for ( i = 0; i <= aplic_info.nr_irqs; i += 32 )
>> +        aplic.regs->clrie[i] = -1U;
>> +
>> +    /* Set interrupt type and default priority for all interrupts */
>> +    for ( i = 1; i <= aplic_info.nr_irqs; i++ )
>> +    {
>> +        aplic.regs->sourcecfg[i - 1] = 0;
>> +        aplic.regs->target[i - 1] = APLIC_DEFAULT_PRIORITY;
> A field named "target" is written with a priority value?

Low bits of target register contains Interrupt Priority bits which can't be zero according to
AIA spec:
```
4.5.16.1. Active source, direct delivery mode
For an active interrupt source , if the domain is configured in direct delivery mode (domaincfg.DM = 0),
then register target[ ] has this format:
   bits 31:18 Hart Index (WLRL)
   bits 7:0 IPRIO (WARL)

All other register bits are reserved and read as zeros.
Hart Index is a WLRL field that specifies the hart to which interrupts from this source will be delivered.
Field IPRIO (Interrupt Priority) specifies the priority number for the interrupt source. This field is
a WARL unsigned integer of IPRIOLEN bits, where IPRIOLEN is a constant parameter for the given APLIC, in
the range of 1 to 8. Only values 1 through are allowed for IPRIO, not zero. A write to a target register
sets IPRIO equal to bits :0 of the 32-bit value written, unless those bits are all zeros, in which case
the priority number is set to 1 instead. (If IPRIOLEN = 1, these rules cause IPRIO to be effectively
read-only with value 1.)
```

>
>> +    }
>> +
>> +    /* Clear APLIC domaincfg */
>> +    aplic.regs->domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
> The statement doesn't like like there was any "clearing" here.

But all other bits, except|APLIC_DOMAINCFG_{IE, DM}|, are set to zero.
I think we can remove this comment to avoid confusion.

>> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>> +    if ( !rc )
>> +        panic("%s: IDC mode not supported\n", node->full_name);
>> +
>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>> +    if ( !imsic_node )
>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>> +
>> +    /* check imsic mode */
>> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
>> +                                    irq_range, ARRAY_SIZE(irq_range));
>> +    if ( rc && (rc != -EOVERFLOW) )
>> +        panic("%s: unable to find interrupt-extended in %s node\n",
>> +               node->full_name, imsic_node->full_name);
> Why exactly is EOVERFLOW tolerable here?

QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
For the hypervisor, we don’t really care about the M-mode IMSIC node — we're only
interested in the S-mode IMSIC node.

The IMSIC node includes this information in the|"interrupts-extended"| property,
which has the following format:
   interrupt-extended = {<interrupt-controller-phandle>, <machine_mode>},...
The number of such|<phandle, mode>| pairs depends on the number of CPUs the platform has.

For our purposes, to determine whether the IMSIC node corresponds to M-mode or not, it’s sufficient to read only the first pair and check the mode like this:

   if ( irq_range[1] == IRQ_M_EXT )

Thereby dt_property_read_u32_array() will return -EOVERFLOW in the case when a platfrom
has more then one CPU as we passed irq_range[2] as an argument but the amount of values
in "interrupts-extended" property will be (2 * CPUS_NUM).

I can update the comment above dt_property_read_u32_array() for more clearness.

>> +    if ( irq_range[1] == IRQ_M_EXT )
>> +        /* machine mode imsic node, ignore this aplic node */
>> +        return 0;
>> +
>> +    rc = imsic_init(imsic_node);
>> +    if ( rc )
>> +        panic("%s: Failded to initialize IMSIC\n", node->full_name);
>> +
>> +    /* Find out number of interrupt sources */
>> +    rc = dt_property_read_u32(node, "riscv,num-sources", &aplic_info.nr_irqs);
>> +    if ( !rc )
>> +        panic("%s: failed to get number of interrupt sources\n",
>> +              node->full_name);
>> +
>> +    prop = dt_get_property(node, "reg", NULL);
>> +    dt_get_range(&prop, node, &paddr, &size);
>> +    if ( !paddr )
>> +        panic("%s: first MMIO resource not found\n", node->full_name);
>> +
>> +    aplic.paddr_start = paddr;
>> +    aplic.paddr_end = paddr + size;
>> +    aplic.size = size;
> Why do all three need recording? Isn't a (start,size) tuple sufficient
> (and unambiguous)?

(start,size) will be enough. I'll drop aplic.paddr_end.

>
>> +    aplic.regs = ioremap(paddr, size);
>> +    if ( !aplic.regs )
>> +        panic("%s: unable to map\n", node->full_name);
>> +
>> +    /* Setup initial state APLIC interrupts */
>> +    aplic_init_hw_interrupts();
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct intc_hw_operations __ro_after_init aplic_ops = {
> const or __ro_after_init?

What’s wrong with using both?|const| ensures the variable can't be changed at compile time,
while|__ro_after_init| makes it read-only at runtime after initialization is complete.

Probably,|__initconst| would be a better fit:
   static const struct intc_hw_operations __initconst aplic_ops = {

Or even|__initconstrel|, since the|struct intc_hw_operations| contains pointers.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -0,0 +1,77 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/aplic.h
>> + *
>> + * RISC-V Advanced Platform-Level Interrupt Controller support
>> + *
>> + * Copyright (c) 2023 Microchip.
>> + */
>> +
>> +#ifndef ASM__RISCV__APLIC_H
>> +#define ASM__RISCV__APLIC_H
>> +
>> +#include <xen/types.h>
>> +
>> +#include <asm/imsic.h>
>> +
>> +#define APLIC_DOMAINCFG_IE      BIT(8, UL)
>> +#define APLIC_DOMAINCFG_DM      BIT(2, UL)
>> +
>> +struct aplic_regs {
>> +    uint32_t domaincfg;
>> +    uint32_t sourcecfg[1023];
>> +    uint8_t _reserved1[0xBC0];
>> +
>> +    uint32_t mmsiaddrcfg;
>> +    uint32_t mmsiaddrcfgh;
>> +    uint32_t smsiaddrcfg;
>> +    uint32_t smsiaddrcfgh;
>> +    uint8_t _reserved2[0x30];
>> +
>> +    uint32_t setip[32];
>> +    uint8_t _reserved3[92];
>> +
>> +    uint32_t setipnum;
>> +    uint8_t _reserved4[0x20];
>> +
>> +    uint32_t in_clrip[32];
>> +    uint8_t _reserved5[92];
>> +
>> +    uint32_t clripnum;
>> +    uint8_t _reserved6[32];
>> +
>> +    uint32_t setie[32];
>> +    uint8_t _reserved7[92];
>> +
>> +    uint32_t setienum;
>> +    uint8_t _reserved8[32];
>> +
>> +    uint32_t clrie[32];
>> +    uint8_t _reserved9[92];
>> +
>> +    uint32_t clrienum;
>> +    uint8_t _reserved10[32];
>> +
>> +    uint32_t setipnum_le;
>> +    uint32_t setipnum_be;
>> +    uint8_t _reserved11[4088];
>> +
>> +    uint32_t genmsi;
>> +    uint32_t target[1023];
>> +};
>> +
>> +struct aplic_priv {
>> +    /* base physical address and size */
>> +    paddr_t paddr_start;
>> +    paddr_t paddr_end;
>> +    size_t  size;
>> +
>> +    /* registers */
>> +    volatile struct aplic_regs *regs;
>> +
>> +    /* imsic configuration */
>> +    const struct imsic_config *imsic_cfg;
>> +};
>> +
>> +#endif /* ASM__RISCV__APLIC_H */
> Does all of this really need to live in a non-private header?

struct aplic_priv is used in different files:
- in aplic.c to define `aplic` variable.
- in vaplic.c (which isn't intoduced yet) is used in several places:https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/vaplic.c#L41

struct aplic_regs is used only in aplic.c (at least, at the moment) so could be moved to
aplic.c, but I don't see too much sense.

>
>> --- a/xen/arch/riscv/include/asm/irq.h
>> +++ b/xen/arch/riscv/include/asm/irq.h
>> @@ -27,7 +27,6 @@
>>   #define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
>>   
>>   /* TODO */
>> -#define nr_irqs 0U
> How come this is simply no longer needed, i.e. without any replacement?
> Hmm, looks like the only use in common code has gone away. Yet then this
> still doesn't really look to belong here (especially if not mentioned in
> the description).

I missed that it is used in xen/common/domain.c when CONFIG_HAS_PIRQ=y, but this
config isn't selected for RISC-V.
I think that I have to revert this change.

~ Oleksii

--------------SfsmbpGnclB31etoHmDRSJCQ
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
    <div class="moz-cite-prefix">On 4/14/25 12:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,112 @@
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
 
+#include &lt;asm/aplic.h&gt;
 #include &lt;asm/device.h&gt;
+#include &lt;asm/imsic.h&gt;
 #include &lt;asm/intc.h&gt;
+#include &lt;asm/riscv_encoding.h&gt;
+
+#define APLIC_DEFAULT_PRIORITY  1
+
+static struct aplic_priv aplic;
 
 static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
 };
 
+static void __init aplic_init_hw_interrupts(void)
+{
+    int i;
+
+    /* Disable all interrupts */
+    for ( i = 0; i &lt;= aplic_info.nr_irqs; i += 32 )
+        aplic.regs-&gt;clrie[i] = -1U;
+
+    /* Set interrupt type and default priority for all interrupts */
+    for ( i = 1; i &lt;= aplic_info.nr_irqs; i++ )
+    {
+        aplic.regs-&gt;sourcecfg[i - 1] = 0;
+        aplic.regs-&gt;target[i - 1] = APLIC_DEFAULT_PRIORITY;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
A field named "target" is written with a priority value?</pre>
    </blockquote>
    <pre>Low bits of target register contains Interrupt Priority bits which can't be zero according to
AIA spec:
```
4.5.16.1. Active source, direct delivery mode
For an active interrupt source , if the domain is configured in direct delivery mode (domaincfg.DM = 0),
then register target[ ] has this format:
  bits 31:18 Hart Index (WLRL)
  bits 7:0 IPRIO (WARL)

All other register bits are reserved and read as zeros.
Hart Index is a WLRL field that specifies the hart to which interrupts from this source will be delivered.
Field IPRIO (Interrupt Priority) specifies the priority number for the interrupt source. This field is
a WARL unsigned integer of IPRIOLEN bits, where IPRIOLEN is a constant parameter for the given APLIC, in
the range of 1 to 8. Only values 1 through are allowed for IPRIO, not zero. A write to a target register
sets IPRIO equal to bits :0 of the 32-bit value written, unless those bits are all zeros, in which case
the priority number is set to 1 instead. (If IPRIOLEN = 1, these rules cause IPRIO to be effectively
read-only with value 1.)
```
</pre>
    <div _ngcontent-ng-c572710829=""
      class="paragraph normal ng-star-inserted"
      data-start-index="126927"
style="font: 400 14px / 1.5rem &quot;Google Sans Text&quot;, &quot;Google Sans&quot;, sans-serif; letter-spacing: normal; margin-block-end: 0.75rem; padding-inline-start: 0rem;"></div>
    <blockquote type="cite"
      cite="mid:a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    }
+
+    /* Clear APLIC domaincfg */
+    aplic.regs-&gt;domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The statement doesn't like like there was any "clearing" here.</pre>
    </blockquote>
    <pre>But all other bits, except <code data-start="105"
    data-end="131">APLIC_DOMAINCFG_{IE, DM}</code>, are set to zero.
I think we can remove this comment to avoid confusion.

</pre>
    <blockquote type="cite"
      cite="mid:a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    rc = dt_property_read_u32(node, "msi-parent", &amp;imsic_phandle);
+    if ( !rc )
+        panic("%s: IDC mode not supported\n", node-&gt;full_name);
+
+    imsic_node = dt_find_node_by_phandle(imsic_phandle);
+    if ( !imsic_node )
+        panic("%s: unable to find IMSIC node\n", node-&gt;full_name);
+
+    /* check imsic mode */
+    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
+                                    irq_range, ARRAY_SIZE(irq_range));
+    if ( rc &amp;&amp; (rc != -EOVERFLOW) )
+        panic("%s: unable to find interrupt-extended in %s node\n",
+               node-&gt;full_name, imsic_node-&gt;full_name);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why exactly is EOVERFLOW tolerable here?</pre>
    </blockquote>
    <pre data-start="123" data-end="320" class="">QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
For the hypervisor, we don’t really care about the M-mode IMSIC node — we're only
interested in the S-mode IMSIC node.</pre>
    <pre data-start="322" data-end="435" class="">The IMSIC node includes this information in the <code
    data-start="370" data-end="393">"interrupts-extended"</code> property,
which has the following format:
  interrupt-extended = {&lt;interrupt-controller-phandle&gt;, &lt;machine_mode&gt;},...
The number of such <code data-start="528" data-end="545">&lt;phandle, mode&gt;</code> pairs depends on the number of CPUs the platform has.</pre>
    <pre data-start="601" data-end="758" class="">For our purposes, to determine whether the IMSIC node corresponds to M-mode or not, it’s sufficient to read only the first pair and check the mode like this:</pre>
    <pre data-start="322" data-end="435" class="">  if ( irq_range[1] == IRQ_M_EXT )

Thereby dt_property_read_u32_array() will return -EOVERFLOW in the case when a platfrom
has more then one CPU as we passed irq_range[2] as an argument but the amount of values
in "interrupts-extended" property will be (2 * CPUS_NUM).

I can update the comment above dt_property_read_u32_array() for more clearness.

</pre>
    <blockquote type="cite"
      cite="mid:a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( irq_range[1] == IRQ_M_EXT )
+        /* machine mode imsic node, ignore this aplic node */
+        return 0;
+
+    rc = imsic_init(imsic_node);
+    if ( rc )
+        panic("%s: Failded to initialize IMSIC\n", node-&gt;full_name);
+
+    /* Find out number of interrupt sources */
+    rc = dt_property_read_u32(node, "riscv,num-sources", &amp;aplic_info.nr_irqs);
+    if ( !rc )
+        panic("%s: failed to get number of interrupt sources\n",
+              node-&gt;full_name);
+
+    prop = dt_get_property(node, "reg", NULL);
+    dt_get_range(&amp;prop, node, &amp;paddr, &amp;size);
+    if ( !paddr )
+        panic("%s: first MMIO resource not found\n", node-&gt;full_name);
+
+    aplic.paddr_start = paddr;
+    aplic.paddr_end = paddr + size;
+    aplic.size = size;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why do all three need recording? Isn't a (start,size) tuple sufficient
(and unambiguous)?</pre>
    </blockquote>
    <pre>(start,size) will be enough. I'll drop aplic.paddr_end.

</pre>
    <blockquote type="cite"
      cite="mid:a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    aplic.regs = ioremap(paddr, size);
+    if ( !aplic.regs )
+        panic("%s: unable to map\n", node-&gt;full_name);
+
+    /* Setup initial state APLIC interrupts */
+    aplic_init_hw_interrupts();
+
+    return 0;
+}
+
+static const struct intc_hw_operations __ro_after_init aplic_ops = {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
const or __ro_after_init?</pre>
    </blockquote>
    <pre data-start="59" data-end="239" class="">What’s wrong with using both? <code
    data-start="89" data-end="96">const</code> ensures the variable can't be changed at compile time,
while <code data-start="158" data-end="175">__ro_after_init</code> makes it read-only at runtime after initialization is complete.</pre>
    <pre data-start="241" data-end="287" class="">Probably, <code
    data-start="251" data-end="264">__initconst</code> would be a better fit:
  static const struct intc_hw_operations __initconst aplic_ops = {

Or even <code data-start="371" data-end="387">__initconstrel</code>, since the <code
    data-start="399" data-end="426">struct intc_hw_operations</code> contains pointers.
</pre>
    <blockquote type="cite"
      cite="mid:a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/aplic.h
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) 2023 Microchip.
+ */
+
+#ifndef ASM__RISCV__APLIC_H
+#define ASM__RISCV__APLIC_H
+
+#include &lt;xen/types.h&gt;
+
+#include &lt;asm/imsic.h&gt;
+
+#define APLIC_DOMAINCFG_IE      BIT(8, UL)
+#define APLIC_DOMAINCFG_DM      BIT(2, UL)
+
+struct aplic_regs {
+    uint32_t domaincfg;
+    uint32_t sourcecfg[1023];
+    uint8_t _reserved1[0xBC0];
+
+    uint32_t mmsiaddrcfg;
+    uint32_t mmsiaddrcfgh;
+    uint32_t smsiaddrcfg;
+    uint32_t smsiaddrcfgh;
+    uint8_t _reserved2[0x30];
+
+    uint32_t setip[32];
+    uint8_t _reserved3[92];
+
+    uint32_t setipnum;
+    uint8_t _reserved4[0x20];
+
+    uint32_t in_clrip[32];
+    uint8_t _reserved5[92];
+
+    uint32_t clripnum;
+    uint8_t _reserved6[32];
+
+    uint32_t setie[32];
+    uint8_t _reserved7[92];
+
+    uint32_t setienum;
+    uint8_t _reserved8[32];
+
+    uint32_t clrie[32];
+    uint8_t _reserved9[92];
+
+    uint32_t clrienum;
+    uint8_t _reserved10[32];
+
+    uint32_t setipnum_le;
+    uint32_t setipnum_be;
+    uint8_t _reserved11[4088];
+
+    uint32_t genmsi;
+    uint32_t target[1023];
+};
+
+struct aplic_priv {
+    /* base physical address and size */
+    paddr_t paddr_start;
+    paddr_t paddr_end;
+    size_t  size;
+
+    /* registers */
+    volatile struct aplic_regs *regs;
+
+    /* imsic configuration */
+    const struct imsic_config *imsic_cfg;
+};
+
+#endif /* ASM__RISCV__APLIC_H */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does all of this really need to live in a non-private header?</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">struct aplic_priv is used in different files:
- in aplic.c to define `aplic` variable.
- in vaplic.c (which isn't intoduced yet) is used in several places: <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/vaplic.c#L41">https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/riscv/vaplic.c#L41</a>

struct aplic_regs is used only in aplic.c (at least, at the moment) so could be moved to
aplic.c, but I don't see too much sense.

</pre>
    <blockquote type="cite"
      cite="mid:a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -27,7 +27,6 @@
 #define IRQ_TYPE_INVALID        DT_IRQ_TYPE_INVALID
 
 /* TODO */
-#define nr_irqs 0U
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How come this is simply no longer needed, i.e. without any replacement?
Hmm, looks like the only use in common code has gone away. Yet then this
still doesn't really look to belong here (especially if not mentioned in
the description).</pre>
    </blockquote>
    <pre>I missed that it is used in xen/common/domain.c when CONFIG_HAS_PIRQ=y, but this
config isn't selected for RISC-V.
I think that I have to revert this change.

~ Oleksii
</pre>
  </body>
</html>

--------------SfsmbpGnclB31etoHmDRSJCQ--

