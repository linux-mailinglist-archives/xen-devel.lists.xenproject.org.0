Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591779EB0A2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 13:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852234.1266089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzDQ-0005qt-8j; Tue, 10 Dec 2024 12:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852234.1266089; Tue, 10 Dec 2024 12:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzDQ-0005ov-4e; Tue, 10 Dec 2024 12:19:48 +0000
Received: by outflank-mailman (input) for mailman id 852234;
 Tue, 10 Dec 2024 12:19:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tKzDP-0005op-CA
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 12:19:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2b965d-b6f1-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 13:19:46 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54025432becso903080e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 04:19:46 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401d2aab5csm721225e87.168.2024.12.10.04.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 04:19:44 -0800 (PST)
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
X-Inumbo-ID: 0b2b965d-b6f1-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733833186; x=1734437986; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgcqTNrVfOBJ9uwgrvP3jJcEtD74Nx2GTUvqY74CY+4=;
        b=NErQiXQuvKYW21TilPqAPjd3jb+wB9Xg1KwSb9jGvQTCZJaiVZni/cxEpQFSsBOfcS
         NT89cwT0aQDCMUz0VlyQ2LUE8z9e9Sf6Zjf51Fv1kSz4oz/uyvOuGCSoHPObpbqGEtEz
         QTb8uiEvoR9lh7vSgAyTVFBGT7UfSI1wKhFv52MsEZIhK+xcRWOx/OJsEw9zr1qFH6RK
         hwfGIPjamV9jIpQdX6pZ+mBpQeQ8t+8ixNada1v3MFZ522Du0J9RerwrMxLLq53Z4KMe
         UAa0XX1kWI+Hv46pILawHvAKj2vsNDrMf1bHFIETO+zbmoiXIA56s1bX9QxmoC5/ySfA
         1eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833186; x=1734437986;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgcqTNrVfOBJ9uwgrvP3jJcEtD74Nx2GTUvqY74CY+4=;
        b=cC3AbD7+xBUu+lekCQGQgH+ihr6/qgC9lSSNz8SE0oXKpeDuZ5P6c7hFmQ2ZNGrYl9
         87CFl8vQqIe+YW7XvqoSW760MtaNXwuGuxxx6G1IjHZsPyTwa9a9e6QH9obSfY5ZDZoB
         YPBjTwfdBTvv3qq1uFBPW3eXVKlWMgXY/4dfkeIHChB1AcnDxI3ea1ToogwrHF0P/Gca
         c9iN7GXAnjPGbOSbxSAi2vf2ifKY6a7rW7wML4V/7kJR1L3/SSBhuI6qj9vYW5+EGDyx
         DzCtvnuDUmfS3VluJvlGDzt9xxUhm+b6q7+vKUDtj1zf/z6KfXm7gYdaUZzpTAqKi4p5
         Qi3w==
X-Forwarded-Encrypted: i=1; AJvYcCV3MnqqTNZ/X1u6C3/Ltm2uLFY+PE9YLVqsdBdbpN0aOZ3FlXVAQz69Kd5nkvYPG0ITi0asR0secNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOA4o3oavOpIUNVQUe1U0BfUbM4QZDke0S3u0uImOogtu5ssPO
	RxvJMeDzHRI3xaF19y7mnwt5iZC2fToy0+cp6Aw1SUwfGm2q228k
X-Gm-Gg: ASbGncuBpVIKrRKAzN7Sl2X9u4Z5nLCiosOxhqnSHgZXtx3qjMwHrMFFBl+FyUEPsQC
	XriRQa0BrO5nahRo9UA5ks1+5muTZNQDhIcFR6LEIcpQX1/r3i8WcvzelGi+hEcyO7zM08jJ5f5
	KvbI8W2A3pEf8W7k0jsXQQ39oK/Py3KeBkUxHpV5w2qXkwfsiGkl4Ht9o2awZLCPK+GQxZpfnMi
	sPqqlKvSFHq6ajJazhihAuG1tPCYPChqywIwKY5bOQSZwYXXPeUNlRJk4qPrBrRrYQ=
X-Google-Smtp-Source: AGHT+IH3Mqx6wcZJQ8KT9JLikkYEvGtdVJ5len2jFu7r4XW6F6I79x4gGoHLEmQqwajtY+NAGrsbHA==
X-Received: by 2002:a05:6512:318e:b0:53e:39f0:4bbd with SMTP id 2adb3069b0e04-540240c982amr1388787e87.21.1733833185342;
        Tue, 10 Dec 2024 04:19:45 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------jmoKaTs5QomEdFFe7PM0f7KF"
