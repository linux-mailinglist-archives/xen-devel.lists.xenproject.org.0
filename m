Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B57A077D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602322.938825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnUL-0003Fq-Ce; Thu, 14 Sep 2023 14:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602322.938825; Thu, 14 Sep 2023 14:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnUL-0003Cv-9v; Thu, 14 Sep 2023 14:38:37 +0000
Received: by outflank-mailman (input) for mailman id 602322;
 Thu, 14 Sep 2023 14:38:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HIRo=E6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1qgnUJ-0003AH-DQ
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:38:35 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6085357d-530c-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:38:32 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A54A5C0760;
 Thu, 14 Sep 2023 10:38:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 14 Sep 2023 10:38:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Sep 2023 10:38:30 -0400 (EDT)
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
X-Inumbo-ID: 6085357d-530c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694702311; x=1694788711; bh=RCSDC38+WheZVYogpfB0vQ3s4nnbpp5UZgV
	vye3EnMs=; b=SMOv6NyPZpvGC9JnvT4x+wEo/cSDHaVntyUuhbZlksws3D229dg
	/rur4jvQZU8SK7660aW541zuUk+ACdqq6zP9H+4ZQlcj+JvZxcYcEryKnSCS3JMX
	aPuaoVEZaKanHz30tQdELoQj3Vr6ByEL4zCZo6wOkrgnezpbhnqJHnmXNPf0lbzo
	Rmo9FfIXfUyrbnsK0v6A69PDtzZjNsyq8Y18O7J49PQhp2aBHlMVKJIHypBWTzZO
	awbb7PVrqyh9QXqCAKhCbYWGsdJ0z/aFMdwHKcLBDAIWlWonKWlSLyaUPYQF49Qg
	ErIOG0qZRoBKgaM3NfLEC75qx3o7MghpDRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694702311; x=1694788711; bh=RCSDC38+WheZV
	YogpfB0vQ3s4nnbpp5UZgVvye3EnMs=; b=UNYbKLxG87IMaTtGu7xNz2AU+yYYv
	HEsruIz/h/fyNl+jsTF4E7+yH6hUdP4wgRq+sy+GwMgScrbQLgiMqT/Q/Ey0BbTD
	L4Cf8j3M8FQ9QaIbeHR9pzUTF9e90xhmkksbgvf4GKKR7IiN7Cew7ToH+Sxs6r5W
	gs0W1ohi10bbL/hrqnxjsub5FBeFGk9VZBOPcUOocqvvLxOzm8d6TCU3rAdiyChD
	btpaBTzCW+0duWpRvkvM6gHtgl0UVrWZU/KrmWtb/zIABY8Pie/TtzScA1YYlmF4
	3+Vq6ZK3LDNDgUBaL3hnNFLigVtrOiKkMxwFF5nDa1E2XxXRgCjeRfSog==
X-ME-Sender: <xms:5xoDZUFOJ06JA8kOcMbHGURpQq5RqOMc3NVQHtGHTEFeKksxcUx12g>
    <xme:5xoDZdXT7GBH6HrdG5A0c0h_Z7fN1LXMSKV04srdvV0B0I64--6hbCQQdr_c5PeIZ
    KR0danJqjsLCNM>
X-ME-Received: <xmr:5xoDZeLn4wDmuKV7Cc1peYVa_x6hvDoYWVz708bRlT9mjnvdH-FLBsyckwt90AIE7gQQlJ5x5-B6JDouNEHycptpQyzvgtKzcLhRERs7N4ZwcOgn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejtddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepfffhfeduueekteeukedutddvteei
    hfekgeevueeugeeguddthfehveefgeegueevnecuffhomhgrihhnpehinhhtvghlrdgtoh
    hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggv
    mhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5xoDZWEzmiidib49oIaEwHHbSo39sTpl04tFK0i_AjzJljfBTRj9-Q>
    <xmx:5xoDZaXKgIs6usFFIenFzUBTA6Xv0fGIyLqvGgOxRtLQhmEuVDEyJQ>
    <xmx:5xoDZZMi6YKr-cSmOwCrxJw4T8dLHluJeowGN8wtwBBMKVE7_ONLVQ>
    <xmx:5xoDZcLFeKevaZ1d2j-aFs56gMEDYy1j1cauKCW7oscSdSC0Uc2uiQ>
