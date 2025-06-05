Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A5ACECA7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 11:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006438.1385610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6f4-0004QU-Gy; Thu, 05 Jun 2025 09:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006438.1385610; Thu, 05 Jun 2025 09:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN6f4-0004Ne-Cr; Thu, 05 Jun 2025 09:13:22 +0000
Received: by outflank-mailman (input) for mailman id 1006438;
 Thu, 05 Jun 2025 09:13:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uN6f3-0004NY-3S
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 09:13:21 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 520e0146-41ed-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 11:13:19 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60702d77c60so1314469a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 02:13:18 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c5c8easm10102651a12.28.2025.06.05.02.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 02:13:17 -0700 (PDT)
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
X-Inumbo-ID: 520e0146-41ed-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749114798; x=1749719598; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0JsC959qErSI4wDcs8b8YtgEgnmGFYLnc2hyiCZdsA=;
        b=IhNMD32qAdH4KRFgCzNRbo4OI46f8YDTcuHSeR7syLWFBW3RB1Wi3pssaZ0V0WNUzx
         s4M++g47pc96TJcCDFY3myX9cEaKjDo71MEFrcaT969u/A/kKR4JvJqpH/vo/gjepSyd
         esy57AquEbD/t6eqibK24fDxETIhw0hTGw61Ge6BIi7ZykPdhgp3aE5Rbr2Ekxfky6He
         9+cwKJac/VWCIg4DvmvwYAdx5HNdYSEPVKHS3+XZoqdXC/oSzvNZBRw03361M6Tn7KB6
         aL3sw6bmrMA64W6lnFO/GGC7T4XogtTueCs6tMkYMHNziRW7MglEqUVMKyphNaYnAIYK
         pKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749114798; x=1749719598;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0JsC959qErSI4wDcs8b8YtgEgnmGFYLnc2hyiCZdsA=;
        b=Fe2TNFkBlLeE0QWH0ksz1+a7/6aiLUTLt+GJ21ELn7BB7GL4NOckdneey4gLhI5dwh
         M73JXFf16Z0AQj9+nmgm/D9fnTzDazunF2e4SPBr6PGTbJQR3Hi8h9NT4SMQLvEiMTUw
         JL8MmWKVikQw0mVujVBRSP11vTgMnq9ZTbXTUWLuFbnCe4t+YNy1TfWcvKftLcUu7YJS
         +GbR37XSYE8R2+akqTpzhoyHooSrqtTV4GQ9UJXVaXqxkqBILyIATESjlZl44p9n+OlT
         7V5P61dix9fEFm2fDLA905DV4bX5DPGtcSAsk6xvBwwHn8CndGkDWvOr9tQwBL4imCKw
         UxcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpAiFZz9gTmlw+r+9bDOj0UalRg+Ib6H7WlRX7HGIsOBC+y9phjGvhDtV8RyC2aabs+n0S4EnwmzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVWp0UbZ8l+et8KI+1tc6jOwfy0RNVWgLi9Y/do++hss8lsZwA
	c7vUK7kgTBs83FBkUEFSaa07cU1qdGH9fVPzHEofPIXrqAw5A/4eDb8/
X-Gm-Gg: ASbGnctYIfsH78h2EWi9ZjHnD5nFpSAxm7fr4hZ2W6xFXL87W7ds8YIOr77XZtObIJb
	ter1pzNOTJsdvrN12WuOloU6rX8WH9y6FKpIR8BSf4JA7K0g5kb8jXSTqtoK9z0Ph1FcEEc8ODE
	hP3hxL5Yy+Z9YtuNkAUUBrkhxvQwEVF2WX7Wg6nrYP+kJ8j6B+8MC2WcJpxF1nRDE79Nj/EXFqH
	coRUZpmUxN2aQrkpE4RBHQGGYF+yHqIyQ6eAor0sPR3HTv2/TjEalMaId8U1VBQGYCxrChxUy9s
	zGSySaJJcoDDS8dMgirUR+C61qI+VcbwB10LKq+sYfRaWx6F9BzLsGJYmBnviFuNkrbTX7iHHbb
	bODbbn/ozxMUhN4Flp2UwUEZ5
X-Google-Smtp-Source: AGHT+IE/JFllc5i0iaaMnM1o1AmiGbqBYC6ZsnAY93zRY19Ooz90SQVRVgT0y7RsAhfk5XXqnBV07g==
X-Received: by 2002:a05:6402:3514:b0:601:f4ff:c637 with SMTP id 4fb4d7f45d1cf-606f0b895famr5756336a12.16.1749114798101;
        Thu, 05 Jun 2025 02:13:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Z6QGQIlZd28t5WlLlbobd876"
