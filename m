Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7D527D28F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 17:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.265.676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNHMs-0007mE-OH; Tue, 29 Sep 2020 15:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265.676; Tue, 29 Sep 2020 15:16:38 +0000
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
	id 1kNHMs-0007lp-Kb; Tue, 29 Sep 2020 15:16:38 +0000
Received: by outflank-mailman (input) for mailman id 265;
 Tue, 29 Sep 2020 15:16:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtTE=DG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kNHMr-0007ld-Ft
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:16:37 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af420b4b-a878-48ab-b5b3-3966eef24bfd;
 Tue, 29 Sep 2020 15:16:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 196BC4C3;
 Tue, 29 Sep 2020 11:16:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 29 Sep 2020 11:16:35 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 580733064685;
 Tue, 29 Sep 2020 11:16:33 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GtTE=DG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kNHMr-0007ld-Ft
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 15:16:37 +0000
X-Inumbo-ID: af420b4b-a878-48ab-b5b3-3966eef24bfd
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id af420b4b-a878-48ab-b5b3-3966eef24bfd;
	Tue, 29 Sep 2020 15:16:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 196BC4C3;
	Tue, 29 Sep 2020 11:16:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 29 Sep 2020 11:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=x7FDb5
	Qijz/o41mB54lRWou4GDNsWYPzXki/spKsJHk=; b=EO0F5JvQGq/d1qNMT8EqTK
	iIU5O5teezAtXspHPt9B40A6yHUEYgG24Xl0gzj46+wE9wJ8GrbuagzM/U77G3To
	3mj6VLbUkXLgG2QvqDbscmFSNdmLrXCuozKTwSwFkSXKLjvDMx0FwbHQEAqcajuz
	Ejh7LcpuEU8D1MvyhOVB+FLFQwXLAPdQs2b9/m9P29AKE97PS/3ZEcg3XzJ/Gs+Q
	ftfSEYg5cmteXAUwuK8iVoNvT/2gAix/pdhvlV9S4Jl2ZwvfyuEG9M+axVVD4wsS
	n5SvxM+Nf0TUvpx48jQaKofjC5/BY0f0VkrfyTPrcL34Z2gQWmsbJ0MKcAV2Q57g
	==
X-ME-Sender: <xms:0k9zX86pzq7bGlK9IxrJ4l2CvPu9NM2nTIXLLY_xiX6H1F9oWwuxGQ>
    <xme:0k9zX958a5A76WAsts2imGveSz9_pPAWVB9gKKBTNOiYDehWpPBryE5Lt3S9v4PYd
    ZX5GEbju7qx8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdekgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:0k9zX7f2-6dLTE5Q3h7phwgGmXURaz1vRp_C9NmxqmRN2qTQ9jMsiA>
    <xmx:0k9zXxLih018EWhY_nDjpyNi-0O_YkVHIyUqdt8GoWOBE3n37YhEGQ>
    <xmx:0k9zXwIy01juurkAhrk44dXO3V03gHNLDxBZMk_qTMzuXiYPN3VlMQ>
    <xmx:0k9zX6hd3ln4k_Wi-b5mdNQdLWe9b4D-YPlSlNyjUjhwX5YYrhAQzQ>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 580733064685;
	Tue, 29 Sep 2020 11:16:33 -0400 (EDT)
Date: Tue, 29 Sep 2020 17:16:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
Message-ID: <20200929151627.GE1482@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u2zjs13kMz/cGsQm"
Content-Disposition: inline
In-Reply-To: <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>


--u2zjs13kMz/cGsQm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13

