Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6802B4A6E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 17:14:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28513.57593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keh7m-0000jW-B5; Mon, 16 Nov 2020 16:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28513.57593; Mon, 16 Nov 2020 16:13:02 +0000
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
	id 1keh7m-0000j7-80; Mon, 16 Nov 2020 16:13:02 +0000
Received: by outflank-mailman (input) for mailman id 28513;
 Mon, 16 Nov 2020 16:13:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l6nr=EW=amacapital.net=luto@srs-us1.protection.inumbo.net>)
 id 1keh7l-0000j2-2B
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:13:01 +0000
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46ba993d-4fb7-44e5-9d61-9cdcf59e56f0;
 Mon, 16 Nov 2020 16:13:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12so12069186wrt.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:12:59 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l6nr=EW=amacapital.net=luto@srs-us1.protection.inumbo.net>)
	id 1keh7l-0000j2-2B
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 16:13:01 +0000
X-Inumbo-ID: 46ba993d-4fb7-44e5-9d61-9cdcf59e56f0
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 46ba993d-4fb7-44e5-9d61-9cdcf59e56f0;
	Mon, 16 Nov 2020 16:13:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12so12069186wrt.0
        for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2020 08:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8fy9yJa8xaunaxNAmcC4fKqFwO3hgJ8i3UHbtvhB9OQ=;
        b=CCagE05Tte+vu4qHj9zLiAy1I7Elq1T7BM2FMQZRQchCZ21yGqXT2YIxuHB1rT6tQU
         0LcVZeEa/d5r7lBKYg885sd+EMDaHuuiUSjtiw6wyCzePiG9vcbpKpGxuuGAFKCHnKY9
         k4RMOEOann/4ubOcrv+/XYY0n4HBJcNr9nwT5hbOO0wssAjW86GoL5Inuob6H6fJzP5j
         Gxakvx1WwtCmj9A86RVfRKyhaKGY/apU5JxBjYFo4+a8UkfQoMuIDwX7LSC6kOpF3DGi
         ifwNLHwVW1ES9BGSAPmYeZsMVbpTpPOjXLR950OPJeXzIcejbCyDOvJvRc0OjFXCmDpU
         MqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8fy9yJa8xaunaxNAmcC4fKqFwO3hgJ8i3UHbtvhB9OQ=;
        b=SY3z0PppUtbYsyWzOiFprD+tyHb5RxqX/xGH5xTN9GwGUb6uc2gzT5QG80w9cwE1kv
         jWaQZzveCNT66EXK5JtnBLWnCjnJ8S7DPnipbrpls+FQVah2OD+l5DnNHJicVnGDEizm
         fzVA8x1qTmpl6XsqfXyH4oBk3p40VTsO2NgOFo2Z4GpNdoFhbFd6wJKZhweHEHEE4XLk
         ++CnjZa1aBufQa6JzAAdfCtoq+UPQFv0b1bu6mSOsuDjck1UxeegLzCyHiNPNVNk92Ym
         vLALJkbeqmULfrL2YQ6ZAZQvCh2GiverRx/WfR0yIELOToYWuBsRHYxcx+MtX9rnI7fC
         8Ovg==
X-Gm-Message-State: AOAM530rLXMmmBCAviipw+qoIgS649dwKzoZSqFRxXh/8fXaScF6sc7K
	YIfQVdLGZ0iVwaO2SCtFD0QU5pX7Ve4SEDx8vKGekA==
X-Google-Smtp-Source: ABdhPJxC7jxqf4ZHD7BBqVXQL2hN8P5Oggx7Bc5cCg7hTHoa0ssVjlPSEQtioabPGctgV4nNkJs/uFpogKzZWU9akvo=
X-Received: by 2002:adf:f808:: with SMTP id s8mr20430438wrp.257.1605543179184;
 Mon, 16 Nov 2020 08:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20201116152301.24558-1-jgross@suse.com> <20201116152301.24558-3-jgross@suse.com>
In-Reply-To: <20201116152301.24558-3-jgross@suse.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 16 Nov 2020 08:12:46 -0800
Message-ID: <CALCETrWVSEB5zrUiZ81KaB5egx78TfDuSDv+qR3HFtJ=SKxwkQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] x86/xen: use specific Xen pv interrupt entry for DF
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, X86 ML <x86@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 7:23 AM Juergen Gross <jgross@suse.com> wrote:
>
> Xen PV guests don't use IST. For double fault interrupts switch to
> the same model as NMI.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/include/asm/idtentry.h | 3 +++
>  arch/x86/xen/enlighten_pv.c     | 8 +++++++-
>  arch/x86/xen/xen-asm.S          | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
> index 3505c0396fa5..b35825392547 100644
> --- a/arch/x86/include/asm/idtentry.h
> +++ b/arch/x86/include/asm/idtentry.h
> @@ -611,6 +611,9 @@ DECLARE_IDTENTRY_RAW(X86_TRAP_DB,   xenpv_exc_debug);
>
>  /* #DF */
>  DECLARE_IDTENTRY_DF(X86_TRAP_DF,       exc_double_fault);
> +#ifdef CONFIG_XEN_PV
> +DECLARE_IDTENTRY_RAW_ERRORCODE(X86_TRAP_DF,    xenpv_exc_double_fault);
> +#endif
>
>  /* #VC */
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 9f5e44c1f70a..803fbcb398c4 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -571,6 +571,12 @@ DEFINE_IDTENTRY_RAW(xenpv_exc_nmi)
>         exc_nmi(regs);
>  }
>
> +DEFINE_IDTENTRY_RAW_ERRORCODE(xenpv_exc_double_fault)
> +{
> +       /* On Xen PV, DF doesn't use IST.  The C part is the sane as native. */

I would like to think that code is sane, but you probably meant "same".

> +       exc_double_fault(regs, error_code);
> +}

