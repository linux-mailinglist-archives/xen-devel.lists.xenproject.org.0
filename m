Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065DFABDB01
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990769.1374689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNa2-0000hE-37; Tue, 20 May 2025 14:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990769.1374689; Tue, 20 May 2025 14:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNa1-0000e7-Vz; Tue, 20 May 2025 14:04:29 +0000
Received: by outflank-mailman (input) for mailman id 990769;
 Tue, 20 May 2025 14:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHNa0-0000e1-Je
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:04:28 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56d9301f-3583-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:04:26 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-601ab204085so4829967a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:04:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d047bd6sm726813666b.29.2025.05.20.07.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:04:25 -0700 (PDT)
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
X-Inumbo-ID: 56d9301f-3583-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747749866; x=1748354666; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jhLnWq6+SD0fIXj0uBlSfxealwulhmHQoFPgTCb9hY=;
        b=M8p3pQEnrOlcEhwmdR5CByNlvraLRIq+b5f6i4lRX6w5wJ5xNRfhrlR5EFvFiV+ylY
         QcFUUwhpanFJEn0Fsj3mjPe74fyh1LlYjPG+wsvJlazX1eH2NiYEZbihJMGfEfVIqf74
         xgCwoCYJBKam8JXWnbFJagfkO3Z9+bD4yN4YnBsUtYuPSeR+hvkP/pLJmT20uBDV8na0
         nFMGo+l67Y1sEgqZJwCcn5MCQgydZAtGt1QGW8rDAa5bi/KaGGuj9F5YKDRPbKuTYWq8
         5eWu53cizKQZWCco8z1W/k6HOPzRZNf4qIenl40UAic0BE8B8jTeu9QkMIiInvjBdzR0
         8qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749866; x=1748354666;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2jhLnWq6+SD0fIXj0uBlSfxealwulhmHQoFPgTCb9hY=;
        b=TuJOoziVqCBi2KtBKFuWFOlHU1Lw6aDQtDIJMAnTYDGdU+a7QXA92RgUaC4IZVkRw0
         2P0qnCbT3zM+Yg+XVZ+X2o9GCXhNZ0CYcJ9fY8v8+fsTYDkav8o20U5lUqWzINxrN3iq
         Cs7UNgmXQPzmTOTd8c09pdDrt29H7YIBnCkCG6bcfXmcWPL5IiFQwdCAo8ueX4f3knhp
         mRhhLGXVNbmki072+G+MbUHbu/AILSQuQGnY/JzmJLU4kTzivxa3r7IkhgYCYrsLORA4
         IuGt7h2TQkOcz0I4qPCRpatvizjsXMRQMtRX+tPHsJuPGxr+H45b08RrJDw/o0E8m+aV
         JTHg==
X-Forwarded-Encrypted: i=1; AJvYcCXhJp7aN2TK+rEXDmDXrOY4DpY5UyF7elbwNRk7GkGc/U6PTpm9gR6kgW/6hH9L3WR46YbgVPpnUGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIqOIWAvC2w4Bmppcl0pZ5qmji3w+mBM5GXpJ4TDITkoSBb4OM
	tpHzgICdTVuatENSS6XOzXPxLGlP5WRaWy0/hMH/HOVotXX7zCN/dRoA
X-Gm-Gg: ASbGncviJtBtm8UNwsIBw/9RzIK3fbEKkFWa+Xlu/vjIjdu4c2vKYNb2isE9n/tkqYl
	N/DrLSLZVC02JdgouG6peq6kOQ4oXy+tdL0kkI4baDlPTGVb1xIEu0TYeibJp0aDrfnxi79gqzJ
	InXpQTRQi42TrStMX1+GOIMH0Usk/JxjPulWY0DZEmdsd8sLt0oDkMppPJr3Agdl+Tt7HWOS4Xq
	svlojhkVDaCZQRo0kz1KaADamM33MmUC9KadxQ7tE5EDI3RQVVoFErFxDMLYyZ+Bssl3yO8e2+U
	PdoZ1HhdoV7pOyrpxpOkDPtiTpsvJMVZEHTEkRBdY1LQXH+8Htm4Xp3hq2B3l6e4kKmlxbx06Se
	f6rRd3gBhHCut96IHPjeubUj3
