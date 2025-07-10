Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4DBB0006C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 13:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039362.1411218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpJB-0004io-RB; Thu, 10 Jul 2025 11:19:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039362.1411218; Thu, 10 Jul 2025 11:19:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZpJB-0004gp-NE; Thu, 10 Jul 2025 11:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1039362;
 Thu, 10 Jul 2025 11:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgni=ZX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uZpJA-0004gj-CG
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 11:19:20 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b85d29dc-5d7f-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 13:19:18 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso1605667a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 04:19:18 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e8264756sm114705466b.105.2025.07.10.04.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 04:19:17 -0700 (PDT)
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
X-Inumbo-ID: b85d29dc-5d7f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752146358; x=1752751158; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7xI/xbIWJF7brFpiAvQfCZZPGH8k3Z0TKySAv1RO0E=;
        b=TnfASC3oaQiHy+HNb5WtRogYDTLWyIvaLSeRrLyOTdlYwsDgo3sAUJt/55vhl/aDbv
         Rr61jRQUp98WME6wfxrv1SQvis0spu+O9CrvqqRAjqdL6I5DziK0+9MzbUODqsxh+MVl
         LTsr2YMd9xx6XfChzuDDqC6tE0s4RAWopWAcEUg+VAbkgZ7DT8xsOB5zF/qci8g5BTAw
         yYwmTBb0SsJk1c54v7m7Q+jbsFEBTu4+HS1FbE0I9juabTHEHwil0h+73K4KJ1y3EmI/
         83lc42+cUGbHUKkK66Kayc+zZNggTwtdkQQKvnyZsiRsmWhXVZbAsNl3715FeaPwWIQs
         NEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752146358; x=1752751158;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O7xI/xbIWJF7brFpiAvQfCZZPGH8k3Z0TKySAv1RO0E=;
        b=QJkr8fO0CzzJqT51A/m1qYa8TMNsRTahsbtvxCYqIVz8ROCyTwN4G+pJhm4zcee1cL
         XNfmBXVvTNKdg4jAp92sOe4s5aCk0I/AEW+FHuPNI5OLC4xJhCFI58LWH5iuzZsl6VkY
         ieWgYT2vAryBntnMHpilMPS+InU0Qk09mM+qBYppdJirTX3pxIPYrcQuVYQX2+/yhWG7
         LklvXAvmhORf9gAAa3FObe28AkhSQDi39oideUOZ8yKRPkX6PKMXW84Ym/pXWLmCu0N6
         1Z0Shz7OCec/y6YkuGKL9HKRgCtJqLiJphSuQWUKnHGsUiQZePUK+w/JTK3K/cuZ1Xjq
         ELkw==
X-Forwarded-Encrypted: i=1; AJvYcCW3FDtfIarwyUisAfZqKz/L16qZ5FQwWxkfeJMzwilqWabjOf78hPiCa+CCdYhH9qzJm230HB7d9Vo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtnAb84pwEaHWoQ4RNZLXfOia36tbSYAWzeAeRPpsA4yiW5Ri+
	FDGhbT6Is7oceeFI1QPjiwKi3ywJR0evZ9Mx5e3qx1oPzMkX50cUikpi
X-Gm-Gg: ASbGncs3udFMwBn2JkW/SUBagktTaK+WrPcETVBPcEnmIJUjXxSRdZdK2StHeFq/EPJ
	t+YnADLDPRu2EvvVOq1fiEmEpX4RgQog8sSKsURAsfBvWJc7fYUbMZ66Dvd7OhNixJu3qOgjceu
	RDEOHYfaUCjGqMJzl+tvL5Ber5xwYlxcY7LF88arWOdbno2/W8RZD8MzOhC8SrIUAmDEQyHGYzC
	ZRiH6JI0TfjQ/2+rUmyIdcyc6Y7y2/FGbQ+xdBgh2M4nUqsPfQgUVlHcVpKt8ctnxkzXgMtO9Q7
	U2LPMLvuT8NuuZM4XSN8TW9mFsbZE8xSjeqZA2RrQTHUrudXFfFKkij2nkTKxU1QxHhQYM79hRg
	v8nfzS2mNmJ6g9wSPKJxe8vGg8rYsaJ1pwWc=
X-Google-Smtp-Source: AGHT+IGPrbV5GlG5m/IgmBG3HYgCWM/ig6DIdnRMUIJk25vEveggtWuYqt4lpSPGUtyicH5LVt4DCg==
X-Received: by 2002:a17:907:1c14:b0:ad1:e4e9:6b4f with SMTP id a640c23a62f3a-ae6cf73b1c9mr659540866b.36.1752146357507;
        Thu, 10 Jul 2025 04:19:17 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fKjxiv0nBL56iuY2BOgZB39J"
Message-ID: <54d180df-3980-4f90-a8fe-519aed9e1870@gmail.com>
Date: Thu, 10 Jul 2025 13:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/riscv: aplic_init() implementation
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
 <a15b1426f14bb8f7f6385db9c13e584b55e4c91a.1751876912.git.oleksii.kurochko@gmail.com>
 <c49cf7bd-fbff-45b0-ab0a-ee8020d910f0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c49cf7bd-fbff-45b0-ab0a-ee8020d910f0@suse.com>

