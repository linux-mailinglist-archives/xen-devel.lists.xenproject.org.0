Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11DABD6AC
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 13:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990650.1374588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHL5A-0001Po-56; Tue, 20 May 2025 11:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990650.1374588; Tue, 20 May 2025 11:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHL5A-0001Ni-1n; Tue, 20 May 2025 11:24:28 +0000
Received: by outflank-mailman (input) for mailman id 990650;
 Tue, 20 May 2025 11:24:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHL58-0001Nc-BY
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 11:24:26 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8258eb-356c-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 13:24:24 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acacb8743a7so910838966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 04:24:24 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498bdcsm723964166b.145.2025.05.20.04.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 04:24:23 -0700 (PDT)
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
X-Inumbo-ID: fb8258eb-356c-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747740264; x=1748345064; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5WkFV7gQKE7SnY5xtWN/tVTShcjVe3lU294m5RPPUM=;
        b=HMIeVb8Q4T691UL4af02ZUlOGZdb14z9HVHgPPz85ldViC2VFJxXEx6QvvHaoGn3qg
         uDx2GJo9snR0phHf1aVEdTfjs0p4oKCeGRC2lddAgwKs88bN6NR4zDPDAoGlOCF/NNxR
         tZqgNwiZGCrfVj+zGc41gk7TG5jeUTZ2SMkAB7yay8rVQhdujtP4UNlv3DPz9kIgQqNS
         6G6CC8rE9IlUhQlADSo1M6DxcYn/f54Btp9kSvE0Ntti2v74ruCwyZWybmMEyYxPQKep
         8+OyeVseqnnHhC+fx8/U7xQyhjxefrefqYnc9NEdP3dhvxZwLf1pfPdk7PJQe+WncdhU
         2kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747740264; x=1748345064;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p5WkFV7gQKE7SnY5xtWN/tVTShcjVe3lU294m5RPPUM=;
        b=MqPfTxeO7mQsSqWFHlkne/p+galEavcSGftEzAxaKCK4czbFI9nOUnA7+rivuYkSRe
         4XFFQYrkKkvaUg02XIpdkzzuvhBt6XyIOORugd18SB/uLbf77809M3beBpCCaD/wYqnR
         a4WBHFm4nX21A1zmQe4z/UWMmoKUIncaNWMZXZ2Y06UFxgFYiTOjGbYQExzJNFP66I6b
         8toRfGQTg1+Tu9gGmke0GmDnUcEQKrzbb/hDhmMRKuaNvx7GYGje5xS07o+tVSs4ssAc
         9WfUpe9UxBU6Q/dq2gL64pYndsTqr6VAx/GHsRbLz56xIVO/3HnA1fO1F3xURbjFaCGL
         S5Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUi7E79cpsA3qdpn0A9DxoEIu/YBC2UDUQhtG1zJw/o+n+mYZtkOg/Ll98f2y+3Yo2MpUoDaWJA5ZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI+J0dCEWvmCCMoUiFb8JC+W/Ufqc2c+lsVW07n72527HqUGBi
	onq1UdCp5eZdd4WcaPqkKr4fw57umEkHjGZZQQ904iPznvM+h3H2EjeB
X-Gm-Gg: ASbGncsUTeOnxMHqbX2VWOoDO98bJNIkE/+BA7Afd4iVGcGgamZ4bkJPm72lJISM8xh
	is36zPkvofLqw8iEiuVEL6+3qz1/DJp6FisWrFLJywZAwFDm4xbO/PAfZGgMrOD9zsDkQvh47kc
	iPKMSVyv6ci+WL2sx3qVbV7B9bldPbJb7BsXuqwz5CbnCx0CNr4kHAGWtcSY4CCpW4oEeOFZLx6
	kXZLqy9sPIZ2xoYRp5oU7D60SaEcY/qD1241TPtO/3R7C6FJTf6E+oF9vanG/R10GcuotCg+i7/
	FFNoK1Xgt+/5DlZdR40k7Rdk2viLQrBiuE2h3mOuW6rJAhgNVEkX/l0UJrgYFWJMXc2a/wQw6Yu
	/LzllSduinsTFsPZW/D0icp30
