Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28672EA0C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 19:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548353.856269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q980S-0001UK-By; Tue, 13 Jun 2023 17:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548353.856269; Tue, 13 Jun 2023 17:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q980S-0001SN-7o; Tue, 13 Jun 2023 17:40:36 +0000
Received: by outflank-mailman (input) for mailman id 548353;
 Tue, 13 Jun 2023 17:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szI4=CB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q980Q-0001SF-MS
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 17:40:34 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65444082-0a11-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 19:40:32 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f61735676fso7360528e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 10:40:32 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac2510e000000b004f64fb058f7sm1839175lfb.225.2023.06.13.10.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 10:40:31 -0700 (PDT)
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
X-Inumbo-ID: 65444082-0a11-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686678032; x=1689270032;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pjXyEOycp7oBYqb+5xaTqmXWZodwhvh2JVz8Dvx1C70=;
        b=EVwjVaK9+GywCdSi8c0CS4ypNaeRGBJkisrKCYc8E7odOc/gUQJI1wxIh6y5qwAGlg
         vEYvTHhvmQlNra6hRndsRqE2Biuj6Dlcp8e5Qh9HzTJeJM7rUACcqWr/Cn1VIoqmXsFT
         xt6kzWEkKtoOYTMDKfh2c7bE7UkWJdxxGjDJfNbDSrcoO36gjIlBI+rCDjhJ/Fb8qvoH
         HPcdtXlNkbXo8u67aqLS/aPXGEc4pYuxxb+AX6kCUCZ14rlSx3udUd3VyndTJKhrI3CS
         j4fvgJ/7hB1j1toVffp+eLYy/+JUtjP3NMCqLbQYKcRH1WiA1UYRrIhLQTz8t60XJUCe
         OOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686678032; x=1689270032;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pjXyEOycp7oBYqb+5xaTqmXWZodwhvh2JVz8Dvx1C70=;
        b=XIPdsb5MEZz3MxffdxcTMmdgv+bavN8Jx9Hv37zQ3wiq2Vwc6/KFtfkBBBamAY/cOf
         1ijQiLjtK5O6B/R6EJU1bQRYF3TTI6iXlNF54st3Lt9mgJg48NjZumfTRdAG1tfHCaVc
         XWbhguNEwqty3t+BPjtjuhY0dmVd3IULGbgwNZD/NzUoBEroKPMV6ocPxkXWLmjSo6Ih
         aIlDGbyDxbaLa9b2hD4jzl3mYyOFq8eBa4HgqsEC7EEBcR9BFJIUqLifdbPUsMJa3N3U
         ZSkRXkzCl6ALLVcQLmXlO8e82jdsJBTqVBfMu7HADMwKWM7R7Pu9QWFlyGMOxM8FJI+Y
         0bQA==
X-Gm-Message-State: AC+VfDx+tYlgcmrmK9AVialA3X7Edxum/W2LbVtJWMO1g25v0pHxTUgP
	/m5h6W3ee//POo6U9eQCl60=
X-Google-Smtp-Source: ACHHUZ7cqtmDGCf/e29aS71EczRPxLn10YLUkisHjyF+jtPnEQcD5sayH+L+elNNc9J7baDA3B1KeA==
X-Received: by 2002:a19:3819:0:b0:4f3:b8db:917f with SMTP id f25-20020a193819000000b004f3b8db917fmr5650588lfa.47.1686678031574;
        Tue, 13 Jun 2023 10:40:31 -0700 (PDT)
Message-ID: <8611e975cb4788ef9e06162b6b70dbf509ff2d71.camel@gmail.com>
Subject: Re: [PATCH v1 1/8] xen/riscv: make sure that identity mapping isn't
 bigger then page size
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 13 Jun 2023 20:40:30 +0300
In-Reply-To: <bcb3e4a2-2aa0-efac-1879-f2c30de540b5@suse.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
	 <4ad639bed6b8aa6cee34288a7ce154db21d761b5.1686080337.git.oleksii.kurochko@gmail.com>
	 <bcb3e4a2-2aa0-efac-1879-f2c30de540b5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-06-12 at 09:09 +0200, Jan Beulich wrote:
> On 06.06.2023 21:55, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Such commits without description are worrying. This may be okay for
> entirely trivial and obvious changes, but that's going to be the
> exception.
>=20
> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -20,6 +20,7 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0 . =3D XEN_VIRT_START;
> > =C2=A0=C2=A0=C2=A0=C2=A0 _start =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0 .text : {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _idmap_start =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _stext =3D .;=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Text section *=
/
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text.header)
> > =C2=A0
> > @@ -35,6 +36,7 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.gnu.warning)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_AL=
IGN);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _etext =3D .;=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* End of t=
ext section */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _idmap_end =3D .;
> > =C2=A0=C2=A0=C2=A0=C2=A0 } :text
>=20
> So this covers all of .text. Why is it expected that .text will be
> (and
> remain) ...
>=20
> > @@ -174,3 +176,10 @@ ASSERT(!SIZEOF(.got),=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ".got non-empty")
> > =C2=A0ASSERT(!SIZEOF(.got.plt),=C2=A0 ".got.plt non-empty")
> > =C2=A0
> > =C2=A0ASSERT(_end - _start <=3D MB(2), "Xen too large for early-boot
> > assumptions")
> > +
> > +/*
> > + * We require that Xen is loaded at a page boundary, so this
> > ensures that any
> > + * code running on the identity map cannot cross a page boundary.
> > + */
> > +ASSERT(IS_ALIGNED(_idmap_start, PAGE_SIZE), "_idmap_start should
> > be page-aligned")
> > +ASSERT(_idmap_end - _idmap_start <=3D PAGE_SIZE, "Identity mapped
> > code is larger than a page size")
>=20
> ... less than 4k in size? And why is only .text of interest, but not
> other sections?
An idea was to keep identity mapping as small as possible because
basically identity mapping is needed only for a few instructions.
(probably it will be better to create a separate section and put all
necessary functions there)

Another point was to map the necessary code for switching from 1:1
mapping in one cycle. ( we are using 4K as a page size )

But it looks like PAGE_SIZE isn't enough. I rebased all my patches that
are needed to run Dom0 and compiler complains that _idmap is bigger
than PAGE_SIZE so I probably have to reject this idea ( to map only
PAGE_SIZE ).

Actually not only .text section is needed but also stack should be 1:1
mapped. ( what is done in setup_initial_pagetables() )
>=20
> I find the other assertion a little puzzling too: Isn't that merely
> checking that XEN_VIRT_START is page aligned?
Yeah, you are right.

~ Oleksii



