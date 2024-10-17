Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBAC9A25A5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 16:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820687.1234249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Ru7-0005iK-HB; Thu, 17 Oct 2024 14:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820687.1234249; Thu, 17 Oct 2024 14:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Ru7-0005gj-EL; Thu, 17 Oct 2024 14:55:07 +0000
Received: by outflank-mailman (input) for mailman id 820687;
 Thu, 17 Oct 2024 14:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/08=RN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t1Ru5-0005gd-Ji
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 14:55:05 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c919811a-8c97-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 16:55:02 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C40CF114015C;
 Thu, 17 Oct 2024 10:55:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 17 Oct 2024 10:55:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Oct 2024 10:54:59 -0400 (EDT)
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
X-Inumbo-ID: c919811a-8c97-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729176900;
	 x=1729263300; bh=Wvl+TaOIAuZs4lmR2Bwb8aTJs5T6L3pBQuQTjAqGiP0=; b=
	hVUZy8+vNTv+sOpXaeIui4Bk1alLHST5jZr2YQCkDlvb2VAOhpQieZPhF9svy9g5
	gMZ/rRoqA1g0A39Tyvy56CzWP3r6mxHwUgMgs/ZaSWQBCushFYqxis4Lef8BFBJs
	hvAAQdrCBCr25sQNNw8wAB4j+zWLcr0A8NEsvUASl+lm3+gltLko3LthZHXNhnlt
	LophPnZhEkeXsn2z/b0Qn673Ar7GNC/7kHjLIbz1Pwi0INZVykdVOdQrKbE3URB/
	63+4aR6avw+e3o4mCY56/97EUifqCoWnkExJ+8t4B0yq4+jDHvq3H79FStBCCbhD
	hunQLfTAIKGUB3aX8Oe5nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729176900; x=1729263300; bh=Wvl+TaOIAuZs4lmR2Bwb8aTJs5T6
	L3pBQuQTjAqGiP0=; b=jBaDNq6bu0EXJxdDqhRAw8FuibabKYQUk7eisvsLH9S4
	enuDYc62L3hAgV9QeLP2PbnPTMESZvay7LJgfc6D67H69X/lV3K9Hc/hLzq1odHQ
	VSqqmFSS0zCqrZp0cg4XMeuxTNMAG/QjcozKaNMNvVPtoRe174BSeM0D1/qmqXrA
	DEypBcZI0kQ/M1ChMG1xNcmXwBnrQY10yXJG4MbgReCropwN2d+HMUgSTaHMpA4a
	JVMxqw0B2eE4XzserCJEJYR1VTS83K44KcJTa9xqJ4qwOvc6JZrtX8c37xJ2VVRD
	VovO2AksiEzIBskDPZcpvYtXpXpHLBvEvMgWgWXvfg==
X-ME-Sender: <xms:RCURZ5PG-dZMpEFD74sufQGNFhRlnmLZCc6QPV24LAQo_PUHyoIk_A>
    <xme:RCURZ7-6O8IlF31rtfLqn90si1JIKtm0FtdpqPnj12-JzpfQJ-2CC4Oe-JEcJUcWh
    j7_QwGF9YnyXA>
X-ME-Received: <xmr:RCURZ4R1qh6ktsLYHKXxSTVKsXHpqa4EJbHimYJV-DhGQjP8IiR4zMk25VWtsxxg3kbRmmR-pu8i_MCWOQdb5Q0FhfPYuKwgYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehuddgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepffeigfefudfhieefhefhffelkeekueffhefhtdekteehueelieevud
    ehuddukeffnecuffhomhgrihhnpehofhhfshgvthdrmhgrphdplhgushdrshgspdhhvggr
    ugdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhrvgguih
    grnhhordiiihhglhhiohestghlohhuugdrtghomhdprhgtphhtthhopeigvghnqdguvghv
    vghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjsggvuh
    hlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhef
    segtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigi
    drtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhn
    shdrtghomh
X-ME-Proxy: <xmx:RCURZ1sNvEbddy8kitJVKH5ndLltC4R5Gxxlasx0qewiRQmQzhVXTw>
    <xmx:RCURZxc2OYj_UFMsHwtD0AfDyWKU2dnTK_Qk0m5PfsIbP3k5iy8KYA>
    <xmx:RCURZx1OD7fBMoeiqBQJzxuigfPxIRbAumHBFsbF4cHUtzMbkQm3cw>
    <xmx:RCURZ9_hC00_WJfaL09xNCHBgaOVz4-r02AKbsJWdb5oBAWS6K1jtQ>
    <xmx:RCURZ6HvVyID6_cRCZ6525wT3QHGRvYOdmKI8Drm9aT6VEIUM4JA_9XK>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Oct 2024 16:54:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 2/5] x86/boot: Reuse code to relocate trampoline
Message-ID: <ZxElQKIIWK2VjpRs@mail-itl>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-3-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tb1UnYJp27BVuOWx"
Content-Disposition: inline
In-Reply-To: <20241017133123.1946204-3-frediano.ziglio@cloud.com>


--tb1UnYJp27BVuOWx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Oct 2024 16:54:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 2/5] x86/boot: Reuse code to relocate trampoline

On Thu, Oct 17, 2024 at 02:31:20PM +0100, Frediano Ziglio wrote:
> Move code from efi-boot.h to a separate, new, reloc-trampoline.c file.
> Reuse this new code, compiling it for 32bit as well, to replace assembly
> code in head.S doing the same thing.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

For the EFI part:
Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes since v3:
> - fixed a typo in comment;
> - added Reviewed-by.
>=20
> Changes since v5:
> - do not add obj64 to targets, already done adding it to obj-bin-y.
> ---
>  xen/arch/x86/boot/Makefile           | 10 +++++---
>  xen/arch/x86/boot/build32.lds.S      |  5 ++++
>  xen/arch/x86/boot/head.S             | 23 +-----------------
>  xen/arch/x86/boot/reloc-trampoline.c | 36 ++++++++++++++++++++++++++++
>  xen/arch/x86/efi/efi-boot.h          | 15 ++----------
>  5 files changed, 51 insertions(+), 38 deletions(-)
>  create mode 100644 xen/arch/x86/boot/reloc-trampoline.c
>=20
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 5da19501be..98ceb1983d 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,11 +1,15 @@
>  obj-bin-y +=3D head.o
>  obj-bin-y +=3D built-in-32.o
> +obj-bin-y +=3D $(obj64)
> =20
>  obj32 :=3D cmdline.32.o
>  obj32 +=3D reloc.32.o
> +obj32 +=3D reloc-trampoline.32.o
> =20
> -nocov-y   +=3D $(obj32)
> -noubsan-y +=3D $(obj32)
> +obj64 :=3D reloc-trampoline.o
> +
> +nocov-y   +=3D $(obj32) $(obj64)
> +noubsan-y +=3D $(obj32) $(obj64)
>  targets   +=3D $(obj32)
> =20
>  obj32 :=3D $(addprefix $(obj)/,$(obj32))
> @@ -56,7 +60,7 @@ cmd_combine =3D \
>  		--bin1 $(obj)/built-in-32.base.bin \
>  		--bin2 $(obj)/built-in-32.offset.bin \
>  		--map $(obj)/built-in-32.offset.map \
> -		--exports cmdline_parse_early,reloc \
> +		--exports cmdline_parse_early,reloc,reloc_trampoline32 \
>  		--output $@
> =20
>  targets +=3D built-in-32.S
> diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.=
lds.S
> index e3f5e55261..fa282370f4 100644
> --- a/xen/arch/x86/boot/build32.lds.S
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -41,6 +41,11 @@ SECTIONS
>           * Potentially they should be all variables. */
>          DECLARE_IMPORT(__base_relocs_start);
>          DECLARE_IMPORT(__base_relocs_end);
> +        DECLARE_IMPORT(__trampoline_rel_start);
> +        DECLARE_IMPORT(__trampoline_rel_stop);
> +        DECLARE_IMPORT(__trampoline_seg_start);
> +        DECLARE_IMPORT(__trampoline_seg_stop);
> +        DECLARE_IMPORT(trampoline_phys);
>          . =3D . + GAP;
>          *(.text)
>          *(.text.*)
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index e0776e3896..ade2c5c43d 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -706,28 +706,7 @@ trampoline_setup:
>          mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
> =20
>          /* Apply relocations to bootstrap trampoline. */
> -        mov     sym_esi(trampoline_phys), %edx
> -        lea     sym_esi(__trampoline_rel_start), %edi
> -        lea     sym_esi(__trampoline_rel_stop), %ecx
> -1:
> -        mov     (%edi), %eax
> -        add     %edx, (%edi, %eax)
> -        add     $4,%edi
> -
> -        cmp     %ecx, %edi
> -        jb      1b
> -
> -        /* Patch in the trampoline segment. */
> -        shr     $4,%edx
> -        lea     sym_esi(__trampoline_seg_start), %edi
> -        lea     sym_esi(__trampoline_seg_stop), %ecx
> -1:
> -        mov     (%edi), %eax
> -        mov     %dx, (%edi, %eax)
> -        add     $4,%edi
> -
> -        cmp     %ecx, %edi
> -        jb      1b
> +        call    reloc_trampoline32
> =20
>          /* Do not parse command line on EFI platform here. */
>          cmpb    $0, sym_esi(efi_platform)
> diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/rel=
oc-trampoline.c
> new file mode 100644
> index 0000000000..0a74c1e75a
> --- /dev/null
> +++ b/xen/arch/x86/boot/reloc-trampoline.c
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/compiler.h>
> +#include <xen/stdint.h>
> +#include <asm/trampoline.h>
> +
> +extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
> +extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
> +
> +#if defined(__i386__)
> +void reloc_trampoline32(void)
> +#elif defined (__x86_64__)
> +void reloc_trampoline64(void)
> +#else
> +#error Unknown architecture
> +#endif
> +{
> +    unsigned long phys =3D trampoline_phys;
> +    const int32_t *trampoline_ptr;
> +
> +    /*
> +     * Apply relocations to trampoline.
> +     *
> +     * This modifies the trampoline in place within Xen, so that it will
> +     * operate correctly when copied into place.
> +     */
> +    for ( trampoline_ptr =3D __trampoline_rel_start;
> +          trampoline_ptr < __trampoline_rel_stop;
> +          ++trampoline_ptr )
> +        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
> +
> +    for ( trampoline_ptr =3D __trampoline_seg_start;
> +          trampoline_ptr < __trampoline_seg_stop;
> +          ++trampoline_ptr )
> +        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) =3D phys >=
> 4;
> +}
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 94f3443364..1acceec471 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -103,27 +103,16 @@ static void __init efi_arch_relocate_image(unsigned=
 long delta)
