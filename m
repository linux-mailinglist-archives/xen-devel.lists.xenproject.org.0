Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA250A3AB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 17:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310298.527054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYP7-0003iE-8r; Thu, 21 Apr 2022 15:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310298.527054; Thu, 21 Apr 2022 15:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYP7-0003gO-5q; Thu, 21 Apr 2022 15:07:33 +0000
Received: by outflank-mailman (input) for mailman id 310298;
 Thu, 21 Apr 2022 15:07:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckMZ=U7=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1nhYP5-0003gE-2b
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 15:07:31 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c01eb33f-c184-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 17:07:25 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id t13so4874253pgn.8
 for <xen-devel@lists.xenproject.org>; Thu, 21 Apr 2022 08:07:29 -0700 (PDT)
Received: from [192.168.0.18] ([118.33.58.98])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a17090a398500b001cd4989ff42sm2863344pjb.9.2022.04.21.08.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:07:27 -0700 (PDT)
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
X-Inumbo-ID: c01eb33f-c184-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references:from
         :cc:in-reply-to:content-transfer-encoding;
        bh=GQYR9lJ8zjpdtOiTDeHXoBEngQpEucubUv0M42ZEpO8=;
        b=CvuXxD8pi6iDcudogEmmKvmSj2wPUQbTCKwoWlqLIbByZVlCLQCJRXS6unJk55bmhz
         VjPAHJlqMMkIIabry+rZFhePQhB0PCrYqZPSdYjpF0mDdJQVLHoI9S1HqYdEZ17YvneZ
         E2VW4OpiQ/f2tSP1Gt9cjKEHQmFwDb4DnMDjZBkJgsmoTNx9VpeTJu7U5kNdFt50tWjl
         5ubxLXE3Iz22/LBGsBMJ0zcHMJQL522cMF/ltYSHnUOXOqQC/YP1gCpa3X0pAbbX+P4b
         E7q7eH3DB5vyXjW7Rktp5/m7BewZoTzpDouJCXAsL33Itb6OjY7SqhKT++HWYXDBpFXj
         IZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:from:cc:in-reply-to:content-transfer-encoding;
        bh=GQYR9lJ8zjpdtOiTDeHXoBEngQpEucubUv0M42ZEpO8=;
        b=nZOTKaNW7c1quf9or5bNb9w+/hpEiAkGSW0joVnWWJ/h7wvBAPYxvctX7ud1Hokuly
         8+atcez9TzomL1oiMn+NBM/gbUqID0M34CJ5v1HNokpamnMO7b6nC9kp62wJTWL/UdPX
         QCkk4WI9tBzVgEyTlsLFSYW+X7cf5KoZrMEth8E6Qy9YQLbn6UhJJft6dsJOVpdfjTjP
         8dRkFU95uPM6Rk6yNWZFbz0DCARwTZjecZ9alOk/kW7ioM2WDVlxCpHCqqnO3YF1TMwn
         vW7rzukFLV+XQxaaOPmHYaKp42QtzO6JWgIGIoAFwhBfSFIOJJMy33iGYEc9/PphaJOx
         Eb3g==
X-Gm-Message-State: AOAM531LFaicrNuMy+JFqor7k3c62R8n2nEgTAqrcMCEcsr2YS/wDEl/
	+y4CkovtL+2ef57MWXgX6SzL02Nye5loAfci
X-Google-Smtp-Source: ABdhPJwDykSzbtbD2/m7RMdY1NoTrNNdg3OrPer8QT3JFcSPxW6NlU8GFPivKk+NEay8R6W/8Rj70g==
X-Received: by 2002:a63:d347:0:b0:39c:d7d5:77fc with SMTP id u7-20020a63d347000000b0039cd7d577fcmr24236705pgi.201.1650553647832;
        Thu, 21 Apr 2022 08:07:27 -0700 (PDT)
