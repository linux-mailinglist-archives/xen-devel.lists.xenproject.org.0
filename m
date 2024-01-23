Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4581883958C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 17:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670551.1043422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSK6S-0000Sm-7F; Tue, 23 Jan 2024 16:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670551.1043422; Tue, 23 Jan 2024 16:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSK6S-0000Qw-45; Tue, 23 Jan 2024 16:58:24 +0000
Received: by outflank-mailman (input) for mailman id 670551;
 Tue, 23 Jan 2024 16:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IiK9=JB=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1rSK6P-0000PS-IP
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 16:58:22 +0000
Received: from wfout2-smtp.messagingengine.com
 (wfout2-smtp.messagingengine.com [64.147.123.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 994ae95e-ba10-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 17:58:18 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 2B9D61C0006E;
 Tue, 23 Jan 2024 11:58:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 23 Jan 2024 11:58:13 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jan 2024 11:58:12 -0500 (EST)
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
X-Inumbo-ID: 994ae95e-ba10-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1706029092;
	 x=1706115492; bh=+Cb07fSHIP/nAV4h9p9hfVaNyIElPq3pGvjzWSI9rLA=; b=
	F2Xv9OwCocia3TEgrjkG0KBBPT9bMkfVAt9DqDtvnvl1vllhZEU/bMPGmQW9aZuZ
	Q3dU5b1fSNiR5x1gLVWCT9G7plUWxTBxLVixYRDpP4i54iz0vnwJjg7946pVla82
	cgxS0TVfp8+PMnGyWEZjVqtuCWkPK7AZoIqYC/ySJ5KvI/0OrR/h8WASmHW9j9+p
	Srl5xZnOoF9O9qgwVVnq9tPgIK6CTHvYsUDGbl9SXFHtJ7LyUbRcJDcFd1LS2+MG
	EXLApnHqwVzGnM5IHGbGzW3XhsqnCvM8FrJIxfFOkoBL7n4BAnM9syczlwn//ffM
	l4DWYMokZTCzxUX0H6PGRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706029092; x=1706115492; bh=+Cb07fSHIP/nAV4h9p9hfVaNyIEl
	Pq3pGvjzWSI9rLA=; b=nG64xXRNdfA4cLBQTyBB4HcFZy9q8ImQPGdGZgeN8YJy
	sd2jKI9a2TZxzNR0bMIKjoF7zs20w0CwqCpVmvRkY4yORIlUTsT2/I/swqguVxu3
	M+HFcxzUWgkH2o+gKT9gij79bZTBadg0hmMluDsJ44C2Qi9zs/+ehASTmpX+R27k
	fE/rhw/OyxkLIKB3YCdcYJ+caKFtTWINiSqEmKz34/nUmoulIb9C23t+uewvu170
	PmNIGOjlAvjzW40xWtKPQj5AqSxlRYmhDlScMzU7YVGWyW8AUcTaupI/IjIJlNXl
	383sKGcZS9J9JBycu2WhHG5VuNKNXwNonQHXQ9ghlA==
X-ME-Sender: <xms:JPCvZWp11tSPhECy4BAfVhlbtxvNbssQwtjulWveNFz0eMSRSbE1yA>
    <xme:JPCvZUpWe751qSVqT9a3TWys8vH_KEobQqeYx7caGbDPz5EATKTQO40MbCVR-Mfzl
    iH3SNm0r_ZzvQY>
X-ME-Received: <xmr:JPCvZbORopm8FmwC3HriNDhkKiBC-m8h7WASUQy13ln6bmUd9dvec2XXDA5wP5m-mXhfCgBS_z68511UpNKujyavLyO2Iw5yVqV43rOfk24zJNsL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:JPCvZV5HBknVLvGerN44FdVJ6fXLE0yPfiOTlQ2BG02iAIoWtzQ9Ag>
    <xmx:JPCvZV6btkamfu9tWqVBUnmqffgZwCKJVodv03G-uOkZvp2TnNilGg>
    <xmx:JPCvZVg35WrEqeRRBaN-ZdEG7BQYw-_6mMmqQcXTYKW5lRWy3Cm8Ag>
    <xmx:JPCvZfkvTLJKs2s7kZZglT6PzbSWTZKdGtdUwaRmIbeAdsKaunQvD0_tk-Y>
Feedback-ID: iac594737:Fastmail
Date: Tue, 23 Jan 2024 11:58:07 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
Message-ID: <Za_wImJMW0UuNJue@itl-email>
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
 <Za23cKyEOl1WTvhZ@itl-email>
 <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hvgit4ad6LeOOsQH"
Content-Disposition: inline
In-Reply-To: <CA+zSX=YNjVaGn8=kio=2iT8onHAP61pzP-dicMrr4pKJQ827gw@mail.gmail.com>


--Hvgit4ad6LeOOsQH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jan 2024 11:58:07 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem

On Mon, Jan 22, 2024 at 11:54:14AM +0000, George Dunlap wrote:
> On Mon, Jan 22, 2024 at 12:31=E2=80=AFAM Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> >
> > On Fri, Sep 29, 2023 at 05:42:16PM +0100, George Dunlap wrote:
> > > The basic credit2 algorithm goes something like this:
> > >
> > > 1. All vcpus start with the same number of credits; about 10ms worth
> > > if everyone has the same weight
> > >
> > > 2. vcpus burn credits as they consume cpu, based on the relative
> > > weights: higher weights burn slower, lower weights burn faster
> > >
> > > 3. At any given point in time, the runnable vcpu with the highest
> > > credit is allowed to run
> > >
> > > 4. When the "next runnable vcpu" on a runqueue is negative, credit is
> > > reset: everyone gets another 10ms, and can carry over at most 2ms of
> > > credit over the reset.
> > >
> > > Generally speaking, vcpus that use less than their quota and have lots
> > > of interrupts are scheduled immediately, since when they wake up they
> > > always have more credit than the vcpus who are burning through their
> > > slices.
> > >
> > > But what about a situation as described recently on Matrix, where a VM
> > > uses a non-negligible amount of cpu doing un-accelerated encryption
> > > and decryption, which can be delayed by a few MS, as well as handling
> > > audio events?  How can we make sure that:
> > >
> > > 1. We can run whenever interrupts happen
> > > 2. We get no more than our fair share of the cpu?
> > >
> > > The counter-intuitive key here is that in order to achieve the above,
> > > you need to *deschedule or preempt early*, so that when the interrupt
> > > comes, you have spare credit to run the interrupt handler.  How do we
> > > manage that?
> > >
> > > The idea I'm working out comes from a phrase I used in the Matrix
> > > discussion, about a vcpu that "foolishly burned all its credits".
> > > Naturally the thing you want to do to have credits available is to
> > > save them up.
> > >
> > > So the idea would be this.  Each vcpu would have a "boost credit
> > > ratio" and a "default boost interval"; there would be sensible
> > > defaults based on typical workloads, but these could be tweaked for
> > > individual VMs.
> > >
> > > When credit is assigned, all VMs would get the same amount of credit,
> > > but divided into two "buckets", according to the boost credit ratio.
> > >
> > > Under certain conditions, a vcpu would be considered "boosted"; this
> > > state would last either until the default boost interval, or until
> > > some other event (such as a de-boost yield).
> > >
> > > The queue would be sorted thus:
> > >
> > > * Boosted vcpus, by boost credit available
> > > * Non-boosted vcpus, by non-boost credit available
> > >
> > > Getting more boost credit means having lower priority when not
> > > boosted; and burning through your boost credit means not being
> > > scheduled when you need to be.
> > >
> > > Other ways we could consider putting a vcpu into a boosted state (some
> > > discussed on Matrix or emails linked from Matrix):
> > > * Xen is about to preempt, but finds that the vcpu interrupts are
> > > blocked (this sort of overlaps with the "when we deliver an interrupt"
> > > one)
> > > * Xen is about to preempt, but finds that the (currently out-of-tree)
> > > "dont_desched" bit has been set in the shared memory area
> >
> > I think both of these would be good.  Another one would be when Xen is
> > about to deliver an interrupt to a guest, provided that there is no
> > storm of interrupts.  I=E2=80=99ve seen a USB webcam cause a system-wid=
e latency
> > spike through what I presume is an interrupt storm, and I suspect that
> > others have observed similar behavior with USB external drives.
>=20
> How would you determine that a given interrupt was part of a "storm",
> and what would you do differently as a result of determining that?

I=E2=80=99m not sure.  One heuristic might be that if a device assigned to =
a VM
is interrupting Xen too many times while Xen is running other VMs,
interrupts from that device are blocked as needed to ensure other VMs
get to execute.  Theoretically, an interrupt from a USB storage device
should be safe to block until Xen is no longer running boosted
workloads, but an interrupt from a USB microphone or speaker is not.

> > > Other ways to consider de-boosting:
> > > * There's a way to trigger a VMEXIT when interrupts have been
> > > re-enabled; setting this up when the VM is in the boost state
> >
> > That=E2=80=99s a good idea, but should be conditional on =E2=80=9Cdont_=
desched=E2=80=9D _not_
> > being set.  This handles the case where the guest is running a realtime
> > thread.
>=20
> In which case we need some way for the "enlightened" guest to know how
> to de-boost itself; a yield might do.

That would be sufficient.

> > Generally, I=E2=80=99d like to see something like this:
> >
> > - A vCPU with sufficient boost credit is boosted by Xen under the
> >   following conditions:
> >
> >   1. Xen interrupts the guest.
>=20
> I take it you mean, "delivers an interrupt to the guest"?

Yes.

> >   2. Xen is about to preempt, but detects that =E2=80=9Cdont_desched=E2=
=80=9D is set.
> >   3. Xen is about to preempt, but detects that interrupts are disabled.
> >
> > - A vCPU is deboosted if:
> >
> >   1. It runs out of boost credit, even if =E2=80=9Cdont_desched=E2=80=
=9D is set.
> >   2. An interrupt handler returns, but only if =E2=80=9Cdont_desched=E2=
=80=9D is not set.
> >   3. Interrupts are re-enabled, but only if =E2=80=9Cdont_desched=E2=80=
=9D is not set.
> >
> >   The first case is an abnormal condition and typically means that
> >   either the system is overloaded or a vCPU is running boosted for too
> >   long.  To help debug this situation, Xen will log a warning and
> >   increment both a system-wide and a per-domain counter.  dom0 can
> >   retrieve counters for any domain, and a domain can read its own
> >   counter.
> >
> > - When to set =E2=80=9Cdont_desched=E2=80=9D is entirely up to the gues=
t kernel, but
> >   there are some general rules guests should follow:
> >
> >   - Only set =E2=80=9Cdont_desched=E2=80=9D if there is a good reason, =
and unset it as
> >     soon as possible.  Xen gives vCPUs with =E2=80=9Cdont_desched=E2=80=
=9D set priority
> >     over all other vCPUs on the system, but the amount of time a vCPU is
> >     allowed to run with an elevated priority is limited.  Xen will log a
> >     warning if a guest tries to run with elevated priority for too long.
> >
> >   - Xen boosts vCPUs before delivering an interrupt, but there should be
> >     a way for a vCPU to deboost itself even before returning from the
> >     interrupt handler.
> >
> >   - Guests should always set =E2=80=9Cdont_desched=E2=80=9D when runnin=
g hard-realtime
> >     threads (used for e.g. audio processing), even when the thread is in
> >     userspace.  This ensures that Xen gives the underlying vCPU priority
> >     over vCPUs
> >
> >   - Guests should always set =E2=80=9Cdont_desched=E2=80=9D when holdin=
g a spin lock,
> >     but it is even better to use paravirtualized spin locks (which make
> >     a hypercall into Xen and therefore allow other vCPUs to run).
> >
> >   - Xen does not implement priority inheritance, so guests need to do
> >     that.
> >
> > - Max boost credits can be set by dom0 via a hypercall.
> >
> > The advantage of this approach is that it keeps almost all policy out of
> > Xen.  The only exception is the boosting when an interrupt is received,
> > but a well-behaved guest will deboost itself very quickly (by enabling
> > interrupts) if the boost was not actually needed, so this should have
> > very limited impact.  I think this should be enough for realtime audio,
> > and it is somewhat related to (but hopefully simpler than) the KVM RFC
> > from Google [1].
> >
> > Any thoughts on this?
>=20
> Overall sounds good.  I think a good approach would be to start by
> implementing it without the "dont_desched" flag, and then add that on
> top later.  It sounds like you have a clear vision for what you want,
> so it shouldn't be too hard to write such that adding the
> "dont_desched" doesn't require a lot of pointless refactoring.
>=20
> The other issue I have with this (and essentially where I got stuck
> developing credit2 in the first place) is testing: how do you ensure
> that it has the properties that you expect?  How do you develop a
> "regression test" to make sure that server-based workloads don't have
> issues in this sort of case?

I don=E2=80=99t have any server workloads myself.  Would it be reasonable t=
o ask
those who do have such workloads to develop such a test?  They would be
in a much better position to check for regressions on these workloads,
and have server hardware that they can use to benchmark such workloads.
I just have my laptop and a test laptop, both running Qubes OS.

It=E2=80=99s also possible that some of these changes will improve latency =
at
the expense of throughput.  In that case, I could add a Xen command-line
option (or even a runtime toggle) that controls whether Xen honors the
boost state.  I do expect that the rest of the logic should have very
little overhead in this case.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Hvgit4ad6LeOOsQH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmWv8CIACgkQsoi1X/+c
IsGXKxAAqYxnG+7E+4HnkBQWxTciOX9n1Tpj4mcsXnHhDEqsQSrTh32eMK88YUMv
a+TxwLEW5ibJWSWXwpAJr35s4wm8JSHwJjtCDnmADYJNfXCse3Be1ZT6+cs9VJkw
AcH2Can1Z1SS+/w1uHiRsFo6Wknw9Cla0ZKPdzEguIRSrGVDA84Tmd42AcMCgeM3
iyRkSRlgH+ge0t0MN0SGpTKMocTan/WPjGJrQo/T74K+hfNEFwbexPBxxu23nkvP
I0Jf/B0WA0K60lKxq4SccvPKAgFw1OUJtowHrdeaO0u+WMDPpLdCjIeujkXSSM3W
/5vjGRJ/IR8CGv0mrRDGsfC0bg3qDEEQB4ObMLoxpThdbeFtVdxv6KPN593yoGut
7cJj1Apf4T0lJ8L3CHp/7E4c95iZyTVkTK1uG5seEeiNIC/wzkSjPsbgfJrio2DM
SP1bPlE8degB1a43QTh/1TjM3pHgfUEhtZecAf42a2lVIFJJ4v+WJygs3/OVHL9f
yZprjLitg5/HljmEf4evg2/eP7BAZW0z4qDZMtgypopZXUFshLbk3oJyIgNCgFTu
wjL5OOQ5uWApm5sKWh26nz+DK1VcMXENmJwzcFZLpyyzUuRgqXpBhc6fOM5T97/s
AoWKa0ba3pFvxIKdpaeGNIPLrJIZ3yBbazQ2nnyWowOViKuVNZ8=
=KH1Y
-----END PGP SIGNATURE-----

--Hvgit4ad6LeOOsQH--

