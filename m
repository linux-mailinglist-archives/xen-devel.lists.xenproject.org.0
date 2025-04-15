Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B593A8A24E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 17:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954106.1348450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4hnW-0007Yh-1P; Tue, 15 Apr 2025 15:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954106.1348450; Tue, 15 Apr 2025 15:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4hnV-0007Vs-Uu; Tue, 15 Apr 2025 15:02:01 +0000
Received: by outflank-mailman (input) for mailman id 954106;
 Tue, 15 Apr 2025 15:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCo=XB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4hnU-0007PI-Mu
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 15:02:00 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9404f8e5-1a0a-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 17:01:58 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5f3f04b5dbcso5069271a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 08:01:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb3574sm1101034766b.23.2025.04.15.08.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 08:01:56 -0700 (PDT)
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
X-Inumbo-ID: 9404f8e5-1a0a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744729318; x=1745334118; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qT4Cmo8FYEdnIC1ac7NfPvr5gtpeYXXpb1UGjt0pIxI=;
        b=CxYQwmw/sYVureb437AkQWCyCdbtkloNEGaaNga46mO/qv6HiovIEiUlBxXDCbPjkU
         ccnvVGud05nNmm9XoScIbrI3iubxyhBz7mxs4mR/MfTCIdY1tBiz2dSylesq1aZbZDXl
         qOrWwAti32nHIy7E8jXdY4Q+m8Q0ZFnaHmcFYGRyTT6uEFSIodaTM7g3JaqfGPbKBgsp
         ZUPdsJKwTPLSHGvC6MegseT5WQT3rxWDV/YUYaofU/IjMskahhaBQAM21XaGAJ2IvNfc
         HCI5fmhrD1iNXSPHOpsl0opVCRXYsZ5sWSTo1VvJjj5sVIsJqXlF98wHyfSTBX/Gcnes
         44Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744729318; x=1745334118;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qT4Cmo8FYEdnIC1ac7NfPvr5gtpeYXXpb1UGjt0pIxI=;
        b=Td7ohmNPUJP8Z8rdxjz6k3Ya9n0HwGEC0L+D91FDxqT4JkCSIbm4c7MJh0IrXiDllj
         UpThjzpEhl+jMrZMCKba/LfBtbLT3hZurt98tQKDd35mPmVs0cw+IECUFvgVfWRbqVEO
         LrSv2H0QW1dTOpYLErtzWZ8XuGyWLk6iFeDcjIxcEmnHLSY9dDHkmshTqJT/NNxD6FG3
         oG8scHiOj1y10B+xfm77ll3b08dgppe08NQVQDp0qovOtS1KBodN0TVbuXnDy5ytrxrw
         RiSQONfnvLAM7YrxMTaXrOWF1QSequb3gUGWf3uuCCC9RY7u7pTt/O0aKBZstxms8LTn
         X5VA==
X-Forwarded-Encrypted: i=1; AJvYcCWeGGAs2mFYiLxtVItCK4YASjsuIuFHnlFtO7bo3Pl9CsQ/rh9a+70IU40CXbSQuj2qx0/gz/kvelU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZp2mkJnpbXDNnE7qEYkkMIk7ebb4qyMc7+C68iEbqeGFf8Jvy
	i/YRR8u1iRKdOpB8ikbEI7nFfFfSUnKE3r8t86SYOnM9JKgwNFfl
X-Gm-Gg: ASbGncvMQtS2AmyCKfvAKVOW1pQ6SzofVj4wZ5+QTdpXboEm20tip5cdSRwi8pJWSLM
	oxoJ5w9NLhgUDWAojXgi5lYA57qHRPw1vqoOXWIWgZfMbZ4g20rVVD4q8tAGOUbOBldkoMsQamQ
	5oUZP80q+nBsVTCOybTuyJvoym70DNvGn+U9g/CPtDgHdB4EBkzBMT9bueg44O22gkbhBbsS/OT
	Yqi56jmJqvPqX4Ggxy1klrQePOwP0+Q3yYn39jZ96rAVgAqpPuHQI0l/XrsMcQMtBKoQLz7fSQP
	VAMeSvKwBBqQOp9ZWuut7lBKk+rvj9VnoAwx3l7Vy4c0j1HMbXenEeHlkS+13sk91LokCkTdMmJ
	B5m9xHxrFMGDFUEeE
X-Google-Smtp-Source: AGHT+IG3veKPCNCudUxnoESo2/qf+tYHYL2c1ukjzeLVPRDiO91RpxK5LsAQhEX/MeYUXtgVIPeGdA==
X-Received: by 2002:a17:906:c105:b0:ac7:ed56:8a34 with SMTP id a640c23a62f3a-acad34996acmr1403669766b.21.1744729317216;
        Tue, 15 Apr 2025 08:01:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------zGvFIHJPCJWGfAGl7HRXCBGk"
