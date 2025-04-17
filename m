Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D002A916BF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957141.1350324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kr0-00089y-GJ; Thu, 17 Apr 2025 08:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957141.1350324; Thu, 17 Apr 2025 08:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Kr0-00087Y-Cx; Thu, 17 Apr 2025 08:44:14 +0000
Received: by outflank-mailman (input) for mailman id 957141;
 Thu, 17 Apr 2025 08:44:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5Kqy-00087S-Of
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:44:12 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21aba1df-1b68-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 10:44:10 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac73723b2d5so92173266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 01:44:10 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb63a14c5esm41908866b.19.2025.04.17.01.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 01:44:09 -0700 (PDT)
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
X-Inumbo-ID: 21aba1df-1b68-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879450; x=1745484250; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSCf5C6yBHQ6JzpljdrnIWJC1br63yzLdAa4x42QO3g=;
        b=RpXi6qTAW8VCCiclBIA4WnBCb341bZufDpjUcbG5BBZkfkVcixtWP12EphZzV4+pEs
         QSxs2tr0KV1ogKtuEWoCGilUR9CmyVVccz345lotjZzt95xd4ml4Arqe+qpiJlSkD5v9
         sDzNw3ysfYnFollffdOThNGKhBJJMD1kUmcsa8Q+g25vB4UxhqqpUJDRmjrNgoXepYat
         XF7nTT9HjiO5huITjK5yXUJlW194F5BbpVppSopaP/cYDA3ewb6USzw/M1jFZC4IqHlw
         8JyvyFc2mXVVmquz0KHkTuViVXGPcUwJ91eHQsPRlrGMyfc8Led7deBC0XLW28y7qJlv
         qnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879450; x=1745484250;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSCf5C6yBHQ6JzpljdrnIWJC1br63yzLdAa4x42QO3g=;
        b=j6eywrFd1s0O3CWon+14rCN95++yLmcwwwcJHkSG4J4N8ImCOskW2s/HZ2cSHvkkTT
         WqWAEUdLBbjxfB71paDWZfq/XcWL6VfObnW7mJXE18A3HugsH7wuAOYVrQXsRoc8WaID
         dCqoXu6gZcgShFjDTRQoZV8IfU0sIluYguMFCZqK+t0SELNoZxREzYEGOgHuXdcYW5ay
         p+ytBBej4G5Z3Gq3+sHl2L2ezN4whzVe7ENfZPFV1dBpNVHI+uRPUbP+p6a87wiNtmdo
         ROHpkZaMkjG9oxmG19abmPivYlWpN5/5JuTEXxmP0aael49aBcxUoGTTfA1t/dnqmfSi
         bFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqRIKv90DUjYTdKQs5VPkTLPIW3h21NIhUntKlF4pfRdAJDIvTytpMt4VscFbLlvq6HEe4m/r4Bgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBaxeO5m+PC7FAZB9mdhl/T9PYop4vxF0zatARZQ/uG9jvXbaz
	FzM+2FrHRRWI6Sf4jAe5z4+wFUsW12zuTnFKQ4zfuqlCCIdds/dH
X-Gm-Gg: ASbGncsyMZtG83SY9FQGXNWVR55mjchSzp12JYPDve7iIhV7+encZsW7HjP53NIXCeZ
	eLHAvQH7IxhWOsHXBlbTeC7FgLFZwrZ8hInrWTonpNrlXio8LMX2DyqDTFiOUSjpiPWLgi/kGrI
	8hVR8flHZcD9jqeE0TKpUQu4yW2aaJriHw6icLZz7k9w/zPldA1a5uukz6sMA+PuqO16x4lNhqt
	VrK7jCbtenzwfc5eCY+T8KS0AWxvn6t+0muhYvSO49qlA+WvipafZrUoySTpCWLgFFlga2SyMqZ
	zfgRMvV0XjnwlonmaSTDYi9lJz0sOM8LWoH6XI2SjNQU8B05m8iiwIunwgN2y9rC2EQecrXEMxN
	XBfuCVfRa83/eXZM3BcBsWaYSeg8=
X-Google-Smtp-Source: AGHT+IHFh+XsPp3XOqGos9hbTGnQtwRFCaBwtYJnIiArqYNZqqEOxYcE1JegKJqtrG4uIhu/UGS1+w==
X-Received: by 2002:a17:907:3cc6:b0:ac7:ec90:2ae5 with SMTP id a640c23a62f3a-acb42997607mr504871766b.25.1744879449864;
        Thu, 17 Apr 2025 01:44:09 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------usl0vp40VnL3F7uEimJZ40YX"
Message-ID: <01fa6252-ce42-46e3-becf-ede6961aff14@gmail.com>
Date: Thu, 17 Apr 2025 10:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/14] xen/riscv: add external interrupt handling for
 hypervisor mode
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
 <1685488b8c1b48149e94bd3625c7b46b78c72e8e.1744126720.git.oleksii.kurochko@gmail.com>
 <a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com>

This is a multi-part message in MIME format.
--------------usl0vp40VnL3F7uEimJZ40YX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 4:42 PM, Jan Beulich wrote:
>
>> +    /* clear the pending bit */
>> +    csr_clear(CSR_SIP, 1UL << IRQ_S_EXT);
>> +
>> +    /* dispatch the interrupt */
>> +    do_IRQ(regs, csr_swap(CSR_STOPEI, 0) >> TOPI_IID_SHIFT);
>> +
>> +    /* enable external interrupts */
>> +    csr_set(CSR_SIE, 1UL << IRQ_S_EXT);
>> +}
> Why does "cause" need passing into here? I realize the function is used ...
>
>> @@ -278,6 +293,7 @@ static const struct intc_hw_operations aplic_ops = {
>>       .host_irq_type       = &aplic_host_irq_type,
>>       .set_irq_priority    = aplic_set_irq_priority,
>>       .set_irq_type        = aplic_set_irq_type,
>> +    .handle_interrupt    = aplic_handle_interrupt,
>>   };
> ... as a hook, yet it's still unclear whether (why) any other such hook
> would need the cause to be passed in.

I don't remember a particular reason, but it could have been dropped. If, for some reason,
the cause is needed in|handle_interrupt()|, it can be retrieved explicitly from a register.

>
>> @@ -33,6 +44,20 @@ do {                            \
>>       csr_clear(CSR_SIREG, v);    \
>>   } while (0)
>>   
>> +void imsic_ids_local_delivery(bool enable)
> __init as long as the sole caller is such?

Yes, it make sense. Also, I noticed some other functions that could be __init in imsic.c (but likely
you mentioned that in the previous patches).

