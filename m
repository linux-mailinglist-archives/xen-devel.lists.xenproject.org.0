Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E43507620
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 19:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308401.524127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrMU-0004mB-RJ; Tue, 19 Apr 2022 17:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308401.524127; Tue, 19 Apr 2022 17:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrMU-0004kL-Nz; Tue, 19 Apr 2022 17:09:58 +0000
Received: by outflank-mailman (input) for mailman id 308401;
 Tue, 19 Apr 2022 17:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hN/8=U5=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1ngrMS-0004jw-P9
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 17:09:56 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 885da80b-c003-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 19:09:55 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id c23so16424786plo.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 10:09:55 -0700 (PDT)
Received: from [192.168.0.18] ([118.33.58.98])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090a0e4100b001ce188720e5sm16340158pja.53.2022.04.19.10.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 10:09:53 -0700 (PDT)
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
X-Inumbo-ID: 885da80b-c003-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:from:to:references
         :cc:in-reply-to:content-transfer-encoding;
        bh=DCzhmz/4cQQnX73E5Ilu9RqLgmLe/yGX4F7Eamu7Pjo=;
        b=eEQ0N8O3pMdkTqVMlAUkrzUmoibgDg/s9IPKbkpu5a/IYGRJuKIPEoiKGykUz4ZjKd
         y4oOzwXmBUWmeRpvhSPk6N06Qp+l3nS9ER3QYWBQeneNpTb0hQk79B5z1/bQR9FJ/SdE
         8JRWN7Yy2r3TMw68BbeB9r2JAIKv/voHGFoMm6JCux/svs2OjANRnVW7ng4IkRKhMZ2G
         LxjsupZn4C1kHcIcRvjNdgGVO/3OOGqg2kCdRPGUNAzJMTQwG5xO26sfK4JGDsxmbtKC
         wfMFaSUPPEGToLMZGTEVps7nQa8S/7FwMX/yG0KVrsD/VuZnvHHOPdTDXZLTeflS79uH
         EfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :from:to:references:cc:in-reply-to:content-transfer-encoding;
        bh=DCzhmz/4cQQnX73E5Ilu9RqLgmLe/yGX4F7Eamu7Pjo=;
        b=zIbM14kopLs4udmkTwBCet/WQW8qEEFUm8nwzu7uMpzl/g0gC/OYm+iARrwUvZj1Rg
         gVkkXi1IOX/Jyjkmk11Ytu020oAZICGHGRXucm8QB7xoHbPSH867fW+DBYDOvVxOgh6p
         7Medsy7OtQjyl7F8CuxO/M86wUFcodKrr9r1eI0njEtGK0az2OZirfzC3QBhDQYOTumK
         yNTV25iMmL3j/BX6+5Kf53h6WnE0T8n8E5ZVuAkhpfGryMpFS0DSu3Cx1aVk/WF/Yd83
         do++QYDjSyPXtsAplezdzTpuTocp7JqgPRDKOTA+OEZkw51k1UcFhFanTvZruAr9oXbk
         0XeA==
X-Gm-Message-State: AOAM5329Mizf7H9TPFImMHgiP2nWIlU3rePzyjQLSO46yhB9mMD/uSGI
	LFSxukUxfuMGhsg/X4RLBP451vR4p8Syiu7x
X-Google-Smtp-Source: ABdhPJwmqT0urknfrmRMpr0tvSlbOUnqB0juHtH9Hl7WVLML8Jh7x5hgfX+TRtHY+32FdFC1g9qtDQ==
X-Received: by 2002:a17:903:2c7:b0:158:2f26:6016 with SMTP id s7-20020a17090302c700b001582f266016mr16849919plk.154.1650388193945;
        Tue, 19 Apr 2022 10:09:53 -0700 (PDT)
Message-ID: <b8a0feed-1dde-3b36-646e-1e5413de8395@gmail.com>
Date: Wed, 20 Apr 2022 02:09:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/arm: silence ambiguous integer casting warning error
From: Paran Lee <p4ranlee@gmail.com>
To: Julien Grall <julien.grall.oss@gmail.com>
References: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
 <CAJ=z9a37_y3B4aAfiK5C-bHJYyWqCo0+g+jB6cdDCmOzLuXLJw@mail.gmail.com>
 <925421bc-680b-df61-5a75-681d752c4820@gmail.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
In-Reply-To: <925421bc-680b-df61-5a75-681d752c4820@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Debugging with GDB from head.S with QEMU runtime was very convenient for
analysis(linux). so I have trying it in Xen. As I built it.

Wouldn't it be helpful if I fixed the code little by little?

