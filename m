Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD1B67944D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 10:34:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483465.749656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKFge-000124-NP; Tue, 24 Jan 2023 09:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483465.749656; Tue, 24 Jan 2023 09:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKFge-0000zJ-KK; Tue, 24 Jan 2023 09:33:52 +0000
Received: by outflank-mailman (input) for mailman id 483465;
 Tue, 24 Jan 2023 09:33:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z8X8=5V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pKFgd-0000zD-Fa
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 09:33:51 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f71a37-9bca-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 10:33:49 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so12372590wma.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 01:33:49 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003db0b0cc2afsm14119060wmq.30.2023.01.24.01.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:33:48 -0800 (PST)
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
X-Inumbo-ID: 34f71a37-9bca-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OrZG6kmgRtXdjISbV3YapylA7pNTxy5mLEqT/LHitwg=;
        b=qbpL9siG8I4/g1xllEn1Qag+hvwxZ8clUITtvKEx4dNfFf3dXp9YrNINfMZGlj6izE
         Xsj47eLV4VMVtMMW+5Xb/9UXW4zkJpnqQ1FAFSR+WqDAX6WaQHW1/jbjbk4sgZQQ4APO
         /tDGNgMRdLZc3qexQWEJzdbj3DskFiN4O0w7z21Mk4eVMhjtBxMHwCqzIOpclVfw0Tpo
         n9r5ptdCg8xNF9eJCznFdRuLjy7G1mf7CHanuTCvRFutkUCHNrlPnUOyxVI+i3yvQra7
         3ZgKoyD7JFNv+/sdKufP7Goe5UOXrp3aIytXduPupHq7Znh7Y9LKJULwvEkaVOpsFa60
         4LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OrZG6kmgRtXdjISbV3YapylA7pNTxy5mLEqT/LHitwg=;
        b=UIH+t+58OsW5dHp7i/Ot76iTcCdMu2r5PcrO1mK+rOHBsqPmCXNyzX4bpp2EefkDLl
         Lj7dyiILCJP5irKp49Q5rB+Bt+SkG66vGbs+mH17cAzYxzWSO1rQwhg0PCk+AaAdbrvv
         3tzbHGWp65U13aWD0aqfmFEz40YOr9IIJh3pNVNCFM1mmwH0fgwfqEFfhgZwByvWNVUG
         X2WTB05KRSVjA7zlEIH1pdUyoZeJZm3vWZBYDxT3r6+qyhBeaM4+Zr/OVCxMRzgOGDpY
         ukkLsUWP5Gb/G4hbA1w7oX4/EBqu6x86QBfDKGDB/1rzqnaHdJ30v3ZXoeGe+Q7dDwhz
         Gg7g==
X-Gm-Message-State: AFqh2kqos66Pzz6nrUzL/YRKyDNf7RX5CSgSynXJMhVxc4CPGodC4W6d
	LYEbGHuJSyzMy4WUrHBO96c=
X-Google-Smtp-Source: AMrXdXu8Sm+A5CPMqUJT/g13G9CUSQ7jhoUqti1Yuf/ZqO632HS2C/NK9SW44Bq6u0c/9miH88b+kQ==
X-Received: by 2002:a05:600c:35d4:b0:3db:3694:b93c with SMTP id r20-20020a05600c35d400b003db3694b93cmr14377450wmq.15.1674552828796;
        Tue, 24 Jan 2023 01:33:48 -0800 (PST)
Message-ID: <4536fdefd885719106d6de1de4a3ed16aa39f10f.camel@gmail.com>
Subject: Re: [RISC-V] Switch  to H-mode
From: Oleksii <oleksii.kurochko@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>
Date: Tue, 24 Jan 2023 11:33:47 +0200
In-Reply-To: <Y8lABYJoQ5Qt4DAt@bullseye>
References: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
	 <Y8lABYJoQ5Qt4DAt@bullseye>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-01-19 at 13:05 +0000, Bobby Eshleman wrote:
> On Mon, Jan 23, 2023 at 06:56:19PM +0200, Oleksii wrote:
> > Hi Alistair and community,
> >=20
> > I am working on RISC-V support upstream for Xen based on your and
> > Bobby
> > patches.
> >=20
> > Adding the RISC-V support I realized that Xen is ran in S-mode.
> > Output
> > of OpenSBI:
> > =C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0 Domain0 Next Mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 : S-mode
> > =C2=A0=C2=A0=C2=A0 ...
> > So the first my question is shouldn't it be in H-mode?
> >=20
> > If I am right than it looks like we have to do a patch to OpenSBI
> > to
> > add support of H-mode as it is not supported now:
> > [1]
> > https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_d=
omain.c#L380
> > [2]
> > https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/r=
iscv_encoding.h#L110
> > Please correct me if I am wrong.
> >=20
> > The other option I see is to switch to H-mode in U-boot as I
> > understand
> > the classical boot flow is:
> > =C2=A0=C2=A0=C2=A0 OpenSBI -> U-boot -> Xen -> Domain{0,...}
> > If it is at all possible since U-boot will be in S mode after
> > OpenSBI.
> >=20
> > Thanks in advance.
> >=20
> > ~ Oleksii
> >=20
>=20
> Ah, what you are seeing there is that the openSBI's Next Mode
> excludes
> the virtualization mode (it treats HS and S synonymously) and it is
> only
> used for setting the mstatus MPP. The code also has next_virt for
> setting the MPV but I don't think that is exposed via the device tree
> yet. For Xen, you'd want next_mode =3D PRIV_S and next_virt =3D 0 (HS
> mode,
> not VS mode). The relevant setup prior to mret is here for interested
> readers:
> https://github.com/riscv-software-src/opensbi/blob/001106d19b21cd6443ae7f=
7f6d4d048d80e9ecac/lib/sbi/sbi_hart.c#L759
>=20
> As long as the next_mode and next_virt are set correctly, then Xen
> should be launching in HS mode. I do believe this should be default
> for
> the stock build too for Domain0, unless something has changed.
>=20
The same I've found in OpenSBI before but wasn't 100% sure that I'm
right. Now it is clear.

Thanks for your explanation.

> Thanks,
> Bobby

~ Oleksii