Message-ID: <e5434c6d-599c-4b7b-b67a-43ae7830eb0c@gmail.com>
Date: Thu, 5 Jun 2025 11:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <421dad1bbd014a2d7ff588af088eadbd56345dbe.1747843009.git.oleksii.kurochko@gmail.com>
 <ec429b9d-7e16-4d9a-86c6-a5fa557047b7@suse.com>
 <d7ef87e5-75e0-4cf3-be8c-7af6e18df5a3@gmail.com>
 <8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com>
 <d3dd9f90-4bef-4f75-b36c-0a5834a5a0ae@gmail.com>
 <f0166994-be40-4210-b110-554d46535c85@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f0166994-be40-4210-b110-554d46535c85@suse.com>

This is a multi-part message in MIME format.
--------------Z6QGQIlZd28t5WlLlbobd876
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/5/25 8:50 AM, Jan Beulich wrote:
> On 04.06.2025 17:36, Oleksii Kurochko wrote:
>> On 6/2/25 12:21 PM, Jan Beulich wrote:
>>> On 26.05.2025 20:44, Oleksii Kurochko wrote:
>>>> On 5/22/25 4:46 PM, Jan Beulich wrote:
>>>>> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>>>>>> +    /* Check MMIO register sets */
>>>>>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>>>>>> +    {
>>>>>> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
>>>>>> +        {
>>>>>> +            rc = -ENOMEM;
>>>>>> +            goto imsic_init_err;
>>>>>> +        }
>>>>>> +
>>>>>> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
>>>>>> +                                   &imsic_cfg.mmios[i].size);
>>>>>> +        if ( rc )
>>>>>> +        {
>>>>>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>>>>>> +                   node->name, i);
>>>>>> +            goto imsic_init_err;
>>>>>> +        }
>>>>>> +
>>>>>> +        base_addr = imsic_cfg.mmios[i].base_addr;
>>>>>> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>>>>>> +                           imsic_cfg.hart_index_bits +
>>>>>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>>>>>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>>>>>> +                       imsic_cfg.group_index_shift);
>>>>>> +        if ( base_addr != imsic_cfg.base_addr )
>>>>>> +        {
>>>>>> +            rc = -EINVAL;
>>>>>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>>>>>> +                   node->name, i);
>>>>>> +            goto imsic_init_err;
>>>>>> +        }
>>>>> Maybe just for my own understanding: There's no similar check for the
>>>>> sizes to match / be consistent wanted / needed?
>>>> If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
>>>> provide, IMO.
>>>> So I don't what is possible range for imsic_cfg.mmios[i].size.
>>> Well, all I can say is that's it feels odd that you sanity check base_addr
>>> but permit effectively any size.
>> Okay, I think I have two ideas how to check the size:
>> 1. Based on guest bits from IMSIC's DT node. QEMU calculates a size as:
>>       for (socket = 0; socket < socket_count; socket++) {
>>           imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
>>           imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
>>                        s->soc[socket].num_harts;
>>       ...
>>      where:
>>        #define IMSIC_MMIO_PAGE_SHIFT          12
>>        #define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
>>        
>>        #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
>>                (1U << (__guest_bits))
>>        #define IMSIC_HART_SIZE(__guest_bits)                 \
>>                (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
>>
>> 2. Just take a theoretical maximum for S-mode IMSIC's node:
>>       16,384 * 64 1(S-mode interrupt file) + 63(max guest interrupt files)) * 4 KiB
>>      Where,
>>        16,384 - maximum possible amount of harts according to AIA spec
>>        64 - a maximum amount of possible interrupt file for S-mode IMSIC node:
>>             1 - S interupt file + 63 guest interrupt files.
>>        4 Kib - a maximum size of one interrupt file.
>>
>> Which option is preferred?
> I would have said 2, if your outline used "actual" rather than "maximum" values.

In option 2 maximum possible values are used. If we want to use "actual" values then
the option 1 should be used. At the moment, I did in the following way that S-mode
IMSIC node, at least, should contain 1 S-mode interrupt file + an amount of guest
interrupts files (based on imsic_cfg.guest_index_bits):

+#define IMSIC_HART_SIZE(guest_bits_) (BIT(guest_bits_, U) * IMSIC_MMIO_PAGE_SZ)
+
  #define IMSIC_DISABLE_EIDELIVERY    0
  #define IMSIC_ENABLE_EIDELIVERY     1
  #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -359,6 +356,10 @@ int __init imsic_init(const struct dt_device_node *node)
      /* Check MMIO register sets */
      for ( unsigned int i = 0; i < nr_mmios; i++ )
      {
+        unsigned int guest_bits = imsic_cfg.guest_index_bits;
+        unsigned long expected_size =
+            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
+
          rc = dt_device_get_address(node, i, &mmios[i].base_addr,
                                     &mmios[i].size);
          if ( rc )
@@ -369,7 +370,7 @@ int __init imsic_init(const struct dt_device_node *node)
          }
  
          base_addr = mmios[i].base_addr;
-        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
+        base_addr &= ~(BIT(guest_bits +
                             imsic_cfg.hart_index_bits +
                             IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
          base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
@@ -381,6 +382,14 @@ int __init imsic_init(const struct dt_device_node *node)
                     node->name, i);
              goto imsic_init_err;
          }
+
+        if ( mmios[i].size != expected_size )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, "
+                   "max:%ld\n", node->name, mmios[i].size, max_size);
+            goto imsic_init_err;
+        }
      }

