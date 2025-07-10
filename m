Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D521AFFF9D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 12:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039338.1411188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZoon-0007dq-SD; Thu, 10 Jul 2025 10:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039338.1411188; Thu, 10 Jul 2025 10:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZoon-0007bS-PF; Thu, 10 Jul 2025 10:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1039338;
 Thu, 10 Jul 2025 10:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgni=ZX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uZoom-0007bM-PB
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 10:47:56 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b9b241-5d7b-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 12:47:53 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60bfcada295so1194099a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 03:47:53 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7ee45absm109361666b.48.2025.07.10.03.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 03:47:51 -0700 (PDT)
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
X-Inumbo-ID: 54b9b241-5d7b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752144473; x=1752749273; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLU5WC21coCH5kAmCfx8mN0AU04SUprg1kCCQbJEynQ=;
        b=Y8ut66mrqhdwYglVz25ZukOwbONQpWGxj/3RwB22LSggkj9n5EEQq6bytheV8iKCBk
         KK/qG7wpfYwM4kSBMmHJ26ZSLH+ejUncmmPj+MV2TYRK3LqGXA9NjFTlZy64+DIJV7Mj
         A4aaxsX+PAPH9E2FJbVGjB+wuJR5yh2AxnC4JWAI/thVL4AYPhAMy0KZ0Smkmusetr2B
         2WeyidWkzKrYMsE57zsjpmKZ0fHs8wbb1l92bNamEVUP7996dzSmYtby66GN7lR81ALP
         uezTRIECN4fCjXiTz/d1BdjMJ5FR/c1uvUMbOafBbj23WNKzSZ81ziZ9mVU0tj/vaEBn
         WmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752144473; x=1752749273;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RLU5WC21coCH5kAmCfx8mN0AU04SUprg1kCCQbJEynQ=;
        b=YNtR+qca3r89pBEd5NwpqBpWU9mtwN16maazryuGb9Sa/Qf5SFftcDrj8rzDt43+Vd
         hS7NTTW1wdMdaY+eOoUo2eeP1y52PW1E8JBqnvyKKoQWgkyZi72e30FJbWpliZ9KlLfK
         fOzPPT7TtTvKA8pU4RVBiEw2myzlZa/z3L3UKPZP5qdvz1jBRrojYpPH/WaM23Xdf0vQ
         IBXTEWYQMiC+WgIRz6Q6vlH5J36m2fAnDmIeXN67mNZLsCkoX/zYEbWryfnTkAREIlLR
         TQarWQxxNfcy70b3a7L7OYQn061oHAKu6MUsrAPgVehp24m530RJKbQNVuRxg9YU1ZkM
         oRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiY9r6Ak6DEAr3Ah0a54DPGD3Sh3o4d8bQYdu5xWl67W2NqVrdUj1iXug4PNqkMQUhrcVFatg74P8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxALQzdyVf0N7ecADmujSkiDSn7RgvSRquL0Uv/D+hk14eenO26
	xO/C7YE09MEvIHhg+JmFcFWUmnjCIECdhh+IMynDUKgKk4rfbCcfAkd3TX3MiA==
X-Gm-Gg: ASbGncuPpYv7TAkIi3c5sb7a8kU9YTzRRuQMm64Hr3vbIioC+EHXEI4rMvXz8kX5m81
	aXwKE8kZfARZbEQhsbFMpTLSwhDtA1O0mynAHCha5oC5Fvfkb7QhNjt9DC1gkgR1mGqoiktw3ZG
	Lwy4vE4BRsgQIxSkDySsNsuxx38lm0CoEDLdsOkXBNBo6QPMft8lI/gpnSJmwrvT577u6+GfPBf
	wzfzkp9+Q0spDHUar1hM9LHBDPq4bqHZSyFTyXUcfkanEI16SacUUaZbPGJ3bhCk9OS4G88fKUV
	nxfsMznN9KJHMKy7eEBbAPuIe25IBvrXEYt2KtYgvAN+JeDjpc2P+LmI0fS543XOyTcuOVsdUQ1
	27+bUjPzOdNch9Z4gZXzUUJh0xWPkPg/idsc=
X-Google-Smtp-Source: AGHT+IHesLtz6NnLTutPjuQ88MYESqrul5azwH/U+IIcQ2BrC1us3Qp131drFGYlK8/YHeCmCGJW4g==
X-Received: by 2002:a17:907:da4:b0:ae0:c441:d54b with SMTP id a640c23a62f3a-ae6e6e1d163mr200510666b.9.1752144472147;
        Thu, 10 Jul 2025 03:47:52 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0jHiqvcneJOkHI1LrMkMj76x"
