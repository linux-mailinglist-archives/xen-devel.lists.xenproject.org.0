Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9918AA05A1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 10:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971654.1360011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9gGm-0000TU-27; Tue, 29 Apr 2025 08:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971654.1360011; Tue, 29 Apr 2025 08:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9gGl-0000Qv-VF; Tue, 29 Apr 2025 08:24:47 +0000
Received: by outflank-mailman (input) for mailman id 971654;
 Tue, 29 Apr 2025 08:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anwM=XP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u9gGk-0000Qp-IU
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 08:24:46 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68336aca-24d3-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 10:24:45 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so10961810a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 01:24:45 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acec5d0d74esm96230666b.117.2025.04.29.01.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 01:24:44 -0700 (PDT)
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
X-Inumbo-ID: 68336aca-24d3-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745915085; x=1746519885; darn=lists.xenproject.org;
        h=in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcRA9B58EQ4yRq0UrvtW1zz7O2QCmd28q/7mPCxeMbA=;
        b=IWXuOBoogMq3C7p8nMQhdj3ic0abkd15nP5mqIm1mUp+aOeXnEJ8CKMMiDlfCjGfEI
         G8pw9t2E74otIl2FDdL0F2hGg6VPz7TKX3cRXamOIxWYT6Lx36Oho2PMezAAHQSz07DZ
         swON8VqqWkAB1r6R/yYCUFwuvCHtLpnHT//L6zNa+hYgpMiPk7+z1araTjjV5cAyNdid
         WRCq/bqivlYQhDb8a5X3PLiMwhDOk/pDYa8OGcRcZetuSrAAW49nHbn9tkzLS09bKtnh
         jTPsto1tChD384BwC4z/scwsOejsCn1ZgO6pLW1wUHPWJS6YdoxbjLd+yJ+w8kVc1byw
         SdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915085; x=1746519885;
        h=in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IcRA9B58EQ4yRq0UrvtW1zz7O2QCmd28q/7mPCxeMbA=;
        b=tQUdAsZXiwwlgjS12dTuT7cEQ9DXWbg+JaMtNE01IfOsa2ko9OuV13MuQ3En16sY36
         ujXmNPepQCqQdLPNXmvzWI4NYVfH6aYQHk+ze9PQs0dvmEeQCTIJT41skwDOXgAlmFd2
         +0afBhhlpzyr/WAbVQIDq128dOsNC7DcM7IL2+e8eiM8zJ2K/PdlwatGeEc/ou+fKM0G
         vSbf3Uya/U6b1my+OgiqJ5PMK1lg0TFEsaYx7Bw30dGF4tc2qIm0FXZozCRjOb1TTAXe
         whmFNezqwY6ki/UcvXZS2TiG7/J9cNMoLTZIYOLfghLB6NTBKabIaPrfvtDJsbSJ/qFN
         vfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ95BaNJMvPX8M01lgB8QG7+xuWDoPLf+bpsT8j1/WB4hN1EpT8Kv4YUIxzILKZPKRKZrnkCeMScw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwG63iIFXiUi1XYE979oUk1AL2nhsYzHzHypCUbEDkGx2XJdt/S
	V8x00DnAj2OyPW/DPoM6cPw1/0lFIPpZUQt4WgfgDbUr8O7bMkMY
X-Gm-Gg: ASbGncsnugWMU2gRgKbfon264CaRU2pyhnadHOWFkIa0iWCoTgP2J67wewDSeNhAFI4
	OSPgl49dnL+K/NVvFwXeqmSOfTOb5nrY4wi2j0O39+E9S+mSGBf9BWpbsqoT5KZblYe3LFRZjss
	KK+2nOOEAJzJaREzu1hbf1x4Y9OlHZBgChC4eJr7nmYuvOziuv+iTImiNzLjhAQ1z5qnlAHpk4z
	QBGEFQHm5Z3FlxdjrJs+o1V+lQ28yYUpQWvE+efq5abKMfWAQi8HKPk4yCuwznJN3XUjYQnIb6o
	O+/1X2D6vLRYlWHwqrfjP+utBMwL7wToh13FabxJF3ftWYM9qVlkpQKbJ7Xb8MxrfUQTNBakHbk
	ciNF9iM5E8CEheM9i
