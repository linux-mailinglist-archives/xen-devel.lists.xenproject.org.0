Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC26A48ED0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 03:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898465.1307019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnqKa-0006He-ER; Fri, 28 Feb 2025 02:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898465.1307019; Fri, 28 Feb 2025 02:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnqKa-0006F6-8Q; Fri, 28 Feb 2025 02:42:28 +0000
Received: by outflank-mailman (input) for mailman id 898465;
 Fri, 28 Feb 2025 02:42:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXX3=VT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1tnqKY-0006Eq-Ir
 for xen-devel@lists.xen.org; Fri, 28 Feb 2025 02:42:26 +0000
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a334aec2-f57d-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 03:42:24 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 96A5011403EF;
 Thu, 27 Feb 2025 21:42:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 27 Feb 2025 21:42:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 21:42:21 -0500 (EST)
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
X-Inumbo-ID: a334aec2-f57d-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740710542;
	 x=1740796942; bh=KRuMioT/iwaFL+xLzxI2xkmzeNQHgYh117nRbQzQ09U=; b=
	ExZwlSmcCbl40WwFoLDDvb1cTxtNsa+xlBzQqN8Tto82+V0W7ez27UadX22tCfqJ
	VDBFOzb5DDASU/AVwwowTUNJJ/MtbT+uCaeSlCeg7J91rCu8s1uxvQqE0f0aXmYA
	yImpZCPGbmrMi+bZX5asDpyr4+aA7WrY/lBXlA77BHRfkx50X4X0xX3yR1iuT7Wl
	bozlpYzMiUUKVzGyI1u+cMVPKaxQiOEGz9n4A5cli3NoDQkMDq5wVXl3GwDrK90b
	xTlJCQBLGtjEyfP7DJLRy0g7cJbq11WiSVgvE9LGW8GFjs78HJzealvqtpPHFgg+
	2Cbz3iGZUe2OEJsaU25gAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740710542; x=1740796942; bh=KRuMioT/iwaFL+xLzxI2xkmzeNQHgYh117n
	RbQzQ09U=; b=chHJCm19zEAShNlLBYNN6XM0cbkbIS+hQUHVsduUJTDWe1x//Xf
	VGbe+eIrB34fgLKzd2yY/yQ3CEQSx1uDVVbeWICyT+di0WrHLice2V3Muy/NEKTW
	2gIUZzQP/OncCv+1OcyeK96ZERb9zWaYsvm0SLIdqLlAMc0H9SOxRyCrj0DeI0as
	L9bRL2o6+ZFBKX4uqzJczszF2wqde5MjdK6gBsfOp7ouagQxuV7R2ASZEZRLRhcG
	azQIco1wSXGG0KiGL9zvzpP5DanBJaramTpDj+t4aKt3wn4RWQvGM7RxmhlnN1Ev
	2OWqqWtAoFSzTEx3k2wmO6M2EYSMB5ix4mg==
X-ME-Sender: <xms:jSLBZ4jRHlNKA7GpdhW3FoLcKdMuu69M80tmWLRX3N-ll4UB1oTCQQ>
    <xme:jSLBZxCDtXUoBpesBhwfWLUf-S-el7YrvQj-arUsp_9_TXSQRmnAM5zlapAdzUK6A
    525bf3l4A6pCqs>
X-ME-Received: <xmr:jSLBZwGGKdw5pcxDqKedq7JRbOlWkN7IzxB9B5ou_4st_U8Qpotj1XgByEMNcgeP_BQcRwA3cgPKIDge9gehAM1ZfTxzFtWd2Lc6TPtwKm-X8XtW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekledvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeej
    ueekheekgeeitdegkeekleetvdfhuddufefgffehffehueevvdeileefhfenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ohhsshdqshgvtghurhhithihsehlihhsthhsrdhophgvnhifrghllhdrtghomhdprhgtph
    htthhopehsvggtuhhrihhthiesgigvnhdrohhrghdprhgtphhtthhopeigvghnqdgrnhhn
    ohhunhgtvgeslhhishhtshdrgigvnhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvg
    hlsehlihhsthhsrdigvghnrdhorhhgpdhrtghpthhtohepgigvnhdquhhsvghrsheslhhi
    shhtshdrgigvnhdrohhrghdprhgtphhtthhopehsvggtuhhrihhthidqthgvrghmqdhmvg
    hmsggvrhhsseigvghnrdhorhhg
X-ME-Proxy: <xmx:jSLBZ5Rg4rdy732wNrIC5V8yym6rzaaCZ2V-2Aj-8Q4yDCQSIYHVjw>
    <xmx:jSLBZ1zb20p_62QA5jiNwR1k7VMmr0YqGyGbz8vVC-6X7ucx4yDGuQ>
    <xmx:jSLBZ36qZ-jfIocaxEc7WCnDSDpcOq8wAcr56DC8M3DPnsvtyX1smw>
    <xmx:jSLBZyxdFvqdzg_ubAi4EgR2Nrh9f1ugw6yN7cIi46baNcROG7mmVw>
    <xmx:jiLBZ8mog_Xj8gRVyUE2hkdbfcZtOq3N07hEfmmwrqhl8JmGMQyNGuwJ>