Message-ID: <882a6613-fedc-4549-8cb4-3e1fc59757db@gmail.com>
Date: Tue, 15 Apr 2025 17:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/14] xen/riscv: Introduce intc_hw_operations
 abstraction
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
 <139b37478b4ca7e2ec3a04b73f462197227f57fa.1744126720.git.oleksii.kurochko@gmail.com>
 <b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com>

This is a multi-part message in MIME format.
--------------zGvFIHJPCJWGfAGl7HRXCBGk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 6:02 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/intc.h
>> +++ b/xen/arch/riscv/include/asm/intc.h
>> @@ -17,6 +17,29 @@ struct intc_info {
>>       const struct dt_device_node *node;
>>   };
>>   
>> +struct intc_hw_operations {
>> +    /* Hold intc hw information */
>> +    const struct intc_info *info;
>> +    /* Initialize the intc and the boot CPU */
>> +    int (*init)(void);
>> +
>> +    /* hw_irq_controller to enable/disable/eoi host irq */
>> +    hw_irq_controller *host_irq_type;
> Pointer-to-const perhaps?

It could be pointer-to-const. I'll updat

>
>> +    /* Set IRQ type */
>> +    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
>> +    /* Set IRQ priority */
>> +    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
>> +
>> +};
>> +
>>   void intc_preinit(void);
>>   
>> +void intc_init(void);
>> +
>> +void register_intc_ops(const struct intc_hw_operations *ops);
>> +
>> +struct irq_desc;
> If it's needed here at all, it needs to move up, as some of the hook pointers
> already use the type.

It could be dropped, but then we would need to include|<xen/irq.h>|, and I figured
the fewer includes we have, the better.

>
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -1,9 +1,21 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>>   #include <xen/acpi.h>
>> +#include <xen/bug.h>
>>   #include <xen/device_tree.h>
>>   #include <xen/init.h>
>> +#include <xen/irq.h>
>>   #include <xen/lib.h>
>> +#include <xen/spinlock.h>
>> +
>> +#include <asm/intc.h>
>> +
>> +static const struct intc_hw_operations *intc_hw_ops;
> __ro_after_init perhaps?
>
>> +
>> +void register_intc_ops(const struct intc_hw_operations *ops)
> __init perhaps?

For both, yes, it should be __ro_after_init and __init.

>
>> +{
>> +    intc_hw_ops = ops;
>> +}
>>   
>>   void __init intc_preinit(void)
>>   {
>> @@ -12,3 +24,42 @@ void __init intc_preinit(void)
>>       else
>>           panic("ACPI interrupt controller preinit() isn't implemented\n");
>>   }
>> +
>> +void __init intc_init(void)
>> +{
>> +    ASSERT(intc_hw_ops);
>> +
>> +    if ( intc_hw_ops->init() )
>> +        panic("Failed to initialize the interrupt controller drivers\n");
>> +}
>> +
>> +/* desc->irq needs to be disabled before calling this function */
>> +static void intc_set_irq_type(struct irq_desc *desc, unsigned int type)
>> +{
>> +    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +    ASSERT(type != IRQ_TYPE_INVALID);
>> +    ASSERT(intc_hw_ops && intc_hw_ops->set_irq_type);
>> +
>> +    intc_hw_ops->set_irq_type(desc, type);
>> +}
>> +
>> +static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
>> +{
>> +    ASSERT(intc_hw_ops && intc_hw_ops->set_irq_priority);
>> +
>> +    intc_hw_ops->set_irq_priority(desc, priority);
>> +}
>> +
>> +void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>> +{
>> +    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>> +    ASSERT(spin_is_locked(&desc->lock));
>> +    /* Can't route interrupts that don't exist */
>> +    ASSERT(intc_hw_ops && desc->irq < intc_hw_ops->info->nr_irqs);
>> +
>> +    desc->handler = intc_hw_ops->host_irq_type;
>> +
>> +    intc_set_irq_type(desc, desc->arch.type);
>> +    intc_set_irq_priority(desc, priority);
> If these are going to remain the sole callers of the two functions, I'd question
> the need for the separate functions. Some of the assertions done there would then
> actually be redundant.

Likely they will be reused for similar function but for guest to route an interrupt
to a guest. And, perhaps, only intc_set_irq_type() will be re-used outside
intc_route_irq_to_{xen,guest}...

>
> If not, is there a reason intc_set_irq_priority() doesn't have a lock-held check?

Do you mean this one: ASSERT(spin_is_locked(&desc->lock));

...
And it is the reason why intc_set_irq_priority() doesn't have this check as it is checked in the
caller.

But I think just to be on a safe side, it could be better to add this check to
intc_set_irq_priority().

~ Oleksii

--------------zGvFIHJPCJWGfAGl7HRXCBGk
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
    <div class="moz-cite-prefix">On 4/10/25 6:02 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -17,6 +17,29 @@ struct intc_info {
     const struct dt_device_node *node;
 };
 
+struct intc_hw_operations {
+    /* Hold intc hw information */
+    const struct intc_info *info;
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+
+    /* hw_irq_controller to enable/disable/eoi host irq */
+    hw_irq_controller *host_irq_type;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Pointer-to-const perhaps?</pre>
    </blockquote>
    <pre>It could be pointer-to-const. I'll updat
</pre>
    <blockquote type="cite"
      cite="mid:b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* Set IRQ type */
+    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
+    /* Set IRQ priority */
+    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
+
+};
+
 void intc_preinit(void);
 
+void intc_init(void);
+
+void register_intc_ops(const struct intc_hw_operations *ops);
+
+struct irq_desc;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If it's needed here at all, it needs to move up, as some of the hook pointers
already use the type.</pre>
    </blockquote>
    <pre>It could be dropped, but then we would need to include <code
    data-start="109" data-end="122">&lt;xen/irq.h&gt;</code>, and I figured
the fewer includes we have, the better.

</pre>
    <blockquote type="cite"
      cite="mid:b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -1,9 +1,21 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include &lt;xen/acpi.h&gt;
+#include &lt;xen/bug.h&gt;
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/init.h&gt;
+#include &lt;xen/irq.h&gt;
 #include &lt;xen/lib.h&gt;
+#include &lt;xen/spinlock.h&gt;
+
+#include &lt;asm/intc.h&gt;
+
+static const struct intc_hw_operations *intc_hw_ops;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
__ro_after_init perhaps?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+void register_intc_ops(const struct intc_hw_operations *ops)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
__init perhaps?</pre>
    </blockquote>
    <pre>For both, yes, it should be __ro_after_init and __init. 
</pre>
    <blockquote type="cite"
      cite="mid:b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    intc_hw_ops = ops;
+}
 
 void __init intc_preinit(void)
 {
@@ -12,3 +24,42 @@ void __init intc_preinit(void)
     else
         panic("ACPI interrupt controller preinit() isn't implemented\n");
 }
