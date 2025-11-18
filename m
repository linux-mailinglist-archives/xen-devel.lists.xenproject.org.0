Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5566C685E8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 09:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164539.1491478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLHWJ-00042L-Ii; Tue, 18 Nov 2025 08:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164539.1491478; Tue, 18 Nov 2025 08:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLHWJ-000404-Em; Tue, 18 Nov 2025 08:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1164539;
 Tue, 18 Nov 2025 08:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kq2N=52=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vLHWH-0003zy-Uy
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 08:57:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a3d6027-c45c-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 09:56:58 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b735ce67d1dso661401366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 00:56:58 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4494sm1287601866b.18.2025.11.18.00.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 00:56:57 -0800 (PST)
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
X-Inumbo-ID: 8a3d6027-c45c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763456218; x=1764061018; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLWZ4rG1BBsu7bzuls5xG0wvC3sQQZKjsfWhy8f9ZOg=;
        b=SEQBblNkvCp7ClpgSmr88ovCz5DTf6Fn1NfiW+NFN/1o+D5BVqKfG742QJhz3OflGA
         UGLj4t8PF0vMQtJO9TxyrgMaynvRNlNQwWfod0YURIuprYr2lTlhQ/3tpMCx9vt2uTRP
         TUf9pP9cfMW7gv5yRhVTXEpgOwlVVpwPMFy/cnu8BHO6nlu+XvzujgnOzPpk7V5BKble
         emgX3KxxCNNTTZBngSc6D1euAxCuwZq5t0xE+v3XGYfGRP7o8OTqfNGGMCHehw/BUwrJ
         uy+SIK53BhHlBXYvp7Fh6Qy8M9OQLKsveBEOnyyjxY/7LExbNSOhl0yVBEyqF0kwDyD1
         IIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456218; x=1764061018;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLWZ4rG1BBsu7bzuls5xG0wvC3sQQZKjsfWhy8f9ZOg=;
        b=ncIOZgTfDViA/nSBdOa8cXqP80J2T91LIikzVtG2NDXjZ76L7J0BhKyirurZftu9Uv
         eGKCwK0H7NQc3btTko8Tsl9yI2qJaeMkUN7+GT7BbgiGyXoGPUdSZucN6fkFcSsxmjTT
         D6qM0fsGBgqK2mQt9i4O7hOkhwAFmS4sd6Kc2OVewrAwPkGQUo3jakrd1YowQZaJjBpZ
         oTAviEzjKQ+SjWa1V+atmoq+VSORjjj91/59e5slpDtoJAZR2/39NS2VwWLOfDiwPlgr
         CGmMUr3huo9LRErI1i4LtozeNlZALnWJmUNJq95zU0rzW7KAk/cb45mFnwkzbMr6UJRC
         BZYw==
X-Forwarded-Encrypted: i=1; AJvYcCVGZDVj6wSgQu30BxTxv5zzWS0BJkMe7VgDrcIiPKlhNdKvYsqbUGZdq1xPin5bvz9ObdTctQEkrBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLqhk92erd5MCDh+KlaIzj5YkbKoBAfWH/HAFK5eEGqkcfYggu
	ayzACVZ1ZstChQjnZEp+XINLSIvwZQpOb2SDCrxRn9SNYTZSaocFV+1G
X-Gm-Gg: ASbGnctbhW9BLkFTndnFYnGNpzA2gmLufeh8n6POr4GgBiYGb8pRMqHMVrVWvb24DZa
	bRleuWnSfRADg+4h8nFLRRXCnvxElFxJroM+R7KYUvmgPRPHP2ssJGumHdOwtX4NQufr0D44+62
	cgOiYSqdDIRaZmtjnhgfPmRQviq+1PgcQi/hz2q3m4hSwwYqy9Fd0fHoyuZTw7n2Vg2lPfO/lmB
	LIWpCHPqOXCmjI8XBF+hV6t210O/8gR/+9HW+NFTiq87JQL5Y6Fat8SB6mGfJ0qWExMqD9ld6xs
	jIf2+8TQlx6UkckgVzukivMAJPuvkS4LHmYH2sMiZO/SSy9mt/7WjRT6V6RSiJ1bKTeijKf5YfR
	UVVhoevwQDKyp+QC4Tm81yf6oJW9xtAzxwsBsZoyMrL5vsEjdZ24HCaste/9X3/r+nvSr7dWk0V
	RGuniKBx0LM7otsg3TrG+7oJgb0weU29IU6aoYi46LZEn7aNDvAHyjNmoVvlE2
