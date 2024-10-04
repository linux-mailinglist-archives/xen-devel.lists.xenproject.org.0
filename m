Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312A4991136
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 23:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810664.1223406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpfO-00089J-Nz; Fri, 04 Oct 2024 21:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810664.1223406; Fri, 04 Oct 2024 21:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swpfO-00087a-KQ; Fri, 04 Oct 2024 21:16:50 +0000
Received: by outflank-mailman (input) for mailman id 810664;
 Fri, 04 Oct 2024 21:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+dN=RA=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swpfN-00087U-53
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 21:16:49 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f597f4b1-8295-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 23:16:46 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id C3E9F13801E7;
 Fri,  4 Oct 2024 17:16:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 04 Oct 2024 17:16:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Oct 2024 17:16:42 -0400 (EDT)
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
X-Inumbo-ID: f597f4b1-8295-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728076604;
	 x=1728163004; bh=MGrKuqBDBH3wosq0pmO9ag0wz4xWnN+uM/lZoESYowo=; b=
	J9Cox+mivj6Wyok8IvAfetvg49wOjnb2WBB9xAcC1a3BuzL0nTrJG7ydtRLB4Qij
	L9ChlbVtiBE9ZiAsJWOu5rBTXWnCMl/U7P7Hr0TuiZWcpcO6ttYQiUQwa2FLKQdj
	DTgpHMSHDYBGAIejssZtKAFzHsaui88lDtho4oe7JSlF8YBLucHRvi/FQ+cWC/In
	xN/iVgmwRzuU0lV6znTYYmOwPzVRWui4jQJwl7Xr/8SORDmQ8fmfEJrjr0dLwBQC
	G7iDVQTqnxhPuQy9n0qCyGcLUx2e3j/Bl1IdlXsU2o+Pl+upP/CCyRbe++cbsiFo
	hGUg2G2zWHUJ5oH42Ird3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728076604; x=1728163004; bh=MGrKuqBDBH3wosq0pmO9ag0wz4xW
	nN+uM/lZoESYowo=; b=f/A+yPDz+gBUtJ8TdRjogboyX176ogBYS8BMhsWFUhZn
	8xfaRsi/Ed9t5JsJfXSlb2wGSs9cCU6wflHvpleci3Kn+UAKn/58KSqyGr2EosQS
	/wJqjmWsvWOrCGeqxXgBtGutykvLcvnCOqeGANasgkZYDjobrB8DMaI43rMc2NJj
	HDpU09hsoEHrj8SavVSIeDb0XsJBe40zmRoHkDSbK5EBCCM6atadPNzsfJAx8fQ7
	QdE8ywwS7gqt9+QRCyq1ZJese4Q6MldOHZnvRO7nLVJWuIUVte5iVZs6o/s5G5RY
	BczS+t4HHESXJLxAbOS7PTN8abOd8FlWCZT5PJNEHA==
X-ME-Sender: <xms:PFsAZ14NnGMJYnvTluJv54xkzETDaGlTpFxlfjsBLiCCrx_zBvrs1A>
    <xme:PFsAZy5BErzy-THLCXHPWYXmZ2MIlvzUMOEYBjFQbUK0R8rYTwQdb_N9ftrvc5hoh
    7NdfjlWdwH4WQ>
X-ME-Received: <xmr:PFsAZ8dsHWy2ZOIXeSyIJHi1bZORLH2Dc5hUKH-A2NVL3xI0OBhgrnHQ1JmDquYnJqGmclqqZzYnBfqLQoUkBjqkyE5dAqXDqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvfedgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpedttedvhfekudetvdelffeguedtkeethfethfffhfefteeghfeige
    elvddttdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsshht
    rggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfvgguvghrihgtoh
    drshgvrhgrfhhinhhisegsuhhgshgvnhhgrdgtohhmpdhrtghpthhtohepgigvnhdquggv
    vhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheptghonh
    hsuhhlthhinhhgsegsuhhgshgvnhhgrdgtohhmpdhrtghpthhtohepughpshhmihhthhes
    rghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhm
X-ME-Proxy: <xmx:PFsAZ-KGmZaoGQ2ts5isjWjZnihqxakS04akexGm2J1wQiTfF3vg9w>
    <xmx:PFsAZ5I-KZ-JNMeocqenhlPUeoVPySSUovY2eCb6Hxq92Qwc5bmVcg>
    <xmx:PFsAZ3xsRZ7ufAcHSOfh7N-GAa2HULWsMQHJy9WWiBcE0eIUKUw4XQ>
    <xmx:PFsAZ1Iq9L_uyMnTJZS-GkzOnXtqOF5Ts7EoAcdyDIg9Yp3QD4J__g>
    <xmx:PFsAZx-Gv3zJyR4OFEZGvbc0mgHz-BOBu9_UaZK3z-S45cCngEW0XeAR>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 4 Oct 2024 23:16:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
Message-ID: <ZwBbOAyfmgtjYcse@mail-itl>
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2410021736050.1138574@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZGS5RljdMlKseDU"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2410021736050.1138574@ubuntu-linux-20-04-desktop>


--uZGS5RljdMlKseDU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 4 Oct 2024 23:16:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6

On Wed, Oct 02, 2024 at 05:36:47PM -0700, Stefano Stabellini wrote:
> On Mon, 30 Sep 2024, Federico Serafini wrote:
> > guest_handle_ok()'s expansion contains a sizeof() involving its
> > first argument which is guest_handle_cast().
> > The expansion of the latter, in turn, contains a variable
> > initialization.
> >=20
> > Since MISRA considers the initialization (even of a local variable)
> > a side effect, the chain of expansions mentioned above violates
> > MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
> > contain any expression which has potential side effect).
> >=20
> > Refactor the code to address the rule violation.
> >=20
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uZGS5RljdMlKseDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcAWzgACgkQ24/THMrX
1yzpIwf8C0f8+qGJF4dDpl7/gIkwsNDu3FXeLulw4H8NvFCOClBQg3Ak1+j/uS1o
VfHX09K+GjvnIBjxo3H61HRuT17lIJfEFX0OlZEkv6vjKexPo3AhPtYyPg+kji+Z
1x80FuJAHht4A4ej7ItP9fLAwmA4vp7Ed8EFOCciy4Dy20nQr8MmmIhfSbI5I9Vv
yfZv4ODQhzr7QYyS25Qk68qLHX8WwAj2L18SSYDpTW24zyFJA6sW/s6RR8i1ZK/T
EE86pOqRuJ/DHxYjCl9P9co8ruQQEE0UjKt7otKG4N/pXLBZz1lOCZ7f9qHiaq2a
PPjwFSqhyGJqGru66VxPKZ9qPDlQfw==
=ZwvH
-----END PGP SIGNATURE-----

--uZGS5RljdMlKseDU--

