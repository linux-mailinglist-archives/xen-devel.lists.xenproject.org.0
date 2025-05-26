Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A1AC3E07
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 12:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997485.1378339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJVLh-0001En-DD; Mon, 26 May 2025 10:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997485.1378339; Mon, 26 May 2025 10:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJVLh-0001DK-96; Mon, 26 May 2025 10:46:29 +0000
Received: by outflank-mailman (input) for mailman id 997485;
 Mon, 26 May 2025 10:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xmSW=YK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uJVLf-0001DE-Sg
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 10:46:27 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abf57e0f-3a1e-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 12:46:25 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad5273c1fd7so403381866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 May 2025 03:46:25 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d49886esm1677493066b.144.2025.05.26.03.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 03:46:24 -0700 (PDT)
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
X-Inumbo-ID: abf57e0f-3a1e-11f0-b893-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748256385; x=1748861185; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh0J/KhR0RJ3yq6/xTnrXE/lER6llAbp0fp+6wrKs3U=;
        b=Lwrqhg+obqsBDazeRKozuIUWAdq9DBHahylchI+OBLM0/DarDZo1ZUo/k41tSUciH/
         azcn9qdvuNg0WAP2HWs8cBFOMrgFyY2cEzSfh4ZpYv0DMKn8erJGxi0xb0NSylQwa1xo
         mEIAfBPCzuSkkrgf49NoS18iuHWQtifZ7oiBdqYArLZCndXRGszYC+VP9sWeNEce1Yxg
         nFwBGiI1fr9TVA4IV4cnXw7Bs4G8zA6UHStb+YsBmz5IDJkc2t4px9aAsP957UqnD9Wh
         tPFDFViKw9EyAiwLX3GoTgMmZSA+12Ie1EFZnoxC1QlIGuQJoiyMotfK+UYeGVhZcU/O
         AWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256385; x=1748861185;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lh0J/KhR0RJ3yq6/xTnrXE/lER6llAbp0fp+6wrKs3U=;
        b=qs3LWDHuS7KaKZAiniJgdDWG8+U7Cca9V/em/nDuCRl3EV4EOxdfNeVKiQA3QaXys7
         jdAZQPTDyYF14rgZGM7dKdvtyCgzQQxmJTBDIoTPu9qHTmUXttaj0BqXzNjxuGcyEGxB
         Y4q6gp614DNwOyCl4owRwQUnHV5DJmnDAIZ7yRaCtQm3qzAJCPprGYWzF/QT/Vqg5X+r
         dgzbvPfxwyJhDnovNit8s5aEaKov7bx+jI8V7F2eb+u6j3NGAUmIsF1el0/lymy+nQOA
         wBfH9uXdYYdV0v3pq5/oINv7le9Ll3Cnq+TrVOU7gIMBBIRIEqi6ITai0fWvps5twMmq
         iefg==
X-Forwarded-Encrypted: i=1; AJvYcCWbb/eJMMw26QNQf9iby8snUF34dX1//ZJO8TvvGD8z9+vgaHsgTR5ysz4mYAGX0LoF3pYHpQXy6rk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAUF0bN/5HaqvlVAous99s+dpw5eUiIwKB7/dr0Nraf3N59tWV
	2lQxjN+0fewo4eDhdRC8pZ47kPiKx590R8zumM7g/Y2jzPufcCi5f3n2
X-Gm-Gg: ASbGnctGcjHqTTb0y9sp4mmm4iUxzC9GHJNTSlUPxrd9BCs21+p0E2Wr2485ERrf2M0
	41ShYavwyALCG9peUaHCS27AJ7mZqWy0hcCUNbIWIM7dxgnG7sOIstVPy6MEjsYOi+yq9sTGivR
	uIkgdXmlDR8gnos6E/CcdTI03KL9qnFm/xThEFQHP4I+sFFC8u+ILbufD8m+SWacZ3H2XR0KwJ3
	6qan/v//NvGjLl1GZ5VN5GlBUVA2uFUamhWQvEgZSJAOBgrrNmOSaEejyvLTJQhO/Q/1e7aOEgc
	l+LYS5YP/kyyMqKW//beDK7LJ13CjBFeiNBAI9wjmbdwHAc3+UvHsmBl2OFbBDj1hfieB7XeP8K
	w0U4fksTp8x5jYJq3p0+qzdte
X-Google-Smtp-Source: AGHT+IHv7AG+unLmpvyVQGDehwFSBo1mDE1EFrcZup+7CRT26smAqvA9EL0+k0UUjqXtQEKwrPDwXg==
X-Received: by 2002:a17:906:1e4d:b0:ad5:4806:4f07 with SMTP id a640c23a62f3a-ad85b0507dfmr543414666b.2.1748256384962;
        Mon, 26 May 2025 03:46:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------q26XMfnJ0n5CxtIjpnhciyOE"
Message-ID: <c4eac2d2-6cb3-4c3b-8ca6-3b7982893647@gmail.com>
Date: Mon, 26 May 2025 12:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] xen/riscv: dt_processor_hartid() implementation
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com>

