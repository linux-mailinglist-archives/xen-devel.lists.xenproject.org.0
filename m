Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2521B5E61B3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 13:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410088.653085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obKfU-0004rW-5b; Thu, 22 Sep 2022 11:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410088.653085; Thu, 22 Sep 2022 11:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obKfU-0004om-2c; Thu, 22 Sep 2022 11:47:00 +0000
Received: by outflank-mailman (input) for mailman id 410088;
 Thu, 22 Sep 2022 11:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJba=ZZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1obKfS-0004of-9N
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 11:46:58 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 379ac922-3a6c-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 13:46:41 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0B9373200914
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 07:46:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 22 Sep 2022 07:46:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 07:46:49 -0400 (EDT)
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
X-Inumbo-ID: 379ac922-3a6c-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663847210; x=1663933610; bh=UdQjItpIHW
	lMSVdHdQtLelbMYvWZwKKLdVGjygAUq4s=; b=gk52S+0pPNB2o3A8PHPT3JLwLV
	FbWCBxWHC1Xp06jay4BjxKWUeg0bnRt2Xtd8s/0AtIIaehRViFSMjOg/C+K2So6a
	1JjMzO+v8F2k16Ro2+GK7nCSVZqze8w+IwTiO0UbcinozMMPovLgixFlBWacKWQ6
	cdHlmLqqzsT2/gmfc7fDQyDfeHRrKsNVo3zvFjAjRkQiY1pXYBGWtpsZDlYwfM0M
	EH+/ErsjYZ2F7T+Vp9FjpAsrMiMQC+fsl0Xcu5Iu2fo3DVJukC92m9Iwv0qPmtZS
	a+YpKMhvq18+6G+aDye7DEGXDN0RZsmgIdzSWPv4Sk57kCwlNJMUy7iVVVAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663847210; x=
	1663933610; bh=UdQjItpIHWlMSVdHdQtLelbMYvWZwKKLdVGjygAUq4s=; b=1
	pLltwLMB8KMSg//P5HywmeGMNJzQVUCe1+nZPjj/BHEOz78nmzgwcoRrtB5jKCAR
	9M1hqvVT9WfFrRzYI+/UYyf4Palr1d831vD3Uua3G7u0ahKJMCML/VGf80BGnzE5
	xYWishAlyh7E8/GawNSVoilvc+JsT6Ks4FMJQe8lWSuPy4RaKEQvtvhvY6AMZwR7
	gjl6iPJmhnbAANCNmVCtXiF5Y14PMCcMFjdO7mRrsaOdsZfCufws8oSuu0/Sh9hY
	oPqsSkYKgaAnXf8efPQP4GxgPamBdZQIr3XEXvuIn/7LigjBQkD4Padz/CvlFuYo
	/tKkVUvP71+d1oA03Xe9Q==
X-ME-Sender: <xms:KUssY64KHZGsxWG7NUzBhUKcR4i5AUPkEAs8hNXvzXSEX1mn9t6dSQ>
    <xme:KUssYz78U-X0LI0slnKkPrvhF1S2ko148WkjNM1vzBRFMh3vTBN4oJKVkLD1qVhd6
    pshd9kWquHfZA>
X-ME-Received: <xmr:KUssY5dy6l2y3JIM1h7BlOIvcxJVdu95T7UzFx4czbgDksbCpaolqZTM8GZM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeffedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:KUssY3Lg3XlpHgskXMw1-bxPLZrJ8QqDZU8mODI3tzWOWTcyvmOIrg>
    <xmx:KUssY-LAejzBEiOhwwr3CouSfI6hz2emxDf2WtU2buXIqjGRhi_5og>
    <xmx:KUssY4zIzVaj24jDIPV_jLxDbJNHdglMpuGF6UTCqW58HHC0GPprvg>
    <xmx:KkssYzXd1uc8sbO0UdYsEYJ3PA3BNIP9YAcfHGhYk67JxNBmmRIhxA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 22 Sep 2022 13:46:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session "AMD SEV"
Message-ID: <YyxLJSHx/aakL5rS@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QYwk5ZkAjPM1TjwK"
Content-Disposition: inline


--QYwk5ZkAjPM1TjwK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Sep 2022 13:46:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Design session "AMD SEV"

Notes from the session:

Andrei: is there ongoing work?
J=C3=BCrgen: similar to Intel TDX
Andrei: guest memory encrypted, unavailable to the hypervisor; useful in cl=
oud market; some similar feature on ARM too
        there was a session in April(?); possibly some funds will be availa=
ble;
        several related features, can be done in stages;
Andrew: first step: run XTF as minimal guest, PoC; then PVH guest
Andrei: implemented by AMD PSP (pltform security processor), visible as sep=
arate PCI device;
        run the driver inside Xen hypervisor;
        QEMU already supports it, but cannot be reused in Xen
        there will be impact for Xen ABI, like passing hypercall parameters
        maybe possible to share effort with other architectures (ARM, Intel=
 TDX)
George: using physical addresses in hypercalls might be a good idea anyway,=
 but the change is painful
        start with policy for new hypercalls only
Jan:    flag at hypercall entry if physical or virtual addresses (bit in hy=
percall number?)
        alternatively, mark buffer addresses in some high bit
J=C3=BCrgen: when adding SEV on Xen to Linux, it automatically will be supp=
orted for non-SEV too
Jan:    may be easier for hypercall callers to switch not all at once; for =
example /dev/xen/privcmd may be harder
J=C3=BCrgen: can dom0 run as SEV?
Andrei: in principle yes, at some point; can also encrypt hypervisor memory
Jan:    dmop is a way to avoid privcmd with virtual addresses
J=C3=BCrgen: PVH dom0 wants physical addresses anyway
        grant tables needs to set unencrypted bit; alternatively bounce buf=
fers (KVM way?)
        virtio may be easier, as KVM already supports SEV (with qemu-based =
backends)
Marek:  how to share PSP between Xen and dom0?
Jan:    interface coordinated by Xen
Andrei: we ask community to help the efforts
George: create epic, with specific tasks, some are shared with other goals
        some may be delegated to GSoc or similar efforts
Roger:  minimal PSP driver in Xen can be tested without rest of SEV support
Jan:    ^ especially when dom0 needs to access the interface anyway
J=C3=BCrgen: coordinate Linux work with me
        incremental work, starting with design review
George: does anybody work on physical addresses in hypercalls?
J=C3=BCrgen: there was a design session about that before
Jan:    design in some people's heads
J=C3=BCrgen: will look how hard it would be to switch all at once per domai=
n; uuuh, it could be hard, because domain may boot via grub
George: lets write down those concerns


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QYwk5ZkAjPM1TjwK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMsSyYACgkQ24/THMrX
1yxarAgAgHG373W9pzggohn/xOUoEV/UAht6ldC1AQk7DMiJalQ5tyOcT1rFDGen
bv1k6ulUGS/fSdmRho/Udw2ZZ/k17rsH/ZuO/zBUzLUWGcXxDuQMO9HTzHq+54h9
YI+3KqjRgpqhH34jbD4oPIzdo0jswMO0PcmT1SuuhEvun0TzuztkexmgaNB7gggJ
fFR4H2VSYXtmZNLkdgRLr9dxtEfEc/BeZxuAIDnohFxanWiO3foMNKpx4H8IMHh9
Qz5nEqS7fFciwJWuMM10RlgXobkXfEHJpIZZSBbu7MrS69ywHs+T/MCnyh+66FMs
eAxkyH/JkRtfuNLVsou9k8CXAX50/A==
=ac5k
-----END PGP SIGNATURE-----

--QYwk5ZkAjPM1TjwK--

