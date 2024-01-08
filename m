Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DB826CEE
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663416.1033327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnv9-0001d7-1R; Mon, 08 Jan 2024 11:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663416.1033327; Mon, 08 Jan 2024 11:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnv8-0001bC-VG; Mon, 08 Jan 2024 11:35:54 +0000
Received: by outflank-mailman (input) for mailman id 663416;
 Mon, 08 Jan 2024 11:35:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rMnv7-0001b6-BN
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:35:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMnv6-00036T-PN; Mon, 08 Jan 2024 11:35:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMnv6-0007Ns-IJ; Mon, 08 Jan 2024 11:35:52 +0000
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
	bh=vbwdwIR56jADIn4Qmvm63CH0eHn7B0flyZ60zerADYQ=; b=ywEZEx4u/7yj69x07AYJHN9Y7w
	PRh935BQAyCGI+lzJtnuwOnXSiPI0VDK0vleNvELezqGvVfEM/Bp+V9oDzgj0T31kTQiSV6v2gGIq
	bGU03AZe6tXwmGlJvAjJHw0jBNoz0+V+iaQkbielxw0+zJ7rqWaQ49mvB/ZnS1R4uTyM=;
Message-ID: <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org>
Date: Mon, 8 Jan 2024 11:35:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
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
 <20240102095138.17933-5-carlo.nonato@minervasys.tech>
 <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org>
 <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Carlo,

On 08/01/2024 11:19, Carlo Nonato wrote:
> Hi Julien,
> 
> On Mon, Jan 8, 2024 at 12:01 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Carlo,
>>
>> On 08/01/2024 10:27, Carlo Nonato wrote:
>>> On Fri, Jan 5, 2024 at 6:26 PM Julien Grall <julien@xen.org> wrote:
>>>> On 02/01/2024 09:51, Carlo Nonato wrote:
>>>>> This commit updates the domctl interface to allow the user to set cache
>>>>> coloring configurations from the toolstack.
>>>>> It also implements the functionality for arm64.
>>>>>
>>>>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>>>>
>>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>>>> ---
>>>>> v5:
>>>>> - added a new hypercall to set colors
>>>>> - uint for the guest handle
>>>>> v4:
>>>>> - updated XEN_DOMCTL_INTERFACE_VERSION
>>>>> ---
>>>>>     xen/arch/arm/llc-coloring.c    | 17 +++++++++++++++++
>>>>>     xen/common/domctl.c            | 11 +++++++++++
>>>>>     xen/include/public/domctl.h    | 10 +++++++++-
>>>>>     xen/include/xen/llc-coloring.h |  3 +++
>>>>>     4 files changed, 40 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
>>>>> index 5ce58aba70..a08614ec36 100644
>>>>> --- a/xen/arch/arm/llc-coloring.c
>>>>> +++ b/xen/arch/arm/llc-coloring.c
>>>>> @@ -9,6 +9,7 @@
>>>>>      *    Carlo Nonato <carlo.nonato@minervasys.tech>
>>>>>      */
>>>>>     #include <xen/errno.h>
>>>>> +#include <xen/guest_access.h>
>>>>>     #include <xen/keyhandler.h>
>>>>>     #include <xen/llc-coloring.h>
>>>>>     #include <xen/param.h>
>>>>> @@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
>>>>>         return domain_check_colors(d);
>>>>>     }
>>>>>
>>>>> +int domain_set_llc_colors_domctl(struct domain *d,
>>>>> +                                 const struct xen_domctl_set_llc_colors *config)
>>>>> +{
>>>>> +    if ( d->num_llc_colors )
>>>>> +        return -EEXIST;
>>>>> +
>>>>> +    if ( domain_alloc_colors(d, config->num_llc_colors) )
>>>>
>>>> domain_alloc_colors() doesn't sanity check config->num_llc_colors before
>>>> allocating the array. You want a check the size before so we would not
>>>> try to allocate an arbitrary amount of memory.
>>>>
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    if ( copy_from_guest(d->llc_colors, config->llc_colors,
>>>>> +                         config->num_llc_colors) )
>>>>> +        return -EFAULT;
>>>>> +
>>>>> +    return domain_check_colors(d);
>>>>> +}
>>>>> +
>>>>>     /*
>>>>>      * Local variables:
>>>>>      * mode: C
>>>>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>>>>> index f5a71ee5f7..b6867d0602 100644
>>>>> --- a/xen/common/domctl.c
>>>>> +++ b/xen/common/domctl.c
>>>>> @@ -8,6 +8,7 @@
>>>>>
>>>>>     #include <xen/types.h>
>>>>>     #include <xen/lib.h>
>>>>> +#include <xen/llc-coloring.h>
>>>>>     #include <xen/err.h>
>>>>>     #include <xen/mm.h>
>>>>>     #include <xen/sched.h>
>>>>> @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>>>                     __HYPERVISOR_domctl, "h", u_domctl);
>>>>>             break;
>>>>>
>>>>> +    case XEN_DOMCTL_set_llc_colors:
>>>>> +        if ( !llc_coloring_enabled )
>>>>> +            break;
>>>>> +
>>>>> +        ret = domain_set_llc_colors_domctl(d, &op->u.set_llc_colors);
>>>>> +        if ( ret == -EEXIST )
>>>>> +            printk(XENLOG_ERR
>>>>> +                   "Can't set LLC colors on an already created domain\n");
>>>>
>>>> To me, the message doesn't match the check in
>>>> domain_set_llc_colors_domctl(). But I think you want to check that no
>>>> memory was yet allocated to the domain. Otherwise, you coloring will be
>>>> wrong.
>>>>
>>>> Also, it is a bit unclear why you print a message for -EEXIST but not
>>>> the others. In this instance, I would consider to print nothing at all.
>>>
>>> The problem here is that we don't support recoloring. When a domain is
>>> created it receives a coloring configuration and it can't change. If this
>>> hypercall is called twice I have to stop the second time somehow.
>> Looking at your check what you prevent is a toolstack updating the array
>> twice. But that would be ok (/!\ I am not saying we should allow it) so
>> long no memory has been allocated to the domain.
>>
>> But I also consider we would re-color once we started to allocate memory
>> for the domain (either RAM or P2M). This seems to be missed out in your
>> check.
> 
> So you want to be able to change colors if no memory has yet been allocated?

No. I am saying that that we should not be able to allow changing the 
colors after the memory has been allocated. To give an example, your 
current code would allow:

   1) Setup the P2M pools or allocate RAM
   2) Set the color

This would render the coloring configuration moot.

Whether we want to allow changing the coloring before hand is a 
different question and as I wrote earlier on, I don't mind if you want 
to forbid that.

> I don't know what to check that.

You can check the size of the P2M pool (d->arch.paging.p2m_total_pages) 
is still 0. I think for RAM, you can check d->tot_pages == 0.

Cheers,

-- 
Julien Grall

