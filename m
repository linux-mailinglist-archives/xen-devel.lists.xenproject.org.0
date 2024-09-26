Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD0987218
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805353.1216426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stm9n-0001Tu-Ra; Thu, 26 Sep 2024 10:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805353.1216426; Thu, 26 Sep 2024 10:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stm9n-0001RA-OF; Thu, 26 Sep 2024 10:55:35 +0000
Received: by outflank-mailman (input) for mailman id 805353;
 Thu, 26 Sep 2024 10:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wyuO=QY=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1stm9m-0001R4-36
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:55:34 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d806487a-7bf5-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:55:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF257A44DC4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 10:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BFBC4CEC9
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 10:55:28 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2f75c205e4aso9491721fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:55:28 -0700 (PDT)
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
X-Inumbo-ID: d806487a-7bf5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727348128;
	bh=XCI2d6zOGn8vcBsyrqcPXVXGQlDNXAR3n+2+vnXTTQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S4OpDABYE1wCiLgIXdZbu83lruYEQ01KQl5udAtsM0GVIdkvwzjDz94UuZfHnU7eY
	 Wep2L8zNz011G6KDH8KRKRc7t4F7B1Cq8DtswMmVIvbk94n6Wt9LSElagi1X9aiY8s
	 E/I9uWhA6wxauuWak+TVTPo4jGdNpp3EH8WxEwUwpotthAHP8brAG5SpfLi21HHHU/
	 gx3w5dCIFQnTXmQD1n1CdlcsztuFEVDuvYjot1ACrxolR533tuHTrs/US2BumWu6r4
	 /fuEwyAakBFyae2Ky10q0/u9ox7Z/HAf5Z6TsRZKWxrkoia4swi/cUUJaGvLW2LVWv
	 NNnlzqK/yQfGA==
X-Forwarded-Encrypted: i=1; AJvYcCV6XC5fWXB71KZ0DDfv4syrLNcRv/qKlTW3INwPx+c0JwKu5tPu7GTV8fI5dbC+e1KljYxY5O5kC60=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRIcbgeGRCsTIHK6Ab8HsIv5lcnf6Lb6oWtsGoJoWzAgHW1qGr
	hvFLN1bPqM3JPSncS61t434h1mYJ4iXN7hOx/7INE7dUIfwSHKG6f2+TpwtwUgxnzN49uu4AZ1m
	ZmfI0v+p8o91Jl6fqqZ1+BvdK0Ks=
X-Google-Smtp-Source: AGHT+IFuhl6qwq8nl2RSBrT3s7O5uxpJjtC+zwMU2JDoUkVTJsUk+tGX1p500y3w9bc9d55KP8bhUYqCcZcUrXiWCmA=
X-Received: by 2002:a05:651c:54c:b0:2f7:5dad:1433 with SMTP id
 38308e7fff4ca-2f915fdbb05mr41627421fa.11.1727348126883; Thu, 26 Sep 2024
 03:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240926104113.80146-7-ardb+git@google.com> <20240926104113.80146-8-ardb+git@google.com>
In-Reply-To: <20240926104113.80146-8-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 26 Sep 2024 12:55:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGQhj4RK=Ks_WD59hG1FzX=vsEkugDEW1tmzJzjahrB4g@mail.gmail.com>
Message-ID: <CAMj1kXGQhj4RK=Ks_WD59hG1FzX=vsEkugDEW1tmzJzjahrB4g@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/pvh: Call C code via the kernel virtual mapping
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Sept 2024 at 12:41, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Calling C code via a different mapping than it was linked at is
> problematic, because the compiler assumes that RIP-relative and absolute
> symbol references are interchangeable. GCC in particular may use
> RIP-relative per-CPU variable references even when not using -fpic.
>
> So call xen_prepare_pvh() via its kernel virtual mapping on x86_64, so
> that those RIP-relative references produce the correct values. This
> matches the pre-existing behavior for i386, which also invokes
> xen_prepare_pvh() via the kernel virtual mapping before invoking
> startup_32 with paging disabled again.
>
> Fixes: 7243b93345f7 ("xen/pvh: Bootstrap PVH guest")
> Tested-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/platform/pvh/head.S | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> index 64fca49cd88f..98ddd552885a 100644
> --- a/arch/x86/platform/pvh/head.S
> +++ b/arch/x86/platform/pvh/head.S
> @@ -172,7 +172,13 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
>         movq %rbp, %rbx
>         subq $_pa(pvh_start_xen), %rbx
>         movq %rbx, phys_base(%rip)
> -       call xen_prepare_pvh
> +
> +       /* Call xen_prepare_pvh() via the kernel virtual mapping */
> +       leaq xen_prepare_pvh(%rip), %rax

Just realized that we probably need

+       subq phys_base(%rip), %rax

here (or grab phys_base from %rbx, but the above is more obvious and
less likely to get broken in the future)

> +       addq $__START_KERNEL_map, %rax
> +       ANNOTATE_RETPOLINE_SAFE
> +       call *%rax
> +
>         /*
>          * Clear phys_base.  __startup_64 will *add* to its value,
>          * so reset to 0.
> --
> 2.46.0.792.g87dc391469-goog
>

