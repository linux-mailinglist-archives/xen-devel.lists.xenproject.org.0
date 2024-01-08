Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE90826C0E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:05:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663382.1033249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnRN-00079B-9g; Mon, 08 Jan 2024 11:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663382.1033249; Mon, 08 Jan 2024 11:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnRN-00076I-5w; Mon, 08 Jan 2024 11:05:09 +0000
Received: by outflank-mailman (input) for mailman id 663382;
 Mon, 08 Jan 2024 11:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMnRL-00076C-Pf
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:05:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c762f8a5-ae15-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 12:05:05 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a28ee72913aso464795366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:05:06 -0800 (PST)
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
X-Inumbo-ID: c762f8a5-ae15-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704711906; x=1705316706; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzBzOiJjjKRatGkqE625KGrqN78Lf2l8iURJUB7hef8=;
        b=HKP6E6ySmxL7iTclUs81g/d1lABZPcaP3igvH6ySnhsbfrL+wBdFqLtshDZGG3Xkjh
         ymP/51XGTQ3kI5xjKLqoaqjDagwCW6zlutX5oZIBQnt6WnF6r53QeAhfZfFx2MlU/uL7
         n0l34LAWUDPOMppYLVNa6WTsa8kbjDzwhYe817zenWAbY3SYWe82FUZEzcnAGmZAOmAO
         mjUGZvFFyiYV0IeLhJSt+USpEi1t005gdVp+QWOdm9ZVXKxpQYYHDhyzci3Ifrn6tgi8
         lX0IO0AoAR1zbJLKP4dZnb5914UQ7mauczPsuN6QuzWmeTCiyL6tDE5uANE729VxeEOB
         YEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704711906; x=1705316706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzBzOiJjjKRatGkqE625KGrqN78Lf2l8iURJUB7hef8=;
        b=wMzPKOx5GS60LZki9/B1o6ATZGgBORzF84lkgrh2i8YLmktyjkaOWCv5OSwZs98HB6
         wqGYRIUURUtMRafmknLNOFHIlaEAYGTK2UHYDYKgs3aJNINTdcnL+iOdFurNvq1WDLz7
         qhH0qq7nG6pdk3+jD/eflL2Ndq02O38rtY2vERiQpuCWjKQmzyAdWL7EOHBhiQNZrGYT
         Pz2EQbJvQkjEagBgRPB9ji+2xv3WWn9mN4KQV8C4z8I2dtk4GgEvOHyIobaSp/1RwDz1
         Q/ybh8W5GRAdmt8hSJDSN++lglb4QX/exmd90PNtvEIIN46ls8LWxMvtst6+4YLsrkMH
         DHVA==
X-Gm-Message-State: AOJu0YyAoivltJIM236+pEFWd8cltA6aiFRxqc6L4uOSamyPoa0SSnh4
	AGLd6LYMGSEWNi6B1zZrew5VzKZ60JOTRGhCnucOQgQm8mtfjw==
X-Google-Smtp-Source: AGHT+IH0ixCVGk4ir9/GNqwUzNgs9ARhzPG9aE2ItNt9uYje7NuQlqtPxK8XSEPArL9+qpqVYDIGLXJiGZCRtFMCZvs=
X-Received: by 2002:a17:906:b10f:b0:a29:b31d:1dc6 with SMTP id
 u15-20020a170906b10f00b00a29b31d1dc6mr3442227ejy.6.1704711905728; Mon, 08 Jan
 2024 03:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-4-carlo.nonato@minervasys.tech> <046e9949-d126-42b1-90a6-12af540d63bf@xen.org>
 <CAG+AhRWm4N7GV3HfkTNCvXQw7-6Woq=+zBqdHAgN=-PgGr-WRg@mail.gmail.com>
 <0905b0f4-9a5e-48c7-8764-58cdd440130f@xen.org> <CAG+AhRVL8_YMkw+Z4EcTLZgM7m10+9DToSkaeNLMaFY3gcng7Q@mail.gmail.com>
 <4f8b3a59-c277-4f2e-a9de-82ea9ce2eda0@xen.org>
In-Reply-To: <4f8b3a59-c277-4f2e-a9de-82ea9ce2eda0@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 12:04:54 +0100
Message-ID: <CAG+AhRUE8MQjW=1rLsp79=MisUtjiB-5daXYz8S6-8JX6kAosA@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] xen/arm: add Dom0 cache coloring support
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Mon, Jan 8, 2024 at 11:25=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Carlo,
>
> On 08/01/2024 10:06, Carlo Nonato wrote:
> >> One of the reason is at least in the dom0less case, you will override
> >> the value afterwards.
> >
> > In that case I need to allocate the array before parsing the string.
> > I allocate a full array then the string is parsed and the actual size i=
s found
> > at the end of this phase. Knowing the actual size would require two par=
sing
> > stages. Yes I'm wasting a bit of memory by oversizing the array here. I=
s it
> > a problem?
>
> While wasting memory is indeed not nice. This wasn't the main reason of
> this comment.
>
> The reason is that you seem to set d->num_lcc_colors will but will never
> be read before it gets overwritten. Looking again at the code, you are
> also assuming parse_colors() will always take an array of nr_colors.

Ok, I think I understood, but that happens only in dom0less case because
d->num_llc_colors is overwritten after parsing. In other cases it's ok to s=
et
it there. Anyway I can move the assignment out of the function if that is
clearer.

> It would be better if parse_colors() takes the maximum size of the array
> in parameter. This would harden the code and it makes more sense for
> domain_alloc_colors() to set d->num_lcc_colors.

I don't understand this. parse_colors() must take only arrays of nr_colors
size (the global, maximum number of colors), otherwise the parsed string
config could exceed the array size. Since we don't know in advance the real
size before parsing, I think it's better to pass only arrays that are alrea=
dy
allocated with the maximum size.
Doing as you said I would still pass nr_colors as the maximum size, but tha=
t
would be strange since the global would still be accessible.
If domain_alloc_colors() setting d->num_llc_colors is so confusing,
I will just move the assignment after the function call.

> Also, I just noticed you have a global variable named nr_colors and the
> function parse_colors() takes an argument called *num_colors. This is
> quite confusing, can we have better name?
>
> Maybe rename nr_colors to nr_global_colors and and num_colors to
> nr_array_colors?

I agree with the fact that naming is confusing. I would opt for max_nr_colo=
rs
for the global.

Thanks.

> Cheers,
>
> --
> Julien Grall

