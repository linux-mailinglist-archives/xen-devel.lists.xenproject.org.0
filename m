Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3349A89B8A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953632.1348101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eCT-0005F0-P3; Tue, 15 Apr 2025 11:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953632.1348101; Tue, 15 Apr 2025 11:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4eCT-0005Bu-Ls; Tue, 15 Apr 2025 11:11:33 +0000
Received: by outflank-mailman (input) for mailman id 953632;
 Tue, 15 Apr 2025 11:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCo=XB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4eCS-0004Nl-6b
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:11:32 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 621379b2-19ea-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 13:11:31 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so1256342666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 04:11:31 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccd262sm1082883666b.136.2025.04.15.04.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 04:11:29 -0700 (PDT)
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
X-Inumbo-ID: 621379b2-19ea-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744715490; x=1745320290; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlLkZi8dzBXUJ+OMNFVmRzlev+bJ8+E4B1Co6/3jaLE=;
        b=b6nchOtMS59Y4RxbmEDbLsQiR9bPMtlLcZ/iMkRV6nZeuaQORvEG6AVZd7KXk3iEk7
         khNHr6WTLQNeYdMJYjvtsUrKTeeEVzTL6ZwXT/R+L1SbaeERlo4oTcUgnoU0Q+06mi3a
         fX1Fr4HZJE0piu4QNmwQ4HGc0HQp4m5kZ4W8rxYXAsnvt5qpw46usQUArHfHfBHjcWvh
         xVqHgQAsgosECBqgxsLGxcVSo1vbQhZ/kpJZz728IPZKBUQAd2XnlminlNuygTRAQD1T
         WjKykdE8a2rG03oyTh4O2xvk9cH5OK4xpScqlI8avQCTGzeLKH+HLOuQTBEdMDHunrl5
         NoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715490; x=1745320290;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OlLkZi8dzBXUJ+OMNFVmRzlev+bJ8+E4B1Co6/3jaLE=;
        b=YT1FYshePItZHNutfmRdS5xA1eZWdHRwDz7yLpsaMrwiaEqVFn/uYnHgpPfpMVhxf3
         ds6r1t01MrA3jZFcxCp6GIZnwbCFvNGvxVFkO3txsuPlOQCj0dYXuxPLdgQ9i4CvI1yT
         qwWRGkQ2HPrLaoyeKkuZ2sD+ifFOpgI4SGXmvj/NIf5tM994AAEQEozWmOea142tmh9M
         dc8hgUPus6NeeduV2VisZqsT0hS060GE/6ZJrGaGL8C6U1gu+YByIpm3sXFsXfNL0LCu
         4r8uyf1oxAVWpvAkB/SoJqDzqmhJzfZXnWXmjUXphGmBKxWIY7ZLHuz06k4MiCH6Xua4
         9reg==
X-Forwarded-Encrypted: i=1; AJvYcCVlnCvTXS+PVV5PV3sMe2fDhZRNRLlhq6bzXNxVHdZ38UqKtkaeSmA++tdwkvjLZDgnLKuEcINYg6o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwXKhbzB+ZaZWjWybgyKw55iQuhEzdJz9yAedvlGQ29RZZmPBC
	W8Q0Vp1DiYORHcL78v87J8nqzDLeJCyLf1dgcAPyk9bbsUnEDnEq
X-Gm-Gg: ASbGncutrOJnr/6PaZxmpZ5v6GTAt2solnEYQ0/ABv/PauARAh8IvqFZkwUV8i0yyrg
	RLiiv7zAwKJR5bLJMhO+LoL0x8+4U3Vu7mgW23KbvSCnCnyBfd+RVrh6JNMPUBDTNfrkFNC5bPO
	efDac8o4XzH8G6vD/15CLBQhVPrOdFBgXCWPBCp2EtDZ0Bp3XyYzzP4DnKYV4E6tw5hLYu6ZKF0
	Qxi/j9m7a3qjjVQgpauQymOHjZhE+W4MoOE/yJ+wXVM19Lwwc6iHae1IOUUtmvLzc6rGZS+/otB
	eIPf1VLrUtiYiybqlhN/WWLgFREGOd79SNQisgFF3RgMRu8UJXWDZzSiEkG0l5JU2O3JKKGlPEg
	/jak5+p/yI/PQbSMo
