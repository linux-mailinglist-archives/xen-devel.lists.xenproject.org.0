Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB36AD4E4C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 10:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011349.1389725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGmu-0001JR-DR; Wed, 11 Jun 2025 08:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011349.1389725; Wed, 11 Jun 2025 08:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGmu-0001Gq-AE; Wed, 11 Jun 2025 08:26:24 +0000
Received: by outflank-mailman (input) for mailman id 1011349;
 Wed, 11 Jun 2025 08:26:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mXZ=Y2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uPGms-0000oI-Ra
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 08:26:22 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0422bcb-469d-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 10:26:19 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad51ba0af48so134247966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 01:26:19 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc78f47sm841183766b.153.2025.06.11.01.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 01:26:18 -0700 (PDT)
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
X-Inumbo-ID: c0422bcb-469d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630379; x=1750235179; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D36TET5nPdbKBCA84GHWqEQE3SKs1YEmxDXH5hhaPbo=;
        b=HAXAQ8EASTktb8bHqiyvhqtiCO4u6Qc4rm2OG2MeLukzAfu5D+4a/Bvzj2c6mQ2VUg
         UM10S+km4rRGPOTF5vs8f00RqgeuIna+kCy02MszpMYllU2Lp5zroZJhtVhUVoUx4cRq
         N/+A+sFVumnvDWbIVLIbyeNSrrsvHL9j6+6N59SLt1FPCSU93aPAQ8qlpJV1Rg7gBTqa
         1d/zfwG7XjDZmy8eJc0nGWHXZuOmBMz97g6eoPToY4uA8zM0PURNRTROTNNT5VJOYF00
         OFsdapsKq2NYmdfeFQnMCdbLpA8E9VAMACsDTygCU8RgbkqpfmH5lD4n+KHtm9nZY6Vt
         NmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630379; x=1750235179;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D36TET5nPdbKBCA84GHWqEQE3SKs1YEmxDXH5hhaPbo=;
        b=ponN20R914ZCEgBh2/peVdLMgLznKxiqlbJ4m5R7iQaCQ6TGt0ZiaTyVPeEU53yodm
         NQVaZkfCmRz1K2fsgZo4vIDaifduEFKUKsdgka07bcTPl9wXcIx4VgtjAkqM7VHcfaW3
         xKQvOgnFkoC3k9yhxwxdsC12CFZlr/BgQONvFH0PfWpx8DPEXYc/yj+AjmAwDWYp3Zwb
         RyNu7afbK9G9YMhvdd04o+hij9S5FrnlNWmfQbQiQNDzA5wbTpcSTInK1kvVkaAl9QEy
         vf3fwb8lIDj0NYPqxApzSww0mznT21Na6f8rTBhQAY+qCvmM09pa2WMWby+9O8/6+7j0
         r0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCURQR5unEX3yBjjFi9IgEP/RMvk7OhVYjXW51Y5NidEl2FCPLYex0qGrbyMmBIRMGUZ3cdzTUFvMoU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6bJ+COQzAgdOcxXpJ3ztNTxeVvJg1bJ48NPhZH9mOBU7UXk/T
	z30d0sdat1AUQU6LP4utEfuGW2rQChqfOuqlXai+z8qxbHFEB0FPn9oo
X-Gm-Gg: ASbGncut/SEPqXu0aBzGkiLqwpPoGoXZjdftSYO3KAMqq3FjjbM27yOLzy3tJI/ux5L
	qc4kniQRI2sCYo0djUm0PtkAaPUODYkwcfSDBU2+wEScGaG3GCtkYOgNZZi/47/JytNFn+h6RMX
	u9oDnUrEDm9zlzGuUEj7ncDrhIBqj+lwmloqb63wfZi3ITrsONpwHVXYDnY7/BDzGeKNG/l0Mlp
	lRbdqdyCvw+dTOiW/q56tgD1xmnzNPpB/GJuU4ZHIk5J5NuZ6nQ5XQIysdHVXajZ5owr9bV8cbp
	57zjd6EAFST/kj2wgv+yNqmvhNCem0Y3rLMSb+0VyNixFt9epTmbMNI1k5Awrcw2wGnoJbn7l13
	sGDQEE5Z8dRlMibHIhjV4n90ajdZWKR503HTuLgeFSbrh+Q==
