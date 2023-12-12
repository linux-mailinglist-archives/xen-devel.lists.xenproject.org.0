Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143D880F5B5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 19:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653397.1019881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD7pF-0008Tu-51; Tue, 12 Dec 2023 18:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653397.1019881; Tue, 12 Dec 2023 18:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD7pF-0008SF-22; Tue, 12 Dec 2023 18:49:49 +0000
Received: by outflank-mailman (input) for mailman id 653397;
 Tue, 12 Dec 2023 18:49:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD7pD-0008S9-Pj
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 18:49:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD7pC-0005nE-Dx; Tue, 12 Dec 2023 18:49:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD7pC-0001Ki-7U; Tue, 12 Dec 2023 18:49:46 +0000
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
	bh=NMNulCSSY+fiJCBxWCg/1JfP0Db90hd5C3zG8wTWeME=; b=tyhtJ/s1ElIOByVM6vXcphBP2T
	tcb0VRNyK0Y0v+w4LggIDlUjz3scSm/1vSbSbAiySQoYODPjtqxOCnDrQWMePt9yHgAZV+TPWuNxY
	rYeYRbL+L6Avu/JsWU9mmf6LTpmI4i+ImCjqPPW3Z8Zg46CSV/fq92sijdfk3gjnr/qY=;
Message-ID: <c7a969af-274b-4e92-b083-56059cbc98d6@xen.org>
Date: Tue, 12 Dec 2023 18:49:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking
 functions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231212094725.22184-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/12/2023 09:47, Juergen Gross wrote:
> -#define spin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, spinlock_t)
> -#define rspin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, rspinlock_t)
> +#define spin_lock_init_prof(s, l)                                             \
> +    __spin_lock_init_prof(s, l, lock, spinlock_t, 0)
> +#define rspin_lock_init_prof(s, l)                                            \
> +    __spin_lock_init_prof(s, l, rlock, rspinlock_t, 1)
>   
>   void _lock_profile_register_struct(
>       int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
> @@ -174,6 +179,7 @@ struct lock_profile_qhead { };
>   
>   #endif
>   
> +

Spurious change?

>   typedef union {
>       uint32_t head_tail;
>       struct {
> @@ -261,4 +267,12 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
>   /* Ensure a lock is quiescent between two critical operations. */
>   #define spin_barrier(l)               _spin_barrier(l)
>   
> +#define nrspin_trylock(l)    spin_trylock(l)
> +#define nrspin_lock(l)       spin_lock(l)
> +#define nrspin_unlock(l)     spin_unlock(l)
> +#define nrspin_lock_irq(l)   spin_lock_irq(l)
> +#define nrspin_unlock_irq(l) spin_unlock_irq(l)
> +#define nrspin_lock_irqsave(l, f)      spin_lock_irqsave(l, f)
> +#define nrspin_unlock_irqrestore(l, f) spin_unlock_irqrestore(l, f)

There is a comment describing [r]spinlock but not this new variant. Can 
you add one?

That said, I know this is existing code, but I have to admit this is a 
bit unclear why we are allowing an recursive spinlock to be 
non-recursive. To me it sounds like we are making the typesafe not very 
safe because it doesn't guarantee that we are not mixing the call 
nrspin_* with rspin_*.

Cheers,

-- 
Julien Grall

