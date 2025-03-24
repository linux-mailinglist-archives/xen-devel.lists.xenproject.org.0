Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE7A6DEA7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925797.1328684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjkS-0006g2-1i; Mon, 24 Mar 2025 15:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925797.1328684; Mon, 24 Mar 2025 15:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjkR-0006dd-V2; Mon, 24 Mar 2025 15:29:55 +0000
Received: by outflank-mailman (input) for mailman id 925797;
 Mon, 24 Mar 2025 15:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5aS=WL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1twjkR-0006Pr-5o
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:29:55 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d53acd4a-08c4-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 16:29:53 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso916418266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:29:53 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd163cesm686774666b.151.2025.03.24.08.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:29:52 -0700 (PDT)
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
X-Inumbo-ID: d53acd4a-08c4-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742830193; x=1743434993; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zp0b8xhyimXIfQLnEri6+5YQXuIr7BBBLcS0XipQZCo=;
        b=acdFvnyfs62i2rD9KoQg7lYThTC7EJy7Gy7ozaawgopjxb4TRSmXAe+DN7/BSovo1u
         X3Uyb6N3myx0zQamD9++CvHF5ibJ4omh4d5EPP4z+oriNYQZdQb1qloSALOdyDkEtuVM
         j+rXt0kGL5JvNKGTH5Ywlz4Jea0vZiljwPJVFK97Q1meVF5JFePCA74uOfB5tSQl0aep
         eGOfu2TPoY2bw1dhwlTmZwJkxpJStneoCRZPmrMxUoMzwR5hH09180KjEv+hKVZJqFLP
         BNFk9hgUnO7OJruaN5FMwfI/IKWO3xsXQZwai1GhMY93Uedfy/f23MA4nvCJQvEylNFx
         +0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830193; x=1743434993;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zp0b8xhyimXIfQLnEri6+5YQXuIr7BBBLcS0XipQZCo=;
        b=MB3N6DHeqTip39RnpfrPZr99BSa6tos6gEunuuGLs2Sa232f4P9Zg8y9r/VXaCLIWc
         8DXuv38Up5wAMI/6wSNHuqVsule9HsiGBnxW/1rA+tmYUqhlTEq+6Q8YN1LgNlKNUFbS
         zjoZ3d7arqjmDP6bMauUkp2EeD4qjgvW7bveU04HbEXsB8WbJ+qmwl1n9eeqhBKuBzc7
         iDXnYXSy75XSlPl9cqIHtk6exyO4Q0V/Lg+xqLtj+mbAQgMuzcIDloc35aMZkVwJjpI6
         i2rmbrdGuocgMMlQi7W0p+P7RNtqK0sNaA21vjG7Mup+O+2sxoIRcxcDzgusky3vWupJ
         YBYA==
X-Forwarded-Encrypted: i=1; AJvYcCVLjJVnBcdBvEyTCbmbd7DknhXL70GC1B8ESVj9cSliUSzidgKhzeLPAbJvcC4aR9xXICplV6SZN58=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXMrNUYuWc9Vp+IYDMgnaqNYmVZ5vcCJ3JnMSBtOTp5wy4qkXv
	W0UbrLs4s7QfQS8dAXIVqgyfhTDPPaNNYeNtVjbHO4cbtGoaUZK4
X-Gm-Gg: ASbGnctFtN4K21YGxzLIGfP7/HnfGe8yD3xnfAhEcz2HpivxeegpNhbpAtQrJa+12wT
	2ZSO/0qxslgDmeKkZr3f5jyCRtJlaWPQih5DSm/TDqn8yfCBNKZYwMMMcncuu71Qm7OYXpp6zUF
	DxsYGQCWGkQWVvVJjytb+DYKAmbyFXRHaWjFHhaCnZ1RiTnjSRFX+i/Un9XOivID1DyTA+Mz3US
	dwPPj3HhQZl9ATAiDq4jSex0vxDT1vtL4jNdJDBFwlYtBlqXuTxP7l9sJbXuex+fdwnkBC3Bb9n
	ZE6sb4P0rn9nsdgXBLI5GJhfehXuFqNzMJw18A5AaW6EiNeYJFGKEWT+ekb9obH/9EBUBn/88vb
	CUeDsoQQUX6fDDdhkV3nh
X-Google-Smtp-Source: AGHT+IHJ2WSjmsGao8qYx+wNMidbXL+tOB4qy+pnF762+B/3Or2TnjWeNJEc37//MbmTcGmI/dKZOA==
X-Received: by 2002:a17:907:a58b:b0:ac4:3d0:8bc9 with SMTP id a640c23a62f3a-ac403d08c9dmr1113501166b.27.1742830192381;
        Mon, 24 Mar 2025 08:29:52 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7vN12ZGh9y8vA7ZUU0kbsi7m"
