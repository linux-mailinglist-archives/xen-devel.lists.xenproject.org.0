Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70028A9ECC7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 11:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970406.1359114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Kz8-0001MK-3x; Mon, 28 Apr 2025 09:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970406.1359114; Mon, 28 Apr 2025 09:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Kz8-0001Jj-0x; Mon, 28 Apr 2025 09:41:10 +0000
Received: by outflank-mailman (input) for mailman id 970406;
 Mon, 28 Apr 2025 09:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EzXt=XO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9Kz6-0001Jd-VK
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 09:41:09 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e846f93d-2414-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 11:41:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so6850000a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 02:41:06 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f7016f5acdsm5536622a12.38.2025.04.28.02.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 02:41:05 -0700 (PDT)
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
X-Inumbo-ID: e846f93d-2414-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745833266; x=1746438066; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CBhCXkr8158RMaR3b8OB6n2UjnrAgIUceMjhNvsh2E=;
        b=p2aNEtXK0onSjZT13q8+g4RWYmm9aFeK6cEr+dNaw4RJ/DogM0FLZl3IFHVEsYP4nZ
         6DZtAEYa4ZLHKeZouHO2hnq/BheYc83PGFv/JGuUV+5Na2aGDpN+CbtkKvIaZaJcS9bf
         t3gWcSbrjErnPzwPLmD9IO2SK4hK1wXGdTQI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833266; x=1746438066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CBhCXkr8158RMaR3b8OB6n2UjnrAgIUceMjhNvsh2E=;
        b=FWUqQoQmLHWXCkW7Cs21kLILXygZ7QK5B2bZkgEZwQUt4E/lsGOos0KSJF98R/2COJ
         uW73X+H4RUXVnEazwKGF7eK5//BRm5RO5m6d9Xg9n8ZyvlL/ApvqR6H7zwYQRF2jbJDU
         LzetY3c34+vlFgHacyWOjFdZbhyJ6Z4XbAjkiejhRtzx4kJDxNChrZYDMTN0mlvRBdoA
         fseyzyC3EGozBkpPdGDV0qnYij3G+ge10vS5iN/1Lk+m1gfMkWaHhKclC2gAQd8w4bj8
         IjlOJWJvF7HVFv1kypI5NREzz7v/JTwfabR7nS8e7IrFNQR4f9POzMz8oMIUC1LHXt5m
         91Gw==
X-Gm-Message-State: AOJu0YzGrprBHLg8h30Yk59JEqrduEuUfYm05E9vZdsXPfQZPoDerGTd
	6eaEqB8wgAt6TvhY6nEoGi1m/ZLoRv8lWWpywCbdRySXaF3ZNJCX07aUnAvApQA=
X-Gm-Gg: ASbGncs8QxlNYZrS0Q/Xj/b7jDKJvlVyNBo0mKE8RTqHx4oQicCeHYKyoZ8CmF92+KO
	5rn41tgmQ9f2+IThnMU1YTXD0l7Twm3g1mmnKI7ejzArzjNAz5dJk9bhcCQYiGKQIUKslXo+sUn
	z91JjNpqdAN9iO/FQVZ/H0J8L2Cpqx3jouoabPa+pxgJs/jbbbz+jYkLlLzOilhCqoUBOQuY7AW
	axN9sQpmrCI/6QhT85YLWxakiJz6rjNpR0XN7X+bv3Rur/rVnyplwoStwp5x4N/RLc644kUZGaw
	Xd7ng9wYB0l7srY8REqDiexX+87L7IFExjGeqjP/GfYfSeV83yXVvFgN
X-Google-Smtp-Source: AGHT+IEGHAFQx8F0UGhURNrZPpamKptHf3MPAiDrOCk9JtIrbvxUHBo2lJQKrHR5kriwkviMPMvdaQ==
X-Received: by 2002:a05:6402:2749:b0:5f8:30c2:8652 with SMTP id 4fb4d7f45d1cf-5f830c28831mr91858a12.7.1745833265992;
        Mon, 28 Apr 2025 02:41:05 -0700 (PDT)
Date: Mon, 28 Apr 2025 11:41:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ariadne Conill <ariadne@ariadne.space>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <agarciav@amd.com>,
	"Alexander M . Merritt" <alexander@edera.dev>
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
Message-ID: <aA9NMJVbyXeMOOY-@macbook.lan>
References: <20250425234331.65875-1-ariadne@ariadne.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425234331.65875-1-ariadne@ariadne.space>

On Fri, Apr 25, 2025 at 04:43:31PM -0700, Ariadne Conill wrote:
> Previously Xen placed the hypercall page at the highest possible MFN,
> but this caused problems on systems where there is more than 36 bits
> of physical address space.
> 
> In general, it also seems unreliable to assume that the highest possible
> MFN is not already reserved for some other purpose.
> 
> Changes from v1:
> - Continue to use fixmap infrastructure
> - Use panic in Hyper-V setup() function instead of returning -ENOMEM
>   on hypercall page allocation failure
> 
> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
> Cc: Alejandro Vallejo <agarciav@amd.com>
> Cc: Alexander M. Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> ---
>  xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
>  2 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> index 6989af38f1..0305374a06 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      if ( !hypercall_msr.enable )
>      {
> -        mfn = HV_HCALL_MFN;
> +        void *hcall_page = alloc_xenheap_page();
> +        if ( !hcall_page )
> +            panic("Hyper-V: Failed to allocate hypercall trampoline page");
> +
> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_page);

This likely wants to be a dprintk, and possibly also print the
physical address of the used page?  And no period at the end of the
sentence IMO.

I think Xen might have used the last page in the physical address
range to prevent HyperV from possibly shattering a superpage in the
second stage translation page-tables if normal RAM was used?

However I don't know whether HyperV will shatter super-pages if a
sub-page of it is used to contain the hypercall page (I don't think it
should?)

Thanks, Roger.

