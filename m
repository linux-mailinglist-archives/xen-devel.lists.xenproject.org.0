Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04AE9EB511
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852763.1266471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2DF-0004iL-5l; Tue, 10 Dec 2024 15:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852763.1266471; Tue, 10 Dec 2024 15:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2DF-0004gf-2y; Tue, 10 Dec 2024 15:31:49 +0000
Received: by outflank-mailman (input) for mailman id 852763;
 Tue, 10 Dec 2024 15:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tL2DE-0004ZK-9K
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:31:48 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd9f893d-b70b-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 16:31:46 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3e829ff44so5354502a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:31:46 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6260e8af8sm847810266b.191.2024.12.10.07.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:31:45 -0800 (PST)
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
X-Inumbo-ID: dd9f893d-b70b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844706; x=1734449506; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQQwyrOiXs9wQRzf6OTbTRmqzabvPyR2Prbr4nAcO0M=;
        b=T3mPCMW1snBqQiZ1kv2snNnIzh20F6CWDFvfEWEFu5rMVV02n2oKokPByL11On6OLb
         dPq81n3WGXzj78dUguuzIU4Cgf/pa6BJrQmj0eANbN17ItDmE6pPHOQ1ZWOuHrJOrO08
         8dmQ4mHc+ah/zsV4y0dQSEQ1xU/CG3wfSrXnFPaWCgPkTyxPJS5+75UY6E4FXePsUyEN
         8qipR8eLKjHAcXEgUrSyVJPkQAh9lLd6IbaAxX6QG5dV/YTIAK99Sa/XGH6wxLNaURGA
         9prnb3BSfE+8egSaJ52ZLoiaxkMMJ5J5ldwXwno40THSOAvFS0kiqPej0w5vK68B63N6
         BTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844706; x=1734449506;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQQwyrOiXs9wQRzf6OTbTRmqzabvPyR2Prbr4nAcO0M=;
        b=d8V49jOxGa8ByqJcZLZuiUpdG0lhZAb9glux+Yn75vrl6YQSAlOa6yrs/rnJXvltF9
         w1JyoyqLLadrdQNVvK6kGRBPOTtw/gSCAXqNlnVTMIoC/i/2Wg3JOCcDhgb4fnIGGm48
         eh6kF3IS0POrOPyGfjE9A8x4Sdwe8MtEdxDofcc2gOPubFIDVMmr0M2Kpvlfc/is3QUt
         N7eClP+UTgoLqSlue0nlCwmRiTsoePqjHMTaYQkqYzIFnR53BrQ2zoTj6ddUdZufmQUp
         IMEvcIy2+cSK5fXLXptPGQQLy4vyAGQul1M4diJ1OOqVjhmNLZYC7j5bxpQjfP9Ppd7I
         V+pA==
X-Forwarded-Encrypted: i=1; AJvYcCU4Iv66eG3ygADUAXwdeIiCMgrEIbtbe+gUlvMbzo7FLfWRwTvNZ6sWNh884gP6Lan8KyR5dUzsGFA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzt8J6kYlzwRPsFBjCUDgXXFIwSShjKMwiLsxAEl8AAEpi43/up
	k6e5iiWBjsbd/U8/5UP2EPgmoo1r/oBq+MNH7flHFWhJ8AWBA8Ku
X-Gm-Gg: ASbGncvofAOo81lxZEJmv2PE/aINI9p8HdfilfYccgcnW4ttwNHgKbTE6+xSCDrFKc/
	1oWpEZuoqI3bBfiEaUgF9g7FPc4s7En5SgZ3lfOqXgC2mnuWCHNj3vZbenFz15GT1vaCkllWhfI
	WDfhfwpqxfK3yyXABdeH8b2ePzSFZuMvRgRNpAM0OptnccefoaqRk8k3tmxLwgnYn16od2OT+uy
	S6VHrwcpmrGG5JTWAZ4+5Q6eihtleaQhiMFhchy0PQ7CuESY4vkO84oHb6ap7pGNOw=
X-Google-Smtp-Source: AGHT+IHsEqH3wph9DEBW4OgU4CKgPaWwJMMKcRMkm/WeSjCVMHfz3u3XRRUrPFyRJRT2rwBg7qC96g==
X-Received: by 2002:a17:907:6092:b0:aa6:9229:352a with SMTP id a640c23a62f3a-aa6a02fabeamr328396266b.26.1733844705509;
        Tue, 10 Dec 2024 07:31:45 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------W5ULcycpnm84ThRl3A4dX1ps"
Message-ID: <5b3b23a6-6e73-40af-95b6-65be22ad63bb@gmail.com>
Date: Tue, 10 Dec 2024 16:31:44 +0100
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
 <a85319ab-b6bb-4be4-be6c-032feceede7c@gmail.com>
 <a599a06b-afcb-46f3-bdb9-0536c45907ba@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a599a06b-afcb-46f3-bdb9-0536c45907ba@suse.com>

