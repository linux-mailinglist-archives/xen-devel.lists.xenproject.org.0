Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5CC835900
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 01:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669641.1041974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRiEE-0003p9-5b; Mon, 22 Jan 2024 00:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669641.1041974; Mon, 22 Jan 2024 00:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRiEE-0003n5-2X; Mon, 22 Jan 2024 00:31:54 +0000
Received: by outflank-mailman (input) for mailman id 669641;
 Mon, 22 Jan 2024 00:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ce26=JA=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1rRiED-0003mz-GJ
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 00:31:53 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a10545eb-b8bd-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 01:31:50 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 952523200A02;
 Sun, 21 Jan 2024 19:31:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 21 Jan 2024 19:31:46 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Jan 2024 19:31:45 -0500 (EST)
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
X-Inumbo-ID: a10545eb-b8bd-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1705883506;
	 x=1705969906; bh=8Vt5SiKGAB+IJKjMb4XsC9KY6fPUzYPBwsMpVZcFlhI=; b=
	hjyJqCn26qBytWgis/xek91SKsWdmE5eXju9GmprL97xUH2iCmMVKZ9CSwcwPoVo
	TKYmw+8xTqBunsbGuClAcncOXsoQLDJ7wLxe0APmlzkBzzcwodIgAMdbSw47tsl/
	x0tZAMCpfJ1xd50JGoHyHIkTBL1z10DIv1m+KJaTfejtOHdpNjH/nJjDnzdV/4lJ
	bWaPqQFD46q+3AzzZQ4PNv21nnGqY4+Z2yE/ubBlycIflbo6AIB1XnOMdtqMj5ja
	5wuDwo7Wt8w+NyO2seiDOYtCvDgZ2khnfMycU3DamgNHr+m7KW88zJVvTAtXKJtn
	2s+RGhI9UzfK29Uvyo/8xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705883506; x=1705969906; bh=8Vt5SiKGAB+IJKjMb4XsC9KY6fPU
	zYPBwsMpVZcFlhI=; b=jbHTwtoMCQ84JNSoAHfT/WMs/wKR7nrSsayCnDy5hlu0
	8MoiQJqliRMU4C9T8CQEIFrCAUAI92KWABkC75SFMrQSL2rDkCixmzSci5iNdTxt
	8Fw8pfR6S/n6ihs9/oFxVgSe7xWKNYrcrT2raslrDtqFcvo+x78vVQzbLMTAbPaG
	eF112xYoIAIrRFjx75CiM/ZwFT40Je6kBH7tV1c3UY4wdawDF1c9Za4DWlqaozLM
	Q/j6qwrSkfqUw+4SwEA8CzDfVWBBk9EaE8qtBJcFLwSaw5Rnl55KEANF43rEiLAp
	984rFwRzvHRhwJKC0Rfjlzf1CArE0KcnZJDQ3QXJng==
X-ME-Sender: <xms:cbetZdOy68sAGjKttdYWP74kRjWKvOJKTyUEVPlteiIGhCgR7Zjf2g>
    <xme:cbetZf_RfrJdwjjPV1R1_YIY936alT0cwQEmABZK0fg20eYFX1KVugGdhKoFac5Lp
    fNgbCFPN5Dwipc>
X-ME-Received: <xmr:cbetZcTbHqHDJqKcRmt_CdgWvCN2C5LFX8HKBT7w6_beCNjNImZRGygRsK1W_eWf_bH-sW1g0-H5bIy8NhFQlBZG3k1vkgKS4AZFQgiRA1fN_1_l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekhedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleefjeeukeehkeegiedtgeekkeel
    tedvhfduudefgfffheffheeuvedvieelfefhnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:cbetZZsWKSkKjBqTUhKBkEMgrNQiABLxt4MqyBGcMzbuWVZF6xTSOg>
    <xmx:cbetZVem9e1N6GkMa2aU98nY-OC-Dj0QQ8QaoqZ9BDahOcCKv4lsvg>
    <xmx:cbetZV2ZJFDX4-stQtXQIO0Z_q0L9c_LjC9fO5VRctZYPLlB5lWPDw>
    <xmx:cretZWqHWA8oiYxTnSg-X8F-YdsiWkKIsCk_Q66E1mI6YdhSlAXRUA>
Feedback-ID: iac594737:Fastmail
Date: Sun, 21 Jan 2024 19:31:41 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: George Dunlap <george.dunlap@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Sketch of an idea for handling the "mixed workload" problem
Message-ID: <Za23cKyEOl1WTvhZ@itl-email>
References: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G1NvchryUuwGpy0H"
Content-Disposition: inline
In-Reply-To: <CA+zSX=Z904nF0yD1grRZc1miEOhdTHqAd4j-S1j8GY+1bo9COw@mail.gmail.com>


--G1NvchryUuwGpy0H
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Jan 2024 19:31:41 -0500
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
>=20
> 2. vcpus burn credits as they consume cpu, based on the relative
> weights: higher weights burn slower, lower weights burn faster
>=20
> 3. At any given point in time, the runnable vcpu with the highest
> credit is allowed to run
>=20
> 4. When the "next runnable vcpu" on a runqueue is negative, credit is
> reset: everyone gets another 10ms, and can carry over at most 2ms of
> credit over the reset.
>=20
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
> * Xen is about to preempt, but finds that the (currently out-of-tree)
> "dont_desched" bit has been set in the shared memory area

