Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15397B4498
	for <lists+xen-devel@lfdr.de>; Sun,  1 Oct 2023 01:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610910.950405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmjNy-0007S4-Ji; Sat, 30 Sep 2023 23:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610910.950405; Sat, 30 Sep 2023 23:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmjNy-0007Ph-Gf; Sat, 30 Sep 2023 23:28:34 +0000
Received: by outflank-mailman (input) for mailman id 610910;
 Sat, 30 Sep 2023 23:28:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uo57=FO=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1qmjNw-0007Pb-5r
 for xen-devel@lists.xenproject.org; Sat, 30 Sep 2023 23:28:32 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be409d2-5fe9-11ee-9b0d-b553b5be7939;
 Sun, 01 Oct 2023 01:28:24 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 02C8B3201210;
 Sat, 30 Sep 2023 19:28:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 30 Sep 2023 19:28:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 Sep 2023 19:28:19 -0400 (EDT)
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
X-Inumbo-ID: 0be409d2-5fe9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1696116500; x=1696202900; bh=K+sCmI9/IZXRz7WaophaWkj5oWB1yh93aRG
	SFusggM4=; b=Hc49WZzgqkeMu8eYcDurnStkMeydBaUM29JQ9NjiuxmX8nSgqPo
	DJF8CjGcYefbwd3bWt0w89tz7PL6AwLIkjuzwz1q98SIA4dJabONTEC90+bmmvu/
	nrKUg6qtuDyk6BsSFnTMzxZ/HHha0uChJ3iUTmNkiaLSQCnT9nU+cu73s+JHgxce
	gdizXn+AnGEuYRdVOmIt9dxtknazBXvWRxCReQV0x5eOhDKye5ASRn1/DKqMUMRA
	ZkQvG5TVG+J9ldtthYQ4oxkAEdYZbuxGd26X1yRlntJGLw8BoiN47ho9yLKqRcpd
	fv/AdT9jq8tcJGh/nYfSjnYNzV/e0QiZh8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696116500; x=1696202900; bh=K+sCmI9/IZXRz
	7WaophaWkj5oWB1yh93aRGSFusggM4=; b=NEhv/g8kae+3B7ijRM9UGiskBZuBT
	pVeoiALQgGesyFiHz3mchMc0zi0iwaOwM7PRp9S5ABAv1u4FOQZoDpnyfHFD6awC
	K/+1VnxD+rigMJHMAgN8Nvt7tf7K2DIq4pkgaP3KaNC3GvRQFXCT+s5xbHUSX+M+
	yw4F4Cm8B0fyG1MQMgKCj7O1fBzhbt3GWu21EIGGYgtUboh8h8M65dN7PL/iQIHu
	FCFjKw6wV5hLSjNnhF93qUcaZ0w45Ak1oK+vvcDpEJxkozi4Uy3rVblNwLQ8h8Vc
	OeJrKdjy2t1NRJN4Gz5qz4g0y0uOdHQEMO01DvVW1L5bROKuJGFABQ0Wg==
X-ME-Sender: <xms:FK8YZahCAbl4G1OSPmllAipjijOUxlK84cZD8PeRFl2Q2i8lsS3LCg>
    <xme:FK8YZbBtQlJ41nnZDhy8905x_Cx72O0GZ0RxYMd67oWfDx8CRPvd7f-XPBi9a139D
    jfvm3TNXRPmQeI>
X-ME-Received: <xmr:FK8YZSEsdWo0XGXDxBwRKeOxTIcs82VRSceD4wxrmFsU1S4vx8wIh5cRBt-fWpIl31-jjOY1b-P5xxQfOGU-tHMofW8aL4VqB4gl7JcR1FY7Qu2b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeggddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:FK8YZTTc2Cpbkxoyls8Iv1xDTdT5OD3ZzoXFMvM1c94NLuJ-7IhQfw>
    <xmx:FK8YZXw-YGjsUYWb9HKC0q521Z-QxB4AfGl7vtSm_T2vmY3PAN891Q>
    <xmx:FK8YZR6fVIxrh0Ba9l5qJLF8bAWgvTZ0rSI5a62Qyak7DzNhoSag8w>
    <xmx:FK8YZQq6k3EDW22gCqMRGbs3nZwiHJzIcA_dHUTSG4H83dZyQY9mkw>
