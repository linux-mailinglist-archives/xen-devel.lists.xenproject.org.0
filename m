Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DE9AF8A07
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032931.1406348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbDp-0001OF-6S; Fri, 04 Jul 2025 07:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032931.1406348; Fri, 04 Jul 2025 07:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbDp-0001MP-1v; Fri, 04 Jul 2025 07:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1032931;
 Fri, 04 Jul 2025 07:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9FN=ZR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uXbDn-0000su-Nx
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:52:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8415bab-58ab-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:52:34 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4530921461aso4318825e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 00:52:34 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-453b8f298c6sm47131275e9.1.2025.07.04.00.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 00:52:32 -0700 (PDT)
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
X-Inumbo-ID: d8415bab-58ab-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751615553; x=1752220353; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qb+xAu3YeUpV5RvjjEIudGkh2dMCiquy2Yupl0+PDtI=;
        b=NS/uJ0AMjCCETy+wr19b7Jffv0i/fpPxZRhOpszv3WIFQHjj4iPdNN6SdLa28axHRU
         qIWlNyMkrrSg/qrK3lQewSpCwpIB63hH19Y6sXQ49T96L0KtR7K/nFtVpACpPmVgxY6Z
         35eovvl/ZouEIDsdC0gtLMfjjyCnC+8m4vTbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615553; x=1752220353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb+xAu3YeUpV5RvjjEIudGkh2dMCiquy2Yupl0+PDtI=;
        b=w22XtKJ77kCbdNy5Gcigno2/2gj+Ni8gBOimbbx5gh8YZYW+aVF3gBVYZ+rPjJaJ6R
         MUVBemlHkhG0fQPi2wpIW5xdxq6ur5pxQbHDk9bFW/rxOMZIsJH4IcucY5LIqUDM43w4
         Vy/cwtAQt/kITxHUwiJesd/8iqTrlyz6jXUT0oPq8QY6BpC2Jesoh/hFDmvsQRzrALU9
         2GnMlZN6bhFNV7kbeXichzsWjyJYFmjWkRkwh1PzlLsmNbI6wCNpVa/iCwqiIC2J494Q
         kCZlXlZBvmavoW8Gm+wSzW0xvDqeHC7cKlA46DNjHZmKroGCFlcEQkkrHO23HmIsm4YY
         sT3w==
X-Gm-Message-State: AOJu0Yxv7oAv/ETg8TEfzET6SdQV3KwUHhwcy5OEcI4T3gjYQCY+EV09
	0YC7S6XQ/Mc2yirAEiJpGATvhhiPYTgbTLaE2ponWd+naJ5mbuDb74VASbo9ACzdCITqsFexJpK
	rXnrF
X-Gm-Gg: ASbGncsEu/kcD/7RqZVFYwLOE6fQBmM5hHtOIXyH0sJZwIbLUfP3d4xDjW1P8Eh6wvi
	HxbkfwB23BA/Oyf8x/rW58bFALH9TVLwc8rrZ20IHhDywEOgbdV5MET8HOFiONeVEe/MohN8mWl
	vdqBySw82MFRJQBva7nCPL53MCCVFJ5tfNGp1JEuWY+LkdBv6zN85xxdW1Tk2rgTH7d2aqn6ZM9
	OBcdKuNUC8HW58bjunxT8c0AxOW39ADVHij70JzMgNzmTw6iCTFSJ3QBBi8lQEaGBSLJgKjQxYF
	diY3RmcOrKdFdF1mSLYsWUQtcoOQzQ7f9leqeuTmZJATeFzR1/f5HlKXV8XEZDW/fHuzk7k5RIn
	GYbyThXRLI+U0zvcNeOjxeF60t9MeVQ==
X-Google-Smtp-Source: AGHT+IGFZA1inP2lH+tQcU8UE/IC1eo2DEt5SH+TjPThHHNZdQ7vTQ6zHO8O90JMCBYa7F7I3PUvYw==
X-Received: by 2002:a05:600c:3b8b:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-454b3b331f7mr11261845e9.9.1751615553286;
        Fri, 04 Jul 2025 00:52:33 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:52:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/6] x86/idle: Implement a new MWAIT IPI-elision algorithm
Message-ID: <aGeIQLMQOS2ukft8@macbook.local>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702144121.1096448-5-andrew.cooper3@citrix.com>

On Wed, Jul 02, 2025 at 03:41:19PM +0100, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/include/asm/softirq.h b/xen/arch/x86/include/asm/softirq.h
> index e4b194f069fb..069e5716a68d 100644
> --- a/xen/arch/x86/include/asm/softirq.h
> +++ b/xen/arch/x86/include/asm/softirq.h
> @@ -1,6 +1,8 @@
>  #ifndef __ASM_SOFTIRQ_H__
>  #define __ASM_SOFTIRQ_H__
>  
> +#include <asm/system.h>
> +
>  #define NMI_SOFTIRQ            (NR_COMMON_SOFTIRQS + 0)
>  #define TIME_CALIBRATE_SOFTIRQ (NR_COMMON_SOFTIRQS + 1)
>  #define VCPU_KICK_SOFTIRQ      (NR_COMMON_SOFTIRQS + 2)
> @@ -9,4 +11,36 @@
>  #define HVM_DPCI_SOFTIRQ       (NR_COMMON_SOFTIRQS + 4)
>  #define NR_ARCH_SOFTIRQS       5
>  
> +/*
> + * Ensure softirq @nr is pending on @cpu.  Return true if an IPI can be
> + * skipped, false if the IPI cannot be skipped.
> + *
> + * We use a CMPXCHG covering both __softirq_pending and in_mwait, in order to
> + * set softirq @nr while also observing in_mwait in a race-free way.
> + */
> +static always_inline bool arch_pend_softirq(unsigned int nr, unsigned int cpu)
> +{
> +    uint64_t *ptr = &irq_stat[cpu].softirq_mwait_raw;
> +    uint64_t old, new;
> +    unsigned int softirq = 1U << nr;
> +
> +    old = ACCESS_ONCE(*ptr);
> +
> +    do {
> +        if ( old & softirq )
> +            /* Softirq already pending, nothing to do. */
> +            return true;
> +
> +        new = old | softirq;
> +
> +    } while ( (old = cmpxchg(ptr, old, new)) != new );
> +
> +    /*
> +     * We have caused the softirq to become pending.  If in_mwait was set, the
> +     * target CPU will notice the modification and act on it.
> +     */
> +    return new & (1UL << 32);

Maybe I haven't got enough coffee yet, but if we do the cmpxchg()
won't it be enough to send the IPI when softirq is first set, but not
necessarily for each extra softirq that's set if there's already one
enabled?  IOW:

    uint64_t new, softirq = 1U << nr;
    uint64_t old = ACCESS_ONCE(*ptr);

    do {
        if ( old & softirq )
            /* Softirq already pending, nothing to do. */
            return true;

        new = old | softirq;

    } while ( (old = cmpxchg(ptr, old, new)) != (new & ~softirq) );

    /*
     * We have caused the softirq to become pending when it was
     * previously unset.  If in_mwait was set, the target CPU will
     * notice the modification and act on it.
     *
     * Reduce the logic to simply check whether the old value was
     * different than 0: it will either be the in_mwait field or any
     * already pending softirqs.
     */
    return old;

Thanks, Roger.

