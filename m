Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9698CC20E
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727644.1132218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lw0-00044r-9A; Wed, 22 May 2024 13:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727644.1132218; Wed, 22 May 2024 13:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lw0-00042T-6P; Wed, 22 May 2024 13:23:12 +0000
Received: by outflank-mailman (input) for mailman id 727644;
 Wed, 22 May 2024 13:23:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKXr=MZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9lvy-00042N-OK
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:23:11 +0000
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c1eacf1-183e-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:23:07 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.west.internal (Postfix) with ESMTP id BDFB61C000A9;
 Wed, 22 May 2024 09:23:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 May 2024 09:23:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 May 2024 09:23:02 -0400 (EDT)
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
X-Inumbo-ID: 6c1eacf1-183e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716384183;
	 x=1716470583; bh=FLnl9Hofz7FZpFMb5Naycrq/oqV73WrcuNoNEEYE35s=; b=
	wLFWTTeVdk8/0rA5pvA7DFeMkhK1c0lH04Usye8ZVNPTRemJlrEZcxcUo2kBvRlO
	MYQwYD+1bQDRexzvEBBpL4fwQP+2oqSfuQyrLfrXympu6RBpj1g4+A1es6jC0yNW
	y+VIaqPW5cSIt9PDGHeJGD/ALZ1Ieoe8M8r7Lj7FwwGYu73CwqyIT86anywZQJfP
	BgtiFMw3jklLQ5brhf0WYp+/R6LNkkntYMiNu9cZuocIuheblEV8KGc0ZgGqsslX
	RnQkyZ6/JU/N19WxUAWIjS3rlT00i03BkwoVxBB0KpsnX2EAFDSj/t4vM1bi7j6y
	IncYh7ICKKhKWDWaCK8r1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716384183; x=1716470583; bh=FLnl9Hofz7FZpFMb5Naycrq/oqV7
	3WrcuNoNEEYE35s=; b=bHKsdIu9LmhswPoTOEhgcIlWpKpV6yjNjOryLGO0qHQa
	NYg9ea5v/m/LX/D+Xlo+VcCtizodeTAKLl9iSwCXAnux4PCvChYT4UiCbsR+at1+
	H8SNAwifEhIyPC0a38EnhX+Os42bbYhbm+odZ2rUxdg0GmGzQxdMY3v2klk4+540
	yb/+BWhFWCIpbKewpVO7+2RLWnEjHTbCSBhNcYGZnE5MwLW6BiZmhO6DO7V4dYD6
	V54QNN1XJj73x5Zs/isSJG5jC8wKLwXEQKi2kfP1PqzMbEz5N6ge813bag+Q1JR9
	nR2p81qLT6mkVu/Z++lzINE095xcRfcbdMMzL9r1zw==
X-ME-Sender: <xms:t_FNZn1d-d7SKFTcnWqbCjcwlCtzi-HmICUbwjMufNyQwFh_aE88aQ>
    <xme:t_FNZmE4XddeSjLm9QlVsCVyMyA7nrZg7vXYyluk8Ocv38frdst3IoBJl7qwqY2P0
    sARY6iv92A-EQ>
X-ME-Received: <xmr:t_FNZn5_JIIryDpqmVlIMrD_bWuVoeXYqF4eD6ZB_jkerwmT38ulgMfCrfym9RjAjK7yvtxTaoolAorRp_U6EZZ3BhIGJc_jRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeigedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:t_FNZs3oIEVaXLAcm-CApcrRww_2sCHm6zmrUbiaKYbjaNY4Zy11aw>
    <xmx:t_FNZqERa58TdtM0VQs5Jt81_6bf54iPblfdr20QPiuq5qyyL3GFfg>
    <xmx:t_FNZt_Dv3FGNCKx46ariRAM1jEcdQJCwCCM0W4hg0LLgPjaumbLrw>
    <xmx:t_FNZnlR0h4HAQ5f6g_KphZLqQ8LWeAJwT-Seu8h52BOvxYAYCdNPA>
    <xmx:t_FNZmAmQ3rTuUodGVsK9sKSza7xlSE4REA2I_Won7O1GSpdesjkVYT7>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 22 May 2024 15:22:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zk3xtK0SaaqEadXY@mail-itl>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2708dbbb-f913-4920-a008-beef12cd1265@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zsucm9wcRX2e8Q2A"
Content-Disposition: inline
In-Reply-To: <2708dbbb-f913-4920-a008-beef12cd1265@suse.com>


--zsucm9wcRX2e8Q2A
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 May 2024 15:22:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Wed, May 22, 2024 at 09:52:44AM +0200, Jan Beulich wrote:
> On 21.05.2024 04:54, Marek Marczykowski-G=C3=B3recki wrote:
> > +static void subpage_mmio_write_emulate(
> > +    mfn_t mfn,
> > +    unsigned int offset,
> > +    const void *data,
> > +    unsigned int len)
> > +{
> > +    struct subpage_ro_range *entry;
> > +    void __iomem *addr;
>=20
> Wouldn't this better be pointer-to-volatile, with ...

Shouldn't then most other uses of __iomem in the code base be this way
too? I see volatile only in few places...

> > +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(entry->mfn, mfn) )
> > +        {
> > +            if ( test_bit(offset / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qw=
ords) )
> > +            {
> > + write_ignored:
> > +                gprintk(XENLOG_WARNING,
> > +                        "ignoring write to R/O MMIO 0x%"PRI_mfn"%03x l=
en %u\n",
> > +                        mfn_x(mfn), offset, len);
> > +                return;
> > +            }
> > +
> > +            addr =3D subpage_mmio_get_page(entry);
> > +            if ( !addr )
> > +            {
> > +                gprintk(XENLOG_ERR,
> > +                        "Failed to map page for MMIO write at 0x%"PRI_=
mfn"%03x\n",
> > +                        mfn_x(mfn), offset);
> > +                return;
> > +            }
> > +
> > +            switch ( len )
> > +            {
> > +            case 1:
> > +                writeb(*(const uint8_t*)data, addr);
> > +                break;
> > +            case 2:
> > +                writew(*(const uint16_t*)data, addr);
> > +                break;
> > +            case 4:
> > +                writel(*(const uint32_t*)data, addr);
> > +                break;
> > +            case 8:
> > +                writeq(*(const uint64_t*)data, addr);
> > +                break;
>=20
> ... this being how it's written? (If so, volatile suitably carried throug=
h to
> other places as well.)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zsucm9wcRX2e8Q2A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZN8bQACgkQ24/THMrX
1yzSeAf/UwyibLPwFQSpLOLjZ9m8YwaWWkgtYKFyIftZSb9/QTEBg1Q0nXTS9V1G
Ugflun7zINy8H5vtVXe64xw3A+/tQnSW0hejn8Oi52e9oUv0qc2qawSSlfAUpM6B
gvjZlyEMU7JUk5l6QpsTUUceTOTs8Ac4BHvh1KaFTzZJzGwGzQCgdsYTGteJSijT
4cwvKY+gRgRNgpOYNdVEG8pXiFue4huZumGvIDfoDYD9vZT60idMsGKWNIcEv0as
WTMVMOXaV9NBy8C1sAL/XMFA05lIFx5fC4g9izz8soBk7hUe3zTs98z8LRqZ+SXD
bDXtlkPDWHe5+93Axc1DtaHvWNrRYg==
=pan3
-----END PGP SIGNATURE-----

--zsucm9wcRX2e8Q2A--

