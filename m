Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69FAC3FE0
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 14:58:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997527.1378359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJXNv-0000JM-PP; Mon, 26 May 2025 12:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997527.1378359; Mon, 26 May 2025 12:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJXNv-0000Gz-Mm; Mon, 26 May 2025 12:56:55 +0000
Received: by outflank-mailman (input) for mailman id 997527;
 Mon, 26 May 2025 12:56:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xmSW=YK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uJXNu-0000Gt-0e
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 12:56:54 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3971867-3a30-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 14:56:50 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-602346b1997so3339244a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 05:56:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d497214sm1688059466b.146.2025.05.26.05.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 05:56:48 -0700 (PDT)
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
X-Inumbo-ID: e3971867-3a30-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748264209; x=1748869009; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChVp86LF6pNA1X83+c8xGdYu9ASIEbw1MOjMGQRZCQo=;
        b=XRhPTqKgV3qJzCwu98azvOqMcqXbwjlNMrqNDxalOpiBTwI581rOHYdMF+4P43DrZb
         m650tPVrtUsIM/At0Y9oeJal2HJdsk+dEnCYhp89ldG7EywUWkyWXcTcJV8weTM1L+OU
         hVfpM5fV1gjaD3IcIXnp1pNUmgLkHcKyz47Jl2xLqAURS80mXrPscMaLNvD5X4vumN03
         ico6SuNaBmJfImIa0YwbSHPnCHX97CoCfC1kh5PRH+7zpXqMKS+QBuC5HmUa3YLU279C
         Z1/KTlArSWAzCyuTUg07aQWFOtetCLXk7pT33KGeZTRyF3ap1z9LLOHGyeaRfqjiVnQa
         Wtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748264209; x=1748869009;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ChVp86LF6pNA1X83+c8xGdYu9ASIEbw1MOjMGQRZCQo=;
        b=lqpJv9sRjA4zY+GNQYC7l0p0LqVLgccMTvAHi8F2vaByUT4tPdGxCOLs/RkTCLCGVe
         5OPv6gKLJCkaEyWaBdUM14ehV3h+5vmGcFy3pl/Yxh83PxclH8cXNw8wOkJqNBRDigVd
         OfHTP/6blMH26z9c+EuyAIzGDvJWoFS80oZBCQDInVpD+b/Kw/E75BTR9G4j++RKiAtA
         XP+9bJOosM6ktej6KLviDJhVmyHiAZ1z0Z6k1yUV0T/BhHDpyudskFxpVGC/sCDvsEgb
         7XvBL9asu0XStUeufmdL6i52ds33+zOi1Cr0hrskXEKKv7bnK5R/x4SAMSLSfMAmPgON
         JpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUypFWfXeKHgjFE5Nvhlj7vE2ApjFUrM75OOfwEYUXyZFWnn4A3bdsm1rEYJ00cvARc4Y77FRhiPi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPvN2iWqqeEZHOcIiMeVQzlh8+v21wIqJxCf0o5PszmLj/K8/c
	cNKqy8qyjhKJU7pXg2DpmapLuefezCyOkXhBTuR0rUSSRq5NNteqlfC6
X-Gm-Gg: ASbGncvRUePxBFNmEZd2QHqCTEyuMhBY3O6WKQ5AyM0TkxDW+Czo/IPOc3dz1YaNJTI
	6X7xrmct/mZyqlzOV5D0jI7chql2kDztIOVV7CLPhTLe7XOFdPfLKH71H0dZ4euCI6iNjY68mTV
	W3630pWRIaRzMi3vEcSDYC1ztarNSDUIMyPWIMW2zMDE1dLEm/esUFzMsDA4DN+a1Nbuy6GMSgF
	fK04q3ILQhUyQW1dMEI6v+KzkENcpAfCp0YRXgFrNsgBbeQjwgozz9rnE4tufb6T9YMfjOemLIY
	T/anPwho9pBbkAKUX8WusCSxIb4GuB1TIVBcpBSs8FGbfHrKR5oNk1ZhcY6y0vjpTcvSwMi+a5b
	WKp6AKuZTrZ3iVub7DE8BmiGM
X-Google-Smtp-Source: AGHT+IETOSAfx9D9xxYPhcDk8JY3HfJdASZjMAaTgZISynvYLegOZ9VOO6jIHaLlO08mImHJ+oUXAQ==
X-Received: by 2002:a17:906:7945:b0:ad5:430b:9013 with SMTP id a640c23a62f3a-ad85b2d6f1fmr808672766b.42.1748264208961;
        Mon, 26 May 2025 05:56:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VE7FDKaOts0sTevQqQLOlAUd"
