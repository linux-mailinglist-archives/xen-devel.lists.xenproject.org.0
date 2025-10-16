Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A12BE5B42
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 00:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144780.1478046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9WcE-0006B4-JJ; Thu, 16 Oct 2025 22:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144780.1478046; Thu, 16 Oct 2025 22:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9WcE-00069c-FP; Thu, 16 Oct 2025 22:38:34 +0000
Received: by outflank-mailman (input) for mailman id 1144780;
 Thu, 16 Oct 2025 22:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3fM=4Z=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v9WcD-00069W-D2
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 22:38:33 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d648b018-aae0-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 00:38:31 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id B51FC1D0009E;
 Thu, 16 Oct 2025 18:38:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 16 Oct 2025 18:38:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Oct 2025 18:38:26 -0400 (EDT)
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
X-Inumbo-ID: d648b018-aae0-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1760654308;
	 x=1760740708; bh=O/Rg+Ccc1LMiHMvV97DbeIubNm1nBluA7EsucdJkBYc=; b=
	0QC5/i4uC3cq2i1y0j1hDJ/suuF7lM/ZLTDrWIQSoVW+shYz4uaD9GSh0beIv/rI
	0xm3GpzoiQf5wNy58eAlCFB5FgwqJfoX9h5oPPDg+3q4GyJQGqZMyhFeKiByOhW8
	2SMRfHrCj5lEcHwzk3WOgC7UDPnHICKaoSLvapkRa16nn2h8V+Fc3qQnCXMGs430
	Dzkt+Hd7q9djyiXcRnzpBEXu/s20X97tANyxRyr4rqCC2R6STLMBJCc6yAHqNlif
	P1R+DU3kcAj6x8Ebosw29Cm3g5qtKEKAt3QqSwp+jw0gvLca+lG6RNlYGiuDSPIh
	NLZ71OTISyK3JJNz/YdFuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760654308; x=1760740708; bh=O/Rg+Ccc1LMiHMvV97DbeIubNm1nBluA7Es
	ucdJkBYc=; b=KsyZKvxg/qrjFTmiXV7Ks/4AVgVqdogYQLWTl/VRWi+z5M9thse
	5QYInUp2y5LIwIc3zgmnqj4DiWwLw50eoeLvgxfAWi5nV7cr8keN/Tp8h716n4+o
	RPqGB7pxiLEoLjHHy0qlABOBHbHuAIGo7XNphSsedJadeAwASD6iVxsXZSSrsVAy
	a0zo6bE6xijvZRUYWtt6YirW76PSnrGxtD7EG5FwoGnq6NA3en4yKEUATv0+IE7L
	Zqs6AP9B7vjhimDBBzgi1CEFHNmBfCMErmGmKvFTgDP9ddQCj/a/hbArX1CgpquQ
	vb/AjfmlG6ar+0iPzXc/FylzO0ZH2jXAWUw==
X-ME-Sender: <xms:5HPxaA84lxWQrq5rHbYcy1qTrd_6xukRgEudku2nXtj3m-sNgv1b_Q>
    <xme:5HPxaHxT_UuboUn92-XBxkrKyTfHjMddh7pmmnUfpVOqO9qlVSnRzr50RibRP_lF9
    x3RhiP4zOK5ZKWrsBg5-FDaMZ6Hid9q0rIY3wXvxTabJv1xVP0>
X-ME-Received: <xmr:5HPxaMOxugUQD6FxgQBry6pQyl-JMdx7ZVGmxG7HlQ1lDr8mY1_60yozxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdejheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieeluddv
    keejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehgrhihghhorhhiihgpshhtrhgrshhhkhhosegvphgrmhdrtghomhdprhgtphhtth
    hopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehjsggvuhhl
    ihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtsh
    drgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgvrhhgihihpghkihgsrhhi
    khesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtih
    htrhhigidrtghomhdprhgtphhtthhopehprghulhesgigvnhdrohhrghdprhgtphhtthho
    pegrlhgvjhgrnhgurhhordhgrghrtghirghvrghllhgvjhhosegrmhgurdgtohhm