Feedback-ID: iac594737:Fastmail
Date: Thu, 27 Feb 2025 21:42:15 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: oss-security@lists.openwall.com,
	"Xen.org security team" <security@xen.org>,
	xen-announce@lists.xen.org, xen-devel@lists.xen.org,
	xen-users@lists.xen.org
Cc: "Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Re: Xen Security Advisory 467 v1 (CVE-2025-1713)
 - deadlock potential with VT-d and legacy PCI device pass-through
Message-ID: <Z8Eii3DYNDoKNNhg@itl-email>
References: <E1tndOO-00CM3B-2R@xenbits.xenproject.org>
 <5ecf18f8-e8e9-431d-bb59-4631a598574e@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u4WqJNsiBbcBAZsp"
Content-Disposition: inline
In-Reply-To: <5ecf18f8-e8e9-431d-bb59-4631a598574e@vates.tech>


--u4WqJNsiBbcBAZsp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Feb 2025 21:42:15 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: oss-security@lists.openwall.com,
	"Xen.org security team" <security@xen.org>,
	xen-announce@lists.xen.org, xen-devel@lists.xen.org,
	xen-users@lists.xen.org
Cc: "Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Re: Xen Security Advisory 467 v1 (CVE-2025-1713)
 - deadlock potential with VT-d and legacy PCI device pass-through

On Thu, Feb 27, 2025 at 03:33:18PM +0000, Teddy Astie wrote:
> Hello,
>=20
> Le 27/02/2025 =C3=A0 13:57, Xen.org security team a =C3=A9crit :
> >              Xen Security Advisory CVE-2025-1713 / XSA-467
> >
> >      deadlock potential with VT-d and legacy PCI device pass-through
> >
> > ISSUE DESCRIPTION
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > When setting up interrupt remapping for legacy PCI(-X) devices,
> > including PCI(-X) bridges, a lookup of the upstream bridge is required.
> > This lookup, itself involving acquiring of a lock, is done in a context
> > where acquiring that lock is unsafe.  This can lead to a deadlock.
> >
> > IMPACT
> > =3D=3D=3D=3D=3D=3D
> >
> > The passing through of certain kinds of devices to an unprivileged guest
> > can result in a Denial of Service (DoS) affecting the entire host.
> >
> > Note: Normal usage of such devices by a privileged domain can also
> >        trigger the issue.  In such a scenario, the deadlock is not
> >        considered a security issue, but just a plain bug.
> >
> > VULNERABLE SYSTEMS
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Xen versions 4.0 and later are affected.  Xen versions 3.4 and earlier
> > are not directly affected, but had other issues.
> >
> > Systems with Intel IOMMU hardware (VT-d) are affected.  Systems using
> > AMD or non-x86 hardware are not affected.
> >
> > Only systems where certain kinds of devices are passed through to an
> > unprivileged guest are vulnerable.
> >
> > MITIGATION
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Avoiding the passing through of the affected device types will avoid
> > the vulnerability.
> >
>=20
> Is disabling interrupt remapping another way of mitigating this
> vulnerability (e.g iommu=3Dno-intremap) ?

No, as this allows other attacks that allow denial of service at the
very least.  See
https://lore.kernel.org/xen-devel/19915.58644.191837.671729@mariner.uk.xens=
ource.com/.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--u4WqJNsiBbcBAZsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmfBIocACgkQszaHOrMp
8lN21RAAgeRJeppbhMy4o0dW5D21W0odLP3HkoV4puZ08aMX1WqDUy+TR0WpdseY
yUdBXE88hzIVYYkhOFg92ciXw+Hz7IUSxp7RJO1BPve179JAlC/JeMDoYLpM3Il9
b6o25sWh2BleFtOgiG/TPdQeavRemvUxOb9kw0iA5MpCdoaLXvvqVeX3gWj0ZDGv
l0t/RSVVVYOCUnB69Jhxv8K36Vid4Z9AjKzLZ5uAkn8MAlHRhRVsHrOrn74XMJVI
2rG/VfmLz3w/S5T036qLf8dTimOSbfTzm6Oj6PAfLX8vu0FiXaT7MSLNN0xWCFcs
J3dxFaT0Q8NyrCAiJc5y7BHF5CmhqC+E6Ff16qvyD3HcrrCiS4CEriLCvbVc+AUA
ljRoj4ncFb4XvbECGS4/Uafh9sP479n+UsCOUdPx/ixwMtuRZUsPfujeZobsrMuq
+bC2K9NnkAoHsKtnPqWSkE1HbhF8rDWJsX9fYaUyJmdAhpjpLKjs5sEgOeGlcWeg
T8YOhMCOjk2vlpt/i1K0xJnGGLXoCwJQefZruNHRZXymnv2uVtDB3Yt/RhXgjqd8
++IF+sQz6zlMNiYS8GRIrrFP8Hs0t+K6oEU+WM3+sEFaYIdowtezwtVbTUr7qYx0
XIZhNczwISio36T+sOtKC5awPxLyXfjkdJr0hSe3y5jX3r8cJXg=
=U+LW
-----END PGP SIGNATURE-----

--u4WqJNsiBbcBAZsp--

