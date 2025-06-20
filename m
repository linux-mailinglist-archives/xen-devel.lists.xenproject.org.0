Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C09EAE237E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 22:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021227.1397245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSiFd-0002Om-6c; Fri, 20 Jun 2025 20:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021227.1397245; Fri, 20 Jun 2025 20:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSiFd-0002M4-3w; Fri, 20 Jun 2025 20:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1021227;
 Fri, 20 Jun 2025 20:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jY+Z=ZD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uSiFb-0002Ly-Jr
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 20:22:15 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fd161e1-4e14-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 22:22:13 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id C5B65114016B;
 Fri, 20 Jun 2025 16:22:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Fri, 20 Jun 2025 16:22:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jun 2025 16:22:10 -0400 (EDT)
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
X-Inumbo-ID: 3fd161e1-4e14-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750450931;
	 x=1750537331; bh=O+zynp0pdZUX2uRkaZCP/6YKtinfqYmyWggqGO1iuis=; b=
	DHfYHHKeMfe/J4u1Tnn6FP2PSe4ytCD86gBQb7iWY1nWG3Zr/gs6K++GMQDsTVUQ
	WnX+Kq39oO5mKA7Gbcl/hrxpCOFJG8AKWl9SrV+7WsIqK4SkLpxRJUWofHK2yKHw
	o1TC2nWDPgWgEbqunnCnWlYZL4dWP28sf8HFvdzPbD7hRxg2B4Stf2iJI+cBkMvx
	EyIK48CkE3iCIMPlqAMbxNE5CFJcq+E4qEoNOH7qmaVNxNb79N3EX1lrzDCQBY0Q
	YZTHvtbzL6h2tACpfdbdB5pwzDvyvo8KLqN/P6TE/afHKAZzXe5cNfhyhj+4oKGF
	v3HBcJw3e99woVlbd4e7Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750450931; x=1750537331; bh=O+zynp0pdZUX2uRkaZCP/6YKtinfqYmyWgg
	qGO1iuis=; b=UcrnEppZefpoZxROW/1N+pkCItAE9tZS/dw8rnheMLS9NygD/Zn
	xljlMXrOdqb0VouYpxtoPrwlT3Ub3NPdXqAkhu7Ofp60B1Yh0um+pCl6b64jHdyJ
	m46PWM0zoLg6XgVENGw8aqpEXTDKuO/0J994nED0jR2kJeT5yS+Uj69mY1OQpJb5
	9Qo6IwvqrY5zECSR8XQK1ZKZqNSTytpkDEySMe39ggQbv6004LUv5rrmy35S90jP
	rBJK0bvLnLtC1oyaFx2Dd5//Q6/4qf1Bn92LrArIOkTqJF2Kc2Y48Bqft+SAWN4G
	JSC5/w1ucW84iBSzLpWVIbDp3j+oWb56aJg==
X-ME-Sender: <xms:8sJVaOnHGi8Sib7hkYmfRrMWga4NmSGGXLfqE3qrkwxpJSQP6MlqmQ>
    <xme:8sJVaF2QxL4302M-EuRq0VT_u45_xc1M-XsZQx376mwxEqrBX8mmkOaXdVOZL0sK3
    6o_iZls5FDHqg>
X-ME-Received: <xmr:8sJVaMpdgYZiF9UrLtMCbLuxS6QRSymsig-_CR3ZRAwu4TAiGE7JzbNfqObvTVgRXetQpbTl0YK4JajST4p9nSttZ9E-o3uC8ts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdelfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghl
    ohhuugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnph
    hrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshho
    lhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtoh
    hm
X-ME-Proxy: <xmx:8sJVaCnXc2bGF8rF-dvEHvUMwn2jPtvdDuJo_TWAGjFvEcnDj-R4bQ>
    <xmx:8sJVaM02sdaRw9k2QBIYcuuJJTq8oqXk_xgFyMYGndxSMY44bshZWg>
    <xmx:8sJVaJsfk2wdKaSeN9TBD37HHJ4mz4d4avqs_Y7zHPpKXDuSfvdsiQ>
    <xmx:8sJVaIVIi2jlE37ej_g1cbJ578B6H0mjWRH7qJj41Hyx0Dpk4KU4NA>
    <xmx:88JVaPBVn56PopJsAtYSKDhTmrlU6DYOdai5rXFOP5loqAV1e0ZZ-Sv0>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 Jun 2025 22:22:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/efi: Do not check kernel signature if it was
 embedded
Message-ID: <aFXC8MO-N8P27RcD@mail-itl>
References: <20250620082607.46568-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bUNgetm3bXjgP54g"
Content-Disposition: inline
In-Reply-To: <20250620082607.46568-1-frediano.ziglio@cloud.com>


--bUNgetm3bXjgP54g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Jun 2025 22:22:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/efi: Do not check kernel signature if it was
 embedded

On Fri, Jun 20, 2025 at 09:26:05AM +0100, Frediano Ziglio wrote:
> Using UKI it's possible to embed Linux kernel into xen.efi file.
> In this case the signature for Secure Boot is applied to the
> whole xen.efi, including the kernel.
> So checking for specific signature for the kernel is not
> needed.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> Changes since v1:
> - updated commit message and code comment;
> - renamed kernel_was_verified to kernel_verified.
> ---
>  xen/common/efi/boot.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e39fbc3529..fb3b120982 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1291,6 +1291,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>      bool base_video =3D false;
>      const char *option_str;
>      bool use_cfg_file;
> +    bool kernel_verified =3D false;
>      int dt_modules_found;
> =20
>      __set_bit(EFI_BOOT, &efi_flags);
> @@ -1461,6 +1462,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE I=
mageHandle,
>              read_file(dir_handle, s2w(&name), &kernel, option_str);
>              efi_bs->FreePool(name.w);
>          }
> +        else
> +        {
> +            /* Kernel was embedded so Xen signature includes it. */
> +            kernel_verified =3D true;
> +        }
> =20
>          if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
>          {
> @@ -1534,6 +1540,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>       * verify it.
>       */
>      if ( kernel.ptr &&
> +         !kernel_verified &&
>           !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
>                                             (void **)&shim_lock)) &&
>           (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D EF=
I_SUCCESS )
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bUNgetm3bXjgP54g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhVwvAACgkQ24/THMrX
1yz7Zgf/Va3Xk12l+3h+nMERVgB4qCa+oTuIHSqOZUYz3oBrQf7ObEtM54Y1JnQL
EutXpWZb5VXrL5x1/BOuavnIE10gqMbH2YXcYUabXRVR5kfwP0Y3Cx75jGZ8D5GL
9EVHT+CV78QZsE0+gFQnZFo/Gq4+Kot8uBhQIH2FFR3RHwm0FfYS81ix9jyNhiYX
flXljPLOyErAKDOhp4uw0/LzCDkj4pc9jgyHtP8MA9ewb9467owy17V+PDqgjg4C
/XAMYdUBfl/Y/0oEBHnQFFvcCghTeLNb68fUhUCKTn7uxArsmDO/xCwV362xOonN
PvA9YX3PgdjbyOsbCu9H7yjs1Ekkbw==
=YZF8
-----END PGP SIGNATURE-----

--bUNgetm3bXjgP54g--