X-ME-Proxy: <xmx:5HPxaM__35oZfFBMeSfgpyGKr5H2BamYjAhBZmU6K00QKstERMZHxA>
    <xmx:5HPxaJ5zRq57OEFyWfyxpgeIJSsqqDPKQAjsbTzrtBm2_7tmdDB-Mg>
    <xmx:5HPxaC4sP_qfIFcgLJjmkI5zmBww_k5mJ8Irx0HVghK8q2XWb7ef2w>
    <xmx:5HPxaCp0wm_Va6tGXTU6ELyg2EAJmcltrks0w3D4Pii2TSFpSfT5vg>
    <xmx:5HPxaLC2r8Kk88OUp2PyZRaJ9LUY_JoggFhMxGOPIYbw1JFkTQHIeF9x>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 17 Oct 2025 00:38:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aPFz3-RjsG-VGRLU@mail-itl>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan>
 <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan>
 <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
 <aO9UgQ3J27hVgGIa@Mac.lan>
 <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tzVi6kEDw/P8mlKg"
Content-Disposition: inline
In-Reply-To: <06d540f0-38e6-46fd-b94d-58ac2797657f@epam.com>


--tzVi6kEDw/P8mlKg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Oct 2025 00:38:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional

On Fri, Oct 17, 2025 at 12:40:33AM +0300, Grygorii Strashko wrote:
>=20
>=20
> On 15.10.25 11:00, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Oct 14, 2025 at 06:48:23PM +0300, Grygorii Strashko wrote:
> > >=20
> > >=20
> > > On 14.10.25 17:38, Roger Pau Monn=C3=A9 wrote:
> > > > On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
> > > > > On 13.10.25 15:17, Roger Pau Monn=C3=A9 wrote:
> > > > > > On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wro=
te:
> > > > > > > From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > > > > > > +
> > > > > > > +	  If unsure, say Y.
> > > > > > > +
> > > > > > >     config MEM_PAGING
> > > > > > >     	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPP=
ORTED
> > > > > > >     	depends on VM_EVENT
> > > > > > > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Mak=
efile
> > > > > > > index 6ec2c8f2db56..736eb3f966e9 100644
> > > > > > > --- a/xen/arch/x86/hvm/Makefile
> > > > > > > +++ b/xen/arch/x86/hvm/Makefile
> > > > > > > @@ -1,6 +1,6 @@
> > > > > > >     obj-$(CONFIG_AMD_SVM) +=3D svm/
> > > > > > >     obj-$(CONFIG_INTEL_VMX) +=3D vmx/
> > > > > > > -obj-y +=3D viridian/
> > > > > > > +obj-$(CONFIG_VIRIDIAN) +=3D viridian/
> > > > > > >     obj-y +=3D asid.o
> > > > > > >     obj-y +=3D dm.o
> > > > > > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > > > > > index 23bd7f078a1d..95a80369b9b8 100644
> > > > > > > --- a/xen/arch/x86/hvm/hvm.c
> > > > > > > +++ b/xen/arch/x86/hvm/hvm.c
> > > > > > > @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain =
*d,
> > > > > > >         if ( hvm_tsc_scaling_supported )
> > > > > > >             d->arch.hvm.tsc_scaling_ratio =3D hvm_default_tsc=
_scaling_ratio;
> > > > > > > -    rc =3D viridian_domain_init(d);
> > > > > > > -    if ( rc )
> > > > > > > -        goto fail2;
> > > > > > > +    if ( is_viridian_domain(d) )
> > > > > > > +    {
> > > > > > > +        rc =3D viridian_domain_init(d);
> > > > > > > +        if ( rc )
> > > > > > > +            goto fail2;
> > > > > > > +    }
> > > > > >=20
> > > > > > Are you sure this works as expected?
> > > > > >=20
> > > > > > The viridian_feature_mask() check is implemented using an HVM p=
aram,
> > > > > > and hence can only be possibly set after the domain object is c=
reated.
> > > > > > AFAICT is_viridian_domain(d) will unconditionally return false =
when
> > > > > > called from domain_create() context, because the HVM params can=
not
> > > > > > possibly be set ahead of the domain being created.
> > > > >=20
> > > > > You are right. Thanks for the this catch.
> > > > >=20
> > > > > Taking above into account above, it seems Jan's proposal to conve=
rt below
> > > > > viridian APIs into wrappers for VIRIDIAN=3Dn case is right way to=
 move forward:
> > > > >=20
> > > > > int viridian_vcpu_init(struct vcpu *v);
> > > > > int viridian_domain_init(struct domain *d);
> > > > > void viridian_vcpu_deinit(struct vcpu *v);
> > > > > void viridian_domain_deinit(struct domain *d);
> > > > >=20
> > > > > Right?
> > > >=20
> > > > Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
> > > > flag you need to exclusively use the Kconfig option to decide wheth=
er
> > > > the Viridian related structs must be allocated.  IOW: you could also
> > > > solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
> > > > is_viridian_domain() for most of the calls here.
> > > >=20
> > > > The wrapper option might be better IMO, rather than adding
> > > > IS_ENABLED(CONFIG_VIRIDIAN) around.
> > >=20
> > > I'll do wrappers - less if(s) in common HVM code.
> > >=20
> > > >=20
> > > > > [1] https://patchwork.kernel.org/comment/26595213/
> > > > >=20
> > > > > >=20
> > > > > > If you want to do anything like this you will possibly need to
> > > > > > introduce a new flag to XEN_DOMCTL_createdomain to signal wheth=
er the
> > > > > > domain has Viridian extensions are enabled or not, so that it's=
 know
> > > > > > in the context where domain_create() gets called.
> > > > >=20
> > > > > In my opinion, it might be good not to go so far within this subm=
ission.
> > > > > - It's not intended  to change existing behavior of neither Xen n=
or toolstack
> > > > >     for VIRIDIAN=3Dy (default)
>=20
> [1]
>=20
> > > > > - just optout Viridian support when not needed.
> > > >=20
> > > > OK, that's fine.
> > > >=20
> > > > On further request though: if Viridian is build-time disabled in
> > > > Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENOD=
EV
> > > > or similar error.  I don't think this is done as part of this patch.
> >=20
> > Another bit I've noticed, you will need to adjust write_hvm_params()
> > so it can tolerate xc_hvm_param_get() returning an error when
> > HVM_PARAM_VIRIDIAN is not implemented by the hypervisor.
> >=20
> > Implementing the Viridian features using an HVM parameter was a bad
> > approach probably.
>=20
> I've just realized how toolstack need to be modified and all consequences=
=2E..
> Have to try to push back a little bit:
>=20
> VIRIDIAN=3Dn: Now HVM_PARAM_VIRIDIAN will be R/W with functionality NOP.
>=20
> I'd prefer avoid modifying toolstack if possible.

IMHO trying to start a domain with Viridian enabled, while it's compiled
out of the hypervisor, should fail. Not silently be ignored.

> How about sanitizing HVM_PARAM_VIRIDIAN to be RAZ/WI for VIRIDIAN=3Dn?
> Or may be produce Xen XENLOG_WARNING"Viridian is disabled" if value!=3D0?
>=20
> This an EXPERT option and end-user can get Xen with VIRIDIAN=3Dn only by
> manually re-configuring and re-compiling Xen. In other words, the user
> is an expert and knows what he is doing.
>=20
> Another point, assume change like this is to be done for HVM_PARAM_VIRIDI=
AN
> - there are another HVM_PARAM_x which depend on build-time disabled featu=
res, like:
>  HVM_PARAM_VM86_TSS_SIZED
>  HVM_PARAM_PAGING_RING_PFN,
>  HVM_PARAM_MONITOR_RING_PFN,
>  HVM_PARAM_SHARING_RING_PFN,
>  HVM_PARAM_IDENT_PT
>  ...
>=20
> if corresponding features are build-time disabled, above HVM_PARAM_x
> become R/W with functionality NOP now.

Are you sure? For me it looks like setting build-time disabled feature
returns -ENOSYS. Or do you mean some other interface than
xc_hvm_param_set().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tzVi6kEDw/P8mlKg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjxc98ACgkQ24/THMrX
1yyRiQgAk/3mggbVFMcCFDMrHTAmCBYOLbUOk2iP7sxE53cVz8VsYr7dCOGoKbTn
iHrqwLOml69lggHwnDpmD1GpmypQeK5d+JgN/yF5y04oFcmNkwtkkDxNlnGrsPof
YYPGAj8kz5gTOAXvJb6/fUc+G2hTGDTF1nRq77CCa5IgP0BWbXT5PS6fw6VdjCZ5
kn1Br4QteAsP8FO8bnec+9bdtayycACPjRxY/vrajddeiyMjPtuxbtQ7nBIMfeak
w4YKFI12BnUIGb9Liha1gvVLAVcaloKE3v1HsccTr+I15ep6Icv196zli8h8fr8U
7GyQz7sVp1JEHv5/fjXQNTmf6V2U5Q==
=lzzM
-----END PGP SIGNATURE-----

--tzVi6kEDw/P8mlKg--

