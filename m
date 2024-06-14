Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8E9090BA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 18:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740828.1147933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIA2p-0003lh-Az; Fri, 14 Jun 2024 16:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740828.1147933; Fri, 14 Jun 2024 16:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIA2p-0003jh-7K; Fri, 14 Jun 2024 16:44:55 +0000
Received: by outflank-mailman (input) for mailman id 740828;
 Fri, 14 Jun 2024 16:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tuT0=NQ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sIA2n-0003jb-Is
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 16:44:53 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69d62ad6-2a6d-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 18:44:49 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2350C1140107;
 Fri, 14 Jun 2024 12:44:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 14 Jun 2024 12:44:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 12:44:46 -0400 (EDT)
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
X-Inumbo-ID: 69d62ad6-2a6d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718383488;
	 x=1718469888; bh=O2BEZck2Ho0YRHHcW7T5XMJ8DmyJB8VHc7Ut7VyrFs4=; b=
	M3Ttco2IUQ0lHETGVV/LMduBzATwcGM+0A4DKR+gVmtXDd8vlQIVOm02P5DifIWJ
	eR+/AwuS3Db1fxFdJeCgdIb2Zrjyd4zUIc/rYEDgE7Qx7t+KLZZIat9LgRwx9YQJ
	/iRl0k2XfgGd39+VaiIIFpzwor81U4PRudAUWNlbFD4Rfq+3Oze2KaG6rlJCmzua
	cH0L3DJieftNhTbdwIl00C6vYxplcPxuUDcsNHAjExxSpCll8ZkfoyHrb1jYFTmj
	DrPXULiB6txSMqCPTBleyJT6hwXM3C9qasRkD3VYjKVlGMGav7slSyWTXak5AOGb
	VXANElysgg9H9SWJQ6s0Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718383488; x=1718469888; bh=O2BEZck2Ho0YRHHcW7T5XMJ8DmyJ
	B8VHc7Ut7VyrFs4=; b=RjyBcaUzGa510Y+gYlMmUuSGbVrcd/G/aLGs1DW5EtVA
	kB1AWMeaW4gX/Q34ueMSzNUdquhBJ6YyNvkdMXDJM1DT+1Kp6TgvPiOVLm3dzV3m
	CPSdVyre14GK818k3vEYwIOiu6NMO2u7HqnMsF9Y7ylw97Frm0fGY8ahBKRrQumy
	diD8wN8MnDdtfkQanr9p136sI3V5ZImn1y7N+c6fq2NAvgONgt4oOoZVZPYOGM44
	9Tq5DBEOQP7I28DJ+gTINaq/piwpqwl5oVvvM3f2G/S0PGPYt2u4DsZT1ed3ETfU
	qDfUHOfFPc1cpBDNgz6zhJpJ6We7nD6O1ddhNAznQg==
X-ME-Sender: <xms:f3NsZoq3CqOY4BULHgydhgb8MR7nQ3gqV0xQ4GbyPmWYtE0xgqUg7A>
    <xme:f3NsZuo9pDMAA6krABrgWgLmBL2eT7-XIkOXjos8FhV8CzGP4dvcL9IyB7VvYpnli
    lKYENybq61VGpQ>
X-ME-Received: <xmr:f3NsZtPwpoNbYh1herJ0fjlvj1ua9oE5H2-BMZJIXNSmT6lVq0mR1PsY8cPG_9ndo2USGmwt_I2LFGw6XEEw8r2hStOatbA4HcX9TB_UkvNG11IS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:f3NsZv6H2UvWmK2Cvt7b2EiMiwXrbnr6NmSlRsrlbF8X-UWU-47qdQ>
    <xmx:f3NsZn7fOJpYSd69AtS9upXguXDQ_3j4fF0U6lbrH56y9X4fKRGP4Q>
    <xmx:f3NsZvj4EJBUK_dewf69S8UXc0sg69mz4M7bEaL53-09NFJi2lvzng>
    <xmx:f3NsZh5jJp7GqcDvpw7GIEYkYAeOkyQE2B2DFB6OhJv1eVWMPhbJNw>
    <xmx:gHNsZksTHRE7hWLrCUCAg-N-hElsPgZWd4qZP-7KO-gmnAD5OKnbcjNl>
Feedback-ID: iac594737:Fastmail
Date: Fri, 14 Jun 2024 12:44:42 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <Zmxze4a0PZbwcLSb@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yMmMNAtPZdFRNM6Y"
Content-Disposition: inline
In-Reply-To: <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>


