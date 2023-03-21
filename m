Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E96C2F5C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:46:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512319.792250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZVk-0005yO-Fj; Tue, 21 Mar 2023 10:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512319.792250; Tue, 21 Mar 2023 10:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZVk-0005w2-Bk; Tue, 21 Mar 2023 10:46:36 +0000
Received: by outflank-mailman (input) for mailman id 512319;
 Tue, 21 Mar 2023 10:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FNBb=7N=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1peZVj-0005vs-2P
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:46:35 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a290ebfc-c7d5-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 11:46:32 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 701E85C00F1;
 Tue, 21 Mar 2023 06:46:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 21 Mar 2023 06:46:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:46:27 -0400 (EDT)
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
X-Inumbo-ID: a290ebfc-c7d5-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679395588; x=1679481988; bh=95FKhddyLdCren1wAuCBkt9IZsvu1ZQ8OPN
	6M/vtTys=; b=POfzLuZIoJz8W6janyBsvixjJ6wEojvPAZKC8jkTrYBITbGWOEP
	nUo4j69c6cO4W+qKr8ihRlVzWpd5qkCS9n3TiMtZw2REJ8gJ7YwXDuYBtF+0GwgI
	fuSctgyZdPLNRlygsuney3h8YsvigN4VzodrIuYvpzbk4ugzO7DeHWSkxOWE63in
	JqmjvpYka2M8lFKe7s4MdbtV3Qc2o+i39xEg0f4lOiWyAOZhJgMC+Z8gFjVf5oI+
	hDDKwt0k/NNcwF8dAiG3YbEJrXfUmc69JypObqgo8RbOvKzdTYLBBi89ofCyRzSx
	UcPk09gENJhnfcBlsoMT+LdyCz/D3KZJgSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679395588; x=1679481988; bh=95FKhddyLdCre
	n1wAuCBkt9IZsvu1ZQ8OPN6M/vtTys=; b=C4n0jxKDXpgEFjfz7MswTtlme+0Rq
	XBSPEUM1TZpccNe7t4qqTQqhd5hzhGRJ0nFzh63qWAbe6MowHW0yiaAXjoZFpF5+
	TJCgic6pxElb475iz4U4jopfNvYpP/3udYOU+jHomkuX7W0uiC2O7oavynmIgPhS
	63ZQbw4IgeYtOnTVNhxldhLZhjmh1Y+//pQnzXCMTX0DrvNOv0Xkzqr9bZWbpoGc
	mwznQwnx1P4jd1VXRPd+Lj4Le/WJPb+evzWzyYubCCxZn09cIRz7/UYyPnTpBETF
	OoLtyZ/dLCbwwLUJnUy6KhxyYBpA8D/Pj5VGSCUjST23U/3v4Gk/KGrYg==
X-ME-Sender: <xms:BIsZZBck4nyHTr1VxPibO_i9ITZHNlmRn5VTv8A88QyMw4t_rh-2bQ>
    <xme:BIsZZPMj4Nf6WtAFeQOq5MOaeap_-AF-cQAs5jEOKhVMhqtxm1a5a9aVb6W8d6EBg
    VSbnmwYqyq_8g>
X-ME-Received: <xmr:BIsZZKj4HyBVd_FZaducBJYHn2D_j-XoIY5jrjQ3vsctafs-hJaIzNyj3J450NnUd2AfUhl2UYSPTM9LNn1_MY4RPtXK5ADUesc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:BIsZZK87x5ZOvyXxvLtGMQP_OUTlMe7X8JykaqiyX2r1xXB05bHeOw>
    <xmx:BIsZZNtnCzaDM_aAZGEpZUoz5XFs0bePWzHYYWZs_SXwaC38ZMkhfQ>
    <xmx:BIsZZJGW9GqR_35PN38UQo-3qEUKXd0fPLOAW_jNadjgJQkvrvIcAA>
    <xmx:BIsZZL2CJHDyf4lEYHqXhXzQlf_m1gubUwSVTnMnMJvtJEMY1H7NHQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 21 Mar 2023 11:46:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZBmLADOlOF7n97vJ@mail-itl>
References: <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nOKd/PPi4/T/vYBv"
Content-Disposition: inline
In-Reply-To: <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>


--nOKd/PPi4/T/vYBv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Mar 2023 11:46:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Subject: Re: [BUG] x2apic broken with current AMD hardware

On Mon, Mar 20, 2023 at 09:28:20AM +0100, Jan Beulich wrote:
> On 20.03.2023 09:14, Jan Beulich wrote:
> > On 17.03.2023 18:26, Elliott Mitchell wrote:
> >> On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
> >>> On 16.03.2023 23:03, Elliott Mitchell wrote:
> >>>> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
> >>>>> On 11.03.2023 01:09, Elliott Mitchell wrote:
> >>>>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
> >>>>>>>
> >>>>>>> In any event you will want to collect a serial log at maximum ver=
bosity.
> >>>>>>> It would also be of interest to know whether turning off the IOMM=
U avoids
> >>>>>>> the issue as well (on the assumption that your system has less th=
an 255
> >>>>>>> CPUs).
> >>>>>>
> >>>>>> I think I might have figured out the situation in a different fash=
ion.
> >>>>>>
> >>>>>> I was taking a look at the BIOS manual for this motherboard and no=
ticed
> >>>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
> >>>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
> >>>>>>
> >>>>>> That is the sort of setting I likely left at "Auto" and that may w=
ell
> >>>>>> result in x2 functionality being disabled.  Perhaps the x2APIC
> >>>>>> functionality on AMD is detecting whether the hardware is present,=
 and
