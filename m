Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F364B73CAEC
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 14:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554570.865834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD2QA-0005qQ-Bb; Sat, 24 Jun 2023 12:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554570.865834; Sat, 24 Jun 2023 12:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD2QA-0005n5-8q; Sat, 24 Jun 2023 12:31:18 +0000
Received: by outflank-mailman (input) for mailman id 554570;
 Sat, 24 Jun 2023 12:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdeE=CM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qD2Q8-0005mz-BF
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 12:31:16 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00f26661-128b-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 14:31:13 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A37F05C0145
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 08:31:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sat, 24 Jun 2023 08:31:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 08:31:10 -0400 (EDT)
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
X-Inumbo-ID: 00f26661-128b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1687609871; x=1687696271; bh=a9
	+CJ3I1oF8IDQX27l8UN+9p7kTef6heTr8vWNeVq1s=; b=J8PQsndl+ohU75VZZR
	AD2tSyhCpjse3rPBN3/CO6bkfzVPlh25l8beXw6Pg2df4OKO4YWP0yyOigYOTjuM
	MCGwy45a0xRcDYkaBOZmhI7ULFtrqxEE8tdqe076PZHcmiYueXT6xd9f5kLv2t2/
	Y/7CCwyGKTiwp/Ihhl7aNGhCIXpjDkNeuEsUbTnzWyBvI+epaJde0GA4RQIEqPqe
	m6cU303rEjTqZYRPCs2JSTHgamPZyM+oJD+48NWLHgxUiussfT1E57akiN+nMd11
	D15jDkc9RI1xCVu+OMFhCdjaDbUIfERGOGPXiNvSNVjVRHduFX9C3DzXZ/n/Dnmt
	SK5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1687609871; x=1687696271; bh=a9+CJ3I1oF8IDQX27l8UN+9p7kTef6heTr8
	vWNeVq1s=; b=APxa1WV1U2PwLNxllLuFjQeHQg3vNTru9306lm6XEMsjMI3dUU6
	MMbEZeVnPGI+ewvxWzEH//pbK6OM5zKf+dPgaH7kc+dl/ufNhZkBV7DJDXYWhUy0
	ss7fyey1lpc0UrYg2po2oW5xNuvL3Od/Tu5VQptkIy95AADqcALy5lPBasL0sLNg
	pXRFfvh7jRCUwmhmwbWawvE7auHod6qxJBdSuAZOPSqCgUtxiThB0hk+ETnQc4tA
	MgBVohG0tkBi2lwYIRwhtRui4F+/V62DNx1U32kUe6KqoHySo8YYLzMKoi78gvUR
	3z5Qgi7j9/JDc2AIxBrjcooliBBhqMHl12Q==
X-ME-Sender: <xms:D-KWZDzrfbIgDoV3YH7fCPLw7Xrd1fsZQWGEO6tqIGtVsVLnGF1BgQ>
    <xme:D-KWZLQsO0z3s1XLXQBJJdp09fCAalhfb6uiZyUFbhH0cBY6kP_iqIbFRho8AM1uX
    zke6JU_KVLdew>
X-ME-Received: <xmr:D-KWZNUYrOQVlzVhmPF5izQAGTezm4ThJcMTuG6u4f5OHXI3r2ifZcBfJ_Qh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegjedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:D-KWZNhc1dpx_crKbLspe5IIwPgQ5Z8OxlUjwj3MNlu01JeaA6rQOw>
    <xmx:D-KWZFBcpgEWd4it29wedctTbLnBCccT-Dw1E4iMc2IDdw7G9l4afg>
    <xmx:D-KWZGLKayX3pZik2Cz65Ldv5FK4J-78ohvcWqz1F7Iqj7WN3_cmYA>
    <xmx:D-KWZIMBUgcVMhxKxUtDkC_xRkya2sgGeex5hND2OxzCR6SqRUoBNA>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 24 Jun 2023 14:31:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session notes: Reducing the number of pages always mapped in
 Xen: Next steps
Message-ID: <ZJbiDH+YFj4guPQX@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c5JYt985RF5O5saf"
Content-Disposition: inline


--c5JYt985RF5O5saf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Jun 2023 14:31:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session notes: Reducing the number of pages always mapped in
 Xen: Next steps

Hi,=20

Here is what I managed to capture, unfortunately some parts slipped by
me.

Julien: remove directmap, avoid speculative reading it
  series sent 6 months ago - enough to remove directmap, but not perfect
  resolving virtual adresses requires mapping/unmapping page tables - signi=
ficant perf hit
Andrew: a lot of attacks read direct from directmap
  end goal "address space isolation" - no sensitive info mapped into xen
  directmap is not only place, but the large part of the problem
  single heap semi-rely on directmap
