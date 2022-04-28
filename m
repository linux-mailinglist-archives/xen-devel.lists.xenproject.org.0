Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329A7512E1E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316153.534931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzNG-0003WV-89; Thu, 28 Apr 2022 08:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316153.534931; Thu, 28 Apr 2022 08:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzNG-0003RG-35; Thu, 28 Apr 2022 08:19:42 +0000
Received: by outflank-mailman (input) for mailman id 316153;
 Thu, 28 Apr 2022 08:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SwrA=VG=arm.com=suzuki.poulose@srs-se1.protection.inumbo.net>)
 id 1njzIA-0003Kw-Hq
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:14:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 36ff62bc-c6cb-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 10:14:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAD1D13D5;
 Thu, 28 Apr 2022 01:14:23 -0700 (PDT)
Received: from [10.57.12.231] (unknown [10.57.12.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801DE3F774;
 Thu, 28 Apr 2022 01:14:12 -0700 (PDT)
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
X-Inumbo-ID: 36ff62bc-c6cb-11ec-8fc3-03012f2f19d4
Message-ID: <7956ab00-66b6-bd89-dcc0-f10cf2741e4d@arm.com>
Date: Thu, 28 Apr 2022 09:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 20/30] panic: Add the panic informational notifier list
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
 fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com,
 dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org,
 mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
 john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
 mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
 peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com,
 vkuznets@redhat.com, will@kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Josh Triplett
 <josh@joshtriplett.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Leo Yan <leo.yan@linaro.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Mike Leach <mike.leach@linaro.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-21-gpiccoli@igalia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20220427224924.592546-21-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/2022 23:49, Guilherme G. Piccoli wrote:
> The goal of this new panic notifier is to allow its users to
> register callbacks to run earlier in the panic path than they
> currently do. This aims at informational mechanisms, like dumping
> kernel offsets and showing device error data (in case it's simple
> registers reading, for example) as well as mechanisms to disable
> log flooding (like hung_task detector / RCU warnings) and the
> tracing dump_on_oops (when enabled).
> 
> Any (non-invasive) information that should be provided before
> kmsg_dump() as well as log flooding preventing code should fit
> here, as long it offers relatively low risk for kdump.
> 
> For now, the patch is almost a no-op, although it changes a bit
> the ordering in which some panic notifiers are executed - specially
> affected by this are the notifiers responsible for disabling the
> hung_task detector / RCU warnings, which now run first. In a
> subsequent patch, the panic path will be refactored, then the
> panic informational notifiers will effectively run earlier,
> before ksmg_dump() (and usually before kdump as well).
> 
> We also defer documenting it all properly in the subsequent
> refactor patch. Finally, while at it, we removed some useless
> header inclusions too.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Neeraj Upadhyay <quic_neeraju@quicinc.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>   arch/arm64/kernel/setup.c                         | 2 +-
>   arch/mips/kernel/relocate.c                       | 2 +-
>   arch/powerpc/kernel/setup-common.c                | 2 +-
>   arch/x86/kernel/setup.c                           | 2 +-
>   drivers/bus/brcmstb_gisb.c                        | 2 +-
>   drivers/hwtracing/coresight/coresight-cpu-debug.c | 4 ++--
>   drivers/soc/tegra/ari-tegra186.c                  | 3 ++-
>   include/linux/panic_notifier.h                    | 1 +
>   kernel/hung_task.c                                | 3 ++-
>   kernel/panic.c                                    | 4 ++++
>   kernel/rcu/tree.c                                 | 1 -
>   kernel/rcu/tree_stall.h                           | 3 ++-
>   kernel/trace/trace.c                              | 2 +-
>   13 files changed, 19 insertions(+), 12 deletions(-)
> 

...

> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 1874df7c6a73..7b1012454525 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -535,7 +535,7 @@ static int debug_func_init(void)
>   			    &debug_func_knob_fops);
>   
>   	/* Register function to be called for panic */
> -	ret = atomic_notifier_chain_register(&panic_notifier_list,
> +	ret = atomic_notifier_chain_register(&panic_info_list,
>   					     &debug_notifier);
>   	if (ret) {
>   		pr_err("%s: unable to register notifier: %d\n",
> @@ -552,7 +552,7 @@ static int debug_func_init(void)
>   
>   static void debug_func_exit(void)
>   {
> -	atomic_notifier_chain_unregister(&panic_notifier_list,
> +	atomic_notifier_chain_unregister(&panic_info_list,
>   					 &debug_notifier);
>   	debugfs_remove_recursive(debug_debugfs_dir);
>   }

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


