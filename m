Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E571FFCE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 12:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543079.847699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q52Pg-0002Kq-Nk; Fri, 02 Jun 2023 10:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543079.847699; Fri, 02 Jun 2023 10:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q52Pg-0002JA-JT; Fri, 02 Jun 2023 10:53:44 +0000
Received: by outflank-mailman (input) for mailman id 543079;
 Fri, 02 Jun 2023 10:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5qr=BW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1q52Pf-0002J2-2c
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 10:53:43 +0000
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9ea6745-0133-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 12:53:38 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 994905803ED;
 Fri,  2 Jun 2023 06:53:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 02 Jun 2023 06:53:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jun 2023 06:53:29 -0400 (EDT)
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
X-Inumbo-ID: b9ea6745-0133-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1685703216; x=1685710416; bh=ce8Eo1EvZ2JW4kEmPGptBfD1yCrEJLn9YG2
	pcbsnN5Q=; b=acsFGZ5ZKB6OyVZfMciy/4QBoM2+yRG+xZyAU96Z+zjxXdBaq43
	2zdM4upiQSDMnvrESU2wFelSwKdv3qsVU8m4B7cYhbsAZtwHBhuTYc9PbYYnLMud
	dXJsOJ0LrWQs6lPAns3FdxmKRnn1AVP7hUEuAFcFXnIcmZU6XK8Wv43kM8jG9oIS
	O80s85Scwq3A1dFTQi+EmnOnr2/FKfhagy9S5dllfSw7p6NcTK2A/oDuoSzLjAox
	lIJlWBFLYGP31DsmmjdtqbFfznmwrH+5RiIIiN7iK1UYAOgPoN7YsWhiHN4wCu0u
	o5CXpFwxBtV6SWdCNv/qAc/NHmaNdoDs+SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685703216; x=1685710416; bh=ce8Eo1EvZ2JW4
	kEmPGptBfD1yCrEJLn9YG2pcbsnN5Q=; b=crslxXcn1SClD1+WBg5dIQGG92/9q
	2Q9FC98tsa+QTYzY4Mx9rpLAOHxa6SJNTYovf2uqlmt79OF8Lx3bmmvsGFmy2cu8
	E31xpgd3hM9UbGAgMPqUYdU/pm8xzxvVEtuIv7QQeryJmQCUj0ob95TvCVafAu5p
	h+k2u9IhO0Upje2N8JlpJgkxbhPTz2/4PBReM6vEF7bsolnWE8BfP3GcLPJ0i7qf
	Bdk9aasT8bYPP6hsnJW4YWIYxyBRq6a5NKA/vTD9/6xlc3YOUZJpv4ynwr7Y9UuA
	vDdnn3Xnh1CqVQ8sMqs8Idez/ghaicuKdUvQBM9Wl2YUY+Oo2Y98RJwAw==
X-ME-Sender: <xms:L8p5ZCmZsT0ZfqNxrzcpucAt83qKUPRu-jGHpZ4wvkI7ijwJIdzbyQ>
    <xme:L8p5ZJ0o-9tgvfVUrT1gCi_8PcERbUpYHAMcmDfENWbkR427Amkqd6DGqDZPz5FWl
    ZCMK6EIUITMsQ>
X-ME-Received: <xmr:L8p5ZAqxid47ttTodNdE8mWuE1Y5BuwBcbCD8M-y2OYUK0p4PWTTBy6yjhmjB1CKy9wx2V-En5OMWbhRqF2uwupN1v7uRR8D23c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelfedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieef
    gfekieejudfhkeehgeegheeihfefveejgfejkeduleekhefhtdfggeetveejnecuffhomh
    grihhnpeigvghnphhrohhjvggtthdrohhrghdpghhithhlrggsrdgtohhmnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:L8p5ZGnJypvTLpYkZq8kCjr_tjwQJqDLDpjxzHCyRNAxLqwo6liK1A>
    <xmx:L8p5ZA3cW319neXRwHm-wF-_InG6YqXR7ci6YZPQwsxJdp_VNJryxQ>
    <xmx:L8p5ZNv7soqmU9M1GwTsMxABlMBvU1zVxrSggJLflglPPn2Iwq_mmw>
    <xmx:MMp5ZG94vvNWKYnn0X7MF6Po6_z_GYHfEa9475ORwrmn1dZ30D8xhQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 2 Jun 2023 12:53:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	christopher.w.clark@gmail.com, nathan.studer@dornerworks.com,
	Stewart Hildebrand <stewart@stew.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>,
	dfaggioli@suse.com, elena.ufimtseva@oracle.com,
	anthony.perard@citrix.com, george.dunlap@citrix.com,	rosbrookn@gmail.com,
 lukasz@hawrylko.pl,	dpsmith@apertussolutions.com,
 mateusz.mowka@intel.com,	kevin.tian@intel.com, jun.nakajima@intel.com,
 paul@xen.org,	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,	ross.lagerwall@citrix.com,
 samuel.thibault@ens-lyon.org,	christian.lindig@citrix.com,
 mengxu@cis.upenn.edu,	tamas@tklengyel.com, aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>,	"Stabellini,
 Stefano" <stefano.stabellini@amd.com>,	"Garhwal,
 Vikram" <vikram.garhwal@amd.com>,	Xenia.Ragiadakou@amd.com,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: Listing the tools required for Xen development/testing on x86
 and Arm by the community
Message-ID: <ZHnKJlTA/CmIVD3l@mail-itl>
References: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kA7UleKLwp1hr1CT"
Content-Disposition: inline
In-Reply-To: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>


