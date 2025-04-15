Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C65A89FB5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953955.1348330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gVh-0002YK-KH; Tue, 15 Apr 2025 13:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953955.1348330; Tue, 15 Apr 2025 13:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gVh-0002VB-GY; Tue, 15 Apr 2025 13:39:33 +0000
Received: by outflank-mailman (input) for mailman id 953955;
 Tue, 15 Apr 2025 13:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCo=XB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4gVf-0002V5-Tk
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:39:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dcc457f-19ff-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 15:39:28 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso958810466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:39:29 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1beb11csm1109999866b.64.2025.04.15.06.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 06:39:28 -0700 (PDT)
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
X-Inumbo-ID: 0dcc457f-19ff-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744724369; x=1745329169; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fK7SyMgKxmqBoQE1n+Mki+hP40npFSNhk1l1fK60ss=;
        b=HBRXn8jrPM3FBnoPsuR27ifrThvAyNqg8xP33dHoIYDDsDOSR3Y66aClfjLBHzy+KJ
         tY1KLtqiCoqJ1WUdp6PvL1gog04alNloleL5wUkGP0Pg/ZFd84mqwNcwFnFjacc6HuFw
         ty13VZzvzbaUcC6eeKYHu/dfnTOP2vOMIR69BhiiQNi7D2+aF7QrnEw5+VZS4OgLzPrS
         7y9OZbAHLMUfaag/MS1tTSLUDYpSYeij5A8KCmkKy/tLVeA/x4P/Uo8ZYHu5rMPwLXLZ
         XxCRy4LK/Ai9k9FZzaALajUmgLjLk+Rf5yTLdjO1CA7bnvG/KlT9kUW9x11zk0h4GQL2
         9hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724369; x=1745329169;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8fK7SyMgKxmqBoQE1n+Mki+hP40npFSNhk1l1fK60ss=;
        b=uiou8FaGobV+5iYlmVKUtlsM36d/W3Tz4y+l7/2g3b/z8yKdqQ1d/t13CPuW65fB5c
         zHkmloYVceA8KPghT/F+mlF1wLemqiE3kCfMcNl1+ciFRJ+TWKHgDOgSn9JyNf5hNtaA
         DSBkLKcDDJ18h8YLfLGmzJzAyViiV77PZh4es2Z6coMhsLLXeg86QB69IXJ9jaRsTJ7+
         ubiTfZfhC4+mElqCbyogAyKM8+tgoKYtYX4IwDfNFxzZ//CU3qfZJYLt5BCLzFBtFXTG
         eWNFiuIGr4FjsNVNIlL+2wgaAxJqsdK2MhoCnC+dm4zJ+7iAfBUZtJeysbRhVirYX15D
         F2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCV8wcACiGBq57LWiKcpOnWgYdXxA4vZsQf0ic8zHNdlgcQhCqQG7BkMn9zPhgEQCow6qEfgiqf2agg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXVUwnEciHZxnA6t0qfJb3/cvVk8uxhR5QIfN0iPtqM6kced2u
	NFq9xoepq6wSFWkpcPE2l672orkIvaAmIrA29a+y+NQXz0jnq4ey0ygDWw==
X-Gm-Gg: ASbGnctafogRwzxi6PxWwf10B4KLMPXpJa8VClM7pA2IgKzAzEUKjvhPKv8yVjTbiq5
	qUoJY9dEqm3bVuYsNmAivvXcTcn1IIBccAqUe6sz3MEgnGccW1NhL621TjFs23qk7C6kj/5Hrux
	mnv01mFc6gMJXCtqBRRbE5FtfJzbL9KKTnegQFwFRbqy9KZWAxpBmBhYdkBEQngB10hHJJnTo13
	F4BysZ1+RFYjOvuldjwSE2hxVyOKmVieDEdyiWeTAZ7hwmtRWjYj6z1FifZ2TpElJeVxXo5vJxf
	Ai3TK/5JrHAGTEZaTeAbrGWsRIPaPj//W90AqGVcOPqCM/gsMRRHqI3vDKbTVb9vlkX5vtjUo+r
	7iF++s8a25Zmq3Nuh
X-Google-Smtp-Source: AGHT+IGcvEc4T+aQwF6/f31MGm3tZx045YD/OQRV2wYOG3qNA09VkVqQ5+BlSDH5O9wuB0QGYA11qw==
X-Received: by 2002:a17:907:3da1:b0:ac1:e332:b1f5 with SMTP id a640c23a62f3a-acad36a567amr1466309966b.37.1744724368669;
        Tue, 15 Apr 2025 06:39:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------YKs1CjQbsGPB0Y1NBR0w6uHB"