Feedback-ID: iac594737:Fastmail
Date: Thu, 14 Sep 2023 10:38:26 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent
 timing mode
Message-ID: <ZQMa5RJgUvRdrN/Q@itl-email>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
 <dfbbf38c-8651-5396-c966-365fe954df48@suse.com>
 <bfe3a681-7dbd-462c-9a8c-969d5a99aaa1@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tEkGPxy9bbj3qfxH"
Content-Disposition: inline
In-Reply-To: <bfe3a681-7dbd-462c-9a8c-969d5a99aaa1@xen.org>


--tEkGPxy9bbj3qfxH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 Sep 2023 10:38:26 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent
 timing mode

On Thu, Sep 14, 2023 at 10:04:31AM +0100, Julien Grall wrote:
> Hi Jan,
>=20
> On 14/09/2023 07:32, Jan Beulich wrote:
> > On 13.09.2023 19:56, Julien Grall wrote:
> > > On 11/09/2023 16:01, Jan Beulich wrote:
> > > > [1] specifies a long list of instructions which are intended to exh=
ibit
> > > > timing behavior independent of the data they operate on. On certain
> > > > hardware this independence is optional, controlled by a bit in a new
> > > > MSR. Provide a command line option to control the mode Xen and its
> > > > guests are to operate in, with a build time control over the defaul=
t.
> > > > Longer term we may want to allow guests to control this.
> > >=20
> > > If I read correctly the discussion on the previous version. There was
> > > some concern with this version of patch. I can't find anything public
> > > suggesting that the concerned were dismissed. Do you have any pointer?
> >=20
> > Well, I can point to the XenServer patch queue, which since then has
> > gained a patch of similar (less flexible) functionality (and seeing
> > the similarity I was puzzled by this patch, which was posted late
> > for 4.17, not having gone in quite some time ago). This to me
> > demonstrates that the original concerns were "downgraded". It would
> > of course still be desirable to have guests control the behavior for
> > themselves, but that's a more intrusive change left for the future.
> >=20
> > Beyond that I guess I need to have Andrew speak for himself.
> >=20
> > > > Since Arm64 supposedly also has such a control, put command line op=
tion
> > > > and Kconfig control in common files.
> > > >=20
> > > > [1] https://www.intel.com/content/www/us/en/developer/articles/tech=
nical/software-security-guidance/best-practices/data-operand-independent-ti=
ming-isa-guidance.html
> > > >=20
> > > > Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > > ---
> > > > This may be viewed as a new feature, and hence be too late for 4.18=
=2E It
> > > > may, however, also be viewed as security relevant, which is why I'd=
 like
> > > > to propose to at least consider it.
> > > >=20
> > > > Slightly RFC, in particular for whether the Kconfig option should
> > > > default to Y or N.
> > >=20
> > > I am not entirely sure. I understand that DIT will help in the
> > > cryptographic case but it is not clear to me what is the performance =
impact.
> >=20
> > The entire purpose of the bit is to have a performance impact, slowing
> > down execution when fastpaths could be taken, but shouldn't to achieve
> > the named goal.
>=20
> I understood that. My question was more related to how much it will degra=
de
> the performance. This will help to know whether the default should be yes=
 or
> no.

This information is not available.  You could do benchmarks with and
without this patch if you wanted to obtain it.