X-Google-Smtp-Source: AGHT+IFYyu/G/ANLrcBK6FAoYKFn3uaheg0YWlGmj8WUA6ghYS1wxzwpxth3ZPuhNe2b/KsXp8RBJg==
X-Received: by 2002:a17:907:8688:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acb166c9e62mr278353266b.15.1744715490072;
        Tue, 15 Apr 2025 04:11:30 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------WT7fz8BB3YdWm7JzDmyQtgpB"
Message-ID: <16139d54-fc6f-4ecb-9b3e-ea1e110a1f0d@gmail.com>
Date: Tue, 15 Apr 2025 13:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/14] xen/riscv: introduce platform_get_irq()
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
 <6c6e7482cc3b0332f5724c80bf16931fe2d793ae.1744126720.git.oleksii.kurochko@gmail.com>
 <31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com>

This is a multi-part message in MIME format.
--------------WT7fz8BB3YdWm7JzDmyQtgpB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 5:35 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> @@ -21,6 +22,22 @@ static struct intc_info __ro_after_init aplic_info = {
>>       .hw_version = INTC_APLIC,
>>   };
>>   
>> +static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
> As you start adding functions calling indirectly, please consider adding cf_check
> right away, even if right now this has no effect on RISC-V. That'll save you from
> going through the entire RISC-V subtree later on to find them all.

Sure. I thought that it is a feature for x86 as I haven't seen such attribute for
Arm and RISC-V in GCC manuals.

>
>> +                           unsigned int *out_hwirq,
>> +                           unsigned int *out_type)
>> +{
>> +    if ( intsize < 2 )
>> +        return -EINVAL;
>> +
>> +    /* Mapping 1:1 */
>> +    *out_hwirq = intspec[0];
>> +
>> +    if ( out_type )
>> +        *out_type = intspec[1] & IRQ_TYPE_SENSE_MASK;
>> +
>> +    return 0;
>> +}
>> +
>>   static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>>   {
>>       if ( aplic_info.node )
>> @@ -35,6 +52,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>>   
>>       aplic_info.node = node;
>>   
>> +    dt_irq_xlate = aplic_irq_xlate;
>> +
>>       return 0;
>>   }
>>   
>> --- a/xen/arch/riscv/include/asm/irq.h
>> +++ b/xen/arch/riscv/include/asm/irq.h
>> @@ -47,6 +47,9 @@ static inline void arch_move_irqs(struct vcpu *v)
>>       BUG_ON("unimplemented");
>>   }
>>   
>> +struct dt_device_node;
>> +int platform_get_irq(const struct dt_device_node *device, int index);
> And I assume callers of this will appear later in the series.

Yes, it will be called ns16550_uart_dt_init() when CONFIG_NS16550 will be enabled for RISC-V.

