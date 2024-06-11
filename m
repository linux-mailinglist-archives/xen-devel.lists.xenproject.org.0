Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6DA903FF7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738527.1145304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3QP-0006iF-4n; Tue, 11 Jun 2024 15:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738527.1145304; Tue, 11 Jun 2024 15:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3QP-0006gS-2C; Tue, 11 Jun 2024 15:28:41 +0000
Received: by outflank-mailman (input) for mailman id 738527;
 Tue, 11 Jun 2024 15:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=887E=NN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sH3QO-0006gM-0R
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:28:40 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4621360d-2807-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 17:28:38 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so21114251fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 08:28:38 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eaec6a6651sm17706691fa.132.2024.06.11.08.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 08:28:36 -0700 (PDT)
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
X-Inumbo-ID: 4621360d-2807-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718119717; x=1718724517; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ngue88i9QPsRcKYakT6OZq9AAIPqlAqsFErcL3YdYQM=;
        b=P7WcJktHiNZ8GiogegK4VHLC0H7mv4wHwPXesrFKcfrHD2oiM6aRBZCRqwU0u6v0m7
         kxX/SdpAmABAkIKaVBOgNm8Z2irwO93YB2zUWN604t+f8Am0wWhy083ORoLq9Rib8QAk
         1WHibkKQn1LtWQ5TVH/kQOxM/jWpXfStzpIWDW0okGDCurIsmpw2Y7D2vfrcLEZ89GZK
         RHeQ7Ih9ih3nEOCdkZnD/z2Mzu/OlyC3z/gyLb2XXYejZxFccZ5xrRPXWy1BUvKWprTC
         lmyvEnlg6xbSUYllOn833DWmHE1mhXkUCdvLj4SmcxIs1hxAvHQdC5IJZarDYMligDv4
         JI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119717; x=1718724517;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ngue88i9QPsRcKYakT6OZq9AAIPqlAqsFErcL3YdYQM=;
        b=n3In5GstvAiClGsi6XIDCcuURT4j0Mf9yCZpM9avMVXem/y7eOMtA1ZHND2bG9DE5H
         aCgnfIzrQrN6PsPaP62WcLNrE5H5qvWRNL5LCmWj8A8QY0ndtRy8uzAJEuIKeGC+OwAi
         px4vnagn2ynS+F/+13eqxQf4POgZsb9WSazcnCI4EPdmzILvUSgqDC+nhN2V1JO02EJz
         eoslta3ydt6wHy3+WU0yTVjA8wG7P7uWwqkeAecX90jjLVGxHM1BAhCbRvoZjLqmEtYB
         0w3V7HaEocVHIwh4PcrvWTcSfB6HvSbxXTUKA276s3a9A6cCjOfiJWB/OEzIguLHqyKo
         wBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGBRh4vxO84eJ7TYS8EoYbvtOAcHSfuCaCMCtD5OYMhn5G5LiFBI4VTlAdTxG89WPzxMYKgnFDX3x4LZfOzLx1/Py4dbkOfe/tv/1Mun0=
X-Gm-Message-State: AOJu0Yzcq0znK1pSAm9M/HkzDXuP8u7sEHCV0m9BcNbndkb/vua3A/JC
	AXwZ1ZtotQg/iSSF3MZQjL7QYyKGSNAmAFQhi1HpZQfDJGvXuc5W
X-Google-Smtp-Source: AGHT+IFcJ3MgpvZflx9o/fVa0PkCnU31hUFo6K0mraxVC5BXZl5tBCtdck4EFPeqZiIA9/Pqmct4tw==
X-Received: by 2002:a05:651c:4d1:b0:2e0:752c:1f2e with SMTP id 38308e7fff4ca-2eadce1bd83mr91384401fa.1.1718119717083;
        Tue, 11 Jun 2024 08:28:37 -0700 (PDT)
Message-ID: <64edc5419adf68a21c8792337bb4000820be002e.camel@gmail.com>
Subject: Re: [PATCH v4 0/7] Static shared memory followup v2 - pt2
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Tue, 11 Jun 2024 17:28:36 +0200
In-Reply-To: <3DDAAFF7-5E43-4B92-9D6B-6D8AFBA8496F@arm.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
	 <3DDAAFF7-5E43-4B92-9D6B-6D8AFBA8496F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-11 at 12:35 +0000, Luca Fancellu wrote:
