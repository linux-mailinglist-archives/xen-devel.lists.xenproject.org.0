Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42197AF37
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 13:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799911.1209869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqVxG-000682-2r; Tue, 17 Sep 2024 11:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799911.1209869; Tue, 17 Sep 2024 11:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqVxF-000651-Vv; Tue, 17 Sep 2024 11:01:09 +0000
Received: by outflank-mailman (input) for mailman id 799911;
 Tue, 17 Sep 2024 11:01:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wKrr=QP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sqVxD-00064v-Uk
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 11:01:08 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f113c8b-74e4-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 13:01:00 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id DB8D713804C1;
 Tue, 17 Sep 2024 07:00:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 17 Sep 2024 07:00:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Sep 2024 07:00:57 -0400 (EDT)
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
X-Inumbo-ID: 1f113c8b-74e4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726570858;
	 x=1726657258; bh=SarmyXiIUv6PFGG8MnTus0hh6oIm0+MhRRhYTwRRURY=; b=
	pJh9LwR4CrmotjCOgYCc3Vq8FbV/eWVOLoqrTEKXavIm47zsohIzd5l0wQ+k4Gy2
	w/+aGSCfa/liXk8DY8YKIKZzUoMeEXfkWtkAS7675d7iRlk/ZSP+loTyvJwwb1kY
	aKWz6qH3MMTeLSCZT6g2DpsOWHd6/gA9JXnbS58kHx+1grdKdRT39aBGpXDtaFUv
	DB7aHgIADvtssuU/MHfA6I5D5ULEW+XvEq0bbxfwJyyeaNa+jGZsyJ2wtwtYW7Oo
	+VjJlsx1a+KMQkuGi4eoRa5sJ/PiKfkjtrghXXo+q56tYEaWNq1qFvhYNy7pJm4C
	Xqp/jlhdwktARlVfZ4Omag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726570858; x=1726657258; bh=SarmyXiIUv6PFGG8MnTus0hh6oIm
	0+MhRRhYTwRRURY=; b=e51g1f9GzOPd74h0j0C/o5DAaKjFra3gK66iaO1wiNTh
	IU/DGodyV1XmEV+o+eSPNO9+MEgRqPUatX+7f4F0d+Zd2MMmlJAEwxb/VqL+dk9b
	ScjeLJuwfq1K2OYMbZvkdokOPZN4hiUFC6rdDyXAW4KUQfPIdpdFPhit6NRFNKiM
	2EEc34R6W019rwnFV4xjph4X20H8rzv0QZQ6r4pZDuHWCJRW8GMFE//RO1q0DNNw
	+Qe8zPMUrOLEkuqgb/QVId4f6D1UPaRcrk+6+8TQpfjEbxi3zIWZRPBnh+NQU4+q
	71sEOG1OpE207c7y0u7rLgWViJHloW3zLOgmVLX21w==
X-ME-Sender: <xms:amHpZt1-5OBvyJIVR8SWjIwx8JYyl2flFTpeLJt2unlG3vOyYGDaXg>
    <xme:amHpZkGu9uy1ETx2EvYZhTGWqsEj9-I1Q9iqfIFCpVqFSi-9KX8dStliE6w8ncaE7
    zQoilvrNHdRIQ>
X-ME-Received: <xmr:amHpZt7v4n5uBGJHPLNpyDIZk83g0sbAM-NeDvFEI3lZE7lcTFhy7t1nkiQWqCAzu6XperBvotNd-74qCWElEqpovetJc5leQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudekjedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgv
    rhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhes
    rghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhm
X-ME-Proxy: <xmx:amHpZq0BrdOsinAHq84X-O-tNrXT49MKA2mUwGNl_D8NoniOzCn3Xg>
    <xmx:amHpZgHp6l2bEH3iQoiI7xc-CzaoT-OYHyLmPJwbK971WoujF4IMlw>
    <xmx:amHpZr-3Ljb3MsvPQUo273y_769rdvs98UfiltZC_arefwCV7wBkSQ>
    <xmx:amHpZtlnq4OVciqe9r9l8CqJ788FYJ7OaIZ6U6mzORTVgCqxh94K7A>
    <xmx:amHpZsi45owE1oOybvftv2XGnxhIqCne5KLIYoP4YWLPEUmu0ERSWeYc>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 17 Sep 2024 13:00:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 2/2] x86/time: prefer CMOS over EFI_GET_TIME
