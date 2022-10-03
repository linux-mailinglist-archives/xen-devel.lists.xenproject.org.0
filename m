Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94A95F3419
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 19:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414984.659448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofOrW-00063U-RA; Mon, 03 Oct 2022 17:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414984.659448; Mon, 03 Oct 2022 17:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofOrW-00060r-NX; Mon, 03 Oct 2022 17:04:14 +0000
Received: by outflank-mailman (input) for mailman id 414984;
 Mon, 03 Oct 2022 17:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JV9=2E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ofOrV-00060l-32
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 17:04:13 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65f81e02-433d-11ed-9377-c1cf23e5d27e;
 Mon, 03 Oct 2022 19:04:11 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4A3D432006F5;
 Mon,  3 Oct 2022 13:04:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 03 Oct 2022 13:04:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Oct 2022 13:04:05 -0400 (EDT)
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
X-Inumbo-ID: 65f81e02-433d-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to; s=fm2; t=1664816647; x=
	1664903047; bh=MAFMhD2KIuhZj+ekr6ZwRi1IRfnbwdYWkjAH4mXarN4=; b=I
	9HH7zwtOEtR769BBI9P8o6ERsTCw/K3D0NA0bEWTOChot2Uax/fGDLfNvM0/2ta3
	Dm+dQjJvwpH/LscwVTXrVGPW4/3Su88EvowZdSDinorwmizGRSxF0RakuAIbQs2X
	mY6tfZUBSYkDoGH+c+1mEcgZGpn5b+fykmSqeL2TYnlTwx27lfqsiCAMRt+ZMooz
	EFeU/fC+6q0NhWFoLIcMjBvkWRuhp61HtI72nS2Up4yL3ok2Gi8rc23dOCvtfM2C
	SsGI+lCMjrqxPIV7fzpouJx+SiHm/NWYrQ/bBQH+5VZQcV22q6YgJNgpkK9VfMko
	oAcEj9Hz+o5lJNO1Kh0GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664816647; x=1664903047; bh=MAFMhD2KIuhZj+ekr6ZwRi1IRfnb
	wdYWkjAH4mXarN4=; b=GxOBXw6F3QN0HLIFXMlbQfU4HVAlQk0R94urTRZm5x/T
	jVx1AjodfIOKvJRxMb4XqUmJba1/DUToRz8KRRsecC8W+ps6JMP2y5jC3f8YJMEO
	uPR9m9KPjhwOewxDgvPRcfbitXvio52H2pPpMaqHtfM6Ba7LqJT+TDBjWrt1gGBZ
	v6cQ9Qscah94qXhfRUlqIJQMVjaUdwM1CUcP+K1maXh9Gx6SZIGjeVjPI1Qks5Fu
	cJgfZTBOSC4VTfgWaKSgCjg7RwS0hhcv/SJcUQu6O+mH7smG+qTFDtanSVb2FSKA
	NtkY39DCm7vs3UiQzL14+3kgGiXrxPOW1Z0G6EalOA==
X-ME-Sender: <xms:BxY7Y_LeMJe50C-fVxwsRxwWFuxuIPzjou9gWuaE1DL1MmlvfBQKYQ>
    <xme:BxY7YzJ1KvNjoQ6Snn7f8V0eUTMa6Qp_QBJxrBt1P_XTBedFxPvR7Wp-DSNBi3vtc
    yPxc4PRo68C7w>
X-ME-Received: <xmr:BxY7Y3sq1wvliPRp5KonqcpOl4WN2_DD5tQCMrqZQDtaN7Iv4XkzaFf96_eYZekN8jS7F-dtUSK3qkf-q31lBs-5ej0Tdh1ooD6R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehledguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenucfjughrpeffhfevuffkfhgg
    tggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskh
    hiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeekjeffieehhfeggffhieffvdevie
    etveejjeeghfetvdfggffhfedtgfeiuedunecuffhomhgrihhnpehgihhthhhusgdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:BxY7Y4YED3M3nIFWWquj4ThXbT3b4RXIZxEUd6p47X0bqfQKpW1ygw>
    <xmx:BxY7Y2YVQRfTOaG001nJe_dOM-nYNaI9c8bS8YD2I0rrAw5h6xigbA>
    <xmx:BxY7Y8Bc3g5bkAiB9cJLM__NnmKuCn_qmRVeJD-P-7WVdLnm-VS8WQ>
    <xmx:BxY7Y8lSpr4UWYwyOk2vU49icRJd4UXQqyFbz9T1sMt9X1aRhpdA6Q>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 3 Oct 2022 19:04:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Peter Jones <pjones@redhat.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2 5/6] efi: xen: Implement memory descriptor lookup
 based on hypercall