X-Google-Smtp-Source: AGHT+IEMxg/ug54EnEgtwuNJIkzOtnOiT9SwOL0cBdt3supRcUX1+utufoWkvAjPsWkzT6HPpSXy8Q==
X-Received: by 2002:a17:907:971b:b0:ac6:ba4e:e769 with SMTP id a640c23a62f3a-acec69b1f38mr198847066b.35.1745915084429;
        Tue, 29 Apr 2025 01:24:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------2pwKTKzVRn1xx9TkCB6ChiH7"
Message-ID: <30f3cce3-60b9-480d-b89e-f9992f19cd5e@gmail.com>
Date: Tue, 29 Apr 2025 10:24:43 +0200
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com>

This is a multi-part message in MIME format.
--------------2pwKTKzVRn1xx9TkCB6ChiH7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/16/25 8:31 AM, Jan Beulich wrote:
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

Do you mean xzalloc_flex_struct()?

I think, I can't use for both of the cases (allocation of mmios and msi).
For msi[] then it is needed to allocate imsic_config also dynamically, isn't it?
So something like:
  imsic_config = xzalloc_flex_struct(struct imsic_config, msi, NR_CPUS).
But now it is allocated statically.

For *mmios and harts[] (a member inside struct imsic_mmios):
   mmios = xzalloc_flex_struct(struct imsic_mmios, harts, NR_CPUS); // NR_CPUs just for example...
It will allocate only one mmios, but it is needed mmios[nr_mmios].
Maybe, something like _xmalloc((offsetof(struct imsic_mmios, harts[NR_CPUS])) * NR_CPUS, sizeof(struct imsic_mmios)) will work.

Am I missing something?

~ Oleksii

--------------2pwKTKzVRn1xx9TkCB6ChiH7
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
    <div class="moz-cite-prefix">On 4/16/25 8:31 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9a13c625-cd33-485d-a91f-9f005522b5a4@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">--- /dev/null
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
</pre></blockquote><pre wrap="" class="moz-quote-pre">An array of bool - won't a bitmap do here? Even then I wouldn't be overly
happy to see it dimensioned by NR_CPUS.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Bitmap will fit here well. But for DECLARE_BITMAP() is necessary the size
of bitmap so NR_CPUS should be used again.
Could you please remind me why it isn't good to use it?
Because NR_CPUS not always equal to an amount of physical cpus?
</pre></blockquote><pre wrap="" class="moz-quote-pre">"Not equal" wouldn't be overly problematic. But NR_CPUS=4000 and the actual
number of CPUs being 4 would be wasteful in general. More when its wider
than a bit that's needed per CPU, but where would you draw the line if you
permitted use of NR_CPUS here?

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">Should I use non-static version of bitmap declaration? (if we have such...)
</pre></blockquote><pre wrap="" class="moz-quote-pre">That's simply "unsigned long *" then, or - at the tail of a dynamically
allocated struct - possibly unsigned long[].

</pre><blockquote type="cite" style="color: #007cff;"><blockquote
      type="cite" style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+};
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
</pre></blockquote><pre wrap="" class="moz-quote-pre">You surely can avoid wasting perhaps a lot of memory by allocating this
based on the number of CPUs in use?
</pre></blockquote><pre wrap="" class="moz-quote-pre">It make sense. I'll allocate then this dynamically.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Or, as per above, when put at the tail and the struct itself is
dynamically allocated, use struct imsic_msi[]. We even have dedicated
xmalloc() flavors for this kind of allocation.</pre></pre>
    </blockquote>
    <pre><pre>Do you mean xzalloc_flex_struct()?
</pre><pre>I think, I can't use for both of the cases (allocation of mmios and msi).
For msi[] then it is needed to allocate imsic_config also dynamically, isn't it?
So something like:
 imsic_config = xzalloc_flex_struct(struct imsic_config, msi, NR_CPUS).
But now it is allocated statically.

For *mmios and harts[] (a member inside struct imsic_mmios):
  mmios = xzalloc_flex_struct(struct imsic_mmios, harts, NR_CPUS); // NR_CPUs just for example...
It will allocate only one mmios, but it is needed mmios[nr_mmios].
Maybe, something like _xmalloc((offsetof(struct imsic_mmios, harts[NR_CPUS])) * NR_CPUS, sizeof(struct imsic_mmios)) will work.

Am I missing something?

~ Oleksii</pre></pre>
  </body>
</html>

--------------2pwKTKzVRn1xx9TkCB6ChiH7--

