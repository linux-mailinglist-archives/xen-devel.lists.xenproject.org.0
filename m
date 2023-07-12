Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F37750B7B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 16:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562581.879339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbGP-00042i-6V; Wed, 12 Jul 2023 14:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562581.879339; Wed, 12 Jul 2023 14:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJbGP-0003zz-2s; Wed, 12 Jul 2023 14:56:21 +0000
Received: by outflank-mailman (input) for mailman id 562581;
 Wed, 12 Jul 2023 14:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vScV=C6=intel.com=jani.nikula@srs-se1.protection.inumbo.net>)
 id 1qJawK-00016Z-Dg
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 14:35:36 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a2d191a-20c1-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 16:35:32 +0200 (CEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 07:35:29 -0700
Received: from pmessina-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.186])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 07:34:31 -0700
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
X-Inumbo-ID: 5a2d191a-20c1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689172533; x=1720708533;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=7EqKUdX8amzDodN7nIatZqqu7r5MTljrQuoCdn53hEQ=;
  b=a9UqAWc65MIY0tDFR7woBKTQ7PdJvKloaE11JNi6ZEGFF5k501iM06Jr
   OIdPWpNKzlHwS/I2RR2+6Bd/Ia8wQVmWo72oS4O8Bdl3iOPjUHmnQogw+
   wVdbTrsXujqJSk96HOk8a4jI8oYEGmE52vpglbv93YibVDdcWO2512vA2
   87MnV82lrcJ0h0qxmKT06OvkfjQ8SfSFZ6IwfhWdhDsyACDhtjl9S9ynF
   G0nhj4DiWY70mZcfWvZ/yCxF1Oep7Mf9moWDXEYlLJTisyqovkyNxfr/9
   6d3ET/5hSkyY520f9Y4Yg5UPOZdk++rH58NkCtJJ3Z5h2y5g2RXke0GB7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="428641969"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="428641969"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="845686939"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="845686939"
From: Jani Nikula <jani.nikula@intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry
 Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Guchun Chen <guchun.chen@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Evan Quan <evan.quan@amd.com>, Likun Gao <Likun.Gao@amd.com>,
	Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
	David Francis <David.Francis@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Graham Sider <Graham.Sider@amd.com>, Lang Yu <Lang.Yu@amd.com>,
	Philip Yang <Philip.Yang@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>, Tim Huang <Tim.Huang@amd.com>,
	Zack Rusin <zackr@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
	xurui <xurui@kylinos.cn>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
	=?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
	Qingqing Zhuo <qingqing.zhuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen
 Wu <hersenxs.wu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
	Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
	Wayne Lin <Wayne.Lin@amd.com>, Aaron Liu <aaron.liu@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David
 Tadokoro <davidbtadokoro@usp.br>, Wenjing Liu <wenjing.liu@amd.com>,
 Jiapeng
 Chong <jiapeng.chong@linux.alibaba.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
	Roman Li <roman.li@amd.com>,
	=?utf-8?Q?Joaqu=C3=ADn?= Ignacio =?utf-8?Q?Aramend=C3=ADa?=
 <samsagax@gmail.com>,
	Dave Airlie <airlied@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Liviu Dudau <liviu.dudau@arm.com>, Joel Stanley <joel@jms.id.au>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Deepak Rawat <drawat.floss@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>, Matt
 Roper <matthew.d.roper@intel.com>,
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
	Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
	Hans de Goede <hdegoede@redhat.com>, Luca
 Coelho <luciano.coelho@intel.com>,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Vinod Govindapillai <vinod.govindapillai@intel.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
	Anusha Srivatsa <anusha.srivatsa@intel.com>, Chaitanya
 Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Uma Shankar <uma.shankar@intel.com>, Imre Deak <imre.deak@intel.com>,
	Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
	Swati Sharma <swati2.sharma@intel.com>,
	Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
	Mika Kahola <mika.kahola@intel.com>,
	=?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
	Arun R Murthy <arun.r.murthy@intel.com>,
	Gustavo Sousa <gustavo.sousa@intel.com>, Khaled
 Almahallawy <khaled.almahallawy@intel.com>,
	Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>, Fei Yang <fei.yang@intel.com>, Animesh
 Manna <animesh.manna@intel.com>, Deepak R Varma <drv@mailo.com>, "Jiri
 Slaby
 (SUSE)" <jirislaby@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vandita Kulkarni <vandita.kulkarni@intel.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Manasi Navare <manasi.d.navare@intel.com>,
	Drew Davenport <ddavenport@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marian Cichy <m.cichy@pengutronix.de>, Dan
 Carpenter <error27@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Anitha
 Chrisanthus <anitha.chrisanthus@intel.com>,
	Edmund Dea <edmund.j.dea@intel.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Liu Shixin <liushixin2@huawei.com>,
 Marek
 Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>, Mikko
 Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Jyri Sarha <jyri.sarha@iki.fi>, David Lechner <david@lechnology.com>,
 Kamlesh
 Gurudasani <kamlesh.gurudasani@gmail.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
	amd-gfx@lists.freedesktop.org, Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Alim
 Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, Xinwei
 Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>, linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, Lucas
 Stach <l.stach@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
Date: Wed, 12 Jul 2023 17:34:28 +0300
Message-ID: <87fs5tgpvv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=
 wrote:
> Hello,
>
> while I debugged an issue in the imx-lcdc driver I was constantly
> irritated about struct drm_device pointer variables being named "dev"
> because with that name I usually expect a struct device pointer.
>
> I think there is a big benefit when these are all renamed to "drm_dev".
> I have no strong preference here though, so "drmdev" or "drm" are fine
> for me, too. Let the bikesheding begin!
>
> Some statistics:
>
> $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | uniq=
 -c | sort -n
>       1 struct drm_device *adev_to_drm
>       1 struct drm_device *drm_
>       1 struct drm_device          *drm_dev
>       1 struct drm_device        *drm_dev
>       1 struct drm_device *pdev
>       1 struct drm_device *rdev
>       1 struct drm_device *vdev
>       2 struct drm_device *dcss_drv_dev_to_drm
>       2 struct drm_device **ddev
>       2 struct drm_device *drm_dev_alloc
>       2 struct drm_device *mock
>       2 struct drm_device *p_ddev
>       5 struct drm_device *device
>       9 struct drm_device * dev
>      25 struct drm_device *d
>      95 struct drm_device *
>     216 struct drm_device *ddev
>     234 struct drm_device *drm_dev
>     611 struct drm_device *drm
>    4190 struct drm_device *dev
>
> This series starts with renaming struct drm_crtc::dev to drm_dev. If
> it's not only me and others like the result of this effort it should be
> followed up by adapting the other structs and the individual usages in
> the different drivers.

I think this is an unnecessary change. In drm, a dev is usually a drm
device, i.e. struct drm_device *. As shown by the numbers above.

If folks insist on following through with this anyway, I'm firmly in the
camp the name should be "drm" and nothing else.


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center

