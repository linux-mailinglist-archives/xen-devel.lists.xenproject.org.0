Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA69726559
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 18:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544892.850988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vaU-0005Dr-QT; Wed, 07 Jun 2023 16:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544892.850988; Wed, 07 Jun 2023 16:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6vaU-0005BQ-NL; Wed, 07 Jun 2023 16:00:42 +0000
Received: by outflank-mailman (input) for mailman id 544892;
 Wed, 07 Jun 2023 16:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ooln=B3=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q6vaT-0005BK-Ep
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 16:00:41 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 712d2f46-054c-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 18:00:38 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 869505C0135;
 Wed,  7 Jun 2023 12:00:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Jun 2023 12:00:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jun 2023 12:00:35 -0400 (EDT)
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
X-Inumbo-ID: 712d2f46-054c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1686153636; x=1686240036; bh=5028jVPHP9PdFYdLuVCSXCH9vrAc5KtFszG
	WksMpGUc=; b=C1cAy4eG464IqwFzu5xeP8gAE0QO3dLhTabsmagrE6+5R6TBxmH
	pvqIWi2MhW7XF++PVFirKmt/IhrFVF9S4TlHsMzlUbCfYF9odjPncT8XMrzJosos
	kPB0xE/usXX0McDFIiZUqyZ7fKbpxkvofxzL4XBtKGAO9fYDVczXLbBHhy4LuCjk
	EuRo9k9bs1b4Q/LufMkRTlvH6+agpSy+sBSlG1Oqxhaf17gJR8Xy87qMkxpecZSD
	BXSK2SDOOZmSi0H/BVWOX4TlJaywLxpCysr+/V8LCGmaJ3INEaYiGf5k6z8uhUDC
	cSkvagZov6MfRIgGYo+ic5Pv5TdHMImHh5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686153636; x=1686240036; bh=5028jVPHP9PdF
	YdLuVCSXCH9vrAc5KtFszGWksMpGUc=; b=vHwfFTGT/5ssYIxdP7wETLuuxk6eC
	ARgxzVUapDh+HCKJJ8iHh24XSq02KTaPS6M0Wt9XlqjMnO59fEC0q+Myz3byIQ+r
	4eH+at1xsN5LoszpsLl4kMETWuXanw/kSXECpBBmoe2fFdFqqDccXU4Qc/ulqjxr
	/UfuPuhs66RaE8mbOYgAkPq17kIAw2UbmlfFlJvqptPtot5Vk6cELU1U8T2iU/m2
	WzMqVGJgdxCYjhiK6Ug/dB1dJelA/OiMIF6wxslWBXtkTvyRNfLF+FCZH9yVY1FV
	Bpi/5dcOovMKPvtCy+Bs8MqZGv3pamgiWbyisiytKLVkgKCK3rZmDumgA==
X-ME-Sender: <xms:pKmAZMcLo39yitTMll5iVSvRCR-Rm-1emH2Huav95zhyje1KSxLKdw>
    <xme:pKmAZOPpaor5cBwX_YamCJT8uKI-s1RLSzDOEjHM6d1JyArTRoMo5T7XGE75s3gJx
    44oGcV5aGdAnhw>
X-ME-Received: <xmr:pKmAZNjfS2yjK4_WlTYeTsUp4nXQvd630j7pQiXvaBpB4BuYGAzSDyV4sbY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtgedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
    jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:pKmAZB_LbTcOUN9Y4UmEdCnb2EQpvfLp4_AGO3a7d4msJWJpEID-IQ>
    <xmx:pKmAZIsaFZ01jW2Ims43CaghesuX8msDbywk_MLelotLBjIOwieWzA>
    <xmx:pKmAZIHL31ojvjJN_FhQoqB9f7_5Pz-fhuiysZ51yGGlty5x4YBDkg>
    <xmx:pKmAZKLHp2_Xb59rXMoTDV9vfJTPByJH8LEmMZvSAUf4sDbrJxueIA>
Feedback-ID: iac594737:Fastmail
Date: Wed, 7 Jun 2023 12:00:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xen-blkback: Implement diskseq checks
Message-ID: <ZICpodHAGv8qRw5A@itl-email>
References: <20230601214823.1701-1-demi@invisiblethingslab.com>
 <20230601214823.1701-2-demi@invisiblethingslab.com>
 <ZIA1VkDdgt5kmqEt@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CTS34Y4jd0AZd9RG"
Content-Disposition: inline
In-Reply-To: <ZIA1VkDdgt5kmqEt@infradead.org>


--CTS34Y4jd0AZd9RG
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 7 Jun 2023 12:00:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xen-blkback: Implement diskseq checks

