Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703349670ED
	for <lists+xen-devel@lfdr.de>; Sat, 31 Aug 2024 12:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787170.1196787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skLRh-0003Ld-Lu; Sat, 31 Aug 2024 10:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787170.1196787; Sat, 31 Aug 2024 10:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1skLRh-0003JU-IP; Sat, 31 Aug 2024 10:35:05 +0000
Received: by outflank-mailman (input) for mailman id 787170;
 Sat, 31 Aug 2024 10:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aJHj=P6=gmail.com=andreistan2003@srs-se1.protection.inumbo.net>)
 id 1skLRf-0003J5-PF
 for xen-devel@lists.xenproject.org; Sat, 31 Aug 2024 10:35:03 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ade34c8c-6784-11ef-a0b2-8be0dac302b0;
 Sat, 31 Aug 2024 12:35:02 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f43de7ad5eso34236351fa.1
 for <xen-devel@lists.xenproject.org>; Sat, 31 Aug 2024 03:35:02 -0700 (PDT)
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
X-Inumbo-ID: ade34c8c-6784-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725100502; x=1725705302; darn=lists.xenproject.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vp4mGUlDvX+G4B1zSiMFicm8aeYBFuP7Y0BdM/0FuA=;
        b=E/MP5SE0XzPSrXQysOxLTk8uM8E+eV6v7GK1txqvYt2lL6n/+jMPiHg83vx/lM0sOk
         wh0AMOv0JdtLmcnyKu3e2pOBbtBlAXzwsRMeTMkF+QLjGYPfc+w8q+Ej1vCgD/k93Nmu
         iV9topfQrr3qf/ht92N8Q2+KDuopNjkjnVMDlPLKtbrFULo4ATHNwvmcUCs1jCs1B7TM
         5kkFWYBPT8wK5g3eLH46OMeCW2r4usdVKM94ttQ5cZSRvn6p/XbqrIVOe73AMr+Atq73
         h7mElqzgPL4y28d1Hmw5/8580yRjXsAj9rEwtq9aoj7tmp9V0lRnVi1v0AmL/kZZdckK
         D1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725100502; x=1725705302;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vp4mGUlDvX+G4B1zSiMFicm8aeYBFuP7Y0BdM/0FuA=;
        b=O/F04xw7zabpOKwNCof+BJ6DlMz1e8Nnc3BzPONQYzj9TmyT14zQi0dMePPxAdE08p
         poVPwhzNi2/UUm2tpST043Ty3SlURMooj9C6h+Ttd/cl+FJSuPxC14Oz0k8CtwwULcCm
         G56SRszwUodO/V/i8HHp2XxQOhAbmS8X6hmLUQO2O2eL2qkKTLCWCsfjXgfuNTHIDAWJ
         90s4QT0vFpXok3APwPVZbMFaNo2ccvtUY3RXUip1lxF+hisAS2mFuOeYnlgq9X1agzjo
         gUS8yvKslRREL8qP+IvrKvyGyavBUe16VKXzALCdRa9upMiSTQ8gXXfN6rZpQpnsvVCb
         hHhA==
X-Forwarded-Encrypted: i=1; AJvYcCWH0mjTTtXIIv/owwnw+JB73nk4aAkIFwHdbRjaVxlfbnKkI1gyb9WLYk+VWkNpEkYyRFXkQuTsZjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6hlHHhaXZMhnWHnabL0AdT8F/Jp+yn15BGcZVzaeOUD2UzzW8
	zQO9LDucfr6Aqof7GiUQ3t7V8YS8/Xuzt1kCQyO2AaOaIf9uEkDCGgVG0NrLw2j8ir36wQnq1p7
	/fLT638PMnc07UOfEtSwv9fnped4=
X-Google-Smtp-Source: AGHT+IGMQEa5e257zADNZ8fbMUCl11zGub1Bk0+6OLjFFi3i7SDNX9UQ6AfnSvvvdHYUJvRh3b6ZX1JIJykY6UxAy8Y=
X-Received: by 2002:a2e:bc0b:0:b0:2ef:251f:785 with SMTP id
 38308e7fff4ca-2f6265503femr16031491fa.1.1725100501506; Sat, 31 Aug 2024
 03:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240705145910.32736-3-andreistan2003@gmail.com>
 <36ad6b62-9186-41e3-bfa7-7a6d81d9efe1@suse.com> <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>
In-Reply-To: <CAH=Ecdj8PThEpMckjbciHhxK6H4K0qeympJvd5uQ=pX_G6rOFQ@mail.gmail.com>
From: Andrei Stan <andreistan2003@gmail.com>
Date: Sat, 31 Aug 2024 13:34:50 +0300
Message-ID: <CAH=EcdidfuPaxxL-Fz29KZ4ZeDTDVwcEWgTv6G2Z3EP7mcEZ9A@mail.gmail.com>
Subject: Re: [PATCH] tools/libs/store: add missing USE_PTHREAD to target .o
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
	Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

On Fri, Jul 5, 2024 at 7:05=E2=80=AFPM Andrei Stan <andreistan2003@gmail.co=
m> wrote:
>
> On Fri, Jul 5, 2024 at 6:22=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@suse=
.com> wrote:
> >
> > On 05.07.24 16:59, Andrei Stan wrote:
> > > Currently only shared libraries build with USE_PTHREAD enabled.
> > >
> > > This patch adds the macro also to xs.o.
> > >
> > > Backport: 4.18+ # maybe older
> > > Signed-off-by: Andrei Stan <andreistan2003@gmail.com>
> >
> > Commit dde3e02b7068 did that explicitly, stating that phtreads are
> > not compatible with static linking.
> >
> > Was that reasoning wrong?
> >
> > Juergen
> > ---
> > > ---
> > >   tools/libs/store/Makefile | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
> > > index 0649cf8307..c6f147c72f 100644
> > > --- a/tools/libs/store/Makefile
> > > +++ b/tools/libs/store/Makefile
> > > @@ -20,6 +20,7 @@ CFLAGS +=3D -include $(XEN_ROOT)/tools/config.h
> > >   CFLAGS +=3D $(CFLAGS_libxentoolcore)
> > >
> > >   xs.opic: CFLAGS +=3D -DUSE_PTHREAD
> > > +xs.o: CFLAGS +=3D -DUSE_PTHREAD
> > >   ifeq ($(CONFIG_Linux),y)
> > >   xs.opic: CFLAGS +=3D -DUSE_DLSYM
> > >   endif
>
> It was a pretty nasty situation, giving some context, this is for a Go ba=
sed CLI
> tool and some things in there are multithreaded, but i don't think
> calling in the
> bindings happens anywhere in parallel. Without this patch there would be
> some sort of race conditions (or so I assume from the debugging i've done=
)
> happening withing the xen/tools code, making it impossible to start a dom=
ain.
>
> In this case there were no issues in linking pthreads statically. I was n=
ot even
> aware of that being a possible issue. Is it really?
>
> Also I am not too sure how much that code path is actually tested, probab=
ly the
> majority of the testing is done with dynamic builds.
>
> Andrei

