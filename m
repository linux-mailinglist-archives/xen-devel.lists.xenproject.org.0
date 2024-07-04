Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159CD92742E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 12:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753675.1161861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJqg-0004YL-1K; Thu, 04 Jul 2024 10:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753675.1161861; Thu, 04 Jul 2024 10:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPJqf-0004WV-Tu; Thu, 04 Jul 2024 10:37:57 +0000
Received: by outflank-mailman (input) for mailman id 753675;
 Thu, 04 Jul 2024 10:37:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EPo+=OE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sPJqd-0004U6-Mq
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 10:37:55 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7815ddb5-39f1-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 12:37:53 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so690411a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 03:37:53 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c2af0352sm7771066b.198.2024.07.04.03.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 03:37:52 -0700 (PDT)
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
X-Inumbo-ID: 7815ddb5-39f1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720089473; x=1720694273; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K0lvMKBkSqvA2f2PHATgT7oRI14ofErtTMmxoggzJyc=;
        b=IITyVtEFA/oWvT9sWmOjf5b99cHyPS+abAvEDb4CnV/QZWmBXULjYuT20dG+SVjL5E
         guNM9a3n/TpvO0U5OG/3DqShuaZyn+jC03x+w++g9+gG8gfp8KgU9d6Xl4Rpa0IvwTVX
         VdPPcnkYubCUeR48kexgT62kq5YwFQrSzaX+fpaiZisk3mzjNJP4dBePbVT3wttmR5zS
         fLFIOq5mKK1XfZqznyF0OpVqgPZ/adrgXFHNWtAEYnHR40T/GMsUcBTSqSZndVtHZdg/
         RWu2rWo1Nrrb5mRI35VmsbbrToaBoF+MknORu9viuAb13gIyJwnlvW6rLVrWQqV/aeAR
         ErGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720089473; x=1720694273;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0lvMKBkSqvA2f2PHATgT7oRI14ofErtTMmxoggzJyc=;
        b=A6P6dT8LvOTYjvximdM3SfoKicvyhSNCEOCwZu2uuOhEqm4jP1gGwT5zXyqLyegCaI
         sQRlDnHHuVo4ZIvCdi1D7g7HGjrhTP4WQIqH7tw/C9x8HsnDE31J46fMIA5Cw1rYKb6y
         XTEK+TFBoQV6bwUKLeIaSE3bQsCx2QJCgbOz2JLGGvfXZ914oCXN+vASICPbubML7gQf
         8SadM5HYRkvHF3bhc0WODeO53yohff0wslbp9wEZYLX8tK8nccyCEmeIgHZGoiqh3Uhc
         PyE70XniGm337v/FhdEKDOVFLfUl49BcV0IDZ9ky8fWoNCJ3EPvhjJO10ZopJbMGHE9W
         oVRA==
X-Forwarded-Encrypted: i=1; AJvYcCUzVbnb1GukSKqG1jAlHUKSaCTU91D6xinIe6+C8pYYF5td/l1lOrlN94CywDaUxcg1KQgx2oX230Tz124NXiX1Z0yAq0cFV2I071BOBiE=
X-Gm-Message-State: AOJu0YxXcQ4UkcZ2SVgsZl+K2mryiQUr9Zx6uSDRL1L+Zbooyg1UGeHO
	sZh9rg6oWvo3xbtxRlLzQHV7It81rNAwvt83cVAGPi3QgiS5nLUw
X-Google-Smtp-Source: AGHT+IES1uSxCFKhC4pMNW1t3h+zu+wT4sbQanMhgaGUiN2tAGzhh6QmI2coPSejRxN5XzwDtfoXbA==
X-Received: by 2002:a17:906:2c1a:b0:a72:64ca:4668 with SMTP id a640c23a62f3a-a77ba460c0fmr85690666b.13.1720089472964;
        Thu, 04 Jul 2024 03:37:52 -0700 (PDT)
Message-ID: <2a6a3697a9896107a8f317686fb2e2572d0ba332.camel@gmail.com>
Subject: Re: [PATCH for-4.19 0/4] CI: Fixes, part 1
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	 <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Date: Thu, 04 Jul 2024 12:37:52 +0200
In-Reply-To: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-03 at 15:19 +0100, Andrew Cooper wrote:
> Minimum fixes to rebuild the containers, following the HEREDOC
> problems.
>=20
> Unrelated to the HEREDOC problems, Archlinux and CentOS 7 need
> aditional
> chagnes to rebuild.
>=20
> There will be subsequent work to make some improvements to CI for
> 4.19, so in
> particular we're testing with up-to-date LTS distros.
If we really want to test with up-to-date LTS distros in 4.19 then it
probably make sense to postpone release date to July 29 to be sure that
everything is okay. July 29 is still fit in our 2 times release cycle
per year.

~ Oleksii=20
>=20
> Andrew Cooper (4):
> =C2=A0 CI: Formalise the use of heredocs
> =C2=A0 CI: Adjust the usage of inline files
> =C2=A0 CI: Drop bin86/dev86 from archlinux container
> =C2=A0 CI: Rework the CentOS7 container
>=20
> =C2=A0automation/build/README.md=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 10 ++-
> =C2=A0.../build/alpine/3.18-arm64v8.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0automation/build/alpine/3.18.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../archlinux/current-riscv64.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0automation/build/archlinux/current.dockerfile |=C2=A0 3 +-
> =C2=A0automation/build/centos/7.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 71 ++++++++++-------
> --
> =C2=A0.../bookworm-arm64v8-arm32-gcc.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0.../build/debian/bookworm-arm64v8.dockerfile=C2=A0 |=C2=A0 1 +
> =C2=A0.../build/debian/bookworm-cppcheck.dockerfile |=C2=A0 1 +
> =C2=A0.../build/debian/bookworm-i386.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0automation/build/debian/bookworm.dockerfile=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../build/debian/bullseye-ppc64le.dockerfile=C2=A0 |=C2=A0 1 +
> =C2=A0.../build/debian/buster-gcc-ibt.dockerfile=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0.../build/debian/jessie-i386.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0automation/build/debian/jessie.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 +-
> =C2=A0.../build/debian/stretch-i386.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +-
> =C2=A0automation/build/debian/stretch.dockerfile=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +-
> =C2=A0automation/build/fedora/29.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../build/suse/opensuse-leap.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../build/suse/opensuse-tumbleweed.dockerfile |=C2=A0 1 +
> =C2=A0automation/build/ubuntu/bionic.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0automation/build/ubuntu/focal.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A0automation/build/ubuntu/trusty.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0.../build/ubuntu/xenial-xilinx.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0automation/build/ubuntu/xenial.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0automation/build/yocto/yocto.dockerfile.in=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +
> =C2=A0.../alpine/3.18-arm64v8.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../tests-artifacts/alpine/3.18.dockerfile=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0.../kernel/5.19-arm64v8.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../tests-artifacts/kernel/6.1.19.dockerfile=C2=A0 |=C2=A0 1 +
> =C2=A0.../6.0.0-arm64v8.dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../qemu-system-ppc64/8.1.0-ppc64.dockerfile=C2=A0 |=C2=A0 1 +
> =C2=A032 files changed, 82 insertions(+), 40 deletions(-)
>=20
>=20
> base-commit: fb76e08a8f7a61dfbc07d0f335f1623bca650d7f


