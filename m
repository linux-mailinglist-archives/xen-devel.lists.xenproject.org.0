Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708EF26D9B1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 12:56:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIraU-00017T-N1; Thu, 17 Sep 2020 10:56:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzjc=C2=gmail.com=thierry.reding@srs-us1.protection.inumbo.net>)
 id 1kIraT-00017G-8o
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 10:56:25 +0000
X-Inumbo-ID: c3824f58-1149-4f4e-9903-16fe2b74565c
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3824f58-1149-4f4e-9903-16fe2b74565c;
 Thu, 17 Sep 2020 10:56:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so1575933wrt.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
 b=QB6L5K889Bo72oCmXlPEd6RO0QFJaiOuUuQYNXSbkbKHLE0z4jthWl14REa3WCR0Bt
 7IHiIFNeD/Ta+yo/4I3eoGqh6G9kDPeQAYogqalpiHtq8aE0N2vVL/nLfC8G7fyUISnI
 HqZvSuiNmgZzkTOCBFRSXTB+sPRscquK8BzaCBsBZW04/6qzVITT/XTRzNX58D5ubsqj
 EBCDdFzw/4/+qKJ5jqHMFDrIQ6SPZ7RFWRnZTqbCA2A8CuvrZLIiZY8CyMBMGu+cZPGz
 +Xk5dHOFs8kS9Gn7mKXA7wGo6jD27ynEwYEI2R76ZDPCy8bCgvVnpggr26rleQIwiHel
 X5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T7o1O276VNvFCMXreEbeFlPYMFMj08O5QtDTtLf9+io=;
 b=Ref8PKm4gjiNxES1EdhgeecfOlmadcimfEbp/QIFGESrzMsbjOyF1RACxr/ZUIK7uJ
 MviGR1NvPg3xFBgy+bGaASt0qJJ/QjTM3ttbLS5xhOCvJcA4KqVwgvzGDRnMJXIyal3s
 foebr3k4DgG9grw79u2NipfAedWFtQTsySqgS8wdARYwsUVm3Go8uBJUJLDCLQKnGhec
 TabNbSzFqUiLPPBw081dzEQHY1PlX2ef08wB3G5zxdSw/LLe1ZGmFhy04K6+OY0VBaJl
 XyuannkoJyrkZeEzIYdzbRXoKSbA9q8jOYqeel56pg0K6D+tqQE8NIJa1TukwDHiLTsm
 UknQ==
X-Gm-Message-State: AOAM533tC/kWkvKxZKHjqCUOhghvvTg5kKK0F7gJAyRP5/nCYTrlJm6J
 blhEvjaiG6KyUpB53RO+1WU=
X-Google-Smtp-Source: ABdhPJwg7nkwQTaRBQuWwl0RcZSkUXHrdUc9WYlLoauvclz9jtCse6f5SG7t61si5y3RH63KecEA/w==
X-Received: by 2002:adf:e711:: with SMTP id c17mr32158269wrm.359.1600340183749; 
 Thu, 17 Sep 2020 03:56:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d83sm10820463wmf.23.2020.09.17.03.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 03:56:22 -0700 (PDT)
Date: Thu, 17 Sep 2020 12:56:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com,
 sean@poorly.run, bskeggs@redhat.com, tomi.valkeinen@ti.com,
 eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, aaron.liu@amd.com,
 nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 14/21] drm/tegra: Introduce GEM object functions
Message-ID: <20200917105620.GK3515672@ulmo>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-15-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-15-tzimmermann@suse.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 04:59:51PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in tegra.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tegra/drm.c | 4 ----
>  drivers/gpu/drm/tegra/gem.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9jQNQACgkQ3SOs138+
s6HfWQ//YmrWsVV1CJUAgb5t2QX4pCrujVRekVE/g1njlA/b4hb8UrTwixaZox4k
Y6ALc4RAngHpnPoebK9HTtI7eQ6gV3NzTvOZN432iqInp8UuFdrqwY9hkRcS5ak9
gNSHqMgl0BAkIdZ7VM5EWvVcbSkWsGbOR2uTx45m3hieqf80Jlyto/yqcH8yHm0Y
dNhlRIxSS23lHF4c79jOtCPyJjF2DaErfz+qFiFLmdV60AjeCfl6LZZSuSNSbSNv
Ht8OICXXHv9dKx6IbgyAAJIf77DsMDyXHzNC6YxoBH1c1X3JgEinuNaj8h+ZXxrT
klWtayTZ15xforiBumJH+Zi23DA+95v6eigfHDVje5APtRHxDgdnNOhW6zRF049I
powiLvCaS10xJVB7+4DlXmvdJTRaw8jNMcOYR0Yyg5fwrbkjkHyFsi2iQyzclBEJ
KM5kjLzpgBQpaEgpsCqxY0TJ0/bU/VdL532UpAyCK7D9RxN8sdhfU7A4xuwwAeNP
t63YCPEKs9kd0rKW4W6tUOEm9IeNiHL0CL55oYNDUNk0ddTtmdlQkFKSOfDbGBwe
X3RtJeu0oG5S40RXucqy2J4BJO5tKcymjFb3xqjaCP8nDF3ozvgmq/Hu4+MWkeL7
b/rNCCE8o02rDlLqOHqxccc+bQXs6tQBkwI0mESWxpdRfBPoyt8=
=1YYz
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--

