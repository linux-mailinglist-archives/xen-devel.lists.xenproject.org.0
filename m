Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676987505A4
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 13:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562395.879049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXjU-0007zG-JP; Wed, 12 Jul 2023 11:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562395.879049; Wed, 12 Jul 2023 11:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXjU-0007w7-GW; Wed, 12 Jul 2023 11:10:08 +0000
Received: by outflank-mailman (input) for mailman id 562395;
 Wed, 12 Jul 2023 11:08:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Wxm=C6=inria.fr=julia.lawall@srs-se1.protection.inumbo.net>)
 id 1qJXhW-000749-9Z
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 11:08:06 +0000
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ec2a468-20a4-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 13:08:03 +0200 (CEST)
Received: from hstsheraton06.h.subnet.rcn.com (HELO hadrien) ([207.180.135.5])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 13:07:34 +0200
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
X-Inumbo-ID: 5ec2a468-20a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZJpBQTRvYf3xLQYim5PgpqIBO472OK4qQBRBn5wK5Lo=;
  b=LiXL1vdteb3LQ9kRIyiqac+rKgCW2hgh2hum23eyRXq5g9LP+B8eU6Dp
   yAXUq+WJAba1z7ssx8t9t2gLhg3oemVZYeyt9D+AD8e0OAjokLOSxIaFX
   9WTYl28HsAaDebnlB3oyseEPBOV0bXJ9JOXjVMF/PU7HUlTO1JHrhIytd
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,199,1684792800"; 
   d="scan'208";a="61228938"
