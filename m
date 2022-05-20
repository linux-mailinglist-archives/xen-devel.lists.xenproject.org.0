Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2952EC42
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334092.558068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1sq-00040e-ST; Fri, 20 May 2022 12:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334092.558068; Fri, 20 May 2022 12:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1sq-0003xo-Og; Fri, 20 May 2022 12:37:32 +0000
Received: by outflank-mailman (input) for mailman id 334092;
 Fri, 20 May 2022 12:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2TWf=V4=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ns1so-0003xd-AX
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:37:30 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93e8612d-d839-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 14:37:15 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 94C055C01D1;
 Fri, 20 May 2022 08:37:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 20 May 2022 08:37:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 08:37:28 -0400 (EDT)
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
X-Inumbo-ID: 93e8612d-d839-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1653050248; x=
	1653136648; bh=05LDLzDpQgSVtdIYI1dti9Q3kXv2e4QWs6tuSTHMGR8=; b=T
	UYiNdKHY9eZpMqgxGQHkt2/+NVyeXur3TL4eDI/AfXZSfyuMoX5iDgT+1rqj3WBu
	zA/YXQmZlSxcpU89Am8zCvgmx6MlFaD3Cz5oxA5ItyauL9AjAdfIMmnPLHVevAj2
	H+zI+NYKGnWHQejytafAXn/gj3JOF46LXAvG9AzitLt3x6TtQiHNLO3j92kjknvX
	DnoPWgxTHoixnRdD1xxknL/sj049w8JadfiONffBVIZZFex5+D5SPmGV+SDB0AHn
	uO47mnW4QkQ0n7YJRHpgFYG7xDvvzbtwWArQkYnoc4BCj8fVfAjyuXSfqEAcjRmF
	x+wmy2IhEjm2M/Dt5gvIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1653050248; x=1653136648; bh=05LDLzDpQgSVtdIYI1dti9Q3kXv2
	e4QWs6tuSTHMGR8=; b=oIqHE2aKJ9oojLMRgYfOZnX7TVNI9Wf9PNN9lCxXBfv2
	Q2xHjWAtj7X/yLorLzaqQ9RIm8siY1986Lx/+liOuuJ476Rx/LeHCv9Hnzp3qgAq
	oUITqjf+sZnvNA+OoDBSWMnb7gE2GtPn6+TYti62/pzZRv/6K3b24a4T+1cuxXRz
	9ErvGJ+v39nFcPHQH055xkomXc0pEKyVA9yk+XHQ0GGNECT2yOaK/+x47cdj0Nr1
	C7OrCXrEkKvncSpaSDDY24sWp+UYbD1e320HixwxJQPloOVD2AUnWzFUejFQJVfV
	5M46vymR4ajGopyWgR0HJpr39tRMhdxikHzz4Diycw==
X-ME-Sender: <xms:iIuHYsGicGQ2ePbiosQWuYXwLc7yO0ekO3qeGVdUx5FqzG1uRor1rw>
    <xme:iIuHYlXOEKaHQDic-EhsczJcgyGDfyrGfXiN9bDljc_O4Kki2MAWWzNkLxDPwPeDZ
    S9jCeVsy4ic7Mg>
X-ME-Received: <xmr:iIuHYmKQRLKClLl9ypOUoPjEKxlUqSn4z0SU9Ua2lAr3TfA4ltfq3iR4NyH1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:iIuHYuHxJNzYTNl6i6NNOyYxtB3Y8Yz32ujc_leXABr-vo9k37UkuA>
    <xmx:iIuHYiXnukKQujEsjXGuXzdKyeJ8HQw-NXmbD5OW19dZlcabw9sSnQ>
    <xmx:iIuHYhNFQgLS04u13N1oSDmOrbE7oezXwWgyIK1lA3-XFvTSDins_A>
    <xmx:iIuHYtCWXuXHo09Xxg73rNgm0YQmBVuf6H1ZCs_rMR6N-V_6hfKOJg>
Feedback-ID: iac594737:Fastmail
Date: Fri, 20 May 2022 08:37:25 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Grant operation batching
Message-ID: <YoeLhszyuyhM9Rus@itl-email>
References: <YobRWXY/xVli4UUf@itl-email>
 <dcf54bdb-e588-430d-e2db-30b6fd4280b7@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uuRkDiSCjN6lALX7"
Content-Disposition: inline
In-Reply-To: <dcf54bdb-e588-430d-e2db-30b6fd4280b7@suse.com>


--uuRkDiSCjN6lALX7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 May 2022 08:37:25 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Grant operation batching

On Fri, May 20, 2022 at 08:24:48AM +0200, Jan Beulich wrote:
> On 20.05.2022 01:22, Demi Marie Obenour wrote:
> > It is well known that mapping and unmapping grants is expensive, which
> > is why blkback has persistent grants.  Could this cost be mitigated by
> > batching, and if it was, would it affect the tradeoff of memcpy() vs
> > grant table operations?
>=20
> Which backend driver are you thinking about? The in-kernel Linux
> xen-blkback already batches grant operations, afaics. Such
> batching is helpful, but the main cost is assumed (known?) to be
> with the (installing and) tearing down of the actual mappings of
> the guest pages (into/)from backend address space.

My thought was that the expensive part of this is TLB flushes, which are
only needed once per batch.  Also, what do you think about the =E2=80=9Cuns=
afe=E2=80=9D
mode?  It would only be unsafe if the backend is untrusted, but it is
quite common for the backend to be trusted.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--uuRkDiSCjN6lALX7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKHi4cACgkQsoi1X/+c
IsF2mxAAozWbWyuKKLqdBLmQ+zK4PH4uPR6QlSSE5rmtj5tYgTcrxqJGHGcgvIbe
43SG91VRlUHkfuZq/X/eDN1cTzdkTRZqmuOT4Mz9UzYCTxbxtVrAetBt2kndjxmo
YjjXi76Uk2k2ugSf6RZ1Cma29bINDg6DoeDq07tUeEGyo0mtGv/KsZ5UjSqiP5sx
3HLnIiTRfXC3Lj84s0IBj0Rp/8ee0SQijwZCim2HwOMXUXMKYMlYD+umJ8r0z/um
X6EQ+iqr4wcv2ZOqrwPmkd+bFfiNDF62gRIB77razlGDzx6uk0Pp0oWgp5RKXSSa
J750io542n8AjAcShmKetyFszymQXWqeIcFVZdfYD+i45oJk6udqv3/M6LDvB2Sx
YXsmaVXR7RDGWf30aTuSMl7U/iob+q+bwkdTTmHgyvCrHrkc13lQ1r8Gkz8cwOdt
MPqMgbgH16bvDXF4bxNOY5QJlco8BGkwy1LLe7PSCp6nmrbaKwiBws4yGwdaxYcn
rY8v1dgxXMlquGSYX66smFThCLkORLhMZcUVUTzXRH7WtRst4MkwGsPJuUwPEkSa
B82y4YY9YmIWBtzVbztrFGkjn42NRyCWtOcUoeiq5sR1ChHic8EUaT2XX58yIXuo
RB7Fw9WG3UVOs8YmJD9FYPeWPRZQHyjoB8/+xPE1/6EvONkAOqs=
=JyL7
-----END PGP SIGNATURE-----

--uuRkDiSCjN6lALX7--

