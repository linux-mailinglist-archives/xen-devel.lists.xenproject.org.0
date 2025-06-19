Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C37AE0550
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 14:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020089.1396514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSECj-000578-6j; Thu, 19 Jun 2025 12:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020089.1396514; Thu, 19 Jun 2025 12:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSECj-00055B-3V; Thu, 19 Jun 2025 12:17:17 +0000
Received: by outflank-mailman (input) for mailman id 1020089;
 Thu, 19 Jun 2025 12:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVDA=ZC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uSECh-000555-OI
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 12:17:15 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54e0caa4-4d07-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 14:17:14 +0200 (CEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id C6F40138048A;
 Thu, 19 Jun 2025 08:17:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 19 Jun 2025 08:17:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 08:17:11 -0400 (EDT)
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
X-Inumbo-ID: 54e0caa4-4d07-11f0-a30c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750335432;
	 x=1750421832; bh=8ndLJ3KjK4YwzNMs9dMFsK7lyQQzeJCPgfENcS+oFB0=; b=
	gL3Ux/B/ioAy7FUf4fYaFqfcdaMgZulqu9Tdo1y3XjLoLHoflldKXPo5uSFjKCyT
	ntuMuefrv7Zly8dCJYRyS+YtKVyaSamvsJvRqPJeaSBHpBSbqpoMP+muzrGumOrl
	1zWhxe4EkkVhVXhJsOnsBRqWF0qamQs+PL467jGjzuRUJ5I3kJ7PrfuS1hlmfU4M
	5WFDgVIgWWEH9s5EkHe7C7ehEyX6gwuOPYuga5HIsyOrNkpFn8Rvlaqm+qsAOLU9
	Peb79vuZW0/DePgyMFNb+qjS4639BdCtqhDiWtkpM8nHFxkRhP6CtxnK4guOIFUP
	ELWuWDFvamtlFsg2VNYMqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750335432; x=1750421832; bh=8ndLJ3KjK4YwzNMs9dMFsK7lyQQzeJCPgfE
	NcS+oFB0=; b=Ru2qb2b1A5NhNSI+g0VLB9JV/RuK6sOrciOpe1PjtlWctw2NSvD
	Twzr8pVd2nmqfjL+szgzz6G9TzjRdQCTR0eoOjhbSoaCkdgxkUvIn3I/XD7mIqjg
	NNfZhx2yDzqfBrwqny0P8q1/AB6tHUgBsdA44/A0QPKooIIAVPHRkW2SIQlf04WN
	tIKOr9+jEZ7zX8rKgk+VRMA7/8h81uKlFapTpcx0Z/o7KP3FKjXJD7PvEx2eCvP9
	V2tlSC1JFS753LLIvk+d79YEsg3Q6wPth2wjjU1m4pWFgGyB/RGuPdKKpqLALTLl
	FDjeWccU11R64LRAv88BQd06Uwu6dYpyBEA==
X-ME-Sender: <xms:yP9TaOKY7aHbpUxgm3BrJYplVpMbY1T4MQbptIJzhC9cog6Q6HmKaw>
    <xme:yP9TaGJA051kUZWCWPiRzjMMoRJJGhxh4HlN40rASUd6KVz37GZQJVl5f5mhJNOgI
    MjJTp0TWlEncw>
X-ME-Received: <xmr:yP9TaOvNgkz_I3HDY-dBZOcyWduavi3cagSy4t2T7poH-wL_KSd0qQN1Zq1lX-EOiXqZwgLBzpuWVxQI2yMRmPld9B9g7eTBczA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehhedtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:yP9TaDY7OvwZVmFYYjyoT7w427GbGuCpVUAZI0uaIfExaEWvXelP0w>
    <xmx:yP9TaFZ-CVyueJr1uFvEe9O6oyNT7lqPlJbJZgP_tg3yyO4C_Gw8Qw>
    <xmx:yP9TaPCqukN6xnI9b759wyGr2ue7RKusDQX345bdAP3S6ixXldcFGg>
    <xmx:yP9TaLb567OvU3cfnXXV7qU911CT9728AT2Vm8VhqPZYLVg9JFQHFg>
    <xmx:yP9TaJFzXEcXWOnlVfiMRaAZaVM1o1TFbRpaJ2uHslRSgO5F1oeFpdGo>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 19 Jun 2025 14:17:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not check kernel signature if it was embedded
Message-ID: <aFP_xmsKsSK_y0tA@mail-itl>
References: <20250618184631.15489-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wNBKY+LoGi8uoExl"
Content-Disposition: inline
In-Reply-To: <20250618184631.15489-1-frediano.ziglio@cloud.com>


--wNBKY+LoGi8uoExl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Jun 2025 14:17:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Do not check kernel signature if it was embedded

On Wed, Jun 18, 2025 at 07:46:28PM +0100, Frediano Ziglio wrote:
> Using UKI it's possible to embed Linux kernel into xen.efi file.
> In this case the signature for Secure Boot is applied to the
> whole xen.efi, including the kernel.
> So checking for specific signature for the kernel is not
> needed.
> In case Secure Boot is not enabled there's no reason to check
> kernel signature.

The last sentence (here and in the comment below) seem to be unrelated
to this change - it's more about shim lock protocol being available,
which this patch doesn't change.
=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/common/efi/boot.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e39fbc3529..7077af3f5d 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1291,6 +1291,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>      bool base_video =3D false;
>      const char *option_str;
>      bool use_cfg_file;
> +    bool kernel_was_verified =3D false;
>      int dt_modules_found;
> =20
>      __set_bit(EFI_BOOT, &efi_flags);
> @@ -1461,6 +1462,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE I=
mageHandle,
>              read_file(dir_handle, s2w(&name), &kernel, option_str);
>              efi_bs->FreePool(name.w);
>          }
> +        else
> +        {
> +            /*
> +             * As kernel was embedded it was either verified for Secure =
Boot
> +             * or Secure Boot is not enabled.
> +             */
> +            kernel_was_verified =3D true;
> +        }
> =20
>          if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
>          {
> @@ -1534,6 +1543,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>       * verify it.
>       */
>      if ( kernel.ptr &&
> +         !kernel_was_verified &&
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

--wNBKY+LoGi8uoExl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhT/8YACgkQ24/THMrX
1yyTAQf/TGYthxmeBTFIJDcMkqYBFfZKP/INR+JfLPYM4VmxuPVxdT27DnJffMar
FZWykxDKZ+JcQ3nPCOEEf723ML91+mXMIFRjsQBDOdDmdBXZkesYg2edxTYx6wcb
yaQUQ9jqeryJ9Y7cI5BO5H0KSA9a3QQ7xOB4l2N1d8QV+C3BtrLOR4eP3hyrCwoS
B+7BdOJJX7z8CyDQzMT4dPIVlDVivmZR6kzm6H1egrgz6EUIHkAbz+pdWQLpp0Uq
sPTO6Rw/hHUvrRSjtvXVH7Hpjheo5ibw2N1vuNW2tF8DeGZ/cJOG6QISHr49d+Ss
bnuAAWKATLMPtgnbJ/5FRWK7TWuB7Q==
=4lba
-----END PGP SIGNATURE-----

--wNBKY+LoGi8uoExl--

