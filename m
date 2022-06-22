Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC22555576
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 22:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354338.581416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o47DT-0001Oz-QP; Wed, 22 Jun 2022 20:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354338.581416; Wed, 22 Jun 2022 20:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o47DT-0001ML-N0; Wed, 22 Jun 2022 20:44:47 +0000
Received: by outflank-mailman (input) for mailman id 354338;
 Wed, 22 Jun 2022 20:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHpp=W5=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1o47DR-0001MF-P3
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 20:44:45 +0000
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 250d5893-f26c-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 22:44:44 +0200 (CEST)
Received: by mail-vs1-xe2f.google.com with SMTP id 184so3187903vsz.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 13:44:44 -0700 (PDT)
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
X-Inumbo-ID: 250d5893-f26c-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bxbF05ZATqB3gxHyQNYTVLA6bjts9qBhfiHvLZyCy4=;
        b=nbSpEF02yLgLmrv4C2454mTdkwm60casljwOWdzpdWYcUpc2vriavG8TE/AC5I5tTt
         V0nRWLlwmoT3zFmx7HlEfAmhjVk75Cmw8F613n/nBhg9pubDW//jjJ3D0YZcL43Tziwp
         nTl9mG6xsyRV7J9IUcY6OMsHrz1VWXfEH4v92xiTtpzjhjkdXX5qZ1MYfH9A5cOlvNo2
         ip0vMlgbaTZj/XtsR9o0UZlcf8hN4QTZAZEcLtGiBE1CnlVMJveFA6rgL7r8x50DI94/
         zh9M1LFMvhT7VH155Tes/EP1aVEuiNRNT2DfbPqC0wv67oalGJx6fvO3Z29OqwDhCsHa
         R3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bxbF05ZATqB3gxHyQNYTVLA6bjts9qBhfiHvLZyCy4=;
        b=A2hlIDe45Xtid8hFgMS98GO7fMicVthwJwPq3Ofc0KPkSqRu3stjG349nwmW8gJ03u
         zfh5bs2PisFx4jVDlWnLdOZ4TjXytrEzlJivvTiAkSra0P3uCOkeSdalvpsGcWUfXZCE
         9IIvyoIxgq85R+P1uEZ1oxr99arLIO3jAuquoJTgfe4CkdU32rqUQcizM/Rci1SruGfY
         4Z6nFyZykq9OImM+1imdVbmcZY0vZHA0QBcq6bsVWxhJrteWzFjTDb3Y5BSr7sOyehG9
         HOajy4jiApRDJqiczksys9m4MyWAVgU2I+9QtC74I9lb+wpI5CX3eaeFWXdWE9mRKmks
         Tjlg==
X-Gm-Message-State: AJIora+IaUtW3RXBjYu+2PKuf79PlqpAPauAA7MwieQmqJfHqexYVApv
	qfBFJqzuHrKsiVeQTyMR26xZm7qpFIhrY3v2VAI=
X-Google-Smtp-Source: AGRyM1uCuuXQYL1qxO+Lmk1tq/4POG5GRU2gMHpgMBJE89WKBmUYddl0wrMQnDk5qGdMVkqeBfvNvqWXaFnJBtxY9PY=
X-Received: by 2002:a67:e00d:0:b0:354:2ab6:d355 with SMTP id
 c13-20020a67e00d000000b003542ab6d355mr9118327vsl.0.1655930682713; Wed, 22 Jun
 2022 13:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
 <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org> <fd30be68-d1ac-b1bc-b3f1-cff589f338ee@citrix.com>
 <c97de57c-4812-cdfc-f329-cc2e1d950dc7@xen.org> <CACMJ4GY+H7P733_-UNgSd7P8+Z4ryeJwVy3QfekMJskkmh9btQ@mail.gmail.com>
 <30BB31A7-F49C-4908-8053-74E31D03BD33@arm.com> <36854512-23fe-57dc-3c47-5f996927872b@citrix.com>
 <A06EA6F6-BBB5-4FDC-BEA0-E5C6EB6B445B@arm.com>
