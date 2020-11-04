Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F102A609B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18941.44064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFDf-0000m3-HS; Wed, 04 Nov 2020 09:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18941.44064; Wed, 04 Nov 2020 09:36:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFDf-0000le-EI; Wed, 04 Nov 2020 09:36:43 +0000
Received: by outflank-mailman (input) for mailman id 18941;
 Wed, 04 Nov 2020 09:36:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaFDd-0000lZ-Mq
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:36:41 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54f9e01b-8461-4680-8f97-e5641947ce30;
 Wed, 04 Nov 2020 09:36:40 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFDa-00010C-8h; Wed, 04 Nov 2020 09:36:38 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaFDa-0001V1-0C; Wed, 04 Nov 2020 09:36:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Om8i=EK=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaFDd-0000lZ-Mq
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:36:41 +0000
X-Inumbo-ID: 54f9e01b-8461-4680-8f97-e5641947ce30
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 54f9e01b-8461-4680-8f97-e5641947ce30;
	Wed, 04 Nov 2020 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=A0+ZQVGuozAWyB0PwW/dYFCwPTxrpel0hU9EXFUcS1E=; b=pT4rYi48oYDIhLmwM4vrV4CrhG
	u8Sq3RKeHERMwrmC1TM3wzgWyZeOsArgDW/Hze8KGn7eKseCHxuTWB8wZ4Y1kUS7k+5c4dR+QRThI
	DjN5wrlTrNkTAMHSpVZsHJaehTkKbuO2m1XPWvScJ3QtUYtMg9fCUyLuHhcBsHmM64Nw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFDa-00010C-8h; Wed, 04 Nov 2020 09:36:38 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaFDa-0001V1-0C; Wed, 04 Nov 2020 09:36:38 +0000
Subject: Re: [PATCH v3 1/3] xen/spinlocks: spin_trylock with interrupts off is
 always fine
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201104081549.3712-1-jgross@suse.com>
 <20201104081549.3712-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6bb8bf65-782c-c569-1698-c00c24f44c09@xen.org>
Date: Wed, 4 Nov 2020 09:36:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104081549.3712-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/11/2020 08:15, Juergen Gross wrote:
> Even if a spinlock was taken with interrupts on before calling
> spin_trylock() with interrupts off is fine, as it can't block.
> 
> Add a bool parameter "try" to check_lock() for handling this case.
> 
> Remove the call of check_lock() from _spin_is_locked(), as it really
> serves no purpose and it can even lead to false crashes, e.g. when
> a lock was taken correctly with interrupts enabled and the call of
> _spin_is_locked() happened with interrupts off. In case the lock is
> taken with wrong interrupt flags this will be catched when taking
> the lock.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> V2:
> - corrected comment (Jan Beulich)
> ---
>   xen/common/spinlock.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index ce3106e2d3..b4aaf6bce6 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -13,7 +13,7 @@
>   
>   static atomic_t spin_debug __read_mostly = ATOMIC_INIT(0);
>   
> -static void check_lock(union lock_debug *debug)
> +static void check_lock(union lock_debug *debug, bool try)
>   {
>       bool irq_safe = !local_irq_is_enabled();
>   
> @@ -42,7 +42,13 @@ static void check_lock(union lock_debug *debug)
>        *
>        * To guard against this subtle bug we latch the IRQ safety of every
>        * spinlock in the system, on first use.
> +     *
> +     * A spin_trylock() with interrupts off is always fine, as this can't
> +     * block and above deadlock scenario doesn't apply.
>        */
> +    if ( try && irq_safe )
> +        return;
> +
>       if ( unlikely(debug->irq_safe != irq_safe) )
>       {
>           union lock_debug seen, new = { 0 };
> @@ -102,7 +108,7 @@ void spin_debug_disable(void)
>   
>   #else /* CONFIG_DEBUG_LOCKS */
>   
> -#define check_lock(l) ((void)0)
> +#define check_lock(l, t) ((void)0)
>   #define check_barrier(l) ((void)0)
>   #define got_lock(l) ((void)0)
>   #define rel_lock(l) ((void)0)
> @@ -159,7 +165,7 @@ void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
>       spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
>       LOCK_PROFILE_VAR;
>   
> -    check_lock(&lock->debug);
> +    check_lock(&lock->debug, false);
>       preempt_disable();
>       tickets.head_tail = arch_fetch_and_add(&lock->tickets.head_tail,
>                                              tickets.head_tail);
> @@ -220,8 +226,6 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
>   
>   int _spin_is_locked(spinlock_t *lock)
>   {
> -    check_lock(&lock->debug);
> -
>       /*
>        * Recursive locks may be locked by another CPU, yet we return
>        * "false" here, making this function suitable only for use in
> @@ -236,7 +240,7 @@ int _spin_trylock(spinlock_t *lock)
>   {
>       spinlock_tickets_t old, new;
>   
> -    check_lock(&lock->debug);
> +    check_lock(&lock->debug, true);
>       old = observe_lock(&lock->tickets);
>       if ( old.head != old.tail )
>           return 0;
> @@ -294,7 +298,7 @@ int _spin_trylock_recursive(spinlock_t *lock)
>       BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
>       BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
>   
> -    check_lock(&lock->debug);
> +    check_lock(&lock->debug, true);
>   
>       if ( likely(lock->recurse_cpu != cpu) )
>       {
> 

-- 
Julien Grall

