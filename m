Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7F756209
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 13:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564446.881890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMkB-0007Jo-U6; Mon, 17 Jul 2023 11:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564446.881890; Mon, 17 Jul 2023 11:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLMkB-0007Hf-Qq; Mon, 17 Jul 2023 11:50:23 +0000
Received: by outflank-mailman (input) for mailman id 564446;
 Mon, 17 Jul 2023 11:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MJZ=DD=ideasonboard.com=kieran.bingham@srs-se1.protection.inumbo.net>)
 id 1qLMWN-0004NL-Ke
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 11:36:07 +0000
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d0d9a98-2496-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 13:36:05 +0200 (CEST)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC0DD16C4;
 Mon, 17 Jul 2023 13:35:09 +0200 (CEST)
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
X-Inumbo-ID: 1d0d9a98-2496-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1689593710;
	bh=Q3mYfdnpaLKlY8/jxmRm80QstU9e0PZzEci91ZZE1j4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=D34b2nk3MBeIsD4Hh9go1cz7KYgQfaVb0QwyTeWrvQudhj3fcvsR86k18n5c2Eh/a
	 11cp7FnDEwboNqdfvQSni7J+NuSf4nawSesO0QfLQ1Tb/Qq/1vhrC/00e2IYaQomU7
	 muczhfhcRx636pqbzTWg6NH753X76UJuCpEmbpUo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230714174545.4056287-1-robh@kernel.org>
References: <20230714174545.4056287-1-robh@kernel.org>
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Ondrej Jirman <megous@megous.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org, lima@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Alain Volmat <alain.volmat@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Andrzej Hajda <andrzej.hajda@intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Artur Weber <aweber.kernel@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wens@csie.org>, Christian Gmeiner <christian.gmeiner@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Emma Anholt <emma@anholt.net>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Guido =?utf-8?q?G=C3=BCnther?= <agx@sigxcpu.org>, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>, Icenow
 y Zheng <icenowy@aosc.io>, Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Javier Martinez Canillas <javierm@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, Jianhua Lu <lujianhua000@gmail.com>, John Stultz <jstultz@google.com>, Jonas Karlman <jonas@kwiboo.se>, Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Liu Ying <victor.liu@nxp.com>, Liviu Dudau <liviu.dudau@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, Marijn Suijten <marijn.suijten@
 somainline.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Ondrej Jirman <megi@xff.cz>, Orson Zhai <orsonzhai@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Philippe Cornu <philippe.cornu@foss.st.com>, Purism Kernel Team <kernel@puri.sm>, Qiang Yu <yuq825@gmail.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org
 >, Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Tomi Valkeinen <tomba@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Yongqin Liu <yongqin.liu@linaro.org>
Date: Mon, 17 Jul 2023 12:35:59 +0100
Message-ID: <168959375926.3515353.7529038208688306372@Monstersaurus>
User-Agent: alot/0.10

Quoting Rob Herring (2023-07-14 18:45:34)
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

>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c         | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c         | 2 ++
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c         | 1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c       | 1 -
>  drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c      | 1 -

For drivers/gpu/drm/renesas/rcar-du/

> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_drv.c
> index 1ffde19cb87f..3904b0cca814 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -12,7 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_kms.c
> index adfb36b0e815..9ff4537c26c8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -20,8 +20,10 @@
> =20
>  #include <linux/device.h>
>  #include <linux/dma-buf.h>
> +#include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/wait.h>
> =20
>  #include "rcar_du_crtc.h"
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/=
drm/renesas/rcar-du/rcar_du_vsp.c
> index 45c05d0ffc70..9cbb5e6e2cba 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -22,6 +22,7 @@
>  #include <linux/bitops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gp=
u/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index e10e4d4b89a2..db2e6f16f954 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -12,7 +12,6 @@
>  #include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> index aa95b85a2964..8048bdca2d6c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> @@ -10,7 +10,6 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

