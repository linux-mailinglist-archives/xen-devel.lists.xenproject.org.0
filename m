Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B8994D1B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 15:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813110.1225920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9pv-0002sY-Di; Tue, 08 Oct 2024 13:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813110.1225920; Tue, 08 Oct 2024 13:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9pv-0002pl-AY; Tue, 08 Oct 2024 13:01:11 +0000
Received: by outflank-mailman (input) for mailman id 813110;
 Tue, 08 Oct 2024 13:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7aYj=RE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sy9pt-0002pf-Gv
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 13:01:09 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60f5e540-8575-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 15:01:06 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 21E751140227;
 Tue,  8 Oct 2024 09:01:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 08 Oct 2024 09:01:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 09:01:02 -0400 (EDT)
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
X-Inumbo-ID: 60f5e540-8575-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728392465;
	 x=1728478865; bh=taQaM4mliRg41dfr8UW+UA/4bdOxFihm4Mv6IQ6cfkw=; b=
	dG7AUr4F+A/ofYnwD9NRDHrXqTkGjpsl6FWtY7pP8XfcWkp+wbv00/0vuKPuzTN/
	wo/D5YHQ5Q/iBRj9okslPdvBhHHSXbWoXhs420ViDP+WCREYAeD10Rh4OJOm1ooL
	v/el3nspJuKJSRumbGNOFTWT1nz6rdmFo8v/hUDIMMz0E52O6lma/bzgQ8eUp13e
	iY83i4av+lWcd8jvjGbEjnvsvC11fJtKWBuLBV1bJ0jiox0ErvJQ4YnzNrgKVr8Y
	dNirywfe/fdWgGOv13hQKucXUXRfN5PmGRIXo6dQUyfb9611f2GBIwwsrcXBkOhx
	2ZfLNKUZ1N/ztDBFtbodJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728392465; x=1728478865; bh=taQaM4mliRg41dfr8UW+UA/4bdOx
	Fihm4Mv6IQ6cfkw=; b=aKiiRm3Z2OKsENYiL2R5ez5cpZJEtVrLjmYOwlGPskH0
	mh5AQhiRESK4KvrhFGT0bQZmOYU6DJaMTZhC9m6C3eU4bU5JDIMdZjj4cjqITliw
	39Ix/N+ZtUc6Tymy0RLDjYBICwi6iXB9ZV4Cg0//UyqCbZHVmAL17DLgEcbI1J4e
	2v9uRvKE6q93UamxuvHScD0wCgmSXuZi0rrO833WJ1XXmVu0PpUz6uuogaZE8Fz4
	2KVj3GIpW+/RUyuNZ9USly1JKvgBFt+y7fqqHjUYrZZoamdfjWnV/d80rx0BOyRu
	M9qX2ZZNQguylTE1UtBWzmQbc2qRw+bCZzemph8a4Q==
X-ME-Sender: <xms:EC0FZ1AevPefEwgqVIUqdqakbBdvSFIQh7NceqwBRy09GDWa9qyfcw>
    <xme:EC0FZzjkChhvMUEG-HndO05S_X5NuENFix6VZLrssm9qUPaHXOWKM_5Cc9OsG73QM
    -onRtW3lx_fmw>
X-ME-Received: <xmr:EC0FZwnUrfAuqXsQlRwKRW7pzRfuN1Dl78W2uR9Vtw6v8lenDFuMFL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepfeffudeludffvdegleelgeetfeffvdetudegtefhleehteffgfffhe
    dukeeitdeknecuffhomhgrihhnpehmihhsrhgrrdhorhhgrdhukhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehrohgsvghrthhordgsrghgnhgrrhgrsegsuh
    hgshgvnhhgrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehfvgguvghrihgtohdrshgvrhgrfhhinhhisegsuhhgshgvnhhgrdgtohhmpdhrtghp
    thhtoheptghonhhsuhhlthhinhhgsegsuhhgshgvnhhgrdgtohhmpdhrtghpthhtohepug
    hpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohep
    rghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:EC0FZ_zJsjEwVsjSpx-oGeCgwLNBq1tkDyi6KDTDKBJTCa8BS2qqDg>
    <xmx:EC0FZ6QsLMNAm7r8Ucl1VfGVouqdhp9mDlK03Znokj2vRIwpp8IbhQ>
    <xmx:EC0FZyb2AKqWfWCNIH52uP5iu-UIGG8AAngnYn-W-yPzsn_F5Jt7eQ>
    <xmx:EC0FZ7SDNJFfu0XaVw4KNQxVAfuDVfJxfZ7Y_6SLaici2H5KItT9RA>
    <xmx:ES0FZ3TsVYwA7pvBoGl_T7dZvpJnXDo64LUQeMiZcs5zrlZNy9MFxl1F>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 8 Oct 2024 15:00:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Federico Serafini <federico.serafini@bugseng.com>,
	consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