I think both of these would be good.  Another one would be when Xen is
about to deliver an interrupt to a guest, provided that there is no
storm of interrupts.  I=E2=80=99ve seen a USB webcam cause a system-wide la=
tency
spike through what I presume is an interrupt storm, and I suspect that
others have observed similar behavior with USB external drives.

> Other ways to consider de-boosting:
> * There's a way to trigger a VMEXIT when interrupts have been
> re-enabled; setting this up when the VM is in the boost state

That=E2=80=99s a good idea, but should be conditional on =E2=80=9Cdont_desc=
hed=E2=80=9D _not_
being set.  This handles the case where the guest is running a realtime
thread.

Generally, I=E2=80=99d like to see something like this:

- A vCPU with sufficient boost credit is boosted by Xen under the
  following conditions:

  1. Xen interrupts the guest.
  2. Xen is about to preempt, but detects that =E2=80=9Cdont_desched=E2=80=
=9D is set.
  3. Xen is about to preempt, but detects that interrupts are disabled.

- A vCPU is deboosted if:

  1. It runs out of boost credit, even if =E2=80=9Cdont_desched=E2=80=9D is=
 set.
  2. An interrupt handler returns, but only if =E2=80=9Cdont_desched=E2=80=
=9D is not set.
  3. Interrupts are re-enabled, but only if =E2=80=9Cdont_desched=E2=80=9D =
is not set.

  The first case is an abnormal condition and typically means that
  either the system is overloaded or a vCPU is running boosted for too
  long.  To help debug this situation, Xen will log a warning and
  increment both a system-wide and a per-domain counter.  dom0 can
  retrieve counters for any domain, and a domain can read its own
  counter.

- When to set =E2=80=9Cdont_desched=E2=80=9D is entirely up to the guest ke=
rnel, but
  there are some general rules guests should follow:

  - Only set =E2=80=9Cdont_desched=E2=80=9D if there is a good reason, and =
unset it as
    soon as possible.  Xen gives vCPUs with =E2=80=9Cdont_desched=E2=80=9D =
set priority
    over all other vCPUs on the system, but the amount of time a vCPU is
    allowed to run with an elevated priority is limited.  Xen will log a
    warning if a guest tries to run with elevated priority for too long.
   =20
  - Xen boosts vCPUs before delivering an interrupt, but there should be
    a way for a vCPU to deboost itself even before returning from the
    interrupt handler.

  - Guests should always set =E2=80=9Cdont_desched=E2=80=9D when running ha=
rd-realtime
    threads (used for e.g. audio processing), even when the thread is in
    userspace.  This ensures that Xen gives the underlying vCPU priority
    over vCPUs=20

  - Guests should always set =E2=80=9Cdont_desched=E2=80=9D when holding a =
spin lock,
    but it is even better to use paravirtualized spin locks (which make
    a hypercall into Xen and therefore allow other vCPUs to run).

  - Xen does not implement priority inheritance, so guests need to do
    that.

- Max boost credits can be set by dom0 via a hypercall.

The advantage of this approach is that it keeps almost all policy out of
Xen.  The only exception is the boosting when an interrupt is received,
but a well-behaved guest will deboost itself very quickly (by enabling
interrupts) if the boost was not actually needed, so this should have
very limited impact.  I think this should be enough for realtime audio,
and it is somewhat related to (but hopefully simpler than) the KVM RFC
=66rom Google [1].

Any thoughts on this?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

[1]: https://lore.kernel.org/kvm/20231214024727.3503870-1-vineeth@bitbytewo=
rd.org/

--G1NvchryUuwGpy0H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmWtt3AACgkQsoi1X/+c
IsELLA/8DLi4obtIN8Nic3OgPrXwvJyHkUbRmMkf9CZtDuUMQeJ4P2WUHLDEJlB6
a0Ge/YiqTowzbnthMSY2snLxX+k9Dhr9dzeHwa9a3lzgZhIHjDkP0rUKZ11RvnLW
tTR7Sb4I+i6ATyGZDBNyVhxHQ9jL0KheRkWbP2oDSBzV35iAnQTl8O3giO1VrzlK
eOd5hXHY6EArzVWvOuxNujTt0AQ5bt4yJhce8HZ+B4mWrhBZaQ+49l0jIUr1NKUi
NmEl+VJC8bLWNpTXKWHEWjzTqymgIOJY4UR6RKk0dNZYexBQzoW1nda0x30I5B+U
rNySDPqnanepuPuMEy+m7Kzekp4YJCd2Wo4o/+y/oYtKHPO/C0Jk2FQ2UnpabMAX
WajQngkpfFpud8td2stoEilG9kWghn0HtvPKluFzqY2bEXAk8XT5IcYnRqJcYJvL
pcLGKG5Qy+laL7n/6jhAuJpEYhBv+LpOZLUJZ9r3fbhSH6Z1JpyIlu8s6xNav94k
XCYPJStLhamDHacl6njajLe3szNb3Qyx0KDWj4tnatxI5ky+6CNXq0jk8g2d89R0
IAk6z0i2vcPQcYaFSL5tJwS+f+WKF0tnHF0g94ldmvlDuuUz69kcXumbxXRfVhWq
vbzV4dJH/GlxZsrk2KAegtBVyYdctn8rPbtuXb2OUnEgT9FXYQ8=
=1yz4
-----END PGP SIGNATURE-----

--G1NvchryUuwGpy0H--

