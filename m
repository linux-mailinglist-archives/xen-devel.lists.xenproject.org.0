Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D875ABC220
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989938.1373893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2HM-0007wf-WF; Mon, 19 May 2025 15:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989938.1373893; Mon, 19 May 2025 15:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2HM-0007v1-TG; Mon, 19 May 2025 15:19:48 +0000
Received: by outflank-mailman (input) for mailman id 989938;
 Mon, 19 May 2025 15:19:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRlD=YD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uH2HL-0007uv-HW
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:19:47 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b29a3709-34c4-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 17:19:46 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-601dd3dfc1fso2771257a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 08:19:46 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d442069sm608739066b.103.2025.05.19.08.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 08:19:45 -0700 (PDT)
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
X-Inumbo-ID: b29a3709-34c4-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747667986; x=1748272786; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLgTU49aYgp8P+Wn53PNt/s9IHXzrJNpPoF6CGKGhEc=;
        b=HmR1+DFwCTspOq2Uz0b8z+tpqjlUy3pQANRQCiddufNDk6FcvXKP5qVIuEv4OUbSqF
         YBKhP6xu8jJjbq6GDj5lCeBMArT5Ts/PTY9u1fl7iiXjLiuy+XJS4EyN65IEm7GrlboD
         Q6AXxDHXSxIMINcYEPhHayOt0r3fmyGP0ZjuwTGRT+b0Gkfg9HZMj/fA7ktSwWHW2jYi
         0Arh5THDS7EB5APvyuJuhoLsolmCUjPz3JXA6/zc1v0054DG1Lbxir7xE2P0hL6cTJyH
         /AAPw0sErPD8DTQv0FdDXcCZvyQtpg/wjnYMSP6fmt+50Z1zVuqM06hIZjO/fUl6D9G5
         ywXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667986; x=1748272786;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rLgTU49aYgp8P+Wn53PNt/s9IHXzrJNpPoF6CGKGhEc=;
        b=jWoVHxTH0X6GfsZ7917hjecs9QlUrLW8Jm7M43pQTRuETGqOzIWTdPPSJyCcLekFlj
         OTg8kfkqQe54iCp9gb2qMPmk7LDxfybiZdNHetcn6MNCq7GP18d+n6TN5yjaRlharbng
         FGxJ2Wmcz2/q5yvCS1G7uRgQklu/g4Uer3QNaesugq1Z4JBoSiA9dat/+RIGSnOvy2kf
         lUPnBMrKfRLtB8JNPKLhzht/1q0I15qIZDIETatJfwFu4WLbiaHhCmXxUIFkJEVrXukb
         Vr8Cbke+zR93PctV985gNyLgLS8JG/ESrk0MEC7VDsd2z+BYJOslHncaBMRi2RIlrzRp
         Iasw==
X-Forwarded-Encrypted: i=1; AJvYcCVPXgtUHfD7OKrb2f6o3H4Z4IEWQCGfuSRYo2ccgho/4G800Q6AbpPwMFQ1qDVQwovApjMPA1tZUks=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHw8CKQcWWaXIgDfULGbUwPaUXikMNFv3aOsnshUMO/dmXtbyI
	AeEhnt2JkD81hzwuX6fI/oOeWNk00oMtbk3uqTYEM0ZZiepK/XVdPooD
X-Gm-Gg: ASbGncuJjBJPfqYPpGjbBf+eAGgwikHjNjojh2GYIqELt1J/kPggXexL9kk04qi1qBT
	jxsA4jR1abY9H+ozNF8GkbVL6UyQUzX+NMDqF3R6r1hKCL+b1TDSnm3JTUO9/IuxmpUawAWG2/9
	Ow1v/XOEjO66ZFPECFRIPMvmY4kf17AX5pe4ccdRn8LhX1DbzpsuEI7BtBbJ9kx7dKPaGy5cjNm
	czNz+fEf//yxNq5skhrvfLxTa/+QWBAH5LRYY1vuizjsErgv2pGnQOcPuPyVSLGEG8CGBAfp3ee
	pM0OvdSbW0kyXSCi1Tl3SiljZgPWaDJ8+jNSJvTMOnMAacc5vbMM9xYfQd5buAF+B6lDgpcuVXc
	SGjctfcWqIiHQpJTl+Muy/MAv
