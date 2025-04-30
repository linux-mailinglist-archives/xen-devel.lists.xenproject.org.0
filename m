Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B942AA5130
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 18:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973892.1361918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9y2-0007Q8-Q1; Wed, 30 Apr 2025 16:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973892.1361918; Wed, 30 Apr 2025 16:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9y2-0007OR-NB; Wed, 30 Apr 2025 16:07:26 +0000
Received: by outflank-mailman (input) for mailman id 973892;
 Wed, 30 Apr 2025 16:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9NI=XQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uA9y1-0007OL-GV
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 16:07:25 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 337209ba-25dd-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 18:07:23 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1458794466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 09:07:23 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e587093sm939655666b.80.2025.04.30.09.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 09:07:21 -0700 (PDT)
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
X-Inumbo-ID: 337209ba-25dd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746029242; x=1746634042; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+y2n5V3Z+H0u5VklEhgPmR5FEmUnDZm4mEPVzDP2N4=;
        b=FUrvVaZp48P0iZiOqmHGIpZHuNpHsOwG6E+OXceuZkA4qHKPkhFKB934FSP15xyDRl
         d1hLfEywZ//PrwBeWLQrM8oPpYmhkHx7tjJqrX038R5AZk5byO+9YR75iSk2r9I3Ixr7
         MI92j5TTSiF6ZpPuFauLL6ieLSs1mdwpS9wKLgIuY9fi4vpzdO2DhFUQVXB/WOdVDaAo
         Nk54mrcX7XsTuSCoc3Q2MK70av3CA4TyBsGKvL9/rZ0GS2aFOrygDOXuSWC8n+RCn1hS
         k6G6UZFnRdI9EdHKBvhUfbNcNsGQo1J17Ki95hw5FLIb68DUBl4hHt6Y7Arx42zyzxXS
         YurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746029242; x=1746634042;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+y2n5V3Z+H0u5VklEhgPmR5FEmUnDZm4mEPVzDP2N4=;
        b=Be580fgAhVApCqo5rdE5LWqFQ9K4DX/AEAoOWVM3Y20pvRt4+5f2Jvm+v2FU0s/7x1
         8dfbGcfG8qIg1nB7cH4cgO27XoJ2KixczmmdSRRxUfgLAOEonGCeLiiSFMPCB1KwMLWr
         72aZBQW1mZEGSY2iWH3tJVdntNrXJ6Fs2NZG2pCYGWEFoKDUDVAbuOEFqSxM9kC7GWlW
         KsrD4desp0zFQMRDNAwIbzSXA7i/dFE6u8vcUQuIJe7Rt2ZQyByW9OV77V2UJwa9VUP8
         ublnGlz9IxDdfiTjQaG5YZ3bkKAxkjPhhgm95JBPbqLfBRoaB0A59I651G/Beo+WFEAT
         kloA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Y17t023exRnMlyxnyFDntiv+20rIXEgHi0rAItOmPxVr2an0NkYQlh/lg/OjRJvM//8Zsis7zl8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9/1R/Zm3n1FX6NseKCaqjaKjVsblZWJirq8dK0+Cv+QRmtIYt
	Kv2xLRvmyx1OCIlolmtESCXP22YEl8AKcywtDiWMQdIBpoQZ1pYe
X-Gm-Gg: ASbGncsZI5iElm+Q+XMWANVSEAKIMvv+Zal2viZYWlZs1dHJXAH3//gazxs9lvidmUK
	GcvoUNn1Oa81I72+Wm3590HKTCb1UTEVvV7mfwns6I8dKCZHpqMgKC1Atxccc2AFRsPAqM4XO6m
	nadXKzbM3AIU1pGPyiENk5Q2ZAuhJZAsvJgnNucK0bMmUMPcUH+qdcAqSD+Bt87+SPE8yPM7wUx
	/wwikpXyK9n7zMfJvNCKW3KGHDmVsQUeDyWxA/uUVyrkwASrSif6EU22ni6AIfZCsVQ6nU9bq1c
	wLfa6WtO6t5FBUlyBJsNOr/f9LplAWFNAaJyPL/+IrGb3t7yGU48918gJjgUPFDWM5XNJeY+lho
	I3PdbHirzX1IwsSDs+kQPto3wB34=
