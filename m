Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81CA88643
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950589.1346869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LN2-0005zI-Ea; Mon, 14 Apr 2025 15:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950589.1346869; Mon, 14 Apr 2025 15:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LN2-0005wy-B6; Mon, 14 Apr 2025 15:05:12 +0000
Received: by outflank-mailman (input) for mailman id 950589;
 Mon, 14 Apr 2025 15:05:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4LN0-0005AN-N9
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:05:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da85e723-1941-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:05:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so3838560f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:05:07 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bb3548sm918035966b.5.2025.04.14.08.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 08:05:06 -0700 (PDT)
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
X-Inumbo-ID: da85e723-1941-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744643107; x=1745247907; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0byfp7Rqg8Q+pED+Y9wuf++L9wQ5yzjkxPMim1JtiU=;
        b=CSY+dRev1hgmPDSQsCqhaUD8OTrNX2xtaDf18u9TVnQei5qLRar5kpV687X1YfVB/j
         iVRK/w3bWRYL+IHXCyj0gQTmRW+c2kwKNFLvI7HZLMErYVEAuMz8QDoCB93ewgXQ55sD
         EZ9Os2pljRiW0MkgLcFrdaIgrrjZG2z2/j2Apkpe2mH6EqhNhhdkbIIzTLGApEfEXW7f
         NvfHS//qiJKnWyFDY1lnz/XJvBszzBjY+4ujww9M5qTRa00eL4G5qZTfomCSYUhnxO0h
         21kcC1yJAOJ2+cbU2xGC9RJVSJhj3KOYqkGwH4LVya4reNevxiQSOWXy/jdNTCLK3P2b
         1oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643107; x=1745247907;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j0byfp7Rqg8Q+pED+Y9wuf++L9wQ5yzjkxPMim1JtiU=;
        b=rjMAp6P3XuPusQW4zvNImuj4ldhpV7QWHi5CgWQ+YXEO18D9NtdSjBrcbpvB9kZuym
         zlBEJ+e7jOYXQIFYqhco7LhOUOFI5NlVIxHPop60MCAy9/hMhrSt6ekiREsqJjSVfkQD
         X0aLB4Y3C5Fs6+FEted4B72xLwhuGuyMPVUAA/GMJDWpn175+JB/EoYFl52ElFd26Stn
         jlfFJ+Q7MnLGln5nOZY2f6uTDRGmC20/+q+6d43BaqNYUlrhAkpombnE5mkNB4OGvwr7
         ZuAD1UMZNe3RFPJb9pFBmVG8aBidMMgguW3Z2gNoELflzUjoOdtDLjWv+CtjoUCi1EBj
         5OBg==
X-Forwarded-Encrypted: i=1; AJvYcCUruQJ5v7AynmFk4Ls4NUkPYvvsNQLJYFd2/dbaowNohKhoPWlwIP/t2r+t66Bn7kW5fpVLli7Ov60=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvsyfwK8fWFp8g96Km9Bi5/6cLvsgJrOsGg7pl6Ijcz6R/hO7d
	gCepuAL9pXbBOSGCA3H8WuDQ9B1Ixv4P+K9A+I+tmf3vKWvveD57
X-Gm-Gg: ASbGncsS7Yw6qMhHDKqx/iKtGSFuElJ6nOrBHM7TkdzJ4qZwTO6XqVK3l6z/RXiDwz5
	tXrGU7ibD0L2Rw5T6SiRQUYH3/8hCdJPcU7mhu+cy53+Cf6u3L2eZeuRdg7soVYCd3aBEHUhFx5
	VuCknJNMPHACrwbrmZpET+AcgI+iZ/V3hQjLB3NwcYepnZKB1SIqxrgF9FXZoxJo7LW2MOxoKs4
	OOGdtL7aw/Wn2may/iBsL+h2AmzFo8/DPeCTldcRvH4SojOFTntv3q8vAgj8f1zFEiudZXDOcvz
	rQTebOGBFka/FyNXK2Al8ywUdP1kzTE1gHTHMinuX30P8SjgW5nk1QauCN57+0qj7TXSqmZ14kB
	9c49jHiUPZFDszb30
X-Google-Smtp-Source: AGHT+IHUrd9mB2qRaOgWgaHSQmymZY6nQJOFd9XZsrmxFtpzP8ez9JaxmSQBvhHMd09IuC6min1S8A==
X-Received: by 2002:a05:6000:1867:b0:39c:1429:fa57 with SMTP id ffacd0b85a97d-39ea51f42ccmr10609415f8f.3.1744643107051;
        Mon, 14 Apr 2025 08:05:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------RzsczeltER0pW6JLHs0ZZMOZ"