X-Google-Smtp-Source: AGHT+IF1BWtRByF/LHKaQm16HWz6BYUwA6GT2uc6ij5tDgs8ZWJjGY6vFnLoa2AS7u/i0OJOW53H+A==
X-Received: by 2002:a17:906:8f8a:b0:ad2:500c:16ce with SMTP id a640c23a62f3a-ad536c23cffmr956568366b.33.1747667985342;
        Mon, 19 May 2025 08:19:45 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0070URhvs2zgDilLMLQSPefP"
Message-ID: <52c0be11-7c8e-4e12-9005-3a7ca7f12c43@gmail.com>
Date: Mon, 19 May 2025 17:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
 <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>

This is a multi-part message in MIME format.
--------------0070URhvs2zgDilLMLQSPefP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/15/25 10:42 AM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> imsic_init() is introduced to parse device tree node, which has the following
>> bindings [2], and based on the parsed information update IMSIC configuration
>> which is stored in imsic_cfg.
>>
>> The following helpers are introduces for imsic_init() usage:
>>    - imsic_parse_node() parses IMSIC node from DTS
>>    - imsic_get_parent_cpuid() returns the hart ( CPU ) ID of the given device
>>      tree node.
>>
>> This patch is based on the code from [1].
>>
>> Since Microchip originally developed imsic.{c,h}, an internal discussion with
>> them led to the decision to use the MIT license.
>>
>> [1]https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4
>> [2]https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
>>
>> Co-developed-by: Romain Caritey<Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V2:
>>   - Drop years in copyrights.
> Did you, really?

Oops, missed to drop it in asm/imsic.h. Thanks.

>> +    if ( rc )
>> +        return rc;
>> +
>> +    nr_mmios = imsic_cfg.nr_mmios;
>> +
>> +    /* Allocate MMIO resource array */
>> +    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
>> +    if ( !imsic_cfg.mmios )
>> +        return -ENOMEM;
>> +
>> +    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
>> +    if ( !imsic_cfg.msi )
>> +        return -ENOMEM;
> Leaking the earlier successful allocation?
>
>> +    /* Check MMIO register sets */
>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>> +    {
>> +        imsic_cfg.mmios[i].cpus = xzalloc_array(unsigned long,
>> +                                                BITS_TO_LONGS(nr_parent_irqs));
>> +        if ( !imsic_cfg.mmios[i].cpus )
>> +            return -ENOMEM;
> Leaking all earlier successful allocations?

In this cases should be:
     {
         rc = -ENOMEM;
         goto imsic_init_err;

>> +        if ( base_addr != imsic_cfg.base_addr )
>> +        {
>> +            rc = -EINVAL;
>> +            printk(XENLOG_ERR "%s: address mismatch for regset %d\n",
>> +                   node->name, i);
>> +            goto imsic_init_err;
>> +        }
>> +    }
>> +
>> +    /* Configure handlers for target CPUs */
>> +    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
>> +    {
>> +        rc = imsic_get_parent_cpuid(node, i, &cpuid);
> Coming back to a comment I gave on the respective earlier patch: What you get back
> here is a DT value, aiui. There's no translation to Xen CPU numbering space, as
> would be required for e.g. ...
>
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_WARNING "%s: cpu ID for parent irq%d not found\n",
>> +                   node->name, i);
>> +            continue;
>> +        }
>> +
>> +        if ( cpuid >= num_possible_cpus() )
> ... this. Are you using DT numbering without any translation, no matter that it
> (I suppose) could be very sparse?

Agree, it should translation of cpuid to Xen CPU numbering space as cpuid could be
sparsed according to the RISC-V spec, which guarantees only that cpuid 0 will be present,
all other could be any number.

