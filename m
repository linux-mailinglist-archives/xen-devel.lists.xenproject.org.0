Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1997510B9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 20:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562732.879515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJeqJ-0002sr-MM; Wed, 12 Jul 2023 18:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562732.879515; Wed, 12 Jul 2023 18:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJeqJ-0002qb-IL; Wed, 12 Jul 2023 18:45:39 +0000
Received: by outflank-mailman (input) for mailman id 562732;
 Wed, 12 Jul 2023 18:39:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JlC3=C6=chromium.org=seanpaul@srs-se1.protection.inumbo.net>)
 id 1qJekB-0001uT-RY
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 18:39:20 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66e96bfa-20e3-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 20:39:16 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6687096c6ddso4441851b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 11:39:16 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com.
 [209.85.210.179]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b00666b3706be6sm3878086pfk.107.2023.07.12.11.39.12
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 11:39:12 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-666e5f0d60bso4420711b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 11:39:12 -0700 (PDT)
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
X-Inumbo-ID: 66e96bfa-20e3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689187153; x=1691779153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTThceHWQZD4Ac2XfATsHd8gywiOPtbGgdMtmxYrl6g=;
        b=oJAX7ilgKQYdf/a2vYZFXEEyfbM1+oUF5BiEMHU3fy/WIU6Lm81GmIvP7c5hiaZkf8
         HjQe5FR3smFKUHd1j0KlWwXvez6SKKeB7L1SDoeSvh8GITuxV448Jonkw/7CK9yXN8by
         ORnu52koKQ9jaBSktIDq1C4EAlSJwAl+VIoFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689187153; x=1691779153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTThceHWQZD4Ac2XfATsHd8gywiOPtbGgdMtmxYrl6g=;
        b=k6f8HRkt4xIbWfDNKTECV7qQ4PHw8bCLrsFvEkC/gDm8BZAeEtYD/H79G36uL1JUz4
         dwmO2ya//5eNdq6EJKXGRhfI5/QpE2SbmgtjyCReversNnJfwXZEq/Iwtte52o8oEDpM
         BuAHUqe6cDdq0rRJwELCUW6yq0RkYD9E95C7Q53cVXdil7N8d5mvgrRfcb3D5jkOy+dv
         AqfIEDmj/T90NkQ956Znqno8NYgmOataHuM1BcJh/EMJTYcAy1aYpWpvRqXsdPxvYBRl
         ViUixpJW1msGOqzmKg8IKvQD61qNQLJZ0dlTDzvyvgDqvm/J+SVaiE3VajlUfNr3K3X/
         0B+A==
X-Gm-Message-State: ABy/qLYhkmgL+6n1Lm1BL9c55x5Du2IsF8MKEluBL8zlzZ8S3MRYBzIw
	puuZLdZJjD/SIg1dR3V1tVIe1e0BEzd8w9KmxYE8AiUR
X-Google-Smtp-Source: APBJJlGwr864UsqYalSQ5fwgg9TMIbZ4aXEWgJRoznGQ9uiZ23c4WDLPh44EuwltqN5IRDyFQpQvtg==
X-Received: by 2002:aa7:88cf:0:b0:681:d247:8987 with SMTP id k15-20020aa788cf000000b00681d2478987mr17825081pff.17.1689187152938;
        Wed, 12 Jul 2023 11:39:12 -0700 (PDT)
X-Received: by 2002:a25:50c9:0:b0:c6d:e3e3:5592 with SMTP id
 e192-20020a2550c9000000b00c6de3e35592mr13511834ybb.54.1689186698646; Wed, 12
 Jul 2023 11:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de> <87fs5tgpvv.fsf@intel.com>
