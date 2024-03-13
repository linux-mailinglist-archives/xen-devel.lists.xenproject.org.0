Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26987A784
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 13:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692394.1079472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNfa-0004Vm-ND; Wed, 13 Mar 2024 12:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692394.1079472; Wed, 13 Mar 2024 12:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNfa-0004UG-KS; Wed, 13 Mar 2024 12:25:18 +0000
Received: by outflank-mailman (input) for mailman id 692394;
 Wed, 13 Mar 2024 12:25:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkNfZ-0004UA-6m
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 12:25:17 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beca3865-e134-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 13:25:15 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-221a9e5484aso3247481fac.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 05:25:15 -0700 (PDT)
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
X-Inumbo-ID: beca3865-e134-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710332715; x=1710937515; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZwwsxIGGvx7y/8uSvbnz2X5UzkKD3PBAoYlJ4YPNWg=;
        b=Sk4R5MSnXhKPgUiLoeG9+xHvl+zfl1y5XHpEKC6rJJajtUwlbGLV44V7QniJI2thPx
         l+5852TCkXBZ356uCgrU2yorqb0b7wPxVZAAaNJbFeW7/g3FIhGhmSvTojRdWwm4vQr1
         2Je9wufc1ad1DCcgzk7ocBYJu8Ronh6t9YK8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710332715; x=1710937515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZwwsxIGGvx7y/8uSvbnz2X5UzkKD3PBAoYlJ4YPNWg=;
        b=DNZsKVY7deRyGrr8Kqg4laFzKGh+Dm3mwD5T7XVZraZnsyVGwayF+PSY+ajE4asMNl
         y38oM2yns3RM4WVeDYhTl43iS/apR6mcD5ZPKzh5oMzP4fkHHq2Me6JTQyWTJgRB3h1F
         L3x6nqC56Or80c7NH/4l4orcd0ij12Jb43vdcu9C76m0DG6c3x9zhdKD/LhxOfuJzNG4
         NMoc3c9z/rSgq7fync1UutDLkxGPBGYjGlGq9gwYIHQSNi9p1a4A4seNC7z+MEEtwFRA
         hdKZlIWHxXtcPG9wyXxEEyqNtLqnVUdZIYdRh4S2h2oLnB5VzV4YPjFLv/7A4uR8qk6G
         NGzw==
X-Gm-Message-State: AOJu0YyxDKZKNxeZeVPb/LlvkHS0v5uODKvQp+GOzboav8MKcTKwaRj4
	+PYVv+HQ9puzAJvyWAo/V9dqU8Dn00qAKPk0O5fhhmw6gD6hri+lI7XdOKtwz9Ll3dFEfbUEc5L
	XU2Dp9rsmvNVzfcxd4bjLQ39z79PvN1rrUlD/dw==
X-Google-Smtp-Source: AGHT+IH7+gkPaks9rkACXNVly1XFyNOGnag2kVWLuQ5YYsO0BzkQW6rjNoO2spwKCEqagaICzlI+zixwIFXamH4azlo=
X-Received: by 2002:a05:6870:b492:b0:21e:be10:f39d with SMTP id
 y18-20020a056870b49200b0021ebe10f39dmr3146320oap.46.1710332714758; Wed, 13
 Mar 2024 05:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <740404f0-3da9-4ae5-b4a5-b24cb2907e7d@suse.com> <CA+zSX=YiG9dskoZVw8u+bKtD5a-8Sc1Z+hRMUgzv=a1HmYawZg@mail.gmail.com>
 <064ec76a-4957-448b-9afe-1bd264fd81c7@suse.com>
In-Reply-To: <064ec76a-4957-448b-9afe-1bd264fd81c7@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 13 Mar 2024 12:25:03 +0000
Message-ID: <CA+zSX=ZMjFRqj9BhVWN=JF5RidejTwjbzzHQQx=trfMBZ-90Ew@mail.gmail.com>
Subject: Re: [PATCH v3] x86/PoD: tie together P2M update and increment of
 entry count
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 12:19=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 13.03.2024 11:58, George Dunlap wrote:
> > On Tue, Mar 12, 2024 at 3:22=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> When not holding the PoD lock across the entire region covering P2M
> >> update and stats update, the entry count - if to be incorrect at all -
> >> should indicate too large a value in preference to a too small one, to
> >> avoid functions bailing early when they find the count is zero. Howeve=
r,
> >> instead of moving the increment ahead (and adjust back upon failure),
> >> extend the PoD-locked region.
> >>
> >> Fixes: 99af3cd40b6e ("x86/mm: Rework locking in the PoD layer")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> The locked region could be shrunk again, by having multiple unlock
> >> calls. But I think both ioreq_request_mapcache_invalidate() and
> >> domain_crash() are fair enough to call with the lock still held?
> >> ---
> >> v3: Extend locked region instead. Add Fixes: tag.
> >> v2: Add comments.
> >>
> >> --- a/xen/arch/x86/mm/p2m-pod.c
> >> +++ b/xen/arch/x86/mm/p2m-pod.c
> >> @@ -1348,16 +1348,22 @@ mark_populate_on_demand(struct domain *d
> >>          }
> >>      }
> >>
> >> +    /*
> >> +     * P2M update and stats increment need to collectively be under P=
oD lock,
> >> +     * to prevent code elsewhere observing PoD entry count being zero=
 despite
> >> +     * there actually still being PoD entries (created by the p2m_set=
_entry()
> >> +     * invocation below).
> >> +     */
> >> +    pod_lock(p2m);
> >> +
> >>      /* Now, actually do the two-way mapping */
> >>      rc =3D p2m_set_entry(p2m, gfn, INVALID_MFN, order,
> >>                         p2m_populate_on_demand, p2m->default_access);
> >>      if ( rc =3D=3D 0 )
> >>      {
> >> -        pod_lock(p2m);
> >>          p2m->pod.entry_count +=3D 1UL << order;
> >>          p2m->pod.entry_count -=3D pod_count;
> >>          BUG_ON(p2m->pod.entry_count < 0);
> >> -        pod_unlock(p2m);
> >>
> >>          ioreq_request_mapcache_invalidate(d);
> >>      }
> >> @@ -1373,6 +1379,8 @@ mark_populate_on_demand(struct domain *d
> >>          domain_crash(d);
> >>      }
> >>
> >> +    pod_unlock(p2m);
> >
> > We're confident that neither domain_crash() nor
> > ioreq_request_mapcache_invalidate() will grab any of the p2m locks?
>
> There's no doubt about ioreq_request_mapcache_invalidate(). domain_crash(=
),
> otoh, invokes show_execution_state(), which in principle would be nice to
> dump the guest stack among other things. My patch doing so was reverted, =
so
> right now there's no issue there. Plus any attempt to do so would need to
> be careful anyway regarding locks. But as you see it is not a clear cut n=
o,
> so ...
>
> > If so,
> >
> > Reviewed-by: George Dunlap <george.dunlap@cloud.com>
>
> ... rather than taking this (thanks), maybe I indeed better follow the
> alternative outlined in the post-commit-message remark?

I keep missing your post-commit-message remarks due to the way I'm
applying your series.  Yes, that had occurred to me as well -- I don't
think this is a hot path, and I do think it would be good to avoid
laying a trap for future people wanting to change domain_crash(); in
particular as that would change a domain crash into either a host
crash or a potential deadlock.

I think I would go with multiple if statements, rather than multiple
unlock calls though.

 -George

