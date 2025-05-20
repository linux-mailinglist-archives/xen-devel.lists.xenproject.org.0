Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219ECABDDB5
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990850.1374779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOFs-0002E0-1R; Tue, 20 May 2025 14:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990850.1374779; Tue, 20 May 2025 14:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOFr-0002BB-Tq; Tue, 20 May 2025 14:47:43 +0000
Received: by outflank-mailman (input) for mailman id 990850;
 Tue, 20 May 2025 14:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHOFq-0002B5-Ai
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:47:42 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61791ca1-3589-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 16:47:41 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-601dd3dfc1fso5117602a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:47:41 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e745fsm7438020a12.48.2025.05.20.07.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:47:39 -0700 (PDT)
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
X-Inumbo-ID: 61791ca1-3589-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747752460; x=1748357260; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrhiPc8Ka/ZtSTSLuKC5MJ6q3OZ5I/K5zPd8dWqr9gg=;
        b=eX+8q1gitaa0LwU+691FfjtB+cEDrxlKg8in+BZ5bgCBSsg4PR+vnjVImLXPxUyvq0
         dGoR4xoVxLiNmQmRysojZbVzO//41reARRJy3Q6c3k0ZaMXCIMFXY7IwnJXZfYd61Bbj
         0K4vtRV8jwD23cENgiC9pT5Vp7XRCZUfLxlBQulqJOfTFjIMFxButORA7dv7UAMr1kwY
         b1/FEDtXj2sSdwCfYIePXq7PhkQjO9j2l38ocnCWfzh7Jfsd7D91ZXA2tt8rnJYvkcF8
         3t+HlYqLVcBhxe1QxvLtNmAG9YvJ0ApMS/8jgjFhC8ST1HtPLaAjJ/H4W7DrJP57OSVE
         D5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752460; x=1748357260;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mrhiPc8Ka/ZtSTSLuKC5MJ6q3OZ5I/K5zPd8dWqr9gg=;
        b=A4Y81ptczoO5hlwuEhg2THBj4O0zvvAeGd7RQC6IchDV6KYTSK7cgSdD+5XdRvQXfB
         jlN/tF730LRzWBevg4z4Sikaksdh+xcLmTHJeigC7rLLEs8NMbqj4whB5HmkIUutrzv0
         3TQLfWSFK5wWDNOo0R/LdX/xlvJ74aMvX6b9FOf9rnnSi45mNWZcmzZfiNWMtufx5dfe
         hwWCCc3lpwnT1ENqPCx0WNaHhJZXnYTrAg0W24Kvjge/EV5V4ASs5c3aemuI0b7YMjWe
         3rfA8dU7XuzIRhmVLGItXXdW8qff3YIb7EQnuCkzyfSIq1NR+b+qA+++OY5+c1bb+54G
         YorA==
X-Forwarded-Encrypted: i=1; AJvYcCXN6KMA6QcU0+YMJ/GulbU+vpbIq7rjAkMMyZVAO8mzY+3m3w64roKBJ8cS7njV6Z+sXyG0VYRYy68=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0s5XvTrrXeDDb1f0vqQlJv1bIkNCl0G8I+jmRQVCpM4CbmXIv
	F5h15RLAFYsQXlIvze8gev5nH3zmRjao8HJ9JI9lOrxmdo+Zrpyfow2J
X-Gm-Gg: ASbGncsWN0oG3AXTteXmzIcLbXdNqEbm54W3P59weIX1+gc9+92EuhGZHV2n4avwpqI
	LdSAAJ+OZvcrUsGkKiHXPkD/ZD8jMJdt7N5722uLtHqVVz0WG73bEpslkYR3hG4ITkusyMQTc6s
	A2RGJsDzwZNwu9YfN0N7h/g+qqp3piPbAAv3xltP0kVnrZ0rWTSIBHdw9DJm+ekWSeCGegWU7Ha
	ozrLBpn+1Gkg7qIYtqrLBDuzlX0G+QGRCwZxNVVBmMpRfmpPH8vS0i66ukSVHsvI0Wq2n4oYO3U
	jxlxzZhWpbxHwCC/Cx5lrmsquY21S9MI5SG0nroTbmzQZO3MZgZGQMXorI18bPqem2JESNcahRQ
	Rxj3ciNFB1aNQeHCPmdM3iknY
X-Google-Smtp-Source: AGHT+IHBCNIQos0MD5pcbzVkGAMgT1mkz0PmAchHufnOE77GzQmmk+VgkZcKHZjK6JZy7d3Ths+pDg==
X-Received: by 2002:a05:6402:51c9:b0:600:1167:7333 with SMTP id 4fb4d7f45d1cf-60114099a62mr13465221a12.10.1747752460179;
        Tue, 20 May 2025 07:47:40 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------qNkDgV45ys52CSppKkGk0Cz6"
