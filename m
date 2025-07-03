Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E5AF7DA6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 18:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032288.1405960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMgc-00085O-At; Thu, 03 Jul 2025 16:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032288.1405960; Thu, 03 Jul 2025 16:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMgc-00082q-7W; Thu, 03 Jul 2025 16:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1032288;
 Thu, 03 Jul 2025 16:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MTI=ZQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXMgb-00082i-0u
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 16:21:21 +0000
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c05e6676-5829-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 18:21:20 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-748fe69a7baso131997b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 09:21:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74ce359d634sm26855b3a.25.2025.07.03.09.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 09:21:18 -0700 (PDT)
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
X-Inumbo-ID: c05e6676-5829-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751559678; x=1752164478; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RkbZST17UfEt1nGpkqrvef0xSlT1I/jDu4h7E9PNc4w=;
        b=hpk7oUMi9fe+xQb35DlF5wUgz/+ClVsNWFYbPYOuYufB3ORtzcQtSjpDCEVm842/UP
         b4BRUhwInJ3DAN2HwgWBPQ5Lu179z1bKEcbfId4onDoOO1ZoNpaqgp+MO+S+AxaAVAsY
         0LRQSk9SXz5l6MoFrJZO7xXgE6eAXy6L7O3lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751559678; x=1752164478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkbZST17UfEt1nGpkqrvef0xSlT1I/jDu4h7E9PNc4w=;
        b=neDpF5JWaiywp9SlhC7IgdhVlH03PtIlf88E6Lkw/O25VOSDq/EekJgfnXy6jCtlvL
         b52ArVpyUuqJkyBDFSiUTurwXhvoWJx26gA+TAvDN3bCW5TNBEU6E/QECKn0mc/ErwAM
         IkdeJv8kf9ZKUN9PDfIMrTPAnyujfBxWNTnKUDLnGu2HBjSgRn8MQ8zZPz10/Q123xMp
         U/TB+RLPn1AColsRjn9w1LtUsorg2FD8bthlEy9lhE6AqCoc42XVsgD+/cMW6N9dmVUa
         YIzt6d75ErGIk2hot+CNxcdemeav1KvifaAWEMyotr79aIXpaua4Izut1WtAV7y1RnLs
         1iFA==
X-Gm-Message-State: AOJu0YwLEdw0fW0ey5uUFjDoPa/n9IEpnD7tbNAK4dvxasuqB7er9Dt0
	kymkgUTsYCJr7tzH0deho6xoMGghCTKEi6moxYV7jn5pNvig3oIrNCmPRVxq1ZEFRyLMAXehk1T
	hfUfG
X-Gm-Gg: ASbGncvqkfsZCXW82/+P8zTkfTp3p/P0aIlOa9n/xM/RMdg/3o5Ui3DgE7wC/C5vL8N
	D66iDyaVDDHYMPAVyAjJdHllsQupZErwyUmyUBRNX0Sp1W/uDPbJhna+sPn38LSV5TzMoP4Lq9N
	6TYRfSe75bdyU+iYH9dwdN67S8t6rJw56WPa1DLotFTYx8DMQDm+6gSZtHwwhWu3sJGP41r81wk
	QOTTY1eisY++t3mx+rPAdzEK+UsgjkrY8NpedVE6x13zszEuldOsH2Sg8Jz00nbPncz7XFtWxsU
	dWlu5RAEZh5evb+9Ryj/brcnZWlkRBBEds49Ops+G/DdeynBNheChjYyc6HcEvgGZvHJb8uxDJ+
	oc3QM4Ff2yg/qVOT0F2Mw8MqIOrlrv0om1a51iL4s
X-Google-Smtp-Source: AGHT+IHrvuWFce+V1p+Q1Vyy34iIlwlgwL2y0Bh6CvYVOv/yTHN9jVxpyv67AE7ErrPfGPP8Lc29eg==
X-Received: by 2002:a05:6a00:2312:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-74b5104ce4bmr9489202b3a.12.1751559678516;
        Thu, 03 Jul 2025 09:21:18 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:21:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/6] xen/softirq: Rework arch_skip_send_event_check()
 into arch_pend_softirq()
