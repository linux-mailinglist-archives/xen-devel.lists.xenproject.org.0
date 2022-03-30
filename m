Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1B34ECD8E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 21:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296529.504783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZeNZ-0008NS-GU; Wed, 30 Mar 2022 19:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296529.504783; Wed, 30 Mar 2022 19:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZeNZ-0008LI-DS; Wed, 30 Mar 2022 19:53:17 +0000
Received: by outflank-mailman (input) for mailman id 296529;
 Wed, 30 Mar 2022 19:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZeNY-0008LA-3o
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 19:53:16 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0987782d-b063-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 21:53:15 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id w7so37702480lfd.6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 12:53:15 -0700 (PDT)
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
X-Inumbo-ID: 0987782d-b063-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YfuaA9ypx0MxpilnOluJ4E4p9FYSzLLL84YkqYxAOrY=;
        b=gsiQYi3ojFyR7WEvZCzrdDU+wVFsI2IP13cJK5hFVQLxZNu+X9em0Yzo98PbjDjeAa
         hrKIcFGZtgDD27ogIYWwYy6Ib0rslhn59MIuoBdynSRbRh3XWpyvHcfdsYwFwmtmzHgR
         TQc5MySpuOP/ArExWWTIK+dcMYzHOyXH4aIUZ2aa7b5k3E4nGteUEoXNsfUNN9fAbOQc
         4gCb6w4401f+8upBqZJWvhG5IAySHxzQt/OOeHORoUOwOX484uTaZaLxFhPIVW4SNNPD
         juVBEDbKiSaNLdNBogwEyrQEGBg6y4U6fSd3pb7HLERkKWnwQTWRlaDQgmOFKloam9p5
         U+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YfuaA9ypx0MxpilnOluJ4E4p9FYSzLLL84YkqYxAOrY=;
        b=iV+18mD+XAOuGFKx8il8UgkO9o0TbZ4PvqW5ucM1Pwrm9fzZyP2XF7nO+bbegbyl9f
         GoZAlZZ3X1/T5QixAvC0HYk+hpA42fFKRIxWTk84FMk9OxyOf1mzJcJLa8511MPp945Y
         ydmEdlsz4nETvYZLaG/M8KHAjO9K3M5NeT8YqOfU1WKDyzJcyQOhO6cGKa+Gnu7+BZTY
         gABq7RcqgIhxZVuHumR8T9zWV3GYx61sRu3YzaepQa+qEdgoEDTxL5lBRHcX4XVnWUUk
         nSdMb9esBqWszIDObkksVxpZWMIiTaJdm45x2ThEYzw1HWDzzMzQDkyky+8PHXW5s85d
         K0QQ==
X-Gm-Message-State: AOAM533/aaxTvct12pLoIzsAcmcMbs0ztCI9tc3f58u8+1UMw0U1f/2q
	qh4fTD7ORcIpYnSMN5U4jnqLUvwOnLSRH2fk89w=
X-Google-Smtp-Source: ABdhPJxTGDR6GyJI6g0vmpIqo0lxTC+CjirRNwNxTukRgf30vVN9pl7v88GVOCmJe9lEiaun5OACWeHVh2Hc5DoMI6o=
X-Received: by 2002:a05:6512:33c2:b0:44a:25e2:25d4 with SMTP id
 d2-20020a05651233c200b0044a25e225d4mr8204937lfg.359.1648669994451; Wed, 30
 Mar 2022 12:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com> <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
 <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com> <CAKf6xpt46jFgexwLA=wdUVH-HJWLOEisL6-2cmSLyJsO3QE2eQ@mail.gmail.com>
 <bdd9547f-d3d7-2315-898f-786ce31f9bbc@apertussolutions.com>
 <CAKf6xpt60zHwwzgQ8EFuXkgfeiwYoBdsCMdY0d_fKZFXa5HyXA@mail.gmail.com> <867570da-f60c-0b04-24b7-69d9a1737e85@apertussolutions.com>
In-Reply-To: <867570da-f60c-0b04-24b7-69d9a1737e85@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 30 Mar 2022 15:53:02 -0400
Message-ID: <CAKf6xpt=Gr06DrHpd8=FDag87Hv_CS510ZexbBSRBddxZ6qwHw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jan Beulich <jbeulich@suse.com>, Scott Davis <scott.davis@starlab.io>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 12:24 PM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 3/30/22 11:15, Jason Andryuk wrote:
> > On Wed, Mar 30, 2022 at 10:04 AM Daniel P. Smith
> > <dpsmith@apertussolutions.com> wrote:
> >>
> >> On 3/30/22 08:30, Jason Andryuk wrote:
> >>> On Wed, Mar 30, 2022 at 2:30 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 29.03.2022 20:57, Daniel P. Smith wrote:
> >>>>> On 3/29/22 02:43, Jan Beulich wrote:
> >>>>>> Similarly I don't see how things would work transparently with a
> >>>>>> Flask policy in place. Regardless of you mentioning the restriction,
> >>>>>> I think this wants resolving before the patch can go in.
> >>>>>
> >>>>> To enable the equivalent in flask would require no hypervisor code
> >>>>> changes. Instead that would be handled by adding the necessary rules to
> >>>>> the appropriate flask policy file(s).
> >>>>
> >>>> Of course this can be dealt with by adjusting policy file(s), but until
> >>>> people do so they'd end up with a perceived regression and/or unexplained
> >>>> difference in behavior from running in dummy (or SILO, once also taken
> >>>> care of) mode.
> >>>
> >>> This need to change the Flask policy is the crux of my dislike for
> >>> making Xen-internal operations go through XSM checks.  It is wrong,
> >>> IMO, to require the separate policy to grant xen_t permissions for
> >>> proper operation.  I prefer restructuring the code so Xen itself
> >>> doesn't have to go through XSM checks since that way Xen itself always
> >>> runs properly regardless of the policy.
> >>>
> >>> This is more based on unmap_domain_pirq having an XSM check for an
> >>> internal operation.  dom0less, hyperlaunch, & Live Update may all be
> >>> niche use cases where requiring a policy change is reasonable.
> >>
> >> I will continue to agree with the base logic that today any least
> >> privilege separation imposed is merely artificial in the face of any
> >> attack that gains execution control over hypervisor space. What I will
> >> disagree with is using that as a justification to create tight couplings
> >> between the internals of the hypervisor that have a potential of causing
> >> more work in the future when people are looking to use for instance's
> >> Arms upcoming capability pointers as a real separation enforcement
> >> mechanisms to de-privilege portions of the hypervisor.
> >>
> >> While on principle it is justified to object to having policy statements
> >> that present a facade, is it not better to look longer term than object
> >> to some thing on principle based in the now?
> >
> > Your claims seem to be speculative about something that doesn't exist,
> > so I can't evaluate them.
>
> They exists, they are available in OpenPOWER and Arm CHERI is in
> evaluation now.

Yes, but how will Xen use the hardware feature to internally
deprivilege itself?  What sort of division are you planning?

> > Do you envision that this future Xen would have multiple xen_*_t types
> > requiring explicit Flask policy rules?
>
> Right now I would say no for two reasons, first flask comes from the
> mind set of controlling what hypervisor interfaces a guest may have
> access and second is that I am not certain whether hypervisor internal
> contexts should be configurable.

Oh.  I expected multiple xen_*_t types to be a natural part of the Xen
deprivileging.

Regards,
Jason

