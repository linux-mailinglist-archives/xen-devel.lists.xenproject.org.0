Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4C8794FC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691858.1078351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk25H-0006sW-Cw; Tue, 12 Mar 2024 13:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691858.1078351; Tue, 12 Mar 2024 13:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk25H-0006q6-A5; Tue, 12 Mar 2024 13:22:23 +0000
Received: by outflank-mailman (input) for mailman id 691858;
 Tue, 12 Mar 2024 13:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jUN=KS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rk25G-0006q0-4S
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:22:22 +0000
Received: from wfhigh2-smtp.messagingengine.com
 (wfhigh2-smtp.messagingengine.com [64.147.123.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d3281a9-e073-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 14:22:20 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfhigh.west.internal (Postfix) with ESMTP id 3A1F518000AF;
 Tue, 12 Mar 2024 09:22:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 12 Mar 2024 09:22:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Mar 2024 09:22:15 -0400 (EDT)
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
X-Inumbo-ID: 8d3281a9-e073-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1710249736;
	 x=1710336136; bh=gEUpmZ8QXwRRKcRI8dbsxxkQVkIJCAmX7zwzG25H+Bo=; b=
	K1Z94WzYyWUwoW+OdDNpCm6YiXLuWaoz0ZSPgCpX0jU/mo0yGu59j2wWbiWvBYMe
	oe1UB3y2DIKdUP5j3Yee8GXErNaJno2iPrpM/AD8ijmSko3bnbYrHxX3DfsRddgA
	jvbGFF5aJAdAsKnGcxjF1FU87/6Ojksx+3OwcJmo8U/ZZtLiCzdRIkG/8oAmuGPL
	QRNfLBzsde6YOHX+EESEmNOe1Abo3sBKldNnZQwQafAbASqF/IerkuToOoL7x26I
	4sxs3iLgpgvZy5WP6Jw8GISgkth3ZrHWrsEcJ8R+bSIkXtK507blWBYMWoXeaFC1
	W0bfcBOkRK879fQJasuS0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710249736; x=1710336136; bh=gEUpmZ8QXwRRKcRI8dbsxxkQVkIJ
	CAmX7zwzG25H+Bo=; b=ir2BkRUfSuXdDI4Etw217FqijVla88BN81si8CJTPHk2
	vO1DHSQ1OFKXVVDTOCqTZVNQzJjCbgkrmBg/6WqYSFTKibh1Etct5vc1PsQe1Mcb
	UcJSgr3YLGb8s0BeqWdpKefO412foi+qsdlnJyx33wt0lZjp1GQKFkqtz0JdYHNg
	U6wrOCPVH85Dsfv52xIP24pm46ZCAGBgQ+nZhvRyG2HP8tiJGo+tCAd+GNxcaO7R
	KY29O9NWUdeHYwgAfa2Q8R7+2LzGD9gNzzKErEnPNTBIuk2cw1maq5a4ecYMIgap
	N8uvgCFkXKm1U9DqdokxNtb8wHwOXKBkUrknYa6LSw==
X-ME-Sender: <xms:CFfwZfeMmDKbz0JvJShdRU5YXyckrZdOStqgDaCRHzH9YQ886EE8dA>
    <xme:CFfwZVMLRAeGn7tcPDWl51AVLmMEBS_o-Y6TWWs1KIEkttMgzI-CY_bTUEaUAgN2U
    L-yh01L9kzGHQ>
X-ME-Received: <xmr:CFfwZYi8CZyLeBFT37TrMNnUdg0w76f1ArF4Fvk4D-mZ6UeLdwHa3u8cv24VgTxl-z_x3iazM2DWQioF7Pop-CNhPXz5K2ZXMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:CFfwZQ_iyjGqsV8X6DLVwJqGGoNhRKkWzOV1PEIisZRO5ZSnkvEqLw>
    <xmx:CFfwZbt-kx70tFbv4Lomw8uAM8VZwBDAxP2vhN_Jy03ipXe6DgdXAA>
    <xmx:CFfwZfGT8wfXIK85aCKS40fbazWE5S-emjuu25NCcd2cTCkzRv_3gQ>
    <xmx:CFfwZSMVagzRQqGqLR5YKPMUcuYFbc_3BbSeiFUJRXJYfwxb4egLgQ>
    <xmx:CFfwZRDXQFcux9gciBtQ5RXi92PoihvkwI7lqX9Y90HelTcOqvYcFw_gYO8>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Mar 2024 14:22:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map
Message-ID: <ZfBXBe_9Bw9t4NVP@mail-itl>
References: <20240311203431.342530-1-marmarek@invisiblethingslab.com>
 <ZfAtahcXWGqckQFW@macbook>
 <6a80ceb6-cc2a-4d8f-9a66-70063923b0ea@suse.com>
 <ZfBERyqQ7Ous3nGE@mail-itl>
 <2a04315c-7bb8-4985-8aca-bece9d0d535e@suse.com>
 <ZfBT-xwmKCugJQVy@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cyjgwSoPVYxGjkDn"
Content-Disposition: inline
In-Reply-To: <ZfBT-xwmKCugJQVy@mail-itl>


--cyjgwSoPVYxGjkDn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Mar 2024 14:22:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] drivers/char: mark XHCI DMA buffers reserved in memory
 map

On Tue, Mar 12, 2024 at 02:09:14PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Mar 12, 2024 at 01:38:53PM +0100, Jan Beulich wrote:
> > On 12.03.2024 13:02, Marek Marczykowski-G=C3=B3recki wrote:
> > > BTW should e820_change_range_type() return 1 in case of mapping alrea=
dy
> > > having the right type? Otherwise, if one wants to use
> > > iommu_add_extra_reserved_device_memory() on already reserved memory, =
the
> > > e820_change_range_type() would fail.
> >=20
> > You raised that question on Matrix yesterday, iirc, and I left it
> > unanswered there because it takes archeology to find the answer (or at
> > least get closer to one). And, please don't get me wrong, you could as
> > well do that yourself. (My vague recollection from having dealt with
> > similar code in Linux is that yes, in the example given the function
> > ought to indeed have failed back then. Depending on present uses etc
> > it may well be that we could reconsider, though.)
>=20
> I sure can do some archaeology there, I was just hoping any of you would
> know the answer already.

None of the commit messages touching that code give the answer. But
looking around, most callers of reserve_e820_ram() ignore its return
value. One exception is reserving memory for kexec. I guess in that case
it may be intentional to fail if the area is reserved already, as it may
indicate it cannot be used for kexec. Is that correct?

There are also a couple of calls to e820_change_range_type() in tboot
code where it changes E820_RESERVED to E820_UNUSABLE. There, I guess
changing e820_change_range_type() behavior would be okay.

Anyway, since we agree to focus on RAM in this API for now, it shouldn't
matter anymore.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--cyjgwSoPVYxGjkDn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXwVwUACgkQ24/THMrX
1yym6wf9HeI3PgTlfO16rW2M3ziJEqtQ0DF2VMiXAy7/mFZrRwDYNWPPwUcyI6qZ
eE8otU54p8BzUCqcqSe1XtpvAksmz6kN3WATgDd+aFhNmDuHmAmv6gPZs5STN3Pt
fGjvpcgeeXRFab/nQMJxE5VtSmGRj+twEJO+VXyBa7orVZ46UXc6MSiZt4OCDSOW
SxAMBL9yStQ3EajgG+Slkpt9ssGNgu/3dreODGumNHWbZLE0+EXfzM8HvSK9ghm9
mCUZbRA4fgg+8sLOXVUzcBJkqTZ5Wx0BE28EurDbCd6Y7awosAke1E5sGvlheRbS
/vPRcvAAG25FxyAXTk10YkYB1Vmx9g==
=VMdq
-----END PGP SIGNATURE-----

--cyjgwSoPVYxGjkDn--

