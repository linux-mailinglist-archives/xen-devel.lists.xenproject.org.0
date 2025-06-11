Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153FCAD5090
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 11:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011412.1389836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPI7S-00078f-RR; Wed, 11 Jun 2025 09:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011412.1389836; Wed, 11 Jun 2025 09:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPI7S-000770-Og; Wed, 11 Jun 2025 09:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1011412;
 Wed, 11 Jun 2025 09:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mXZ=Y2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uPI7R-00076u-Gn
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 09:51:41 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab83fe3d-46a9-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 11:51:39 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60768f080d8so9837334a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 02:51:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783de30csm7253660a12.66.2025.06.11.02.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 02:51:37 -0700 (PDT)
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
X-Inumbo-ID: ab83fe3d-46a9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749635498; x=1750240298; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCBTYdU/oI6c9xHLFYr81STp4FAQRFNyFFKGDBUAGd8=;
        b=hNJbI8enuoupj+GIwHoaZG3NnA18lw7WtG9SsSI5KrIirTkSXr1IuuVbY6Td7yMOPb
         EWZcbtRHgwvHzYHJO0CQW39ksgRTkS+/oWuq0OTDo/rtlNR9uMOb696KhDwv7WNhBl8L
         NLRXIJeosdCn/w8wQy2K0/GhFzmq6ylLutvU7sN6443zoGIri+sLT55jxnNegjl9bsFo
         TbTJgkFHgF0XnhMJ4jhTcsuv0IOD7WTUQIAObE/FM+m/EOVcKLyidlBTTH+JiYKjM2Fk
         wpXqh+es9WmHiY2zyjB4+x6JpTcaIEnmIQdEcAK6Qm4y86WbZ6p294Zm/mr7/QhFWl+r
         J0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749635498; x=1750240298;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zCBTYdU/oI6c9xHLFYr81STp4FAQRFNyFFKGDBUAGd8=;
        b=oYfvpkOl2986yDyJjO5W/BbZFpob3dtvRkdQGWYmL6+x8abL3wBhYkdDPXFeAOypqd
         1fLjB+/PuvatLoGM7hCQ744LzSUYBGMDN8v30HGIDLHyHrHggEsu2KjuwoJZuples4c3
         yzh+e9o2qYd/477grpen9P0mazJOYcdJl9HjSZrTnMcJYZnath9VSPM1k5cWBHDXJe1W
         +ik463wjXP9oKI+SVqW3jM7G2Vt0Rz4SZC3bHRubKb7KTfQQ/94P9AnzFP0wPwsKbik9
         SwcYiMVcBG0aXUtLJxD4AC9w3kO2p9YU9lGVyRStqLNg+HFtOS/DluOgUisQhTvUw/XK
         vLCA==
X-Forwarded-Encrypted: i=1; AJvYcCXtZBS156E8Rm1SufoxK5QBLkjpIfhDGwEf9h5DVjcZ5x/KTvvU7TxmWDFU0IFNLpmANGZ51szklhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPtl+y/OoZq3E85CpteYJNakFuF3gjUAtEO8mAQ3u6RFK5v8Ga
	WUOopj5diJVDxm5ZSisUAII/JOonB7dXcZc/AbTxBTB/M3uXmJm2r0XM
X-Gm-Gg: ASbGncs1bN11w6SNDHkMS1Jak1lLliZDwe+9ctG6HZMGluEf5XIcsJFHOcy8q5uVyb9
	0vK4Tqua7QoWLPcBKdgab4PsbS1d3nXjwPjwJj6n9kPd/H6lzZW8RmUDY56Ku0vkfApfzalNUNZ
	0bxuAj3O+jgonop6Alj/8HvY3DYgW0AJBpb7KKQlBd+O3iLxVmqZ92W5ZxGK+rnFMLfhKwdg2tq
	vSI7k8ghS0OVYW4piaDLgjQVs6J/6CWdNr3H9IZx1mhay6u99XNGvv7d6z/CQDpWpd9to8f9mmP
	pC7o6Fja4xsGQYNz3EqDeWKh0cTPJEH1GCQunuknKZojJavubDezH3lOLpYTgK5QT845Fbf+/Ah
	GqQayJAnLVnhPEsWMhSWrD3hRHYfS0ElYmQ4=
