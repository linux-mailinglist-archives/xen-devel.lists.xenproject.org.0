Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1F26022EB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 05:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424717.672351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okdeV-0005mt-Rm; Tue, 18 Oct 2022 03:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424717.672351; Tue, 18 Oct 2022 03:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okdeV-0005l0-NK; Tue, 18 Oct 2022 03:52:27 +0000
Received: by outflank-mailman (input) for mailman id 424717;
 Tue, 18 Oct 2022 03:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=llzQ=2T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1okdeT-0005ku-TX
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 03:52:26 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45187003-4e98-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 05:52:23 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8802F5C021E;
 Mon, 17 Oct 2022 23:52:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 17 Oct 2022 23:52:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Oct 2022 23:52:19 -0400 (EDT)
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
X-Inumbo-ID: 45187003-4e98-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666065141; x=1666151541; bh=W4YdM85rRr
	G8oSndD/hIo0CDcv3F1jsFFOfc7EWctI4=; b=QHQht0C4dVlXl/FbBF9w7NG9o4
	4UgJ8jOEvdug/MzJJ9yawQ2Q77WksxxyG4F6cmNvBRNWaZee4kxO8M8uVHjxTbmr
	r4VNCeI2ideFuwp5rJugzV1+T7PLZ9faCVHQSv7esIKDbY/2FENPFRcsiFm9gozT
	qcZM8xYq5hy8b0+8fFEgUuCtQ5FFS01tWWWGxJ4yqkYu6ER1+hFvX1YH03VoaoFI
	ie5svNFkqEUybqyUJu+cs6Kt/T6v1vyeII04OOEN7+vr06JBHH+NSjIFqmi7k6Pf
	Ldmeor+EMZ6EJoO4Vf0ZJx7YFC9KyOOdMVsHoCmED+x4Hqy/PLbi5/j0yAgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666065141; x=
	1666151541; bh=W4YdM85rRrG8oSndD/hIo0CDcv3F1jsFFOfc7EWctI4=; b=I
	r2PL6lYzUUvpbh6Rkts4EO0ht4E+sf7lcSHJvbPy8vJCFhdS3itiRXhTAPuCbDkr
	0FaBeLbEMqzg3ZYCzr80DkLJqXgsLwi8v6MICwzFkumS0abPydv/SiCZ+E8XlCzZ
	taiWPK2yZPpAjpRJLMdflzzLlhQL2rUdlDZhAxluRu1Aq0ypYa73sHJxeIU6U6Zp
	grwAH3BQF1bu1qmLv4EODp8YCn73YnXySP3p3XAYna2l+0IvwqlqI+sS0p6Pb4Zg
	fvS02sp3lTLOW8ZQIvTxVk93h8YQgRmdWmdXZe4INI2y/xPAGcCAN6o7Ctvy43sh
	x8kd6Aum1x3IUPnrNZOUg==
X-ME-Sender: <xms:9CJOY-Hs1A2mbvw8Np9dZ86H7aWMvHikYIjhdixNFZEuttrDAByybg>
    <xme:9CJOY_Ud3fUTNSujKSylqRCCEHASmm7N9--uMjO3Ve3tuvIUIRaht-ZrbVuESWIKp
    JH0YlsVyzgPKA>
X-ME-Received: <xmr:9CJOY4I3TGP0QG9t5gony9WuosjuBLsbUn-Qn-2VSsuPyzSqlCwP8-uCA1RFBYkOa9FQJs38Xzv3xMf06uXyDUuOME-YNQZAKocl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeltddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephefguedv
    jeekieekleduleetveefgeffgeetfeffteehteffuddujeeuudfgvdetnecuffhomhgrih
    hnpehquhgsvghsqdhoshdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:9CJOY4HaDe7b7N0A0jNI3TuJE090tUi-F4_RDwJsUDnZUUEC4ZMqFw>
    <xmx:9CJOY0WzZVfoqLtd1tMLezcf2RCqfXiZjjcNxWEJ1wTcJz7BbqW4Gg>
    <xmx:9CJOY7Pu3y9Pv_iUc4RX-xmxM0gwJPxzLoy_uqj5I_1eFd6zKGyA6w>
    <xmx:9SJOY2JMS45VDdmqfauwWh86z8TszdDU3rezAUI8tP5zQJNKUFe5vg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 18 Oct 2022 05:52:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev
Subject: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
Message-ID: <Y04i8V7xamTkuqNA@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cFcJRBMRCFbBRw5w"
Content-Disposition: inline


--cFcJRBMRCFbBRw5w
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Oct 2022 05:52:16 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev
Subject: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"

Hi,

Since 5.19, I observe severe glitches (mostly horizontal black stripes, but
not only) when using IGD in Xen PV dom0. After not very long time Xorg
crashes, and dmesg contain messages like this:

    i915 0000:00:02.0: [drm] GPU HANG: ecode 7:1:01fffbfe, in Xorg [5337]
    i915 0000:00:02.0: [drm] Resetting rcs0 for stopped heartbeat on rcs0
    i915 0000:00:02.0: [drm] Xorg[5337] context reset due to GPU hang

The issue can be observed on several different hardware (at least Ivy
Bridge, Tiger Lake and Kaby Lake). It doesn't always happen immediately,
sometimes I need to start several VMs first.
Example how it looks like:
https://openqa.qubes-os.org/tests/48187#step/qui_widgets_notifications/8

More screenshots and logs are linked at https://github.com/QubesOS/qubes-is=
sues/issues/7813

I managed to git bisect the issue and ended up with this as the first
bad commit:

    commit a2daa27c0c6137481226aee5b3136e453c642929
    Author: Christoph Hellwig <hch@lst.de>
    Date:   Mon Feb 14 11:44:42 2022 +0100

        swiotlb: simplify swiotlb_max_segment
       =20
        Remove the bogus Xen override that was usually larger than the actu=
al
        size and just calculate the value on demand.  Note that
        swiotlb_max_segment still doesn't make sense as an interface and sh=
ould
        eventually be removed.
       =20
        Signed-off-by: Christoph Hellwig <hch@lst.de>
        Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
        Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
        Tested-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

I tried reverting just this commit on top of 6.0.x, but the context
changed significantly in subsequent commits, so after trying reverting
it together with 3 or 4 more commits I gave up.

What may be an important detail, the system heavily uses cross-VM shared
memory (gntdev) to map window contents from VMs. This is Qubes OS, and
it uses Xen 4.14.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cFcJRBMRCFbBRw5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNOIvEACgkQ24/THMrX
1yycxQf+MDrI5t+yoFuj1FC3BntpCUVQRQlOwZpAQuuDMEZp7i0SQgELI+rr7AxM
7hENZvEWiRVfcul01QkAIqJHtuNtRCjdIZre5ISRBsqgw8KHyD7SWxGcs9hsXOcU
Z5r1dIX8FqROun1vYIhRVBOtIHIA1jXnHEttenNu2KnMEXstGU03X+Xri99PJPH/
JaYf+re4ziOqYqWE6SkQlmo2iDVOIbbg9huOJTFjRBf4VCVQM3jMIh87i52V+U9W
vhxvGK8cYRRo4DWQOdgNRMCqKG9w0xn2uB06E2KXqwenNv++EhWEQNCeR13otXY5
Hh6jT1pbY3q76EOTjIYfvL5Pi0MXvA==
=3u4/
-----END PGP SIGNATURE-----

--cFcJRBMRCFbBRw5w--

