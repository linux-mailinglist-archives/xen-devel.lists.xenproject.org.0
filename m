Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D675684D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564710.882355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQUP-0007r5-2i; Mon, 17 Jul 2023 15:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564710.882355; Mon, 17 Jul 2023 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQUO-0007om-VC; Mon, 17 Jul 2023 15:50:20 +0000
Received: by outflank-mailman (input) for mailman id 564710;
 Mon, 17 Jul 2023 15:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=damT=DD=kernel.org=rfoss@srs-se1.protection.inumbo.net>)
 id 1qLQKX-0006DV-Qt
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:40:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 349f065a-24b8-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 17:40:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9F46561166
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 15:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931A3C611A5
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 15:40:05 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1b0419f758eso3617961fac.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 08:40:05 -0700 (PDT)
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
X-Inumbo-ID: 349f065a-24b8-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689608405;
	bh=tF/K12dcb1AtR13XQY0pq3bgmoCAiVfZHpGq03H1+sk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mX8RhJfEol8SKSIZYImvm3vgYGg2QOjrhEImVy70eQw9yFGHJhacPYnLrSEjLcXVH
	 lsK1foH9DnVkOrz0XgrZvShJMkw35zdZXkm28OGXKxZAPZQPWjnMqmD7u1K/6wWyrF
	 KESSOxDGgUcHfAUMGWeNgAp8rP61IeLKmYc7IOGocR2yzizGnLQn+2LOPOUV3VN8RI
	 nXJsuiRAgYTOZFEMemZolvUrK9EbLD+pNe2um6lCwrS0nGmoypnFT87DTWspO0tENT
	 6g2YWD6p/fpzoiD+byVvvn8YboH7BuhPrNAUEc3aLc7yE8lROrZtFeZkeMUjss/bxz
	 8gUvf0rnNUAvw==
X-Gm-Message-State: ABy/qLZ9qen2BEU7hLd72owiWq3gmNWB6jyLBZRZeZ9omdok8mAZGJ5a
	saIwsmqvgYVCTx2f589sMWSDVWISZU92vRZySqh0bg==
X-Google-Smtp-Source: APBJJlHs9bNlVGErzzDkG3ITNYPrBi9bcbK5hB2pZ5ku9OA6MncccRQ7QQDddVXbZVn5Z/tCXP76UHYBqks/PFSJBmQ=
X-Received: by 2002:a17:90b:1095:b0:263:3567:f99 with SMTP id
 gj21-20020a17090b109500b0026335670f99mr13011407pjb.15.1689608384033; Mon, 17
 Jul 2023 08:39:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174545.4056287-1-robh@kernel.org> <114500369.nniJfEyVGO@phil>
 <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
In-Reply-To: <CAL_JsqJMo4LHRmsfRQAr-j6oNESbS=q+eFU+B7e720emjf+8nA@mail.gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 17 Jul 2023 17:39:32 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
Message-ID: <CAN6tsi5wOhptw4PgP2etkC5KYh_5cfOXZuVhsN6YCMiqn15hog@mail.gmail.com>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
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

On Mon, Jul 17, 2023 at 4:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Jul 16, 2023 at 3:26=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> =
wrote:
> >
> > Am Freitag, 14. Juli 2023, 19:45:34 CEST schrieb Rob Herring:
> > > The DT of_device.h and of_platform.h date back to the separate
> > > of_platform_bus_type before it as merged into the regular platform bu=
s.
> > > As part of that merge prepping Arm DT support 13 years ago, they
> > > "temporarily" include each other. They also include platform_device.h
> > > and of.h. As a result, there's a pretty much random mix of those incl=
ude
> > > files used throughout the tree. In order to detangle these headers an=
d
> > > replace the implicit includes with struct declarations, users need to
> > > explicitly include the correct includes.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> >
> > [...]
> >
> > > diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/driver=
s/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > index 917e79951aac..2744d8f4a6fa 100644
> > > --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> > > @@ -12,7 +12,9 @@
> > >  #include <linux/mfd/syscon.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > > +#include <linux/of_platform.h>
> > >  #include <linux/phy/phy.h>
> > > +#include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> >
> > I'm not sure if I'm just misreading something, but in all other places
> > of_device.h gets removed while here is stays as an include. Is this
> > correct this way?
>
> Yes, because of_match_device() is used.
>
> Rob
>

For drivers/gpu/drm/bridge/

Acked-by: Robert Foss <rfoss@kernel.org>

