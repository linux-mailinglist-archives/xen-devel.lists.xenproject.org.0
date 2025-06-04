Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5122ACE196
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005699.1385124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMqA7-0005Et-Us; Wed, 04 Jun 2025 15:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005699.1385124; Wed, 04 Jun 2025 15:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMqA7-0005C3-Ri; Wed, 04 Jun 2025 15:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1005699;
 Wed, 04 Jun 2025 15:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFxl=YT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uMqA6-0005Bx-Bl
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:36:18 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a72e16c6-4159-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 17:36:16 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-606741e8e7cso5928685a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:36:16 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd04579sm1097050366b.87.2025.06.04.08.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 08:36:04 -0700 (PDT)
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
X-Inumbo-ID: a72e16c6-4159-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749051376; x=1749656176; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k19Y/CfWCFtHB6ri66KNehYH7QxHeq9EzOhhmIGU8J8=;
        b=ikIpHYdGYzbTFqHfVWSjBXTDrUEuRUD9K8uMSiMtbqf31AKQO/pj5b/55GWeIH2NMb
         g82TaVG92V61Xx6ShVBEi+Vl18GJpP9mxN8/mK7mvAMxvAu0BSDsrJtHV9ycYHhaamEc
         Ym3vcXg4qgNhWW29Zpx+ZFfkEfXJG+hiNzAUFAY9WpWszStplRfXjuJsOcbuHqxBgmoZ
         aYOwxb1H50Lv5o9FX99epjOdnnB7uEkIV1EnVj6c9t6OzSyj1aCGDyaKmeu1j9v6IgbU
         bnRrycSl8dO2MMKIkM3hbsfD2YhZ4Mltx/NvIJ0ygv/tJfP73PbL609U0nBP/+Cw+LkC
         h86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051376; x=1749656176;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k19Y/CfWCFtHB6ri66KNehYH7QxHeq9EzOhhmIGU8J8=;
        b=CSgTDzmcaRniRxueHEmcmUaTeOOaeKeL9b7krXtD/eUwdUS14FET/CAKSNQ28uMpJu
         ezN2RqdYfe6SOKkSoD5s1C+WOqvoLgyFpJNPQ23MFW8N3Kj9Zxv7Ov6IHluoMe6rHAul
         zkvanK7GMInwweXJomaF29eST7pinK+D0S3hgxYV1iaEhaR7YOH95VyqeV8+gKEsDkyk
         tOMR/Koyr/E/AuuRqpMoDmS7esn34bEwPoGXmuK6EPRaUGlmHGIuhRYQIjAriI1ZiFK/
         NjlvCxYcbYOuugwd4/54nJsoSRYLsEDTyhWKvdZUVAdWxkXpS87SLTh6ruYFti4pH3ZT
         DarA==
X-Forwarded-Encrypted: i=1; AJvYcCWxI1q6pFwPr4Yl1SE0cMk9rKdhnLPybs67voQDkZrfzukO1nF1cgckRq0rvms+dIuIqXGrrL4eBSo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy920UXrmmBD/yjvBhWTHme4QUjrWdsQPplRC37DxSoOEzvIvwH
	8aQsn1EOgnRn8k996J8pTMvWOgCxFfnLFujwHmoAUsSgZzfNdBojlVYNuI5J6A==
X-Gm-Gg: ASbGncunvetIhivHc1XQ7j4wSG4EZY7hPdzYRjMCyfjDOQ2sv602CUiJhxYgK/DklDp
	6bLp4yUaimL/U8AXTI4I+qblS7r3fju2CVhMY+gLCqHXBMskUcAsyjqtIu4j3wjK7wjyIbFNSyS
	NHcYp0vgAcevQOguUOv96iGF5/EPtkXa+JqXIPdWelkTpHLiyPsCpDZfSUPBzuFYtAt7ZmlucjB
	p3qhS4k+bet1mN0DsOBEGsmoD4UTAuAmoY9Ol1pjhVn+nFX4mAtG5PAM+zRwJ1trwYMqR9NvcSq
	Z7iJhNL+vNJ4kMVe81/EenUyhdzEnm0G46Q7xdYwjy8+WuICl32qQvc4n9HZd1qmiQvz7uj0Zce
	4nOL4TbirhPogz1O1ezt8/9rV
X-Google-Smtp-Source: AGHT+IHT+D34Kom9Xk1HHs2qP5yXo6QNtD6elrXwyz5TliNEH01zs/VXJAnVNxc5KbhuEfijLTGaPA==
X-Received: by 2002:a17:907:7fa2:b0:ad8:a50c:f6cb with SMTP id a640c23a62f3a-addf8d5ec0amr292575666b.26.1749051365045;
        Wed, 04 Jun 2025 08:36:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------nj0fHv050wP7zpSJaqbI1jbx"
