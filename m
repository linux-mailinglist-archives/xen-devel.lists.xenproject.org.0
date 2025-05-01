Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD462AA5FE4
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 16:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974185.1362116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUpZ-0001gn-IN; Thu, 01 May 2025 14:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974185.1362116; Thu, 01 May 2025 14:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAUpZ-0001eT-EE; Thu, 01 May 2025 14:24:05 +0000
Received: by outflank-mailman (input) for mailman id 974185;
 Thu, 01 May 2025 14:24:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VVDx=XR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAUpY-0001eM-7N
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 14:24:04 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edd0a8ee-2697-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 16:24:02 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so157212966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 07:24:02 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad0da55afb7sm46083266b.124.2025.05.01.07.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 07:24:00 -0700 (PDT)
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
X-Inumbo-ID: edd0a8ee-2697-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746109441; x=1746714241; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGx58QBo8s1Fm4SWVeSISV6z+REsDGmk2YbjJ4CAd/c=;
        b=YTIpOaWGP8wazyG8Z8CfGILnww/cXFGFzzqkjnNAijXrtNXq2+5YeSICqWxf2cnX4d
         3kpZv+5I90cjGaQp8nV/rxemrIM+MmJo/ZZOz/2liJ6dWHADYKfo4qSPWu20+ouGJTIC
         3XLg8qKKm0HsGfxVpFxHGv3MbFrXu/OIMqZiJAAGBjkisDpSoCUCfGXhxBjsYQg1vVHH
         n/PM/lpmriCeD9lumdPv/uGbM6FdNgazgj6wKpvfyzSryMOjjM6KZMTvYbLeV/bCfMKQ
         qqrKjQdeXZMIotLZzCgOVWIHbqk6hjP1GTxGw+6bE7jeY3lY0pOafRTczC4UZEmG4WXk
         NsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109441; x=1746714241;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oGx58QBo8s1Fm4SWVeSISV6z+REsDGmk2YbjJ4CAd/c=;
        b=XUa1K+7U3gYhUtegTl28pRW4K0aabgQwHneQ7dUBpuz4DzQxKDHhfLv8gYEvFhgcdQ
         0av869AQRhgCKuG/HbAu82uiy2NHruleKwK9EB8tjl29QihQyykGiSxn2hmvzTSfZdMQ
         iPsmbqXnD5z/wKHPs3OWO+yQ4Qec5030bSOajzQbeq/QYl+/9GZs/IdQ1i+1I2EeMaG/
         yo5jKdVz/scqNJ+Dp//Gn/0a+Zul1uZgNNhrlPrhaq2EhQB/B0drNA3rvEhJNhhrzeAn
         /hLzQhGcTJtRf2idVGOcg8gp42sKOAC4yI4yY1cZzTUmVnbwLnL+IbLTPm90YjiAd7sy
         hdFQ==
X-Gm-Message-State: AOJu0YxjBEdSIgtQ8nQRG1DVTKYMTgzoQRdlVBH/Bb0uNJ+GJXzSV8Pf
	EI0S3M3UJCSmoEuJAeFGTdYYtFczWyrKpIMmaq+a558o8akcLtQI
X-Gm-Gg: ASbGnctvik07q9Owy6X0D3PP8yESjradUXuDfu8H1VgRGG9Z2BlmPiP9vk5RTJlUHHY
	oqqUkByoRcqnjSXbQBsOxjCyEGN+fTAPS6O2JThyzlie6vSIGcwxh/xgpX8UcgBjR9dGNVTS6c/
	/ef9nikBYNn0TicbKkTIW+yBB1MM8Sg9b0ci6aqUGk8hpWbRaYqXBUIgO3eRpRGOR3s1Dglu9Zq
	ZUY/SQ/SXbIHpO/UPV2vHXLAlK7Rngb35kf7uPIPnQ9jgXxHRvG+q+w8jHutKW9FaBo5txOVO5A
	Bq7Tp0Z+IZXEFYGbIbTF5+11CNR/3w48cMpyKNAVC0VQLUzLVPwALXok6JnILcJKXXYqyasV1X4
	oymUg2InzdIlBiUV+h4EuTq5asdo=
