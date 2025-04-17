Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8637A91F63
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957794.1350824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q6x-0001Ic-7j; Thu, 17 Apr 2025 14:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957794.1350824; Thu, 17 Apr 2025 14:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Q6x-0001GV-4h; Thu, 17 Apr 2025 14:21:03 +0000
Received: by outflank-mailman (input) for mailman id 957794;
 Thu, 17 Apr 2025 14:21:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5Q6v-0001GJ-He
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:21:01 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fb18b8a-1b97-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:21:00 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5edc07c777eso1083917a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:21:00 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f527df0sm10294455a12.71.2025.04.17.07.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:20:59 -0700 (PDT)
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
X-Inumbo-ID: 2fb18b8a-1b97-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744899660; x=1745504460; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enrzioY3czjAhs2bm/34Xhoi7NUiAezjrNcq1kLCXkU=;
        b=Xg0BI+Atx3eyVYF/bXb6ZTK5bw3xLVrwgICqumhSCa/bhR6aWJp8aB9yIyuS/BJGPI
         Gj7RO5KcaMZ+WROfJUa3K7vsRI91cpXIjhhr0WdGnz8YM/4vry3RBGcuJny8GjaFSHFl
         9Kz5DQChlRPN/t3w3yzVeCIuyxBDQHgXBRtvg3XmTyCBMKejE6QPONv6z8H5byb67J1L
         pYHV9T0oJBOH4U7WPmuPTht/2ZTP2gylTxvxMyUUe3T5TtBO2t4N52BLFoYANpiG8eNA
         V67ntLtKPy39mFFS93E41uGMgFmmCnre/d+6+OLNJ5wSrufHe+nePlxHBbnrQ0I/HpXd
         XPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899660; x=1745504460;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=enrzioY3czjAhs2bm/34Xhoi7NUiAezjrNcq1kLCXkU=;
        b=JCLGbVVJUQ0grqkZ7V5k15hqs1JjUbQyyhomnTbbmRwFvAHYsEKUntwCQqaahlLVvQ
         jc5tPwWze/ZSZhyJmP2qDAgP+142vUTpznreLT3/2uYmjte+uP0b3oM7tpzDqOp2kiYy
         AGUurtwYBHwF/1XaRIXEggIarmH7opZzeqA4/s9bHCtg/UT7ikATMge8+IRmrdd0allS
         B9BscV90ToybW3+nyi0YZa80cKt0JDezElrioL7Lyfj688kLHTLfIlNHDxnBtAC1nVcP
         1RoFQazx8WMCXPjmmUKllbpq+tAwTWGznc61X7ii6oeiooUdRdbWUSS4iBfFkOkGCBaq
         MTMA==
X-Forwarded-Encrypted: i=1; AJvYcCWhSxhTQP+5IqmVpyX75MOxiGrDfnPvIn+g1EOeGNDL0R96Shm//B5lEV9wMyxm4GkKPZr/EoZl08Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhFobtEIMl12b1RXdn19/ddc5X/kc3/IzUPhwrILbFyvkprAxB
	J5hqokyGyK4yTTUtcwvTzYj36IT6019XEZIa36JnRZNKtEM5mnZM
X-Gm-Gg: ASbGncv9MjHlpYwBnW11Shr0feZY4rM9H3TCxRCioImeBkJzR/XJS2RHJIVmcfwxknZ
	pveeUQuQYuPl6guGAo9jEy7Y9eqpOMJ/w0jeO5+CwCYVKgZuMGWYufO93wTW2O3rBDiVrn3m6kn
	GiCeybG2PDxXKLkWyrYsIS947WpQpwhNGDIAZDJmQtWANrXR3PbOATzf13Vx+XqPHFAtDJ2vlu6
	MAIAZfpXgWrbQ4BV49LNQUhP+q4JQEVOuK1pBL/Y+m7EIYcYEVgt9NJwHjFACX4ULq/w8qzALMx
	JgmENe2yMO/8Kkl8zvSPqU6t2v6U8GjJQDZWJpxRh2VuhJ8zU4Mf5hem+WN1zv+REh0so2douOh
	6ybEwunq+fS9gC8k7YPID0YGmBKc=
X-Google-Smtp-Source: AGHT+IHV1JjH0E/Wjx9orUOSb+DXbQibYpi19Sozj04LfYtM2XIdsCmXHm6ZmlCHaBWF4oJZ/cY/bQ==
X-Received: by 2002:a05:6402:35ca:b0:5f4:5dfa:995f with SMTP id 4fb4d7f45d1cf-5f4b748d8d4mr5975433a12.13.1744899659359;
        Thu, 17 Apr 2025 07:20:59 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0KvSdusqjdNCsCLPd4IIFVZ0"
