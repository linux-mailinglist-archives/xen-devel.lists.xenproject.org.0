Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BDB6947C2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:13:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494541.764634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZZJ-0000FQ-It; Mon, 13 Feb 2023 14:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494541.764634; Mon, 13 Feb 2023 14:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRZZJ-0000Bt-Fd; Mon, 13 Feb 2023 14:12:33 +0000
Received: by outflank-mailman (input) for mailman id 494541;
 Mon, 13 Feb 2023 14:12:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jb=6J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pRZZI-0000Bn-2g
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:12:32 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 707a3598-aba8-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:12:28 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6230A3200754;
 Mon, 13 Feb 2023 09:12:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Feb 2023 09:12:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Feb 2023 09:12:22 -0500 (EST)
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
X-Inumbo-ID: 707a3598-aba8-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1676297542; x=
	1676383942; bh=CLOIlYzbmg1DZi7Tu8o3YTVSaR3X2iddSKcMIH3yv7w=; b=n
	NvoGIx3VlZd1DHAmwQE6sSd8gfvKYmJ6EWe5XTB2IWbpaI9DFT07pjrIlwk39yCk
	MeUrS0F80r8gllUS9eDmNYRPJPS6bu6oqbYuS36NJfnP4BrdqOSSeNgoTWzEmk83
	UULboaf+Mg/jrmGv7hG1coLhmozmxdBAG/io0N5mToaPs7dkSHvb7IxPDHePrnE9
	vIYXXRVhrFR13pop81wSD8eutnwJ9+8VmjBNx721fSvoUQVOTum9LqyQumOwbbDF
	bfMz4LXFBmFAIXUEQ4q1fXSgxFP1/CMsxiv+KkiCOkSLC9Ll1zwJk6KSxmeYCvt1
	0h4VwajyJAFqIVfD4GAfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676297542; x=1676383942; bh=CLOIlYzbmg1DZi7Tu8o3YTVSaR3X
	2iddSKcMIH3yv7w=; b=YbTpybQ1cxI2xcCHUhoz3b7X5P28a9CDkn3Mkxg8QOz8
	daGN76Nhr4MHUq0oD1k85heD+oBvvnEvGEVl4kiRRdzElOj9hS6Pry1SYpnTGLqR
	0FTs1aB3gOLKcRZaDCtTZ/WSktV+qHX70W0FMHCfjE8vdlgUFDN5T3s50ESIqp7w
	OSuxqDgntWR332zgtJL6QCG0v/cJzAgA22Ekuq441WEYtGHn5jks311YPYw2M2cK
	cWaJn/owUkYQddJXU3eAjDMjVoulLCUZG3SG0xkZe2zU6Nob9ZlPD9Vr5Vt4KhTD
	eKpG1yY08p5noW3ZVi5JzRc+3sr++YokKRLRuYPlzw==
X-ME-Sender: <xms:RkXqY98pAmbcu07UVILLq0ipA8pEb2VhLdLE1SnuFgxpq4GsWycWQg>
    <xme:RkXqYxtKFKSJ3A7toQwABQOGTf3jlQ9vfZT3CiX9jvpQZRlGV45AWd2snhnTQtz7Q
    i4vsVtMWKft1g>
X-ME-Received: <xmr:RkXqY7AnfMkfK9wc3-7WqHriJrDZyP7dz53XD8ykJgK_fizdFW6IrtSP66HfybqYGvuyAmLlVFbxWiOh8fVfCuF-2XoQl7gAGR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiuddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephffg
    hfelueeitddvvddtveffueelfeevffeuiefhgeejjeejjeelveefueelheefnecuffhomh
    grihhnpehquhgsvghsqdhoshdrohhrghdplhgushdrshgsnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:RkXqYxdyqNAR8Xl01rQ-GNeVBvcNS-Z-HSNYVYt0TTnY39iTzN3HVg>
    <xmx:RkXqYyMCsYnxliQTp3XJNlGqVPvVqPtsOKvYiw12rROXVChJMV8ObA>
    <xmx:RkXqYzn3c3sehs1lbjb3Zi_PMdFsEqp8NXmGC2FRNiu8pkL_FOPMTg>
    <xmx:RkXqY8WKZEpeXrucADq0LXPhkcjNp1Uv1Fl56zpQ1Ba--gqhdbnB3w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 13 Feb 2023 15:12:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xen (multiboot) binary gets corrupted ELF notes