I thought about to update that with:
    xen_cpuid = hartid_to_cpuid(hartid);

    if ( xen_cpuid >= num_possible_cpus() )
    {
         printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%u\n",
                node->name, hartid, i);
         continue;
    }
       ...

   /* defined in asm/smp.h */
   static inline unsigned long hartid_to_cpuid(unsigned long hartid)
   {
     for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
     {
         if ( hartid == cpuid_to_hartid(cpuid) )
             return cpuid;
     }

     return NR_CPUS;
   }
   
(the proper name of variable 'cpuid' I think we will agree in the discussion of one of the
earlier patches.)

But then it will be an issue that if hart_id (from DT) hasn't been assigned to Xen's cpuid,
then IMSIC's msi[] and mmio[] won't be configured properly.
Probably this is not an issue and this assignment of cpuid to hartid could be done before
imsic_init() in case of CONFIG_SMP=y.

>> +            continue;
>> +        }
>> +
>> +        /* Find MMIO location of MSI page */
>> +        index = nr_mmios;
>> +        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
>> +        for ( unsigned int j = 0; nr_mmios; j++ )
> DYM "j < nr_mmios"?

Yes, the condition should be corrected. Interesting why I am not faced an issue with such
condition, nr_mmios shouldn't be zero (I'll double check) and Linux kernel has the same
condition:
   https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-riscv-imsic-state.c#L907C31-L908C1
It seems like LK wants to have a fix too.

>> +        {
>> +            if ( reloff < imsic_cfg.mmios[j].size )
>> +            {
>> +                index = j;
>> +                break;
>> +            }
>> +
>> +            /*
>> +             * MMIO region size may not be aligned to
>> +             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
>> +             * if holes are present.
>> +             */
>> +            reloff -= ROUNDUP(imsic_cfg.mmios[j].size,
>> +                BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
>> +        }
>> +
>> +        if ( index >= nr_mmios )
> Why is it that you need both "index" and "j"?

There is no need. I will drop 'j'.

>> +                   node->name, imsic_cfg.msi[cpuid].base_addr + reloff);
>> +            imsic_cfg.msi[cpuid].offset = 0;
>> +            imsic_cfg.msi[cpuid].base_addr = 0;
>> +            continue;
>> +        }
>> +
>> +        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
> Depending on clarification on the number space used, this may want to be
> cpumask_set_cpu() instead. Else I think this is simply __set_bit().

Considering that cpuid is taken from DT and the value in device tree is what we are
using as hartid and hartid could be according any number from 0 to sizeof(unsigned long)
then we can't use cpuid for msi[] as overflow could happen, it seems like we should use
an id from Xen space. (so basically xen_cpuid which I mentioned above)

>
>> +        imsic_cfg.msi[cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
>> +        imsic_cfg.msi[cpuid].offset = reloff;
> How come it's cpuid that's used as array index here? Shouldn't this be i,
> seeing that the array allocation is using nr_parent_irqs?

Agree, something wrong is here. As I mentioned above, I think, Xen cpu space should be used here.

>> +    XFREE(imsic_cfg.msi);
>> +
>> +    return rc;
>> +}
>> --- /dev/null
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/imsic.h
>> + *
>> + * RISC-V Incoming MSI Controller support
>> + *
>> + * (c) 2023 Microchip Technology Inc.
>> + */
>> +
>> +#ifndef ASM__RISCV__IMSIC_H
>> +#define ASM__RISCV__IMSIC_H
>> +
>> +#include <xen/types.h>
>> +
>> +#define IMSIC_MMIO_PAGE_SHIFT   12
>> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
>> +
>> +#define IMSIC_MIN_ID            63
> This isn't the "minimum ID", but the "minimum permissible number of IDs" as per
> its first use in imsic_parse_node(). Further uses there consider it a mask,
> which makes me wonder whether the imsic_cfg.nr_ids field name is actually
> correct: Isn't this the maximum valid ID rather than their count/number?

imsic_cfg.nr_ids it is a value of interrupt identities supported by IMSIC interrupt file according to
DT binding:
   riscv,num-ids:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 63
     maximum: 2047
     description:
       Number of interrupt identities supported by IMSIC interrupt file.

 From some point of view it could be called as maximum valid ID specifically for a platform, but the number
