Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE09AB98FF
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:35:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986669.1372219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrTt-0003Rk-2Z; Fri, 16 May 2025 09:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986669.1372219; Fri, 16 May 2025 09:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrTs-0003Pg-Vo; Fri, 16 May 2025 09:35:52 +0000
Received: by outflank-mailman (input) for mailman id 986669;
 Fri, 16 May 2025 09:35:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8HW=YA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uFrTs-0002s5-4d
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:35:52 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 280bf59b-3239-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:35:51 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so14505065e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:35:51 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39ef400sm95489535e9.33.2025.05.16.02.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 02:35:50 -0700 (PDT)
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
X-Inumbo-ID: 280bf59b-3239-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747388151; x=1747992951; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKvQM2YaUYz6E5m9TlyGKYjSE2MYS//1zmKQO6qAEI8=;
        b=DT4sudK9uokygriXcVM3xJy+ZMHVMUG5iAt/xR71EEHo9JZ9n7pPrtOi1donJhnH95
         0c8fjjhCrk1xjvQfrpU1uZgGniYYIyLHWzSJTda2XGCDVgpG7cK2NkEIPr6pxjMSyKjR
         Rp5WpAhka2x802gzGf+ewigGwRi8NRwfg43h+FB9OHLN4KM+P1Bt9TPtD3BUAwfTO8/m
         k74bb9ppoL71ZuKlDYOUoDNeuR+//tJvBSZRnEUV3ll2V6Rqj56oEfi8BQJOSTH1GKbA
         kIzuI0SO2WyWVXrUcl2mD/nCXKK/fzv/VbpzqCCoV/YPnaEO2Tr78w/rkwd9N7dTQ/pJ
         5wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388151; x=1747992951;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jKvQM2YaUYz6E5m9TlyGKYjSE2MYS//1zmKQO6qAEI8=;
        b=AeQkGqDtU61m3VjxQ4JIiQNNXE9cD/Pf5urHCeYm1OnXzkI22+SnZ9/njlAKPTc/HI
         JUHwekSZmASKZ5dNAmynzrqP4VvwWcsuXOCauC1u9s0xo64W/Um20Gi7615yfDGtJ0XU
         rR2Q+o4xlpkBFD8zsZOxi/dIMKBVbsdvzdr454gPfCDw662mxjejDVigFg+N+ZKYr0BC
         RytnaxaUQtOra2MI1gG0KOlqY/D0C0MXBcMCbwDaAXIzG7zeeyiT0dA8fIZqr+q9ygbU
         h+NC6Vgh6LbWQYdGU6X4rTgEug9b9Qb1mtqhGcUW80OlX1t7bKDf/9Wc42YyvrGP2XdJ
         R1jg==
X-Forwarded-Encrypted: i=1; AJvYcCUnJDubD9I2S5j8d7itoi8yllCr7uOLILhn/SJ96pnib8UgF0gig5XGa+LGJyToAaBMlYh6dH/IbBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLMV/JqzS2FqMt47Hlp14mXHc/7lFKstk/JH7UTPbZyiTOgUzR
	dW44MqyGHIRHZxta5xar2GxWhoka+b7JQA9m7Q1WOnlUm41iUZXr43FY
X-Gm-Gg: ASbGncuTyCezRERMIz200QUwvZKseQoiRG1q5lamc8W3RLo9pGfgho3BesgE30F6bU7
	4OGnG5sQJqX/vQNbJwtYOugezPne6dwmtXFYTCSxCPn0Gn8TbC21vOsN2VbjIBgFsnKKvrMVm+Q
	efCqpdpN69XDmjbRrPgShzwweCIRVVFu0RQPuD3q4iSZmxpLuIf3B3DbJo+IaZgK0zV1sJ2+laD
	TLGYCA/CGd7VUjMKu60dKp+wHArVz0bmPY8jZufABwj9sq6ifhJn5mmQVnez8P+lVpGkenwquzc
	lX+hJzut98bPdBDEPIZm5pfeTK0vE4RAPzZjRWLfXMFGVfTHDI/Ltrk7gTXa72/WeiXm0IlOZcj
	GX2iLTKH9zrofFAPelPRgfNpA
