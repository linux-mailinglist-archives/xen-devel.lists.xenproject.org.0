Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECEFA08323
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 00:00:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869135.1280609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW1VC-0000hX-Nc; Thu, 09 Jan 2025 22:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869135.1280609; Thu, 09 Jan 2025 22:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tW1VC-0000fz-Kt; Thu, 09 Jan 2025 22:59:46 +0000
Received: by outflank-mailman (input) for mailman id 869135;
 Thu, 09 Jan 2025 22:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HHHK=UB=sntech.de=heiko@srs-se1.protection.inumbo.net>)
 id 1tW1VB-0000ft-89
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 22:59:45 +0000
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 694596f8-cedd-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 23:59:42 +0100 (CET)
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tW1Uq-0005mI-C2; Thu, 09 Jan 2025 23:59:24 +0100
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
X-Inumbo-ID: 694596f8-cedd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5X3Tmvihn3grkA7Jge4RjfqiSvPeilgE9yOD+d9FpVI=; b=s+jwsQH2++ZJTa21jBBjugQMXI
	4bHOZkHr3BtbA6u/uOhHobPv3MGeFWhNFGUl43iw9TYIyTjmoijwv6stOdPuOX44mYtM+Ex4veIlv
	GanP8Ltk9SSPFArY9HIjzDL6w9HBmiDH9lkAf/YRbJ76vQtfeMTBh+9CdrFBgxC6jT1PLksF27MCM
	uT5h6cp1P/vX38GEwJikltALOY4zAv1uVLPRdaX6J8i+zNB6LmK+4A346bu7woaR2Pb1GBGscGht6
	qpjxlF/C8UEv09LkPOGTvCxTCmWsQsAVjWgo7DBUgDUT6zw9zcZF7Od+phqWlT6xPgO3SWYExc5bS
	MfLPLsiA==;
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>
Subject:
 Re: [PATCH v2 19/25] drm/rockchip: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Thu, 09 Jan 2025 23:59:23 +0100
Message-ID: <3227546.fEcJ0Lxnt5@diego>
In-Reply-To: <20250109150310.219442-20-tzimmermann@suse.de>
References:
 <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-20-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 9. Januar 2025, 15:57:13 CET schrieb Thomas Zimmermann:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch to a multiple of 64.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>

I've looked up the patch implementing the new functionality - patch2 of
this series [0] and that looks really nice to get proper helpers and not
having many drivers open-coding the same functionality in different ways.

So for the Rockchip adaptation:

Acked-by: Heiko Stuebner <heiko@sntech.de>

and looking forward to this getting merged :-)

Thanks a lot for working on that
Heiko

[0] https://patchwork.kernel.org/project/linux-rockchip/patch/2025010915031=
0.219442-3-tzimmermann@suse.de/

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_gem.c
> index 6330b883efc3..3bd06202e232 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -9,6 +9,7 @@
>  #include <linux/vmalloc.h>
> =20
>  #include <drm/drm.h>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -403,13 +404,12 @@ int rockchip_gem_dumb_create(struct drm_file *file_=
priv,
>  			     struct drm_mode_create_dumb *args)
>  {
>  	struct rockchip_gem_object *rk_obj;
> -	int min_pitch =3D DIV_ROUND_UP(args->width * args->bpp, 8);
> +	int ret;
> =20
> -	/*
> -	 * align to 64 bytes since Mali requires it.
> -	 */
> -	args->pitch =3D ALIGN(min_pitch, 64);
> -	args->size =3D args->pitch * args->height;
> +	/* 64-byte alignment required by Mali */
> +	ret =3D drm_mode_size_dumb(dev, args, SZ_64, 0);
> +	if (ret)
> +		return ret;
> =20
>  	rk_obj =3D rockchip_gem_create_with_handle(file_priv, dev, args->size,
>  						 &args->handle);
>=20





