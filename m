Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69867F8515
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 21:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640927.999728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6cUT-0002Cu-3F; Fri, 24 Nov 2023 20:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640927.999728; Fri, 24 Nov 2023 20:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6cUT-0002B5-0P; Fri, 24 Nov 2023 20:09:29 +0000
Received: by outflank-mailman (input) for mailman id 640927;
 Fri, 24 Nov 2023 20:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AaTM=HF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6cUR-0002Az-93
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 20:09:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c85a013-8b05-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 21:09:24 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b30308c67so15524665e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 12:09:24 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b0040b3566e541sm6349355wms.36.2023.11.24.12.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 12:09:23 -0800 (PST)
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
X-Inumbo-ID: 5c85a013-8b05-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700856563; x=1701461363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjiF/+3RtO2be5aKBSNHz6DO4zrPB6uPcx1B7HlbWzc=;
        b=g+9e2Py1xJfQtqoN2Ndq1iO0xTNv1dWedGtES839/6T0MNvY7I4T1nqKgmD6atrd0l
         J9eeIbi2riC9Eqkbgn5ePJ1gbi3pZIpNfgOtvUr6o/ZYlyBo2ZOHsA6abfiMgFPnwXbQ
         rLDAfLS7zf6VIDfaYvZTzR8jd6vvMupy7TO/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700856563; x=1701461363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjiF/+3RtO2be5aKBSNHz6DO4zrPB6uPcx1B7HlbWzc=;
        b=QuhLI89HSOc5PARgcB3y2Huq2VuPtkt2Ss/oR15IbyVHjAergH4y55lro/wg39M55r
         vWHfwk8wVKxzTQgvn3PjnKCl3yH0Azx51EZwykasv43IPNTXnd3AYlc3xg2uZybwd/El
         3WFqrKghU/XAT+J11fHq6rYt5RLTqdEubFUVCbhxXBafpvRSJlg+YZbBplUFdrBE6B3Y
         z2/BZvX5s17aCn+y7QDY+A/z+E5b4cusDAiLlPVxo7L1la4GHy7DM61O1EAR0vduWFJp
         BU2VAMnBt4yZCQMObqa7lTePK17DR7HDxNWNQGW836vystrgA8SRfG4zwv0t+mfxXtYP
         U0Uw==
X-Gm-Message-State: AOJu0YzVdik7EPwywyLCvN2xZXIkSx/e7I31z/5TVhXlAnZZ7U1utYBN
	u54nCQz3/KTPEsajFmgHaG7Xlw==
X-Google-Smtp-Source: AGHT+IG6zZ85zrfuYwyv/cO4urvYiZYm1MfCaS3QWLga7KaA6L2jKpFDViwvZ/xR7RpPVrDuWC9Mjg==
X-Received: by 2002:a05:600c:474d:b0:405:3885:490a with SMTP id w13-20020a05600c474d00b004053885490amr3547963wmo.0.1700856563449;
        Fri, 24 Nov 2023 12:09:23 -0800 (PST)
Message-ID: <cb7ea607-b73d-4cc2-b680-fb953f8d445b@cloud.com>
Date: Fri, 24 Nov 2023 20:09:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231120113842.5897-1-jgross@suse.com>
 <20231120113842.5897-8-jgross@suse.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20231120113842.5897-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2023 11:38, Juergen Gross wrote:
> Struct lock_profile contains a pointer to the spinlock it is associated
> with. Prepare support of differing spinlock_t and rspinlock_t types by
> adding a type indicator of the pointer. Use the highest bit of the
> block_cnt member for this indicator in order to not grow the struct
> while hurting only the slow path with slightly less performant code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   xen/common/spinlock.c      | 26 +++++++++++++++++++-------
>   xen/include/xen/spinlock.h | 10 ++++++++--
>   2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
> index 17716fc4eb..65f180203a 100644
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
> +    printk("%s: addr=%p, lockval=%08x, ", data->name, data->lock, lockval); > +    if ( cpu == SPINLOCK_NO_CPU )
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
> index 53f0f72ac4..5ada9dce3d 100644
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
> +        struct rspinlock *rlock;     /* the recursive lock itself * > +    };
>       uint64_t            lock_cnt;    /* # of complete locking ops */
> -    uint64_t            block_cnt;   /* # of complete wait for lock */
> +    uint64_t            block_cnt:63; /* # of complete wait for lock */
> +    uint64_t            is_rlock:1;  /* use rlock pointer */
>       s_time_t            time_hold;   /* cumulated lock time */
>       s_time_t            time_block;  /* cumulated wait time */
>       s_time_t            time_locked; /* system time of last locking */

LGTM.

Acked-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Cheers,
Alejandro