X-Google-Smtp-Source: AGHT+IFXZKEKolVLtNZ9iEIDNwXJpc0pKhaF2frOtNipRj4MOoiZH0jAqGAL7dTWk8An6pLXSk2Uig==
X-Received: by 2002:a17:907:d02:b0:b73:6d56:f3f4 with SMTP id a640c23a62f3a-b736d573e3dmr1480844966b.30.1763456217629;
        Tue, 18 Nov 2025 00:56:57 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------6cqP0ZzIK3gNLLxs3hU2C00n"
Message-ID: <e0aea302-00ba-426b-b65d-c616656f6836@gmail.com>
Date: Tue, 18 Nov 2025 09:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 01/18] xen/riscv: detect and initialize G-stage mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <2b21348b3300c741b276a47d5942e71d306846eb.1760974017.git.oleksii.kurochko@gmail.com>
 <8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com>
 <6938d333-816d-49f8-9945-db9d4b17f1f1@gmail.com>
 <7d81564c-d7c0-47f4-9f2c-bf4508a0a870@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7d81564c-d7c0-47f4-9f2c-bf4508a0a870@suse.com>

This is a multi-part message in MIME format.
--------------6cqP0ZzIK3gNLLxs3hU2C00n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/13/25 5:32 PM, Jan Beulich wrote:
> On 13.11.2025 17:18, Oleksii Kurochko wrote:
>> On 11/6/25 2:43 PM, Jan Beulich wrote:
>>> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>>>> Changes in V5:
>>>>    - Add static and __initconst for local variable modes[] in
>>>>      gstage_mode_detect().
>>>>    - Change type for gstage_mode from 'unsigned long' to 'unsigned char'.
>>>>    - Update the comment inisde defintion if modes[] variable in
>>>>      gstage_mode_detect():
>>>>      - Add information about Bare mode.
>>>>      - Drop "a paged virtual-memory scheme described in Section 10.3" as it isn't
>>>>        relevant here.
>>>>    - Drop printing of function name when chosen G-stage mode message is printed.
>>>>    - Drop the call of gstage_mode_detect() from start_xen(). It will be added into
>>>>      p2m_init() when the latter will be introduced.
>>> Well, thanks, but ...
>>>
>>>>    - Introduce pre_gstage_init().
>>> ... the same comment that I gave before now applies here: This doesn't look to
>>> belong directly in start_xen(). In x86'es terms I'd say this is a tiny part of
>>> paging_init().
>> Does it only the question of function naming now?
> Not just, no. My point is that you shouldn't pollute start_xen() with calls to
> dozens of special-purpose functions. There wants to be one call dealing with
> everything guest-mm related, I think.

I think I understand your point now. I’ll introduce|guest_mm_init()| and move
everything related to it inside that function (at the moment, this includes
the VMID initialization and G-stage mode detection).