This is a multi-part message in MIME format.
--------------W5ULcycpnm84ThRl3A4dX1ps
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/10/24 1:39 PM, Jan Beulich wrote:
> On 10.12.2024 13:19, Oleksii Kurochko wrote:
>> On 12/9/24 3:38 PM, Jan Beulich wrote:
>>> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/Kconfig
>>>> +++ b/xen/arch/riscv/Kconfig
>>>> @@ -14,6 +14,9 @@ config ARCH_DEFCONFIG
>>>>        string
>>>>        default "arch/riscv/configs/tiny64_defconfig"
>>>>    +config HAS_CMO # Cache Management Operations
>>>> +    bool
>>> Hmm, and nothing ever sets this, and hence ...
>>>
>>>> @@ -148,9 +149,24 @@ static inline bool pte_is_mapping(pte_t p)
>>>>        return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>>>>    }
>>>>    +#ifndef HAS_CMO
>>>> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>>>> +{
>>>> +    return -EOPNOTSUPP;
>>>> +}
>>>> +
>>>> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
>>>> +{
>>>> +    return -EOPNOTSUPP;
>>>> +}
>>>> +#else
>>>> +int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size);
>>>> +int clean_dcache_va_range(const void *p, unsigned long size);
>>>> +#endif
>>> ... all you really provide are stubs and declarations, but no
>>> definition anywhere?
>> Yes, this was done intentionally because:
>> - I don't have hardware with the CMO extension, so I can't test it. ( QEMU doesn't model cache and so
>>    there is no need for CMO extension emulation IIUC )
>> - The instructions used for these functions may be hardware-specific and exist only for particular devices.
>>
>> It seems useful to have something similar to Linux:
>> https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135 <https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135>
>> (There are also custom instructions for THEAD above this macro.)
>>
>> We could use|ALT_CMO_OP(...)| inside|clean_and_invalidate_dcache_va_range()| and|clean_dcache_va_range()|.
>> However, I think it would be better to introduce or implement these functions when|HAS_CMO| is set to|y| someday.
>>
>> As an alternative, we could implement these functions as|panic("need to be implemented\n")| in case when HAS_CMO=y.
> I think this would be well in line with various other stubs you have.
>
>> Another option is to drop|HAS_CMO| entirely for now and keep the current implementation (|return -EOPNOTSUPP|).
>> However, with this approach, there's a risk of encountering hard-to-debug issues on platforms with the CMO extension.
>> And necessity of implementation of these could be missed because there is no any notification...
> Well, callers ought to check return values?

Yeah, callers should check return value but we still have to introduce then a new KConfig ( config QEMU ) and then implementation
will look like:
   static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
   {
   #ifdef CONFIG_QEMU
     return 0;
   #else
     return -EOPNOTSUPP;
   #endif
   }

   static inline int clean_dcache_va_range(const void *p, unsigned long size)
   {
   #ifdef CONFIG_QEMU
     return 0;
   #else
     return -EOPNOTSUPP;
   #endif
   }

>
>>>>    static inline void invalidate_icache(void)
>>>>    {
>>>> -    BUG_ON("unimplemented");
>>>> +    asm volatile ( "fence.i" ::: "memory" );
>>>>    }
>>> That's a separate extension, Zifencei, which I don't think you can just
>>> assume to be present?
>> Based on the specification:
>> ```
>> Chapter 34. RV32/64G Instruction Set Listings
>> One goal of the RISC-V project is that it be used as a stable software development target. For this
>> purpose, we define a combination of a base ISA (RV32I or RV64I) plus selected standard extensions
>> (IMAFD, Zicsr, Zifencei) as a "general-purpose" ISA, and we use the abbreviation G for the
>> IMAFDZicsr_Zifencei combination of instruction-set extensions. This chapter presents opcode maps
>> and instruction-set listings for RV32G and RV64G
>> ```
> Hmm, indeed. That's well hidden in a place I didn't expect it to live at.
> Maybe worth a sentence in the description?

Sure, I will update the description. ( and probably add the comment above invalidate_icache() function )

>> and that G is needed to boot Linux kernel ( and so Xen ) I make an assumption that Zifencei will be always
>> present.
> I'd be a little careful here. Xen may be used in Linux-free environments.
> I notice arch.mk specifies rv64g, yet I'm uncertain we shouldn't relax
> that at some point.
>
>> And based on Linux code (https://elixir.bootlin.com/linux/v6.12.4/source/arch/riscv/kernel/cpufeature.c#L676 )
>> when 'i' is present in riscv,isa property zifencei is present unconditionally.
> That looks questionable to me. I don't think Zifencei can be inferred from
> I. Historically it was, and imo that's what the comment there says. Plus
> it is dependent upon acpi_disabled.

Agree with you here. And it was the reason why I dropped this if-condition when I ported cpufeature.c to Xen.



~ Oleksii

--------------W5ULcycpnm84ThRl3A4dX1ps
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
    <div class="moz-cite-prefix">On 12/10/24 1:39 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a599a06b-afcb-46f3-bdb9-0536c45907ba@suse.com">
      <pre wrap="" class="moz-quote-pre">On 10.12.2024 13:19, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 12/9/24 3:38 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 27.11.2024 13:50, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -14,6 +14,9 @@ config ARCH_DEFCONFIG
      string
      default "arch/riscv/configs/tiny64_defconfig"
  +config HAS_CMO # Cache Management Operations
+    bool
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Hmm, and nothing ever sets this, and hence ...

</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">@@ -148,9 +149,24 @@ static inline bool pte_is_mapping(pte_t p)
      return (p.pte &amp; PTE_VALID) &amp;&amp; (p.pte &amp; PTE_ACCESS_MASK);
  }
  +#ifndef HAS_CMO
