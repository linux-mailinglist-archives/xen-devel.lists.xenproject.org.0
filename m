Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D065901FAB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737165.1143338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcXP-0005iC-RY; Mon, 10 Jun 2024 10:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737165.1143338; Mon, 10 Jun 2024 10:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcXP-0005gI-OH; Mon, 10 Jun 2024 10:46:07 +0000
Received: by outflank-mailman (input) for mailman id 737165;
 Mon, 10 Jun 2024 10:46:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tSL=NM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sGcXO-0005gC-Cs
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 10:46:06 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1600d76-2716-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 12:46:02 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 9D5BE13800FD;
 Mon, 10 Jun 2024 06:46:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 10 Jun 2024 06:46:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 06:46:00 -0400 (EDT)
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
X-Inumbo-ID: a1600d76-2716-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718016361;
	 x=1718102761; bh=TqsrYyZlyVjXe4uGvyckEHwS22hu+++kF6oFj23YcBI=; b=
	Bj375HFlrVgHISPDglgYgJtvTQOsarPJDaRlFGQpC77tmq94m3L04CBBP5mIBciE
	s9w4cav1PaYRufUV4s7o4CzXGWam1kPElGOinnOQm023H1gs74LXAXNmy3duCkRg
	INTN9iBjqK9GgIGYpih7gM+MH1KHKkgXovYZqVbalEtjF9YqvMcv42vVYSpAj9+y
	xyP05U9/JvFUJySPBfomGujz7xjdB6bSvTMzqbrgcehKMUpXLN+8ETnSLGKl4pvS
	+qeDPE9rQkqsRuCsIbtPEwB8y5482aO7+wfEuNnAay5nqkkwISrQTctIkeOvJJYp
	D1Nf3m1y2l1ADDxiN9R/qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718016361; x=1718102761; bh=TqsrYyZlyVjXe4uGvyckEHwS22hu
	+++kF6oFj23YcBI=; b=ZE6l44pyVjcTJYM8X+F/2Zxf4BygF8QMaqEUtJQaEEWj
	4o0aUaPA/d1NHS2miZ73KyBr6dSDX6a3bI+sp904QV54408//Xu4c5j6wsDQIvCd
	FdEN35LB8jjS37C+v8+spaubCH9BdmkWZWn6xb3P4rWtDZ5Iu3iUnfm1z4sXWamL
	XCMM4T28SR9PfT1YebQHhqJtaUTTKTYd7Ow/xBEupecOT58+Evpsp26IB4SiQa9z
	XevLXFs+YwIq9u7A4HDm5Bx+1yfs2yZ8GQnp/7zQKWlyW86iPoIMoW9Ehtr6AT5P
	8iFg0zrhtqM7OP3Lj5xf5xI5UWhTr4LSAWcbVkfuWw==
X-ME-Sender: <xms:adlmZrigq4fyFyr-3tYsVbv_m4ieyuluZij5mgFHIXCPNFvdr4Pm7A>
    <xme:adlmZoDaDvgXwY9sadkahefBbBJJAnw4GCP7ZFMhZxcRAkHo7QveScfn1GI88q3IW
    sjyIBl1Gb7i1A>
X-ME-Received: <xmr:adlmZrFgAlw44BoqbVVvF1hOUFuvmqwaEiFR-AwzJO0BV_q_pHbxKwnVjzr4_BtahNOeCMbN5VUfti2kYQluTKshdFFvQ-q7AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:adlmZoSd8TVLA-V4WxZ2S0v1cI4EccUpDT4PQHjE_0yatvQ80cODog>
    <xmx:adlmZoxtWPVg7SiTfeZ1Wmb-P1Z4ghapys-CqZ2FoJiZ4lii3Y88EQ>
    <xmx:adlmZu4ICc_wf9kjRzgYfnPlzQm3GbK4b5wT6-JWnDTrK75TkLXMJQ>
    <xmx:adlmZtwy5FY0ZCohk8FKFjfe0w6--p-jb44GyEJD_SBS4SXCYfvXSQ>
    <xmx:adlmZivBvkHx8AZoZ74F5ZI2R7B4FzfGcZ-2O6_KuDudTMBBOGUkRPBY>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 10 Jun 2024 12:45:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>, javi.merino@cloud.com
