Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04C8C60B9
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 08:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721915.1125600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s780s-0006mE-FC; Wed, 15 May 2024 06:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721915.1125600; Wed, 15 May 2024 06:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s780s-0006j4-CJ; Wed, 15 May 2024 06:21:18 +0000
Received: by outflank-mailman (input) for mailman id 721915;
 Wed, 15 May 2024 06:21:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qki8=MS=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s780q-0006iy-SE
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 06:21:16 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5476c844-1283-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 08:21:14 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-23f5a31d948so4201000fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 23:21:14 -0700 (PDT)
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
X-Inumbo-ID: 5476c844-1283-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715754073; x=1716358873; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oaa85CsLwpAmYlsk+PQjdULpAI6iM+Mw19xv5yP3TZ4=;
        b=HVAXX/c3jIJTwmskp2oT2dylPplwFTih1Qxnw1y3kgdytf90mu84Yl2bxjmzwmSNG3
         ay3mkGgm92Zh7k35e3EII4EIkCj3MJxJA0KGAWYkx2pQAs+MGCGYDz5q3A8xgG2nCC02
         h2wOrCvcoQdRRbwAxEzvqnT3PvaA1inNhiPqnwMmhC6MkQCH3t2mDZzyjB0kaC4BsPkW
         9Gd6HQs4B0xiwbWndqDm4RXzj20VPTdFnB4B4RMvSrJYFa4Hm39R5Hwm/PjX2gDwpuzc
         caHGxETmjFCY39gvsOWzIUnd5gVDfi6E48kGJ9TpRdSMsjWbejMCJkyvD6XvDWHHU2NV
         xORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715754073; x=1716358873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oaa85CsLwpAmYlsk+PQjdULpAI6iM+Mw19xv5yP3TZ4=;
        b=R5lrxgu0ssAHKqXgoe5G505jElAj0NpJhlJ3zgFfnOAWgFu/yCCZ3eb5f/pS8AlZzl
         k2fijIPKP0yN+5uogP0LuxOhsV/YlNf3xSTx1ixIKAO6F8QhMSJOOYNtrF/PWjzyK0mY
         p3tt7Zfu4U5Gevx2qXYZKQpXq2RuYsC6M8ugwEVKmX2im64RjNoz/BgpEZwTxpIHPBD0
         B8APqixhJxTAxtbNjrznN3tNQj9y/vxWRZcJTdrhzR3U9uqz1YjSrfvCl4utUZHRQGNu
         XHrpYvFLxguH/lAXh/mcLC/8JYAWjBr5n2u0ZNdwMlO/6GM/CvQUNnJmpHGs0a0N6f/j
         az1Q==
X-Gm-Message-State: AOJu0YzZQKaJx9OImwYAi0z2WX+fRNSsu3MNRZoMIbB2SH3bBUW9oGj4
	771gLKvQ0rsM9TNANQ1ldmoGaJZBMRM+xm+6PGiZKoMxun+bS0Zt/4WHXDhwbnTmDOoiVrNf7Gh
	+5fFxwYBrua5euqyOOGF4bcrCd7fLBUwDAH8QXw==
X-Google-Smtp-Source: AGHT+IFiKrS1Xh2ZFX6UaRD5rM/ntwFDS8tiiWJ7TW03KQVeC++TdNw6jogEh4TeE1y5k8BYm9NF/Pb9Hyd7B0aMu20=
X-Received: by 2002:a05:6871:514:b0:23c:4a71:4fc4 with SMTP id
 586e51a60fabf-24172e41cd9mr17519846fac.39.1715754073220; Tue, 14 May 2024
 23:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com>
 <b965ee57-c6fc-459f-a5fd-fae47dc6ea9d@suse.com> <CAHUa44FsFi0F4tz3jN+d3WkR4dTPJ1HdUru+ME1YQyzMSbMG7Q@mail.gmail.com>
 <2520da93-8b84-4a09-b944-fa065db03c18@suse.com>
In-Reply-To: <2520da93-8b84-4a09-b944-fa065db03c18@suse.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 15 May 2024 08:21:00 +0200
Message-ID: <CAHUa44F-e87A=4F84dSw8nYViEyOyOE-7n8Nm=L0PHWaAy4U8A@mail.gmail.com>
Subject: Re: Referencing domain struct from interrupt handler
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 9:12=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 08.05.2024 09:10, Jens Wiklander wrote:
> > On Fri, May 3, 2024 at 12:32=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> Furthermore, is it guaranteed that the IRQ handler won't interrupt cod=
e
> >> fiddling with the domain list? I don't think it is, since
> >> domlist_update_lock isn't acquired in an IRQ-safe manner. Looks like
> >> you need to defer the operation on the domain until softirq or tasklet
> >> context.
> >
> > Thanks for the suggestion, I'm testing it as:
> > static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);
> >
> > static void notif_irq_handler(int irq, void *data)
> > {
> >     tasklet_schedule(&notif_sri_tasklet);
> > }
> >
> > Where notif_sri_action() does what notif_irq_handler() did before
> > (using rcu_lock_domain_by_id()).
> >
> > I have one more question regarding this.
> >
> > Even with the RCU lock if I understand it correctly, it's possible for
> > domain_kill() to tear down the domain. Or as Julien explained it in
> > another thread [3]:
> >> CPU0: ffa_get_domain_by_vm_id() (return the domain as it is alive)
> >>
> >> CPU1: call domain_kill()
> >> CPU1: teardown is called, free d->arch.tee (the pointer is not set to =
NULL)
> >>
> >> d->arch.tee is now a dangling pointer
> >>
> >> CPU0: access d->arch.tee
> >>
> >> This implies you may need to gain a global lock (I don't have a better
> >> idea so far) to protect the IRQ handler against domains teardown.
> >
> > I'm trying to address that (now in a tasklet) with:
> >     /*
> >      * domain_kill() calls ffa_domain_teardown() which will free
> >      * d->arch.tee, but not set it to NULL. This can happen while holdi=
ng
> >      * the RCU lock.
> >      *
> >      * domain_lock() will stop rspin_barrier() in domain_kill(), unless
> >      * we're already past rspin_barrier(), but then will d->is_dying be
> >      * non-zero.
> >      */
> >     domain_lock(d);
> >     if ( !d->is_dying )
> >     {
> >         struct ffa_ctx *ctx =3D d->arch.tee;
> >
> >         ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
> >     }
> >     domain_unlock(d);
> >
> > It seems to work, but I'm worried I'm missing something or abusing
> > domain_lock().
>
> Well. Yes, this is one way of dealing with the issue. Yet as you suspect =
it
> feels like an abuse of domain_lock(); that function would better be avoid=
ed
> whenever possible. (It had some very unhelpful uses long ago.)
>
> Another approach would generally be to do respective cleanup not from
> underneath domain_kill(), but complete_domain_destroy(). It's not really
> clear to me which of the two approaches is better in this case.

Thanks for the feedback. I tried moving the freeing of d->arch.tee to
complete_domain_destroy() while keeping the rest of the cleanup as is.
It works as expected, I'll use this for the next version of the patch
set.

Cheers,
Jens

