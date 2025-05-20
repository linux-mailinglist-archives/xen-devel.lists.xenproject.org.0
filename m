Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C990ABD235
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 10:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990529.1374467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIYS-0000md-Qj; Tue, 20 May 2025 08:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990529.1374467; Tue, 20 May 2025 08:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHIYS-0000kf-O4; Tue, 20 May 2025 08:42:32 +0000
Received: by outflank-mailman (input) for mailman id 990529;
 Tue, 20 May 2025 08:42:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHIYR-0000kZ-Ut
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 08:42:31 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf25b03-3556-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 10:42:29 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-601afe51106so3424965a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 01:42:29 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06b105sm691640666b.41.2025.05.20.01.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:42:27 -0700 (PDT)
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
X-Inumbo-ID: 5cf25b03-3556-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747730549; x=1748335349; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z3Z+oWfL+292B6Xbb1J5dGH/c0AKWQSVrX4RanTt8Y=;
        b=HM9tduUezpM8pqgxlZSBoF4TU/96+fpIzXXKwiblFkZiaaIOjmRQLwGOoZkcCNMm5Y
         h7BNLlH3LXioG6P9cPvYe7lVi+RgXUKx+Xf0WomCpsWVN4vEys0mNBuC7+K7SrpiA2QA
         wQPkGg/OtsJIOv/C3ehonLBmRCOvFsMuRo1B+GReCbhMXVsATfErLmQ74WQNvISL/4k2
         3zNzzTybfqYucbMKBL2ITdhWFn7KtVikO75N3ZXJx7h07ii8xzjAluepndnFw5L9KWOc
         0qLGto7ZbKjyLBycjiWuCS+F/ZBG880zVwaP44TGsxMbCvQTne5svUUY2Wk2cHO3snPl
         +weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747730549; x=1748335349;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1z3Z+oWfL+292B6Xbb1J5dGH/c0AKWQSVrX4RanTt8Y=;
        b=VOsjSRV/OHh4EiTFGDcxuASHz8H5MhIKF0CmAXpiuK/6M1Cix34rt9/7WDDUst4O3S
         57wEknvepiDF1PuLZjdZ6Ctjnajxt1WX8UN61gAAq2vbdxgxvfi4SJtNsSqpxsY1zerQ
         uQ6IisZbzOy2M4QhVvTRV7NGPOaHH8/ejt1IDybUbrpyNWBIWrkTHVC5fzAD3KxoSCoY
         /+/ogpdwrpYuXYtmKyvmnckg8mPa7ahdLNZEaurLYl4uf5ctZ2XGRNSRpHIKKgqLOiaM
         9p8cChL83W0IdWvn/72OD56nceSwoLV2CeO6Qpe3bQRvqnQ0cYV0r9rWGYY6lwVpcQA5
         +Wfg==
X-Forwarded-Encrypted: i=1; AJvYcCVD1otbZAoxvVGycrlH367KSqifDOXP6qF90LdFkCBGZUCOyvtyyfG2KbN820sJH2YiyzEMvoSVbt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZcvZp0aqMxKYjbTcNXIqOs4kjEFF+aaGL4fg+4YiJfnEWO8m+
	AIf+BHRAz3Eq81nf171TA7SRdIXDsIwyUGSmA8l1yMTc36VA+dIujtGM
X-Gm-Gg: ASbGncsIIYHMdLXajKmvqtwOLJ/pgLahtMQBlV/X9NUS+8AmhyLdPptTC6EdfQpS1Mc
	WM2IvRqLvtEZgmVLSLY400E2VdF93/D3e8CjQGTRzsqtPv+T8qwn6abhNZhJyZIBznlH91eGt4N
	j47vCEgCjLfgi8kv2hoIFnFCxTmXOhCTZxY0RpuiIaX6BJnYKN9hrecBjRdaARUYLdkt/ht3pur
	PxlXZdmxM/hI8MW++XFOAgiB8kiZ4Ggaf8LZxXUbnxdK5OCQuSF/D45ah5winvpiP1MF9/Cy00S
	KO0pYybn4a2dUbODVCKc9DyzDtLkkszQegMcr0WDdr3PhIKJDn1bVcGknU8O2jh72spPyKB4IUK
	60hD3KdXtOkykTIwngXXWOeaN
