Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35209400E0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 00:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767167.1177756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYXr-00020e-J6; Mon, 29 Jul 2024 22:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767167.1177756; Mon, 29 Jul 2024 22:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYYXr-0001yP-GJ; Mon, 29 Jul 2024 22:08:43 +0000
Received: by outflank-mailman (input) for mailman id 767167;
 Mon, 29 Jul 2024 22:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lS6U=O5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sYYXp-0001y3-CX
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 22:08:41 +0000
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bd2459a-4df7-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 00:08:39 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 52D3E11401A0;
 Mon, 29 Jul 2024 18:08:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 29 Jul 2024 18:08:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Jul 2024 18:08:35 -0400 (EDT)
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
X-Inumbo-ID: 1bd2459a-4df7-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1722290917;
	 x=1722377317; bh=Wyz5mVHR3G8vUpOSDBaUIeknkHvsrxRKQHb3UhLhg58=; b=
	jezJNaDpwgkCsRcAxVJjjgq6vsnzzJVw8hXcBJllq2BM8T/7TwmDoBtqYU7b3AOZ
	/e9jlYwgqdBo5z24zYawrqkx/zhzrNPMm1X41lEJLXwbPjzoZdZ5wS76t+Rub8p4
	KC951awjDymHBB3mNZ4VEMa4Nwc5a7xsW7sylOQvp8IonT/AFuTQKbc8sPDbhM3h
	P6GpqPrwlUabEOIu3L2Ypj9N5rMMrF6dqUkXxAUAFCtsk0JLWlphRD/Up5K5Hky5
	UMuhvZ0mvoLr3Vs789lXUSKgS3vUq2wHUPWN5IqB7C9wnOGalOfezL4mo7DDnTg5
	9J9/jZNCBI00+85IlLUo2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722290917; x=1722377317; bh=Wyz5mVHR3G8vUpOSDBaUIeknkHvs
	rxRKQHb3UhLhg58=; b=KKZYnwVSAGs32VIFTzZbmwldcmSmHksd/gYdA2k+2pIm
	swy9eqwmdzOfHqjD5pFK0yaJEj3p3+Y04orJ87CdL/Ko2+Acnz3FK/rY052kcTNc
	nwAczQ/kc9g+yeD2RUATdnG0K03FysKUDdN+s21Q9G6R4JOJqlJBXBZUzhOS84WR
	v1ZmuQX0lZw69WzBopcBl1vKHWNZ5bNHn1SjKkp+xjuxC9pQLpDtePFXNpzRQixd
	p6zZDaqx1k6oNXQqETyiqWJ9bsnWH5VHEY9OoPYL7AO1gZ88kqNJCpwcztm+n7sK
	dODTQpMCEJJPsNwhJMWuehlEpjp0P2iQGxmeNpsmng==
X-ME-Sender: <xms:5BKoZs9LSwXC7EM78ViAtHdtwSF7iMv9cya9eLunwYPEtc4YKIIydQ>
    <xme:5BKoZktd9ZOFsVaP-C0BEISL-LODC0WiREj2IPvfDksFJ2VtqGXIUIPI-u28kifSO
    ksfo8wKml64Ng>
X-ME-Received: <xmr:5BKoZiBzznPWAAU20HNVYxPVcHGUkddmf8NjxGbu86b1tH8rhgdusUYTyxOnl8JptA2oq6wjhUHxb_AjGwvYxuFSVMxmSRespw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeefgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:5BKoZscwufBX2XkvLajUgpKb4aw7bA3H007dEfF3eOgwe5VWq-aHNg>
    <xmx:5BKoZhNTZKYUVkk5iDF-vP1pV9nDz-esCLEHP_U_kz2bWm-2jW1TPg>
    <xmx:5BKoZmkNxYt-e8alvIB2MB8xCXaDgNZIEayXdXAstJ5oIOAhkEL_Cw>
    <xmx:5BKoZjudXGqqMoU8uZy_KyP-aBp7OBO8uLjVppCkx9OhQcuG9rjiYw>
    <xmx:5RKoZk13M7gMblXGPoTxir-_-xP4BOcKoI02td-qOZbHGzDssH_MeyqR>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 30 Jul 2024 00:08:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <ZqgS4Zc9Tg-a_D-j@mail-itl>
References: <20230915074347.94712-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B0iUB4CmVPG+vr8t"
Content-Disposition: inline
In-Reply-To: <20230915074347.94712-1-roger.pau@citrix.com>


--B0iUB4CmVPG+vr8t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jul 2024 00:08:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference

