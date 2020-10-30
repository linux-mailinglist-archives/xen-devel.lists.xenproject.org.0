Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828AE2A0951
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 16:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15980.39239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYW3I-0005tk-04; Fri, 30 Oct 2020 15:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15980.39239; Fri, 30 Oct 2020 15:10:51 +0000
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
	id 1kYW3H-0005tL-Ss; Fri, 30 Oct 2020 15:10:51 +0000
Received: by outflank-mailman (input) for mailman id 15980;
 Fri, 30 Oct 2020 15:10:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYW3G-0005tG-4Z
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 15:10:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4a1de54-4467-4379-991a-01175b0c6f8f;
 Fri, 30 Oct 2020 15:10:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10C36AD32;
 Fri, 30 Oct 2020 15:10:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYW3G-0005tG-4Z
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 15:10:50 +0000
X-Inumbo-ID: b4a1de54-4467-4379-991a-01175b0c6f8f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b4a1de54-4467-4379-991a-01175b0c6f8f;
	Fri, 30 Oct 2020 15:10:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604070648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q+BpbjQ2SfuyFbxZlQdiPsxUobbrMhp7QTbdGzmKK5w=;
	b=aOZH7Se4XOhv7gSUOwhIGZxNVhnsGwW24dvi6vyYYPka04kJs3MaRSfIqF/NpWnpJyemcg
	td/Cg0VRASmAMZXZ/7dFtpq/HCpvoUzsSwOHk89XJfN6e3XiYKGaelQdrHf0Mf/wmt0vnH
	Rmm8ltSnHKqfx6xp9lAncFZ4KCz+z3E=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 10C36AD32;
	Fri, 30 Oct 2020 15:10:48 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen/rwlock: add check_lock() handling to rwlocks
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201030142500.5464-1-jgross@suse.com>
 <20201030142500.5464-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <239c8495-46fb-122a-be69-6aee98a3ea82@suse.com>
Date: Fri, 30 Oct 2020 16:10:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201030142500.5464-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.10.2020 15:25, Juergen Gross wrote:
> --- a/xen/include/xen/rwlock.h
> +++ b/xen/include/xen/rwlock.h
> @@ -65,7 +65,11 @@ static inline int _read_trylock(rwlock_t *lock)
>           * arch_lock_acquire_barrier().
>           */
>          if ( likely(_can_read_lock(cnts)) )
> +        {
> +            check_lock(&lock->lock.debug, true);
>              return 1;
> +        }

Why not unconditionally earlier in the function?

> @@ -87,7 +91,10 @@ static inline void _read_lock(rwlock_t *lock)
>       * arch_lock_acquire_barrier().
>       */
>      if ( likely(_can_read_lock(cnts)) )
> +    {
> +        check_lock(&lock->lock.debug, false);
>          return;
> +    }
>  
>      /* The slowpath will decrement the reader count, if necessary. */
>      queue_read_lock_slowpath(lock);

I guess doing so here and ...

> @@ -162,7 +169,10 @@ static inline void _write_lock(rwlock_t *lock)
>       * arch_lock_acquire_barrier().
>       */
>      if ( atomic_cmpxchg(&lock->cnts, 0, _write_lock_val()) == 0 )
> +    {
> +        check_lock(&lock->lock.debug, false);
>          return;
> +    }
>  
>      queue_write_lock_slowpath(lock);

... here is okay, as the slow paths have checks anyway.

> @@ -205,6 +215,8 @@ static inline int _write_trylock(rwlock_t *lock)
>          return 0;
>      }
>  
> +    check_lock(&lock->lock.debug, true);

But here I again think it wants moving up.

Jan

