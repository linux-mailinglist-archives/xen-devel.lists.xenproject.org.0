Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53431FCEBC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 15:44:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlYMU-00071w-DQ; Wed, 17 Jun 2020 13:44:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlYMS-00071r-Lk
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:44:16 +0000
X-Inumbo-ID: a284ec0e-b0a0-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a284ec0e-b0a0-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 13:44:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b82so1931471wmb.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lMz7IY7gl+Mkkhi+dR4UBtN/vHs57WZ7F9rIUGsGv9o=;
 b=ddjYeJnXtgoL2057ezHIaqpugx56p5lA3jxs5JedSe+ln0MR9euUqZ+E5spzG8qeGZ
 Vc43kpC3GxO+RHacXjnWnEy75f5nvOc0aSNxqMw+M2xW2Q5oqZC5F44U3hhx7dxhpphB
 KAsW74BLUMZV7XI15hJxWgIBHLY0LBPsHkDWWNQk62nD5+KZkUyNAS+b6m1PtMTcAnSK
 USjzp9MxLoExb5IG+39V05SLwuSkWfIfMlEgAE2Zg//dlj84x9WyuqrZyUSxtAEELQwB
 GtcITtxXB8MgrXjs+I9GyhyITjwXM4LGJF6h4VpFCDEaMH1W02RDOJppklEQIw6nTKHt
 uWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lMz7IY7gl+Mkkhi+dR4UBtN/vHs57WZ7F9rIUGsGv9o=;
 b=lWL1x2unUhsqefp2waMju3+UOalCbumciq6oQNobM9sxJRRZbYUasLT85yQNVQ22rh
 ADxM0lNwGlQ6jACmWkQyEtZElBXkMpSlYLS+V58as8T0ncD9+v+eBZW5P2rSO5LfcUBs
 P4rr4QMqrZfIAV12l8FR0DheQnTxhCqXs5vFLKeKMMhnrg61PicKFuIOkwI81NIQh6Ni
 JfM7VneyMFXsJet0QR8hbfvSfLY6O90qmUkPYvYl/9aE2X5Kz8wx2PxraZY6df06KUgS
 9vgvTPszPwgfN4GS/45aVJ38TBG/pZncBW+PxgCBZqe/hhUE4HI6N2mrTfwlEPEO5PIx
 Rktw==
X-Gm-Message-State: AOAM532P3abIF6xFmAw7/MB98coDapTBeL4zJODLYT5COzbEdih/E6Ck
 VQEytjr9dS6OMs33n3CB1MPt8baAxhL4Ae6QIFE=
X-Google-Smtp-Source: ABdhPJyf+BbSPnqED8cGTkOJq9ZzWfpBNNmROsNY4sqW9wc5bk312nsgFWmNL4HVtFKouql9IMLjymaLxGynUgW7y8M=
X-Received: by 2002:a1c:964d:: with SMTP id y74mr9103273wmd.154.1592401454470; 
 Wed, 17 Jun 2020 06:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
 <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
 <4b06e4f3-2b23-359a-9d80-c881016c0d91@suse.com>
 <CABfawh=AkBQ6iCOdWpjGvyXykePc7wVC-SZEn13_=q+P-zW4JA@mail.gmail.com>
 <47abe61b-76e1-4491-f539-60c427c2ffc8@suse.com>
 <CABfawhki5+wv9cfivbxRhMurqYD4Ls4o5OUG9e-cV5SPzeG9jw@mail.gmail.com>
 <17dab1c9-175a-3faa-3937-9102e09f72b0@suse.com>
In-Reply-To: <17dab1c9-175a-3faa-3937-9102e09f72b0@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 07:43:38 -0600
Message-ID: <CABfawhk4N9MsjWqf87hPpyEHP27E=SpiHUSC+bVhAh4xW9-n8w@mail.gmail.com>
Subject: Re: [PATCH for-4.14] x86/hap: use get_gfn_type in
 hap_update_paging_modes
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 7:36 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.06.2020 15:31, Tamas K Lengyel wrote:
> > On Wed, Jun 17, 2020 at 7:28 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 17.06.2020 15:21, Tamas K Lengyel wrote:
> >>> On Wed, Jun 17, 2020 at 7:04 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 17.06.2020 15:00, Tamas K Lengyel wrote:
> >>>>> On Wed, Jun 17, 2020 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>> If there are code paths of both kinds, which approach to use in
> >>>>>> vmx_load_pdptrs() may need to be chosen based on what
> >>>>>> paging_locked_by_me() returns. Or perhaps an unlocked query is
> >>>>>> fine in either case?
> >>>>>
> >>>>> Perhaps adjusting vmx_load_pdptrs to chose the unlocked query would be
> >>>>> fine. But at that point what is the reason for having the lock
> >>>>> ordering at all? Why not just have a single recursive lock and avoid
> >>>>> issues like this altogether?
> >>>>
> >>>> With just a single lock, contention problems we already know we
> >>>> have would be even worse. When the current locking model was
> >>>> introduced, there was actually a plan to make gfn_lock() more
> >>>> fine-grained (i.e. not simply "de-generate" to p2m_lock()), for
> >>>> example.
> >>>
> >>> Sigh. Well, I've been checking and adjust vmx_load_pdptrs to use an
> >>> unlocked query doesn't seem as straightforward because, well, there is
> >>> no unlocked version of p2m_get_page_from_gfn which would also do the
> >>> "fixups".
> >>
> >> Which fixups do we need here, in particular? Of course, whenever
> >> any fixups get done, the operation can't be lock-less.
> >>
> >>> What seems redundant to me though is that
> >>> hap_update_paging_modes takes both the p2m_lock via get_gfn PLUS the
> >>> paging_lock. Does it really need to take the paging_lock?
> >>
> >> From mm-locks.h's comments:
> >>
> >>  * For HAP, it protects the NPT/EPT tables and mode changes.
> >
> > We do the population of the EPT as part of fork_page() if there was a
> > hole in the p2m when the query was issued using P2M_ALLOC (or
> > P2M_UNSHARE). I checked and without the paging lock held it throws up
> > at hap_alloc's ASSERT.. So yea, currently I don't think we have a
> > better route then what I currently sent in.
>
> You didn't answer my question regarding the "fixups" needed, so
> for the moment it's not clear to me yet whether indeed there's
> no better way.

Umm, I did. The fixups entail populating the EPT from the parent as I
described above.

Tamas