Message-ID: <bb6e5cab-d793-42db-83d5-9c7c1cf4e25a@gmail.com>
Date: Mon, 26 May 2025 14:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] xen/riscv: dt_processor_hartid() implementation
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
 <5aec324c04c67ba88336244358542f3faa6726b2.1747843009.git.oleksii.kurochko@gmail.com>
 <12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com>
 <c4eac2d2-6cb3-4c3b-8ca6-3b7982893647@gmail.com>
Content-Language: en-US
In-Reply-To: <c4eac2d2-6cb3-4c3b-8ca6-3b7982893647@gmail.com>

This is a multi-part message in MIME format.
--------------VE7FDKaOts0sTevQqQLOlAUd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/25 12:46 PM, Oleksii Kurochko wrote:
>
>
> On 5/22/25 9:50 AM, Jan Beulich wrote:
>> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/smpboot.c
>>> +++ b/xen/arch/riscv/smpboot.c
>>> @@ -1,5 +1,8 @@
>>>   #include <xen/cpumask.h>
>>> +#include <xen/device_tree.h>
>>> +#include <xen/errno.h>
>>>   #include <xen/init.h>
>>> +#include <xen/types.h>
>>>   #include <xen/sections.h>
>> Nit: The latter insertion wants to move one line down. Yet then - isn't
>> xen/stdint.h sufficient here?
> __be32 used in dt_get_hartid() is defined in xen/types.h.
>
>>> @@ -14,3 +17,69 @@ void __init smp_prepare_boot_cpu(void)
>>>       cpumask_set_cpu(0, &cpu_possible_map);
>>>       cpumask_set_cpu(0, &cpu_online_map);
>>>   }
>>> +
>>> +/**
>>> + * dt_get_hartid - Get the hartid from a CPU device node
>>> + *
>>> + * @cpun: CPU number(logical index) for which device node is required
>>> + *
>>> + * Return: The hartid for the CPU node or ~0UL if not found.
>>> + */
>>> +static unsigned long dt_get_hartid(const struct dt_device_node *cpun)
>>> +{
>>> +    const __be32 *cell;
>>> +    unsigned int ac;
>>> +    uint32_t len;
>>> +
>>> +    ac = dt_n_addr_cells(cpun);
>>> +    cell = dt_get_property(cpun, "reg", &len);
>>> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
>> Does DT make any guarantees for this multiplication to not overflow?
> I haven't tried of DTC checks such things during compilation but considering that
> ac value is uin32_t value (according to DT spec) then overflow could really happen.
> I will add the following to check an overflow:
>      if ( ac > ((sizeof(size_t) * BIT_PER_BYTE) / sizeof(*cell)) )
>      {
>          printk("%s: overflow detected\n", __func__);
>          return ~0UL;
>      }

Oops, I meant here size_t_max instead of (sizeof(size_t) * BIT_PER_BYTE), lost power of 2 minus 1.
Probably, SIZE_T_MAX or something similar exists. I have to check.

~ Oleksii

>
>>> +        return ~0UL;
>>> +
>>> +    return dt_read_number(cell, ac);
>>> +}
>>> +
>>> +/*
>>> + * Returns the hartid of the given device tree node, or -ENODEV if the node
>>> + * isn't an enabled and valid RISC-V hart node.
>>> + */
>>> +int dt_processor_hartid(const struct dt_device_node *node,
>>> +                        unsigned long *hartid)
>>> +{
>>> +    const char *isa;
>>> +    int ret;
>>> +
>>> +    if ( !dt_device_is_compatible(node, "riscv") )
>>> +    {
>>> +        printk("Found incompatible CPU\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    *hartid = dt_get_hartid(node);
>>> +    if ( *hartid == ~0UL )
>>> +    {
>>> +        printk("Found CPU without CPU ID\n");
>>> +        return -ENODATA;
>>> +    }
>>> +
>>> +    if ( !dt_device_is_available(node))
>>> +    {
>>> +        printk("CPU with hartid=%lu is not available\n", *hartid);
>> Considering that hart ID assignment is outside of our control, would we
>> perhaps better (uniformly) log such using %#lx?
> It makes sense, DTC when generates dts from dtb also uses hex number, so it could
> help to find a failure node faster.
>
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
>>> +    {
>>> +        printk("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hartid);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if ( isa[0] != 'r' || isa[1] != 'v' )
>>> +    {
>>> +        printk("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hartid,
>>> +               isa);
>>> +        return -EINVAL;
>> As before -EINVAL is appropriate when input arguments have wrong values.
>> Here, however, you found an unexpected value in something the platform
>> has presented to you. While not entirely appropriate either, maybe
>> -ENODEV again (if nothing better can be found)?
> I don't see better candidate.
>
> Interesting if some reserved region exists for user
> defined errors.
>
> ~ Oleksii
--------------VE7FDKaOts0sTevQqQLOlAUd
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
    <div class="moz-cite-prefix">On 5/26/25 12:46 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c4eac2d2-6cb3-4c3b-8ca6-3b7982893647@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 5/22/25 9:50 AM, Jan Beulich
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com">
        <pre wrap="" class="moz-quote-pre">On 21.05.2025 18:03, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -1,5 +1,8 @@
 #include &lt;xen/cpumask.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/errno.h&gt;
 #include &lt;xen/init.h&gt;
+#include &lt;xen/types.h&gt;
 #include &lt;xen/sections.h&gt;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Nit: The latter insertion wants to move one line down. Yet then - isn't
xen/stdint.h sufficient here?</pre>
      </blockquote>
      <pre>__be32 used in dt_get_hartid() is defined in xen/types.h.

</pre>
      <blockquote type="cite"
        cite="mid:12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">@@ -14,3 +17,69 @@ void __init smp_prepare_boot_cpu(void)
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
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &amp;len);
+    if ( !cell || !ac || ((sizeof(*cell) * ac) &gt; len) )
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Does DT make any guarantees for this multiplication to not overflow?</pre>
      </blockquote>
      <pre>I haven't tried of DTC checks such things during compilation but considering that
ac value is uin32_t value (according to DT spec) then overflow could really happen.
I will add the following to check an overflow:
    if ( ac &gt; ((sizeof(size_t) * BIT_PER_BYTE) / sizeof(*cell)) )
    {
        printk("%s: overflow detected\n", __func__);
        return ~0UL;
    }</pre>
    </blockquote>
    <pre>Oops, I meant here size_t_max instead of (sizeof(size_t) * BIT_PER_BYTE), lost power of 2 minus 1.
Probably, SIZE_T_MAX or something similar exists. I have to check.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:c4eac2d2-6cb3-4c3b-8ca6-3b7982893647@gmail.com">
      <pre>

</pre>
      <blockquote type="cite"
        cite="mid:12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+        return ~0UL;
+
+    return dt_read_number(cell, ac);
+}
+
+/*
+ * Returns the hartid of the given device tree node, or -ENODEV if the node
+ * isn't an enabled and valid RISC-V hart node.
+ */
+int dt_processor_hartid(const struct dt_device_node *node,
+                        unsigned long *hartid)
+{
+    const char *isa;
+    int ret;
+
+    if ( !dt_device_is_compatible(node, "riscv") )
+    {
+        printk("Found incompatible CPU\n");
+        return -ENODEV;
+    }
+
+    *hartid = dt_get_hartid(node);
+    if ( *hartid == ~0UL )
+    {
+        printk("Found CPU without CPU ID\n");
+        return -ENODATA;
+    }
+
+    if ( !dt_device_is_available(node))
+    {
+        printk("CPU with hartid=%lu is not available\n", *hartid);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Considering that hart ID assignment is outside of our control, would we
perhaps better (uniformly) log such using %#lx?</pre>
      </blockquote>
      <pre>It makes sense, DTC when generates dts from dtb also uses hex number, so it could
help to find a failure node faster.

</pre>
      <blockquote type="cite"
        cite="mid:12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+        return -ENODEV;
+    }
+
+    if ( (ret = dt_property_read_string(node, "riscv,isa", &amp;isa)) )
+    {
+        printk("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hartid);
+        return ret;
+    }
+
+    if ( isa[0] != 'r' || isa[1] != 'v' )
+    {
+        printk("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hartid,
+               isa);
+        return -EINVAL;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">As before -EINVAL is appropriate when input arguments have wrong values.
Here, however, you found an unexpected value in something the platform
has presented to you. While not entirely appropriate either, maybe
-ENODEV again (if nothing better can be found)?</pre>
      </blockquote>
      <pre>I don't see better candidate.

Interesting if some reserved region exists for user
defined errors.

~ Oleksii
</pre>
    </blockquote>
  </body>
</html>

--------------VE7FDKaOts0sTevQqQLOlAUd--

