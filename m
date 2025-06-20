Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EC6AE1FE3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 18:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021012.1397086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSeLj-000509-NW; Fri, 20 Jun 2025 16:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021012.1397086; Fri, 20 Jun 2025 16:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSeLj-0004x2-Id; Fri, 20 Jun 2025 16:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1021012;
 Fri, 20 Jun 2025 16:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sh1O=ZD=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uSeLi-0004wu-Cg
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 16:12:18 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52db65da-4df1-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 18:12:12 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2ea08399ec8so1309305fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 09:12:12 -0700 (PDT)
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
X-Inumbo-ID: 52db65da-4df1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750435931; x=1751040731; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQnYi48SbPgTUZy1iwUnuMTnzmPhOqN6A19iIBg6Tp8=;
        b=s68oPtnYfnT+3Y1dxvPPTHKMhd/VMuED0D8jKZ8tKX3x3+Hb1ld2/xer7myr2S8qZS
         IEu2dxTetsem0deXqcE9pCipwTQY9kNab9II4T4cOgeY0xChRz5jDRhVji8/OZaP0mKQ
         2xFcsBtp1GVe2KZ5vHfxcuos/0e3A+taMBslU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435931; x=1751040731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQnYi48SbPgTUZy1iwUnuMTnzmPhOqN6A19iIBg6Tp8=;
        b=cTxieLJ0gRhBfOvFALtnWPdI6TT5ljK2UHmXKgfRcSlGTDOQXo8dQHXhE0UAfQAVUd
         ZPdNfZTJMVLSPKvNQkT6fN6pKVysCqAXakRPjytHHIkD2oSYtfzB0mnwMV+Sfnksp47k
         qihuwekEvxSu1wGON3qXJk40aqgCUqFIwCT5WPgERWfvMH20RhCDY0paZYSUZqMQMRTy
         aGBtHdjbkQwjjrWK3as/cKrZ9qh3TQ9d195AqLhpKfGpdS/ZitnY9lcxeVY7amA3zf/e
         1Soq5kXroHw6OjrAoBmrk+nfdthFRI3lftZ+Fxrq9n3ox12RK99W0iWMe/hOhxZRfGJz
         fbfg==
X-Gm-Message-State: AOJu0YxRy8dMmGQ0Pkz26Q5jDfWjI4Q/KPkVSVystIThjyaMYERYyQVY
	v+UexhC+BqHvTRfj4XS0wwfxI69dibg1R6Ak4ldMv7nwng9p/IXKAlD+Me/vudXILn2uWFlqQ7K
	KaFdO9uItel+7oiOqr3tPZLu7JVa1NbEnsTuuvs4Z
X-Gm-Gg: ASbGnctg9Pp2PlXoTIDgYxyTo2/I0fdN4MjwcgEIzV9O7NSqC0sc9Ekp476Ht0/0JrF
	ohIHl8Z4G7CyhFKxMu6LhWF0qJbAUI3XNCSuBIDwtZj231G68ZFxvG9qBbF2XcdAuoMabOH/zN5
	pw0rPRhhZ9sVlNakwjHxvEIX664vCER9BsuRySG+oQQA==
X-Google-Smtp-Source: AGHT+IG98u6JftdOQce9nuZLXviIxdbEoYNaWMmlttdvwQmyqCf0IZVD06mokX22Vw+3yE7LtqGfQSAYFPdes/5d6xU=
X-Received: by 2002:a05:6870:238c:b0:2c2:dfbb:2dbd with SMTP id
 586e51a60fabf-2eeda55fb5emr2291770fac.8.1750435931456; Fri, 20 Jun 2025
 09:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-4-ross.lagerwall@citrix.com> <aFUvtMeBDEIc8njk@macbook.local>
In-Reply-To: <aFUvtMeBDEIc8njk@macbook.local>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 20 Jun 2025 17:11:59 +0100
X-Gm-Features: Ac12FXw-5omNZZwA0W9s4TLR80CH9YMIvJbtYQ57aZZ0NW-sv-u_S7lE2w04plo
Message-ID: <CAG7k0Er_a_19gaATvS3ycygBuGaZ9ZRrPG-iLdfUvcwfM8ne=Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] crypto: Add RSA support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 10:53=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Mon, Jun 02, 2025 at 02:36:35PM +0100, Ross Lagerwall wrote:
> > In preparation for adding support for livepatch signing, add support fo=
r
> > RSA crypto.
> >
> > The RSA code is extracted from Nettle at tag nettle_3.2_release_2016012=
8
> > (https://git.lysator.liu.se/nettle/nettle).
> >
> > The MPI code is extracted from Linux at commit eef0df6a5953 (lib/mpi/*)=
.
> >
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >
> > In v3:
> >
> > * Move mpi.c to lib
> > * Fix header guard name
> >
> >  xen/crypto/Makefile   |    1 +
> >  xen/crypto/rsa.c      |  196 +++++
> >  xen/include/xen/mpi.h |   68 ++
> >  xen/include/xen/rsa.h |   74 ++
> >  xen/lib/Makefile      |    1 +
> >  xen/lib/mpi.c         | 1729 +++++++++++++++++++++++++++++++++++++++++
>
> Just FTAOD: all the functions imported in mpi.c are used I think?  So
> that we don't introduce unreachable code.
>

Yes, everything included here is used by the end of the patch series.

Ross

