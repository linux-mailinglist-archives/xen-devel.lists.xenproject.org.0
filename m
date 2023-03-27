Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF96CA28C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:35:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515232.797907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgl7T-0002LA-St; Mon, 27 Mar 2023 11:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515232.797907; Mon, 27 Mar 2023 11:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgl7T-0002IK-Pc; Mon, 27 Mar 2023 11:34:35 +0000
Received: by outflank-mailman (input) for mailman id 515232;
 Mon, 27 Mar 2023 11:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSZI=7T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pgl7S-0002IE-0M
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 11:34:34 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 555000d2-cc93-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 13:34:31 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C7A0F5C009E;
 Mon, 27 Mar 2023 07:34:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 27 Mar 2023 07:34:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 07:34:26 -0400 (EDT)
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
X-Inumbo-ID: 555000d2-cc93-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679916867; x=1680003267; bh=mk7NA+PQSoE7BwnVKJsqKHAv9sBNy26hfcF
	9UMVzHO0=; b=gCUROkYHAMzJvPna56/JpL6n5NETiXxIFdtPQZzaQtxcZ9F6f2f
	Mg93q95dSWnLJUluLHl2dEvrT/m9hDdS8cYxO6wcxE/+0V9eg5sDy5CJSQ80kfJ0
	kQyuqX4zNBwnG41ier+KKlKggtDI9UKnUf6rAYZCyukgBIn862WiKuC0F7U9G640
	Kvl51J/P/VcPfFtJvC8+zEBMv3VgJNzbvJcyQqbbHHTkWrTUP97FyD0AG/ZsR8C1
	j9KhlyQ2Fjfaf7xWAzpy+/iGnTzQB4m4oejfk8Bq/aEf8Lv7arTnvKc1glEt3zwM
	9kF5jD9BiCWorozbSNanv66VG0RRUexGvSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679916867; x=1680003267; bh=mk7NA+PQSoE7B
	wnVKJsqKHAv9sBNy26hfcF9UMVzHO0=; b=eW61jRZ1dYpixzkJSFLxASztGuNM6
	o7TqpX/Es+Fo+SMWQajumN85VsRlXSjDFTGW9iHZDnBr66k29AXml0QHOfjfe1UL
	aPp4IuICDXopf0X3mxZOKzTF/ZHTncsV43fTiUcVilDCAyGHGWR/sv2/bN8Pxlza
	YDLIGjipXgufn1HJ7nT/2C5AsH6Y7XZdr7cl7COdkmrHHL3Chlww7Y1S3lGT6f2T
	agawBttCI4VfBDJyDfkWNVQ9q4Es5knDm18wTsneibS6pUJYBw5wBQ41KzdVaWt/
	EG1vayaYdHDNb7gJrRUUXOUSZuPopi8pcv+L4Q3lX/L3qQOIFaOOe0z0g==
X-ME-Sender: <xms:Q38hZM2aVa0-nx8hujIg_TcBTDZB8carAzgKdONFy4w6cKyrQalE4Q>
    <xme:Q38hZHEzeXlDlppFo-wLY6NSppmFiCuu6GloGJz9eLfSr39zMFXXnIiVe6K6JuggQ
    TDh0uwe8y4hrw>
X-ME-Received: <xmr:Q38hZE7FXv7JRYEBTMdDmxAeH0MIz3Qet09EkocLJeYs9Actgmoe1km-9sP_fh8lIVIVeJJwKk-61x9mAmWYbMW219QlYUanOus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Q38hZF2CaUAwkxHrULO64ba35H3XWgR9AR7idVVRVEmr-Za71_K_lg>
    <xmx:Q38hZPHTC0hSaVHg1RPiWcR_3qm09YvRHhwfc3_UnT0rEU9rBKJqHQ>
    <xmx:Q38hZO9fhi4rJC9XIT-o1XsL3Ml5W4r8zWsjpA_zoGOXjDD4omXb9A>
    <xmx:Q38hZHA0G6mwn8BkVZDOgXay55EFj12YeHHT42BWI1RqpbM9HHJYnA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 27 Mar 2023 13:34:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCF/P22HaeZs4+To@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <ZCFsDbKfGvn7giN+@Air-de-Roger>
 <ZCFvPTpOixe582JU@mail-itl>
 <ZCF1HX6Dp7mrm65l@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h0yfVA2p3aHd7WRo"
Content-Disposition: inline
In-Reply-To: <ZCF1HX6Dp7mrm65l@Air-de-Roger>


--h0yfVA2p3aHd7WRo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Mar 2023 13:34:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model

On Mon, Mar 27, 2023 at 12:51:09PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 27, 2023 at 12:26:05PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Mar 27, 2023 at 12:12:29PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > QEMU needs to know whether clearing maskbit of a vector is really
> > > > clearing, or was already cleared before. Currently Xen sends only
> > > > clearing that bit to the device model, but not setting it, so QEMU
> > > > cannot detect it. Because of that, QEMU is working this around by
> > > > checking via /dev/mem, but that isn't the proper approach.
> > > >=20
> > > > Give all necessary information to QEMU by passing all ctrl writes,
> > > > including masking a vector. This does include forwarding also writes
> > > > that did not change the value, but as tested on both Linux (6.1.12)=
 and
