Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB8A7F7AE3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 18:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640883.999658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6aSj-0003Hv-EE; Fri, 24 Nov 2023 17:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640883.999658; Fri, 24 Nov 2023 17:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6aSj-0003FG-BU; Fri, 24 Nov 2023 17:59:33 +0000
Received: by outflank-mailman (input) for mailman id 640883;
 Fri, 24 Nov 2023 17:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AaTM=HF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6aSh-0003F8-Ss
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 17:59:31 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b713ef-8af3-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 18:59:29 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso16954455e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 09:59:29 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b0040b398f0585sm3170863wms.9.2023.11.24.09.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 09:59:28 -0800 (PST)
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
X-Inumbo-ID: 36b713ef-8af3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700848769; x=1701453569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wxAXdmSwpm2R9yrwS5cfY6Sni7L/o0evldgQ9HaTnE=;
        b=dJNpxXcabREHs+AS0/j4m/XqVwMV2QLfSYmC2z2hq/UYwgdDZpfnZp89d8lT4NtHOn
         +5Z+z8VW+n3wovwCLahKPm1GG08F5nYnkOmnS1ZggnJl+GysGTAjrzd+QJnZOuiRtNUU
         xAr5PsE0S/BQl9smsd103B/1kimA10AyVu7ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700848769; x=1701453569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wxAXdmSwpm2R9yrwS5cfY6Sni7L/o0evldgQ9HaTnE=;
        b=CggpCP2C7tdxpYW0+J+Vt+gGjCFlKTkGyOGFKM7AR47ZWSFnApWSr9G7DuGn4CFnK2
         4q5AGzrOFmgom6nQYn6v6LYp80yZWiBMEjxsALjeEkpgFd/xqvSLxzHAnUFXJEhpyjek
         eaR/XZHGHqbRpCGPk8BSF+/Bh2uOi6WWAjzRQH1VU3K99MLvmtSVinoiuYf8ljTjRHQZ
         PEmI346IJ9lfli1PVQ+12C4zqM2FcqB4q6Au0mhapW2DkvZpRICDdnhgGMoFKaQFZR+5
         nnq2rm94+o8mKQqQ0LdAIO+P8v14VoIbV6nBcymn9KVMDCPbusbdvCNmM/u/pUzx0Vdf
         CjSQ==
X-Gm-Message-State: AOJu0YzYb/wgdF+ccPXlZd59Q/NBE6QKyfuwvPIDzxLO6x0Dge4hG8JU
	pUbRKKry8QBKfcjvoNFZ73v5Xw==
X-Google-Smtp-Source: AGHT+IFn5al/rk794m0ld3VYp4vOLBziP8b1o9A9Nik65/1XKuJzjqip3xFN159waUc9MNqWvbwTpg==
X-Received: by 2002:a05:600c:45cf:b0:40a:25f1:7a28 with SMTP id s15-20020a05600c45cf00b0040a25f17a28mr2728598wmo.40.1700848768986;
        Fri, 24 Nov 2023 09:59:28 -0800 (PST)
Message-ID: <1d575e42-9b85-40da-8d96-0932ce98424f@cloud.com>
Date: Fri, 24 Nov 2023 17:59:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] xen/spinlock: reduce lock profile ifdefs
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-3-jgross@suse.com>
Content-Language: en-US
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20231120113842.5897-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/11/2023 11:38, Juergen Gross wrote:> With some small adjustments to the LOCK_PROFILE_* macros some #ifdefs
> can be dropped from spinlock.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> V3:
> - add variable name to macros parameter (Jan Beulich)
> ---
>   xen/common/spinlock.c | 49 +++++++++++++++++++------------------------
>   1 file changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index d7194e518c..ce18fbdd8a 100644
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -267,25 +267,28 @@ void spin_debug_disable(void)
>           lock->profile->time_hold += NOW() - lock->profile->time_locked;      \
>           lock->profile->lock_cnt++;                                           \
>       }
> -#define LOCK_PROFILE_VAR    s_time_t block = 0
> -#define LOCK_PROFILE_BLOCK  block = block ? : NOW();
> -#define LOCK_PROFILE_GOT                                                     \
> +#define LOCK_PROFILE_VAR(var, val)    s_time_t var = (val)
> +#define LOCK_PROFILE_BLOCK(var     )  var = var ? : NOW()nit: spaces before the closing parenthesis