Feedback-ID: iac594737:Fastmail
Date: Sat, 30 Sep 2023 19:28:15 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
Message-ID: <ZRivEkG8Ox213H2A@itl-email>
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LspdzsiRMcdqncB7"
Content-Disposition: inline
In-Reply-To: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>


--LspdzsiRMcdqncB7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 Sep 2023 19:28:15 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem

On Fri, Sep 29, 2023 at 05:42:16PM +0100, George Dunlap wrote:
> The basic credit2 algorithm goes something like this:
>=20
> 1. All vcpus start with the same number of credits; about 10ms worth
> if everyone has the same weight

> 2. vcpus burn credits as they consume cpu, based on the relative
> weights: higher weights burn slower, lower weights burn faster
>=20
> 3. At any given point in time, the runnable vcpu with the highest
> credit is allowed to run
>=20
> 4. When the "next runnable vcpu" on a runqueue is negative, credit is
> reset: everyone gets another 10ms, and can carry over at most 2ms of
> credit over the reset.

One relevant aspect of Qubes OS is that it is very very heavily
oversubscribed: having more VMs running than physical CPUs is (at least
in my usage) not uncommon, and each of those VMs will typically have at
least two vCPUs.  With a credit of 10ms and 36 vCPUs, I could easily see
a vCPU not being allowed to execute for 200ms or more.  For audio or
video, workloads, this is a disaster.

10ms is a LOT for desktop workloads or for anyone who cares about
latency.  At 60Hz it is 3/5 of a frame, and with a 120Hz monitor and a
heavily contended system frame drops are guaranteed.

> Generally speaking, vcpus that use less than their quota and have lots
> of interrupts are scheduled immediately, since when they wake up they
> always have more credit than the vcpus who are burning through their
> slices.
>=20
> But what about a situation as described recently on Matrix, where a VM
> uses a non-negligible amount of cpu doing un-accelerated encryption
> and decryption, which can be delayed by a few MS, as well as handling
> audio events?  How can we make sure that:
>=20
> 1. We can run whenever interrupts happen
> 2. We get no more than our fair share of the cpu?
>=20
> The counter-intuitive key here is that in order to achieve the above,
> you need to *deschedule or preempt early*, so that when the interrupt
> comes, you have spare credit to run the interrupt handler.  How do we
> manage that?
>=20
> The idea I'm working out comes from a phrase I used in the Matrix
> discussion, about a vcpu that "foolishly burned all its credits".
> Naturally the thing you want to do to have credits available is to
> save them up.
>=20
> So the idea would be this.  Each vcpu would have a "boost credit
> ratio" and a "default boost interval"; there would be sensible
> defaults based on typical workloads, but these could be tweaked for
> individual VMs.
>=20
> When credit is assigned, all VMs would get the same amount of credit,
> but divided into two "buckets", according to the boost credit ratio.
>=20
> Under certain conditions, a vcpu would be considered "boosted"; this
> state would last either until the default boost interval, or until
> some other event (such as a de-boost yield).
>=20
> The queue would be sorted thus:
>=20
> * Boosted vcpus, by boost credit available
> * Non-boosted vcpus, by non-boost credit available
>=20
> Getting more boost credit means having lower priority when not
> boosted; and burning through your boost credit means not being
> scheduled when you need to be.
>=20
> Other ways we could consider putting a vcpu into a boosted state (some
> discussed on Matrix or emails linked from Matrix):
> * Xen is about to preempt, but finds that the vcpu interrupts are
> blocked (this sort of overlaps with the "when we deliver an interrupt"
> one)

This is also a good heuristic for "vCPU owns a spinlock", which is
definitely a bad time to preempt.

> * Xen is about to preempt, but finds that the (currently out-of-tree)
> "dont_desched" bit has been set in the shared memory area
>=20
> Other ways to consider de-boosting:
> * There's a way to trigger a VMEXIT when interrupts have been
> re-enabled; setting this up when the VM is in the boost state

