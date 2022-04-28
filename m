Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239F4512ACD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 07:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315901.534678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njwQm-00076D-Nj; Thu, 28 Apr 2022 05:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315901.534678; Thu, 28 Apr 2022 05:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njwQm-00073y-JT; Thu, 28 Apr 2022 05:11:08 +0000
Received: by outflank-mailman (input) for mailman id 315901;
 Thu, 28 Apr 2022 01:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYj/=VG=huawei.com=nixiaoming@srs-se1.protection.inumbo.net>)
 id 1njsX4-0003u5-O3
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 01:01:22 +0000
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b60787b7-c68e-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 03:01:20 +0200 (CEST)
Received: from canpemm500006.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kpcgf1MZfzGpMl;
 Thu, 28 Apr 2022 08:58:38 +0800 (CST)
Received: from [10.67.110.83] (10.67.110.83) by canpemm500006.china.huawei.com
 (7.192.105.130) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 09:01:14 +0800
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
X-Inumbo-ID: b60787b7-c68e-11ec-8fc3-03012f2f19d4
Subject: Re: [PATCH 18/30] notifier: Show function names on notifier routines
 if DEBUG_NOTIFIERS is set
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <pmladek@suse.com>, <kexec@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
	<coresight@lists.linaro.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-alpha@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-hyperv@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-s390@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-um@lists.infradead.org>,
	<linux-xtensa@linux-xtensa.org>, <netdev@vger.kernel.org>,
	<openipmi-developer@lists.sourceforge.net>, <rcu@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<x86@kernel.org>, <kernel-dev@igalia.com>, <kernel@gpiccoli.net>,
	<halves@canonical.com>, <fabiomirmar@gmail.com>,
	<alejandro.j.jimenez@oracle.com>, <andriy.shevchenko@linux.intel.com>,
	<arnd@arndb.de>, <bp@alien8.de>, <corbet@lwn.net>,
	<d.hatayama@jp.fujitsu.com>, <dave.hansen@linux.intel.com>,
	<dyoung@redhat.com>, <feng.tang@intel.com>, <gregkh@linuxfoundation.org>,
	<mikelley@microsoft.com>, <hidehiro.kawai.ez@hitachi.com>, <jgross@suse.com>,
	<john.ogness@linutronix.de>, <keescook@chromium.org>, <luto@kernel.org>,
	<mhiramat@kernel.org>, <mingo@redhat.com>, <paulmck@kernel.org>,
	<peterz@infradead.org>, <rostedt@goodmis.org>, <senozhatsky@chromium.org>,
	<stern@rowland.harvard.edu>, <tglx@linutronix.de>, <vgoyal@redhat.com>,
	<vkuznets@redhat.com>, <will@kernel.org>, Arjan van de Ven
	<arjan@linux.intel.com>, Cong Wang <xiyou.wangcong@gmail.com>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Valentin Schneider
	<valentin.schneider@arm.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-19-gpiccoli@igalia.com>
From: Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
Date: Thu, 28 Apr 2022 09:01:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <20220427224924.592546-19-gpiccoli@igalia.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500006.china.huawei.com (7.192.105.130)
X-CFilter-Loop: Reflected

