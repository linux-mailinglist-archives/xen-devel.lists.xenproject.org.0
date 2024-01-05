Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB09825967
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 18:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662288.1032352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoKo-0005EM-7C; Fri, 05 Jan 2024 17:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662288.1032352; Fri, 05 Jan 2024 17:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLoKo-0005Bn-4W; Fri, 05 Jan 2024 17:50:18 +0000
Received: by outflank-mailman (input) for mailman id 662288;
 Fri, 05 Jan 2024 17:50:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rLoKm-0005AO-Jh
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 17:50:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoKl-0003qm-Ol; Fri, 05 Jan 2024 17:50:15 +0000
Received: from [54.239.6.189] (helo=[192.168.15.166])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rLoKl-0008Bp-IL; Fri, 05 Jan 2024 17:50:15 +0000
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
	bh=F4FTVQ/CdV6mHXOiwbPqgQWqm1MO1+0VFe3vv1C2vCs=; b=IubX9K25POrmkEtG609NfoqUGB
	mXgnKhfTatSG2w9PZhaBKpq68deshsO7Dwk+RmTb6c24q6ft32mtPR9N/EmlJueq+zmES9/pxXt2c
	IaV8eQx4/ZllApUtdefURDUUk3NRLu353BA6pDYtBQF5It5eCRZy7BNK5n8jgwn3Tfvo=;
Message-ID: <0905b0f4-9a5e-48c7-8764-58cdd440130f@xen.org>
Date: Fri, 5 Jan 2024 17:50:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] xen/arm: add Dom0 cache coloring support
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
 <20240102095138.17933-4-carlo.nonato@minervasys.tech>
 <046e9949-d126-42b1-90a6-12af540d63bf@xen.org>
 <CAG+AhRWm4N7GV3HfkTNCvXQw7-6Woq=+zBqdHAgN=-PgGr-WRg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRWm4N7GV3HfkTNCvXQw7-6Woq=+zBqdHAgN=-PgGr-WRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/01/2024 16:52, Carlo Nonato wrote:
> Hi Julien,
> 
> On Thu, Jan 4, 2024 at 8:54 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Carlo,
>>
>> On 02/01/2024 09:51, Carlo Nonato wrote:
>>> This commit allows the user to set the cache coloring configuration for
>>> Dom0 via a command line parameter.
>>> Since cache coloring and static memory are incompatible, direct mapping
>>> Dom0 isn't possible when coloring is enabled.
>>>
>>> A common configuration syntax for cache colors is also introduced.
>>>
>>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>> ---
>>> v5:
>>> - Carlo Nonato as the new author
>>> - moved dom0 colors parsing (parse_colors()) in this patch
>>> - added dom0_set_llc_colors() to set dom0 colors after creation
>>> - moved color allocation and checking in this patch
>>> - error handling when allocating color arrays
>>> - FIXME: copy pasted allocate_memory() cause it got moved
>>> v4:
>>> - dom0 colors are dynamically allocated as for any other domain
>>>     (colors are duplicated in dom0_colors and in the new array, but logic
>>>     is simpler)
>>> ---
>>>    docs/misc/arm/cache-coloring.rst        |  29 ++++++
>>>    docs/misc/xen-command-line.pandoc       |   9 ++
>>>    xen/arch/arm/domain_build.c             |  60 ++++++++++-
>>>    xen/arch/arm/include/asm/llc-coloring.h |   1 +
>>>    xen/arch/arm/llc-coloring.c             | 128 ++++++++++++++++++++++++
>>>    5 files changed, 224 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
>>> index eabf8f5d1b..acf82c3df8 100644
>>> --- a/docs/misc/arm/cache-coloring.rst
>>> +++ b/docs/misc/arm/cache-coloring.rst
>>> @@ -84,6 +84,35 @@ More specific documentation is available at `docs/misc/xen-command-line.pandoc`.
>>>    +----------------------+-------------------------------+
>>>    | ``llc-way-size``     | set the LLC way size          |
>>>    +----------------------+-------------------------------+
>>> +| ``dom0-llc-colors``  | Dom0 color configuration      |
>>> ++----------------------+-------------------------------+
>>> +
>>> +Colors selection format
>>> +***********************
>>> +
>>> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
>>> +the color selection can be expressed using the same syntax. In particular a
>>> +comma-separated list of colors or ranges of colors is used.
>>> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
>>> +sides.
>>> +
>>> +Note that:
>>> +
>>> +- no spaces are allowed between values.
>>> +- no overlapping ranges or duplicated colors are allowed.
>>> +- values must be written in ascending order.
>>> +
>>> +Examples:
>>> +
>>> ++-------------------+-----------------------------+
>>> +| **Configuration** | **Actual selection**        |
>>> ++-------------------+-----------------------------+
>>> +| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
>>> ++-------------------+-----------------------------+
>>> +| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
>>> ++-------------------+-----------------------------+
>>> +| 0                 | [0]                         |
>>> ++-------------------+-----------------------------+
>>>
>>>    Known issues and limitations
>>>    ****************************
>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>> index 22d2d5b6cf..51f6adf035 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>>>
>>>    Specify a list of IO ports to be excluded from dom0 access.
>>>
>>> +### dom0-llc-colors (arm64)
>>> +> `= List of [ <integer> | <integer>-<integer> ]`
>>
>> Someone reading only xen-command-line.pandoc would not know how each
>> item of the list is separated. Can this be clarified?
> 
> Isn't it already known that the list is comma separated? It's written at the
> beginning of this file for the "List" type.
> I can also point to cache-coloring documentation if needed.

