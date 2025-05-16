Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A891AB9B80
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 13:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987026.1372502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFtcl-0006tf-3g; Fri, 16 May 2025 11:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987026.1372502; Fri, 16 May 2025 11:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFtcl-0006sA-0R; Fri, 16 May 2025 11:53:11 +0000
Received: by outflank-mailman (input) for mailman id 987026;
 Fri, 16 May 2025 11:53:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8HW=YA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uFtcj-0006s4-BS
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 11:53:09 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 558b2d6d-324c-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 13:53:08 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a1b8e8b2b2so1326348f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 04:53:08 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8d005sm2654649f8f.90.2025.05.16.04.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 04:53:07 -0700 (PDT)
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
X-Inumbo-ID: 558b2d6d-324c-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747396388; x=1748001188; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5SoKpPrapY6NKVQi0J3X/iaqhKoVWLrPmIwUGsSZGs=;
        b=AruJZm+WW9QTg7YchmvSPrbx84S7QkFHnNdeSm0lbp8EK+gfxrJoOQT0hXzASc40MZ
         xr6B+TZdd7Bj/JG2u9/CUmsYQi1JKF/NvsxXzJ6lnbh+v+BbMCYl1Kr5MdtCqrZYeHuS
         YbWpJHpu2ecERT1yR2p15O5z6T1JkFL7v4D/Z20LwQEn0hXmXjHGcZpQYEJNLYIiZmLJ
         IvmFaBIbgnqVXv1UslirqGgmDw11fKS2J60amQ92Ti1FtL/5/2yOntobhkVGzgWRAilR
         VXQl+3XbegrlBLuow+RPYyj4/zcYso2LIOY9SIVvZM7i/PwwTlgjkh4xiV4PtWmRReaS
         o4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747396388; x=1748001188;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5SoKpPrapY6NKVQi0J3X/iaqhKoVWLrPmIwUGsSZGs=;
        b=O0ojw18WwTOgsYJ9Amb4PnNMHC6UHeZ0LC3r36ssXYiZk/bedLYRIa5ntR3L05fjdK
         ogIfKSBPXOMiB/HepjEDZsheWqtCnLBVQ8pu6KXqpe985JL016u8rVFja+etSwQkEes4
         iLlfe8yR48ozaPXyIzeSiyrlhw2HhheG2cs8mDqBqhR1uo6iLExD2qkj6BeenuHcYLHT
         8ExsTsRGmbS2SEnZ6RWzpAWqy8jW3n72MG4mua5Krugx5ny2oux6pz95rHbP1P+EHZ+M
         nZ07Zpf21tueKnGHW0Mqw5EoNhpckLNwVqmcv3w/1/EbJ7t7rOuHzZeKZMfT+JMC3zeg
         29Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUW83RnSEHRI150zesGtm8aOZ53pKkmzvwsjl8nsz+qOlY0Vxax6SAygB2Cspyy2iCk6YMmcq0DHzc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaFG0zOWZ6cmzvZm/+pvc17n09TBj7LR0FZwKYeeMWkMhYrEMH
	csoHQL45azxp5o3aXy6Kn2iMQ6ztBXeTn6daev32/hoj+ALcILRftBf/
X-Gm-Gg: ASbGncvsPUZYwxXOhWlrQGXO4vJZ+6Z2BNmFvqxI/ewRVEOoxCQyZfqedTKdE57tI6D
	kskjGbwAVFtKuGdFztujcC4bgOwCrla1dGoYeOr2wf8ZN2YT0YSEpeNOkqBuFX+MaVem39zojx1
	/7flphqZUnseYPTFSXA33/ivUjvlh4hOoOrYdN+3vRGwGB4ZWsoYy5duT3ys5W49IZAI+AjEW/P
	cX5giHh98wvLU3rJ2QnMkHwyTk5OTB/lAj+hWK/ju0JAuJ7+/SMkkDrZCgGWp4tW1DGHU0sNsJ7
	ydipfRcVXMfjsMPUAUiTGn/iN4XFVTOb7kk3xiHFA7qifVFvq5t1r0pmZzk3c6CXKO+8GgXwsiK
	RrdCIDHgs5s2hFSx2BCcFoU4n
X-Google-Smtp-Source: AGHT+IHbT/UZao4x04QuIZBoXvEGkBoVMQ8DWIk+sOWqPwKVu0QvAxBiqpE1ERCppieDnJ5WopXUnA==
X-Received: by 2002:a05:6000:2a4:b0:3a0:b5ec:f05f with SMTP id ffacd0b85a97d-3a35c84bd9emr3208624f8f.39.1747396387514;
        Fri, 16 May 2025 04:53:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7L4IutCdbFvTeN76XvOdN4H7"
Message-ID: <43bc3c71-fa21-4373-b136-31f2f6bd29ab@gmail.com>
Date: Fri, 16 May 2025 13:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] xen/riscv: introduce init_IRQ()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <2a57200785c710a5203a116bf9a933b4ea12d112.1746530883.git.oleksii.kurochko@gmail.com>
 <86738265-1137-45f0-ae9e-0db7f0451c08@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <86738265-1137-45f0-ae9e-0db7f0451c08@suse.com>

