Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3997A3C51B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893231.1302147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkn1w-0006Wk-BP; Wed, 19 Feb 2025 16:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893231.1302147; Wed, 19 Feb 2025 16:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkn1w-0006Te-8K; Wed, 19 Feb 2025 16:34:36 +0000
Received: by outflank-mailman (input) for mailman id 893231;
 Wed, 19 Feb 2025 16:34:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLUF=VK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tkn1u-0006TY-SL
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:34:34 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65eabb34-eedf-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 17:34:33 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-72726025fa5so965190a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:34:33 -0800 (PST)
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
X-Inumbo-ID: 65eabb34-eedf-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739982872; x=1740587672; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXJHoZaBvJeCpi2qYQEOp2kJjsURREqvXp07AR/Bgmw=;
        b=Kg8vdTLzy2prGyB9yMeqduZIdfVYadpUrUNYmlVQlJ+yaKUiYdemU9pQhKMK5tLRVI
         pBQ/fJ/ZTBRWDltxNLnDusmGgd43r/Q0CKD8/0tZF+4j0VGs0jjx+2pvAipqSI5SujPZ
         hd/UYePZg32FrK5/AxPtxQ7frcrhoq9MmDpQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739982872; x=1740587672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXJHoZaBvJeCpi2qYQEOp2kJjsURREqvXp07AR/Bgmw=;
        b=Bs7pp5aXC0A+9gMobp3WEHosezJvr0d8nF8p+8YQoOC4qcqh4ciJcJ0CwgMWZ+mWe0
         OkiuWmVZcfdZQWgtXs7diYS9OpMsd5ZgMvVHlGRA7MPGhLq43LHu2ET1E84CBRrjgljH
         WsMdkGjTsBSN2bDTAEJ3YH6B79fx4BD/YKk6YxkL+G18G2B1gH2eyufvEV+HlpND7094
         /+QcTq0g29d1yqp1KoIYSyArlLh3HbIJxMcvjB3g+90IGHR+h+grMppeoyaYb+1yOWUb
         VDCcqOuXbH4P1g25M16GtY7XpyTdg6nEtTvC+AxwAyRJXHPqkeLHMGRLVi/QuqC/C9EN
         NgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMIIbJbCGYNk9+S40RXAhSE33+57MPDOU/JH28Vq9s+0kxFhbVwYhafrmZ2Q83Qmtf5Q5Fo7eltfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRr8vAdBJL9f5aqfMxvICizl35gXTO3HtqSEtGL8BVjnjf1rwO
	ucRLOlqjQV1MGvHPMmBuuj1CLyQJ7s5stlsJVuaAcbzugjM7lhkcmq2QH9r7/540dmmoAOaSQAm
	2mxT1+0NoYfeW8e1OkQsYo4BDLaUvKEuYNGA5mA==
X-Gm-Gg: ASbGncumCdXtSvWU++FcGTURCK4YDcRDNzKP/Jye4wsSbwc+RN48lFM2GDXp9AR+/cx
	mnblJ5Zo6/0TYN4TPubTffa4GK7ATuKFNVqgFzGhkVwIQQgLgHnIdqliNm5s8IVIgbtl5rQ==
X-Google-Smtp-Source: AGHT+IHYTKDoHt0Mf+og4+XrPNNx2vcoLKam3zXekAcmO/SONnYdFQOsqM9UOMmbXPkZo8c1X/xCCIX9pWCCMtB04/c=
X-Received: by 2002:a05:6870:8a23:b0:29e:5e54:76d9 with SMTP id
 586e51a60fabf-2bc99a6a6e0mr11568470fac.11.1739982872415; Wed, 19 Feb 2025
 08:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com> <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
 <CACHz=ZhuOL3Le=+y0zFRaWBDEdLO_faLKZ83072Z0e88wZMpPw@mail.gmail.com> <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com>
In-Reply-To: <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 19 Feb 2025 16:34:21 +0000
X-Gm-Features: AWEUYZmRl6OsldjyrcfpcyOaRs6o5ykYxo_D7bxgQKFFh6DqPVHAgu4r8FlqtQc
Message-ID: <CACHz=Zhv5jnQ-amWwcjxOD0L+vNXFHbhs+qUkJp53MqUuwvQ1g@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 4:56=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 17.02.2025 17:52, Frediano Ziglio wrote:
> > On Mon, Feb 17, 2025 at 4:41=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >>
> >> On 17/02/2025 4:31 pm, Jan Beulich wrote:
> >>> On 17.02.2025 17:26, Frediano Ziglio wrote:
> >>>> --- a/xen/common/efi/efi-common.mk
> >>>> +++ b/xen/common/efi/efi-common.mk
> >>>> @@ -2,6 +2,7 @@ EFIOBJ-y :=3D boot.init.o pe.init.o ebmalloc.o runti=
me.o
> >>>>  EFIOBJ-$(CONFIG_COMPAT) +=3D compat.o
> >>>>
> >>>>  CFLAGS-y +=3D -fshort-wchar
> >>>> +CFLAGS-y +=3D -fno-jump-tables
> >>>>  CFLAGS-y +=3D -iquote $(srctree)/common/efi
> >>>>  CFLAGS-y +=3D -iquote $(srcdir)
> >>> Do source files other than boot.c really need this? Do any other file=
s outside
> >>> of efi/ maybe also need this (iirc this point was made along with the=
 v5 comment
> >>> you got)?
> >>
> >> Every TU reachable from efi_multiboot2() needs this, because all of
> >> those have logic executed at an incorrect virtual address.
> >>
> >> ~Andrew
> >
> > I assume all the files in efi directory will deal with EFI boot so
> > it's good to have the option enabled for the files inside the
> > directory. The only exception seems runtime.c file.
>
> And compat.c, being a wrapper around runtime.c.
>
> > About external dependencies not sure how to detect them (beside
> > looking at all symbols).
>
> Which raises the question whether we don't need to turn on that option
> globally, without (as we have it now) any condition.
>
> Jan

I would avoid adding a potential option that could affect performances
so badly at the moment.
These changes are pretty contained.
I would merge this patch and check any external dependencies as a follow up=
.

Frediano

