Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04142A9AF01
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 15:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966330.1356568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7weY-0002eO-EI; Thu, 24 Apr 2025 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966330.1356568; Thu, 24 Apr 2025 13:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7weY-0002c4-Bj; Thu, 24 Apr 2025 13:30:10 +0000
Received: by outflank-mailman (input) for mailman id 966330;
 Thu, 24 Apr 2025 13:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yjef=XK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7weW-0002by-4Q
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 13:30:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c65382a-2110-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 15:30:06 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ace333d5f7bso184470566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 06:30:06 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace59820923sm108386366b.33.2025.04.24.06.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 06:30:04 -0700 (PDT)
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
X-Inumbo-ID: 3c65382a-2110-11f0-9eb2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745501406; x=1746106206; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzguls3Vu8q5nSCIy1UEvoc69a/RTh12WQpaMmqr528=;
        b=ByKcizj98nxZyNzKR0wcCqjJ+WnMd44hYNL96Zznz7BfNL5Rz0AjCnm6CQRaNN+FSk
         9BMYaQIp7bp02rR17AKWfDNwkpe5BjaMBkHx9qwklt2GTEs7/8NmO7Ltn+pdpm1yqd2f
         NB8RWPsz7L+5pPZQZZ5CtIo98RhDQ7ddyhMzr7AiNPQ5ZRPe7PRSOjY5VlPJAlrhohQB
         NtsmUdszWO7xnAU9pJDTJibapW8bIJ9UQvmq88WW6THEbdvaZHPXq7hxzwLmPPThRZkc
         fheoozem9Gryc8zeFCoe0keN+5+579MW81sxIqDrIkSuw8NlTR82Ge3yfEHJReAn1d3k
         vUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501406; x=1746106206;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rzguls3Vu8q5nSCIy1UEvoc69a/RTh12WQpaMmqr528=;
        b=HzkC+fVJItVb/8oQDOOjr5AHyiK1s1Vz+jJfAXbyiagUiCcUFvOrdE7riCEfH+kxNE
         V7QoK8QA6xBpX82QQwy80AGt3/j26561Ba+OY80/An2/t0OTnDe9ER3NJ1kMMdmUaGIh
         5xajHw3aZe5HybkTuUflGT9VqbptpBvoI29jtSGm+mzBMnoimPwMhQVt6DCPOvcDlVw8
         ahTeqTRp8U5QFhCVTK19Eww0HO5tmX01YLI4esNXtfHVSMfK8oMSxAMSE6dPFlwhMpX8
         wYw7s2ME5yMVFqngmA+S7drYHXHAlaip2iYFeIIETflmHJG86WVjhsoJPARFXECbS9RD
         QdZw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ57yt3aoWtymbqoZsLHAnUYs/ulBlgjU+/hUtsptMJ/ObY5b1dGk0hDLQKP9NTM//Y6JewpvS+Bw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwN4vUyXHx8B5tx49VVGx9IHDbvI9tHDPGjHC7egJU57w6H27E
	otQl4QZrBNWh5hjaOocR4jbRB/DAriMGgQ58NNy4V6KyT38EAyjY
X-Gm-Gg: ASbGncu2MiNBK3hVMG8V8OkTOMnPD3E12wFbpa958jJ7r3EqKLb+B/J3eE5lz8AvBN8
	Z6p9ZzKYKO9r3xXF/0mKT9zA/27ObFQboa0FIJ3O2WTfjTH9C658C6G19itNEvFBCDpIIegD4+a
	0qn40QllTk2HXHj5qHe5c/8uNzyXfIAosWXFltf4DEg1ZPS2/UR4ZLTAL0SXIhKeTNyNdLv8qCB
	ywxQYT6Vzrgu5MVjywL+F4vIMGqage0voaANFuaGsD8MrujWjne3tS8yKXmA1ypg0AbloI04pGB
	6puB7sXHnIxvdWR+rTsj/br9U0W7IxZkVGd4rTNwAQlpVd4F2cME8rEKYUkOiJcC70Y0tbtpmKe
	WzOqOTvx+tjxTMkSq
