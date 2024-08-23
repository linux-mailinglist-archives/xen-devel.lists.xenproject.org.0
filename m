Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6F95CE8D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 16:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782374.1191858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shUop-000875-Ur; Fri, 23 Aug 2024 13:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782374.1191858; Fri, 23 Aug 2024 13:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shUop-00084R-RM; Fri, 23 Aug 2024 13:59:11 +0000
Received: by outflank-mailman (input) for mailman id 782374;
 Fri, 23 Aug 2024 13:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=55TD=PW=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1shUoo-00084L-In
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 13:59:10 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd3a565c-6157-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 15:59:08 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-27026393c12so1519902fac.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 06:59:08 -0700 (PDT)
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
X-Inumbo-ID: dd3a565c-6157-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724421547; x=1725026347; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoZT566OMXmGylD3QDslmApKLQ9eizOF1q0oHbQsETo=;
        b=W5ZSN66lOaRQREHfkvA5F+bM8EqTK2GIUoSNTbmBhdEzkSY1f0QdieS0NDKn2v9OEL
         j2/vao38aFLFGEZVgCiA2EexJAEIsgLj9tRiGu+T8HmZ+yDwf4a6r4QL091QLoplcbuv
         bmUMyZNeyoS9MpLJtti8/TG8AKXJW93hshrlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724421547; x=1725026347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoZT566OMXmGylD3QDslmApKLQ9eizOF1q0oHbQsETo=;
        b=Re4NPV2KutUKvO6C69xqYudbr0j5LfRRItPg+4pigDJXDBXrUHUHkc59Uv96sbkDlQ
         j2Nh/dDJ7KVBFOe8OQpmTlvoAA6hShAQPGptRo70dLoOVyVx6ogZEfJ/So3Atf9pDQhn
         IJa+7k+oUZWdPlSdIda0vCMbJ2fecFB7fUN+V9OomLZstSGpxEQRhz3aXpWiRWWuFhIg
         itfvhqvM5u3FBaGoVpRYD7wihXMaDRbOyqJ2jUkI/APia2IlDijW1xQVszbwgHlLBXaP
         MO6bgNhZiJ8NSaRDgPRe5JehAhl2F8vG+lqg/72mE5cobxFuBkO3WyEfyYq0DNdT4ZQP
         h9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWhAp4FcHe4xSYvaYF3ayBc0M3ha57eNNHoyK9I4aB6f+pU5DbmS8qgM6RlBhWpNg85AxLctKFG3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHW/NIny43vp+stXYhTPgQbiUhh3x1wXkiMXwa/GRKHvrZjwHr
	RXa4XiMDgP95VTA2qn5JCUeHSpctRHTKIa2FiON6t4TzJpxzfAdmRiBkWO0USwzC6rQzMubWyho
	+wkkcRPpz5oLBaqI0PCs2iYCEWy8xAKrFZNNcdQ==
X-Google-Smtp-Source: AGHT+IG1jKR0CKNpyIYN7ZjVM3zqpwRmo2FAurJArwReuQn3xeMG1OYYAM+SxN43bzhnPGoE025KTywKBAVyCjZmW9E=
X-Received: by 2002:a05:6870:a90c:b0:261:17e7:59b3 with SMTP id
 586e51a60fabf-273e63f21dbmr2763467fac.3.1724421546769; Fri, 23 Aug 2024
 06:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240823105157.991275-1-andrew.cooper3@citrix.com> <55A27B23-1CD1-4123-8F16-793E0966CA49@cloud.com>
In-Reply-To: <55A27B23-1CD1-4123-8F16-793E0966CA49@cloud.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Fri, 23 Aug 2024 14:58:55 +0100
Message-ID: <CAEfZLv=9OhpX8bTf5KBeePKkAeF-JwzzNMxJE5+7N+FuJBb1=A@mail.gmail.com>
Subject: Re: [PATCH 0/3] tools/ocaml: Incremental build fixes
To: Christian Lindig <christian.lindig@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Rob Hoes <Rob.Hoes@citrix.com>, Andrii Sultanov <andrii.sultanov@cloud.com>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Makefile changes look fine to me as well.

Reviewed-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>

On Fri, Aug 23, 2024 at 11:53=E2=80=AFAM Christian Lindig
<christian.lindig@cloud.com> wrote:
>
>
>
> > On 23 Aug 2024, at 11:51, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
> >
> > Various extra build bugfixes found while reviewing the `Stabilize Oxens=
tored's
> > interface with` series.
> >
> > Andrew Cooper (3):
> >  tools/ocaml: Drop OCAMLOPTFLAG_G invocation
> >  tools/ocaml: Drop o=3D rune
> >  tools/ocaml: Fix the version embedded in META files
> >
> > tools/ocaml/Makefile.rules | 5 +++--
> > tools/ocaml/common.make    | 7 ++-----
> > 2 files changed, 5 insertions(+), 7 deletions(-)
> >
> >
> > base-commit: 5231765a4e6528a3208e49885b9eeff42519a6c1
> > --
> > 2.39.2
> >
>
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
>

