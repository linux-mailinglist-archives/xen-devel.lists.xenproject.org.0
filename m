Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC3EA81053
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942453.1341605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2B4F-0007pX-Cn; Tue, 08 Apr 2025 15:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942453.1341605; Tue, 08 Apr 2025 15:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2B4F-0007mE-9e; Tue, 08 Apr 2025 15:40:51 +0000
Received: by outflank-mailman (input) for mailman id 942453;
 Tue, 08 Apr 2025 15:40:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2B4D-0007m3-RP
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:40:49 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d58ecbb6-148f-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:40:44 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so3159833f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:40:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b72d5sm15064301f8f.47.2025.04.08.08.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 08:40:43 -0700 (PDT)
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
X-Inumbo-ID: d58ecbb6-148f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744126844; x=1744731644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lktp0SVhv6T4bZkfaCjU+MiKyH31xZ7UmCeKpYNo/84=;
        b=Oglkjw1Y3Fmwpyz4SjX/PH0+JN9eWlZdfle7He4lg5sYTvHWQBD/c7nrH1Ld+bI2a/
         nl++riOGdyNjeoqdZ6tCp6UnRTehrn/2DYTiysmcmf1zR4eJ0Ro/Sa8N6csQU/hAEWv3
         IdVwSUtestAFIwqvYsomfCvK2qJX7ZerjivWVNWiFmnXZimbYfkjj0MLZ0p+pq0A8EWj
         1x/yM5XO2nIjCsJmbfjsou5myFJJ2Nfj+k/i8Gij0j7LNl7z7vTFaxYyHNdxz7zZ/szb
         NydrvV4mmGLNw6JZ1j+4WZRuxeUeJGP4ex/72NNc9OwRMTaztDSDLVcs3nwOsln2JG6l
         6b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126844; x=1744731644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lktp0SVhv6T4bZkfaCjU+MiKyH31xZ7UmCeKpYNo/84=;
        b=kFey8UKdHyW7A+BKoNQMj/XAicWbbshgcRUI2BsfNHsBdyAzELm0aU+tKfOWmk3Hzo
         s0g/uQSXfwlOEP3WlvrArY5rajY8acroT1+7/4u5VONCKf4YkvVT5hwzyBFYQCiybfEo
         y20PuzAGx4GcYjUdkCWOkGRvTMSbE76wC5TKpeMhUmBwXFBZ1fDCSOTgmK+FFh+Klge2
         +N1LeOV1xjS7yXNuTSvR+L86uxoU7huhrBMqGUdyhWG4OwPrMwfJ3qcDxbZeEDD79ay8
         BfaBo4DXOfpc5XpyYzgZyMN4LouwhFZfozK1993aR0kH38dpEEHxahOeM7jOmIzXX2Er
         DALQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgFyH40t+gCDAXF5qgC2imwtkt4Q1ATBY38YansI/wMp5VLBwwlrbeRMRVCNsGvpqKjqwLAUcRftM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2F1bATG9iwse9AqOuNaiKR+3N2bDupkDzMOsesV+fOHdjBOVi
	hgi75O0Q5X1hRszgVTBNCvqalM5x+4fOPcPKTm5VnZMwwgyvwXWjJ4aPrzuwQw==
X-Gm-Gg: ASbGncusQS9HCxq+ihhLU8iPQuLqu+xBwhoM3EEnzsmO2TEh5omvd0rxwqEiiO58+9g
	XJr1P+yQ+mbtqcHnI9+QatCu4jBLMHHurPP34tUFmB4vt3bpK0f2i4l+EbQaoWrR4pbmXEQkRa3
	x6ArzMqcxFW5KGGPuorvmmpUkMHV0VVWLpjkKKYIhAa5D7xYREMhhcE7RxljIfJglnrM2cijTZ6
	Jl+gUpYaUo4FJwdRGauH9aKgLTEFkKqZ4vMVvEK7+hllXFJODnRaj+1ifxO8D4Tu92/IXOH17/O
	87RuCvt5LRIq8BpvJIrINS2OLhwWhOgPyCW0T0r37SJT7Y7h6Y6fnmC7MTLoP8fxyldoVGOaXZa
	YxG53msi/PYtNzrfNQAK9RZP9GIICSw==
X-Google-Smtp-Source: AGHT+IF39j5Q4NtjQ8M47ptLlKOyOsP4Vq2B054nqi5SiZF2GeVyma2DUp6GrV09iOizMaVj2SzdYg==
X-Received: by 2002:a05:6000:2509:b0:39c:30d8:3290 with SMTP id ffacd0b85a97d-39cb35b196bmr12784115f8f.7.1744126843910;
        Tue, 08 Apr 2025 08:40:43 -0700 (PDT)
