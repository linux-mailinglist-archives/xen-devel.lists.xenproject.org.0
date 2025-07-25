Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C44B1252B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 22:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058450.1426003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOi4-0007Qv-5e; Fri, 25 Jul 2025 20:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058450.1426003; Fri, 25 Jul 2025 20:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufOi4-0007OZ-3A; Fri, 25 Jul 2025 20:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1058450;
 Fri, 25 Jul 2025 20:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xhym=2G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ufOi2-0007OT-Bq
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 20:08:02 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f9f0939-6993-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 22:08:00 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 982A6140045A;
 Fri, 25 Jul 2025 16:07:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Fri, 25 Jul 2025 16:07:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Jul 2025 16:07:56 -0400 (EDT)
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
X-Inumbo-ID: 0f9f0939-6993-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753474078;
	 x=1753560478; bh=jxPoNLW7xN1iEynJhQCofdk3BtCW87CRYohVy7PWmMg=; b=
	kC4OqlmRpsvwD1cl22Ua2kFqz6p5zQ6u2glGMsihdoKzp/+hBqJTDh1wcCR1Z5Yd
	U9q/b7YnsZIl+hOWLb2etM9knd9KHkuQEhG82pYZDLnVEWksbqqLQnauLNwMKOXr
	WvW+lTCN6nIoFYOk+X+aKMxb5XKJjeneAscUs2QfVEQR9Rk3mNuajcqHnWHJR9qV
	+pTDaQOmSGJJGAMiz7LK514Q0+1Ad9IGaqyoV/JoMvJrV6eJTiJ5YLwDl2DQ8G99
	e5WMffHE3hfZdwM76EB1Htjo+NKMA7inn6JcoUgwHTxVt5y39uymkKtHoYfssNUv
	6Q8/pIZN5qQ0XxjIEvW/nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1753474078; x=1753560478; bh=jxPoNLW7xN1iEynJhQCofdk3BtCW87CRYoh
	Vy7PWmMg=; b=nV4aiz3/D0JQAXFvdYUuqs6OPm76BLq5P9F+/Zhf1dlrViOkEdF
	OX7zaQfM44T+UHLA3dn0J/tbRSAB8q1tmTOplxp0rH+rDjaAACxcBe+deHQKh1uK
	U56IkUHOZAr4RvMyhHerRz3wk8YL7tT+sAzgtvKldLVtIztWe7vNMCrwQOQvxVvt
	hDgPGWIQ31MBwp7JxPnjtkFbL8CQ2/nty6iQel7goN0FQZ+++lNJ1hSPstjYv1wN
	N/a3NWHH8zK1+dRxdurMTGLM0a8KgjR4I1FvHcjZbikH3dS9GxbO3h7wsn1fGcDV
	E9/ondEWcw9ZEDKteNW0zQkIvagEFXF6FAg==
X-ME-Sender: <xms:HeSDaJ1gtI4TdZ8xz-BjZDcJ4X1srtMIUGwZj2fGBj91QG8t7YGkMQ>
    <xme:HeSDaM8FdI8I5bwAWCOsi3FVYbnAgFDL4_qSRGujrGpI96QiGlT3Wa6T9RB8kUQK4
    NipUrHSnzQqKQ>
X-ME-Received: <xmr:HeSDaJoo_ztVJzpvyxuF8hbjaM4ppYTZMhZidau6P_Q45vxJhme9qJS8uvkGJG6R5agvOADv0Bo2-QwMjcAIwAHASXsbjqQqq1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekgeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeelpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegumhihthhrohgpphhrohhkohhptghhuhhkudesvghprg
    hmrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpth
    htohepsggvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhmrdgtohhmpdhrtghpthhtohep
    mhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepvhholhhougihmh
    ihrhgpsggrsggthhhukhesvghprghmrdgtohhmpdhrtghpthhtohepughpshhmihhthhes
    rghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:HeSDaGTVlkWGmGdkehgOXk3dGXzRgLtqeMihydOYyyXoDnIjbHIAgg>
    <xmx:HeSDaMNpwqber-XL9aBM0Emk7U5RfbKCqMDR2DfHw-cOzhVlEHZ8RQ>
    <xmx:HeSDaEg2lw6Oa1cKPNY0aqi6ZfYSxpKrMFbS0ib16fHMkSL8AQFNRg>
    <xmx:HeSDaJmzUgMRph_Oa8GXPWqB3uDrQVkUNXlAit6xbpI_-HmfYYAjFw>
    <xmx:HuSDaDIWTt0t-mlJ7SPRgPDxtKjRLRLSz9LBEqjvyQYuxQvpWSAaCc1X>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 25 Jul 2025 22:07:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen: add missing noreturn attribute