X-Google-Smtp-Source: AGHT+IFQm66DxQAc6kuHaxp+aEXDs6AZPcF4YfRP1IUgCdSq7nVCJ/esUEaIt6+3itYNW+tUonjVLg==
X-Received: by 2002:a05:600c:4447:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-442fd675932mr26752155e9.29.1747388150736;
        Fri, 16 May 2025 02:35:50 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------96dXM9TeOU0YIUMASWjQW94d"
Message-ID: <8d6efc98-079a-44ac-9cf0-1c5441eaa46a@gmail.com>
Date: Fri, 16 May 2025 11:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] xen/riscv: introduce support of Svpbmt extension
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <da9273c20dc7ac1c131322e38a8cef361dfd86a9.1746530883.git.oleksii.kurochko@gmail.com>
 <cf70c0c5-aec5-4bab-ac99-1e23ae06ee7b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cf70c0c5-aec5-4bab-ac99-1e23ae06ee7b@suse.com>

This is a multi-part message in MIME format.
--------------96dXM9TeOU0YIUMASWjQW94d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/13/25 6:00 PM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> Svpbmt extension is necessary for chaning the memory type for a page contains
>> a combination of attributes that indicate the cacheability, idempotency,
>> and ordering properties for access to that page.
> The title suggest use of the extension is optional.
>
>> --- a/xen/arch/riscv/Kconfig
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -10,11 +10,25 @@ config RISCV
>>   config RISCV_64
>>   	def_bool y
>>   	select 64BIT
>> +	select HAS_SVPBMT
> Such redundant ...
>
>>   config ARCH_DEFCONFIG
>>   	string
>>   	default "arch/riscv/configs/tiny64_defconfig"
>>   
>> +config HAS_SVPBMT
>> +	bool
>> +	depends on RISCV_64
> ... dependencies are frowned upon, afaik. And it's pretty certainly not
> needed here.
>
>> +	help
>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>> +	  page-based memory types).
>> +
>> +	  The memory type for a page contains a combination of attributes
>> +	  that indicate the cacheability, idempotency, and ordering
>> +	  properties for access to that page.
>> +
>> +	  The Svpbmt extension is only available on 64-bit cpus.
> I don't mind the help text, but for a prompt-less option it's of little
> use (beyond what a comment could also achieve).

I'll drop "depends on RISCV_64" for HAS_SVOBMT and leave only 'select HAS_SVPBMT'
and move the help text to commit messaage.

>
>> --- a/xen/arch/riscv/include/asm/page.h
>> +++ b/xen/arch/riscv/include/asm/page.h
>> @@ -46,6 +46,8 @@
>>   #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
>>   
>>   #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
>> +#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PMBT_IO)
>> +#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PMBT_NOCACHE)
> Hmm, odd - NOCACHE doesn't really mean "no cache" then? I think this
> would require a comment then.

According to the table (Svpbmt Memory Type definitions) in the comment below these
definitions both of them (PTE_PMBT_IO and PTE_PMBT_NOCACHE) are non-cachable.

I wasn't sure what and for what should be used so I did in sync with Arm which
defines "#define PAGE_HYPERVISOR_NOCACHE (_PAGE_DEVICE|MT_DEVICE_nGnRE)" where
MT_DEVICE_nGnRE is equivalent of PTE_PMBT_IO.

I can add the comment above definition of PAGE_HYPERVISOR_NOCACHE:
/* Non-cacheable, non-idempotent, strongly-ordered I/O memory */.

Something similar then I can add for PAGE_HYPERVISOR_WC:
/* Non-cacheable, idempotent, weakly-ordered Main Memory */

>
>> @@ -56,8 +58,21 @@
>>   #define PTE_SMALL       BIT(10, UL)
>>   #define PTE_POPULATE    BIT(11, UL)
>>   
>> +/*
>> + * [62:61] Svpbmt Memory Type definitions:
>> + *
>> + *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
>> + *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
>> + *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
>> + *  11 - Rsvd   Reserved for future standard use
>> + */
>> +#define PTE_PMBT_NOCACHE    BIT(61, UL)
>> +#define PTE_PMBT_IO         BIT(62, UL)
> Unlike PTE_SMALL and PTE_POPULATE these are arch-defined; I think they
> want to move up to where the other arch-defined bits are, thus also
> maping them appear before their first use.