+
+void __init intc_init(void)
+{
+    ASSERT(intc_hw_ops);
+
+    if ( intc_hw_ops-&gt;init() )
+        panic("Failed to initialize the interrupt controller drivers\n");
+}
+
+/* desc-&gt;irq needs to be disabled before calling this function */
+static void intc_set_irq_type(struct irq_desc *desc, unsigned int type)
+{
+    ASSERT(test_bit(_IRQ_DISABLED, &amp;desc-&gt;status));
+    ASSERT(spin_is_locked(&amp;desc-&gt;lock));
+    ASSERT(type != IRQ_TYPE_INVALID);
+    ASSERT(intc_hw_ops &amp;&amp; intc_hw_ops-&gt;set_irq_type);
+
+    intc_hw_ops-&gt;set_irq_type(desc, type);
+}
+
+static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
+{
+    ASSERT(intc_hw_ops &amp;&amp; intc_hw_ops-&gt;set_irq_priority);
+
+    intc_hw_ops-&gt;set_irq_priority(desc, priority);
+}
+
+void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
+{
+    ASSERT(test_bit(_IRQ_DISABLED, &amp;desc-&gt;status));
+    ASSERT(spin_is_locked(&amp;desc-&gt;lock));
+    /* Can't route interrupts that don't exist */
+    ASSERT(intc_hw_ops &amp;&amp; desc-&gt;irq &lt; intc_hw_ops-&gt;info-&gt;nr_irqs);
+
+    desc-&gt;handler = intc_hw_ops-&gt;host_irq_type;
+
+    intc_set_irq_type(desc, desc-&gt;arch.type);
+    intc_set_irq_priority(desc, priority);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If these are going to remain the sole callers of the two functions, I'd question
the need for the separate functions. Some of the assertions done there would then
actually be redundant.</pre>
    </blockquote>
    <pre>Likely they will be reused for similar function but for guest to route an interrupt
to a guest. And, perhaps, only intc_set_irq_type() will be re-used outside
intc_route_irq_to_{xen,guest}...</pre>
    <blockquote type="cite"
      cite="mid:b799c1f9-16ff-4af1-8b57-6e5360f10c47@suse.com">
      <pre wrap="" class="moz-quote-pre">

If not, is there a reason intc_set_irq_priority() doesn't have a lock-held check?</pre>
    </blockquote>
    <pre>Do you mean this one: ASSERT(spin_is_locked(&amp;desc-&gt;lock));

...
And it is the reason why intc_set_irq_priority() doesn't have this check as it is checked in the
caller.

But I think just to be on a safe side, it could be better to add this check to 
intc_set_irq_priority().

~ Oleksii
</pre>
  </body>
</html>

--------------zGvFIHJPCJWGfAGl7HRXCBGk--

