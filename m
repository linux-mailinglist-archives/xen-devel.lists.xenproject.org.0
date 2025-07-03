Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC32AF7E00
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 18:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032304.1405970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMv0-0001SO-Jo; Thu, 03 Jul 2025 16:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032304.1405970; Thu, 03 Jul 2025 16:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMv0-0001Qt-H2; Thu, 03 Jul 2025 16:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1032304;
 Thu, 03 Jul 2025 16:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MTI=ZQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXMuy-0001Qn-Na
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 16:36:12 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d44c1948-582b-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 18:36:12 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so93800f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 09:36:11 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b472767a20sm193037f8f.86.2025.07.03.09.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 09:36:10 -0700 (PDT)
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
X-Inumbo-ID: d44c1948-582b-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751560571; x=1752165371; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=syBfYh2lHE0XBNDnzf2PM6vtU8+RoGG1/Nodlgv8YLM=;
        b=Jn2c+SfQEcZw4BojkggT0NPA8u7WzCHnCl5bmyxfRXl13kI1319vD9zGzSYZGrdM2n
         71Jf0gsb5BJHNYSwI6gMfy6GZ2y/J6em+nGdFrxHB46Hwg0/62wB2fwkRak4eEQ5P/J6
         qFy+Abs599k25WW9HGMBmM/KCBIfI3TrhGmKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560571; x=1752165371;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syBfYh2lHE0XBNDnzf2PM6vtU8+RoGG1/Nodlgv8YLM=;
        b=NYa37uoA9Id7JdXB19/corbDDizZFkboCr2ThOpkhfcKHg/jnSANMRX/sTtWsyfCyR
         RZhINZxQBGaX35FIVuCzUJKeTGHpnnruEXdts49Ag3nT2Vub10MFIlt1nsNXtyurTSXh
         xzrx9gBEJ7KvYnIiMfQH+tJFHczMv72iY/3YAoUq+R0Z6YIEU39xW38AKQrjCEyXQOZQ
         QlmG+mdXoydRsf3sdsl7FAV6zXBix5+pizxQJVqKsUulXP5yjUMkn4yII55VESgbWzHJ
         +UXROQ+xGznNd1GoHEHqRwGYxgb0zLQCuOmm2oPJdZXrFMFh2E8q2/EXK8ujH8A843lH
         MC/Q==
X-Gm-Message-State: AOJu0YwkvnJb2ADysqa59z9fDIqB7nVgE3L2doMwqgUtJDxs3SAFC9jG
	5tSgRK7G9f2zCftL8X+La9mLDzKc5SLvfxJUst+SZtdauyrAXDpfC+C2Swum0zWfmyw=
X-Gm-Gg: ASbGncs1D9ayXGnWpU7hYIGugHdXG3o9CNw17cN/UY6nwdxEspb98CMNcYtlzJpNO9s
	AK5xz8YW0Nn3hcyO2zg/4WS5OKHbdg2UK6kLdT5bCbLfxQiD0+z01xOdHl4h9lvQfz+avy4HStY
	t2lgPS/5trrTkaRYLFSW5gbRAJXyuLX+MQP5esQXR7ot8EG50491vXRNoYuImwEh3Gpqgk2Fe2V
	safLSuvHgHuHQ7aYPFFbihG+011OKNvcLKq70jhHjLno1gjvIUu2XTYOvZh3nK5z3IRA8+Lr5XL
	homxfqXGIXn0Ug3de58cbaklW7utT7dvz1WoHDfQfaXJ83Xu1uU7Ua9JEzE1uNeQHTXWOPcQLdL
	IfVlyRVI2NdSBnawP2qTaDFUdy56qLQ==
X-Google-Smtp-Source: AGHT+IGdncJcCBpa8p8ODynwb1bFw7txaEqjmI+zxf9p09VRmZCBv7pU+vM0wkQKNvSei3Z9ECbuKA==
X-Received: by 2002:adf:e19a:0:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3b3435a0524mr3051215f8f.14.1751560571040;
        Thu, 03 Jul 2025 09:36:11 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:36:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
Message-ID: <aGaxeQanRmfJg8nF@macbook.local>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702144121.1096448-5-andrew.cooper3@citrix.com>