Message-ID: <81517f48-346a-4756-310c-070d5ffd5834@gmail.com>
Date: Fri, 22 Apr 2022 00:07:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/arm: silence ambiguous integer casting warning error
To: Julien Grall <julien.grall.oss@gmail.com>
References: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
 <CAJ=z9a37_y3B4aAfiK5C-bHJYyWqCo0+g+jB6cdDCmOzLuXLJw@mail.gmail.com>
 <925421bc-680b-df61-5a75-681d752c4820@gmail.com>
 <b8a0feed-1dde-3b36-646e-1e5413de8395@gmail.com>
 <CAJ=z9a2n0bWEk-7cpOj2q_4fUqetjkQdkgBGYKoQeGeDJ8MxTQ@mail.gmail.com>
From: Paran Lee <p4ranlee@gmail.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
In-Reply-To: <CAJ=z9a2n0bWEk-7cpOj2q_4fUqetjkQdkgBGYKoQeGeDJ8MxTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Julien Grall.

Thank you! After thinking about it, I agree that the patch I suggested
is not a good way to go.

> I don't understand how this is related to adding extra cflags. Can you
> clarify it?

https://www.youtube.com/watch?v=RPgYinVQUgw

I took a short video of debugging through qemu and gdb.
I would like to try doing this with Xen in the same way.

I'm sorry I couldn't explain the debugging process well in writing. It's
not easy. :)

If I could explain the above my video in one sentence,
qemu booting arm64 kernel & gdb remote debugging with debug symbol
information.

BR,
Paran Lee


