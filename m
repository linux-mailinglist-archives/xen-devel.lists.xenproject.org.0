Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7928757DA3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565246.883237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLklZ-0007BE-8O; Tue, 18 Jul 2023 13:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565246.883237; Tue, 18 Jul 2023 13:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLklZ-00079M-5V; Tue, 18 Jul 2023 13:29:25 +0000
Received: by outflank-mailman (input) for mailman id 565246;
 Tue, 18 Jul 2023 13:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju50=DE=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qLklX-00078x-1W
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:29:23 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c19d30-256f-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 15:29:19 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E644F5C0134;
 Tue, 18 Jul 2023 09:29:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 18 Jul 2023 09:29:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jul 2023 09:29:13 -0400 (EDT)
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
X-Inumbo-ID: 18c19d30-256f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689686957; x=1689773357; bh=Ouq8tD00YR5lLRXoWDu9BCI9TFkUKzpXjw8
	cIr+gTW0=; b=gfk6K119kWni0dFx4hwlkxNPkVHSiPmexHm8mP69qFhTh5TGHoY
	CbNuKnpwPemb9ja2Ir8O0EhfU/ogWn0TfjT5gJpxa8ramI+ZhQl69+itEXNupuJo
	OnMXhXJLd297snC88PP+3fsKy7jzdzHhdCpfs8gUaJSkQWtzI3zHGI2eclq1L7hz
	cYA3ONowbIeZmD67xXpOdscKjCt4wE/sH+wQ38fnVg7PaEBfoE1XJxRiwC/lnVz0
	A6xTGVlflu+Q4A82bTnkQ9fUqQvEAy1OKChSwBnpUOnldrK/PQv2/n9YYfYImynr
	JDVTychMU4se3xfV+6zJxSPIB19jC/GaQsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689686957; x=1689773357; bh=Ouq8tD00YR5lL
	RXoWDu9BCI9TFkUKzpXjw8cIr+gTW0=; b=ogkb3bVKru/SuK4SSIdJqyDP2uh6y
	vvZlUiw8YjObq+Sg3lW4TnOJMh5iDy8VOo7eEo470xTZGi4UKjjYoBfISnoyVYCR
	g2GMbngzqj7/gE1ZK1xxlS84voK+PvO3hvvtPQTcRX9AEuUrdOFGS7kQFrcEuGpt
	67ImocJX9AsyzYBUl9gp/ap9M4R6vZW2zgTbHaDOf9O1hGfhwVbW2VtE6oevUpBb
	C7custI5Dk3bcLdDCe7rOI8ipcRylCniVMJfPb1gzkUaYRsnNOFsR6QZ/Zf9JQtg
	V5SvNzmJcig0aHNtjAZN8oQbDTwVfZo351XoAsW43HkjzPpLZ5VCMftdA==
X-ME-Sender: <xms:rZO2ZCLqKP_EuN3ouJKXD3ljeBycgpw6weEwHXvcWjp9UtaQyfvWyw>
    <xme:rZO2ZKJYFAJ_HkOJKs6E33HLkmPPpxVT6yduBc9CKDJPj_glm2ox5Hm0KR-cS_e2f
    _QlqIoYG3SefVg>
X-ME-Received: <xmr:rZO2ZCuhA1MsHqnQaV3HVPTku4HnmN0lePv7-F_Zbau7_PmJBYyGLQCe5zVaKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgeeggdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:rZO2ZHat372iLA8yWC0zwtCU8XYwq0xUZxYJX-6r2N7cs45g2VBBxw>
    <xmx:rZO2ZJajIEeYM_Efdy2gmoq943qXMEIGUKNnNmnzVt0KD5S5MneuOQ>
    <xmx:rZO2ZDAHDf_pweK7uZSGPlmwqotVeVoKAp2gcBd-2N-aKl8vMPNfRQ>
    <xmx:rZO2ZNEivbdq-LBesNKUfevjCq8UFLaHwb92PAHuG3FTukU5oiul0Q>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <36b7e67c-f1c8-11db-aa8a-df4d8d01bb17@invisiblethingslab.com>
Date: Tue, 18 Jul 2023 15:29:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <20230718132334.2087-1-simon@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OSTiVepPvw0Ci6G3TMfaqXKS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OSTiVepPvw0Ci6G3TMfaqXKS
Content-Type: multipart/mixed; boundary="------------RmJ4UyE1bEccMyXc4q0dmRd8";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <36b7e67c-f1c8-11db-aa8a-df4d8d01bb17@invisiblethingslab.com>
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
In-Reply-To: <20230718132334.2087-1-simon@invisiblethingslab.com>

--------------RmJ4UyE1bEccMyXc4q0dmRd8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please excuse the wrong subject prefix. It should have been [XEN PATCH].
This is a single patch.

Simon

--------------RmJ4UyE1bEccMyXc4q0dmRd8--

--------------OSTiVepPvw0Ci6G3TMfaqXKS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmS2k6IACgkQkO9xfO/x
ly9ToxAAkAys64lGrojN0t426LCkL7bVL9FGItCouNSVhDLsOKQnThMmLEi9gorw
4okbNtYzaH6UW+fC8U2EdbpnGhYJ1cOHpXDKTw2Orjb4FpO9Z4eH8z5j3MfuCgjg
hod2XuKLxS/OnqgGO9JJj1O8jH0yZgkxEK6faIVr4aFXXOuiCksmTwenpmCV0wdw
9U6O4ehhLPJgxH9rIIBay1xjP1xtFIWS8j9+VpBOaLIcnJNRTGCoDQXY+wKE28vY
PRflQoNHCaqv1lo1lheXkEmM+MiVbyE7jFPmB2UvLmJ5Vun0fp3inkF2aNOvX/hJ
MFIkEjJwzmEDE8b2M3VHcb0OhW/eO7tqD6S4hUmOySXwSeoMMLKwSSnwnaz032Hp
aamuFsnjKIJqLmwfIXBX5m+0sCnTmmkQDQeciR6B2ocOXAgUz9vPB5jp50tAlDh+
yytWS6fth6k4ZXAXv6D1EtPm8jr3N/pJaKE2yxlD70UoA6kn+u/kyy1fX6is4+87
y0H/ak2T+PTaD7RwiDVfk2oZyG1MkOqL/HkLa7XW6gwqKLgKv7ttcqZvIfUyjG95
vTbT/uo70Ljz4sQb8k4/sGZrUazQGN+uJTRZZ3JjfG9WqeEG14TORu8zJ0W2l4dR
C3oTwzIALFLyX/QJ8FNqTx2uguX4wrbJuCPX92MuYK8QNiefu38=
=+SnM
-----END PGP SIGNATURE-----

--------------OSTiVepPvw0Ci6G3TMfaqXKS--

