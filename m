Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACB4DA33C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 20:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290931.493596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUClc-00027p-Ba; Tue, 15 Mar 2022 19:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290931.493596; Tue, 15 Mar 2022 19:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUClc-00025K-8E; Tue, 15 Mar 2022 19:23:36 +0000
Received: by outflank-mailman (input) for mailman id 290931;
 Tue, 15 Mar 2022 19:23:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nUCla-00025E-Nh
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 19:23:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUClZ-0002Jz-Su; Tue, 15 Mar 2022 19:23:33 +0000
Received: from [54.239.6.190] (helo=[192.168.16.242])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUClZ-00061W-Lz; Tue, 15 Mar 2022 19:23:33 +0000
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
	bh=jJDAz0e6MfGGTFFbfnL6SdREDwms3mTsp/t17W9rZPs=; b=DClykW+cjW2q8rYZAEbPPHCG91
	ELiqEW3I1OJOtoHJzRPkdYLygHlGZEjsd8ltJiA4+9j15rk6NF0ceA+BfD+UIfQV+48U+nvT/MgkW
	tbnBNHYD1VzU/W9RYqPPEoCKd+jJ+0dPD4JuBQv+CxHDu4i/ylH86DB0QvF1yA0EgBS8=;
Message-ID: <7584307c-9b58-5199-b3ff-0eba2a356325@xen.org>
Date: Tue, 15 Mar 2022 19:23:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 36/36] doc, arm: add usage documentation for cache
 coloring support
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-37-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-37-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

On 04/03/2022 17:47, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add basic documentation that shows how cache coloring support can be
> used in Xen. It introduces the basic concepts behind cache coloring,
> defines the cache selection format, and explains how to assign colors to
> the supported domains: Dom0, DomUs and Xen itself. Known issues are
> also reported.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   docs/misc/arm/cache_coloring.rst | 191 +++++++++++++++++++++++++++++++
>   1 file changed, 191 insertions(+)
>   create mode 100644 docs/misc/arm/cache_coloring.rst
> 
> diff --git a/docs/misc/arm/cache_coloring.rst b/docs/misc/arm/cache_coloring.rst
> new file mode 100644
> index 0000000000..082afb1b6c
> --- /dev/null
> +++ b/docs/misc/arm/cache_coloring.rst
> @@ -0,0 +1,191 @@
> +Xen coloring support user's guide
> +=================================
> +
> +The cache coloring support in Xen allows to reserve last level cache partition
AFAICT, the code is assuming that the Last level cache is L3. However, 
this documentation looks generic enough that someone could think it can 
be used on any platforms.

> +for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.

What is missing to support arm32?

> +
> +In order to enable and use it, few steps are needed.
> +
> +- Enable coloring in XEN configuration file.
> +
> +        CONFIG_COLORING=y
> +
> +- Enable/disable debug information (optional).
> +
> +        CONFIG_COLORING_DEBUG=y/n

This option doesn't seem to exist.

> +
> +Before digging into configuration instructions, configurers should first

I would write "system integrator" rather than "configurers".

> +understand the basics of cache coloring.

I read this as a suggestion to read external documentation. Do you have 
good pointer?

> +
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
> +to each core (hence using multiple cache units), while the last level is shared
> +among all of them. Such configuration implies that memory operations on one
> +core (e.g. running a DomU) are able to generate interference on another core
> +(e.g .hosting another DomU). Cache coloring allows eliminating this
> +mutual interference, and thus guaranteeing higher and more predictable
> +performances for memory accesses.
> +The key concept underlying cache coloring is a fragmentation of the memory
> +space into a set of sub-spaces called colors that are mapped to disjoint cache
> +partitions. Technically, the whole memory space is first divided into a number
> +of subsequent regions. Then each region is in turn divided into a number of
> +subsequent sub-colors. The generic i-th color is then obtained by all the
> +i-th sub-colors in each region.
> +
> +.. raw:: html
> +
> +    <pre>
> +                            Region j            Region j+1
> +                .....................   ............
> +                .                     . .
> +                .                       .
> +            _ _ _______________ _ _____________________ _ _
> +                |     |     |     |     |     |     |
> +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
> +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> +                    :                       :
> +                    :                       :...         ... .
> +                    :                            color 0
> +                    :...........................         ... .
> +                                                :
> +          . . ..................................:
> +    </pre>
> +
> +There are two pragmatic lesson to be learnt.
> +
> +1. If one wants to avoid cache interference between two domains, different
> +   colors needs to be used for their memory.
> +
> +2. Color assignment must privilege contiguity in the partitioning. E.g.,
> +   assigning colors (0,1) to domain I  and (2,3) to domain  J is better than
> +   assigning colors (0,2) to I and (1,3) to J.
> +
> +
> +Color(s) selection format
> +**************************
> +
> +Regardless of the domain that has to be colored (Dom0, DomUs and Xen),

