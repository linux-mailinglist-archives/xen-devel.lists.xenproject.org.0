Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8F7AD556
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 12:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607760.946054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiUx-0001OW-Ss; Mon, 25 Sep 2023 10:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607760.946054; Mon, 25 Sep 2023 10:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkiUx-0001M9-Ps; Mon, 25 Sep 2023 10:07:27 +0000
Received: by outflank-mailman (input) for mailman id 607760;
 Mon, 25 Sep 2023 10:07:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/9uy=FJ=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qkiUw-0001M3-RA
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 10:07:26 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 539d47c9-5b8b-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 12:07:25 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c008d8fd07so99042131fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Sep 2023 03:07:25 -0700 (PDT)
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
X-Inumbo-ID: 539d47c9-5b8b-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695636445; x=1696241245; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcX4KE7rnHqRUnF1tk552mad5kLenRY9jeAw9HL6ByY=;
        b=Xk92kIShN1DDa4v6SIU9xRCuA2E2YlQFIDuSMeZVSLkOFrOjY4Yds0jr9KsVV4cf/K
         VPxWMJMFVeGIY0xv8wsV4MRQ3X6a+K1pqV8mtmTO99iwrTQ01fiCTUVtCGNO3bkGNw8L
         y+RagPOuDxz59FZI/6DShRgL2nMMGs/juTtt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695636445; x=1696241245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcX4KE7rnHqRUnF1tk552mad5kLenRY9jeAw9HL6ByY=;
        b=hsrNsExcHfWp5RLNF+iMgeKf/VtW5w1w3mZoHOn3xW8DxjDQhDlqmCp26/xqZ8aF5Q
         JOsyJ1SGcLBiy4Zc60wadXXTo12C1ZgiVuu7H7bQ4PgY/nBibicHhop/x2deEveznsVY
         fQWuymBStz7L1JrPWEHLO2zKc3X6f8q7VVoMiNwhKflUDRN8vN8wEPD3YolJLeTabNbH
         pKVFtFSMelZnzKfZIHDjhE4bdbHWHkPzN3uq9Rmyak9aWFXONVDudNfIXsf6tnNSNqQH
         0K1q9KVth/LOV/SW0Trh5DTWFGWyagVGSMh247dp35z3r4Igncj1rot+kSP3KZWv31HC
         dgHg==
X-Gm-Message-State: AOJu0YwV7Dk70l7pOH5aOLAcJeGvJoqCe9hAkJ3XTTqQuwnwvu8X8KSl
	lEtngXr8CO5TWT1gxz3HKsZ5vUxzHOtaiU39KGBWhg==
X-Google-Smtp-Source: AGHT+IGSB+fl2d+IAIWLXBLXKspEPMQJPPJ4HVClBZMJKZcOCa7XVoYci82D5PGhZhO4oLVylnIkcQZsWw6eXRGawao=
X-Received: by 2002:a2e:6e16:0:b0:2c0:2f51:cb97 with SMTP id
 j22-20020a2e6e16000000b002c02f51cb97mr5276065ljc.6.1695636445145; Mon, 25 Sep
 2023 03:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com> <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
 <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
In-Reply-To: <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 25 Sep 2023 11:07:14 +0100
Message-ID: <CA+zSX=YqQrcLcdsYeJS1qya_0zf1AHZFcA5g8i3DZvJ+R9PHLQ@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Julien Grall <julien@xen.org>
Cc: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	"committers@xenproject.org" <committers@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 10:35=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Henry,
>
> On 25/09/2023 07:40, Henry Wang wrote:
> >> On Sep 25, 2023, at 14:32, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 25.09.2023 03:25, Henry Wang wrote:
> >>> Hi everyone,
> >>>
> >>> This is the reminder that we are currently in code freeze. The hard c=
ode
> >>> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.
> >>
> >> Could you further remind us about what is (not) permitted to go in dur=
ing
> >> this time?
> >
> > Sorry, my bad. From code freeze, technically only bugfixes and release
> > Blockers can go in.
> >
> >> I also understand all commits need a release ack from now on?
> >
> > I think so.
> >
> >> (I'm sorry, we're doing releases only every once in a while, so it is
> >> always good for things to be re-spelled out, i.e. even if they haven't
> >> changed from earlier releases.)
> >
> > Actually, thanks for asking! For MISRA work...
> >
> >
> >> This, for example, would then likely mean
> >> that all Misra work now needs queuing for after the tree re-opens ...
> >
> > =E2=80=A6I also thought about this, to be honest I am tempted to loose =
the control
> > or at least offer some flexibility on this specific part, as normally M=
ISRA
> > related changes are harmless and actually harden the code. I am wonderi=
ng
> > if there are any objections from others=E2=80=A6
> >
> > Committers, would you mind sharing your opinion on this one? Thanks!
>
> I am split. On one hand, I agree they low risk and would be good to have
> them. But on the other hand, they tend to be invasive and may interfere
> with any bug we need to fix during the hardening period.

*Theoretically* MISRA patches should have no behavioral side effects;
but it's quite possible that they will. I'd be in favor of a more
strict view, that they should all go on a separate branch (or simply
be reviewed in-principle and re-submitted after we branch) now that
the feature freeze is done.

That's my recommendation, but ultimately I'd leave the decision to Henry.

 -George