Message-ID: <YzsWAnD7q9qeBoBn@mail-itl>
References: <20221003112625.972646-1-ardb@kernel.org>
 <20221003112625.972646-6-ardb@kernel.org>
 <Yzr/1s9CbA0CClmt@itl-email>
 <CAMj1kXEXhDXRSnBp8P=urFj8UzzeRtYS9V8Tdt9GSrZTnGRFhA@mail.gmail.com>
 <YzsMYfEwmjHwVheb@itl-email>
 <CAMj1kXHR1FfD+ipG4RtbOezx+s_Jo6JwG4fpT5XUmvoqHTctLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+89X2RyWPSxXneQK"
Content-Disposition: inline
In-Reply-To: <CAMj1kXHR1FfD+ipG4RtbOezx+s_Jo6JwG4fpT5XUmvoqHTctLA@mail.gmail.com>


--+89X2RyWPSxXneQK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 3 Oct 2022 19:04:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Peter Jones <pjones@redhat.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2 5/6] efi: xen: Implement memory descriptor lookup
 based on hypercall

On Mon, Oct 03, 2022 at 06:37:19PM +0200, Ard Biesheuvel wrote:
> On Mon, 3 Oct 2022 at 18:23, Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> >
> > On Mon, Oct 03, 2022 at 05:59:52PM +0200, Ard Biesheuvel wrote:
> > > On Mon, 3 Oct 2022 at 17:29, Demi Marie Obenour
> > > <demi@invisiblethingslab.com> wrote:
> > > >
> > > > On Mon, Oct 03, 2022 at 01:26:24PM +0200, Ard Biesheuvel wrote:
> > > > > Xen on x86 boots dom0 in EFI mode but without providing a memory =
map.
> > > > > This means that some sanity checks we would like to perform on
> > > > > configuration tables or other data structures in memory are not
> > > > > currently possible. Xen does, however, expose EFI memory descript=
or info
> > > > > via a Xen hypercall, so let's wire that up instead.
> > > > >
> > > > > Co-developed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > ---
> > > > >  drivers/firmware/efi/efi.c |  5 ++-
> > > > >  drivers/xen/efi.c          | 34 ++++++++++++++++++++
> > > > >  include/linux/efi.h        |  1 +
> > > > >  3 files changed, 39 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/ef=
i.c
> > > > > index 55bd3f4aab28..2c12b1a06481 100644
> > > > > --- a/drivers/firmware/efi/efi.c
> > > > > +++ b/drivers/firmware/efi/efi.c
> > > > > @@ -456,7 +456,7 @@ void __init efi_find_mirror(void)
> > > > >   * and if so, populate the supplied memory descriptor with the a=
ppropriate
> > > > >   * data.
> > > > >   */
> > > > > -int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> > > > > +int __efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_=
md)
> > > > >  {
> > > > >       efi_memory_desc_t *md;
> > > > >
> > > > > @@ -485,6 +485,9 @@ int efi_mem_desc_lookup(u64 phys_addr, efi_me=
mory_desc_t *out_md)
> > > > >       return -ENOENT;
> > > > >  }
> > > > >
> > > > > +extern int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t =
*out_md)
> > > > > +      __weak __alias(__efi_mem_desc_lookup);
> > > > > +
> > > > >  /*
> > > > >   * Calculate the highest address of an efi memory descriptor.
> > > > >   */
> > > > > diff --git a/drivers/xen/efi.c b/drivers/xen/efi.c
> > > > > index d1ff2186ebb4..74f3f6d8cdc8 100644
> > > > > --- a/drivers/xen/efi.c
> > > > > +++ b/drivers/xen/efi.c
> > > > > @@ -26,6 +26,7 @@
> > > > >
> > > > >  #include <xen/interface/xen.h>
> > > > >  #include <xen/interface/platform.h>
> > > > > +#include <xen/page.h>
> > > > >  #include <xen/xen.h>
> > > > >  #include <xen/xen-ops.h>
> > > > >
> > > > > @@ -292,3 +293,36 @@ void __init xen_efi_runtime_setup(void)
> > > > >       efi.get_next_high_mono_count    =3D xen_efi_get_next_high_m=
ono_count;
> > > > >       efi.reset_system                =3D xen_efi_reset_system;
> > > > >  }
> > > > > +
> > > > > +int efi_mem_desc_lookup(u64 phys_addr, efi_memory_desc_t *out_md)
> > > > > +{
> > > > > +     static_assert(XEN_PAGE_SHIFT =3D=3D EFI_PAGE_SHIFT,
> > > > > +                   "Mismatch between EFI_PAGE_SHIFT and XEN_PAGE=
_SHIFT");
> > > > > +     struct xen_platform_op op =3D {
> > > > > +             .cmd =3D XENPF_firmware_info,
> > > > > +             .u.firmware_info =3D {
> > > > > +                     .type =3D XEN_FW_EFI_INFO,
> > > > > +                     .index =3D XEN_FW_EFI_MEM_INFO,
> > > > > +                     .u.efi_info.mem.addr =3D phys_addr,
> > > > > +                     .u.efi_info.mem.size =3D U64_MAX - phys_add=
r,
> > > > > +             }
> > > > > +     };
> > > > > +     union xenpf_efi_info *info =3D &op.u.firmware_info.u.efi_in=
fo;
> > > > > +     int rc;
> > > > > +
> > > > > +     if (!efi_enabled(EFI_PARAVIRT) || efi_enabled(EFI_MEMMAP))
> > > > > +             return __efi_mem_desc_lookup(phys_addr, out_md);
> > > > > +
> > > > > +     rc =3D HYPERVISOR_platform_op(&op);
> > > > > +     if (rc) {
> > > > > +             pr_warn("Failed to lookup header 0x%llx in Xen memo=
ry map: error %d\n",
> > > > > +                     phys_addr, rc);
> > > > > +     }
> > > > > +
> > > > > +     out_md->phys_addr       =3D info->mem.addr;
> > > >
> > > > This will be equal to phys_addr, not the actual start of the memory
> > > > region.
> > > >
> > > > > +     out_md->num_pages       =3D info->mem.size >> EFI_PAGE_SHIF=
T;
> > > >
> > > > Similarly, this will be the number of bytes in the memory region
> > > > after phys_addr, not the total number of bytes in the region.  Thes=
e two
> > > > differences mean that this function is not strictly equivalent to t=
he
> > > > original efi_mem_desc_lookup().
> > > >
> > > > I am not sure if this matters in practice, but I thought you would =
want
> > > > to be aware of it.
> > >
> > > This is a bit disappointing. Is there no way to obtain this
> > > information via a Xen hypercall?
> >
> > It is possible, but doing so is very complex (it essentially requires a
> > binary search).  This really should be fixed on the Xen side.
> >
> > > In any case, it means we'll need to round down phys_addr to page size
> > > at the very least.
> >
> > That makes sense.  Are there any callers that will be broken even with
> > this rounding?
>=20
> As far as I can tell, it should work fine. The only thing to double
> check is whether we are not creating spurious error messages from
> efi_arch_mem_reserve() this way, but as far as I can tell, that should
> be fine too.
>=20
> Is there anyone at your end that can give this a spin on an actual
> Xen/x86 system?

Demi, if you open a PR with this at
https://github.com/QubesOS/qubes-linux-kernel/pulls, I can run it
through our CI - (at least) one of the machines has ESRT table. AFAIR
your test laptop has it too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+89X2RyWPSxXneQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM7FgMACgkQ24/THMrX
1yxKHQf+JJ2JkZcF4WgR42arxR3sevcAuSW2j7nKWkMyLMp4St7Aa4hOBpdFyATU
2W0z0NzwalajmAbNXPM2u2LEMMP1EdFoqFrEGsocWsMH2qWTwkttLv7ARnltQy9K
qVcX+78nDAeB+/D+S5dvoYwWk5sWot1lIKnmu1pieEguldbZbVctvx6Sfdn2rlGb
BpZ0LKXEtXQ8LKuTGQDDdkpBg8yKQ8MGDEoslJTio8yEYmGKhp/gARHx9OaB18am
XeECcXlnCcddgaKn7E9BQ02Doql4YbZdhZY8NZKAevEvjZ9RtZ9hEkM1x4L7Pllu
p1FURsSerZvxAfOck8JVoaGob0KYpA==
=6KGB
-----END PGP SIGNATURE-----

--+89X2RyWPSxXneQK--

