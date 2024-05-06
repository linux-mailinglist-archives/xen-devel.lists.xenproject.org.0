Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D336C8BD1DC
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 17:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717748.1120260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40fZ-0003B0-Ax; Mon, 06 May 2024 15:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717748.1120260; Mon, 06 May 2024 15:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s40fZ-00039U-7z; Mon, 06 May 2024 15:54:25 +0000
Received: by outflank-mailman (input) for mailman id 717748;
 Mon, 06 May 2024 15:54:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2hIh=MJ=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s40fY-00022I-BI
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 15:54:24 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8ae7452-0bc0-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 17:54:23 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso536211766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 08:54:23 -0700 (PDT)
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
X-Inumbo-ID: e8ae7452-0bc0-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1715010863; x=1715615663; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRtgzqc0FbKV9K3Jo+wyMI1HnW4CFqr0A/4aRlfTRjw=;
        b=kqr+tM3W1TXvjku12srnXQxEFepH915LsmkWX3PxTeZT2HwWB6Oz1zKAB5+8xWZOP9
         7LTZSuwumx/5iW1+nJpUU8PagnELfp1fIgLmEaR4FoYZMz3viMIDWsjXiJZmGqyaiXDJ
         saTAeHl3csxbO/E07n/yUufKRAMa4SxPooje7Q1YH/rl43FufthNPg88YAhQ6n3RyL/N
         nDQ2UTCfTHUXDdmZtRPjDkqupUY2XYB5ChuaxvhnTSW+uJE4M/QqskhRw/sfN7dU9BTa
         zjEj7FnMM0IFV7tAo8zc+mV4R0deecNubve8+nAsPQIwh1yPTib+nh2AFGIIRQskFPvO
         oQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715010863; x=1715615663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRtgzqc0FbKV9K3Jo+wyMI1HnW4CFqr0A/4aRlfTRjw=;
        b=GY97g1YUz8GKp2WUp31RvzUBmYsqBa90KhVE8NIRjsrsdYH6AAI/24TB3c2GPPP7wB
         ZuEQZZ+cwyYo9cLUA6Ae8RtZc+AmNbaJmVwhnw6xHar6466oJkn8ZNtdgYxH9woXi9n6
         Gqk4i67S5xm3goGqTIes16qF4axQ83f1dxUhGpNxbdYRixkufpew3M+X6QNrDFC/Abgq
         xZu77oSRnHmG0mfx6G74OlDEZylrd8Eofd2S/JlXSRemGstHKjMHD9+StTgLYVTyfno8
         8GCcud643Gqknz2/D0YTgObTsLqAFVkcTdZpkWe70t+5z2A6JY06tCUH4vut4i6ts4Lr
         +xyg==
X-Forwarded-Encrypted: i=1; AJvYcCWKhiyapjtXlVv0wN5WKtYxr0Qwf2s3RB5J+jT9tZfMZZALxxmzx8c25b0JwT+1EMySU+qOeX8z/jUzeZbsgLLAVdk5q4+9K8hPBlpAHuE=
X-Gm-Message-State: AOJu0YwZ6XPJmMHNmqa5DCDGhirejIfrEiKOn9cZgnEJHx2KNFtYwy/z
	dwPQXAm77AlnFb/Z7inWQi8mg+dozDymQhn1MT1AAuq50ikWSss7XCqM/R1sxK8Toumu+0o6wj6
	GJ6Okt/7r6YQLcPIFsX8Mai380eAh75fkmbxvtA==
X-Google-Smtp-Source: AGHT+IFIYlFrBPt6c5eh54nU/XVUqczBUnaMSB29KBVhqtB6a1kce1oJ0Rk4BthBMe7u+ybROSup9zp+0Wmp8jhtCk4=
X-Received: by 2002:a17:906:6a05:b0:a59:c3d0:5508 with SMTP id
 qw5-20020a1709066a0500b00a59c3d05508mr5372568ejc.35.1715010863454; Mon, 06
 May 2024 08:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-9-carlo.nonato@minervasys.tech> <674578c8-8243-40f6-ad90-28f9b76a42fd@suse.com>
In-Reply-To: <674578c8-8243-40f6-ad90-28f9b76a42fd@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 6 May 2024 17:54:12 +0200
Message-ID: <CAG+AhRVo74yzSRuRe8g16a+ySnmmLw11R8DARfacafdn1M9+FQ@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, May 6, 2024 at 2:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.05.2024 18:55, Carlo Nonato wrote:
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -159,6 +159,7 @@
> >  #endif
> >
> >  #define PGC_no_buddy_merge PGC_static
> > +#define PGC_preserved (PGC_extra | PGC_static)
>
> Seeing this again and its use ...
>
> > @@ -1426,11 +1427,11 @@ static bool mark_page_free(struct page_info *pg=
, mfn_t mfn)
> >      {
> >      case PGC_state_inuse:
> >          BUG_ON(pg->count_info & PGC_broken);
> > -        pg->count_info =3D PGC_state_free;
> > +        pg->count_info =3D PGC_state_free | (pg->count_info & PGC_pres=
erved);
> >          break;
> >
> >      case PGC_state_offlining:
> > -        pg->count_info =3D (pg->count_info & PGC_broken) |
> > +        pg->count_info =3D (pg->count_info & (PGC_broken | PGC_preserv=
ed)) |
> >                           PGC_state_offlined;
> >          pg_offlined =3D true;
> >          break;
>
> ... here: Shouldn't PGC_broken also be included in PGC_preserved?

I hope there are no other problems like the one with PGC_extra.

> > @@ -2484,6 +2485,11 @@ struct page_info *alloc_domheap_pages(
> >          }
> >          if ( assign_page(pg, order, d, memflags) )
> >          {
> > +            unsigned long i;
> > +
> > +            for ( i =3D 0; i < (1UL << order); i++ )
> > +                pg[i].count_info &=3D ~PGC_extra;
>
> For larger order this loop is non-trivial and may have a fair effect on
> caches. Looking at the code just outside of upper patch context, is this
> loop needed at all when MEMF_no_refcount is clear in memflags?

Nope. I will wrap it in a if.

Thanks.

> Jan