>
>> The specification doesn’t seem to mention (or I couldn’t find) that all platforms
>> must calculate the MMIO size in the same way QEMU does. Therefore, it’s probably
>> better to use the approach described in option 2.
>>
>> On the other hand, I don't think a platform should be considered correct if it
>> provides slightly more than needed but still less than the theoretical maximum.
>>
>>>>>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>>>>>         return pcpu_info[cpuid].hart_id;
>>>>>>     }
>>>>>>     
>>>>>> +static inline unsigned long hartid_to_cpuid(unsigned long hartid)
>>>>>> +{
>>>>>> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
>>>>>> +    {
>>>>>> +        if ( hartid == cpuid_to_hartid(cpuid) )
>>>>>> +            return cpuid;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* hartid isn't valid for some reason */
>>>>>> +    return NR_CPUS;
>>>>>> +}
>>>>> Considering the values being returned, why's the function's return type
>>>>> "unsigned long"?
>>>> mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
>>>> Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
>>>> and MXLEN is 64 for RV64.
>>> Yet the return value here is always constrained by NR_CPUS, isn't it?
>> I am not 100% sure that I get your point,
> NR_CPUS is guaranteed to fit in a unsigned int. Furthermore variables / parameters
> holding Xen-internal CPU numbers also are unsigned int everywhere else.

Okay, then agree, hartid_to_cpuid() should return unsigned int. I'll update correspondingly.

Thanks.

~ Oleksii

>
>> but I put NR_CPUS here because of:
>>     /*
>>      * tp points to one of these per cpu.
>>      *
>>      * hart_id would be valid (no matter which value) if its
>>      * processor_id field is valid (less than NR_CPUS).
>>      */
>>     struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
>>         .processor_id = NR_CPUS,
>>     }};
>>
>> As an option we could use ULONG_MAX. Would it be better?
> No. NR_CPUS is the appropriate value to use here, imo.
>
> Jan
--------------Z6QGQIlZd28t5WlLlbobd876
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
    <div class="moz-cite-prefix">On 6/5/25 8:50 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f0166994-be40-4210-b110-554d46535c85@suse.com">
      <pre wrap="" class="moz-quote-pre">On 04.06.2025 17:36, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 6/2/25 12:21 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 26.05.2025 20:44, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 5/22/25 4:46 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    /* Check MMIO register sets */