X-Google-Smtp-Source: AGHT+IE7Wp/uFUjJcvanGTajBDDnv+FYDtKUstetKjn3OPu4UpDtYlkRqKaYtvbaBimUM4GTVusA/Q==
X-Received: by 2002:a17:907:a4e:b0:abf:6e6a:885c with SMTP id a640c23a62f3a-ace57283e71mr257186566b.23.1745501405419;
        Thu, 24 Apr 2025 06:30:05 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------fZiyz4mApGCz5FywkcbWgRT2"
Message-ID: <9ecef427-2b2c-4495-abd9-716e7c844982@gmail.com>
Date: Thu, 24 Apr 2025 15:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/14] xen/riscv: introduce ioremap()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <6d91eeabe2735de93bfcf2a2420e2059a8f35e52.1744126720.git.oleksii.kurochko@gmail.com>
 <84089b6d-efeb-4613-85b9-eb10d11d7338@suse.com>
 <f315bc11-c537-4dca-9e62-a6d3f02733e4@gmail.com>
 <6b226b72-11a4-4004-b42d-0e280de83539@suse.com>
 <bbfdc4a0-54f0-4a9d-aa6d-2cf85ec03411@gmail.com>
 <a71db245-5b0b-435e-8e58-cb43c5162862@suse.com>
 <7d5356a5-53b7-4d1b-82ff-bc6f81a2f445@gmail.com>
 <6f50dea4-60e6-46b0-9363-d943ba553334@suse.com>
 <676c1627-95a0-46a0-b132-3f3ac2fdda01@gmail.com>
 <28142d86-0845-4bb3-a0bb-e4903f898abf@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <28142d86-0845-4bb3-a0bb-e4903f898abf@suse.com>

