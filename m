Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A602531EC67
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 17:43:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86709.162981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCmNb-0006ZD-Em; Thu, 18 Feb 2021 16:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86709.162981; Thu, 18 Feb 2021 16:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCmNb-0006Yo-Ba; Thu, 18 Feb 2021 16:42:15 +0000
Received: by outflank-mailman (input) for mailman id 86709;
 Thu, 18 Feb 2021 16:35:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5cwq=HU=cerno.tech=maxime@srs-us1.protection.inumbo.net>)
 id 1lCmGy-0005eH-BU
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 16:35:25 +0000
Received: from wnew2-smtp.messagingengine.com (unknown [64.147.123.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id beef2542-b4a1-4d7d-b048-973b9bc22af8;
 Thu, 18 Feb 2021 16:35:22 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id DF1EFE1F;
 Thu, 18 Feb 2021 11:35:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 18 Feb 2021 11:35:21 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE99E24005C;
 Thu, 18 Feb 2021 11:35:14 -0500 (EST)
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
X-Inumbo-ID: beef2542-b4a1-4d7d-b048-973b9bc22af8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=9glu1NqYQ89GMrISno2hyWbjb5g
	/OTCuIq2T05YOits=; b=G6pm+BxV6Dh9oiD6SJUz1xXNJ7zPPCZpBW9AEchzgQY
	SsCnHwIhIZleE9PczJeaxSABPuNfyZNS1u3Zj2kDGJdZzYOuF3md0m5GftSNoeev
	ZavMKbuw+WSPSBcY4VpVTBkV/ddPDz1xHbCCETt+RAuJ3CD0g/aAsRM9ST0bJ2+t
	+6ifUhzBy+1w+NmK0Bu03Ar0ji4npJeGmU9jySby/2b7puTSkKn/YECDpUC+LyuL
	6Guj5EkOzfnyrZ7fuCEdeNrI7VmN9ZSWN6LpeNmu5/FnzVAUNcjxOj673ayo+RK2
	5fiMH3d3rCy4RcepJW9kS8GD2lNioOxaP+2WrEFLkFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9glu1N
	qYQ89GMrISno2hyWbjb5g/OTCuIq2T05YOits=; b=F8tizhTRDZ1QmkV4IX/nKz
	GFGeeljOv0nlv95ycFp0ze5k8JaZwhxcx+uGwtKUsVGuJaf3wBvlVHShQ6AEUuUa
	nYa/M+CR3Q7nQv96fSu/CfaeIwuzJxRKrhn2B8yNMcGRvghgtZ0Vp/RbSek1ItaO
	Huq8VE54K1HbMzSfgJ/qk4vTktg7KPqCaeXhHlIBqpyMVIsKqMHjMXcuPGS+ft/T
	80Nr4qrm62gEv7vJ1wWgcbm6pcoegFAPfttgQ+bfSTEtA0b5vB4AgmFNGzLe9Jjp
	2mDgst8VHznkjEYhvASc+FuMU+CJuXELKFptery4MIiY6qnvOy5wsWIYxYIQt8qA
	==
X-ME-Sender: <xms:Q5cuYNHGf4DP6s5Yrk94g87bEt9maVsvZUvIZ5_OSwOa3ygXsvSckA>
    <xme:Q5cuYCWJqVHxc0TBvW8RaM0wSdODYkxfn4yClOKahSKwcF7ZJMIFzdXO9brx_KJON
    wVOak8LO-iBIzeTj3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeggdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q5cuYPL64pGtEXDOIjB2LytBtepgEjTDIlirUSWB4Z_2bk7CHwRyNw>
    <xmx:Q5cuYDGxFYNq90q1Kozd9_sE8xI5mkNSdlmaFJwB_t_-qpDhKS53yA>
    <xmx:Q5cuYDU83mA2iruvPx6pKrkqUS3fSvQrhe9kV_x71Rp0kdmagu5q-g>
    <xmx:RpcuYHmzfxpDFq6rYEjERoNkSWa7GUcR73y9VFLtc6uo7hgIIot_W0suCF8>
Date: Thu, 18 Feb 2021 17:35:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] drm/gem: Move drm_gem_fb_prepare_fb() to GEM atomic
 helpers
Message-ID: <20210218163512.arnmixdkygysxrqk@gilmour>
References: <20210211081636.28311-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qyrmapmaovukaths"
Content-Disposition: inline
In-Reply-To: <20210211081636.28311-1-tzimmermann@suse.de>


--qyrmapmaovukaths
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 11, 2021 at 09:16:36AM +0100, Thomas Zimmermann wrote:
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 6b013154911d..495d174d9989 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -9,9 +9,11 @@ struct drm_framebuffer;
>  struct drm_framebuffer_funcs;
>  struct drm_gem_object;
>  struct drm_mode_fb_cmd2;
> +#if 0
>  struct drm_plane;
>  struct drm_plane_state;
>  struct drm_simple_display_pipe;
> +#endif

That's probably not what you meant?

With that fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--qyrmapmaovukaths
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYC6XQAAKCRDj7w1vZxhR
xeYjAQDBp12JMmHuiBCHQBmWyl9fGbmCMg6R9psxq9edd+0vigD+MjBWZAmh8A1d
2S0DtBQtnfgH07vDxZs1Eb8jJZ+x/QQ=
=WmxA
-----END PGP SIGNATURE-----

--qyrmapmaovukaths--

