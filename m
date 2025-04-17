Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7755A91FDF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957907.1350915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QN1-0008TV-EP; Thu, 17 Apr 2025 14:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957907.1350915; Thu, 17 Apr 2025 14:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QN1-0008Qc-AE; Thu, 17 Apr 2025 14:37:39 +0000
Received: by outflank-mailman (input) for mailman id 957907;
 Thu, 17 Apr 2025 14:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5QN0-0008QW-I1
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:37:38 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81e2ec92-1b99-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 16:37:37 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac25520a289so126764166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:37:37 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec517a4sm2750566b.73.2025.04.17.07.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:37:35 -0700 (PDT)
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
X-Inumbo-ID: 81e2ec92-1b99-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900657; x=1745505457; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bY6yhE3B/uedCC4rvXb46yR4qJioYVtFWvS+G5qc4dI=;
        b=TauVXX3dFqJ99TqXc1Ibj1vz4wIws4og2PL/OXgF7KOVLsF1I4i2sOlEp/xKlvxt6L
         siewe1CHis1rSjbRA0SSzzjMKdnYWf1AF+QKzjh4SQl1boRA7t73NPYk5r2w95PJMsOi
         1SqtJV2xXsXiJBTDv8xgoedUqEV9ntY8wXyfcKh0Q+RX2hD2f0hAWWJLQOyI6aiu1KCm
         kCx5Xf27nIicud/cIsL1/NPrwrFpwhcW4bhZFHsfGB6b087mSgj8TY+cTVQg8hocyklg
         WCPLDy23gMAnjvvUbJlARWmmLGO/MDIuiD0SYCfDHwGXzppXKUyJTma+MSylt6TfdQU7
         N2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900657; x=1745505457;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bY6yhE3B/uedCC4rvXb46yR4qJioYVtFWvS+G5qc4dI=;
        b=fowVGA2IYPDOIGH1S41tS4RyuBkLqLgA0j4t43+9pSzIwCrav5XIN1ZTnOSl3/Ti+j
         LiD68SutZZ1x6WuBA/+PjTLaUoy+VbjuzhmufGbz5Jbfz2gUbBUAlaG7pNhoHCGiLv7M
         qBaXrMcarCb/Sz3WbgrZUb/MuRkHzAxJr/kphko9XgdLMc+HuriC8yl1XGGGL9JunUcj
         DnrLnipFEbdYaPl00LAqKPlrNW4nvej0MDONOIhDCn1rLpCoOxn9+fInFOd4CsAT4aNd
         wOlvZak4ZI64WeVD1lp+eeE8nuFIJPX/MP3FTLFCl87OlwGzAv+5PGLWLWAw2EKylWSR
         dByA==
X-Forwarded-Encrypted: i=1; AJvYcCUUW0SDltditHqRyqXNbfOilxfGM0Kah+ZGcm1rzOpyMBQQOtkgKy5EjohcqnaQO6IlGKDS8WuHgeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3Tvqf9USn1hjogBlxxaT01eAoqEfqhL/6UOdytaE8nGa6lZ21
	U0dbEoG/v+8HFWLZMqjt80Y0AShm5u4lRpqqP/fDeHoZ3aP3tQtCiExiTA==
X-Gm-Gg: ASbGncvRrPyZbw6Wt/c0JpjvYrApJsXWWU3oZdtOsrOBugD43xFRYmnK/5ugVUu12/n
	mWPjKXNmETbcksdvfy0B2khkzCJyS3uJcVz6okGG+usn+H9tx3yON4M8jggoUB4NsdgBoGVGdGJ
	Xn7JITodkE/cCgFmLciBpm9/FMvCFMSoFau5oNvVOLtXJwueMrCvQw3IoRL1q7Kz5pkwcwymPoK
	HGVTuZjYtjK7/ZxGkycaX7D/7Fw3vaibSmAFEGTabkTVMUrsd9jhNQukOKL5DUSmLddN/P+3OCf
	Kz9QyYofhd4j4/wv0YVQHoQRz7NXx9a1u0Xs40O/xIvt9sz9siaehY4fqsMTSLNwOE9vwj5v1D+
	gK1zw2+auBX4y14B5eUqGu2ikdp4=
