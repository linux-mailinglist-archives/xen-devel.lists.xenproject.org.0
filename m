Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFC7943E4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 21:46:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596826.930885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyTm-0000rM-Qz; Wed, 06 Sep 2023 19:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596826.930885; Wed, 06 Sep 2023 19:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdyTm-0000oF-Nr; Wed, 06 Sep 2023 19:46:22 +0000
Received: by outflank-mailman (input) for mailman id 596826;
 Wed, 06 Sep 2023 19:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdyTl-0000Ac-MR
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 19:46:21 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0db58c88-4cee-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 21:46:21 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bd0d19a304so4286411fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 12:46:21 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05651c10b000b002b9e6d7f72fsm3566424ljn.5.2023.09.06.12.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:46:20 -0700 (PDT)
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
X-Inumbo-ID: 0db58c88-4cee-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694029581; x=1694634381; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=okPQIA6vAY130R+Qj2Ti+0EjJFm14wP2sGjTLckAyeQ=;
        b=IR/t6KBYJfenlUTg6Kwfe6jQERJPCJ8Pp5DPhJ0gs7SETBy1qKbSG+fmxRINMYDuQ9
         4MIQMXdZKXJo3CqupmEnE43COqqZ12z4zLrjhpBT2OyhGSg4D25BiDgs/vnCbDzYpJ3S
         s2XtS/ar3qltrddkJZS+VVQWqVNY3qd0fW8/dHjQID1BKdxXUMgy/Oi8wifAM4wOJ8pS
         DDwoN3+2Art9qqi6UL//jIbmmDzImtE4+wpfqDwhpKweNz5tm93FO4zo+MLUxCBbSa47
         vI36E+SNdwFM3pRKdS5cffyqyA0yzU5blLPJQFuen0OD8zL/2glHhoYk2y74oYh5UMn3
         VdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694029581; x=1694634381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okPQIA6vAY130R+Qj2Ti+0EjJFm14wP2sGjTLckAyeQ=;
        b=lm7bjUNsdnREmfM15a+eXbCn2adf9xCgnoIR/LkPqN94gcBXRpamWwmTsVrmzBLru6
         v2FH6D2kHq0T1PoivknOYWFp2WMSLj6KFmLqtndJW76b0EC4DGp3fNJnQupWwtU4F4wK
         bbfTckvxAu2SndV8huChEO33p1mJrn5ychDpn0nHOXVHPR4jV34+zyAs1OKGcbjNKYbb
         jbDeDrbnSRoSlrh9KU3/olqHmaB6N0oxXgDru3JlDqMAZBlYdWfc6Q8O52u8U5zykI1L
         K0NqL0WdvwoqyoMej/eyYYgzw2GcuhjCuDQZo3LYBv8caOCiX7bK57gzcjvYUO+VX2bM
         37FQ==
X-Gm-Message-State: AOJu0Yz3h4LVDj6i9+l6dhIhLoOgIQhRtDV40hW0cdhuL/lbxOaVCmoj
	qKw8PUVK2eJLqULX09qgfu0=
X-Google-Smtp-Source: AGHT+IGrox2vlT90cm/yaz/H6y6RXFOljrMigzpLF2sLMmSRxZf4JylhMlYqR6zGta6iOYqJfRKK6g==
X-Received: by 2002:a2e:7d19:0:b0:2bc:df55:eec7 with SMTP id y25-20020a2e7d19000000b002bcdf55eec7mr2970775ljc.40.1694029580612;
        Wed, 06 Sep 2023 12:46:20 -0700 (PDT)
Message-ID: <a526c0b285d94550e59a8968786b28d266afba58.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,  Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Wed, 06 Sep 2023 22:46:19 +0300
In-Reply-To: <d6f68239-b918-4f6f-b287-b2a022aaf355@perard>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
	 <d6f68239-b918-4f6f-b287-b2a022aaf355@perard>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-09-06 at 16:57 +0100, Anthony PERARD wrote:
> On Fri, Sep 01, 2023 at 07:02:14PM +0300, Oleksii Kurochko wrote:
> > diff --git a/xen/Makefile b/xen/Makefile
> > index f57e5a596c..698d6ddeb8 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -667,6 +669,12 @@ endif # need-sub-make
> > =C2=A0PHONY +=3D FORCE
> > =C2=A0FORCE:
> > =C2=A0
> > +# Support for using generic headers in asm-generic
> > +PHONY +=3D asm-generic
> > +asm-generic:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(Q)$(MAKE) -f $(srctree)/sc=
ripts/Makefile.asm-generic \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 obj=3Darch/$(SRCARCH)/include/gener=
ated/asm
>=20
> Could you introduce a $(asm-generic) macro in Kbuild.include like we
> already have for $(build) and $(clean)? As I think it would be nicer
> to
> have
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(Q)$(MAKE) $(asm-
> generic)=3Darch/$(SRCARCH)/include/generated/asm
> in the main makefile.
>=20
> Also, could you move the rule "asm-generic" within the "!config-
> build"
> part of the Makefile? Somewhere around the rule for $(TARGET), maybe
> just after the rule "_distclean".
>=20
I pushed a new patch version tomorrow. I'll rework it based on your
comments here.

~ Oleksii

