Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA32D4172
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 12:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48188.85212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmy31-000824-LX; Wed, 09 Dec 2020 11:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48188.85212; Wed, 09 Dec 2020 11:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmy31-00081f-HH; Wed, 09 Dec 2020 11:54:19 +0000
Received: by outflank-mailman (input) for mailman id 48188;
 Wed, 09 Dec 2020 11:54:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmy30-00081a-5j
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 11:54:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmy2x-0006cV-OR; Wed, 09 Dec 2020 11:54:15 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmy2x-0006Ab-H2; Wed, 09 Dec 2020 11:54:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=PZbvjGYPW+C80/qudm7L2NIELdMPGmRcgxQGTG5ezS0=; b=QdfpBPlyKvVVOJRp0xSTjqEFfy
	W24rD7BZOwTS4tDQW1/Cc5oG0sbDHwNGwFpTbAdjIUvG+bBtHlgHmMdxqBR4Wl1eCdcqWEiNNMnQg
	emvHnXYrO8TRir5ARPDrI6fRmlYsD+C0rcFv6js0JBysFmHLjEE5NvlGbD/DyMq3ezso=;
Subject: Re: [PATCH v3 4/5] evtchn: convert domain event lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <a333387e-f9e5-7051-569a-1a9a37da53ca@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <074be931-54b0-1b0f-72d8-5bd577884814@xen.org>
Date: Wed, 9 Dec 2020 11:54:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a333387e-f9e5-7051-569a-1a9a37da53ca@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/11/2020 13:29, Jan Beulich wrote:
> @@ -620,7 +620,7 @@ int evtchn_close(struct domain *d1, int
>       long           rc = 0;
>   
>    again:
> -    spin_lock(&d1->event_lock);
> +    write_lock(&d1->event_lock);
>   
>       if ( !port_is_valid(d1, port1) )
>       {
> @@ -690,13 +690,11 @@ int evtchn_close(struct domain *d1, int
>                   BUG();
>   
>               if ( d1 < d2 )
> -            {
> -                spin_lock(&d2->event_lock);
> -            }
> +                read_lock(&d2->event_lock);

This change made me realized that I don't quite understand how the 
rwlock is meant to work for event_lock. I was actually expecting this to 
be a write_lock() given there are state changed in the d2 events.

Could you outline how a developper can find out whether he/she should 
use read_lock or write_lock?

[...]

> --- a/xen/common/rwlock.c
> +++ b/xen/common/rwlock.c
> @@ -102,6 +102,14 @@ void queue_write_lock_slowpath(rwlock_t
>       spin_unlock(&lock->lock);
>   }
>   
> +void _rw_barrier(rwlock_t *lock)
> +{
> +    check_barrier(&lock->lock.debug);
> +    smp_mb();
> +    while ( _rw_is_locked(lock) )
> +        arch_lock_relax();
> +    smp_mb();
> +}

As I pointed out when this implementation was first proposed (see [1]), 
there is a risk that the loop will never exit.

I think the following implementation would be better (although it is ugly):

write_lock();
/* do nothing */
write_unlock();

This will act as a barrier between lock held before and after the call.

As an aside, I think the introduction of rw_barrier() deserve to be a in 
separate patch to help the review.

Cheers,

-- 
Julien Grall

