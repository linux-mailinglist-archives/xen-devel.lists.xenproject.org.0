Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C86A9620C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 10:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962181.1353484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79Bj-00042L-AN; Tue, 22 Apr 2025 08:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962181.1353484; Tue, 22 Apr 2025 08:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79Bj-00040b-5n; Tue, 22 Apr 2025 08:41:07 +0000
Received: by outflank-mailman (input) for mailman id 962181;
 Tue, 22 Apr 2025 08:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NnGu=XI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u79Bh-00040R-Cz
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 08:41:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 853b4d70-1f55-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 10:41:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so832164566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 01:41:02 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6eefcfa2sm636766066b.92.2025.04.22.01.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:41:00 -0700 (PDT)
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
X-Inumbo-ID: 853b4d70-1f55-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745311261; x=1745916061; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW5ASIYjxNP4+wn5Y9nmaZ95avMjpLygdzEZ8L4k980=;
        b=Ep0eILCYZyATCddoZwTLTRrDi93AcG3elJq79S5qdHy0oL4dkZ8uAgxNz2a44tgTBl
         ivxKvmh9x2iGOjUIBDM/0HNC4B6PhXuer5p/E3r2GtVwMg5DHLWWXKke2XDrGxFqLVeW
         MlvadoYl3Ic3ivzMpzEk5brULQIj7ZLxZmf9S+Q5WCCIwFMUDFj4S/CpVbYC0FHv151C
         ISNuMbdJIbJQ6xBgxVRQJnIlr27grIOm0IPgrsaU+ckBz59oEbKMZAiO6SPPsxeUiifX
         ChVHpD7gUY7icUuq3/KtFUMxt4QIDzwQ2PdoQHQeD2PLCneLykFpZ/bTra/Hsj99ZJgr
         Sryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311261; x=1745916061;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eW5ASIYjxNP4+wn5Y9nmaZ95avMjpLygdzEZ8L4k980=;
        b=tfqtwUUQLbrVhSxr19ODEingiqtaPUNy2xUikkmk+DcKyQe4a6KTeLEJpRsacI5d22
         HkZPmAdffTz2gmvZK1XR1x4rfDx+dcrggZNmU2fPNZcOokGc3tMRoG6RIBb8VKaxgZAS
         Hj//X05P58Ag06LW8GPMuGqPP4Dt2lV9VIO8IkeSR1f5IGdTV2u0fdXWu+15GXMFLTmk
         VbfPppETdUfWjoj17ehNsZRri3S5l1MkzecCvduxp8tDpSGBoHSLiA+iA5oIHI9RjvX9
         Ufn39rB1hCifVrCzM5m135MNHbdZmYFh+dPQrVXk5R5KMBA0xcNYuJO5eS6rT0stT8Yk
         16VA==
X-Forwarded-Encrypted: i=1; AJvYcCXMSF+teNU4Hk8d6bk7i4B8IF2hLKr9EpPh/mQhe4j7qdHJvZAKbyiMBqfDAIxe3XnMy1Jun4NTyRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLRFZkuBbBKhNJVpl2r5hIue4yywnHjXgDYf0F5U4Llt3HLmEy
	0qGdjipRFq4kKkF2Og5NR+zhpb9h7jSjTjjJlXDvUmJ6MhAqJe0oioYE4g==
X-Gm-Gg: ASbGncu3zci8nlzj2GMDwfqvdHvQJwoYAK6/8gU516AWKKBRnRFV3MckcFywOUQZLma
	1DOkNsi2aQQng2+zTorzQLp4I34d3S4VD82XMYDxDu3C2wx0c+xELHmJEJCBDyo6hZoQba1DTn8
	Nja36+5o2W5cr1Uq39Pn6l9lfRSFLaBZGo2Z5x+dlf38iWvvBJ1A0i6qny4R5JdKJlbZu37Ad0x
	aVsNv443CAnf+2CjnA8bKQjWwcttRTWY5WKrN5AIW8R8Afc6xQpKuLdSFGC5nguXaXUxWwprX8x
	CrLM2+ybsvkrTC0IgRP8h4JogY99DhMBki9JTeG6onkkPXIsp76CTzu1OGc48VRavJjHUriej3d
	KCXZZe53zmMyzmFzE
X-Google-Smtp-Source: AGHT+IGJ6RKyijNxI+j3ARpYQe2Th7rPTmOz+kcVvWpOKUC1Reun7aAwurDYb1oKHnabayuJ+0hZZQ==
X-Received: by 2002:a17:907:7d8a:b0:ac7:ecea:8472 with SMTP id a640c23a62f3a-acb74b816d9mr1053030366b.26.1745311260911;
        Tue, 22 Apr 2025 01:41:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Ho6TGRJ0d0m5hKpEbce6puvQ"
