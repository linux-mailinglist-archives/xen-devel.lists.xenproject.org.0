Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C190C4CC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742795.1149659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJU0s-0006Al-Jt; Tue, 18 Jun 2024 08:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742795.1149659; Tue, 18 Jun 2024 08:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJU0s-000693-HJ; Tue, 18 Jun 2024 08:16:22 +0000
Received: by outflank-mailman (input) for mailman id 742795;
 Tue, 18 Jun 2024 08:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyK7=NU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sJU0r-00068x-64
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:16:21 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0adee551-2d4b-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 10:16:20 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so58706181fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:16:20 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c89bdbsm16261751fa.110.2024.06.18.01.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:16:19 -0700 (PDT)
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
X-Inumbo-ID: 0adee551-2d4b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718698579; x=1719303379; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hy+g3glMzONrTHqG6tUjb//TZuhFL1a/k+2l5hV1+t0=;
        b=E3+ZWAvl6ioJeerdBHkn5nwulNZQCC0yuZEnL8+gzlzkNaAyHKaXeJKKmSbu6PN1uk
         xRUvFhiPaWU8vJA6dsr+vufIfc56OxhPwJ+VQtl6XePO6MO6DJn5T3g2dPW/l254vpdF
         1W26y04uMXqAqQHeEsX04TkvuI+Cd0of7OzSNsZT/LNCKamGE57vCYYKFTpARbX48lQo
         ZneevLzvCsyrpYxBl6+ImKL+mk+YVZFjBXF2HQUuATMMXZmgqAr7mxqekslH2X8+dN+N
         isc04h16CHeR+v0oFE3EPuhd63TpqLwFm49nMNPwUY8Ap/zwGza2GVcYHdMDMrorvrue
         eBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718698579; x=1719303379;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hy+g3glMzONrTHqG6tUjb//TZuhFL1a/k+2l5hV1+t0=;
        b=GTihLEpXEPC0GArqH0ar1BS50BVuejoh8LASAehyweZzfZo0v3s33SIoN11X0gl6LC
         wgNx9Uj53uzSDgdeiX2xIax/SQu+b8ywtPA3XZ3ajpl7viR38r4J88Y2Quiefi7A70AD
         +CGxhexEMGGj503y1UPTdZr2jj4tRNPXbpUwXCqS21XGzzMAH8Dg+GzJVCVztN10iikq
         W94j0Y2zjVedToeNuJ/vv83v68sqY1qIBdKcg4dPXA1FuW/uo5GH7SkkRnAwm3RHgP/V
         kLUPKuJL1lxmW5v/cwJI4KCca/2xUy+8d7UQb78AEQ81Q+lQPgLueRMRYIIge2BdtU9N
         XkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA+U58zO5MvSQDGCuhAxOA4o/MfI/NUyF5QG0IpBY5DIPtRTwAnO3PCYBvFl515j4yRBp/NppUY2fXWhkqyJ1E6iDkU7x90Oy2Te65wxQ=
X-Gm-Message-State: AOJu0YyHmSYiDNA2BS4Noopt5pCVq3NSK4rprziat2biV4cuRlcAwVxz
	+eVFBZgMfMWJiAvDwMyMVVrPXRh919YRvwXh4B9tEuzXTnYjaeW2
X-Google-Smtp-Source: AGHT+IEH6CJDJPIiRGfYB4dNrRHhybI4rSkqmhNuCvFYljo2t6ZNyZXmKaI2iC58TPR0qo8xC3Aw7w==
X-Received: by 2002:a2e:9616:0:b0:2eb:e9cf:e179 with SMTP id 38308e7fff4ca-2ec0e5c6d69mr69917311fa.21.1718698579216;
        Tue, 18 Jun 2024 01:16:19 -0700 (PDT)
Message-ID: <a997863f9b4cde8e4c5858c456ab458d82553ffe.camel@gmail.com>
Subject: Re: [PATCH v3 for-4.19 2/3] x86/irq: handle moving interrupts in
 _assign_irq_vector()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Tue, 18 Jun 2024 10:16:18 +0200
In-Reply-To: <f263d178-3a06-4c65-a6c0-a77f85c559b6@suse.com>
References: <20240613165617.42538-1-roger.pau@citrix.com>
	 <20240613165617.42538-3-roger.pau@citrix.com>
	 <f263d178-3a06-4c65-a6c0-a77f85c559b6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-06-17 at 15:31 +0200, Jan Beulich wrote:
> On 13.06.2024 18:56, Roger Pau Monne wrote:
> > Currently there's logic in fixup_irqs() that attempts to prevent
> > _assign_irq_vector() from failing, as fixup_irqs() is required to
> > evacuate all
> > interrupts from the CPUs not present in the input mask.=C2=A0 The
> > current logic in
> > fixup_irqs() is incomplete, as it doesn't deal with interrupts that
> > have
> > move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
> >=20
> > Instead of attempting to fixup the interrupt descriptor in
> > fixup_irqs() so that
> > _assign_irq_vector() cannot fail, introduce logic in
> > _assign_irq_vector()
> > to deal with interrupts that have either
> > move_{in_progress,cleanup_count} set
> > and no remaining online CPUs in ->arch.cpu_mask.
> >=20
> > If _assign_irq_vector() is requested to move an interrupt in the
> > state
> > described above, first attempt to see if ->arch.old_cpu_mask
> > contains any valid
> > CPUs that could be used as fallback, and if that's the case do move
> > the
> > interrupt back to the previous destination.=C2=A0 Note this is easier
> > because the
> > vector hasn't been released yet, so there's no need to allocate and
> > setup a new
> > vector on the destination.
> >=20
> > Due to the logic in fixup_irqs() that clears offline CPUs from
> > ->arch.old_cpu_mask (and releases the old vector if the mask
> > becomes empty) it
> > shouldn't be possible to get into _assign_irq_vector() with
> > ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
> > ->arch.old_cpu_mask.
> >=20
> > However if ->arch.move_{in_progress,cleanup_count} is set and the
> > interrupt has
> > also changed affinity, it's possible the members of -
> > >arch.old_cpu_mask are no
> > longer part of the affinity set, move the interrupt to a different
> > CPU part of
> > the provided mask and keep the current ->arch.old_{cpu_mask,vector}
> > for the
> > pending interrupt movement to be completed.
> >=20
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii
>=20
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -544,7 +544,58 @@ static int _assign_irq_vector(struct irq_desc
> > *desc, const cpumask_t *mask)
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( desc->arch.move_in_progress || desc-
> > >arch.move_cleanup_count )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EAGAIN;
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the current dest=
ination is online refuse to
> > shuffle.=C2=A0 Retry after
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the in-progress mov=
ement has finished.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( cpumask_intersects(des=
c->arch.cpu_mask,
> > &cpu_online_map) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EAGAIN;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Due to the logic in=
 fixup_irqs() that clears offlined
> > CPUs from
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ->arch.old_cpu_mask=
 it shouldn't be possible to get
> > here with
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ->arch.move_{in_pro=
gress,cleanup_count} set and no
> > online CPUs in
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ->arch.old_cpu_mask=
.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(valid_irq_vector(des=
c->arch.old_vector));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(cpumask_intersects(d=
esc->arch.old_cpu_mask,
> > &cpu_online_map));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( cpumask_intersects(des=
c->arch.old_cpu_mask, mask) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * Fallback to the old destination if moving is in
> > progress and the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * current destination is to be offlined.=C2=A0 This is
> > only possible if
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * the CPUs in old_cpu_mask intersect with the
> > affinity mask passed
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * in the 'mask' parameter.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
c->arch.vector =3D desc->arch.old_vector;
>=20
> I'm a little puzzled that you use desc->arch.old_vector here, but ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
mask_and(desc->arch.cpu_mask, desc-
> > >arch.old_cpu_mask, mask);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Undo any possibly done cleanup. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for=
_each_cpu(cpu, desc->arch.cpu_mask)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(vector_irq, cpu)[desc->arch.vector] =3D irq;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Cancel the pending move and release the current
> > vector. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
c->arch.old_vector =3D IRQ_VECTOR_UNASSIGNED;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu=
mask_clear(desc->arch.old_cpu_mask);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
c->arch.move_in_progress =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 des=
c->arch.move_cleanup_count =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
( desc->arch.used_vectors )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ASSERT(test_bit(old_vector, desc-
> > >arch.used_vectors));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 clear_bit(old_vector, desc->arch.used_vectors);
>=20
> ... old_vector here. Since we have the latter, uniformly using it
> might
> be more consistent. I realize though that irq_to_vector() has cases
> where
> it wouldn't return desc->arch.old_vector; I think, however, that in
> those
> case we can't make it here. Still I'm not going to insist on making
> the
> adjustment. Happy to make it though while committing, should you
> agree.
>=20
> Also I'm not happy to see another instance of this pattern appear. In
> x86-specific code this is inefficient, as {set,clear}_bit resolve to
> the
> same insn as test_and_{set,clear}_bit(). Therefore imo more efficient
> would be
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!test_and_clear_bit(old_vector, desc-
> >arch.used_vectors))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_UNREACHABLE();
>=20
> (and then the two if()s folded).
>=20
> I've been meaning to propose a patch to the other similar sites ...
>=20
> Jan


