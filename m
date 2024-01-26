Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18083D701
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 10:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671902.1045423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIwi-0005IZ-94; Fri, 26 Jan 2024 09:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671902.1045423; Fri, 26 Jan 2024 09:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIwi-0005FJ-6A; Fri, 26 Jan 2024 09:56:24 +0000
Received: by outflank-mailman (input) for mailman id 671902;
 Fri, 26 Jan 2024 09:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTIwh-0005FD-2H
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 09:56:23 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2899c537-bc31-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 10:56:21 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55a539d205aso212052a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 01:56:21 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a05640233c200b0055731d8f459sm422596edc.24.2024.01.26.01.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 01:56:20 -0800 (PST)
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
X-Inumbo-ID: 2899c537-bc31-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706262981; x=1706867781; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IfgyVviuNpZc+Nmi6QDi11EENi6yfNlW354N1B1Dq1M=;
        b=UHC/J4BxTL4mk6H38I/lSbhMvp0pVkWCP1i88iqL4wi5aRBU5imoHr6seLdS7AS//1
         N6fO4+e+8hHrT2RpwMDGkdRCCWimJSY0oz7UkPXkm5WMqsq5xSdj9zBoTrS+2gqQcHDR
         sBPDs2Fd8hv0CK4rY22a0tbHmDj6OvsBQNazaDtMDnqGnYf9dbCVLwtt4h4QIzPYjvTO
         St/hUSjHb63umBP+rsAvkcBzbsWwJeelfkFobLn72AwNOedJNfkYxbdLPrLmSD7kC0M+
         xnVSk1mGy3Lg797hqVxmqZGWNQiGR3jVN6O7XRIrwi0V//0M4Ixn3VqKQl4CpDo519IH
         is4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706262981; x=1706867781;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IfgyVviuNpZc+Nmi6QDi11EENi6yfNlW354N1B1Dq1M=;
        b=p/pHLox+1Dq4piAeo+S9oA0ZzIf1YIFtBEw8JyssL7E8RdsGOXhFg8xcE/j2HIOdKe
         9poQGigg7FQG044b3Umvmtfz/nS9j3v/PgOOvVP8tqzygYO4kTmKy8pzrk4grv3vByX5
         6uy5LxUo6l5LIFuqBB0Mm1y6iqkd7AZPz/4DRob6rvwE7s10Dj0rmAFFXOIYXVnEbb9t
         ZtzSo/pPiHK8mfUQ7PXFhz25O4+5+fHzCLKSFA7QMHtmuqZge0n/cZdiMkViWOxTC9MT
         ZbGWOuC8cb04wdx/MTswcnoBC4Q7HCf67hMh8uNvsxah1axE/dF0LQiA4ok57uWF6KHD
         JZ7Q==
X-Gm-Message-State: AOJu0YwNah0tSZPS/+LPem+s6GNcMDZ+GfqU66jhgAPwd8F6+UmqDxFX
	LCj9C4NxeKvi98F//LkPaZk8kiabhklzvakH1Wx+5239ANe3etLQ
X-Google-Smtp-Source: AGHT+IGQdH7JVZ9JXEKx+RdyXy0+jIan4K6HK415XKzaUPxJwkdOSTKXWLuKEs/ZMkLxpV4eBsg2OA==
X-Received: by 2002:a05:6402:1d1c:b0:55d:31f8:920a with SMTP id dg28-20020a0564021d1c00b0055d31f8920amr590724edb.27.1706262980936;
        Fri, 26 Jan 2024 01:56:20 -0800 (PST)
Message-ID: <f8f6fadb5c2e94fb52bedb0cc12d7504567992c5.camel@gmail.com>
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 26 Jan 2024 11:56:19 +0200
In-Reply-To: <e6d7806a-56c8-4b1e-965d-57685d856d98@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
	 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
	 <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
	 <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
	 <c899f039185d02ea49db29641ff5ca46a29008dd.camel@gmail.com>
	 <e6d7806a-56c8-4b1e-965d-57685d856d98@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-01-26 at 10:48 +0100, Jan Beulich wrote:
> On 26.01.2024 10:44, Oleksii wrote:
> > On Tue, 2024-01-23 at 14:37 +0100, Jan Beulich wrote:
> > > On 23.01.2024 13:34, Oleksii wrote:
> > > > On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
> > > > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > > > --- a/xen/common/Kconfig
> > > > > > +++ b/xen/common/Kconfig
> > > > > > @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
> > > > > > =C2=A0config GENERIC_BUG_FRAME
> > > > > > =C2=A0	bool
> > > > > > =C2=A0
> > > > > > +config GENERIC_FIND_NEXT_BIT
> > > > > > +	bool
> > > > >=20
> > > > > There's no need for this, as ...
> > > > >=20
> > > > > > --- a/xen/lib/Makefile
> > > > > > +++ b/xen/lib/Makefile
> > > > > > @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) +=3D x86/
> > > > > > =C2=A0lib-y +=3D bsearch.o
> > > > > > =C2=A0lib-y +=3D ctors.o
> > > > > > =C2=A0lib-y +=3D ctype.o
> > > > > > +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) +=3D find-next-bit.o
> > > > >=20
> > > > > ... you're moving this to lib/. Or have you encountered any
> > > > > issue
> > > > > with building this uniformly, and you forgot to mention this
> > > > > in
> > > > > the description?
> > > > I didn't check. My intention was to provide opportunity to
> > > > check if
> > > > an
> > > > architecture want to use generic version or not. Otherwise, I
> > > > expected
> > > > that we will have multiple definiotion of the funcion.
> > > >=20
> > > > But considering that they are all defined under #ifdef...#endif
> > > > we
> > > > can
> > > > remove the declaration of the config GENERIC_FIND_NEXT_BIT.
> > >=20
> > > What #ifdef / #endif would matter here? Whats in lib/ is intended
> > > to
> > > be
> > > generic anyway. And what is in the resulting lib.a won't be used
> > > by
> > > an
> > > arch if it has an arch-specific implementation. Problems could
> > > arise
> > > if
> > > an arch had an inline function colliding with the out-of-line
> > > one.
> > > But
> > > that's about the old case where I could see a need to make the
> > > building
> > > of one of the objects conditional. And you'll note that withing
> > > this
> > > Makefile there are pretty few conditionals.
> > We will have such issue with PPC:
> > ...
> > static inline unsigned long find_next_bit(const unsigned long
> > *addr,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long offset)
> > ...
> >=20
> > It looks like an introduction of new config for find_next_bit is
> > needed.
> >=20
> > Does a better option exist? Would making find_next_bit non inline
> > non
> > inline for PPC better?
>=20
> Isn't that generic code anyway? If so, that also wants replacing by
> the generic library function(s). Shawn - I have to admit I have a
> hard time seeing why this was introduced as inline functions in the
> first place.
You are right, it is generic one too. I'll replace it too.

~ Oleksii

