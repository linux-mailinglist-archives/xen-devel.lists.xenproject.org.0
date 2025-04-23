Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E4A988D4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964485.1355268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YXB-00059c-JV; Wed, 23 Apr 2025 11:44:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964485.1355268; Wed, 23 Apr 2025 11:44:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YXB-00057P-GH; Wed, 23 Apr 2025 11:44:57 +0000
Received: by outflank-mailman (input) for mailman id 964485;
 Wed, 23 Apr 2025 11:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2fPp=XJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7YXA-00057J-6a
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:44:56 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fcaf598-2038-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:44:54 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso4563507f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 04:44:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4235dasm18255320f8f.9.2025.04.23.04.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 04:44:53 -0700 (PDT)
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
X-Inumbo-ID: 5fcaf598-2038-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745408694; x=1746013494; darn=lists.xenproject.org;
        h=in-reply-to:cc:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OwfRjMYa452uCClC1ymZbA+Z8NQTGYKihwb4cC4LIE=;
        b=ggsM8+gI7ih7W7Y81RMRX34Xl8JvR7iRHkf5vCKP+Qhm0t09JmBoqkEpUz1qMDZXEh
         WS/udUXjltb2OZIGtZVyUxCsjAMuPjmd9U/Act19wlO5JT/BY7If0A4ODAOkq19yP7ub
         hj4sZKM3A/Snc3iCBu2RzJtI/0hqV/0tc5kVNkM/JhzYWfNVb9EIy6JSTRacwROY5goz
         Yv2IEj6/GEYK+Rusu2SCJJR+LYcjqTGfCBTRL+glU0mkO3sjeo0/Gv3+eLd10WQcFxy5
         KCcHE9OVPIODsRkfU+faqo3WnItsCG67siegOWkbrDoGh0GeE8DXT+BSvUJXXxk3UhAr
         0pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745408694; x=1746013494;
        h=in-reply-to:cc:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0OwfRjMYa452uCClC1ymZbA+Z8NQTGYKihwb4cC4LIE=;
        b=MYVPdzrTrhK0ht1Ld0FLM9TM4+g+VnXfwXvQ8EBj3Yf9p9n9ZpQJVbtmAHtQMtobjo
         9XdZbA1glIwvzdRdd1O3Fb1e7/QsK+AaSxF1NCFZ9J7YUc98dJBxekC2T6FVQMtVakga
         KJxg6sMFkgJw3th6lVvF6n3MohRZZC34Xe4ZQeqxKtwhDW0ER+AaLsNQpT2CkLRmwBnt
         61UQZiN3ZKsZlN3Ky7iaJB6sS85uUTQ/iictaPjJItfSlR01ZRwySYgDNO/HTknrj7wG
         c8/UWTVRtLXW8ZSR3LVhB9LdF1qT9TpzZM5Y7YczxrHj4x9Ax1sWi+x/UvLnqxC04rMa
         IrAQ==
X-Gm-Message-State: AOJu0Ywr0QTkmkuZ1EhDLcxVlNzZliAw0dqkKS2f7+v7I2qeQyZGag4m
	2JHjDFNGHAFPG8pBeL0Y/38as9ghsvIShDwGeJubZdt1zU48Zcdw
X-Gm-Gg: ASbGncvSf5ftGhzvZA5GlcRT+NZCAwYFQn4/8o5iNyFCzwgqs38304c9rPGYL6Q3vuG
	pGqPU5cCpR66p3GM2I6UsYpHr9G5W9/uy2FieRMXumGmZDgoZXjA+08I2upUAvLAqo6SrlUOYbx
	l1UaHgq8YZdaodAtdNfX0G4cPIIkkzBEO+OHAmmmdoKRNvI3ZcB1TOmE0lwCClVnSbwESLfQJ6b
	MIxXt2f0p11rYB5K5NRKUIU6FmwKiuPlb0yndqWageAHfLZQqriKo7v/h2pv+j4D7xiopk0RDSq
	QiyIbmA6lhCj8M2Y+PCKN/wHw853mWRZ1qlnkVX6uAwHQPLZ8HbZXGP5rNCdMomXEM8ENbRY/VL
	WvNnLuKkisUg5cISZ
X-Google-Smtp-Source: AGHT+IHQyRJxDsMU31Np6X5TCpsCU3S7NTlECBZl7GNx0uqxGovWx+1sKqSnt/Q/6PNdpMWf/G6kOw==
X-Received: by 2002:a05:6000:1a8d:b0:399:71d4:a9 with SMTP id ffacd0b85a97d-39efbb05e76mr14986879f8f.52.1745408693881;
        Wed, 23 Apr 2025 04:44:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------OrBOZ4ftxDt0AfC0M38iDzUz"
Message-ID: <7a31ab0b-fcd1-405b-919b-3519d8203c39@gmail.com>
Date: Wed, 23 Apr 2025 13:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/14] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <09e0fcd64f97062441a68102ead520b818150fe9.1744126720.git.oleksii.kurochko@gmail.com>
 <78fa2ed0-57a2-4990-bc9c-8fa52e41420a@suse.com>
 <aadd8ccf-94f4-407e-8510-3640c6d43b31@gmail.com>
 <9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com>

This is a multi-part message in MIME format.
--------------OrBOZ4ftxDt0AfC0M38iDzUz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/16/25 8:31 AM, Jan Beulich wrote:
>>>> +    }
>>>> +
>>>> +    imsic_cfg.base_addr = base_addr;
>>>> +    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
>>>> +                   imsic_cfg.hart_index_bits +
>>>> +                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
>>>> +    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
>>>> +                   imsic_cfg.group_index_shift);
>>> Besides indentation being bogus here, why is it that you need to mask bits
>>> off of the value read from DT? Wouldn't the expectation be that you get back
>>> the true base address?
>> The group index is used to differentiate between clusters/groups. For
>> example, consider two clusters: - Cluster 1 with cpu0 and cpu1 - Cluster
>> 2 with cpu2 and cpu3 Then, the reg property in the IMSIC node will
>> include two entries: reg = <0x0 0xd100000 0x0 0x20000>, <0x0 0x2d100000
>> 0x0 0x20000>; riscv,guest-index-bits = <3>; riscv,hart-index-bits = <2>;
>> riscv,group-index-bits = <1>; riscv,group-index-shift = <29>; In this
>> example: The group index is 1 bit wide (group-index-bits = <1>), It is
>> located at bit 29 (group-index-shift = <29>) of the address.
>>
>> so imsic_cfg.group_index_bits will be used to distinguish clusters, but
>> they must have
>>
>> the same base address and this is the reason why the mask is applied.
> Well, yes, but that doesn't answer my question. All of what you say makes
> sense for the loop elsewhere retrieving all the addresses. Here you
> retrieved only the first of them, and in your example no masking would be
> needed here either. To re-phrase my question: Can the address observed in
> the first entry be other than the lowest one across the set of all
> entries?

It doesn't mentioned explicitly in riscv,imsiscs binding that reg property
is sorted.
I can write:
   reg = <0x0 0x2d100000 0x0 0x20000>,<0x0 0xd100000 0x0 0x20000>;
And a dtc compiler will compile.

> If not, can there be bits set across all entries that need
> masking off from all of them?

I think that other bits (Hart Index and Guest Index) excepts base address
bits are 0 in dts, but it doesn't guarantee explicitly by IMSIC's dts bindinding.