Message-ID: <84a12bd8-bf55-4dca-8f9b-38ff6f5547d3@gmail.com>
Date: Tue, 20 May 2025 16:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
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
 <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
 <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>
 <52c0be11-7c8e-4e12-9005-3a7ca7f12c43@gmail.com>
 <81c9f5f5-b5bb-4f3b-9993-dfca54f212c5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <81c9f5f5-b5bb-4f3b-9993-dfca54f212c5@suse.com>

This is a multi-part message in MIME format.
--------------qNkDgV45ys52CSppKkGk0Cz6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/25 8:32 PM, Jan Beulich wrote:
> On 19.05.2025 17:19, Oleksii Kurochko wrote:
>> On 5/15/25 10:42 AM, Jan Beulich wrote:
>>> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/include/asm/imsic.h
>>>> @@ -0,0 +1,65 @@
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
>>> This isn't the "minimum ID", but the "minimum permissible number of IDs" as per
>>> its first use in imsic_parse_node(). Further uses there consider it a mask,
>>> which makes me wonder whether the imsic_cfg.nr_ids field name is actually
>>> correct: Isn't this the maximum valid ID rather than their count/number?
>> imsic_cfg.nr_ids it is a value of interrupt identities supported by IMSIC interrupt file according to
>> DT binding:
>>     riscv,num-ids:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       minimum: 63
>>       maximum: 2047
>>       description:
>>         Number of interrupt identities supported by IMSIC interrupt file.
> Unless this count accounts for 0 being invalid (and hence isn't counted), I'm
> still confused: With the maximum value this would mean 2046 is still valid,
> but 2047 isn't anymore. When normally such a boundary would be at an exact
> power of 2, i.e. between 2047 and 2048 here.

2047 is inclusive according to the AIA spec:
   The number of interrupt identities supported by an interrupt file
   (and hence the number of active bits in each array) is one less than a multiple
   of 64, and may be a minimum of 63 and a maximum of 2047.
   ...
   When an interrupt file supports N distinct interrupt identities,
   valid identity numbers are between 1 and N inclusive.
   The identity numbers within this range are said to be implemented by the interrupt
   file; numbers outside this range are not implemented.
   The number zero is never a valid interrupt identity. Identity 0 is just ignored.

It is still  not a power of two but it was the AIA spec tells us.

Also, this maximum identity number of 2047 is consistent with related fields like
the EIID (External Interrupt Identity) field used in APLICs when forwarding MSIs,
which specifies the MSI data value that becomes the minor identity at the target
hart's interrupt file.
The EIID field is typically an 11-bit field, able to hold values from 0 through
2047.
Since identity 0 is invalid, the entire range of valid identity numbers (1-2047)
fits within the values representable by an 11-bit field.

~ Oleksii

--------------qNkDgV45ys52CSppKkGk0Cz6
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
    <div class="moz-cite-prefix">On 5/19/25 8:32 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:81c9f5f5-b5bb-4f3b-9993-dfca54f212c5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 19.05.2025 17:19, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 5/15/25 10:42 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/include/asm/imsic.h
@@ -0,0 +1,65 @@
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
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This isn't the "minimum ID", but the "minimum permissible number of IDs" as per
its first use in imsic_parse_node(). Further uses there consider it a mask,
which makes me wonder whether the imsic_cfg.nr_ids field name is actually
correct: Isn't this the maximum valid ID rather than their count/number?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
imsic_cfg.nr_ids it is a value of interrupt identities supported by IMSIC interrupt file according to
DT binding:
   riscv,num-ids:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 63
     maximum: 2047
     description:
       Number of interrupt identities supported by IMSIC interrupt file.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Unless this count accounts for 0 being invalid (and hence isn't counted), I'm
still confused: With the maximum value this would mean 2046 is still valid,
but 2047 isn't anymore. When normally such a boundary would be at an exact
power of 2, i.e. between 2047 and 2048 here.</pre>
    </blockquote>
    <pre>2047 is inclusive according to the AIA spec:
  The number of interrupt identities supported by an interrupt file
  (and hence the number of active bits in each array) is one less than a multiple
  of 64, and may be a minimum of 63 and a maximum of 2047.
  ...
  When an interrupt file supports N distinct interrupt identities,
  valid identity numbers are between 1 and N inclusive.
  The identity numbers within this range are said to be implemented by the interrupt
  file; numbers outside this range are not implemented.
  The number zero is never a valid interrupt identity. Identity 0 is just ignored.

It is still  not a power of two but it was the AIA spec tells us.
<pre>Also, this maximum identity number of 2047 is consistent with related fields like
the EIID (External Interrupt Identity) field used in APLICs when forwarding MSIs,
which specifies the MSI data value that becomes the minor identity at the target
hart's interrupt file.
The EIID field is typically an 11-bit field, able to hold values from 0 through
2047.
Since identity 0 is invalid, the entire range of valid identity numbers (1-2047)
fits within the values representable by an 11-bit field.

~ Oleksii
</pre></pre>
  </body>
</html>

--------------qNkDgV45ys52CSppKkGk0Cz6--

