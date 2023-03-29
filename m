Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534716CDAC9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 15:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516276.800153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phVpx-00021N-6L; Wed, 29 Mar 2023 13:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516276.800153; Wed, 29 Mar 2023 13:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phVpx-0001yR-3G; Wed, 29 Mar 2023 13:27:37 +0000
Received: by outflank-mailman (input) for mailman id 516276;
 Wed, 29 Mar 2023 13:27:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nen3=7V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1phVpv-0001yL-HS
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 13:27:35 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 753e1221-ce35-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 15:27:32 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 219EA5C00D5;
 Wed, 29 Mar 2023 09:27:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 29 Mar 2023 09:27:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 09:27:29 -0400 (EDT)
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
X-Inumbo-ID: 753e1221-ce35-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680096451; x=1680182851; bh=/+MRYRsaQkmdXXHGULqnK17tx9iLlBePVV5
	Mq4zZ5ZY=; b=aa8l+QzM05SJOfSX6w/xbEUdVg15gUFDU7y+lKlBp97/546FlBP
	0X7RBjrWGuqzcdXFK/s9TThuL13M20fO+BshwS4Ybssn67Lvf+PQSgwEng6h0pqf
	y+nqzVDpnKb1N3d1BBPXw/jpW/Mukv9fEn2GsHYgweCXIhBK9YsLEYX6pBBfLTi6
	Ld8PHV9uZ2qV12qy6Wp9uHunh4w3DcbHlfkwgGEKtdaaKB3Uw8CGACT9WS9Y8nfD
	r+mCyH8phKrzVUCH9azg51poDCNOVIk6RN0ocp+FcRNptjrLo1S/TpLJxh0+cz1N
	r3YdRNrUqcdwrhY4IbxK4X5BCgulsyLj40Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680096451; x=1680182851; bh=/+MRYRsaQkmdX
	XHGULqnK17tx9iLlBePVV5Mq4zZ5ZY=; b=eG6veM0G2+VvSdqvLhxO4UwgnH+jp
	W7b0BjbLKqh3JltprLQc+ZIuzTCpQvha+Ezz6WtGM8iWsPcgGIAPmSVxJtb77AKV
	lTljdF2G+UEkzoT0DvTgG9T/zQI9Avkcw8o05htyjHROyfUk+tyJA2ijZugIzjT+
	ld+0IdA52vdmKvQfy3a8ar9+Vp/7+nm6EoNvjUko9rje7YTSY2zr6BoCdtejhZh/
	wXVk9DBWoQKE4HJEUXMG8kKDjEy3xhNosp3iyAnVIyc/X0P7iR4kJYxg2ppXxqg8
	zAvYrcJi2O0aOD81yIZcC2t5xZguEBk6Fmsw/AU1F2TCzy0MNK5M1V9yA==
X-ME-Sender: <xms:wjwkZO4xzQesmKWQ3jzpUR90UUsgKdQNP7E5Qf478ylO8ImHNaUVTg>
    <xme:wjwkZH4ymGAKiFRM44WE2KYtlWkN9hzy-c5btKJ_zRvh_neKonB-5Nm3JZXMkrlJu
    xiK0qmQOpsNlg>
X-ME-Received: <xmr:wjwkZNcLs6X1vMq3SutxHTYiMlrZAeBBeKuTtSAf1proWSyUvgY7brqU3CTu8qObyV8LYlmA4OGt7FgYsk4nXypzMnmqsj5QvE4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:wjwkZLKg9gphRS6MH0Uienv4FY2YSvVRQp63FgrHfFt-dEON1Pxw0g>
    <xmx:wjwkZCIcvvsfmzsYNueNK4EF8xt-8LAsqwQ6M7BbGKEZmbPnyQW92g>
    <xmx:wjwkZMwid-mD_wd1N9rgIr2T4vCQsVP4s73uocyNL1Oe0Ux4FcMMiQ>
    <xmx:wzwkZO2VHLhU_G1W2Lp1hbSM4Ac753h-T0QUhHu2d6cuLaKKIlBCpw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 29 Mar 2023 15:27:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only
Message-ID: <ZCQ8vmkqvyH/KJEX@mail-itl>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <f5381e06d92cccf9756ad00fd77f82fba98a9d80.1679911575.git-series.marmarek@invisiblethingslab.com>
 <e238bffa-5eba-b18f-ed73-1c5c9730cf70@suse.com>
 <ZCQYLkoSfZ7klmNC@mail-itl>
 <2c689aeb-db4a-f2a4-d1b2-31f1283c0de7@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4D6BWUFxZyIsaY8h"
Content-Disposition: inline
In-Reply-To: <2c689aeb-db4a-f2a4-d1b2-31f1283c0de7@suse.com>


--4D6BWUFxZyIsaY8h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Mar 2023 15:27:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/mm: add API for marking only part of a MMIO page
 read only

