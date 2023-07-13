Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D897527A3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 17:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563309.880475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyVA-000387-03; Thu, 13 Jul 2023 15:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563309.880475; Thu, 13 Jul 2023 15:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyV9-00035s-T2; Thu, 13 Jul 2023 15:45:07 +0000
Received: by outflank-mailman (input) for mailman id 563309;
 Thu, 13 Jul 2023 15:41:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MlyT=C7=pengutronix.de=ukl@srs-se1.protection.inumbo.net>)
 id 1qJyRt-00032A-Jk
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 15:41:45 +0000
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4d52c67-2193-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 17:41:44 +0200 (CEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJyQC-00033b-T0; Thu, 13 Jul 2023 17:40:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJyPp-00E9Ib-Gt; Thu, 13 Jul 2023 17:39:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJyPo-004aZX-PQ; Thu, 13 Jul 2023 17:39:36 +0200
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
X-Inumbo-ID: c4d52c67-2193-11ee-b239-6b7b168915f2
Date: Thu, 13 Jul 2023 17:39:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Paul <seanpaul@chromium.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
	dri-devel@lists.freedesktop.org,
	Vandita Kulkarni <vandita.kulkarni@intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arun R Murthy <arun.r.murthy@intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-samsung-soc@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Wenjing Liu <wenjing.liu@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
	Danilo Krummrich <dakr@redhat.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	spice-devel@lists.freedesktop.org,
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stylon Wang <stylon.wang@amd.com>, Tim Huang <Tim.Huang@amd.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Mika Kahola <mika.kahola@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Inki Dae <inki.dae@samsung.com>, Hersen Wu <hersenxs.wu@amd.com>,
	Dave Airlie <airlied@redhat.com>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>,
	Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>,
	freedreno@lists.freedesktop.org,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Zack Rusin <zackr@vmware.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
	Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
	=?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
	virtualization@lists.linux-foundation.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Fei Yang <fei.yang@intel.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	David Francis <David.Francis@amd.com>,
	Vinod Govindapillai <vinod.govindapillai@intel.com>,
	Aaron Liu <aaron.liu@amd.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-msm@vger.kernel.org,
	Animesh Manna <animesh.manna@intel.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Tian Tao <tiantao6@hisilicon.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Qingqing Zhuo <qingqing.zhuo@amd.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Swati Sharma <swati2.sharma@intel.com>,
	linux-renesas-soc@vger.kernel.org,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Anusha Srivatsa <anusha.srivatsa@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Karol Herbst <kherbst@redhat.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
	Luca Coelho <luciano.coelho@intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Likun Gao <Likun.Gao@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Emma Anholt <emma@anholt.net>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Deepak Rawat <drawat.floss@gmail.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Chia-I Wu <olvaffe@gmail.com>, Alan Liu <haoping.liu@amd.com>,
	Philip Yang <Philip.Yang@amd.com>, Lyude Paul <lyude@redhat.com>,
	intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	John Stultz <jstultz@google.com>, Roman Li <roman.li@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Khaled Almahallawy <khaled.almahallawy@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Sam Ravnborg <sam@ravnborg.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Imre Deak <imre.deak@intel.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Liu Shixin <liushixin2@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Lang Yu <Lang.Yu@amd.com>, xen-devel@lists.xenproject.org,
	Guchun Chen <guchun.chen@amd.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Russell King <linux@armlinux.org.uk>,
	Jani Nikula <jani.nikula@intel.com>,
	Uma Shankar <uma.shankar@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	David Lechner <david@lechnology.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
	linux-mediatek@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-tegra@vger.kernel.org, David Tadokoro <davidbtadokoro@usp.br>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	amd-gfx@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	linux-mips@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wayne Lin <Wayne.Lin@amd.com>,
	Drew Davenport <ddavenport@chromium.org>,
	Nirmoy Das <nirmoy.das@intel.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
Message-ID: <20230713153936.k2m6aj34vptj5vf7@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mnk65dkcvejfh2ja"
Content-Disposition: inline
In-Reply-To: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org


--mnk65dkcvejfh2ja
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 10:41:45AM -0400, Sean Paul wrote:
> On Thu, Jul 13, 2023 at 9:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > But even with the one-patch-per-rename approach I'd consider the
> > renaming a net win, because ease of understanding code has a big value.
> > It's value is not so easy measurable as "conflicts when backporting",
> > but it also matters in say two years from now, while backporting
> > shouldn't be an issue then any more.
>=20
> You've rightly identified the conjecture in your statement. I've been
> on both sides of the argument, having written/maintained drm code
> upstream and cherry-picked changes to a downstream kernel. Perhaps
> it's because drm's definition of dev is ingrained in my muscle memory,
> or maybe it's because I don't do a lot of upstream development these
> days, but I just have a hard time seeing the benefit here.

I see that my change doesn't immediately benefit those who are already
at home in drivers/gpu/drm. So it's quite understandable that someone in
a senior role (long time contributor or maintainer) doesn't see a big
upside.

In contrast I think my change (with its indisputable cost) lowers the
bar for new contributors to drm. IMHO that's something a maintainer has
to have on their radar, too, and that's easily undervalued in my
experience.

Of course in the end it's about weighting the ups and downs.=20

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mnk65dkcvejfh2ja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSwGrcACgkQj4D7WH0S
/k5Z8gf+L2DppHWGxGaiKRiYvHQTrpom5T4lLxWIcMzNp/SZXGce+FkxNCXXp4ev
Fm4EE5lHyGkTfeMAeH8KSvtkAT3Lf/Bifz3Ij2fmsLRLCJdOxIA9Zra8u3cWmLdd
JX+wb8zFJARzb/u+kG6ZD4IgJ+39LqIZ9JLUqaV4jyZZps2Vf8cvPDNYp96vAwdB
GUECE+pPcMQvSkBdwy5pCGdEatjq9O12xWwv6uvNcJqbIbToJVVsUHLBjTGEJfGI
PgyrtoM72NQY/p5d9veqBKCQTkKUBW5Ly+HbKzey9Dy/IPWeSU1Q/1WH/hUphbbs
k0+Jh4Ot72m5BF8rwKgRu0NikQcP4A==
=OtIn
-----END PGP SIGNATURE-----

--mnk65dkcvejfh2ja--