Message-ID: <127265c3-b572-4763-932a-4bb1d53af0b9@gmail.com>
Date: Mon, 14 Apr 2025 17:05:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/14] xen/riscv: introduce smp_clear_cpu_maps()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ce3460b3857cca9e6f3072a8ddd50b31cb46b855.1744126720.git.oleksii.kurochko@gmail.com>
 <18277077-2cf0-466f-8bde-f7955806bcb2@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <18277077-2cf0-466f-8bde-f7955806bcb2@suse.com>

This is a multi-part message in MIME format.
--------------RzsczeltER0pW6JLHs0ZZMOZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/10/25 3:10 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> Initialize cpu_{possible, online, present}_map by using smp_clear_cpu_maps().
>>
>> Drop DEFINE_PER_CPU(unsigned int, cpu_id) from stubs.c as this variable isn't
>> expected to be used in RISC-V at all.
>>
>> Move declaration of cpu_{possible,online,present}_map from stubs.c to smpboot.c
>> as now smpboot.c is now introduced.
>> Other defintions keep in stubs.c as they are not initialized and not needed, at
>> the moment.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>>   xen/arch/riscv/Makefile          |  1 +
>>   xen/arch/riscv/include/asm/smp.h |  2 ++
>>   xen/arch/riscv/setup.c           |  2 ++
>>   xen/arch/riscv/smpboot.c         | 15 +++++++++++++++
>>   xen/arch/riscv/stubs.c           |  6 ------
>>   5 files changed, 20 insertions(+), 6 deletions(-)
>>   create mode 100644 xen/arch/riscv/smpboot.c
>>
>> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
>> index 0c6c4a38a3..f551bf32a2 100644
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -10,6 +10,7 @@ obj-y += sbi.o
>>   obj-y += setup.o
>>   obj-y += shutdown.o
>>   obj-y += smp.o
>> +obj-y += smpboot.o
>>   obj-y += stubs.o
>>   obj-y += time.o
>>   obj-y += traps.o
>> diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
>> index 5e170b57b3..188c033718 100644
>> --- a/xen/arch/riscv/include/asm/smp.h
>> +++ b/xen/arch/riscv/include/asm/smp.h
>> @@ -26,6 +26,8 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
>>   
>>   void setup_tp(unsigned int cpuid);
>>   
>> +void smp_clear_cpu_maps(void);
>> +
>>   #endif
>>   
>>   /*
>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>> index 4e416f6e44..7f68f3f5b7 100644
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       remove_identity_mapping();
>>   
>> +    smp_clear_cpu_maps();
>> +
>>       set_processor_id(0);
>>   
>>       set_cpuid_to_hartid(0, bootcpu_id);
>> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
>> new file mode 100644
>> index 0000000000..0f4dcc28e1
>> --- /dev/null
>> +++ b/xen/arch/riscv/smpboot.c
>> @@ -0,0 +1,15 @@
>> +#include <xen/cpumask.h>
>> +#include <xen/init.h>
>> +
>> +cpumask_t cpu_online_map;
>> +cpumask_t cpu_present_map;
>> +cpumask_t cpu_possible_map;
> __read_mostly for all of them, perhaps (if CPU hotplug isn't expected to
> be supported) even __ro_after_init for the latter two?

We have been living without CPU hotplug support for a long time in the downstream
branch, but I can't say whether it is expected to be supported in the future or not.
To ensure we can add such an option later without changing the attributes of
cpu_online_map variable, I prefer to use|__read_mostly| here and __ro_after_init for
cpu_possible_map.

>
> As to cpu_possible_map - do you predict that you'll actually use it? Arm
> does (and instead has only a fake cpu_present_map), but on x86 we get away
> without.

I checked how it is used now in downstream latest branch and it isn't really used
only during initialization smp_clear_cpu_maps() and smp_prepare_cpus() so we can
skip it for RISC-V too.

>
>> +void __init smp_clear_cpu_maps(void)
>> +{
>> +    cpumask_clear(&cpu_possible_map);
>> +    cpumask_clear(&cpu_online_map);
> What's the point of these? All three maps start out fully zeroed.

It could be really dropped. I saw your patch for Arm, I'll align the current
patch with that changes.


>
>> +    cpumask_set_cpu(0, &cpu_possible_map);
>> +    cpumask_set_cpu(0, &cpu_online_map);
> These are contradicting the name of the function. The somewhat equivalent
> function we have on x86 is smp_prepare_boot_cpu().
>
>> +    cpumask_copy(&cpu_present_map, &cpu_possible_map);
> Another cpumask_set_cpu() is probably cheaper here then.

What do you mean by cheaper here?

~ Oleksii

--------------RzsczeltER0pW6JLHs0ZZMOZ
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
    <div class="moz-cite-prefix">On 4/10/25 3:10 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:18277077-2cf0-466f-8bde-f7955806bcb2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Initialize cpu_{possible, online, present}_map by using smp_clear_cpu_maps().

Drop DEFINE_PER_CPU(unsigned int, cpu_id) from stubs.c as this variable isn't
expected to be used in RISC-V at all.

Move declaration of cpu_{possible,online,present}_map from stubs.c to smpboot.c
as now smpboot.c is now introduced.
Other defintions keep in stubs.c as they are not initialized and not needed, at
the moment.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 xen/arch/riscv/Makefile          |  1 +
 xen/arch/riscv/include/asm/smp.h |  2 ++
 xen/arch/riscv/setup.c           |  2 ++
 xen/arch/riscv/smpboot.c         | 15 +++++++++++++++
 xen/arch/riscv/stubs.c           |  6 ------
 5 files changed, 20 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/riscv/smpboot.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 0c6c4a38a3..f551bf32a2 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -10,6 +10,7 @@ obj-y += sbi.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
+obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
index 5e170b57b3..188c033718 100644
--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -26,6 +26,8 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
 
 void setup_tp(unsigned int cpuid);
 
+void smp_clear_cpu_maps(void);
+
 #endif
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 4e416f6e44..7f68f3f5b7 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     remove_identity_mapping();
 
+    smp_clear_cpu_maps();
+
     set_processor_id(0);
 
     set_cpuid_to_hartid(0, bootcpu_id);
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
new file mode 100644
index 0000000000..0f4dcc28e1
--- /dev/null
+++ b/xen/arch/riscv/smpboot.c
@@ -0,0 +1,15 @@
+#include &lt;xen/cpumask.h&gt;
+#include &lt;xen/init.h&gt;
+
+cpumask_t cpu_online_map;
+cpumask_t cpu_present_map;
+cpumask_t cpu_possible_map;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
__read_mostly for all of them, perhaps (if CPU hotplug isn't expected to
be supported) even __ro_after_init for the latter two?</pre>
    </blockquote>
    <pre>We have been living without CPU hotplug support for a long time in the downstream
branch, but I can't say whether it is expected to be supported in the future or not.
To ensure we can add such an option later without changing the attributes of
cpu_online_map variable, I prefer to use <code data-start="311"
    data-end="326">__read_mostly</code> here and __ro_after_init for
cpu_possible_map.

</pre>
    <blockquote type="cite"
      cite="mid:18277077-2cf0-466f-8bde-f7955806bcb2@suse.com">
      <pre wrap="" class="moz-quote-pre">

As to cpu_possible_map - do you predict that you'll actually use it? Arm
does (and instead has only a fake cpu_present_map), but on x86 we get away
without.</pre>
    </blockquote>
    <pre>I checked how it is used now in downstream latest branch and it isn't really used
only during initialization smp_clear_cpu_maps() and smp_prepare_cpus() so we can
skip it for RISC-V too.</pre>
    <blockquote type="cite"
      cite="mid:18277077-2cf0-466f-8bde-f7955806bcb2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+void __init smp_clear_cpu_maps(void)
+{
+    cpumask_clear(&amp;cpu_possible_map);
+    cpumask_clear(&amp;cpu_online_map);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
What's the point of these? All three maps start out fully zeroed.</pre>
    </blockquote>
    <pre>It could be really dropped. I saw your patch for Arm, I'll align the current
patch with that changes.
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:18277077-2cf0-466f-8bde-f7955806bcb2@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    cpumask_set_cpu(0, &amp;cpu_possible_map);
+    cpumask_set_cpu(0, &amp;cpu_online_map);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
These are contradicting the name of the function. The somewhat equivalent
function we have on x86 is smp_prepare_boot_cpu().

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    cpumask_copy(&amp;cpu_present_map, &amp;cpu_possible_map);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Another cpumask_set_cpu() is probably cheaper here then.</pre>
    </blockquote>
    <pre>What do you mean by cheaper here?
</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------RzsczeltER0pW6JLHs0ZZMOZ--