+    for ( unsigned int i = 0; i &lt; nr_mmios; i++ )
+    {
+        if ( !alloc_cpumask_var(&amp;imsic_cfg.mmios[i].cpus) )
+        {
+            rc = -ENOMEM;
+            goto imsic_init_err;
+        }
+
+        rc = dt_device_get_address(node, i, &amp;imsic_cfg.mmios[i].base_addr,
+                                   &amp;imsic_cfg.mmios[i].size);
+        if ( rc )
+        {
+            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
+                   node-&gt;name, i);
+            goto imsic_init_err;
+        }
+
+        base_addr = imsic_cfg.mmios[i].base_addr;
+        base_addr &amp;= ~(BIT(imsic_cfg.guest_index_bits +
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
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Maybe just for my own understanding: There's no similar check for the
sizes to match / be consistent wanted / needed?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
provide, IMO.
So I don't what is possible range for imsic_cfg.mmios[i].size.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Well, all I can say is that's it feels odd that you sanity check base_addr
but permit effectively any size.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Okay, I think I have two ideas how to check the size:
1. Based on guest bits from IMSIC's DT node. QEMU calculates a size as:
     for (socket = 0; socket &lt; socket_count; socket++) {
         imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
                      s-&gt;soc[socket].num_harts;
     ...
    where:
      #define IMSIC_MMIO_PAGE_SHIFT          12
      #define IMSIC_MMIO_PAGE_SZ             (1UL &lt;&lt; IMSIC_MMIO_PAGE_SHIFT)
      
      #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
              (1U &lt;&lt; (__guest_bits))
      #define IMSIC_HART_SIZE(__guest_bits)                 \
              (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)

2. Just take a theoretical maximum for S-mode IMSIC's node:
     16,384 * 64 1(S-mode interrupt file) + 63(max guest interrupt files)) * 4 KiB
    Where,
      16,384 - maximum possible amount of harts according to AIA spec
      64 - a maximum amount of possible interrupt file for S-mode IMSIC node:
           1 - S interupt file + 63 guest interrupt files.
      4 Kib - a maximum size of one interrupt file.

Which option is preferred?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I would have said 2, if your outline used "actual" rather than "maximum" values.</pre>
    </blockquote>
    <pre>In option 2 maximum possible values are used. If we want to use "actual" values then
the option 1 should be used. At the moment, I did in the following way that S-mode
IMSIC node, at least, should contain 1 S-mode interrupt file + an amount of guest
interrupts files (based on imsic_cfg.guest_index_bits):

+#define IMSIC_HART_SIZE(guest_bits_) (BIT(guest_bits_, U) * IMSIC_MMIO_PAGE_SZ)
+
 #define IMSIC_DISABLE_EIDELIVERY    0
 #define IMSIC_ENABLE_EIDELIVERY     1
 #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -359,6 +356,10 @@ int __init imsic_init(const struct dt_device_node *node)
     /* Check MMIO register sets */
     for ( unsigned int i = 0; i &lt; nr_mmios; i++ )
     {
+        unsigned int guest_bits = imsic_cfg.guest_index_bits;
+        unsigned long expected_size =
+            IMSIC_HART_SIZE(guest_bits) * nr_parent_irqs;
+
         rc = dt_device_get_address(node, i, &amp;mmios[i].base_addr,
                                    &amp;mmios[i].size);
         if ( rc )
@@ -369,7 +370,7 @@ int __init imsic_init(const struct dt_device_node *node)
         }
 
         base_addr = mmios[i].base_addr;
-        base_addr &amp;= ~(BIT(imsic_cfg.guest_index_bits +
+        base_addr &amp;= ~(BIT(guest_bits +
                            imsic_cfg.hart_index_bits +
                            IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
         base_addr &amp;= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) &lt;&lt;
@@ -381,6 +382,14 @@ int __init imsic_init(const struct dt_device_node *node)
                    node-&gt;name, i);
             goto imsic_init_err;
         }
+
+        if ( mmios[i].size != expected_size )
+        {
+            rc = -EINVAL;
+            printk(XENLOG_ERR "%s: IMSIC MMIO size is incorrect %ld, "
+                   "max:%ld\n", node-&gt;name, mmios[i].size, max_size);
+            goto imsic_init_err;
+        }
     }

</pre>
    <blockquote type="cite"
      cite="mid:f0166994-be40-4210-b110-554d46535c85@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The specification doesn’t seem to mention (or I couldn’t find) that all platforms
must calculate the MMIO size in the same way QEMU does. Therefore, it’s probably
better to use the approach described in option 2.

On the other hand, I don't think a platform should be considered correct if it
provides slightly more than needed but still less than the theoretical maximum.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">@@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
       return pcpu_info[cpuid].hart_id;
   }
   
+static inline unsigned long hartid_to_cpuid(unsigned long hartid)
+{
+    for ( unsigned int cpuid = 0; cpuid &lt; ARRAY_SIZE(pcpu_info); cpuid++ )
+    {
+        if ( hartid == cpuid_to_hartid(cpuid) )
+            return cpuid;
+    }
+
+    /* hartid isn't valid for some reason */
+    return NR_CPUS;
+}
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Considering the values being returned, why's the function's return type
"unsigned long"?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
and MXLEN is 64 for RV64.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yet the return value here is always constrained by NR_CPUS, isn't it?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I am not 100% sure that I get your point,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
NR_CPUS is guaranteed to fit in a unsigned int. Furthermore variables / parameters
holding Xen-internal CPU numbers also are unsigned int everywhere else.</pre>
    </blockquote>
    <pre>Okay, then agree, hartid_to_cpuid() should return unsigned int. I'll update correspondingly.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:f0166994-be40-4210-b110-554d46535c85@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">but I put NR_CPUS here because of:
   /*
    * tp points to one of these per cpu.
    *
    * hart_id would be valid (no matter which value) if its
    * processor_id field is valid (less than NR_CPUS).
    */
   struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
       .processor_id = NR_CPUS,
   }};

As an option we could use ULONG_MAX. Would it be better?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No. NR_CPUS is the appropriate value to use here, imo.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------Z6QGQIlZd28t5WlLlbobd876--