Message-ID: <a85319ab-b6bb-4be4-be6c-032feceede7c@gmail.com>
Date: Tue, 10 Dec 2024 13:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] xen/riscv: introduce cache management operations
 (CMO)
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <1310a2fb3b9824ae66f850600925127fdfdb44fa.1732709650.git.oleksii.kurochko@gmail.com>
 <9d49befe-4592-4e71-ad0b-9a0af34253f5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9d49befe-4592-4e71-ad0b-9a0af34253f5@suse.com>

This is a multi-part message in MIME format.
--------------jmoKaTs5QomEdFFe7PM0f7KF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/9/24 3:38 PM, Jan Beulich wrote:
> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/Kconfig
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -14,6 +14,9 @@ config ARCH_DEFCONFIG
>>   	string
>>   	default "arch/riscv/configs/tiny64_defconfig"
>>   
>> +config HAS_CMO # Cache Management Operations
>> +	bool
> Hmm, and nothing ever sets this, and hence ...
>
>> @@ -148,9 +149,24 @@ static inline bool pte_is_mapping(pte_t p)
>>       return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>>   }
>>   
>> +#ifndef HAS_CMO
>> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +#else
>> +int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size);
>> +int clean_dcache_va_range(const void *p, unsigned long size);
>> +#endif
> ... all you really provide are stubs and declarations, but no
> definition anywhere?

Yes, this was done intentionally because:
- I don't have hardware with the CMO extension, so I can't test it. ( QEMU doesn't model cache and so
   there is no need for CMO extension emulation IIUC )
- The instructions used for these functions may be hardware-specific and exist only for particular devices.

It seems useful to have something similar to Linux:
https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135 <https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135>
(There are also custom instructions for THEAD above this macro.)

We could use|ALT_CMO_OP(...)| inside|clean_and_invalidate_dcache_va_range()| and|clean_dcache_va_range()|.
However, I think it would be better to introduce or implement these functions when|HAS_CMO| is set to|y| someday.

As an alternative, we could implement these functions as|panic("need to be implemented\n")| in case when HAS_CMO=y.

Another option is to drop|HAS_CMO| entirely for now and keep the current implementation (|return -EOPNOTSUPP|).
However, with this approach, there's a risk of encountering hard-to-debug issues on platforms with the CMO extension.
And necessity of implementation of these could be missed because there is no any notification...

>
> Plus of course this gets us into feature detection territory again: If
> RISC-V provided a way to detect presence / absence of certain extensions,
> this really shouldn't be a compile time setting, but be determined
> dynamically.

This is the next patch I plan to send after this patch series:
https://gitlab.com/xen-project/people/olkur/xen/-/commit/f81ae67c42854073da5403210c9e31de6b0ee5bd <https://gitlab.com/xen-project/people/olkur/xen/-/commit/f81ae67c42854073da5403210c9e31de6b0ee5bd>

It "detects" available extensions based on a device tree property. While this is not the best approach
(the ideal solution would be hardware having a register that lists all available extensions), it seems to be
the best option available at the moment.

Another option I considered was introducing a new SBI call, delegating the responsibility to OpenSBI
to provide this information.

>
>>   static inline void invalidate_icache(void)
>>   {
>> -    BUG_ON("unimplemented");
>> +    asm volatile ( "fence.i" ::: "memory" );
>>   }
> That's a separate extension, Zifencei, which I don't think you can just
> assume to be present?

Based on the specification:
```
Chapter 34. RV32/64G Instruction Set Listings
One goal of the RISC-V project is that it be used as a stable software development target. For this
purpose, we define a combination of a base ISA (RV32I or RV64I) plus selected standard extensions
(IMAFD, Zicsr, Zifencei) as a "general-purpose" ISA, and we use the abbreviation G for the
IMAFDZicsr_Zifencei combination of instruction-set extensions. This chapter presents opcode maps
and instruction-set listings for RV32G and RV64G
```
and that G is needed to boot Linux kernel ( and so Xen ) I make an assumption that Zifencei will be always
present.

And based on Linux code (https://elixir.bootlin.com/linux/v6.12.4/source/arch/riscv/kernel/cpufeature.c#L676 )
when 'i' is present in riscv,isa property zifencei is present unconditionally.

~ Oleksii

--------------jmoKaTs5QomEdFFe7PM0f7KF
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
    <div class="moz-cite-prefix">On 12/9/24 3:38 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9d49befe-4592-4e71-ad0b-9a0af34253f5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 27.11.2024 13:50, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -14,6 +14,9 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config HAS_CMO # Cache Management Operations
+	bool
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, and nothing ever sets this, and hence ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -148,9 +149,24 @@ static inline bool pte_is_mapping(pte_t p)
     return (p.pte &amp; PTE_VALID) &amp;&amp; (p.pte &amp; PTE_ACCESS_MASK);
 }
 