X-Google-Smtp-Source: AGHT+IGXvlHyny7A3uKJEU0FPoQriQrUXM/zxHNpzw6Cl8D6YDPuN9wVoczDiqivEpFwF6BUyjzN6g==
X-Received: by 2002:a05:6402:2749:b0:607:f61f:cc18 with SMTP id 4fb4d7f45d1cf-6084e2cedb6mr1775614a12.0.1749635498205;
        Wed, 11 Jun 2025 02:51:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0KL4Rntryxg1Xxkrzb0OXOnq"
Message-ID: <36912da6-7790-4c6a-8190-60f87bec09d1@gmail.com>
Date: Wed, 11 Jun 2025 11:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <a0816fb00eec29327146b828fa460b5a444e26a7.1749121437.git.oleksii.kurochko@gmail.com>
 <910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com>

This is a multi-part message in MIME format.
--------------0KL4Rntryxg1Xxkrzb0OXOnq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/25 5:17 PM, Jan Beulich wrote:
> On 05.06.2025 17:58, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -0,0 +1,358 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/imsic.c
>> + *
>> + * RISC-V Incoming MSI Controller support
>> + *
>> + * (c) Microchip Technology Inc.
>> + * (c) Vates
>> + */
>> +
>> +#include <xen/bitops.h>
>> +#include <xen/const.h>
>> +#include <xen/cpumask.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/macros.h>
>> +#include <xen/smp.h>
>> +#include <xen/spinlock.h>
>> +#include <xen/xvmalloc.h>
>> +
>> +#include <asm/imsic.h>
>> +
>> +#define IMSIC_HART_SIZE(guest_bits_) (BIT(guest_bits_, U) * IMSIC_MMIO_PAGE_SZ)
> Minor: Any particular reason for the trailing underscore here?

Not really, I will drop it.