Ah I forgot that part. Please ignore this comment.

[...]

>>> +                return -EINVAL;
>>> +            for ( color = start; color <= end; color++ )
>>> +                colors[(*num_colors)++] = color;
>>> +        }
>>> +        else
>>> +            s++;
>>> +    }
>>> +
>>> +    return *s ? -EINVAL : 0;
>>> +}
>>> +
>>> +static int __init parse_dom0_colors(const char *s)
>>> +{
>>> +    return parse_color_config(s, dom0_colors, &dom0_num_colors);
>>> +}
>>> +custom_param("dom0-llc-colors", parse_dom0_colors);
>>> +
>>>    /* Return the LLC way size by probing the hardware */
>>>    static unsigned int __init get_llc_way_size(void)
>>>    {
>>> @@ -102,6 +159,28 @@ static void dump_coloring_info(unsigned char key)
>>>        printk("Number of LLC colors supported: %u\n", nr_colors);
>>>    }
>>>
>>> +static bool check_colors(unsigned int *colors, unsigned int num_colors)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    if ( num_colors > nr_colors )
>>> +    {
>>> +        printk(XENLOG_ERR "Number of LLC colors requested > %u\n", nr_colors);
>>> +        return false;
>>> +    }
>>> +
>>> +    for ( i = 0; i < num_colors; i++ )
>>> +    {
>>> +        if ( colors[i] >= nr_colors )
>>> +        {
>>> +            printk(XENLOG_ERR "LLC color %u >= %u\n", colors[i], nr_colors);
>>> +            return false;
>>> +        }
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>    bool __init llc_coloring_init(void)
>>>    {
>>>        if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
>>> @@ -150,6 +229,55 @@ void domain_dump_llc_colors(struct domain *d)
>>>        print_colors(d->llc_colors, d->num_llc_colors);
>>>    }
>>>
>>> +static int domain_alloc_colors(struct domain *d, unsigned int num_colors)
>>> +{
>>> +    d->num_llc_colors = num_colors;
>>
>> Shouldn't this be set *only* after the array was allocated?
> 
> Yes, it works also like I did, but it's cleaner like you said. 

Actually, looking at the rest of the code. I think  d->num_llc_colors 
should be set outside of domain_alloc_colors().

One of the reason is at least in the dom0less case, you will override 
the value afterwards.

Cheers,

-- 
Julien Grall