This is a multi-part message in MIME format.
--------------fZiyz4mApGCz5FywkcbWgRT2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/22/25 11:14 AM, Jan Beulich wrote:
> On 22.04.2025 10:40, Oleksii Kurochko wrote:
>> On 4/17/25 4:49 PM, Jan Beulich wrote:
>>> On 17.04.2025 16:37, Oleksii Kurochko wrote:
>>>> On 4/17/25 4:24 PM, Jan Beulich wrote:
>>>>> On 17.04.2025 16:20, Oleksii Kurochko wrote:
>>>>>> On 4/15/25 1:02 PM, Jan Beulich wrote:
>>>>>>> On 15.04.2025 12:29, Oleksii Kurochko wrote:
>>>>>>>> On 4/10/25 5:13 PM, Jan Beulich wrote:
>>>>>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>>>>>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
>>>>>>>>>> ```
>>>>>>>>>> For implementations that conform to the RISC-V Unix Platform Specification,
>>>>>>>>>> I/O devices and DMA operations are required to access memory coherently and
>>>>>>>>>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>>>>>>>>>> regions that are concurrently accessed by external devices can also use the
>>>>>>>>>> standard synchronization mechanisms. Implementations that do not conform
>>>>>>>>>> to the Unix Platform Specification and/or in which devices do not access
>>>>>>>>>> memory coherently will need to use mechanisms
>>>>>>>>>> (which are currently platform-specific or device-specific) to enforce
>>>>>>>>>> coherency.
>>>>>>>>>>
>>>>>>>>>> I/O regions in the address space should be considered non-cacheable
>>>>>>>>>> regions in the PMAs for those regions. Such regions can be considered coherent
>>>>>>>>>> by the PMA if they are not cached by any agent.
>>>>>>>>>> ```
>>>>>>>>>> and [1]:
>>>>>>>>>> ```
>>>>>>>>>> The current riscv linux implementation requires SOC system to support
>>>>>>>>>> memory coherence between all I/O devices and CPUs. But some SOC systems
>>>>>>>>>> cannot maintain the coherence and they need support cache clean/invalid
>>>>>>>>>> operations to synchronize data.
>>>>>>>>>>
>>>>>>>>>> Current implementation is no problem with SiFive FU540, because FU540
>>>>>>>>>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>>>>>>>>>> traditional SOC vendor, it may already have a stable non-coherency SOC
>>>>>>>>>> system, the need is simply to replace the CPU with RV CPU and rebuild
>>>>>>>>>> the whole system with IO-coherency is very expensive.
>>>>>>>>>> ```
>>>>>>>>>>
>>>>>>>>>> and the fact that all known ( to me ) CPUs that support the H-extension
>>>>>>>>>> and that ones is going to be supported by Xen have memory coherency
>>>>>>>>>> between all I/O devices and CPUs, so it is currently safe to use the
>>>>>>>>>> PAGE_HYPERVISOR attribute.
>>>>>>>>>> However, in cases where a platform does not support memory coherency, it
>>>>>>>>>> should support CMO extensions and Svpbmt. In this scenario, updates to
>>>>>>>>>> ioremap will be necessary.
>>>>>>>>>> For now, a compilation error will be generated to ensure that the need to
>>>>>>>>>> update ioremap() is not overlooked.
>>>>>>>>>>
>>>>>>>>>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
>>>>>>>>> But MMIO access correctness isn't just a matter of coherency. There may not
>>>>>>>>> be any caching involved in most cases, or else you may observe significantly
>>>>>>>>> delayed or even dropped (folded with later ones) writes, and reads may be
>>>>>>>>> serviced from the cache instead of going to actual MMIO. Therefore ...
>>>>>>>>>
>>>>>>>>>> --- a/xen/arch/riscv/Kconfig
>>>>>>>>>> +++ b/xen/arch/riscv/Kconfig
>>>>>>>>>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>>>>>>>>>       	string
>>>>>>>>>>       	default "arch/riscv/configs/tiny64_defconfig"
>>>>>>>>>>       
>>>>>>>>>> +config HAS_SVPBMT
>>>>>>>>>> +	bool
>>>>>>>>>> +	help
>>>>>>>>>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>>>>>>>>>> +	  page-based memory types).
>>>>>>>>>> +
>>>>>>>>>> +	  The memory type for a page contains a combination of attributes
>>>>>>>>>> +	  that indicate the cacheability, idempotency, and ordering
>>>>>>>>>> +	  properties for access to that page.
>>>>>>>>>> +
>>>>>>>>>> +	  The Svpbmt extension is only available on 64-bit cpus.
>>>>>>>>> ... I kind of expect this extension (or anything else that there might be) will need
>>>>>>>>> making use of.
>>>>>>>> In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
>>>>>>>> is used to control which memory regions are cacheable, non-cacheable, readable, writable,
>>>>>>>> etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
>>>>>>>> cores, or it can be fixed at design time, as in SiFive cores.
>>>>>>> How would things work if there was a need to map a RAM page uncacheable (via
>>>>>>> ioremap() or otherwise)?
>>>>>> My understanding is that Svpbmt is only needed when someone wants to change the memory
>>>>>> attribute of a page set by PMA.
>>>>>>
>>>>>> The question is if non-cacheable RAM page is really needed if we have a coherency?
>>>>> Aiui coherency here is among CPUs.
>>>> ```
>>>> For implementations that conform to the RISC-V Unix Platform Specification,
>>>> I/O devices and DMA operations are required to access memory coherently and
>>>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>>>> regions that are concurrently accessed by external devices can also use the
>>>> standard synchronization mechanisms. Implementations that do not conform
>>>> to the Unix Platform Specification and/or in which devices do not access
>>>> memory coherently will need to use mechanisms
>>>> (which are currently platform-specific or device-specific) to enforce
>>>> coherency.
>>>> ```
>>>> Based on this from the spec, coherency here is not only among CPUs.
>>>>
>>>>
>>>>> Properties of devices in the system are
>>>>> largely unknown?
>>>> Yes, but still not sure what kind of property requires ioremap() which won't work
>>>> without Svpmbt. Could you please tell me an example?
>>> Well, above you said they all need to access memory coherently. That's the
>>> "property" I was referring to.
>> Do you mean that device could have a property which tell that it would like to have non-cachable
>> region used for that? I haven't seen such property in device tree files.
>>
>> Do we have in Xen cases when Xen wants to have map part of RAM as non-cachebale and it is only the
>> one option?
> On x86 we have the case that IOMMUs may access memory non-coherently. This is
> particular means that IOMMU page table updates (which necessarily live in RAM)
> need to be done quite carefully. As it's all our code, we deal with the
> situation by issuing cache flushes, avoiding the need for UC mappings.
>
> Graphics engines may have similar constraints, aiui. With the driver code not
> being part of Xen, we wouldn't be able to use a similar "simplification" there.
> UC mappings would be pretty much unavoidable.

