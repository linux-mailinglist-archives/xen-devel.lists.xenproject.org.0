Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADB775269C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 17:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563226.880351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJy6i-0001Fg-Bk; Thu, 13 Jul 2023 15:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563226.880351; Thu, 13 Jul 2023 15:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJy6i-0001By-4r; Thu, 13 Jul 2023 15:19:52 +0000
Received: by outflank-mailman (input) for mailman id 563226;
 Thu, 13 Jul 2023 15:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no0J=C7=linux.intel.com=tvrtko.ursulin@srs-se1.protection.inumbo.net>)
 id 1qJy2p-00011Z-MS
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 15:15:51 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 240fbcfb-2190-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 17:15:48 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:15:44 -0700
Received: from apaulaux-mobl.ger.corp.intel.com (HELO [10.213.206.56])
 ([10.213.206.56])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:14:58 -0700
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
X-Inumbo-ID: 240fbcfb-2190-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689261348; x=1720797348;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FdV+ihBB75TX4OJUKwPysdCuraDJ8JqOsAXrG1NV6Qw=;
  b=RWlgdMrt8+bpnTLUPvcDLKRRTjVo0+h/H74wgrwp+mToZcR+LhUHgDT9
   z9jZaRhcRgzL3PuZN1HG+yuqam+fdljJFBpp7dC0LSX80iXUp+6O2tJdj
   1vlM7Js6aFWMR4Bq9QRq1g/FtMjiO16Hyr/BR9vbesjM/VnphowPoZgt7
   R+9m5ojVlEsjWYoLntZibrezpVCuUCNbgmzxqqSHfBGRJic3p/8/WWb8N
   g8GGup2zjDZxqKx/EqVYlbTVGAU3bP6mm1paboMEcVzQRKx7Apxtg0Am+
   as/oLmgsp5H+OGfjDNp3K9xkq8XPaYMVXPsJfCYhwDW8Ny6OziK6cGszG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350089226"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="350089226"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968656199"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="968656199"
Message-ID: <d6160aeb-6344-b272-775a-cb665dca46ac@linux.intel.com>
Date: Thu, 13 Jul 2023 16:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul
 <seanpaul@chromium.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>
Cc: Jani Nikula <jani.nikula@intel.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Arun R Murthy <arun.r.murthy@intel.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Liu Shixin <liushixin2@huawei.com>,
 linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Matt Roper <matthew.d.roper@intel.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 spice-devel@lists.freedesktop.org,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
 Tim Huang <Tim.Huang@amd.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?=c5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Zack Rusin
 <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Fei Yang
 <fei.yang@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, David Lechner <david@lechnology.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 David Francis <David.Francis@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-rockchip@lists.infradead.org, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, =?UTF-8?Q?Jouni_H=c3=b6gander?=
 <jouni.hogander@intel.com>, Dave Airlie <airlied@redhat.com>,
 linux-mips@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Animesh Manna <animesh.manna@intel.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Evan Quan <evan.quan@amd.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Chunyan Zhang
 <zhang.lyra@gmail.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Sandy Huang <hjc@rock-chips.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Stultz <jstultz@google.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Drew Davenport <ddavenport@chromium.org>, Kevin Hilman
 <khilman@baylibre.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Dan Carpenter <error27@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mairacanal@riseup.net>, Luca Coelho <luciano.coelho@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Likun Gao <Likun.Gao@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Alan Liu <haoping.liu@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, Lyude Paul <lyude@redhat.com>,
 intel-gfx@lists.freedesktop.org, Alison Wang <alison.wang@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Deepak R Varma <drv@mailo.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chia-I Wu <olvaffe@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Emma Anholt <emma@anholt.net>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Roman Li
 <roman.li@amd.com>, Paul Cercueil <paul@crapouillou.net>,
 Rob Clark <robdclark@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Russell King <linux@armlinux.org.uk>, Uma Shankar <uma.shankar@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 linux-tegra@vger.kernel.org, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Joaqu=c3=adn_Ignacio_Aramend=c3=ada?= <samsagax@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, amd-gfx@lists.freedesktop.org,
 Jyri Sarha <jyri.sarha@iki.fi>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Daniel Vetter
 <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com>
 <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
 <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
 <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <78be52b8-5ffb-601a-84b2-ead2894973a6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 13/07/2023 16:09, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.07.23 um 16:41 schrieb Sean Paul:
>> On Thu, Jul 13, 2023 at 9:04 AM Uwe Kleine-König
>> <u.kleine-koenig@pengutronix.de> wrote:
>>>
>>> hello Sean,
>>>
>>> On Wed, Jul 12, 2023 at 02:31:02PM -0400, Sean Paul wrote:
>>>> I'd really prefer this patch (series or single) is not accepted. This
>>>> will cause problems for everyone cherry-picking patches to a
>>>> downstream kernel (LTS or distro tree). I usually wouldn't expect
>>>> sympathy here, but the questionable benefit does not outweigh the cost
>>>> IM[biased]O.
>>>
>>> I agree that for backports this isn't so nice. However with the split
>>> approach (that was argumented against here) it's not soo bad. Patch #1
>>> (and similar changes for the other affected structures) could be
>>> trivially backported and with that it doesn't matter if you write dev or
>>> drm (or whatever name is chosen in the end); both work in the same way.
>>
>> Patch #1 avoids the need to backport the entire set, however every
>> change occuring after the rename patches will cause conflicts on
>> future cherry-picks. Downstream kernels will have to backport the
>> whole set. Backporting the entire set will create an epoch in
>> downstream kernels where cherry-picking patches preceding this set
>> will need to undergo conflict resolution as well. As mentioned in my
>> previous email, I don't expect sympathy here, it's part of maintaining
>> a downstream kernel, but there is a real cost to kernel consumers.
>>
>>>
>>> But even with the one-patch-per-rename approach I'd consider the
>>> renaming a net win, because ease of understanding code has a big value.
>>> It's value is not so easy measurable as "conflicts when backporting",
>>> but it also matters in say two years from now, while backporting
>>> shouldn't be an issue then any more.
>>
>> You've rightly identified the conjecture in your statement. I've been
>> on both sides of the argument, having written/maintained drm code
>> upstream and cherry-picked changes to a downstream kernel. Perhaps
>> it's because drm's definition of dev is ingrained in my muscle memory,
>> or maybe it's because I don't do a lot of upstream development these
>> days, but I just have a hard time seeing the benefit here.
> 
> I can only second what Sean writes. I've done quite a bit of backporting 
> of DRM code. It's hard already. And this kind of change is going to to 
> affect almost every backported DRM patch in the coming years. Not just 
> for distribution kernels, but also for upstream's stable series. It's 
> really only possible to do this change over many releases while keeping 
> compatible with the old name. So the more I think about it, the less I 
> like this change.

I've done my share of backporting, and still am doing it, so I can say I 
dislike it as much as anyone, however.. Is this an argument which the 
kernel as a wider entity typically accepts? If not could it be a 
slippery slope to start a precedent?

It is a honest question - I am not familiar if there were or were not 
any similar discussions in the past.

My gut feeling is that *if* there is a consensus that something 
_improves_ the code base significantly, backporting pains should 
probably not be weighted very heavily as a contra argument.

Regards,

Tvrtko

