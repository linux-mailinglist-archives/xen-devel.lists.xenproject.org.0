Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A6F8AE9DD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 16:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710739.1110151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHWr-0001nd-Rz; Tue, 23 Apr 2024 14:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710739.1110151; Tue, 23 Apr 2024 14:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHWr-0001lU-PO; Tue, 23 Apr 2024 14:53:53 +0000
Received: by outflank-mailman (input) for mailman id 710739;
 Tue, 23 Apr 2024 14:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbx+=L4=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rzHWq-0001lN-DU
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 14:53:52 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c44fbe7-0181-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 16:53:51 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d9fe2b37acso77850661fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 07:53:51 -0700 (PDT)
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
X-Inumbo-ID: 4c44fbe7-0181-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713884031; x=1714488831; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbFelA8PXo1kBWplz3bLp6fXNzYsis+XulplU1h6jX0=;
        b=ca79IDqHWTrNToGfAW4Z2JkOfKuEWu2Ll5TU9VPbPTygpETE/5oXXgdYlT4arFV0l/
         CEuQEe5yJX//geBLyzUPAflQB/Lbl6Yjq149OI052pABqdyyezxedQ8YCyzt1+H09kzJ
         1GQstE8UvUexu5JzUnc5gNDp/6pc/6wWFKXqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884031; x=1714488831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbFelA8PXo1kBWplz3bLp6fXNzYsis+XulplU1h6jX0=;
        b=g1LIdkjqhNWRt8/M8jXf0qmf2TdnB+OKdsaH1bNS+TspEGgb5PgX27AA5mwP0hQ4GH
         IBT3YhWprQ22KzzR35sHKJjx32DOPNXfYMCpw5oVbdvJgHoiyJskk8p9QXbLOSIEvDcB
         gtIJsgSpMNXygr4h/4JuzSuZHhCYfnhz6BK7WnPIojmtW17gm8N7SUryRfTe40WXyQy2
         nqGLfnLHNuQ4Zm39tNLqF8Ogw2t70PixUmJ82g2PyDKBsLICSEy03UPzvp1BRK/hy3v4
         gTrXHH1xeTD9I1N6hxEyesQl2ujmwKF/d9ySfRDdHLoCzr2TECz4RUyQftY9dzzocwt0
         7QjA==
X-Forwarded-Encrypted: i=1; AJvYcCUpPuE/Zr2poOV2D43o7KdomIgEq2QMIkbR5d17qjnP++1QsAGaMFedSVfcETOgGdH563dyqiLWd1Cwf6DeDevkpRhZMLq055LvUPLir7E=
X-Gm-Message-State: AOJu0Yx2A6UhPQ7iZw1bdsFMEvqoKQj8OQvkaH1VlDC92ARMtXmYyy11
	hJBi/Gix8ZHVbaT1h7jdv5lq1QvYmjCpvYJ/7din3R6XUJgWHBZFv3fdtqpKd3QN8fjYyfzhLyP
	jNVuArq7lXcF4sG53lB12I4fXAh7lJ/aqUn6lIA==
X-Google-Smtp-Source: AGHT+IHeIY16J0ghdKPjwlX+oYgP4L4juwrm8PqBcc0GNz4PJcEFgEwnQHlvi5vNLI09j90jlRCwnJJatCsr+6dk/N4=
X-Received: by 2002:a05:651c:389:b0:2d6:85ec:fb49 with SMTP id
 e9-20020a05651c038900b002d685ecfb49mr8553621ljp.28.1713884030913; Tue, 23 Apr
 2024 07:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-3-fouad.hilly@cloud.com> <f789bf74-8296-4127-9612-a46d02a422ee@suse.com>
In-Reply-To: <f789bf74-8296-4127-9612-a46d02a422ee@suse.com>
From: Fouad Hilly <fouad.hilly@cloud.com>
Date: Tue, 23 Apr 2024 15:53:39 +0100
Message-ID: <CAJKAvHYEBabwDG36QtBkTGhym6m-uypZhv1HzaGhNuCKQnu1wA@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86: Refactor microcode_update() hypercall with flags field
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 10:16=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 05.04.2024 14:11, Fouad Hilly wrote:
> > @@ -708,11 +712,13 @@ static long cf_check microcode_update_helper(void=
 *data)
> >      return ret;
> >  }
> >
> > -int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long l=
en)
> > +int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long l=
en, unsigned int flags)
> >  {
> >      int ret;
> >      struct ucode_buf *buffer;
> >
> > +    ucode_force_flag =3D (flags =3D=3D XENPF_UCODE_FLAG_FORCE_SET)? 1:=
 0;
>
> No need for ?: when the lhs has type bool.
>
> But - do we really need to resort to parameter passing via static variabl=
es
> here? If it's unavoidable, its setting needs to move inside a locked regi=
on
> (with that region covering everything up to all consumption of the value)=
.
There are many function calls and checks of the firmware between
microcode_update() and the actual update, which makes static variable
the viable option.
In V2 I broke it down between the actual update_flags (static) and
force_flag (local to firmware update function), I understand that
might not be enough, I will look into further improvement for
microcode_update flags in V3.
>
> Further, to avoid the same issue again when another flag wants adding, yo=
u
> want to check that all other bits in the flags field are clear.
The above check is checking all bits in the flags field. Are you
referring to flag per bit where multiple flags can be set
simultaneously?
>
> > --- a/xen/arch/x86/include/asm/microcode.h
> > +++ b/xen/arch/x86/include/asm/microcode.h
> > @@ -22,7 +22,7 @@ struct cpu_signature {
> >  DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
> >
> >  void microcode_set_module(unsigned int idx);
> > -int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long l=
en);
> > +int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long l=
en, unsigned int flags);
>
> Nit: Too long line.
>
> > --- a/xen/include/public/platform.h
> > +++ b/xen/include/public/platform.h
> > @@ -99,6 +99,10 @@ struct xenpf_microcode_update {
> >      /* IN variables. */
> >      XEN_GUEST_HANDLE(const_void) data;/* Pointer to microcode data */
> >      uint32_t length;                  /* Length of microcode data. */
> > +    uint32_t flags;                   /* Flags to be passed with ucode=
. */
> > +/* Force to skip microcode version check when set */
> > +#define XENPF_UCODE_FLAG_FORCE_NOT_SET 0
> > +#define XENPF_UCODE_FLAG_FORCE_SET     1
> >  };
>
> The safety of this growing of an existing stable ABI struct wants at leas=
t
> briefly mentioning in the description.
>
> > @@ -624,6 +628,10 @@ struct xenpf_ucode_revision {
> >  typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
> >  DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
> >
> > +/* Hypercall to microcode_update with flags */
> > +#define XENPF_microcode_update2    66
> > +
> > +
>
> No double blank lines please.
>
> Jan

Thanks,

Fouad