X-Google-Smtp-Source: AGHT+IHuI6tKG5odimhDrtFpNi38l+C3Vi8h3DwT2sEJhT+pcKWMMTG9Nf0RTVowkIa1b2U9dnOmHQ==
X-Received: by 2002:a17:907:7b9d:b0:ad5:2378:dd77 with SMTP id a640c23a62f3a-ad52d5badd5mr1122248066b.37.1747730548303;
        Tue, 20 May 2025 01:42:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FjoPGa9d0JBMwoyNl0ftk1Yw"
Message-ID: <b319d38a-45ea-49f8-a6c4-4f8af93e45d1@gmail.com>
Date: Tue, 20 May 2025 10:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] xen/riscv: introduce intc_init() and helpers
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
 <13ce98ce580b6d1a38dcdcd711a6bcf92f4eb0cd.1746530883.git.oleksii.kurochko@gmail.com>
 <6883f364-fc29-4c43-897d-c24207b64b26@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6883f364-fc29-4c43-897d-c24207b64b26@suse.com>

This is a multi-part message in MIME format.
--------------FjoPGa9d0JBMwoyNl0ftk1Yw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 11:29 AM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> Introduce intc_init() to initialize the interrupt controller using the
>> registered hardware ops.
>> Also add intc_route_irq_to_xen() to route IRQs to Xen, with support for
>> setting IRQ type and priority via new internal helpers intc_set_irq_type()
>> and intc_set_irq_priority().
>>
>> Call intc_init() to do basic initialization steps for APLIC and IMSIC.
>>
>> Co-developed-by: Romain Caritey<Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V2:
>>   - This patch was part of "xen/riscv: Introduce intc_hw_operations abstraction"
>>     and splitted to have ability to merge patch "xen/riscv: initialize interrupt
>>     controller" to the current patch (where intc_init() call is actually
>>     introduced).
>>   - Add checks of that callbacks aren't set to NULL in intc_set_irq_priority()
>>     and intc_set_irq_type().
>>   - add num_irqs member to struct intc_info as it is used now in
>>     intc_route_irq_to_xen().
>>   - Add ASSERT(spin_is_locked(&desc->lock)) to intc_set_irq_priority() in
>>     the case this function will be called outside intc_route_irq_to_xen().
>> ---
>>   xen/arch/riscv/include/asm/intc.h |  4 +++
>>   xen/arch/riscv/intc.c             | 45 +++++++++++++++++++++++++++++++
>>   xen/arch/riscv/setup.c            |  2 ++
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
>> index 2d55d74a2e..45a41147a6 100644
>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -44,4 +44,8 @@ void intc_preinit(void);
>>   
>>   void register_intc_ops(struct intc_hw_operations *ops);
>>   
>> +void intc_init(void);
>> +
>> +void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
>> +
>>   #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
>> diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
>> index 122e7b32b5..15f358601d 100644
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -1,9 +1,12 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>>   #include <xen/acpi.h>
>> +#include <xen/bug.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/init.h>
>> +#include <xen/irq.h>
>>   #include <xen/lib.h>
>> +#include <xen/spinlock.h>
>>   
>>   #include <asm/intc.h>
>>   
>> @@ -21,3 +24,45 @@ void __init intc_preinit(void)
>>       else
>>           panic("ACPI interrupt controller preinit() isn't implemented\n");
>>   }
>> +
>> +void __init intc_init(void)
>> +{
>> +    ASSERT(intc_hw_ops);
> What's the goal of this check (also elsewhere below)? You'll crash anyway ...

Agree, that it could be dropped.

The goal was that it will a little bit easier to find a place where NULL
pointer de-reference  will/could happen.

Then it make sense to drop ASSERT(intc_hw_ops) in intc_set_irq_type() and
intc_set_irq_priority() as intc_init() will be called first and so if it
won't crash, then intc_hw_ops is registered.

>
>> +    if ( intc_hw_ops->init() )
> ... here if the point is still NULL, just like you will if the function
> pointer is unpopulated (and hence NULL).

Here, I think it would be better to rewrite to:
   void __init intc_init(void)
   {
       if ( !intc_hw_ops->init )
           return;

       if ( intc_hw_ops->init() )
           panic("Failed to initialize the interrupt controller drivers\n");
   }
For the case, if an interrupt controller doesn't want to do some initialization.
(but I am not sure if it makes sense, likely an interrupt controller will want
to do some initialization. Then it makes do drop the first if (...)).

>
> Preferably with all of these (but not the other assertions) dropped
> Acked-by: Jan Beulich<jbeulich@suse.com>

Thanks.

~ Oleksii



--------------FjoPGa9d0JBMwoyNl0ftk1Yw
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
    <div class="moz-cite-prefix">On 5/15/25 11:29 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6883f364-fc29-4c43-897d-c24207b64b26@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce intc_init() to initialize the interrupt controller using the
registered hardware ops.
Also add intc_route_irq_to_xen() to route IRQs to Xen, with support for
setting IRQ type and priority via new internal helpers intc_set_irq_type()
and intc_set_irq_priority().

Call intc_init() to do basic initialization steps for APLIC and IMSIC.

Co-developed-by: Romain Caritey <a class="moz-txt-link-rfc2396E" href="mailto:Romain.Caritey@microchip.com">&lt;Romain.Caritey@microchip.com&gt;</a>
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V2:
 - This patch was part of "xen/riscv: Introduce intc_hw_operations abstraction"
   and splitted to have ability to merge patch "xen/riscv: initialize interrupt
   controller" to the current patch (where intc_init() call is actually
   introduced).
 - Add checks of that callbacks aren't set to NULL in intc_set_irq_priority()
   and intc_set_irq_type().
 - add num_irqs member to struct intc_info as it is used now in
   intc_route_irq_to_xen().
 - Add ASSERT(spin_is_locked(&amp;desc-&gt;lock)) to intc_set_irq_priority() in
   the case this function will be called outside intc_route_irq_to_xen().