Message-ID: <Y+pFQ5lDhgbSUKMO@mail-itl>
References: <Y+obpe5nnLybL/8y@mail-itl>
 <9e4e8000-9e2d-6e43-df7d-9a34a75b7163@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3mUomW0mmu7TtCj8"
Content-Disposition: inline
In-Reply-To: <9e4e8000-9e2d-6e43-df7d-9a34a75b7163@suse.com>


--3mUomW0mmu7TtCj8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Feb 2023 15:12:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xen (multiboot) binary gets corrupted ELF notes

On Mon, Feb 13, 2023 at 01:53:21PM +0100, Jan Beulich wrote:
> On 13.02.2023 12:14, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > I'm getting some ELF note issues on multiboot binary
> > specifically:
> > xen/xen: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), stat=
ically linked, BuildID[sha1]=3Df7d2c37a4ad599b268f2f2d94bff3776d12649b3, ba=
d note description size 0xc0010001, stripped
> >=20
> > readelf additionally says:
> >=20
> >     Displaying notes found in: .note
> >       Owner                Data size 	Description
> >       GNU                  0x00000014	NT_GNU_BUILD_ID (unique build ID =
bitstring)
> >         Build ID: c5825a0d08edc4d11b1138fedca6b14ce8ba7302
> >       (NONE)               0x00000004	Unknown note type: (0x00000020)
> >        description data: 05 00 00 00=20
> >     readelf: xen/xen: Warning: note with invalid namesz and/or descsz f=
ound at offset 0x34
> >     readelf: xen/xen: Warning:  type: 0x4, namesize: 0x00554e47, descsi=
ze: 0xc0010001, alignment: 4
> >=20
> > Grub doesn't care, but launching such xen with kexec doesn't work.
> >=20
> > Initially found when booting Xen via Heads: https://openqa.qubes-os.org=
/tests/60151#step/install_startup/11
> >=20
> > Andy says:
> >> yeah, I've seen the same on XTF
> >> binutil's recent elf notes for CET compatibility use an unsigned long
> >> so they're not compatible when we build as 64bit and then re-package a=
s 32
> >> I think we need to strip all elf notes in mkelf32
>=20
> Instead of complicating mkelf32 (we want to retain at least the build-id
> note, after all, and for PVH_GUEST builds also .note.Xen) why don't we
> discard the unwanted/unneeded notes then from the linker script, just
> like we already do for xen.efi?

Ok, this seems to help:

---8<----
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8930e14fc40e..f0831bd677e7 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -192,13 +192,6 @@ SECTIONS
 #endif
 #endif
=20
-#ifndef EFI
-  /* Retain these just for the purpose of possible analysis tools. */
-  DECL_SECTION(.note) {
-       *(.note.*)
-  } PHDR(note) PHDR(text)
-#endif
-
   _erodata =3D .;
=20
   . =3D ALIGN(SECTION_ALIGN);
---8<---

The comment suggests some notes could be useful, but given they are
broken anyway and nobody complained so far, maybe not really?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3mUomW0mmu7TtCj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPqRUMACgkQ24/THMrX
1ywjTwf7BNphGtDx6mroAUouaXpz95WIKCuDlnHd0/F/En86co6RliGRdZ/FtBPC
6x9mr8CHSl6I46SYSaxt8AHJ/dWx3CY6OVRZSMxYNs3OIkQFGhqmoUGZbNCzHYL1
HPKbkOoeOqBJazSSm5AErVIFqdngDrsgEmHdsfrXHRh3llzkJlOtZJRz0mRKRb5+
TsTMU2dJBdC4MXcTUPgsOIJ8cv6Edqcdul58uT3mZHGQtP67zS8wC3CVD/FSHWKg
g/pREAZX99WKj4yBOV7eefEWnF3KVPefHv5z3umkAkbetLUmtC2IgWvjt0cz9CW2
Xrx5bElrs497oVQwkbSRTm422fRyzQ==
=0x00
-----END PGP SIGNATURE-----

--3mUomW0mmu7TtCj8--

