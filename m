Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A4B15117
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062859.1428588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn0x-0001Je-1E; Tue, 29 Jul 2025 16:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062859.1428588; Tue, 29 Jul 2025 16:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugn0w-0001H0-U9; Tue, 29 Jul 2025 16:17:18 +0000
Received: by outflank-mailman (input) for mailman id 1062859;
 Tue, 29 Jul 2025 16:17:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FK0b=2K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ugn0v-0000m1-GP
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:17:17 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d8f86a2-6c97-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 18:17:16 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 74FA17A0125;
 Tue, 29 Jul 2025 12:17:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Tue, 29 Jul 2025 12:17:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jul 2025 12:17:12 -0400 (EDT)
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
X-Inumbo-ID: 7d8f86a2-6c97-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753805834;
	 x=1753892234; bh=YH1Q7kVMONV8FuWmqD5yX6hDkLnrFubuBn6weMD2D1c=; b=
	dZdV+zpgdKlLL+yBghLjv6xQ2PJWeikzg8Rcx0XQUzDDSMS8D4qRyCQCEauR0X6q
	e//rba3LJkOf+I4/jNvV6pO4/jqbJ2bQ7aqBkU4MhaRuejvIJoC76o3xUJQWrJBw
	Gsd9CqkLPHgPIrLXc/TlCPryca+Zm4/WLpEEbGLE6Kzdh1hhK6KsWrsAAiJal+0y
	r7x4L3vuTkqwYc44320gPTq/Uqay5r56usQM5jB+41dxRTnHKSFmJ7OYZ3/uLiRx
	WStsFkWNfpNFEneLQTtHlo1cqfurKUFJ/zG7eHwdci5on1kfBwVWJWcZeIy6mPPt
	qtw9hR+D9F2TEmUom9u11w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1753805834; x=1753892234; bh=YH1Q7kVMONV8FuWmqD5yX6hDkLnrFubuBn6
	weMD2D1c=; b=CzKTmj2EsxDkPoSLpS/UEAUjKMO3bsQsUpAettLcpdXpJIPOhx6
	CCRnfIUYWeoCmCXysJZ6Me71qmIWowKk989OlLFtFkREeIS2hoUv0RRO95VEQ2fV
	oTxtAzq5zePOuHR0hJMeR5Q3LHsGbkdQMyutP3S/Dl/n41ybfpzKjl0dYV/DHrqq
	j7DP3MWyz/380Wbt4M6xC/WrPVVgxAWDSfkVdCP8TdwvzMS7/3KC+aafgfK56wpZ
	QPICad1vBKNLgTIAItteyQ3qf6Zo3jF2KiOOa8O+08zAIaaw+BuQ+MQf6Kcq4UQe
	E7vxthYv132YYuUU2TMzNVzGLtGWiCVDK3g==
X-ME-Sender: <xms:CfSIaNNIrWvw3q8vj0K-pVB8wpXgjDefMxWnPry7AQ2p-h5Pugzt2w>
    <xme:CfSIaNhv_Y_48ZwDnQ1ej5sIU0kFGuiYVHrkUaZ9H320Ald_N74qk8V1RQXRVLV-M
    YfScVdd5K2oTA>
X-ME-Received: <xmr:CfSIaCsdNPsDwRJP2h5NB8lwR_lgnNlGl9wSpA6r1rLqyyaWeiqDs72qzbEZOu7y7M4MMiC3ghB4BVdJijK8iVJ9VQ_CmZqbrJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelheehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrh
    higidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopehrohhsshdrlhgrghgvrhifrghllhestghith
    hrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopeguph
    hsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:CvSIaLThvTzdSXwGpD0llG8nIAbSRKL36MY18-ZUQR3DwLAueDcBug>
    <xmx:CvSIaG0x3vHYkgU-6poVSmL_pxmbnUyHySVx_EcZJc7Ovwje-IxiGQ>
    <xmx:CvSIaAtVWSawWZgENDCOX4_NIw52xjrRcacD-4J9GIvGsIAqoZFN2A>
    <xmx:CvSIaMgS_hTDXnyyKxyqobjchC7TrgYnae-CLSOhNpm0i2UDY-HGSA>
    <xmx:CvSIaHmwK3vMNIVF8o3BUOhkl_dOOCH8sUNlUkdYV1pNqreY8UU7U-H_>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 29 Jul 2025 18:17:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
