Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EED75231D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563150.880205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw95-0006IJ-F1; Thu, 13 Jul 2023 13:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563150.880205; Thu, 13 Jul 2023 13:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJw95-0006GJ-CD; Thu, 13 Jul 2023 13:14:11 +0000
Received: by outflank-mailman (input) for mailman id 563150;
 Thu, 13 Jul 2023 13:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MlyT=C7=pengutronix.de=ukl@srs-se1.protection.inumbo.net>)
 id 1qJw14-00048d-Sv
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:05:54 +0000
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [2001:67c:670:201:290:27ff:fe1d:cc33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fed1a7e7-217d-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 15:05:52 +0200 (CEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJvzH-0005FV-62; Thu, 13 Jul 2023 15:04:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJvyt-00E7bY-FX; Thu, 13 Jul 2023 15:03:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJvys-004Ym0-J0; Thu, 13 Jul 2023 15:03:38 +0200
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
X-Inumbo-ID: fed1a7e7-217d-11ee-8611-37d641c3527e
Date: Thu, 13 Jul 2023 15:03:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Paul <seanpaul@chromium.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
	dri-devel@lists.freedesktop.org,
	Vandita Kulkarni <vandita.kulkarni@intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arun R Murthy <arun.r.murthy@intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liu Shixin <liushixin2@huawei.com>,
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
	linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
	Tim Huang <Tim.Huang@amd.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Yifan Zhang <yifan1.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Inki Dae <inki.dae@samsung.com>, Hersen Wu <hersenxs.wu@amd.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
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
	Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
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
	David Lechner <david@lechnology.com>,
	Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	David Francis <David.Francis@amd.com>,
	Aaron Liu <aaron.liu@amd.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Jouni =?utf-8?B?SMO2Z2FuZGVy?= <jouni.hogander@intel.com>,
	Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-msm@vger.kernel.org,
	Animesh Manna <animesh.manna@intel.com>,
	linux-renesas-soc@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Qingqing Zhuo <qingqing.zhuo@amd.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Swati Sharma <swati2.sharma@intel.com>,
	John Stultz <jstultz@google.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Drew Davenport <ddavenport@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Anusha Srivatsa <anusha.srivatsa@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Karol Herbst <kherbst@redhat.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
	Luca Coelho <luciano.coelho@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Joel Stanley <joel@jms.id.au>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Alan Liu <haoping.liu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
	Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
	Alison Wang <alison.wang@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Khaled Almahallawy <khaled.almahallawy@intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Emma Anholt <emma@anholt.net>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Imre Deak <imre.deak@intel.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Roman Li <roman.li@amd.com>, Paul Cercueil <paul@crapouillou.net>,
	Rob Clark <robdclark@gmail.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Russell King <linux@armlinux.org.uk>,
	Uma Shankar <uma.shankar@intel.com>,
	Mika Kahola <mika.kahola@intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Vinod Govindapillai <vinod.govindapillai@intel.com>,
	linux-tegra@vger.kernel.org,
	Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?utf-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
	linux-mediatek@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	David Tadokoro <davidbtadokoro@usp.br>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Orson Zhai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
Message-ID: <20230713130337.fd2l67r23g2irifx@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5p2oc3dth3vpey32"
Content-Disposition: inline
In-Reply-To: <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: xen-devel@lists.xenproject.org


--5p2oc3dth3vpey32
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hello Sean,

On Wed, Jul 12, 2023 at 02:31:02PM -0400, Sean Paul wrote:
> I'd really prefer this patch (series or single) is not accepted. This
> will cause problems for everyone cherry-picking patches to a
> downstream kernel (LTS or distro tree). I usually wouldn't expect
> sympathy here, but the questionable benefit does not outweigh the cost
> IM[biased]O.

I agree that for backports this isn't so nice. However with the split
approach (that was argumented against here) it's not soo bad. Patch #1
(and similar changes for the other affected structures) could be
trivially backported and with that it doesn't matter if you write dev or
drm (or whatever name is chosen in the end); both work in the same way.

But even with the one-patch-per-rename approach I'd consider the
renaming a net win, because ease of understanding code has a big value.
It's value is not so easy measurable as "conflicts when backporting",
but it also matters in say two years from now, while backporting
shouldn't be an issue then any more.

Thanks for your input, best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5p2oc3dth3vpey32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSv9igACgkQj4D7WH0S
/k6RYAf+Kb/OGUhX7UtaJ7F8lhh4A5MpdV0+zb8XHPmzkL4JlVB9wEVJC/FPN8Ls
d7eLHeVkntU9o11OhmTy2/1TYBfmcdz9eAte/ft+tAvD4DhDvUPySu9XvRYf1iov
ksEZynnx3l/QMc+WWmWc+3w7jN+LPiTg3ONEV2zyBDlx1VjCHUZSbmUsEM3o8NnW
2J2n4ghAkrSQ77hLo6RAshVhlbGx7jstgB7iuFZwsamrdDZSVscJBkclQtvSxLxI
BleN75F50zT+Gn8wdseapq9FCEZhz/l9JcpAW1IabKTU9puwfuVyUkBQ3qEpRLGB
GaDEUTla8XGImNxnIA6ElXmraX1ZqA==
=qokw
-----END PGP SIGNATURE-----

--5p2oc3dth3vpey32--