X-Google-Smtp-Source: AGHT+IFKga2vHrOPl3+FxPh+x6Oxhmj2KX4M9vWFVoSSP7oxagLFB0z2RFGAL1lewI2LpGVgFoC7iA==
X-Received: by 2002:a17:907:70c:b0:ad5:431d:fb32 with SMTP id a640c23a62f3a-ade89a57f32mr209480766b.14.1749630378965;
        Wed, 11 Jun 2025 01:26:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------lKCCdFGUmHx3ssi4Y0r0TStv"
Message-ID: <e1b7b5ef-e20e-430e-a4d1-6da912c31f6f@gmail.com>
Date: Wed, 11 Jun 2025 10:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] xen/riscv: dt_processor_hartid() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <751343d295c0fa6a9a7d8f2265ece3faecd44b64.1749121437.git.oleksii.kurochko@gmail.com>
 <6fe24545-1f76-4f3f-84bb-b0f8e225ac7b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6fe24545-1f76-4f3f-84bb-b0f8e225ac7b@suse.com>

This is a multi-part message in MIME format.
--------------lKCCdFGUmHx3ssi4Y0r0TStv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/10/25 4:08 PM, Jan Beulich wrote:
> On 05.06.2025 17:58, Oleksii Kurochko wrote:
>> @@ -14,3 +17,77 @@ void __init smp_prepare_boot_cpu(void)
>>       cpumask_set_cpu(0, &cpu_possible_map);
>>       cpumask_set_cpu(0, &cpu_online_map);
>>   }
>> +
>> +/**
>> + * dt_get_hartid - Get the hartid from a CPU device node
>> + *
>> + * @cpun: CPU number(logical index) for which device node is required
>> + *
>> + * Return: The hartid for the CPU node or ~0UL if not found.
>> + */
>> +static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
>> +{
>> +    const __be32 *cell;
>> +    unsigned int ac;
>> +    uint32_t len;
>> +    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
>> +
>> +    ac = dt_n_addr_cells(cpun);
>> +    cell = dt_get_property(cpun, "reg", &len);
>> +
>> +    if (ac > max_cells) {
> Besides the (double) style issue, why's this needed? Can't you simply ...
>
>> +        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
>> +               max_cells);
>> +        return ~0UL;
>> +    }
>> +
>> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
> ... write the last part here in a way that there can't be overflow?
> ac > len / sizeof(*cell) that is? (Remaining question then is what to
> do when len isn't evenly divisible by sizeof(*cell).)

reg property should be always evenly divisible by sizeof(*cell) according to device
tree binding:
   The reg property describes the address of the device’s resources within 
the address space defined by its parent bus. Most commonly this means 
the offsets and lengths of memory-mapped IO register blocks, but may 
have a different meaning on some bus types. Addresses in the address 
space defined by the root node are CPU real addresses.
   
   The value is a <prop-encoded-array>, composed of an arbitrary number of 
pairs of address and length, <address length>. The number of <u32> cells 
required to specify the address and length are bus-specific and are 
specified by the #address-cells and #size-cells properties in the parent 
of the device node. If the parent node specifies a value of 0 for 
#size-cells, the length field in the value of reg shall be omitted. So 
it is guaranteed by DTC compiler and it would be enough to check 
overflow in suggested by you way: ac > len / sizeof(*cell)
But considering what you noticed below ...

>
>> +        return ~0UL;
>> +
>> +    return dt_read_number(cell, ac);
> What meaning does this have for ac > 2? (As per your checking above
> it can be up to UINT32_MAX / 4.)

... It will be an issue for dt_read_number() which could deal only with uint64_t what means
we can't have ac > 2. (UINT32_MAX / 4 it is a theoretical maximum IIUC)

Thereby we could do in the following way:
@@ -30,19 +30,18 @@ static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
      const __be32 *cell;
      unsigned int ac;
      uint32_t len;
-    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
  
      ac = dt_n_addr_cells(cpun);
      cell = dt_get_property(cpun, "reg", &len);
  
-    if (ac > max_cells) {
-        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
-               max_cells);
+    if ( !cell || !ac || (ac > len / sizeof(*cell)) )
          return ~0UL;
-    }
  
-    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
-        return ~0UL;
+    /*
+     * If ac > 2, the result may be truncated or meaningless unless
+     * dt_read_number() supports wider integers.
+     */
+    BUG_ON(ac > 2);
  
      return dt_read_number(cell, ac);
  }

I am not sure that BUG_ON() should be in dt_get_hartid(). Probably it would be better move it
to dt_read_number() as if one day support for RV128 will be needed I assume that it will be
needed to change a prototype of dt_read_number() to work with address-cells = 3.
What do you think? Could I go with the suggested above changes or it would be better to move
BUG_ON() to dt_read_number()?

