Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C815C30B0BF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 20:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80120.146317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6fBc-00029p-Ka; Mon, 01 Feb 2021 19:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80120.146317; Mon, 01 Feb 2021 19:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6fBc-00029N-Gy; Mon, 01 Feb 2021 19:48:36 +0000
Received: by outflank-mailman (input) for mailman id 80120;
 Mon, 01 Feb 2021 19:48:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hg0o=HD=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1l6fBa-00029E-3Q
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 19:48:35 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17e9759c-d063-45fd-8660-11c6ed79e5c7;
 Mon, 01 Feb 2021 19:48:31 +0000 (UTC)
Received: from zn.tnic (p200300ec2f06fe00e55f3102cc5eb27e.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:fe00:e55f:3102:cc5e:b27e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 26BD61EC0253;
 Mon,  1 Feb 2021 20:48:30 +0100 (CET)
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
X-Inumbo-ID: 17e9759c-d063-45fd-8660-11c6ed79e5c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1612208910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOkZrEeAn9oVnNn743NqAyVIKQ3k9/Lp3V74SDhkd64=;
	b=EM+rZpLJ9tNc2VbuYUaopFlP03mUsRMmq8qq/pgZ3JJsI6Y/KowJvU44oGPkeeGAD2qPsa
	j3K801BVFENduL2KRFMJ4dbHjY93xQqSdkCzV0oRKi2WduQAxPNz6//O0rJUMn7L41a83g
	pwy9/FLLvDRay4tdxWs6a0Sjt8mlIoM=
Date: Mon, 1 Feb 2021 20:48:28 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 07/15] x86/paravirt: switch time pvops functions to
 use static_call()
Message-ID: <20210201194828.GB14590@zn.tnic>
References: <20210120135555.32594-1-jgross@suse.com>
 <20210120135555.32594-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210120135555.32594-8-jgross@suse.com>

On Wed, Jan 20, 2021 at 02:55:47PM +0100, Juergen Gross wrote:
> The time pvops functions are the only ones left which might be
> used in 32-bit mode and which return a 64-bit value.
> 
> Switch them to use the static_call() mechanism instead of pvops, as
> this allows quite some simplification of the pvops implementation.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V4:
> - drop paravirt_time.h again
> - don't move Hyper-V code (Michael Kelley)
> ---
>  arch/x86/Kconfig                      |  1 +
>  arch/x86/include/asm/mshyperv.h       |  2 +-
>  arch/x86/include/asm/paravirt.h       | 17 ++++++++++++++---
>  arch/x86/include/asm/paravirt_types.h |  6 ------
>  arch/x86/kernel/cpu/vmware.c          |  5 +++--
>  arch/x86/kernel/kvm.c                 |  2 +-
>  arch/x86/kernel/kvmclock.c            |  2 +-
>  arch/x86/kernel/paravirt.c            | 16 ++++++++++++----
>  arch/x86/kernel/tsc.c                 |  2 +-
>  arch/x86/xen/time.c                   | 11 ++++-------
>  drivers/clocksource/hyperv_timer.c    |  5 +++--
>  drivers/xen/time.c                    |  2 +-
>  12 files changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 21f851179ff0..7ccd4a80788c 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -771,6 +771,7 @@ if HYPERVISOR_GUEST
>  
>  config PARAVIRT
>  	bool "Enable paravirtualization code"
> +	depends on HAVE_STATIC_CALL
>  	help
>  	  This changes the kernel so it can modify itself when it is run
>  	  under a hypervisor, potentially improving performance significantly
> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> index 30f76b966857..b4ee331d29a7 100644
> --- a/arch/x86/include/asm/mshyperv.h
> +++ b/arch/x86/include/asm/mshyperv.h
> @@ -63,7 +63,7 @@ typedef int (*hyperv_fill_flush_list_func)(
>  static __always_inline void hv_setup_sched_clock(void *sched_clock)
>  {
>  #ifdef CONFIG_PARAVIRT
> -	pv_ops.time.sched_clock = sched_clock;
> +	paravirt_set_sched_clock(sched_clock);
>  #endif
>  }
>  
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index 4abf110e2243..1e45b46fae84 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -15,11 +15,22 @@
>  #include <linux/bug.h>
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
> +#include <linux/static_call_types.h>
>  #include <asm/frame.h>
>  
> -static inline unsigned long long paravirt_sched_clock(void)
> +u64 dummy_steal_clock(int cpu);
> +u64 dummy_sched_clock(void);
> +
> +DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
> +DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);

Did you build this before sending?

I'm test-applying this on rc6 + tip/master so I probably am using a
different tree so it looks like something has changed in the meantime.
-rc6 has a couple of Xen changes which made applying those to need some
wiggling in...

Maybe you should redo them ontop of tip/master. That is, *if* they're
going to eventually go through tip. The diffstat has Xen stuff too so we
might need some synchronization here what goes where how...

./arch/x86/include/asm/paravirt.h:24:1: warning: data definition has no type or storage class
   24 | DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
      | ^~~~~~~~~~~~~~~~~~~
./arch/x86/include/asm/paravirt.h:24:1: error: type defaults to ‘int’ in declaration of ‘DECLARE_STATIC_CALL’ [-Werror=implicit-int]
./arch/x86/include/asm/paravirt.h:24:1: warning: parameter names (without types) in function declaration
./arch/x86/include/asm/paravirt.h:25:1: warning: data definition has no type or storage class
   25 | DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
      | ^~~~~~~~~~~~~~~~~~~
./arch/x86/include/asm/paravirt.h:25:1: error: type defaults to ‘int’ in declaration of ‘DECLARE_STATIC_CALL’ [-Werror=implicit-int]
./arch/x86/include/asm/paravirt.h:25:1: warning: parameter names (without types) in function declaration
./arch/x86/include/asm/paravirt.h: In function ‘paravirt_sched_clock’:
./arch/x86/include/asm/paravirt.h:33:9: error: implicit declaration of function ‘static_call’ [-Werror=implicit-function-declaration]
   33 |  return static_call(pv_sched_clock)();
      |         ^~~~~~~~~~~
./arch/x86/include/asm/paravirt.h:33:21: error: ‘pv_sched_clock’ undeclared (first use in this function); did you mean ‘dummy_sched_clock’?
   33 |  return static_call(pv_sched_clock)();
      |                     ^~~~~~~~~~~~~~
      |                     dummy_sched_clock
./arch/x86/include/asm/paravirt.h:33:21: note: each undeclared identifier is reported only once for each function it appears in
./arch/x86/include/asm/paravirt.h: In function ‘paravirt_steal_clock’:
./arch/x86/include/asm/paravirt.h:47:21: error: ‘pv_steal_clock’ undeclared (first use in this function); did you mean ‘dummy_steal_clock’?
   47 |  return static_call(pv_steal_clock)(cpu);
      |                     ^~~~~~~~~~~~~~
      |                     dummy_steal_clock
cc1: some warnings being treated as errors
make[1]: *** [scripts/Makefile.build:117: arch/x86/kernel/asm-offsets.s] Error 1
make: *** [Makefile:1200: prepare0] Error 2

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

