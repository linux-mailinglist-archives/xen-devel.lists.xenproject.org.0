Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D117C75666F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564632.882206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPHX-00080O-Ga; Mon, 17 Jul 2023 14:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564632.882206; Mon, 17 Jul 2023 14:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPHX-0007yD-D2; Mon, 17 Jul 2023 14:32:59 +0000
Received: by outflank-mailman (input) for mailman id 564632;
 Mon, 17 Jul 2023 14:27:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00af=DD=kernel.org=robh@srs-se1.protection.inumbo.net>)
 id 1qLPCZ-0006T8-1Y
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:27:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a030052-24ae-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 16:27:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08BA96111D
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58404C433CC
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 14:27:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742eso47972615e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 07:27:46 -0700 (PDT)
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
X-Inumbo-ID: 1a030052-24ae-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689604066;
	bh=rkLKjJGA9W9V1hgJstWBCmZrxpmjuvUsbHV5ieMMp8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R78TGMx+tLPLYyhLeXOeLisKHqJ4pXJMz8qJAAvAVzmXbsDoXwXoXaZSpzjaITIWH
	 NEi/xoCmqGfa20qvVXPEMvKwl326d/1GD+r0wy0tbLsteWINDN3EkzI8BMNNhJkYnl
	 enqDgQEyOVjUNdl2swwcP4aEGFFhieuz0nePlhvul5MWRzVoiDya3+AVpEV0JyHGKW
	 ZUj5FB8Q9CzmgJaEfcPr31sXvswO2GyLPv9nXk1ad5GixA+xWMSxlJsXLWK1UpY+b6
	 RDHkvctYNbAqGaDlR/BYehPh+CMqP6Kti6ZBl/zxw6Hv77olsBadr7zTnetwdsCg7x
	 9vMPJYOcjNvcg==
X-Gm-Message-State: ABy/qLadAnM8BCbOFl99L+T1sYJ0foD54MRHCZouZu6dk49aa1MogbhX
	B2q7Szmf7p3jJXNjRKycXJpSnYirQbeYb0Z8cw==
X-Google-Smtp-Source: APBJJlFSY1EKmbumZhe1Fkfe0qsodiNyBdGN/d2gmlGF1ZwWgImoQ1RpodF7t1ooNJHJiRju6eg8DIGKKeloqUgo0eo=
X-Received: by 2002:a2e:8945:0:b0:2b9:48f1:b195 with SMTP id
 b5-20020a2e8945000000b002b948f1b195mr576527ljk.44.1689604043579; Mon, 17 Jul
 2023 07:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174545.4056287-1-robh@kernel.org> <114500369.nniJfEyVGO@phil>
In-Reply-To: <114500369.nniJfEyVGO@phil>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 08:27:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
Message-ID: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
To: Heiko Stuebner <heiko@sntech.de>
Cc: Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Inki Dae <inki.dae@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lucas Stach <l.stach@pengutronix.de>, 
	Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
	Qiang Yu <yuq825@gmail.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Sam Ravnborg <sam@ravnborg.org>, 
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>, Icenowy Zheng <icenowy@aosc.io>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Jianhua Lu <lujianhua000@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
	Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
	Emma Anholt <emma@anholt.net>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Sandy Huang <hjc@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, devicetree@vger.kernel.org, 
	Ondrej Jirman <megous@megous.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, lima@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 16, 2023 at 3:26=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Am Freitag, 14. Juli 2023, 19:45:34 CEST schrieb Rob Herring:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
>
> [...]
>
> > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/=
gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > index 917e79951aac..2744d8f4a6fa 100644
> > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > @@ -12,7 +12,9 @@
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
>
> I'm not sure if I'm just misreading something, but in all other places
> of_device.h gets removed while here is stays as an include. Is this
> correct this way?

Yes, because of_match_device() is used.

Rob

