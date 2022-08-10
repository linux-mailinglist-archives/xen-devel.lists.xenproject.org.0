Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA558F494
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 00:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384067.619332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLucI-0003Jx-P0; Wed, 10 Aug 2022 22:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384067.619332; Wed, 10 Aug 2022 22:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLucI-0003H4-Lc; Wed, 10 Aug 2022 22:55:58 +0000
Received: by outflank-mailman (input) for mailman id 384067;
 Wed, 10 Aug 2022 22:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRKX=YO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oLucG-0003Gy-QN
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 22:55:57 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95824d6c-18ff-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 00:55:54 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2B80D32008FF;
 Wed, 10 Aug 2022 18:55:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 10 Aug 2022 18:55:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 18:55:47 -0400 (EDT)
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
X-Inumbo-ID: 95824d6c-18ff-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1660172149; x=
	1660258549; bh=RQV2F3vE9R1Q1AdTMLF5Q5GKEB6poBfySN9JiFXTRLQ=; b=X
	yvbGU3Nh6ZQyy8sQPo5cl4nWqf9r/F/+21YNzSuQuLstCqlJXE0F+CK+3dHEPIp5
	c1lgJ1UUjW4VRv8QBDaUHQlTTxJSgLqPuNHhas65wX0eDkinUo0h3RPXhQGMWPpl
	gU3GQ9n1qj6iHNOXgh6Uz74MhV+FoXwjhOJZpDMO02DHCeTALFvE9UcYIsr9X/96
	SgbH3uInqPS6WRB3y/3XQUrR3kXcoXNugsSfr4OqsCE01nwO2VcESqaEUimxhfEC
	yHIw7L52AdxHhEyw6l/KM55t3FR9NvB83cmuZtWFk3LLVXQd9b1mMqkpNA5h5jF6
	6yHZedsq2PhN6QfjO21GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660172149; x=1660258549; bh=RQV2F3vE9R1Q1AdTMLF5Q5GKEB6p
	oBfySN9JiFXTRLQ=; b=Uf7XxOQweTcwx8lhWxGkW8j5mG2UQN3/84kvPAM3BrZg
	miU4yMIry4v5ICeS8pPhAJSigFlmJvwReNN326ZfCtqF6zga/6c9cIVpoHXt1gpu
	K0JpSKq59rtzCw3V9JyP4/4dUU+MGw50H5uZRxIAPooQbMxEVGaCwoEdnr4v8fMS
	MnaMWJuMKB2BOeIMtzZFft1BwgJGkpSuLlsewohJqaluYJZYITzwx7YzP56p1vEA
	5GVdcUFEGVkxuhDPE8igZ778iXKZqd7XBcKMz0R22wv1KB7REG8tAZVK616bcPQW
	dV6YANmwV90pnIlNlHzuLcfDYeTT7EsK5XmIY1cxUA==
X-ME-Sender: <xms:dTf0Yt9084FlQ0e6PxiZbqFvx5ct8yQyhpNeHcUbNbJr0yYE_8rgkA>
    <xme:dTf0Yhs5M3d8ao1UAWRDXrcsLCKhdWPKA34oBdFAJ7WwZqculArBLgAnZuqL-ruac
    JqTRCYoHdpqvw>
X-ME-Received: <xmr:dTf0YrDqYcxdihvxVQqTEHdfsFteT3Bxa15OJAG4lPLUTkmagVp0mxjLpaypLPFhk9SRLkfewBaZmwRkA_J4Hvd7O7GkrKHdUmEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkedv
    gfevtdfhfedtgeeuveeugefhteetlefhheeuvedvhefggedufffgvddvheetnecuffhomh
    grihhnpehouhhtlhhoohhkrdgtohhmpdgsohhothhlihhnrdgtohhmpdhkvghrnhgvlhdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:dTf0Yhd5rj27n5Q37WqDQttwyYuSjr6FO0GN5v69QedfAFa9fARxHQ>
    <xmx:dTf0YiP9i9N7T62cX2jHwU73DdxrLwuDKukHcyCBOccl6Tdi8eBUQw>
    <xmx:dTf0YjnWMg_FWc98tLYFWxxNIZwfy8HwvjIUItGK-x8RFkPWAWLM5Q>
    <xmx:dTf0YjjfIDg8ZAeo1LhvHMi_ooIUEGg5XtuITyBc0gT4uf3AgjlFrQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 11 Aug 2022 00:55:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
	"Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
	"Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Subject: Re: Reg. Tee init fail...
Message-ID: <YvQ3cEFxWFi7fXjX@mail-itl>
References: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com>
 <7689497b-1977-b30a-5835-587fa266c721@xen.org>
 <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
 <DM4PR12MB520060A696B62EFBA3E5E96680BA9@DM4PR12MB5200.namprd12.prod.outlook.com>
 <60bf0e8a-1b58-4df4-fdcf-bcfeedd64e77@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+QD6F8owS8JgvRRZ"
Content-Disposition: inline
In-Reply-To: <60bf0e8a-1b58-4df4-fdcf-bcfeedd64e77@suse.com>


--+QD6F8owS8JgvRRZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Aug 2022 00:55:44 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
	"Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
	"Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Subject: Re: Reg. Tee init fail...