X-Google-Smtp-Source: AGHT+IGconidpi61EM1K21vFYjyKCvYVd66AyyQbuAXSHBdRAGYZn8jXqxqjgKCLEq4692a+h1q0aA==
X-Received: by 2002:a17:906:c105:b0:ad5:74cd:1813 with SMTP id a640c23a62f3a-ad574cd1daemr571103666b.9.1747740263280;
        Tue, 20 May 2025 04:24:23 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VxayjQKBwJIkrf4DTCwCgXez"
Message-ID: <14af72c4-56dd-4a50-978c-305de81373cd@gmail.com>
Date: Tue, 20 May 2025 13:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 13/16] xen/riscv: implementation of aplic and imsic
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
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <37d309520a0adb8bb3f4e51a985a2d56b669ba9e.1746530883.git.oleksii.kurochko@gmail.com>
 <bf9f3fb0-91df-4c00-af4b-87b9157e10fe@suse.com>
Content-Language: en-US
In-Reply-To: <bf9f3fb0-91df-4c00-af4b-87b9157e10fe@suse.com>

This is a multi-part message in MIME format.
--------------VxayjQKBwJIkrf4DTCwCgXez
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/15/25 11:44 AM, Jan Beulich wrote:
>> @@ -159,6 +270,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
>>   
>>       dt_irq_xlate = aplic_irq_xlate;
>>   
>> +    spin_lock_init(&aplic.lock);
> Can't you have the struct field have a suitable initializer?

Sure, I will use struct initializer:
   static struct aplic_priv aplic = {
       .lock = SPIN_LOCK_UNLOCKED,
   };

>> +static void imsic_local_eix_update(unsigned long base_id, unsigned long num_id,
>> +                                   bool pend, bool val)
>> +{
>> +    unsigned long id = base_id, last_id = base_id + num_id;
>> +
>> +    while ( id < last_id )
>> +    {
>> +        unsigned long isel, ireg;
>> +        unsigned long start_id = id & (__riscv_xlen - 1);
>> +        unsigned long chunk = __riscv_xlen - start_id;
>> +        unsigned long count = (last_id - id < chunk) ? last_id - id : chunk;
>> +
>> +        isel = id / __riscv_xlen;
>> +        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
>> +        isel += pend ? IMSIC_EIP0 : IMSIC_EIE0;
>> +
>> +        ireg = GENMASK(start_id + count - 1, start_id);
>> +
>> +        id += count;
>> +
>> +        if ( val )
>> +            imsic_csr_set(isel, ireg);
>> +        else
>> +            imsic_csr_clear(isel, ireg);
>> +    }
>> +}
>> +
>> +void imsic_irq_enable(unsigned int irq)
>> +{
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
>> +    /*
>> +     * There is no irq - 1 here (look at aplic_set_irq_type()) because:
>> +     * From the spec:
>> +     *   When an interrupt file supports distinct interrupt identities,
>> +     *   valid identity numbers are between 1 and inclusive. The identity
>> +     *   numbers within this range are said to be implemented by the interrupt
>> +     *   file; numbers outside this range are not implemented. The number zero
>> +     *   is never a valid interrupt identity.
>> +     *   ...
>> +     *   Bit positions in a valid eiek register that don’t correspond to a
>> +     *   supported interrupt identity (such as bit 0 of eie0) are read-only zeros.
>> +     *
>> +     * So in EIx registers interrupt i corresponds to bit i in comparison wiht
>> +     * APLIC's sourcecfg which starts from 0. (l)
> What's this 'l' in parentheses here to indicate?

I don't really remember, it seems like I want to point to the spec, but
then just make a quote from the spec instead. I'll just drop it.

>> +     */
>> +    imsic_local_eix_update(irq, 1, false, true);
>> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
>> +}
>> +
>> +void imsic_irq_disable(unsigned int irq)
>> +{
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&imsic_cfg.lock, flags);
>> +    imsic_local_eix_update(irq, 1, false, false);
>> +    spin_unlock_irqrestore(&imsic_cfg.lock, flags);
>> +}
> The sole caller of the function has doubly turned off IRQs already; perhaps
> no need to it a 3rd time, unless other callers are to appear? Same for
> imsic_irq_enable() as it looks.

