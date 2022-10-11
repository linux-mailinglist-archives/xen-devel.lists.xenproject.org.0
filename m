Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F025FB246
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 14:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420105.664689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEDU-0004uM-4Y; Tue, 11 Oct 2022 12:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420105.664689; Tue, 11 Oct 2022 12:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiEDU-0004qt-1g; Tue, 11 Oct 2022 12:18:36 +0000
Received: by outflank-mailman (input) for mailman id 420105;
 Tue, 11 Oct 2022 12:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wAu/=2M=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oiEDS-0004qn-Ee
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 12:18:34 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2d477c3-495e-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 14:18:33 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id e18so19843232edj.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Oct 2022 05:18:33 -0700 (PDT)
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
X-Inumbo-ID: d2d477c3-495e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hudP2FFaaj4NR/0F9kfxxnoFgN58kE6pkjrD7lBVFt4=;
        b=m5OcWoklQEqbJVdIcbbnxKVNtqR/WBFdnw2HrbioyHjUC1UzzkExxMJcJUuNZH7qUj
         K1bWTtVGE3l9rmMBygrIY/LEvSR+k7TNNT1oUFi5xpTvgBXxnMMnshFR5Sm7Si8RLHL5
         jqnDR7kaqGlPgqthaKsS0mHARGBDRutAqKRNuSUslhP71HVcLYbC1a/mi6EO+TiWtQm/
         2UJ7AOGQeWNq4lWSnIWjEORLc9m23uFEv7CX+Q0cjvG/oIPQ8FBFt59/U/agAh635HWv
         hKPrS1PVMcT3ceDPK+mGD4E9IJ1if9nM9IiJ39HIVT1U+nXz04pdOxbbqqfiL3xBU/4g
         fYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hudP2FFaaj4NR/0F9kfxxnoFgN58kE6pkjrD7lBVFt4=;
        b=M4DpxgZuGh8B1F/xB+Yar1F/a7J7nGfdOD3INSjN5d8EqEEbBvh+qkrENrtiGtY1mO
         2ztYxSN5i0EQOIdCNIHRKlIHJPpyj20kxGTRLllQ9pXhRRfBNR4FUvjbA5erpzfVSNsr
         rYUYpCPDcQ6tFYzZQXfXDisrw8IP8e0kVHzDGpALQv6mAUBLvK4+sxXvnpwUJululzuT
         aFAUub1MqABvJi38hExKb7Dzzh3VupHIMxHvnQimZ/j7e7oLjm9uv6gxRY4AEbqlQMoL
         8PD0440M8jEjA3L1qJQX8HVK+NUoWGWzoUWgzyh3Wcsf2NFMq9V/2TGBUhS3ROhSqehJ
         EGoQ==
X-Gm-Message-State: ACrzQf09X+RtxUPoiJEcEbECzJ+t1rR6/+cEzSypWyg60TXJiwQkoWLI
	WKCuO5O/pok+uMYzoHq3rVkF1t2j/A5k++o+t8I=
X-Google-Smtp-Source: AMsMyM6oQLSokOjUBOpcu8ldlmCxtYo5c1qvRTuhfGWGDQYUlTtYfhvQ13tl0hZmoKcVZ+xpsY21E2kjHiqOnLrHHcg=
X-Received: by 2002:a05:6402:f83:b0:458:8c97:29af with SMTP id
 eh3-20020a0564020f8300b004588c9729afmr22570031edb.210.1665490712785; Tue, 11
 Oct 2022 05:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221007193124.20322-1-jandryuk@gmail.com> <a4524dcc-36ce-267a-afbd-5785eab73882@citrix.com>
 <AS8PR08MB7991432FC3C0643161277930925E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB7991432FC3C0643161277930925E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 11 Oct 2022 08:18:21 -0400
Message-ID: <CAKf6xpt3LL3tLMEQkxivqVCw-kQhLnZBfjO=kFvim9NwamNkDQ@mail.gmail.com>
Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 7, 2022 at 9:12 PM Henry Wang <Henry.Wang@arm.com> wrote:
>
> Hi Andrew and Jason,
>
> > -----Original Message-----
> > From: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
> >
> > On 07/10/2022 20:31, Jason Andryuk wrote:
> > > I observed this ASSERT_UNREACHABLE in partner_rings_remove
> > consistently
> > > trip.  It was in OpenXT with the viptables patch applied.
> > >
> > > dom10 shuts down.
> > > dom7 is REJECTED sending to dom10.
> > > dom7 shuts down and this ASSERT trips for dom10.

dom7 used a wildcard ring, and dom10 connected to it with a (driver
level) stream socket.

> > > The argo_send_info has a domid, but there is no refcount taken on
> > > the domain.  Therefore it's not appropriate to ASSERT that the domain
> > > can be looked up via domid.  Replace with a debug message.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > We're into the 4.17 release process now.  A bugfix like this obviously
> > should be considered, but will need approval from the release manager.
> > CC Henry.

Thanks, Andrew.

> Andrew: Thanks for the information!
>
> Jason: Would you mind adding a "Fixes:" tag following the rule described
> in [1]? Thanks very much! With this tag and proper review/ack from
> maintainers:

Of course.  It would be:
Fixes: 82a817307c5b "argo: init, destroy and soft-reset, with enable
command line opt"

> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks, Henry.  We'll see what feedback Christopher provides.

Regards,
Jason

