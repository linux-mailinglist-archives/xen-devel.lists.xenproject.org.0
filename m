Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC38AB1C0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 17:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709149.1108424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxq9B-0001kR-8O; Fri, 19 Apr 2024 15:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709149.1108424; Fri, 19 Apr 2024 15:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxq9B-0001iv-5f; Fri, 19 Apr 2024 15:27:29 +0000
Received: by outflank-mailman (input) for mailman id 709149;
 Fri, 19 Apr 2024 15:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3rY=LY=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1rxq99-0001iZ-Te
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 15:27:27 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53593c7b-fe61-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 17:27:25 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2da84f93c99so27869201fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 08:27:25 -0700 (PDT)
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
X-Inumbo-ID: 53593c7b-fe61-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713540445; x=1714145245; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CdWZ0zH8TQvMiySvwRbdjwT2/LyTsCGq7GtzMvQFZ0=;
        b=b+nfObkZp7rcxOIg4ZGkOYxUyYnrcrLizwhRzsbH3DBiCajj/TJ5A2YT6l/gvj0KWC
         +nSzX1R9vUVWunUXQR9Y6MfAQyK6jcq+XFUweUMMEVL85sI1D2KaaQdl2nPLGEMt+p0E
         N4fQYch4rSe/18mWc11Cm4tHnSDbX7eAtA0jGcNUTv+7ye9BRclovWE17xEeBIhh5YSN
         eLRKw/UHaRLZ7W66awHbFZVYsENwSf8jGfjWB0YKS6Gab+8t5WhrXPlk7p2yQRQARNW7
         bWEnEq+2TU0gARdGHCE4UDZ1XDtX6pjmQ1EJr2xXWDv73mBBR4iM4O8PU2behuNPxagM
         KwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713540445; x=1714145245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CdWZ0zH8TQvMiySvwRbdjwT2/LyTsCGq7GtzMvQFZ0=;
        b=Vq8lAiGLz3TuMr8tLxsLKTecaOQOw1lMNPJ0Dv0J6QaKIfxBJJeVl8MZ7lLKC19kF4
         0UjmtvFTKQjWg28cCUGrp57GYaQcwbscZVmpslnKfZCJu34ds5KD52k1VWrK89Q1eAjb
         QZY5I6xfyZftYGU3I+HgSFfNtgz37SGTGryrQM/smV4Cw9KmAw/1DKOj89LPU2fJ20+z
         7DbfWgZ7QRo0ta+KwQ2SeEWKdCGuI7kJOhmJ1NFDjiwcPURD0btMa5ehTP1NTdWn6fuD
         jw8GKdEb+6uDv+4Pv9FOulMThDscglSB7mdA1mjm+lBR7dZqchWfJBLoQ760eE1ZWR4r
         QSZw==
X-Gm-Message-State: AOJu0Yy22Jw1NUVcgoI4Mp/1/Y25k5HCXRYN2SAVD08nquVsIhwwW28e
	07wfBpT+9UpIxgD2EXkfOOEJfVjgjWf9iFdcAQn4kUtofHtsagDXN7XQOmSBAxt2lCvT8LLcJG2
	uqRmyCKIvbPahDnE+QlXcYev5tFM=
X-Google-Smtp-Source: AGHT+IH4uHwUFEl7yN1pwkBNgGNi0uTG46+bYeK5A0B3VcS/dVo5OCyyKSv6Qn+/GtS124OLNp/lTI1Z7wdTlOGIs3Y=
X-Received: by 2002:a05:651c:3c6:b0:2da:36be:1b4a with SMTP id
 f6-20020a05651c03c600b002da36be1b4amr1930973ljp.19.1713540445192; Fri, 19 Apr
 2024 08:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240419135120.830517-1-george.dunlap@cloud.com>
In-Reply-To: <20240419135120.830517-1-george.dunlap@cloud.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 19 Apr 2024 11:27:14 -0400
Message-ID: <CAEBZRSd=qboZhPYgLz0NxCBkzzRJZp-4eq1PxCuC=Gx5Zk2KLA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tools/golang: When returning pointers, actually
 allocate structrues
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, 
	Tobias Fitschen <tobias.fitschen@posteo.de>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 10:00=E2=80=AFAM George Dunlap <george.dunlap@cloud=
.com> wrote:
>
> In a handful of cases, it was decided to return a pointer to a
> structure rather than the plain structure itself, due to the size.
> However, in these cases the structure was never allocated, leading to
> a nil pointer exception when calling the relevant `fromC` method.
>
> Allocate structures before attempting to fill them in.
>
> Fixes: 453713b1750 ("golang/xenlight: Add host-related functionality")
> Reported-by: Tobias Fitschen <tobias.fitschen@posteo.de>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> Tested-by: Tobias Fitschen <tobias.fitschen@posteo.de>

Acked-by: Nick Rosbrook <rosbrookn@gmail.com>

This is one of the reasons I don't like using named return values (if
you can help it) and naked returns. When you declare the variable
explicitly you are less likely to explicitly initialize it to nil. Or,
it's a compile time error if you forget all together.

Thanks,
Nick

