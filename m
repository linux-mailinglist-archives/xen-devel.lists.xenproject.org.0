Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9CD98E803
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 03:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809142.1221328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swANk-00019W-AD; Thu, 03 Oct 2024 01:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809142.1221328; Thu, 03 Oct 2024 01:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swANk-00017J-7R; Thu, 03 Oct 2024 01:11:52 +0000
Received: by outflank-mailman (input) for mailman id 809142;
 Thu, 03 Oct 2024 01:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GA31=Q7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swANi-000177-Qw
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 01:11:50 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 769693a4-8124-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 03:11:49 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 80033114023B;
 Wed,  2 Oct 2024 21:11:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 02 Oct 2024 21:11:47 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 21:11:45 -0400 (EDT)
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
X-Inumbo-ID: 769693a4-8124-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727917907;
	 x=1728004307; bh=CtUHP3jB5cRP6cAZbep5wGuWQ0lBrQ5/ob0Vx5TtEGg=; b=
	M4+c/4HCpKL129aT0hi4k6iTb2MQ51OJZia91+FQ6syEIkNv1TqzVa9PwIWqVQWt
	XBNj84gJNCDvkP8excO0TD17K+rMZp4gQyjiuMonske+BAaO0Z4IxWKeVDyxlaYv
	TWXcK2qt0wwXegNDxTnq8VFESJIljprWeE+2g3vTYdICaR2Z+36rNKBY823hmxue
	8IdVZJSlp47NH374OSd//Q1PYmieGM56r5XN/3Sgz9Qi37g+8SUtAdQQZ7G7O089
	8+xRtjJgvhiPVd8eXpUHKLPlV6TG9vN/xurRZH73eZSD5eexCraj/oDHS+cd4gpX
	hzGbY+OnEQ1dAFXJpoW40g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727917907; x=1728004307; bh=CtUHP3jB5cRP6cAZbep5wGuWQ0lB
	rQ5/ob0Vx5TtEGg=; b=E4hvNP+lIAdRYPmqC+e4iYsKx3hFqeK5NWl9qY0cBMbu
	7icVlZEUbht5uk4VNtX4Er5j+ndjxWG2mnEeTggVZ5KbDwUmmVZ4iGlr7Mg1vo1h
	9CQ7PzBFVvmIXRCqY5atOIf3i8jZEWXRW3Fa7UwTE+u3IQZZepeME5s1OUPYIkg2
	XSPmxmztllHbjuClRdJrOly5Hy19sbVSAWeTgNrH26+1Tk9UYRXQhC/6jNoLYcvQ
	pXCTcnvmofykkW5vjK7xyyaMw6hqGKDH6qdQAOl8P7ghZDu+YKOJ3TJbdwwqNCxs
	Lf01ShgTnI+z9cgXxXZJtfFrhxtXSrfbD2SFwRCoMw==
X-ME-Sender: <xms:U-_9Zotv97u2wMHoDx3PK629MZKxbjN0B3O7fC8B8dfTH8ae4Sy6iA>
    <xme:U-_9Zld8q_wp3iheXqfiUcbdd7FplHHIViQSvmypuyVVPWZE4btW2ksuqqq8kTYj4
    be-O_amoD-tSg>
X-ME-Received: <xmr:U-_9ZjxzTrDmaoR8zgHHwdToiJ1Zji4nXc2zLqi_9DT0KTxkeZfR80iGCoXtJBYOdLXhBAS_wsuG2jxAxXNo2ENW7hLHZ03ycA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvtddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheetheelge
    euledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegtlhhouh
    gurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprh
    gtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghp
    thhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepughpsh
    hmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:U-_9ZrNkIhW1P2sZziiQnxQ3TsOj5WF81WN3L5qkgCuUn1XNocXOKA>
    <xmx:U-_9Zo92ZTHJqb3x-cH2_JdeTdmXTf4bMnhr9IitoibfAJflPIp2mw>
    <xmx:U-_9ZjWRcv9rbVbgdCErrI0Xeb8TmhGhcAGNyJ99V02KV48QBIwpdw>
    <xmx:U-_9ZhcDt_c4-qzLFYZ-WnUCnMhY0T0JaAQPNhWxw0VUlMGlCiBi8A>
    <xmx:U-_9ZnknJibpdwvYp9zykWEzpOwQ_b0E4dmAWYZ15xOXG2qt7y4dJdNV>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Oct 2024 03:11:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code
Message-ID: <Zv3vUCLlaZSN84D_@mail-itl>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <Zv1S88isxSSMuqqk@mail-itl>
 <CACHz=ZhmsA_7eiV+MXi6=3NRzro_sZZK+-Kt-PJ_FS6RfZPZ6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H/4eFjPcwcvGvPEV"
Content-Disposition: inline
In-Reply-To: <CACHz=ZhmsA_7eiV+MXi6=3NRzro_sZZK+-Kt-PJ_FS6RfZPZ6g@mail.gmail.com>


