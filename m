Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94427D450
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 19:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322.921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNJJ0-0004Zz-D8; Tue, 29 Sep 2020 17:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322.921; Tue, 29 Sep 2020 17:20:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNJJ0-0004Yx-8t; Tue, 29 Sep 2020 17:20:46 +0000
Received: by outflank-mailman (input) for mailman id 322;
 Tue, 29 Sep 2020 17:20:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoiY=DG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kNJIz-0004XT-2U
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:20:45 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6605d40-ee6e-42da-b9a9-182b301366b2;
 Tue, 29 Sep 2020 17:20:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b12so6431312lfp.9
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 10:20:43 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UoiY=DG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kNJIz-0004XT-2U
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:20:45 +0000
X-Inumbo-ID: b6605d40-ee6e-42da-b9a9-182b301366b2
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b6605d40-ee6e-42da-b9a9-182b301366b2;
	Tue, 29 Sep 2020 17:20:43 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b12so6431312lfp.9
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 10:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68PgQLP621l9UDE8lFwejtdqRk9PWqdfD1+bdo8l0/I=;
        b=ehMQZK0RhqBciYvvYYpLlQXpH80P78z9kMK3ZbkDqTam+Y9N/Qz39C+Y5RUT7M5U/u
         entuNRGNVOB9i49AZHJfxlERlhRdklHvOnKEEG2ZliotchKt62+ILO8lTfp0DPd18ojZ
         J3qhn8ogOXrq0CfSg1P7kcZs1sxgDDAR7MAxUkOk+FsdEdJXJ344hsyvsueizBDde53c
         h7QRYnQmqJUgXbc0mmyAVSreFq/aQaKFFBhmh4yUljHn7gJHk44FotdGD4WiS3BAyoa+
         hxTrj/VvQup8Y6gJdKo1LnXYylaE2zjRjbmgTZqETMfI4fyApE7h++C+t1sWwh9G3gKs
         qVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68PgQLP621l9UDE8lFwejtdqRk9PWqdfD1+bdo8l0/I=;
        b=JZ+aVJy0PGbLHBiX2+ps5ol5v4yrywNSg4uV12zHEhRrR0xR2y0IPaTa6p+BVMnTeL
         7CqR/z5vfmGoSrQrRZtcQnSsp5kvdMEgwWryta01R0tC+/YtEB8Pfkm7VAtAzw74PfCi
         jcVzYnAvylCI+WOV0WvVWmLfilV490q43AeVW8muvnbksqy2tU9c1aH2rZOETiXJnb2n
         SSNAmxW5mQY68AGVzMKIBCTohe7Nk6dz5elLIBphnd7zSEYMrXoY7vhWQHbd9gBMUpio
         7T6/AmwH/WBVYUrLNiOTo4t2+IWxCnLJDw3J1E3ee5jnExYeM4jPFTiudyZwQddtGltp
         SWJA==
X-Gm-Message-State: AOAM533xSJmbuteCQPnntCvcmBfIwqHiaJj8g6hkQ7Lu/CTVMO/vcdI/
	ovt69UGuFTcw5xXAMtI2BgW/6uRml5Fg3qAPpEU=
X-Google-Smtp-Source: ABdhPJwhgDPiEHKkv5d50OLzC2yXqu+LkhyiWSNDMSC26K5j2z2RBmqXFKV9n3+8UvfKOE9x8te+UpohKrzeDjCh8og=
X-Received: by 2002:a19:9141:: with SMTP id y1mr1492035lfj.554.1601400042302;
 Tue, 29 Sep 2020 10:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org> <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org> <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
 <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org> <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
 <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org> <CAKf6xpv2ZoOV-VhhtkocvzppFX=ch0XfC7e_Y4sjuwb3T+rtww@mail.gmail.com>
 <9947f7b0-2ca6-4016-6a80-1cec383efcbb@suse.com>
