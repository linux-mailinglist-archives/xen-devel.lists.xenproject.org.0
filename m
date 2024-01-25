Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243C83CAEF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 19:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671718.1045214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4Qx-0000wb-NF; Thu, 25 Jan 2024 18:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671718.1045214; Thu, 25 Jan 2024 18:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT4Qx-0000v2-K5; Thu, 25 Jan 2024 18:26:39 +0000
Received: by outflank-mailman (input) for mailman id 671718;
 Thu, 25 Jan 2024 18:26:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rT4Qw-0000uw-1d
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 18:26:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4Qv-00026t-8c; Thu, 25 Jan 2024 18:26:37 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.5.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rT4Qv-0007Vo-3A; Thu, 25 Jan 2024 18:26:37 +0000
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
	bh=7d+MbCETnagjlE54CNi1Kd+FcS46f6lvW1HGuk+vg8c=; b=Ie6T0LWF5xivqSVxl352dfNWO4
	RYJh2k2UVjhyNBLs34WBNuSq3r/V7ohOZhVS8/1+xZCwlmE9cqvjBrLcm+XljcUrc5Tif+0+tA/y4
	cdTaTAJebtChB3uRPUgjDHs2MVtm6kRcjFtRTWdtPh71jmtEettk7/yK1Lvw5O+erkDE=;
Message-ID: <29f00ed3-d030-4875-905e-ccaba3d6e308@xen.org>
Date: Thu, 25 Jan 2024 18:26:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] xen/common: add cache coloring common code
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-2-carlo.nonato@minervasys.tech>
 <1ac0e50d-0551-4abb-a929-03d5b0be25c1@xen.org>
 <alpine.DEB.2.22.394.2401041343100.1322202@ubuntu-linux-20-04-desktop>
 <CAG+AhRVJ7jnTzdaPMqJxOjsRMhLCN8OinRQYC=6-DYYc32vEpw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRVJ7jnTzdaPMqJxOjsRMhLCN8OinRQYC=6-DYYc32vEpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Carlo,

On 05/01/2024 16:32, Carlo Nonato wrote:
> Hi Stefano, Julien,
> 
> On Thu, Jan 4, 2024 at 10:43 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> On Thu, 4 Jan 2024, Julien Grall wrote:
>>> Hi,
>>>
>>> On 02/01/2024 09:51, Carlo Nonato wrote:
>>>> This commit adds the Last Level Cache (LLC) coloring common header, Kconfig
>>>> options and functions. Since this is an arch specific feature, actual
>>>> implementation is postponed to later patches and Kconfig options are placed
>>>> under xen/arch.
>>>>
>>>> LLC colors are a property of the domain, so the domain struct has to be
>>>> extended.
>>>>
>>>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
>>>>
>>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>>> ---
>>>> v5:
>>>> - used - instead of _ for filenames
>>>> - removed domain_create_llc_colored()
>>>> - removed stub functions
>>>> - coloring domain fields are now #ifdef protected
>>>> v4:
>>>> - Kconfig options moved to xen/arch
>>>> - removed range for CONFIG_NR_LLC_COLORS
>>>> - added "llc_coloring_enabled" global to later implement the boot-time
>>>>     switch
>>>> - added domain_create_llc_colored() to be able to pass colors
>>>> - added is_domain_llc_colored() macro
>>>> ---
>>>>    xen/arch/Kconfig               | 16 ++++++++++++
>>>>    xen/common/Kconfig             |  3 +++
>>>>    xen/common/domain.c            |  4 +++
>>>>    xen/common/keyhandler.c        |  4 +++
>>>>    xen/include/xen/llc-coloring.h | 46 ++++++++++++++++++++++++++++++++++
>>>>    xen/include/xen/sched.h        |  5 ++++
>>>>    6 files changed, 78 insertions(+)
>>>>    create mode 100644 xen/include/xen/llc-coloring.h
>>>>
>>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>>> index 67ba38f32f..aad7e9da38 100644
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -31,3 +31,19 @@ config NR_NUMA_NODES
>>>>        associated with multiple-nodes management. It is the upper bound of
>>>>        the number of NUMA nodes that the scheduler, memory allocation and
>>>>        other NUMA-aware components can handle.
>>>> +
>>>> +config LLC_COLORING
>>>> +   bool "Last Level Cache (LLC) coloring" if EXPERT
>>>
>>> While look at the rest of the series, I noticed that SUPPORT.md is not
>>> updated. Can this be done?
>>>
>>> I think the feature should be in experimental for now. We can decide to switch
>>> to tech preview before Xen 4.19 is out and the support is completed.
>>>
>>> Stefano, what do you think?
>>
>> That's reasonable
> 
> I would put it under "Resource management" features. Are you ok with it?

I think this wants to go under "## Memory Management". The section 
"Resource management" seems to be more related to the scheduler.

Cheers,

-- 
Julien Grall

