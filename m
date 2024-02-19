Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEF485AE59
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 23:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683125.1062472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcC22-0005ZT-GS; Mon, 19 Feb 2024 22:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683125.1062472; Mon, 19 Feb 2024 22:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcC22-0005WH-DK; Mon, 19 Feb 2024 22:22:38 +0000
Received: by outflank-mailman (input) for mailman id 683125;
 Mon, 19 Feb 2024 22:22:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcC21-0005W9-1x
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 22:22:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcC20-00017N-7M; Mon, 19 Feb 2024 22:22:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcC20-0004cj-0F; Mon, 19 Feb 2024 22:22:36 +0000
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
	bh=JJoNPuNJb1f0baOXVQ3UJzTLMq3ACZ6Sa57X+1/XLwY=; b=s0Kq6qYWYmE/ueZd89Hwrbsaj2
	3rCh0YUAMnWezjwIyLDMWG2MfTdv8q2QDNLBKAmy6BAKYEOPmgCjeywku06+NW/bBUYY1sMk3oM5A
	1ikiMWB58vraLvifUToXDj2NGu4E1IYWE5cjT73KzRm343qmRZdrdOZRWRaZC6gbMEp0=;
Message-ID: <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
Date: Mon, 19 Feb 2024 22:22:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Title: I would add 'gnttab:' to clarify which subsystem you are modifying.

On 05/02/2024 11:03, Jan Beulich wrote:
> Along the line with observations in the context of XSA-448, besides
> "op" no field is relevant when the range to be flushed is empty, much
> like e.g. the pointers passed to memcpy() are irrelevant (and would
> never be "validated") when the passed length is zero. Split the existing
> condition validating "op", "offset", and "length", leaving only the "op"
> part ahead of the check for length being zero (or no flushing to be
> performed).

I am probably missing something here. I understand the theory behind 
reducing the number of checks when len == 0. But an OS cannot rely on it:
   1) older hypervisor would still return an error if the check doesn't 
pass)
   2) it does feel odd to allow "invalid" offset when len == 0 (at least.

So to me, it is better to keep those checks early. That said, I agree 
this is a matter of opinion, so I will not Nack it but also I will not 
Ack it.

> 
> In the course of splitting also simplify the moved part of the condition
> from 3 to 2 conditionals, potentially (depending on the architecture)
> requiring one less (conditional) branch.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3528,15 +3528,16 @@ static int _cache_flush(const gnttab_cac
>       void *v;
>       int ret;
>   
> -    if ( (cflush->offset >= PAGE_SIZE) ||
> -         (cflush->length > PAGE_SIZE) ||
> -         (cflush->offset + cflush->length > PAGE_SIZE) ||
> -         (cflush->op & ~(GNTTAB_CACHE_INVAL | GNTTAB_CACHE_CLEAN)) )
> +    if ( cflush->op & ~(GNTTAB_CACHE_INVAL | GNTTAB_CACHE_CLEAN) )
>           return -EINVAL;
>   
>       if ( cflush->length == 0 || cflush->op == 0 )
>           return !*cur_ref ? 0 : -EILSEQ;
>   
> +    if ( (cflush->offset | cflush->length) > PAGE_SIZE ||

This is confusing. I understand you are trying to force the compiler to 
optimize. But is it really worth it? After all, the rest of operation 
will outweight this check (cache flush are quite expensive).

We probably should take a more generic decision (and encode in our 
policy) because you seem to like this pattern and I dislike it :). Not 
sure what the others think.

Cheers,

-- 
Julien Grall

