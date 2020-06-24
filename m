Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3320699C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 03:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnuKn-0003zD-H5; Wed, 24 Jun 2020 01:36:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UaHK=AF=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jnuKm-0003z8-Cn
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 01:36:16 +0000
X-Inumbo-ID: 1750faa4-b5bb-11ea-bca7-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1750faa4-b5bb-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 01:36:14 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id n23so722912ljh.7
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 18:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7jjyfHFC9E96qUQNIK0iSzZnFmQnU7S2H0dsaVw/bw=;
 b=hK7Rt5VMB2G5gbaRdIV0Ca6lV0ZaRMz+RDV4xUL2XkVbCQIDEzOKm49gQBGCHYiOM5
 01IoGspdppI0EkYYitQghqMlWYxjWXvA/+3qZbU0KlZVs+xj1BqcrcCEPMGKW5PZTm8B
 g9u75oDqyl7m46djbSPk/Yw7xqTFCNyLCpUbGbck/WRnJMui8c89yeFj96+8belvxbna
 M5SZyJJ+dcvDMGJTLw4H2SZPdurlPzX0BYo0XgITMwuMlw8TnsTwTgIriOt2Exj06PtJ
 StY//vwUk0msYU4UBdT8AfDX73f5umwrQ7ITct+uyRy9dil1w0CADNCuTewpgAaJdsVC
 dPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7jjyfHFC9E96qUQNIK0iSzZnFmQnU7S2H0dsaVw/bw=;
 b=fWgYz10U5xtVkVr9Xv+QKfh4ljcsNK9lAFeXemvlRKBSR33bHy9hivTmB135d/znjU
 wnNV0R7GemB1fY3MKZAWuecBefRKY+GpaXDP5aIlZQgf+0Ff9XI0dWf/N3ej9UM+b5eL
 LzqkBQCuobP8PGtaPPiQ8WECoknV2Hdxqn1Ultt91H4pSKoebTr6CWZxfodMuVN33iSJ
 IRs6mkWHKeFXSFg20yzRt6gH+92n4gyQyr5X0M6CHMRZg0JAFqIjyQoSk7JsX/vFoQ9d
 7Q75wH9yyHEENiFYBLhYumg1CGv9aoZ0rmB3BMatV/YPsRe8ij7v4jcHvzUxulghCAIR
 C7NQ==
X-Gm-Message-State: AOAM530+8+jChWkqAGccF0qUQUZmA9DOwpvPhXiwv2ehoYQmvcE8De4z
 dlFjayWLi+l6duVHI6wX8PdVlV9plGQeTGKcSUY=
X-Google-Smtp-Source: ABdhPJzOqFFVqbyUclpMCMOSdJwxZz/i0ZJW9EZ9Y352Wdacz7Zh9xF7VmRJgb1LV8FRvn+GdRWFYPs8nErn9OhneVQ=
X-Received: by 2002:a2e:b704:: with SMTP id j4mr13041345ljo.458.1592962573834; 
 Tue, 23 Jun 2020 18:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <1592913499-15558-1-git-send-email-jrdr.linux@gmail.com>
 <c68a3805-080f-22c3-a4d3-f03be6b32176@oracle.com>
In-Reply-To: <c68a3805-080f-22c3-a4d3-f03be6b32176@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 24 Jun 2020 07:06:01 +0530
Message-ID: <CAFqt6zZo4ZZ9sHGqMGiYoGoA8HQ2z_ijwnpr_b+PHuAzq31scw@mail.gmail.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, linux-kernel@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 11:11 PM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
> On 6/23/20 7:58 AM, Souptick Joarder wrote:
> > In 2019, we introduced pin_user_pages*() and now we are converting
> > get_user_pages*() to the new API as appropriate. [1] & [2] could
> > be referred for more information. This is case 5 as per document [1].
> >
> > As discussed, pages need to be marked as dirty before unpinned it.
> >
> > Previously, if lock_pages() end up partially mapping pages, it used
> > to return -ERRNO due to which unlock_pages() have to go through
> > each pages[i] till *nr_pages* to validate them. This can be avoided
> > by passing correct number partially mapped pages & -ERRNO separately
> > while returning from lock_pages() due to error.
> > With this fix unlock_pages() doesn't need to validate pages[i] till
> > *nr_pages* for error scenario.
>
>
> This should be split into two patches please. The first one will fix the
> return value bug (and will need to go to stable branches) and the second
> will use new routine to pin pages.

Initially I split the patches into 2 commits. But at last moment I
figure out that,
this bug fix ( better to call coding error, doesn't looks like lead to
any runtime bug) is tightly coupled to 2nd commit for
pin_user_pages*() conversion,
which means we don't need the bug fix patch if we are not converting the API to
pin_user_pages*()/ unpin_user_pages_dirty_lock(). That's the reason to
clubbed these two
commits into a single one.

If this looks unreasonable, will split it into 2 patches again.


>
>
> > @@ -580,25 +580,30 @@ static long privcmd_ioctl_mmap_batch(
> >
> >  static int lock_pages(
> >       struct privcmd_dm_op_buf kbufs[], unsigned int num,
> > -     struct page *pages[], unsigned int nr_pages)
> > +     struct page *pages[], unsigned int nr_pages, int *errno)
>
>
> I'd prefer if you used more traditional way of returning error code by
> the function, and pass the number of pinned pages as an argument. This
> will also make call site simpler.

Sure, Will do it.

>
>
> -boris
>

