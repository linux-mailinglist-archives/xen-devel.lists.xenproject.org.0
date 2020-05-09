Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240091CBB8A
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 02:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXCwm-00051i-Se; Sat, 09 May 2020 00:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z/aV=6X=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1jXCwl-00051a-Ed
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 00:02:27 +0000
X-Inumbo-ID: 5ddf9da6-9188-11ea-9887-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ddf9da6-9188-11ea-9887-bc764e2007e4;
 Sat, 09 May 2020 00:02:26 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 19so10020996oiy.8
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2020 17:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CW4Nd9vXCE/Qs2L5YU+ExaCL2Yjneh25CTD52QLhGvk=;
 b=PZzTzpNp0lAHotjAZmWJyYeRF1LrCL0hJMDkrIR5nzhVaN1IabmauQft2kjTJVNYp+
 R8TdgmFqWaH3inlni1N0GHo+S+fKiL0FQpPwKY0MMpAFLvTK/x9Jz8nZADv7YQ6SfP5Y
 YrvboQ1bEL0dlTbkf0M84jVxFGgJCwGbAoneGsIvaIrRdRMgau6EJHfeM3mD/QQAIbIq
 0ZeMrH9RZvlXxlqbqUy42XgztR+hpposz89U8k0/NA4LRFmB2teKAsypu6xQ4I4xzfN3
 aT424EKUrwR96ad6g0HtjSFTZeyTFBkQxkzd7cBG0q6iihYiOGZr1D7VnwqiVjRVcrtO
 j1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CW4Nd9vXCE/Qs2L5YU+ExaCL2Yjneh25CTD52QLhGvk=;
 b=gDTOwkAWgOP7fSEOQro+W8idkS+HK5st7oS7MB2QanIvFx0v/eH/F3yTJ0PoYID8RM
 PQBWAIQ2g2f5FIgL3DkKF0teWWXkhnJs72ruBB7LnKpqgLRU7r6WhNjqltmewEgqQ993
 C0Z+1r/9fvyFavjmcaDUFj0KhZtL0bUwdgYm9YzoEr+3D8/FlzGADHoL6nzCjeZadkus
 5pMNjSCiajJosTVrlUbOEoxMxPn7KjkKO/7a7TsukDoh539nzl3TFDizAELablB0lqzG
 g66I960aJaoDOMj/6ZFFFwAG3UCtJfTLAuNLY8LAk9mAORHF1rBqSo2l5sCQGngajsEb
 mRdg==
X-Gm-Message-State: AGi0PuYrp6KTZFo4rUZhDNQavvhrBafR7Y+ymVCCkGMkXtDJWjE/98Q/
 ArIyGXjysQLMusiv7xVCwyBuMGUWtIStH7S6s8E=
X-Google-Smtp-Source: APiQypJWLxm6Lt/slTUnN3Q4qlcdvPKayHizn3P9I9KsqhmuphZMQJ4QYsEaZ7IIb60dhcrm3HRfb9dwYsrsZU/d9Yk=
X-Received: by 2002:aca:480b:: with SMTP id v11mr11859281oia.20.1588982546157; 
 Fri, 08 May 2020 17:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506032312.878-1-christopher.w.clark@gmail.com>
 <fa40a5f7-39e4-bd30-1e1d-89311cfe2ff7@suse.com>
In-Reply-To: <fa40a5f7-39e4-bd30-1e1d-89311cfe2ff7@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 8 May 2020 17:02:15 -0700
Message-ID: <CACMJ4Ga79KA9LiL5znJp_2bbCXnv1AQYoGT1i2huHotr_6z8Zw@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/designs: domB design document
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Adam Schwalm <adam.schwalm@starlab.io>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 7, 2020 at 1:15 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.05.2020 05:23, Christopher Clark wrote:
> > +It is with this understanding as presented that the DomB project used =
as the
> > +basis for the development of its multiple domain boot capability for X=
en. Within
> > +the remainder of this document is a detailed explanation of the multip=
le domain
> > +boot, the objectives it strives to achieve, the structure behind the a=
pproach,
> > +the sequence events in a boot, a contrasting with ARM=E2=80=99s dom0le=
ss, and closing
> > +with some exemplar implementations.
>
> May I ask that along with dom0less you also explain the (non-)relationshi=
p
> to the late-Dom0 model we've been having for a number of years? Some
> aspects of what the boot domain does look, to me, quite similar.

I haven't seen the term 'late-Dom0' used before, so am inferring that
you might mean the 'late hardware domain' feature of Xen, in which
case: yes, thanks - we will add a contrast section on how DomB relates
to that. At this (early) point, I think that we should be able to
retire/replace Xen's late hardware domain implementation in favour of
DomB, if that direction is acceptable to the community; so we will
look into how it relates.

> Apart from this one immediate detail I'm curious about (and that I also
> don't know/recall how it gets handled with dom0less): Death of Dom0 in a
> traditional setup is a signal to Xen to reboot the host. With any of the
> boot time created domains not functioning anymore, the intended purpose
> of the host may no longer be fulfilled. But of course there may be a
> subset of "optional" domains. As a result - are there any intentions
> towards identifying under what conditions it may be better to reboot the
> host than wait for human interaction?

Excellent point; we have given it some limited consideration -- eg.
something should be able to be expressed in the per-domain metadata
supplied in the Launch Control Module, to set state that is held in
Xen's domain struct for acting upon on domain exit -- but it is not
included in the design document yet and indeed it ought to be.

Thanks for the review.

Christopher

