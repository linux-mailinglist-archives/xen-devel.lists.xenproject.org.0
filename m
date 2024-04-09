Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14589E5D2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 00:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702866.1098491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruKPZ-0004OY-3e; Tue, 09 Apr 2024 22:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702866.1098491; Tue, 09 Apr 2024 22:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruKPY-0004MU-Vm; Tue, 09 Apr 2024 22:57:52 +0000
Received: by outflank-mailman (input) for mailman id 702866;
 Tue, 09 Apr 2024 22:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ruKPW-0004MO-Qe
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 22:57:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94dcdc3e-f6c4-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 00:57:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F1FCBCE2452;
 Tue,  9 Apr 2024 22:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D396C433C7;
 Tue,  9 Apr 2024 22:57:40 +0000 (UTC)
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
X-Inumbo-ID: 94dcdc3e-f6c4-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712703461;
	bh=r2CA0FRvlgmRHvvk+yo/6/dmvMj4c+cbxqWWZHUivK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=md8f3CZn1KE7bbqpBoPROXf3JTs5pB8qNwh6asAdFnfnWB9zWdeCW6UYDc/ycYGu2
	 3RyWhcter//VM+kURdJ18HCYTOPN5gVQLvGyMMgVWJ4S/hf/ayeOCFFQq0GGT4fVTv
	 xNugE1U2xjUP+bdCkedH8peuoh8xygZBuUn5d8tCgBDrZMvU+2VWEjWei5FZPlmByt
	 py3VUyV0Rd7maInH7VK2XUMD8vcbwCTVSoJH0bYVD+Bhtchce4PFyzRXG0Egs7fr6U
	 EpiCfC266DPt6QSVHWDJmUNjpKAs2E8MoOdXW6KSYD77ppcjJTBQ+BzujKBIbPd2XM
	 AiDqFyyWMwKQw==
Date: Tue, 9 Apr 2024 15:57:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH V2] x86/MCE: move intel mcheck init code to separate
 file
In-Reply-To: <20240409120645.2948405-1-Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404091556360.711344@ubuntu-linux-20-04-desktop>
References: <20240409120645.2948405-1-Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Apr 2024, Sergiy Kibrik wrote:
> Separate Intel nonfatal MCE initialization code from generic MCE code, the same
> way it is done for AMD code. This is to be able to later make intel/amd MCE
> code optional in the build.
> 
> Convert to Xen coding style. Clean up unused includes. Remove seemingly
> outdated comment about MCE check period.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/cpu/mcheck/Makefile         |  1 +
>  xen/arch/x86/cpu/mcheck/intel-nonfatal.c | 85 ++++++++++++++++++++++++
>  xen/arch/x86/cpu/mcheck/mce.h            |  1 +
>  xen/arch/x86/cpu/mcheck/non-fatal.c      | 82 +----------------------
>  4 files changed, 88 insertions(+), 81 deletions(-)
>  create mode 100644 xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> 
> V2:
>  * convert to Xen coding style
>  * file naming
>  * drop outdated comment