> > > > Windows (10 pro), they don't do excessive writes of unchanged values
> > > > (Windows seems to clear maskbit in some cases twice, but not more).
> > >=20
> > > Since we passthrough all the accesses to the device model, is the
> > > handling in Xen still required?  It might be worth to also expose any
> > > interfaces needed to the device model so all the functionality done by
> > > the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
> > > passing the accesses anyway.
> >=20
> > This was discussed on v1 already. Such QEMU would need to be able to do
> > the actual write. If it's running in stubdomain, it would hit the exact
> > issue again (page mapped R/O to it). In fact, that might be an issue for
> > dom0 too (I haven't checked).
>=20
> Oh, sorry, likely missed that discussion, as I don't recall this.
>=20
> Maybe we need an hypercall for QEMU to notify the masking/unmasking to
> Xen?  As any change on the other fields is already handled by QEMU.
>=20
> > I guess that could use my subpage RO feature I just posted then, but it
> > would still mean intercepting the write twice (not a performance issue
> > really here, but rather convoluted handling in total).
>=20
> Yes, that does seem way too convoluted.
>=20
> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > > > ---
> > > > v2:
> > > >  - passthrough quad writes to emulator too (Jan)
> > > >  - (ab)use len=3D=3D0 for write len=3D4 completion (Jan), but add d=
escriptive
> > > >    #define for this magic value
> > > >=20
> > > > This behavior change needs to be surfaced to the device model someh=
ow,
> > > > so it knows whether it can rely on it. I'm open for suggestions.
> > >=20
> > > Maybe exposed in XEN_DMOP_get_ioreq_server_info?

Make flags IN/OUT parameter (and not reuse the same bits)? Or introduce
new field?

> > >=20
> > > But I wonder whether it shouldn't be the other way arround, the device
> > > model tells Xen it doesn't need to handle any MSI-X accesses because
> > > QEMU will take care of it, likely using a new flag in
> > > XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
> > > part of the gflags, but then we would need to assert that the flag is
> > > passed for all MSI-X interrupts bound from that device to the same
> > > domain.
> >=20
> > Is is safe thing to do? I mean, doesn't Xen need to guard access to
> > MSI-X configuration to assure its safety, especially if no interrupt
> > remapping is there? It probably doesn't matter for qemu in dom0 case,
> > but both with deprivileged qemu and stubdom, it might matter.
>=20
> Right - QEMU shouldn't write directly to the MSI-X table using
> /dev/mem, but instead use an hypercall to notify Xen of the
> {un,}masking of the MSI-X table entry.  I think that would allow us to
> safely get rid of the extra logic in Xen to deal with MSI-X table
> accesses.

But the purpose of this series is to give guest (or QEMU) more write
access to the MSI-X page, not less. If it wouldn't be this Intel AX
wifi, indeed we could translate everything to hypercalls in QEMU and not
worry about special handlers in Xen at all. But unfortunately, we do
need to handle writes to the same page outside of the MSI-X structures
and QEMU can't be trusted with properly filtering them (and otherwise
given full write access to the page).=20

So, while I agree translating {un,}masking individual vectors to
hypercalls could simplify MSI-X handling in general, I don't think it
helps in this particular case. That said, such simplification would
involve:
1. Exposing the capability in Xen to the qemu
(XEN_DMOP_get_ioreq_server_info sounds reasonable).
2. QEMU notifying Xen it will handle masking too, somehow.
3. QEMU using xc_domain_update_msi_irq and XEN_DOMCTL_VMSI_X86_UNMASKED
to update Xen about the mask state too.
4. Xen no longer interpreting writes to mask bit, but still intercepting
them to passthorugh those outside of MSI-X structures (the other patch
in the series). But the handler would still need to stay, to keep
working with older QEMU versions.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--h0yfVA2p3aHd7WRo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQhf0AACgkQ24/THMrX
1yxHAgf+KfAziPA42KvZbxh62ns1DlAJqmak/h8QUvac1Nzx0S4WGKcIfvSSHZAR
brcTRgudZWagj4VKgey4nEMVOkIAgLMQKNoRCokbtMY9dTMPQd6/63Eb+30dd8kt
N1c5AIDq2KKkBZh1R2juLAyHeRBb7oqQmb5W8TuXN1+AuKlTd/xEmxlThiAYZNRa
IwLYicV9P5NrS44ZYW722cBTIilwajFrEA3qenKGbrUUFmd6aF4FL/ynlBTJWVX7
UfcQ0in5tZoK033ACkv1c9cZXfWYy8M3yctPoFNxcoFKiT8MQ0dkRnXCqE39QrqB
dhFnAdX7a1FV3/9BsVS7UC8C2X/Y3w==
=lOGC
-----END PGP SIGNATURE-----

--h0yfVA2p3aHd7WRo--