Message-ID: <abfbdc78-6620-483a-b9fe-4a100cab04e5@gmail.com>
Date: Mon, 24 Mar 2025 16:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>
 <27dc3481-1f48-46c5-a827-e0a44c17686d@gmail.com>
 <630f216a-10fa-4828-a64e-651dd7f70242@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <630f216a-10fa-4828-a64e-651dd7f70242@suse.com>

This is a multi-part message in MIME format.
--------------7vN12ZGh9y8vA7ZUU0kbsi7m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/20/25 8:36 AM, Jan Beulich wrote:
> On 19.03.2025 18:29, Oleksii Kurochko wrote:
>> On 3/17/25 4:24 PM, Jan Beulich wrote:
>>> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/time.c
>>>> @@ -0,0 +1,38 @@
>>>> +#include <xen/device_tree.h>
>>>> +#include <xen/init.h>
>>>> +#include <xen/lib.h>
>>>> +#include <xen/sections.h>
>>>> +
>>>> +unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>>>> +unsigned long __read_mostly boot_count;
>>> Why not also __ro_after_init? And what is this variable actually needed
>>> for? Common code doesn't use it, so a better name (describing what it
>>> really holds) might be desirable, even if this then means not being in
>>> sync with Arm code.
>> To calculate more accurate amount of time since boot.
> Okay. But how does the name of the variable reflect that? I.e. what it
> is that the count of is being stored? The only meaning I could associate
> to a variable of this name is the number of boot cycles a system went
> through. I.e. nothing that an OS (or hypervisor) would normally count.

But an OS (or hypervisor) doesn't count it, they initialize a variable
once (in my case, it was named as boot_count) and then just subtract it from
get_cycles() to get time relative to this variable (so since Xen boot) and not
since power on as nothing guarantee (at least, I can't find that in the RISC-V spec)
that after power on the value in CSR_TIME will start from 0 what could lead to
some issues, if my understanding is correct, such as if on SoC A timer starts from
let it be 1000 and on SoC B timer value starts from 5000 then all measurements will be
incorrect as Xen will think that for SoC B it was spent more time then for SoC A.

What do you think if boot_count will be renamed to xen_start_time or {initial_}boot_time?

~ Oleksii

>> I think it can be __ro_after_init as it is going to be initialized once.
>>
>>> Furthermore, I can't spot a declaration of this variable. Was it meant
>>> to be static?
>> It is going to be used for vtimer functionality and in repogram_timer()
>> so it can't be static.
>>
>> I will add a declaration to asm/time.h:
>> ```
>>     /* Counter value at boot time */
>>     extern uint64_t boot_count;
>> ```
>>
>> Thanks.
>>
>> ~ Oleksii
>>
--------------7vN12ZGh9y8vA7ZUU0kbsi7m
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
    <div class="moz-cite-prefix">On 3/20/25 8:36 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:630f216a-10fa-4828-a64e-651dd7f70242@suse.com">
      <pre wrap="" class="moz-quote-pre">On 19.03.2025 18:29, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 3/17/25 4:24 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 11.03.2025 17:19, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/time.c
@@ -0,0 +1,38 @@
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/sections.h&gt;
+
+unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
+unsigned long __read_mostly boot_count;
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Why not also __ro_after_init? And what is this variable actually needed
for? Common code doesn't use it, so a better name (describing what it
really holds) might be desirable, even if this then means not being in
sync with Arm code.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
To calculate more accurate amount of time since boot.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Okay. But how does the name of the variable reflect that? I.e. what it
is that the count of is being stored? The only meaning I could associate
to a variable of this name is the number of boot cycles a system went
through. I.e. nothing that an OS (or hypervisor) would normally count.</pre>
    </blockquote>
    <pre>But an OS (or hypervisor) doesn't count it, they initialize a variable
once (in my case, it was named as boot_count) and then just subtract it from
get_cycles() to get time relative to this variable (so since Xen boot) and not
since power on as nothing guarantee (at least, I can't find that in the RISC-V spec)
that after power on the value in CSR_TIME will start from 0 what could lead to
some issues, if my understanding is correct, such as if on SoC A timer starts from
let it be 1000 and on SoC B timer value starts from 5000 then all measurements will be
incorrect as Xen will think that for SoC B it was spent more time then for SoC A.

What do you think if boot_count will be renamed to xen_start_time or {initial_}boot_time?

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:630f216a-10fa-4828-a64e-651dd7f70242@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I think it can be __ro_after_init as it is going to be initialized once.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Furthermore, I can't spot a declaration of this variable. Was it meant
to be static?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It is going to be used for vtimer functionality and in repogram_timer()
so it can't be static.

I will add a declaration to asm/time.h:
```
   /* Counter value at boot time */
   extern uint64_t boot_count;
```

Thanks.

~ Oleksii

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------7vN12ZGh9y8vA7ZUU0kbsi7m--