Message-ID: <ZulhZ60WRcFUfZcb@mail-itl>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2JDYcYslFlZOVXJq"
Content-Disposition: inline
In-Reply-To: <20240913075907.34460-3-roger.pau@citrix.com>


--2JDYcYslFlZOVXJq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Sep 2024 13:00:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v7 2/2] x86/time: prefer CMOS over EFI_GET_TIME

On Fri, Sep 13, 2024 at 09:59:07AM +0200, Roger Pau Monne wrote:
> The EFI_GET_TIME implementation is well known to be broken for many firmw=
are
> implementations, for Xen the result on such implementations are:
>=20
> ----[ Xen-4.19-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
> [...]
> Xen call trace:
>    [<0000000062ccfa70>] R 0000000062ccfa70
>    [<00000000732e9a3f>] S 00000000732e9a3f
>    [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
>    [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
>    [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
>    [<ffff82d040203334>] F __high_start+0x94/0xa0
>=20
> Pagetable walk from 0000000062ccfa70:
>  L4[0x000] =3D 000000207ef1c063 ffffffffffffffff
>  L3[0x001] =3D 000000005d6c0063 ffffffffffffffff
>  L2[0x116] =3D 8000000062c001e3 ffffffffffffffff (PSE)
>=20
> ****************************************
> Panic on CPU 0:
> FATAL PAGE FAULT
> [error_code=3D0011]
> Faulting linear address: 0000000062ccfa70
> ****************************************
>=20
> Swap the preference to default to CMOS first, and EFI later, in an attemp=
t to
> use EFI_GET_TIME as a last resort option only.  Note that Linux for examp=
le
> doesn't allow calling the get_time method, and instead provides a dummy h=
andler
> that unconditionally returns EFI_UNSUPPORTED on x86-64.
>=20
> Such change in the preferences requires some re-arranging of the function
> logic, so that panic messages with workaround suggestions are suitably pr=
inted.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Since this changes behavior for running on EFI,
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes since v2:
>  - Updated to match previous changes.
> ---
>  xen/arch/x86/time.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index e4751684951e..b86e4d58b40c 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1592,14 +1592,14 @@ static void __init probe_wallclock(void)
>          wallclock_source =3D WALLCLOCK_XEN;
>          return;
>      }
> -    if ( efi_enabled(EFI_RS) && efi_get_time() )
> +    if ( cmos_rtc_probe() )
>      {
> -        wallclock_source =3D WALLCLOCK_EFI;
> +        wallclock_source =3D WALLCLOCK_CMOS;
>          return;
>      }
> -    if ( cmos_rtc_probe() )
> +    if ( efi_enabled(EFI_RS) && efi_get_time() )
>      {
> -        wallclock_source =3D WALLCLOCK_CMOS;
> +        wallclock_source =3D WALLCLOCK_EFI;
>          return;
>      }
> =20
> --=20
> 2.46.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2JDYcYslFlZOVXJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmbpYWcACgkQ24/THMrX
1ywbnAf/ZtVRFcoPVWMbEA/V/4s1qR2hX/qCThZ7LF+o97Cdm5zzBVLLV9RA0mTy
0w131Ev4yY5tOHTthuk9JIPDzMqtVVVcekAhmQZ5OgXWooFYPFecYEqPCHJaOUtX
IzCh6IIJ5MgT3M8Feobomp9L8Fjamb3p3LQKE0zZjHHe4/F+EW8i5fSaZutcAvx4
ejHu5VGXaNigKrN5YqxbDQnc7rdRT10BxgXybdeTiRbw84yV73TqPmUyljdSjkxb
N+wPRVt2hRGXnJgrFT76wDUk4Cpb3pARvX6XxS1BGjJ5l2uFXAcx90Ebc6YGmMGj
HDv8CWDHChqdoKPRkgwTPymlfG83rQ==
=RM2c
-----END PGP SIGNATURE-----

--2JDYcYslFlZOVXJq--

