Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95933B15120
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:18:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062870.1428598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn2J-0001sC-Ak; Tue, 29 Jul 2025 16:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062870.1428598; Tue, 29 Jul 2025 16:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn2J-0001qS-7E; Tue, 29 Jul 2025 16:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1062870;
 Tue, 29 Jul 2025 16:18:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FK0b=2K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ugn2H-0001qI-Tt
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:18:41 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af8e1b0d-6c97-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 18:18:39 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9283F7A0120;
 Tue, 29 Jul 2025 12:18:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 29 Jul 2025 12:18:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jul 2025 12:18:37 -0400 (EDT)
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
X-Inumbo-ID: af8e1b0d-6c97-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753805918;
	 x=1753892318; bh=IIZQOsULUYWSENx7wJdtWLoTRMLeSfr1yxOCJI8na+8=; b=
	BinZG0zMo5QowzvO5mKICo+CriF3Cgu2kJQw+pv+4SMpM+SCOJ/67ROQm02y31ga
	zfBTNql0LlNKqTZQ1LvI5NTNg+/yWogM18SjEEAL+jLFmKHxIYg497tQE5i2yU2t
	uTtDBduV2ILkiam6XYteE2J3L84AhCv6f6rn8X+9/4LhUEYReCx9WqG61UWTcDov
	PqJZtl/+SJTUL4uCN7NHCPu4A1OZ9k2EQRJsfxCANvEkllm3s4+8+5NAu+ly11k9
	w83ALTUFkp101/TMPL+36umR9Ilw3A/3/SHQt8JXk4EeMcimKZVJ6i8WRhgmmIBP
	U2y248pen94nM93dCUpHFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1753805918; x=1753892318; bh=IIZQOsULUYWSENx7wJdtWLoTRMLeSfr1yxO
	CJI8na+8=; b=XC4trNUD8bVCK98ywnw+TuPox7JjwNJqFBLwHAeM5qkxyMUHzHV
	hYL+72SZlK/7tsRc9M7NFX78zHTQU1RmD9Wn+FLS9NGCKJjgFXT1BbrRFTxdH4+m
	HOlPyeXmuiKLrXv14/s1O5eAu1/dUVBfiCYdd7PVkY18PAer6TgLxBeJnK6Mhb6r
	LdkTY/FzHxMcXOWzJxRY6dvXW7NGX2CQUGLHERLDhsKBAZh7aC41lzxIFCfPlFp+
	sKotxoxrR7PNPwPtz++vomL4LmJGFl1KvnthZH8uHm/cYG/FN9M0Op4IFT/SQo0X
	b7YC91Ga8x5ti3rdMfxhtkdoAC72aVDBhiQ==
X-ME-Sender: <xms:XvSIaGWO4LNLg6gpv2rm-pz1MOXlXsTbaXyJeQs1lP4_RZDTa47ehA>
    <xme:XvSIaLC5anqcIJeLIKbgkj84zh0QYvdQz4yCdCySKj145lIjBrnXLsei7zq87YXgG
    ibCTMyesHzzXw>
X-ME-Received: <xmr:XvSIaK2fcrSo6l_oxwXtshFKiguhryk8I1_6jjK4OVIOwQB4CCo82oErz19LI3rwcbPQDvXbPDzwwj_NXN4IWpO55fZbuVGcqok>
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
X-ME-Proxy: <xmx:XvSIaN05NXDglrtXXLiyxU-BJUo38M3G4u3XDWs16W-vWEEMT3cQLg>
    <xmx:XvSIaPBPkiWXX23tc4YU3n_P5wFdVCc98MSF2bujSaw13XzLtwRfeg>
    <xmx:XvSIaM4fZlITbSuL65IvrBU19eV04xlK0aXRBFCL_F64OdRl-KdDYQ>
    <xmx:XvSIaAKjxMrn1o9lPxSWqIgI9O1VNk2rpLmQzkmqTIDYv5Q0X5KOXg>
    <xmx:XvSIaE1kNZgnPmpf9stFqwKY4cNOS9Rx76PWzIxk1Yfz9nM-lsLC_cLv>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 29 Jul 2025 18:18:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/3] x86/EFI: Explain buildid.ihex
Message-ID: <aIj0Wx5IiXuvTz1y@mail-itl>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I9QyCjuUpy7PJ0Sk"
Content-Disposition: inline
In-Reply-To: <20250605111638.2869914-3-andrew.cooper3@citrix.com>


--I9QyCjuUpy7PJ0Sk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Jul 2025 18:18:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 2/3] x86/EFI: Explain buildid.ihex

On Thu, Jun 05, 2025 at 12:16:37PM +0100, Andrew Cooper wrote:
> This is an awful lot of magic to only be explained in a commit message.
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
>  xen/arch/x86/efi/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> index c6678652fc98..3e88f552d20b 100644
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -6,6 +6,8 @@ cmd_objcopy_o_ihex =3D $(OBJCOPY) -I ihex -O binary $< $@
>  $(obj)/%.o: $(src)/%.ihex FORCE
>  	$(call if_changed,objcopy_o_ihex)
> =20
> +# buildid.ihex is an empty COFF object.  It exists for the side effect i=
t has
> +# when linking into xen.efi, causing --build-id to attach a .buildid sec=
tion.
>  $(obj)/boot.init.o: $(obj)/buildid.o
> =20
>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=
=3D4)
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--I9QyCjuUpy7PJ0Sk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiI9FsACgkQ24/THMrX
1yzlFQf7BeUZnZf+EeoilWotQ/aR5GXOEAs5z/xyrbqkdtE+ykDPC/gMy7XC7eQq
QypOxFhfjaN08aYS1jD5+F/oUOc+WQQ73A9iIESbYuuyweuXyXu6XuEOemj9//Ey
KFJzPBbZW+vToHRWqjWbt2xhRhyyf8LBOWbBhqR7NyYCh63WyKfDi+ZxdPqXgymi
3KlvQyoU/Zk3EWOqksOzMvNwO3GQY8Igo4w0qdCKSqx5YcdjpW9vJ6E33y3Jzbto
PwWTyAqEID+tLh3KvSqUZjl0cdwAV2TNzdTDJVDEveee9uWoTgbeR1wMhr0U4yqd
lFZXGgEWKGrD4CL72cbjd1N8MoZbHA==
=dur9
-----END PGP SIGNATURE-----

--I9QyCjuUpy7PJ0Sk--

