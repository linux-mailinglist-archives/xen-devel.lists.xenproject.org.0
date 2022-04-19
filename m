Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CB5072F9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 18:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308376.524104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqlW-0000Bo-J8; Tue, 19 Apr 2022 16:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308376.524104; Tue, 19 Apr 2022 16:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngqlW-00009V-G2; Tue, 19 Apr 2022 16:31:46 +0000
Received: by outflank-mailman (input) for mailman id 308376;
 Tue, 19 Apr 2022 16:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hN/8=U5=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1ngqlV-00009P-0o
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 16:31:45 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3210c679-bffe-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 18:31:43 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 n11-20020a17090a73cb00b001d1d3a7116bso2010146pjk.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 09:31:43 -0700 (PDT)
Received: from [192.168.0.18] ([118.33.58.98])
 by smtp.gmail.com with ESMTPSA id
 y9-20020aa78f29000000b005098201d2f5sm16748313pfr.205.2022.04.19.09.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 09:31:41 -0700 (PDT)
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
X-Inumbo-ID: 3210c679-bffe-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references:from
         :cc:in-reply-to:content-transfer-encoding;
        bh=Aj4BcQWJTSiyqk48xgH1z3685F70s75Z0C6GtdN4G5Q=;
        b=eYuG73vkbejEY44RC3Il2Ny6MkZQ6xjfKvV4U/YDJA23Hz9UGUuDeGagFzX9ok9FR1
         qmc4LPLM5eaHoU48NPt6xQa5u0ImidfayzC8/mMJmfvOP0Bypy178F8CWuRYDjY6FRVv
         JWD2vQFnS/04fayOOCWMT1h4FirJ+Jnp2BO1FLqxVdRvyB83N2R0UYzkaqH7VIVULRUc
         32xS/PLinvjV7TbqMPIAM2E6QvKiCHvr/S7DJNMYOmt/U4SqGp1jdI3Kmt/hW8P1RKcE
         lCjQwpN3zgzlgZglUw87rj3EyDSQWXIdZBFnnOFBesy+hbRoqM6gHoT/EyNddFPGTDo3
         onBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:from:cc:in-reply-to:content-transfer-encoding;
        bh=Aj4BcQWJTSiyqk48xgH1z3685F70s75Z0C6GtdN4G5Q=;
        b=eKe3AoJwD9/0lzQrM5CXXAa/V/z9dTLsh/7f7bURyJMiEm6mHLiI2cPu26DnsnkcHF
         SAaAXQ0yWHVXf61b/bx6uZ+Os/Vtftbpt60mAsWTgGq538m9xyHamj/PvR7SZCujvpT1
         ouTclDCWR0/mqZFvvBOzj2mktisovia7f1J9eRytMv8M0B/YYcsvj4OVik3L/c5NdvIR
         t/rm7zgjYjdf1FLkdGHwxVt+IWj7aLJCk22JRU/CamOh56PJo612So0qCW1lrI4iSQB6
         g8bm+A2b3bFmF29PHiOaIY2hGY1QNXEjs6ZqC5AaNMnnEbVZUs+r3pNZxd3VQolI6lc8
         5qrw==
X-Gm-Message-State: AOAM530Mdbhf8VBGBz66G5NKsKjpGBnc/ehZE0yPLOwl6T8nGyTgMcl/
	UexD+NR1YVEaOoWcdhSyqWJ7O8SHRGaeQgXD
X-Google-Smtp-Source: ABdhPJzTPOdGV9EsO53VElVcS7h/WrT1cWT7NVT1TlZtmN+6o2+mqObgdG3DmQUoFsQ3h7bDOb29Vw==
X-Received: by 2002:a17:90a:8d82:b0:1d2:cd8c:ed6 with SMTP id d2-20020a17090a8d8200b001d2cd8c0ed6mr5176505pjo.63.1650385901861;
        Tue, 19 Apr 2022 09:31:41 -0700 (PDT)
Message-ID: <925421bc-680b-df61-5a75-681d752c4820@gmail.com>
Date: Wed, 20 Apr 2022 01:31:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen/arm: silence ambiguous integer casting warning error
To: Julien Grall <julien.grall.oss@gmail.com>
References: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
 <CAJ=z9a37_y3B4aAfiK5C-bHJYyWqCo0+g+jB6cdDCmOzLuXLJw@mail.gmail.com>
From: Paran Lee <p4ranlee@gmail.com>
Cc: austindh.kim@gmail.com, xen-devel@lists.xenproject.org
In-Reply-To: <CAJ=z9a37_y3B4aAfiK5C-bHJYyWqCo0+g+jB6cdDCmOzLuXLJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Julien Grall.