On Tue, Sep 29, 2020 at 05:07:11PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 29.09.20 16:27, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
> > > > [Adding Juergen]
> > > >=20
> > > > On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=B3recki =
wrote:
> > > > > On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
> > > > > > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > In my test setup (inside KVM with nested virt enabled), I rat=
her
> > > > > > > frequently get Xen crash on resume from S3. Full message belo=
w.
> > > > > > >=20
> > > > > > > This is Xen 4.13.0, with some patches, including "sched: fix
> > > > > > > resuming
> > > > > > > from S3 with smt=3D0".
> > > > > > >=20
> > > > > > > Contrary to the previous issue, this one does not happen alwa=
ys -
> > > > > > > I
> > > > > > > would say in about 40% cases on this setup, but very rarely on
> > > > > > > physical
> > > > > > > setup.
> > > > > > >=20
> > > > > > > This is _without_ core scheduling enabled, and also with smt=
=3Doff.
> > > > > > >=20
> > > > > > > Do you think it would be any different on xen-unstable? I cat
> > > > > > > try, but
> > > > > > > it isn't trivial in this setup, so I'd ask first.
> > > > > > >=20
> > > > Well, Juergen has fixed quite a few issues.
> > > >=20
> > > > Most of them where triggering with core-scheduling enabled, and I d=
on't
> > > > recall any of them which looked similar or related to this.
> > > >=20
> > > > Still, it's possible that the same issue causes different symptoms,=
 and
> > > > hence that maybe one of the patches would fix this too.
> > >=20
> > > I've tested on master (d094e95fb7c), and reproduced exactly the same =
crash
> > > (pasted below for the completeness).
> > > But there is more: additionally, in most (all?) cases after resume I'=
ve got
> > > soft lockup in Linux dom0 in smp_call_function_single() - see below. =
It
> > > didn't happened before and the only change was Xen 4.13 -> master.
> > >=20
> > > Xen crash:
> > >=20
> > > (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' fail=
ed at credit2.c:2133
> >=20
> > Juergen, any idea about this one? This is also happening on the current
> > stable-4.14 (28855ebcdbfa).
> >=20
>=20
> Oh, sorry I didn't come back to this issue.
>=20
> I suspect this is related to stop_machine_run() being called during
> suspend(), as I'm seeing very sporadic issues when offlining and then
> onlining cpus with core scheduling being active (it seems as if the
> dom0 vcpu doing the cpu online activity sometimes is using an old
> vcpu state).

Note this is default Xen 4.14 start, so core scheduling is _not_ active:

    (XEN) Brought up 2 CPUs
    (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
    (XEN) Adding cpu 0 to runqueue 0
    (XEN)  First cpu on runqueue, activating
    (XEN) Adding cpu 1 to runqueue 1
    (XEN)  First cpu on runqueue, activating

> I wasn't able to catch the real problem despite of having tried lots
> of approaches using debug patches.
>=20
> Recently I suspected the whole problem could be somehow related to
> RCU handling, as stop_machine_run() is relying on tasklets which are
> executing in idle context, and RCU handling is done in idle context,
> too. So there might be some kind of use after free scenario in case
> some memory is freed via RCU despite it still being used by a tasklet.

That sounds plausible, even though I don't really know this area of Xen.

> I "just" need to find some time to verify this suspicion. Any help doing
> this would be appreciated. :-)

I do have a setup where I can easily-ish reproduce the issue. If there
is some debug patch you'd like me to try, I can do that.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--u2zjs13kMz/cGsQm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9zT8oACgkQ24/THMrX
1yy0+wgAlTQCbE1VMtnsbPhSj25HfxDqWtBKeSLombolY4Yda6qig5dV7l5x5ecN
gYXXKowgddMz9wDE06D949q86unSbW2HGpadP3aTNdY2vbYS5d99UNUlwJu1RPXr
zkMyNsGTr3DFAasu2h1m4aNZKuhfn3upuxnE1EsQsWZcsXC8Q5xQ6YE2gUxqLPjV
aY2B4WAF+He+YI/8+vgPbKdHKkHntmJEk0POwpKp8u+pF3q0xFZZcuTMcF7oCiTx
/hsvmoF/gCiKZlE7x+wn+jrkZo35AqR9V91MaUBFLRys8Hh3wbWnapjzH7knvXcm
e4/aZfyBeCxpBTedNwQk1/Vhu0Lz8Q==
=5hIK
-----END PGP SIGNATURE-----

--u2zjs13kMz/cGsQm--

