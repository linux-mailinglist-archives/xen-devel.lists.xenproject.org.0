Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E77709485
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 12:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536929.835660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzx4J-0004rN-9D; Fri, 19 May 2023 10:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536929.835660; Fri, 19 May 2023 10:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzx4J-0004p2-6Q; Fri, 19 May 2023 10:10:39 +0000
Received: by outflank-mailman (input) for mailman id 536929;
 Fri, 19 May 2023 10:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdMp=BI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pzx4H-0004ow-As
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 10:10:37 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63ef2352-f62d-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 12:10:35 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 590545C014B;
 Fri, 19 May 2023 06:10:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 19 May 2023 06:10:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 May 2023 06:10:29 -0400 (EDT)
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
X-Inumbo-ID: 63ef2352-f62d-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1684491032; x=1684577432; bh=WmoTlhd7e1kwJpAAsaCCOOQJxMdCzpL/nDP
	L1E42Cfo=; b=P5i+sNrzGgkybQ2llHpdSW2AKLSaYvzjLV/X1tKoCOnMEuquyum
	Xz7L7fUs5n+bcz3EquSOz/LyYzo4+bnInf6pePRv8KXFTe1Ri70wn0/aQTymk6Nj
	3cOgoNnjULfVW8UqeTZdOxRVQ+EBZ+LWRXrUhP2M9QLZF0gH6sQkNPc9qKZCOrO9
	9MfZ9MN3Y9m8U5zroM3O8KCYAEdroMxEt0djE4C7v+kuG5NSqqLCvp420255lmj3
	Zfhv2QVb/G0g/MmOCnqA0OBNGNTtKmfHSBfBvNe+eSi5vldVRS0rB6sPFGLPp1+q
	imYfiENJ01Bse+gNazzWEmT6kALsLF8G68A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684491032; x=1684577432; bh=WmoTlhd7e1kwJ
	pAAsaCCOOQJxMdCzpL/nDPL1E42Cfo=; b=xGmbjPzlgjhHajV61PT0fxHOkTPA9
	P/BKddYJeZL8r3HwmUtZQoGkTKDM3sMX2G2E47LEKMHpnsftch7DUZCK3BGFhY94
	qp7VHIhqnZbVw9bKSeYk7xj1S+ywBdu1R3Z+/eMTB4h0v5/lNdk7d0UjJ6+USLn/
	P/hvq8ohUkOE9QafrdILUftyhnmjgg631lGCldrTurUHMVTM73uZKI3dDsT/NJWJ
	X/UjqL6iaIaAhkO2lv6CnDY+vYB14qlO0xDRW15Eu4p2VpQ+NsZcRo5gdaBSL5/u
	UwkL3yHLMhGBwUUudXDfwgnrAIf6s8EPADQJkSMIokbsiTEV/s8yHvbEw==
X-ME-Sender: <xms:F0tnZHkDT-Yelrchp8VYR0XaK9crha449BTfficNd73wBREUMflA5A>
    <xme:F0tnZK1MRXbgM7v-C9t2xZc8E_Or2jhOZiSv4A9o_b74SKo8qEk7L9IO1Y9kSOg3U
    ai88nLPPn61bA>
X-ME-Received: <xmr:F0tnZNprQUsXTFl7lvK1CHl92nb7NWLH5Vh17LdECZL8ASWuJUyNkriWpp4gXXVb2KbHmK8hrICDHD5zZXDlUakiFA6EOjfasJI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeihedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:F0tnZPkznI8Dzysbg3Je1q1Haflx3_kES29BO_hzPvRFEZZya4yEfA>
    <xmx:F0tnZF2bA5DdY11UUPtFQPCIHoGt_tmnpY_iR1S6AbEzh2Q89gSLLg>
    <xmx:F0tnZOtQwe94V3TNIOi1__ZV8Bk1B_Z4LPUSCGxb79tkGw_tF69vFw>
    <xmx:GEtnZE3OXQaasri_Ttvfhpz8-Ksd1lV6mvoGRbShRHswItGlXDiKsw>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 19 May 2023 12:10:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/4] x86: always initialize xen-swiotlb when xen-pcifront
 is enabling
Message-ID: <ZGdLErBzi9MANL3i@mail-itl>
References: <20230518134253.909623-1-hch@lst.de>
 <20230518134253.909623-3-hch@lst.de>
 <ZGZr/xgbUmVqpOpN@mail-itl>
 <20230519040405.GA10818@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A3eIvvbx7EttM1KL"
Content-Disposition: inline
In-Reply-To: <20230519040405.GA10818@lst.de>


--A3eIvvbx7EttM1KL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 May 2023 12:10:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/4] x86: always initialize xen-swiotlb when xen-pcifront
 is enabling

On Fri, May 19, 2023 at 06:04:05AM +0200, Christoph Hellwig wrote:
> On Thu, May 18, 2023 at 08:18:39PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, May 18, 2023 at 03:42:51PM +0200, Christoph Hellwig wrote:
> > > Remove the dangerous late initialization of xen-swiotlb in
> > > pci_xen_swiotlb_init_late and instead just always initialize
> > > xen-swiotlb in the boot code if CONFIG_XEN_PCIDEV_FRONTEND is enabled.
> > >=20
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >=20
> > Doesn't it mean all the PV guests will basically waste 64MB of RAM
> > by default each if they don't really have PCI devices?
>=20
> If CONFIG_XEN_PCIDEV_FRONTEND is enabled, and the kernel's isn't booted
> with swiotlb=3Dnoforce, yes.

That's "a bit" unfortunate, since that might be significant part of the
VM memory, or if you have a lot of VMs, a significant part of the host
memory - it quickly adds up.
While I would say PCI passthrough is not very common for PV guests, can
the decision about xen-swiotlb be delayed until you can enumerate
xenstore to check if there are any PCI devices connected (and not
allocate xen-swiotlb by default if there are none)? This would
still not cover the hotplug case (in which case, you'd need to force it
with a cmdline), but at least you wouldn't loose much memory just
because one of your VMs may use PCI passthrough (so, you have it enabled
in your kernel).
Please remember that guest kernel is not always under full control of
the host admin, so making guests loose 64MB of RAM always, in default
setup isn't good for customers of such VMs...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--A3eIvvbx7EttM1KL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRnSxEACgkQ24/THMrX
1yxoZQgAigYwLANKEDjGQFkztgAogWxy1LFDTtNJ3E+BQRNBEzsMU2jP0ND6oIWA
fuzuDMHRtd7zAop8RQSHwJ+x9OTpPlBR1a7tSxaszuF9tm+l1lWN/6M+fFKNNG+C
C8hCEe5NjlcrGsCOzfsPrU2/141dN/1DayOWQ6DPpBawF7PBOZrhqdEKVV+SfVEL
D7HM1k8hZj8Nxn39zU0AztoC4HpnhA/ovojpuL7HhyKrs/PbUFgQeJJhYAWDxsNI
1CGjRlyzNFMFBtmC1r7foXOX8AKpcOGeGLcnw5aoMCBnAlZi7rUE/WY+fHGud1tk
iPlvgAJ6SgmEF/kRu7VrzljzR8eZZA==
=fKf1
-----END PGP SIGNATURE-----

--A3eIvvbx7EttM1KL--

