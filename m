Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54F282594D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 18:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662284.1032341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoEw-0003Ib-JJ; Fri, 05 Jan 2024 17:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662284.1032341; Fri, 05 Jan 2024 17:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoEw-0003Fi-Gf; Fri, 05 Jan 2024 17:44:14 +0000
Received: by outflank-mailman (input) for mailman id 662284;
 Fri, 05 Jan 2024 17:44:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLoEv-0003Fc-D9
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 17:44:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoEu-0003jX-GE; Fri, 05 Jan 2024 17:44:12 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoEu-00084K-7C; Fri, 05 Jan 2024 17:44:12 +0000
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
	bh=snDLMfYxl5ayrer8vruM9ZaCXAsIDpjf5hiwth4ksEU=; b=PU75kD94Z+maSDn2E2zG/V5idi
	bAIrpaA7ERSDuqBrqvABIcdsgVNlkXBKhL0asjYwTUANT254W0Kh3j2H7vJiOievAeKaU+eYdV4M/
	fVxGQVvyiOBSDtPJpyvVctyrDFM+6/ycuhFWXuiU+aH5wrDvvuoi9RRg51eoZkK+sSpM=;
Message-ID: <6916e8d4-b528-4fa4-b5ac-403b6632b6dd@xen.org>
Date: Fri, 5 Jan 2024 17:44:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] xen/arm: add cache coloring initialization
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-3-carlo.nonato@minervasys.tech>
 <5eb9fa24-c95e-4ea0-84ef-be74c629c106@xen.org>
 <CAG+AhRW5Xxy7BHVhmfkBqbdeKqRz7E1Mrc7wNv6F+ecM4P_QPw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRW5Xxy7BHVhmfkBqbdeKqRz7E1Mrc7wNv6F+ecM4P_QPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Carlo,

On 05/01/2024 16:34, Carlo Nonato wrote:
> On Thu, Jan 4, 2024 at 8:25 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Carlo,
>>
>> On 02/01/2024 09:51, Carlo Nonato wrote:
>>> This commit implements functions declared in the LLC coloring common header
>>> for arm64 and adds documentation. It also adds two command line options: a
>>> runtime switch for the cache coloring feature and the LLC way size
>>> parameter.
>>>
>>> The feature init function consists of an auto probing of the cache layout
>>> necessary to retrieve the LLC way size which is used to compute the number
>>> of platform colors. It also adds a debug-key to dump general cache coloring
>>> info.
>>>
>>> Static memory allocation and cache coloring are incompatible because static
>>> memory can't be guaranteed to use only colors assigned to the domain.
>>> Panic during domUs creation when both are enabled.
>>>
>>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>> ---
>>> v5:
>>> - used - instead of _ for filenames
>>> - moved static-mem check in this patch
>>> - moved dom0 colors parsing in next patch
>>> - moved color allocation and configuration in next patch
>>> - moved check_colors() in next patch
>>> - colors are now printed in short form
>>> v4:
>>> - added "llc-coloring" cmdline option for the boot-time switch
>>> - dom0 colors are now checked during domain init as for any other domain
>>> - fixed processor.h masks bit width
>>> - check for overflow in parse_color_config()
>>> - check_colors() now checks also that colors are sorted and unique
>>> ---
>>>    docs/misc/arm/cache-coloring.rst        |  97 ++++++++++++++
>>>    docs/misc/xen-command-line.pandoc       |  28 +++++
>>>    xen/arch/arm/Kconfig                    |   1 +
>>>    xen/arch/arm/Makefile                   |   1 +
>>>    xen/arch/arm/dom0less-build.c           |   6 +
>>>    xen/arch/arm/include/asm/llc-coloring.h |  28 +++++
>>>    xen/arch/arm/include/asm/processor.h    |  16 +++
>>>    xen/arch/arm/llc-coloring.c             | 161 ++++++++++++++++++++++++
>>>    xen/arch/arm/setup.c                    |   7 ++
>>>    9 files changed, 345 insertions(+)
>>>    create mode 100644 docs/misc/arm/cache-coloring.rst
>>>    create mode 100644 xen/arch/arm/include/asm/llc-coloring.h
>>>    create mode 100644 xen/arch/arm/llc-coloring.c
>>>
>>> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
>>> new file mode 100644
>>> index 0000000000..eabf8f5d1b
>>> --- /dev/null
>>> +++ b/docs/misc/arm/cache-coloring.rst
>>> @@ -0,0 +1,97 @@
>>> +Xen cache coloring user guide
>>> +=============================
>>> +
>>> +The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
>>> +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
>>> +
>>> +To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
>>> +
>>> +If needed, change the maximum number of colors with
>>> +``CONFIG_NR_LLC_COLORS=<n>``.
>>> +
>>> +Compile Xen and the toolstack and then configure it via
>>> +`Command line parameters`_.
>>> +
>>> +Background
>>> +**********
>>> +
>>> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
>>> +to each core (hence using multiple cache units), while the last level is shared
>>> +among all of them. Such configuration implies that memory operations on one
>>> +core (e.g. running a DomU) are able to generate interference on another core
>>> +(e.g .hosting another DomU). Cache coloring allows eliminating this
>>> +mutual interference, and thus guaranteeing higher and more predictable
>>> +performances for memory accesses.
>>> +The key concept underlying cache coloring is a fragmentation of the memory
>>> +space into a set of sub-spaces called colors that are mapped to disjoint cache
>>> +partitions. Technically, the whole memory space is first divided into a number
>>> +of subsequent regions. Then each region is in turn divided into a number of
>>> +subsequent sub-colors. The generic i-th color is then obtained by all the
>>> +i-th sub-colors in each region.
>>> +
>>> +::
>>> +
>>> +                            Region j            Region j+1
>>> +                .....................   ............
>>> +                .                     . .
>>> +                .                       .
>>> +            _ _ _______________ _ _____________________ _ _
>>> +                |     |     |     |     |     |     |
>>> +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
>>> +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
>>> +                    :                       :
>>> +                    :                       :...         ... .
>>> +                    :                            color 0
>>> +                    :...........................         ... .
>>> +                                                :
>>> +          . . ..................................:
>>> +
>>> +There are two pragmatic lesson to be learnt.
>>> +
>>> +1. If one wants to avoid cache interference between two domains, different
>>> +   colors needs to be used for their memory.
>>> +
>>> +2. Color assignment must privilege contiguity in the partitioning. E.g.,
>>> +   assigning colors (0,1) to domain I  and (2,3) to domain  J is better than
>>> +   assigning colors (0,2) to I and (1,3) to J.
>>> +
>>> +How to compute the number of colors
>>> +***********************************
>>> +
>>> +To compute the number of available colors for a specific platform, the size of
>>> +an LLC way and the page size used by Xen must be known.
>>
>> Looking at the get_llc_way_size(), you are using CLIDR_EL1 which doesn't
>> contains the system caches. They are invisible to the software but I
>> guess could have an impact for cache coloring.
>>
>> Can you clarify if by Last Cache Level, you mean the last visible cache?
> 
> We are targeting only Cortex-A53, A57 and A72 where the "last level" is L2.
> This "generic" approach for last level computation is inevitably problematic,
> but I think that defining it as the last visible cache is the best thing we
> can do. Remember also that this computation is overridable with the
> appropriate command line parameter, so it's still possible to target
> cache architectures that aren't discovered by this code (which are rare cases
> since cache-coloring is already a small niche).