Message-ID: <550f2eab-cf33-4e80-8991-b913afa81e69@suse.com>
Date: Tue, 8 Apr 2025 17:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] xen: add libafl-qemu fuzzer support
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250315003544.1101488-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2025 01:36, Volodymyr Babchuk wrote:
> LibAFL, which is a part of AFL++ project is a instrument that allows
> us to perform fuzzing on beremetal code (Xen hypervisor in this case)
> using QEMU as an emulator. It employs QEMU's ability to create
> snapshots to run many tests relatively quickly: system state is saved
> right before executing a new test and restored after the test is
> finished.
> 
> This patch adds all necessary plumbing to run aarch64 build of Xen
> inside that LibAFL-QEMU fuzzer. From the Xen perspective we need to
> do following things:
> 
> 1. Able to communicate with LibAFL-QEMU fuzzer. This is done by
> executing special opcodes, that only LibAFL-QEMU can handle.
> 
> 2. Use interface from p.1 to tell the fuzzer about code Xen section,
> so fuzzer know which part of code to track and gather coverage data.
> 
> 3. Report fuzzer about crash. This is done in panic() function.
> 
> 4. Prevent test harness from shooting itself in knee.
> 
> Right now test harness is an external component, because we want to
> test external Xen interfaces, but it is possible to fuzz internal code
> if we want to.
> 
> Test harness is implemented XTF-based test-case(s). As test harness
> can issue hypercall that shuts itself down, KConfig option
> CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING was added. It basically tells
> fuzzer that test was completed successfully if Dom0 tries to shut
> itself (or the whole machine) down.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> I tried to fuzz the vGIC emulator and hypercall interface. While vGIC
> fuzzing didn't yield any interesting results, hypercall fuzzing found a
> way to crash the hypervisor from Dom0 on aarch64, using
> "XEN_SYSCTL_page_offline_op" with "sysctl_query_page_offline" sub-op,
> because it leads to page_is_ram_type() call which is marked
> UNREACHABLE on ARM.
> 
> In v2:
> 
>  - Moved to XTF-based test harness
>  - Severely reworked the fuzzer itself. Now it has user-friendly
>    command-line interface and is capable of running in CI, as it now
>    returns an appropriate error code if any faults were found
>  - Also I found, debugged and fixed a nasty bug in LibAFL-QEMU fork,
>    which crashed the whole fuzzer.
> 
> Right now the fuzzer is lockated at Xen Troops repo:
> 
> https://github.com/xen-troops/xen-fuzzer-rs
> 
> But I believe that it is ready to be included into
> gitlab.com/xen-project/
> 
> XTF-based harness is at
> 
> https://gitlab.com/vlad.babchuk/xtf/-/tree/mr_libafl
> 
> and there is corresponding MR for including it into
> 
> https://gitlab.com/xen-project/fusa/xtf/-/tree/xtf-arm
> 
> So, to sum up. All components are basically ready for initial
> inclusion. There will be smaller, integration-related changes
> later. For example - we will need to update URLs for various
> components after they are moved to correct places.
> ---
>  docs/hypervisor-guide/fuzzing.rst           |  90 ++++++++++++
>  xen/arch/arm/Kconfig.debug                  |  26 ++++
>  xen/arch/arm/Makefile                       |   1 +
>  xen/arch/arm/include/asm/libafl_qemu.h      |  54 +++++++
>  xen/arch/arm/include/asm/libafl_qemu_defs.h |  37 +++++
>  xen/arch/arm/libafl_qemu.c                  | 152 ++++++++++++++++++++
>  xen/arch/arm/psci.c                         |  13 ++
>  xen/common/sched/core.c                     |  17 +++
>  xen/common/shutdown.c                       |   7 +
>  xen/drivers/char/console.c                  |   8 ++
>  10 files changed, 405 insertions(+)
>  create mode 100644 docs/hypervisor-guide/fuzzing.rst
>  create mode 100644 xen/arch/arm/include/asm/libafl_qemu.h
>  create mode 100644 xen/arch/arm/include/asm/libafl_qemu_defs.h
>  create mode 100644 xen/arch/arm/libafl_qemu.c

This looks to be about Arm only, which would be nice if that was visible
right from the subject.

Also, nit: New files' names are to use dashes in favor of underscores.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -47,6 +47,10 @@
>  #define pv_shim false
>  #endif
>  
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
> +
>  /* opt_sched: scheduler - default to configured value */
>  static char __initdata opt_sched[10] = CONFIG_SCHED_DEFAULT;
>  string_param("sched", opt_sched);
> @@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sched_poll)
>      if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
>          return -EFAULT;
>  
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
> +
>      set_bit(_VPF_blocked, &v->pause_flags);
>      v->poll_evtchn = -1;
>      set_bit(v->vcpu_id, d->poll_mask);
> @@ -1904,12 +1912,18 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>      case SCHEDOP_yield:
>      {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>          ret = vcpu_yield();
>          break;
>      }
>  
>      case SCHEDOP_block:
>      {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>          vcpu_block_enable_events();
>          break;
>      }
> @@ -1924,6 +1938,9 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>          TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
>                     current->vcpu_id, sched_shutdown.reason);
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +        libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>          ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
>  
>          break;

If I was a scheduler maintainer, I'd likely object to this kind of #ifdef-ary.

> --- a/xen/common/shutdown.c
> +++ b/xen/common/shutdown.c
> @@ -11,6 +11,10 @@
>  #include <xen/kexec.h>
>  #include <public/sched.h>
>  
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
> +
>  /* opt_noreboot: If true, machine will need manual reset on error. */
>  bool __ro_after_init opt_noreboot;
>  boolean_param("noreboot", opt_noreboot);
> @@ -32,6 +36,9 @@ static void noreturn reboot_or_halt(void)
>  
>  void hwdom_shutdown(unsigned char reason)
>  {
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
> +#endif
>      switch ( reason )
>      {
>      case SHUTDOWN_poweroff:

It's not as bad here and ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -40,6 +40,9 @@
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>  #include <asm/vpl011.h>
>  #endif
> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +#include <asm/libafl_qemu.h>
> +#endif
>  
>  /* console: comma-separated list of console outputs. */
>  static char __initdata opt_console[30] = OPT_CONSOLE_STR;
> @@ -1289,6 +1292,11 @@ void panic(const char *fmt, ...)
>  
>      kexec_crash(CRASHREASON_PANIC);
>  
> +    #ifdef CONFIG_LIBAFL_QEMU_FUZZER
> +    /* Tell the fuzzer that we crashed */
> +    libafl_qemu_end(LIBAFL_QEMU_END_CRASH);
> +    #endif

... here, but still.

Also, pre-processor directives want their # to live at the beginning of the
line.

Jan