X-Google-Smtp-Source: AGHT+IE1fp/hZD42M3o1yorc223r4We79UOVvTzzmuN3ZX8SWiN4xI2bAwvPbun6dMZZZ3EQdHEsRw==
X-Received: by 2002:a17:907:1b11:b0:ac3:8988:deda with SMTP id a640c23a62f3a-acedc6f1ab5mr423348266b.40.1746029242189;
        Wed, 30 Apr 2025 09:07:22 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------u0Es0HbyotVznTnlDoZ0oTzb"
Message-ID: <c7ca0d22-42ac-4d52-853c-90247e5402c9@gmail.com>
Date: Wed, 30 Apr 2025 18:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
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
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
 <35075d73-ec3c-4e8f-b7ed-657b604904bd@suse.com>
 <9bee5d4e-cad1-4fc1-8b4c-b4a4bab4b76c@gmail.com>
 <c0bcc9e7-26a6-4a67-8f18-787364b530e4@suse.com>
 <231e9f4e-a044-49b7-b3a5-26ff2f7f9612@gmail.com>
 <d00fca13-617b-4687-9a15-131bba352ea1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d00fca13-617b-4687-9a15-131bba352ea1@suse.com>

This is a multi-part message in MIME format.
--------------u0Es0HbyotVznTnlDoZ0oTzb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/28/25 10:54 AM, Jan Beulich wrote:
>>>>>> +    ASSERT(spin_is_locked(&desc->lock));
>>>>> If this lock (which is an IRQ-safe one) is necessarily held, ...
>>>>>
>>>>>> +    spin_lock_irqsave(&aplic.lock, flags);
>>>>> ... you can use just spin_lock() here.
>>>>>
>>>>>> +    clear_bit(_IRQ_DISABLED, &desc->status);
>>>>> Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
>>>>> question on Arm code also doing so.)
>>>> I haven't thought about that. Likely non-atomic bitop could be used here.
>>> And then - does it need to be a bitop? Aiui that's what Arm uses, while x86
>>> doesn't. And I see no reason to use other than plain C operators here. If
>>> Arm was switched, presumably all the redundant (and misnamed) _IRQ_*
>>> constants could go away, with just the IRQ_* ones left.
>> The reason for a bitop in Arm is explained in this commithttps://gitlab.com/xen-project/xen/-/commit/50d8fe8fcbab2440cfeeb65c4765868398652473
>> but all the places where plain C operators were changed to bitops are actually executed under|spin_lock_irqsave(&desc->lock, flags). By quick look I found only two
>> places one in __setup_irq() but it is called by the functions which do ||spin_lock_irqsave(&desc->lock, flags) and in vgic_v2_fold_lr_state().
>> Maybe, I'm missing something.|
>> |RISC-V won't have something similar to ||vgic_v2_fold_lr_state|(), but __setup_irq() is used in a similar way. It can be added ASSERT(spin_is_lock(&desc->lock))
>> and then it will also safe to use non-bitop function.
>> Probably, it is a little bit safer to use always bitops for desc->status.
>> ||
> I question that. If any accesses outside of locked regions were needed (as the
> description of that commit suggests), then the situation would be different.

Okay, then at the moment there is no such cases and I'll use plain C operator instead of
clear/set_bit().

>
> Btw, you not wrapping lines and you adding strange | instances doesn't help
> readability of your replies.
>
>>>>> I'm uncertain about this bit setting anyway - on x86 we would only fiddle
>>>>> with it for IRQs not in use, not while enabling/disabling one.
>>> What about this part?
>> As I understand, based on Arm, code then Xen enables interrupts corresponding to devices assigned
>> to dom0/domU before booting dom0/domU, resulting in the possibility of receiving an interrupt
>> and not knowing what to do with it. So it is needed for enablement of IRQs when the guest
>> requests it and not unconditionally at boot time.
> I fear I don't understand this. The way we do things on x86 doesn't leave us
> in such a situation.

