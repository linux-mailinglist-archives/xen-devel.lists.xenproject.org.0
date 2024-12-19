Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356A9F78A6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860997.1272993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOD0N-0005iz-3y; Thu, 19 Dec 2024 09:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860997.1272993; Thu, 19 Dec 2024 09:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOD0N-0005hW-1L; Thu, 19 Dec 2024 09:39:39 +0000
Received: by outflank-mailman (input) for mailman id 860997;
 Thu, 19 Dec 2024 09:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fj/B=TM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tOD0L-0005hQ-N8
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:39:37 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290bcac8-bded-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 10:39:36 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30167f4c1deso6030051fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 01:39:36 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b069de9sm1529201fa.78.2024.12.19.01.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 01:39:35 -0800 (PST)
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
X-Inumbo-ID: 290bcac8-bded-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734601176; x=1735205976; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ew31f6DRFQAGT7nqGDKV8ogEvncpT8YkZ4hjyU/ItI=;
        b=SO+I13jKM9XGfjml0C6brXHsmBWeJjFIVBszCqpa289639kPb5/ZjNe1NZdjqmHFUq
         gRgkEn0+S1mGWjnmJ3BQzjQnJLH4P3/ni+0zfjIWyMX8eS+8AnqkiYxS/fxoazpLP3aw
         8sUPJ8SY7L7E74TD+bKdTcC6EhMc/HfifvE8BV3f4goUyPF1zhvou8E/uDgPewRrNoa5
         wJvfhStCH/RIyLZxi4b9uzQeQH41DsTBXpVfcBz4GvMNaAxV0XPtPts62m2kRmCbNnC5
         bLDzAI/2Yk0atj3XpU5JY5uQs/57Vj0CXVInQuTMLc9XDLxWYoLW3nvwUF16CHf0e/f9
         RtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734601176; x=1735205976;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ew31f6DRFQAGT7nqGDKV8ogEvncpT8YkZ4hjyU/ItI=;
        b=Y6mnT/YJQF5N32sh82V9NneAt5AgjKk8byMGAxORyEwWL0TsRe3IeBC0SEpdJoVnRB
         /VonOcjE/+80YCN4h/rGx8qcUGP7d9WXLEo+S6EW5z8G3w4kZG47CkPuHR0yS90QqkmJ
         VlFWN5l5I3O3ZFvOohcRQVw8NUZbsQevaEmBpwLU9jU2/QSbWBW/6sh4FpoIyERs03NO
         2IriMzN/o19O8rt6zO4QrV3yRAKKKF0qStLN0o4T7qZPrE0iKwxif6inVxzdbYTcWYqr
         Vw0nhlYDEe4fsmtAe0W+9goL+tI8wYO35YMLQ0LNzXhFpaP4z7J9jQqtHCe6OjAk9yGL
         Nszg==
X-Forwarded-Encrypted: i=1; AJvYcCXl3MtHuS89kvfcJcu2sHNze4qhWpTOQktP6FVpWwjHMCWpsYCUdt6O9oATdjzxNheavmO2pEH1yQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxggdh4QD4c4WYaVzGXnCLIk3koAj6o8ADcStTxMU19AgKXzwcF
	yQJfDZTVdFDi+JgYskViZgR3EoScad9JY8ujMYoJoHX9gkCGOBLd
X-Gm-Gg: ASbGncuqgCwDmH7KgEfClPLQTWNPFdVsVZu7AicTgtLMdjl8PTLgG0HV+9I/zTJWGBM
	25UY3dgR6mmH5WMq33FRTQtl2bZNQV3TC6ZgYlg9A75mBpgbSniLJeOyYSoEqHbqM6plwnVKzPT
	uwdjMaMtegX2K0pG6fOyMce/rCvM0ujfefKV4EoaAYqJmK98nH3lBtCrpBmEUaPhudSi75Cm2JX
	kCYHgkhu5KfbWcWI5+lvvRWqha0blUEGLqTkjY5x4KxAjXGdDFTidvvgRyelE9EyvOMaA==
X-Google-Smtp-Source: AGHT+IGC1AvI8MGG/LvUN9kmmrXkYXxxB5ptwzGXgUtmbYqwNTmuouuyIX4CmCUU02s0voZZn95nKw==
X-Received: by 2002:a05:651c:2110:b0:2fb:4abb:7001 with SMTP id 38308e7fff4ca-3044dab62afmr21401321fa.2.1734601175561;
        Thu, 19 Dec 2024 01:39:35 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------a0f6qF0oJIW6UM81mOaAriQS"