Message-ID: <d3dd9f90-4bef-4f75-b36c-0a5834a5a0ae@gmail.com>
Date: Wed, 4 Jun 2025 17:36:03 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com>

This is a multi-part message in MIME format.
--------------nj0fHv050wP7zpSJaqbI1jbx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/2/25 12:21 PM, Jan Beulich wrote:
> On 26.05.2025 20:44, Oleksii Kurochko wrote:
>> On 5/22/25 4:46 PM, Jan Beulich wrote:
>>> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>>>> +    /* Allocate MMIO resource array */
>>>> +    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
>>> How large can this and ...
>>>
>>>> +    if ( !imsic_cfg.mmios )
>>>> +    {
>>>> +        rc = -ENOMEM;
>>>> +        goto imsic_init_err;
>>>> +    }
>>>> +
>>>> +    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
>>> ... this array grow (in principle)?
>> Roughly speaking, this is the number of processors. The highests amount of processors
>> on the market I saw it was 32. But it was over a year ago when I last checked this.
> Unless there's an architectural limit, I don't think it's a good idea to
> take as reference what's available at present. But yes, ...

This (32) is not an architectural limit.
I assume that if mhartd id accepts a range from 0 to  2^64-1 for RV64 then I assume
that the *theoretical* limit for amount of cpus is  2^64-1. And in RISC-V spec. I can't
find if it is theoretical limit or not.
But if look into AIA (interrupt controller) specification then it tells explicitly that limit
is 16,384:
   1.2 Limits
   In its current version, the RISC-V Advanced Interrupt Architecture can support RISC-V symmet-ric
   multiprocessing (SMP) systems with up to 16,384 harts. If the harts are 64-bit (RV64) and implement
   the hypervisor extension, and if all features of the Advanced Interrupt Architecture are fully
   implemented as well, then for each physical hart there may be up to 63 active virtual harts and
   potentially thousands of additional idle (swapped-out) virtual harts, where each virtual hart has
   direct control of one or more physical devices.
Also 16,384 is used as a maximum for nr_parent_irqs from DTS point of view.

>
>>>    I think you're aware that in principle
>>> new code is expected to use xvmalloc() and friends unless there are specific
>>> reasons speaking against that.
>> Oh, missed 'v'...
> ... adding the missing 'v' will take care of my concern. Provided of
> course this isn't running to early for vmalloc() to be usable just yet.
>
>>>> +    if ( !imsic_cfg.msi )
>>>> +    {
>>>> +        rc = -ENOMEM;
>>>> +        goto imsic_init_err;
>>>> +    }
>>>> +
>>>> +    /* Check MMIO register sets */
>>>> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
>>>> +    {
>>>> +        if ( !alloc_cpumask_var(&imsic_cfg.mmios[i].cpus) )
>>>> +        {
>>>> +            rc = -ENOMEM;
>>>> +            goto imsic_init_err;
>>>> +        }
>>>> +
>>>> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
>>>> +                                   &imsic_cfg.mmios[i].size);
>>>> +        if ( rc )
>>>> +        {
>>>> +            printk(XENLOG_ERR "%s: unable to parse MMIO regset %u\n",
>>>> +                   node->name, i);
>>>> +            goto imsic_init_err;
>>>> +        }
>>>> +
>>>> +        base_addr = imsic_cfg.mmios[i].base_addr;
>>>> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>>>> +                           imsic_cfg.hart_index_bits +
>>>> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>>>> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>>>> +                       imsic_cfg.group_index_shift);
>>>> +        if ( base_addr != imsic_cfg.base_addr )
>>>> +        {
>>>> +            rc = -EINVAL;
>>>> +            printk(XENLOG_ERR "%s: address mismatch for regset %u\n",
>>>> +                   node->name, i);
>>>> +            goto imsic_init_err;
>>>> +        }
>>> Maybe just for my own understanding: There's no similar check for the
>>> sizes to match / be consistent wanted / needed?
>> If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
>> provide, IMO.
>> So I don't what is possible range for imsic_cfg.mmios[i].size.
> Well, all I can say is that's it feels odd that you sanity check base_addr
> but permit effectively any size.

