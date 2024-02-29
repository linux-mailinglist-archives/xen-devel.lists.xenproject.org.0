Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024686CFBD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687344.1070701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjg0-0007Wu-1f; Thu, 29 Feb 2024 16:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687344.1070701; Thu, 29 Feb 2024 16:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjfz-0007VI-U8; Thu, 29 Feb 2024 16:54:31 +0000
Received: by outflank-mailman (input) for mailman id 687344;
 Thu, 29 Feb 2024 16:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygh/=KG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rfjfy-0007VC-1D
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:54:30 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 340c21f3-d723-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:54:29 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so13836681fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:54:29 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a05651c10a800b002d31953bc30sm97443ljn.55.2024.02.29.08.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 08:54:28 -0800 (PST)
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
X-Inumbo-ID: 340c21f3-d723-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709225669; x=1709830469; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uHTRH7mtyCb6DPkEgHpCUaZWQ7YxVbG0pvJNtrNBTYY=;
        b=hyz+4lsqYgiyqLXN9GBQ8p1EQ6UZaBOyJSUdagJLQDmrQ+6ATrToRAip2vuv7NKirh
         HI2yxYZzr02nLC8e28kgBS3++GILYsqlSoqXaZgUgYirGHRlACoAHWDvtL4z6FjBTQFV
         00gGXRzShGq4xtLpvvXGy0eljz3+CazAL/1D+9fash9S60hLBc+JvuuOEmRVcyJbnsmb
         196/tMJsd9Laxq5On7BMO3+qbtZb43ZDtQ38OdW3YiHo7XxrARhlyfo+rwJ64kC7TdDI
         cqRLw547gj48iOgOlCn02Kht6gDbz+Wx8CPRoKMAIjjSu8UgW6JfNc+ex3DWEZ+Cu0z4
         ZSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709225669; x=1709830469;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHTRH7mtyCb6DPkEgHpCUaZWQ7YxVbG0pvJNtrNBTYY=;
        b=f/fqsgABie8a5WXjCqggPTkFicrc9g1NDqArnFm8ZNCfBJB+T6UPdpje97CNYO9nGx
         5kQFnYGqylsZbWC8gJMGibVGwdEprLb4hnoEwYX9E0DZv/Kg+UW9kpIErdSOLNLeV94/
         /8GoxRrUmntMxKxkyISow+p33kQ8rF93tM9Zoq99FzPIDfBI9RpSzMofsRGjmWo/7NQK
         pnoYB+NYFOm/PGpXVY13GCPkKkdHKtb1TMe3FxY8HsLdH5ryqpAezSW9tdURST+68Fiy
         pQFxORWvLPaWBYexVl4lKEAo3eapfdjf64dSjudmtocUlmwmfTzaCEu4ngLQ0bQuln+e
         CllQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0agBEN4c/S9+dzhwLA4tmQtJdq4GV2xfThWysSGolWgn4HXmd3mPvSZ2pZGUw4qPWSSUSWLXm3fFBlIx7lBxBg5LvI73DF54XaPpvqGM=
X-Gm-Message-State: AOJu0YzIvYim+07iO8YMixiy2pvw963chPFwh/hhhkTlrwVJIfia3fov
	7ZM3EKUopZTGx1G503mT5VebparRlZywUEYXEuojoY26xr3MX/S3
X-Google-Smtp-Source: AGHT+IEGr+CMp/XbhGtq5l8EVs29eDLGMgbvTWEA1p7c7aOKBJ3JpZmFYgQra/r66I4uRYiwxbYEdQ==
X-Received: by 2002:a2e:a40d:0:b0:2d3:9b4:4363 with SMTP id p13-20020a2ea40d000000b002d309b44363mr1632852ljn.23.1709225668496;
        Thu, 29 Feb 2024 08:54:28 -0800 (PST)
Message-ID: <7febc1be78f19ef9b5c5e76ebb47ec3883cf2a2e.camel@gmail.com>
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 29 Feb 2024 17:54:27 +0100
In-Reply-To: <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
	 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
	 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
	 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-02-29 at 08:58 +0100, Jan Beulich wrote:
> On 28.02.2024 23:58, Julien Grall wrote:
> > On 27/02/2024 07:55, Jan Beulich wrote:
> > > On 26.02.2024 18:39, Oleksii Kurochko wrote:
> > > > This patch doesn't represent a strict lower bound for GCC and
> > > > GNU Binutils; rather, these versions are specifically employed
> > > > by
> > > > the Xen RISC-V container and are anticipated to undergo
> > > > continuous
> > > > testing.
> > >=20
> > > Up and until that container would be updated to a newer gcc. I'm
> > > afraid I view this as too weak a criteria,
> >=20
> > I disagree. We have to decide a limit at some point. It is sensible
> > to=20
> > say that we are only supporting what we can tests. AFAIK, this is
> > what=20
> > QEMU has been doing.
>=20
> I view qemu as a particularly bad example. They raise their baselines
> far too aggressively for my taste.
>=20
> > > IOW it is hard for me to see why RISC-V needs stronger
> > > restrictions here
> > > than other architectures. It ought to be possible to determine a
> > > baseline
> > > version. Even if taking the desire to have "pause" available as a
> > > requirement, gas (and presumably gld) 2.36.1 would already
> > > suffice.
> >=20
> > I think we want to bump it on Arm. There are zero reasons to try to
> > keep=20
> > a lower versions if nobody tests/use it in production.
> >=20
> > I would suggest to do the same on x86. What's the point of try to=20
> > support Xen with a 15+ years old compiler?
>=20
> It could have long been bumped if only a proper scheme to follow for
> this and future bumping would have been put forward by anyone keen on
> such bumping, like - see his reply - e.g. Andrew. You may recall that
> this was discussed more than once on meetings, with no real outcome.
> I'm personally not meaning to stand in the way of such bumping as
> long
> as it's done in a predictable manner, but I'm not keen on doing so
> and
> hence I don't view it as my obligation to try to invent a reasonable
> scheme. (My personal view is that basic functionality should be
> possible to have virtually everywhere, whereas for advanced stuff it
> is fine to require a more modern tool chain.)
>=20
> The one additional concern I've raised in the past is that in the end
> it's not just minimal tool chain versions we rely on, but also other
> core system tools (see the recent move from "which" to "command -v"
> for an example of such a dependency, where luckily it turned out to
> not be an issue that the -v had only become a standard thing at some
> point). While for the tool chain I can arrange for making newer
> versions available, for core system tools I can't.=C2=A0
Can't we identify the top X most popular Linux distributions ( LTS
versions ) and align Xen's minimal toolchain version with the selected
distributions' minimum toolchain versions?

> Therefore being too
> eager there would mean I can't really / easily (smoke) test Xen
> anymore on ancient hardware every once in a while. When afaict we do
> too little of such testing already anyway, despite not having any
> lower bound on hardware that formally we support running Xen on. (And
> no, upgrading the ancient distros on that ancient hardware is not an
> option for me.)
It seems there is no room for upgrading the toolchain version. This
leads to the question of determining the threshold between maintaining
the version as minimal as possible and deciding to upgrade it.
I understand your situation where you have an ancient hardware that
necessitates the use of older Linux distributions. However, is this a
common use case?

~ Oleksii