>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -51,6 +51,13 @@ static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
>>       intc_hw_ops->set_irq_priority(desc, priority);
>>   }
>>   
>> +void intc_handle_external_irqs(unsigned long cause, struct cpu_user_regs *regs)
>> +{
>> +    ASSERT(intc_hw_ops && intc_hw_ops->handle_interrupt);
> I don't view such checks (on every interrupt) as very useful. If you checked
> once early on - okay. But here you gain nothing at all ...
>
>> +    intc_hw_ops->handle_interrupt(cause, regs);
> ... towards the use here, when considering a release build.

I will try to find a better place then.

>
>
>> @@ -83,3 +87,42 @@ void __init init_IRQ(void)
>>       if ( init_irq_data() < 0 )
>>           panic("initialization of IRQ data failed\n");
>>   }
>> +
>> +/* Dispatch an interrupt */
>> +void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>> +{
>> +    struct irq_desc *desc = irq_to_desc(irq);
>> +    struct irqaction *action;
>> +
>> +    irq_enter();
>> +
>> +    spin_lock(&desc->lock);
>> +    desc->handler->ack(desc);
>> +
>> +    if ( test_bit(_IRQ_DISABLED, &desc->status) )
>> +        goto out;
>> +
>> +    set_bit(_IRQ_INPROGRESS, &desc->status);
> Same comment as on the earlier patch - atomic bitop when in a suitably
> locked region?

Agree, it could be used non-atomic bitop.

>
>> +    action = desc->action;
>> +
>> +    spin_unlock_irq(&desc->lock);
>> +
>> +#ifndef CONFIG_IRQ_HAS_MULTIPLE_ACTION
> Stolen from Arm? What's this about?

Yes, it is stolen from Arm. I thought that it is a generic one, but the config is defined
inside Arm's config.h.
Then it could be dropped now as I don't know, at the moment, the cases when it is neeeded
to exectute several handler for an irq for RISC-V.

Thanks.

~ Oleksii


--------------usl0vp40VnL3F7uEimJZ40YX
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
    <div class="moz-cite-prefix">On 4/15/25 4:42 PM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    /* clear the pending bit */
+    csr_clear(CSR_SIP, 1UL &lt;&lt; IRQ_S_EXT);
+
+    /* dispatch the interrupt */
+    do_IRQ(regs, csr_swap(CSR_STOPEI, 0) &gt;&gt; TOPI_IID_SHIFT);
+
+    /* enable external interrupts */
+    csr_set(CSR_SIE, 1UL &lt;&lt; IRQ_S_EXT);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why does "cause" need passing into here? I realize the function is used ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -278,6 +293,7 @@ static const struct intc_hw_operations aplic_ops = {
     .host_irq_type       = &amp;aplic_host_irq_type,
     .set_irq_priority    = aplic_set_irq_priority,
     .set_irq_type        = aplic_set_irq_type,
+    .handle_interrupt    = aplic_handle_interrupt,
 };
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... as a hook, yet it's still unclear whether (why) any other such hook
would need the cause to be passed in.</pre>
    </blockquote>
    <pre>I don't remember a particular reason, but it could have been dropped. If, for some reason,
the cause is needed in <code data-start="179" data-end="199">handle_interrupt()</code>, it can be retrieved explicitly from a register.</pre>
    <blockquote type="cite"
      cite="mid:a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -33,6 +44,20 @@ do {                            \
     csr_clear(CSR_SIREG, v);    \
 } while (0)
 
+void imsic_ids_local_delivery(bool enable)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
__init as long as the sole caller is such?</pre>
    </blockquote>
    <pre>Yes, it make sense. Also, I noticed some other functions that could be __init in imsic.c (but likely
you mentioned that in the previous patches).</pre>
    <blockquote type="cite"
      cite="mid:a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -51,6 +51,13 @@ static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
     intc_hw_ops-&gt;set_irq_priority(desc, priority);
 }
 
+void intc_handle_external_irqs(unsigned long cause, struct cpu_user_regs *regs)
+{
+    ASSERT(intc_hw_ops &amp;&amp; intc_hw_ops-&gt;handle_interrupt);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't view such checks (on every interrupt) as very useful. If you checked
once early on - okay. But here you gain nothing at all ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    intc_hw_ops-&gt;handle_interrupt(cause, regs);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... towards the use here, when considering a release build.</pre>
    </blockquote>
    <pre>I will try to find a better place then.</pre>
    <blockquote type="cite"
      cite="mid:a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -83,3 +87,42 @@ void __init init_IRQ(void)
     if ( init_irq_data() &lt; 0 )
         panic("initialization of IRQ data failed\n");
 }
+
+/* Dispatch an interrupt */
+void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
+{
+    struct irq_desc *desc = irq_to_desc(irq);
+    struct irqaction *action;
+
+    irq_enter();
+
+    spin_lock(&amp;desc-&gt;lock);
+    desc-&gt;handler-&gt;ack(desc);
+
+    if ( test_bit(_IRQ_DISABLED, &amp;desc-&gt;status) )
+        goto out;
+
+    set_bit(_IRQ_INPROGRESS, &amp;desc-&gt;status);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same comment as on the earlier patch - atomic bitop when in a suitably
locked region?</pre>
    </blockquote>
    <pre>Agree, it could be used non-atomic bitop.

</pre>
    <blockquote type="cite"
      cite="mid:a8a23afe-ae62-4b88-bf53-db2e1ada164d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    action = desc-&gt;action;
+
+    spin_unlock_irq(&amp;desc-&gt;lock);
+
+#ifndef CONFIG_IRQ_HAS_MULTIPLE_ACTION
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Stolen from Arm? What's this about?</pre>
    </blockquote>
    <pre>Yes, it is stolen from Arm. I thought that it is a generic one, but the config is defined
inside Arm's config.h.
Then it could be dropped now as I don't know, at the moment, the cases when it is neeeded
to exectute several handler for an irq for RISC-V.

Thanks.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------usl0vp40VnL3F7uEimJZ40YX--