Message-ID: <1b95d8b4-2d44-484b-a3f2-5952bb37cfcb@gmail.com>
Date: Thu, 10 Jul 2025 12:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
 <73d797ed48fd3e442ca63d94ecdf29f57cd52b62.1751876912.git.oleksii.kurochko@gmail.com>
 <607f9a3a-6a70-4a9b-9bb0-65138b49b6ae@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <607f9a3a-6a70-4a9b-9bb0-65138b49b6ae@suse.com>

This is a multi-part message in MIME format.
--------------0jHiqvcneJOkHI1LrMkMj76x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/25 3:52 PM, Jan Beulich wrote:
> On 07.07.2025 11:01, Oleksii Kurochko wrote:
>> imsic_init() is introduced to parse device tree node, which has the following
>> bindings [2], and based on the parsed information update IMSIC configuration
>> which is stored in imsic_cfg.
>>
>> The following helpers are introduces for imsic_init() usage:
>>    - imsic_parse_node() parses IMSIC node from DTS
>>    - imsic_get_parent_hartid() returns the hart ( CPU ) ID of the given device
>>      tree node.
>>
>> This patch is based on the code from [1].
>>
>> Since Microchip originally developed imsic.{c,h}, an internal discussion with
>> them led to the decision to use the MIT license.
>>
>> [1]https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4
>> [2]https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
>>
>> Co-developed-by: Romain Caritey<Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com
>
> I'm curious though:
>
>> --- a/xen/arch/riscv/include/asm/smp.h
>> +++ b/xen/arch/riscv/include/asm/smp.h
>> @@ -3,6 +3,7 @@
>>   #define ASM__RISCV__SMP_H
>>   
>>   #include <xen/cpumask.h>
>> +#include <xen/macros.h>
>>   #include <xen/percpu.h>
>>   
>>   #include <asm/current.h>
>> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>>       return pcpu_info[cpuid].hart_id;
>>   }
>>   
>> +static inline unsigned int hartid_to_cpuid(unsigned long hartid)
>> +{
>> +    for ( unsigned int cpu = 0; cpu < ARRAY_SIZE(pcpu_info); cpu++ )
>> +    {
>> +        if ( hartid == cpuid_to_hartid(cpu) )
>> +            return cpu;
>> +    }
>> +
>> +    /* hartid isn't valid for some reason */
>> +    return NR_CPUS;
>> +}
> Since there's no FIXME or alike here, is this really intended to remain this
> way? With many CPUs this form of lookup can be pretty inefficient.

In the case with a big amount of CPUs it will require to update it. I will create
TODO task in my repo to not forget to update it in a future.

Thanks.

~ Oleksii

--------------0jHiqvcneJOkHI1LrMkMj76x
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
    <div class="moz-cite-prefix">On 7/8/25 3:52 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:607f9a3a-6a70-4a9b-9bb0-65138b49b6ae@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.07.2025 11:01, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">imsic_init() is introduced to parse device tree node, which has the following
bindings [2], and based on the parsed information update IMSIC configuration
which is stored in imsic_cfg.

The following helpers are introduces for imsic_init() usage:
  - imsic_parse_node() parses IMSIC node from DTS
  - imsic_get_parent_hartid() returns the hart ( CPU ) ID of the given device
    tree node.

This patch is based on the code from [1].

Since Microchip originally developed imsic.{c,h}, an internal discussion with
them led to the decision to use the MIT license.

[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4">https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4</a>
[2] <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml">https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml</a>

Co-developed-by: Romain Caritey <a class="moz-txt-link-rfc2396E" href="mailto:Romain.Caritey@microchip.com">&lt;Romain.Caritey@microchip.com&gt;</a>
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Jan Beulich &lt;<a class="moz-txt-link-abbreviated" href="mailto:jbeulich@suse.com">jbeulich@suse.com</a>

I'm curious though:

</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:607f9a3a-6a70-4a9b-9bb0-65138b49b6ae@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -3,6 +3,7 @@
 #define ASM__RISCV__SMP_H
 
 #include &lt;xen/cpumask.h&gt;
+#include &lt;xen/macros.h&gt;
 #include &lt;xen/percpu.h&gt;
 
 #include &lt;asm/current.h&gt;
@@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
     return pcpu_info[cpuid].hart_id;
 }
 
+static inline unsigned int hartid_to_cpuid(unsigned long hartid)
+{
+    for ( unsigned int cpu = 0; cpu &lt; ARRAY_SIZE(pcpu_info); cpu++ )
+    {
+        if ( hartid == cpuid_to_hartid(cpu) )
+            return cpu;
+    }
+
+    /* hartid isn't valid for some reason */
+    return NR_CPUS;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Since there's no FIXME or alike here, is this really intended to remain this
way? With many CPUs this form of lookup can be pretty inefficient.</pre>
    </blockquote>
    <pre>In the case with a big amount of CPUs it will require to update it. I will create
TODO task in my repo to not forget to update it in a future.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------0jHiqvcneJOkHI1LrMkMj76x--

