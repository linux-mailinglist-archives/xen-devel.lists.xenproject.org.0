Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3218231F6B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 15:38:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0mHI-0000CI-Q5; Wed, 29 Jul 2020 13:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQvr=BI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k0mHG-0000CD-W1
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 13:37:51 +0000
X-Inumbo-ID: b1f319e2-d1a0-11ea-a9dd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f319e2-d1a0-11ea-a9dd-12813bfff9fa;
 Wed, 29 Jul 2020 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z8E+vyWXWo0n5LO3YM0SyvNsPVMjLfOwh8ImNv99O2A=; b=LRvUhClPw8bGd2TT2GQ2/iWvLZ
 e3VXIFFfWdAc+PXNdOBHSnUXrwH1hGL/MS9lG9t4yCUxKUNfu/MxWijHtR2oEhUUb/WHQDEQZRww1
 t1UvF/kzm+niglPtO3fvpaELZSI7bYD3ETA4SNl60W+oABeMlMNZdWcUFMLYVAIHbj2I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0mHD-0000h4-6h; Wed, 29 Jul 2020 13:37:47 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0mHC-00070X-Tq; Wed, 29 Jul 2020 13:37:47 +0000
Subject: Re: [PATCH] xen/spinlock: move debug helpers inside the locked regions
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200729111330.64549-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <16dd0f04-598b-8b84-8a25-6b89af9214d7@xen.org>
Date: Wed, 29 Jul 2020 14:37:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729111330.64549-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 29/07/2020 12:13, Roger Pau Monne wrote:
> Debug helpers such as lock profiling or the invariant pCPU assertions
> must strictly be performed inside the exclusive locked region, or else
> races might happen.
> 
> Note the issue was not strictly introduced by the pointed commit in
> the Fixes tag, since lock stats where already incremented before the
> barrier, but that commit made it more apparent as manipulating the cpu
> field could happen outside of the locked regions and thus trigger the
> BUG_ON.

 From the wording, it is not entirely clear which BUG_ON() you are 
referring to. I am guessing, it is the one in rel_lock(). Am I correct?

Otherwise, the change looks good to me.

Cheers,

> This is only enabled on debug builds, and thus releases are
> not affected.
> 
> Fixes: 80cba391a35 ('spinlocks: in debug builds store cpu holding the lock')
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/common/spinlock.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 17f4519fc7..ce3106e2d3 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -170,9 +170,9 @@ void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
>               cb(data);
>           arch_lock_relax();
>       }
> +    arch_lock_acquire_barrier();
>       got_lock(&lock->debug);
>       LOCK_PROFILE_GOT;
> -    arch_lock_acquire_barrier();
>   }
>   
>   void _spin_lock(spinlock_t *lock)
> @@ -198,9 +198,9 @@ unsigned long _spin_lock_irqsave(spinlock_t *lock)
>   
>   void _spin_unlock(spinlock_t *lock)
>   {
> -    arch_lock_release_barrier();
>       LOCK_PROFILE_REL;
>       rel_lock(&lock->debug);
> +    arch_lock_release_barrier();
>       add_sized(&lock->tickets.head, 1);
>       arch_lock_signal();
>       preempt_enable();
> @@ -249,15 +249,15 @@ int _spin_trylock(spinlock_t *lock)
>           preempt_enable();
>           return 0;
>       }
> +    /*
> +     * cmpxchg() is a full barrier so no need for an
> +     * arch_lock_acquire_barrier().
> +     */
>       got_lock(&lock->debug);
>   #ifdef CONFIG_DEBUG_LOCK_PROFILE
>       if (lock->profile)
>           lock->profile->time_locked = NOW();
>   #endif
> -    /*
> -     * cmpxchg() is a full barrier so no need for an
> -     * arch_lock_acquire_barrier().
> -     */
>       return 1;
>   }
>   
> 

-- 
Julien Grall