This is a multi-part message in MIME format.
--------------q26XMfnJ0n5CxtIjpnhciyOE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/22/25 9:50 AM, Jan Beulich wrote:
> On 21.05.2025 18:03, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/smpboot.c
>> +++ b/xen/arch/riscv/smpboot.c
>> @@ -1,5 +1,8 @@
>>   #include <xen/cpumask.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>>   #include <xen/init.h>
>> +#include <xen/types.h>
>>   #include <xen/sections.h>
> Nit: The latter insertion wants to move one line down. Yet then - isn't
> xen/stdint.h sufficient here?

__be32 used in dt_get_hartid() is defined in xen/types.h.

>
>> @@ -14,3 +17,69 @@ void __init smp_prepare_boot_cpu(void)
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
>> +
>> +    ac = dt_n_addr_cells(cpun);
>> +    cell = dt_get_property(cpun, "reg", &len);
>> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
> Does DT make any guarantees for this multiplication to not overflow?

I haven't tried of DTC checks such things during compilation but considering that
ac value is uin32_t value (according to DT spec) then overflow could really happen.
I will add the following to check an overflow:
     if ( ac > ((sizeof(size_t) * BIT_PER_BYTE) / sizeof(*cell)) )
     {
         printk("%s: overflow detected\n", __func__);
         return ~0UL;
     }

>
>> +        return ~0UL;
>> +
>> +    return dt_read_number(cell, ac);
>> +}
>> +
>> +/*
>> + * Returns the hartid of the given device tree node, or -ENODEV if the node
>> + * isn't an enabled and valid RISC-V hart node.
>> + */
>> +int dt_processor_hartid(const struct dt_device_node *node,
>> +                        unsigned long *hartid)
>> +{
>> +    const char *isa;
>> +    int ret;
>> +
>> +    if ( !dt_device_is_compatible(node, "riscv") )
>> +    {
>> +        printk("Found incompatible CPU\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    *hartid = dt_get_hartid(node);
>> +    if ( *hartid == ~0UL )
>> +    {
>> +        printk("Found CPU without CPU ID\n");
>> +        return -ENODATA;
>> +    }
>> +
>> +    if ( !dt_device_is_available(node))
>> +    {
>> +        printk("CPU with hartid=%lu is not available\n", *hartid);
> Considering that hart ID assignment is outside of our control, would we
> perhaps better (uniformly) log such using %#lx?

It makes sense, DTC when generates dts from dtb also uses hex number, so it could
help to find a failure node faster.

>
>> +        return -ENODEV;
>> +    }
>> +
>> +    if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
>> +    {
>> +        printk("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hartid);
>> +        return ret;
>> +    }
>> +
>> +    if ( isa[0] != 'r' || isa[1] != 'v' )
>> +    {
>> +        printk("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hartid,
>> +               isa);
>> +        return -EINVAL;
> As before -EINVAL is appropriate when input arguments have wrong values.
> Here, however, you found an unexpected value in something the platform
> has presented to you. While not entirely appropriate either, maybe
> -ENODEV again (if nothing better can be found)?

I don't see better candidate.

Interesting if some reserved region exists for user
defined errors.

~ Oleksii

--------------q26XMfnJ0n5CxtIjpnhciyOE
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
    <div class="moz-cite-prefix">On 5/22/25 9:50 AM, Jan Beulich wrote:<br>
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
      <pre wrap="" class="moz-quote-pre">
Nit: The latter insertion wants to move one line down. Yet then - isn't
xen/stdint.h sufficient here?</pre>
    </blockquote>
    <pre>__be32 used in dt_get_hartid() is defined in xen/types.h.

</pre>
    <blockquote type="cite"
      cite="mid:12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
Does DT make any guarantees for this multiplication to not overflow?</pre>
    </blockquote>
    <pre>I haven't tried of DTC checks such things during compilation but considering that
ac value is uin32_t value (according to DT spec) then overflow could really happen.
I will add the following to check an overflow:
    if ( ac &gt; ((sizeof(size_t) * BIT_PER_BYTE) / sizeof(*cell)) )
    {
        printk("%s: overflow detected\n", __func__);
        return ~0UL;
    }

</pre>
    <blockquote type="cite"
      cite="mid:12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
Considering that hart ID assignment is outside of our control, would we
perhaps better (uniformly) log such using %#lx?</pre>
    </blockquote>
    <pre>It makes sense, DTC when generates dts from dtb also uses hex number, so it could
help to find a failure node faster.

</pre>
    <blockquote type="cite"
      cite="mid:12e3ad4c-b7cc-4166-940f-b2301349680c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
As before -EINVAL is appropriate when input arguments have wrong values.
Here, however, you found an unexpected value in something the platform
has presented to you. While not entirely appropriate either, maybe
-ENODEV again (if nothing better can be found)?</pre>
    </blockquote>
    <pre>I don't see better candidate.

Interesting if some reserved region exists for user
defined errors.

~ Oleksii
</pre>
  </body>
</html>

--------------q26XMfnJ0n5CxtIjpnhciyOE--

