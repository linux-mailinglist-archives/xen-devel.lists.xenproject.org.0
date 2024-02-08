Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BDF84D77F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 02:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677963.1054924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXt6i-00021F-G8; Thu, 08 Feb 2024 01:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677963.1054924; Thu, 08 Feb 2024 01:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXt6i-0001yL-Cd; Thu, 08 Feb 2024 01:21:40 +0000
Received: by outflank-mailman (input) for mailman id 677963;
 Thu, 08 Feb 2024 01:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ajo=JR=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1rXt6h-0001yF-4x
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 01:21:39 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65db1260-c620-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 02:21:36 +0100 (CET)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179]) by mx.zohomail.com
 with SMTPS id 1707355292168575.4124404708025;
 Wed, 7 Feb 2024 17:21:32 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc6d8f19ab3so1450572276.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 17:21:31 -0800 (PST)
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
X-Inumbo-ID: 65db1260-c620-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; t=1707355293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EFwFtv9vPRT/UZpBPHJAh/BaaRDx6jneI/Xhu3SB3I4tpe5krIHGc2bREayelCUoj4K5jt/t2Vgn4z4lGqVBJ9jc53XYWDVZhkHDeaotOHnH4Z/OCN3KBE0dEu3C8dZUlAyUMbTtWGlk6lDs08c0JjxYXyTKXx9EpYC94VnPfEA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1707355293; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rr7/ceTMxDTm0VhdI7nT/NNQsHRms8IddkEL0Jw0XmY=; 
	b=Ttqvofzp6NkOt/NxSMmOeE7qjfh/snixgSmOj5A91u0dFyZmPjM6n5hVkyW/2LngLbONq17LSQvMpmauBpsw5zidoHo1K9XO0qlPlHknJ9CsAQlNgB4YkGoPkmYX4U4JGvsU8YUOMmwg2RE2wQ+AQRvajTyNCFI2bFGnw5L/3j8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1707355293;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rr7/ceTMxDTm0VhdI7nT/NNQsHRms8IddkEL0Jw0XmY=;
	b=DKyiz+vqy9OEZHpVAW9NggrFZgkn8EFZieQ6F01LtBMPJUFvHL9NYT82h0Q4TDZg
	oAE6DdtLmmRwy3JAqtuFoW0wM3/g9R/8H5nzAqufBRkb1euHOLTEbKKkbAvGNushjhk
	LYKrzu8Un0F/QFBEpP1BO+VQiGeqGVvxmdaQKKWM=
X-Gm-Message-State: AOJu0YyKYn3sa0ClpyrIMOIdjHKNocli8zQzuFx0MsVJwrLuVSQBIMuM
	zaBxUKnlWQuz28Fodgs4guHGhM89OQkFPhyQLX8YuRTvxUYufvTM4dtFaY4lbRXUy8U2sYyZ7+Z
	tlcIqbjY35QuQ+y86H2ADwO3xlTw=
X-Google-Smtp-Source: AGHT+IGsJp5QI8+AzgmR/lXMCHfxTydK2C8ctmt5+QZBI/QI0XUx4PmSSXcWUFQsMto6Jj6EkAIzz5aFRg2vF/ODZTw=
X-Received: by 2002:a05:6902:1a45:b0:dc6:b8f5:50ae with SMTP id
 cy5-20020a0569021a4500b00dc6b8f550aemr7357185ybb.32.1707355291123; Wed, 07
 Feb 2024 17:21:31 -0800 (PST)
MIME-Version: 1.0
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
 <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com> <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com>
In-Reply-To: <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 7 Feb 2024 20:20:55 -0500
X-Gmail-Original-Message-ID: <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
Message-ID: <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@cloud.com>, =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>, 
	xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 5:21=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 07/02/2024 1:18 am, George Dunlap wrote:
> > On Tue, Feb 6, 2024 at 6:08=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.c=
om> wrote:
> >> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >>
> >> This patch addresses a behavior discrepancy in the handling of altp2m =
views,
> >> where upon the creation and subsequent EPT violation, the page access
> >> permissions were incorrectly inherited from the hostp2m instead of res=
pecting
> >> the altp2m default_access.
> >>
> >> Previously, when a new altp2m view was established with restrictive
> >> default_access permissions and activated via xc_altp2m_switch_to_view(=
),
> >> it failed to trigger an event on the first access violation.  This beh=
avior
> >> diverged from the intended mechanism, where the altp2m's default_acces=
s
> >> should dictate the initial permissions, ensuring proper event triggeri=
ng on
> >> access violations.
> >>
> >> The correction involves modifying the handling mechanism to respect th=
e
> >> altp2m view's default_access upon its activation, eliminating the need=
 for
> >> setting memory access permissions for the entire altp2m range (e.g. wi=
thin
> >> xen-access.c).  This change not only aligns the behavior with the expe=
cted
> >> access control logic but also results in a significant performance imp=
rovement
> >> by reducing the overhead associated with setting memory access permiss=
ions
> >> across the altp2m range.
> >>
> >> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> > Thanks Petr, this looks like a great change.
> >
> > Two things:
> >
> > - Probably worth adjusting the comment at the top of
> > p2m_altp2m_get_or_propagate to mention that you use the altp2m
> > default_access when propagating from the host p2m
> >
> > - This represents a change in behavior, so probably at least worth a
> > mention in CHANGELOG.md?
>
> This is a bugfix to an tech preview feature.  It's not remotely close to
> CHANGELOG material.
>
> Tangent.  SUPPORT.md says tech preview on ARM, despite there being no
> support in the slightest.  Patches were posted and never taken.
>
> > Tamas, I guess this is OK from an interface compatibility point of
> > view?  In theory it should always have been behaving this way.
>
> Given the already-provided Ack, I expect that has been considered and
> deemed ok.

Correct, this is just a bugfix.

Tamas