>
>> +/*
>> + * Initialize the imsic_cfg structure based on the IMSIC DT node.
>> + *
>> + * Returns 0 if initialization is successful, a negative value on failure,
>> + * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
>> + * which should be ignored by the hypervisor.
>> + */
>> +int __init imsic_init(const struct dt_device_node *node)
>> +{
>> +    int rc;
>> +    unsigned long reloff, hartid;
>> +    unsigned int nr_parent_irqs, index, nr_handlers = 0;
>> +    paddr_t base_addr;
>> +    unsigned int nr_mmios;
>> +    struct imsic_mmios *mmios;
>> +    struct imsic_msi *msi = NULL;
>> +
>> +    /* Parse IMSIC node */
>> +    rc = imsic_parse_node(node, &nr_parent_irqs, &nr_mmios);
>> +    /*
>> +     * If machine mode imsic node => ignore it.
>> +     * If rc < 0 => parsing of IMSIC DT node failed.
>> +     */
>> +    if ( (rc == IRQ_M_EXT) || (rc < 0) )
>> +        return rc;
>> +
>> +    /* Allocate MMIO resource array */
>> +    mmios = xvzalloc_array(struct imsic_mmios, nr_mmios);
>> +    if ( !mmios )
>> +    {
>> +        rc = -ENOMEM;
>> +        goto imsic_init_err;
>> +    }
>> +
>> +    msi = xvzalloc_array(struct imsic_msi, nr_parent_irqs);
>> +    if ( !msi )
>> +    {
>> +        rc = -ENOMEM;
>> +        goto imsic_init_err;
>> +    }
>> +
>> +    /* Check MMIO register sets */
>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>> +    {
>> +        unsigned int guest_bits = imsic_cfg.guest_index_bits;
>> +        unsigned long expected_mmio_size =
>> +            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
>> +
>> +        rc = dt_device_get_address(node, i, &mmios[i].base_addr,
>> +                                   &mmios[i].size);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>> +                   node->name, i);
>> +            goto imsic_init_err;
>> +        }
>> +
>> +        base_addr = mmios[i].base_addr;
>> +        base_addr &= ~(BIT(guest_bits +
>> +                           imsic_cfg.hart_index_bits +
>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>> +                       imsic_cfg.group_index_shift);
>> +        if ( base_addr != imsic_cfg.base_addr )
>> +        {
>> +            rc = -EINVAL;
>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>> +                   node->name, i);
>> +            goto imsic_init_err;
>> +        }
>> +
>> +        if ( mmios[i].size != expected_mmio_size )
>> +        {
>> +            rc = -EINVAL;
>> +            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, "
>> +                   "expeced MMIO size: %ld\n", node->name, mmios[i].size,
> To aid grep-ability, please avoid wrapping format strings across lines.
> (Same at least once more elsewhere.)
>
>> +                   expected_mmio_size);
>> +            goto imsic_init_err;
>> +        }
>> +    }
>> +
>> +    /* Configure handlers for target CPUs */
>> +    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
>> +    {
>> +        unsigned long cpu;
> Along the lines of questions on earlier versions: Any reason this isn't
> unsigned int?

Failed to do proper cleanup. It should be unsigned int.

>
>> +        rc = imsic_get_parent_hartid(node, i, &hartid);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
>> +                   node->name, i);
>> +            continue;
>> +        }
>> +
>> +        cpu = hartid_to_cpuid(hartid);
>> +
>> +        if ( cpu >= num_possible_cpus() )
>> +        {
>> +            printk(XENLOG_WARNING "%s: unsupported hart ID=%#lx for parent "
>> +                   "irq%u\n", node->name, hartid, i);
>> +            continue;
>> +        }
>> +
>> +        /* Find MMIO location of MSI page */
>> +        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
> Any reason to open-code IMSIC_HART_SIZE() here and ...
>
>> +        for ( index = 0; index < nr_mmios; index++ )
>> +        {
>> +            if ( reloff < mmios[index].size )
>> +                break;
>> +
>> +            /*
>> +             * MMIO region size may not be aligned to
>> +             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
>> +             * if holes are present.
>> +             */
>> +            reloff -= ROUNDUP(mmios[index].size,
>> +                      BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
> ... here?

Thanks, missed that. I'll update such places.

>
>> +        }
>> +
>> +        if ( index == nr_mmios )
>> +        {
>> +            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
>> +                   node->name, i);
>> +            continue;
>> +        }
>> +
>> +        if ( !IS_ALIGNED(msi[cpu].base_addr + reloff,
> DYM mmios[index].base_addr here, considering that ...
>
>> +                         IMSIC_MMIO_PAGE_SZ) )
>> +        {
>> +            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on "
>> +                   "a page\n", node->name, msi[cpu].base_addr + reloff);
>> +            msi[cpu].offset = 0;
>> +            msi[cpu].base_addr = 0;
>> +            continue;
>> +        }
>> +
>> +        msi[cpu].base_addr = mmios[index].base_addr;
>> +        msi[cpu].offset = reloff;
> msi[cpu] is set only here?

Yes, mmios[] should be used instead of msi[]...

>
> Also is the setting to zero of both fields on the "continue" path really
> needed, seeing that the array starts out zero-filled? Can the same CPU
> be found twice, making it necessary(?) to invalidate the array slot later?

Normally no, it can't be that the same CPU is found twice.

On other side, I tried to compile by hand DTS which has two the same CPUs
mentioned in IMSIC node and it allows me to do that:
(XEN) Latest ChangeSet:
(XEN) build-id: 2cd98ed5a91bf443a02a9c4e83f05df4c1f7ec61
(XEN) !!! hartid:0
(XEN) imsics: unsupported hart ID=0 for parent irq0
(XEN) !!! hartid:2
(XEN) imsics: unsupported hart ID=0x2 for parent irq1
(XEN) !!! hartid:2
(XEN) imsics: unsupported hart ID=0x2 for parent irq2
(XEN) !!! hartid:3
(XEN) Allocated console ring of 16 KiB.

(unsupported hart ID=... is printed here because I told QEMU that you have 1
cpu, but in DTS I mentioned more then 1)