Date: Wed, 12 Jul 2023 07:07:32 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
cc: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, 
    "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
    Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
    Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
    Hamza Mahfooz <hamza.mahfooz@amd.com>, 
    Javier Martinez Canillas <javierm@redhat.com>, 
    Guchun Chen <guchun.chen@amd.com>, 
    Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
    Evan Quan <evan.quan@amd.com>, Likun Gao <Likun.Gao@amd.com>, 
    =?ISO-8859-15?Q?Marek_Ol=A8=E1k?= <marek.olsak@amd.com>, 
    David Francis <David.Francis@amd.com>, 
    Hawking Zhang <Hawking.Zhang@amd.com>, Lang Yu <Lang.Yu@amd.com>, 
    Philip Yang <Philip.Yang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
    Tim Huang <Tim.Huang@amd.com>, Zack Rusin <zackr@vmware.com>, 
    Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    =?ISO-8859-15?Q?Ma=EDra_Canal?= <mairacanal@riseup.net>, 
    =?ISO-8859-15?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>, 
    Qingqing Zhuo <qingqing.zhuo@amd.com>, 
    Aurabindo Pillai <aurabindo.pillai@amd.com>, 
    Hersen Wu <hersenxs.wu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>, 
    Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>, 
    Wayne Lin <Wayne.Lin@amd.com>, Aaron Liu <aaron.liu@amd.com>, 
    Melissa Wen <mwen@igalia.com>, 
    Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, 
    David Tadokoro <davidbtadokoro@usp.br>, Wenjing Liu <wenjing.liu@amd.com>, 
    Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Alexey Kodanev <aleksei.kodanev@bell-sw.com>, Roman Li <roman.li@amd.com>, 
    =?ISO-8859-15?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>, 
    Dave Airlie <airlied@redhat.com>, Russell King <linux@armlinux.org.uk>, 
    Liviu Dudau <liviu.dudau@arm.com>, Joel Stanley <joel@jms.id.au>, 
    Boris Brezillon <bbrezillon@kernel.org>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@microchip.com>, 
    Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
    Kyungmin Park <kyungmin.park@samsung.com>, 
    Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
    Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
    Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
    =?ISO-8859-15?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>, 
    Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
    Danilo Krummrich <dakr@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, 
    Jani Nikula <jani.nikula@linux.intel.com>, 
    Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
    Rodrigo Vivi <rodrigo.vivi@intel.com>, 
    Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
    =?ISO-8859-15?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
    Lucas De Marchi <lucas.demarchi@intel.com>, 
    Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
    Andrzej Hajda <andrzej.hajda@intel.com>, 
    Matt Roper <matthew.d.roper@intel.com>, 
    Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
    Radhakrishna Sripada <radhakrishna.sripada@intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Luca Coelho <luciano.coelho@intel.com>, 
    Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
    Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
    Vinod Govindapillai <vinod.govindapillai@intel.com>, 
    =?ISO-8859-2?Q?=A3ukasz_Bartosik?= <lb@semihalf.com>, 
    Anusha Srivatsa <anusha.srivatsa@intel.com>, 
    Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, 
    Uma Shankar <uma.shankar@intel.com>, Imre Deak <imre.deak@intel.com>, 
    Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
    Swati Sharma <swati2.sharma@intel.com>, 
    =?ISO-8859-15?Q?Jouni_H=F6gander?= <jouni.hogander@intel.com>, 
    Mika Kahola <mika.kahola@intel.com>, 
    =?ISO-8859-15?Q?Jos=E9_Roberto_de_Souza?= <jose.souza@intel.com>, 
    Arun R Murthy <arun.r.murthy@intel.com>, 
    Gustavo Sousa <gustavo.sousa@intel.com>, 
    Khaled Almahallawy <khaled.almahallawy@intel.com>, 
    Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
    Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
    Fei Yang <fei.yang@intel.com>, Animesh Manna <animesh.manna@intel.com>, 
    Deepak R Varma <drv@mailo.com>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, 
    Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
    Vandita Kulkarni <vandita.kulkarni@intel.com>, 
    Suraj Kandpal <suraj.kandpal@intel.com>, 
    Drew Davenport <ddavenport@chromium.org>, 
    Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
    Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
    Philipp Zabel <p.zabel@pengutronix.de>, Dan Carpenter <error27@gmail.com>, 
    Paul Cercueil <paul@crapouillou.net>, 
    Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
    Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    Neil Armstrong <neil.armstrong@linaro.org>, 
    Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>, 
    Abhinav Kumar <quic_abhinavk@quicinc.com>, 
    Vinod Polimera <quic_vpolimer@quicinc.com>, 
    Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
    Konrad Dybcio <konrad.dybcio@linaro.org>, 
    Jessica Zhang <quic_jesszhan@quicinc.com>, 
    Liu Shixin <liushixin2@huawei.com>, Marek Vasut <marex@denx.de>, 
    Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
    Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>, 
    Emma Anholt <emma@anholt.net>, Gerd Hoffmann <kraxel@redhat.com>, 
    Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
    Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
    Wolfram Sang <wsa+renesas@sang-engineering.com>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
    =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>, 
    Orson Zhai <orsonzhai@gmail.com>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Chunyan Zhang <zhang.lyra@gmail.com>, 
    Alain Volmat <alain.volmat@foss.st.com>, 
    Yannick Fertre <yannick.fertre@foss.st.com>, 
    Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
    Philippe Cornu <philippe.cornu@foss.st.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Samuel Holland <samuel@sholland.org>, 
    Thierry Reding <thierry.reding@gmail.com>, 
    Mikko Perttunen <mperttunen@nvidia.com>, 
    Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
    David Lechner <david@lechnology.com>, 
    Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
    Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
    Melissa Wen <melissa.srw@gmail.com>, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Michal Simek <michal.simek@amd.com>, 
    Haneen Mohammed <hamohammed.sa@gmail.com>, linux-hyperv@vger.kernel.org, 
    linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, 
    dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
    Yongqin Liu <yongqin.liu@linaro.org>, 
    Alim Akhtar <alim.akhtar@samsung.com>, 
    Marijn Suijten <marijn.suijten@somainline.org>, 
    Fabio Estevam <festevam@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
    Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
    amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
    linux-rockchip@lists.infradead.org, 
    Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
    VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, 
    NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org, 
    linux-sunxi@lists.linux.dev, 
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
    linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
    linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org, 
    linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, 
    Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>, 
    linux-arm-kernel@lists.infradead.org, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Andrew Jeffery <andrew@aj.id.au>, linux-mips@vger.kernel.org, 
    Chia-I Wu <olvaffe@gmail.com>, linux-renesas-soc@vger.kernel.org, 
    kernel@pengutronix.de, John Stultz <jstultz@google.com>, 
    freedreno@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>, 
    Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
