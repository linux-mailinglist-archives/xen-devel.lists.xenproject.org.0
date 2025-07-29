Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE6B15128
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062877.1428607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn2q-0002M7-IB; Tue, 29 Jul 2025 16:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062877.1428607; Tue, 29 Jul 2025 16:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn2q-0002Jj-Ez; Tue, 29 Jul 2025 16:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1062877;
 Tue, 29 Jul 2025 16:19:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FK0b=2K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ugn2p-00028c-DE
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:19:15 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4369fe3-6c97-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 18:19:14 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 3501B1D004A6;
 Tue, 29 Jul 2025 12:19:13 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Tue, 29 Jul 2025 12:19:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jul 2025 12:19:11 -0400 (EDT)
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
X-Inumbo-ID: c4369fe3-6c97-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753805953;
	 x=1753892353; bh=+6GQ4IQIp5YDwXyN+voN7wavFuW+9OjR0jA4yeRy/nk=; b=
	mwlQ3JsZHtM00fF43ecYA1Gw8h7OytGtEWu7yZZW80Qt0Bm4KWab8mj9uwc8Nk23
	zsHG6cTc2HGbLJK1YuuNTq2zZPTnAHIXhG+5QYST5FgeF4vxz+dyeG3Sg4LPmi2y
	cAxgIYOw0UuV6kiHRcPMADCGnvSpcBIcreiwsmrVFINjxxCuGH54g7NACDbdq4Qy
	E26ypNGoWyO2I6BZDLtXi8MNsjciNHJa7dIPIpdMHs+izaprVYEIrdnCZgRszKXy
	8FAZ/z//RPmRiFbCylnE1U6MxDbeFgmQsQY9yPdfknZ4b4M0jMq4rneI9iK1ULFM
	XSx/hh7KxHHn3kurOs4xSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1753805953; x=1753892353; bh=+6GQ4IQIp5YDwXyN+voN7wavFuW+9OjR0jA
	4yeRy/nk=; b=YOFiXn0V82H23GeLGAp8TaD9s0xPdGxhjy3YqtWS3w7Rp0LS+em
	dzfvY/xgJIlK8cEmSdZUcX0RVgbgDWGWzcGQ0Hy+luNnoYmCYUD/ACmgBKtfdz4E
	ekEaMug0tJds00Y8cIpDuPkiVwrGM2t7hRHIN4BE3kJsATpEMl0/YCBtxKRvjXdc
	bWadUviiG6nKHQ4aI3XzJuVj7UIfAaNT5amtctX49tggxu5Of8NJQ0d7nA4Vs+3x
	fo6ZkBaAzAOvlfoYQV6fQ1ihkOYAH44b4AmXDDqk+qF0PpCxPjG5v4gYAgbeAv/p
	o6gEU7Nc98MHJb1A1/htC1Sa/ebTLYB0qXg==
X-ME-Sender: <xms:gPSIaKe6ROFpe-TiUEkJN3BtrLhipQZC2A-8EOfH7c65667Q7xMCaA>
    <xme:gPSIaMrdrNbPBK6kjdEzOV9itz7XDGofO-SuJBme0mdOHNifvIDsli4IeRW3cxBgW
    wgIvOVWZg2NzA>
X-ME-Received: <xmr:gPSIaL9aAz0IrkwUtAXDrlcIl61hs_i5jsPLARk2NvGVRrFOOmjayIawU5cnVbbCMYAU_fdQTxiuQ-WQZxYc_JODJE1dy6oWYQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelheehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtth
    hopehrohhsshdrlhgrghgvrhifrghllhestghithhrihigrdgtohhmpdhrtghpthhtohep
    ughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:gPSIaIcMf66sCJ4NpZ5HBkzAzQwnTLNVVTp63RVcfQh5vHADN64PbQ>
    <xmx:gPSIaFK-_Z4oWtkcMlj0xT_6IUeHovG7Fun1bNMNR5mAtTyU_oqL0Q>
    <xmx:gPSIaIgrqEgID79muS-dB09ic8kYumrLa5CVclrkuUXDmNOXRSwACQ>
    <xmx:gPSIaDS95BZALurLqUdTq3smGwmUPFWCkQQMN84g0MPthK3yQLHTRg>
    <xmx:gfSIaK_dNGR-HIaDuWcxgyhbIifByAr9_cESW54kx5sqeGObjrU7U1KD>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 29 Jul 2025 18:19:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 3/3] xen/EFI: Drop __ASSEMBLY__ ifdefary in efi.h
Message-ID: <aIj0ftNw3C8zIvSX@mail-itl>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UXFhBSgS3C3ssOP/"
Content-Disposition: inline
In-Reply-To: <20250605111638.2869914-4-andrew.cooper3@citrix.com>


--UXFhBSgS3C3ssOP/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Jul 2025 18:19:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 3/3] xen/EFI: Drop __ASSEMBLY__ ifdefary in efi.h

On Thu, Jun 05, 2025 at 12:16:38PM +0100, Andrew Cooper wrote:
> There's already C outside of the ifdefary, proving that it's not included=
 in
> any assembly files.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/include/xen/efi.h | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
> index 160804e29444..623ed2ccdf31 100644
> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -1,9 +1,7 @@
>  #ifndef __XEN_EFI_H__
>  #define __XEN_EFI_H__
> =20
> -#ifndef __ASSEMBLY__
>  #include <xen/types.h>
> -#endif
> =20
>  #define EFI_INVALID_TABLE_ADDR (~0UL)
> =20
> @@ -23,8 +21,6 @@ struct efi {
> =20
>  extern struct efi efi;
> =20
> -#ifndef __ASSEMBLY__
> -
>  union xenpf_efi_info;
>  union compat_pf_efi_info;
> =20
> @@ -53,6 +49,4 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op);
>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *info);
>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *op);
> =20
> -#endif /* !__ASSEMBLY__ */
> -
>  #endif /* __XEN_EFI_H__ */
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UXFhBSgS3C3ssOP/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiI9H4ACgkQ24/THMrX
1yzG4gf9HsLckyxX0j4D8ppseM+jbn7vRi62u+z+4AkUyXwSj6h9m9UPBHVjp7FT
ULyN756Rp1m4bshkrRFD48vGZ3hFQ4iuBkvdN3KSvctDCIfvWETLbMrjgP8UcQ2n
5WLsq/56cVkuNnLcq0sVV4g+2TwIqTYD+WGGJ+Hh+nGtHuLF23i63Gl4CSCxHz8U
uX9Tve4L4Ey5N7kRg6t1OrIaUk/WmsuGmBUJIuhQqMZk/+LkDqG1bLmAyJdfY+F5
jD00G2DPgGqO/3F/yEOcBFGhvipeTPCu9QkJ0dplipYdRFpzI/4/rY2LvmHu4Li3
y6ho3iRU+fLNcAzNWaq+1ml2gGUeLQ==
=8D8x
-----END PGP SIGNATURE-----

--UXFhBSgS3C3ssOP/--

