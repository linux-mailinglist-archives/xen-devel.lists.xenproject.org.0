Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2A0827536
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:32:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663604.1033620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsXH-0002LQ-VM; Mon, 08 Jan 2024 16:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663604.1033620; Mon, 08 Jan 2024 16:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsXH-0002It-RQ; Mon, 08 Jan 2024 16:31:35 +0000
Received: by outflank-mailman (input) for mailman id 663604;
 Mon, 08 Jan 2024 16:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMsXG-0002HX-50
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:31:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61ca7a5f-ae43-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 17:31:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a29058bb2ceso217034366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 08:31:32 -0800 (PST)
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
X-Inumbo-ID: 61ca7a5f-ae43-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704731492; x=1705336292; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIQW8FKTCleObw0Tk7lwpx5cmSibHJaxWndQxG8unQY=;
        b=Rp8/h2dC7KU79Kp6mSyB6Ozabo1A6KTbBziAbx+b/Ku2dKXMPHQJxv+F/OvVZ6o6ID
         xWsy8iMHmsG1rlamMSBkS2ELHP56eD/E2To8wmqjV8/QCyPXgrD/nrJwYHlJB/n7KTKw
         HSq9Xv3q/A3sREMpoDg1ssj2oseaaowCSnMNespued7Aksfqn9rd1tPq41owtnXhEyxq
         H8tuvm3VKoWXZCANuCF2qmbZ2ctXn620Dy4EzF1KPkrr8RRkwa4jwMAig3drMO1vBxKK
         Gka+pk2lFPknoAQ1oWwBZadnqEK/qKsYoLCK+Hv320t7cC57uIUOLa0KxRuyt3tAoADs
         8tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704731492; x=1705336292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIQW8FKTCleObw0Tk7lwpx5cmSibHJaxWndQxG8unQY=;
        b=YnzAMFeztQGLKZ6PQUHruYQOaZOrkCv6VS1P+5sGp/LVvM04jYSa267wkpeCVo7xdf
         bGI2HwJqpmR5/nJELW4DJb9PbCAjb/Ufe6ZlfpnmODtZC/wEbjfOGcNWPD+mIg+j177X
         Pw/4DUv3S1iXiN6k5JDdIdK2R3bMIk+5KS8cbmpEQY9AzC4M8HYlG/CyKq+Tqtfdc7uK
         qBCWgBXJwq+CJoXxj0VCp1l/JDa5JCByChfuYCZiErHDCoeJK5N4hBasU77lI8PSXTjy
         v2b9dvXTJy0JjKA9RsdAwKBrOCXa96Mmwj0Gu1/llZlkPiCYl5W7/Jj67yBOo2W6l1A6
         cqxw==
X-Gm-Message-State: AOJu0YxPsN25V0KPyFEBDc5EFOi4f7WWvMXu83v9NqvcUKQgcIO5WYOZ
	2z/PQ4wHqzmGVCZFsE3VnKAXSI6qRVPR90XM27m43gzqW87izg==
X-Google-Smtp-Source: AGHT+IFaiFtWI4iz5mn7ZFIzhMmwCfouIvWWIZZFsaiPHUPOn/vUmLbumwfR6s5XCEAr4wnJNEgRjHGHNOskLqc67pE=
X-Received: by 2002:a17:906:19c:b0:a2a:2541:3f16 with SMTP id
 28-20020a170906019c00b00a2a25413f16mr1003629ejb.121.1704731491790; Mon, 08
 Jan 2024 08:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech> <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org> <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
 <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org> <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
 <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org>
In-Reply-To: <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 17:31:20 +0100
Message-ID: <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
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

On Mon, Jan 8, 2024 at 4:32=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 08/01/2024 15:18, Carlo Nonato wrote:
> >> No. I am saying that that we should not be able to allow changing the
> >> colors after the memory has been allocated. To give an example, your
> >> current code would allow:
> >>
> >>     1) Setup the P2M pools or allocate RAM
> >>     2) Set the color
> >>
> >> This would render the coloring configuration moot.
> >>
> >> Whether we want to allow changing the coloring before hand is a
> >> different question and as I wrote earlier on, I don't mind if you want
> >> to forbid that.
> >
> > At the moment I'm relying on the toolstack in the sense that I know tha=
t it
> > will set colors right after domain creation and before memory allocatio=
n.
> > Calling alloc_domheap_pages() without a coloring configuration makes Xe=
n
> > crash, so it's mandatory to have the configuration done before any allo=
cation.
> > I know that we shouldn't rely on the toolstack this much, but I didn't
> > find a better way. Given this assumption, looking for an already existi=
ng
> > color configuration of a domain is sufficient to avoid what you are say=
ing.
> >
> > Is it possible to enforce such a constraint with domctl? > I mean to be=
 sure that this domctl will be called at a precise time.
>
> Yes. You can...
>
> >
> > Thanks.
> >
> >>> I don't know what to check that.
> >>
> >> You can check the size of the P2M pool (d->arch.paging.p2m_total_pages=
)
> >> is still 0. I think for RAM, you can check d->tot_pages =3D=3D 0.
>
> ... reject the call if either of the two fields are not zero.

What I'm saying is that Xen would crash before even reaching this point if =
no
colors were provided. Let's say that the toolstack or whatever hypercall us=
er
isn't calling this domctl at all (or not at the right time), then the domai=
n
colored allocator would always return null pages since there are no colors.
We would have a crash and your if (or mine) would be useless.

Let's say that now the domctl is called at the right time (no p2m,
no tot_pages, no colors) then we can set the colors and everything works.
From this point other calls to this domctl would be skipped because of your
if which is equivalent to mine (checking for colors existence).

Also bringing in checks on p2m would require arch specific code which I was
trying to avoid.

Thanks.

> Cheers,
>
> --
> Julien Grall

