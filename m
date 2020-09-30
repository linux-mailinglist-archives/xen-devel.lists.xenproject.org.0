Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C887C27EBCE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795.2666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdgS-0005Wj-M7; Wed, 30 Sep 2020 15:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795.2666; Wed, 30 Sep 2020 15:06:20 +0000
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
	id 1kNdgS-0005WK-It; Wed, 30 Sep 2020 15:06:20 +0000
Received: by outflank-mailman (input) for mailman id 795;
 Wed, 30 Sep 2020 15:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiew=DH=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kNdgR-0005Vo-5d
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:06:19 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50da848a-7aad-4831-9894-98bf99daa2af;
 Wed, 30 Sep 2020 15:06:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k25so1900381ljk.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:06:18 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wiew=DH=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kNdgR-0005Vo-5d
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:06:19 +0000
X-Inumbo-ID: 50da848a-7aad-4831-9894-98bf99daa2af
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 50da848a-7aad-4831-9894-98bf99daa2af;
	Wed, 30 Sep 2020 15:06:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k25so1900381ljk.0
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EiyejS3W54F+T3cuCvLlx0CFnrG4SQr/5e76TlMMoZs=;
        b=VH2d8GUUOYAfW0d2EVdpsA8BBXRqK1aPCHcBLr7A6kZXXsa+J2T7ZxA2oQL72djQCF
         RV44SvjlKQfJs/FarbV6VihVSTwIN5h8j7QZJH1/DHu9OpGDgkLUfMie/WWlkAdQ9I4F
         lxkCL61f1UsyXLP3s1undh/5vaJO5l1rmdJ6/aLEWCnHC5Y5LtrMuqWkAFDwSyg8h7Jw
         4ksiIaWKfx0cP4ulTklXD8TMYXnXCuCz2FFdRdypfK6VTveF5ONR4myxoqlo/hA/bT9x
         ZCXVBswECNpqhGPI8Pmjww2jWLvILaGzYZIt5DmBq+OOWbdcTPaAdEZK9tCQtB/hqbLE
         cB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EiyejS3W54F+T3cuCvLlx0CFnrG4SQr/5e76TlMMoZs=;
        b=Iug1rFlcCWOhKsMkDE4rc28igODuTLA14l5EmgX7ZD7EXd3ZrhuxONsDwHeC7rzE8S
         DC3LwpZbdNZWhW4pUAvLVQpfYgfrcUeLPLDKx5dGezSeOWoYEtl7/XKDhaNhEO/c7qrM
         9c0d9K9WB4pfoNh2kCd0XIha/6JVNjcBAZAN0gpNqYlTcsetakSHpLUFY6CKjI5bG7ob
         FoBrwHNIlP+0b5MgLbV3Mbpd1APqeHDkqHU5juHFRivs2BkVK3ygIT94q+Jv2f2D91jp
         /PmCKoCoexDhXD99lJmIm03Kn6GLtnQ+oZYVqSNl+Sh5hyja5t46A14pV2IphlyQpz46
         ZS0Q==
X-Gm-Message-State: AOAM530osfPPleFXbofvDlHPVgUCVgpGsrRCQyuk++ksZ0MzuUIQ5trF
	4gdFY3SJ2EK9/6FjoFetnPmZNd1W7jsjzDAKNIU=
X-Google-Smtp-Source: ABdhPJzzkb4NImWrhcSqH1Ax3ci5nwHgSEAamvSKJyP/j/Avi73Otm0rb8x87VnRi+b5ek52Z3Bsp5OMw5wuBeRT6XA=
X-Received: by 2002:a2e:c49:: with SMTP id o9mr1037635ljd.296.1601478377044;
 Wed, 30 Sep 2020 08:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org> <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org> <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
 <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org> <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
 <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org> <CAKf6xpv2ZoOV-VhhtkocvzppFX=ch0XfC7e_Y4sjuwb3T+rtww@mail.gmail.com>
 <9947f7b0-2ca6-4016-6a80-1cec383efcbb@suse.com> <CAKf6xptyh3BWwuG4qdfVFomu0H6+5tS+N32bAfHLkoEYmUqiTQ@mail.gmail.com>
 <4a89f69c-ec67-4749-8f55-46b3e00e4989@suse.com>
In-Reply-To: <4a89f69c-ec67-4749-8f55-46b3e00e4989@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 30 Sep 2020 11:06:05 -0400
Message-ID: <CAKf6xps0U=+FzphhV06-vcZMVZHQXMSVV7xCjExtuQy0TEmabg@mail.gmail.com>
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Christopher Clark <christopher.w.clark@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 30, 2020 at 2:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 29.09.2020 19:20, Jason Andryuk wrote:
> > On Mon, Sep 28, 2020 at 3:49 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 25.09.2020 20:08, Jason Andryuk wrote:
> >>>  Also, a domain label can transition (change) at runtime.
> >>> Dropping the send check would latch the permission at bind time which
> >>> would not necessarily be valid for the security policy.
> >>
> >> I did realize this as a possibility too, but there the immediate
> >> question is: Why for interdomain channels, but then not also for
> >> vIRQ-s, for example? In fact, unless I'm overlooking something,
> >> for this specific case there's not even any check in the binding
> >> logic, not even for global vIRQ-s. (After all there are two
> >> aspects in the permissions here: One is to be eligible to send,
> >> which ought to not matter when the sender is Xen, while the
> >> other is permission to learn / know of certain events, i.e. in
> >> particular global vIRQ-s.)
> >
> > I'm not familiar with vIRQ-s, but I did a little bit of review.  A
> > vIRQ source is always Xen and its destination is a domain, correct?
> > They don't allow a data flow between domains,
>
> Yes and yes.
>
> > so maybe that is why they weren't hooked originally?
>
> Not so much, I assume. Looking a little more closely I find that ...
>
> > Hmmm, even for non-XSM, there is no restriction on binding the "dom0"
> > vIRQ-s?
>
> ... while binding is allowed, an event would never be received unless
> the domain was designated as the receiver via
> XEN_DOMCTL_set_virq_handler.

And all of those default to the hardware_domain.  This permission
isn't granted in the default policy, so I was initially confused as to
how it worked.

> >> The fundamental issue here is that the sending path should be
> >> fast and hence lightweight. This means (to me) that in
> >> particular no memory allocations should occur, and (more
> >> generally) no global or domain wide locks should be taken (for
> >> rw ones: no write locks).
> >
> > Yes, that all seems good and reasonable.  With XSM/Flask you also need
> > the AVC entry for send to be lightweight.
> >
> > It wouldn't help with the domain transition case, but you could run
> > the xsm send hooks at bind time to pre-populate the cache.
>
> Question is for how long such an entry would remain in the cache,
> i.e. whether pre-filling is useful at all. After all pre-filling
> has the downside of potentially masking real issues when testing
> (as opposed to running in the wild).

Yes, good point.

> >  That would
> > still require avc code to bypass the memory allocation when holding a
> > lock in case the entry isn't found.  Your preallocation idea could be
> > generalized to have avc maintain a reserve of nodes for use when it
> > cannot allocate.  When it can allocate, it would refill the reserve in
> > addition to whatever regular allocation it would perform.  But if it's
> > only evtchn_send that needs special handling, then the complexity may
> > not be worth adding.
>
> It was this last aspect which made me not introduce a general
> mechanism.

I think we go with this patch since it doesn't restrict the use of XSM
and tries to populate the avc.

Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

