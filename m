Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F382284F8D2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 16:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678748.1056247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYT5Q-0001R4-0q; Fri, 09 Feb 2024 15:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678748.1056247; Fri, 09 Feb 2024 15:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYT5P-0001PY-U4; Fri, 09 Feb 2024 15:46:43 +0000
Received: by outflank-mailman (input) for mailman id 678748;
 Fri, 09 Feb 2024 15:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v369=JS=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rYT5O-0001PS-7J
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 15:46:42 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69994740-c762-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 16:46:40 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2191b085639so402922fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 07:46:39 -0800 (PST)
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
X-Inumbo-ID: 69994740-c762-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707493598; x=1708098398; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGLniU/Nd8/gkAQj+uYixOpsybWYqA3IabfJTeP8PU0=;
        b=Q3h/BOL8FRlsLtKVnt9UKmgWWEYlxMgf5bjkKxRRS/1KQGGiYQGEGnfjgYilwyrgOY
         dF9eXVpeIAoKizoodnP6SF4LX/8+1R8FATiH9p0KN5rdPSFRwqRuRxCB7e/EiOF+YpFi
         J6NVbWMTHWFxVpjmkc37ivcjqTnGdyAKUXoyLEufvEzmYD74Q/sMGWK4bpZHYJO1iWSu
         ylq75HBLsHds5JQWlZ7BCwlqW8P2icE6LgGL6T/BTMKh4ltH2doc7AIu5zT2Lrckg6kF
         pHNp5VhD5JJleAfwCiYG7WZuwLMmue7RwiKMonNVN76+z8FZ+d0UXdai8VnLyWUsb/va
         BULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707493598; x=1708098398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGLniU/Nd8/gkAQj+uYixOpsybWYqA3IabfJTeP8PU0=;
        b=IM43gpo1cnbuweaU6ufDsSbPXF2cspYgzInvRKnJzz0l32QpeBnXlKkIUP+7cWdPki
         RVdr517ays/UTcpSEL+yFNZ/wQWB6s1F7jW2pTqhy68uIcgD0UbPvH/f6b5rNiXKDIRp
         A+J63NcZJNv+nqZJBMPtOyVlpRlj9wjUATfaShlrJxfpXlu+SSUHzDSjYijZl0mHUK52
         CqbzAp3mAZBKPXqAeN+g0ItIc14u1dYNu6K3uU1oe0Fd6UzBc7fZiriOm5b1RtJirKUJ
         X/AXO5W2pNS30/TbZSIAu+cTQqXTLAwwLwBa17rDYpL3IAJGi95RH7n8XN6pJjhaW1UH
         1Apg==
X-Gm-Message-State: AOJu0YwQ+c8LkEgcrOsdb1I5p4xnhh6SvL3BXWD9eFZ48Qfui5ggV/fB
	+Fhy8hG5r4UbfhnafRHgDO79Ar94yUdFeUhjhYXvp7oNj6UMSv7gjDubVXefsMXaqnCJ6xO6ci4
	SfiOOmOv1oSqeSAV5bgPD6N+n2Q8=
X-Google-Smtp-Source: AGHT+IGLhm3d/5UqOMS3N8mjaV72I+nJgfGEbPykyE53OIH3Fo+4fezabWWTAiM/5/hAhR3sFWFVXLWO7q01gA+8ka0=
X-Received: by 2002:a05:6870:a9aa:b0:206:6db:dff9 with SMTP id
 ep42-20020a056870a9aa00b0020606dbdff9mr2085043oab.58.1707493598201; Fri, 09
 Feb 2024 07:46:38 -0800 (PST)
MIME-Version: 1.0
References: <fa519b9a544d3d19a31313292a909d12775e6e1f.1707427103.git.w1benny@gmail.com>
 <eba39016-7d7a-4d35-865c-bfa03674617a@citrix.com>
In-Reply-To: <eba39016-7d7a-4d35-865c-bfa03674617a@citrix.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Fri, 9 Feb 2024 16:46:26 +0100
Message-ID: <CAKBKdXhs5Wx8U5iaLWnRuVxMMTJ20zyWO6Nnku06nDg90jtCMA@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Fix fast singlestep state persistence
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, tamas@tklengyel.com, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Fri, Feb 9, 2024 at 3:58=E2=80=AFPM Andrew Cooper <andrew.cooper3@citr=
ix.com> wrote:
>
> On 08/02/2024 9:20 pm, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > This patch addresses an issue where the fast singlestep setting would p=
ersist
> > despite xc_domain_debug_control being called with XEN_DOMCTL_DEBUG_OP_S=
INGLE_STEP_OFF.
> > Specifically, if fast singlestep was enabled in a VMI session and that =
session
> > stopped before the MTF trap occurred, the fast singlestep setting remai=
ned
> > active even though MTF itself was disabled.  This led to a situation wh=
ere, upon
> > starting a new VMI session, the first event to trigger an EPT violation=
 would
> > cause the corresponding EPT event callback to be skipped due to the lin=
gering
> > fast singlestep setting.
> >
> > The fix ensures that the fast singlestep setting is properly reset when
> > disabling single step debugging operations.
> >
> > Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> > ---
> >  xen/arch/x86/hvm/hvm.c | 32 +++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> >
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index e8deeb0222..4f988de4c1 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -5160,26 +5160,40 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HAND=
LE_PARAM(void) arg)
> >
> >  int hvm_debug_op(struct vcpu *v, int32_t op)
> >  {
> > -    int rc;
> > +    int rc =3D 0;
> >
> >      switch ( op )
> >      {
> >          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
> >          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
> > -            rc =3D -EOPNOTSUPP;
> >              if ( !cpu_has_monitor_trap_flag )
> > -                break;
> > -            rc =3D 0;
> > -            vcpu_pause(v);
> > -            v->arch.hvm.single_step =3D
> > -                (op =3D=3D XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON);
> > -            vcpu_unpause(v); /* guest will latch new state */
> > +                return -EOPNOTSUPP;
> >              break;
> >          default:
> > -            rc =3D -ENOSYS;
> > +            return -ENOSYS;
> > +    }
> > +
> > +    vcpu_pause(v);
> > +
> > +    switch ( op )
> > +    {
> > +        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
> > +            v->arch.hvm.single_step =3D true;
> > +            break;
> > +
> > +        case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
> > +            v->arch.hvm.single_step =3D false;
> > +            v->arch.hvm.fast_single_step.enabled =3D false;
> > +            v->arch.hvm.fast_single_step.p2midx =3D 0;
> >              break;
> > +
> > +        default:
> > +            ASSERT_UNREACHABLE();
>
> Two things.
>
> First, this reads as if it's reachable, and therefore wrong.  You
> probably want an /* Excluded above */ comment to point out why it's safe
> in this case.
>
> Second, I know you're copying the existing switch(), but it wasn't
> compliant with Xen's coding style.  The cases and their clauses should
> have one fewer indentation level.
>
> I'm happy to fix up both on commit.
>
> ~Andrew

Thanks for the feedback. If it's not too much of a hassle, I'll be
happy if you fix it.

P.

