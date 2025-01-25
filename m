Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07A0A1C46A
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 17:52:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876989.1287193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbjNo-0003DI-Eg; Sat, 25 Jan 2025 16:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876989.1287193; Sat, 25 Jan 2025 16:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbjNo-0003BH-B3; Sat, 25 Jan 2025 16:51:44 +0000
Received: by outflank-mailman (input) for mailman id 876989;
 Sat, 25 Jan 2025 16:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WrGG=UR=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1tbjNn-0003B9-2o
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 16:51:43 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6eccc05-db3c-11ef-a0e5-8be0dac302b0;
 Sat, 25 Jan 2025 17:51:42 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5401be44b58so3428309e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 08:51:41 -0800 (PST)
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
X-Inumbo-ID: a6eccc05-db3c-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737823901; x=1738428701; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o5lQz4z3bazVM0zrwUgk9jgdQGjj7NPeb4nW5lxrzw=;
        b=NwsRjcGZJ1dpbdXy7cZmbzHFgfVCCFQ/tEFE7iUgjSAtJqe9vYlkP4hgdW2PZScv5w
         dnV0lPe8+AJrM4SZFe8bDyOHDHiqU+huYuGByZdpFF9yoo6CdCE1f+Ukvl6y3Fe1Da80
         7BgVisvQOHwdAYPYZbQdpr/cXhpoHXziIikDqC682TUylk/6SEGxK3X097Lbruj5Hv+i
         OO1IzTPyZAa+BsRGd4G8HnwQvMKAN8llH1G27hVPLIjtC8g/bJFGRHKZUoqB6PJIFgEo
         LmLYx6FkvUyEU73iHgu7SUIou7HUSTVfi9sk3Jtt2z5fBzvVQ2tD8/l2P2Y1I4o3vFWb
         gS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737823901; x=1738428701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/o5lQz4z3bazVM0zrwUgk9jgdQGjj7NPeb4nW5lxrzw=;
        b=FZRVr8e70FkINT1GW8cLRvz7hsF6GccE6eCuD9LojKdaTaLesyz3hi10Ymkkxd/SCF
         CSe5ODhkMpCwAmmQnUUQwLrLLMJZudFxMX9obzc7jUqPOyUHPR21ikBBpGXGRD0chAos
         RqfikVz3W2WjqaEz1XPL87tc+YlbSBX8b/GYCcCbeSHRK5gbMxK5w5EC98gyDiqTWhBi
         C7YbfJ4l53MCN3X9+ZQeejewN4XC3HddGew83wOQIVUS1cJP4rvy9ghOgMj/3NVZAwEZ
         m2krZjpE/F5vteWkMw+b/riwhZtIJcR1B6pHufQN5ED+C9nklIeW3Q8Fj8bLC1OhE8xg
         fhyA==
X-Forwarded-Encrypted: i=1; AJvYcCVKM3ZC9xVckdGqZnOguFCLkoZZc6VEQZx/VUT3Xqos10m9kv5wW8VuA2szuZ0xavBYoay+neUe8D0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQjov7VsCuW84hmfbaqwH0N4BZUVgQLp5tK/YsZzt0AnRAuh57
	+dnA8QiEkw8yjvnYYzitYZJ9QNwYAavIRxdvAGM/y3QRdDHjrERQ5gwZAd7gIinjEayVoAQIgdp
	wK+6bG7JTKwsc0hI43C+LIDfang==
X-Gm-Gg: ASbGncvuDPtR5bE3QmAYl7yKgLD/6hoS+bNPrQLivy2VNsVsBowHoqdy84MOZvonyDp
	XEAnwgCn6TQZLxiQJfeeS9cmJ/exLx1yLpWjqmjPGGO3gZlQelTbKRxO9z0o6ej9UQHLSLAPLlF
	v+
X-Google-Smtp-Source: AGHT+IHp5nuXQzvNOwwhjBWsjYmQuSyZx/kuCbmED7c4yCz9ZGLQHpBHUJhywm36HZHMsWl0IDePDzcrosG+E0Yu8wM=
X-Received: by 2002:a05:6512:32c7:b0:53e:39e6:a1c5 with SMTP id
 2adb3069b0e04-5439c2659cfmr13611514e87.41.1737823900901; Sat, 25 Jan 2025
 08:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20250123190747.745588-1-brgerst@gmail.com> <20250123190747.745588-5-brgerst@gmail.com>
 <20250125150658.GAZ5T-EloWfjZAwJdU@renoirsky.local>
In-Reply-To: <20250125150658.GAZ5T-EloWfjZAwJdU@renoirsky.local>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 25 Jan 2025 11:51:29 -0500
X-Gm-Features: AWEUYZlme3fNTAUaz99MI4IlYuGga1joebdoO1yHLneW1XrEoe2ZlCEU2PYDR44
Message-ID: <CAMzpN2jqOb1jC6ZYxa+1Xw-EXuDXUrGT9_7Gv0FL+XJxTXvC5g@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] x86/pvh: Use fixed_percpu_data for early boot GSBASE
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 25, 2025 at 10:07=E2=80=AFAM Borislav Petkov <bp@alien8.de> wro=
te:
>
>
> On Thu, Jan 23, 2025 at 02:07:36PM -0500, Brian Gerst wrote:
> > Instead of having a private area for the stack canary, use
> > fixed_percpu_data for GSBASE like the native kernel.
> >
> > Signed-off-by: Brian Gerst <brgerst@gmail.com>
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/platform/pvh/head.S | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
>
> Use ./scripts/get_maintainer.pl pls. I've added Juergen now.
>
> > diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.=
S
> > index 4733a5f467b8..fa0072e0ca43 100644
> > --- a/arch/x86/platform/pvh/head.S
> > +++ b/arch/x86/platform/pvh/head.S
> > @@ -173,10 +173,15 @@ SYM_CODE_START(pvh_start_xen)
> >  1:
> >       UNWIND_HINT_END_OF_STACK
> >
> > -     /* Set base address in stack canary descriptor. */
> > -     mov $MSR_GS_BASE,%ecx
> > -     leal canary(%rip), %eax
> > -     xor %edx, %edx
> > +     /*
> > +      * Set up GSBASE.
> > +      * Note that, on SMP, the boot cpu uses init data section until
> > +      * the per cpu areas are set up.
>
> s/cpu/CPU/g
>
> check your whole set pls.

To be fair, this was a copy of an existing comment.  Is there a style
guide where all these grammar rules are documented, so I don't have to
keep resending these patches for trivial typos?


Brian Gerst