Message-ID: <aGat-VxBF5jOErzy@macbook.local>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702144121.1096448-4-andrew.cooper3@citrix.com>

On Wed, Jul 02, 2025 at 03:41:18PM +0100, Andrew Cooper wrote:
> x86 is the only architecture wanting an optimisation here, but the
> test_and_set_bit() is a store into the monitored line and is racy with
> determining whether an IPI can be skipped.
> 
> Instead, implement a new arch helper with different semantics; to make the
> softirq pending and decide about IPIs together.  For now, implement the
> default helper.  It will be overridden by x86 in a subsequent change.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With the adjusted commit message you proposed to Jan:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one nit below to comment something.

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/arch/x86/acpi/cpu_idle.c       |  5 -----
>  xen/arch/x86/include/asm/softirq.h |  2 --
>  xen/common/softirq.c               |  8 ++------
>  xen/include/xen/softirq.h          | 16 ++++++++++++++++
>  4 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
> index dbcb80d81db9..caa0fef0b3b1 100644
> --- a/xen/arch/x86/acpi/cpu_idle.c
> +++ b/xen/arch/x86/acpi/cpu_idle.c
> @@ -436,11 +436,6 @@ static int __init cf_check cpu_idle_key_init(void)
>  }
>  __initcall(cpu_idle_key_init);
>  
> -bool arch_skip_send_event_check(unsigned int cpu)
> -{
> -    return false;
> -}
> -
>  void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>  {
>      unsigned int cpu = smp_processor_id();
> diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
> index 415ee866c79d..e4b194f069fb 100644
> --- a/xen/arch/x86/include/asm/softirq.h
> +++ b/xen/arch/x86/include/asm/softirq.h
> @@ -9,6 +9,4 @@
>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>  #define NR_ARCH_SOFTIRQS       5
>  
> -bool arch_skip_send_event_check(unsigned int cpu);
> -
>  #endif /* __ASM_SOFTIRQ_H__ */
> diff --git a/xen/common/softirq.c b/xen/common/softirq.c
> index 60f344e8425e..0368011f95d1 100644
> --- a/xen/common/softirq.c
> +++ b/xen/common/softirq.c
> @@ -94,9 +94,7 @@ void cpumask_raise_softirq(const cpumask_t *mask, unsigned int nr)
>          raise_mask = &per_cpu(batch_mask, this_cpu);
>  
>      for_each_cpu(cpu, mask)
> -        if ( !test_and_set_bit(nr, &softirq_pending(cpu)) &&
> -             cpu != this_cpu &&
> -             !arch_skip_send_event_check(cpu) )
> +        if ( !arch_pend_softirq(nr, cpu) && cpu != this_cpu )
>              __cpumask_set_cpu(cpu, raise_mask);
>  
>      if ( raise_mask == &send_mask )
> @@ -107,9 +105,7 @@ void cpu_raise_softirq(unsigned int cpu, unsigned int nr)
>  {
>      unsigned int this_cpu = smp_processor_id();
>  
> -    if ( test_and_set_bit(nr, &softirq_pending(cpu))
> -         || (cpu == this_cpu)
> -         || arch_skip_send_event_check(cpu) )
> +    if ( arch_pend_softirq(nr, cpu) || cpu == this_cpu )
>          return;
>  
>      if ( !per_cpu(batching, this_cpu) || in_irq() )
> diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
> index e9f79ec0ce3e..0814c8e5cd41 100644
> --- a/xen/include/xen/softirq.h
> +++ b/xen/include/xen/softirq.h
> @@ -23,6 +23,22 @@ enum {
>  
>  #define NR_SOFTIRQS (NR_COMMON_SOFTIRQS + NR_ARCH_SOFTIRQS)
>  
> +/*
> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
> + * skipped, false if the IPI cannot be skipped.
> + */
> +#ifndef arch_pend_softirq
> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)

Nit: I would maybe it arch_set_softirq(), I find `pend` not that clear
(I would rather fully spell `pending` instead).

Thanks, Roger.

