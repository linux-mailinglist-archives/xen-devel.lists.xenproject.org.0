Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F0D751A02
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562937.879797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqqv-0001Z8-B3; Thu, 13 Jul 2023 07:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562937.879797; Thu, 13 Jul 2023 07:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqqv-0001We-7t; Thu, 13 Jul 2023 07:35:05 +0000
Received: by outflank-mailman (input) for mailman id 562937;
 Thu, 13 Jul 2023 06:59:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cTst=C7=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1qJqI5-0002ZW-Qp
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 06:59:05 +0000
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfc60a35-214a-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 08:59:03 +0200 (CEST)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-634a3682c25so2474506d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 23:59:03 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 r30-20020a05620a03de00b00767f00a9c67sm858080qkm.95.2023.07.12.23.59.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 23:59:01 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-403b07cf5d0so3935811cf.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jul 2023 23:59:01 -0700 (PDT)
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
X-Inumbo-ID: bfc60a35-214a-11ee-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689231542; x=1691823542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+0qanWxODhzgXHCXIxDgPeQhxCw3xhLkeN7rWN/J3A=;
        b=iBJTVChQHRPXsylpBOnQRyoxH1qIUZWRdBO5ga5bjiZmMWBTSKx/zUZP9yxAfpCUqZ
         nCzN9qsoIAnw439sVVU5BDS/A0nogA0/0JQ9yhh65K+NFz5aCzycMCr0nem9sY7BsmxM
         sszj52QYtAtniziHz7AYYv3skmD7Vfip1yNPJaGNfv04BIwbyU4aSeGo38AAMLl7FjkX
         0TcmM8w3UvkAR4CP+7ECoGDAgHvL5WA7nvqG/raQwtpT40tdHnjVU5UKy76zWCfItfAe
         65o6EWKVezKJMFnXONYa5yuYao5XXeUYfCD1RFD58tOPUXu54EfO6HA8Kx2MKGdpeH4j
         Cgzg==
X-Gm-Message-State: ABy/qLb+NCzDauCQAO6RYchl1s2BClX5kcw44B7hDdnoJJrWujW83lXE
	/W/Dx0uWgGVe/0JGqFBdZCqyWy3RWJe/Q/yM
X-Google-Smtp-Source: APBJJlF7WyAS9UDnDXPT2NYMCGxbtFmv0PxNbcSY8AGoWRWmFaxrBVHm6ZVKKBZDTHaT+nrCXTjRsw==
X-Received: by 2002:a0c:f049:0:b0:630:1954:b30 with SMTP id b9-20020a0cf049000000b0063019540b30mr733537qvl.9.1689231541676;
        Wed, 12 Jul 2023 23:59:01 -0700 (PDT)
X-Received: by 2002:a0d:e208:0:b0:56d:9e2:7d9e with SMTP id
 l8-20020a0de208000000b0056d09e27d9emr931586ywe.21.1689231149403; Wed, 12 Jul
 2023 23:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com> <20230712161025.22op3gtzgujrhytb@pengutronix.de>
In-Reply-To: <20230712161025.22op3gtzgujrhytb@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Jul 2023 08:52:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuvkxcj05OTfEn5f2p-6e71QEHVjSLWwNFRnR_=WEJVQ@mail.gmail.com>
Message-ID: <CAMuHMdWuvkxcj05OTfEn5f2p-6e71QEHVjSLWwNFRnR_=WEJVQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to drm_dev
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jani Nikula <jani.nikula@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Guchun Chen <guchun.chen@amd.com>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Evan Quan <evan.quan@amd.com>, 
	Likun Gao <Likun.Gao@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
	David Francis <David.Francis@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, Lang Yu <Lang.Yu@amd.com>, 
	Philip Yang <Philip.Yang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>, 
	Tim Huang <Tim.Huang@amd.com>, Zack Rusin <zackr@vmware.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
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
	Drew Davenport <ddavenport@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Dan Carpenter <error27@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Vinod Polimera <quic_vpolimer@quicinc.com>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Liu Shixin <liushixin2@huawei.com>, Marek Vasut <marex@denx.de>, Ben Skeggs <bskeggs@redhat.com>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Tomi Valkeinen <tomba@kernel.org>, 
	Emma Anholt <emma@anholt.net>, Gerd Hoffmann <kraxel@redhat.com>, 
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

Hi Uwe,

Let's add some fuel to keep the thread alive ;-)

On Wed, Jul 12, 2023 at 6:13=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Jul 12, 2023 at 05:34:28PM +0300, Jani Nikula wrote:
> > On Wed, 12 Jul 2023, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix=
.de> wrote:
> > > Hello,
> > >
> > > while I debugged an issue in the imx-lcdc driver I was constantly
> > > irritated about struct drm_device pointer variables being named "dev"
> > > because with that name I usually expect a struct device pointer.
> > >
> > > I think there is a big benefit when these are all renamed to "drm_dev=
".
> > > I have no strong preference here though, so "drmdev" or "drm" are fin=
e
> > > for me, too. Let the bikesheding begin!
> > >
> > > Some statistics:
> > >
> > > $ git grep -ohE 'struct drm_device *\* *[^ (),;]*' v6.5-rc1 | sort | =
uniq -c | sort -n
> > >       1 struct drm_device *adev_to_drm
> > >       1 struct drm_device *drm_
> > >       1 struct drm_device          *drm_dev
> > >       1 struct drm_device        *drm_dev
> > >       1 struct drm_device *pdev
> > >       1 struct drm_device *rdev
> > >       1 struct drm_device *vdev
> > >       2 struct drm_device *dcss_drv_dev_to_drm
> > >       2 struct drm_device **ddev
> > >       2 struct drm_device *drm_dev_alloc
> > >       2 struct drm_device *mock
> > >       2 struct drm_device *p_ddev
> > >       5 struct drm_device *device
> > >       9 struct drm_device * dev
> > >      25 struct drm_device *d
> > >      95 struct drm_device *
> > >     216 struct drm_device *ddev
> > >     234 struct drm_device *drm_dev
> > >     611 struct drm_device *drm
> > >    4190 struct drm_device *dev
> > >
> > > This series starts with renaming struct drm_crtc::dev to drm_dev. If
> > > it's not only me and others like the result of this effort it should =
be
> > > followed up by adapting the other structs and the individual usages i=
n
> > > the different drivers.
> >
> > I think this is an unnecessary change. In drm, a dev is usually a drm
> > device, i.e. struct drm_device *.
>
> Well, unless it's not. Prominently there is
>
>         struct drm_device {
>                 ...
>                 struct device *dev;
>                 ...
>         };
>
> which yields quite a few code locations using dev->dev which is
> IMHO unnecessary irritating:
>
>         $ git grep '\<dev->dev' v6.5-rc1 drivers/gpu/drm | wc -l
>         1633

I find that irritating as well...

Same for e.g. crtc->crtc.

Hence that's why I had sent patches to rename the base members in the
shmob_drm-specific subclasses of drm_{crtc,connector,plane} to "base".
https://lore.kernel.org/dri-devel/b3daca80f82625ba14e3aeaf2fca6dcefa056e47.=
1687423204.git.geert+renesas@glider.be

> Also the functions that deal with both a struct device and a struct
> drm_device often use "dev" for the struct device and then "ddev" for
> the drm_device (see for example amdgpu_device_get_pcie_replay_count()).

I guess you considered "drm_dev", because it is still a short name?
Code dealing with platform devices usually uses "pdev" and "dev".
Same for PCI drivers (despite "pci_dev" being a short name).

So my personal preference goes to "ddev".

EOF (End-of-Fuel ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