On 2022/4/28 6:49, Guilherme G. Piccoli wrote:
> Currently we have a debug infrastructure in the notifiers file, but
> it's very simple/limited. This patch extends it by:
> 
> (a) Showing all registered/unregistered notifiers' callback names;
> 
> (b) Adding a dynamic debug tuning to allow showing called notifiers'
> function names. Notice that this should be guarded as a tunable since
> it can flood the kernel log buffer.
> 
> Cc: Arjan van de Ven <arjan@linux.intel.com>
> Cc: Cong Wang <xiyou.wangcong@gmail.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Xiaoming Ni <nixiaoming@huawei.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 
> We have some design decisions that worth discussing here:
> 
> (a) First of call, using C99 helps a lot to write clear and concise code, but
> due to commit 4d94f910e79a ("Kbuild: use -Wdeclaration-after-statement") we
> have a warning if mixing variable declarations with code. For this patch though,
> doing that makes the code way clear, so decision was to add the debug code
> inside brackets whenever this warning pops up. We can change that, but that'll
> cause more ifdefs in the same function.
> 
> (b) In the symbol lookup helper function, we modify the parameter passed but
> even more, we return it as well! This is unusual and seems unnecessary, but was
> the strategy taken to allow embedding such function in the pr_debug() call.
> 
> Not doing that would likely requiring 3 symbol_name variables to avoid
> concurrency (registering notifier A while calling notifier B) - we rely in
> local variables as a serialization mechanism.
> 
> We're open for suggestions in case this design is not appropriate;
> thanks in advance!
> 
>   kernel/notifier.c | 48 +++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index ba005ebf4730..21032ebcde57 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -7,6 +7,22 @@
>   #include <linux/vmalloc.h>
>   #include <linux/reboot.h>
>   
> +#ifdef CONFIG_DEBUG_NOTIFIERS
> +#include <linux/kallsyms.h>
> +
> +/*
> + *	Helper to get symbol names in case DEBUG_NOTIFIERS is set.
> + *	Return the modified parameter is a strategy used to achieve
> + *	the pr_debug() functionality - with this, function is only
> + *	executed if the dynamic debug tuning is effectively set.
> + */
> +static inline char *notifier_name(struct notifier_block *nb, char *sym_name)
> +{
> +	lookup_symbol_name((unsigned long)(nb->notifier_call), sym_name);
> +	return sym_name;
> +}
> +#endif
> +
>   /*
>    *	Notifier list for kernel code which wants to be called
>    *	at shutdown. This is used to stop any idling DMA operations
> @@ -34,20 +50,41 @@ static int notifier_chain_register(struct notifier_block **nl,
>   	}
>   	n->next = *nl;
>   	rcu_assign_pointer(*nl, n);
> +
> +#ifdef CONFIG_DEBUG_NOTIFIERS
> +	{
> +		char sym_name[KSYM_NAME_LEN];
> +
> +		pr_info("notifiers: registered %s()\n",
> +			notifier_name(n, sym_name));
> +	}

Duplicate Code.

Is it better to use __func__ and %pS?

pr_info("%s: %pS\n", __func__, n->notifier_call);


> +#endif
>   	return 0;
>   }
>   
>   static int notifier_chain_unregister(struct notifier_block **nl,
>   		struct notifier_block *n)
>   {
> +	int ret = -ENOENT;
> +
>   	while ((*nl) != NULL) {
>   		if ((*nl) == n) {
>   			rcu_assign_pointer(*nl, n->next);
> -			return 0;
> +			ret = 0;
> +			break;
>   		}
>   		nl = &((*nl)->next);
>   	}
> -	return -ENOENT;
> +
> +#ifdef CONFIG_DEBUG_NOTIFIERS
> +	if (!ret) {
> +		char sym_name[KSYM_NAME_LEN];
> +
> +		pr_info("notifiers: unregistered %s()\n",
> +			notifier_name(n, sym_name));
> +	}
Duplicate Code.

Is it better to use __func__ and %pS?

pr_info("%s: %pS\n", __func__, n->notifier_call);
> +#endif
> +	return ret;
>   }
>   
>   /**
> @@ -80,6 +117,13 @@ static int notifier_call_chain(struct notifier_block **nl,
>   			nb = next_nb;
>   			continue;
>   		}
> +
Is the "#ifdef" missing here?
> +		{
> +			char sym_name[KSYM_NAME_LEN];
> +
> +			pr_debug("notifiers: calling %s()\n",
> +				 notifier_name(nb, sym_name));
Duplicate Code.

Is it better to use __func__ and %pS?

pr_info("%s: %pS\n", __func__, n->notifier_call);
> +		}
>   #endif
>   		ret = nb->notifier_call(nb, val, v);
>   
> 

Thanks
Xiaoming Ni

