Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89FA89A1F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952596.1348002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dYE-0003Gl-H8; Tue, 15 Apr 2025 10:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952596.1348002; Tue, 15 Apr 2025 10:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dYE-0003De-DW; Tue, 15 Apr 2025 10:29:58 +0000
Received: by outflank-mailman (input) for mailman id 952596;
 Tue, 15 Apr 2025 10:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCo=XB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4dYC-0003DY-Dh
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:29:56 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9191eeb9-19e4-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 12:29:53 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5ed1ac116e3so8070766a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 03:29:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb40d8sm1067152066b.111.2025.04.15.03.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 03:29:52 -0700 (PDT)
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
X-Inumbo-ID: 9191eeb9-19e4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744712993; x=1745317793; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UZOIQuRW8kOYrrVpaVXmmwpUYwsfv3+ju+hWdlLjQE=;
        b=Sf4JB9eY2tZl0cX3fMe4QQt3z+eQnaLSndOPvdnetmnarWKDR/nLqYbDUNe9tZdpN9
         lrCNP7k9I5i4B+I7eJ0nqm0CMxGpQI3j+6Lqw/3ZcLB0g85I0xA43CDwzdElO9YwlQyf
         6kUFAljqGIHDYMZ0ksOKjUfeZl8OgPKysaJtwrIh7GVCQ5d/gV1CuC02wTZr6stU98iU
         TNVm9581VZ4q3JBdfBtmkBAQjm+5pHsq3U7dtbUrzuSo+gKCcd6OK2qWoPDT58uyhZBb
         /hXniALMwLfdGHabYUESUn2vj1RJmwvvsmByePTNFkmlVusvfjqN9asD91O9PVEVZkWm
         Gq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712993; x=1745317793;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7UZOIQuRW8kOYrrVpaVXmmwpUYwsfv3+ju+hWdlLjQE=;
        b=YoSBvi9wN57Ovj1EPcBPVKmP4vlY4wSP+pCkAYIIXYzTO+VZEREizarM6hvyLKBD8v
         5yP+MS4RKj+RvjF8DsoVY5boNuo0J5en4JzYLTO1LZOVQ+wNvTNToP4M8LNgnH7i1pU0
         6LJ3NnaoeuC1ugbHVDv42xuDzRp6PMHa6UumSZbM7/Vopnvo+Lf9cvAzJ0fckY5EW3SX
         emqRC3sc7Ew+rAU5DoppOy9DGUPTREKXlmexn0aahzAsVAg1SoHJKdZGyFr3WJjXZOzi
         5oh4BBdvgF4tg+jgv6KRH9+4xO9jAP0lru/FRvmaMPvkn8xcnKagwyRVKWR0HUXwHe6D
         shRA==
X-Forwarded-Encrypted: i=1; AJvYcCWhfxidCqbHfyl6OjKshh0qCFJeiFPIIWtrChd2ISDWEKcJRozcDUUp+WN1X07HhRo+4fAyiu46yNE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYuiWM/d8T7yDU2n/si93NfY87wuQaucHozNKPIsprsv+1Dc22
	uiipIGpiDX3O5ldnQvG8Ov2O+h2IlhhmGY42XMnh38ySy4ELXB0Z
X-Gm-Gg: ASbGncvRUR23Xb+5GAOBEySb9rUeVOunKZA+WnLXapbOWKpsFyNKO1l1oJWrXfeMVuA
	xLs4XF2L2Wbc8XAet8yd9mu6xI0HOcVcw4Mr6/KvDmzp92fIBtx5Dy7+otJmucu/xm8H3/uxTAB
	vNleWspkIFqs95NLFkvnX5M7xeQAareyrFZiI/y8kPNZYzopS4AwjUXs22tJYYHHKfbcN3RwMLV
	Jo/EwcrtGqqyccMmvVpsOJxqjswkdsU2huV3bevLdsYM/fDIi9A13CoihMMjOtSyFEfmI35OXQX
	7SmX8YBSxtxxhcG1XrXZ5m716kh4vz9D9feUtm/rXN4wzaF9JUqmNgy/5MlvvmwqkazXQsDokr2
	bLBbKJAnaLWo2smiGSKGa2VIkppY=
X-Google-Smtp-Source: AGHT+IF6dNPMe7U52EeRNx3DMb/RF47pI8eJsWBXDnTSm+hDy1NjZ7lXBu/Vsa4pQOE21/J862pjmw==
X-Received: by 2002:a17:907:25cb:b0:ac4:3d8:2e90 with SMTP id a640c23a62f3a-acad3489538mr1342518166b.13.1744712993111;
        Tue, 15 Apr 2025 03:29:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------9zjEHGfWx3C45ZpsOmsI0P4B"
Message-ID: <f315bc11-c537-4dca-9e62-a6d3f02733e4@gmail.com>
Date: Tue, 15 Apr 2025 12:29:51 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <84089b6d-efeb-4613-85b9-eb10d11d7338@suse.com>