X-Google-Smtp-Source: AGHT+IF0iI0yEvpM4qJkk/C6GlAf8uXZs9WnuaIZt/MM942zAjTbeBQNh9BjXOypAH54k21p0/9wqg==
X-Received: by 2002:a17:907:1c22:b0:ac7:81b0:62c9 with SMTP id a640c23a62f3a-ad52fa5a6bamr1369528866b.20.1747749865353;
        Tue, 20 May 2025 07:04:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------89cKEydznd090tHdpRJslNA1"
Message-ID: <35f6a84a-7dbf-410a-9634-a6edec1b2717@gmail.com>
Date: Tue, 20 May 2025 16:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce register_intc_ops() and
 intc_hw_ops.
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
 <7cd7d3780bb6db45b92c971ff8bcf2634570431f.1746530883.git.oleksii.kurochko@gmail.com>
 <2436be2e-28d4-4e48-a391-84b21651b339@suse.com>
 <9c202b56-ad59-481b-924a-addefcea84cd@gmail.com>
 <0c167d88-798c-46df-a912-60c4252a8e26@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0c167d88-798c-46df-a912-60c4252a8e26@suse.com>

This is a multi-part message in MIME format.
--------------89cKEydznd090tHdpRJslNA1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/25 3:16 PM, Jan Beulich wrote:
> On 19.05.2025 11:16, Oleksii Kurochko wrote:
>> On 5/15/25 10:06 AM, Jan Beulich wrote:
>>> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/intc.h
>>>> +++ b/xen/arch/riscv/include/asm/intc.h
>>>> @@ -8,6 +8,8 @@
>>>>    #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
>>>>    #define ASM__RISCV__INTERRUPT_CONTOLLER_H
>>>>    
>>>> +#include <xen/irq.h>
>>> If you need this include anyway, why ...
>>>
>>>> @@ -17,6 +19,26 @@ struct intc_info {
>>>>        const struct dt_device_node *node;
>>>>    };
>>>>    
>>>> +struct irq_desc;
>>> ... this "forward" decl for something that's then already fully defined?
>>> I can't, however, spot why xen/irq.h would be needed for anything ...
>> forward decl for irq_desc could be really dropped.
>>
>> Inclusion of xen/irq.h was added because of hw_irq_controller which is defined as:
>>     typedef const struct hw_interrupt_type hw_irq_controller;
>>
>> And I'm not sure how to do forward declaration properly in this case. Just use
>> an explicit definition of hw_irq_controller for host_irq_type member of struct
>> intc_hw_operations seems as not the best one option:
>>     struct hw_interrupt_type;
> This isn't needed for the use below.

Shouldn't I tell the compiler that definition of hw_interrupt_type struct exist
somewhere else?

>
>>     struct intc_hw_operations {
>>         ...
>>         // const hw_irq_controller *host_irq_type;
>>         const struct hw_interrupt_type *host_irq_type;
> It might be that something like this is already done elsewhere in the tree,
> so not really an issue imo if a 2nd instance appeared.

It is really happing for several places in x86 code.

>
>> It seems like the best one option is to do the following:
>>     typedef const struct hw_interrupt_type hw_irq_controller; in asm/intc.h.
>> I will follow it then.
> Misra may dislike this.

Then this is not an option. I will use then the option above.

>
>>>> --- a/xen/arch/riscv/intc.c
>>>> +++ b/xen/arch/riscv/intc.c
>>>> @@ -5,6 +5,15 @@
>>>>    #include <xen/init.h>
>>>>    #include <xen/lib.h>
>>>>    
>>>> +#include <asm/intc.h>
>>>> +
>>>> +static struct __ro_after_init intc_hw_operations *intc_hw_ops;
>>> Nit: Attributes between type and identifier please. Also shouldn't both
>>> this and ...
>>>
>>>> +void __init register_intc_ops(struct intc_hw_operations *ops)
>>> ... the parameter here be pointer-to-const?
>> Then|intc_hw_ops| should also be marked as|const| (with the removal of|__ro_after_init|),
> Why remove the attribute?

My understanding is that if it is marked as 'const' then it automatically mean that it is read-only
always before and after init, so '__ro_after_init' is useless.

>
>> otherwise a compilation error will occur (something like/"assignment discards 'const' qualifier"/).
>>
>> Additionally,|__ro_after_init| should be replaced with|const| for|aplic_ops| in future
>> patches.
> Same question here then.

Just wanted to be in sync. If I have intc_hw_ops marked as const, then the thing which will be used
to set intc_hw_ops wants to be also const.

~ Oleksii

--------------89cKEydznd090tHdpRJslNA1
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
    <div class="moz-cite-prefix">On 5/19/25 3:16 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0c167d88-798c-46df-a912-60c4252a8e26@suse.com">
      <pre wrap="" class="moz-quote-pre">On 19.05.2025 11:16, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 5/15/25 10:06 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,6 +8,8 @@
  #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
  #define ASM__RISCV__INTERRUPT_CONTOLLER_H
  
+#include &lt;xen/irq.h&gt;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">If you need this include anyway, why ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -17,6 +19,26 @@ struct intc_info {
      const struct dt_device_node *node;
  };
  