I checked a code in private branches and it seems like these functions are called
only in aplic_irq_{enable,disable}(), so we could do, at least,spin_lock(&imsic_cfg.lock)
+ ASSERT(!local_irq_is_enabled());

~ Oleksii


--------------VxayjQKBwJIkrf4DTCwCgXez
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
    <div class="moz-cite-prefix">On 5/15/25 11:44 AM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:bf9f3fb0-91df-4c00-af4b-87b9157e10fe@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -159,6 +270,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     dt_irq_xlate = aplic_irq_xlate;
 
+    spin_lock_init(&amp;aplic.lock);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Can't you have the struct field have a suitable initializer?</pre>
    </blockquote>
    <pre>Sure, I will use struct initializer:
  static struct aplic_priv aplic = {
      .lock = SPIN_LOCK_UNLOCKED,
  };

</pre>
    <blockquote type="cite"
      cite="mid:bf9f3fb0-91df-4c00-af4b-87b9157e10fe@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static void imsic_local_eix_update(unsigned long base_id, unsigned long num_id,
+                                   bool pend, bool val)
+{
+    unsigned long id = base_id, last_id = base_id + num_id;
+
+    while ( id &lt; last_id )
+    {
+        unsigned long isel, ireg;
+        unsigned long start_id = id &amp; (__riscv_xlen - 1);
+        unsigned long chunk = __riscv_xlen - start_id;
+        unsigned long count = (last_id - id &lt; chunk) ? last_id - id : chunk;
+
+        isel = id / __riscv_xlen;
+        isel *= __riscv_xlen / IMSIC_EIPx_BITS;
+        isel += pend ? IMSIC_EIP0 : IMSIC_EIE0;
+
+        ireg = GENMASK(start_id + count - 1, start_id);
+
+        id += count;
+
+        if ( val )
+            imsic_csr_set(isel, ireg);
+        else
+            imsic_csr_clear(isel, ireg);
+    }
+}
+
+void imsic_irq_enable(unsigned int irq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&amp;imsic_cfg.lock, flags);
+    /*
+     * There is no irq - 1 here (look at aplic_set_irq_type()) because:
+     * From the spec:
+     *   When an interrupt file supports distinct interrupt identities,
+     *   valid identity numbers are between 1 and inclusive. The identity
+     *   numbers within this range are said to be implemented by the interrupt
+     *   file; numbers outside this range are not implemented. The number zero
+     *   is never a valid interrupt identity.
+     *   ...
+     *   Bit positions in a valid eiek register that don’t correspond to a
+     *   supported interrupt identity (such as bit 0 of eie0) are read-only zeros.
+     *
+     * So in EIx registers interrupt i corresponds to bit i in comparison wiht
+     * APLIC's sourcecfg which starts from 0. (l)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">What's this 'l' in parentheses here to indicate?</pre>
    </blockquote>
    <pre>I don't really remember, it seems like I want to point to the spec, but
then just make a quote from the spec instead. I'll just drop it.

</pre>
    <blockquote type="cite"
      cite="mid:bf9f3fb0-91df-4c00-af4b-87b9157e10fe@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+     */
+    imsic_local_eix_update(irq, 1, false, true);
+    spin_unlock_irqrestore(&amp;imsic_cfg.lock, flags);
+}
+
+void imsic_irq_disable(unsigned int irq)
+{
+    unsigned long flags;
+
+    spin_lock_irqsave(&amp;imsic_cfg.lock, flags);
+    imsic_local_eix_update(irq, 1, false, false);
+    spin_unlock_irqrestore(&amp;imsic_cfg.lock, flags);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The sole caller of the function has doubly turned off IRQs already; perhaps
no need to it a 3rd time, unless other callers are to appear? Same for
imsic_irq_enable() as it looks.</pre>
    </blockquote>
    <pre>I checked a code in private branches and it seems like these functions are called
only in aplic_irq_{enable,disable}(), so we could do, at least,spin_lock(&amp;imsic_cfg.lock)
+ ASSERT(!local_irq_is_enabled());

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------VxayjQKBwJIkrf4DTCwCgXez--