> + Oleksii
>=20
> > On 24 May 2024, at 13:40, Luca Fancellu <Luca.Fancellu@arm.com>
> > wrote:
> >=20
> > This serie is a partial rework of this other serie:
> > https://patchwork.kernel.org/project/xen-devel/cover/20231206090623.193=
2275-1-Penny.Zheng@arm.com/
> >=20
> > The original serie is addressing an issue of the static shared
> > memory feature
> > that impacts the memory footprint of other component when the
> > feature is
> > enabled, another issue impacts the device tree generation for the
> > guests when
> > the feature is enabled and used and the last one is a missing
> > feature that is
> > the option to have a static shared memory region that is not from
> > the host
> > address space.
> >=20
> > This serie is handling some comment on the original serie and it is
> > splitting
> > the rework in two part, this first part is addressing the memory
> > footprint issue
> > and the device tree generation and currently is fully merged
> > (
> > https://patchwork.kernel.org/project/xen-devel/cover/20240418073652.362=
2828-1-luca.fancellu@arm.com
> > /),
> > this serie is addressing the static shared memory allocation from
> > the Xen heap.
> >=20
> > Luca Fancellu (5):
> > =C2=A0xen/arm: Lookup bootinfo shm bank during the mapping
> > =C2=A0xen/arm: Wrap shared memory mapping code in one function
> > =C2=A0xen/arm: Parse xen,shared-mem when host phys address is not
> > provided
> > =C2=A0xen/arm: Rework heap page allocation outside allocate_bank_memory
> > =C2=A0xen/arm: Implement the logic for static shared memory from Xen
> > heap
> >=20
> > Penny Zheng (2):
> > =C2=A0xen/p2m: put reference for level 2 superpage
> > =C2=A0xen/docs: Describe static shared memory when host address is not
> > =C2=A0=C2=A0 provided
> >=20
> > docs/misc/arm/device-tree/booting.txt=C2=A0=C2=A0 |=C2=A0 52 ++-
> > xen/arch/arm/arm32/mmu/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
> > xen/arch/arm/dom0less-build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 84 +++--
> > xen/arch/arm/include/asm/domain_build.h |=C2=A0=C2=A0 9 +-
> > xen/arch/arm/mmu/p2m.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 82 +++--
> > xen/arch/arm/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 =
+-
> > xen/arch/arm/static-shmem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 432 +++++++++++++++++----
> > ---
> > 8 files changed, 502 insertions(+), 186 deletions(-)
> >=20
> > --=20
> > 2.34.1
> >=20
> >=20
>=20
> Hi,
>=20
> We would like this serie to be in Xen 4.19, there was a
> misunderstanding on our side because we thought
> that since the serie was sent before the last posting date, it could
> have been a candidate for merging in the
> new release, instead after speaking with Julien and Oleksii we are
> now aware that we need to provide a
> justification for its presence.
>=20
> Pros to this serie is that we are closing the circle for static
> shared memory, allowing it to use memory from
> the host or from Xen, it is also a feature that is not enabled by
> default, so it should not cause too much
> disruption in case of any bugs that escaped the review, however we=E2=80=
=99ve
> tested many configurations for that
> with/without enabling the feature if that can be an additional value.
>=20
> Cons: we are touching some common code related to p2m, but also there
> the impact should be minimal because
> the new code is subject to l2 foreign mapping (to be confirmed maybe
> from a p2m expert like Julien).
>=20
> The comments on patch 3 of this serie are addressed by this patch:
> https://patchwork.kernel.org/project/xen-devel/patch/20240528125603.24676=
40-1-luca.fancellu@arm.com/
> And the serie is fully reviewed.
>=20
> So our request is to allow this serie in 4.19, Oleksii, ARM
> maintainers, do you agree on that?
Considering that it is not enabled by default and affect on common code
is minimal we should consider this patch series in 4.19:
 Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii



