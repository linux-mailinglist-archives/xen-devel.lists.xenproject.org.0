Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A6ABDD5B
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990842.1374768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHO6z-0000R7-5q; Tue, 20 May 2025 14:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990842.1374768; Tue, 20 May 2025 14:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHO6z-0000OT-2E; Tue, 20 May 2025 14:38:33 +0000
Received: by outflank-mailman (input) for mailman id 990842;
 Tue, 20 May 2025 14:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHO6x-0000OI-F6
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:38:31 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 191daccc-3588-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 16:38:30 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad1f6aa2f84so1107833466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:38:30 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d49656bsm740208866b.136.2025.05.20.07.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:38:29 -0700 (PDT)
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
X-Inumbo-ID: 191daccc-3588-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747751910; x=1748356710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJWY8FxySyE47zyNsu5PJeWPggpA1cZSYnZCpQKf/rg=;
        b=ZFo9XUfv5E8kWXrRaIUuWb/M9yn7E1x/5LunDJMPSE2YgpNpx8ILQOcgLoMrMa4oxp
         aZtzmNw9/Ll2wxhAgN7lo1k4Lfh3wA+/yQsJvccHc9R3CkhX5q66zslTw9UOGYgYw/hZ
         9cAgNmoE/UKH9PPcoFkW9BZaei7GvpsaID00AcNy+XNELjYah7rytvNOVMkadI4nx1OM
         GJpKj1GuWrQR/lDNz4YkK6WELHBHn0gWZ5y5jsCodpBzG/pi1oesAtiIJn8lvNuw2yCn
         NiXBnNDcnD7JvZwkbm0YrCicNyYpZ+CHG2mQ6JxDt/5S2EYVIjYeM6PYy29XjLzGs/oj
         56Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751910; x=1748356710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJWY8FxySyE47zyNsu5PJeWPggpA1cZSYnZCpQKf/rg=;
        b=oML6I2aCMj/aUYED/nO0/HxQa7gcqckXE2gJwzSpRrGoma+e/JKllsIyEUZOXarqPe
         NkBH6UtWhTwPJTvZAgq7aKaFnfBxhuBssBi1HPIV31bzYU529fT51TwJ6kobkHlt6M33
         96i6m2E6WqVChYeISuUo8y7qc2Vbh/CDD38NfJ6mrciEeVR2dFL5+B1cFJT69EuPx/vD
         l19XmeVf3HmUfTe840c2aNIx0StkG322Bjl1nm7QZWUUMtY/E9hW9ShzPWiPvTFnCOS9
         xUNBAxRPyJIp8vZKnEyP/1xxiknD68vqV7Z4zibYJuyIQZtsrCgOCCmmF5DHZKXeaivr
         ZL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMvxSl5lBuMMIEvDsjRFRPTlbiHmHqHXr5e1FfM13yft18Y4tTGSXvgQrU6lrvkROyCRp0P+IfkQM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVSR4mpIO6IhxavJpl1NInQTeiR61bMarzb6tD5Zmh5eyAHIdR
	EDRSU/5mwRbZjylsVfgpp/7k/yjcwlVU8MyQHDvW0PQ02Msdj/tOVhcpVZLl1FaunA==
X-Gm-Gg: ASbGncsrTvj5GKdkAVekYKtvNjco6md9Jo4cv4ZJQF3faJK9i3BsejAXS+EQ145bU0f
	oiKzFOnVj4kIj5PgNqRU0md4BHM8NMtyBfOyRazYCSy28LV/YiENQAJHnt2hMxq81aYao+F8y8E
	T951aoo4pYh8SF71WuGNLHq7qbWFGzKhXCLOCGgb5287L2lQ014xfGhdZk/d96k1fGC5QYFWjn3
	gl7uMUdqPCsL4UUj2LPmFtF9ZGqTNdj3VIQ+C6t/7IHq4qQRxJfbb0+A4ylBMCr2PrZ6I/h5bGX
	6Zs6EhvP1WQytd8blReGkgHOx4dMJHiNuaEADIs/7hOeQx7O24oXKLqAno+arA==
