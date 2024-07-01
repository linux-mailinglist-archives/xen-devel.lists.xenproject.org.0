Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322391E1E3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 16:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751706.1159734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHiR-0005Cu-WE; Mon, 01 Jul 2024 14:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751706.1159734; Mon, 01 Jul 2024 14:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHiR-0005AS-Sw; Mon, 01 Jul 2024 14:09:11 +0000
Received: by outflank-mailman (input) for mailman id 751706;
 Mon, 01 Jul 2024 14:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDGj=OB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sOHiQ-0005AM-Ss
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 14:09:11 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b655ef9-37b3-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 16:09:08 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 71C791380114;
 Mon,  1 Jul 2024 10:09:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 01 Jul 2024 10:09:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jul 2024 10:09:05 -0400 (EDT)
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
X-Inumbo-ID: 7b655ef9-37b3-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1719842947;
	 x=1719929347; bh=ruUcI0SUdJIg/bv1IEy2C83ssbLeKuWaDkVkPwjnlUs=; b=
	kTI9tRROY9pna3IZcQIYArNTyzPtQzuDC1xkqfGc1WcHPBMBwvLQsHUF28XP/V2L
	fjnMl+kKsSj8dJOc58lBkoUIdt6Ybaz4cQlwV00s1i8CWt+FzS+iogKVuElvErRr
	O+MJQ1PhDpaqF36GHFvge/aLQVHkcq8qLQgHV7C8+TvUcz3YCTB9sHHk2qp39sZI
	TuR02OMWxvCW7bzifawMedSePrv7qeq09ORU/F1y+H1Hyrd9tMKuuKdAYzVAO1Ov
	WHR1tDtkaTJ8b4y3wm7DPuQzWyZjxyc4EsoLRXdpcC/pe8x76DTMvUcg8n5zIJIt
	n4DYrck4L8fRPl2By1x3DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719842947; x=1719929347; bh=ruUcI0SUdJIg/bv1IEy2C83ssbLe
	KuWaDkVkPwjnlUs=; b=bZq3Jy7V8oS1+ERm8oIaaY7fo5l1+CngGNaGi8XWl5mJ
	fTkIEIWWcrdjOanfVSUQbYZv4ElBFVuv4jlX0eQNpLAFNdfiM8g2TTmF50YHxMny
	/P4aCLMflueWCMrYnWxDwy1g9utDnGa9wGjwiO3VhGaVHU+Vf1NV/QBxQ2FrTe04
	hnETpK5TLz8cCBrqFHG1B/lM+HD+j8oEqSxjCW4Q5chRV7A1pe1j05wpmGC65W2c
	dWKb+8tI3zJhqm2E7rqeTeerqtj07oWWcPgg9aN/DbADXslWVaGRejZB4jv5+Jps
	kvepo4GCXmHDigYuoxsNRoa2UgrkqG0D1xrgSp2ydw==
X-ME-Sender: <xms:griCZo20l__j8A8f4OIJwoXpyQrMzXazJRjvuIZVpI6Lw8DWxG_xzQ>
    <xme:griCZjGqwB8jsl6clnbd3EnJYe4tJaU-c6DYXg7ieoqM9cP2q68eb6vvtYrgTNAlJ
    JcFJ-VdlDntUA>
X-ME-Received: <xmr:griCZg7VfPhy6INTn0I7tZtwpTcbQE_GT9Tw6boimKriO3e1CYJ_5mxHLs3XYTHOmFlpbtjMMeOp-1g69FYp6oVWjhUrUOx-hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:griCZh23XMZMaaSRNIe6yzEcgx9s0kUR-EtyG8du7d4KWKl_7OR01w>
    <xmx:griCZrHJ_fLS5raAKOLylCXbLKpojqLvzbNXSe7guWoMhXUXmRGYbw>
    <xmx:griCZq-CVmcI6oBK1t11DhN-kcIhKHLXVF8Lw8F8Qj-liAReT9IgDA>
    <xmx:griCZglwMGdJBU3dgx8uKLmiIeuexGO9WX_fPMDQaFf0r_2M9xyD_A>
    <xmx:g7iCZhYdYxMYqyCEVnSJUyL3tlMG65FlBXuKngdUIvfJvJ3ZiZod3Ypm>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 1 Jul 2024 16:09:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 06/17] x86/EFI: address violations of MISRA C:2012
 Directive 4.10