This is a multi-part message in MIME format.
--------------9zjEHGfWx3C45ZpsOmsI0P4B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 5:13 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
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
>>
>> I/O regions in the address space should be considered non-cacheable
>> regions in the PMAs for those regions. Such regions can be considered coherent
>> by the PMA if they are not cached by any agent.
>> ```
>> and [1]:
>> ```
>> The current riscv linux implementation requires SOC system to support
>> memory coherence between all I/O devices and CPUs. But some SOC systems
>> cannot maintain the coherence and they need support cache clean/invalid
>> operations to synchronize data.
>>
>> Current implementation is no problem with SiFive FU540, because FU540
>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>> traditional SOC vendor, it may already have a stable non-coherency SOC
>> system, the need is simply to replace the CPU with RV CPU and rebuild
>> the whole system with IO-coherency is very expensive.
>> ```
>>
>> and the fact that all known ( to me ) CPUs that support the H-extension
>> and that ones is going to be supported by Xen have memory coherency
>> between all I/O devices and CPUs, so it is currently safe to use the
>> PAGE_HYPERVISOR attribute.
>> However, in cases where a platform does not support memory coherency, it
>> should support CMO extensions and Svpbmt. In this scenario, updates to
>> ioremap will be necessary.
>> For now, a compilation error will be generated to ensure that the need to
>> update ioremap() is not overlooked.
>>
>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
> But MMIO access correctness isn't just a matter of coherency. There may not
> be any caching involved in most cases, or else you may observe significantly
> delayed or even dropped (folded with later ones) writes, and reads may be
> serviced from the cache instead of going to actual MMIO. Therefore ...
>
>> --- a/xen/arch/riscv/Kconfig
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>   	string
>>   	default "arch/riscv/configs/tiny64_defconfig"
>>   
>> +config HAS_SVPBMT
>> +	bool
>> +	help
>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>> +	  page-based memory types).
>> +
>> +	  The memory type for a page contains a combination of attributes
>> +	  that indicate the cacheability, idempotency, and ordering
>> +	  properties for access to that page.
>> +
>> +	  The Svpbmt extension is only available on 64-bit cpus.
> ... I kind of expect this extension (or anything else that there might be) will need
> making use of.

In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
is used to control which memory regions are cacheable, non-cacheable, readable, writable,
etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
cores, or it can be fixed at design time, as in SiFive cores.

In the case of QEMU, I assume it is QEMU's responsibility to properly emulate accesses
to device memory regions. Since QEMU does not appear to provide registers for configuring
PMA, it seems that PMA is not emulated. Additionally, QEMU does not emulate caches.

Based on that, I expect that it is the responsibility of the firmware or the hardware
itself to provide the correct PMA configuration.

I want to note that even Svpbmt is available PMA settings could be used or be ovewritten
by Svpbmt's attribute value.

I will update the commit message  for more clearness.

>
>> @@ -548,3 +549,21 @@ void clear_fixmap(unsigned int map)
>>                                 FIXMAP_ADDR(map) + PAGE_SIZE) != 0 )
>>           BUG();
>>   }
>> +
>> +void *ioremap(paddr_t pa, size_t len)
>> +{
>> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
>> +    unsigned int offs = pa & (PAGE_SIZE - 1);
>> +    unsigned int nr = PFN_UP(offs + len);
>> +
>> +#ifdef CONFIG_HAS_SVPBMT
>> +    #error "an introduction of PAGE_HYPERVISOR_IOREMAP is needed for __vmap()"
>> +#endif
> While, as per above, I don't think this can stay, just in case: As indicated
> earlier, pre-processor directives want to have the # in the first column.

I think it can be safely dropped now, and|PAGE_HYPERVISOR_IOREMAP| could be introduced
and simply PTE's PMBT bits can be ignored in|pt_update_entry()| if Svpbmt isn't implemented.

~ Oleksii

--------------9zjEHGfWx3C45ZpsOmsI0P4B
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
    <div class="moz-cite-prefix">On 4/10/25 5:13 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:84089b6d-efeb-4613-85b9-eb10d11d7338@suse.com">
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

[1] <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/">https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But MMIO access correctness isn't just a matter of coherency. There may not
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
      <pre wrap="" class="moz-quote-pre">
... I kind of expect this extension (or anything else that there might be) will need
making use of.</pre>
    </blockquote>
    <pre data-start="65" data-end="389" class="">In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
is used to control which memory regions are cacheable, non-cacheable, readable, writable,
etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
cores, or it can be fixed at design time, as in SiFive cores.

In the case of QEMU, I assume it is QEMU's responsibility to properly emulate accesses
to device memory regions. Since QEMU does not appear to provide registers for configuring
PMA, it seems that PMA is not emulated. Additionally, QEMU does not emulate caches.</pre>
    <pre data-start="653" data-end="787" class="">Based on that, I expect that it is the responsibility of the firmware or the hardware
itself to provide the correct PMA configuration.

I want to note that even Svpbmt is available PMA settings could be used or be ovewritten
by Svpbmt's attribute value.

I will update the commit message  for more clearness.

</pre>
    <blockquote type="cite"
      cite="mid:84089b6d-efeb-4613-85b9-eb10d11d7338@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -548,3 +549,21 @@ void clear_fixmap(unsigned int map)
                               FIXMAP_ADDR(map) + PAGE_SIZE) != 0 )
         BUG();
 }
+
+void *ioremap(paddr_t pa, size_t len)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(pa));
+    unsigned int offs = pa &amp; (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+
+#ifdef CONFIG_HAS_SVPBMT
+    #error "an introduction of PAGE_HYPERVISOR_IOREMAP is needed for __vmap()"
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
While, as per above, I don't think this can stay, just in case: As indicated
earlier, pre-processor directives want to have the # in the first column.</pre>
    </blockquote>
    <pre>I think it can be safely dropped now, and <code
    data-start="107" data-end="132">PAGE_HYPERVISOR_IOREMAP</code> could be introduced
and simply PTE's PMBT bits can be ignored in <code data-start="175"
    data-end="194">pt_update_entry()</code> if Svpbmt isn't implemented.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------9zjEHGfWx3C45ZpsOmsI0P4B--