--kA7UleKLwp1hr1CT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Jun 2023 12:53:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	christopher.w.clark@gmail.com, nathan.studer@dornerworks.com,
	Stewart Hildebrand <stewart@stew.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>,
	dfaggioli@suse.com, elena.ufimtseva@oracle.com,
	anthony.perard@citrix.com, george.dunlap@citrix.com,	rosbrookn@gmail.com,
 lukasz@hawrylko.pl,	dpsmith@apertussolutions.com,
 mateusz.mowka@intel.com,	kevin.tian@intel.com, jun.nakajima@intel.com,
 paul@xen.org,	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,	ross.lagerwall@citrix.com,
 samuel.thibault@ens-lyon.org,	christian.lindig@citrix.com,
 mengxu@cis.upenn.edu,	tamas@tklengyel.com, aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>,	"Stabellini,
 Stefano" <stefano.stabellini@amd.com>,	"Garhwal,
 Vikram" <vikram.garhwal@amd.com>,	Xenia.Ragiadakou@amd.com,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: Listing the tools required for Xen development/testing on x86
 and Arm by the community

On Fri, Jun 02, 2023 at 09:48:48AM +0100, Ayan Kumar Halder wrote:
> Hi Xen developers,
>=20
> We are trying to better document xen project development processes and
> related tools. At present, we are targeting **x86 and Arm** only.
>=20
> These tools range from bug/change request tracking means, compilers, infr=
a,
> editors, code-review tools, etc which is connected in some way to the Xen
> development and is being currently used by xen-devel community.
>=20
> I appreciate if you can let me know anything I missed or mistaken and the
> version currently being used (for some of the tools).
>=20
>=20
> 1. Code management portal - xenbits (https://xenbits.xenproject.org), git=
lab
> (https://gitlab.com/xen-project/xen)
>=20
> 2. Project description - wiki.xenproject.org
>=20
> 3. Project management - gitlab
>=20
> 4. Code review - text based email clients (mutt, thunderbird), git-email,=
 b4
>=20
> 5. Text Editors such as vim, emacs
>=20
> 6. Code review history - xen-devel mail archives
>=20
> 7. Code revision management - git
>=20
> 8. Xen coding language - C89, C99, Kconfig
>=20
> 9. Testing tools for Arm64 in gitlab CI
>=20
> compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)
>=20
> binutils - GNU Binutils for Debian) 2.38.9
>=20
> emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto, poky
> disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)
>=20
> dom0/domU kernel - kernel-5.19.0
>=20
> rootfs - alpine-3.12-arm64-rootfs
>=20
> firmware - U-Boot 2022.10
>=20
> 10. Testing tools for Arm in gitlab CI
>=20
> compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0, arm-linux-gnueabihf-g=
cc
> (Debian 12.2.0-14) 12.2.0 (most commonly used versions)
>=20
> emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)
>=20
> dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from
> Debian)
>=20
> rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz
>=20
> firmware - U-Boot 2022.10
>=20
> 11. Testing tools for x86
>=20
> compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14) 12.2.0,
> clang (from Debian) (most commonly used version)
>=20
> binutils - GNU ld (GNU Binutils for Debian) 2.40)
>=20
> emulator/hardware - Qubes HW (**need details regarding machine, firmware,
> etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)

There are two x86 machines:
1. MSI PRO Z690-A with Intel Core i5-12600K, this one has Dasharo
firmware (coreboot + UEFI)
2. MinisForum UM773 Lite with AMD Ryzen 7 7735HS, this one has stock
UEFI firmware

> dom0/domU kernel - kernel 6.1.19
>=20
> rootfs - alpine-3.12-rootfs
>=20
> firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by =
EDK
> II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen), GRUB
> 2.06~rc1
>=20
> 12. Debugger - gdb
>=20
> 13. Xen code building infra - make
>=20
> 14. Testing OS - CentOS 7, Ubuntu, OpenSuse, Arch Linux, Alpine 3.12.12,
> Debian 10 (Buster), Fedora
>=20
> ( **I could not get the version info for some of these ^^^**)
>=20
> 15. Testing Infra - Gitlab runner, Docker
>=20
> 16. Testing tools common to all architectures - All the host OS packages
>=20
> dtc, build-essential, zlib1g-dev, libncurses5-dev, libssl-dev, python-dev,
> python3-dev, xorg-dev, uuid-dev, libyajl-dev, libaio-dev, libglib2.0-dev,
> libpixman-1-dev, pkg-config, flex, bison, gettext, acpica-tools, bin86, b=
cc,
> liblzma-dev, libc6-dev-i386, libnl-3-dev, ocaml-nox, libfindlib-ocaml-dev,
> markdown, transfig, pandoc, checkpolicy, wget, nasm, mkimage, uboot-tools
>=20
> 17. Documentation related tools - doxygen, rst.
>=20
>=20
> Did I miss anything ?
>=20
> Kind regards,
>=20
> Ayan
>=20
>=20
>=20
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--kA7UleKLwp1hr1CT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmR5yicACgkQ24/THMrX
1yyR3wf8CBGzlAsb3Qpsmo2+X8Tk19aiDzotiAFngj71VkuhV0UnsxMl9RHvw4G8
6BX1eMLP0QPLMhk9LROfpW6PKwFmvikMkR8H+Bu8OSd7Tn/EZU7Una7l7BHGfwnE
h8zAPd8ZUqbJa416yq8R58cg66/GxjPbLLB98ZaQNHi5kSnWMmjrvDtbbok+GMIv
34UOu1XpXcRdknyuNd3KhaLKb/ANJWg0xFCeBGuMBMgzM52MLTNa47t0789+UMLr
StjJo99q3nDVtA1niXF+ljSi8eAJM00Ra7wCvV/RbqMWD2HrTvhl3G5oFom2Ydd1
66nvfsbb1lXU9WcCXT5B7o10xj8ncw==
=2Kj3
-----END PGP SIGNATURE-----

--kA7UleKLwp1hr1CT--