+struct irq_desc;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... this "forward" decl for something that's then already fully defined?
I can't, however, spot why xen/irq.h would be needed for anything ...
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
forward decl for irq_desc could be really dropped.

Inclusion of xen/irq.h was added because of hw_irq_controller which is defined as:
   typedef const struct hw_interrupt_type hw_irq_controller;

And I'm not sure how to do forward declaration properly in this case. Just use
an explicit definition of hw_irq_controller for host_irq_type member of struct
intc_hw_operations seems as not the best one option:
   struct hw_interrupt_type;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This isn't needed for the use below.</pre>
    </blockquote>
    <pre>Shouldn't I tell the compiler that definition of hw_interrupt_type struct exist
somewhere else?
</pre>
    <blockquote type="cite"
      cite="mid:0c167d88-798c-46df-a912-60c4252a8e26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">   struct intc_hw_operations {
       ...
       // const hw_irq_controller *host_irq_type;
       const struct hw_interrupt_type *host_irq_type;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It might be that something like this is already done elsewhere in the tree,
so not really an issue imo if a 2nd instance appeared.</pre>
    </blockquote>
    <pre>It is really happing for several places in x86 code.
</pre>
    <blockquote type="cite"
      cite="mid:0c167d88-798c-46df-a912-60c4252a8e26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">It seems like the best one option is to do the following:
   typedef const struct hw_interrupt_type hw_irq_controller; in asm/intc.h.
I will follow it then.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Misra may dislike this.</pre>
    </blockquote>
    <pre>Then this is not an option. I will use then the option above.

</pre>
    <blockquote type="cite"
      cite="mid:0c167d88-798c-46df-a912-60c4252a8e26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -5,6 +5,15 @@
  #include &lt;xen/init.h&gt;
  #include &lt;xen/lib.h&gt;
  
+#include &lt;asm/intc.h&gt;
+
+static struct __ro_after_init intc_hw_operations *intc_hw_ops;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Nit: Attributes between type and identifier please. Also shouldn't both
this and ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+void __init register_intc_ops(struct intc_hw_operations *ops)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... the parameter here be pointer-to-const?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Then|intc_hw_ops| should also be marked as|const| (with the removal of|__ro_after_init|),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why remove the attribute?</pre>
    </blockquote>
    <pre>My understanding is that if it is marked as 'const' then it automatically mean that it is read-only
always before and after init, so '__ro_after_init' is useless.
</pre>
    <blockquote type="cite"
      cite="mid:0c167d88-798c-46df-a912-60c4252a8e26@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">otherwise a compilation error will occur (something like/"assignment discards 'const' qualifier"/).

Additionally,|__ro_after_init| should be replaced with|const| for|aplic_ops| in future
patches.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same question here then.</pre>
    </blockquote>
    <pre>Just wanted to be in sync. If I have intc_hw_ops marked as const, then the thing which will be used
to set intc_hw_ops wants to be also const.

~ Oleksii
</pre>
  </body>
</html>

--------------89cKEydznd090tHdpRJslNA1--