Message-ID: <676c1627-95a0-46a0-b132-3f3ac2fdda01@gmail.com>
Date: Tue, 22 Apr 2025 10:40:59 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6f50dea4-60e6-46b0-9363-d943ba553334@suse.com>

This is a multi-part message in MIME format.
--------------Ho6TGRJ0d0m5hKpEbce6puvQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 4:49 PM, Jan Beulich wrote:
> On 17.04.2025 16:37, Oleksii Kurochko wrote:
>> On 4/17/25 4:24 PM, Jan Beulich wrote:
>>> On 17.04.2025 16:20, Oleksii Kurochko wrote:
>>>> On 4/15/25 1:02 PM, Jan Beulich wrote:
>>>>> On 15.04.2025 12:29, Oleksii Kurochko wrote:
>>>>>> On 4/10/25 5:13 PM, Jan Beulich wrote:
>>>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>>>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
>>>>>>>> ```
>>>>>>>> For implementations that conform to the RISC-V Unix Platform Specification,
>>>>>>>> I/O devices and DMA operations are required to access memory coherently and
>>>>>>>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>>>>>>>> regions that are concurrently accessed by external devices can also use the
>>>>>>>> standard synchronization mechanisms. Implementations that do not conform
>>>>>>>> to the Unix Platform Specification and/or in which devices do not access
>>>>>>>> memory coherently will need to use mechanisms
>>>>>>>> (which are currently platform-specific or device-specific) to enforce
>>>>>>>> coherency.
>>>>>>>>
>>>>>>>> I/O regions in the address space should be considered non-cacheable
>>>>>>>> regions in the PMAs for those regions. Such regions can be considered coherent
>>>>>>>> by the PMA if they are not cached by any agent.
>>>>>>>> ```
>>>>>>>> and [1]:
>>>>>>>> ```
>>>>>>>> The current riscv linux implementation requires SOC system to support
>>>>>>>> memory coherence between all I/O devices and CPUs. But some SOC systems
>>>>>>>> cannot maintain the coherence and they need support cache clean/invalid
>>>>>>>> operations to synchronize data.
>>>>>>>>
>>>>>>>> Current implementation is no problem with SiFive FU540, because FU540
>>>>>>>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>>>>>>>> traditional SOC vendor, it may already have a stable non-coherency SOC
>>>>>>>> system, the need is simply to replace the CPU with RV CPU and rebuild
>>>>>>>> the whole system with IO-coherency is very expensive.
>>>>>>>> ```
>>>>>>>>
>>>>>>>> and the fact that all known ( to me ) CPUs that support the H-extension
>>>>>>>> and that ones is going to be supported by Xen have memory coherency
>>>>>>>> between all I/O devices and CPUs, so it is currently safe to use the
>>>>>>>> PAGE_HYPERVISOR attribute.
>>>>>>>> However, in cases where a platform does not support memory coherency, it
>>>>>>>> should support CMO extensions and Svpbmt. In this scenario, updates to
>>>>>>>> ioremap will be necessary.
>>>>>>>> For now, a compilation error will be generated to ensure that the need to
>>>>>>>> update ioremap() is not overlooked.
>>>>>>>>
>>>>>>>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
>>>>>>> But MMIO access correctness isn't just a matter of coherency. There may not
>>>>>>> be any caching involved in most cases, or else you may observe significantly
>>>>>>> delayed or even dropped (folded with later ones) writes, and reads may be
>>>>>>> serviced from the cache instead of going to actual MMIO. Therefore ...
>>>>>>>
>>>>>>>> --- a/xen/arch/riscv/Kconfig
>>>>>>>> +++ b/xen/arch/riscv/Kconfig
>>>>>>>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>>>>>>>      	string
>>>>>>>>      	default "arch/riscv/configs/tiny64_defconfig"
>>>>>>>>      
>>>>>>>> +config HAS_SVPBMT
>>>>>>>> +	bool
>>>>>>>> +	help
>>>>>>>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>>>>>>>> +	  page-based memory types).
>>>>>>>> +
>>>>>>>> +	  The memory type for a page contains a combination of attributes
>>>>>>>> +	  that indicate the cacheability, idempotency, and ordering
>>>>>>>> +	  properties for access to that page.
>>>>>>>> +
>>>>>>>> +	  The Svpbmt extension is only available on 64-bit cpus.
>>>>>>> ... I kind of expect this extension (or anything else that there might be) will need
>>>>>>> making use of.
>>>>>> In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
>>>>>> is used to control which memory regions are cacheable, non-cacheable, readable, writable,
>>>>>> etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
>>>>>> cores, or it can be fixed at design time, as in SiFive cores.
>>>>> How would things work if there was a need to map a RAM page uncacheable (via
>>>>> ioremap() or otherwise)?
>>>> My understanding is that Svpbmt is only needed when someone wants to change the memory
>>>> attribute of a page set by PMA.
>>>>
>>>> The question is if non-cacheable RAM page is really needed if we have a coherency?
>>> Aiui coherency here is among CPUs.
>> ```
>> For implementations that conform to the RISC-V Unix Platform Specification,
>> I/O devices and DMA operations are required to access memory coherently and
>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>> regions that are concurrently accessed by external devices can also use the
>> standard synchronization mechanisms. Implementations that do not conform
>> to the Unix Platform Specification and/or in which devices do not access
>> memory coherently will need to use mechanisms
>> (which are currently platform-specific or device-specific) to enforce
>> coherency.
>> ```
>> Based on this from the spec, coherency here is not only among CPUs.
>>
>>
>>> Properties of devices in the system are
>>> largely unknown?
>> Yes, but still not sure what kind of property requires ioremap() which won't work
>> without Svpmbt. Could you please tell me an example?
> Well, above you said they all need to access memory coherently. That's the
> "property" I was referring to.