X-Google-Smtp-Source: AGHT+IGgEmcThuhxBeQ+R/qliZyRZ8dcXMqB7aOo7tWMgNq/O2lEPn16Y5z+hqk9MlcGAM2Mrb2Q8w==
X-Received: by 2002:a17:907:2d87:b0:ad5:8593:2817 with SMTP id a640c23a62f3a-ad5859328abmr389211166b.6.1747751909688;
        Tue, 20 May 2025 07:38:29 -0700 (PDT)
Message-ID: <b0b4348e-38e5-4138-9e0b-3378f1207bfe@suse.com>
Date: Tue, 20 May 2025 16:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: construct the P2M pages pool for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <c9c60bb73fcae0b72d3bc18c10f5ca6cccc5a676.1746805907.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c9c60bb73fcae0b72d3bc18c10f5ca6cccc5a676.1746805907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 17:57, Oleksii Kurochko wrote:
> Implement p2m_set_allocation() to construct p2m pages pool for guests
> based on required number of pages.
> 
> This is implemented by:
> - Adding a `struct paging_domain` which contains a freelist, a
>   counter variable and a spinlock to `struct arch_domain` to
>   indicate the free p2m pages and the number of p2m total pages in
>   the p2m pages pool.
> - Adding a helper `p2m_set_allocation` to set the p2m pages pool
>   size. This helper should be called before allocating memory for
>   a guest and is called from domain_p2m_set_allocation(), the latter
>   is a part of common dom0less code.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

As already indicated in reply to patch 2, I expect this pool will want
introducing ahead of that.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1,4 +1,12 @@
>  #include <xen/domain_page.h>
> +/*
> + * Because of general_preempt_check() from xen/sched.h which uses
> + * local_events_need_delivery() but latter is declared in <asm/event.h>.
> + * Thereby it is needed to icnlude <xen/event.h> here before xen/sched.h.
> + *
> + * Shouldn't be xen/event.h be included in <xen/sched.h>?
> + */
> +#include <xen/event.h>

The question doesn't belong here; such could be put in the post-commit-
message area. And the answer depends on what dependency you found missing.

> @@ -166,3 +176,60 @@ int p2m_init(struct domain *d)
>  
>      return 0;
>  }
> +
> +/*
> + * Set the pool of pages to the required number of pages.
> + * Returns 0 for success, non-zero for failure.
> + * Call with d->arch.paging.lock held.
> + */
> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
> +{
> +    struct page_info *pg;
> +
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    for ( ; ; )
> +    {
> +        if ( d->arch.paging.p2m_total_pages < pages )
> +        {
> +            /* Need to allocate more memory from domheap */
> +            pg = alloc_domheap_page(d, MEMF_no_owner);
> +            if ( pg == NULL )
> +            {
> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
> +                return -ENOMEM;
> +            }
> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
> +                d->arch.paging.p2m_total_pages + 1;

Looks like you copied this from Arm, but this code is bogus: Using
ACCESS_ONCE() just on the lhs is pretty pointless. Once also used on the
rhs the expression can easily become

                ACCESS_ONCE(d->arch.paging.p2m_total_pages) += 1;

or even

                ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;

.

> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
> +        }
> +        else if ( d->arch.paging.p2m_total_pages > pages )
> +        {
> +            /* Need to return memory to domheap */
> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
> +            if( pg )
> +            {
> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
> +                    d->arch.paging.p2m_total_pages - 1;

Same here then, obviously.

> +                free_domheap_page(pg);
> +            }
> +            else
> +            {
> +                printk(XENLOG_ERR
> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
> +                return -ENOMEM;
> +            }
> +        }
> +        else
> +            break;
> +
> +        /* Check to see if we need to yield and try again */
> +        if ( preempted && general_preempt_check() )

While it's this way on both Arm and x86, I wonder how useful it is
to check on every iteration, especially when freeing pages back to the
buddy allocator.

Jan

