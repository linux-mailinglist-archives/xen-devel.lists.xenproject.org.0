Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35612826D15
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663435.1033367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMo3A-0005s7-MF; Mon, 08 Jan 2024 11:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663435.1033367; Mon, 08 Jan 2024 11:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMo3A-0005pS-J8; Mon, 08 Jan 2024 11:44:12 +0000
Received: by outflank-mailman (input) for mailman id 663435;
 Mon, 08 Jan 2024 11:44:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rMo39-0005p7-Fi
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:44:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMo38-0003JL-Te; Mon, 08 Jan 2024 11:44:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMo38-0007u3-N5; Mon, 08 Jan 2024 11:44:10 +0000
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
	bh=yqzUmS/z/NBCfC3q6Gb8gMvLbopglrtzffgQ1rp08cU=; b=u+DQn+y+f7gbBJ4zdRyg4LgS/a
	LfC2SUAVgXED+u2JxsCOXRWmlyCBhfXU8iNsHk+K3PIBzGU/90lsB2arxjR9cxItNXgHkCbgaYIPm
	xqo1sbMhLuM9PFpde6Q2A6K1ygBof7LFSYSwUzjCOPnvQHiyGeyNWCwyF9ZUyt9/UopY=;
Message-ID: <24e9adad-0f3d-4e0f-8202-33992718e9c3@xen.org>
Date: Mon, 8 Jan 2024 11:44:08 +0000
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
 <0905b0f4-9a5e-48c7-8764-58cdd440130f@xen.org>
 <CAG+AhRVL8_YMkw+Z4EcTLZgM7m10+9DToSkaeNLMaFY3gcng7Q@mail.gmail.com>
 <4f8b3a59-c277-4f2e-a9de-82ea9ce2eda0@xen.org>
 <CAG+AhRUE8MQjW=1rLsp79=MisUtjiB-5daXYz8S6-8JX6kAosA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRUE8MQjW=1rLsp79=MisUtjiB-5daXYz8S6-8JX6kAosA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/01/2024 11:04, Carlo Nonato wrote:
> Hi Julien,
> 
> On Mon, Jan 8, 2024 at 11:25 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Carlo,
>>
>> On 08/01/2024 10:06, Carlo Nonato wrote:
>>>> One of the reason is at least in the dom0less case, you will override
>>>> the value afterwards.
>>>
>>> In that case I need to allocate the array before parsing the string.
>>> I allocate a full array then the string is parsed and the actual size is found
>>> at the end of this phase. Knowing the actual size would require two parsing
>>> stages. Yes I'm wasting a bit of memory by oversizing the array here. Is it
>>> a problem?
>>
>> While wasting memory is indeed not nice. This wasn't the main reason of
>> this comment.
>>
>> The reason is that you seem to set d->num_lcc_colors will but will never
>> be read before it gets overwritten. Looking again at the code, you are
>> also assuming parse_colors() will always take an array of nr_colors.
> 
> Ok, I think I understood, but that happens only in dom0less case because
> d->num_llc_colors is overwritten after parsing. In other cases it's ok to set
> it there. Anyway I can move the assignment out of the function if that is
> clearer.
> 
>> It would be better if parse_colors() takes the maximum size of the array
>> in parameter. This would harden the code and it makes more sense for
>> domain_alloc_colors() to set d->num_lcc_colors.
> 
> I don't understand this. parse_colors() must take only arrays of nr_colors
> size (the global, maximum number of colors), otherwise the parsed string
> config could exceed the array size. Since we don't know in advance the real
> size before parsing, I think it's better to pass only arrays that are already
> allocated with the maximum size.

My concern is there is a disconnect. From the code, it is not obvious at 
all that parse_colors() only want to accept an array of nr_colors. If 
you pass an extra argument (or re-use the one you pass) for the array 
size and use within the code, then it makes more obvious that your array 
is always the correct size.

At least to me, this is a good practice in C to always pass the array 
and its size together (other language have that embedded). But I can 
appreciate this is not view like that for everyone. The minimum would be 
to document this requirement in a comment

> Doing as you said I would still pass nr_colors as the maximum size, but that
> would be strange since the global would still be accessible.

I don't really see the problem here. Your code doesn't need to use the 
global variable.

> If domain_alloc_colors() setting d->num_llc_colors is so confusing,
> I will just move the assignment after the function call.
> 
>> Also, I just noticed you have a global variable named nr_colors and the
>> function parse_colors() takes an argument called *num_colors. This is
>> quite confusing, can we have better name?
>>
>> Maybe rename nr_colors to nr_global_colors and and num_colors to
>> nr_array_colors?
> 
> I agree with the fact that naming is confusing. I would opt for max_nr_colors
> for the global.

I am fine with that.

Cheers,

-- 
Julien Grall