Okay, I think I have two ideas how to check the size:
1. Based on guest bits from IMSIC's DT node. QEMU calculates a size as:
     for (socket = 0; socket < socket_count; socket++) {
         imsic_addr = base_addr + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
                      s->soc[socket].num_harts;
     ...
    where:
      #define IMSIC_MMIO_PAGE_SHIFT          12
      #define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
      
      #define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
              (1U << (__guest_bits))
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

The specification doesn’t seem to mention (or I couldn’t find) that all platforms
must calculate the MMIO size in the same way QEMU does. Therefore, it’s probably
better to use the approach described in option 2.

On the other hand, I don't think a platform should be considered correct if it
provides slightly more than needed but still less than the theoretical maximum.

>
>>>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>>>        return pcpu_info[cpuid].hart_id;
>>>>    }
>>>>    
>>>> +static inline unsigned long hartid_to_cpuid(unsigned long hartid)
>>>> +{
>>>> +    for ( unsigned int cpuid = 0; cpuid < ARRAY_SIZE(pcpu_info); cpuid++ )
>>>> +    {
>>>> +        if ( hartid == cpuid_to_hartid(cpuid) )
>>>> +            return cpuid;
>>>> +    }
>>>> +
>>>> +    /* hartid isn't valid for some reason */
>>>> +    return NR_CPUS;
>>>> +}
>>> Considering the values being returned, why's the function's return type
>>> "unsigned long"?
>> mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
>> Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
>> and MXLEN is 64 for RV64.
> Yet the return value here is always constrained by NR_CPUS, isn't it?

I am not 100% sure that I get your point, but I put NR_CPUS here because of:
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

~ Oleksii

--------------nj0fHv050wP7zpSJaqbI1jbx
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
    <div class="moz-cite-prefix">On 6/2/25 12:21 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.05.2025 20:44, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 5/22/25 4:46 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    /* Allocate MMIO resource array */
+    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">How large can this and ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    if ( !imsic_cfg.mmios )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... this array grow (in principle)?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Roughly speaking, this is the number of processors. The highests amount of processors
on the market I saw it was 32. But it was over a year ago when I last checked this.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Unless there's an architectural limit, I don't think it's a good idea to
take as reference what's available at present. But yes, ...</pre>
    </blockquote>
    <pre>This (32) is not an architectural limit.
I assume that if mhartd id accepts a range from 0 to  2^64-1 for RV64 then I assume
that the *theoretical* limit for amount of cpus is  2^64-1. And in RISC-V spec. I can't
find if it is theoretical limit or not.
But if look into AIA (interrupt controller) specification then it tells explicitly that limit
is 16,384:
  1.2 Limits
  In its current version, the RISC-V Advanced Interrupt Architecture can support RISC-V symmet-ric
  multiprocessing (SMP) systems with up to 16,384 harts. If the harts are 64-bit (RV64) and implement
  the hypervisor extension, and if all features of the Advanced Interrupt Architecture are fully
  implemented as well, then for each physical hart there may be up to 63 active virtual harts and
  potentially thousands of additional idle (swapped-out) virtual harts, where each virtual hart has
  direct control of one or more physical devices.
Also 16,384 is used as a maximum for nr_parent_irqs from DTS point of view.

</pre>
    <blockquote type="cite"
      cite="mid:8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">  I think you're aware that in principle
new code is expected to use xvmalloc() and friends unless there are specific
reasons speaking against that.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Oh, missed 'v'...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... adding the missing 'v' will take care of my concern. Provided of
course this isn't running to early for vmalloc() to be usable just yet.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    if ( !imsic_cfg.msi )
+    {
+        rc = -ENOMEM;
+        goto imsic_init_err;
+    }
+
+    /* Check MMIO register sets */
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
        <pre wrap="" class="moz-quote-pre">
If you are speaking about imsic_cfg.mmios[i].size then it depends fully on h/w will
provide, IMO.
So I don't what is possible range for imsic_cfg.mmios[i].size.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, all I can say is that's it feels odd that you sanity check base_addr
but permit effectively any size.</pre>
    </blockquote>
    <pre>Okay, I think I have two ideas how to check the size:
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

</pre>
    <pre data-start="60" data-end="86">Which option is preferred?</pre>
    <pre data-start="60" data-end="273">The specification doesn’t seem to mention (or I couldn’t find) that all platforms
must calculate the MMIO size in the same way QEMU does. Therefore, it’s probably
better to use the approach described in option 2.</pre>
    <pre data-start="275" data-end="433">On the other hand, I don't think a platform should be considered correct if it
provides slightly more than needed but still less than the theoretical maximum.

</pre>
    <blockquote type="cite"
      cite="mid:8cd6c3e0-0361-4f3f-b3ca-8ffa49b9197d@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
mhartid register has MXLEN length, so theoretically we could have from 0 to MXLEN-1
Harts and so we could have the same amount of Xen's CPUIDs. and MXLEN is 32 for RV32
and MXLEN is 64 for RV64.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yet the return value here is always constrained by NR_CPUS, isn't it?</pre>
    </blockquote>
    <pre>I am not 100% sure that I get your point, but I put NR_CPUS here because of:
  /*
   * tp points to one of these per cpu.
   *
   * hart_id would be valid (no matter which value) if its
   * processor_id field is valid (less than NR_CPUS).
   */
  struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
      .processor_id = NR_CPUS,
  }};
</pre>
    <pre>As an option we could use ULONG_MAX. Would it be better?

~ Oleksii
</pre>
  </body>
</html>

--------------nj0fHv050wP7zpSJaqbI1jbx--