Message-ID: <ZwUtCytUDP4RM-Ro@mail-itl>
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
 <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
 <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
 <8d5e4761-9fc2-4e18-a6c2-9df1822dbbea@suse.com>
 <alpine.DEB.2.22.394.2410011431360.451631@ubuntu-linux-20-04-desktop>
 <02833aad-d6f1-4ffa-8d4a-d8c31e9b0524@suse.com>
 <2f51a8e7-4044-4a84-a541-100799a28012@bugseng.com>
 <1f8f6a0c-980f-43cb-9967-801641f8dbc0@suse.com>
 <9adf139f-cfa4-4e71-a02b-5b7cff898d01@bugseng.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Exw4z9V4c1GWFuBB"
Content-Disposition: inline
In-Reply-To: <9adf139f-cfa4-4e71-a02b-5b7cff898d01@bugseng.com>


--Exw4z9V4c1GWFuBB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Oct 2024 15:00:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Federico Serafini <federico.serafini@bugseng.com>,
	consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6

On Tue, Oct 08, 2024 at 02:49:52PM +0200, Roberto Bagnara wrote:
> On 2024-10-08 07:59, Jan Beulich wrote:
> > On 02.10.2024 08:54, Roberto Bagnara wrote:
> > > On 2024-10-02 08:09, Jan Beulich wrote:
> > > > On 01.10.2024 23:36, Stefano Stabellini wrote:
> > > > > On Tue, 1 Oct 2024, Jan Beulich wrote:
> > > > > > On 01.10.2024 07:25, Roberto Bagnara wrote:
> > > > > > > On 2024-09-30 15:07, Jan Beulich wrote:
> > > > > > > > On 30.09.2024 14:49, Federico Serafini wrote:
> > > > > > > > > guest_handle_ok()'s expansion contains a sizeof() involvi=
ng its
> > > > > > > > > first argument which is guest_handle_cast().
> > > > > > > > > The expansion of the latter, in turn, contains a variable
> > > > > > > > > initialization.
> > > > > > > > >=20
> > > > > > > > > Since MISRA considers the initialization (even of a local=
 variable)