I understand that and I don't mind which definition is chosen. I just 
want the documentation to be clear enough so there is little to no 
interpretation left.

[...]

>>> +    {
>>> +        printk(XENLOG_ERR "Number of LLC colors (%u) not in range [2, %u]\n",
>>> +               nr_colors, CONFIG_NR_LLC_COLORS);
>>> +        return false;
>>> +    }
>>> +
>>> +    register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +void domain_llc_coloring_free(struct domain *d)
>>> +{
>>> +    xfree(d->llc_colors);
>>> +}
>>> +
>>> +void domain_dump_llc_colors(struct domain *d)
>>> +{
>>> +    printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
>>> +    print_colors(d->llc_colors, d->num_llc_colors);
>>> +}
>>> +
>>> +/*
>>> + * Local variables:
>>> + * mode: C
>>> + * c-file-style: "BSD"
>>> + * c-basic-offset: 4
>>> + * tab-width: 4
>>> + * indent-tabs-mode: nil
>>> + * End:
>>> + */
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index 59dd9bb25a..4c16b566db 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -12,6 +12,7 @@
>>>    #include <xen/device_tree.h>
>>>    #include <xen/domain_page.h>
>>>    #include <xen/grant_table.h>
>>> +#include <xen/llc-coloring.h>
>>>    #include <xen/types.h>
>>>    #include <xen/string.h>
>>>    #include <xen/serial.h>
>>> @@ -746,6 +747,12 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
>>>        printk("Command line: %s\n", cmdline);
>>>        cmdline_parse(cmdline);
>>>
>>> +    if ( llc_coloring_enabled )
>>
>> I would consider to move llc_coloring_enabled in llc_coloring_init().
>> But if you prefer to keep the check here, then I would at least request
>> to merge the two ifs. I.e.
>>
>> if ( llc_coloring_enabled && !llc_coloring_init() )
>>
>> That said...
>>
>>> +    {
>>> +        if ( !llc_coloring_init() )
>>> +            panic("Xen LLC coloring support: setup failed\n");
>>> +    }
>>> +
>>>        setup_mm();
>>
>> ... shouldn't the coloring happen in setup_mm()? After all, this is part
>> of the memory subystem and I suspect this will not work with the
>> upcoming MPU support.
> 
> Coloring initialization must happen before setup_pagetables() otherwise it
> isn't possible to color the hypervisor code. In later patches
> setup_pagetables() is moved after coloring init so I don't think it would
> make sense to have it in setup_mm().

If you decide to move setup_page_tables() just close to setup_mm(). 
Then, I think the call should be moved to setup_mm().

I will have a look at the rest of the series and come back to this point.

Cheers,

-- 
Julien Grall