--yMmMNAtPZdFRNM6Y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jun 2024 12:44:42 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
> On 14.06.2024 09:21, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> >> On 13.06.2024 20:43, Demi Marie Obenour wrote:
> >>> GPU acceleration requires that pageable host memory be able to be map=
ped
> >>> into a guest.
> >>
> >> I'm sure it was explained in the session, which sadly I couldn't atten=
d.
> >> I've been asking Ray and Xenia the same before, but I'm afraid it still
> >> hasn't become clear to me why this is a _requirement_. After all that's
> >> against what we're doing elsewhere (i.e. so far it has always been
> >> guest memory that's mapped in the host). I can appreciate that it might
> >> be more difficult to implement, but avoiding to violate this fundament=
al
> >> (kind of) rule might be worth the price (and would avoid other
> >> complexities, of which there may be lurking more than what you enumera=
te
> >> below).
> >=20
> > My limited understanding (please someone correct me if wrong) is that
> > the GPU buffer (or context I think it's also called?) is always
> > allocated from dom0 (the owner of the GPU).  The underling memory
> > addresses of such buffer needs to be mapped into the guest.  The
> > buffer backing memory might be GPU MMIO from the device BAR(s) or
> > system RAM, and such buffer can be paged by the dom0 kernel at any
> > time (iow: changing the backing memory from MMIO to RAM or vice
> > versa).  Also, the buffer must be contiguous in physical address
> > space.
>=20
> This last one in particular would of course be a severe restriction.
> Yet: There's an IOMMU involved, isn't there?

On x86 there is.  On Arm there might or might not be.  There are
non-embedded systems (such as Apple silicon) where the GPU is not behind
an IOMMU, for performance reasons IIUC.

> > I'm not sure it's possible to ensure that when using system RAM such
> > memory comes from the guest rather than the host, as it would likely
> > require some very intrusive hooks into the kernel logic, and
> > negotiation with the guest to allocate the requested amount of
> > memory and hand it over to dom0.  If the maximum size of the buffer is
> > known in advance maybe dom0 can negotiate with the guest to allocate
> > such a region and grant it access to dom0 at driver attachment time.
>=20
> Besides the thought of transiently converting RAM to kind-of-MMIO, this
> makes me think of another possible option: Could Dom0 transfer ownership
> of the RAM that wants mapping in the guest (remotely resembling
> grant-transfer)? Would require the guest to have ballooned down enough
> first, of course. (In both cases it would certainly need working out how
> the conversion / transfer back could be made work safely and reasonably
> cleanly.)
>=20
> Jan

The kernel driver needs to be able to reclaim the memory at any time.
My understanding is that this is used to migrate memory between VRAM and
system RAM.  It might also be used for other purposes.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--yMmMNAtPZdFRNM6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZsc3sACgkQsoi1X/+c
IsFmlA//aHkzdFRW8EExFchfLYhsYOwY9lIAWxNiDNuNfup2CCsdQjKsY/+9mILv
PXpUxrhOqYNzTYiV7Rl8CWXIS9VM7BzzmU7qDuZ75cG5AyGGkX/jW2450QIhnsYn
oOuuBJApysERb5WVRxpQNrsEqPje1VBE/pnC5bZon1tWitN4CsihAtmkB/xZ+o42
GEr9QPWbA6U2bgr7vDcy2LZ510wGZ6NZsSHpAl4nwby1wrCL1uP7E4QhuRcKju/4
ovD/LkCzysCmD4T4kWjS11AtUI69vEzEpN2H0EtKQzxNprY3wkLQwtruks0bFCr1
eN9feAYllXF0nGzjlbxqRiaCUyuWiJXD82gjBKqWKs/4r78IfJ/cYzgYYsW+K8uC
nNoJTmKzU24/bw0DsoQdIPcWTYDs99kA0yjKgpzh3OHPZh9rzc5DR/PRC4UHs0ag
/zD4H4iEIPCA5o3fYHbHmspTHbv2cJBRuV8zkDYsnHFDwrMduaA0goRZqADlSUe+
GbUT/nkWnUvRbMFLG7ScA8UcDNDxnM6rffQWK4hE4Cnce89CKKJv1312qvW63u7T
0+AF8d2bWtHcDl+oQUVLTYBVqyY3Se52/c56wm5rS7L+svCElXX+QVFingfaY7h1
GoyNTZOGY47DJaAcuajsiIHKRBL6F8QAveRI4ouFMjthUPVOR6Q=
=WkhK
-----END PGP SIGNATURE-----

--yMmMNAtPZdFRNM6Y--

