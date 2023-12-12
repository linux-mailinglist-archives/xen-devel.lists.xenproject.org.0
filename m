Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73580EC2A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 13:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653055.1019295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD23K-0007fv-OT; Tue, 12 Dec 2023 12:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653055.1019295; Tue, 12 Dec 2023 12:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD23K-0007dD-LT; Tue, 12 Dec 2023 12:39:58 +0000
Received: by outflank-mailman (input) for mailman id 653055;
 Tue, 12 Dec 2023 12:39:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD23K-0007d7-5k
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 12:39:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD23K-0006Y0-2Z; Tue, 12 Dec 2023 12:39:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD23J-00036i-Tb; Tue, 12 Dec 2023 12:39:58 +0000
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
	bh=K6eOUXxhOh7y38HPVTOJqfzezXpkjDuR5mflNl0Qfg4=; b=GJJuEISXDkAEiAwm397Nchns9A
	M5JEPdkACu4XGgy930aIuzVxCOIaC4RB2fVXPXfnTgnwZeuh5itwsjfw98gEvD+OBVwA2m1OY6kZN
	/Hd1iNWrPm8IavArgXgn2Pi5pJFCwy1Tz6RrzI3Z+tg6BohrRkpKpiWzObKLg9Mk8hDM=;
Message-ID: <569bfdee-5d0b-4384-9dad-e2e90861d837@xen.org>
Date: Tue, 12 Dec 2023 12:39:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/2023 09:47, Juergen Gross wrote:
> Allow 16 bits per cpu number, which is the limit imposed by
> spinlock_tickets_t.
> 
> This will allow up to 65535 cpus, while increasing only the size of
> recursive spinlocks in debug builds from 8 to 12 bytes.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   xen/common/spinlock.c      |  1 +
>   xen/include/xen/spinlock.h | 18 +++++++++---------
>   2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 296bcf33e6..ae7c7c2086 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -481,6 +481,7 @@ int rspin_trylock(rspinlock_t *lock)
>   
>       /* Don't allow overflow of recurse_cpu field. */
>       BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
> +    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
>       BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
>   
>       check_lock(&lock->debug, true);
> diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
> index 87946965b2..d720778cc1 100644
> --- a/xen/include/xen/spinlock.h
> +++ b/xen/include/xen/spinlock.h
> @@ -7,16 +7,16 @@
>   #include <asm/system.h>
>   #include <asm/spinlock.h>
>   
> -#define SPINLOCK_CPU_BITS  12
> +#define SPINLOCK_CPU_BITS  16
>   
>   #ifdef CONFIG_DEBUG_LOCKS
>   union lock_debug {
> -    uint16_t val;
> -#define LOCK_DEBUG_INITVAL 0xffff
> +    uint32_t val;
> +#define LOCK_DEBUG_INITVAL 0xffffffff
>       struct {
> -        uint16_t cpu:SPINLOCK_CPU_BITS;
> -#define LOCK_DEBUG_PAD_BITS (14 - SPINLOCK_CPU_BITS)
> -        uint16_t :LOCK_DEBUG_PAD_BITS;
> +        uint32_t cpu:SPINLOCK_CPU_BITS;
> +#define LOCK_DEBUG_PAD_BITS (30 - SPINLOCK_CPU_BITS)
> +        uint32_t :LOCK_DEBUG_PAD_BITS;
>           bool irq_safe:1;
>           bool unseen:1;
>       };
> @@ -210,10 +210,10 @@ typedef struct spinlock {
>   
>   typedef struct rspinlock {
>       spinlock_tickets_t tickets;
> -    uint16_t recurse_cpu:SPINLOCK_CPU_BITS;
> +    uint16_t recurse_cpu;
>   #define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
> -#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
> -    uint16_t recurse_cnt:SPINLOCK_RECURSE_BITS;
> +#define SPINLOCK_RECURSE_BITS  8
> +    uint8_t recurse_cnt;

This patch is also bumping the number of recursion possible from 16 to 
256. It is not clear to me whether this was intended or you just wanted 
to use uint8_t because it was easy to use.

 From above, I also see that we only need 3 bits:

 > BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);

So I would consider to ...

>   #define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)

... update SPINLOCK_MAX_RECURSE to 16 or at least explain why we want to 
allow up to 256 recursion.

Cheers,

-- 
Julien Grall

