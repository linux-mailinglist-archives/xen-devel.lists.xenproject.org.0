Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E3A55697
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 20:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903976.1311897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqGri-0000wH-D4; Thu, 06 Mar 2025 19:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903976.1311897; Thu, 06 Mar 2025 19:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqGri-0000ue-AG; Thu, 06 Mar 2025 19:26:42 +0000
Received: by outflank-mailman (input) for mailman id 903976;
 Thu, 06 Mar 2025 19:26:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MmV8=VZ=gmail.com=thierry.reding@srs-se1.protection.inumbo.net>)
 id 1tqGrh-0000uU-3b
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 19:26:41 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ece81b9c-fac0-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 20:26:38 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so647944f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 11:26:38 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e1d67sm2905872f8f.74.2025.03.06.11.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 11:26:36 -0800 (PST)
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
X-Inumbo-ID: ece81b9c-fac0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741289198; x=1741893998; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
        b=E7VL2nFJix3NQimlXy0NtbIYfr4jwgIpqDs/hyDZxdWOC7kbhMLNSxyILVlHAuGKkw
         jgun6590k3r+EonHdARVQPahkVnA6z4B4fq972EB6Ln0nvegRMdmaouoXEyx3jZglGfg
         Tj2B8VMZ6FmJUPGpj8egVr1domMsr+ewIgoA11+iDF603OwxWrYgcGPBCeOdr3RqkV+u
         u4+YwZpBjIC/TDdkzp8KwfIu1I5Uc7N7fpUoiqH1gcgBtPjjqOscwLQDWUuJIQAUG5Uz
         bwDX8Ytra/SoqLatE0+3tNJqBdABmEd9bw3InhoN5fmtxxpIwTiBjc6SBfvzqXcAOi+2
         m2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741289198; x=1741893998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNcfgkruRbdQ2LTcDlb82l2rtv263h9UvbuoZgmPSdM=;
        b=wBrLc+Upbj+oZpQXp/UcPumPygSWDVwGKqA0QxlIC0gfgG/3/OdXMTgjYYSSayU+F6
         kfm/T+MKKVeJkgd3KKmpQLvDrN5HFCa00tgWEGw0/Ss9cJdE4OHDQAdidWOHGTgrLl4C
         /N3zqNoGvWP2c0C99AVtcd6BoF4mFLjViAWRlFqcfUIwuLKmvEwcb+4RTGlSX7DlZk3a
         IHp+0YQzWGIc4k9TPvS3lg4Z7zfMYpBRZzk/XJxgUoUYUPxraHl78pS/SBrjxdH1aRFQ
         WrbVEFDyv77iVFEPbyPfOiIfx64jkgsb4MPPxm46B/DgNysgDp0InckLmjerNPKZJXBQ
         JIKw==
X-Forwarded-Encrypted: i=1; AJvYcCWGCxiPKICt1r1aqTQl5dTW4H45RYEmANH5eBRMfN4BvVe7quSHkcUFElUSju37xM6FPkt51ZcFpAw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT5T3OA29aayF93W6zO7pWtEPHg/WmSk+wla04fSrfXERTcn+D
	TjlYnXiTVpcwssLKX0eKzS8Vbbs7/XMytAaiJ3+DEC/sBGO5kcEu
X-Gm-Gg: ASbGncutqF/L2Di0DPrk3s31BUGx4VED1l6PDN/cft83o3iqwjJFGjP2GdGXlwwGDye
	KOaQQZNM2vaaSjxkA19icxWqT+uslFD96hwvQhk0UW3WIGLF3dhjAht1Gn9YrhQKDcfQJ4mtBZ2
	98knyJAqkvT9HNKfR23qWSY/J101UbatImn0TRQVaWbt/85Aqwu7OlniTdtoadoUM9a9e7bhkbg
	U5a9jjRWZcxpCYOwD1R8wobJkMaZ6yyITzzw7ftHn2wALkvTWGYd5O0CiFoJSXsUGZ/OOw6XTww
	xGzHYIEXOsIlHbkDsGR/AVFRm5CF4EEDTZFmrJFH+/ClG9b5V5M+gdVUEndnMw3mO9AF4WxcVfy
	UwrLiXFvUeJ/7XhNgTrahvnkh+NkdTCs=
X-Google-Smtp-Source: AGHT+IGse2HrwvQit3ez+Tb+IZmcWPgul6Oz1Of3MncB8IKv5GiNEYehZwUGHa/gmdRGfttFwUyGrw==
X-Received: by 2002:a5d:5f45:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39132da8fecmr291664f8f.48.1741289198054;
        Thu, 06 Mar 2025 11:26:38 -0800 (PST)
Date: Thu, 6 Mar 2025 20:26:33 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <mtsi7lohn4nq75y3mdzk7eomloxvswjn4blsmruutpejhppd5i@wexuiu7yfea3>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-21-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y6cp6aqkj6w24xiu"
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-21-tzimmermann@suse.de>


--y6cp6aqkj6w24xiu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 20/25] drm/tegra: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 03:23:43PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--y6cp6aqkj6w24xiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ9ukACgkQ3SOs138+
s6GThw/9F553EWmmWz8ONopI5pY7Fy+Pu8kzqsU5bhKSKO2aqJ8y4PFOQAzaacO8
2HuvhLXsP6l91B+R49oebJTWnbgcl9ThzcA4njgdKRFc7yZU/EZUEUGdwDkU6qsh
/rkDnM+a+MzIAd3Z31B0Kvb0tUsl4e0UBueDHmjfP554dbtnMr94eIHuqLVRb1/D
LB6ddm8DbZVoDKT9Ji2gLQpW84oFuIzRZPOV8JmPe+wE8Xf6A9sLloqJndErnvHg
B8X2K8PzxkNNJGaZtQMUpiJ+S1oDNZnnKtzt0Wb+b9itJqUgykve29vGBDBImsb5
8JLFlkdPFdKpFsbAvGyHv8b+F2rDVu4Oelg88WWDUSMc9Ut274u5/a2DTUOwF806
DtCADAFUOOcIyDZKfPpeQuWDPeScN3/ANW8iQMlyPaNO5fBKlisFjiF1Bh0gS+vQ
shkKb74wChg/4jgq1+M+I4DPdCQRe0kGIqbNZ4yK71owOjoSE6WIxxEt0UUKxPwh
XZyf8ZF2O9TCPMigN6Qw2AGUhaC3HsAG9KbhOTSeUAsOwohFtYY+3B6Hkb8SQHEM
i05OutqXEhtdSZgBK+HuweZtYWCBfy/BcMeD99Rkg01C+aMZcNPGVLpvGqpryNaB
Ga0hQwFdIjbnMbXxjzyfJfs7GqNyTAJtpiqBO3uDhWH2LxJHZ7M=
=2m1E
-----END PGP SIGNATURE-----

--y6cp6aqkj6w24xiu--

