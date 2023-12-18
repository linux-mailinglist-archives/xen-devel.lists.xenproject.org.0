Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83865816A68
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655751.1023491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFARs-00060z-8N; Mon, 18 Dec 2023 10:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655751.1023491; Mon, 18 Dec 2023 10:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFARs-0005yU-3k; Mon, 18 Dec 2023 10:02:08 +0000
Received: by outflank-mailman (input) for mailman id 655751;
 Mon, 18 Dec 2023 10:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f46f=H5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFARr-0005yO-Bs
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:02:07 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801c0167-9d8c-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:02:06 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e3845abdaso846596e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:02:06 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o20-20020ac24bd4000000b0050bfc775f51sm2889931lfq.169.2023.12.18.02.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 02:02:05 -0800 (PST)
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
X-Inumbo-ID: 801c0167-9d8c-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702893726; x=1703498526; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8KPNS9rX0K9FIdMM95PTvRzLQgHalLSgPcfO4iEp++M=;
        b=WS7m34nHnsWwX9GjKiah9blum1y14YIs98c8+CRKIT0nEu8j2b+KLTXZUcFH4gEuq8
         zStlG1ZlLGnamOyO5wG137Tl8EQ1yIlH8VA215ehlBz2RGPwz/WUtG7y8b6NeoSgyesy
         UZhlHajZ3EFLVtL+hCBD/ZYJhD9RTAnxvkmne2hyH+vOQARx+C/BnMwmb1Ne2dQY6zVX
         3mPIEQoPI3SQUI53qg+rwAY63TVoSEMecdKwPEdowVLuGoLqZF4oLp93J1B+AI+gO8Wl
         gQs1X6Yd87H27/gnXHF5zh49javD2ZOFG/ldAGxFkQU0DGEboVcsSCeokd7roXEBW7As
         ASfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893726; x=1703498526;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KPNS9rX0K9FIdMM95PTvRzLQgHalLSgPcfO4iEp++M=;
        b=dByyZxcFHaZWAP0TqEWpVbUGSrHZGnA0pumFea6vJRXO8wjr5CFUQYp+nQ7aKEQhsB
         HNGECuGXEtcK3K9qMTnzPk60VFIZySmvj+G6v/sYWvlMOeI25AlEuP5rLmdNwL2y4jbL
         el2n8g7LaPao7ftVA4sJgh99HoPUM2d7QZaS4k9U0PdSLHdrdK7l7ksW7mRljFarVSB+
         YRDXV2jJ51VGVi1CW95vfzXkaRqvi3+EmJCiY84o+NDaM9tI58U8dQ81YAcpw1xFrCqd
         3A4bAuV2lhz/PRxpsLhmNyZUhZSTSLHjIWEGseYQdN5SDE7pzDVV6xDKLgHxh9CmN02F
         kpDg==
X-Gm-Message-State: AOJu0Yy8VBvW9ps9Lhg3uTb35wq5EupErU3V6TUjoi3ZYlYCTjsxx6Ob
	7cUdnYbLmWfNjkUP0MvEyRU=
X-Google-Smtp-Source: AGHT+IHM68/awZGH1ze06wdVGQco/ZLkHPJks3f5v7VMgA5jE3VhNilCCWmDqqG9Y71DUbCR7vd67g==
X-Received: by 2002:a19:750c:0:b0:50e:2fe1:26fc with SMTP id y12-20020a19750c000000b0050e2fe126fcmr1058111lfe.19.1702893725897;
        Mon, 18 Dec 2023 02:02:05 -0800 (PST)
Message-ID: <406a8425dc711725d3575b4c06d7bcaaff05992b.camel@gmail.com>
Subject: Re: [PATCH v2 23/39] xen/riscv: introduce asm/guest_access.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 18 Dec 2023 12:02:04 +0200
In-Reply-To: <e08e2f49-5ed5-40ec-8db4-e2dd597c8046@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <7dda759b846003fcb453f1118cefbfd2eeb804d7.1700761381.git.oleksii.kurochko@gmail.com>
	 <e08e2f49-5ed5-40ec-8db4-e2dd597c8046@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 15:06 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/guest_access.h
> > @@ -0,0 +1,29 @@
> > +#ifndef __ASM_RISCV_GUEST_ACCESS_H__
> > +#define __ASM_RISCV_GUEST_ACCESS_H__
> > +
> > +#include <xen/types.h>
> > +
> > +unsigned long raw_copy_to_guest(void *to, const void *from,
> > unsigned len);
> > +unsigned long raw_copy_from_guest(void *to, const void *from,
> > unsigned len);
>=20
> For the full build to work, you will need to implement these
> somewhere.
> From the titles of further patches I can't guess where that would be.
> Note how PPC has decided to have these be inline dummies for the time
> being. It also looks as if you would also need raw_clear_guest()?
It is implemented in xen/arch/riscv/stubs.c:362,367.
Regarding raw_clear_guest() I'll double check. I don't have a
compilation issue with it, so I ignored this macros.

> > +#define __raw_copy_to_guest raw_copy_to_guest
> > +#define __raw_copy_from_guest raw_copy_from_guest
> > +
> > +#define guest_handle_okay(hnd, nr) (1)
> > +#define guest_handle_subrange_okay(hnd, first, last) (1)
>=20
> Arm has a comment next to these (actually two, I mean the latter),
> which
> I think would be sensible to also have here.
Thanks. I'll add the comment.

>=20
> > +struct domain;
> > +unsigned long copy_to_guest_phys(struct domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t gpa,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *buf,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int len);
>=20
> You don't need this just yet, do you?
Yes, you are right. This function isn't needed for now.

Thanks. I'll drop it.

~ Oleksii