On Fri, Sep 15, 2023 at 09:43:47AM +0200, Roger Pau Monne wrote:
> The current logic to chose the preferred reboot method is based on the mo=
de Xen
> has been booted into, so if the box is booted from UEFI, the preferred re=
boot
> method will be to use the ResetSystem() run time service call.
>=20
> However, that method seems to be widely untested, and quite often leads t=
o a
> result similar to:
>=20
> Hardware Dom0 shutdown: rebooting machine
> ----[ Xen-4.18-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000000000017>] 0000000000000017
> RFLAGS: 0000000000010202   CONTEXT: hypervisor
> [...]
> Xen call trace:
>    [<0000000000000017>] R 0000000000000017
>    [<ffff83207eff7b50>] S ffff83207eff7b50
>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x1=
13/0x129
>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x=
3eb/0x5f7
>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
>=20
> ****************************************
> Panic on CPU 0:
> FATAL TRAP: vector =3D 6 (invalid opcode)
> ****************************************
>=20
> Which in most cases does lead to a reboot, however that's unreliable.
>=20
> Change the default reboot preference to prefer ACPI over UEFI if availabl=
e and
> not in reduced hardware mode.
>=20
> This is in line to what Linux does, so it's unlikely to cause issues on c=
urrent
> and future hardware, since there's a much higher chance of vendors testing
> hardware with Linux rather than Xen.
>=20
> Add a special case for one Acer model that does require being rebooted us=
ing
> ResetSystem().  See Linux commit 0082517fa4bce for rationale.
>=20
> I'm not aware of using ACPI reboot causing issues on boxes that do have
> properly implemented ResetSystem() methods.

With the Acer quirk, and the info Jan posted in the thread, this
sentence technically is not true. I don't think it warrants any code
change in this patch (it's clearly less common and less problematic
issue than crash during ResetSystem(), and still can be worked around
with a cmdline option). But might warrant adjusting commit message.

> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Other points still stand, and I think this generally is an improvement,
so, preferably with adjusted commit message:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes since v1:
>  - Add special case for Acer model to use UEFI reboot.
>  - Adjust commit message.
> ---
>  xen/arch/x86/shutdown.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
> index 7619544d14da..3816ede1afe5 100644
> --- a/xen/arch/x86/shutdown.c
> +++ b/xen/arch/x86/shutdown.c
> @@ -150,19 +150,20 @@ static void default_reboot_type(void)
> =20
>      if ( xen_guest )
>          reboot_type =3D BOOT_XEN;
> +    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
> +        reboot_type =3D BOOT_ACPI;
>      else if ( efi_enabled(EFI_RS) )
>          reboot_type =3D BOOT_EFI;
> -    else if ( acpi_disabled )
> -        reboot_type =3D BOOT_KBD;
>      else
> -        reboot_type =3D BOOT_ACPI;
> +        reboot_type =3D BOOT_KBD;
>  }
> =20
>  static int __init cf_check override_reboot(const struct dmi_system_id *d)
>  {
>      enum reboot_type type =3D (long)d->driver_data;
> =20
> -    if ( type =3D=3D BOOT_ACPI && acpi_disabled )
> +    if ( (type =3D=3D BOOT_ACPI && acpi_disabled) ||
> +         (type =3D=3D BOOT_EFI && !efi_enabled(EFI_RS)) )
>          type =3D BOOT_KBD;
> =20
>      if ( reboot_type !=3D type )
> @@ -172,6 +173,7 @@ static int __init cf_check override_reboot(const stru=
ct dmi_system_id *d)
>              [BOOT_KBD]  =3D "keyboard controller",
>              [BOOT_ACPI] =3D "ACPI",
>              [BOOT_CF9]  =3D "PCI",
> +            [BOOT_EFI]  =3D "UEFI",
>          };
> =20
>          reboot_type =3D type;
> @@ -530,6 +532,15 @@ static const struct dmi_system_id __initconstrel reb=
oot_dmi_table[] =3D {
>              DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740"),
>          },
>      },
> +    {    /* Handle problems with rebooting on Acer TravelMate X514-51T. =
*/
> +        .callback =3D override_reboot,
> +        .driver_data =3D (void *)(long)BOOT_EFI,
> +        .ident =3D "Acer TravelMate X514-51T",
> +        .matches =3D {
> +            DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +            DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate X514-51T"),
> +        },
> +    },
>      { }
>  };
> =20
> --=20
> 2.42.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--B0iUB4CmVPG+vr8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaoEuEACgkQ24/THMrX
1yx4RAf+MZSi/S0RKra9krmr1H0OjVXCcgdXDw0IcG8XkdvwYQhFg57elhpigUaz
btaDJGL15RFyOQ5JHwfeRVdrk7WbcmfUEtC23Kv3RwdnkBpOELfHg7z4M4pXuP6a
9o5YHIkzrv3WpZxErVzIHcOf+hQyze7XIqMtEGU0JzQcB/fzYNFnO+IOQjjgcssy
XHTjtjmVSCkFLx6xeyZtYPhwR/UCbIlIPnZyXnMTg7GP8mJLp+a23Muml7JTnvLB
nMa+jucg0mwohF8IdziurMYlrqnTu0REnO9EV5TvE8Xa3DPpzX0tRsgJ/ISC1wZH
ITTg5u3ZSYM2rT6i7/3W/W+OWT+WoA==
=tDyL
-----END PGP SIGNATURE-----

--B0iUB4CmVPG+vr8t--

