Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC01939EBB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 12:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762976.1173223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCiD-0002yW-8A; Tue, 23 Jul 2024 10:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762976.1173223; Tue, 23 Jul 2024 10:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCiD-0002w8-3c; Tue, 23 Jul 2024 10:25:41 +0000
Received: by outflank-mailman (input) for mailman id 762976;
 Tue, 23 Jul 2024 10:25:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sWCiB-0002w0-T2
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 10:25:39 +0000
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5fee055-48dd-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 12:25:36 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id BC5BA1140385;
 Tue, 23 Jul 2024 06:25:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 23 Jul 2024 06:25:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jul 2024 06:25:34 -0400 (EDT)
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
X-Inumbo-ID: e5fee055-48dd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721730335;
	 x=1721816735; bh=zheC1pZkx9sV41YEanAv7qxpudB7/a1qiTqEHxKYF5A=; b=
	kRgzV2iopbnbNnHn2haMHZkJkyoh8WgGGqvssTfw1gzeIhN+2Y8AfeYvaNNw7FNx
	n+1jSjVwYNRD5vPsaVs8Sz+lMw3b5LfLPwu/vfCVk2PBpwOANDMXCe5OZSObwgQi
	UUSf6vNq4oVhUCuiFYxFW0R5jJ+GT2yqi5L4J/FZ2UtXWjTStrR2aHMeDQlzsE0h
	OWqYGkAdSATQRNb20A4xtaBHcpzJG+uph6O5nmdoQLfVIXQwBTBCE0kpenBLsCUm
	XxsxvfhF3fTc5V7NeL5GxAn1R4tnfwrPVP03J7xAyQbyd9+058Ww12HmjtTKNItC
	/vaL+HTOevzRgZY9TEpXyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721730335; x=1721816735; bh=zheC1pZkx9sV41YEanAv7qxpudB7
	/a1qiTqEHxKYF5A=; b=tLhOuMS/C4zUbUxXTnXA7I/RUwD7687QEqTYHo9qFkxt
	DjJjGEZufI9dJxMiw8qx3weScjZgdhOezGGkHixL/vqAmENpxmF/1YDxngwLILGv
	MgA3NZj6d1CmfR/e21fJjUxQVIUCZoUYeVcaxzTByBbDPxqH3qZiYJBaa96tV6gV
	eHtrZFlgbwbSR5YDOKZ70ckH1BjpMKLtTF/RcAb74kdt1XoDogAfUWoQmlGOdrO2
	8/vKHcJX64mzeoCuuqENJYdqBKWyBNXXO5LFk97hoNC7FBfwHgaZfsFEIWGmEVBF
	HjJ3QbsOR03XbVgdxQ+95o6JNflhqMWrgpjIWcfBDA==
X-ME-Sender: <xms:H4WfZqAssIEo6-O2bDeDe2KczA7CNwI9L1DbVAk33UfLtlA7diwwhQ>
    <xme:H4WfZkjckKvQvNJjF6iiVbG316jOOSLzYINArCsZP5nrbrrObaZnwWAjcAri7KZRp
    Df2_0BhAo0OBg>
X-ME-Received: <xmr:H4WfZtnSVqycp-LVt7iFavYaQaDz0DpRESydth9vosCEYRQZMKvysQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheelgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfeg
    ieehueefudeuvdejudeiiefgteekleefleejudehieeujeeujeeftedtteenucffohhmrg
    hinhepgigtphdqnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:H4WfZowoVjWvvebU_MBrwLeGHO-bwj2Mt3l_vHviZTaaNAspopWQCA>
    <xmx:H4WfZvTPcCMRxyu_sEMghm_O8IJ_No3wvjRUKWnXByPuNIMSf-di8g>
    <xmx:H4WfZjZftD9ZmXf3n6rtkVDBPoptuFhN855fj6AliUc921yfRpPokQ>
    <xmx:H4WfZoSfvDm4jg5ewgOdBsXCHI6XleTY4mXme3-zIgm05-H0bJiHaw>
    <xmx:H4WfZuH5ATIK5D2sM03BmA1C8UtRkSZy8d3oLw1WhkEKUw96WDZlC-m3>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 23 Jul 2024 12:25:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gene Bright <gene@cyberlight.us>, Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary
Message-ID: <Zp-FHHYmCj_Tu7DQ@mail-itl>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="isI6fIfkQWRgqnWW"
Content-Disposition: inline
In-Reply-To: <20240722101838.3946983-3-andrew.cooper3@citrix.com>


