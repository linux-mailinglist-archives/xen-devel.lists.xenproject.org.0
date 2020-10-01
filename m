Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4427FF2F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 14:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1247.4209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNxkI-00035D-1u; Thu, 01 Oct 2020 12:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247.4209; Thu, 01 Oct 2020 12:31:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNxkH-00034o-Ud; Thu, 01 Oct 2020 12:31:37 +0000
Received: by outflank-mailman (input) for mailman id 1247;
 Thu, 01 Oct 2020 12:31:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kNxkG-00034j-Ck
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:31:36 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a491113e-0b4c-49e2-afa8-8001c88599d1;
 Thu, 01 Oct 2020 12:31:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 62FB35C0224;
 Thu,  1 Oct 2020 08:31:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 01 Oct 2020 08:31:35 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D9053064674;
 Thu,  1 Oct 2020 08:31:34 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kNxkG-00034j-Ck
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:31:36 +0000
X-Inumbo-ID: a491113e-0b4c-49e2-afa8-8001c88599d1
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a491113e-0b4c-49e2-afa8-8001c88599d1;
	Thu, 01 Oct 2020 12:31:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 62FB35C0224;
	Thu,  1 Oct 2020 08:31:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 01 Oct 2020 08:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZJ8pnZ
	Cnd0BhXzb3YzxNYDH8Wp/cgwuHStISOhnoTmY=; b=LE8rlfKpKB4UGtbuz3bPbB
	BAV4IJS/RvUK10zzusdWsud1w2LPSM/+viNbZGqKIkFjY6bBmixrB18e3eNjbd3Y
	ZWLoQMtZH2Lc/T5ZZpL+cXUVXJV3JrRlu1s8OOAt1JqVPU0Ke3RfjsA2TFJ0KGK/
	Q1b3O3KbH0VjadklG8ivSMKhD65xIgvvviVlXYpMFWyHz8x/2aKCE5Oo4tRBXPHt
	5SeA5cGbdaWIKrhqGQ+1RMOcouUAohs4XjRQSSP01sMzFUCewtg9rXkt//+Q1DuT
	/e9+j5dAOdNxJXC+FBQ/yH9STrkGMBReO8PY6GoFSGlxZ0tASOOsJVEX625Ej0zA
	==
X-ME-Sender: <xms:J8x1X39Vg5Tk8834dswaFFDGTqKpWEFk1AJYk6wYK9dP0PQ6agRSBA>
    <xme:J8x1XzudxXXoc-jNF229l3FvSAIYBLhHHUt7ZLWEkHzBdGe0-hDR4CaLPazpX1pf6
    qzBj9jj6Jx0HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeggdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:J8x1X1BMK8SGTXlxAQN2La2XLx35AAXn10Sk_aiwrWKt_8T-g2n3Wg>
    <xmx:J8x1XzfKomttmLrSTx-4_P27vyo2hIRbxGrisSNRTNat6DWZVyL_Ow>
    <xmx:J8x1X8NH9W4z9bMZyK-2po4IiYreuHnSj65HPHD12uQNqsLK6g4Dlg>
    <xmx:J8x1X3YcbLmHno6dwBdlVvbhUE7_KNHmTdZT0cBQNcHpiXecm_BvPg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2D9053064674;
	Thu,  1 Oct 2020 08:31:34 -0400 (EDT)
Date: Thu, 1 Oct 2020 14:31:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Yet another S3 issue in Xen 4.14
Message-ID: <20201001123129.GJ1482@mail-itl>
References: <20201001011245.GL3962@mail-itl>
 <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J2PFMayAIDoBVGKc"
Content-Disposition: inline
In-Reply-To: <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>


--J2PFMayAIDoBVGKc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Yet another S3 issue in Xen 4.14

On Thu, Oct 01, 2020 at 01:59:32PM +0200, Jan Beulich wrote:
> On 01.10.2020 03:12, Marek Marczykowski-G=C3=B3recki wrote:
> > After patching the previous issue ("x86/S3: Fix Shadow Stack resume
> > path") I still encounter issues resume from S3.
> > Since I had it working on Xen 4.13 on this particular hardware (Thinkpad
> > P52), I bisected it and got this:
> >=20
> > commit 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1
> > Author: Andrew Cooper <andrew.cooper3@citrix.com>
> > Date:   Wed Dec 11 20:59:19 2019 +0000
> >=20
> >     x86/S3: Drop {save,restore}_rest_processor_state() completely
> >    =20
> >     There is no need to save/restore FS/GS/XCR0 state.  It will be hand=
led
> >     suitably on the context switch away from the idle.
> >    =20
> >     The CR4 restoration in restore_rest_processor_state() was actually =
fighting
> >     later code in enter_state() which tried to keep CR4.MCE clear until=
 everything
> >     was set up.  Delete the intermediate restoration, and defer final r=
estoration
> >     until after MCE is reconfigured.
> >    =20
> >     Restoring PAT can be done earlier, and ideally before paging is ena=
bled.  By
> >     moving it into the trampoline during the setup for 64bit, the call =
can be
> >     dropped from cpu_init().  The EFI path boot path doesn't disable pa=
ging, so
> >     make the adjustment when switching onto Xen's pagetables.
> >    =20
> >     The only remaing piece of restoration is load_system_tables(), so s=
uspend.c
> >     can be deleted in its entirety.
> >    =20
> >     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >     Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >=20
> > Parent of this commit suspends and resumes just fine. With this commit
> > applied, it (I think) it panics, at least I get reboot after 5s. Sadly,=
 I
> > don't have serial console there.
> >=20
> > I tried also master and stable-4.14 with this commit reverted (and also
> > the other fix applied), but it doesn't work. In this case I get a hang =
on
> > resume (power led still flashing, but fan woke up). There are probably
> > some other dependencies.
>=20
> Since bisection may also point you at some intermediate breakage, which
> these last results of yours seem to support, could you check whether
> 55f8c389d434 put immediately on top of the above commit makes a differenc=
e,
> and if so resume bisecting from there?

Nope, 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1 with 55f8c389d434 on top
it still hangs on resume.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--J2PFMayAIDoBVGKc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl91zCIACgkQ24/THMrX
1yyDiwf9H36STPxH5ydOvf3T1opuGrYOFgTq4c/IapfGco6EbqRk9h5Gb7lkXuYj
cWytmEia0a1ZrbnGzHPFoMccuU7vnOdwXgYZzjzNkSeNN4miYk4S5JNv/QmlKIPd
1hqxvxrUye/zgVG7wHVx+xmeAFpHee6E9lrLNeemggWmV+X9cdBwPxgoRdLDIDqR
As7IBqhSjJ301YMXN5GZIXPfrZhMuMRP/NvIQE0rgLrGGzBHlqu7FmjzMDkcxtno
R0HGHdBnY4ZYbbOGMJc87fOcEB8WDREGgpXoiMdxJFxbyIGiKXnykr7vrI9yfz3u
eHvN7u5t3sgFZe1/POgARNYJCY5+7Q==
=DaQb
-----END PGP SIGNATURE-----

--J2PFMayAIDoBVGKc--