> >>>>>> failing to test whether it has been enabled?  (could be useful to =
output
> >>>>>> a message suggesting enabling the hardware feature)
> >>>>>
> >>>>> Can we please move to a little more technical terms here? What is "=
present"
> >>>>> and "enabled" in your view? I don't suppose you mean the CPUID bit =
(which
> >>>>> we check) and the x2APIC-mode-enable one (which we drive as needed)=
=2E It's
> >>>>> also left unclear what the four modes of BIOS operation evaluate to=
=2E Even
> >>>>> if we knew that, overriding e.g. "Compatibility" (which likely mean=
s some
> >>>>> form of "disabled" / "hidden") isn't normally an appropriate thing =
to do.
> >>>>> In "Auto" mode Xen likely should work - the only way I could interp=
ret the
> >>>>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (=
and
> >>>>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode=
 pre-
> >>>>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet=
 that's
> >>>>> speculation on my part ...
> >>>>
> >>>> I provided the information I had discovered.  There is a setting for=
 this
> >>>> motherboard (likely present on some similar motherboards) which /may/
> >>>> effect the issue.  I doubt I've tried "compatibility", but none of t=
he
> >>>> values I've tried have gotten the system to boot without "x2apic=3Df=
alse"
> >>>> on Xen's command-line.
> >>>>
> >>>> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Fe=
atures:"
> >>>> I see the line "(XEN) - x2APIC".  Later is the line
> >>>> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
> >>>> leaves the x2APIC turned off since neither line is present.
> >>>
> >>> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2AP=
IC
> >>> mode. Are you sure that's the case when using "Auto"?
> >>
> >> grep -eAPIC\ driver -e-\ x2APIC:
> >>
> >> "Auto":
> >> (XEN) Using APIC driver default
> >> (XEN) Overriding APIC driver with bigsmp
> >> (XEN) Switched to APIC driver x2apic_cluster
> >>
> >> "x2APIC":
> >> (XEN) Using APIC driver x2apic_cluster
> >> (XEN) - x2APIC
> >>
> >> Yes, I'm sure.
> >=20
> > Okay, this then means we're running in a mode we don't mean to run
> > in: When the IOMMU claims to not support x2APIC mode (which is odd in
> > the first place when at the same time the CPU reports x2APIC mode as
> > supported), amd_iommu_prepare() is intended to switch interrupt
> > remapping mode to "restricted" (which in turn would force x2APIC mode
> > to "physical", not "clustered"). I notice though that there are a
> > number of error paths in the function which bypass this setting. Could
> > you add a couple of printk()s to understand which path is taken (each
> > time; the function can be called more than once)?
>=20
> I think I've spotted at least one issue. Could you give the patch below
> a try please? (Patch is fine for master and 4.17 but would need context
> adjustment for 4.16.)

A college has similar issue, where an AMD system hangs during PV dom0
boot, seems like (at least) nvme's interrupts are not delivered. Setting
x2apic_phys=3Dtrue solves the issue, which hopefully means the patch below
will help too (unfortunately can't test it right now). It's Xen 4.14.

> Jan
>=20
> AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode
>=20
> An earlier change with the same title (commit 1ba66a870eba) altered only
> the path where x2apic_phys was already set to false (perhaps from the
> command line). The same of course needs applying when the variable
> wasn't modified yet from its initial value.
>=20
> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- unstable.orig/xen/arch/x86/genapic/x2apic.c
> +++ unstable/xen/arch/x86/genapic/x2apic.c
> @@ -236,11 +236,11 @@ const struct genapic *__init apic_x2apic
>      if ( x2apic_phys < 0 )
>      {
>          /*
> -         * Force physical mode if there's no interrupt remapping support=
: The
> -         * ID in clustered mode requires a 32 bit destination field due =
to
> +         * Force physical mode if there's no (full) interrupt remapping =
support:
> +         * The ID in clustered mode requires a 32 bit destination field =
due to
>           * the usage of the high 16 bits to hold the cluster ID.
>           */
> -        x2apic_phys =3D !iommu_intremap ||
> +        x2apic_phys =3D iommu_intremap !=3D iommu_intremap_full ||
>                        (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
>                        (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) &&
>                         !(acpi_gbl_FADT.flags & ACPI_FADT_APIC_CLUSTER));
>=20
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--nOKd/PPi4/T/vYBv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQZiwAACgkQ24/THMrX
1yxMIwf9FkpMmf6cStW+EKcy44x4QbDEdzoL+sKCptHe4zhnHAFrk/kzJ/GbeI4f
9cnRPHfWGkk5mKTzpYLMjcXEnMsQiAUT8c+INwwbs9zqyrcVdKodOoTv3A9zrwsN
PQZj5l5cJJXa3hNSmMzhLjF0VvxTNUtIMqtdDsDPqZPWFgdndhC7ZQgcTK265KLA
BtnfjTGXhK9dz+RwlAdvw9uj1G1G32Vo440xgzXTAuGPy9k7CkD3QIkzJweINnFL
jLo1bg+QIm9tNhhqf8KXu7TelVR8xm2ttbYOG/LqkwFGUp15GFMBVGDkpOW0rbWD
ntTZ/+52EsRJzZDQ3H9RgqEruOx8gg==
=KXnC
-----END PGP SIGNATURE-----

--nOKd/PPi4/T/vYBv--

