Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388ABD23C65
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204652.1519272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKAS-00040D-7V; Thu, 15 Jan 2026 10:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204652.1519272; Thu, 15 Jan 2026 10:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgKAS-0003xV-4c; Thu, 15 Jan 2026 10:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1204652;
 Thu, 15 Jan 2026 10:01:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgiG=7U=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vgKAR-0003P4-9i
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:01:27 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c6e6fc-f1f9-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 11:01:26 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-37fd6e91990so6606301fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:01:26 -0800 (PST)
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
X-Inumbo-ID: 27c6e6fc-f1f9-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768471286; x=1769076086; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NUq6ZuohHWwa1bqjnFzQy2W23gyUBmH+kKcLMdDFmA=;
        b=ITxaynnU1T4dTGqIzAr9EwK7f28wPO1+gNqk81v+rqmbKQKhGD4KZ9g1MHoxrjwoG5
         KtJuuq1JsZI6vOnvVR6fFQ6KN59h5ADiL3ZzbUZOqRHNvO8md2tKHrAxOect5u8bRjNa
         uHJE3tlZdVANG3FYjsZU3zl6Dh9mK5ASxNAYy0yBUQsB8S2giJBgZUD1775EX7MF6a1z
         g0Dqx8yzNSXmvnH1w2Q1yH4/X/QA0BBL+MloM047t7Vj4ggOu1mxqVSqaFrSy7PYQynh
         YwAmUpWj78KvnvaX1o7aX9h4zFIyV/L66iMpsrvE7pbECUsAlWcb/HoutqnCN+r/Ac5G
         2CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768471286; x=1769076086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NUq6ZuohHWwa1bqjnFzQy2W23gyUBmH+kKcLMdDFmA=;
        b=ja2JgHgyyVDLr7SvperoUUxXpPjVDX4RQg8WZwoRTsEjAeCh3a+0T6tWX9zRoxQhuK
         Dje8qXDZBEtIZGFKDQtX4K7BOj10dxY6D+e5ki3J9Mdt2XRKzBmtlwyn171J842M757Y
         nEnwv7DZxL5Hlphs8/1ZiOqOwi4eQuuzpYAsytNsypxOQSzH6DUAVQmkRPngn7Zz8QLO
         DXWH8TKnBG1gZt72RxZYrTvUO9Ceorpf8kwF/ihC+jlGmYTfNOD841S4H4tvJ90dFxI5
         lZJYBowL7fRok2L4QoLofvDn3C/oaPEtkmfyhdd0Hv4jKFW4pDtHoWe9J+SywYs96eT8
         qH9w==
X-Forwarded-Encrypted: i=1; AJvYcCVvxwBdPm7vUDbvg6bn+d0V8b/uYiRZ5aEHvlTcX5zL0dLCSKSl/uOItxwZ9oKkclyZ466geJGrSqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz3POxJeHQx2+RwV0cakunsd59EJ4w7zD8MFZG+VixJc5+u4Z4
	Sx4fnPDimjOEkY7KLSz8bNaA6ecs/cBx27Zejd5QOHLh5F2Im0k0m9Xf6tGW62LdR/hgeTEoY19
	GFDrbOMpAOu0yh28S0+PBQ+K5BlrzpwM=
X-Gm-Gg: AY/fxX5TOMd8+0LLpwk9TS8wxuTZTeyFQd7I6GpX0hufWLSgGFj7tfDJsvIczlHsdNU
	6x8Vdx9fJLd3umHjVzeOfWyMMdAKI9mi0MCMA/shYurjKLTIvEBgooyuKAdnnNy7memFpRZ/B7g
	RzKu5ivgkABpCXK3tAYv99DhhYoAaPwHZDEZOr1QXIbbP7UgDVUGMTFxQBZaajVOxZXmRWi+NW5
	jBxqdela6B6DIxVoAo4YYug5jy3enPiAUizACJYjV+gcDOOKyFQ0cTanpG3aHeB2JFKXmblWqxU
	7HB2JQcevX/ctkFDjTuRZatS
X-Received: by 2002:a2e:be28:0:b0:372:8e26:a4d4 with SMTP id
 38308e7fff4ca-383608260dfmr17319671fa.42.1768471285606; Thu, 15 Jan 2026
 02:01:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472890.git.mykola_kvach@epam.com> <2fade2b96128053fbe3ed59f1d5e3444b32b96c3.1765472890.git.mykola_kvach@epam.com>
 <59fc7f4c-b3f9-4a5e-b438-7989c4cd7c02@suse.com>
In-Reply-To: <59fc7f4c-b3f9-4a5e-b438-7989c4cd7c02@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 15 Jan 2026 12:00:00 +0200
X-Gm-Features: AZwV_Qjkeref5iCREf7ie5Selhq0tqavbcVGGwCNSuylaxNVrC_iBERfc4grQN8
Message-ID: <CAGeoDV9LSSk9joqp=YuRtfMr9afixeep0B5Nu+Y11YQXM8zu_w@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] xen/arm: gic-v3: add ITS suspend/resume support
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Thank you for the review.

On Mon, Dec 15, 2025 at 1:39=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.12.2025 19:43, Mykola Kvach wrote:
> > --- a/xen/include/xen/list.h
> > +++ b/xen/include/xen/list.h
> > @@ -535,6 +535,20 @@ static inline void list_splice_init(struct list_he=
ad *list,
> >           &(pos)->member !=3D (head);                                  =
      \
> >           (pos) =3D list_entry((pos)->member.next, typeof(*(pos)), memb=
er))
> >
> > +/**
> > + * list_for_each_entry_continue_reverse - iterate backwards from the g=
iven point
> > + * @pos:    the type * to use as a loop cursor.
> > + * @head:   the head for your list.
> > + * @member: the name of the list_head within the struct.
> > + *
> > + * Start to iterate over list of given type backwards, continuing afte=
r
> > + * the current position.
> > + */
> > +#define list_for_each_entry_continue_reverse(pos, head, member)       =
    \
> > +    for ((pos) =3D list_entry((pos)->member.prev, typeof(*(pos)), memb=
er);  \
> > +         &(pos)->member !=3D (head);                                  =
      \
> > +         (pos) =3D list_entry((pos)->member.prev, typeof(*(pos)), memb=
er))
> > +
> >  /**
> >   * list_for_each_entry_from - iterate over list of given type from the
> >   *                            current point
>
> While not said so anywhere, I understand this is taken from Linux. Maybe =
we
> should indeed take it verbatim (as far as possible, i.e. without the use =
of
> list_entry_is_head() which we don't have yet), but I'd like to point out
> that in the comment "continuing after the current position" is ambiguous.
> In list order, what is meant is "before the current position"; "after" is
> correct only when considering iteration direction. Personally I would muc=
h
> prefer if this was disambiguated.

Got it. I=E2=80=99ll disambiguate the wording while keeping it close to the
Linux text, e.g.:

=E2=80=9CStart to iterate over list of given type backwards, continuing wit=
h the
entry preceding the current position (i.e. starting from pos->member.prev).=
=E2=80=9D

Best regards,
Mykola



>
> Jan