For this case, it would be better to have Svpmbt.

I would like to noted that Svpmbt isn't supported by RV32 architectures. For such cases, it will be still
needed to play with PMA.
I found today a patch in Linux kernel which does something similar to what I wrote in one of my previous
replies:
   [0]https://lore.kernel.org/all/20241102000843.1301099-1-samuel.holland@sifive.com/
In the cover letter [0] it is mentioned the following:
   On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
   RAM is mapped to multiple physical address ranges, with each alias
   having a different set of statically-determined Physical Memory
   Attributes (PMAs). Software selects the PMAs for a page by choosing a
   PFN from the corresponding physical address range. On these platforms,
   this is the only way to allocate noncached memory for use with
   noncoherent DMA.

So firmware should configure PMAs so some part of RAM is noncached and then kernel get this info based
on the binding:
   https://patchew.org/linux/20241102000843.1301099-1-samuel.holland@sifive.com/20241102000843.1301099-2-samuel.holland@sifive.com/

Considering that this feature isn't available even in Linux kernel, we can start with assumption that all
our SoCs will support Svpmbt.

We don't really care about StarFive JH7100 as it doesn't support H extension, but we potentially should care
about ESWIN EIC7700, which support H extension and doesn't support Svpmbt extension according to a datasheet
publicly available:
   Each EIC7700X core is configured to support the RV64I base ISA, as well as the Multiply (M), Atomic(A),
   Single-Precision Floating Point (F), Double-Precision Floating Point (D), Compressed (C), CSR
   Instructions (Zicsr), Instruction-Fetch Fence (Zifencei), Address Calculation (Zba), Basic Bit
   Manipulation (Zbb), and Count Overflow and Mode-Based Filtering (Sscofpmf) RISC‑V extensions. This
   is captured by the RISC‑V extension string: RV64GC_Zba_Zbb_Sscofpmf.

>
>> I am also thinking why it can't be used cachable region + barrier (if we don't have memory coherency
>> for everything).
> Not sure what exactly you're asking here (if anything). An answer would very
> likely depend on the specific kind of barrier you're thinking about. The
> question would be what, if any, effect a barrier would have on the cache(s).

I confused barrier with cache flushes (when I wrote that I thought about the case of DMA that we don't really
should have requirement of non-cachable memory for DMA as it is enough to have memory fence between use of DMA
memory and MMIO that triggers the dma), basically I meant what you wrote above about x86's IOMMUs.

~ Oleksii

>
>> Anyway, if it isn't an option to have mapped cacheble region + barrier then there is no any choice
>> and the support of Svpmbt is required.
> Quite possible.
>
> Jan
--------------fZiyz4mApGCz5FywkcbWgRT2
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
    <div class="moz-cite-prefix">On 4/22/25 11:14 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:28142d86-0845-4bb3-a0bb-e4903f898abf@suse.com">
      <pre wrap="" class="moz-quote-pre">On 22.04.2025 10:40, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/17/25 4:49 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 17.04.2025 16:37, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 4/17/25 4:24 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 17.04.2025 16:20, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">On 4/15/25 1:02 PM, Jan Beulich wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">On 15.04.2025 12:29, Oleksii Kurochko wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">On 4/10/25 5:13 PM, Jan Beulich wrote:
</pre>
                    <blockquote type="cite">
                      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">Based on RISC-V unpriviliged spec ( Version 20240411 ):
```
For implementations that conform to the RISC-V Unix Platform Specification,
I/O devices and DMA operations are required to access memory coherently and
via strongly ordered I/O channels. Therefore, accesses to regular main memory
regions that are concurrently accessed by external devices can also use the
standard synchronization mechanisms. Implementations that do not conform
to the Unix Platform Specification and/or in which devices do not access
memory coherently will need to use mechanisms
(which are currently platform-specific or device-specific) to enforce
coherency.

I/O regions in the address space should be considered non-cacheable
regions in the PMAs for those regions. Such regions can be considered coherent
by the PMA if they are not cached by any agent.
```
and [1]:
```
The current riscv linux implementation requires SOC system to support
memory coherence between all I/O devices and CPUs. But some SOC systems
cannot maintain the coherence and they need support cache clean/invalid
operations to synchronize data.

Current implementation is no problem with SiFive FU540, because FU540
keeps all IO devices and DMA master devices coherence with CPU. But to a
traditional SOC vendor, it may already have a stable non-coherency SOC
system, the need is simply to replace the CPU with RV CPU and rebuild
the whole system with IO-coherency is very expensive.
```

and the fact that all known ( to me ) CPUs that support the H-extension
and that ones is going to be supported by Xen have memory coherency
between all I/O devices and CPUs, so it is currently safe to use the
PAGE_HYPERVISOR attribute.
However, in cases where a platform does not support memory coherency, it
should support CMO extensions and Svpbmt. In this scenario, updates to
ioremap will be necessary.
For now, a compilation error will be generated to ensure that the need to
update ioremap() is not overlooked.

[1]<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/">https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/</a>
</pre>
                      </blockquote>
                      <pre wrap="" class="moz-quote-pre">But MMIO access correctness isn't just a matter of coherency. There may not
be any caching involved in most cases, or else you may observe significantly
delayed or even dropped (folded with later ones) writes, and reads may be
serviced from the cache instead of going to actual MMIO. Therefore ...

</pre>
                      <blockquote type="cite">
                        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
     	string
     	default "arch/riscv/configs/tiny64_defconfig"
     
+config HAS_SVPBMT
+	bool
+	help
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
                      <pre wrap="" class="moz-quote-pre">... I kind of expect this extension (or anything else that there might be) will need
making use of.
</pre>
                    </blockquote>
                    <pre wrap="" class="moz-quote-pre">In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
is used to control which memory regions are cacheable, non-cacheable, readable, writable,
etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
cores, or it can be fixed at design time, as in SiFive cores.
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">How would things work if there was a need to map a RAM page uncacheable (via
ioremap() or otherwise)?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">My understanding is that Svpbmt is only needed when someone wants to change the memory
attribute of a page set by PMA.

