Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8306A6728A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 12:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918990.1323567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuV2j-0006UM-BV; Tue, 18 Mar 2025 11:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918990.1323567; Tue, 18 Mar 2025 11:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuV2j-0006SE-8Q; Tue, 18 Mar 2025 11:23:33 +0000
Received: by outflank-mailman (input) for mailman id 918990;
 Tue, 18 Mar 2025 11:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPrW=WF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tuV2h-0006Ru-Gj
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 11:23:31 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a268882-03eb-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 12:23:29 +0100 (CET)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfout.phl.internal (Postfix) with ESMTP id C16071382D72;
 Tue, 18 Mar 2025 07:23:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-13.internal (MEProxy); Tue, 18 Mar 2025 07:23:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Mar 2025 07:23:26 -0400 (EDT)
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
X-Inumbo-ID: 6a268882-03eb-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742297007;
	 x=1742383407; bh=7wjlAYUwnPlKalqwevMkrWO1y9pBfAh5VlI6LxosMEw=; b=
	TSbWe8EkYB8gVt8Ov0yHp2N7CN4dLgeJK0UtmFoCV09x85Um5lFhVKR7g/uYAOiB
	T4Milpe2OZiYQYzJmt/Xrkva/edlutJS+4fMevOBruLU5o5ww9D7qwKa1x+sQXqL
	5sD4tCt6KJb2DGxfOrIim/GG9a6Tjxv5XDgFBhw9UdTBO4VN5y++kf7grAR9aE86
	t481QgK0srNEdQkOKl7Uk+Rqj504UA1wV2urqqc4TqADWZzTD2vIp+i9Y6588Mnn
	XFpOsRkbm/V85zmvXzsncfEpgSbKbu7xLerzbawjLavYL9Gc43SHpFc6jImjBHf5
	Wsgz+KVzBYvDH916M/qJ/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742297007; x=1742383407; bh=7wjlAYUwnPlKalqwevMkrWO1y9pBfAh5VlI
	6LxosMEw=; b=D+t1Eie9zvS3v1HlMPVeSS64z5miMn+nlsUGzrOHwhCQx7hV+zP
	tu6PuLqVxoe3pswgSo4vnz3taEkZYwHYkie8dMqawENZ57jZOeI7Xz96sMkDcGNJ
	sRaHATi8B3K08oro9ETa8K1SdJPF9kmvoLhdnwOVbR1xHdZMsfE/W5Ay99S9EY9Q
	/h6zQjunVxaPpgYv9CyAePOv2popmuX1hvuz7raaW7Gz2F/CNJLr1gMJpdPVb7pL
	bC8U4Bxg3Hw840kFzQ02pPRnW2bnXsIaURdOIUoZSz/TkoL3Z6DAxwo6hY3vL6+t
	GSarWfMMGj2/cHa1xaGcEjbKS7a2kabgbjA==
X-ME-Sender: <xms:r1fZZ--bH5qCNcwirwbP3o70TBhsWnp9edXQ9s1ItFxDEKLg_OPV8A>
    <xme:r1fZZ-s62E-kJ5MUO-atClaLa06qSX-KK8ZDqFM38fWF94cBpvcg3Ofgms1YNYM8j
    RRX8WDOSe_qHA>
X-ME-Received: <xmr:r1fZZ0CQBFZI78Jrl8fiH1lHdwDTPGHH7x84k8-A1H65BSn-ckajAzFV7BaRKqP8tSZ2-Q4n1hQjthOrN9y6WYF3e-jIDOOAfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhho
    ghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlh
    eslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhi
    tghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestg
    hithhrihigrdgtohhm
