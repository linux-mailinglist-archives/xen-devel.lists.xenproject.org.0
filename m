Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6593826B8A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 11:25:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663297.1033176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMmos-0002fp-A1; Mon, 08 Jan 2024 10:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663297.1033176; Mon, 08 Jan 2024 10:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMmos-0002dD-6d; Mon, 08 Jan 2024 10:25:22 +0000
Received: by outflank-mailman (input) for mailman id 663297;
 Mon, 08 Jan 2024 10:25:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rMmoq-0002d7-R3
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 10:25:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMmoq-0001mu-7T; Mon, 08 Jan 2024 10:25:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMmop-0003iW-Vj; Mon, 08 Jan 2024 10:25:20 +0000
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
	bh=D0ev2DsLt5lr/ttCw3wnM/n2NuzVc+e/9UmofoimqGA=; b=kmvhD1VuUCtrbWZ1fCd5SfTqa8
	MwPR7pUja8TwSqrexx3v4T4fhaIuX0CiIhCocfHLwA5J2dBpoB1piYSV9HxBNEKX4IXSTeQ6SL6cC
	XwxEjTFLCI9xln/vh8EfaQcWmb0nh1oAcQV7YZ+1HJMQGnU9EoBTWu6iEoFE8vWkvf1o=;
Message-ID: <4f8b3a59-c277-4f2e-a9de-82ea9ce2eda0@xen.org>
Date: Mon, 8 Jan 2024 10:25:17 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRVL8_YMkw+Z4EcTLZgM7m10+9DToSkaeNLMaFY3gcng7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 08/01/2024 10:06, Carlo Nonato wrote:
>> One of the reason is at least in the dom0less case, you will override
>> the value afterwards.
> 
> In that case I need to allocate the array before parsing the string.
> I allocate a full array then the string is parsed and the actual size is found
> at the end of this phase. Knowing the actual size would require two parsing
> stages. Yes I'm wasting a bit of memory by oversizing the array here. Is it
> a problem?

While wasting memory is indeed not nice. This wasn't the main reason of 
this comment.

The reason is that you seem to set d->num_lcc_colors will but will never 
be read before it gets overwritten. Looking again at the code, you are 
also assuming parse_colors() will always take an array of nr_colors.

It would be better if parse_colors() takes the maximum size of the array 
in parameter. This would harden the code and it makes more sense for 
domain_alloc_colors() to set d->num_lcc_colors.

Also, I just noticed you have a global variable named nr_colors and the 
function parse_colors() takes an argument called *num_colors. This is 
quite confusing, can we have better name?

Maybe rename nr_colors to nr_global_colors and and num_colors to 
nr_array_colors?

Cheers,

-- 
Julien Grall

