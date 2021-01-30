Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA373098CD
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 00:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79125.144091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5zcG-0005Oz-DM; Sat, 30 Jan 2021 23:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79125.144091; Sat, 30 Jan 2021 23:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5zcG-0005Oa-9l; Sat, 30 Jan 2021 23:25:20 +0000
Received: by outflank-mailman (input) for mailman id 79125;
 Sat, 30 Jan 2021 23:25:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MYE+=HB=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1l5zcE-0005OV-DR
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 23:25:18 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e14430e-72dc-42c0-a2bc-dbed724d23db;
 Sat, 30 Jan 2021 23:25:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E4D2D5C00DB;
 Sat, 30 Jan 2021 18:25:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 30 Jan 2021 18:25:16 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8961D108005F;
 Sat, 30 Jan 2021 18:25:15 -0500 (EST)
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
X-Inumbo-ID: 9e14430e-72dc-42c0-a2bc-dbed724d23db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uGSJdj
	Lm7T/PXU4iFWHQXgTBYpqhY1DOdD1iQ5TPgmw=; b=gzLNUDBctOiHUBw5c7UHV3
	gIF1yG63lLoaWN5GPM+AmhzT1jgIrsRYTQr8tjEC+h3+dfciA++moXtbvebyS37a
	oH+VfQX5tWQjddBPe+rWEnto/OrrrHDaQgFMVuQcuVbNiY9f30cqYtNjKCbzfUzT
	y3BfAxu4vUQIEZZB7RGaSM1SIUy6N1ZaV9JB55YJmXIe2Bij/0/+sZVpe92QLi5R
	lBMC66aWCgwhTBxB/tc0hQgvqxFcz3AnITx+MjsWcDIDi7baqCAcDWpaA5OqyzAo
	LN5NyYhTVSHdhDKURcF/Nhu2+2uXJinuRJT/M5ohQE9Xqjke/dbuM7UeCp7ag7Wg
	==
X-ME-Sender: <xms:3OoVYLi5LTu62OcKn0dxanXVHQVtnCL4izW9UM3Tw-GdF_riV7n2oQ>
    <xme:3OoVYH_kaHWcNpgTqMJyTo0pPoi_SPoF4mmJ_j2tukVCde59S2ooU_7gL9KTrjvW6
    nmYPFLtopUUig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheevvdeu
    veehkeehhfevgffggfevudegteeugfeliedvhefgueeiuefgteetieffnecuffhomhgrih
    hnpehkvghrnhgvlhdrohhrghenucfkphepledurdeigedrudejtddrkeelnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:3OoVYH9ZLKNiwTtPoIPt4HgdLY-Kf_d-Uqxfy8d_ThrnrcsYyemRdg>
    <xmx:3OoVYAAiCbejjttzqOXt5CEkeH85DfQy6AbzPDKCM8O2roH730pScQ>
    <xmx:3OoVYHyDboqPGnQcGUJMHvaakeJAn8pbDlemB9axroeNozW8FzOvkg>
    <xmx:3OoVYMPXVaQcwYdeT9sTiXvX0GW5g-lcPFo9jPWhDZGTiFMmAqpL1Q>
Date: Sun, 31 Jan 2021 00:25:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Michael Labriola <michael.d.labriola@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Sasha Levin <sashal@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: Problems starting Xen domU after latest stable update
Message-ID: <20210130232513.GA6354@mail-itl>
References: <2nft2kipqg.fsf@aragorn.infrastructure.cah>
 <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
 <20210129005129.GA2452@mail-itl>
 <44068a70-8940-824b-9e39-b800635b92c7@suse.com>
 <CAOQxz3w-2aJn1dKbQRG8_m8f3_pN0zSXzYkfyU7cvo34vF6P=g@mail.gmail.com>
 <16a2f371-1c39-13f5-c214-e054b08abbab@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <16a2f371-1c39-13f5-c214-e054b08abbab@suse.com>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Problems starting Xen domU after latest stable update

On Fri, Jan 29, 2021 at 03:16:52PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 29.01.21 15:13, Michael Labriola wrote:
> > On Fri, Jan 29, 2021 at 12:26 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
> wrote:
> > > If the buggy patch has been put into stable this Fixes: tag should
> > > result in the fix being put into the same stable branches as well.
> >=20
> > I've never done this before...  does this happen automatically?  Or is
> > there somebody we should ping to make sure it happens?
>=20
> This happens automatically (I think).
>=20
> I have seen mails for the patch been taken for 4.14, 4.19, 5.4 and 5.10.

Hmm, I can't find it in LKML archive, nor stable@ archive. And also it
isn't included in 5.10.12 released yesterday, nor included in
queue/5.10 [1]. Are you sure it wasn't lost somewhere in the meantime?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.=
git/log/?h=3Dqueue/5.10

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAV6tgACgkQ24/THMrX
1yz3dgf+P66i0RjhvZfO1Cg+lbVdwhli7NGBDS5ILY4CdlKQzwYhlHtlbehX2Jt1
fZ6eipZUkFytBbSXViCruBXXwbTF1VCZWUtyhUSKLWxt1hl4ACUW39iP8QWoOF2/
NfdaVdd1j+ZTXDNX74D5uBEGD/oDMnxENGOm4as005FC6WYwvYk7FO9F2mLzvcmp
BVWyOvOhxrE42h9EnSgQIbEQ94OdrN9KAQc0sFSwQUZm3YkgplSbxQUuSCnYR+iD
uOJxJTG5zcvq/Sk4V5wnUVRUewToVk8rC7rYMI1Lnqopuv9/cKcS5diQIRPcoPtU
hZFlGHSxZAFlRF4OioJoqvn7ZGJgYg==
=i1Z2
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--