of ids looks better to me.

Thanks.

~ Oleksii

--------------0070URhvs2zgDilLMLQSPefP
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
    <div class="moz-cite-prefix">On 5/15/25 10:42 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">imsic_init() is introduced to parse device tree node, which has the following
bindings [2], and based on the parsed information update IMSIC configuration
which is stored in imsic_cfg.

The following helpers are introduces for imsic_init() usage:
  - imsic_parse_node() parses IMSIC node from DTS
  - imsic_get_parent_cpuid() returns the hart ( CPU ) ID of the given device
    tree node.

This patch is based on the code from [1].

Since Microchip originally developed imsic.{c,h}, an internal discussion with
them led to the decision to use the MIT license.

[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4">https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4</a>
[2] <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml">https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml</a>

Co-developed-by: Romain Caritey <a class="moz-txt-link-rfc2396E" href="mailto:Romain.Caritey@microchip.com">&lt;Romain.Caritey@microchip.com&gt;</a>
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V2:
 - Drop years in copyrights.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Did you, really?</pre>
    </blockquote>
    <pre>Oops, missed to drop it in asm/imsic.h. Thanks.

</pre>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( rc )
+        return rc;
+
+    nr_mmios = imsic_cfg.nr_mmios;
+
+    /* Allocate MMIO resource array */
+    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
+    if ( !imsic_cfg.mmios )
+        return -ENOMEM;
+
+    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
+    if ( !imsic_cfg.msi )
+        return -ENOMEM;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Leaking the earlier successful allocation?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i &lt; nr_mmios; i++ )
+    {
+        imsic_cfg.mmios[i].cpus = xzalloc_array(unsigned long,
+                                                BITS_TO_LONGS(nr_parent_irqs));
+        if ( !imsic_cfg.mmios[i].cpus )
+            return -ENOMEM;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Leaking all earlier successful allocations?</pre>
    </blockquote>
    <pre>In this cases should be:
    {
        rc = -ENOMEM;
        goto imsic_init_err;</pre>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( base_addr != imsic_cfg.base_addr )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: address mismatch for regset %d\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
+    }
+
+    /* Configure handlers for target CPUs */
+    for ( unsigned int i = 0; i &lt; nr_parent_irqs; i++ )
+    {
+        rc = imsic_get_parent_cpuid(node, i, &amp;cpuid);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Coming back to a comment I gave on the respective earlier patch: What you get back
here is a DT value, aiui. There's no translation to Xen CPU numbering space, as
would be required for e.g. ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%s: cpu ID for parent irq%d not found\n",
+                   node-&gt;name, i);
+            continue;
+        }
+
+        if ( cpuid &gt;= num_possible_cpus() )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this. Are you using DT numbering without any translation, no matter that it
(I suppose) could be very sparse?</pre>
    </blockquote>
    <pre>Agree, it should translation of cpuid to Xen CPU numbering space as cpuid could be
sparsed according to the RISC-V spec, which guarantees only that cpuid 0 will be present,
all other could be any number.

I thought about to update that with:
   xen_cpuid = hartid_to_cpuid(hartid);

   if ( xen_cpuid &gt;= num_possible_cpus() )
   {
        printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%u\n",
               node-&gt;name, hartid, i);
        continue;
   }
      ...

  /* defined in asm/smp.h */
  static inline unsigned long hartid_to_cpuid(unsigned long hartid)
  {
    for ( unsigned int cpuid = 0; cpuid &lt; ARRAY_SIZE(pcpu_info); cpuid++ )
    {
        if ( hartid == cpuid_to_hartid(cpuid) )
            return cpuid;
    }

    return NR_CPUS;
  }
  
(the proper name of variable 'cpuid' I think we will agree in the discussion of one of the
earlier patches.)

