Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D080F598
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 19:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653395.1019871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD7ic-0007k1-Hj; Tue, 12 Dec 2023 18:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653395.1019871; Tue, 12 Dec 2023 18:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD7ic-0007iH-Di; Tue, 12 Dec 2023 18:42:58 +0000
Received: by outflank-mailman (input) for mailman id 653395;
 Tue, 12 Dec 2023 18:42:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD7ib-0007iB-4W
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 18:42:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD7ia-0005gO-TJ; Tue, 12 Dec 2023 18:42:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD7ia-00011S-Mc; Tue, 12 Dec 2023 18:42:56 +0000
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
	bh=TiGXERAqz5de0HgG5Jrqd61Stq1kw2Z09W26ISHeiGU=; b=dXHeMwS7Xcyg6qdWNCUGXuvgxx
	ilIpJzLaOWIR8hc1e9KwQLRJ/DGAbjMAWs0UaAPR8YL2jgb+JV6rTOFN7fyyAE74HOCDvbCDFtnNc
	tveQuwnjUBkLXAa9eJFTxJ5ycycYrpJyNtrjoh8it8U9byHZ81C/bh8FRSvT9pa9K8bM=;
Message-ID: <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>
Date: Tue, 12 Dec 2023 18:42:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-7-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/2023 09:47, Juergen Gross wrote:
> Struct lock_profile contains a pointer to the spinlock it is associated
> with. Prepare support of differing spinlock_t and rspinlock_t types by
> adding a type indicator of the pointer. Use the highest bit of the
> block_cnt member for this indicator in order to not grow the struct
> while hurting only the slow path with slightly less performant code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> V2:
> - new patch
> ---
>   xen/common/spinlock.c      | 26 +++++++++++++++++++-------
>   xen/include/xen/spinlock.h | 10 ++++++++--
>   2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index c1a9ba1304..7d611d3d7d 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -538,19 +538,31 @@ static void spinlock_profile_iterate(lock_profile_subfunc *sub, void *par)
>   static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
>       int32_t type, int32_t idx, void *par)
>   {
> -    struct spinlock *lock = data->lock;
> +    unsigned int cpu;
> +    uint32_t lockval;
> +
> +    if ( data->is_rlock )
> +    {
> +        cpu = data->rlock->debug.cpu;
> +        lockval = data->rlock->tickets.head_tail;
> +    }
> +    else
> +    {
> +        cpu = data->lock->debug.cpu;
> +        lockval = data->lock->tickets.head_tail;
> +    }
>   
>       printk("%s ", lock_profile_ancs[type].name);
>       if ( type != LOCKPROF_TYPE_GLOBAL )
>           printk("%d ", idx);
> -    printk("%s: addr=%p, lockval=%08x, ", data->name, lock,
> -           lock->tickets.head_tail);
> -    if ( lock->debug.cpu == SPINLOCK_NO_CPU )
> +    printk("%s: addr=%p, lockval=%08x, ", data->name, data->lock, lockval);
> +    if ( cpu == SPINLOCK_NO_CPU )
>           printk("not locked\n");
>       else
> -        printk("cpu=%d\n", lock->debug.cpu);
> -    printk("  lock:%" PRId64 "(%" PRI_stime "), block:%" PRId64 "(%" PRI_stime ")\n",
> -           data->lock_cnt, data->time_hold, data->block_cnt, data->time_block);
> +        printk("cpu=%u\n", cpu);
> +    printk("  lock:%" PRIu64 "(%" PRI_stime "), block:%" PRIu64 "(%" PRI_stime ")\n",
> +           data->lock_cnt, data->time_hold, (uint64_t)data->block_cnt,
> +           data->time_block);
>   }
>   
>   void cf_check spinlock_profile_printall(unsigned char key)
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index 05b97c1e03..ac3bef267a 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -76,13 +76,19 @@ union lock_debug { };
>   */
>   
>   struct spinlock;
> +/* Temporary hack until a dedicated struct rspinlock is existing. */
> +#define rspinlock spinlock
>   
>   struct lock_profile {
>       struct lock_profile *next;       /* forward link */
>       const char          *name;       /* lock name */
> -    struct spinlock     *lock;       /* the lock itself */
> +    union {
> +        struct spinlock *lock;       /* the lock itself */
> +        struct rspinlock *rlock;     /* the recursive lock itself */
> +    };
>       uint64_t            lock_cnt;    /* # of complete locking ops */
> -    uint64_t            block_cnt;   /* # of complete wait for lock */
> +    uint64_t            block_cnt:63; /* # of complete wait for lock */
> +    uint64_t            is_rlock:1;  /* use rlock pointer */

This is meant to act like a bool. So I would prefer if we use:

bool is_rwlock:1;

And then use true/false when set.

Acked-by: Julien Grall <jgrall@amazon.com>

>       s_time_t            time_hold;   /* cumulated lock time */
>       s_time_t            time_block;  /* cumulated wait time */
>       s_time_t            time_locked; /* system time of last locking */

Cheers,

-- 
Julien Grall