Do you mean that device could have a property which tell that it would like to have non-cachable
region used for that? I haven't seen such property in device tree files.

Do we have in Xen cases when Xen wants to have map part of RAM as non-cachebale and it is only the
one option?

I am also thinking why it can't be used cachable region + barrier (if we don't have memory coherency
for everything).

Anyway, if it isn't an option to have mapped cacheble region + barrier then there is no any choice
and the support of Svpmbt is required.

>
>>> (Beyond this there may also be special situations in which
>>> one really cares about data going directly to RAM.)
>> If there are such special cases, I assume that the firmware or hardware (in the case
>> of fixed PMA) will provide a non-cacheable region.
> How could they? Firmware may be unaware of specific properties of specific
> devices a user adds to a system.

(this is not real case, just thoughts) Firmware could by default provide part of RAM as
non-cacheable region and then hypervisor/kernel use this region for allocation. But I agree
that it isn't the best thing to manage that.


~ Oleksii

>> In that case, the user should be
>> aware of this region and use it for those specific scenarios.
>>
>> ~ Oleksii
>>
--------------Ho6TGRJ0d0m5hKpEbce6puvQ
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
    <div class="moz-cite-prefix">On 4/17/25 4:49 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6f50dea4-60e6-46b0-9363-d943ba553334@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.04.2025 16:37, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/17/25 4:24 PM, Jan Beulich wrote:
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
        <pre wrap="" class="moz-quote-pre">
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
```
Based on this from the spec, coherency here is not only among CPUs.


</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Properties of devices in the system are
largely unknown?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes, but still not sure what kind of property requires ioremap() which won't work
without Svpmbt. Could you please tell me an example?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, above you said they all need to access memory coherently. That's the
"property" I was referring to.</pre>
    </blockquote>
    <pre>Do you mean that device could have a property which tell that it would like to have non-cachable
region used for that? I haven't seen such property in device tree files.

Do we have in Xen cases when Xen wants to have map part of RAM as non-cachebale and it is only the
one option?

I am also thinking why it can't be used cachable region + barrier (if we don't have memory coherency
for everything).

Anyway, if it isn't an option to have mapped cacheble region + barrier then there is no any choice
and the support of Svpmbt is required.

</pre>
    <blockquote type="cite"
      cite="mid:6f50dea4-60e6-46b0-9363-d943ba553334@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">(Beyond this there may also be special situations in which
one really cares about data going directly to RAM.)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
If there are such special cases, I assume that the firmware or hardware (in the case
of fixed PMA) will provide a non-cacheable region.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How could they? Firmware may be unaware of specific properties of specific
devices a user adds to a system.</pre>
    </blockquote>
    <pre>(this is not real case, just thoughts) Firmware could by default provide part of RAM as
non-cacheable region and then hypervisor/kernel use this region for allocation. But I agree
that it isn't the best thing to manage that.


~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:6f50dea4-60e6-46b0-9363-d943ba553334@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In that case, the user should be
aware of this region and use it for those specific scenarios.

~ Oleksii

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------Ho6TGRJ0d0m5hKpEbce6puvQ--