>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/include/asm/imsic.h
>>>> @@ -0,0 +1,66 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +
>>>> +/*
>>>> + * xen/arch/riscv/imsic.h
>>>> + *
>>>> + * RISC-V Incoming MSI Controller support
>>>> + *
>>>> + * (c) 2023 Microchip Technology Inc.
>>>> + */
>>>> +
>>>> +#ifndef ASM__RISCV__IMSIC_H
>>>> +#define ASM__RISCV__IMSIC_H
>>>> +
>>>> +#include <xen/types.h>
>>>> +
>>>> +#define IMSIC_MMIO_PAGE_SHIFT   12
>>>> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
>>>> +
>>>> +#define IMSIC_MIN_ID            63
>>>> +#define IMSIC_MAX_ID            2048
>>>> +
>>>> +struct imsic_msi {
>>>> +    paddr_t base_addr;
>>>> +    unsigned long offset;
>>>> +};
>>>> +
>>>> +struct imsic_mmios {
>>>> +    paddr_t base_addr;
>>>> +    unsigned long size;
>>>> +    bool harts[NR_CPUS];
>>> An array of bool - won't a bitmap do here? Even then I wouldn't be overly
>>> happy to see it dimensioned by NR_CPUS.
>> Bitmap will fit here well. But for DECLARE_BITMAP() is necessary the size
>> of bitmap so NR_CPUS should be used again.
>> Could you please remind me why it isn't good to use it?
>> Because NR_CPUS not always equal to an amount of physical cpus?
> "Not equal" wouldn't be overly problematic. But NR_CPUS=4000 and the actual
> number of CPUs being 4 would be wasteful in general. More when its wider
> than a bit that's needed per CPU, but where would you draw the line if you
> permitted use of NR_CPUS here?

Hard to say. It seems it will be just better to use apporoach you suggested below.

Thanks.

~ Oleksii

>
>> Should I use non-static version of bitmap declaration? (if we have such...)
> That's simply "unsigned long *" then, or - at the tail of a dynamically
> allocated struct - possibly unsigned long[].
>
>>>> +};
>>>> +
>>>> +struct imsic_config {
>>>> +    /* base address */
>>>> +    paddr_t base_addr;
>>>> +
>>>> +    /* Bits representing Guest index, HART index, and Group index */
>>>> +    unsigned int guest_index_bits;
>>>> +    unsigned int hart_index_bits;
>>>> +    unsigned int group_index_bits;
>>>> +    unsigned int group_index_shift;
>>>> +
>>>> +    /* imsic phandle */
>>>> +    unsigned int phandle;
>>>> +
>>>> +    /* number of parent irq */
>>>> +    unsigned int nr_parent_irqs;
>>>> +
>>>> +    /* number off interrupt identities */
>>>> +    unsigned int nr_ids;
>>>> +
>>>> +    /* mmios */
>>>> +    unsigned int nr_mmios;
>>>> +    struct imsic_mmios *mmios;
>>>> +
>>>> +    /* MSI */
>>>> +    struct imsic_msi msi[NR_CPUS];
>>> You surely can avoid wasting perhaps a lot of memory by allocating this
>>> based on the number of CPUs in use?
>> It make sense. I'll allocate then this dynamically.
> Or, as per above, when put at the tail and the struct itself is
> dynamically allocated, use struct imsic_msi[]. We even have dedicated
> xmalloc() flavors for this kind of allocation.
>
> Jan
--------------OrBOZ4ftxDt0AfC0M38iDzUz
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
    <div class="moz-cite-prefix">On 4/16/25 8:31 AM, Jan Beulich wrote:</div>
    <blockquote type="cite"
      cite="mid:9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    }
+
+    imsic_cfg.base_addr = base_addr;
+    imsic_cfg.base_addr &amp;= ~(BIT(imsic_cfg.guest_index_bits +
+                   imsic_cfg.hart_index_bits +
+                   IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
+    imsic_cfg.base_addr &amp;= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) &lt;&lt;
+                   imsic_cfg.group_index_shift);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Besides indentation being bogus here, why is it that you need to mask bits
off of the value read from DT? Wouldn't the expectation be that you get back
the true base address?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
The group index is used to differentiate between clusters/groups. For 
example, consider two clusters: - Cluster 1 with cpu0 and cpu1 - Cluster 
2 with cpu2 and cpu3 Then, the reg property in the IMSIC node will 
include two entries: reg = &lt;0x0 0xd100000 0x0 0x20000&gt;, &lt;0x0 0x2d100000 
0x0 0x20000&gt;; riscv,guest-index-bits = &lt;3&gt;; riscv,hart-index-bits = &lt;2&gt;; 
riscv,group-index-bits = &lt;1&gt;; riscv,group-index-shift = &lt;29&gt;; In this 
example: The group index is 1 bit wide (group-index-bits = &lt;1&gt;), It is 
located at bit 29 (group-index-shift = &lt;29&gt;) of the address.

so imsic_cfg.group_index_bits will be used to distinguish clusters, but 
they must have

the same base address and this is the reason why the mask is applied.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, yes, but that doesn't answer my question. All of what you say makes
sense for the loop elsewhere retrieving all the addresses. Here you
retrieved only the first of them, and in your example no masking would be
needed here either. To re-phrase my question: Can the address observed in
the first entry be other than the lowest one across the set of all
entries? </pre>
    </blockquote>
    <pre>It doesn't mentioned explicitly in riscv,imsiscs binding that reg property
is sorted. 
I can write:
  reg = &lt;0x0 0x2d100000 0x0 0x20000&gt;,&lt;0x0 0xd100000 0x0 0x20000&gt;;
And a dtc compiler will compile.

</pre>
    <blockquote type="cite"
      cite="mid:9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com">
      <pre wrap="" class="moz-quote-pre">If not, can there be bits set across all entries that need
masking off from all of them?</pre>
    </blockquote>
    <pre>I think that other bits (Hart Index and Guest Index) excepts base address
bits are 0 in dts, but it doesn't guarantee explicitly by IMSIC's dts bindinding.

</pre>
    <blockquote type="cite"
      cite="mid:9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/imsic.h
+ *
+ * RISC-V Incoming MSI Controller support
+ *
+ * (c) 2023 Microchip Technology Inc.
+ */
+
+#ifndef ASM__RISCV__IMSIC_H
+#define ASM__RISCV__IMSIC_H
+
+#include &lt;xen/types.h&gt;
+
+#define IMSIC_MMIO_PAGE_SHIFT   12
+#define IMSIC_MMIO_PAGE_SZ      (1UL &lt;&lt; IMSIC_MMIO_PAGE_SHIFT)
+
+#define IMSIC_MIN_ID            63
+#define IMSIC_MAX_ID            2048
+
+struct imsic_msi {
+    paddr_t base_addr;
+    unsigned long offset;
+};
+
+struct imsic_mmios {
+    paddr_t base_addr;
+    unsigned long size;
+    bool harts[NR_CPUS];
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">An array of bool - won't a bitmap do here? Even then I wouldn't be overly
happy to see it dimensioned by NR_CPUS.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Bitmap will fit here well. But for DECLARE_BITMAP() is necessary the size
of bitmap so NR_CPUS should be used again.
Could you please remind me why it isn't good to use it?
Because NR_CPUS not always equal to an amount of physical cpus?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
"Not equal" wouldn't be overly problematic. But NR_CPUS=4000 and the actual
number of CPUs being 4 would be wasteful in general. More when its wider
than a bit that's needed per CPU, but where would you draw the line if you
permitted use of NR_CPUS here?</pre>
    </blockquote>
    <pre>Hard to say. It seems it will be just better to use apporoach you suggested below.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Should I use non-static version of bitmap declaration? (if we have such...)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's simply "unsigned long *" then, or - at the tail of a dynamically
allocated struct - possibly unsigned long[].

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+};
+
+struct imsic_config {
+    /* base address */
+    paddr_t base_addr;
+
+    /* Bits representing Guest index, HART index, and Group index */
+    unsigned int guest_index_bits;
+    unsigned int hart_index_bits;
+    unsigned int group_index_bits;
+    unsigned int group_index_shift;
+
+    /* imsic phandle */
+    unsigned int phandle;
+
+    /* number of parent irq */
+    unsigned int nr_parent_irqs;
+
+    /* number off interrupt identities */
+    unsigned int nr_ids;
+
+    /* mmios */
+    unsigned int nr_mmios;
+    struct imsic_mmios *mmios;
+
+    /* MSI */
+    struct imsic_msi msi[NR_CPUS];
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">You surely can avoid wasting perhaps a lot of memory by allocating this
based on the number of CPUs in use?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It make sense. I'll allocate then this dynamically.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Or, as per above, when put at the tail and the struct itself is
dynamically allocated, use struct imsic_msi[]. We even have dedicated
xmalloc() flavors for this kind of allocation.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------OrBOZ4ftxDt0AfC0M38iDzUz--