X-Google-Smtp-Source: AGHT+IEL1Z+iJJecqWLBb5nQ+i/4kdtVVAMuM+85WpXwI7XMq+p/41XGSchCdAl7L1sypMsHrXyGlw==
X-Received: by 2002:a17:907:86a4:b0:ac3:5c8e:d3f5 with SMTP id a640c23a62f3a-acef4299d67mr334387566b.27.1746109441258;
        Thu, 01 May 2025 07:24:01 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------aIh7CeGGeBPDjMz6Dzo6sC7q"
Message-ID: <cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com>
Date: Thu, 1 May 2025 16:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Move parts of Arm's Dom0less to common code
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2504301754320.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2504301754320.3879245@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------aIh7CeGGeBPDjMz6Dzo6sC7q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/1/25 2:55 AM, Stefano Stabellini wrote:
> The patch series needs to be rebased. Actually, I couldn't find a
> baseline where to apply patch #2 successfully

The baseline is:

   b0e54c0719 CI: write whole etc/issue for domU initrd But I will 
prepare and send new version of the patch series soon, and, of course, 
it will be rebased on top of current staging. ~ Oleksii

>
> On Mon, 14 Apr 2025, Oleksii Kurochko wrote:
>> Some parts of Arm's Dom0less solution could be moved to common code as they are
>> not truly Arm-specific.
>>
>> Most of the code is moved as is, with only minor changes introduced to provide
>> abstractions that hide Arm-specific details, while maintaining functional
>> equivalence with original Arm's code.
>>
>> There are several open questions:
>> 1. Probably, the introduced headers currently placed in asm-generic should
>>     instead reside in the xen/include folder.
>> 2. Perhaps the introduced *.c files should always be placed elsewhere. They
>>     have been put in device-tree common as they somewhat depend on device tree
>>     functionality.
>> 3. The u64 and u32 types are widely used in the code where device tree
>>     functionality is implemented because these types are used in device tree
>>     function arguments.
>>     Should this be reworked to use uint32_t and uint64_t instead? If so, will it
>>     also be necessary to change the type of variables passed to dt-related
>>     functions, or should the argument types of device tree functions be updated
>>     too? For example:
>>     ```
>>      u64 mem;
>>      ...
>>      rc = dt_property_read_u64(node, "memory", &mem);
>>     ```
>>     where dt_property_read_u64 is declared as:
>>       bool dt_property_read_u64(... , u64 *out_value);
>> 4. Instead of providing init_intc_phandle() (see the patch: [1]), perhaps it
>>     would be better to add a for loop in domain_handle_dtb_bootmodule()?
>>     Something like:
>>     ```
>>      bool is_intc_phandle_inited = false;
>>      for ( unsigned int i = 0; i < ARRAY_SIZE(intc_names_array); i++ )
>>      {
>>          if ( dt_node_cmp(name, intc_names_array[i]) == 0 )
>>          {
>>              uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
>>
>>              if ( phandle_intc != 0 )
>>                  kinfo->phandle_intc = phandle_intc;
>>
>>              is_intc_phandle_inited = true;
>>              break;
>>          }
>>      }
>>
>>      if ( is_intc_phandle_inited ) continue;
>>    ```
>>
>> [1]] [PATCH v1 9/9] xen/common: dom0less: introduce common dom0less-build.c
>>
>> ---
>> Changes in v2:
>> - Update cover letter message.
>> - Rebase on top of the current staging.
>> - Drop patches:
>>     - asm-generic: move Arm's static-memory.h to asm-generic
>>     - asm-generic: move Arm's static-shmem.h to asm-generic
>>    as in the nearest future there is no real users of STATIC_MEMORY and
>>    STATIC_SHMEM.
>> - Add new cleanup patch:
>>    [PATCH v2 1/8] xen/arm: drop declaration of handle_device_interrupts()
>> - All other changes are patch specific. Please check them seprately for each
>>    patch
>> ---
>>
>> Oleksii Kurochko (8):
>>    xen/arm: drop declaration of handle_device_interrupts()
>>    xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common
>>    asm-generic: move parts of Arm's asm/kernel.h to common code
>>    arm/static-shmem.h: drop inclusion of asm/setup.h
>>    asm-generic: move some parts of Arm's domain_build.h to common
>>    xen/common: dom0less: introduce common kernel.c
>>    xen/common: dom0less: introduce common domain-build.c
>>    xen/common: dom0less: introduce common dom0less-build.c
>>
>>   xen/arch/arm/Kconfig                      |  10 +-
>>   xen/arch/arm/acpi/domain_build.c          |   4 +-
>>   xen/arch/arm/dom0less-build.c             | 997 +++-------------------
>>   xen/arch/arm/domain_build.c               | 411 +--------
>>   xen/arch/arm/include/asm/Makefile         |   1 +
>>   xen/arch/arm/include/asm/dom0less-build.h |  32 -
>>   xen/arch/arm/include/asm/domain_build.h   |  31 +-
>>   xen/arch/arm/include/asm/kernel.h         | 126 +--
>>   xen/arch/arm/include/asm/static-memory.h  |   2 +-
>>   xen/arch/arm/include/asm/static-shmem.h   |   2 +-
>>   xen/arch/arm/kernel.c                     | 234 +----
>>   xen/arch/arm/static-memory.c              |   1 +
>>   xen/arch/arm/static-shmem.c               |   3 +-
>>   xen/common/Kconfig                        |  19 +
>>   xen/common/device-tree/Makefile           |   3 +
>>   xen/common/device-tree/dom0less-build.c   | 891 +++++++++++++++++++
>>   xen/common/device-tree/domain-build.c     | 404 +++++++++
>>   xen/common/device-tree/dt-overlay.c       |   4 +-
>>   xen/common/device-tree/kernel.c           | 242 ++++++
>>   xen/include/asm-generic/dom0less-build.h  |  82 ++
>>   xen/include/xen/fdt-domain-build.h        |  77 ++
>>   xen/include/xen/fdt-kernel.h              | 146 ++++
>>   22 files changed, 2013 insertions(+), 1709 deletions(-)
>>   delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>   create mode 100644 xen/common/device-tree/dom0less-build.c
>>   create mode 100644 xen/common/device-tree/domain-build.c
>>   create mode 100644 xen/common/device-tree/kernel.c
>>   create mode 100644 xen/include/asm-generic/dom0less-build.h
>>   create mode 100644 xen/include/xen/fdt-domain-build.h
>>   create mode 100644 xen/include/xen/fdt-kernel.h
>>
>> -- 
>> 2.49.0
>>
--------------aIh7CeGGeBPDjMz6Dzo6sC7q
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
    <div class="moz-cite-prefix">On 5/1/25 2:55 AM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2504301754320.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">The patch series needs to be rebased. Actually, I couldn't find a