Subject: Re: Segment truncation in multi-segment PCI handling?
Message-ID: <ZmbZZpMBjN3Kw9w1@mail-itl>
References: <ZmNjoeFAwWz8xhfM@mail-itl>
 <9cbb6dce-b669-4237-8932-b5cd64eb7288@citrix.com>
 <b609eaab-0a0a-433b-81d3-84a0cd90ebc1@suse.com>
 <Zma5Rj_cswrIYcD2@macbook>
 <a8225a94-54ed-4b24-8867-b9da65cb0a14@suse.com>
 <ZmbLZHSOg8KuRvAw@macbook>
 <9092e4d2-1feb-4667-86df-644a92468f58@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RJRoFmr8Hqj/2V+I"
Content-Disposition: inline
In-Reply-To: <9092e4d2-1feb-4667-86df-644a92468f58@suse.com>


--RJRoFmr8Hqj/2V+I
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Jun 2024 12:45:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>, javi.merino@cloud.com
Subject: Re: Segment truncation in multi-segment PCI handling?

On Mon, Jun 10, 2024 at 12:11:58PM +0200, Jan Beulich wrote:
> On 10.06.2024 11:46, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Jun 10, 2024 at 10:41:19AM +0200, Jan Beulich wrote:
> >> On 10.06.2024 10:28, Roger Pau Monn=C3=A9 wrote:
> >>> On Mon, Jun 10, 2024 at 09:58:11AM +0200, Jan Beulich wrote:
> >>>> On 07.06.2024 21:52, Andrew Cooper wrote:
> >>>>> On 07/06/2024 8:46 pm, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> I've got a new system, and it has two PCI segments:
> >>>>>>
> >>>>>>     0000:00:00.0 Host bridge: Intel Corporation Device 7d14 (rev 0=
4)
> >>>>>>     0000:00:02.0 VGA compatible controller: Intel Corporation Mete=
or Lake-P [Intel Graphics] (rev 08)
> >>>>>>     ...
> >>>>>>     10000:e0:06.0 System peripheral: Intel Corporation RST VMD Man=
aged Controller
> >>>>>>     10000:e0:06.2 PCI bridge: Intel Corporation Device 7ecb (rev 1=
0)
> >>>>>>     10000:e1:00.0 Non-Volatile memory controller: Phison Electroni=
cs Corporation PS5021-E21 PCIe4 NVMe Controller (DRAM-less) (rev 01)
> >>>>>>
> >>>>>> But looks like Xen doesn't handle it correctly:
> >>>
> >>> In the meantime you can probably disable VMD from the firmware and the
> >>> NVMe devices should appear on the regular PCI bus.
> >>>
> >>>>>>     (XEN) 0000:e0:06.0: unknown type 0
> >>>>>>     (XEN) 0000:e0:06.2: unknown type 0
> >>>>>>     (XEN) 0000:e1:00.0: unknown type 0
> >>>>>>     ...
> >>>>>>     (XEN) =3D=3D=3D=3D PCI devices =3D=3D=3D=3D
> >>>>>>     (XEN) =3D=3D=3D=3D segment 0000 =3D=3D=3D=3D
> >>>>>>     (XEN) 0000:e1:00.0 - NULL - node -1=20
> >>>>>>     (XEN) 0000:e0:06.2 - NULL - node -1=20
> >>>>>>     (XEN) 0000:e0:06.0 - NULL - node -1=20
> >>>>>>     (XEN) 0000:2b:00.0 - d0 - node -1  - MSIs < 161 >
> >>>>>>     (XEN) 0000:00:1f.6 - d0 - node -1  - MSIs < 148 >
> >>>>>>     ...
> >>>>>>
> >>>>>> This isn't exactly surprising, since pci_sbdf_t.seg is uint16_t, so
> >>>>>> 0x10000 doesn't fit. OSDev wiki says PCI Express can have 65536 PCI
> >>>>>> Segment Groups, each with 256 bus segments.
> >>>>>>
> >>>>>> Fortunately, I don't need this to work, if I disable VMD in the
> >>>>>> firmware, I get a single segment and everything works fine.
> >>>>>>
> >>>>>
> >>>>> This is a known issue.=C2=A0 Works is being done, albeit slowly.
> >>>>
> >>>> Is work being done? After the design session in Prague I put it on my
> >>>> todo list, but at low priority. I'd be happy to take it off there if=
 I