+static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
+{
+    return -EOPNOTSUPP;
+}
+
+static inline int clean_dcache_va_range(const void *p, unsigned long size)
+{
+    return -EOPNOTSUPP;
+}
+#else
+int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size);
+int clean_dcache_va_range(const void *p, unsigned long size);
+#endif
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">... all you really provide are stubs and declarations, but no
definition anywhere?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, this was done intentionally because:
- I don't have hardware with the CMO extension, so I can't test it. ( QEMU doesn't model cache and so
  there is no need for CMO extension emulation IIUC )
- The instructions used for these functions may be hardware-specific and exist only for particular devices.

It seems useful to have something similar to Linux:
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135">https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135</a> <a class="moz-txt-link-rfc2396E" href="https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135">&lt;https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135&gt;</a>
(There are also custom instructions for THEAD above this macro.)

We could use|ALT_CMO_OP(...)| inside|clean_and_invalidate_dcache_va_range()| and|clean_dcache_va_range()|.
However, I think it would be better to introduce or implement these functions when|HAS_CMO| is set to|y| someday.

As an alternative, we could implement these functions as|panic("need to be implemented\n")| in case when HAS_CMO=y.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think this would be well in line with various other stubs you have.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Another option is to drop|HAS_CMO| entirely for now and keep the current implementation (|return -EOPNOTSUPP|).
However, with this approach, there's a risk of encountering hard-to-debug issues on platforms with the CMO extension.
And necessity of implementation of these could be missed because there is no any notification...
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, callers ought to check return values?</pre>
    </blockquote>
    <pre>Yeah, callers should check return value but we still have to introduce then a new KConfig ( config QEMU ) and then implementation
will look like:
  static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
  {
  #ifdef CONFIG_QEMU
    return 0;
  #else
    return -EOPNOTSUPP;
  #endif
  }

  static inline int clean_dcache_va_range(const void *p, unsigned long size)
  {
  #ifdef CONFIG_QEMU
    return 0;
  #else
    return -EOPNOTSUPP;
  #endif
  }</pre>
    <blockquote type="cite"
      cite="mid:a599a06b-afcb-46f3-bdb9-0536c45907ba@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">  static inline void invalidate_icache(void)
  {
-    BUG_ON("unimplemented");
+    asm volatile ( "fence.i" ::: "memory" );
  }
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">That's a separate extension, Zifencei, which I don't think you can just
assume to be present?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Based on the specification:
```
Chapter 34. RV32/64G Instruction Set Listings
One goal of the RISC-V project is that it be used as a stable software development target. For this
purpose, we define a combination of a base ISA (RV32I or RV64I) plus selected standard extensions
(IMAFD, Zicsr, Zifencei) as a "general-purpose" ISA, and we use the abbreviation G for the
IMAFDZicsr_Zifencei combination of instruction-set extensions. This chapter presents opcode maps
and instruction-set listings for RV32G and RV64G
```
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hmm, indeed. That's well hidden in a place I didn't expect it to live at.
Maybe worth a sentence in the description?</pre>
    </blockquote>
    <pre>Sure, I will update the description. ( and probably add the comment above invalidate_icache() function )

</pre>
    <blockquote type="cite"
      cite="mid:a599a06b-afcb-46f3-bdb9-0536c45907ba@suse.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">and that G is needed to boot Linux kernel ( and so Xen ) I make an assumption that Zifencei will be always
present.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'd be a little careful here. Xen may be used in Linux-free environments.
I notice arch.mk specifies rv64g, yet I'm uncertain we shouldn't relax
that at some point.</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:a599a06b-afcb-46f3-bdb9-0536c45907ba@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">And based on Linux code (<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.12.4/source/arch/riscv/kernel/cpufeature.c#L676">https://elixir.bootlin.com/linux/v6.12.4/source/arch/riscv/kernel/cpufeature.c#L676</a> )
when 'i' is present in riscv,isa property zifencei is present unconditionally.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That looks questionable to me. I don't think Zifencei can be inferred from
I. Historically it was, and imo that's what the comment there says. Plus
it is dependent upon acpi_disabled.</pre>
    </blockquote>
    <pre>Agree with you here. And it was the reason why I dropped this if-condition when I ported cpufeature.c to Xen.



~ Oleksii
</pre>
  </body>
</html>

--------------W5ULcycpnm84ThRl3A4dX1ps--

