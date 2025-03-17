Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D9DA651E5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 14:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916927.1321932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAwI-0001Z6-Hq; Mon, 17 Mar 2025 13:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916927.1321932; Mon, 17 Mar 2025 13:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuAwI-0001XS-Eu; Mon, 17 Mar 2025 13:55:34 +0000
Received: by outflank-mailman (input) for mailman id 916927;
 Mon, 17 Mar 2025 13:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fdmo=WE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tuAwH-0001XM-Os
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 13:55:33 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dbdece0-0337-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 14:55:31 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac29af3382dso735556766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 06:55:31 -0700 (PDT)
Received: from localhost ([46.149.103.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a49d33sm674984166b.141.2025.03.17.06.55.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 06:55:30 -0700 (PDT)
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
X-Inumbo-ID: 7dbdece0-0337-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742219731; x=1742824531; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMLaqNbjaHo3zTBtrmIcqj6xOEBNVYx4hoPvJh//nHA=;
        b=HVAPAugS8FDdboPiIkmwL8Ayx/71yocMSQWSs2g4xTRAtKG5LyxpAz73lSz/9LsJVz
         49ZxtMwo/BrCSOSNDoBxAJO2PmM/U5oXMgH+vBBSjaMyfQRHJGONII9W/0Qfn6YxROEB
         ukmbHCd6a334VvbwDPdyc9hEiVe/Sc3SCn++w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742219731; x=1742824531;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NMLaqNbjaHo3zTBtrmIcqj6xOEBNVYx4hoPvJh//nHA=;
        b=jlPcNaY1VomKXSluVlCyGoflL56pfDnCRKblb1WnO7U2H/D/DkYyu35N2tKql435OF
         1QEQHzxqLdsL2gXcFOhDZt3IhyGkMBhJeVkFbC5/f4e3Uv8qDXibzCHijJLwNxHNVUYS
         3iK8r7swdi+KC4e5x+kSdco2K8CfAOQ4VaEOhSS4dURjBVRJKVktL59eYYe3SIsHmq5T
         KvUq7Gf07uyElR923xwGNHgDKHwgJ4R9LkbloG0rEKFgF7yCh7KG7lb+DN5eLp/gwl9E
         P3p7hIwVjJWXqqUVkNrPXK0Au7q9XayxhR7/WXyRQ/h41M9wH9Gvz1p+HSFaCv6hvCSb
         Bk5w==
X-Gm-Message-State: AOJu0YxFhmkx6szNt8xA2ZKeDp/xm+JNVZ+cgisWJfuaWFRHrK/Xyp68
	O2UV2VawnKqbMe6JYVR1N6cGcCNmsD0k/241F0f/J3kjVUS6ZUv3lq4SQgaV4YL+MYYXxMiAxQ/
	Eozk=
X-Gm-Gg: ASbGnctJsXQr1NRKl2uNBRL/elt8mr5xMGJ8kHRI/VeM4QIf5+FGKfdYUre2y5ZcwZN
	eKVQ2/6i1Wl9NHWNh4W6q1QuzcIh1rTb/dKjDtfVLC1/xLKhv+JilEBGgOnL9DXqT/Wh6V8pgMh
	r+0HIkTazub6iN3jtKEkGv3TOWpkIHNkk3VWqORMzYMuJY8OqwY0Jz8xw6vE5MVGuhLLtSbSxES
	XQP6uBJINhnwzY+Xle4IKSi6+9JDFpL/l7QubSDO5UaqXI4tJcFqroBpGaaVDWxxIE/NiFELpmT
	Ijf2uOph+bEeV4xv8anopcz55a3KPxmZUISFiR8E3ZN1D6CJ2lD4ZF3GqRt2bQ==
X-Google-Smtp-Source: AGHT+IFoYlnrhf2YMTK9nKlMgxhaXYqMBMZTH39KV3Cu5UhWnN3KkEJF2GPul6cBpNj5PGTCj+mLxg==
X-Received: by 2002:a17:907:a18f:b0:ac3:3f13:98aa with SMTP id a640c23a62f3a-ac33f1398e4mr907743466b.32.1742219730769;
        Mon, 17 Mar 2025 06:55:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 13:55:29 +0000
Message-Id: <D8ILCMMM9QFI.2TWP5REOAE2JB@cloud.com>
Subject: Re: [PATCH v1] x86: make Viridian support optional
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Xen-devel" <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
 <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
 <98bf4aa4-b896-4240-b13a-80a0f964a8b1@suse.com>
 <CAFi36o2sVRrhs7GXpW3Qpnc+VNQBfAzg8zEofqrEjYXz-wgU9A@mail.gmail.com>
In-Reply-To: <CAFi36o2sVRrhs7GXpW3Qpnc+VNQBfAzg8zEofqrEjYXz-wgU9A@mail.gmail.com>

+xen-devel (sent it on private by mistake)

On Mon, 17 Mar 2025, 09:29 Jan Beulich, <jbeulich@suse.com> wrote:

> On 17.03.2025 10:19, Alejandro Vallejo wrote:
> > Hi,
> >
> > I'm surprised this isn't already possible. Neat!
> >
> > On Mon, 17 Mar 2025, 07:19 Sergiy Kibrik, <Sergiy_Kibrik@epam.com>
> wrote:
> >
> >> Add config option HVM_VIRIDIAN that covers viridian code within HVM.
> >> Calls to viridian functions guarded by is_viridian_domain() and relate=
d
> >> macros.
> >> Having this option may be beneficial by reducing code footprint for
> systems
> >> that are not using Hyper-V.
> >>
> >> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> >> ---
> >>  xen/arch/x86/Kconfig                  |  5 +++++
> >>  xen/arch/x86/hvm/Makefile             |  2 +-
> >>  xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++--------=
-
> >>  xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
> >>  xen/arch/x86/include/asm/hvm/domain.h |  4 ++--
> >>  xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
> >>  xen/arch/x86/include/asm/hvm/vcpu.h   |  3 ++-
> >>  7 files changed, 37 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> >> index 6e41bc0fb4..34f9b79d98 100644
> >> --- a/xen/arch/x86/Kconfig
> >> +++ b/xen/arch/x86/Kconfig
> >> @@ -348,6 +348,11 @@ config HYPERV_GUEST
> >>
> >>  endif
> >>
> >> +config HVM_VIRIDIAN
> >> +       bool "Viridian enlightenments support" if EXPERT
> >> +       depends on HVM
> >> +       default y
> >> +
> >>
> >
> >
> > I don't see why this should be gated by EXPERT, provided a
> > suitable (now absent) help message was to exist explaining
> > what it does in plain simple words.
> >
> > For the title, I'd say it needs to properly state it refers to
> > enlightenments for guests, rather than enlightenments for
> > Xen itself when running under Hyper-V. As it is, it sounds
> > ambiguous (Maybe "Hyper-V enlighnments for guests"?).
>
> I'm slightly puzzled: Here you're worried about ambiguity, yet then ...
>
> > On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
> > rather redundant, and I think just VIRIDIAN works just as well
> > while being shorter.
>
> ... you suggest to introduce ambiguity here. I'd expect VIRIDIAN alone
> to cover whatever enlightenments Xen might want to use itself, when
> run on top of Viridian.
>
> Jan
>

For the define name, I did say it it was a matter of preference rather
than a worry. I'm perfectly happy with HVM_VIRIDIAN :)

CONFIG_{HVM_}VIRIDIAN would only be seen in code, where we use that
name exclusively for enlightenments given to a guest, AFAIK, so I don't
see as much ambiguity. Doesn't matter much either way.

However,

Non-Xen-developers rely on nconfig/menuconfig titles and descriptions
alone to make decisions, so not providing adequate background (even
if under EXPERT) seems less than great.

Cheers,
Alejandro

