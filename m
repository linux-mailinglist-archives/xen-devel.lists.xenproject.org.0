Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D5934E32
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 15:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760515.1170374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sURCm-0004zs-Fh; Thu, 18 Jul 2024 13:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760515.1170374; Thu, 18 Jul 2024 13:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sURCm-0004xA-Cs; Thu, 18 Jul 2024 13:29:56 +0000
Received: by outflank-mailman (input) for mailman id 760515;
 Thu, 18 Jul 2024 13:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lg7+=OS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sURCl-0004x4-0D
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 13:29:55 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf8d34ab-4509-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 15:29:52 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721309388922493.58134258535154;
 Thu, 18 Jul 2024 06:29:48 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6687f2f0986so4737777b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 06:29:48 -0700 (PDT)
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
X-Inumbo-ID: cf8d34ab-4509-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1721309390; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cZ23MYKavM1RJMiGwa1msFpgkXlp661KvmA6cGN3zRQ4u87gHGWf+4++UlAgdz8rUAOlrnK8WWUeFadQTuBYjlMdAi6lSWxj4Av+WTrOtqXPO6ySZXRI7Hjg7oEIRav+DxFxuobJ83V4N+92LJReJ6ZsNrbi79uAokJwNdRURFQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721309390; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UCUI3K0rUfwvjg2A23hId1M7TJ1G+zKDt+3xFAr6dtc=; 
	b=O2YKqyqqm+0W7VqZevgWowtvyUk6wiS5OXOKdMmu6Bdysgq0/j7TY5+3FFaBxWiERLXyrpjbOAqliHGnKt3GnYh30OnNCUy+duog6HeB9flaKK44GJH3E4k/3u7eRwvJzMXUiH36ipAVVpLsR1O5FZXAsyVicwNiZaPdQ0IvgXA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721309390;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UCUI3K0rUfwvjg2A23hId1M7TJ1G+zKDt+3xFAr6dtc=;
	b=C4L/1Lk/aKbSy3u/B64fdZOtKlK78StD9SuKMduTHovz9ymp3RP1T4E/anazkmBF
	Br6h0eoTKMkDca3IV3NuOddzbopfQOuDWDPKFACw360CkvaNi67N6A4HwfQnvZQ5Pmm
	E8F9U0D6eaYUW0YKO1+EDKlO8OCm9hJbIXWxWRow=
X-Forwarded-Encrypted: i=1; AJvYcCV55KFjDL1W0oHWLt47WqyyokFtmWeJa6aV82MpP1fD4glRhDfNQY936DyGtPePS5Gqot6m1xn+LwhK6/MHc5Q2pvrLu87TyqeK0goldkI=
X-Gm-Message-State: AOJu0YyObswsUxftnxj30Tv822X+UQRkhrpeuD6qAgcGbzAKMYTw5r89
	LCtTDpP18Zhluo+oqPdqyV3zrQ8sad1YBS//xH6K+VxBvTabix2YlgRi+vG+OLOMtIdGIh34DTP
	XYWm0pGY7MOkSriIjP8lNJ16ENqg=
X-Google-Smtp-Source: AGHT+IEitQhdmoEWWf8TMzF5pcYyVofkvQI8rm6TRAG0vxi15B4qT8VsByL5z1wP6UG2npaoBXlRV+l+pXSsF5gQ3n8=
X-Received: by 2002:a05:6902:2686:b0:df1:d116:3f19 with SMTP id
 3f1490d57ef6-e05fec5713dmr3249512276.52.1721309388125; Thu, 18 Jul 2024
 06:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com>
 <53e3356e-4cc1-475a-91a1-8fc17fda07ab@suse.com> <CABfawhkLCziShB6x5J1OXL=M6AqquL-9SpTCQRVDNCeu_dqPNw@mail.gmail.com>
 <93a47d78-dcfb-46d4-ae1a-2854971fe107@suse.com>
In-Reply-To: <93a47d78-dcfb-46d4-ae1a-2854971fe107@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2024 09:29:11 -0400
X-Gmail-Original-Message-ID: <CABfawhnuUYPAtxtm68C_dO5iPjDd4=k9R5nQNvGF88ixgS8WsQ@mail.gmail.com>
Message-ID: <CABfawhnuUYPAtxtm68C_dO5iPjDd4=k9R5nQNvGF88ixgS8WsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Add scripts/oss-fuzz/build.sh
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 9:03=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 18.07.2024 14:54, Tamas K Lengyel wrote:
> > On Thu, Jul 18, 2024 at 7:17=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 26.06.2024 00:47, Tamas K Lengyel wrote:
> >>> +cd xen
> >>
> >> This looks to suggest that the expectation is for the script to be inv=
oked
> >> from the root of a xen.git clone. Imo something like
> >>
> >> cd $(dirname $0)/../../xen
> >>
> >> would be more flexible.
> >
> > No, it will be invoked after a git clone is made, so you have to enter
> > the xen folder that was just cloned.
>
> Yet the suggested alternative would still work then, wouldn't it? And
> it would permit easier use of the script from outside of that very
> specific environment, e.g. when wanting to re-invoke it without
> running a full cloning process every time.

This script is specifically made for that one environment and is not
intended to be invoked from anywhere else. I don't think we need to
complicate this needlessly.

>
> >>> +make clang=3Dy -C tools/include
> >>> +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-harn=
ess
> >>
> >> In how far is it a requirement to have "clang=3Dy" here? Wasn't this q=
uestion
> >> even asked before? I'm not even sure whether mid- or long-term we mean=
 to
> >> retain that functionality. Overrides of tool chain (components) may be=
tter
> >> be done using CC=3D and friends. Plus perhaps by whoever is invoking t=
his
> >> script?
> >
> > It is an absolute requirement to use clang=3Dy here as oss-fuzz uses a
> > specific clang as compiler for C/C++ projects. The CC environment
> > variables are already set by the oss-fuzz docker environment but it's
> > insufficient for a successful clang build. Without clang=3Dy the
> > following error is encountered:
> >
> > gcc: error: unrecognized debug output level 'line-tables-only'
> > gcc: error: unrecognized argument to '-fsanitize=3D' option: 'fuzzer-no=
-link'
>
> Could you add a sentence to this effect to the description?

Sure.

Thanks,
Tamas