~ Oleksii


--------------lKCCdFGUmHx3ssi4Y0r0TStv
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
    <div class="moz-cite-prefix">On 6/10/25 4:08 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6fe24545-1f76-4f3f-84bb-b0f8e225ac7b@suse.com">
      <pre wrap="" class="moz-quote-pre">On 05.06.2025 17:58, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -14,3 +17,77 @@ void __init smp_prepare_boot_cpu(void)
     cpumask_set_cpu(0, &amp;cpu_possible_map);
     cpumask_set_cpu(0, &amp;cpu_online_map);
 }
+
+/**
+ * dt_get_hartid - Get the hartid from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ *
+ * Return: The hartid for the CPU node or ~0UL if not found.
+ */
+static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
+{
+    const __be32 *cell;
+    unsigned int ac;
+    uint32_t len;
+    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &amp;len);
+
+    if (ac &gt; max_cells) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Besides the (double) style issue, why's this needed? Can't you simply ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
+               max_cells);
+        return ~0UL;
+    }
+
+    if ( !cell || !ac || ((sizeof(*cell) * ac) &gt; len) )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... write the last part here in a way that there can't be overflow?
ac &gt; len / sizeof(*cell) that is? (Remaining question then is what to
do when len isn't evenly divisible by sizeof(*cell).)</pre>
    </blockquote>
    <pre>reg property should be always evenly divisible by sizeof(*cell) according to device
tree binding:
  <font face="monospace">The reg property describes the address of the device’s resources within the address space
  defined by its parent bus. Most commonly this means the offsets and lengths of memory-mapped
  IO register blocks, but may have a different meaning on some bus types. Addresses in the
  address space defined by the root node are CPU real addresses.</font>
  
  <font face="monospace">The value is a &lt;prop-encoded-array&gt;, composed of an arbitrary number of pairs of address and
  length, &lt;address length&gt;. The number of &lt;u32&gt; cells required to specify the address and length
  are bus-specific and are specified by the #address-cells and #size-cells properties in the parent
  of the device node. If the parent node specifies a value of 0 for #size-cells, the length field
  in the value of reg shall be omitted.
So it is guaranteed by DTC compiler and it would be enough to check overflow in suggested by
you way:
  </font>ac &gt; len / sizeof(*cell)
But considering what you noticed below ...

</pre>
    <blockquote type="cite"
      cite="mid:6fe24545-1f76-4f3f-84bb-b0f8e225ac7b@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        return ~0UL;
+
+    return dt_read_number(cell, ac);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What meaning does this have for ac &gt; 2? (As per your checking above
it can be up to UINT32_MAX / 4.)</pre>
    </blockquote>
    <pre>... It will be an issue for dt_read_number() which could deal only with uint64_t what means
we can't have ac &gt; 2. (UINT32_MAX / 4 it is a theoretical maximum IIUC)

Thereby we could do in the following way:
@@ -30,19 +30,18 @@ static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
     const __be32 *cell;
     unsigned int ac;
     uint32_t len;
-    unsigned int max_cells = UINT32_MAX / sizeof(*cell);
 
     ac = dt_n_addr_cells(cpun);
     cell = dt_get_property(cpun, "reg", &amp;len);
 
-    if (ac &gt; max_cells) {
-        printk("%s: cell count overflow (ac=%u, max=%u)\n", __func__, ac,
-               max_cells);
+    if ( !cell || !ac || (ac &gt; len / sizeof(*cell)) )
         return ~0UL;
-    }
 
-    if ( !cell || !ac || ((sizeof(*cell) * ac) &gt; len) )
-        return ~0UL;
+    /*
+     * If ac &gt; 2, the result may be truncated or meaningless unless
+     * dt_read_number() supports wider integers.
+     */
+    BUG_ON(ac &gt; 2);
 
     return dt_read_number(cell, ac);
 }

I am not sure that BUG_ON() should be in dt_get_hartid(). Probably it would be better move it
to dt_read_number() as if one day support for RV128 will be needed I assume that it will be
needed to change a prototype of dt_read_number() to work with address-cells = 3.
What do you think? Could I go with the suggested above changes or it would be better to move
BUG_ON() to dt_read_number()?

~ Oleksii
</pre>
    <pre>

</pre>
  </body>
</html>

--------------lKCCdFGUmHx3ssi4Y0r0TStv--