It seems like it is needed also to check if IMSIC node provides unique cpu in
its interrupts-extended property. And to verify that I think it would be enough
to check if msi[cpu].base_addr isn't 0:
@@ -408,15 +407,19 @@ int __init imsic_init(const struct dt_device_node *node)
  
          cpu = hartid_to_cpuid(hartid);
  
+        if ( msi[cpu].base_addr )
+            panic("%s: cpu%d is found twice in interrupts-extended prop\n",
+                  node->name, cpu);
+
Or probably it would be better just ignore by doing 'continue' instead of
panic() as it is done in other places in imsic_init().

Thanks.

~ Oleksii

--------------0KL4Rntryxg1Xxkrzb0OXOnq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/10/25 5:17 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com">
      <pre wrap="" class="moz-quote-pre">On 05.06.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/imsic.c
@@ -0,0 +1,358 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.c
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) Microchip Technology Inc.
+ * (c) Vates
+ */
+
+#include &lt;xen/bitops.h&gt;
+#include &lt;xen/const.h&gt;
+#include &lt;xen/cpumask.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/smp.h&gt;
+#include &lt;xen/spinlock.h&gt;
+#include &lt;xen/xvmalloc.h&gt;
+
+#include &lt;asm/imsic.h&gt;
+
+#define IMSIC_HART_SIZE(guest_bits_) (BIT(guest_bits_, U) * IMSIC_MMIO_PAGE_SZ)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Minor: Any particular reason for the trailing underscore here?</pre>
    </blockquote>
    <pre>Not really, I will drop it.

</pre>
    <blockquote type="cite"
      cite="mid:910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Initialize the imsic_cfg structure based on the IMSIC DT node.
