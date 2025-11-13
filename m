Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD9C57751
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161254.1489245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWcn-0007ij-0f; Thu, 13 Nov 2025 12:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161254.1489245; Thu, 13 Nov 2025 12:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWcm-0007gX-Td; Thu, 13 Nov 2025 12:40:28 +0000
Received: by outflank-mailman (input) for mailman id 1161254;
 Thu, 13 Nov 2025 12:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25e8=5V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vJWcl-0006WT-KA
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:40:27 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed417cba-c08d-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 13:40:26 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 0AA411400249;
 Thu, 13 Nov 2025 07:40:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 13 Nov 2025 07:40:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Nov 2025 07:40:23 -0500 (EST)
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
X-Inumbo-ID: ed417cba-c08d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763037625;
	 x=1763124025; bh=3uYxc0pqDnfvLEC8bd6re6Hs/bqyryB/vPB9mn6RvVM=; b=
	vCleSDbvRsRWkz9zAGorYHV7nRUmMaUhB5Nuhvj2rzBkzzcHHv79KDvKLWk2smOK
	0oOCH6DLh5r9L8kdd0w5vhlqvNuv8S03GILe/FDPKjBwz/QpKFUTeLCZ8QQtwP4m
	cx+tHBlufIOpOakuyK6qzeiG/ludhSoRtxmFMWllE/yt9C7eFkAMY/+WJdU93/ng
	GyTJwOOBfetK4514Cj/hUUFdR/u/dLFWtAqpXhaqqVXbxsITyMfYCTHQOzDchQfH
	pYLfc/G0G7BYgp6VhUbNkbJ5BKUn+/RBhXCUUVaSQL8vlZTNdQs4+900L/6GM5AQ
	jy18trDXWPoZW0Il/tOFtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1763037625; x=1763124025; bh=3uYxc0pqDnfvLEC8bd6re6Hs/bqyryB/vPB
	9mn6RvVM=; b=RL6Q0EKJN6dNPzCvl340qULlwxQA+SGy/ZBi1seYn3VkWB8nfKx
	qUJj/9A1ZbIjh08raGxtuNDQGLynnyduc+eCFi9Gp3m84Y9OCRRma7fNy2R59pUZ
	MnY+i8JAKXWFFrWd16UCi6LPIEie1BOr9fp9wxllEGb/W8UjM2ato7fcuTULzPDT
	f5HaZydZR4VjD+yRp9iqTr7nJ+5T9kEAxndDNCnzbF8zCPaQNXxpHo5jvoGF+x53
	p8vxrX0YVctGks/fpO0fcp0ZIMwYZ2kGPaBDhIRFWzQmr/2ouAQDXJokOasDC8ni
	2jaxmJAvKjmnu4tsFWAEoiKyDCvpmH3Pajw==
X-ME-Sender: <xms:uNEVaXPJjmFZRLK2c7XC_nVQtl9XnpI_wc_8B9E8RWYToA0DtpXhCg>
    <xme:uNEVaUj4gHU68lIVkE4My5LqYxQnpyt_CYLgsCpDm9Tqhu2wylYdCV8-SQZmD4jo6
    -uGSF7fSdH3TIUNAyT95e9JyrG0hRjJcOXzwyrz-_NkXen2sD8>
X-ME-Received: <xmr:uNEVaZ47eMAI494fk3Js_Zt4Wu8q4Rb0mvu7WO9ccgv4uBl35ZXjdj-qOSl-eTyzXo6inKW1V8mDR7mkkw7ja4ygOlwyfnzyCGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeileeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffelteevudevteeukeeggedt
    jeffheehvdeftedtvdehuddvveeuheeftedvfeejnecuffhomhgrihhnpegsrhhkrdhprg
    hgvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprh
    gtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgt
    hhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhu
    shhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrh
    efsegtihhtrhhigidrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdp
    rhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohep
    mhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:uNEVab0L9v-_rSV4H-vF0R8XBPw14wqXx7rxvnSP4L1aNKN53BeBnA>
    <xmx:uNEVaUv9CkR3gb4VV2o48nky20DmAMFMoLS0fjW2lN02HxEFCvhSXQ>
    <xmx:uNEVaR7xBHVthowJEDXgSjB2xD_ZbL1E8uPcDnLrXRGUVYclICfsTg>
    <xmx:uNEVaQeaaljgOunBExzMlLbpIx7KqvlgBfDmn5Nvp7ZXlHncJ6qvZQ>
    <xmx:udEVaTxvxU8pEjMna2k5XIuwHqLPbjzOkIq17dW3jv95htlDSYfiBfjl>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 13 Nov 2025 13:40:21 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()