On Arm, the physical interrupts would be enabled when the interrupt is initially routed and in case guest
is booting with interrupt disabled, it could introduce a problem when guest enabled interrupts it will
already have a pending interrupt for which it isn't ready.

How is it handled the case when a device isn't quiescing at the boot time in x86?

But I just realized the way how interrupts are enabled in RISC-V for guest won't lead to such case. The interrupt
will be enabled only when guest's device driver will request that. So this setting/clearing of IRQ_DISABLED could
be dropped for RISC-V.

~ Oleksii

--------------u0Es0HbyotVznTnlDoZ0oTzb
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
    <div class="moz-cite-prefix">On 4/28/25 10:54 AM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:d00fca13-617b-4687-9a15-131bba352ea1@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    ASSERT(spin_is_locked(&amp;desc-&gt;lock));
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">If this lock (which is an IRQ-safe one) is necessarily held, ...

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    spin_lock_irqsave(&amp;aplic.lock, flags);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">... you can use just spin_lock() here.

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    clear_bit(_IRQ_DISABLED, &amp;desc-&gt;status);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Why an atomic bitop when desc is locked? (And yes, I ought to raise the same
question on Arm code also doing so.)
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I haven't thought about that. Likely non-atomic bitop could be used here.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">And then - does it need to be a bitop? Aiui that's what Arm uses, while x86
doesn't. And I see no reason to use other than plain C operators here. If
Arm was switched, presumably all the redundant (and misnamed) _IRQ_*
constants could go away, with just the IRQ_* ones left.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
The reason for a bitop in Arm is explained in this commithttps://gitlab.com/xen-project/xen/-/commit/50d8fe8fcbab2440cfeeb65c4765868398652473
but all the places where plain C operators were changed to bitops are actually executed under|spin_lock_irqsave(&amp;desc-&gt;lock, flags). By quick look I found only two 
places one in __setup_irq() but it is called by the functions which do ||spin_lock_irqsave(&amp;desc-&gt;lock, flags) and in vgic_v2_fold_lr_state(). 
Maybe, I'm missing something.|
|RISC-V won't have something similar to ||vgic_v2_fold_lr_state|(), but __setup_irq() is used in a similar way. It can be added ASSERT(spin_is_lock(&amp;desc-&gt;lock))
and then it will also safe to use non-bitop function.
Probably, it is a little bit safer to use always bitops for desc-&gt;status.
||
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I question that. If any accesses outside of locked regions were needed (as the
description of that commit suggests), then the situation would be different.</pre>
    </blockquote>
    <pre>Okay, then at the moment there is no such cases and I'll use plain C operator instead of
clear/set_bit().

</pre>
    <blockquote type="cite"
      cite="mid:d00fca13-617b-4687-9a15-131bba352ea1@suse.com">
      <pre wrap="" class="moz-quote-pre">

Btw, you not wrapping lines and you adding strange | instances doesn't help
readability of your replies.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">I'm uncertain about this bit setting anyway - on x86 we would only fiddle
with it for IRQs not in use, not while enabling/disabling one.
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What about this part?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
As I understand, based on Arm, code then Xen enables interrupts corresponding to devices assigned
to dom0/domU before booting dom0/domU, resulting in the possibility of receiving an interrupt
and not knowing what to do with it. So it is needed for enablement of IRQs when the guest
requests it and not unconditionally at boot time.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I fear I don't understand this. The way we do things on x86 doesn't leave us
in such a situation.</pre>
    </blockquote>
    <pre>On Arm, the physical interrupts would be enabled when the interrupt is initially routed and in case guest
is booting with interrupt disabled, it could introduce a problem when guest enabled interrupts it will
already have a pending interrupt for which it isn't ready.

How is it handled the case when a device isn't quiescing at the boot time in x86?

But I just realized the way how interrupts are enabled in RISC-V for guest won't lead to such case. The interrupt
will be enabled only when guest's device driver will request that. So this setting/clearing of IRQ_DISABLED could
be dropped for RISC-V.

~ Oleksii</pre>
  </body>
</html>

--------------u0Es0HbyotVznTnlDoZ0oTzb--