This is a good idea.

> Getting the defaults right might take some thinking.  If you set the
> default "boost credit ratio" to 25% and the "default boost interval"
> to 500ms, then you'd basically have five "boosts" per scheduling
> window.  The window depends on how active other vcpus are, but if it's
> longer than 20ms your system is too overloaded.

An interval of 500ms seems rather long to me.  Did you mean 500=CE=BCs?

> Thoughts?

My first thought when I had the problem is that Xen's scheduling quantum
was too long.  This is consistent with the observation that dom0 (which
was not very busy IIRC) fell behind in its delivery of audio samples.
Presumably it had plenty of credit, but simply did not get scheduled in
time, perhaps because Xen did not preempt soon enough.  It=E2=80=99s also w=
orth
noting that Qubes makes heavy use of vchans, and I expect the latency of
these to be directly proportional to the time between preemption
interrupts.

Audio is not very demanding on throughput, but is extremely sensitive to
latency.  Therefore, the top priority is making sure that every runnable
vCPU gets a chance to execute periodically.  One way to solve this would
be for both the credits (both the initial credit and the maximum credit
carried over) and the interval between preemptions to be inversely
proportional to the number of runnable vCPUs, so that the time needed to
cycle through all runnable vCPUs is roughly constant.  Specifically,
they would be proportional to Lmax/runnable_vCPUs, where Lmax is the
latency target (1ms or so).  This also ensures that even Xen-unaware VMs
(such as a Windows guest running Microsoft Teams or Skype) get to run
periodically.  There would need to be a limit to prevent Xen from
hogging more than e.g. 10% of CPU time just doing preemption, but if
this is hit, Xen should log something and possibly notify dom0 so that a
warning can be displayed to the user.  Additionally, a certain amount of
CPU time (such as 10%) should be reserved for dom0, so that the system
remains responsive.

Qubes OS could also help here.  If a VM is allowed to record audio, it
(and the VMs providing network to it, transitively) should get a boost
in priority, so that if the system is overloaded other guests are more
likely be delayed in their execution.

> Demi, what kinds of interrupt counts are you getting for your VM?

I didn't measure it, but I can check the next time I am on a video call
or doing audio recoring.

>  -George

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--LspdzsiRMcdqncB7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmUYrxIACgkQsoi1X/+c
IsHZFRAA0O1fJJuPtQCYWtgxyvp2QGjCUzWqUyWOQxFd5ur1JeameH1eoQv8boQK
vUfQ1KjdoN8QlxGSxMRci7URDhhL4jdxSxKq0aPc/7mdACXsNmVNaVucGrkWaAVE
aqkNGysLgn1JgsbhkOVZYeQFKS4WpZQ9hVK4upt8swgCHifcrnV4oM63FlYULGBB
VXA0DnXixOhdhfYBYHnzWTEgew6m46U7mRiyulXCROZdlc+XMZZSTZZeQi9asKHj
bJmF9b5cSRG1zRiG4CdfMJcANUoLC/O/CivqcXs4kOjae/ayzIYrIv9YM1F0BT01
ZZHt+jvWIrdA7pOB9UhGipzmpVU0+/YrFUDqA7ttV6FPnl2yzkgsCwIhvj3lVAcH
7ES9zRBrEwdsbg3WKtAd8xhygHj1neq2o7jJvvi6Xt5TfQBWHv8ZqORZFLPPjC+z
wsAD4OUHAbstIP3xy+EyXUzOCxKrzTOoi4n/IfsL5QiAFEEUT474DYtlSFbf2vmR
YIEAV78cvYjyGRTYKDBB0d+6tP0Wz2D/AtZfHQDDjpjTofvwOlRnb/FSRVu5vYoD
yMKhbnagQ3w4UbD9GzYdOnHJo1bXwLEpC1Njdn+zM2tuHZWiSfOz9+6Ka0WQPmpA
ITslf6ErTBJZzDJu7Kb1PmQS3F44OkXkWYaYpuaD+gELM9o0jSY=
=rxFu
-----END PGP SIGNATURE-----

--LspdzsiRMcdqncB7--

