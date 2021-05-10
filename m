Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC783797D9
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 21:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125510.236261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBo0-00082R-RE; Mon, 10 May 2021 19:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125510.236261; Mon, 10 May 2021 19:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBo0-0007z0-NV; Mon, 10 May 2021 19:43:04 +0000
Received: by outflank-mailman (input) for mailman id 125510;
 Mon, 10 May 2021 19:43:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ldtt=KF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lgBnz-0007yu-9M
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 19:43:03 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e286287e-1c5f-49be-b5ae-bb735ebef34c;
 Mon, 10 May 2021 19:43:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 202785C0061;
 Mon, 10 May 2021 15:43:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 10 May 2021 15:43:02 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 15:43:00 -0400 (EDT)
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
X-Inumbo-ID: e286287e-1c5f-49be-b5ae-bb735ebef34c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=L03Uio
	jr12PpS6PKDJd2ELGBLdxQ6yiTOAhVTtDPRVU=; b=qfcGIo9f2E70b4wQLBr81V
	H9gWJRAnLiX+QCjr1R0ama2p7WlDsZtgyzUBCgL+xu6rUvrenj2y9CS7fddl38+L
	7MdCMa9FIuPbe0ZjCIty02hG8FptzpMCUAqEgZuvpkfGmAN1QKY2wIkzOHHrGhgi
	UcPnAtjLhjaWBftbfd0vZL97eh2f6NwdeSQr9fpm4KS21eaTUh1pDet/vdWe7l16
	4f4XXoE6gczjH93uPSWC/fb40u5AhlrcxEYzgtsvOeasthR16g2Sx7uV+IMT1XwV
	66u5GcvP6UPMW/CyP1SIoY2O5f2zlMYfwfkTAn47a9kb+MQN5GLU+HeswkKwRDjA
	==
X-ME-Sender: <xms:xYyZYOEVSKewBEcx05jVh4-yi7bp7K0O9ya5DDSWhZSCGVM8jsHOxw>
    <xme:xYyZYPWSu47BIDeJMRSCxOt1BtyHwnlOBcyPjJBhhqIu5Rk41LmkNV3YIopOy0M0X
    NZu8sMMAltWHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegkedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteev
    ffeigffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppe
    eluddrieejrdejledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:xYyZYIIIIjNDWmuokcUvX4epAwKQT-cm4OgjwyfS0oF-l6ye39n4Rg>
    <xmx:xYyZYIHX3TE7s-6ouCe7ZgYhaeqjZjyTZ3xqwB1JPmB9H9pWEUZtzw>
    <xmx:xYyZYEVsQlDXb9OdR8Hmq15V6gYjs7YwBq2UEHGwDGhmgdlD5GkHJQ>
    <xmx:xoyZYLS8Sm1eMuBM6c9l6eCLA2OysCycUhrPSgCkJjS-iTOY0D8g_w>
Date: Mon, 10 May 2021 21:42:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Michael Brown <mbrown@fensystems.co.uk>, paul@xen.org
Cc: paul@xen.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	wei.liu@kernel.org, pdurrant@amazon.com
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
Message-ID: <YJmMvTkp2Y1hlLLm@mail-itl>
References: <54659eec-e315-5dc5-1578-d91633a80077@xen.org>
 <20210413152512.903750-1-mbrown@fensystems.co.uk>
 <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N7lT0JGnZD6+el7C"
Content-Disposition: inline
In-Reply-To: <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>


--N7lT0JGnZD6+el7C
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 21:42:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Michael Brown <mbrown@fensystems.co.uk>, paul@xen.org
Cc: paul@xen.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
	wei.liu@kernel.org, pdurrant@amazon.com
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching

On Mon, May 10, 2021 at 08:06:55PM +0100, Michael Brown wrote:
> If you have a suggested patch, I'm happy to test that it doesn't reintrod=
uce
> the regression bug that was fixed by this commit.

Actually, I've just tested with a simple reloading xen-netfront module. It
seems in this case, the hotplug script is not re-executed. In fact, I
think it should not be re-executed at all, since the vif interface
remains in place (it just gets NO-CARRIER flag).

This brings a question, why removing hotplug-status in the first place?
The interface remains correctly configured by the hotplug script after
all. From the commit message:

    xen-netback: remove 'hotplug-status' once it has served its purpose

    Removing the 'hotplug-status' node in netback_remove() is wrong; the sc=
ript
    may not have completed. Only remove the node once the watch has fired a=
nd
    has been unregistered.

I think the intention was to remove 'hotplug-status' node _later_ in
case of quickly adding and removing the interface. Is that right, Paul?
In that case, letting hotplug_status_changed() remove the entry wont
work, because the watch was unregistered few lines earlier in
netback_remove(). And keeping the watch is not an option, because the
whole backend_info struct is going to be free-ed already.

If my guess about the original reason for the change is right, I think
it should be fixed at the hotplug script level - it should check if the
device is still there before writing 'hotplug-status' node. I'm not sure
if doing it race-free is possible from a shell script (I think it
requires doing xenstore read _and_ write in a single transaction). But
in the worst case, the aftermath of loosing the race is leaving stray
'hotplug-status' xenstore node - not ideal, but also less harmful than
failing to bring up an interface. At this point, the toolstack could cleanup
it later, perhaps while setting up that interface again (if it gets
re-connected)?

Anyway, perhaps the best thing to do now, is to revert both commits, and
think of an alternative solution for the original issue? That of course
assumes I guessed correctly why it was done in the first place...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--N7lT0JGnZD6+el7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmCZjLwACgkQ24/THMrX
1yxjlAgAhdtYB3Reqgw6Zn/a1iAFa+d1JPbv8huIZu3RSB3YYD2LOYNP4h/wBQbs
YPZ28kcqZmlbnUIlh7kFYO6EuyK+2CjiwxhsQB0QOiZWwv2ZDZhfW0n9TSVK3Q+t
aT67q6/J3EJDL0eEiiER32LBpWGxwMJoQDr4QeqpO46Ha6gdN5rdBKEqSbyP30Gu
Uccdhx1pW8agqDdmrdBiZV0cupQygsAN7/z987FnlAnqrdawiOwlMqBMhZVQnjeW
ZjPJ4gNPMsurbt6YD/BtSGphuW9Rj7RJ5vD+Hal8Cb/efDCPSkpl2uIPSQp7KTzk
tWeHUPh+6izwA+etf9f0mKzfMUWwmw==
=Dncm
-----END PGP SIGNATURE-----

--N7lT0JGnZD6+el7C--

