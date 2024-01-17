Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F018304A2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 12:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668426.1040642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ4F8-0003hZ-Ji; Wed, 17 Jan 2024 11:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668426.1040642; Wed, 17 Jan 2024 11:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ4F8-0003gO-G4; Wed, 17 Jan 2024 11:38:02 +0000
Received: by outflank-mailman (input) for mailman id 668426;
 Wed, 17 Jan 2024 11:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sm03=I3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQ4F7-0003gG-I0
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 11:38:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de32ab31-b52c-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 12:38:00 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so1208735166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 03:38:00 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a1709066b1500b00a2990007447sm7629125ejr.122.2024.01.17.03.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 03:37:59 -0800 (PST)
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
X-Inumbo-ID: de32ab31-b52c-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705491480; x=1706096280; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sV2iKZBNMnJdQqcU6S7R1EQegPazY9oVOLXivMhlgVE=;
        b=Vh+V3p7mnweCyNly7TSLRGfU0d+7eJDrYrCY5IcjwLOZlvUQ0UuKqAwFcM0Wt0nuvD
         rJJkVEfmpTLWq3xuW2YLDcbczBMPSLUhO2Aw8+DlW7pnOZEF7neN4hXHmT7Vp23OLUSE
         u60BlJhPvFx24SMAwtU7nrM40MPxKTw+XFRR0Ef8WDATtgTJfnpU8Ba5l2QPgYQL5zF1
         Nfzk2ZK06bafu24azqZHwlbnseQHVGLiKGuIG7mSx+ti/ztKJg4FKw2W3ttBoopkvtG0
         uH51H68gxJavV3HC0S1Flht3oLGFrMOy6avDYBLOan5HQfZPRCtqQp6ttgnpAQLVAhHs
         Xrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705491480; x=1706096280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sV2iKZBNMnJdQqcU6S7R1EQegPazY9oVOLXivMhlgVE=;
        b=sOg87/5l0ZzCAM2TMg50CQv6l8guZ/3v18N1Gam3lNXWD2NyqkNmalYqFd7RHAGYJc
         Zt1gabHH0lkLa23gIbmfsLHp30SOkPfRW86M2rXEuPzCHLLC3G/C8968FQmCGW93SprW
         A5BH3a+QU23zFlcBrJ9BTp/2DLlc33tW6/DKWdZ4Dfzwg/F3YE2M3UxH/Up0v/QHowVl
         R45Jb7hrEv+IwoC2Mi8W0a9e/DEtRC2/MmDgwF1mZtWQPtVmK7q6tnDUXAXg04qbna3S
         cPsA/BxpLOiz0TCUcuMSOH1Y+fNzfJ1ij1RDfHofohtTYP7Te92CfLpDslixplfTzLyX
         g4BQ==
X-Gm-Message-State: AOJu0Yya56u1cWGA9qp9agljByYgtBIrgsDCoTO8SnrLSkM387KIy3cq
	rMOaiI8mTBETFvwuYZfszhY=
X-Google-Smtp-Source: AGHT+IHgdNewBkcOAThWunLNTlX+CXj+VPniTma/WzpWXSNwbY3uGFMkCiIM58QeuV7Y4sH3hUPRNA==
X-Received: by 2002:a17:906:2b46:b0:a2d:4899:f287 with SMTP id b6-20020a1709062b4600b00a2d4899f287mr3444690ejg.143.1705491479833;
        Wed, 17 Jan 2024 03:37:59 -0800 (PST)
Message-ID: <1b20fefd125598e2bb62d516495783650da75271.camel@gmail.com>
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 17 Jan 2024 13:37:58 +0200
In-Reply-To: <2e10b170-5a75-4ae0-8d2f-c6c1ad9951a5@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
	 <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
	 <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
	 <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
	 <863b09f03d37e96d737ab6bda4cc8923f75550fd.camel@gmail.com>
	 <2e10b170-5a75-4ae0-8d2f-c6c1ad9951a5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

> > >=20
> > > > > Also you want to make sure asm-generic/bitops/bitops-bits.h
> > > > > is
> > > > > really in use here, or else an arch overriding / not using
> > > > > that
> > > > > header may end up screwed.
> > > > I am not really understand what do you mean. Could you please
> > > > explain a
> > > > little bit more.
> > >=20
> > > Whichever type you use here, it needs to be in sync with
> > > BITOP_BITS_PER_WORD. Hence you want to include the _local_
> > > bitops-
> > > bits.h
> > > here, such that in case of an inconsistent override by an arch
> > > the
> > > compiler would complain about the two differring #define-s. (IOW
> > > an
> > > arch overriding BITOP_BITS_PER_WORD cannot re-use this header as-
> > > is.)
> > >=20
> > > The same may, btw, be true for others of the new headers you add
> > > -
> > > the
> > > same #include would therefore be needed there as well.
> > Now it clear to me.
> >=20
> >=20
> > It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD, and
> > BITS_PER_BYTE are defined in {arm, ppc,
> > riscv}/include/asm/bitops.h.
> > I expected that any architecture planning to use asm-
> > generic/bitops/bitops-bits.h would include it at the beginning of
> > <arch>/include/asm/bitops.h, similar to what is done for RISC-V:
> > =C2=A0=C2=A0 #ifndef _ASM_RISCV_BITOPS_H
> > =C2=A0=C2=A0 #define _ASM_RISCV_BITOPS_H
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #include <asm/system.h>
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #include <asm-generic/bitops/bitops-bits.h>
> > =C2=A0=C2=A0 ...
> >=20
> > But in this case, to allow architecture overrides macros, it is
> > necessary to update asm-generic/bitops/bitops-bits.h:
> > =C2=A0=C2=A0=C2=A0 #ifndef BITOP_BITS_PER_WORD
> > =C2=A0=C2=A0=C2=A0 #define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 =
32
> > =C2=A0=C2=A0=C2=A0 #endif
> > =C2=A0=C2=A0 ...
> > Therefore,=C2=A0 if an architecture needs to override something, it wil=
l
> > add
> > #define ... before #include <asm-generic/bitops/bitops-bits.h>.
> >=20
> > Does it make sense?
>=20
> Sure. But then the arch also needs to provide a corresponding typedef
> (and bitops-bits.h the fallback one), for use wherever you use any of
> those #define-s.
Which one typedef is needed to provide?
<asm-generic/bitops/bitops-bits.h> contains only macros.


~ Oleksii

