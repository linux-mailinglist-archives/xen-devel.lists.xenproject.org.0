Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA58653DCC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468394.727487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8ILN-0005kE-Be; Thu, 22 Dec 2022 09:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468394.727487; Thu, 22 Dec 2022 09:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8ILN-0005iQ-7M; Thu, 22 Dec 2022 09:58:29 +0000
Received: by outflank-mailman (input) for mailman id 468394;
 Thu, 22 Dec 2022 09:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8ILL-0005i4-R9
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:58:27 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ce950d3-81df-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 10:58:26 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 7E16F3200931;
 Thu, 22 Dec 2022 04:58:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 22 Dec 2022 04:58:25 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 04:58:23 -0500 (EST)
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
X-Inumbo-ID: 2ce950d3-81df-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671703104; x=
	1671789504; bh=vIsANOh8A7Pi5td2jYaouv7GsdBldfAzc3JwYRzGP8s=; b=a
	gJk0YWl8tSRpfPdKjpbfX/v4ZPQwcoyYyD3GB1ImvKUALKpsXLEUYWmQS+i1/mMj
	Fds7Tx6g/x2b+dhKEBDhlLo2c9BRLXpt+GcixbjknteecyhMYqypzwebH3a/SXRI
	Q68aideCiJa3JbQ4ebN7SIlKLnODY96J5qbayuIIui+So9LtpZ1cfqGspFtzYpBi
	A2UaRofeDOEkDH09/rhft6toUJP0mLuaLscdCHrUvNlKckMxXfyKvsH6Dadf1j/q
	ZoziTfxA8Q4esjE9Jtyct1D9Uj1pm1VzLtwpmimnD4riHMCNWT8gzySLNtEoGj8u
	OnV+VFxN00EOvHVzrI4lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671703104; x=1671789504; bh=vIsANOh8A7Pi5td2jYaouv7GsdBl
	dfAzc3JwYRzGP8s=; b=M4KrQWSshHuZb9lf8hgzxdXFeWSLkU9zBluiSxfBW9Og
	nxqj+CO5zSqR8qm/j3YYALWh5hvLZmg5/nFEzQ7VGSYWLK8SrMAvhZDeYFc2iJ8d
	BUtmu0DmpJ1wRPMeNZYrVXf2+xj3JgemfpX+A0M+z+ZUiPgisQB/qnGcJK0bmxeA
	3YS/3TdxYj69C04R/Zk90Bgf9sa+OGrMusG6gRGs0/Vhbqg1R4HONzSpdzmtthiJ
	18gELmHBJ74AWtZTMQj2rPGRGeJUYXC/rn4RfZhzbbj28QDdVYWD5/Zz/c7hgBKZ
	Bf8+xu4I7lC/zs+75+U6GaS/OaKkZdn1+7EboAJH4A==
X-ME-Sender: <xms:PyqkY6Hl-lotRQx737C4BTPfIROHZ2Mswc3gOX6hqN8YqSeyUjUloQ>
    <xme:PyqkY7WHhL3ad2kVaIqgvd32WDYv98_nUA9hG--yvEuyyGUOAAiHI69KHo62aPj8P
    vSdFVAtTjnMmdo>
X-ME-Received: <xmr:PyqkY0K-lssCMaExrVOFQWVS6JmIUtUoaX1VDr7tFIM1PRSA4u1EcDRN5ssP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:QCqkY0G62QOiWt_E-NUE6dvDJHPmi6NcRDhyCJDZ1j00n1RymAAGRA>
    <xmx:QCqkYwV4Oo8yvkhSf4nods55AkLRKigHL5p8vn8dlKUICBt3NZYTDg>
    <xmx:QCqkY3M0PP9Fq1WZBz8CwEvoZQMp1neILxD2LCB4vKO83cj03iq28g>
    <xmx:QCqkYzFpI3iCu6lGsA5rtQEW9dbdN8ITT_3Yn-NjJRCKl0rS_K0Cpw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 22 Dec 2022 04:58:20 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()
Message-ID: <Y6QqPWAwKRBXDOOT@itl-email>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <0026e56a0c91cb0dde9fe19200f473d720a9a950.1671497984.git.demi@invisiblethingslab.com>
 <98839620-d058-5088-da3d-4d200d70b003@suse.com>
 <b033f8bd-3f5d-b4a7-5197-8d098546b25b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QiIKifiey0D8jw9w"
Content-Disposition: inline
In-Reply-To: <b033f8bd-3f5d-b4a7-5197-8d098546b25b@suse.com>


--QiIKifiey0D8jw9w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Dec 2022 04:58:20 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 02/10] x86/mm: Avoid hard-coding PAT in
 get_page_from_l1e()