The question is if non-cacheable RAM page is really needed if we have a coherency?
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Aiui coherency here is among CPUs.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">```
For implementations that conform to the RISC-V Unix Platform Specification,
I/O devices and DMA operations are required to access memory coherently and
via strongly ordered I/O channels. Therefore, accesses to regular main memory
regions that are concurrently accessed by external devices can also use the
standard synchronization mechanisms. Implementations that do not conform
to the Unix Platform Specification and/or in which devices do not access
memory coherently will need to use mechanisms
(which are currently platform-specific or device-specific) to enforce
coherency.
```
Based on this from the spec, coherency here is not only among CPUs.


</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Properties of devices in the system are
largely unknown?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Yes, but still not sure what kind of property requires ioremap() which won't work
without Svpmbt. Could you please tell me an example?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Well, above you said they all need to access memory coherently. That's the
"property" I was referring to.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Do you mean that device could have a property which tell that it would like to have non-cachable
region used for that? I haven't seen such property in device tree files.

Do we have in Xen cases when Xen wants to have map part of RAM as non-cachebale and it is only the
one option?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
On x86 we have the case that IOMMUs may access memory non-coherently. This is
particular means that IOMMU page table updates (which necessarily live in RAM)
need to be done quite carefully. As it's all our code, we deal with the
situation by issuing cache flushes, avoiding the need for UC mappings.

Graphics engines may have similar constraints, aiui. With the driver code not
being part of Xen, we wouldn't be able to use a similar "simplification" there.
UC mappings would be pretty much unavoidable.</pre>
    </blockquote>
    <pre>For this case, it would be better to have Svpmbt.

I would like to noted that Svpmbt isn't supported by RV32 architectures. For such cases, it will be still
needed to play with PMA.
I found today a patch in Linux kernel which does something similar to what I wrote in one of my previous
replies:
  [0] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20241102000843.1301099-1-samuel.holland@sifive.com/">https://lore.kernel.org/all/20241102000843.1301099-1-samuel.holland@sifive.com/</a>
In the cover letter [0] it is mentioned the following:
  On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
  RAM is mapped to multiple physical address ranges, with each alias
  having a different set of statically-determined Physical Memory
  Attributes (PMAs). Software selects the PMAs for a page by choosing a
  PFN from the corresponding physical address range. On these platforms,
  this is the only way to allocate noncached memory for use with
  noncoherent DMA.

So firmware should configure PMAs so some part of RAM is noncached and then kernel get this info based
on the binding:
  <a class="moz-txt-link-freetext" href="https://patchew.org/linux/20241102000843.1301099-1-samuel.holland@sifive.com/20241102000843.1301099-2-samuel.holland@sifive.com/">https://patchew.org/linux/20241102000843.1301099-1-samuel.holland@sifive.com/20241102000843.1301099-2-samuel.holland@sifive.com/</a>

Considering that this feature isn't available even in Linux kernel, we can start with assumption that all
our SoCs will support Svpmbt.

We don't really care about StarFive JH7100 as it doesn't support H extension, but we potentially should care
about ESWIN EIC7700, which support H extension and doesn't support Svpmbt extension according to a datasheet
publicly available:
  Each EIC7700X core is configured to support the RV64I base ISA, as well as the Multiply (M), Atomic(A),
  Single-Precision Floating Point (F), Double-Precision Floating Point (D), Compressed (C), CSR
  Instructions (Zicsr), Instruction-Fetch Fence (Zifencei), Address Calculation (Zba), Basic Bit
  Manipulation (Zbb), and Count Overflow and Mode-Based Filtering (Sscofpmf) RISC‑V extensions. This
  is captured by the RISC‑V extension string: RV64GC_Zba_Zbb_Sscofpmf.

</pre>
    <blockquote type="cite"
      cite="mid:28142d86-0845-4bb3-a0bb-e4903f898abf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I am also thinking why it can't be used cachable region + barrier (if we don't have memory coherency
for everything).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not sure what exactly you're asking here (if anything). An answer would very
likely depend on the specific kind of barrier you're thinking about. The
question would be what, if any, effect a barrier would have on the cache(s).</pre>
    </blockquote>
    <pre>I confused barrier with cache flushes (when I wrote that I thought about the case of DMA that we don't really
should have requirement of non-cachable memory for DMA as it is enough to have memory fence between use of DMA
memory and MMIO that triggers the dma), basically I meant what you wrote above about x86's IOMMUs.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:28142d86-0845-4bb3-a0bb-e4903f898abf@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Anyway, if it isn't an option to have mapped cacheble region + barrier then there is no any choice
and the support of Svpmbt is required.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Quite possible.

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------fZiyz4mApGCz5FywkcbWgRT2--