On Wed, Jun 07, 2023 at 12:44:22AM -0700, Christoph Hellwig wrote:
> On Thu, Jun 01, 2023 at 05:48:22PM -0400, Demi Marie Obenour wrote:
> > +	if (diskseq) {
> > +		struct gendisk *disk =3D bdev->bd_disk;
> > +
> > +		if (unlikely(disk =3D=3D NULL)) {
> > +			pr_err("%s: device %08x has no gendisk\n",
> > +			       __func__, vbd->pdevice);
> > +			xen_vbd_free(vbd);
> > +			return -EFAULT;
> > +		}
>=20
> bdev->bd_disk is never NULL.

Fixed in v3.

> > +	diskseq_str =3D xenbus_read(XBT_NIL, dev->nodename, "diskseq", &disks=
eq_len);
>=20
> Please avoid the overly long line.

Fixed in v3.

> > +	if (IS_ERR(diskseq_str)) {
> > +		int err =3D PTR_ERR(diskseq_str);
> > +		diskseq_str =3D NULL;
> > +
> > +		/*
> > +		 * If this does not exist, it means legacy userspace that does not
>=20
> .. even more so in comments.

Fixed in v3.

> > +		 * support diskseq.
> > +		 */
> > +		if (unlikely(!XENBUS_EXIST_ERR(err))) {
> > +			xenbus_dev_fatal(dev, err, "reading diskseq");
> > +			return;
> > +		}
> > +		diskseq =3D 0;
> > +	} else if (diskseq_len <=3D 0) {
> > +		xenbus_dev_fatal(dev, -EFAULT, "diskseq must not be empty");
> > +		goto fail;
> > +	} else if (diskseq_len > 16) {
>=20
> No need for a else after a return.

Fixed in v3.

> > +		xenbus_dev_fatal(dev, -ERANGE, "diskseq too long: got %d but limit i=
s 16",
> > +				 diskseq_len);
> > +		goto fail;
> > +	} else if (diskseq_str[0] =3D=3D '0') {
> > +		xenbus_dev_fatal(dev, -ERANGE, "diskseq must not start with '0'");
> > +		goto fail;
> > +	} else {
> > +		char *diskseq_end;
> > +		diskseq =3D simple_strtoull(diskseq_str, &diskseq_end, 16);
> > +		if (diskseq_end !=3D diskseq_str + diskseq_len) {
> > +			xenbus_dev_fatal(dev, -EINVAL, "invalid diskseq");
> > +			goto fail;
> > +		}
> > +		kfree(diskseq_str);
> > +		diskseq_str =3D NULL;
> > +	}
>=20
> And I suspect the code will be a lot easier to follow if you move
> the diskseq validation into a separate helper.

Fixed in v3.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--CTS34Y4jd0AZd9RG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmSAqaEACgkQsoi1X/+c
IsH5yhAAnK+FHobE4EaJLu/MXl1mYHrYhpZKqUOIopKg1xODd1RlWyQI95qq3vHX
AnwOhHN+Wv/PbJ0vhvL+/DtuC56AIaCxzhShuZmqZjvLDPwdvi73nSf4xiV7SLWG
6GfMhn9Mo8MGoj+ek88P10z9bIwrfdCWnvnuns6bcGlHsMkrx/B3Jzk5ZOD1QWWj
W6jzKRmUDCv+RKHcajLUB3iM2JTTYOLcljqldvSyRv1SySytToLRtTWfZrOJS7Z2
Tjf9heSRPhvHPvcaHyidiaZ87xQjcmI4LRzOXEybxFd6uxIf4QpDD4rschFu25NL
TTEFPRIocqwHQgyVcG8aIu86nizNf7f/O/iLfQhNTuYQ1mbq6l8QNyAcJ6sXMz0A
fms3iMGiH2LF/pi8vEprOfiC1+0L+whpAqEEogIWh4zYp/tM0raENGZNJL6ZTwXI
BPkVkAmsrZAQljrzecbtjRWPZJUDmi+u9XGFCjY9MX7oHtnRH22hLdVeYqd1NljD
bgleEMTPiV/ZhPhOPi/Fyccze9VneSOjQ7QoKii0JaiECzatJFr3ZoIgwpIJsv17
KSglgXTjzQpGPURe+RK+rQWMAlb6V2gT3mNC36txOv8j+Y6CuL3xfwGIdfP5nLh+
qTO2n1i40TxJ0VEZa9kD67tyqrLuOS7kru2hQbdhvW9f92eOPo4=
=m1I6
-----END PGP SIGNATURE-----

--CTS34Y4jd0AZd9RG--