>
>> --- a/xen/arch/riscv/irq.c
>> +++ b/xen/arch/riscv/irq.c
>> @@ -7,11 +7,52 @@
>>    */
>>   
>>   #include <xen/bug.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>>   
>>   static irq_desc_t irq_desc[NR_IRQS];
>>   
>> +static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>> +{
>> +    return (curr == IRQ_TYPE_INVALID || curr == new );
>> +}
>> +
>> +static int irq_set_type(unsigned int irq, unsigned int type)
>> +{
>> +    unsigned long flags;
>> +    struct irq_desc *desc = irq_to_desc(irq);
>> +    int ret = -EBUSY;
>> +
>> +    spin_lock_irqsave(&desc->lock, flags);
>> +
>> +    if ( !irq_validate_new_type(desc->arch.type, type) )
>> +        goto err;
>> +
>> +    desc->arch.type = type;
>> +
>> +    ret = 0;
>> +
>> +err:
> Labels indented by at least one blank please.
>
>> +    spin_unlock_irqrestore(&desc->lock, flags);
>> +
>> +    return ret;
>> +}
>> +
>> +int platform_get_irq(const struct dt_device_node *device, int index)
>> +{
>> +    struct dt_irq dt_irq;
>> +
>> +    if ( dt_device_get_irq(device, index, &dt_irq) )
>> +        return -1;
>> +
>> +    if ( irq_set_type(dt_irq.irq, dt_irq.type) )
>> +        return -1;
> Can you please return proper -E... values, perhaps ones coming back from the
> functions called?

Sure, I will use -EINVAL. (or ,perhaps, it  will be better to introduce ret and
return what dt_device_get_irq()/irq_set_type() returns in the case of failure.

~ Oleksii

--------------WT7fz8BB3YdWm7JzDmyQtgpB
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
    <div class="moz-cite-prefix">On 4/10/25 5:35 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -21,6 +22,22 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
 };
 
+static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As you start adding functions calling indirectly, please consider adding cf_check
right away, even if right now this has no effect on RISC-V. That'll save you from
going through the entire RISC-V subtree later on to find them all.</pre>
    </blockquote>
    <pre>Sure. I thought that it is a feature for x86 as I haven't seen such attribute for
Arm and RISC-V in GCC manuals.

</pre>
    <blockquote type="cite"
      cite="mid:31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+                           unsigned int *out_hwirq,
+                           unsigned int *out_type)
+{
+    if ( intsize &lt; 2 )
+        return -EINVAL;
+
+    /* Mapping 1:1 */
+    *out_hwirq = intspec[0];
+
+    if ( out_type )
+        *out_type = intspec[1] &amp; IRQ_TYPE_SENSE_MASK;
+
+    return 0;
+}
+
 static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 {
     if ( aplic_info.node )
@@ -35,6 +52,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     aplic_info.node = node;
 
+    dt_irq_xlate = aplic_irq_xlate;
+
     return 0;
 }
 
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -47,6 +47,9 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+struct dt_device_node;
+int platform_get_irq(const struct dt_device_node *device, int index);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And I assume callers of this will appear later in the series.</pre>
    </blockquote>
    <pre>Yes, it will be called ns16550_uart_dt_init() when CONFIG_NS16550 will be enabled for RISC-V.

</pre>
    <blockquote type="cite"
      cite="mid:31de00cb-b3b4-4d15-a128-930dc1c7ccdf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -7,11 +7,52 @@
  */
 
 #include &lt;xen/bug.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/irq.h&gt;
 
 static irq_desc_t irq_desc[NR_IRQS];
 
+static bool irq_validate_new_type(unsigned int curr, unsigned int new)
+{
+    return (curr == IRQ_TYPE_INVALID || curr == new );
+}
+
+static int irq_set_type(unsigned int irq, unsigned int type)
+{
+    unsigned long flags;
+    struct irq_desc *desc = irq_to_desc(irq);
+    int ret = -EBUSY;
+
+    spin_lock_irqsave(&amp;desc-&gt;lock, flags);
+
+    if ( !irq_validate_new_type(desc-&gt;arch.type, type) )
+        goto err;
+
+    desc-&gt;arch.type = type;
+
+    ret = 0;
+
+err:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Labels indented by at least one blank please.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    spin_unlock_irqrestore(&amp;desc-&gt;lock, flags);
+
+    return ret;
+}
+
+int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    struct dt_irq dt_irq;
+
+    if ( dt_device_get_irq(device, index, &amp;dt_irq) )
+        return -1;
+
+    if ( irq_set_type(dt_irq.irq, dt_irq.type) )
+        return -1;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can you please return proper -E... values, perhaps ones coming back from the
functions called?</pre>
    </blockquote>
    <pre>Sure, I will use -EINVAL. (or ,perhaps, it  will be better to introduce ret and
return what dt_device_get_irq()/irq_set_type() returns in the case of failure.

</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------WT7fz8BB3YdWm7JzDmyQtgpB--