Message-ID: <ZoK4f8wUdusqW_fA@mail-itl>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <0267af93ae969b67a77c3a9aca9f4ad6525de1b9.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jpi0/n/DkIAqI9zs"
Content-Disposition: inline
In-Reply-To: <0267af93ae969b67a77c3a9aca9f4ad6525de1b9.1719829101.git.alessandro.zucchelli@bugseng.com>


--Jpi0/n/DkIAqI9zs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Jul 2024 16:09:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 06/17] x86/EFI: address violations of MISRA C:2012
 Directive 4.10

On Mon, Jul 01, 2024 at 03:36:01PM +0200, Alessandro Zucchelli wrote:
> From: Simone Ballarin <simone.ballarin@bugseng.com>
>=20
> Add inclusion guard to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
>=20
> Mechanical change.
>=20
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>=20
> ---
> Changes in v4:
> - Modified inclusion guard.
> Changes in v3:
> - remove trailing underscores
> - change inclusion guard name to adhere to the new standard
> Changes in v2:
> - remove changes in "xen/arch/x86/efi/efi-boot.h"
>=20
> Note:
> Changes in efi-boot.h have been removed since the file is
> intenteded to be included by common/efi/boot.c only. This motivation
> is not enough to raise a deviation record, so the violation is
> still present.

I'm confused by this comment. It says changes in efi-boot.h have been
removed, yet the patch does include them.

> ---
>  xen/arch/x86/efi/efi-boot.h | 7 +++++++
>  xen/arch/x86/efi/runtime.h  | 5 +++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index f282358435..c6be744f2b 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -3,6 +3,11 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +
> +#ifndef X86_EFI_EFI_BOOT_H
> +#define X86_EFI_EFI_BOOT_H
> +
> +
>  #include <xen/vga.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
> @@ -912,6 +917,8 @@ void asmlinkage __init efi_multiboot2(EFI_HANDLE Imag=
eHandle,
>      efi_exit_boot(ImageHandle, SystemTable);
>  }
> =20
> +#endif /* X86_EFI_EFI_BOOT_H */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
> index 77866c5f21..88ab5651e9 100644
> --- a/xen/arch/x86/efi/runtime.h
> +++ b/xen/arch/x86/efi/runtime.h
> @@ -1,3 +1,6 @@
> +#ifndef X86_EFI_RUNTIME_H
> +#define X86_EFI_RUNTIME_H
> +
>  #include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <asm/atomic.h>
> @@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgent=
ry_t l4e)
>      }
>  }
>  #endif
> +
> +#endif /* X86_EFI_RUNTIME_H */
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Jpi0/n/DkIAqI9zs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaCuH8ACgkQ24/THMrX
1yyGQwf/bwmHJM+skKaasqaSPSJwVr/HNjgt1MMLykdqYPSWvgdpav8vZ5qD+nUZ
rdFMxdPRzi5aMRkDU4VmgtnD1wBb35v5vQjEcBzEfqGMF74pa0H5loli2Hpx04tU
3NPuHO+XijQuZzT+BWblQTOl8nTRjqVBDbRoNY2do4nTLluuspq4jpy4Sf1KIsRD
L/KyA3zmejdM9c83O1OnB6Un1DEu26XDBeZ/ngZ5cPunda0vGxKRBehaaRgRUv/P
H0jZ2jPvWOkjTi0WzGtnzBDy0SoNU9/h/jIcNgmN1CY+nC0X9JSjiFaFAfSnXFKp
u4oBlX9Kyt4qMa50SOGOvzKX/uw9zw==
=Qf7P
-----END PGP SIGNATURE-----

--Jpi0/n/DkIAqI9zs--