Message-ID: <e1c0351c-a6fe-46af-9a28-8f7eb6804044@gmail.com>
Date: Thu, 19 Dec 2024 10:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: Untangle credit2 vs cpu_nr_siblings()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Juergen Gross <jgross@suse.com>
References: <20241218124900.60886-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20241218124900.60886-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------a0f6qF0oJIW6UM81mOaAriQS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/18/24 1:49 PM, Andrew Cooper wrote:
> Credit2 has no buisness including asm/cpufeature.h or asm/processor.h.
>
> This was caused by a bad original abstraction, and an even less wise attempt
> to fix the build on my behalf.  It is also the sole reason why PPC and RISC-V
> need cpufeature.h header.
>
> Worst of all, cpu_data[cpu].x86_num_siblings doesn't even have the same
> meaning between vendors on x86 CPUS.
>
> Implement cpu_nr_siblings() locally in credit2.c, leaving behind a TODO.  Drop
> the stub from each architecture.
>
> Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
> Fixes: ad33a573c009 ("xen/credit2: Fix build following c/s 8e2aa76dc (take 2)")
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>

Reviewed-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
> CC: Julien Grall<julien@xen.org>
> CC: Volodymyr Babchuk<Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis<bertrand.marquis@arm.com>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio<sanastasio@raptorengineering.com>
> CC: Juergen Gross<jgross@suse.com>
> ---
>   xen/arch/arm/include/asm/cpufeature.h   |  5 -----
>   xen/arch/ppc/include/asm/cpufeature.h   | 10 ----------
>   xen/arch/riscv/include/asm/cpufeature.h | 23 -----------------------
>   xen/arch/x86/include/asm/processor.h    |  5 -----
>   xen/common/sched/credit2.c              | 15 +++++++++++++--
>   5 files changed, 13 insertions(+), 45 deletions(-)
>   delete mode 100644 xen/arch/ppc/include/asm/cpufeature.h
>   delete mode 100644 xen/arch/riscv/include/asm/cpufeature.h
>
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 969e043f5bda..50297e53d90e 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -98,11 +98,6 @@ static inline bool cpus_have_cap(unsigned int num)
>       return test_bit(num, cpu_hwcaps);
>   }
>   
> -static inline int cpu_nr_siblings(unsigned int cpu)
> -{
> -    return 1;
> -}
> -
>   /* System capability check for constant cap */
>   #define cpus_have_const_cap(num) ({                 \
>           register_t __ret;                           \
> diff --git a/xen/arch/ppc/include/asm/cpufeature.h b/xen/arch/ppc/include/asm/cpufeature.h
> deleted file mode 100644
> index 1c5946512bc5..000000000000
> --- a/xen/arch/ppc/include/asm/cpufeature.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef __ASM_PPC_CPUFEATURE_H__
> -#define __ASM_PPC_CPUFEATURE_H__
> -
> -static inline int cpu_nr_siblings(unsigned int cpu)
> -{
> -    return 1;
> -}
> -
> -#endif /* __ASM_PPC_CPUFEATURE_H__ */
> diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
> deleted file mode 100644
> index 41a792b0b273..000000000000
> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef ASM__RISCV__CPUFEATURE_H
> -#define ASM__RISCV__CPUFEATURE_H
> -
> -#ifndef __ASSEMBLY__
> -
> -static inline unsigned int cpu_nr_siblings(unsigned int cpu)
> -{
> -    return 1;
> -}
> -
> -#endif /* __ASSEMBLY__ */
> -
> -#endif /* ASM__RISCV__CPUFEATURE_H */
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
> index 877651212273..d247ef8dd226 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -118,11 +118,6 @@ extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
>   
>   unsigned int apicid_to_socket(unsigned int apicid);
>   
> -static inline int cpu_nr_siblings(unsigned int cpu)
> -{
> -    return cpu_data[cpu].x86_num_siblings;
> -}
> -
>   /* Some CPUID calls want 'count' to be placed in ecx */
>   static inline void cpuid_count(
>       unsigned int op,
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 76a273d4f6d5..4b2ef034ca84 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -26,8 +26,6 @@
>   #include <xen/trace.h>
>   #include <xen/cpu.h>
>   #include <xen/keyhandler.h>
> -#include <asm/cpufeature.h>
> -#include <asm/processor.h>
>   
>   #include "private.h"
>   
> @@ -35,6 +33,19 @@
>   /* #define d2printk printk */
>   #define d2printk(x...)
>   
> +/*
> + * TODO: Abstract this properly, and figure out what Credit2 wants to do with
> + *       the fact that x86_num_siblings doesn't even have the same meaning
> + *       between x86 vendors.
> + */
> +static unsigned int cpu_nr_siblings(unsigned int cpu)
> +{
> +#ifdef CONFIG_X86
> +    return cpu_data[cpu].x86_num_siblings;
> +#else
> +    return 1;
> +#endif
> +}
>   
>   /*
>    * Credit2 tracing events ("only" 512 available!). Check
--------------a0f6qF0oJIW6UM81mOaAriQS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/18/24 1:49 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241218124900.60886-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Credit2 has no buisness including asm/cpufeature.h or asm/processor.h.

This was caused by a bad original abstraction, and an even less wise attempt
to fix the build on my behalf.  It is also the sole reason why PPC and RISC-V
need cpufeature.h header.

Worst of all, cpu_data[cpu].x86_num_siblings doesn't even have the same
meaning between vendors on x86 CPUS.

Implement cpu_nr_siblings() locally in credit2.c, leaving behind a TODO.  Drop
the stub from each architecture.

Fixes: 8e2aa76dc167 ("xen: credit2: limit the max number of CPUs in a runqueue")
Fixes: ad33a573c009 ("xen/credit2: Fix build following c/s 8e2aa76dc (take 2)")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a></pre>
    </blockquote>
    <p>Reviewed-By: <span style="white-space: pre-wrap">Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></span></p>
    <p>Thanks.</p>
    <p>~ Oleksii<br>
    </p>
    <blockquote type="cite"
      cite="mid:20241218124900.60886-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:Volodymyr_Babchuk@epam.com">&lt;Volodymyr_Babchuk@epam.com&gt;</a>
CC: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Shawn Anastasio <a class="moz-txt-link-rfc2396E" href="mailto:sanastasio@raptorengineering.com">&lt;sanastasio@raptorengineering.com&gt;</a>
CC: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
---
 xen/arch/arm/include/asm/cpufeature.h   |  5 -----
 xen/arch/ppc/include/asm/cpufeature.h   | 10 ----------
 xen/arch/riscv/include/asm/cpufeature.h | 23 -----------------------
 xen/arch/x86/include/asm/processor.h    |  5 -----
 xen/common/sched/credit2.c              | 15 +++++++++++++--
 5 files changed, 13 insertions(+), 45 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/cpufeature.h
 delete mode 100644 xen/arch/riscv/include/asm/cpufeature.h

diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 969e043f5bda..50297e53d90e 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -98,11 +98,6 @@ static inline bool cpus_have_cap(unsigned int num)
     return test_bit(num, cpu_hwcaps);
 }
 
-static inline int cpu_nr_siblings(unsigned int cpu)
-{
-    return 1;
-}
-
 /* System capability check for constant cap */
 #define cpus_have_const_cap(num) ({                 \
         register_t __ret;                           \
diff --git a/xen/arch/ppc/include/asm/cpufeature.h b/xen/arch/ppc/include/asm/cpufeature.h
deleted file mode 100644
index 1c5946512bc5..000000000000
--- a/xen/arch/ppc/include/asm/cpufeature.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __ASM_PPC_CPUFEATURE_H__
-#define __ASM_PPC_CPUFEATURE_H__
-
-static inline int cpu_nr_siblings(unsigned int cpu)
-{
-    return 1;
-}
-
-#endif /* __ASM_PPC_CPUFEATURE_H__ */
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
deleted file mode 100644
index 41a792b0b273..000000000000
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef ASM__RISCV__CPUFEATURE_H
-#define ASM__RISCV__CPUFEATURE_H
-
-#ifndef __ASSEMBLY__
-
-static inline unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-    return 1;
-}
-
-#endif /* __ASSEMBLY__ */
-
-#endif /* ASM__RISCV__CPUFEATURE_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 877651212273..d247ef8dd226 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -118,11 +118,6 @@ extern void init_intel_cacheinfo(struct cpuinfo_x86 *c);
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
-static inline int cpu_nr_siblings(unsigned int cpu)
-{
-    return cpu_data[cpu].x86_num_siblings;
-}
-
 /* Some CPUID calls want 'count' to be placed in ecx */
 static inline void cpuid_count(
     unsigned int op,
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 76a273d4f6d5..4b2ef034ca84 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -26,8 +26,6 @@
 #include &lt;xen/trace.h&gt;
 #include &lt;xen/cpu.h&gt;
 #include &lt;xen/keyhandler.h&gt;
-#include &lt;asm/cpufeature.h&gt;
-#include &lt;asm/processor.h&gt;
 
 #include "private.h"
 
@@ -35,6 +33,19 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
+/*
+ * TODO: Abstract this properly, and figure out what Credit2 wants to do with
+ *       the fact that x86_num_siblings doesn't even have the same meaning
+ *       between x86 vendors.
+ */
+static unsigned int cpu_nr_siblings(unsigned int cpu)
+{
+#ifdef CONFIG_X86
+    return cpu_data[cpu].x86_num_siblings;
+#else
+    return 1;
+#endif
+}
 
 /*
  * Credit2 tracing events ("only" 512 available!). Check
</pre>
    </blockquote>
  </body>
</html>

--------------a0f6qF0oJIW6UM81mOaAriQS--