--isI6fIfkQWRgqnWW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jul 2024 12:25:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gene Bright <gene@cyberlight.us>, Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [PATCH 2/2] x86/efi: Unlock NX if necessary

On Mon, Jul 22, 2024 at 11:18:38AM +0100, Andrew Cooper wrote:
> EFI systems can run with NX disabled, as has been discovered on a Broadwe=
ll
> Supermicro X10SRM-TF system.
>=20
> Prior to commit fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early =
boot
> path"), the logic to unlock NX was common to all boot paths, but that com=
mit
> moved it out of the native-EFI booth path.
>=20
> Have the EFI path attempt to unlock NX, rather than just blindly refusing=
 to
> boot when CONFIG_REQUIRE_NX is active.
>=20
> Fixes: fc3090a47b21 ("x86/boot: Clear XD_DISABLE from the early boot path=
")
> Link: https://xcp-ng.org/forum/post/80520
> Reported-by: Gene Bright <gene@cyberlight.us>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Gene Bright <gene@cyberlight.us>
>=20
> Note.  Entirely speculative coding, based only on the forum report.
> ---
>  xen/arch/x86/efi/efi-boot.h | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 4e4be7174751..158350aa14e4 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -736,13 +736,33 @@ static void __init efi_arch_handle_module(const str=
uct file *file,
>      efi_bs->FreePool(ptr);
>  }
> =20
> +static bool __init intel_unlock_nx(void)
> +{
> +    uint64_t val, disable;
> +
> +    rdmsrl(MSR_IA32_MISC_ENABLE, val);
> +
> +    disable =3D val & MSR_IA32_MISC_ENABLE_XD_DISABLE;
> +
> +    if ( !disable )
> +        return false;
> +
> +    wrmsrl(MSR_IA32_MISC_ENABLE, val & ~disable);
> +    trampoline_misc_enable_off |=3D disable;
> +
> +    return true;
> +}
> +
>  static void __init efi_arch_cpu(void)
>  {
> -    uint32_t eax;
> +    uint32_t eax, ebx, ecx, edx;
>      uint32_t *caps =3D boot_cpu_data.x86_capability;
> =20
>      boot_tsc_stamp =3D rdtsc();
> =20
> +    cpuid(0, &eax, &ebx, &ecx, &edx);
> +    boot_cpu_data.x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
> +
>      caps[FEATURESET_1c] =3D cpuid_ecx(1);
> =20
>      eax =3D cpuid_eax(0x80000000U);
> @@ -752,10 +772,17 @@ static void __init efi_arch_cpu(void)
>      caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> =20
>      /*
> -     * This check purposefully doesn't use cpu_has_nx because
> +     * These checks purposefully doesn't use cpu_has_nx because
>       * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
> -     * with CONFIG_REQUIRE_NX
> +     * with CONFIG_REQUIRE_NX.
> +     *
> +     * If NX isn't available, it might be hidden.  Try to reactivate it.
>       */
> +    if ( !boot_cpu_has(X86_FEATURE_NX) &&
> +         boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL &&
> +         intel_unlock_nx() )
> +        caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> +
>      if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
>           !boot_cpu_has(X86_FEATURE_NX) )
>          blexit(L"This build of Xen requires NX support");
> --=20
> 2.39.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--isI6fIfkQWRgqnWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmafhRwACgkQ24/THMrX
1yw/TAf/e15qTdV2TiOCaJVnuqKdb6EzW/lNuMSsj6bBSab3j53R01gkfxe6BBH5
3F+KctUJoYX3j76TZXv9j25ivjAqdsjPI0JcXJP9JLTj3btdSeoq0YtcsfBm1aVH
qbtOVTiVBSxde4kNQ0Ry08N3AXLpnPakRwgLGp/xLBf67zzI0Rt1cDW2F49mQpdN
7+IvMVMI2RuUuf5h3TNp/gmnkcaiUZZvrEyubVCE6J2AByuFKw4TOkBpr7zIk6jm
F8PdZwPr/gteOQYYFF6y9HBspg7gxRSSrcggqjjPKWBBGZOWon5pvtZQgDRPZAmy
aLoM+Nr+wfyw2/gHbRPNhYxUuI+97w==
=uDac
-----END PGP SIGNATURE-----

--isI6fIfkQWRgqnWW--