On Thu, Jun 30, 2022 at 07:31:38AM +0200, Juergen Gross wrote:
> On 30.06.22 05:32, SK, SivaSangeetha (Siva Sangeetha) wrote:
> > [AMD Official Use Only - General]
> >=20
> > +team
> >=20
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: Thursday, June 30, 2022 1:34 AM
> > To: Julien Grall <julien@xen.org>
> > Cc: SK, SivaSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; xen-=
devel@lists.xenproject.org; Stefano Stabellini <sstabellini@kernel.org>; Be=
rtrand Marquis <bertrand.marquis@arm.com>; Volodymyr Babchuk <Volodymyr_Bab=
chuk@epam.com>; jgross@suse.com; boris.ostrovsky@oracle.com
> > Subject: Re: Reg. Tee init fail...
> >=20
> > Adding Juergen and Boris because this is a Linux/x86 issue.
> >=20
> >=20
> > As you can see from this Linux driver:
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Feli=
xir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fcrypto%2Fccp%2Ftee-de=
v.c%23L132&amp;data=3D05%7C01%7CSivaSangeetha.SK%40amd.com%7Ce962a907794f49=
17a80b08da5a0a7b3b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63792129831=
5828104%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DNxmMUckiDRGLv3qLJrhZKBt=
2zNTuomEZqYJdV74tXxA%3D&amp;reserved=3D0
> >=20
> > Linux as dom0 on x86 is trying to communicate with firmware (TEE). Linu=
x is calling __pa to pass a physical address to firmware. However, __pa ret=
urns a "fake" address not an mfn. I imagine that a quick workaround would b=
e to call "virt_to_machine" instead of "__pa" in tee-dev.c.
> >=20
> > Normally, if this was a device, the "right fix" would be to use swiotlb=
-xen:xen_swiotlb_map_page to get back a real physical address.
> >=20
> > However, xen_swiotlb_map_page is meant to be used as part of the dma_op=
s API and takes a struct device *dev as input parameter. Maybe xen_swiotlb_=
map_page can be used for tee-dev as well?
> >=20
> >=20
> > Basically tee-dev would need to call dma_map_page before passing addres=
ses to firmware, and dma_unmap_page when it is done. E.g.:
> >=20
> >=20
> >    cmd_buffer =3D dma_map_page(dev, virt_to_page(cmd),
> >                              cmd & ~PAGE_MASK,
> >                              ring_size,
> >                              DMA_TO_DEVICE);
> >=20
> >=20
> > Juergen, Boris,
> > what do you think?
>=20
> Yes, I think using the DMA interface is the correct way to handle that.
>=20
> BTW, I did a similar fix for the dcdbas driver recently:
>=20
> https://lore.kernel.org/r/20220318150950.16843-1-jgross@suse.com

I hit similar issue, and the patch below made it work for me (ugly
workaround), or at least stop complaining.

But note one of those places have this comment:

	/* We need actual physical address instead of DMA address, since
	 * Trusted OS running on AMD Secure Processor will map this region
	 */

I guess it means AMD Secure Processor bypasses IOMMU...

---8<---
diff --git a/drivers/crypto/ccp/tee-dev.c b/drivers/crypto/ccp/tee-dev.c
index 5c9d47f3be37..9d440fc8a56d 100644
--- a/drivers/crypto/ccp/tee-dev.c
+++ b/drivers/crypto/ccp/tee-dev.c
@@ -15,6 +15,7 @@
 #include <linux/gfp.h>
 #include <linux/psp-sev.h>
 #include <linux/psp-tee.h>
+#include <xen/page.h>
=20
 #include "psp-dev.h"
 #include "tee-dev.h"
@@ -39,7 +40,7 @@ static int tee_alloc_ring(struct psp_tee_device *tee, int=
 ring_size)
 	memset(start_addr, 0x0, ring_size);
 	rb_mgr->ring_start =3D start_addr;
 	rb_mgr->ring_size =3D ring_size;
-	rb_mgr->ring_pa =3D __psp_pa(start_addr);
+	rb_mgr->ring_pa =3D virt_to_machine(start_addr).maddr;
 	mutex_init(&rb_mgr->mutex);
=20
 	return 0;
@@ -129,7 +130,7 @@ static int tee_init_ring(struct psp_tee_device *tee)
 		return -ENOMEM;
 	}
=20
-	cmd_buffer =3D __psp_pa((void *)cmd);
+	cmd_buffer =3D virt_to_machine((void *)cmd).maddr;
=20
 	/* Send command buffer details to Trusted OS by writing to
 	 * CPU-PSP message registers




--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+QD6F8owS8JgvRRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmL0N3AACgkQ24/THMrX
1yyn2wf/W2IUPQ80S/Xw77RiNzuGT+iG1gAJDklZgO+WM4/fhnKKm/W1H/5CLMoT
WvTfzrfUO6esjnwSV6zq+UhAGMSRpu9Tg56i5+COv9RKRxgDFW8TVhNC00AFrPc2
GKmSF3a6ijZlgIHUm9pNdxs2t/LPM/JE9SK+8YdSUZ22EEEfEIiOdimVYJfQBBAi
ZiAL1d1e3KTivXDpYLCpBQIILpvYJn4fCUA8OOfNk70smuIQ1sBZIih6zmQQlfFP
I43eHZ2/OktRVWUx+SiyaJXjmjkC4D9/0YNDiIV+HuD5wxChqLc8vvIwNfIuGZbv
hkq0uPd2RmQ4CZAv2syVdqNk3uejJA==
=3+ID
-----END PGP SIGNATURE-----

--+QD6F8owS8JgvRRZ--