2022-04-20 오전 2:31에 Julien Grall 이(가) 쓴 글:
> Hi,
> 
> On Tue, 19 Apr 2022, 17:09 Paran Lee, <p4ranlee@gmail.com> wrote:
> 
>> Debugging with GDB from head.S with QEMU runtime was very convenient for
>> analysis(linux). so I have trying it in Xen. As I built it.
>>
> 
> I don't understand how this is related to adding extra cflags. Can you
> clarify it?
> 
> 
>> Wouldn't it be helpful if I fixed the code little by little?
> 
> 
> I am all to make Xen more robust. However, you are now implicitly casting a
> signed int to unsigned int. I am not convinced this is a good move.
> 
> I think it would be better to fix the other side of the equation or
> properly modify the function return.
> 
> Cheers,
> 
> 
>> 2022-04-20 오전 1:31에 Paran Lee 이(가) 쓴 글:
>>> Hi, Julien Grall.
>>>
>>> Thank you for checking it out. I'm sorry I forgot to attach the make log
>>> as well.
>>>
>>> My build configuration (include CFLGAS)
>>>
>>> export ARCH=arm64
>>> export XEN_TARGET_ARCH=arm64
>>> export $(dpkg-architecture -aarm64);
>>> export CROSS_COMPILE=aarch64-linux-gnu-
>>> export CFLAGS="-g -Wall -Wextra -Wno-unused-parameter"
>>>
>>> And i did     make dist-xen
>>>
>>> my arm64 compiler information are here.
>>> gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
>>>
>>> ~/xen$ aarch64-linux-gnu-gcc -v
>>> Using built-in specs.
>>> COLLECT_GCC=aarch64-linux-gnu-gcc
>>> COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/aarch64-linux-gnu/9/lto-wrapper
>>> Target: aarch64-linux-gnu
>>> Configured with: ../src/configure -v --with-pkgversion='Ubuntu
>>> 9.4.0-1ubuntu1~20.04.1'
>>> --with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs
>>> --enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++,gm2 --prefix=/usr
>>> --with-gcc-major-version-only --program-suffix=-9 --enable-shared
>>> --enable-linker-build-id --libexecdir=/usr/lib
>>> --without-included-gettext --enable-threads=posix --libdir=/usr/lib
>>> --enable-nls --with-sysroot=/ --enable-clocale=gnu
>>> --enable-libstdcxx-debug --enable-libstdcxx-time=yes
>>> --with-default-libstdcxx-abi=new --enable-gnu-unique-object
>>> --disable-libquadmath --disable-libquadmath-support --enable-plugin
>>> --enable-default-pie --with-system-zlib --without-target-system-zlib
>>> --enable-libpth-m2 --enable-multiarch --enable-fix-cortex-a53-843419
>>> --disable-werror --enable-checking=release --build=x86_64-linux-gnu
>>> --host=x86_64-linux-gnu --target=aarch64-linux-gnu
>>> --program-prefix=aarch64-linux-gnu-
>>> --includedir=/usr/aarch64-linux-gnu/include
>>> Thread model: posix
>>> gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
>>>
>>> In arch/arm/gic-v3.c files.
>>>
>>> arch/arm/gic-v3.c: In function ‘gicv3_compute_target_list’:
>>> arch/arm/gic-v3.c:926:17: error: comparison of integer expressions of
>>> different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>>>   926 |     while ( cpu < nr_cpu_ids )
>>>       |                 ^
>>> arch/arm/gic-v3.c:936:18: error: comparison of integer expressions of
>>> different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>>>   936 |         if ( cpu == nr_cpu_ids )
>>>       |                  ^~                           ^
>>>
>>> In arch/arm/setup.c files.
>>>
>>> arch/arm/setup.c: In function ‘start_xen’:
>>> ./include/xen/cpumask.h:374:13: error: comparison of integer expressions
>>> of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>>>   374 |       (cpu) < nr_cpu_ids;  \
>>>       |             ^
>>> ./include/xen/cpumask.h:459:36: note: in expansion of macro
>> ‘for_each_cpu’
>>>   459 | #define for_each_present_cpu(cpu)  for_each_cpu(cpu,
>>> &cpu_present_map)
>>>       |                                    ^~~~~~~~~~~~
>>> arch/arm/setup.c:989:5: note: in expansion of macro
>> ‘for_each_present_cpu’
>>>   989 |     for_each_present_cpu ( i )
>>>       |     ^~~~~~~~~~~~~~~~~~~~             ^
>>>
>>> Thank you!
>>>
>>> 2022-04-20 오전 12:50에 Julien Grall 이(가) 쓴 글:
>>>> Hi,
>>>>
>>>> On Tue, 19 Apr 2022, 15:41 Paran Lee, <p4ranlee@gmail.com> wrote:
>>>>
>>>>> GCC with "-g -Wall -Wextra" option throws warning message as below:
>>>>
>>>>
>>>> Which version of the compiler? Also you specify the exact cflags, did
>> you
>>>> tweak Xen?
>>>>
>>>>
>>>>> error: comparison of integer expressions of different signedness:
>>>>>  ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>>>>>
>>>>
>>>> GCC should give you a line/file. Can you provide it?
>>>>
>>>> Cheers,
>>>>
>>>>
>>>>> Silence the warning by correcting the integer type.
>>>>>
>>>>> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
>>>>> ---
>>>>>  xen/arch/arm/gic-v3.c | 5 +++--
>>>>>  xen/arch/arm/setup.c  | 2 +-
>>>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>>> index 3c472ed768..81ac25f528 100644
>>>>> --- a/xen/arch/arm/gic-v3.c
>>>>> +++ b/xen/arch/arm/gic-v3.c
>>>>> @@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)
>>>>>      isb();
>>>>>  }
>>>>>
>>>>> -static u16 gicv3_compute_target_list(int *base_cpu, const struct
>> cpumask
>>>>> *mask,
>>>>> +static u16 gicv3_compute_target_list(unsigned int *base_cpu,
>>>>> +                                     const struct cpumask *mask,
>>>>>                                       uint64_t cluster_id)
>>>>>  {
>>>>>      int cpu = *base_cpu;
>>>>> @@ -953,7 +954,7 @@ out:
>>>>>
>>>>>  static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t
>>>>> *cpumask)
>>>>>  {
>>>>> -    int cpu = 0;
>>>>> +    unsigned int cpu = 0;
>>>>>      uint64_t val;
>>>>>
>>>>>      for_each_cpu(cpu, cpumask)
>>>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>>>> index d5d0792ed4..5ab2aaecaf 100644
>>>>> --- a/xen/arch/arm/setup.c
>>>>> +++ b/xen/arch/arm/setup.c
>>>>> @@ -862,7 +862,7 @@ void __init start_xen(unsigned long
>> boot_phys_offset,
>>>>>                        unsigned long fdt_paddr)
>>>>>  {
>>>>>      size_t fdt_size;
>>>>> -    int cpus, i;
>>>>> +    unsigned int cpus, i;
>>>>>      const char *cmdline;
>>>>>      struct bootmodule *xen_bootmodule;
>>>>>      struct domain *d;
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>>
>>>>
>>
> 