--H/4eFjPcwcvGvPEV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Oct 2024 03:11:43 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code

On Wed, Oct 02, 2024 at 04:27:19PM +0100, Frediano Ziglio wrote:
> On Wed, Oct 2, 2024 at 3:04=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Tue, Oct 01, 2024 at 11:22:37AM +0100, Frediano Ziglio wrote:
> > > This series came from part of the work of removing duplications betwe=
en
> > > boot code and rewriting part of code from assembly to C.
> > > Rewrites EFI code in pure C.
> >
> > The MB2+EFI tests on Adler Lake fail with this series:
> > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/14787667=
82
> > Looking at the VGA output (unfortunately not collected by the test
> > itself) it hangs just after bootloader, before printing anything on the
> > screen (or even clearing it after bootloader). The serial is silent too.
> >
>=20
> I tried multiple times to take a look at the logs, but I keep getting err=
or 500.

500? That's weird. Anyway, serial log is empty, so you haven't lost
much.
But also, I've ran it a couple more times and it is some regression.
Staging reliably passes while staging+this series fails.

Unfortunately I don't have any more info besides it hangs before
printing anything on serial or VGA. Maybe it hanging only on Intel but
not AMD is some hint? Or maybe it's some memory layout or firmware
differences that matter here (bootloader is exactly the same)?
FWIW some links:
successful staging run on ADL: https://gitlab.com/xen-project/people/marmar=
ek/xen/-/jobs/7980146338
failed staging+this run on ADL: https://gitlab.com/xen-project/people/marma=
rek/xen/-/jobs/7980330394
successful staging run on Zen3+: https://gitlab.com/xen-project/people/marm=
arek/xen/-/jobs/7980146359
successful staging+this run on Zen3+: https://gitlab.com/xen-project/people=
/marmarek/xen/-/jobs/7980146359

> > It does pass on Zen 3+ runners.
> >
> > Since there were some issues with the ADL runner today on plain staging,
> > I'm not 100% sure if it isn't some infrastructure issue yet. But the
> > symptoms look different than usual infra issues (and different than
> > todays failures on staging), so I think it's more likely an issue with
> > the patches here.
> >
> > > Changes since v1, more details in specific commits:
> > > - style updates;
> > > - comments and descriptions improvements;
> > > - other improvements.
> > >
> > > Changes since v2:
> > > - rebased on master, resolved conflicts;
> > > - add comment on trampoline section.
> > >
> > > Changes since v3:
> > > - changed new function name;
> > > - declare efi_multiboot2 in a separate header;
> > > - distinguish entry point from using magic number;
> > > - other minor changes (see commens in commits).
> > >
> > > Changes since v4:
> > > - rebase on staging;
> > > - set %fs and %gs as other segment registers;
> > > - style and other changes.
> > >
> > > Changes since v5:
> > > - fixed a typo.
> > >
> > > Changes since v6:
> > > - remove merged patch;
> > > - comment and style;
> > > - change some pointer checks to avoid overflows;
> > > - rename parse-mbi2.c to mbi2.c.
> > >
> > > Frediano Ziglio (2):
> > >   x86/boot: Rewrite EFI/MBI2 code partly in C
> > >   x86/boot: Improve MBI2 structure check
> > >
> > >  xen/arch/x86/boot/head.S       | 146 +++++++------------------------=
--
> > >  xen/arch/x86/efi/Makefile      |   1 +
> > >  xen/arch/x86/efi/efi-boot.h    |   7 +-
> > >  xen/arch/x86/efi/mbi2.c        |  66 +++++++++++++++
> > >  xen/arch/x86/efi/stub.c        |  10 +--
> > >  xen/arch/x86/include/asm/efi.h |  18 ++++
> > >  6 files changed, 123 insertions(+), 125 deletions(-)
> > >  create mode 100644 xen/arch/x86/efi/mbi2.c
> > >  create mode 100644 xen/arch/x86/include/asm/efi.h
> > >
>=20
> Frediano

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--H/4eFjPcwcvGvPEV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb971AACgkQ24/THMrX
1ywg3gf/UAtUQR4iHMwE9e+Xg0JKg1094gogZLv/jLqoJKsP5xQfDcWm0cvDfGWB
rnPWpn4dw5oIUNo53ZSLs1i1+jXoieU1ivvxpYAL2/oZznBDJNl1dVPLPzMhLGSe
T3IhwvuEBGQZGTkCbX8DcQ4bqh9vBdopBbz37EMeunPWmKsIwLgUjJdQO9Qc1HqT
qV0iO0vLKU2/o3A1MW6o27tFpvv5fSMB5O9aWpoO7cenvETAFlkaCx+ZzN7D7Mh9
nAN7T59UpPZKCTR1Fwh8YrNJQP02SVLubHytd5IzBU8LdMk/vtk6AkSiJmjq2KwD
PpOUs2FhS8cNGqG2F9fXRTh4Y79fEg==
=XBYH
-----END PGP SIGNATURE-----

--H/4eFjPcwcvGvPEV--

