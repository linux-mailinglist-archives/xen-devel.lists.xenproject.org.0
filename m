Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C90D88D4D5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 03:57:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698295.1089818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJTr-0002d3-E2; Wed, 27 Mar 2024 02:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698295.1089818; Wed, 27 Mar 2024 02:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpJTr-0002a0-BJ; Wed, 27 Mar 2024 02:57:35 +0000
Received: by outflank-mailman (input) for mailman id 698295;
 Wed, 27 Mar 2024 02:57:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klda=LB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rpJTq-0002Zs-BR
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 02:57:34 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1a81304-ebe5-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 03:57:33 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 43DC413800E8;
 Tue, 26 Mar 2024 22:57:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 26 Mar 2024 22:57:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 22:57:30 -0400 (EDT)
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
X-Inumbo-ID: c1a81304-ebe5-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1711508252;
	 x=1711594652; bh=wfnlGUJ0PBfBfvaHMqLjqgg0lOPYtgwaj/UjhR9komE=; b=
	hNR1e2rivoHaavJBjpZnQr/q7bYcGa7TShVAu2s7WpEQM66JRYgVW2K7QUSHzaJj
	hnItgtzrWyG8uzs3oTSlbKiXcvAj6C7CQpk2ksBYzxaj9JZX4W/UkFILxjXYcjMi
	6Fg3Ghc32lRZ81Yz43bf2+TWJizmJ/eDnVWE1k32pbfjoCnnMW2E4mvnrwU2uZAR
	MoeYt+UYVHX9oxOBX59lcuUpFTUHveFJQ3sFP1PKX7gUxzL3DBns3PU6dYR4oeye
	Lwf0nDe4aCO/FDpmTwSiknQP6c7MsZG7hYAtueBQ8XjNg4LzFqzIuAdIVK/7t9+a
	omSYhAoeXLGua7Po3ATbYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711508252; x=1711594652; bh=wfnlGUJ0PBfBfvaHMqLjqgg0lOPY
	tgwaj/UjhR9komE=; b=P23ruSVJ2hYFxa/BAEzHxIGMGLLwD8lt9niTeI+EluQb
	CQiKKMPVo+FncBGhIc+UcJ3RO/XErZWHYOF0r7B9D8+Ivckc2o/reJMnsCos1BM6
	Mach0UKrdex1NBuACq8zZqpQoQnztEk9Be2klViEp7brElOl4QvTGIjSK/jcJTvt
	LrnFF0KMttjHdmn3fY5sIlV7J3uku9ti9q6FPLsuRHhAoBQ0MeiJixbbf3X8g1j5
	eICRXxwkSXslUJAtm3IzY8zv6vunVFuIVtuCCWIG4+rQxZd4HYCV6sH5VhDb4dUV
	PseZPhUSW96bIEOu8rCkz2Jv1VMw8K6eqAji+peirg==
X-ME-Sender: <xms:HIsDZqg1XTkpOC14GD5ZEhD6O9WVhzzA0ndZoOb175Y5S3-2hr4xMA>
    <xme:HIsDZrDkupkGwyPNGF5hC3behLbsjrs_Z_AoaEl-ZnFrbFBGu7R8t74glnIuBB-gT
    PUTj_IAbS-BKg>
X-ME-Received: <xmr:HIsDZiHXqcfdnfeeNfCdpqfjYcMGXRK0BR-CJBONQWYJrgKP_nc4i9jBvd8EVNKi41CsUek1X2oAP6CnoeKXmFz7H_s1OSjzxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddugedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:HIsDZjSr588ezEdpy83yPJ5ujr44O0-U1S2_0IeMazblKvxuCN0ZgQ>
    <xmx:HIsDZnxhqNGsKHmNbKGRx1XOOMNiftlTzeh_JXSXsMx5bLGMPpjV4w>
    <xmx:HIsDZh6GfXOXj8sPZJ3_aakMZOmRa76a31Z4grzMAeLjFkmFAHggzw>
    <xmx:HIsDZkygNg2C90ROlXr04sI5ojlPt9iMfya9DHuEXiyYVHGmQNrMgQ>
    <xmx:HIsDZvcAzsk3_5myHcnfM2XiC0lZSCpHWNAO8KauSHOK-juxRQyXxw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 27 Mar 2024 03:57:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] IOMMU: store name for extra reserved device memory
