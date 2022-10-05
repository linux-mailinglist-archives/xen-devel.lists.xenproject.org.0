Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C65F554C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 15:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416201.660849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4PP-0002rk-N2; Wed, 05 Oct 2022 13:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416201.660849; Wed, 05 Oct 2022 13:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og4PP-0002pJ-Js; Wed, 05 Oct 2022 13:25:59 +0000
Received: by outflank-mailman (input) for mailman id 416201;
 Wed, 05 Oct 2022 13:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xhym=2G=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1og4PN-0002mG-Th
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 13:25:57 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d60c191-44b1-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 15:25:56 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3A19032007CF;
 Wed,  5 Oct 2022 09:25:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 05 Oct 2022 09:25:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 09:25:51 -0400 (EDT)
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
X-Inumbo-ID: 3d60c191-44b1-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664976352; x=
	1665062752; bh=fkD7L0kZuKdkAcCLODdB9q5NBC/87MZVa88KNbOhNTM=; b=V
	iZ0QH8BKhaAz33EqIZq+/q6UFVzWi3j9MgJ0uevkEhvs3Om1WePNaFyDaR4qNR91
	TvkGij9Mi28vg8Cd92qtZKgxhNJrECUEoAGuSWigK59ile99mgOlL62VXZtefcED
	VZfhNie563hhG8e052ZMiFm7KHPQR0/bwdhZaehZepzStUiIgUz+4Ze95QJ81YvK
	0EnFLq27TKTfTySKBnyxs7wCwXzX2BkCbKW7crdaNTR4FVAcEcda+0M/n9azmP5Q
	MrXeCAbtxydqD99s0JUnBYRBu0oeu5IgpHPMRszzesaVb0Y4NpWd9sRzGYsDnh/E
	7n4dzjnnCPxC466dyfUmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664976352; x=1665062752; bh=fkD7L0kZuKdkAcCLODdB9q5NBC/8
	7MZVa88KNbOhNTM=; b=igvNpLelUKWwXm1cd+Sy+fq4UqAsUcCUDSnzRqXP9LyN
	2RRo0OtxHDG7gYzcpiv9Nwf3IMXCkmRqP3rWzsYTvpEF+flAb/kn9RBskTe2eZIg
	mTihOb8+oVkD25yhVsQfIF7D/Ch/+vWabp4XGM7/tlB4iSup3q+X2OCGzn+v8Oc4
	lYQpUSxRAxa3lOEu+1nZJiiwTLK98vUR+lnuH94r8rM/7XHjWHgPjSIqziHcHfay
	ZaWVMTEYmSA5SuynXs7caUFpUhha3HE4RZ36yoJVCn01Pt04P4dCVnzg58hZyhO0
	cV8cCL2klQZXtSX7SbTMIURCFWO42V5XVnGiSv5ciA==
X-ME-Sender: <xms:4IU9Y4ZdOB-JLKzCkbLx7i5SE8O_PShtgTv6O3kXn0qD7ja170ezmg>
    <xme:4IU9YzZShKK6LePaK3y7xm3Soua0N-hZ9fDPt-Aw1v1r2P_EIJjoKIYatW1bcv0OZ
    KBbleTc1lnP6g>
X-ME-Received: <xmr:4IU9Yy_dW6kybO-HOUFz5GCzLZ-c4-mS393mZ3t8TgMIWSvl-osPExu1spKzRZaoYOBmMEtpLr21SjNsbCRTfPsrIjifSa88h8o1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeifedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:4IU9YyrTDJOF-C9mH3JghfyaE-vKqIzEdDMnydKZfXxk7gjA_AQntQ>
    <xmx:4IU9YzppKXVTC8qkuCKT9pKUMEBeFyPgyPyo7HIKYO1nUNFfxg2GjA>
    <xmx:4IU9YwSGiuWv_4gVNdJmt98zH_uv0L36Ku2Pvkgjc0tOWeEADsmJFw>
    <xmx:4IU9Y9FVsP2WnnS7M1RJ5mdBQPdHkTY7lnMDcgBiqCPCWGdq6nKrEA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 5 Oct 2022 15:25:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt
Message-ID: <Yz2Fvp9Q9aeYKnDY@mail-itl>
References: <Yz17cLIb1V0zjEjK@mail-itl>
 <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TTSDjBJgOWtr2mfJ"
Content-Disposition: inline
In-Reply-To: <4bd95b8b-dbdb-b5ce-fe18-ce6bbcf715fe@suse.com>


--TTSDjBJgOWtr2mfJ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Oct 2022 15:25:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: CONFIG_XEN_VIRTIO{_FORCE_GRANT} interferes with nested virt

On Wed, Oct 05, 2022 at 02:57:01PM +0200, Juergen Gross wrote:
> On 05.10.22 14:41, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > When booting Xen with Linux dom0 nested under KVM,
> > CONFIG_XEN_VIRTIO_FORCE_GRANT=3Dy makes it unable to use virtio devices
> > provided by L0 hypervisor (KVM with qemu). With PV dom0, grants are
> > required for virtio even if just CONFIG_XEN_VIRTIO is enabled.
> >=20
> > This is probably uncommon corner case, but one that has bitten me in my
> > CI setup... I think Xen should set smarter
> > virtio_require_restricted_mem_acc(), that enforces it only for devices
> > really provided by another Xen VM (not by the "outer host"), but I'm not
> > sure how that could be done. Any ideas?
> >=20
>=20
> It should be possible to add a boot parameter for that purpose. Using it
> would open a security hole, though (basically like all PCI passthrough to
> PV guests).

What about excluding just dom0? At least currently, there is no way for
dom0 to see virtio devices provided by another Xen domU.

Something like this:
---8<---
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 9b1a58dda935..6ac32b0b3720 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -111,7 +111,7 @@ static DEFINE_PER_CPU(struct tls_descs, shadow_tls_desc=
);
 static void __init xen_pv_init_platform(void)
 {
        /* PV guests can't operate virtio devices without grants. */
-       if (IS_ENABLED(CONFIG_XEN_VIRTIO))
+       if (IS_ENABLED(CONFIG_XEN_VIRTIO) && !xen_initial_domain())
                virtio_set_mem_acc_cb(virtio_require_restricted_mem_acc);
=20
        populate_extra_pte(fix_to_virt(FIX_PARAVIRT_BOOTMAP));
---8<---

This BTW raises also a question what will happen on Xen nested inside
Xen, when L0 will provide virtio devices to L1. Grants set by L1 dom0
wouldn't work on L0, no? Or maybe this is solved already for pv-shim
case?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TTSDjBJgOWtr2mfJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM9hd0ACgkQ24/THMrX
1ywtRAf/SkYFs/nkrcu+PPDYVvlIqfH8L+wgGk5jehvMVHkMAPE+N02o0/xRiPwD
cy/+w+fFg/P2CF86KM5VUHFd/RIIxaasiQgh9JW8N438uKxgo2xnG3hQFeZHFnE6
rV3ezEaDldCktEVFHQ5v64N5anfSsRjxnicDHBJdFgnYIt1JwQqERIF3GPZbp8tX
vYEMSawShjtoluCwKSUyf9la7u4Ec6WA8yNlmuLGIuoJ9hKkqIQ9brbDwE8/dyoB
OgI60255Zkut0xR3tcv16DwIxGLAxjLoHavQt9UvWQ3da3qv88+FLB/RT82pxT96
i9BnKvpFedCqaGwbJ7E8dYs4xHaxZw==
=WiQN
-----END PGP SIGNATURE-----

--TTSDjBJgOWtr2mfJ--

