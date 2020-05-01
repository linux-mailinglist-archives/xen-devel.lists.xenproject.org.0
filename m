Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F3E1C1FB5
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 23:36:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUdJz-00017t-Cq; Fri, 01 May 2020 21:35:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eksi=6P=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jUdJy-00017l-4r
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 21:35:46 +0000
X-Inumbo-ID: b6dea2e8-8bf3-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6dea2e8-8bf3-11ea-b07b-bc764e2007e4;
 Fri, 01 May 2020 21:35:45 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h4so1182062wmb.4
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Bsp+zgN5c2T/7JN1ydtC5H7G2SO7afVw6MOmB3cNQg=;
 b=Ppko3UdRDIbvvB7u9KFnWZhjC52nBJPZ6p9qAPKrwpY3Ek7LI0BZLTos519DS1pXol
 95Iozp+Nam2C0J+DijnBA9skd/6ci4MQUpWevJT4slXrZ4p9vRdjounQGzhLUB5YI0/8
 WF3OYvny2Fw8w3VognghIFX4ECGrdVirqzXkuaNEohs3jXyupwdt1RqaXu94ltbZGYiN
 7HHoH6N+P87UluZaBAyt/3mpcTpCJIXxyb1le21VVvKGPYh1UikfWWRbNsxoE2bp1nAN
 1Yg0SwKV0TgOo4cdJGXOgkOP4Yyz7XjBb2BmkczEqQxcAK5CxR/YjAkhu2q7RcY6DZ0+
 UTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Bsp+zgN5c2T/7JN1ydtC5H7G2SO7afVw6MOmB3cNQg=;
 b=GxxZpxNUV1hloQspKrFFSE/UDhw6eVHHmudIxOTgLCrKR9MY/iqjWvx70fEpCxnkut
 A1FNPflIrzIoyjXWrCcqB4HWWAHIVBsK9zfCpfXY7pMLJaJ2d6zmczDygLlBhgrlnap9
 0+1oM97mtuX1a0JP/tQKpUdSgajx2WAQZveJfK/iM8hK3xdiIVk89rdEfGARBtTL2jRS
 goNJwmypaaJ6uKjWfBf8bHW5GtIh9TTzuqpPNnTZozKAO6uNoWEk05oM8WPKo+59mLH2
 KyChEH5lilWR+dFAMlsqLH6EWwM80/Y7clwqrzUT2ogptz7Hi4QXMEWTXKf94LPHKE2B
 RtFQ==
X-Gm-Message-State: AGi0Pub+xz/CRp9l5VDd6OrmETtyZdR8R/rKH4dP9DiOQNbw+PXdhz1r
 FjL0muqBbfEBSLwhxv9Ljou0+VLKxaeqeOkc4SE=
X-Google-Smtp-Source: APiQypJF/L5LpmZx1M/fe9BJRSBIG7gWKElydPkdDksWWpJfWfFP4RhKrsEwTJMthIXo2oOzcazqNVPdm9mWJdITLxw=
X-Received: by 2002:a05:600c:28e:: with SMTP id
 14mr1530450wmk.79.1588368944548; 
 Fri, 01 May 2020 14:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588278317.git.hongyxia@amazon.com>
 <a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 1 May 2020 22:35:33 +0100
Message-ID: <CAJ=z9a0S0rOYbJVPGK6mTKN0OgJtiTU7YN-APLF4Dvr4CaKfJg@mail.gmail.com>
Subject: Re: [PATCH 02/16] acpi: vmap pages in acpi_os_alloc_memory
To: Hongyan Xia <hx242@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On Thu, 30 Apr 2020 at 21:44, Hongyan Xia <hx242@xen.org> wrote:
>
> From: Hongyan Xia <hongyxia@amazon.com>
>
> Also, introduce a wrapper around vmap that maps a contiguous range for
> boot allocations.
>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> ---
>  xen/drivers/acpi/osl.c | 9 ++++++++-
>  xen/include/xen/vmap.h | 5 +++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> index 4c8bb7839e..d0762dad4e 100644
> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -219,7 +219,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
>         void *ptr;
>
>         if (system_state == SYS_STATE_early_boot)
> -               return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
> +       {
> +               mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
> +
> +               return vmap_boot_pages(mfn, PFN_UP(sz));
> +       }
>
>         ptr = xmalloc_bytes(sz);
>         ASSERT(!ptr || is_xmalloc_memory(ptr));
> @@ -244,5 +248,8 @@ void __init acpi_os_free_memory(void *ptr)
>         if (is_xmalloc_memory(ptr))
>                 xfree(ptr);
>         else if (ptr && system_state == SYS_STATE_early_boot)
> +       {
> +               vunmap(ptr);
>                 init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);

__pa(ptr) can only work on the direct map. Even worth, on Arm it will
fault because there is no mapping.
I think you will want to use vmap_to_mfn() before calling vunmap().

Cheers,

