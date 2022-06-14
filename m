Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B777E54AEF6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 13:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348781.574960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14Jo-0004of-SR; Tue, 14 Jun 2022 11:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348781.574960; Tue, 14 Jun 2022 11:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14Jo-0004mJ-PR; Tue, 14 Jun 2022 11:02:44 +0000
Received: by outflank-mailman (input) for mailman id 348781;
 Tue, 14 Jun 2022 11:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5YSJ=WV=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o14Jn-0004mD-TP
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 11:02:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 824bd0ca-ebd1-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 13:02:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C13A1424;
 Tue, 14 Jun 2022 04:02:40 -0700 (PDT)
Received: from [10.57.11.30] (unknown [10.57.11.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E6F3F73B;
 Tue, 14 Jun 2022 04:02:39 -0700 (PDT)
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
X-Inumbo-ID: 824bd0ca-ebd1-11ec-8901-93a377f238d6
Message-ID: <f60bd88a-90bc-60a9-be72-aa533315c55f@arm.com>
Date: Tue, 14 Jun 2022 13:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: smpboot: Allocate the CPU sibling/core maps
 while preparing the CPU
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094119.94720-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220614094119.94720-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 14.06.2022 11:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
> xmalloc()" extended the checks in _xmalloc() to catch any use of the
> helpers from context with interrupts disabled.
> 
> Unfortunately, the rule is not followed when allocating the CPU
> sibling/core maps.
> 
> (XEN) Xen call trace:
> (XEN)    [<00238a5c>] _xmalloc+0xfc/0x314 (PC)
> (XEN)    [<00000000>] 00000000 (LR)
> (XEN)    [<00238c8c>] _xzalloc+0x18/0x4c
> (XEN)    [<00288cb4>] smpboot.c#setup_cpu_sibling_map+0x38/0x138
> (XEN)    [<00289024>] start_secondary+0x1b4/0x270
> (XEN)    [<40010170>] 40010170
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:601
> (XEN) ****************************************
> 
> This is happening because zalloc_cpumask_var() may allocate memory
> if NR_CPUS is > 2 * sizeof(unsigned long).
> 
> Avoid the problem by allocate the per-CPU IRQs while preparing the
> CPU.
Shouldn't this be "by allocating the CPU sibling/core maps while ..."
to reflect the commit title and to distinguish between this change and the IRQ one?

> 
> This also has the benefit to remove a panic() in the secondary CPU
> code.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/smpboot.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 4888bcd78a5a..2b0c92cd369b 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -79,15 +79,17 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
>  static bool __read_mostly opt_hmp_unsafe = false;
>  boolean_param("hmp-unsafe", opt_hmp_unsafe);
>  
> -static void setup_cpu_sibling_map(int cpu)
> +static int setup_cpu_sibling_map(int cpu)
>  {
>      if ( !zalloc_cpumask_var(&per_cpu(cpu_sibling_mask, cpu)) ||
>           !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
> -        panic("No memory for CPU sibling/core maps\n");
> +        return -ENOMEM;
>  
>      /* A CPU is a sibling with itself and is always on its own core. */
>      cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>      cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
> +
> +    return 0;
>  }
>  
>  static void remove_cpu_sibling_map(int cpu)
> @@ -292,9 +294,14 @@ smp_get_max_cpus (void)
>  void __init
>  smp_prepare_cpus(void)
>  {
> +    int rc;
Here you are leaving rc uninitialized (which is ok) but ...

> +
>      cpumask_copy(&cpu_present_map, &cpu_possible_map);
>  
> -    setup_cpu_sibling_map(0);
> +    rc = setup_cpu_sibling_map(0);
> +    if ( rc )
> +        panic("Unable to allocate CPU sibling/core maps\n");
> +
>  }
>  
>  /* Boot the current CPU */
> @@ -361,8 +368,6 @@ void start_secondary(void)
>  
>      set_current(idle_vcpu[cpuid]);
>  
> -    setup_cpu_sibling_map(cpuid);
> -
>      /* Run local notifiers */
>      notify_cpu_starting(cpuid);
>      /*
> @@ -530,9 +535,19 @@ static int cpu_smpboot_callback(struct notifier_block *nfb,
>                                  void *hcpu)
>  {
>      unsigned int cpu = (unsigned long)hcpu;
> +    unsigned int rc = 0;
... here you are setting rc to 0 even though it will be reassigned.
Furthermore, if rc is used only in case of CPU_UP_PREPARE, why not moving the definition there?

>  
>      switch ( action )
>      {
> +    case CPU_UP_PREPARE:
> +        rc = setup_cpu_sibling_map(cpu);
> +        if ( rc )
> +            printk(XENLOG_ERR
> +                   "Unable to allocate CPU sibling/core map  for CPU%u\n",
Too many spaces between 'map' and 'for'.

> +                   cpu);
> +
> +        break;
> +
>      case CPU_DEAD:
>          remove_cpu_sibling_map(cpu);
>          break;

Cheers,
Michal

