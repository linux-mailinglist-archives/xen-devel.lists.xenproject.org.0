Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDA27D1561
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619910.965762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttq0-0006kg-7K; Fri, 20 Oct 2023 18:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619910.965762; Fri, 20 Oct 2023 18:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qttq0-0006j1-4U; Fri, 20 Oct 2023 18:03:08 +0000
Received: by outflank-mailman (input) for mailman id 619910;
 Fri, 20 Oct 2023 18:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkgR=GC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qttpy-0006cl-CC
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:03:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea66109c-6f72-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 20:03:04 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso172533466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Oct 2023 11:03:04 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s16-20020a170906bc5000b009b95b46bbd1sm1925545ejv.133.2023.10.20.11.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 11:03:03 -0700 (PDT)
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
X-Inumbo-ID: ea66109c-6f72-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697824984; x=1698429784; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXklF69dQjqD6WW2eyjT9Oj3bHKP/tvaQb21x7Nl+6g=;
        b=lgaokcu5l7X5yQx4gCoh1IbbOm1OS61cz9DznlA1S9LR9Mq42SgyqPwvQ0CQGrxgWE
         u2jhG6WOGKVZFfSvFogC5dKq2FNf6TQlVsuoclnOC6PhZ+qvwqRrl2haCemsj8/PcDWz
         FYMEmD/4cueywZCTqvfPtPjeePiBW3YuZE2To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697824984; x=1698429784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXklF69dQjqD6WW2eyjT9Oj3bHKP/tvaQb21x7Nl+6g=;
        b=QCgl7k66kDIiB0iRpAqBIaOoZzNoxjllzD1TEKuZ0r/VEs/fGxFYcv1izs0Ts+NKwa
         ul9Hw+qCeZkI6X+31qLDVhd4FfAKAxZWQgJ5wLCG2JbfB4NqVXIkgEXflOx775D4dbC3
         u2NLRX4M3x1kCEp9TCC43i4+ko/Od5/QmM3ZjnlMUbYP8YVRvRrzPa7SXi90RgPL2xs0
         9sc9p2OT/p50i7QHFBC2509GnXKHLyMgbchKrzt4WjXsbRVFlbMr+osUtYjp8mhM1qsa
         4nVpW/dc5dLSXQYA0tUymRt3G+Dt7762LYY4/FwOB62FvXfQPYXvsqU1eTCdnGVSw/sa
         x7RA==
X-Gm-Message-State: AOJu0YwgqWgGvCoCbSnYlYl8GyjSH+hY8gS35lnlEaOCR4Va9ZRWuivH
	xqzW+j8+lUACOWlzmDQXVsM5EQ==
X-Google-Smtp-Source: AGHT+IEmk6HntFok9y15A6utNLRg2AeC74Uj0QPqPjD133CydkgthYbhEsIbM4czfPZHtn13B4qRHg==
X-Received: by 2002:a17:907:d505:b0:9ae:73ca:bbad with SMTP id wb5-20020a170907d50500b009ae73cabbadmr1581554ejc.43.1697824983903;
        Fri, 20 Oct 2023 11:03:03 -0700 (PDT)
Message-ID: <d1284225-8cca-4f5a-911e-8ebdc0336356@citrix.com>
Date: Fri, 20 Oct 2023 19:03:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231019112314.22665-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231019112314.22665-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2023 12:23 pm, Juergen Gross wrote:
> When moving a domain out of a cpupool running with the credit2
> scheduler and having multiple run-queues, the following ASSERT() can
> be observed:
>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04023a700>] R credit2.c#csched2_unit_remove+0xe3/0xe7
> (XEN)    [<ffff82d040246adb>] S sched_move_domain+0x2f3/0x5b1
> (XEN)    [<ffff82d040234cf7>] S cpupool.c#cpupool_move_domain_locked+0x1d/0x3b
> (XEN)    [<ffff82d040236025>] S cpupool_move_domain+0x24/0x35
> (XEN)    [<ffff82d040206513>] S domain_kill+0xa5/0x116
> (XEN)    [<ffff82d040232b12>] S do_domctl+0xe5f/0x1951
> (XEN)    [<ffff82d0402276ba>] S timer.c#timer_lock+0x69/0x143
> (XEN)    [<ffff82d0402dc71b>] S pv_hypercall+0x44e/0x4a9
> (XEN)    [<ffff82d0402012b7>] S lstar_enter+0x137/0x140
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) Assertion 'svc->rqd == c2rqd(sched_unit_master(unit))' failed at common/sched/credit2.c:1159
> (XEN) ****************************************
>
> This is happening as sched_move_domain() is setting a different cpu
> for a scheduling unit without telling the scheduler. When this unit is
> removed from the scheduler, the ASSERT() will trigger.
>
> In non-debug builds the result is usually a clobbered pointer, leading
> to another crash a short time later.
>
> Fix that by swapping the two involved actions (setting another cpu and
> removing the unit from the scheduler).
>
> Cc: Henry Wang <Henry.Wang@arm.com>
> Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupools with different granularity")

Link: https://github.com/Dasharo/dasharo-issues/issues/488

And a Reported/Tested-by if the discoverer wishes.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> This fixes a regression introduced in Xen 4.15. The fix is very simple
> and it will affect only configurations with multiple cpupools. I think
> whether to include it in 4.18 should be decided by the release manager
> based on the current state of the release (I think I wouldn't have
> added it that late in the release while being the release manager).
> ---
>  xen/common/sched/core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 12deefa745..e9f7486197 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -738,12 +738,13 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>      new_p = cpumask_first(d->cpupool->cpu_valid);
>      for_each_sched_unit ( d, unit )
>      {
> -        spinlock_t *lock = unit_schedule_lock_irq(unit);
> +        spinlock_t *lock;
> +
> +        sched_remove_unit(old_ops, unit);
>  
> +        lock = unit_schedule_lock_irq(unit);
>          sched_set_res(unit, get_sched_res(new_p));
>          spin_unlock_irq(lock);
> -
> -        sched_remove_unit(old_ops, unit);

I'm happy to see the T-by, and that you know what's going on here, but I
don't understand the explanation.

The change here is the ordering of sched_remove_unit() with respect to
the lock/get&set/unlock block.

remove unit is moderately complicated, but the get&set is just an RCU
pointer assignment.  But as the assertion fires in the latter action, it
must be the get&set causing problems.

And that's because new_p is actually a cpu number, which has the
consequence of causing Credit2's c2rqd() to materialise the wrong
csched2_runqueue_data pointer, and then we're operating on someone
else's data without a suitable lock held.

And it's only by luck that none of the other schedulers tie something to
per-cpu data like this?


Other observations.

I think sched_move_domain() would be easier to follow with
s/new_p/new_cpu/ (and similar for unit_p) as "p" is not obviously
processor unless you notice the cpumask_first() calls.

Why do we move a domain back to cpupool0 on domain destroy?  There's
nothing magic about cpupool0 that I'm aware of here.  It seems like
unnecessary complexity.

~Andrew