In-Reply-To: <A06EA6F6-BBB5-4FDC-BEA0-E5C6EB6B445B@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 22 Jun 2022 13:44:31 -0700
Message-ID: <CACMJ4Gb4CPDP5OmW+D50QCALvVo82rvw_7yO0ze0u5fh6ey_Pw@mail.gmail.com>
Subject: Re: XTF-on-ARM: Bugs
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel <Michal.Orzel@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 9:40 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Andrew,
>
> > On 22 Jun 2022, at 17:28, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
> >
> > On 22/06/2022 13:32, Bertrand Marquis wrote:
> >> Hi Andrew and Christopher,
> >>
> >> I will not dig into the details of the issues you currently have
> >> but it seems you are trying to re-do the work we already did
> >> and have been using for quite a while.

Hi Bertrand - I apologise if it seems that way, and for the pace of
this being slower than you had been expecting to see.
I don't think I have actually been re-doing it and I'm grateful that
you have made your team's work available. I am working to get what you
need integrated into the upstream.

> >> Currently we maintain the xtf on arm code in gitlab and we
> >> recently rebased it on the latest xtf master:
> >> https://gitlab.com/xen-project/people/bmarquis/xtf
> >>
> >> If possible I would suggest to start from there.

Thanks - I will add this to the sources I am working with.

> >
> > Sorry to be blunt, but no.  I've requested several times for that series
> > to be broken down into something which is actually reviewable, and
> > because that has not been done, I'm doing it at the fastest pace my
> > other priorities allow.
>
> You have not requested anything, we have been asking for a year
> what we could do to help without getting any answer.

At Andy's request I had been looking into verifying the minimal
necessary pieces to get the 32-bit Arm platform implementation to
support a minimal stub test and also the XTF infrastructure (eg.
printf, xtf return code reporting) that wasn't present in the posted
work. The aim for doing that work was to build my familiarity with it
and inform judgement involved in ensuring that the initial pieces that
are merged into XTF have a maintainable structure to support each of
the architectures (and configurations of each) that we need.
It's taken longer than I wanted and it is clear that there is urgency
to getting 64-bit Arm support integrated.

>
> >
> > Notice how 2/3 of the patches in the past year have been bits
> > specifically carved out of the ARM series, or improvements to prevent
> > the ARM series introducing technical debt.  Furthermore, you've not
> > taken the "build ARM in CI" patch that I wrote specifically for you to
> > be part of the series, and you've got breakages to x86 from rebasing.
>
> Which patch ? Where ? There was no communication on anything like that.
>
> >
> > At this point, I am not interested in seeing any work which is not
> > morphing (and mostly pruning) the arm-wip branch down into a set of
> > clean build system modifications that can bootstrap the
> > as-minimal-as-I-can-make-it stub.
>
> You cannot expect us to poll on all the possible branches that you are creating
> and simply rework what we did when you do something on some branch.
>
> We went through what you requested using GitHub and asked you at almost all
> Xen Community Call what we could do to go further without getting any answer.

I will continue to be reachable via the Community Calls. I will have a
better understanding of what steps are needed next after reviewing the
branch that you have posted.

> You are not interested in us contributing to XTF, this is understood.

No, that's really not the case; your contributions are highly valued.

There's a gap that needs to be closed here between the needs of the
contributors (ie. you guys), to have platform support working and
ability to make incremental contributions for new tests, and what the
maintainer is looking for: a structure that implements an intended
design -- that is difficult for contributors to know without having
documentation for it, which is again time-consuming to produce --
supporting the many target configurations in a coherent fashion, and
introduced in small, concise logical steps. It's compounded by the
fact that this is intricate system software where hardware
platform-specific details are critical for reviewers and contributors
to understand and implement exactly correctly.

So: I'm working on closing the current gap, aiming to make meaningful
progress in the short term and can communicate with you more clearly
as to the status of that in the coming weeks.
I also think that once the initial platform support is merged, ongoing
contributions will be both easier to produce and easier to review, to
the advantage of all.

thanks

Christopher

>
> Cheers
> Bertrand
>

