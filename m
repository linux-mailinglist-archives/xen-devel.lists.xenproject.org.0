Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7995207958
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 18:41:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo8Sh-00008Z-Ps; Wed, 24 Jun 2020 16:41:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaHK=AF=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jo8Sg-00008U-QV
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 16:41:22 +0000
X-Inumbo-ID: 886e4a1a-b639-11ea-bb8b-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 886e4a1a-b639-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 16:41:21 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d21so1629700lfb.6
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/MCASNnVi/ALzgM3WNJvUmY0h2sFHWtkBBpH4Al5bc=;
 b=SUGYdJZr+bMHYsVax8gJ9zldqlptd5kT4BBRGeENSZ+lBC2aiViK4YZ21YlKWckWtj
 78rogfijxVPK+wCfNKOEsnWws25VJFVUqOMZ74hBCT/b+V7//3IX5LmoPpT73wLr6UyE
 f9Or3PmrEO4tzctBFixp7xguO8JiV1I21ldwJUXWqgFRU9s9sRiMnelghsFX1qj5r387
 qN9gkK0f6h9/H7ZwGB2j0IMzDyJcMQ2UZMPvL9SCVasAlSKcpc1EoVJgatnaPih5GTGW
 xFlpqTdOrQIDUPF3HBr4SWcJYM9EzzINKaFEIKuenUhJwTGpyHMkKavREhDOlpHEHyfo
 O63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/MCASNnVi/ALzgM3WNJvUmY0h2sFHWtkBBpH4Al5bc=;
 b=UN7V1Zolw31Iydn5Ugpu1PxKmYY0Vfcu9G9Ho7t9pf7nFcudCANAmhW/uHIw6elxqd
 78Oe7B6/q5RXyFHfT2k8HduxcKgGxfU2hUhhiqxdreEI9955cOsmQECHjHOJ98FLPF6m
 qsLls4kFc9LT5JHQG1DqXUX61hDArHHGy9u0k2aCDLWRBbtVLafQWNuo8wsh8anhmIRB
 lteQ2Z8cfwI8cnRFNgWDQCuP6uOBPhJbNG6H+irpf2ua0YOD7bkUdfSrLagz6CjkmfLO
 syexdTxq+AHtdmRaH6hoKNjJO13VM8xtYZfBz21GuPkVJ7w21AO869eAjw288TsO1qY9
 QC/Q==
X-Gm-Message-State: AOAM532e4otPrXRfHksrCII5qom4rS+pkJ8JKsVZVPWeI6DIvF0wvvKc
 xX07QKU5rzeCS3qdWtmRIhqz1RAzfmZ94W53noc=
X-Google-Smtp-Source: ABdhPJyuFuqWzMzN0VCDv0hj3tUOZeuC5C7P9H6qKjUhTu9qMY0DiAXyK0/rc0u9PDV26qXkjvqHI3MZ8FO+htkdFHg=
X-Received: by 2002:a19:6c6:: with SMTP id 189mr15947269lfg.94.1593016880059; 
 Wed, 24 Jun 2020 09:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <1592913499-15558-1-git-send-email-jrdr.linux@gmail.com>
 <c68a3805-080f-22c3-a4d3-f03be6b32176@oracle.com>
 <CAFqt6zZo4ZZ9sHGqMGiYoGoA8HQ2z_ijwnpr_b+PHuAzq31scw@mail.gmail.com>
 <c2130c7c-b545-218b-f2cf-69f5059f220c@oracle.com>
In-Reply-To: <c2130c7c-b545-218b-f2cf-69f5059f220c@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 24 Jun 2020 22:11:08 +0530
Message-ID: <CAFqt6zaO06gAJjWTLP4fGooLPHcm+oUJtpvhfpr6A0Zsj4PE7g@mail.gmail.com>
Subject: Re: [RFC PATCH v2] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, paul@xen.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 9:07 PM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
> On 6/23/20 9:36 PM, Souptick Joarder wrote:
> > On Tue, Jun 23, 2020 at 11:11 PM Boris Ostrovsky
> > <boris.ostrovsky@oracle.com> wrote:
> >> On 6/23/20 7:58 AM, Souptick Joarder wrote:
> >>> In 2019, we introduced pin_user_pages*() and now we are converting
> >>> get_user_pages*() to the new API as appropriate. [1] & [2] could
> >>> be referred for more information. This is case 5 as per document [1].
> >>>
> >>> As discussed, pages need to be marked as dirty before unpinned it.
> >>>
> >>> Previously, if lock_pages() end up partially mapping pages, it used
> >>> to return -ERRNO due to which unlock_pages() have to go through
> >>> each pages[i] till *nr_pages* to validate them. This can be avoided
> >>> by passing correct number partially mapped pages & -ERRNO separately
> >>> while returning from lock_pages() due to error.
> >>> With this fix unlock_pages() doesn't need to validate pages[i] till
> >>> *nr_pages* for error scenario.
> >>
> >> This should be split into two patches please. The first one will fix the
> >> return value bug (and will need to go to stable branches) and the second
> >> will use new routine to pin pages.
> > Initially I split the patches into 2 commits. But at last moment I
> > figure out that,
> > this bug fix ( better to call coding error, doesn't looks like lead to
> > any runtime bug) is tightly coupled to 2nd commit for
> > pin_user_pages*() conversion,
> > which means we don't need the bug fix patch if we are not converting the API to
> > pin_user_pages*()/ unpin_user_pages_dirty_lock(). That's the reason to
> > clubbed these two
> > commits into a single one.
>
>
> I am not sure I understand why the two issues are connected. Failure of
> either get_user_pages_fast() or pin_user_pages() will result in the same
> kind of overall ioctl failure, won't it?
>

Sorry, I think, I need to go through the bug again for my clarity.

My understanding is ->

First, In case of success lock_pages() returns 0, so what privcmd_ioctl_dm_op()
will return to user is depend on the return value of HYPERVISOR_dm_op()
and at last all the pages are unpinned. At present I am not clear about the
return value of HYPERVISOR_dm_op(). But this path of code looks to be correct.

second, incase of failure from lock_pages() will return either -ENOSPC / -ERRNO
receive from {get|pin|_user_pages_fast() inside for loop. (at that
point there might
be some partially mapped pages as it is mapping inside the loop). Upon
receiving
-ERRNO privcmd_ioctl_dm_op() will pass the same -ERRNO to user (not the partial
mapped page count). This looks to be correct behaviour from user space.

The problem I was trying to address is, in the second scenario when
lock_pages() returns
-ERRNO and there are already existing mapped pages. In this scenario,
when unlcok_pages()
is called it will iterate till *nr_pages* to validate and unmap the
pages. But it is supposed to
unmap only the mapped pages which I am trying to address as part of bug fix.

Let me know if I am able to be in sync with what you are expecting ?


> One concern though is that we are changing how user will see this error.

My understanding from above is user will always see right -ERRNO and
will not be impacted.

Another scenario I was thinking, if {get|pin|_user_pages_fast() return
number of pages pinned
which may be fewer than the number requested. Then lock_pages()
returns 0 to caller
and caller/user space will continue with the assumption that all pages
are pinned correctly.
Is this an expected behaviour as per current code ?


> Currently Xen devicemodel (which AFAIK is the only caller) ignores it,
> which is I think is wrong. So another option would be to fix this in Xen
> and continue returning positive number here. I guess it's back to Paul
> again.
>
>
> -boris
>
>