Bertrand: you don't know heap size for a guest up front, maybe can be speci=
fied manually?
Jan: why would that help?
Bertrand: no need to extend heap at guest runtime
Andrew: reduce number of translation (virt <-> phys) by using better data s=
tructures
  even getting address space isolation just for HVM guests will be huge imp=
rovement
Jan: zap the directmap when switching to HVM, and reinstantiate when switch=
ing to PV?
Andrew: just not have it mapped; some things needs to be mapped, like vcpu
  structure but not sensitive info, on fast path skip speculative mitigatio=
ns,
  but when hitting slow path (page fault), apply speculative migitations an=
d restore directmap;
  this makes fast path faster and slow path slower
Roger: what about auto eIBRS?
Andrew: it helps only in newer hardware, there is still older hardware
  even with retblead, the fast path with address space isolation would rema=
in fast;
  it's also about future-proofing, many new bugs will not require HV changes
George: the slow path would still require adjustments/mitigations, likely
Julien: map specific pages individually, not whole directmap, keep common x=
enheap mapped
Andrew: address space isolation helps also with non-speculative attacks, an=
d also per-guest heaps would further isolate sensitive data
Julien: the problem with page found approach is finding all the places and =
data that is safe and needed for fast paths
Andrew: implement faulting and then profile, then see whether common hits a=
re safe to keep mapped, but if not try to rearrange algorithms/data structu=
res
Bertrand: adjust how Xen is linked, isolate fast path areas from slow path =
areas to be able to switch them on/off fast
Andrew: struct vcpu and struct domain is a dumping ground for everything, s=
ome parts will need moving too
  for example: register data for own vcpus - probably safe, but for differe=
nt vcpu of the same guest probably not safe, vcpu for different guest defin=
itely not
Bertrand: risk moving the problem somewhere else? the problem of defining w=
hat is safe
Andrew: you can identify when it's in the fast path
Jan: besides registers and guest own memory, is there anything else secret?
Andrew: we have more luck than Linux, because for example Xen has no in-Xen=
 crypto libraries;
  but also, for example you can figure code paths by looking at stacks
  not much more secret data
Bertrand: if we try to unmap guest-specific data (Jan's idea), don't we sol=
ve the problem more efficient way?
Andrew: it's risky
  per-vcpu mapping is easy for HVM, but not for PV, because top level page
  table is chosen by the PV kernel, and Linux does sometimes run multiple v=
cpus
  using the same page tables -> no per-vcpu mapping
George: close to time limit, lets go to conclusions
Julien: figure out next steps, what to do with the series from 6 months ago
  remove directmap
  make virt<->mfn mapping easy to use
Jan: this feels like going too far, if we only need to remove few secret da=
ta
Julien: directmap is about whole guest memory
Daniel Smith(?): what is the overlap with SEV
Andrew: doesn't really overlap with encrypted VMs
  both Intel and AMD encrypted VMs assume hypervisor may have a mapping of =
encrypted pages
  if directmap is present, you have still cache timing attacks, removing di=
rectmap helps with that
Bertrand: also benefits from safety POV - limits the scope for evaluation
Andrew: accidental out of bounds write will be a page fault - easier to not=
ice
Jan: on demand mapping of xenheap, that means 4k mappings of everything; ca=
n we do better, to preserve superpages?
Julien: few other structures to consider
Andew: EPT page tables are not sensitive, MSR permissions also not, because=
 guest vcpu can recover them anyway
Jan: that data actually can be sensitive, but you can't do anything about it

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--c5JYt985RF5O5saf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSW4gwACgkQ24/THMrX
1yxABwf+MUyCFs8EhmnkVnKUYTgxdUDME+If5bp4j3zt5jOUsGJRDnZRpz2jz1Gc
d4dS7cGgJVOBbjKR1WWBN52zpBMN0PGFsp24QyLTFJ9D8PCgVFwRmDvxYLSS8/x4
x9GRXubBN9hBHDUM2L6hoUNUDhfDWpm1GHPymwowz3q4WabIWCpZmxmkN41rUTmU
T4SCF7k7StgQVoR+vh8W16HP/N1J5Y+nkHkgDO/EYQAZPJuweK0CdP7In7a88xej
Aap4yh8gP+91KRycmeIcM/eWAVvCeC+87++DNYfvvcHK5pMMr9ltJg+tvS52CxmZ
k2H+0/9SRMabn2yozV3QvWTF/nTQBQ==
=aEqc
-----END PGP SIGNATURE-----

--c5JYt985RF5O5saf--