On Wed, Mar 29, 2023 at 02:39:22PM +0200, Jan Beulich wrote:
> On 29.03.2023 12:51, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Mar 29, 2023 at 10:50:20AM +0200, Jan Beulich wrote:
> >> On 27.03.2023 12:09, Marek Marczykowski-G=C3=B3recki wrote:
> >>> In some cases, only few registers on a page needs to be write-protect=
ed.
> >>> Examples include USB3 console (64 bytes worth of registers) or MSI-X's
> >>> PBA table (which doesn't need to span the whole table either).
> >>
> >> Yet like the MSI-X table the PBA is not permitted to share a page with
> >> other registers (the table itself excluded). So a need there would
> >> (again) only arise for devices violating the spec.
> >=20
> > For PBA, indeed (and due to not seeing device needing such hack, I don't
> > do that for PBA yet). But the XHCI spec doesn't include such limitation=
, so
> > this case is perfectly valid.
>=20
> My remark was merely because you mention PBA in the description.
> Mentioning it is okay, but you would want to further qualify it, I
> think.

Ah, ok.

> >> Taking both remarks together, limiting granularity to 16(?) bytes
> >> would allow using the advanced EPT functionality down the road, and
> >> would at the same time limit the suggested bitmap to just 256 bits /
> >> 32 bytes, which I think gets us below what even an empty rangeset
> >> would require. Plus lookup would also be quite a bit more lightweight.
> >=20
> > Indeed, in that case it makes sense.
>=20
> Hmm, I've checked the SDM, and I was misremembering: Granularity is
> 128 bytes, which might be too large for the purposes here.

Indeed, it seems so. In case of USB3 console, I want to protect 64 bytes
of registers...

I guess 16 bytes granularity would work, but it feels kinda arbitrary
without any good reason to choose this specific number. More logical
would be 4 bytes (as common register size), but it means 128 bytes for
the bitmask.

> >>> @@ -4893,6 +4906,172 @@ long arch_memory_op(unsigned long cmd, XEN_GU=
EST_HANDLE_PARAM(void) arg)
> >>>      return 0;
> >>>  }
> >>> =20
> >>> +int subpage_mmio_ro_add(
> >>
> >> As long as patch 2 is going to add the only users, __init please, and
> >> there's no need for a "remove" counterpart.
> >=20
> > __init makes sense. But as for removing "remove" part, I'm not sure. I
> > realize it is a dead code now, but it's easier to introduce it now to
> > provide complete API, than later by somebody else who would want to use
> > it in other places. Is there some trick to make compiler/linker optimize
> > it out?
>=20
> At the very least you could also mark it __init. There are also the .disc=
ard
> and .discard.* sections we handle specially in the linker script. But no
> matter what you do to retain the code without impacting the resulting bin=
ary,
> iirc Misra tells us that there shouldn't be dead code.

Well, if dropping remove, then I guess I could leave a comment
describing what it would need to do. Or maybe just hint in the
description that earlier version of the patch had remove implemented -
so if anybody needs it in the future, can do some mailing list
archaeology and have something to start with.

> >>> +    if ( !iter || entry->fixmap_idx =3D=3D fixmap_idx )
> >>> +        return 0;
> >>> +    else
> >>> +        return 1;
> >>
> >> If this case is really needed, this special return value (as documented
> >> in the header) probably needs specially handling in the callers - it's
> >> not necessarily an error after all. But I wonder whether it wouldn't be
> >> easier to check earlier on and fail right away (with e.g. -EBUSY),=20
> >=20
> > The idea is to allow multiple sub-ranges in a single page. Again, if
> > using ioremap() internally, instead of fixmap provided externally, this
> > case will go away.
> >=20
> >> rather
> >> than adding the range and _then_ (kind of, as per patch 2) failing.
> >=20
> > Right, I missed "!=3D 0" there.
>=20
> Hmm, adding "!=3D 0" won't make a difference, will it? Adding "< 0" would.

Right.

> >>> +        }
> >>> +    }
> >>> +    gdprintk(XENLOG_WARNING,
> >>> +             "ignoring write to R/O MMIO mfn %" PRI_mfn " offset %lx=
 len %u\n",
> >>> +             mfn_x(mfn), offset, len);
> >>
> >> ... make it here. (By implication: I'm not convinced this wants to be a
> >> gdprintk(), as I think at least one such warning would better surface =
in
> >> release builds as well.)
> >=20
> > Right, gprintk() would make more sense indeed.
> >=20
> >> At the same time I don't think any message should be issued for write
> >> attempts to pages which don't have part of it marked writable. We deal
> >> with such silently right now, and this shouldn't change.
> >=20
> > At least for HVM domains, it isn't really silent. It's domain_crash()
> > (before my change, not reaching this function at all).
>=20
> Well, yes, but that's one instance in the lifetime of a domain.

What I mean is that it isn't a common or normal case that HVM domain
would exercise in normal operation. It's abnormal situation and as such
it should IMO get a log message.
And even for PV domain, such message would save me quite some time
debugging related issues...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4D6BWUFxZyIsaY8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQkPL4ACgkQ24/THMrX
1yxEuwf/UnBotmJ67KZMJ3dusAxrKs9n8+TYiCXYK+FrZvwA1kg6T9rCot/11Ku/
cslp91MKZHjQ/LibX/XA1pdKc7JOjtMTW8UUXwRk7cQy8GoqUD7mvfSPJt2H3GHc
kquz6jFH0Y19Ekh+3EbFx2K5RXebrHoNJ+itZVxq7Cd4H696rtroo5pZPHmdSSTW
RXumA03+0eI5SPeciSzGkjp6MbHlfNX96uPzPK7MBuydnmwybQv+OYuZ4ZMu7ONe
fE49TG8ENOJx2wuI6ChnD2TxYc/5vlP4rzY6VM2iaxzNlPysYqqBL9hKtwcBaWzh
2bonenrANPGJaE7Di2oyZPje7p3LHw==
=Q55b
-----END PGP SIGNATURE-----

--4D6BWUFxZyIsaY8h--

