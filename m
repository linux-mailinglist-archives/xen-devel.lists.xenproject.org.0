Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D113159AFA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 22:12:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1cmE-0004GO-7P; Tue, 11 Feb 2020 21:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2TDL=37=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1j1cmC-0004GJ-1B
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 21:09:00 +0000
X-Inumbo-ID: b849fa9e-4d12-11ea-bc8e-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b849fa9e-4d12-11ea-bc8e-bc764e2007e4;
 Tue, 11 Feb 2020 21:08:58 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9FFE9491;
 Tue, 11 Feb 2020 16:08:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 11 Feb 2020 16:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=C2cN5U
 9J3sB72UQswsoAtwr3opaSfmG3BjuephxhhMo=; b=LD6VNI9RmWoiyHPeWlwj7a
 PTvzgxGMGNUTTd7pqieIC/U45G6KW/7OEzFxor6A++DUqmqyrv1R/9dJph8Be5B5
 xzOCaK1lGQ8Wz9foyORQPDJK9tr6wbpYeUVUBVWxztWX6kaWUomtAOvEscTUDqab
 Kh0bEsXSIPXJ2ACApGOc4jiz+oo1ZX2PL7+sTl1MQxDtWHka79RMkRdqb13kqjhi
 qy+xNUuKYdSol0Bv0AbuE7s8Bhaivx5oAaUFe0lMqh1foV1Vqi/TI+AiXHoD2Laq
 Rv/iRxAG50nTHHyexRFdbafwz1BwBisLn5pHJh/RuU6B274HN9N3GU7JOtpfR4wg
 ==
X-ME-Sender: <xms:6BdDXg5-V_RbUN2QYFMCtQlkFgWlMQR-SWOhJweAKxjvVphWDz826g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieefgddufeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghl
 rdhorhhgpdhgihhthhhusgdrtghomhenucfkphepjeejrddvgeefrddukeefrddvtdefne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhm
 rghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:6BdDXtWN_0vBONTS_WBZtRufIRtvb89mcWYiZjzDzBjjZ1KPf1ls3g>
 <xmx:6BdDXi_Vg_N2LwtrPFugLa-w2ua47enenDr5gmnnAzq7dtweN1dhTA>
 <xmx:6BdDXpnlKoUMG_1zfC4LtvP1WlhgKg8YdS8-lW6Qfc41kk2iIgIq9A>
 <xmx:6RdDXs-dFKhkZmAf49u2uRj_sRcKdUaig6_sHCAl6oS5BJx_L8Euxg>
Received: from mail-itl (unknown [77.243.183.203])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59DE130606FB;
 Tue, 11 Feb 2020 16:08:55 -0500 (EST)
Date: Tue, 11 Feb 2020 22:08:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Claudia <claudia1@disroot.org>
Message-ID: <20200211210852.GF2995@mail-itl>
References: <20200210121443.GQ7869@mail-itl> <20200209230655.GA32524@mail-itl>
 <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
 <41b3896b-5414-bfdf-a515-bf2f06ab6463@citrix.com>
 <b1dfd8e66ff2cfdd1a5d77d46238b637@disroot.org>
MIME-Version: 1.0
In-Reply-To: <b1dfd8e66ff2cfdd1a5d77d46238b637@disroot.org>
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, zachm1996@gmail.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7080331572980044408=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7080331572980044408==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline


--+sHJum3is6Tsg7/J
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch

On Tue, Feb 11, 2020 at 12:59:22PM +0000, Claudia wrote:
> February 10, 2020 12:14 PM, "Marek Marczykowski-G=C3=B3recki" <marmarek@i=
nvisiblethingslab.com> wrote:
>=20
> > On Mon, Feb 10, 2020 at 11:17:34AM +0000, Andrew Cooper wrote:
> >=20
> >> On 10/02/2020 08:55, Jan Beulich wrote:
> >> On 10.02.2020 00:06, Marek Marczykowski-G=C3=B3recki wrote:
> >> Hi,
> >>=20
> >> Multiple Qubes users have reported issues with resuming from S3 on AMD
> >> systems (Ryzen 2500U, Ryzen Pro 3700U, maybe more). The error message
> >> is:
> >>=20
> >> (XEN) CPU0: cap[ 1] is 7ed8320b (expected f6d8320b)
> >>=20
> >> If I read it right, this is:
> >> - OSXSAVE: 0 -> 1
> >> - HYPERVISOR: 1 -> 0
> >>=20
> >> Commenting out the panic on a failed recheck_cpu_features() in power.c
> >> makes the system work after resume, reportedly stable. But that doesn't
> >> sounds like a good idea generally.
> >>=20
> >> Is this difference a Xen fault (some missing MSR / other register
> >> restore on resume)? Or BIOS vendor / AMD, that could be worked around =
in
> >> Xen?
> >> The transition of the HYPERVISOR bit is definitely a Xen issue,
> >> with Andrew having sent a patch already (iirc).
> >>=20
> >> https://lore.kernel.org/xen-devel/20200127202121.2961-1-andrew.cooper3=
@citrix.com
> >>=20
> >> Code is correct.  Commit message needs rework, including in light of
> >> this discovery.  (I may eventually split it into two patches.)
> >=20
> > Claudia, do you want to test with this patch?
>=20
> I'm getting hunk failed in domctl.c applying to R4.1 default repo (fc31, =
Xen 4.13). I'll see if I can fix it but bear with me, I'm new at this.
>=20
> Marek: Would you by any chance be willing to merge this into a test branc=
h on your repo, so the rest of us can pull it directly into qubes-builder? =
It'll take you a fraction of the time it'll take me, plus then zachm and aw=
okd and anyone else can pull it also.

Here is one for Xen 4.13:
https://github.com/QubesOS/qubes-vmm-xen/pull/71
builder.conf snippet for qubes-builder:

    BRANCH_vmm_xen=3Dxen-4.13-amd-suspend
    GIT_URL_vmm_xen=3Dhttps://github.com/marmarek/qubes-vmm-xen

This is already v2 patch from the other thread.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5DF+MACgkQ24/THMrX
1yytmwf+OVLdXMlHIkk1dm9BS+f1DLaJ64JQNcUu+EHemaVxKSNgtjiCbTOGFRLL
qYQtcsUvvk8SH+a9MTA3p/9dcK0hQ9GuY/sdnyWyAQEpEyQKCRBSP92/dEuYLK1N
dR9CU9n7jihfacDzgCr5niIPeHVBndjawwE/6GyfkMA7f1wM92xHZpaOoJv4scvV
lF77WxrUBFlsL0FPRtwtVMMOqKP89svIAHuUoySFd7YdkLlBoOtXojvRIc2y5Hfl
hpnGs6dCZp1m3cYMHvRempk2PMHBNS9Vh2LAtcPWhA7TdvDrGvsbDV2ACYyfH4Kw
8CbJPWXdeEhwNwO883t8rjjbMbpBgg==
=fHeA
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--


--===============7080331572980044408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7080331572980044408==--

