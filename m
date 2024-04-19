Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300B78AB296
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 17:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709181.1108475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqcE-00014H-FO; Fri, 19 Apr 2024 15:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709181.1108475; Fri, 19 Apr 2024 15:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqcE-00012c-Bi; Fri, 19 Apr 2024 15:57:30 +0000
Received: by outflank-mailman (input) for mailman id 709181;
 Fri, 19 Apr 2024 15:57:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxqcC-00012G-Ng
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 15:57:28 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 843df93d-fe65-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 17:57:26 +0200 (CEST)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6eb848b5a2eso1273129a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 08:57:26 -0700 (PDT)
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
X-Inumbo-ID: 843df93d-fe65-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713542245; x=1714147045; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1wqwd2FUnXprA1Tf/TXp9+VIiYDPUSwlEXRH5KCSKs=;
        b=ldfwzn1tIRDCWJogNAATIY59KjGxeKoCf2y+MNCM+yuhUqqdB5ZupIFb8AvihbWTuc
         imfiTXVsUkmt+lbNdGwEiwOrGmZ59xQ5aay6TFO1bR/QP1P9IyWs0/f/kfGpFwHUW+3v
         xhu//Z1+INwcYJWvqo4kKLgXc5h6ffxps8DzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542245; x=1714147045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1wqwd2FUnXprA1Tf/TXp9+VIiYDPUSwlEXRH5KCSKs=;
        b=qvQ4+i8WUUNPLXc9yQ5ahYSYWSHmZxAO5eRmPxsXEN6k/LD4b2euu9BK/USI2net6i
         bUj/PJXjcXpQzK2h1cd64P76xXKvUPTZVcLuhPCKt2tX/WtRYGBPIB4EidexfVaN3rkN
         +3E/K85WrCcojn9Vq9G7YxTJu706TqPi8Nv9tszfIc/yLY3G45Ec1bBj/pw5dD/LRgBt
         +5rLbqdN0KvT8R33RPV3/VSpVdwD1CsWM7Tl4FhC5SUbKeuMarhOyBinIuzsYwOQhb0d
         rKpGbmdWpq/G9dMJLa3Cv0dlZl5LM1Xz+PJFZWj+4AqkHE3pKtXdipSxNwGSXvpKktYN
         lRdg==
X-Gm-Message-State: AOJu0YxWzeK1eZp15t4Oqct0SNJgeCbopw+/meQOYILCQ4KUwHdmRGTv
	S8m5apM0uSSP/aXPlNoSryeddpuVB0ztnbB/NdZ7uIr7EmCLUBEc3RNhFtkS29uqhGpHlyKFQlR
	/XwKIFAxUgmO10RvfSjwrUIItea30PGt6ygAiTw==
X-Google-Smtp-Source: AGHT+IE9pfooUxVXwA1uFagO606qtYia2oifHW5pTgO25GiE2c6nB+/MG51rK4tbO1U0wqubq0H9JiDkJ3GqEmXBKo0=
X-Received: by 2002:a05:6870:3455:b0:221:8dd0:9920 with SMTP id
 i21-20020a056870345500b002218dd09920mr2812436oah.47.1713542245413; Fri, 19
 Apr 2024 08:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240419135120.830517-1-george.dunlap@cloud.com> <CAEBZRSd=qboZhPYgLz0NxCBkzzRJZp-4eq1PxCuC=Gx5Zk2KLA@mail.gmail.com>
In-Reply-To: <CAEBZRSd=qboZhPYgLz0NxCBkzzRJZp-4eq1PxCuC=Gx5Zk2KLA@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 19 Apr 2024 16:57:14 +0100
Message-ID: <CA+zSX=bzTpZ6jdhufyKagykuUKdBPwzFmFwbWYLeJuBkgY9UZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tools/golang: When returning pointers, actually
 allocate structrues
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Tobias Fitschen <tobias.fitschen@posteo.de>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 4:27=E2=80=AFPM Nick Rosbrook <rosbrookn@gmail.com>=
 wrote:
>
> On Fri, Apr 19, 2024 at 10:00=E2=80=AFAM George Dunlap <george.dunlap@clo=
ud.com> wrote:
> >
> > In a handful of cases, it was decided to return a pointer to a
> > structure rather than the plain structure itself, due to the size.
> > However, in these cases the structure was never allocated, leading to
> > a nil pointer exception when calling the relevant `fromC` method.
> >
> > Allocate structures before attempting to fill them in.
> >
> > Fixes: 453713b1750 ("golang/xenlight: Add host-related functionality")
> > Reported-by: Tobias Fitschen <tobias.fitschen@posteo.de>
> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> > Tested-by: Tobias Fitschen <tobias.fitschen@posteo.de>
>
> Acked-by: Nick Rosbrook <rosbrookn@gmail.com>
>
> This is one of the reasons I don't like using named return values (if
> you can help it) and naked returns. When you declare the variable
> explicitly you are less likely to explicitly initialize it to nil. Or,
> it's a compile time error if you forget all together.

Yes, after having more experience in golang I wouldn't be opposed to
getting rid of all those now.  But as I'm hoping to backport this as a
bug fix, that would be a subsequent patch. :-)

Thanks,
 -George