+ *
+ * Returns 0 if initialization is successful, a negative value on failure,
+ * or IRQ_M_EXT if the IMSIC node corresponds to a machine-mode IMSIC,
+ * which should be ignored by the hypervisor.
+ */
+int __init imsic_init(const struct dt_device_node *node)
+{
+    int rc;
+    unsigned long reloff, hartid;
+    unsigned int nr_parent_irqs, index, nr_handlers = 0;
+    paddr_t base_addr;
+    unsigned int nr_mmios;
+    struct imsic_mmios *mmios;
+    struct imsic_msi *msi = NULL;
+
+    /* Parse IMSIC node */
+    rc = imsic_parse_node(node, &amp;nr_parent_irqs, &amp;nr_mmios);
+    /*
+     * If machine mode imsic node =&gt; ignore it.
+     * If rc &lt; 0 =&gt; parsing of IMSIC DT node failed.
+     */
+    if ( (rc == IRQ_M_EXT) || (rc &lt; 0) )
+        return rc;
+
+    /* Allocate MMIO resource array */
+    mmios = xvzalloc_array(struct imsic_mmios, nr_mmios);
+    if ( !mmios )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    msi = xvzalloc_array(struct imsic_msi, nr_parent_irqs);
+    if ( !msi )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i &lt; nr_mmios; i++ )
+    {
+        unsigned int guest_bits = imsic_cfg.guest_index_bits;
+        unsigned long expected_mmio_size =
+            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
+
+        rc = dt_device_get_address(node, i, &amp;mmios[i].base_addr,
+                                   &amp;mmios[i].size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
+
+        base_addr = mmios[i].base_addr;
+        base_addr &amp;= ~(BIT(guest_bits +
+                           imsic_cfg.hart_index_bits +
+                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+        base_addr &amp;= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) &lt;&lt;
+                       imsic_cfg.group_index_shift);
+        if ( base_addr != imsic_cfg.base_addr )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
+
+        if ( mmios[i].size != expected_mmio_size )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, "
+                   "expeced MMIO size: %ld\n", node-&gt;name, mmios[i].size,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
To aid grep-ability, please avoid wrapping format strings across lines.
(Same at least once more elsewhere.)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                   expected_mmio_size);
+            goto imsic_init_err;
+        }
+    }
+
+    /* Configure handlers for target CPUs */
+    for ( unsigned int i = 0; i &lt; nr_parent_irqs; i++ )
+    {
+        unsigned long cpu;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Along the lines of questions on earlier versions: Any reason this isn't
unsigned int?</pre>
    </blockquote>
    <pre>Failed to do proper cleanup. It should be unsigned int.
</pre>
    <blockquote type="cite"
      cite="mid:910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        rc = imsic_get_parent_hartid(node, i, &amp;hartid);
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "%s: cpu ID for parent irq%u not found\n",
+                   node-&gt;name, i);
+            continue;
+        }
+
+        cpu = hartid_to_cpuid(hartid);
+
+        if ( cpu &gt;= num_possible_cpus() )
+        {
+            printk(XENLOG_WARNING "%s: unsupported hart ID=%#lx for parent "
+                   "irq%u\n", node-&gt;name, hartid, i);
+            continue;
+        }
+
+        /* Find MMIO location of MSI page */
+        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Any reason to open-code IMSIC_HART_SIZE() here and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        for ( index = 0; index &lt; nr_mmios; index++ )
+        {
+            if ( reloff &lt; mmios[index].size )
+                break;
+
+            /*
+             * MMIO region size may not be aligned to
+             * BIT(global-&gt;guest_index_bits) * IMSIC_MMIO_PAGE_SZ
+             * if holes are present.
+             */
+            reloff -= ROUNDUP(mmios[index].size,
+                      BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here?</pre>
    </blockquote>
    <pre>Thanks, missed that. I'll update such places.

</pre>
    <blockquote type="cite"
      cite="mid:910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        }
+
+        if ( index == nr_mmios )
+        {
+            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%u\n",
+                   node-&gt;name, i);
+            continue;
+        }
+
+        if ( !IS_ALIGNED(msi[cpu].base_addr + reloff,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
DYM mmios[index].base_addr here, considering that ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                         IMSIC_MMIO_PAGE_SZ) )
+        {
+            printk(XENLOG_WARNING "%s: MMIO address %#lx is not aligned on "
+                   "a page\n", node-&gt;name, msi[cpu].base_addr + reloff);
+            msi[cpu].offset = 0;
+            msi[cpu].base_addr = 0;
+            continue;
+        }
+
+        msi[cpu].base_addr = mmios[index].base_addr;
+        msi[cpu].offset = reloff;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
msi[cpu] is set only here?</pre>
    </blockquote>
    <pre>Yes, mmios[] should be used instead of msi[]...

</pre>
    <blockquote type="cite"
      cite="mid:910ea6a2-2bd1-4499-bdb1-debc4a778502@suse.com">
      <pre wrap="" class="moz-quote-pre">

Also is the setting to zero of both fields on the "continue" path really
needed, seeing that the array starts out zero-filled? Can the same CPU
be found twice, making it necessary(?) to invalidate the array slot later?</pre>
    </blockquote>
    <pre>Normally no, it can't be that the same CPU is found twice.

On other side, I tried to compile by hand DTS which has two the same CPUs
mentioned in IMSIC node and it allows me to do that:
(XEN) Latest ChangeSet: 
(XEN) build-id: 2cd98ed5a91bf443a02a9c4e83f05df4c1f7ec61
(XEN) !!! hartid:0
(XEN) imsics: unsupported hart ID=0 for parent irq0
(XEN) !!! hartid:2
(XEN) imsics: unsupported hart ID=0x2 for parent irq1
(XEN) !!! hartid:2
(XEN) imsics: unsupported hart ID=0x2 for parent irq2
(XEN) !!! hartid:3
(XEN) Allocated console ring of 16 KiB.

(unsupported hart ID=... is printed here because I told QEMU that you have 1
cpu, but in DTS I mentioned more then 1)

It seems like it is needed also to check if IMSIC node provides unique cpu in
its interrupts-extended property. And to verify that I think it would be enough
to check if msi[cpu].base_addr isn't 0:
@@ -408,15 +407,19 @@ int __init imsic_init(const struct dt_device_node *node)
 
         cpu = hartid_to_cpuid(hartid);
 
+        if ( msi[cpu].base_addr )
+            panic("%s: cpu%d is found twice in interrupts-extended prop\n",
+                  node-&gt;name, cpu);
+
Or probably it would be better just ignore by doing 'continue' instead of
panic() as it is done in other places in imsic_init().

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------0KL4Rntryxg1Xxkrzb0OXOnq--

