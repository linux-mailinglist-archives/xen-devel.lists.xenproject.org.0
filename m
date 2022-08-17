Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E295974E7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 19:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389144.625972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOMgv-0007WL-K2; Wed, 17 Aug 2022 17:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389144.625972; Wed, 17 Aug 2022 17:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOMgv-0007Tv-Gt; Wed, 17 Aug 2022 17:18:53 +0000
Received: by outflank-mailman (input) for mailman id 389144;
 Wed, 17 Aug 2022 17:18:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXDg=YV=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oOMgu-0007To-5S
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 17:18:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a91c86b1-1e50-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 19:18:50 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id dc19so25668606ejb.12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Aug 2022 10:18:50 -0700 (PDT)
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
X-Inumbo-ID: a91c86b1-1e50-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3Mq83bVWzHxFk7cCXLji66xJgFBCQaPvs1BDyQ86W/A=;
        b=qu298M2ERUexx8MrYmlyNDXxXg5bqPvfEsmAhjsc1dYf7gl/hgF9XofD8upXQkMlYM
         FrweM2kzM1MNfLR0A/UZ8MVvQ3I4iOkaDtHb4nEatKH3k88A2GWWExCKsvtAONSAczhk
         AbifjBuzXUD7VphKmJA1DC9diTxQBOlbP9n0snY7IpkJys2iHckBScFobyusMeoTKz9T
         vOXQ4nCaOOKBMzDvEI+Y9FoGZHAgUcAiQejERaHwKDhoh8meJ/JO3HzvrXYQNES5OyGn
         znXeN0ZpXpfHRMulq/LZN+Ey+lhNn3tAAtfoxT0dDJGX9W9e9BujMe0In6ZUtaQJYsPT
         SzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3Mq83bVWzHxFk7cCXLji66xJgFBCQaPvs1BDyQ86W/A=;
        b=4+YStsbejb9oLIPZcYAU/KBv4ItSFmTmxxvQf+efEtaxswIjW5YeJmG0L82FA+5d+O
         A8CZerwAvp8hEfYrlzFc7LAqqafuzZ/6nZJ979JlcUazNIPZKnOpeYfDymLq5E70UQ84
         /j3XY27DpQZU27AM7tSrO8EPTzcAG+ivMRtXMSphdVH57p0sz4QyMJRTpQwRMKaFJiNl
         /u0RMPDar8gczKPjwQf9B0bEH8JmJ97V+oIhxae5cAWnESy9woUCncQM5uhCSGBKrJzb
         cHVQJH84EPlfAEILfMMBjApij/OfFqcspvKU02ntLJDOY3PVANF3gqIJZUW+wD7UXlUr
         JMnw==
X-Gm-Message-State: ACgBeo2dYhwqkZncAGbLkHWrlaQ8kEyYnY8bd+AhKmkGK16pf3mt2ksc
	1kJLE3in9aWi82bIm775k7Yv59iVzT02kd/hSW0=
X-Google-Smtp-Source: AA6agR6y44anvn9VMPu6244hlkGMd5nWmK6zX+Ue/mYAYKpzB7TWunGgJkYRMAwz5/AjFsqaKdY7MluZH9QYciWMTg8=
X-Received: by 2002:a17:906:53ca:b0:73a:7443:7c42 with SMTP id
 p10-20020a17090653ca00b0073a74437c42mr2025039ejo.761.1660756729901; Wed, 17
 Aug 2022 10:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220809140633.23537-1-dpsmith@apertussolutions.com>
 <CAKf6xpur5sESPxgDEmY=PsnDDmuZ898UbaAECccGuQuyetjHEQ@mail.gmail.com> <c3682bb0-4241-d142-b131-1221d1a62b31@apertussolutions.com>
In-Reply-To: <c3682bb0-4241-d142-b131-1221d1a62b31@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 17 Aug 2022 13:18:38 -0400
Message-ID: <CAKf6xps+4sDV1RDYVqpq_rCdq=p6wHQG=HHPe-1sVmX7Uxg7YQ@mail.gmail.com>
Subject: Re: [PATCH v12] xsm: refactor flask sid alloc and domain check
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 17, 2022 at 10:16 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
>
> On 8/16/22 13:43, Jason Andryuk wrote:
> > Hi,
> >
> > I think you should change the title to "xsm/flask: Boot-time labeling
> > for multiple domains".  Refactor implies no functional change, and
> > this is a functional change.  With this, I think the commit message
> > should be re-written to focus on the "why" of the new labeling policy.
>
> I can rename and expand a bit further.

Thanks.

> > On Tue, Aug 9, 2022 at 10:06 AM Daniel P. Smith
> > <dpsmith@apertussolutions.com> wrote:

> > dom0_t being a singleton emphasized for me that using only
> > is_privileged for the check isn't quite right.  Does hyperlaunch need
> > domid != 0 && is_privileged to get assigned dom0_t?  That could still
> > be done explicitly, but just not implicitly by the above.
>
> I agree it is not quite right, but more so that it is leveraging the
> assumption from the basic policy module (dummy policy) that only the
> initial domain (dom0) will have is_privileged set. As stated above,
> domid !=0 and is_privileged being set already exists for PV shim, not
> something being introduced by HL. HL only expands the possibility for
> the configuration to be built outside PV shim.

get_initial_domain_id() had slipped my mind.  I had thought a little
bit about the PV shim case in the past, and my guess is no one has
built a PV shim with Flask.  Running flask for a single domain under
the PV shim is a little silly.  If you did, the domain running under
PV shim would get dom0_t, but it is a domU - A little weird.

Oh, this is interesting:
    /* Create initial domain.  Not d0 for pvshim. */
    domid = get_initial_domain_id();
    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);

So the PV shim domain is not privileged, and get_initial_domain_id
will return != 0 for the pv-shim domain.  Your change would actually
assign it domU_t.

I think this means the domid == 0 check could still be used.   I guess
I'm approaching the problem by trying to restrict the assignment of
dom0_t as much as possible.  It's definitely needed for the
traditional dom0 case, but any other use seems suspect.

> With that said, unless I am missing something, the heuristic below will
> enforce the singleton. While it is possible that
> flask_domain_alloc_security() would allocate a security context for more
> than one domain containing the label of dom0_t. The
> flask_domain_create() check will only allow the first domain with this
> label to be created, regardless if the domain create was initiated by
> the hypervisor or by a runtime toolstack.

It's inconsistent to hand out dom0_t twice when it cannot be used
twice.  It does the right thing, so it's fine.  It just seems
inconsistent.

Anyway, if you really want to move forward with not using the domid, I
guess it's okay.

And after writing all that, dom0_t could be modified to not be non-singleton...

Regards,
Jason