In-Reply-To: <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
Message-ID: <acd7913-3c42-7354-434-a826b6c8718@inria.fr>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de> <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com> <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1690266391-1689160075=:3129"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1690266391-1689160075=:3129
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



On Wed, 12 Jul 2023, Uwe Kleine-K�nig wrote:

> On Wed, Jul 12, 2023 at 12:46:33PM +0200, Christian K�nig wrote:
> > Am 12.07.23 um 11:46 schrieb Uwe Kleine-K�nig:
> > > Hello,
> > >
> > > while I debugged an issue in the imx-lcdc driver I was constantly
> > > irritated about struct drm_device pointer variables being named "dev"
> > > because with that name I usually expect a struct device pointer.
> > >
> > > I think there is a big benefit when these are all renamed to "drm_dev".
> > > I have no strong preference here though, so "drmdev" or "drm" are fine
> > > for me, too. Let the bikesheding begin!
> > >
> > > Some statistics:
> > >
> > > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | uniq -c | sort -n
> > >        1 struct drm_device *adev_to_drm
> > >        1 struct drm_device *drm_
> > >        1 struct drm_device          *drm_dev
> > >        1 struct drm_device        *drm_dev
> > >        1 struct drm_device *pdev
> > >        1 struct drm_device *rdev
> > >        1 struct drm_device *vdev
> > >        2 struct drm_device *dcss_drv_dev_to_drm
> > >        2 struct drm_device **ddev
> > >        2 struct drm_device *drm_dev_alloc
> > >        2 struct drm_device *mock
> > >        2 struct drm_device *p_ddev
> > >        5 struct drm_device *device
> > >        9 struct drm_device * dev
> > >       25 struct drm_device *d
> > >       95 struct drm_device *
> > >      216 struct drm_device *ddev
> > >      234 struct drm_device *drm_dev
> > >      611 struct drm_device *drm
> > >     4190 struct drm_device *dev
> > >
> > > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> > > it's not only me and others like the result of this effort it should be
> > > followed up by adapting the other structs and the individual usages in
> > > the different drivers.
> > >
> > > To make this series a bit easier handleable, I first added an alias for
> > > drm_crtc::dev, then converted the drivers one after another and the last
> > > patch drops the "dev" name. This has the advantage of being easier to
> > > review, and if I should have missed an instance only the last patch must
> > > be dropped/reverted. Also this series might conflict with other patches,
> > > in this case the remaining patches can still go in (apart from the last
> > > one of course). Maybe it also makes sense to delay applying the last
> > > patch by one development cycle?
> >
> > When you automatically generate the patch (with cocci for example) I usually
> > prefer a single patch instead.
>
> Maybe I'm too stupid, but only parts of this patch were created by
> coccinelle. I failed to convert code like
>
> -       spin_lock_irq(&crtc->dev->event_lock);
> +       spin_lock_irq(&crtc->drm_dev->event_lock);
>
> Added Julia to Cc, maybe she has a hint?!

A priori, I see no reason why the rule below should not apply to the above
code.  Is there a parsing problem in the containing function?  You can run

spatch --parse-c file.c

If there is a paring problem, please let me know and i will try to fix it
so the while thing can be done automatically.

julia

>
> (Up to now it's only
>
> @@
> struct drm_crtc *crtc;
> @@
> -crtc->dev
> +crtc->drm_dev
>
> )
>
> > Background is that this makes merge conflicts easier to handle and detect.
>
> Really? Each file (apart from include/drm/drm_crtc.h) is only touched
> once. So unless I'm missing something you don't get less or easier
> conflicts by doing it all in a single patch. But you gain the freedom to
> drop a patch for one driver without having to drop the rest with it. So
> I still like the split version better, but I'm open to a more verbose
> reasoning from your side.
>
> > When you have multiple patches and a merge conflict because of some added
> > lines using the old field the build breaks only on the last patch which
> > removes the old field.
>
> Then you can revert/drop the last patch without having to respin the
> whole single patch and thus caring for still more conflicts that arise
> until the new version is sent.
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K�nig            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |
>
--8323329-1690266391-1689160075=:3129--