But then it will be an issue that if hart_id (from DT) hasn't been assigned to Xen's cpuid,
then IMSIC's msi[] and mmio[] won't be configured properly.
Probably this is not an issue and this assignment of cpuid to hartid could be done before
imsic_init() in case of CONFIG_SMP=y.
</pre>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+            continue;
+        }
+
+        /* Find MMIO location of MSI page */
+        index = nr_mmios;
+        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
+        for ( unsigned int j = 0; nr_mmios; j++ )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
DYM "j &lt; nr_mmios"?</pre>
    </blockquote>
    <pre>Yes, the condition should be corrected. Interesting why I am not faced an issue with such
condition, nr_mmios shouldn't be zero (I'll double check) and Linux kernel has the same
condition:
  <a class="moz-txt-link-freetext" href="https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-riscv-imsic-state.c#L907C31-L908C1">https://github.com/torvalds/linux/blob/master/drivers/irqchip/irq-riscv-imsic-state.c#L907C31-L908C1</a>
It seems like LK wants to have a fix too.

</pre>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        {
+            if ( reloff &lt; imsic_cfg.mmios[j].size )
+            {
+                index = j;
+                break;
+            }
+
+            /*
+             * MMIO region size may not be aligned to
+             * BIT(global-&gt;guest_index_bits) * IMSIC_MMIO_PAGE_SZ
+             * if holes are present.
+             */
+            reloff -= ROUNDUP(imsic_cfg.mmios[j].size,
+                BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
+        }
+
+        if ( index &gt;= nr_mmios )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why is it that you need both "index" and "j"?</pre>
    </blockquote>
    <pre>There is no need. I will drop 'j'.

</pre>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                   node-&gt;name, imsic_cfg.msi[cpuid].base_addr + reloff);
+            imsic_cfg.msi[cpuid].offset = 0;
+            imsic_cfg.msi[cpuid].base_addr = 0;
+            continue;
+        }
+
+        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Depending on clarification on the number space used, this may want to be
cpumask_set_cpu() instead. Else I think this is simply __set_bit().</pre>
    </blockquote>
    <pre>Considering that cpuid is taken from DT and the value in device tree is what we are
using as hartid and hartid could be according any number from 0 to sizeof(unsigned long)
then we can't use cpuid for msi[] as overflow could happen, it seems like we should use
an id from Xen space. (so basically xen_cpuid which I mentioned above)

</pre>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        imsic_cfg.msi[cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
+        imsic_cfg.msi[cpuid].offset = reloff;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How come it's cpuid that's used as array index here? Shouldn't this be i,
seeing that the array allocation is using nr_parent_irqs?</pre>
    </blockquote>
    <pre>Agree, something wrong is here. As I mentioned above, I think, Xen cpu space should be used here.

</pre>
    <blockquote type="cite"
      cite="mid:0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    XFREE(imsic_cfg.msi);
+
+    return rc;
+}
--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.h
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) 2023 Microchip Technology Inc.
+ */
+
+#ifndef ASM__RISCV__IMSIC_H
+#define ASM__RISCV__IMSIC_H
+
+#include &lt;xen/types.h&gt;
+
+#define IMSIC_MMIO_PAGE_SHIFT   12
+#define IMSIC_MMIO_PAGE_SZ      (1UL &lt;&lt; IMSIC_MMIO_PAGE_SHIFT)
+
+#define IMSIC_MIN_ID            63
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This isn't the "minimum ID", but the "minimum permissible number of IDs" as per
its first use in imsic_parse_node(). Further uses there consider it a mask,
which makes me wonder whether the imsic_cfg.nr_ids field name is actually
correct: Isn't this the maximum valid ID rather than their count/number?</pre>
    </blockquote>
    <pre>imsic_cfg.nr_ids it is a value of interrupt identities supported by IMSIC interrupt file according to
DT binding:
  riscv,num-ids:
    $ref: /schemas/types.yaml#/definitions/uint32
    minimum: 63
    maximum: 2047
    description:
      Number of interrupt identities supported by IMSIC interrupt file.

From some point of view it could be called as maximum valid ID specifically for a platform, but the number
of ids looks better to me.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------0070URhvs2zgDilLMLQSPefP--