In-Reply-To: <9947f7b0-2ca6-4016-6a80-1cec383efcbb@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 29 Sep 2020 13:20:30 -0400
Message-ID: <CAKf6xptyh3BWwuG4qdfVFomu0H6+5tS+N32bAfHLkoEYmUqiTQ@mail.gmail.com>
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Christopher Clark <christopher.w.clark@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 3:49 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.09.2020 20:08, Jason Andryuk wrote:
> > On Fri, Sep 25, 2020 at 12:02 PM Julien Grall <julien@xen.org> wrote:
> >>
> >> Hi Jan,
> >>
> >> On 25/09/2020 16:36, Jan Beulich wrote:
> >>> On 25.09.2020 16:33, Julien Grall wrote:
> >>>> On 25/09/2020 14:58, Jan Beulich wrote:
> >>>>> On 25.09.2020 15:16, Julien Grall wrote:
> >>>>>> Fair enough. I would still like to consider a way where we could avoid
> >>>>>> to hack xsm_* because we have the interrupts disabled.
> >>>>>
> >>>>> Well, from a conceptual pov it's at least questionable for XSM to
> >>>>> need any memory allocations at all when merely being asked for
> >>>>> permission. And indeed the need for it arises solely from its
> >>>>> desire to cache the result, for the sake of subsequent lookups.
> >>>>>
> >>>>> I also find it odd that there's an XSM check on the send path in
> >>>>> the first place. This isn't just because it would seem to me that
> >>>>> it should be decided at binding time whether sending is permitted
> >>>>> - I may easily be missing something in the conceptual model here.
> >>>>> It's also because __domain_finalise_shutdown() too uses
> >>>>> evtchn_send(), and I didn't think this one should be subject to
> >>>>> any XSM check (just like send_guest_*() aren't).
> >>>>
> >>>> Maybe this is the first question we need to answer?
> >>>
> >>> Indeed that was the question I asked myself before putting together
> >>> the patch. Yet I have no idea who could answer it, with Daniel
> >>> having gone silent for quite long a time now. Hence I didn't even
> >>> put up the question, but instead tried to find a halfway reasonable
> >>> solution.
> >>
> >> IIRC, XSM is used by OpenXT and QubeOS. So I have CCed them to get some
> >> input.
> >
> > I think the send hook exists because send is its own distinct
> > operation.  While most common usage could be handled by just checking
> > at bind time, the send hoor provides more flexibility.  For instance,
> > the send hook can be used to restrict signalling to only one
> > direction.
>
> I did realize this is a special case, but it could still be dealt
> with at binding time, via a boolean in struct evtchn.
>
> >  Also, a domain label can transition (change) at runtime.
> > Dropping the send check would latch the permission at bind time which
> > would not necessarily be valid for the security policy.
>
> I did realize this as a possibility too, but there the immediate
> question is: Why for interdomain channels, but then not also for
> vIRQ-s, for example? In fact, unless I'm overlooking something,
> for this specific case there's not even any check in the binding
> logic, not even for global vIRQ-s. (After all there are two
> aspects in the permissions here: One is to be eligible to send,
> which ought to not matter when the sender is Xen, while the
> other is permission to learn / know of certain events, i.e. in
> particular global vIRQ-s.)

I'm not familiar with vIRQ-s, but I did a little bit of review.  A
vIRQ source is always Xen and its destination is a domain, correct?
They don't allow a data flow between domains, so maybe that is why
they weren't hooked originally?  Hmmm, even for non-XSM, there is no
restriction on binding the "dom0" vIRQ-s?  Like you say, maybe the
"dom0" vIRQ-s should be behind a permission check?

> The fundamental issue here is that the sending path should be
> fast and hence lightweight. This means (to me) that in
> particular no memory allocations should occur, and (more
> generally) no global or domain wide locks should be taken (for
> rw ones: no write locks).

Yes, that all seems good and reasonable.  With XSM/Flask you also need
the AVC entry for send to be lightweight.

It wouldn't help with the domain transition case, but you could run
the xsm send hooks at bind time to pre-populate the cache.  That would
still require avc code to bypass the memory allocation when holding a
lock in case the entry isn't found.  Your preallocation idea could be
generalized to have avc maintain a reserve of nodes for use when it
cannot allocate.  When it can allocate, it would refill the reserve in
addition to whatever regular allocation it would perform.  But if it's
only evtchn_send that needs special handling, then the complexity may
not be worth adding.

> > Am I correct that the assertion mentioned in the patch description
> > would only be seen in debug builds?
>
> Yes. Release builds would instead have deadlock potential, which
> may get realized at any time (or never, if you're really lucky).
> Catching such cases early, and in an easy to recognize manner,
> is - after all - what the extra checking in debug builds is for.

Thanks for the confirmation.  I tested the XSA patches before seeing
this patch, and it "worked".  Catching the issue now is definitely
better than a mysterious deadlock later.

Thanks,
Jason

