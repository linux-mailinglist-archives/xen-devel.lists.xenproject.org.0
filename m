Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423469F2EB2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857732.1269945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8q9-0004f6-Ex; Mon, 16 Dec 2024 11:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857732.1269945; Mon, 16 Dec 2024 11:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8q9-0004bx-CR; Mon, 16 Dec 2024 11:00:41 +0000
Received: by outflank-mailman (input) for mailman id 857732;
 Mon, 16 Dec 2024 11:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tN8q7-0004aC-Gp
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:00:39 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb0eea6c-bb9c-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 12:00:37 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so7484922a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:00:37 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ab5198sm3025746a12.8.2024.12.16.03.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:00:36 -0800 (PST)
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
X-Inumbo-ID: fb0eea6c-bb9c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734346837; x=1734951637; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/bn0R9iQWFXBtLuN73CSNYk9yOwOpbIqDziJTUJp+U=;
        b=IXU4aEal9quum0ettsL+xubdUIAm+ZWQpMhBVbPOSP0Zbbk8OezDw/D1Vx5kIEY405
         0ccq2zw5pNgWFloHNPfaI7oXQQkOajkmcAYbobXRuGJnr+6Dt7+joaYb1bmbMqMP6z0x
         eFSraceq5Mgn/nhpOSfasO4YlnMlMy1P+snIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346837; x=1734951637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/bn0R9iQWFXBtLuN73CSNYk9yOwOpbIqDziJTUJp+U=;
        b=UeyyTidPpFTT7M01WQL3z5a9iKveuCDEKaSZyzZ1YIuR+WzxF7U+mVQOhp857piUcq
         WLKlb8yalKgm8+IygCWPDmUtsjxl5xfGACJJ6QnWokKerKG8r+pACOaIKEMyXZ8SbFZ2
         IJUrk9Mkjbg+8oZ4zV266CRZGLn0qWIbsk59f0TACcvUzJDv75FkY/MtbzmBFAqQfiXR
         veOZHqA66zwPgffBDhhIA5e+27fDQ00HI0JevfEkWb0LyuSiFjGesXTM/bCKqML+9lPQ
         JfEpSwZuVftno68VxACP1R23Z3iVQHffcMMvOeaCMEXmOubsLRACAsT/0ycxB4t2mXKo
         sgmg==
X-Forwarded-Encrypted: i=1; AJvYcCU+qo5SSanXmkgQTSJNHT/8PCTW80QjoKe1n53/TjXHa6gKjyExp/bwJn3TSQC6WVgG3Ubq9CykYP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze8MIKHh9GjN7/NhY2PN1aP9GcX2rzc4XE65FKrD5YYcUPGX3t
	9WBjn8zzScGHQcG9IYVajjM3o/1e0rKlalMnhQLtJWTgFwa+X2upN9yInLj0JcXfqsmGK6K22s4
	Pcw+YqKok
X-Gm-Gg: ASbGncstI+MZreyaCG9L7wZjG4JIuU0PYG2ouqdWL9Psf94R+8SuY01DU02kXHMisLn
	KMcpaxISDE3bGHVza2Q7TkMuU2T+Nxkaw4HnA0pPfveQDssvxjSI5NVLK+FHnwN3SVonhEzVhFX
	dufcYP5V30SFOPPDEPHv4aE3LMlZI1s3WdADGpcUu0PclkUgQeIcp+O++cjBklLQa8+DruiC1F/
	HDa7QQPbXVlA8xprwXrHb889axrA4LU+SWmh5W6UgQcfvqZkLZURRNT7X1pBzc=
X-Google-Smtp-Source: AGHT+IEk9uTWPFQ5ArPRN+4/vyNaOYATQc2paUoLBRhzAxSPfvXkCqkHsRqTrmW9JJguC1KcO8GGUg==
X-Received: by 2002:a05:6402:5288:b0:5d3:e8d1:a46 with SMTP id 4fb4d7f45d1cf-5d63c3bf48dmr12572098a12.30.1734346836868;
        Mon, 16 Dec 2024 03:00:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 11:00:33 +0000
Message-Id: <D6D2N3YP3VOA.3CIMMVI7YINPD@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 02/13] x86/xstate: Create map/unmap primitives for
 xsave areas
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-3-alejandro.vallejo@cloud.com>
 <2948b6c9-eb8b-400f-be0a-274cbf7ffde6@suse.com>
In-Reply-To: <2948b6c9-eb8b-400f-be0a-274cbf7ffde6@suse.com>

On Mon Dec 9, 2024 at 4:11 PM GMT, Jan Beulich wrote:
> On 05.11.2024 15:32, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/include/asm/xstate.h
> > +++ b/xen/arch/x86/include/asm/xstate.h
> > @@ -143,4 +143,46 @@ static inline bool xstate_all(const struct vcpu *v=
)
> >             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
> >  }
> > =20
> > +/*
> > + * Fetch a pointer to a vCPU's XSAVE area
> > + *
> > + * TL;DR: If v =3D=3D current, the mapping is guaranteed to already ex=
ist.
> > + *
> > + * Despite the name, this macro might not actually map anything. The o=
nly case
> > + * in which a mutation of page tables is strictly required is when ASI=
=3D=3Don &&
> > + * v!=3Dcurrent. For everything else the mapping already exists and ne=
eds not
> > + * be created nor destroyed.
> > + *
> > + *                         +-----------------+--------------+
> > + *                         |   v =3D=3D current  | v !=3D current |
> > + *          +--------------+-----------------+--------------+
> > + *          | ASI  enabled | per-vCPU fixmap |  actual map  |
> > + *          +--------------+-----------------+--------------+
> > + *          | ASI disabled |             directmap          |
> > + *          +--------------+--------------------------------+
> > + *
> > + * There MUST NOT be outstanding maps of XSAVE areas of the non-curren=
t vCPU
> > + * at the point of context switch. Otherwise, the unmap operation will
> > + * misbehave.
> > + *
> > + * TODO: Expand the macro to the ASI cases after infra to do so is in =
place.
> > + *
> > + * @param v Owner of the XSAVE area
> > + */
> > +#define VCPU_MAP_XSAVE_AREA(v) ((v)->arch.xsave_area)
>
> When this is fleshed out, I expect (hope) type safety (type of "return
> value") will remain to be there. I think it would be nice ...

The return type will always be a pointer to `struct xsave_struct`, so that'=
s
definitely type-safe.

>
> > +/*
> > + * Drops the mapping of a vCPU's XSAVE area and nullifies its pointer =
on exit
> > + *
> > + * See VCPU_MAP_XSAVE_AREA() for additional information on the persist=
ence of
> > + * these mappings. This macro only tears down the mappings in the ASI=
=3Don &&
> > + * v!=3Dcurrent case.
> > + *
> > + * TODO: Expand the macro to the ASI cases after infra to do so is in =
place.
> > + *
> > + * @param v Owner of the XSAVE area
> > + * @param x XSAVE blob of v
> > + */
> > +#define VCPU_UNMAP_XSAVE_AREA(v, x) ({ (x) =3D NULL; })
>
> ... if this was typesafe (at least on x) from the very beginning as
> well. Thoughts?

I tentatively intend for both macros to involve a call to static inline
functions when the real infrastructure is in place. By the time everything =
is
fleshed out both will be definitely type-safe. Const-ness might suffer thou=
gh,
as there's a tension between clarity of static inlines and flexible qualifi=
ers
(i.e: having const outputs iff inputs are const).

>
> Jan

Cheers,
Alejandro