Thank you for checking it out. I'm sorry I forgot to attach the make log
as well.

My build configuration (include CFLGAS)

export ARCH=arm64
export XEN_TARGET_ARCH=arm64
export $(dpkg-architecture -aarm64);
export CROSS_COMPILE=aarch64-linux-gnu-
export CFLAGS="-g -Wall -Wextra -Wno-unused-parameter"

And i did     make dist-xen

my arm64 compiler information are here.
gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)

~/xen$ aarch64-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=aarch64-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc-cross/aarch64-linux-gnu/9/lto-wrapper
Target: aarch64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu
9.4.0-1ubuntu1~20.04.1'
--with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs
--enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++,gm2 --prefix=/usr
--with-gcc-major-version-only --program-suffix=-9 --enable-shared
--enable-linker-build-id --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix --libdir=/usr/lib
--enable-nls --with-sysroot=/ --enable-clocale=gnu
--enable-libstdcxx-debug --enable-libstdcxx-time=yes
--with-default-libstdcxx-abi=new --enable-gnu-unique-object
--disable-libquadmath --disable-libquadmath-support --enable-plugin
--enable-default-pie --with-system-zlib --without-target-system-zlib
--enable-libpth-m2 --enable-multiarch --enable-fix-cortex-a53-843419
--disable-werror --enable-checking=release --build=x86_64-linux-gnu
--host=x86_64-linux-gnu --target=aarch64-linux-gnu
--program-prefix=aarch64-linux-gnu-
--includedir=/usr/aarch64-linux-gnu/include
Thread model: posix
gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)

In arch/arm/gic-v3.c files.

arch/arm/gic-v3.c: In function ‘gicv3_compute_target_list’:
arch/arm/gic-v3.c:926:17: error: comparison of integer expressions of
different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
  926 |     while ( cpu < nr_cpu_ids )
      |                 ^
arch/arm/gic-v3.c:936:18: error: comparison of integer expressions of
different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
  936 |         if ( cpu == nr_cpu_ids )
      |                  ^~                           ^

In arch/arm/setup.c files.

arch/arm/setup.c: In function ‘start_xen’:
./include/xen/cpumask.h:374:13: error: comparison of integer expressions
of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
  374 |       (cpu) < nr_cpu_ids;  \
      |             ^
./include/xen/cpumask.h:459:36: note: in expansion of macro ‘for_each_cpu’
  459 | #define for_each_present_cpu(cpu)  for_each_cpu(cpu,
&cpu_present_map)
      |                                    ^~~~~~~~~~~~
arch/arm/setup.c:989:5: note: in expansion of macro ‘for_each_present_cpu’
  989 |     for_each_present_cpu ( i )
      |     ^~~~~~~~~~~~~~~~~~~~             ^

Thank you!

2022-04-20 오전 12:50에 Julien Grall 이(가) 쓴 글:
> Hi,
> 
> On Tue, 19 Apr 2022, 15:41 Paran Lee, <p4ranlee@gmail.com> wrote:
> 
>> GCC with "-g -Wall -Wextra" option throws warning message as below:
> 
> 
> Which version of the compiler? Also you specify the exact cflags, did you
> tweak Xen?
> 
> 
>> error: comparison of integer expressions of different signedness:
>>  ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
>>
> 
> GCC should give you a line/file. Can you provide it?
> 
> Cheers,
> 
> 
>> Silence the warning by correcting the integer type.
>>
>> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
>> ---
>>  xen/arch/arm/gic-v3.c | 5 +++--
>>  xen/arch/arm/setup.c  | 2 +-
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index 3c472ed768..81ac25f528 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)
>>      isb();
>>  }
>>
>> -static u16 gicv3_compute_target_list(int *base_cpu, const struct cpumask
>> *mask,
>> +static u16 gicv3_compute_target_list(unsigned int *base_cpu,
>> +                                     const struct cpumask *mask,
>>                                       uint64_t cluster_id)
>>  {
>>      int cpu = *base_cpu;
>> @@ -953,7 +954,7 @@ out:
>>
>>  static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t
>> *cpumask)
>>  {
>> -    int cpu = 0;
>> +    unsigned int cpu = 0;
>>      uint64_t val;
>>
>>      for_each_cpu(cpu, cpumask)
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index d5d0792ed4..5ab2aaecaf 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -862,7 +862,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>>                        unsigned long fdt_paddr)
>>  {
>>      size_t fdt_size;
>> -    int cpus, i;
>> +    unsigned int cpus, i;
>>      const char *cmdline;
>>      struct bootmodule *xen_bootmodule;
>>      struct domain *d;
>> --
>> 2.25.1
>>
>>
> 