This is a multi-part message in MIME format.
--------------7L4IutCdbFvTeN76XvOdN4H7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/14/25 4:49 PM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/irq.h
>> +++ b/xen/arch/riscv/include/asm/irq.h
>> @@ -3,6 +3,11 @@
>>   #define ASM__RISCV__IRQ_H
>>   
>>   #include <xen/bug.h>
>> +#include <xen/device_tree.h>
>> +
>> +#include <asm/irq-dt.h>
>> +
>> +#define NR_IRQS 1024
> Is this arbitrary or arch-induced? Imo it wants saying in a brief comment either
> way. Then again maybe it's entirely obvious for a RISC-V person ...

1024 it is number of interrupt sources for PLIC and APLIC. I will add the comment above:
/*
  * According to the AIA spec:
  *   The maximum number of interrupt sources an APLIC may support is 1023.
  *
  * The same is true for PLIC.
  *
  * Interrupt Source 0 is reserved and shall never generate an interrupt.
  */
#define NR_CPUS 1024

Probably, it makes sense to change it to 1023 as interrupt 0 isn't really used.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/irq.c
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +/*
>> + * RISC-V Trap handlers
>> + *
>> + * Copyright (c) 2024 Vates
>> + */
>> +
>> +#include <xen/bug.h>
>> +#include <xen/init.h>
>> +#include <xen/irq.h>
>> +
>> +static irq_desc_t irq_desc[NR_IRQS];
>> +
>> +int arch_init_one_irq_desc(struct irq_desc *desc)
>> +{
>> +    desc->arch.type = IRQ_TYPE_INVALID;
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init init_irq_data(void)
>> +{
>> +    unsigned int irq;
>> +
>> +    for ( irq = 0; irq < NR_IRQS; irq++ )
>> +    {
>> +        struct irq_desc *desc = irq_to_desc(irq);
>> +        int rc = init_one_irq_desc(desc);
>> +
>> +        if ( rc )
>> +            return rc;
>> +
>> +        desc->irq = irq;
>> +        desc->action  = NULL;
> Nit: You copied a stray blank from Arm code. Actually I wonder why it isn't
> init_one_irq_desc() that clears this field.

I can come up with the patch which does desc->action = NULL in init_one_irq_desc().
But considering that irq_desc[] is zero-initialized then perhaps there is no any
sense for desc->action = NULL, at all.

> It also feels like ->irq would
> better be set ahead of calling that function, like x86 has it.

But what is the difference with an order of writing a value to ->irq? It isn't
really used in init_one_irq_desc(). Or could ->irq be used in arch_init_one_irq_desc()
for something?

~ Oleksii

--------------7L4IutCdbFvTeN76XvOdN4H7
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
    <div class="moz-cite-prefix">On 5/14/25 4:49 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:86738265-1137-45f0-ae9e-0db7f0451c08@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -3,6 +3,11 @@
 #define ASM__RISCV__IRQ_H
 
 #include &lt;xen/bug.h&gt;
+#include &lt;xen/device_tree.h&gt;
+
+#include &lt;asm/irq-dt.h&gt;
+
+#define NR_IRQS 1024
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this arbitrary or arch-induced? Imo it wants saying in a brief comment either
way. Then again maybe it's entirely obvious for a RISC-V person ...</pre>
    </blockquote>
    <pre>1024 it is number of interrupt sources for PLIC and APLIC. I will add the comment above:
/*
 * According to the AIA spec:
 *   The maximum number of interrupt sources an APLIC may support is 1023.
 *
 * The same is true for PLIC.
 *
 * Interrupt Source 0 is reserved and shall never generate an interrupt.
 */
#define NR_CPUS 1024

Probably, it makes sense to change it to 1023 as interrupt 0 isn't really used.

</pre>
    <blockquote type="cite"
      cite="mid:86738265-1137-45f0-ae9e-0db7f0451c08@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/irq.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * RISC-V Trap handlers
+ *
+ * Copyright (c) 2024 Vates
+ */
+
+#include &lt;xen/bug.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/irq.h&gt;
+
+static irq_desc_t irq_desc[NR_IRQS];
+
+int arch_init_one_irq_desc(struct irq_desc *desc)
+{
+    desc-&gt;arch.type = IRQ_TYPE_INVALID;
+
+    return 0;
+}
+
+static int __init init_irq_data(void)
+{
+    unsigned int irq;
+
+    for ( irq = 0; irq &lt; NR_IRQS; irq++ )
+    {
+        struct irq_desc *desc = irq_to_desc(irq);
+        int rc = init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
+        desc-&gt;irq = irq;
+        desc-&gt;action  = NULL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: You copied a stray blank from Arm code. Actually I wonder why it isn't
init_one_irq_desc() that clears this field. </pre>
    </blockquote>
    <pre>I can come up with the patch which does desc-&gt;action = NULL in init_one_irq_desc().
But considering that irq_desc[] is zero-initialized then perhaps there is no any
sense for desc-&gt;action = NULL, at all.
</pre>
    <blockquote type="cite"
      cite="mid:86738265-1137-45f0-ae9e-0db7f0451c08@suse.com">
      <pre wrap="" class="moz-quote-pre">It also feels like -&gt;irq would
better be set ahead of calling that function, like x86 has it.</pre>
    </blockquote>
    <pre>But what is the difference with an order of writing a value to -&gt;irq? It isn't
really used in init_one_irq_desc(). Or could -&gt;irq be used in arch_init_one_irq_desc()
for something?

~ Oleksii
</pre>
  </body>
</html>

--------------7L4IutCdbFvTeN76XvOdN4H7--