Sure, I'll move them up.

Thanks.

~ Oleksii

--------------96dXM9TeOU0YIUMASWjQW94d
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
    <div class="moz-cite-prefix">On 5/13/25 6:00 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cf70c0c5-aec5-4bab-ac99-1e23ae06ee7b@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Svpbmt extension is necessary for chaning the memory type for a page contains
a combination of attributes that indicate the cacheability, idempotency,
and ordering properties for access to that page.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The title suggest use of the extension is optional.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -10,11 +10,25 @@ config RISCV
 config RISCV_64
 	def_bool y
 	select 64BIT
+	select HAS_SVPBMT
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Such redundant ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config HAS_SVPBMT
+	bool
+	depends on RISCV_64
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... dependencies are frowned upon, afaik. And it's pretty certainly not
needed here.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	help
+	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
+	  page-based memory types).
+
+	  The memory type for a page contains a combination of attributes
+	  that indicate the cacheability, idempotency, and ordering
+	  properties for access to that page.
+
+	  The Svpbmt extension is only available on 64-bit cpus.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't mind the help text, but for a prompt-less option it's of little
use (beyond what a comment could also achieve).</pre>
    </blockquote>
    <pre>I'll drop "depends on RISCV_64" for HAS_SVOBMT and leave only 'select HAS_SVPBMT'
and move the help text to commit messaage.

</pre>
    <blockquote type="cite"
      cite="mid:cf70c0c5-aec5-4bab-ac99-1e23ae06ee7b@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -46,6 +46,8 @@
 #define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+#define PAGE_HYPERVISOR_NOCACHE     (PAGE_HYPERVISOR_RW | PTE_PMBT_IO)
+#define PAGE_HYPERVISOR_WC          (PAGE_HYPERVISOR_RW | PTE_PMBT_NOCACHE)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, odd - NOCACHE doesn't really mean "no cache" then? I think this
would require a comment then.</pre>
    </blockquote>
    <pre>According to the table (Svpbmt Memory Type definitions) in the comment below these
definitions both of them (PTE_PMBT_IO and PTE_PMBT_NOCACHE) are non-cachable.

I wasn't sure what and for what should be used so I did in sync with Arm which
defines "#define PAGE_HYPERVISOR_NOCACHE (_PAGE_DEVICE|MT_DEVICE_nGnRE)" where
MT_DEVICE_nGnRE is equivalent of PTE_PMBT_IO.

I can add the comment above definition of PAGE_HYPERVISOR_NOCACHE:
/* Non-cacheable, non-idempotent, strongly-ordered I/O memory */.

Something similar then I can add for PAGE_HYPERVISOR_WC:
/* Non-cacheable, idempotent, weakly-ordered Main Memory */

</pre>
    <blockquote type="cite"
      cite="mid:cf70c0c5-aec5-4bab-ac99-1e23ae06ee7b@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -56,8 +58,21 @@
 #define PTE_SMALL       BIT(10, UL)
 #define PTE_POPULATE    BIT(11, UL)
 
+/*
+ * [62:61] Svpbmt Memory Type definitions:
+ *
+ *  00 - PMA    Normal Cacheable, No change to implied PMA memory type
+ *  01 - NC     Non-cacheable, idempotent, weakly-ordered Main Memory
+ *  10 - IO     Non-cacheable, non-idempotent, strongly-ordered I/O memory
+ *  11 - Rsvd   Reserved for future standard use
+ */
+#define PTE_PMBT_NOCACHE    BIT(61, UL)
+#define PTE_PMBT_IO         BIT(62, UL)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Unlike PTE_SMALL and PTE_POPULATE these are arch-defined; I think they
want to move up to where the other arch-defined bits are, thus also
maping them appear before their first use.</pre>
    </blockquote>
    <pre>Sure, I'll move them up.

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------96dXM9TeOU0YIUMASWjQW94d--