And that's as far as I can complain on your changes. As for things that were
already present...

> +#define LOCK_PROFILE_BLKACC(tst, val)                                        \
> +    if ( tst )                                                               \
> +    {                                                                        \
> +        lock->profile->time_block += lock->profile->time_locked - (val);     \
> +        lock->profile->block_cnt++;                                          \
> +    }> +#define LOCK_PROFILE_GOT(val)                                                \
>       if ( lock->profile )                                                     \
>       {                                                                        \
>           lock->profile->time_locked = NOW();                                  \
> -        if ( block )                                                         \
> -        {                                                                    \
> -            lock->profile->time_block += lock->profile->time_locked - block; \
> -            lock->profile->block_cnt++;                                      \
> -        }                                                                    \
> +        LOCK_PROFILE_BLKACC(val, val);                                       \
>       }... these 2 probably want `lock` to be the first argument so they don't rely on
the variable "lock" to be in context, and...

>   
>   #else
>   
>   #define LOCK_PROFILE_REL
> -#define LOCK_PROFILE_VAR
> -#define LOCK_PROFILE_BLOCK
> -#define LOCK_PROFILE_GOT
> +#define LOCK_PROFILE_VAR(var, val)
> +#define LOCK_PROFILE_BLOCK(var)
> +#define LOCK_PROFILE_BLKACC(tst, val)
> +#define LOCK_PROFILE_GOT(val)... I'd feel better if these where actually statements rather than fully empty. i.e:
(void)0, or something like that. Then they would behave well in conditionals without
braces.

>   
>   #endif
>   
> @@ -308,7 +311,7 @@ static void always_inline spin_lock_common(spinlock_t *lock,
>                                              void (*cb)(void *), void *data)
>   {
>       spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
> -    LOCK_PROFILE_VAR;
> +    LOCK_PROFILE_VAR(block, 0);
>   
>       check_lock(&lock->debug, false);
>       preempt_disable();
> @@ -316,14 +319,14 @@ static void always_inline spin_lock_common(spinlock_t *lock,
>                                              tickets.head_tail);
>       while ( tickets.tail != observe_head(&lock->tickets) )
>       {
> -        LOCK_PROFILE_BLOCK;
> +        LOCK_PROFILE_BLOCK(block);
>           if ( cb )
>               cb(data);
>           arch_lock_relax();
>       }
>       arch_lock_acquire_barrier();
>       got_lock(&lock->debug);
> -    LOCK_PROFILE_GOT;
> +    LOCK_PROFILE_GOT(block);
>   }
>   
>   void _spin_lock(spinlock_t *lock)
> @@ -411,19 +414,15 @@ int _spin_trylock(spinlock_t *lock)
>        * arch_lock_acquire_barrier().
>        */
>       got_lock(&lock->debug);
> -#ifdef CONFIG_DEBUG_LOCK_PROFILE
> -    if ( lock->profile )
> -        lock->profile->time_locked = NOW();
> -#endif
> +    LOCK_PROFILE_GOT(0);
> +
>       return 1;
>   }
>   
>   void _spin_barrier(spinlock_t *lock)
>   {
>       spinlock_tickets_t sample;
> -#ifdef CONFIG_DEBUG_LOCK_PROFILE
> -    s_time_t block = NOW();
> -#endif
> +    LOCK_PROFILE_VAR(block, NOW());
>   
>       check_barrier(&lock->debug);
>       smp_mb();
> @@ -432,13 +431,7 @@ void _spin_barrier(spinlock_t *lock)
>       {
>           while ( observe_head(&lock->tickets) == sample.head )
>               arch_lock_relax();
> -#ifdef CONFIG_DEBUG_LOCK_PROFILE
> -        if ( lock->profile )
> -        {
> -            lock->profile->time_block += NOW() - block;
> -            lock->profile->block_cnt++;
> -        }
> -#endif
> +        LOCK_PROFILE_BLKACC(lock->profile, block);
>       }
>       smp_mb();
>   }
Besides the first nit, the others were already present and
the usage of the macros is very localised, so take it or
leave it. It's fairly inconsequential. Otherwise LGTM.


With the 1st nit sorted

   Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