This is a multi-part message in MIME format.
--------------fKjxiv0nBL56iuY2BOgZB39J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/25 3:58 PM, Jan Beulich wrote:
> On 07.07.2025 11:01, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/aplic-priv.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/aplic-priv.h
>> + *
>> + * Private part of aplic.h header.
>> + *
>> + * RISC-V Advanced Platform-Level Interrupt Controller support
>> + *
>> + * Copyright (c) Microchip.
>> + * Copyright (c) Vates.
>> + */
>> +
>> +#ifndef ASM_RISCV_PRIV_APLIC_H
>> +#define ASM_RISCV_PRIV_APLIC_H
>> +
>> +#include <xen/types.h>
>> +
>> +#include <asm/aplic.h>
>> +#include <asm/imsic.h>
> Why is the latter one needed here? Certainly not for ...
>
>> +struct aplic_priv {
>> +    /* Base physical address and size */
>> +    paddr_t paddr_start;
>> +    size_t  size;
>> +
>> +    /* Registers */
>> +    volatile struct aplic_regs __iomem *regs;
>> +
>> +    /* IMSIC configuration */
>> +    const struct imsic_config *imsic_cfg;
> ... this field decl (which itself serves as a forward decl of the struct
> tag).

The purpose was to deal with a forward decl but I agree that in this case
inclusion of <asm/imsic.h> could be dropped.

>
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -9,19 +9,118 @@
>>    * Copyright (c) 2024-2025 Vates
>>    */
>>   
>> +#include <xen/device_tree.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/irq.h>
>> +#include <xen/mm.h>
>>   #include <xen/sections.h>
>>   #include <xen/types.h>
>> +#include <xen/vmap.h>
>> +
>> +#include "aplic-priv.h"
>>   
>>   #include <asm/device.h>
>> +#include <asm/imsic.h>
>>   #include <asm/intc.h>
>> +#include <asm/riscv_encoding.h>
>> +
>> +#define APLIC_DEFAULT_PRIORITY  1
>> +
>> +static struct aplic_priv aplic;
> Is this altered post-init? IOW can it be __ro_after_init? Or otherwise at
> least __read_mostly?

Looking at the current downstream code there is, at least one case, where aplic->regs
are changing (during vaplic_emulate_store()).
So __read_mostly would be better in this case.

> With these two taken care of (one way or another):
> Acked-by: Jan Beulich<jbeulich@suse.com>
> If you clarify what is wanted / needed, I'm also happy to make adjustments
> while committing.

It would be nice to do the following:
- Drop the inclusion of <asm/imsic.h> in aplic-priv.h.
- Add __read_mostly to the definition of the aplic variable.

Thanks for adjustments.

~ Oleksii


--------------fKjxiv0nBL56iuY2BOgZB39J
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
    <div class="moz-cite-prefix">On 7/8/25 3:58 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c49cf7bd-fbff-45b0-ab0a-ee8020d910f0@suse.com">
      <pre wrap="" class="moz-quote-pre">On 07.07.2025 11:01, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/aplic-priv.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/aplic-priv.h
+ *
+ * Private part of aplic.h header.
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ * Copyright (c) Vates.
+ */
+
+#ifndef ASM_RISCV_PRIV_APLIC_H
+#define ASM_RISCV_PRIV_APLIC_H
+
+#include &lt;xen/types.h&gt;
+
+#include &lt;asm/aplic.h&gt;
+#include &lt;asm/imsic.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why is the latter one needed here? Certainly not for ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+struct aplic_priv {
+    /* Base physical address and size */
+    paddr_t paddr_start;
+    size_t  size;
+
+    /* Registers */
+    volatile struct aplic_regs __iomem *regs;
+
+    /* IMSIC configuration */
+    const struct imsic_config *imsic_cfg;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this field decl (which itself serves as a forward decl of the struct
tag).</pre>
    </blockquote>
    <pre>The purpose was to deal with a forward decl but I agree that in this case
inclusion of &lt;asm/imsic.h&gt; could be dropped.

</pre>
    <blockquote type="cite"
      cite="mid:c49cf7bd-fbff-45b0-ab0a-ee8020d910f0@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,19 +9,118 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include &lt;xen/device_tree.h&gt;
 #include &lt;xen/errno.h&gt;
 #include &lt;xen/init.h&gt;
 #include &lt;xen/irq.h&gt;
+#include &lt;xen/mm.h&gt;
 #include &lt;xen/sections.h&gt;
 #include &lt;xen/types.h&gt;
+#include &lt;xen/vmap.h&gt;
+
+#include "aplic-priv.h"
 
 #include &lt;asm/device.h&gt;
+#include &lt;asm/imsic.h&gt;
 #include &lt;asm/intc.h&gt;
+#include &lt;asm/riscv_encoding.h&gt;
+
+#define APLIC_DEFAULT_PRIORITY  1
+
+static struct aplic_priv aplic;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this altered post-init? IOW can it be __ro_after_init? Or otherwise at
least __read_mostly?
</pre>
    </blockquote>
    <pre>Looking at the current downstream code there is, at least one case, where aplic-&gt;regs
are changing (during vaplic_emulate_store()).
So __read_mostly would be better in this case.

</pre>
    <blockquote type="cite"
      cite="mid:c49cf7bd-fbff-45b0-ab0a-ee8020d910f0@suse.com">
      <pre wrap="" class="moz-quote-pre">
With these two taken care of (one way or another):
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
If you clarify what is wanted / needed, I'm also happy to make adjustments
while committing.</pre>
    </blockquote>
    <pre>It would be nice to do the following:
- Drop the inclusion of &lt;asm/imsic.h&gt; in aplic-priv.h.
- Add __read_mostly to the definition of the aplic variable.

Thanks for adjustments.

~ Oleksii
</pre>
    <br>
  </body>
</html>

--------------fKjxiv0nBL56iuY2BOgZB39J--