On Thu, Dec 22, 2022 at 10:51:08AM +0100, Jan Beulich wrote:
> On 20.12.2022 09:19, Jan Beulich wrote:
> > On 20.12.2022 02:07, Demi Marie Obenour wrote:
> >> get_page_from_l1e() relied on Xen's choice of PAT, which is brittle in
> >> the face of future PAT changes.  Instead, compute the actual cacheabil=
ity
> >> used by the CPU and switch on that, as this will work no matter what P=
AT
> >> Xen uses.
> >>
> >> No functional change intended.  This code is itself questionable and m=
ay
> >> be removed in the future, but removing it would be an observable
> >> behavior change and so is out of scope for this patch series.
> >>
> >> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >> ---
> >> Changes since v4:
> >> - Do not add new pte_flags_to_cacheability() helper, as this code may =
be
> >>   removed in the near future and so adding a new helper for it is a bad
> >>   idea.
> >> - Do not BUG() in the event of an unexpected cacheability.  This cannot
> >>   happen, but it is simpler to force such types to UC than to prove th=
at
> >>   the BUG() is not reachable.
> >>
> >> Changes since v3:
> >> - Compute and use the actual cacheability as seen by the processor.
> >>
> >> Changes since v2:
> >> - Improve commit message.
> >> ---
> >>  xen/arch/x86/mm.c | 14 ++++++++------
> >>  1 file changed, 8 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> >> index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..dba6c77ef2f7ed7fcb7f7e=
526583ccadd35e62cc 100644
> >> --- a/xen/arch/x86/mm.c
> >> +++ b/xen/arch/x86/mm.c
> >> @@ -959,14 +959,16 @@ get_page_from_l1e(
> >>              flip =3D _PAGE_RW;
> >>          }
> >> =20
> >> -        switch ( l1f & PAGE_CACHE_ATTRS )
> >> +        switch ( 0xFF & (XEN_MSR_PAT >> (8 * pte_flags_to_cacheattr(l=
1f))) )
> >>          {
> >> -        case 0: /* WB */
> >> -            flip |=3D _PAGE_PWT | _PAGE_PCD;
> >> +        case X86_MT_UC:
> >> +        case X86_MT_UCM:
> >> +        case X86_MT_WC:
> >> +            /* not cacheable */
> >>              break;
> >> -        case _PAGE_PWT: /* WT */
> >> -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> >> -            flip |=3D _PAGE_PCD | (l1f & _PAGE_PAT);
> >> +        default:
> >> +            /* cacheable */
> >> +            flip |=3D ((l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC);
> >>              break;
> >=20
> > In v4 the comment here was "cacheable, force to UC". The latter aspect =
is
> > quite relevant (and iirc also what Andrew had asked for to have as a
> > comment). But with this now being the default case, the comment (in eit=
her
> > this or the earlier form) would become stale. A forward compatible way =
of
> > wording this would e.g. be "force any other type to UC". With an adjust=
ment
> > along these lines (which I think could be done while committing)
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> If you had replied signaling your consent (and perhaps the preferred by y=
ou
> wording), I would have committed this. Now it's going to be v6 afaic ...
>=20
> Jan

Sorry about that.  "potentially cacheable, force to UC" is the wording
I have planned for v6, along with "not cacheable, allow" in the other
case.  Feel free to go ahead and commit if you want.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--QiIKifiey0D8jw9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOkKj0ACgkQsoi1X/+c
IsGStRAAoyyENEx0AuL7ebkJ8Lmtdm06zwG6hfumHUqTNIRqvrvfTNiNk34WQc1M
vK032s+MJjcNtizWSHp6+9p4Zaj0IGvfU4+FpBiKuONgiCnS6F6ZQN7JVMwKaXBp
nYZLYnKu4QCZn2ET3ROGetA4ZW7coOaMIF/+lrc57ecXtAPsdsftTNWR//qAyEFG
DFhuAHI00Y/1LUW09x++yIRcZShUGLEyW2oyjmeZDryNHKGRozZaOa/xtfrUXYBd
TW/CSy7th4MwZHmDnT8E1IDXiIp+7envyFeMC9qM83YPQY1HzR8Fa5/zXXdDQbo2
I5ICzebwm9ntfThoMi7nQ9lyYt/vQReLepqYK2zJh/ADxrf1aTwg9rME+l/8k45h
M3gLYbIJOOK5rGfYGwi0cVIne9qpft3SyXsG9MJ9++MGNc0FnP36jcuL45o4SzZg
1iouXe7FO5BA2ZiKJ5wqoUjLSB2Si/vAtR89J8wh3nqoHL6bE80RBfvV/aBjQPeW
CwUizcJwwWX9L/hrdPsey5+BbrjrZNIlciOG8JdF8D7eSoroRlzG4UASNrSVc5rs
GhQUeHEcjUJNE4SybJoivGSGda8U9W9cR3fZN6vborQv/ZcpSJ02lThLFlTXPRqA
JHQZvBRtCR5ez3HrGMZwxYJ4+QLeUCA7Ino/d3F/HA87oasbyRg=
=G5Y4
-----END PGP SIGNATURE-----

--QiIKifiey0D8jw9w--

