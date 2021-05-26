Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BE6391D68
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 18:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132652.247357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llwr6-0002eI-Is; Wed, 26 May 2021 16:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132652.247357; Wed, 26 May 2021 16:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llwr6-0002bb-F4; Wed, 26 May 2021 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 132652;
 Wed, 26 May 2021 16:58:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4Cs=KV=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1llwr5-0002bV-2f
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 16:58:03 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41afbbfb-03c6-4007-bda8-37d85af4429b;
 Wed, 26 May 2021 16:58:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 87D921388;
 Wed, 26 May 2021 12:58:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 26 May 2021 12:58:00 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 26 May 2021 12:57:59 -0400 (EDT)
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
X-Inumbo-ID: 41afbbfb-03c6-4007-bda8-37d85af4429b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=pKuNCDmr5syPGyt1UBmJ7UEIer4kS
	YVDOklaFBonYqM=; b=mZhy4buIcSFdu+aFWZIlmgB3vPx84vtAQnslt+8dPRHSC
	5tOqC/wwqyrOB8fsgt7/k9oOpOQHwZMDl1wcJqA/fk/OWDM9Y+95g2sR0SlTFmXu
	4ThgBzpguVNdGt/Ni3BDsZ9VS38i+a/46eIHMYc5OCcq1EPWVdNEABS9ha5ZN43R
	GFk6lXmNJRfLDITEV9p8jBeHFvR//YnX8mb8cBhQZm6dQC2gUCdDF5uG7hp7TW0R
	gAyV9ibpjNjOZPN7NBEJ0b1LNTSmMm65EjwjA6p5UmsRG8WfTuga+OzIA4BJGSx7
	36FxvoVxMhiefZiDF88KHWOjNMVD2dU/3lY7CItnw==
X-ME-Sender: <xms:F36uYKl0hW0ZpNa_2-KjRf_e6Nsza_7qkccLYWbwc2rpRg50CgUbrQ>
    <xme:F36uYB2eZOrGQ4pSZ0RvzrGDzZ-UZcHpKVNsHeAVgjYIUBrurHo85zZuEaJzd0viY
    VtG_Qr-bxEm4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekfedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptddugfet
    udevudeiveevgfetueejlefggffghffhhfehtdfffeefgfduueegfefhnecukfhppeelud
    drieejrdejledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hm
X-ME-Proxy: <xmx:F36uYIq4ARNSB27UzHWBrJI2mqiYAmlV_9B9hE7B0hqHkv2eik9FbQ>
    <xmx:F36uYOn6orO1ox7O39xfV1wKQHTOkUklg1j_cren0034iWzniYCRog>
    <xmx:F36uYI3v4YKFOFvk2VllOH9YU8qbk3GGUa7V_YU3DdD5buIgK944sA>
    <xmx:GH6uYJiXIQIvZvZTSVoND_b1zd6r2gZ8y3FuruAyf0uJHbY84jlohg>
Date: Wed, 26 May 2021 18:57:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: building docker image in gitlab-ci
Message-ID: <YK5+FGpjgeCUMg6Q@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+7Kp4yILsOXaDwqL"
Content-Disposition: inline


--+7Kp4yILsOXaDwqL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 May 2021 18:57:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: building docker image in gitlab-ci

Hi,

Regarding our chat few minutes ago - this is part of the .gitlab-ci.yml,
that builds and pushed containers, that is later used for other tests:

    variables:
      CONTAINER_TEST_IMAGE: ...

    build:
      stage: build
      image: docker/compose:latest
      services:
        - docker:dind
      script:
        - cd ci
        - docker-compose build
        - docker tag <whatever-docker-compose-produced> $CONTAINER_TEST_IMA=
GE
        - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_RE=
GISTRY
        - docker push $CONTAINER_TEST_IMAGE


I use docker-compose here, but it doesn't really matter. It pushes to
the container registry conveniently provided by gitlab too :)

In my case I build trigger it via push to a specific branch, but
connecting to schedule should be trivial too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+7Kp4yILsOXaDwqL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCufhMACgkQ24/THMrX
1yx4EQf+LIeByJXOTqdZABk5J7hmbshBD48X4HpEySoDbvUT5aTGz/e5uJ/voK0l
O/sO4Sodr1eRms0KoB6qi32PWmjBoqQv+K8dX+qtfGZYP2fOjuSf9BAfF0dl7/aI
kEHoofDkYuIkgUcLL/a8gE4BcPbyssBQCJtGr15CmMvWgcj5E1qkpMBjnqEC/HW7
5Q5+v/a4ksbJ3CXe8nn81mb2Vho/kgs6gVzo/n81igMb7hTUEkp7Ou/2IKFFsCl6
6QoatBkpFpNrlnprYcGLOdZ09ScgxkfnpiJOSceeXii1+/VJNzuxv9u5JGX6l3qY
a1IHSN5O7r4TR1AjORf1ixfjPUz3pg==
=ydnB
-----END PGP SIGNATURE-----

--+7Kp4yILsOXaDwqL--