In-Reply-To: <87fs5tgpvv.fsf@intel.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 12 Jul 2023 14:31:02 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
Message-ID: <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
To: Jani Nikula <jani.nikula@intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Guchun Chen <guchun.chen@amd.com>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Evan Quan <evan.quan@amd.com>, 
	Likun Gao <Likun.Gao@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
	David Francis <David.Francis@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	Graham Sider <Graham.Sider@amd.com>, Lang Yu <Lang.Yu@amd.com>, 
	Philip Yang <Philip.Yang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
	Tim Huang <Tim.Huang@amd.com>, Zack Rusin <zackr@vmware.com>, Sam Ravnborg <sam@ravnborg.org>, 
	xurui <xurui@kylinos.cn>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Qingqing Zhuo <qingqing.zhuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	Hersen Wu <hersenxs.wu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>, 
	Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, 
	Aaron Liu <aaron.liu@amd.com>, Melissa Wen <mwen@igalia.com>, 
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Tadokoro <davidbtadokoro@usp.br>, 
	Wenjing Liu <wenjing.liu@amd.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>, 
	Roman Li <roman.li@amd.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
	Dave Airlie <airlied@redhat.com>, Russell King <linux@armlinux.org.uk>, 
	Liviu Dudau <liviu.dudau@arm.com>, Joel Stanley <joel@jms.id.au>, 
	Boris Brezillon <bbrezillon@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	=?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Danilo Krummrich <dakr@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Matt Roper <matthew.d.roper@intel.com>, 
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
	Radhakrishna Sripada <radhakrishna.sripada@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	Luca Coelho <luciano.coelho@intel.com>, 
	Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Vinod Govindapillai <vinod.govindapillai@intel.com>, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>, 
	Anusha Srivatsa <anusha.srivatsa@intel.com>, 
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Uma Shankar <uma.shankar@intel.com>, 
	Imre Deak <imre.deak@intel.com>, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
	Swati Sharma <swati2.sharma@intel.com>, =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>, 
	Mika Kahola <mika.kahola@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
	Arun R Murthy <arun.r.murthy@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>, 
	Khaled Almahallawy <khaled.almahallawy@intel.com>, 
	Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Andi Shyti <andi.shyti@linux.intel.com>, 
	Nirmoy Das <nirmoy.das@intel.com>, Fei Yang <fei.yang@intel.com>, 
	Animesh Manna <animesh.manna@intel.com>, Deepak R Varma <drv@mailo.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Vandita Kulkarni <vandita.kulkarni@intel.com>, Suraj Kandpal <suraj.kandpal@intel.com>, 
	Manasi Navare <manasi.d.navare@intel.com>, Drew Davenport <ddavenport@chromium.org>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Marian Cichy <m.cichy@pengutronix.de>, Dan Carpenter <error27@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Polimera <quic_vpolimer@quicinc.com>, 
	Jiasheng Jiang <jiasheng@iscas.ac.cn>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Liu Shixin <liushixin2@huawei.com>, 
	Marek Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
	Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>, 
	Gerd Hoffmann <kraxel@redhat.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	David Lechner <david@lechnology.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Michal Simek <michal.simek@amd.com>, 
	Haneen Mohammed <hamohammed.sa@gmail.com>, linux-hyperv@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
	Yongqin Liu <yongqin.liu@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Fabio Estevam <festevam@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, NXP Linux Team <linux-imx@nxp.com>, 
	spice-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>, 
	linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-mips@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, 
	John Stultz <jstultz@google.com>, freedreno@lists.freedesktop.org, 
	Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 10:52=E2=80=AFAM Jani Nikula <jani.nikula@intel.com=
> wrote:
>
> On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.d=
e> wrote:
> > Hello,
> >
> > while I debugged an issue in the imx-lcdc driver I was constantly
> > irritated about struct drm_device pointer variables being named "dev"
> > because with that name I usually expect a struct device pointer.
> >
> > I think there is a big benefit when these are all renamed to "drm_dev".
> > I have no strong preference here though, so "drmdev" or "drm" are fine
> > for me, too. Let the bikesheding begin!
> >
> > Some statistics:
> >
> > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | un=
iq -c | sort -n
> >       1 struct drm_device *adev_to_drm
> >       1 struct drm_device *drm_
> >       1 struct drm_device          *drm_dev
> >       1 struct drm_device        *drm_dev
> >       1 struct drm_device *pdev
> >       1 struct drm_device *rdev
> >       1 struct drm_device *vdev
> >       2 struct drm_device *dcss_drv_dev_to_drm
> >       2 struct drm_device **ddev
> >       2 struct drm_device *drm_dev_alloc
> >       2 struct drm_device *mock
> >       2 struct drm_device *p_ddev
> >       5 struct drm_device *device
> >       9 struct drm_device * dev
> >      25 struct drm_device *d
> >      95 struct drm_device *
> >     216 struct drm_device *ddev
> >     234 struct drm_device *drm_dev
> >     611 struct drm_device *drm
> >    4190 struct drm_device *dev
> >
> > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> > it's not only me and others like the result of this effort it should be
> > followed up by adapting the other structs and the individual usages in
> > the different drivers.
>
> I think this is an unnecessary change. In drm, a dev is usually a drm
> device, i.e. struct drm_device *. As shown by the numbers above.
>

I'd really prefer this patch (series or single) is not accepted. This
will cause problems for everyone cherry-picking patches to a
downstream kernel (LTS or distro tree). I usually wouldn't expect
sympathy here, but the questionable benefit does not outweigh the cost
IM[biased]O.

Sean

> If folks insist on following through with this anyway, I'm firmly in the
> camp the name should be "drm" and nothing else.
>
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center