> > > > > > > > > a side effect, the chain of expansions mentioned above vi=
olates
> > > > > > > > > MISRA C:2012 Rule 13.6 (The operand of the `sizeof' opera=
tor shall not
> > > > > > > > > contain any expression which has potential side effect).
> > > > > > > >=20
> > > > > > > > I'm afraid I need to ask for clarification of terminology a=
nd alike here.
> > > > > > > > While the Misra doc has a section on Persistent Side Effect=
s in its
> > > > > > > > Glossary appendix, what constitutes a side effect from its =
pov isn't
> > > > > > > > really spelled out anywhere. Which in turn raises the quest=
ion whether it
> > > > > > > > is indeed Misra (and not just Eclair) which deems initializ=
ation a side
> > > > > > > > effect. This is even more so relevant as 13.6 talks of only=
 expressions,
> > > > > > > > yet initializers fall under declarations (in turn involving=
 an expression
> > > > > > > > on the rhs of the equal sign).
> > > > > > > >=20
> > > > > > > > All the same of course affects patch 2 then, too.
> > > > > > >=20
> > > > > > > MISRA C leaves the definition of "side effect" to the C Stand=
ard.
> > > > > > > E.g., C18 5.1.2.3p2:
> > > > > > >=20
> > > > > > >      Accessing a volatile object, modifying an object, modify=
ing a file,
> > > > > > >      or calling a function that does any of those operations =
are all
> > > > > > >      side effects,[omitted irrelevant footnote reference] whi=
ch are
> > > > > > >      changes in the state of the execution environment.
> > > > > > >=20
> > > > > > > The MISRA C:2012/2023 Glossary entry for "Persistent side eff=
ect"
> > > > > > > indirectly confirms that initialization is always a side effe=
ct.
> > > > > >=20
> > > > > > Hmm, that's interesting: There's indeed an example with an init=
ializer
> > > > > > there. Yet to me the text you quote from the C standard does no=
t say
> > > > > > that initialization is a side effect - it would be "modifying an
> > > > > > object" aiui, yet ahead of initialization being complete the ob=
ject
> > > > > > doesn't "exist" imo, and hence can be "modified" only afterward=
s.
> > > > >=20
> > > > > I feel it's becoming a bit too philosophical. Since there's some =
room
> > > > > for interpretation and only two violations left to address, I bel=
ieve
> > > > > it's best to stick with the stricter interpretation of the defini=
tion.
> > > > > Therefore, I'd proceed with this series in its current form.
> > > >=20
> > > > Proceeding with the series in its current form may be okay (as you =
say,
> > > > you view the changes as readability improvements anyway), but imo t=
he
> > > > interpretation needs settling on no matter what. In fact even for t=
hese
> > > > two patches it may affect what their descriptions ought to say (wou=
ld
> > > > be nice imo to avoid permanently recording potentially misleading
> > > > information by committing as is). And of course clarity would help
> > > > dealing with future instances that might appear. I take it you real=
ize
> > > > that if someone had submitted a patch adding code similar to the
> > > > original forms of what's being altered here, it would be relatively
> > > > unlikely for a reviewer to spot the issue. IOW here we're making
> > > > ourselves heavily dependent upon Eclair spotting (supposed) issues,
> > > > adding extra work and delays for such changes to go in.
> > >=20
> > > You can do two things to obtain a second opinion:
> > >=20
> > > 1) Use the MISRA forum (here is the link to the forum
> > >      section devoted to the side-effect rules of MISRA C:2012
> > >      and MISRA C:2023 (https://forum.misra.org.uk/forumdisplay.php?fi=
d=3D168).
> > >      The MISRA C Working Group will, in due course, provide
> > >      you with an official answer to your questions about what,
> > >      for the interpretation of Rule 13.6, has to be considered
> > >      a side effect.
> > >=20
> > > 2) Reach out to your ISO National Body and try to obtain
> > >      an official answer from ISO/IEC JTC1/SC22/WG14 (the
> > >      international standardization working group for the
> > >      programming language C) to your questions about what the
> > >      C Standard considers to be side effects.
> >=20
> > I took the latter route, and to my (positive) surprise I got back an an=
swer
> > the same day. There was a request for someone to confirm, but so far I =
didn't
> > see further replies. Since this is a German institution I raised the qu=
estion
> > in German and got back an answer in German (attached); I've tried my be=
st to
> > translate this without falsifying anything, but I've omitted non-techni=
cal
> > parts:
> >=20
> > "Initialization of an object is never a side effect of the initializati=
on
> > by itself. Of course expressions used for initialization can themselves=
 have
> > side effects on other objects.
> >=20
> > @Andreas: Do you agree? C after all has a far simpler object model than=
 C++.
> > The (potential) change in object representation (i.e. the bytes underly=
ing
> > the object) is not a side effect of object initialization, but its prim=
ary
> > purpose."
> >=20
> > Further for Misra she added a reference to a Swiss person, but I think =
with
> > Bugseng we have sufficient expertise there.
>=20
> Unfortunately, the (translation of the) answer you received adds
> confusion to previous confusion: who answered has highlighted the
> "side" part of the term, which is indeed relevant in computer science,
> but not for the C standard.  To the point that the same argument could
> be used to deny that ++i has a side effect because the increment is
> the "primary" effect...
>=20
> Part of the confusion is maybe in the the following paragraph Jan
> wrote earlier:
>=20
> > Hmm, that's interesting: There's indeed an example with an initializer
> > there. Yet to me the text you quote from the C standard does not say
> > that initialization is a side effect - it would be "modifying an
> > object" aiui, yet ahead of initialization being complete the object
> > doesn't "exist" imo, and hence can be "modified" only afterwards.
>=20
> In C, it is not true that the object does not exist ahead of
> initialization.  Try the following:
>=20
> extern int f(int* p);
>=20
> int main() {
>   int i =3D f(&i);
> }

This is interesting discussion, but I don't think it needs to block
anything. The proposed change doesn't violate any other rule/code style,
and I'd argue it's more readable. Taking more strict interpretation in
this case doesn't really hurt. I already acked this patch.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Exw4z9V4c1GWFuBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcFLQsACgkQ24/THMrX
1yxdpQf8CnObZMn8i8a5xILyZdTvpXTjjRwGjaUskND7W/Al1e2d/NCNVAuI9CgU
n4doJ2wIryJPKDZapjfaF2KHsvbXBPQp+Ptm/yCoNw2dLnaQmljnZa6fjOV8Zr8U
1DI1b9XZD3hwKcwPGJNi941s8oN9hFntArIs0PNTf71K/lovTnwEW0A5zEZ4agXP
9PhYwTffefw/HVFKv2dLGyMUJblXnlSYyet618oUTO33BZ2KV6RIHsipoNk1wc+s
5jMCFFmDUAuhFNIMfwkodZxZns8sa4bZheMnH6DxmlrSGyloHw9URId/q+nxbytq
8sI4Zfciy1EdIcKtOEFfSUpimvj75A==
=1Mpf
-----END PGP SIGNATURE-----

--Exw4z9V4c1GWFuBB--