Message-ID: <aRXRtY10cFN38d02@mail-itl>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EcQHnMKI/KcaS/qC"
Content-Disposition: inline
In-Reply-To: <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com>


--EcQHnMKI/KcaS/qC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Nov 2025 13:40:21 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()

On Thu, Nov 13, 2025 at 12:09:37PM +0100, Jan Beulich wrote:
> Use the new brk_alloc() instead, with ebmalloc() merely being a thin
> wrapper.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm not quite certain whether we ought to permit non-page-granular
> reservations. The in-memory image being somewhat larger due to possibly
> excessive padding isn't really a big problem, I think.

My grep says ebmalloc is used in just two places:
1. For efi_memmap (via efi_arch_allocate_mmap_buffer())
2. For various cmdline options and module names (via aplace_string())

The second one is probably undesirable to allocate full page for each
one. On the other hand, the current approach (putting small allocations
at the same page as an earlier page-aligned one) also has its issues -
see comments on 3/3 patch.

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -262,7 +262,7 @@ quiet_cmd_obj_init_o =3D INIT_O  $@
>  define cmd_obj_init_o
>      $(OBJDUMP) -h $< | while read idx name sz rest; do \
>          case "$$name" in \
> -        .*.local) ;; \
> +        .*.local|.bss..brk*) ;; \
>          .text|.text.*|.data|.data.*|.bss|.bss.*) \
>              test $$(echo $$sz | sed 's,00*,0,') !=3D 0 || continue; \
>              echo "Error: size of $<:$$name is 0x$$sz" >&2; \
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -10,6 +10,7 @@
>  #include <xen/vga.h>
> =20
>  #include <asm/boot-helpers.h>
> +#include <asm/brk.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
>  #include <asm/microcode.h>
> @@ -119,6 +120,18 @@ static void __init relocate_trampoline(u
>      reloc_trampoline64();
>  }
> =20
> +DEFINE_BRK(efi, MB(1));
> +
> +static void *__init ebmalloc(size_t size)
> +{
> +    void *ptr =3D brk_alloc(size);
> +
> +    if ( !ptr )
> +        blexit(L"Out of BRK memory\r\n");
> +
> +    return ptr;
> +}
> +
>  static void __init place_string(u32 *addr, const char *s)
>  {
>      char *alloc =3D NULL;
> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -41,12 +41,4 @@ void __init noreturn efi_multiboot2(EFI_
> =20
>  void __init efi_init_memory(void) { }
> =20
> -bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
> -{
> -    /* FIXME: Simplify once the call here with two NULLs goes away. */
> -    if ( start || end )
> -        *start =3D *end =3D (unsigned long)_end;
> -    return false;
> -}
> -
>  void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e) { }
> --- a/xen/arch/x86/include/asm/brk.h
> +++ b/xen/arch/x86/include/asm/brk.h
> @@ -2,6 +2,10 @@
> =20
>  #include <xen/types.h>
> =20
> +#define DEFINE_BRK(var, size) \
> +    static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE)=
 \
> +        __used var ## _brk_[size]

This chunk belongs to the previous patch I think.

> +
>  void *brk_alloc(size_t size);
>  unsigned long brk_get_unused_start(void);
>  void brk_free_unused(void);

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--EcQHnMKI/KcaS/qC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmkV0bUACgkQ24/THMrX
1yxmUwf/eHsCovJTIQ9sp3liGEH3ysQq8UT0w4Bzhw5SqL3Cmx8JN/va8EI2+TxW
D+AyEfdiPCftMN2s/GRLHhdL4EcnIqaB9/kEsqoO8HFXMfJbjwKTD8wD0BdI8wzp
77QQpfrl8W/rd2CmcDbDhtzEhiNFHgKkykrr+MkQy3Ccd2pex66c8A8EfvwBJla3
jM5yVO5A5v/gPzBXSQ7PiE/XPD0//gXCdccr6r+svCaEyW7RP8HHpqK12J38h4JZ
eVoYRFG+zsK+TiJ2Tgo1m3ZvyTrviOfnoZmbNWBsxpdFBXBlg2SU3F6u9giEdiov
RwTeWr2MBsqlzPA0lvlikVsKaRkXTw==
=fLJ1
-----END PGP SIGNATURE-----

--EcQHnMKI/KcaS/qC--