X-Google-Smtp-Source: AGHT+IE3yYSjSy0XKUiMzsCCKtCggT2O8fKGpvZCeMJeB0q/pXtNb7gfxw7aVVv5nc15w2wTNZvXAg==
X-Received: by 2002:a17:907:a4e:b0:abf:c20d:501a with SMTP id a640c23a62f3a-acb428fd80cmr680789966b.16.1744900656325;
        Thu, 17 Apr 2025 07:37:36 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------rWEM7nMJxlcWUx2paR00MxGY"
Message-ID: <7d5356a5-53b7-4d1b-82ff-bc6f81a2f445@gmail.com>
Date: Thu, 17 Apr 2025 16:37:34 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a71db245-5b0b-435e-8e58-cb43c5162862@suse.com>

This is a multi-part message in MIME format.
--------------rWEM7nMJxlcWUx2paR00MxGY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 4:24 PM, Jan Beulich wrote:
> On 17.04.2025 16:20, Oleksii Kurochko wrote:
>> On 4/15/25 1:02 PM, Jan Beulich wrote:
>>> On 15.04.2025 12:29, Oleksii Kurochko wrote:
>>>> On 4/10/25 5:13 PM, Jan Beulich wrote:
>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>> Based on RISC-V unpriviliged spec ( Version 20240411 ):
>>>>>> ```
>>>>>> For implementations that conform to the RISC-V Unix Platform Specification,
>>>>>> I/O devices and DMA operations are required to access memory coherently and
>>>>>> via strongly ordered I/O channels. Therefore, accesses to regular main memory
>>>>>> regions that are concurrently accessed by external devices can also use the
>>>>>> standard synchronization mechanisms. Implementations that do not conform
>>>>>> to the Unix Platform Specification and/or in which devices do not access
>>>>>> memory coherently will need to use mechanisms
>>>>>> (which are currently platform-specific or device-specific) to enforce
>>>>>> coherency.
>>>>>>
>>>>>> I/O regions in the address space should be considered non-cacheable
>>>>>> regions in the PMAs for those regions. Such regions can be considered coherent
>>>>>> by the PMA if they are not cached by any agent.
>>>>>> ```
>>>>>> and [1]:
>>>>>> ```
>>>>>> The current riscv linux implementation requires SOC system to support
>>>>>> memory coherence between all I/O devices and CPUs. But some SOC systems
>>>>>> cannot maintain the coherence and they need support cache clean/invalid
>>>>>> operations to synchronize data.
>>>>>>
>>>>>> Current implementation is no problem with SiFive FU540, because FU540
>>>>>> keeps all IO devices and DMA master devices coherence with CPU. But to a
>>>>>> traditional SOC vendor, it may already have a stable non-coherency SOC
>>>>>> system, the need is simply to replace the CPU with RV CPU and rebuild
>>>>>> the whole system with IO-coherency is very expensive.
>>>>>> ```
>>>>>>
>>>>>> and the fact that all known ( to me ) CPUs that support the H-extension
>>>>>> and that ones is going to be supported by Xen have memory coherency
>>>>>> between all I/O devices and CPUs, so it is currently safe to use the
>>>>>> PAGE_HYPERVISOR attribute.
>>>>>> However, in cases where a platform does not support memory coherency, it
>>>>>> should support CMO extensions and Svpbmt. In this scenario, updates to
>>>>>> ioremap will be necessary.
>>>>>> For now, a compilation error will be generated to ensure that the need to
>>>>>> update ioremap() is not overlooked.
>>>>>>
>>>>>> [1]https://patchwork.kernel.org/project/linux-riscv/patch/1555947870-23014-1-git-send-email-guoren@kernel.org/
>>>>> But MMIO access correctness isn't just a matter of coherency. There may not
>>>>> be any caching involved in most cases, or else you may observe significantly
>>>>> delayed or even dropped (folded with later ones) writes, and reads may be
>>>>> serviced from the cache instead of going to actual MMIO. Therefore ...
>>>>>
>>>>>> --- a/xen/arch/riscv/Kconfig
>>>>>> +++ b/xen/arch/riscv/Kconfig
>>>>>> @@ -15,6 +15,18 @@ config ARCH_DEFCONFIG
>>>>>>     	string
>>>>>>     	default "arch/riscv/configs/tiny64_defconfig"
>>>>>>     
>>>>>> +config HAS_SVPBMT
>>>>>> +	bool
>>>>>> +	help
>>>>>> +	  This config enables usage of Svpbmt ISA-extension ( Supervisor-mode:
>>>>>> +	  page-based memory types).
>>>>>> +
>>>>>> +	  The memory type for a page contains a combination of attributes
>>>>>> +	  that indicate the cacheability, idempotency, and ordering
>>>>>> +	  properties for access to that page.
>>>>>> +
>>>>>> +	  The Svpbmt extension is only available on 64-bit cpus.
>>>>> ... I kind of expect this extension (or anything else that there might be) will need
>>>>> making use of.
>>>> In cases where the Svpbmt extension isn't available, PMA (Physical Memory Attributes)
>>>> is used to control which memory regions are cacheable, non-cacheable, readable, writable,
>>>> etc. PMA is configured in M-mode by the firmware (e.g., OpenSBI), as is done in Andes
>>>> cores, or it can be fixed at design time, as in SiFive cores.
>>> How would things work if there was a need to map a RAM page uncacheable (via
>>> ioremap() or otherwise)?
>> My understanding is that Svpbmt is only needed when someone wants to change the memory
>> attribute of a page set by PMA.
>>
>> The question is if non-cacheable RAM page is really needed if we have a coherency?
> Aiui coherency here is among CPUs.

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


> Properties of devices in the system are
> largely unknown?

Yes, but still not sure what kind of property requires ioremap() which won't work
without Svpmbt. Could you please tell me an example?

> (Beyond this there may also be special situations in which
> one really cares about data going directly to RAM.)

If there are such special cases, I assume that the firmware or hardware (in the case
of fixed PMA) will provide a non-cacheable region. In that case, the user should be
aware of this region and use it for those specific scenarios.

~ Oleksii

--------------rWEM7nMJxlcWUx2paR00MxGY
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
    <div class="moz-cite-prefix">On 4/17/25 4:24 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a71db245-5b0b-435e-8e58-cb43c5162862@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
My understanding is that Svpbmt is only needed when someone wants to change the memory
attribute of a page set by PMA.

The question is if non-cacheable RAM page is really needed if we have a coherency?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Aiui coherency here is among CPUs. </pre>
    </blockquote>
    <pre>```
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
    <blockquote type="cite"
      cite="mid:a71db245-5b0b-435e-8e58-cb43c5162862@suse.com">
      <pre wrap="" class="moz-quote-pre">Properties of devices in the system are
largely unknown?</pre>
    </blockquote>
    <pre>Yes, but still not sure what kind of property requires ioremap() which won't work
without Svpmbt. Could you please tell me an example?

</pre>
    <blockquote type="cite"
      cite="mid:a71db245-5b0b-435e-8e58-cb43c5162862@suse.com">
      <pre wrap="" class="moz-quote-pre">(Beyond this there may also be special situations in which
one really cares about data going directly to RAM.)</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">If there are such special cases, I assume that the firmware or hardware (in the case
of fixed PMA) will provide a non-cacheable region. In that case, the user should be
aware of this region and use it for those specific scenarios.

~ Oleksii
</pre>
  </body>
</html>

--------------rWEM7nMJxlcWUx2paR00MxGY--