> >>>> knew someone else is looking into this.
> >>>
> >>> We had a design session about VMD?  If so I'm afraid I've missed it.
> >>
> >> In Prague last year, not just now in Lisbon.
> >>
> >>>>> 0x10000 is indeed not a spec-compliant PCI segment.=C2=A0 It's some=
thing
> >>>>> model specific the Linux VMD driver is doing.
> >>>>
> >>>> I wouldn't call this "model specific" - this numbering is purely a
> >>>> software one (and would need coordinating between Dom0 and Xen).
> >>>
> >>> Hm, TBH I'm not sure whether Xen needs to be aware of VMD devices.
> >>> The resources used by the VMD devices are all assigned to the VMD
> >>> root.  My current hypothesis is that it might be possible to manage
> >>> such devices without Xen being aware of their existence.
> >>
> >> Well, it may be possible to have things work in Dom0 without Xen
> >> knowing much. Then Dom0 would need to suppress any physdevop calls
> >> with such software-only segment numbers (in order to at least not
> >> confuse Xen). I'd be curious though how e.g. MSI setup would work in
> >> such a scenario.
> >=20
> > IIRC from my read of the spec,
>=20
> So you have found a spec somewhere? I didn't so far, and I had even asked
> Intel ...
>=20
> > VMD devices don't use regular MSI
> > data/address fields, and instead configure an index into the MSI table
> > on the VMD root for the interrupt they want to use.  It's only the VMD
> > root device (which is a normal device on the PCI bus) that has
> > MSI(-X) configured with real vectors, and multiplexes interrupts for
> > all devices behind it.
> >=20
> > If we had to passthrough VMD devices we might have to intercept writes
> > to the VMD MSI(-X) entries, but since they can only be safely assigned
> > to dom0 I think it's not an issue ATM (see below).
> >=20
> >> Plus clearly any passing through of a device behind
> >> the VMD bridge will quite likely need Xen involvement (unless of
> >> course the only way of doing such pass-through was to pass on the
> >> entire hierarchy).
> >=20
> > All VMD devices share the Requestor ID of the VMD root, so AFAIK it's
> > not possible to passthrough them (unless you passthrough the whole VMD
> > root) because they all share the same context entry on the IOMMU.
>=20
> While that was my vague understanding too, it seemed too limiting to me
> to be true.

I my case, it was a single NVMe disk behind this VMD thing, so passing
through the whole VMD device wouldn't be too bad. I have no idea (nor
really interest in...) how it behaves with more disks.
=46rom the above discussion I understand the 0x10000 segment is really a
software construct, not anything that hardware expects, so IMO dom0
shouldn't tell Xen anything about it.

Since I have the hardware, I can do some more tests if somebody is
interested in results. But for now I have disabled VMD in firmware and
everything is fine.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RJRoFmr8Hqj/2V+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZm2WYACgkQ24/THMrX
1yz3Igf/V6gNcUAQ5BJcLFjjP/nfEZ1XoAGwRMT4pfjcdJFF+0SOPYMuRaH2N5cC
VEE/vLWm33etkTSmvx3N/GvgiZRESLbsD/EHtRSu16gEWFh2zJAL+w8jtmn3f80o
kuJCG+ZbKX/Y/7jFUF6tWTpZJATfq3UNzud8l25nNyAXmn1mvYcGhSPxfItp6pS7
fKa/V/3IbPufqEmlCm7uFHMU4Cb+7r/fGPTY0JtAn+14JVUK2e+xdVm5dhQDqu9b
V7NiS/MNWVPbxw0HKWX8f2yCRrqMnKBmSmHNr6al69QtDfUTff6apLYNAqdtdXAa
apowTdeghwPytxz5GNrium3q9WrVRQ==
=Qr1T
-----END PGP SIGNATURE-----

--RJRoFmr8Hqj/2V+I--