Message-ID: <aIPkGgAii3rc2hsN@mail-itl>
References: <7b2884c6f89a0af671daa26798154b5ac0042a80.1753397522.git.dmytro_prokopchuk1@epam.com>
 <alpine.DEB.2.22.394.2507241806210.2549622@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="87QtFnW6Aacz9muc"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2507241806210.2549622@ubuntu-linux-20-04-desktop>


--87QtFnW6Aacz9muc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Jul 2025 22:07:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen: add missing noreturn attribute

On Thu, Jul 24, 2025 at 06:06:28PM -0700, Stefano Stabellini wrote:
> On Thu, 24 Jul 2025, Dmytro Prokopchuk1 wrote:
> > These functions never return to their caller,
> > causing a violation of MISRA C Rule 2.1:
> > "A project shall not contain unreachable code".
> > Add the `noreturn' attribute to fix this.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>=
 # EFI

>=20
>=20
> > ---
> >  xen/arch/arm/domain.c  | 2 +-
> >  xen/arch/arm/setup.c   | 2 +-
> >  xen/arch/arm/smpboot.c | 2 +-
> >  xen/common/efi/boot.c  | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 79a144e61b..310c578909 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -298,7 +298,7 @@ static void schedule_tail(struct vcpu *prev)
> >  extern void noreturn return_to_new_vcpu32(void);
> >  extern void noreturn return_to_new_vcpu64(void);
> > =20
> > -static void continue_new_vcpu(struct vcpu *prev)
> > +static void noreturn continue_new_vcpu(struct vcpu *prev)
> >  {
> >      current->arch.actlr =3D READ_SYSREG(ACTLR_EL1);
> >      processor_vcpu_initialise(current);
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 27bd3f5a6e..bb35afe56c 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -306,7 +306,7 @@ void __init init_pdx(void)
> >  size_t __read_mostly dcache_line_bytes;
> > =20
> >  /* C entry point for boot CPU */
> > -void asmlinkage __init start_xen(unsigned long fdt_paddr)
> > +void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
> >  {
> >      size_t fdt_size;
> >      const char *cmdline;
> > diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> > index 73de7503e9..7f3cfa812e 100644
> > --- a/xen/arch/arm/smpboot.c
> > +++ b/xen/arch/arm/smpboot.c
> > @@ -315,7 +315,7 @@ smp_prepare_cpus(void)
> >  }
> > =20
> >  /* Boot the current CPU */
> > -void asmlinkage start_secondary(void)
> > +void asmlinkage noreturn start_secondary(void)
> >  {
> >      unsigned int cpuid =3D init_data.cpuid;
> > =20
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index df29444220..4b60bd719e 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -285,7 +285,7 @@ static bool __init match_guid(const EFI_GUID *guid1=
, const EFI_GUID *guid2)
> >  }
> > =20
> >  /* generic routine for printing error messages */
> > -static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
> > +static void __init noreturn PrintErrMesg(const CHAR16 *mesg, EFI_STATU=
S ErrCode)
> >  {
> >      StdOut =3D StdErr;
> >      PrintErr(mesg);
> > --=20
> > 2.43.0
> >=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--87QtFnW6Aacz9muc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiD5BoACgkQ24/THMrX
1ywhsgf/a9TDItgFqxcfECQqvZIaSfdrIiWe0OdMX7AJpkMA4IY/ny5je/QLkBtq
pWgDQ9pedB8UevR7gbyywgpMYkrO3ivfhRbb0nG2jq9bZtds0LBwgzt5c1rUpbxH
mJxBawkv/v8s4ER6pjBbDF181tY1xaT1YyBwL5o2MD8/ix3oEQp1XTRSZ6tcUAKi
DAaZLhaHf5oMlfz6hCaUBCDS5DD/7pi1NijpRALCTUj4b35KX4/WlYz4rm5eeVfx
92uAwrKwOG/mqOyDjK+IOa+7gxM7SRMc1TNMiYcLTNpIJW2hO0yvTZRlRWGSBWTP
fADQyQ1HpBZAgakNyeGf7ig6Nev7ig==
=UbVX
-----END PGP SIGNATURE-----

--87QtFnW6Aacz9muc--