+#ifndef HAS_CMO
+static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+    return -EOPNOTSUPP;
+}
+#else
+int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size);
+int clean_dcache_va_range(const void *p, unsigned long size);
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... all you really provide are stubs and declarations, but no
definition anywhere?</pre>
    </blockquote>
    <pre>Yes, this was done intentionally because:
- I don't have hardware with the CMO extension, so I can't test it. ( QEMU doesn't model cache and so
  there is no need for CMO extension emulation IIUC )
- The instructions used for these functions may be hardware-specific and exist only for particular devices.

</pre>
    <pre>It seems useful to have something similar to Linux:
<a rel="noopener" target="_new"
href="https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135"><span>https</span><span>://elixir</span><span>.bootlin</span><span>.com</span><span>/linux</span><span>/v6.6.64</span><span>/source</span><span>/arch</span><span>/riscv</span><span>/include</span><span>/asm</span><span>/errata_list</span><span>.h</span><span>#L135</span></a>
(There are also custom instructions for THEAD above this macro.)</pre>
    <pre>We could use <code>ALT_CMO_OP(...)</code> inside <code>clean_and_invalidate_dcache_va_range()</code> and <code>clean_dcache_va_range()</code>.
However, I think it would be better to introduce or implement these functions when <code>HAS_CMO</code> is set to <code>y</code> someday.

</pre>
    <pre>As an alternative, we could implement these functions as <code>panic("need to be implemented\n")</code> in case when HAS_CMO=y.

Another option is to drop <code>HAS_CMO</code> entirely for now and keep the current implementation (<code>return -EOPNOTSUPP</code>).
However, with this approach, there's a risk of encountering hard-to-debug issues on platforms with the CMO extension.
And necessity of implementation of these could be missed because there is no any notification...

</pre>
    <blockquote type="cite"
      cite="mid:9d49befe-4592-4e71-ad0b-9a0af34253f5@suse.com">
      <pre wrap="" class="moz-quote-pre">

Plus of course this gets us into feature detection territory again: If
RISC-V provided a way to detect presence / absence of certain extensions,
this really shouldn't be a compile time setting, but be determined
dynamically.</pre>
    </blockquote>
    <pre>This is the next patch I plan to send after this patch series:
<a rel="noopener" target="_new"
href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/f81ae67c42854073da5403210c9e31de6b0ee5bd"><span>https</span><span>://gitlab</span><span>.com</span><span>/xen</span><span>-project</span><span>/people</span><span>/olkur</span><span>/xen</span><span>/-/commit</span><span>/f81ae67c42854073da5403210c9e31de6b0ee5bd</span></a></pre>
    <pre>It "detects" available extensions based on a device tree property. While this is not the best approach
(the ideal solution would be hardware having a register that lists all available extensions), it seems to be
the best option available at the moment.</pre>
    <pre>Another option I considered was introducing a new SBI call, delegating the responsibility to OpenSBI
to provide this information.</pre>
    <pre></pre>
    <blockquote type="cite"
      cite="mid:9d49befe-4592-4e71-ad0b-9a0af34253f5@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> static inline void invalidate_icache(void)
 {
-    BUG_ON("unimplemented");
+    asm volatile ( "fence.i" ::: "memory" );
 }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's a separate extension, Zifencei, which I don't think you can just
assume to be present?</pre>
    </blockquote>
    <pre>Based on the specification:
```
Chapter 34. RV32/64G Instruction Set Listings
One goal of the RISC-V project is that it be used as a stable software development target. For this
purpose, we define a combination of a base ISA (RV32I or RV64I) plus selected standard extensions
(IMAFD, Zicsr, Zifencei) as a "general-purpose" ISA, and we use the abbreviation G for the
IMAFDZicsr_Zifencei combination of instruction-set extensions. This chapter presents opcode maps
and instruction-set listings for RV32G and RV64G
```
and that G is needed to boot Linux kernel ( and so Xen ) I make an assumption that Zifencei will be always
present.

And based on Linux code ( <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.12.4/source/arch/riscv/kernel/cpufeature.c#L676">https://elixir.bootlin.com/linux/v6.12.4/source/arch/riscv/kernel/cpufeature.c#L676</a> )
when 'i' is present in riscv,isa property zifencei is present unconditionally.

~ Oleksii
</pre>
  </body>
</html>

--------------jmoKaTs5QomEdFFe7PM0f7KF--