> > > > --- a/xen/arch/x86/cpu/common.c
> > > > +++ b/xen/arch/x86/cpu/common.c
> > > > @@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
> > > >    		alternative_vcall(ctxt_switch_masking, next);
> > > >    }
> > > > +static void setup_doitm(void)
> > > > +{
> > > > +    uint64_t msr;
> > > > +
> > > > +    if ( !cpu_has_doitm )
> > >=20
> > > I am not very familiar with the feature. If it is not present, then c=
an
> > > we guarantee that the instructions will be executed in constant time?
> >=20
> > _We_ cannot guarantee anything. It is only hardware vendors who can. As=
 a
> > result I can only again refer you to the referenced documentation. It
> > claims that without the bit being supported in hardware, an extensive
> > list of insns is going to expose data operand independent performance.
>=20
> Right. So ...
>=20
> >=20
> > > If not, I think we should taint Xen and/or print a message if the adm=
in
> > > requested to use DIT. This would make clear that the admin is trying =
to
> > > do something that doesn't work.
> >=20
> > Tainting Xen on all hardware not exposing the bit would seem entirely
> > unreasonable to me. If we learned of specific cases where the vendor
> > promises are broken, we could taint there, sure. I guess that would be
> > individual XSAs / CVEs then for each instance.
>=20
> ... we need to somehow let the user know that the HW it is running on may
> not honor DIT. Tainting might be a bit too harsh, but I think printing a
> message with warning_add() is necessary.

Prior to DOITM, the data-operand-independent timing of certain
instructions was an implicit contract between hardware and software.
DOITM made several changes:

1. The implicit contract has been replaced by an architectural
   guarantee.  This guarantee has a specific list of instructions to
   which it applies, as well as a specific list of operands that timing
   will be independent of.  The guarantee has also been made conditional
   on DOITM being enabled =E2=80=94 if it is disabled, no guarantees are ma=
de.

2. Intel has retroactively extended this guarantee to all previous CPU
   architectures, including ones that do not give software control over
   DOITM.

3. Intel has stated that on architectures that do not expose DOITM
   control to software, DOITM is always enabled and cannot be disabled.

4. Intel has stated that on newer architectures (ones that _do_ expose
   DOITM), _DOITM is now disabled by default_.

This is a _backwards-incompatible change to the Intel 64 architecture_.
Software (including user-mode software) that was correct on older
hardware is now vulnerable on newer hardware if DOITM is disabled, which
is the default.  To fix this software, DOITM must be enabled by systems
software.

Conditionally enabling DOITM is not practical.  Modifying the DOITM
state requires an MSR write, which is a privileged instruction.
Executing a system call on entry and exit to cryptographic code has
a prohibitive performance penalty and requires changing not only every
single cryptographic library on the system, but also other libraries
(such as libcryptsetup) that rely on constant-time handling of secrets.
Therefore, enabling DOITM unconditionally and permanently is the only
feasible mitigation for this problem.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--tEkGPxy9bbj3qfxH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmUDGuUACgkQsoi1X/+c
IsFQ1Q//esvF9C5KvFTGGR8vAoH/bri5VtwOlkF7HaFZLB7Kjg2RRCDhItMM75kD
67MAstli+QvaCr0MKLJZmRhCAoJlrLFbamgqvEfCUrykpHH59VDL2inm9gHaiWn5
cLzdbeYs8BsG+9UeGS10bXO5BP8+LZMW5fLuS2u4XnOfbvJfq9Bg93xoHjcIrymj
2imaDJK+ah8BgZpA+kySAme/tJtzRfznYqfWb6OIV2COHMTA+5Q+MFVv9FzyaQj9
eqKzZDFp84Bhh52IuxdVATRqJ8wdjy+FkdWZ+yY3pXUWwIh25zYzKwOvt+EWKFWF
MThWiMZRdHsWecZRvwohLOYC2Vw4VLgRrMmoGaltVK2twFk0j+LmHDtplX+aFQgE
ZIlZRo7xvR3YTqoGUp88BNl0yaa4/KiKmpzBdfGWcvwfvF1c99F+ldgoYUrVFlTS
QAurMe3KA12ag0NKe0h7PUvY5AKOLuelUpkUsOsYzJQNFkb5sjHWZ9AHArXSyb7L
YLs5GB2cnvZq6mFDqWA15DRvtYU+wraMGsTmXMCnA6mb1MTYAZfcESyNy1s7zoQU
S6En1Gx3Mb/z6p2Jk2c+3Rng0G0F7HwuQQyRivn8tIb4Fu1Ygg0mDbcF0r7sOZFq
5X4CGF87BP2Fo8wtl7HcSDYkrMHkrdIS9YnLoYCL/O8HjWRuidY=
=PLMa
-----END PGP SIGNATURE-----

--tEkGPxy9bbj3qfxH--