X-ME-Proxy: <xmx:r1fZZ2dXbnlZvlHY21gA-IhxhKi15I40KT6qCFTf-sOx-N5ZPoEqYA>
    <xmx:r1fZZzOFufc5ynbMcOe_zcKHGk6sZHmWCV_qGmS1YeV0HP56_3-JHA>
    <xmx:r1fZZwkllK2440FE4IbySDirLeCqCJNOFWicNOwMfAHvVxDKaINL8Q>
    <xmx:r1fZZ1tsQ2azkoHWQoExMg4jmeG-4CHeHveX_uwgDYJEEsveBpYa-A>
    <xmx:r1fZZ4oLFpK59fM71RqAwgI3r5Bj0LABVw1Ewt6yRfpfg6d80O63Uo5Y>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 18 Mar 2025 12:23:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/msi: always propagate MSI writes when not in active
 system mode
Message-ID: <Z9lXrB-pC5LL1uPN@mail-itl>
References: <20250318082945.52019-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiN+E6HlXMbGwqPo"
Content-Disposition: inline
In-Reply-To: <20250318082945.52019-1-roger.pau@citrix.com>


--YiN+E6HlXMbGwqPo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Mar 2025 12:23:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/msi: always propagate MSI writes when not in active
 system mode

On Tue, Mar 18, 2025 at 09:29:45AM +0100, Roger Pau Monne wrote:
> Relax the limitation on MSI register writes, and only apply it when the
> system is in active state.  For example AMD IOMMU drivers rely on using
> set_msi_affinity() to force an MSI register write on resume from
> suspension.
>=20
> The original patch intention was to reduce the number of MSI register
> writes when the system is in active state.  Leave the other states to
> always perform the writes, as it's safer given the existing code, and it's
> expected to not make a difference performance wise.
>=20
> For such propagation to work even when the IRT index is not updated the M=
SI
> message must be adjusted in all success cases for AMD IOMMU, not just when
> the index has been newly allocated.
>=20
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT=
 index hasn't changed')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/arch/x86/msi.c                       | 9 +++++++++
>  xen/drivers/passthrough/amd/iommu_intr.c | 2 +-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 163ccf874720..8bb3bb18af61 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, str=
uct msi_msg *msg,
>  {
>      entry->msg =3D *msg;
> =20
> +    if ( unlikely(system_state !=3D SYS_STATE_active) )
> +        /*
> +         * Always propagate writes when not in the 'active' state.  The
> +         * optimization to avoid the MSI address and data registers writ=
e is
> +         * only relevant for runtime state, and drivers on resume (at le=
ast)
> +         * rely on set_msi_affinity() to update the hardware state.
> +         */
> +        force =3D true;
> +
>      if ( iommu_intremap !=3D iommu_intremap_off )
>      {
>          int rc;
> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passt=
hrough/amd/iommu_intr.c
> index 9abdc38053d7..08766122b421 100644
> --- a/xen/drivers/passthrough/amd/iommu_intr.c
> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
> @@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
>      rc =3D update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>                                              &msi_desc->remap_index,
>                                              msg, &data);
> -    if ( rc > 0 )
> +    if ( rc >=3D 0 )
>      {
>          for ( i =3D 1; i < nr; ++i )
>              msi_desc[i].remap_index =3D msi_desc->remap_index + i;
> --=20
> 2.48.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YiN+E6HlXMbGwqPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmfZV6wACgkQ24/THMrX
1yyxwwf+IwXgGNJJvhYAl8e0zEHnG3+vG7ZI/aodha8fi7mp5GSo0oiLkpt6xQrL
Ytr+hC3DAo8zhTSKChER0RGYDZyvOv68HYiVf98V9TQsphmVFJeNKSj+OHJpvTPy
7I082IAt87zcUBz5LOg6155y22LTy3aXqyqxd0v0vcP8drWKBit6MX0BgyGzJzoA
yIkApTJ+XYeUZAOtMA7buZ8tHxvFoKQe7VOZrxkbmyIVM+Gltn4BeEr2xV2ImArs
tCoFgNC09sscjvM8h66b+1jOGm+ObwTDsoE8JQhzjQxXVuIZor0o4ENCob54u2lS
6BjZYOa3XibYmYqselOwrcylPTt0xA==
=5qL6
-----END PGP SIGNATURE-----

--YiN+E6HlXMbGwqPo--