Message-ID: <bbfdc4a0-54f0-4a9d-aa6d-2cf85ec03411@gmail.com>
Date: Thu, 17 Apr 2025 16:20:58 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6b226b72-11a4-4004-b42d-0e280de83539@suse.com>

This is a multi-part message in MIME format.
--------------0KvSdusqjdNCsCLPd4IIFVZ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 1:02 PM, Jan Beulich wrote:
> On 15.04.2025 12:29, Oleksii Kurochko wrote:
>> On 4/10/25 5:13 PM, Jan Beulich wrote:
>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
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
>>>>
>>>> I/O regions in the address space should be considered non-cacheable
>>>> regions in the PMAs for those regions. Such regions can be considered coherent
>>>> by the PMA if they are not cached by any agent.
>>>> ```
>>>> and [1]:
>>>> ```
>>>> The current riscv linux implementation requires SOC system to support
>>>> memory coherence between all I/O devices and CPUs. But some SOC systems
>>>> cannot maintain the coherence and they need support cache clean/invalid
>>>> operations to synchronize data.
>>>>
>>>> Current implementation is no problem with SiFive FU540, because FU540
>>>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>>>> traditional SOC vendor, it may already have a stable non-coherency SOC
>>>> system, the need is simply to replace the CPU with RV CPU and rebuild
>>>> the whole system with IO-coherency is very expensive.
>>>> ```
>>>>
>>>> and the fact that all known ( to me ) CPUs that support the H-extension
>>>> and that ones is going to be supported by Xen have memory coherency
>>>> between all I/O devices and CPUs, so it is currently safe to use the
>>>> PAGE_HYPERVISOR attribute.
>>>> However, in cases where a platform does not support memory coherency, it
>>>> should support CMO extensions and Svpbmt. In this scenario, updates to
>>>> ioremap will be necessary.
>>>> For now, a compilation error will be generated to ensure that the need to
>>>> update ioremap() is not overlooked.
>>>>
>>>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
>>> But MMIO access correctness isn't just a matter of coherency. There may not
>>> be any caching involved in most cases, or else you may observe significantly
>>> delayed or even dropped (folded with later ones) writes, and reads may be
>>> serviced from the cache instead of going to actual MMIO. Therefore ...
>>>
>>>> --- a/xen/arch/riscv/Kconfig
>>>> +++ b/xen/arch/riscv/Kconfig
>>>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>>>    	string
>>>>    	default "arch/riscv/configs/tiny64_defconfig"
>>>>    
>>>> +config HAS_SVPBMT
>>>> +	bool
>>>> +	help
>>>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>>>> +	  page-based memory types).
>>>> +
>>>> +	  The memory type for a page contains a combination of attributes
>>>> +	  that indicate the cacheability, idempotency, and ordering
>>>> +	  properties for access to that page.
>>>> +
>>>> +	  The Svpbmt extension is only available on 64-bit cpus.
>>> ... I kind of expect this extension (or anything else that there might be) will need
>>> making use of.
>> In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
>> is used to control which memory regions are cacheable, non-cacheable, readable, writable,
>> etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
>> cores, or it can be fixed at design time, as in SiFive cores.
> How would things work if there was a need to map a RAM page uncacheable (via
> ioremap() or otherwise)?

My understanding is that Svpbmt is only needed when someone wants to change the memory
attribute of a page set by PMA.

The question is if non-cacheable RAM page is really needed if we have a coherency?

~ Oleksii

--------------0KvSdusqjdNCsCLPd4IIFVZ0
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
    <div class="moz-cite-prefix">On 4/15/25 1:02 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6b226b72-11a4-4004-b42d-0e280de83539@suse.com">
      <pre wrap="" class="moz-quote-pre">On 15.04.2025 12:29, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/10/25 5:13 PM, Jan Beulich wrote:
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
        <pre wrap="" class="moz-quote-pre">
In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
is used to control which memory regions are cacheable, non-cacheable, readable, writable,
etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
cores, or it can be fixed at design time, as in SiFive cores.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
How would things work if there was a need to map a RAM page uncacheable (via
ioremap() or otherwise)?</pre>
    </blockquote>
    <pre>My understanding is that Svpbmt is only needed when someone wants to change the memory
attribute of a page set by PMA.

The question is if non-cacheable RAM page is really needed if we have a coherency?

~ Oleksii
</pre>
  </body>
</html>

--------------0KvSdusqjdNCsCLPd4IIFVZ0--

