Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF888C1111
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 16:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719271.1121920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54YX-0002JG-Dy; Thu, 09 May 2024 14:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719271.1121920; Thu, 09 May 2024 14:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s54YX-0002GW-Ar; Thu, 09 May 2024 14:15:33 +0000
Received: by outflank-mailman (input) for mailman id 719271;
 Thu, 09 May 2024 14:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XcCC=MM=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s54YW-0002GQ-18
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 14:15:32 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97d0bd2f-0e0e-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 16:15:31 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51fea3031c3so1235561e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 07:15:31 -0700 (PDT)
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
X-Inumbo-ID: 97d0bd2f-0e0e-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715264130; x=1715868930; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUygLG8Ses1pT2iZk/dTdvQs7OObxOc8EGqow86X2rY=;
        b=VP1yNcSK4LMF8Wf2fbhjQCTON7rnLSy2Vb4c2hEMCNcqVHF4vOLAUVliEblz8HiEW8
         3sUw88Fb2AOoPCc8Tw9i8ddXlLXFpjjUT5eFzaqpcYvNl0VaasT6tV/Q+GGGYImCDWYR
         NlMb14hIoVlv6tc7hp1WQ+Gn2rd+neSJSOZto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715264130; x=1715868930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUygLG8Ses1pT2iZk/dTdvQs7OObxOc8EGqow86X2rY=;
        b=goeof3RmIL6kmWZ5MQcUzoASx3yaHTB6D66kOPqhFpOxKLAbM74z5MdHnSAS6NN9qK
         bLAYDRtStI5Yw5WCu5raR+ITQwe9luKLSKkADHiw+OBqxrRglOCg271McvgKXGl8TvMk
         Z6fRimWBSjUbJFtMmzoWPQBJu7U0O8pvUVpV+upe1/7AijDDpKzBwlYYIVWuxvTPeU8q
         CTWioMD0yOejHL8sy0Uqh5HQyZv665FZal71ESLNaiHyjq+vPyRktEfUOE0SbBbdtqcJ
         dNm/OkwoQoc2CcYJ7REBcdwizXjYQiKPiVR5vvyqcYjHK7XmiRoqlFyYgL2xQXFX0Szg
         gi2w==
X-Forwarded-Encrypted: i=1; AJvYcCVB38tEqIAvxuX36QEUjoiHwHDpjjBgiddsaJODK2zLQtDtP5Wdhyn9DZUXZtqq09mW3vO0fo59skjRsK48vQKDAigRAKsgU/bvmY8GqGI=
X-Gm-Message-State: AOJu0Yz3AgnOZdvA/UWF74MswgTH0ICbShmqZRNhQU7p0rTA/hWHrTwm
	0I7RhHASOe1sowU3zyw4cNSE0PH/crdrIuL0c9TbiHWyIdq7KiZW575dqgHu0Uq2Rp3G7Y8pEX5
	ok5gFYdS4CwGqW7vHJRTdxNEWYrDmBPShl1/U/Q==
X-Google-Smtp-Source: AGHT+IG6frklNvQith32cz7dXyVi0Wv1QJMUyFzHocct1cqIqBr1sJtZGXIwaQg+/Mq5eQejckewhWuldyAt1Fss0BM=
X-Received: by 2002:a19:5f03:0:b0:521:e065:c6c6 with SMTP id
 2adb3069b0e04-521e065c97dmr2446474e87.53.1715264130570; Thu, 09 May 2024
 07:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-3-fouad.hilly@cloud.com> <ec48e32a-30e5-45ab-8f11-7d3d6ce6122e@suse.com>
In-Reply-To: <ec48e32a-30e5-45ab-8f11-7d3d6ce6122e@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Thu, 9 May 2024 15:15:17 +0100
Message-ID: <CAJKAvHajhOy2SpYZk1G6MtiK1weL6cuD+bp8puY=o9XGkt0TAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] x86: Refactor microcode_update() hypercall with flags
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 10:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 30.04.2024 14:47, Fouad Hilly wrote:
> > @@ -633,12 +637,12 @@ static long cf_check microcode_update_helper(void=
 *data)
> >                                    microcode_cache);
> >
> >          if ( result !=3D NEW_UCODE &&
> > -             !(opt_ucode_allow_same && result =3D=3D SAME_UCODE) )
> > +             !((opt_ucode_allow_same || ucode_force_flag) && result =
=3D=3D SAME_UCODE) )
>
> Why would "force" not also allow a downgrade?

It should be allowed. Will be fixed in v4

>
> > @@ -708,11 +712,15 @@ static long cf_check microcode_update_helper(void=
 *data)
> >      return ret;
> >  }
> >
> > -int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long l=
en)
> > +int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
> > +                     unsigned long len, unsigned int flags)
> >  {
> >      int ret;
> >      struct ucode_buf *buffer;
> >
> > +    if ( flags > 1 )
>
> How is one to connect this literal 1 with what is really meant here? Also
> would be nice if this check fit with other similar checks we do, i.e.
>
>     if ( flags & ~XENPF_UCODE_FLAG_FORCE_SET )
Will be done in v4

>
> > +        return -EINVAL;
> > +
> >      if ( len !=3D (uint32_t)len )
> >          return -E2BIG;
>
> As an aside: Isn't this dead code, with the respective hypercall interfac=
e
> struct fields (now) both being uint32_t?

Will be cleaned up in v4.
>
> > --- a/xen/arch/x86/platform_hypercall.c
> > +++ b/xen/arch/x86/platform_hypercall.c
> > @@ -311,7 +311,17 @@ ret_t do_platform_op(
> >
> >          guest_from_compat_handle(data, op->u.microcode.data);
> >
> > -        ret =3D microcode_update(data, op->u.microcode.length);
> > +        ret =3D microcode_update(data, op->u.microcode.length, 0);
> > +        break;
> > +    }
> > +
> > +    case XENPF_microcode_update2:
> > +    {
> > +        XEN_GUEST_HANDLE(const_void) data;
> > +
> > +        guest_from_compat_handle(data, op->u.microcode2.data);
> > +
> > +        ret =3D microcode_update(data, op->u.microcode2.length, op->u.=
microcode2.flags);
>
> Nit (style): Overlong line.
>
> > --- a/xen/include/public/platform.h
> > +++ b/xen/include/public/platform.h
> > @@ -624,6 +624,19 @@ struct xenpf_ucode_revision {
> >  typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
> >  DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
> >
> > +/* Hypercall to microcode_update with flags */
> > +#define XENPF_microcode_update2    66
> > +struct xenpf_microcode_update2 {
> > +    /* IN variables. */
> > +    uint32_t flags;                   /* Flags to be passed with ucode=
. */
> > +/* Force to skip microcode version check when set */
> > +#define XENPF_UCODE_FLAG_FORCE_SET     1
>
> Nit: What is "SET" in the identifier intended to mean?
"SET" to be removed in v4.
>
> Jan

