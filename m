Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F6AF7F66
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032396.1406071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXO2t-0006mQ-My; Thu, 03 Jul 2025 17:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032396.1406071; Thu, 03 Jul 2025 17:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXO2t-0006jL-JO; Thu, 03 Jul 2025 17:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1032396;
 Thu, 03 Jul 2025 17:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJsU=ZQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXO2s-0006jF-Nr
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:48:26 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb1b9e11-5835-11f0-a315-13f23c93f187;
 Thu, 03 Jul 2025 19:48:25 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so495425e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:48:25 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d099esm358916f8f.21.2025.07.03.10.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 10:48:23 -0700 (PDT)
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
X-Inumbo-ID: eb1b9e11-5835-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751564904; x=1752169704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SLgsKUNNCgkFWnFEMiUM2w5Qq8qAKy856KV7Ql1P6xI=;
        b=Nut7WMtqRprnp+5Bsf+5K+p46+DrjumWx/fg5VP/FLH2yytxaX/0GPB6bJ+1mRxOFN
         hXLZePkhJSa+dlIEGYEWRSyzmjtW91G8Kl8r4jM5vW8XuU9hTdUdCBB5AduMXsLow6sO
         tS75+112iwOqnK/n8ijm2jJUupYh5vBAtSIOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564904; x=1752169704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLgsKUNNCgkFWnFEMiUM2w5Qq8qAKy856KV7Ql1P6xI=;
        b=FXhzD7Osn9vbCoEi5hO7rwOJcnpryeoQaEP9IJEPL8GLMvQx6xk6yGtL4vQ/7i5/Yx
         KM3OKszfvzc/L1d7xz/3zumtu04uhXVwGms1WHGEsFrLyYYfEbCCI+4uE3XdXJU7+yxi
         NJ2GFCokLadOfrr2jSA6rPaWo6gNbx0qKJs/+TKX65aIZ99Gpuh+aHIUgz+Gf7rcQaiO
         7Jsog4S87XJTonvVcgPtvGC37lUqStCR3+gawX3AmfJwBtMslaYF92eef6zu59vcYL7L
         ZqL0/e+Y5Wv3uV2Vu6J5B7BWXx5Aj3tG6mq8/v99K+X8QUPIVf987sja3cliu2bLqU3X
         Dakw==
X-Gm-Message-State: AOJu0Yyq+JN//0I3vaW3HjtoNTmibflf9tlC6lPBb8iQ2Izo4E7+XnlO
	EDPTqPSJk8YxkXUqc1siAz9cMrNkRh2S72fYlFz8MSXrt3rPtpa5LBz5Jl/axRXoauM=
X-Gm-Gg: ASbGncs23d6l1IKouchRJZt1aDtM2BARSJufrPz7ewyYUOZ9OUEmgerSEvkTS9j09a0
	IDOO2lSUcSC8zWM/rtwB4jETw9ZzX2s9AOXd9+Wbn9Eu+mmlJnfQ9p3paXYRnmYvLoJ1nP+S31P
	CAyG2wKMq6o8IbofdrKSFQwKJzt5BSh0+fsbVsDSBsGiJjdG+rUPragzSLYWM48vNC7OKV56I4B
	PA3pBA3am1rIk4g9gD4i0qU2rfTqiQTpd/BCgMkS4MPF2QWi0k+yoOUymzZQ/EPFPuU2dBAddPg
	+bxQ1IbrGTfbN2v4vGHMjCvcyh4Z9YhO3OL2/PCJHDVHSNw0PzcF3V6SeLctKeE5qGVSecrXqgG
	MApW6Tb9x4qnfCx63wUD5ZNe3it2SXnqBTtgWfQ==
X-Google-Smtp-Source: AGHT+IGnOjbHSyTrIJgfg1U46XGh5ANHxYtRibrDxpvVByE79vCgUyhr/K18kRZNE22vi0LDE1nkUw==
X-Received: by 2002:a05:6000:4409:b0:3a4:e8c4:7a78 with SMTP id ffacd0b85a97d-3b200b48406mr4690967f8f.52.1751564904244;
        Thu, 03 Jul 2025 10:48:24 -0700 (PDT)
Message-ID: <7d51879c-87c8-4e36-a7d7-66ba02ef2886@citrix.com>
Date: Thu, 3 Jul 2025 18:48:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
 <aGaxeQanRmfJg8nF@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aGaxeQanRmfJg8nF@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 5:36 pm, Roger Pau Monné wrote:
> On Wed, Jul 02, 2025 at 03:41:19PM +0100, Andrew Cooper wrote:
>> In order elide IPIs, we must be able to identify whether a target CPU is in
>> MWAIT at the point it is woken up.  i.e. the store to wake it up must also
>> identify the state.
>>
>> Create a new in_mwait variable beside __softirq_pending, so we can use a
>> CMPXCHG to set the softirq while also observing the status safely.  Implement
>> an x86 version of arch_pend_softirq() which does this.
>>
>> In mwait_idle_with_hints(), advertise in_mwait, with an explanation of
>> precisely what it means.  X86_BUG_MONITOR can be accounted for simply by not
>> advertising in_mwait.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>
>> This is modelled after Linux's TIF_NEED_RESCHED (single bit equivelent of all
>> of __softirq_pending), and TIF_POLLING_NRFLAG (arch-neutral "in_mwait").
>>
>> In Linux, they're both in the same flags field, which adds complexity.  In
>> Xen, __softirq_pending is already unsigned long for everything other than x86,
>> so adding an arch-neutral "in_mwait" would need wider changes.
>> ---
>>  xen/arch/x86/acpi/cpu_idle.c       | 20 +++++++++++++++++-
>>  xen/arch/x86/include/asm/hardirq.h | 14 +++++++++++-
>>  xen/arch/x86/include/asm/softirq.h | 34 ++++++++++++++++++++++++++++++
>>  3 files changed, 66 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
>> index caa0fef0b3b1..13040ef467a0 100644
>> --- a/xen/arch/x86/acpi/cpu_idle.c
>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>> @@ -439,7 +439,21 @@ __initcall(cpu_idle_key_init);
>>  void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>  {
>>      unsigned int cpu = smp_processor_id();
>> -    const unsigned int *this_softirq_pending = &softirq_pending(cpu);
>> +    irq_cpustat_t *stat = &irq_stat[cpu];
>> +    const unsigned int *this_softirq_pending = &stat->__softirq_pending;
>> +
>> +    /*
>> +     * By setting in_mwait, we promise to other CPUs that we'll notice changes
>> +     * to __softirq_pending without being sent an IPI.  We achieve this by
>> +     * either not going to sleep, or by having hardware notice on our behalf.
>> +     *
>> +     * Some errata exist where MONITOR doesn't work properly, and the
>> +     * workaround is to force the use of an IPI.  Cause this to happen by
>> +     * simply not advertising outselves as being in_mwait.
>> +     */
>> +    alternative_io("movb $1, %[in_mwait]",
>> +                   "", X86_BUG_MONITOR,
>> +                   [in_mwait] "=m" (stat->in_mwait));
>>  
>>      monitor(this_softirq_pending, 0, 0);
>>      smp_mb();
>> @@ -452,6 +466,10 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>          mwait(eax, ecx);
>>          spec_ctrl_exit_idle(info);
>>      }
>> +
>> +    alternative_io("movb $0, %[in_mwait]",
>> +                   "", X86_BUG_MONITOR,
>> +                   [in_mwait] "=m" (stat->in_mwait));
> Isn't it a bit overkill to use alternatives here when you could have a
> conditional based on a global variable to decide whether to set/clear
> in_mwait?

I view it differently.  Why should the common case suffer overhead
(extra memory read and conditional branch) to work around 3 buggy pieces
of hardware in a common path?
>>  }
>>  
>>  static void acpi_processor_ffh_cstate_enter(struct acpi_processor_cx *cx)
>> diff --git a/xen/arch/x86/include/asm/hardirq.h b/xen/arch/x86/include/asm/hardirq.h
>> index f3e93cc9b507..1647cff04dc8 100644
>> --- a/xen/arch/x86/include/asm/hardirq.h
>> +++ b/xen/arch/x86/include/asm/hardirq.h
>> @@ -5,7 +5,19 @@
>>  #include <xen/types.h>
>>  
>>  typedef struct {
>> -    unsigned int __softirq_pending;
>> +    /*
>> +     * The layout is important.  Any CPU can set bits in __softirq_pending,
>> +     * but in_mwait is a status bit owned by the CPU.  softirq_mwait_raw must
>> +     * cover both, and must be in a single cacheline.
>> +     */
>> +    union {
>> +        struct {
>> +            unsigned int __softirq_pending;
>> +            bool in_mwait;
> Given the usage in assembly where you store 0 and 1, this might better
> be a uint8_t then?

We have loads of asm code which accesses bool's like this.  C guarantees
that sizeof(bool) >= sizeof(char).

>
>> +        };
>> +        uint64_t softirq_mwait_raw;
>> +    };
> This could be a named union type ...
>
>> +
>>      unsigned int __local_irq_count;
>>      unsigned int nmi_count;
>>      unsigned int mce_count;
>> diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
>> index e4b194f069fb..069e5716a68d 100644
>> --- a/xen/arch/x86/include/asm/softirq.h
>> +++ b/xen/arch/x86/include/asm/softirq.h
>> @@ -1,6 +1,8 @@
>>  #ifndef __ASM_SOFTIRQ_H__
>>  #define __ASM_SOFTIRQ_H__
>>  
>> +#include <asm/system.h>
>> +
>>  #define NMI_SOFTIRQ            (NR_COMMON_SOFTIRQS + 0)
>>  #define TIME_CALIBRATE_SOFTIRQ (NR_COMMON_SOFTIRQS + 1)
>>  #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
>> @@ -9,4 +11,36 @@
>>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>>  #define NR_ARCH_SOFTIRQS       5
>>  
>> +/*
>> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
>> + * skipped, false if the IPI cannot be skipped.
>> + *
>> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
>> + * set softirq @nr while also observing in_mwait in a race-free way.
>> + */
>> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
>> +{
>> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
>> +    uint64_t old, new;
> ... so that you also use it here?

No, it cant.  The of softirq_pending() in common code requires no
intermediate field names, and I'm not untangling that mess in a series
wanting backporting.

~Andrew