Message-ID: <aIj0BzGAH0G5ypbD@mail-itl>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <CACHz=Zhkt-a+vTPg+HJhSU=qvir94hiZOKjoBoZofeGpac+sGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DO5O0aWk+efziVI9"
Content-Disposition: inline
In-Reply-To: <CACHz=Zhkt-a+vTPg+HJhSU=qvir94hiZOKjoBoZofeGpac+sGQ@mail.gmail.com>


--DO5O0aWk+efziVI9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Jul 2025 18:17:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid

On Fri, Jun 27, 2025 at 02:08:00PM +0100, Frediano Ziglio wrote:
> On Thu, Jun 5, 2025 at 12:17=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > The format of the buildid is a property of the binary, not a property o=
f how
> > it was loaded.  This fixes buildid recognition when starting xen.efi fr=
om it's
> > MB2 entrypoint.
> >
> > Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> > CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> >
> > I don't like this patch and tried hard to do it in a better way, but th=
e EFI
> > aspects of the build system are too intractable.
> >
> > While on x86 I can in principle pull the same common-stubs.o trick, spl=
it on
> > XEN_BUILD_PE rather than XEN_BUILD_EFI, that doesn't work on ARM which
> > hand-codes it's PE-ness.  Also, it's really not EFI related, other than=
 as a
> > consequence of that being the only reason we use PE32+ binaries.

Besides the ARM issue, it would also make it harder to follow different
boot paths.

> >
> > Binutils 2.25 is now the minimum, and the makefiles can be cleaned up
> > somewhat, but I need to backport this patch, internally at least.
> > ---
> >  xen/common/version.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/common/version.c b/xen/common/version.c
> > index 5474b8e385be..56b51c81d2fc 100644
> > --- a/xen/common/version.c
> > +++ b/xen/common/version.c
> > @@ -203,8 +203,11 @@ void __init xen_build_init(void)
> >      rc =3D xen_build_id_check(n, sz, &build_id_p, &build_id_len);
> >
> >  #ifdef CONFIG_X86
> > -    /* Alternatively we may have a CodeView record from an EFI build. =
*/
> > -    if ( rc && efi_enabled(EFI_LOADER) )
> > +    /*
> > +     * xen.efi built with a new enough toolchain will have a CodeView =
record,
> > +     * not an ELF note.
> > +     */
> > +    if ( rc )
> >      {
> >          const struct pe_external_debug_directory *dir =3D (const void =
*)n;
> >
>=20
> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>=20
> I cannot see a better proposal in the discussion, but I prefer this
> fixed than keep it broken.

Yeah, I agree.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DO5O0aWk+efziVI9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiI9AcACgkQ24/THMrX
1yx8KQf+PqgTTR/ZlMmCWWPUAfis3TV9+tnD7UCRdFI+p55kQkRN0oG2wimZttRU
UJxJrJT5Wxay5ff/0JE5Ll59Pvpuy75fK6Wikpcc6/efdfQKZjhulJBiFWMmKvSm
nUngrozXchUaDpXrVakDzCn7kKDywRr6VFOc+xCueVu2FAs/3eDGox29OfZjqMpN
BFIqj9esxQQeLPGgdPEEfRWbOr6sjrUKbud6t4aZIp21cFbdljB719bFAcOj3a5t
uPpZFddSALiMZBXkRJW4NbyNnHz5y8FKgEs/IlBypFROX3ehDFOlqYkn2YRgrF/Y
hab9lzyznt0osOWCjHotgkvgOvfrHw==
=+GXC
-----END PGP SIGNATURE-----

--DO5O0aWk+efziVI9--

