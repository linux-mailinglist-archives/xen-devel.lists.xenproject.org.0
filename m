Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B1C928C12
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 18:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754442.1162876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPlRA-0003hi-4R; Fri, 05 Jul 2024 16:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754442.1162876; Fri, 05 Jul 2024 16:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPlRA-0003fx-0W; Fri, 05 Jul 2024 16:05:28 +0000
Received: by outflank-mailman (input) for mailman id 754442;
 Fri, 05 Jul 2024 16:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mps8=OF=gmail.com=andreistan2003@srs-se1.protection.inumbo.net>)
 id 1sPlR9-0003fr-4N
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 16:05:27 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61d10dd6-3ae8-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 18:05:22 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-445e1f933e0so8250451cf.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 09:05:22 -0700 (PDT)
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
X-Inumbo-ID: 61d10dd6-3ae8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720195521; x=1720800321; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idjXXqvgasy6zJw0NvplHHzfSXjgrv3fy3NK6/GxX4c=;
        b=GSLkoTdQEwrqE+ftUU7bcIcCOpRbt2L/61KYPHvS7FPxxFlCQttNClfeCHyjyaFb73
         W8KibvIRc0pctEU4VyNpveyb5FcU6xTiBWiYghY7BqMGPAA1bnyFl/BFkT89LjSLDw7a
         1e52wPPIgt8giq41j8QrwhTGrJltQB1Hlhq4Jk9Me0ocC1tEAFnovT78LnexPRp3L5XY
         dev2YhMgyVAJlr9fzlgxraT8YMaU6PPBcp3tmVPB0kKCiQkkhxZa9dzj9KNvyZTktxSu
         8yfkbMyzHJUFJPFIjXWPwsGOETAfpNMBsY1KG0x5gA2OcMwk2PmEQgch0GGmtziwSFLH
         FaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720195521; x=1720800321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idjXXqvgasy6zJw0NvplHHzfSXjgrv3fy3NK6/GxX4c=;
        b=dJUbmyhTUN5qhhhPz5NZNr/gs8JhhruIBUp7fSlBJlODzuM5q7BvuUXfZaXpunaMMA
         TboMtmrDPWAD/xesbQXMOF/IquQJgn232Mn+g2Y2SvMYGABa5shEVau3vLOJWqbypS+D
         M53PqMWinnPkS3SGZiTj8PDaY006KmiYwjLHuG2n1zN5vlFFVRoAc6rxBZb7L0Lu8Coz
         wHzHcEihy8zurU8li29Oo6MyH3ifn8MkaLnbQaezrR99cvM8mHjToAsIhur9X+EEFkkr
         N6zq8QP2ZH0YzUjwiOncsj644+q4mGx0j4/iPjUHOHdW766KqiRAE3vo1iMMC31CAx/u
         HyUA==
X-Forwarded-Encrypted: i=1; AJvYcCUbz1mNlA4yrxrRTQINl3fDDoVba740uAeB95BVjv6brhqosrENZ3Lr7mvo81gzIcl3MbK5zLKP12Hx+7cLJKEysfPqcHsQF8a/etpY/Eo=
X-Gm-Message-State: AOJu0Yz+kn8bRmMGgVuZwoNS8Rh0KsgBvzhSXLxA9PW9uMgcxAqoAkAS
	MCoa/GO2BaS+tugoBP0+K9Kn/tYmEA6ycOTybIRH13vwk9G9nuPxYfo29yTYYX/zz0W/v05ntLp
	2i2GQ9g/ZkNHWKTD76K7xezX2iuA=
X-Google-Smtp-Source: AGHT+IGyz/vODStqwszR7Wf19fR5jf37KNSPrLsPZpFfGbom639FauyYHW/teu5r4SG/CqN4bOaQRl9IvvkR3RV3jH4=
X-Received: by 2002:a05:622a:45:b0:440:6345:257f with SMTP id
 d75a77b69052e-447cbf9c277mr62283141cf.60.1720195521161; Fri, 05 Jul 2024
 09:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240705145910.32736-3-andreistan2003@gmail.com> <36ad6b62-9186-41e3-bfa7-7a6d81d9efe1@suse.com>
In-Reply-To: <36ad6b62-9186-41e3-bfa7-7a6d81d9efe1@suse.com>
From: Andrei Stan <andreistan2003@gmail.com>
Date: Fri, 5 Jul 2024 19:05:08 +0300
Message-ID: <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>
Subject: Re: [PATCH] tools/libs/store: add missing USE_PTHREAD to target .o
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 6:22=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>
> On 05.07.24 16:59, Andrei Stan wrote:
> > Currently only shared libraries build with USE_PTHREAD enabled.
> >
> > This patch adds the macro also to xs.o.
> >
> > Backport: 4.18+ # maybe older
> > Signed-off-by: Andrei Stan <andreistan2003@gmail.com>
>
> Commit dde3e02b7068 did that explicitly, stating that phtreads are
> not compatible with static linking.
>
> Was that reasoning wrong?
>
> Juergen
> ---
> > ---
> >   tools/libs/store/Makefile | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
> > index 0649cf8307..c6f147c72f 100644
> > --- a/tools/libs/store/Makefile
> > +++ b/tools/libs/store/Makefile
> > @@ -20,6 +20,7 @@ CFLAGS +=3D -include $(XEN_ROOT)/tools/config.h
> >   CFLAGS +=3D $(CFLAGS_libxentoolcore)
> >
> >   xs.opic: CFLAGS +=3D -DUSE_PTHREAD
> > +xs.o: CFLAGS +=3D -DUSE_PTHREAD
> >   ifeq ($(CONFIG_Linux),y)
> >   xs.opic: CFLAGS +=3D -DUSE_DLSYM
> >   endif

It was a pretty nasty situation, giving some context, this is for a Go base=
d CLI
tool and some things in there are multithreaded, but i don't think
calling in the
bindings happens anywhere in parallel. Without this patch there would be
some sort of race conditions (or so I assume from the debugging i've done)
happening withing the xen/tools code, making it impossible to start a domai=
n.

In this case there were no issues in linking pthreads statically. I was not=
 even
aware of that being a possible issue. Is it really?

Also I am not too sure how much that code path is actually tested, probably=
 the
majority of the testing is done with dynamic builds.

Andrei

