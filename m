Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B9D82AC55
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666138.1036625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsXo-0004ZF-PP; Thu, 11 Jan 2024 10:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666138.1036625; Thu, 11 Jan 2024 10:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNsXo-0004WV-Me; Thu, 11 Jan 2024 10:44:16 +0000
Received: by outflank-mailman (input) for mailman id 666138;
 Thu, 11 Jan 2024 10:44:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNsXn-0004WP-Vg
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:44:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNsXn-0002ol-7k; Thu, 11 Jan 2024 10:44:15 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNsXm-0007Wh-Vf; Thu, 11 Jan 2024 10:44:15 +0000
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
	bh=/NaCdFOeRBPXTsYcNlqEuqOGit/PLOF/lMB+OOgk/U8=; b=qf7xIXYie2Wc46rUULKRt0VTL5
	yVbrmps71UjVSrGCdiuSmyOyXL3bzojIn3buBQjmTrMrmm/rjk7dHlkTzkNoKI3Lc9mf4f/l+7yzX
	97OpY0u6rZ9YqNVzy199wHnhq6h4kbpT5V0eXCOX2UfrLrzhjFN+Mcm4+5C5fmXdw0CY=;
Message-ID: <c31bf4a3-979a-4445-905c-6a5545f8a36b@xen.org>
Date: Thu, 11 Jan 2024 10:44:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] xen/arm: add cache coloring initialization
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
 <CAG+AhRUw23a92v7geAwoDX-vqPLTPUEg3uoyOTThiUzL1CTk7w@mail.gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRUw23a92v7geAwoDX-vqPLTPUEg3uoyOTThiUzL1CTk7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/01/2024 10:17, Carlo Nonato wrote:
> Hi Julien,

Hi Carlo,

>>>> +bool __init llc_coloring_init(void)
>>>> +{
>>>> +    if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
>>>> +    {
>>>> +        printk(XENLOG_ERR
>>>> +               "Probed LLC way size is 0 and no custom value provided\n");
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * The maximum number of colors must be a power of 2 in order to correctly
>>>> +     * map them to bits of an address, so also the LLC way size must be so.
>>>> +     */
>>>> +    if ( llc_way_size & (llc_way_size - 1) )
>>>> +    {
>>>> +        printk(XENLOG_WARNING "LLC way size (%u) isn't a power of 2.\n",
>>>> +               llc_way_size);
>>>> +        llc_way_size = 1U << flsl(llc_way_size);
>>>> +        printk(XENLOG_WARNING
>>>> +               "Using %u instead. Performances will be suboptimal\n",
>>>> +               llc_way_size);
>>>> +    }
>>>> +
>>>> +    nr_colors = llc_way_size >> PAGE_SHIFT;
>>>> +
>>>> +    if ( nr_colors < 2 || nr_colors > CONFIG_NR_LLC_COLORS )
>>>
>>> I didn't find any documentation explaining why we need at least two
>>> colors. I guess you want to make sure that there is a color for Xen and
>>> domain. But I wonder what could wrong with just one color (other than
>>> been pointless)?
>>
>> Yes, it would just be pointless. I'll change it to 1.
> 
> Just wanted to correct myself here. Having just a single color introduces a
> clear sharing of the cache between Xen and domains. So it's not just
> pointless, but also inefficient. I would discourage such a configuration, so I
> plan to better describe this with a range in the Kconfig option (see
> discussion in #1).

I understand this could be inneficient. But you are also allowing the 
user to not specify the color configuration (at least for dom0less 
domain). So the colors would end up to shared with everyone (including Xen).

I don't particularly mind which way you want to go, but I think we need 
some coherency. If we want to avoid innefficiency, then we should 
prevent all the setups.

Cheers,

-- 
Julien Grall