Xen is not really a domain. How about 'memory pool'?

> +the color selection can be expressed using the same syntax.  In particular,

Here you are saying the syntax is the same for everyone. But below, you 
provide a new syntax for dom0less domUs.

> +the latter is expressed as a comma-separated list of hyphen-separated intervals
> +of color numbers, as in `0-4,5-8,10-15`.  Ranges are always represented using
> +strings. Note that no spaces are allowed.
> +
> +The number of available colors depends on the LLC layout of the specific
> +platform and determines the maximum allowed value.  This number can be either
> +calculated [#f1]_ or read from the output given by the hypervisor during boot,
> +if DEBUG logging is enabled.

I think it would be good to print the number of colors even in non-debug 
build.

> +
> +Examples:
> +
> ++---------------------+-----------------------------------+
> +|**Configuration**    |**Actual selection**               |
> ++---------------------+-----------------------------------+
> +|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
> ++---------------------+-----------------------------------+
> +|  0-8,3-8            | [0, 1, 2, 3, 4, 5, 6, 7, 8]       |
> ++---------------------+-----------------------------------+
> +|  0-0                | [0]                               |
> ++---------------------+-----------------------------------+

0-0 is a bit odd to write. I would consider to allow a system integrator 
to simply write '0'.

> +
> +General coloring parameters
> +***************************
> +
> +Four additional parameters in the Xen command line are used to define the
> +underlying coloring policy, which is not directly configurable otherwise.
> +
> +Please refer to the relative documentation in docs/man/xl.cfg.pod.5.in.
> +
> +Dom0less support
> +****************
> +Support for the Dom0less experimental features is provided. Color selection for

I don't understand the first sentence. Are you saying dom0less domUs 
support is experimental or the support for coloring dom0less domUs is 
experimental?

> +a virtual machine is defined by the attribute `colors`, whose format is not a
> +string for ranges list, but a bitmask. It suffices to set all and only the bits
> +having a position equal to the chosen colors, leaving unset all the others. For
> +example, if we choose 8 colors out of 16, we can use a bitmask with 8 bits set
> +and 8 bit unset, like:
> +

[...]

> +Known issues
> +************
> +
> +Explicitly define way_size in QEMU
> +##################################
> +
> +Currently, QEMU does not have a comprehensive cache model, so the cache coloring
> +support fails to detect a cache geometry where to operate. In this case, the
> +boot hangs as soon as the Xen image is loaded. To overcome this issue, it is
> +enough to specify the way_size parameter in the command line. Any multiple
> +greater than 1 of the page size allows the coloring mechanism to work, but the
> +precise behavior on the system that QEMU is emulating can be obtained with its
> +way_size. For instance, set way_size=65536.

Can we consider to fix QEMU?

> +
> +
> +Fail to boot colored DomUs with large memory size
> +#################################################
> +
> +If the kernel used for Dom0 does not contain the upstream commit

Dom0 is technically not tie to Linux. So please be explicit and write 
"Linux kernel".

> +3941552aec1e04d63999988a057ae09a1c56ebeb and uses the hypercall buffer device,
> +colored DomUs with memory size larger then 127 MB cannot be created. This is
> +caused by the default limit of this buffer of 64 pages. The solution is to
> +manually apply the above patch, or to check if there is an updated version of
> +the kernel in use for Dom0 that contains this change.

I don't understand how coloring is coming in the equation here. Can you 
provide more details?

> +
> +Notes:
> +******
> +
> +.. [#f1] To compute the number of available colors on a platform, one can simply
> +  divide `way_size` by `page_size`, where: `page_size` is the size of the page
> +  used on the system (usually 4 KiB);

It is fairly common for a CPU to support multiple page granularities 
(i.e 4KB, 16KB, 64KB). The Arm Arm architecture allows each level to use 
a different granularity.

For instance, dom0 may use 64KB page granularity, domU 4KB. Xen will 
always use 4KB for now.

So can you clarify what you mean by page used on the system? Is it Xen 
page granularity?


>  `way_size` is size of each LLC way.  For
> +  example, an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC enable 16
> +  colors, when pages are 4 KiB.
> +
> +

NIT: One newline should be sufficient here.

Cheers,

-- 
Julien Grall