>
>> IMO, ideally it would be nice to have it in p2m_init(), but there is no a lot of
>> sense to detect supported modes each time a domain is constructed. And it is the
>> reason why I put directly to start_xen().
> No per-domain function wants to be used for this, I agree. Hence why I pointed
> you at x86'es paging_init().
>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/p2m.c
>>>> @@ -0,0 +1,96 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +
>>>> +#include <xen/init.h>
>>>> +#include <xen/lib.h>
>>>> +#include <xen/macros.h>
>>>> +#include <xen/sections.h>
>>>> +
>>>> +#include <asm/csr.h>
>>>> +#include <asm/flushtlb.h>
>>>> +#include <asm/riscv_encoding.h>
>>>> +
>>>> +unsigned char __ro_after_init gstage_mode;
>>>> +
>>>> +static void __init gstage_mode_detect(void)
>>>> +{
>>>> +    static const struct {
>>>> +        unsigned char mode;
>>>> +        unsigned int paging_levels;
>>>> +        const char name[8];
>>>> +    } modes[] __initconst = {
>>>> +        /*
>>>> +         * Based on the RISC-V spec:
>>>> +         *   Bare mode is always supported, regardless of SXLEN.
>>>> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
>>>> +         *   When SXLEN=64, three paged virtual-memory schemes are defined:
>>>> +         *   Sv39, Sv48, and Sv57.
>>>> +         */
>>>> +#ifdef CONFIG_RISCV_32
>>>> +        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
>>>> +#else
>>>> +        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
>>>> +        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
>>>> +        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
>>>> +#endif
>>>> +    };
>>>> +
>>>> +    unsigned int mode_idx;
>>>> +
>>>> +    gstage_mode = HGATP_MODE_OFF;
>>> Why is this not the variable's initializer?
>> Good point. It should be the variable's initializer.
>>
>>>> +    for ( mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )
>>>> +    {
>>>> +        unsigned long mode = modes[mode_idx].mode;
>>>> +
>>>> +        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
>>>> +
>>>> +        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
>>>> +        {
>>>> +            gstage_mode = mode;
>>>> +            break;
>>>> +        }
>>>> +    }
>>> I take it that using the first available mode is only transient. To support bigger
>>> guests, you may need to pick 48x4 or even 57x4 no matter that 39x4 is available.
>> I considered traversing the|modes[]| array in the opposite order so that the largest
>> mode would be checked first. However, I decided that 39x4 is sufficiently large and
>> provides a good balance between the number of page tables and supported address
>> space, at least for now.
>>
>>> I wonder whether you wouldn't be better off recording all supported modes right
>>> away.
>> What would be the use case for recording and storing all supported modes?
>> For example, would it be used to indicate which mode is preferable for a guest
>> domain via the device tree?
> Why device tree? That's what's exposed to guests, isn't it? Here we talk about
> what Xen uses to run guests. And that can vary from guest to guest.

At the same time, the bootloader also passes a device tree to Xen, and Xen
uses it, at least—to determine the RAM addresses and sizes. I also referred to
device tree because it can indicate the largest MMU mode supported on a hart:
   mmu-type:
     description:
       Identifies the largest MMU address translation mode supported by
       this hart.  These values originate from the RISC-V Privileged
       Specification document, available from
       https://riscv.org/specifications/
     $ref: /schemas/types.yaml#/definitions/string
     enum:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
       - riscv,sv57
       - riscv,none
And so, I thought, that Xen could also re-use this information and use it as starting
value for Mode detection. But considering how much modes are supported by RISC-V spec,
it seems that it won't be too long just to detect which are supported in the way it
is done now.

>
>> Also, I’d like to note that it probably doesn’t make much sense to record all
>> supported modes. If we traverse the|modes[]| array in the opposite order—checking
>> |Sv57| first—then, according to the RISC-V specification:
>> - Implementations that support Sv57 must also support Sv48.
>> - Implementations that support Sv48 must also support Sv39.
>> So if Sv57 is supported then lower modes are supported too. (except Sv32 for RV32)
>>
>> Based on this, it seems reasonable to start checking from Sv57, right?
> No. Bigger guests want running in 48x4, huge ones in 57x4 (each: if available),
> and most ones in 39x4. It doesn't matter what direction you do the checks, you
> want to know what you have available.

My point was that if we change the direction, then once we find the first (largest)
supported MMU mode, there is no need to check the others (lower modes) as according
to the RISC-V specification, the lower modes must be supported automatically.

~ Oleksii

--------------6cqP0ZzIK3gNLLxs3hU2C00n
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
    <div class="moz-cite-prefix">On 11/13/25 5:32 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7d81564c-d7c0-47f4-9f2c-bf4508a0a870@suse.com">
      <pre wrap="" class="moz-quote-pre">On 13.11.2025 17:18, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 11/6/25 2:43 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:57, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Changes in V5:
  - Add static and __initconst for local variable modes[] in
    gstage_mode_detect().
  - Change type for gstage_mode from 'unsigned long' to 'unsigned char'.
  - Update the comment inisde defintion if modes[] variable in
    gstage_mode_detect():
    - Add information about Bare mode.
    - Drop "a paged virtual-memory scheme described in Section 10.3" as it isn't
      relevant here.
  - Drop printing of function name when chosen G-stage mode message is printed.
  - Drop the call of gstage_mode_detect() from start_xen(). It will be added into
    p2m_init() when the latter will be introduced.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Well, thanks, but ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">  - Introduce pre_gstage_init().
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... the same comment that I gave before now applies here: This doesn't look to
belong directly in start_xen(). In x86'es terms I'd say this is a tiny part of
paging_init().
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Does it only the question of function naming now?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not just, no. My point is that you shouldn't pollute start_xen() with calls to
dozens of special-purpose functions. There wants to be one call dealing with
everything guest-mm related, I think.</pre>
    </blockquote>
    <pre>I think I understand your point now. I’ll introduce <code
    data-start="112" data-end="129">guest_mm_init()</code> and move
everything related to it inside that function (at the moment, this includes
the VMID initialization and G-stage mode detection).

</pre>
    <blockquote type="cite"
      cite="mid:7d81564c-d7c0-47f4-9f2c-bf4508a0a870@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">IMO, ideally it would be nice to have it in p2m_init(), but there is no a lot of
sense to detect supported modes each time a domain is constructed. And it is the
reason why I put directly to start_xen().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No per-domain function wants to be used for this, I agree. Hence why I pointed
you at x86'es paging_init().

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/sections.h&gt;
+
+#include &lt;asm/csr.h&gt;
+#include &lt;asm/flushtlb.h&gt;
+#include &lt;asm/riscv_encoding.h&gt;
+
+unsigned char __ro_after_init gstage_mode;
+
+static void __init gstage_mode_detect(void)
+{
+    static const struct {
+        unsigned char mode;
+        unsigned int paging_levels;
+        const char name[8];
+    } modes[] __initconst = {
+        /*
+         * Based on the RISC-V spec:
+         *   Bare mode is always supported, regardless of SXLEN.
+         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
+         *   When SXLEN=64, three paged virtual-memory schemes are defined:
+         *   Sv39, Sv48, and Sv57.
+         */
+#ifdef CONFIG_RISCV_32
+        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
+#else
+        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
+        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
+        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
+#endif
+    };
+
+    unsigned int mode_idx;
+
+    gstage_mode = HGATP_MODE_OFF;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why is this not the variable's initializer?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Good point. It should be the variable's initializer.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    for ( mode_idx = 0; mode_idx &lt; ARRAY_SIZE(modes); mode_idx++ )
+    {
+        unsigned long mode = modes[mode_idx].mode;
+
+        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
+
+        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
+        {
+            gstage_mode = mode;
+            break;
+        }
+    }
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I take it that using the first available mode is only transient. To support bigger
guests, you may need to pick 48x4 or even 57x4 no matter that 39x4 is available.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I considered traversing the|modes[]| array in the opposite order so that the largest
mode would be checked first. However, I decided that 39x4 is sufficiently large and
provides a good balance between the number of page tables and supported address
space, at least for now.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">I wonder whether you wouldn't be better off recording all supported modes right
away.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
What would be the use case for recording and storing all supported modes?
For example, would it be used to indicate which mode is preferable for a guest
domain via the device tree?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why device tree? That's what's exposed to guests, isn't it? Here we talk about
what Xen uses to run guests. And that can vary from guest to guest.</pre>
    </blockquote>
    <pre>At the same time, the bootloader also passes a device tree to Xen, and Xen
uses it, at least—to determine the RAM addresses and sizes. I also referred to
device tree because it can indicate the largest MMU mode supported on a hart:
  mmu-type:
    description:
      Identifies the largest MMU address translation mode supported by
      this hart.  These values originate from the RISC-V Privileged
      Specification document, available from
      <a class="moz-txt-link-freetext" href="https://riscv.org/specifications/">https://riscv.org/specifications/</a>
    $ref: /schemas/types.yaml#/definitions/string
    enum:
      - riscv,sv32
      - riscv,sv39
      - riscv,sv48
      - riscv,sv57
      - riscv,none
And so, I thought, that Xen could also re-use this information and use it as starting
value for Mode detection. But considering how much modes are supported by RISC-V spec,
it seems that it won't be too long just to detect which are supported in the way it
is done now.

</pre>
    <blockquote type="cite"
      cite="mid:7d81564c-d7c0-47f4-9f2c-bf4508a0a870@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Also, I’d like to note that it probably doesn’t make much sense to record all
supported modes. If we traverse the|modes[]| array in the opposite order—checking
|Sv57| first—then, according to the RISC-V specification:
- Implementations that support Sv57 must also support Sv48.
- Implementations that support Sv48 must also support Sv39.
So if Sv57 is supported then lower modes are supported too. (except Sv32 for RV32)

Based on this, it seems reasonable to start checking from Sv57, right?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No. Bigger guests want running in 48x4, huge ones in 57x4 (each: if available),
and most ones in 39x4. It doesn't matter what direction you do the checks, you
want to know what you have available.</pre>
    </blockquote>
    <pre>My point was that if we change the direction, then once we find the first (largest)
supported MMU mode, there is no need to check the others (lower modes) as according
to the RISC-V specification, the lower modes must be supported automatically.

~ Oleksii</pre>
  </body>
</html>

--------------6cqP0ZzIK3gNLLxs3hU2C00n--

