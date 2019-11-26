Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5310A415
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 19:35:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZfdD-00013t-4U; Tue, 26 Nov 2019 18:32:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ud2r=ZS=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iZfdB-00013o-3t
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 18:32:09 +0000
X-Inumbo-ID: 0ce7a788-107b-11ea-a3a7-12813bfff9fa
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ce7a788-107b-11ea-a3a7-12813bfff9fa;
 Tue, 26 Nov 2019 18:32:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8537570D;
 Tue, 26 Nov 2019 13:32:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 26 Nov 2019 13:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jlDBdV
 xSOPYN8r39yVS+IShfGUXDOLedRrzdh7cv3t8=; b=XDq+Z5Ex924M2nR6M5RqNq
 34icMenwCMwbU2OK5EgVyOYo019tsczV7iEIOCejzmAgtLRYnb4Gc22baw5WdA5o
 PhFQKkBeDJvJ12UVKLW1HpbqQKE39/UNdi5x06AG6ZoLZXC0SEp0hqRFTuoMRbyE
 gAlzNqUEiADaY2W/Z0JhEZPpv+KqdWdsOu7UUbzYs2ZQyMPgIptVdX3ESEaQkpYm
 QXGHOgleMvWvbJ//RQpQbwnJgPZDVkAJJ/QR10b5xtecyV3fPVLGN9CYyG1/Kx5u
 EOcpBfoI9PDAbLvgWz5inPuO2gcUpepZwq48PSsV7QcUWzGd2e8FJkKC3lpPYRIw
 ==
X-ME-Sender: <xms:pW_dXUuwZ2nbPZoSVT4syeZI5it26m710ezm_ukxdT3_S4nxf6ZXqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeifedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:pm_dXUl00WuuE04YrQ7At0wa9JnNh9s7u9UatIKOgkdG7jkm8BjeJg>
 <xmx:pm_dXdOqNLzXDcLAXgG2TBjmULM08B3j0Zozw7MbpP1zWIBIS4tzUA>
 <xmx:pm_dXbzMjPcZbyKzR6PHeyIrfnLPm3HBguBDjNjHmRQU67wN1392AQ>
 <xmx:pm_dXVnZ3_B5jkjImTcnPMmleSGlJi3ymhPii3E9ldP8iYqnuaKQNg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75EF23060057;
 Tue, 26 Nov 2019 13:32:05 -0500 (EST)
Date: Tue, 26 Nov 2019 19:32:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20191126183202.GV5763@mail-itl>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
 <20191125004706.GB2012@mail-itl>
 <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
 <20191126035517.GT5763@mail-itl>
 <CAMmSBy8yawo0Oc0Ba90Cox7jb+vNoQfMqA1Uqap2XGsL-x8ONw@mail.gmail.com>
 <CAMmSBy_2gQCPOJjo-VWZ3gmbER+5QPNJyQJN3u_SgKDGZQadGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_2gQCPOJjo-VWZ3gmbER+5QPNJyQJN3u_SgKDGZQadGg@mail.gmail.com>
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3940969546381957963=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3940969546381957963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oXUzUgc67Nrfa9SE"
Content-Disposition: inline


--oXUzUgc67Nrfa9SE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)

On Tue, Nov 26, 2019 at 09:56:25AM -0800, Roman Shaposhnik wrote:
> Hi Marek, after applying Jan's patch I'm making much further progress.
> Xen boots fine and Dom0 seems to be OK (more tests are needed tho on
> my end).
>=20
> I'm attaching the logs from Xen and Dom0.
>=20
> At this point it seems that adding efi=3Dattr=3Duc is a better option for
> these boxes than a wholesale efi=3Dno-rs
>=20
> Question #1: is this something that EFI_SET_VIRTUAL_ADDRESS_MAP was
> supposed to cover by default (so I don't have to add efi=3Dattr=3Duc)?

No, this looks like some different firmware (?) issue.

> Question #2: is there any downside to *always* specifying efi=3Dattr=3Duc?
> Even for servers that, strictly speaking, don't need it?

TL;DR: It should be fine. It is what Linux does too.

Details:

Lets take a look why 'efi=3Dattr=3Duc' helps, and how can we make it work
out of the box:

The issue is about memory marked as type=3D11 (EfiMemoryMappedIO) with
attr=3D8000000000000000 (EFI_MEMORY_RUNTIME). Indeed none of cachability=20
attribute is defined. For the record, defined attributes are (UEFI spec=20
=2E6):

    EFI_MEMORY_UC Memory cacheability attribute: The memory region supports
    being configured as not cacheable.

    EFI_MEMORY_WC Memory cacheability attribute: The memory region supports
    being configured as write combining.

    EFI_MEMORY_WT Memory cacheability attribute: The memory region supports
    being configured as cacheable with a =E2=80=9Cwrite through=E2=80=9D po=
licy.
    Writes that hit in the cache will also be written to main memory.

    EFI_MEMORY_WB Memory cacheability attribute: The memory region supports
    being configured as cacheable with a =E2=80=9Cwrite back=E2=80=9D polic=
y. Reads
    and writes that hit in the cache do not propagate to main memory.
    Dirty data is written back to main memory when a new cache line
    is allocated.

    EFI_MEMORY_UCE Memory cacheability attribute: The memory region supports
    being configured as not cacheable, exported, and supports the
    =E2=80=9Cfetch and add=E2=80=9D semaphore mechanism.

My reading of UEFI spec doesn't give much hints what to do with memory
mappings without any cachability attribute. The only related info I've
found is about EfiMemoryMappedIO:

    This memory is not used by the OS. All system memory-mapped IO
    information should come from ACPI tables.

So, maybe there is some more info?

Anyway, if I understand correctly, MMIO region should be mapped as UC,
right?

I've also taken look at what Linux does. And basically, the only bit
Linux care about is EFI_MEMORY_WB - if it's absent, then set the region
as uncachable (page cache disabled bit in page table entry). So,
basically Linux by default does what Xen's efi=3Dattr=3Duc does.

So, to improve Xen's hardware/firmware compatibility, I have two ideas:

1. Make efi=3Dattr=3Duc the default (it's still possible to disable it with
efi=3Dattr=3Dno).

2. Map type=3D11 (MMIO) as UC, unless attributes specify otherwise.

Any preference? I can prepare a patch for either version. But I guess
it's too late for getting it into 4.13.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--oXUzUgc67Nrfa9SE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3db6IACgkQ24/THMrX
1yy+Ygf/ST/RSYpuUMKM1eRwoHa7rtYs7In/XKcks5KBxYpRIIuQzwsvaKi5yNWU
RPzT8qWp4TUR82tJ4hJUUe7xg6tGqzeraaie6m71eCvNriTAhzUHevia04s15oMD
ljFVzAPxXRpdUqDvAMjk60UIINuZE+a/JZ1iDE+5zwPfH/hQsD/8ggTcGHgzNQE/
H0HPo2i8rs9F9L/4s4FhpXNgKzMJ1lMLu72Jv2KhwkOw1bE15KM2Hdz8kpS9xemM
qamP2iCv6YSGtFJY08vpgFEyEQYL2u7xrzoyKsnBMyH3rFdED3NuJN9arDQagh8i
HX3B8ymMo2l6EPmRJN97TDR6wHInnw==
=oj6Z
-----END PGP SIGNATURE-----

--oXUzUgc67Nrfa9SE--


--===============3940969546381957963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3940969546381957963==--