On Wed, Jul 02, 2025 at 03:41:19PM +0100, Andrew Cooper wrote:
> In order elide IPIs, we must be able to identify whether a target CPU is in
> MWAIT at the point it is woken up.  i.e. the store to wake it up must also
> identify the state.
> 
> Create a new in_mwait variable beside __softirq_pending, so we can use a
> CMPXCHG to set the softirq while also observing the status safely.  Implement
> an x86 version of arch_pend_softirq() which does this.
> 
> In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
> precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
> advertising in_mwait.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> This is modelled after Linux's TIF_NEED_RESCHED (single bit equivelent of all
> of __softirq_pending), and TIF_POLLING_NRFLAG (arch-neutral "in_mwait").
> 
> In Linux, they're both in the same flags field, which adds complexity.  In
> Xen, __softirq_pending is already unsigned long for everything other than x86,
> so adding an arch-neutral "in_mwait" would need wider changes.
> ---
>  xen/arch/x86/acpi/cpu_idle.c       | 20 +++++++++++++++++-
>  xen/arch/x86/include/asm/hardirq.h | 14 +++++++++++-
>  xen/arch/x86/include/asm/softirq.h | 34 ++++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index caa0fef0b3b1..13040ef467a0 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -439,7 +439,21 @@ __initcall(cpu_idle_key_init);
>  void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>  {
>      unsigned int cpu = smp_processor_id();
> -    const unsigned int *this_softirq_pending = &softirq_pending(cpu);
> +    irq_cpustat_t *stat = &irq_stat[cpu];
> +    const unsigned int *this_softirq_pending = &stat->__softirq_pending;
> +
> +    /*
> +     * By setting in_mwait, we promise to other CPUs that we'll notice changes
> +     * to __softirq_pending without being sent an IPI.  We achieve this by
> +     * either not going to sleep, or by having hardware notice on our behalf.
> +     *
> +     * Some errata exist where MONITOR doesn't work properly, and the
> +     * workaround is to force the use of an IPI.  Cause this to happen by
> +     * simply not advertising outselves as being in_mwait.
> +     */
> +    alternative_io("movb $1, %[in_mwait]",
> +                   "", X86_BUG_MONITOR,
> +                   [in_mwait] "=m" (stat->in_mwait));
>  
>      monitor(this_softirq_pending, 0, 0);
>      smp_mb();
> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>          mwait(eax, ecx);
>          spec_ctrl_exit_idle(info);
>      }
> +
> +    alternative_io("movb $0, %[in_mwait]",
> +                   "", X86_BUG_MONITOR,
> +                   [in_mwait] "=m" (stat->in_mwait));

Isn't it a bit overkill to use alternatives here when you could have a
conditional based on a global variable to decide whether to set/clear
in_mwait?

>  }
>  
>  static void acpi_processor_ffh_cstate_enter(struct acpi_processor_cx *cx)
> diff --git a/xen/arch/x86/include/asm/hardirq.h b/xen/arch/x86/include/asm/hardirq.h
> index f3e93cc9b507..1647cff04dc8 100644
> --- a/xen/arch/x86/include/asm/hardirq.h
> +++ b/xen/arch/x86/include/asm/hardirq.h
> @@ -5,7 +5,19 @@
>  #include <xen/types.h>
>  
>  typedef struct {
> -    unsigned int __softirq_pending;
> +    /*
> +     * The layout is important.  Any CPU can set bits in __softirq_pending,
> +     * but in_mwait is a status bit owned by the CPU.  softirq_mwait_raw must
> +     * cover both, and must be in a single cacheline.
> +     */
> +    union {
> +        struct {
> +            unsigned int __softirq_pending;
> +            bool in_mwait;

Given the usage in assembly where you store 0 and 1, this might better
be a uint8_t then?

> +        };
> +        uint64_t softirq_mwait_raw;
> +    };

This could be a named union type ...

> +
>      unsigned int __local_irq_count;
>      unsigned int nmi_count;
>      unsigned int mce_count;
> diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
> index e4b194f069fb..069e5716a68d 100644
> --- a/xen/arch/x86/include/asm/softirq.h
> +++ b/xen/arch/x86/include/asm/softirq.h
> @@ -1,6 +1,8 @@
>  #ifndef __ASM_SOFTIRQ_H__
>  #define __ASM_SOFTIRQ_H__
>  
> +#include <asm/system.h>
> +
>  #define NMI_SOFTIRQ            (NR_COMMON_SOFTIRQS + 0)
>  #define TIME_CALIBRATE_SOFTIRQ (NR_COMMON_SOFTIRQS + 1)
>  #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
> @@ -9,4 +11,36 @@
>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>  #define NR_ARCH_SOFTIRQS       5
>  
> +/*
> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
> + * skipped, false if the IPI cannot be skipped.
> + *
> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
> + * set softirq @nr while also observing in_mwait in a race-free way.
> + */
> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
> +{
> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
> +    uint64_t old, new;

... so that you also use it here?  And the return check below could become
new.in_mwait instead of having to use a bitmask?

Thanks, Roger.