---
 xen/arch/riscv/include/asm/intc.h |  4 +++
 xen/arch/riscv/intc.c             | 45 +++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c            |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 2d55d74a2e..45a41147a6 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -44,4 +44,8 @@ void intc_preinit(void);
 
 void register_intc_ops(struct intc_hw_operations *ops);
 
+void intc_init(void);
+
+void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 122e7b32b5..15f358601d 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -1,9 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include &lt;xen/acpi.h&gt;
+#include &lt;xen/bug.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/init.h&gt;
+#include &lt;xen/irq.h&gt;
 #include &lt;xen/lib.h&gt;
+#include &lt;xen/spinlock.h&gt;
 
 #include &lt;asm/intc.h&gt;
 
@@ -21,3 +24,45 @@ void __init intc_preinit(void)
     else
         panic("ACPI interrupt controller preinit() isn't implemented\n");
 }
+
+void __init intc_init(void)
+{
+    ASSERT(intc_hw_ops);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's the goal of this check (also elsewhere below)? You'll crash anyway ...</pre>
    </blockquote>
    <pre>Agree, that it could be dropped.

The goal was that it will a little bit easier to find a place where NULL
pointer de-reference  will/could happen.

Then it make sense to drop ASSERT(intc_hw_ops) in intc_set_irq_type() and
intc_set_irq_priority() as intc_init() will be called first and so if it
won't crash, then intc_hw_ops is registered.</pre>
    <blockquote type="cite"
      cite="mid:6883f364-fc29-4c43-897d-c24207b64b26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    if ( intc_hw_ops-&gt;init() )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here if the point is still NULL, just like you will if the function
pointer is unpopulated (and hence NULL).</pre>
    </blockquote>
    <pre>Here, I think it would be better to rewrite to:
  void __init intc_init(void)
  {
      if ( !intc_hw_ops-&gt;init )
          return;

      if ( intc_hw_ops-&gt;init() )
          panic("Failed to initialize the interrupt controller drivers\n");
  }
For the case, if an interrupt controller doesn't want to do some initialization.
(but I am not sure if it makes sense, likely an interrupt controller will want
to do some initialization. Then it makes do drop the first if (...)).

</pre>
    <blockquote type="cite"
      cite="mid:6883f364-fc29-4c43-897d-c24207b64b26@suse.com">
      <pre wrap="" class="moz-quote-pre">

Preferably with all of these (but not the other assertions) dropped
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.

~ Oleksii
</pre>
    <pre>


</pre>
  </body>
</html>

--------------FjoPGa9d0JBMwoyNl0ftk1Yw--

