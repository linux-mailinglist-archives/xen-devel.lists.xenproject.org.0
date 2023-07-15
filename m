Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285BA754D4D
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jul 2023 06:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563991.881366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKtH0-0001fS-74; Sun, 16 Jul 2023 04:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563991.881366; Sun, 16 Jul 2023 04:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKtH0-0001dq-11; Sun, 16 Jul 2023 04:22:18 +0000
Received: by outflank-mailman (input) for mailman id 563991;
 Sat, 15 Jul 2023 20:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4YgR=DB=ravnborg.org=sam@srs-se1.protection.inumbo.net>)
 id 1qKljZ-000681-5c
 for xen-devel@lists.xenproject.org; Sat, 15 Jul 2023 20:19:19 +0000
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [2a02:2350:5:400::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd907688-234c-11ee-8611-37d641c3527e;
 Sat, 15 Jul 2023 22:19:14 +0200 (CEST)
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id da40b60a-234c-11ee-b5d0-99461c6a3fe8;
 Sat, 15 Jul 2023 20:19:11 +0000 (UTC)
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
X-Inumbo-ID: dd907688-234c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=JxBhhYK0Y5VT2HXGIOu9TJojogxR36dmFxRFhj6IWCk=;
	b=EVElt5TCflzYgiRrmN27f0ZK5MwnAlXBDddOCHg6/OVohDn42qAtgNTo5OfcLdzxWG2SRBFfTehox
	 xNOBoSfNDJzs3G7hNViFJKi/eWgcZSc8XjfH227Fu8qgxnV8T/L9k2kbIA0TZQokuWJ+ry5L7uGt3S
	 eDRotSkr5oRNdgzxdg7YaiwxS1dKxGLKWYbj3gEJyCEtA+CikK6SwC793O4AA7oPFy3WliBjXaujiN
	 jIW5IRtD7dVIQTKWn5fuE38KmwgPMYpkppyDRBcw0Lj664vpEaR8bSW8fFgvBrj4JprqbJ9guXY0Cs
	 zK0jiHS5+p6sj2f0nA1gLqEzVUOMj3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=JxBhhYK0Y5VT2HXGIOu9TJojogxR36dmFxRFhj6IWCk=;
	b=Z/37LrNNgkFmoRmOnuPWeSyBJ3zkNDMuzDj4yl37D//Yx8vlrZ1t4ZtvhEx9F98EMcvKO2OmDB7Cz
	 mpB1B+iCw==
X-HalOne-ID: da40b60a-234c-11ee-b5d0-99461c6a3fe8
Date: Sat, 15 Jul 2023 22:19:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Inki Dae <inki.dae@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Paul Cercueil <paul@crapouillou.net>, Qiang Yu <yuq825@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
	Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megi@xff.cz>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Emma Anholt <emma@anholt.net>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm: Explicitly include correct DT includes
Message-ID: <20230715201908.GA321950@ravnborg.org>
References: <20230714174545.4056287-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714174545.4056287-1-robh@kernel.org>

Hi Rob,

On Fri, Jul 14, 2023 at 11:45:34AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