I find code movement together with coding style changes harder to
review, but I know that Jan asked for it. I reviewed the code and
everything checks out.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/Makefile
> index 0d63ff9096..f927f10b4d 100644
> --- a/xen/arch/x86/cpu/mcheck/Makefile
> +++ b/xen/arch/x86/cpu/mcheck/Makefile
> @@ -2,6 +2,7 @@ obj-y += amd_nonfatal.o
>  obj-y += mce_amd.o
>  obj-y += mcaction.o
>  obj-y += barrier.o
> +obj-y += intel-nonfatal.o
>  obj-y += mctelem.o
>  obj-y += mce.o
>  obj-y += mce-apei.o
> diff --git a/xen/arch/x86/cpu/mcheck/intel-nonfatal.c b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> new file mode 100644
> index 0000000000..e18e8a4030
> --- /dev/null
> +++ b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Non Fatal Machine Check Exception Reporting
> + * (C) Copyright 2002 Dave Jones. <davej@codemonkey.org.uk>
> + */
> +
> +#include <xen/event.h>
> +
> +#include "mce.h"
> +#include "vmce.h"
> +
> +static struct timer mce_timer;
> +
> +#define MCE_PERIOD MILLISECS(8000)
> +#define MCE_PERIOD_MIN MILLISECS(2000)
> +#define MCE_PERIOD_MAX MILLISECS(16000)
> +
> +static uint64_t period = MCE_PERIOD;
> +static int adjust = 0;
> +static int variable_period = 1;
> +
> +static void cf_check mce_checkregs(void *info)
> +{
> +    mctelem_cookie_t mctc;
> +    struct mca_summary bs;
> +    static uint64_t dumpcount = 0;
> +
> +    mctc = mcheck_mca_logout(MCA_POLLER, this_cpu( poll_bankmask),
> +                             &bs, NULL);
> +
> +    if ( bs.errcnt && mctc != NULL )
> +    {
> +        adjust++;
> +
> +        /* If Dom0 enabled the VIRQ_MCA event, then notify it.
> +         * Otherwise, if dom0 has had plenty of time to register
> +         * the virq handler but still hasn't then dump telemetry
> +         * to the Xen console.  The call count may be incremented
> +         * on multiple cpus at once and is indicative only - just
> +         * a simple-minded attempt to avoid spamming the console
> +         * for corrected errors in early startup.
> +         */
> +
> +        if ( dom0_vmce_enabled() )
> +        {
> +            mctelem_commit(mctc);
> +            send_global_virq(VIRQ_MCA);
> +        }
> +        else if ( ++dumpcount >= 10 )
> +        {
> +            x86_mcinfo_dump((struct mc_info *)mctelem_dataptr(mctc));
> +            mctelem_dismiss(mctc);
> +        }
> +        else
> +            mctelem_dismiss(mctc);
> +    }
> +    else if ( mctc != NULL )
> +        mctelem_dismiss(mctc);
> +}
> +
> +static void cf_check mce_work_fn(void *data)
> +{
> +    on_each_cpu(mce_checkregs, NULL, 1);
> +
> +    if ( variable_period )
> +    {
> +        if ( adjust )
> +            period /= (adjust + 1);
> +        else
> +            period *= 2;
> +        if ( period > MCE_PERIOD_MAX )
> +            period = MCE_PERIOD_MAX;
> +        if ( period < MCE_PERIOD_MIN )
> +            period = MCE_PERIOD_MIN;
> +    }
> +
> +    set_timer(&mce_timer, NOW() + period);
> +    adjust = 0;
> +}
> +
> +void __init intel_nonfatal_mcheck_init(struct cpuinfo_x86 *unused)
> +{
> +    init_timer(&mce_timer, mce_work_fn, NULL, 0);
> +    set_timer(&mce_timer, NOW() + MCE_PERIOD);
> +}
> diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
> index 7f26afae23..4806405f96 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -47,6 +47,7 @@ enum mcheck_type amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp);
>  enum mcheck_type intel_mcheck_init(struct cpuinfo_x86 *c, bool bsp);
>  
>  void amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c);
> +void intel_nonfatal_mcheck_init(struct cpuinfo_x86 *c);
>  
>  extern unsigned int firstbank;
>  extern unsigned int ppin_msr;
> diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
> index 1c0c32ba08..33cacd15c2 100644
> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
> @@ -7,84 +7,7 @@
>   *
>   */
>  
> -#include <xen/init.h>
> -#include <xen/types.h>
> -#include <xen/kernel.h>
> -#include <xen/smp.h>
> -#include <xen/timer.h>
> -#include <xen/errno.h>
> -#include <xen/event.h>
> -#include <xen/sched.h>
> -#include <asm/processor.h> 
> -#include <asm/system.h>
> -#include <asm/msr.h>
> -
>  #include "mce.h"
> -#include "vmce.h"
> -
> -static struct timer mce_timer;
> -
> -#define MCE_PERIOD MILLISECS(8000)
> -#define MCE_PERIOD_MIN MILLISECS(2000)
> -#define MCE_PERIOD_MAX MILLISECS(16000)
> -
> -static uint64_t period = MCE_PERIOD;
> -static int adjust = 0;
> -static int variable_period = 1;
> -
> -static void cf_check mce_checkregs(void *info)
> -{
> -	mctelem_cookie_t mctc;
> -	struct mca_summary bs;
> -	static uint64_t dumpcount = 0;
> -
> -	mctc = mcheck_mca_logout(MCA_POLLER, this_cpu(poll_bankmask),
> -				 &bs, NULL);
> -
> -	if (bs.errcnt && mctc != NULL) {
> -		adjust++;
> -
> -		/* If Dom0 enabled the VIRQ_MCA event, then notify it.
> -		 * Otherwise, if dom0 has had plenty of time to register
> -		 * the virq handler but still hasn't then dump telemetry
> -		 * to the Xen console.  The call count may be incremented
> -		 * on multiple cpus at once and is indicative only - just
> -		 * a simple-minded attempt to avoid spamming the console
> -		 * for corrected errors in early startup.
> -		 */
> -
> -		if (dom0_vmce_enabled()) {
> -			mctelem_commit(mctc);
> -			send_global_virq(VIRQ_MCA);
> -		} else if (++dumpcount >= 10) {
> -			x86_mcinfo_dump((struct mc_info *)mctelem_dataptr(mctc));
> -			mctelem_dismiss(mctc);
> -		} else {
> -			mctelem_dismiss(mctc);
> -		}
> -	} else if (mctc != NULL) {
> -		mctelem_dismiss(mctc);
> -	}
> -}
> -
> -static void cf_check mce_work_fn(void *data)
> -{ 
> -	on_each_cpu(mce_checkregs, NULL, 1);
> -
> -	if (variable_period) {
> -		if (adjust)
> -			period /= (adjust + 1);
> -		else
> -			period *= 2;
> -		if (period > MCE_PERIOD_MAX)
> -			period = MCE_PERIOD_MAX;
> -		if (period < MCE_PERIOD_MIN)
> -			period = MCE_PERIOD_MIN;
> -	}
> -
> -	set_timer(&mce_timer, NOW() + period);
> -	adjust = 0;
> -}
>  
>  static int __init cf_check init_nonfatal_mce_checker(void)
>  {
> @@ -106,13 +29,10 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>  		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>  		amd_nonfatal_mcheck_init(c);
>  		break;
> -
>  	case X86_VENDOR_INTEL:
> -		init_timer(&mce_timer, mce_work_fn, NULL, 0);
> -		set_timer(&mce_timer, NOW() + MCE_PERIOD);
> +		intel_nonfatal_mcheck_init(c);
>  		break;
>  	}
> -
>  	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>  	return 0;
>  }
> -- 
> 2.25.1
> 

