Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75698ED4E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 12:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809253.1221480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJLv-0003j6-Ae; Thu, 03 Oct 2024 10:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809253.1221480; Thu, 03 Oct 2024 10:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJLv-0003g9-72; Thu, 03 Oct 2024 10:46:35 +0000
Received: by outflank-mailman (input) for mailman id 809253;
 Thu, 03 Oct 2024 10:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GA31=Q7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swJLt-0003g3-Ih
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 10:46:33 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf6996b8-8174-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 12:46:31 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 576C11140299;
 Thu,  3 Oct 2024 06:46:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Thu, 03 Oct 2024 06:46:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 06:46:27 -0400 (EDT)
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
X-Inumbo-ID: bf6996b8-8174-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727952389;
	 x=1728038789; bh=XfMvtogohk3mqqlQkyqZQEFn/uiGgj0gyaYLu0hSgz0=; b=
	XCCbKFdmkjucxFSahXHzr3cV89zubPH+UlEEf5gVrj18MsDPTFjBLb2wZ4S6RCsp
	+1uWBrA4FooNRK1vaa0CRTJDFs/OzflMbsbNK02EOho+eOVWdnAiZAcYgoJaXsIM
	4iQYWnxe9eycEsRLHg+5lRP5AWOElc5+XGqdKmlk4EnRnG4bTcO29YhUGgQGqCRD
	1TEZJ82df7b+XBWgvqYJ/tQbTgGmtFIpKQc8ESXzrTzdTWvD0zKi8/DASihHQp0V
	X67h+PgepYcrxKZ+hA1nIr5tWZTb7716HEzhj7gJCSdyWo2ztUCtSaA6QqvKAH8z
	GQdV6uHRgvPO22LbnKuE5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727952389; x=1728038789; bh=XfMvtogohk3mqqlQkyqZQEFn/uiG
	gj0gyaYLu0hSgz0=; b=UL3Kl4jRtmM5PqmQncGZuqCepuc0/baUP1YptXt41A8y
	kofT57pd+dDkUM0EpEkYwsTnyKSB26LmvL5JgkzS+48gz/qEUe3qMaqSnC16YgTt
	4tJdDfmbVKQSQmYsX3+tLSr+viRxYtB+S7A+nh6ZUkO4MZPsMIcQ20m6ybjj/yC3
	9z3dGbPet7Cm6bUXlqtmWO/jgnkViS5g53qkKmvDRb4787DmOjMWxXUbLs06G69P
	guzgMaRPfY1SaVLlSd66Y/pX2Fp9TyIojBGIZCJSfbh50dgwddJtjvLvyngpfPY8
	4ppm63lEt0WlxHQ2sFIvE//dM5pyaN3MdNsy29VGnA==
X-ME-Sender: <xms:BHb-ZhDxO8ex3jc7tLW-BPfUu3-U23Ed9-xkEPzjVMCKCnzPiriOug>
    <xme:BHb-Zvgf0BEHensypq0cereMCC_TxM0ag8athMz-DpU1tHOBc53kYR21puCVjTZbS
    qypEVnczV_vZw>
X-ME-Received: <xmr:BHb-ZsnEVhLr-Up1ZIv_umEBBQpoOn6JBWYKVTe5kB0y0lkzO5EcbryC0XlO6Mo2hUbpQUgJqeUEJqjRFzjfaAmi4uH6dq9AIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvuddgfedvucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:BHb-ZrzL7b9MDMuyULZbhrqMPcPKI8IvY2eifl5hxinNTdlOBI1Yeg>
    <xmx:BHb-ZmRr3nKJxQoiYtpNGVWgp2WVmDM1cz5wh_YQvvQkERk-KAKfcQ>
    <xmx:BHb-ZuYtRvZ1himWEFyzR4Ez6OXWXB1XE_EzJ33gS7KyeWcxNITgLw>
    <xmx:BHb-ZnTAwx-f1Gcf2jfjFcSFLt_bESXTrslMjbhXCMr8JzpDd_Mgaw>
    <xmx:BXb-ZjIwxJyUlT8NFl_HUMQVWSd8jWAxf3NB7y_c-2z7H1vl0SI5YEcN>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Oct 2024 12:46:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code
