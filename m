Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137121FCE73
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 15:32:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlYAp-0005Zz-Nu; Wed, 17 Jun 2020 13:32:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwG=76=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlYAn-0005Zs-OO
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:32:13 +0000
X-Inumbo-ID: f3a57f4c-b09e-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3a57f4c-b09e-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 13:32:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e1so2367109wrt.5
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=41N96wGg45X8tNPvMWjE+2C4QZnFC4aqzvjOlMDH9V8=;
 b=XQSBq9nPiE5u/KTDybiNKVnh9I1mxrJ+TzhzGRtjdQB9e0AI0Rd0PMyYbG7D1kRJDD
 prLuyIxYm+i4WUb9GmD3hmfi7TmGa02gyrF5CsFPb/tRh5yQijh9u+m8bjKjkIGtWy9O
 hPiFkHPagM69xAhnt+g5lItIXxNGtuLGqek3f2uXqlIkk9a64OAE3OHMJroFbDJF9cKx
 l031fppaYaYktGbs7JFLRDLHtNUievXt7i9N6ELqxAaEGPcMRUbIzhpLNep+4bJMRdb2
 UrVDe1x8Lth0s3PuPN85jx8tFQCJJa0tGU5y/SwPwBbmTuvDGomU/lytuWDh/lUrNMpf
 4PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=41N96wGg45X8tNPvMWjE+2C4QZnFC4aqzvjOlMDH9V8=;
 b=I97/4H7RVnarydaSA9qL7wN8GkK314CYZP9O5NoDrYaP3LsVZ6DmgWiJY0Hb61+ELT
 EKHvxYX5K5nd3Sq6ZLSKVyXuI8r4GQfyQaeOX1VQM2uT0eexjAexEyp6ixUzJ37KvpMM
 x6L4GbGJeCRPq47QdiOoSWuZC9Gvekz/PDUKgMEYVmbZQg5HVGFAIXoamaBFnnOML3u6
 8lew9rvErcubfTwKYr3waA4w0KvUZe0IZ0s8VCk7QX1tjNkfxnlkGAQIyvm5s1AsjpLY
 xATmLPfhDd1R1VObta9YrWETFGE/TsvGb5HatsaVXKbKLuYFkacER97DQSvQ9bSN1Jw9
 boWA==
X-Gm-Message-State: AOAM530AiHt01Q5T265UznoYScP/ahAQwneSAXhVuaTqZa0jR6Iefk93
 7juH9BhAytOSk7OfxsL95S0BVq4zeoJVT2+LhlM=
X-Google-Smtp-Source: ABdhPJz2o62Ss7oDQTTmGH81wnC7xKIUk4liobRoHw41O4mq9FIBCTf1pmYEiGN0f38RXzhdHHbm8rf3UmXqkLV/6XQ=
X-Received: by 2002:adf:f707:: with SMTP id r7mr9141490wrp.390.1592400732305; 
 Wed, 17 Jun 2020 06:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <6a2ae3bae4a4ad32bc7caecd8af2655a76a9fb19.1592335579.git.tamas.lengyel@intel.com>
 <a35d0df9-ca56-1d64-99a0-d2d744ab2186@suse.com>
 <CABfawhnXg+-HZzOhVyYreQtc6BE1xAyS5rJdQkE+1QNZA=iOnw@mail.gmail.com>
 <4b06e4f3-2b23-359a-9d80-c881016c0d91@suse.com>
 <CABfawh=AkBQ6iCOdWpjGvyXykePc7wVC-SZEn13_=q+P-zW4JA@mail.gmail.com>
 <47abe61b-76e1-4491-f539-60c427c2ffc8@suse.com>
In-Reply-To: <47abe61b-76e1-4491-f539-60c427c2ffc8@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 17 Jun 2020 07:31:36 -0600
Message-ID: <CABfawhki5+wv9cfivbxRhMurqYD4Ls4o5OUG9e-cV5SPzeG9jw@mail.gmail.com>
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

On Wed, Jun 17, 2020 at 7:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.06.2020 15:21, Tamas K Lengyel wrote:
> > On Wed, Jun 17, 2020 at 7:04 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 17.06.2020 15:00, Tamas K Lengyel wrote:
> >>> On Wed, Jun 17, 2020 at 3:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>> If there are code paths of both kinds, which approach to use in
> >>>> vmx_load_pdptrs() may need to be chosen based on what
> >>>> paging_locked_by_me() returns. Or perhaps an unlocked query is
> >>>> fine in either case?
> >>>
> >>> Perhaps adjusting vmx_load_pdptrs to chose the unlocked query would be
> >>> fine. But at that point what is the reason for having the lock
> >>> ordering at all? Why not just have a single recursive lock and avoid
> >>> issues like this altogether?
> >>
> >> With just a single lock, contention problems we already know we
> >> have would be even worse. When the current locking model was
> >> introduced, there was actually a plan to make gfn_lock() more
> >> fine-grained (i.e. not simply "de-generate" to p2m_lock()), for
> >> example.
> >
> > Sigh. Well, I've been checking and adjust vmx_load_pdptrs to use an
> > unlocked query doesn't seem as straightforward because, well, there is
> > no unlocked version of p2m_get_page_from_gfn which would also do the
> > "fixups".
>
> Which fixups do we need here, in particular? Of course, whenever
> any fixups get done, the operation can't be lock-less.
>
> > What seems redundant to me though is that
> > hap_update_paging_modes takes both the p2m_lock via get_gfn PLUS the
> > paging_lock. Does it really need to take the paging_lock?
>
> From mm-locks.h's comments:
>
>  * For HAP, it protects the NPT/EPT tables and mode changes.

We do the population of the EPT as part of fork_page() if there was a
hole in the p2m when the query was issued using P2M_ALLOC (or
P2M_UNSHARE). I checked and without the paging lock held it throws up
at hap_alloc's ASSERT.. So yea, currently I don't think we have a
better route then what I currently sent in. Perhaps the
"hvm_pae_enabled(v) && !hvm_long_mode_active(v)" can be moved into
hvm.h and be used by vmx_load_pdptrs as well, making it less fragile
in case there is an adjustment to it in the future.

Tamas

