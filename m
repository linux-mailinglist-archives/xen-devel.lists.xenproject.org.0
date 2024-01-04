Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306BD824855
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 19:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661879.1031634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLScs-0002hX-6Q; Thu, 04 Jan 2024 18:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661879.1031634; Thu, 04 Jan 2024 18:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLScs-0002dK-3J; Thu, 04 Jan 2024 18:39:30 +0000
Received: by outflank-mailman (input) for mailman id 661879;
 Thu, 04 Jan 2024 18:39:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLScq-0002dE-6U
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 18:39:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLScp-0000hC-Il; Thu, 04 Jan 2024 18:39:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLScp-0006Uy-CA; Thu, 04 Jan 2024 18:39:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=IEc0qfpWPLF016jVroMDGdIFRKsenq5c6LXn4XMn20U=; b=GcSL04CzXS9G53al2WJUx/dvEx
	uAJLvpFYLYLMC0xT7zaQG9hm3KxFA+jVtC2O3tahXMr4WEWAumCA2RPqr2PBiRc7M0rqZJrXyQtEh
	QXau6YGwO/IFwbfNkPuYGNhXCOJFSx1WHgIqD1jwPomIo2VgQUJqzaKOlQNl05VxjYyA=;
Message-ID: <a407d6da-1e9a-4d9d-8b9f-38696daf31dc@xen.org>
Date: Thu, 4 Jan 2024 18:39:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-2-carlo.nonato@minervasys.tech>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240102095138.17933-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 02/01/2024 09:51, Carlo Nonato wrote:
> This commit adds the Last Level Cache (LLC) coloring common header, Kconfig
> options and functions. Since this is an arch specific feature, actual
> implementation is postponed to later patches and Kconfig options are placed
> under xen/arch.
> 
> LLC colors are a property of the domain, so the domain struct has to be
> extended.

The interface below looks ok. I have left some comments below.

> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v5:
> - used - instead of _ for filenames
> - removed domain_create_llc_colored()
> - removed stub functions
> - coloring domain fields are now #ifdef protected
> v4:
> - Kconfig options moved to xen/arch
> - removed range for CONFIG_NR_LLC_COLORS
> - added "llc_coloring_enabled" global to later implement the boot-time
>    switch
> - added domain_create_llc_colored() to be able to pass colors
> - added is_domain_llc_colored() macro
> ---
>   xen/arch/Kconfig               | 16 ++++++++++++
>   xen/common/Kconfig             |  3 +++
>   xen/common/domain.c            |  4 +++
>   xen/common/keyhandler.c        |  4 +++
>   xen/include/xen/llc-coloring.h | 46 ++++++++++++++++++++++++++++++++++
>   xen/include/xen/sched.h        |  5 ++++
>   6 files changed, 78 insertions(+)
>   create mode 100644 xen/include/xen/llc-coloring.h
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 67ba38f32f..aad7e9da38 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -31,3 +31,19 @@ config NR_NUMA_NODES
>   	  associated with multiple-nodes management. It is the upper bound of
>   	  the number of NUMA nodes that the scheduler, memory allocation and
>   	  other NUMA-aware components can handle.
> +
> +config LLC_COLORING
> +	bool "Last Level Cache (LLC) coloring" if EXPERT
> +	depends on HAS_LLC_COLORING
> +
> +config NR_LLC_COLORS
> +	int "Maximum number of LLC colors"
> +	default 128
> +	depends on LLC_COLORING
> +	help
> +	  Controls the build-time size of various arrays associated with LLC
> +	  coloring. Refer to cache coloring documentation for how to compute the
> +	  number of colors supported by the platform. This is only an upper
> +	  bound. The runtime value is autocomputed or manually set via cmdline.
> +	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
> +	  more than what needed in the general case.
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 310ad4229c..e383f09d97 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -71,6 +71,9 @@ config HAS_IOPORTS
>   config HAS_KEXEC
>   	bool
>   
> +config HAS_LLC_COLORING
> +	bool
> +
>   config HAS_PMAP
>   	bool
>   
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index f6f5574996..491585b0bb 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -7,6 +7,7 @@
>   #include <xen/compat.h>
>   #include <xen/init.h>
>   #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/ctype.h>
>   #include <xen/err.h>
>   #include <xen/param.h>
> @@ -1144,6 +1145,9 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
>       struct vcpu *v;
>       int i;
>   
> +    if ( is_domain_llc_colored(d) )
> +        domain_llc_coloring_free(d);
> +
>       /*
>        * Flush all state for the vCPU previously having run on the current CPU.
>        * This is in particular relevant for x86 HVM ones on VMX, so that this
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 99a2d72a02..27c2d324d8 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -6,6 +6,7 @@
>   #include <xen/debugger.h>
>   #include <xen/delay.h>
>   #include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
>   #include <xen/param.h>
>   #include <xen/shutdown.h>
>   #include <xen/event.h>
> @@ -307,6 +308,9 @@ static void cf_check dump_domains(unsigned char key)
>   
>           arch_dump_domain_info(d);
>   
> +        if ( is_domain_llc_colored(d) )
> +            domain_dump_llc_colors(d);
> +
>           rangeset_domain_printk(d);
>   
>           dump_pageframe_info(d);
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> new file mode 100644
> index 0000000000..cedd97d4b5
> --- /dev/null
> +++ b/xen/include/xen/llc-coloring.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

For new SPDX we should use GPL-2.0-only. AFAIK, this is equivalent 
license but with a clearer name.

> +/*
> + * Last Level Cache (LLC) coloring common header
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + *
> + * Authors:
> + *    Carlo Nonato <carlo.nonato@minervasys.tech>

NIT: We don't usually add the authors in the code and instead rely on 
the Author/Signed-off-by in the commit.

If you want to keep it, then I will query why you added yourself but not 
Marco Solieri or Luca Miccio.

> + */
> +#ifndef __COLORING_H__
> +#define __COLORING_H__
> +
> +#include <xen/sched.h>
> +#include <public/domctl.h>
> +
> +#ifdef CONFIG_HAS_LLC_COLORING
> +
> +#include <asm/llc-coloring.h>
> +
> +#ifdef CONFIG_LLC_COLORING
> +extern bool llc_coloring_enabled;
> +#define llc_coloring_enabled (llc_coloring_enabled)

I don't really understand why you need the define here. Wouldn't it be 
clearer to have a #else and then ...

> +#endif
> +
> +#endif
> +
> +#ifndef llc_coloring_enabled
> +#define llc_coloring_enabled (false)

... define llc_coloring_enabled?

Also NIT: The parentheses are not necessary.

> +#endif
> +
> +#define is_domain_llc_colored(d) (llc_coloring_enabled)

You want to evaluate d. But here I would consider to use a static 
inline. Nowadays, we favor static inline helpers over macros as they add 
typesafety and you don't need to do trick (e.v. (void)(d)) to interpret 
the arguments.

> +
> +void domain_llc_coloring_free(struct domain *d);
> +void domain_dump_llc_colors(struct domain *d);

Looking at the usage, 'd' could be const.

> +
> +#endif /* __COLORING_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 9da91e0e62..dae7fab673 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -626,6 +626,11 @@ struct domain
>   
>       /* Holding CDF_* constant. Internal flags for domain creation. */
>       unsigned int cdf;
> +
> +#ifdef CONFIG_LLC_COLORING
> +    unsigned int *llc_colors;
> +    unsigned int num_llc_colors;
> +#endif
>   };
>   
>   static inline struct page_list_head *page_to_list(

Cheers,

-- 
Julien Grall