2022-04-20 오전 1:31에 Paran Lee 이(가) 쓴 글:
> Hi, Julien Grall.
> 
> Thank you for checking it out. I'm sorry I forgot to attach the make log
> as well.
> 
> My build configuration (include CFLGAS)
> 
> export ARCH=arm64
> export XEN_TARGET_ARCH=arm64
> export $(dpkg-architecture -aarm64);
> export CROSS_COMPILE=aarch64-linux-gnu-
> export CFLAGS="-g -Wall -Wextra -Wno-unused-parameter"
> 
> And i did     make dist-xen
> 
> my arm64 compiler information are here.
> gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
> 
> ~/xen$ aarch64-linux-gnu-gcc -v
> Using built-in specs.
> COLLECT_GCC=aarch64-linux-gnu-gcc
> COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/aarch64-linux-gnu/9/lto-wrapper
> Target: aarch64-linux-gnu
> Configured with: ../src/configure -v --with-pkgversion='Ubuntu
> 9.4.0-1ubuntu1~20.04.1'
> --with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs
> --enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++,gm2 --prefix=/usr
> --with-gcc-major-version-only --program-suffix=-9 --enable-shared
> --enable-linker-build-id --libexecdir=/usr/lib
> --without-included-gettext --enable-threads=posix --libdir=/usr/lib
> --enable-nls --with-sysroot=/ --enable-clocale=gnu
> --enable-libstdcxx-debug --enable-libstdcxx-time=yes
> --with-default-libstdcxx-abi=new --enable-gnu-unique-object
> --disable-libquadmath --disable-libquadmath-support --enable-plugin
> --enable-default-pie --with-system-zlib --without-target-system-zlib
> --enable-libpth-m2 --enable-multiarch --enable-fix-cortex-a53-843419
> --disable-werror --enable-checking=release --build=x86_64-linux-gnu
> --host=x86_64-linux-gnu --target=aarch64-linux-gnu
> --program-prefix=aarch64-linux-gnu-
> --includedir=/usr/aarch64-linux-gnu/include
> Thread model: posix
> gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
> 
> In arch/arm/gic-v3.c files.
> 
> arch/arm/gic-v3.c: In function ‘gicv3_compute_target_list’:
> arch/arm/gic-v3.c:926:17: error: comparison of integer expressions of
> different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>   926 |     while ( cpu < nr_cpu_ids )
>       |                 ^
> arch/arm/gic-v3.c:936:18: error: comparison of integer expressions of
> different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>   936 |         if ( cpu == nr_cpu_ids )
>       |                  ^~                           ^
> 
> In arch/arm/setup.c files.
> 
> arch/arm/setup.c: In function ‘start_xen’:
> ./include/xen/cpumask.h:374:13: error: comparison of integer expressions
> of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>   374 |       (cpu) < nr_cpu_ids;  \
>       |             ^
> ./include/xen/cpumask.h:459:36: note: in expansion of macro ‘for_each_cpu’
>   459 | #define for_each_present_cpu(cpu)  for_each_cpu(cpu,
> &cpu_present_map)
>       |                                    ^~~~~~~~~~~~
> arch/arm/setup.c:989:5: note: in expansion of macro ‘for_each_present_cpu’
>   989 |     for_each_present_cpu ( i )
>       |     ^~~~~~~~~~~~~~~~~~~~             ^
> 
> Thank you!
> 
> 2022-04-20 오전 12:50에 Julien Grall 이(가) 쓴 글:
>> Hi,
>>
>> On Tue, 19 Apr 2022, 15:41 Paran Lee, <p4ranlee@gmail.com> wrote:
>>
>>> GCC with "-g -Wall -Wextra" option throws warning message as below:
>>
>>
>> Which version of the compiler? Also you specify the exact cflags, did you
>> tweak Xen?
>>
>>
>>> error: comparison of integer expressions of different signedness:
>>>  ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>>>
>>
>> GCC should give you a line/file. Can you provide it?
>>
>> Cheers,
>>
>>
>>> Silence the warning by correcting the integer type.
>>>
>>> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
>>> ---
>>>  xen/arch/arm/gic-v3.c | 5 +++--
>>>  xen/arch/arm/setup.c  | 2 +-
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index 3c472ed768..81ac25f528 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)
>>>      isb();
>>>  }
>>>
>>> -static u16 gicv3_compute_target_list(int *base_cpu, const struct cpumask
>>> *mask,
>>> +static u16 gicv3_compute_target_list(unsigned int *base_cpu,
>>> +                                     const struct cpumask *mask,
>>>                                       uint64_t cluster_id)
>>>  {
>>>      int cpu = *base_cpu;
>>> @@ -953,7 +954,7 @@ out:
>>>
>>>  static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t
>>> *cpumask)
>>>  {
>>> -    int cpu = 0;
>>> +    unsigned int cpu = 0;
>>>      uint64_t val;
>>>
>>>      for_each_cpu(cpu, cpumask)
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index d5d0792ed4..5ab2aaecaf 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -862,7 +862,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>>>                        unsigned long fdt_paddr)
>>>  {
>>>      size_t fdt_size;
>>> -    int cpus, i;
>>> +    unsigned int cpus, i;
>>>      const char *cmdline;
>>>      struct bootmodule *xen_bootmodule;
>>>      struct domain *d;
>>> --
>>> 2.25.1
>>>
>>>
>>

