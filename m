Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7453C75C458
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 12:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567456.886529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMnAi-0004O7-K2; Fri, 21 Jul 2023 10:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567456.886529; Fri, 21 Jul 2023 10:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMnAi-0004MG-Gq; Fri, 21 Jul 2023 10:15:40 +0000
Received: by outflank-mailman (input) for mailman id 567456;
 Fri, 21 Jul 2023 10:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ists=DH=gmail.com=thierry.reding@srs-se1.protection.inumbo.net>)
 id 1qMnAg-0004M5-LX
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 10:15:38 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88eaab0b-27af-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 12:15:36 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so278284866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jul 2023 03:15:36 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090608d300b0098d2f703408sm1960285eje.118.2023.07.21.03.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 03:15:34 -0700 (PDT)
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
X-Inumbo-ID: 88eaab0b-27af-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689934536; x=1690539336;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xtjou4bw3TzoaU4pkxO6dL/R//dx1dOT1P8B0FqrHKA=;
        b=Tfm+30DQEJ60lYnGshB1LHllAG8vV6tZJlWJu8MaEzgnMoMC4s8xR3p8apQLvVNXrU
         SsCdfj06a4f9s62gn1+m13FZeT8JIaTbP/QLsdb58Wl+Bx3Sk7VWJYPoYNaVX5mC3+q0
         Rs2KjsZnmNUozrNcZGl15QnXalxAHlU6ZCHrH5lsGabvw9HEXfz1EAYPQdbs9ZtUgGmu
         ODgtKVUF0wY54I/IMZWbmr8tof5c0D/hfoTkIzmRnUg+uw27Hm23MiuKX3PpzfRWwdpX
         JSpcBybDwjUfvHgOaPY78806miQgOTtCRT1cm5IQNhbaumSj/5htxDsdm3D+hUCmwISK
         gyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689934536; x=1690539336;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xtjou4bw3TzoaU4pkxO6dL/R//dx1dOT1P8B0FqrHKA=;
        b=j1ijaEPpV6udvTS8anVGzQhWq6fL+60D8nWfNuDepFCZBzK53qNFLIp/rKNAU/VBLV
         7ICuh0liUTQ8IZevOf8Qe0RNVPwc3W9AuuQLY64zoS6dWL4SM1fObBPG4u9q+dP00Id+
         nyyF+pw+lBA2cI0N5pg7GdF8EgiELacwwbeR+pFvos9UidqRhgzJtfmbhIhp/l5mYgML
         07GslQ/VfyGyAdr5zpN3My2kRdUZ/u6Agwj6pPaue8F9LyGJpguHyrJQz7FGHTWmy/me
         mLZAclLRGlYUUWxKzm4GAsXpVLRQiHIXGrKUzT2eGSql3XDx8UrEsNStodGUwhMBhEb2
         yH1Q==
X-Gm-Message-State: ABy/qLZvmbRR/GaH0JccO3UTcVzd1DwNtYjAmkY7eim0TeV9gHoVuu5B
	ue+Y0VfwgZnq/2P7XoOXlQ8=
X-Google-Smtp-Source: APBJJlFMSTNXVoDP1pttaZXsGetq1EYUvcvS8mVgRKzhexw1wKgMd76fhF1INGqDgTxi6Ne6bb3VQA==
X-Received: by 2002:a17:906:7691:b0:991:c566:979 with SMTP id o17-20020a170906769100b00991c5660979mr1229678ejm.36.1689934535180;
        Fri, 21 Jul 2023 03:15:35 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:15:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, etnaviv@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
	lima@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
Message-ID: <ZLpaYPUI5gPd4jK_@orome>
References: <20230714174545.4056287-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qaVvuRtXrCn2kCOF"
Content-Disposition: inline
In-Reply-To: <20230714174545.4056287-1-robh@kernel.org>
User-Agent: Mutt/2.2.10 (2023-03-25)


--qaVvuRtXrCn2kCOF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:45:34AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

[Trimming the recipient list so that Google will let me send this]

Test builds were fine, so I've pushed this to drm-misc now.

Thierry

--qaVvuRtXrCn2kCOF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS6WsQACgkQ3SOs138+
s6HK1A//QgDGQj/2Xez0LhGk60CphNT160FLxq+/4O2qQdzBoldz2WfYizMz+Qyv
OCph/RC4Vp2VJEySeVU8jjojJZtqnu3iVQ9LGC/L7EFFJQOwaNlGusy3FoWAp5i1
tAMhZUBH/QCvLjoc7kQXt+MjZGx/ccGHcmckwnjP1DVERdSUqXtq8VU1FHDxiQ2Q
WfE9WhlNsXzJzcGXKC9qEKcn/OdrvPHgmAMJ7ypyjQ9z1x1/oEsJH6Bj0oIaiF2+
R1Lt+KO5tvnL4ozutwZoHX4rPL9qQ9NvBwvk3DdxxaDs4R5Hhin5rkKhs6SvVbBX
8bOTy7u1WaKQWaGEhGnnQzpaK3bp1n9L9Ooc/VtUaBx1iRZ8EsJmVfdNC8527L14
0pH0DNOHHZDuTKd14C/W8JKsSrMtqPml41UClQC8AQ69iSfq95AbcajnFXcpamF6
nYbTpBL+EOukFj5EJppNc0Bg3R0HdXvz9DmBx0qMt9cFAbq05D+4ke/aTKCDv0nM
eQij9GV8h4g7wsmXWfFYqnbVk2K8G8KqsjEZakqkbUYE0i4tUs+O8g1piw1aXQis
gX6QIVmBbi4PjPh2TWik5FCLogKMIqVDCuUfG/LJIQzypr/7QnSP6XpvyqjWiWua
t1LWo/rbraFTe/hnaRqOUgOfKnfXRN3fZFxHW5CHGIwET0BUK9s=
=UVD4
-----END PGP SIGNATURE-----

--qaVvuRtXrCn2kCOF--