baseline where to apply patch #2 successfully</pre>
    </blockquote>
    <pre>The baseline is:
<pre><span
style="color: rgb(27, 29, 34); font-family: Inter, Twemoji, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, Arial, Helvetica, sans-serif, &quot;Noto Color Emoji&quot;; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.132px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">  b0e54c0719 CI: write whole etc/issue for domU initrd

But I will prepare and send new version of the patch series soon, and, of course, it will be
rebased on top of current staging.

~ Oleksii
</span></pre></pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2504301754320.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

On Mon, 14 Apr 2025, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Some parts of Arm's Dom0less solution could be moved to common code as they are
not truly Arm-specific.

Most of the code is moved as is, with only minor changes introduced to provide
abstractions that hide Arm-specific details, while maintaining functional
equivalence with original Arm's code.

There are several open questions:
1. Probably, the introduced headers currently placed in asm-generic should
   instead reside in the xen/include folder.
2. Perhaps the introduced *.c files should always be placed elsewhere. They
   have been put in device-tree common as they somewhat depend on device tree
   functionality.
3. The u64 and u32 types are widely used in the code where device tree
   functionality is implemented because these types are used in device tree
   function arguments.
   Should this be reworked to use uint32_t and uint64_t instead? If so, will it
   also be necessary to change the type of variables passed to dt-related
   functions, or should the argument types of device tree functions be updated
   too? For example:
   ```
    u64 mem;
    ...
    rc = dt_property_read_u64(node, "memory", &amp;mem);
   ```
   where dt_property_read_u64 is declared as:
     bool dt_property_read_u64(... , u64 *out_value);
4. Instead of providing init_intc_phandle() (see the patch: [1]), perhaps it
   would be better to add a for loop in domain_handle_dtb_bootmodule()?
   Something like:
   ```
    bool is_intc_phandle_inited = false;
    for ( unsigned int i = 0; i &lt; ARRAY_SIZE(intc_names_array); i++ )
    {
        if ( dt_node_cmp(name, intc_names_array[i]) == 0 )
        {
            uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);

            if ( phandle_intc != 0 )
                kinfo-&gt;phandle_intc = phandle_intc;

            is_intc_phandle_inited = true;
            break;
        }
    }

    if ( is_intc_phandle_inited ) continue;
  ```

[1]] [PATCH v1 9/9] xen/common: dom0less: introduce common dom0less-build.c

---
Changes in v2:
- Update cover letter message.
- Rebase on top of the current staging.
- Drop patches:
   - asm-generic: move Arm's static-memory.h to asm-generic
   - asm-generic: move Arm's static-shmem.h to asm-generic
  as in the nearest future there is no real users of STATIC_MEMORY and
  STATIC_SHMEM.
- Add new cleanup patch:
  [PATCH v2 1/8] xen/arm: drop declaration of handle_device_interrupts()
- All other changes are patch specific. Please check them seprately for each
  patch
---

Oleksii Kurochko (8):
  xen/arm: drop declaration of handle_device_interrupts()
  xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common
  asm-generic: move parts of Arm's asm/kernel.h to common code
  arm/static-shmem.h: drop inclusion of asm/setup.h
  asm-generic: move some parts of Arm's domain_build.h to common
  xen/common: dom0less: introduce common kernel.c
  xen/common: dom0less: introduce common domain-build.c
  xen/common: dom0less: introduce common dom0less-build.c

 xen/arch/arm/Kconfig                      |  10 +-
 xen/arch/arm/acpi/domain_build.c          |   4 +-
 xen/arch/arm/dom0less-build.c             | 997 +++-------------------
 xen/arch/arm/domain_build.c               | 411 +--------
 xen/arch/arm/include/asm/Makefile         |   1 +
 xen/arch/arm/include/asm/dom0less-build.h |  32 -
 xen/arch/arm/include/asm/domain_build.h   |  31 +-
 xen/arch/arm/include/asm/kernel.h         | 126 +--
 xen/arch/arm/include/asm/static-memory.h  |   2 +-
 xen/arch/arm/include/asm/static-shmem.h   |   2 +-
 xen/arch/arm/kernel.c                     | 234 +----
 xen/arch/arm/static-memory.c              |   1 +
 xen/arch/arm/static-shmem.c               |   3 +-
 xen/common/Kconfig                        |  19 +
 xen/common/device-tree/Makefile           |   3 +
 xen/common/device-tree/dom0less-build.c   | 891 +++++++++++++++++++
 xen/common/device-tree/domain-build.c     | 404 +++++++++
 xen/common/device-tree/dt-overlay.c       |   4 +-
 xen/common/device-tree/kernel.c           | 242 ++++++
 xen/include/asm-generic/dom0less-build.h  |  82 ++
 xen/include/xen/fdt-domain-build.h        |  77 ++
 xen/include/xen/fdt-kernel.h              | 146 ++++
 22 files changed, 2013 insertions(+), 1709 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/common/device-tree/domain-build.c
 create mode 100644 xen/common/device-tree/kernel.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h
 create mode 100644 xen/include/xen/fdt-domain-build.h
 create mode 100644 xen/include/xen/fdt-kernel.h

-- 
2.49.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------aIh7CeGGeBPDjMz6Dzo6sC7q--

