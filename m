Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E78275C4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663663.1033740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsqI-000662-6k; Mon, 08 Jan 2024 16:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663663.1033740; Mon, 08 Jan 2024 16:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsqI-00063T-3L; Mon, 08 Jan 2024 16:51:14 +0000
Received: by outflank-mailman (input) for mailman id 663663;
 Mon, 08 Jan 2024 16:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMsqH-00063N-0D
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:51:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20509442-ae46-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 17:51:11 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a28b2e1a13fso205267466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 08:51:10 -0800 (PST)
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
X-Inumbo-ID: 20509442-ae46-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704732670; x=1705337470; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WaHnU3/ZudBvG3cVJfM9gLdVXX0MnWBGS/ZUJqrzKs=;
        b=He08l45RLPT8AlkW9QBW8+KfbVbWS9JM8APCvT3Br8Hzewht1uHjlUaswgEbs7GMYy
         yhtxprsfY3bs/icMC6WH37CotIysEGsLlaYGJeXFMl6+/V6wLiuETfPnN1GZFq+MWWk4
         rDWbGgWCQVBk6ut8o5dS1ikFtZbNsWx9mEyHa8viOi11vw0Ak1Ehv1iVFK0zoXDRCnXS
         etQQSRwh4t3rWN6P1M6vGLCYb1k3QRRf5ff/mQ8irhdXJlCm/R98frq+lusil+duoUsL
         2+RbgiKJai/KVhb9LtNh01ZjbYahmKR2dsfMydAxS+RVAYiWU/DNLmXVexHmSY5Tef+b
         Bgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704732670; x=1705337470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WaHnU3/ZudBvG3cVJfM9gLdVXX0MnWBGS/ZUJqrzKs=;
        b=LPxMFF4f/r5Sbr40+RVI43nMOWhLvBirJqh3oFzxlMARXM6abVGuv4DzeEX5l1Ve3r
         EeQkE9Ckec1puH2ggIpQtJEpKBSN8k5XleLp0dg0DbagiUMjZR9mgRuauIHHntBNZTOF
         S3vbiPEWXm+p2yOOPfaorQ8IUDkZaGbxY81SKiFVD/fIvB6qxBn+h414s6J76UJ68pXR
         Z1dRldvQQ7iINNj93tqS647CpS7bEYJsCmWkzm9Dhhp3LiWXBVU8fDr5fmu0bcAQpHpv
         4qg01SSozYtP3XMhpjLZeKYGKCUf1trdhcvVeeTwvT1SjvpJ93Moy5mFsL/pP7n/vRDL
         OIXg==
X-Gm-Message-State: AOJu0YwyulQ83Y1cUmpNTPgNf0J4PyJZwu3ngsxptrdI0SWuxQEEWQ/N
	YMua+77qxkMAlauAR0Cfyx37xC8ztJ0kWM/NKI3UqH9FbIAGfg==
X-Google-Smtp-Source: AGHT+IGVonQ2SZxHRKSz9clZ7lQwz+S8650cxdvcq3UgwZVKJM4Pr+DRA9Hc2CUaKPhFR+T78uEKw4CL6IB798+Ll88=
X-Received: by 2002:a17:907:928c:b0:a28:f5bf:ea68 with SMTP id
 bw12-20020a170907928c00b00a28f5bfea68mr1818583ejc.58.1704732670424; Mon, 08
 Jan 2024 08:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech> <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org> <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
 <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org> <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
 <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org> <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com>
 <08b7535e-da40-4578-b865-9b350ace379c@suse.com>
In-Reply-To: <08b7535e-da40-4578-b865-9b350ace379c@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 17:50:59 +0100
Message-ID: <CAG+AhRXAY1TX-z2Aw0F1oEOKY=pjU9dV+C+hu4aPjF8H2Uj=Ng@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>, 
	Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Jan 8, 2024 at 5:40=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.01.2024 17:31, Carlo Nonato wrote:
> > On Mon, Jan 8, 2024 at 4:32=E2=80=AFPM Julien Grall <julien@xen.org> wr=
ote:
> >> On 08/01/2024 15:18, Carlo Nonato wrote:
> >>>> No. I am saying that that we should not be able to allow changing th=
e
> >>>> colors after the memory has been allocated. To give an example, your
> >>>> current code would allow:
> >>>>
> >>>>     1) Setup the P2M pools or allocate RAM
> >>>>     2) Set the color
> >>>>
> >>>> This would render the coloring configuration moot.
> >>>>
> >>>> Whether we want to allow changing the coloring before hand is a
> >>>> different question and as I wrote earlier on, I don't mind if you wa=
nt
> >>>> to forbid that.
> >>>
> >>> At the moment I'm relying on the toolstack in the sense that I know t=
hat it
> >>> will set colors right after domain creation and before memory allocat=
ion.
> >>> Calling alloc_domheap_pages() without a coloring configuration makes =
Xen
> >>> crash, so it's mandatory to have the configuration done before any al=
location.
> >>> I know that we shouldn't rely on the toolstack this much, but I didn'=
t
> >>> find a better way. Given this assumption, looking for an already exis=
ting
> >>> color configuration of a domain is sufficient to avoid what you are s=
aying.
> >>>
> >>> Is it possible to enforce such a constraint with domctl? > I mean to =
be sure that this domctl will be called at a precise time.
> >>
> >> Yes. You can...
> >>
> >>>
> >>> Thanks.
> >>>
> >>>>> I don't know what to check that.
> >>>>
> >>>> You can check the size of the P2M pool (d->arch.paging.p2m_total_pag=
es)
> >>>> is still 0. I think for RAM, you can check d->tot_pages =3D=3D 0.
> >>
> >> ... reject the call if either of the two fields are not zero.
> >
> > What I'm saying is that Xen would crash before even reaching this point=
 if no
> > colors were provided. Let's say that the toolstack or whatever hypercal=
l user
> > isn't calling this domctl at all (or not at the right time), then the d=
omain
> > colored allocator would always return null pages since there are no col=
ors.
> > We would have a crash and your if (or mine) would be useless.
>
> Why is it that you can't simply allocated arbitrary memory if coloring
> information wasn't set up front? Aiui that'll be required anyway, as
> there shouldn't be a restriction that all domains have to use coloring.

If coloring is enabled all domains are colored. It's one of our first
assumptions. We haven't developed something that works hybridly and support=
ing
that would require some rework.

> Jan

