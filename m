Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AA3B07DE0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 21:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045614.1415758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc7uH-0007Ie-T7; Wed, 16 Jul 2025 19:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045614.1415758; Wed, 16 Jul 2025 19:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc7uH-0007Gh-PZ; Wed, 16 Jul 2025 19:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1045614;
 Wed, 16 Jul 2025 19:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc7uG-0007GI-7X
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 19:35:08 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f948172c-627b-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 21:35:06 +0200 (CEST)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-40ba1782428so3652b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 12:35:06 -0700 (PDT)
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
X-Inumbo-ID: f948172c-627b-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694504; x=1753299304; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Uf+qPaHp9kWW6q3d66Y0AykuaqSii4h2jP2Qbd3Dk8=;
        b=NbnPtYdxF0X+3SDKF2iPlRQHKiqtPRJKnhGffO6lRPVLvMTvZNNApGCo1faUdts1Ru
         FJCp8iFahMBgbJMOoYW6S8rNoK+LW6W7wzD3IIwlk75yrJfFoDnlDn8g0WTzXHyFI6v0
         Q5ixeVh1D/BboooWQB5AdI4P+Vm5LC1+Gk95wySDx9DiRMr6dPYkvNmhb/+wx+QpXJs9
         JTeu09KnvVvD/zf9+HD/cZHKYOB7KSTmwq8cOyuf4tE9KcikmCQBraOkrWXTuZsE9Kbk
         YgLVQV+dEYOsb8Z3+X3UMFodg/buPwtrKnPQuVi0UXVQdrGNdAz9sD1WrHUW9yVbRasS
         Bl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694504; x=1753299304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Uf+qPaHp9kWW6q3d66Y0AykuaqSii4h2jP2Qbd3Dk8=;
        b=kp53ZzycVKcaonMy1ujnzCGdmGNBpKipkE/u6UcKzl2YgZ+L53R+/SA11wpgg/XAi4
         NoAgDmGZvM+gfgb7ISvshKFhQzYledPcKL3aVqwCcxttVwKT6SMDlk9IrRHJVHKLlMbs
         lrrcdctSbAk6Rsu02R+RRUT+70Ey+D5ysndE4rDmEchZFsV4iV3LIU1cTMU/Q6h/iZiU
         wNeLdDaYseFveBRhvqgAVMyoQILuIJFiBlM7sevpMyqOHP/DrH3kmOmxCnRhJE8oTwli
         YyqFuCsTC4HrRZYjksBN8ylxaDHF/15OPbdKPsMyGYmzZfGBT88m0vUETP4pd0rEoNQ+
         WvXA==
X-Forwarded-Encrypted: i=1; AJvYcCVxeR8GI+jET2ot+YQ3qhMJgDhkbKiuc8XvMVUw+ijl6BxblWdO+cksmbXlfWOW3KCpC2eKa2OO5iU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNCEnBIMDC+3gCZxyKYRFau55x5ARFQxz8iJmmIYuAbESDSrqv
	HV3oJAMQC5qk2OGdbwVzjtNFMGfzg8Ch0gTkk6VSiwEyG61g60Ru77nwXx5b/DkbMs40SVpcaIg
	fYB6y81bvDf1BhGp6WbiafBJw7qXcV5I=
X-Gm-Gg: ASbGncv6hZrzky05DaosZjuQpeOj7iF/6laI0EK1F3O98tWD/SIRrZbGQylnzr23z6T
	BNgQLaPZKMiCf5kq259eiGX8Qteh4x/Subl7KqGLOzN7gComoTjHvuzfDo2dEfVTBNhMJN7H5eb
	hA7VMqS6EkzS6UISTnmYyBNdaBaxsoMZDkn/I5LDog8SiU2R5jk2MF3NillJsijh/xZlOwpQxYS
	SZ5DrUd
X-Google-Smtp-Source: AGHT+IE+nQs8nXwmJiDqLZU01ltKB1ELDFy3sD0gC2vQV5qq2Dy/u0Pc0eR9oLGK9bX7peugn2ZwJX1F+iRmetHFTFs=
X-Received: by 2002:a05:6808:15a0:b0:3f6:8233:bc63 with SMTP id
 5614622812f47-41cf02ea12dmr1160429b6e.8.1752694504443; Wed, 16 Jul 2025
 12:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752533080.git.w1benny@gmail.com> <9494aa56929b5cb443b9cccb0e671510071b4aab.1752533080.git.w1benny@gmail.com>
 <9357cd00-3557-46ff-9a74-ae44c298bc47@suse.com>
In-Reply-To: <9357cd00-3557-46ff-9a74-ae44c298bc47@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Wed, 16 Jul 2025 21:34:53 +0200
X-Gm-Features: Ac12FXyyqIBiUUSUc1o0XZduShXSt1sQ6xJ0LIdG-EDNFSoCZU8Hrq-YqBqZvxs
Message-ID: <CAKBKdXga6w_Qn1+3uet9O5xCySQUXuvYv=TQBQis+bEKL9=HuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hvmloader: fix SMBIOS table length checks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 12:27=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> > +    if ( next !=3D start )
> > +    {
> >          /* Set current chassis handle if present */
> > -        if ( p->header.length > 13 )
> > +        if ( p->header.length >=3D offsetof(struct smbios_type_2, boar=
d_type) )
>
> Comment and code don't fit together, unless one goes check that board_typ=
e
> is the field immediately following chassis_handle.

That's the tragedy of using offsetof in this situation. What is mostly
needed throughout this code is "offsetof(x) + sizeof(x)". Instead, I'm
mostly using offsetof(a-field-that-is-following-the-field-that-i-really-mea=
nt)
which leads to comments that seemingly don't make sense.

How should I ideally proceed? Should I introduce a new macro?

>
> >              if ( *((uint16_t*)ptr) !=3D 0 )
> >                  *((uint16_t*)ptr) =3D SMBIOS_HANDLE_TYPE3;
>
> Why not switch to p->chassis_handle, without any use of "ptr"? Yet then I
> fear I don't really understand what is being done here.

Right, that would make sense. I left the original code intact.

> Why would an arbitrary non-zero value be overwritten with a fixed value?

That's a question for the original author. FWIW, qemu does not coerce
these values.

But if I had to guess, the original author wanted to make sure that
the SMBIOS data do not reference nonsensical handles.

I would argue that if a user decided to fiddle with these values, they
know what they're doing and I would let them shoot in the foot if they
desire to do so (in other words, I would remove this coercion; but
that's not up to me to decide).

> The other comment may want retaining, though.

Which one do you mean? This one?

> -    /* Only present when passed in */

If so, I should probably add this comment to all the newly introduced
tables as well.



P.

