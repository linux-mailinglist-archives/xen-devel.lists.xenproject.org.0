Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E417A79FA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 13:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605579.943171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiv0j-0003xR-CV; Wed, 20 Sep 2023 11:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605579.943171; Wed, 20 Sep 2023 11:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiv0j-0003uq-9N; Wed, 20 Sep 2023 11:04:49 +0000
Received: by outflank-mailman (input) for mailman id 605579;
 Wed, 20 Sep 2023 11:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atm2=FE=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qiv0h-0003uk-TT
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 11:04:47 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82b1db30-57a5-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 13:04:46 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso110270861fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 04:04:46 -0700 (PDT)
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
X-Inumbo-ID: 82b1db30-57a5-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695207886; x=1695812686; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BikAyLF7ovnOyW7JMU17zAcfOptTXGIUu5keLaSMNaY=;
        b=k29SREJdJGzOe+JxS+JZc5oRWGVoA5J3BZPuMrefly9JcKjXBaSv8Xxo2J3wz+xHQ0
         YQqGWCwvEb//6RD0uU9hW0VClIkJjS2JyAzPm1ykUGJB1d+GcLFpT2m7mHv9RHunadBb
         5Cs7BbOWgTYHA+2GSi4IJqT78iAiQzScaHHd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695207886; x=1695812686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BikAyLF7ovnOyW7JMU17zAcfOptTXGIUu5keLaSMNaY=;
        b=psvuU1+4GYuSZP0Vajcbmi9Rru38bPysy4GaFrJvrM6nGgrRJFULoMG0YYD7Yvn2q/
         E4bned0Qx/zV2mPLaN1S59UQuiprugKsT3jaa6kOsfQzCqXvaDJf+J9EaEh0AE288TZ4
         YDq9oeCbf/7T2viUtqlG4tWDrpVccw4sBOP4Z87JXWwggXIE/ZJb/Tb6SMYzZ8rydss5
         afhQHnix2A2sTymlEgxbQOT2YtVIGm1ZyDUMSttYM6vH4BsfRAbXrH0yW5EtUiVKuYWi
         5ER4h/9Z8WCd4XBjUpbiaJps+53b5P79j62bLMo+E5wHrXgpnM2zLF6fEHXMAMWiFxDE
         XosA==
X-Gm-Message-State: AOJu0YxeeTqoSQ6DVTsdKkViS/vKqPCiLC3KWAwPr9sft254J0nWF6Gg
	ixCZRExKe0brODixhZW3+QgnOZMyqz2hUHggoN9frw==
X-Google-Smtp-Source: AGHT+IFuFP5DPlMD6NLHprdWT5f2YQbkYcXuioZaADmzzvucJyPSBJ9JlAXClWi9dS9yvmOFH076PFFzrZ+wIdiSjHM=
X-Received: by 2002:a05:651c:1714:b0:2bc:b448:b8c0 with SMTP id
 be20-20020a05651c171400b002bcb448b8c0mr1711312ljb.34.1695207886320; Wed, 20
 Sep 2023 04:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
 <d3f04552-28d3-8745-3def-b7c341f8b76b@suse.com> <daaff015-6da1-8daa-d8b3-3618c89bc799@raptorengineering.com>
 <CA+zSX=a6U5Ox-uS8EO7A2c4QPF06Ua007hCkyimwU-nKdsnxbQ@mail.gmail.com>
In-Reply-To: <CA+zSX=a6U5Ox-uS8EO7A2c4QPF06Ua007hCkyimwU-nKdsnxbQ@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 20 Sep 2023 12:04:35 +0100
Message-ID: <CA+zSX=arnS5deiNgHcV2SpGRB9B+nQy8eE040YmxUAotSJ-=iQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] ppc: Enable full Xen build
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Jan Beulich <jbeulich@suse.com>, Timothy Pearson <tpearson@raptorengineering.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 11:59=E2=80=AFAM George Dunlap <george.dunlap@cloud=
.com> wrote:
>
> On Mon, Sep 18, 2023 at 6:27=E2=80=AFPM Shawn Anastasio
> <sanastasio@raptorengineering.com> wrote:
> >
> > On 9/18/23 8:19 AM, Jan Beulich wrote:
> > > On 14.09.2023 21:03, Shawn Anastasio wrote:
> > >> Shawn Anastasio (4):
> > >>   xen/ppc: Implement bitops.h
> > >>   xen/ppc: Define minimal stub headers required for full build
> > >
> > > Compilation fails after applying this.
> > >
> > >>   xen/ppc: Add stub function and symbol definitions
> > >
> > > Continuing nevertheless, linking fails after this.
> > >
> > >>   xen/ppc: Enable full Xen build
> > >
> > > Things build okay for me when the full series is applied. Generally w=
e
> > > wouldn't deliberately break the build between any two patches; doing =
so
> > > may be okay here (except I guest CI's build-each-commit would be upse=
t),
> > > but I'll do so only upon explicit request (and with no-one else objec=
ting).
> > >
> >
> > Sorry about that. Going forward I'll take more care to ensure that
> > partially-applied series still build correctly. For this series though,
> > if you could make an exception it would be appreciated.
>
> What would be the reason for the exception?
>
> We don't want to follow the rules just for the rules' sake, but the
> rule is there for a reason: primarily to keep bisection working.  Not
> sure of osstest is testing the PPC build yet, but if it were, then
> this sort of thing would make it more difficult for the automatic
> bisector to find regressions in other parts of the code.  Having
> non-building patches can also confuse "archaeologists" -- people a few
> years hence who are trying to understand what the code does.
>
> Is there a reason that this series would be particularly difficult to
> reorganize in a way that would keep it building?  (Haven't looked at
> it in detail.)

Sorry, didn't notice that Jan had said it "might be okay here".  Jan,
don't count this as an objection.

 -George