>      }
>  }
> =20
> -extern const int32_t __trampoline_rel_start[], __trampoline_rel_stop[];
> -extern const int32_t __trampoline_seg_start[], __trampoline_seg_stop[];
> +void reloc_trampoline64(void);
> =20
>  static void __init relocate_trampoline(unsigned long phys)
>  {
> -    const int32_t *trampoline_ptr;
> -
>      trampoline_phys =3D phys;
> =20
>      if ( !efi_enabled(EFI_LOADER) )
>          return;
> =20
> -    /* Apply relocations to trampoline. */
> -    for ( trampoline_ptr =3D __trampoline_rel_start;
> -          trampoline_ptr < __trampoline_rel_stop;
> -          ++trampoline_ptr )
> -        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
> -    for ( trampoline_ptr =3D __trampoline_seg_start;
> -          trampoline_ptr < __trampoline_seg_stop;
> -          ++trampoline_ptr )
> -        *(u16 *)(*trampoline_ptr + (long)trampoline_ptr) =3D phys >> 4;
> +    reloc_trampoline64();
>  }
> =20
>  static void __init place_string(u32 *addr, const char *s)
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tb1UnYJp27BVuOWx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcRJUAACgkQ24/THMrX
1ywGEwf/cW8EvBK/tLHqS7hFqdvn5Dgu9hyyRauX9irvZ0OMCqaEnNG4WmEnJqjJ
8skxouuprrYoBcCEt824WKnRRMIyeZZbKUJfT48NCeWTUBMZ9cT4mHZLNWT1qmNd
Kn2ss0QfLxNfbb6no8ZHc+9fiu1nRGZ+QcaxreAIFNkQXU6hAYewiO29wmu8hB3X
QKkOrfEFp0J7Io9F0Ut4RSEPrLEqbQ53dEw5oAHlWL6YOPnj7Y6XJ2aru5XDh673
r3KjRTBbDp+XBZ+h2s3FkWVnP7UcxkYYadvvV0asVwCqNpS2U6foy3ibuVxtGrjD
rtdRri00INBfipCkFrApLqJEcBYk2Q==
=mHcz
-----END PGP SIGNATURE-----

--tb1UnYJp27BVuOWx--