Message-ID: <d10323b7-d95d-4b96-9bf1-7ae8edda153e@gmail.com>
Date: Tue, 15 Apr 2025 15:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid()
 implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
 <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>

This is a multi-part message in MIME format.
--------------YKs1CjQbsGPB0Y1NBR0w6uHB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/10/25 5:53 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> @@ -13,3 +16,68 @@ void __init smp_clear_cpu_maps(void)
>>       cpumask_set_cpu(0, &cpu_online_map);
>>       cpumask_copy(&cpu_present_map, &cpu_possible_map);
>>   }
>> +
>> +/**
>> + * of_get_cpu_hwid - Get the hardware ID from a CPU device node
>> + *
>> + * @cpun: CPU number(logical index) for which device node is required
>> + * @thread: The local thread number to get the hardware ID for.
>> + *
>> + * Return: The hardware ID for the CPU node or ~0ULL if not found.
>> + */
>> +static uint64_t of_get_cpu_hwid(struct dt_device_node *cpun, unsigned int thread)
> What does the "of" prefix stand for here? Looking at the function body I'm
> really at a loss. (I was first guessing something like OpenFirmware, but
> there's nothing here that would support that.)

I copy this function from Linux kernel. But you are right, "of" means OpenFirmware or
Open Firmware Device Tree and is used for the functions which work with device
tree.
I'll rename to dt_get_cpu_hwid() to follow the naming of device tree's functions
name in Xen.

>
> As you're only fetching data - can cpun be pointer-to-const?

Sure, it can  be. I'll update that.

>
>> +{
>> +    const __be32 *cell;
>> +    int ac;
>> +    uint32_t len;
>> +
>> +    ac = dt_n_addr_cells(cpun);
>> +    cell = dt_get_property(cpun, "reg", &len);
>> +    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
>> +        return ~0ULL;
> I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
> You only pass in 0 below, so it's unclear whether it's what one might expect
> (the thread number on a multi-threaded core).

Based on the DT specification alone, the|`reg`| value could refer to either a CPU or a thread ID:
```
The value of reg is a <prop-encoded-array> that defines a unique CPU/thread id for
the CPU/threads represented by the CPU node. If a CPU supports more than one thread
(i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
per thread.
```

My understanding is that the term/thread/ was used in the Linux kernel to cover both
cases.
When SMT isn't supported, the CPU can be considered to have a single thread.
For example, RISC-V uses the term/hardware thread/ to describe a hart (i.e., a CPU).

Interestingly, the Linux kernel always uses|thread = 0|.

We could potentially drop this ambiguity and introduce an|ASSERT()| to check that
the|`reg`| property contains only one entry, representing the HART (CPU) ID:
```
   Software can determine the number of threads by dividing the size of reg by the parent
   node’s #address-cells. If `|reg`| has more than one entry, it would simply SMT support
   is required.
```

Does that approach make sense, or should we stick with the current implementation?

>
>> +    cell += ac * thread;
>> +    return dt_read_number(cell, ac);
> Nit (you know what)
>
>> +/*
>> + * Returns the hart ID of the given device tree node, or -ENODEV if the node
>> + * isn't an enabled and valid RISC-V hart node.
>> + */
>> +int riscv_of_processor_hartid(struct dt_device_node *node, unsigned long *hart)
> Similar question as above: What's "of" and what significance does the "riscv"
> prefix have in RISC-V code?

I will drop usage of 'of' in Xen and change it to 'dt'.

>
> Const-ness question again for "node".
>
>> +{
>> +    const char *isa;
>> +
>> +    if ( !dt_device_is_compatible(node, "riscv") )
>> +    {
>> +        printk("Found incompatible CPU\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    *hart = (unsigned long) of_get_cpu_hwid(node, 0);
>> +    if ( *hart == ~0UL )
> While for RV64 this won't matter, the difference in types (uint64_t returned,
> unsigned long used) is still puzzling me. What's the deal?

No specific reason, just overlooked that moment. I think we could use just
drop this cast.
The reason for uint64_t as a return type is that dt_read_number() returns
u64.

~ Oleksii

--------------YKs1CjQbsGPB0Y1NBR0w6uHB
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
    <div class="moz-cite-prefix">On 4/10/25 5:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -13,3 +16,68 @@ void __init smp_clear_cpu_maps(void)
     cpumask_set_cpu(0, &amp;cpu_online_map);
     cpumask_copy(&amp;cpu_present_map, &amp;cpu_possible_map);
 }
+
+/**
+ * of_get_cpu_hwid - Get the hardware ID from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ * @thread: The local thread number to get the hardware ID for.
+ *
+ * Return: The hardware ID for the CPU node or ~0ULL if not found.
+ */
+static uint64_t of_get_cpu_hwid(struct dt_device_node *cpun, unsigned int thread)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What does the "of" prefix stand for here? Looking at the function body I'm
really at a loss. (I was first guessing something like OpenFirmware, but
there's nothing here that would support that.)</pre>
    </blockquote>
    <pre>I copy this function from Linux kernel. But you are right, "of" means OpenFirmware or
Open Firmware Device Tree and is used for the functions which work with device
tree.
I'll rename to dt_get_cpu_hwid() to follow the naming of device tree's functions
name in Xen.

</pre>
    <blockquote type="cite"
      cite="mid:65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com">
      <pre wrap="" class="moz-quote-pre">

As you're only fetching data - can cpun be pointer-to-const?</pre>
    </blockquote>
    <pre>Sure, it can  be. I'll update that.

</pre>
    <blockquote type="cite"
      cite="mid:65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    const __be32 *cell;
+    int ac;
+    uint32_t len;
+
+    ac = dt_n_addr_cells(cpun);
+    cell = dt_get_property(cpun, "reg", &amp;len);
+    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) &gt; len) )
+        return ~0ULL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
You only pass in 0 below, so it's unclear whether it's what one might expect
(the thread number on a multi-threaded core).</pre>
    </blockquote>
    <pre>Based on the DT specification alone, the <code data-start="168"
    data-end="173">`reg`</code> value could refer to either a CPU or a thread ID:
```
The value of reg is a &lt;prop-encoded-array&gt; that defines a unique CPU/thread id for
the CPU/threads represented by the CPU node. If a CPU supports more than one thread
(i.e. multiple streams of execution) the reg prop-erty is an array with 1 element
per thread.
```

</pre>
    <pre data-start="498" data-end="783" class="">My understanding is that the term <em
    data-start="532" data-end="540">thread</em> was used in the Linux kernel to cover both
cases.
When SMT isn't supported, the CPU can be considered to have a single thread.
For example, RISC-V uses the term <em data-start="732" data-end="749">hardware thread</em> to describe a hart (i.e., a CPU).</pre>
    <pre data-start="785" data-end="842" class="">Interestingly, the Linux kernel always uses <code
    data-start="829" data-end="841">thread = 0</code>.</pre>
    <pre data-start="844" data-end="1077" class="">We could potentially drop this ambiguity and introduce an <code
    data-start="902" data-end="912">ASSERT()</code> to check that
the <code data-start="931" data-end="936">`reg`</code> property contains only one entry, representing the HART (CPU) ID:
```
  Software can determine the number of threads by dividing the size of reg by the parent
  node’s #address-cells. If `<code data-start="1006" data-end="1011">reg`</code> has more than one entry, it would simply SMT support
  is required.
```
</pre>
    <pre data-start="1079" data-end="1161" class="">Does that approach make sense, or should we stick with the current implementation?</pre>
    <pre>
</pre>
    <blockquote type="cite"
      cite="mid:65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    cell += ac * thread;
+    return dt_read_number(cell, ac);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit (you know what)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Returns the hart ID of the given device tree node, or -ENODEV if the node
+ * isn't an enabled and valid RISC-V hart node.
+ */
+int riscv_of_processor_hartid(struct dt_device_node *node, unsigned long *hart)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Similar question as above: What's "of" and what significance does the "riscv"
prefix have in RISC-V code?</pre>
    </blockquote>
    <pre>I will drop usage of 'of' in Xen and change it to 'dt'.

</pre>
    <blockquote type="cite"
      cite="mid:65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com">
      <pre wrap="" class="moz-quote-pre">

Const-ness question again for "node".

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+    const char *isa;
+
+    if ( !dt_device_is_compatible(node, "riscv") )
+    {
+        printk("Found incompatible CPU\n");
+        return -ENODEV;
+    }
+
+    *hart = (unsigned long) of_get_cpu_hwid(node, 0);
+    if ( *hart == ~0UL )
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While for RV64 this won't matter, the difference in types (uint64_t returned,
unsigned long used) is still puzzling me. What's the deal?</pre>
    </blockquote>
    <pre>No specific reason, just overlooked that moment. I think we could use just
drop this cast.
The reason for uint64_t as a return type is that dt_read_number() returns
u64.

~ Oleksii</pre>
  </body>
</html>

--------------YKs1CjQbsGPB0Y1NBR0w6uHB--

