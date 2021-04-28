Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC736D594
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 12:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119188.225588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhFy-00066R-Ly; Wed, 28 Apr 2021 10:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119188.225588; Wed, 28 Apr 2021 10:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhFy-000662-IN; Wed, 28 Apr 2021 10:17:22 +0000
Received: by outflank-mailman (input) for mailman id 119188;
 Wed, 28 Apr 2021 10:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSVs=JZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lbhFx-00065x-6h
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 10:17:21 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0852dfb0-729d-48c1-b6e8-40d22f910c25;
 Wed, 28 Apr 2021 10:17:17 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.2 AUTH)
 with ESMTPSA id D0155dx3SAHG4dp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Apr 2021 12:17:16 +0200 (CEST)
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
X-Inumbo-ID: 0852dfb0-729d-48c1-b6e8-40d22f910c25
ARC-Seal: i=1; a=rsa-sha256; t=1619605036; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XNFyyNzH2irl+uH57pno4GXiTsiAvEVqH6/GzXsTcI+oV+s32F5KCEBkgpqVFoW8Xp
    Mwx5kQshkq1B4HhkSLUcrauGMVkPpKCXjcALYbgjDqoJlLQvmE8My7lb7+hVEKhC6MOj
    QtPV41ku62yCihDKWvLJzDNJqPLXkk9prsEUfkVP0tn9ZQkXpz8wRCCYpEu7qlh0zBao
    HWd3nI+ehOvBbNqqpe8HjwEiVi2IH0NNXEZyeMrRI6zAfp8U13W5TX4PzdrcWWvjGUZ5
    gQFdCWAbTfXRzIhaPtwfwt+ge7R0qUwcU8O3QjRi20ZkkabYg42msGAl3nPpU57IbOXi
    9sGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619605036;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=N5nQUN5MWj1mH/UBfQFfLyS6eJoSa6tcFa9x8CMfRYE=;
    b=BzeNBJZRFMYHiQLWQ9Yw2jpRIdxvX0fzA+sN1I76ujVtZKVotZ19BK9DpiyI6K8yaq
    yqdbtUEgW3N3a42kaYAruvX1G7K5zHpi2lzlHagcOc+Z5qJ3ARvw3fOEd6ySIuWwE1JI
    frm8N0zr36+i94wpkMEd45/M1g4yJUE0lHcIUdl0FjDVVT4Oyzhn+7Rhc5solDBh7yw4
    l5ov2/l+irfoPGeHb45fbllfCNjGIhRKGReTzINhTQA7i0Q6+zCyDIyYvkKKKzppqfVM
    WHnAjHbG4PIfo7u+lSxa1sAk5m1+i0kMDYH3t7UBtXjgSop0FqmTtj7zc3mrQzVZSmQF
    Z7rg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619605036;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=N5nQUN5MWj1mH/UBfQFfLyS6eJoSa6tcFa9x8CMfRYE=;
    b=HRVCwJacUAKl2tptrET5T0MP2k0tWOjXj6fR9ACCq6fKM0IE8bqK9K9PRsTKEh3tFw
    +C55xngP1Qs6oraYFElxgrTH7hFY0PekV3q035/hUNTQe7un66QlcroLVMqPtPSyDTQh
    Li7YiLIPvngXNLcTZn4+Fh5QtEr804R44dBCkd0kr9XKEEBLkRxXmMcs3mlkUiOx50tg
    oJ+2XyDCMSwktRcs0rRTuVYm9/DNBkAQfYem3wDD76eZUpgmAuCL1th6/Tjq/z1EzC0N
    K1GRHkW6JY0eprdGUtEng7qRajQ7CdDcaFprljPyPEH7JeWiESaj92WaNYgX5yV2HBju
    QBJg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisEsVR6GbU3svGYLiH9zFD0wpO7hNb2D/K88Gfjs"
X-RZG-CLASS-ID: mo00
Date: Wed, 28 Apr 2021 12:17:01 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: obtain a list of granttable PFNs from toolstack
Message-ID: <20210428121701.3272b369.olaf@aepfle.de>
In-Reply-To: <8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
References: <20210428095049.14a8272b.olaf@aepfle.de>
	<8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
X-Mailer: Claws Mail 2021.04.21 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ch0cKgUjIGd9Bu1D+6w_rjf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ch0cKgUjIGd9Bu1D+6w_rjf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 28 Apr 2021 11:49:59 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> On 28.04.2021 09:50, Olaf Hering wrote:
> > Is there an API to get a list of PFNs which are currently being active =
in the grant table for a given domid? =20
> Do you really mean PFNs?

The save/restore code uses the term "pfn" to refer to page indices from the=
 domU point of view. Since I usually just follow the HVM code paths, the te=
rm might indeed be incorrect for PV.

> Also, what do you mean by "active in the grant table"?

I'm not familiar with grants. My guess is, a domU pro-actively shares some =
of its pages with someone else. These shared pages have to be tracked somew=
here, and I guess Xen has to establish proper access permissions for such p=
ages. I guess the "grant table" is the place where things are collected.

Looking through xen/grant_table.h, I see no API. But that might be the wron=
g place anyway.

Olaf

--Sig_/ch0cKgUjIGd9Bu1D+6w_rjf
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCJNh4ACgkQ86SN7mm1
DoCI8BAAiVzOkHcsRNfCl16SguUIq2C/kkeUZUGLBYWnp7zMHnj5f6zCi1LUV/Vi
vFzYMUfBGF7IqlK+6DgjVsPiEFARg5y1DV/gpwlyit53GSyXZrCbnct0S4UTGKCx
9sqcOY2lt4qJ4lwVLT9iGqzHGz/G1bYGaEe0rXOIqebuI09WS/h6SD5w1Y4aTC1W
xspTLkjqrGE+PjwjIHT2AdhMCCYumdqP0+q0BI5oixsIRg0ZJID8+gMe1ebdptXZ
reZ5ZQH1UC2IT/bv55NyERPJAEDekAJGaSplI6KUc5oiYHugUsf1suEm1u8Hp79+
fCUc7+D74rez91chHXlk/fnbdrG3WauXHy+TY1ye/6X6dHUAsitktpWHvx7lkNQr
T7JUPSCBh0NWaV6RbIITYsM79QO9lLKV5hw/Lw8LqIX9dtkhcocS8XdIxUm89l03
pCLWzj58tF6dt69r8xBXdFnhMsA4s3pTUNIBg3jBJqkJsu1HtVCVjkSEUQWQl1bd
hSSAf9Dm4Ou+8wEYykBg6NA4KsHlNaP3RXbb7Yxtlzl/yZc9a4UcfqY/K8qOfRbw
8Srk4ug+XMTI/YijZP8vIx7Avp3PDRPrkOzRFEeN8lULQgmY5KUdVP6XJPpJSz3h
AbJjO26G8WM1xUcErpULtGg901Vyt5KTigJVBzcNNHY+NDbWfMs=
=xk57
-----END PGP SIGNATURE-----

--Sig_/ch0cKgUjIGd9Bu1D+6w_rjf--