Message-ID: <Zv52ARxdQmDmM9V6@mail-itl>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <Zv1S88isxSSMuqqk@mail-itl>
 <CACHz=ZhmsA_7eiV+MXi6=3NRzro_sZZK+-Kt-PJ_FS6RfZPZ6g@mail.gmail.com>
 <Zv3vUCLlaZSN84D_@mail-itl>
 <CACHz=Zj141V4LCfDHKqV6ie9AHkYom4DaaJjxh9DQQaoe7bnGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3H+0HaVIyNTfPwe2"
Content-Disposition: inline
In-Reply-To: <CACHz=Zj141V4LCfDHKqV6ie9AHkYom4DaaJjxh9DQQaoe7bnGA@mail.gmail.com>


--3H+0HaVIyNTfPwe2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Oct 2024 12:46:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v7 0/2] x86/boot: Reduce assembly code

On Thu, Oct 03, 2024 at 10:27:15AM +0100, Frediano Ziglio wrote:
> On Thu, Oct 3, 2024 at 2:11=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Wed, Oct 02, 2024 at 04:27:19PM +0100, Frediano Ziglio wrote:
> > > On Wed, Oct 2, 2024 at 3:04=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > > <marmarek@invisiblethingslab.com> wrote:
> > > >
> > > > On Tue, Oct 01, 2024 at 11:22:37AM +0100, Frediano Ziglio wrote:
> > > > > This series came from part of the work of removing duplications b=
etween
> > > > > boot code and rewriting part of code from assembly to C.
> > > > > Rewrites EFI code in pure C.
> > > >
> > > > The MB2+EFI tests on Adler Lake fail with this series:
> > > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1478=
766782
> > > > Looking at the VGA output (unfortunately not collected by the test
> > > > itself) it hangs just after bootloader, before printing anything on=
 the
> > > > screen (or even clearing it after bootloader). The serial is silent=
 too.
> > > >
> > >
> > > I tried multiple times to take a look at the logs, but I keep getting=
 error 500.
> >
> > 500? That's weird. Anyway, serial log is empty, so you haven't lost
> > much.
>=20
> I'm getting pretty consistently. I can see the full pipeline, but not
> the single logs. I tried with both Firefox and Chrome, I also tried
> from home (just to check for something like firewall issues), always
> error 500.
>=20
> > But also, I've ran it a couple more times and it is some regression.
> > Staging reliably passes while staging+this series fails.
> >
> > Unfortunately I don't have any more info besides it hangs before
> > printing anything on serial or VGA. Maybe it hanging only on Intel but
> > not AMD is some hint? Or maybe it's some memory layout or firmware
> > differences that matter here (bootloader is exactly the same)?
> > FWIW some links:
> > successful staging run on ADL: https://gitlab.com/xen-project/people/ma=
rmarek/xen/-/jobs/7980146338
> > failed staging+this run on ADL: https://gitlab.com/xen-project/people/m=
armarek/xen/-/jobs/7980330394
> > successful staging run on Zen3+: https://gitlab.com/xen-project/people/=
marmarek/xen/-/jobs/7980146359
> > successful staging+this run on Zen3+: https://gitlab.com/xen-project/pe=
ople/marmarek/xen/-/jobs/7980146359
> >
>=20
> Furthermore, I tried with 2 additional machines in our Lab, one Intel,
> another AMD, both working for me.
> Either your compiler did something different or something special on
> the firmware.
>=20
> I could try downloading your executables and machines there, but as I
> said, I'm getting error 500 (not sure if we package artifacts).
>=20
> Can you try without last commit ?

Yes, this seems to work:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1480052345

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3H+0HaVIyNTfPwe2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb+dgEACgkQ24/THMrX
1yyQaQf/c5yiyxsWrU8wrbjhF8Rmdd1M5HtPB2mrcvJ0fM0pNdxoNlJy9weQLFSA
HC1F9osDwgp+DFcORXTj8mxvk8k3v37uNaz3dL+0AYuBQKleHprLncZdh8LHxsOU
s9ftJ2tEftKst/09gl0TpTOr3Nc0dQphVbsOobDqFqcgADVlWBXNBVirOdm4vM37
G7zhDFa9MtkkEDl8oh3GKLCBvve5AVCD/nBUfkZRvlC6OJ4aJ/qKqdTwSK9TGCJW
ISy8bixBitztPwdYOzvOp5lSj2b8qTmJNtLfAf7Uf+K/Gc7MyPYu37tRVx1eMMsx
x14xmtaztPZr1U9wZG1ycgXU+Q3c3Q==
=clWq
-----END PGP SIGNATURE-----

--3H+0HaVIyNTfPwe2--