Message-ID: <ZgOLGAMP26EAiD5-@mail-itl>
References: <20240327025454.514521-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v8NolazHSRHhgtQS"
Content-Disposition: inline
In-Reply-To: <20240327025454.514521-1-marmarek@invisiblethingslab.com>


--v8NolazHSRHhgtQS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Mar 2024 03:57:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/2] IOMMU: store name for extra reserved device memory

On Wed, Mar 27, 2024 at 03:53:10AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> It will be useful for error reporting in a subsequent patch.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

This one is already applied, sorry for re-send.

> ---
> New in v2
> ---
>  xen/drivers/char/xhci-dbc.c     | 3 ++-
>  xen/drivers/passthrough/iommu.c | 5 ++++-
>  xen/include/xen/iommu.h         | 3 ++-
>  3 files changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
> index 3bf389be7d0b..8e2037f1a5f7 100644
> --- a/xen/drivers/char/xhci-dbc.c
> +++ b/xen/drivers/char/xhci-dbc.c
> @@ -1421,7 +1421,8 @@ void __init xhci_dbc_uart_init(void)
>          iommu_add_extra_reserved_device_memory(
>                  PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
>                  PFN_UP(sizeof(dbc_dma_bufs)),
> -                uart->dbc.sbdf);
> +                uart->dbc.sbdf,
> +                "XHCI console");
>          serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);
>      }
>  }
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/io=
mmu.c
> index 996c31be1284..03587c0cd680 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -682,6 +682,7 @@ struct extra_reserved_range {
>      unsigned long start;
>      unsigned long nr;
>      pci_sbdf_t sbdf;
> +    const char *name;
>  };
>  static unsigned int __initdata nr_extra_reserved_ranges;
>  static struct extra_reserved_range __initdata
> @@ -689,7 +690,8 @@ static struct extra_reserved_range __initdata
> =20
>  int __init iommu_add_extra_reserved_device_memory(unsigned long start,
>                                                    unsigned long nr,
> -                                                  pci_sbdf_t sbdf)
> +                                                  pci_sbdf_t sbdf,
> +                                                  const char *name)
>  {
>      unsigned int idx;
> =20
> @@ -700,6 +702,7 @@ int __init iommu_add_extra_reserved_device_memory(uns=
igned long start,
>      extra_reserved_ranges[idx].start =3D start;
>      extra_reserved_ranges[idx].nr =3D nr;
>      extra_reserved_ranges[idx].sbdf =3D sbdf;
> +    extra_reserved_ranges[idx].name =3D name;
> =20
>      return 0;
>  }
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 9621459c63ee..b7829dff4588 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -329,7 +329,8 @@ struct iommu_ops {
>   */
>  extern int iommu_add_extra_reserved_device_memory(unsigned long start,
>                                                    unsigned long nr,
> -                                                  pci_sbdf_t sbdf);
> +                                                  pci_sbdf_t sbdf,
> +                                                  const char *name);
>  /*
>   * To be called by specific IOMMU driver during initialization,
>   * to fetch ranges registered with iommu_add_extra_reserved_device_memor=
y().
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--v8NolazHSRHhgtQS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYDixgACgkQ24/THMrX
1yxn1ggAhHmSiOVbErVsjrtLSxL6YMCr/2cB9EV7ru/8UXSEi5ysQbo3ATvxCNdX
/p9mz64eMGXGXQTAxrqWTBK6V0kX9ssvsOihSAF4UbtVbF/ESskIN2ThRtj5tMyQ
OMc6nQPWfarPYaa4klwiAsmYC3IDeV1lza1mlwlkPvPhpasWzkkskim8hgTSbXPr
zB5nzQ8vK14nGjvaYTpGz016xF0/aO3d9+92l/XWnvGDSmDtuFv85mhRO/lFmA0X
1bGCnVMAeWbk8S8SuO/MSVlv8j8C/b420uiwL9JNKQYaFPW2aX0X7RszS3i82Zqq
bwpYSV7mIdLAW95zlXvm7ljQY3fdRw==
=1MrU
-----END PGP SIGNATURE-----

--v8NolazHSRHhgtQS--

