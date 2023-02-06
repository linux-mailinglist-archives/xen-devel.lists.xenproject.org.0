Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9468C1B5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 16:35:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490564.759324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP3WT-0005Ct-6X; Mon, 06 Feb 2023 15:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490564.759324; Mon, 06 Feb 2023 15:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP3WT-00059x-2R; Mon, 06 Feb 2023 15:35:13 +0000
Received: by outflank-mailman (input) for mailman id 490564;
 Mon, 06 Feb 2023 15:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pP3WR-00052w-HN
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 15:35:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d59f522e-a633-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 16:35:07 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BA766061F;
 Mon,  6 Feb 2023 15:35:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 268BC138E8;
 Mon,  6 Feb 2023 15:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5Hj2Byse4WM8bwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Feb 2023 15:35:07 +0000
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
X-Inumbo-ID: d59f522e-a633-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1675697707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dGfLuu/ZorhBxx/TbawrsNpt8CBswzePx7SV5hJpPYk=;
	b=LpQaXqH6HGS2wE18v9f6oDK3Q08Rifxy1U4VpHy4gP0CQRErkmMpUPkzOf2EG+0OtKYOyQ
	Ov3fzfofnQGiPMgt5ggaUTJ0PnBz8NGAHafl7MEmhArE0dUvhKqr6GJf5PSw/LVRmDn9HW
	O/iI6+G8FDyyY57xu3AvYHwvtqb9UEU=
Message-ID: <2fcd7ba4-a388-ad28-64aa-a599882b4f9f@suse.com>
Date: Mon, 6 Feb 2023 16:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 7/7] Mini-OS: add read and write support to 9pfsfront
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-8-jgross@suse.com>
 <20230206101341.5l7cxb2vvregskrx@begin>
 <77d6d486-5ad5-1f13-e223-79295707d090@suse.com>
 <20230206120526.242njyptovkpz3jl@begin>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230206120526.242njyptovkpz3jl@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------E0OOKWO0NiPn66yq2q0cE1v0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------E0OOKWO0NiPn66yq2q0cE1v0
Content-Type: multipart/mixed; boundary="------------ofXfWL0jC02OPXYzfjya7tIT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <2fcd7ba4-a388-ad28-64aa-a599882b4f9f@suse.com>
Subject: Re: [PATCH 7/7] Mini-OS: add read and write support to 9pfsfront
References: <20230203091809.14478-1-jgross@suse.com>
 <20230203091809.14478-8-jgross@suse.com>
 <20230206101341.5l7cxb2vvregskrx@begin>
 <77d6d486-5ad5-1f13-e223-79295707d090@suse.com>
 <20230206120526.242njyptovkpz3jl@begin>
In-Reply-To: <20230206120526.242njyptovkpz3jl@begin>

--------------ofXfWL0jC02OPXYzfjya7tIT
Content-Type: multipart/mixed; boundary="------------CX9llXcnU2Kt063y0y38DmiH"

--------------CX9llXcnU2Kt063y0y38DmiH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDIuMjMgMTM6MDUsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSnVlcmdlbiBH
cm9zcywgbGUgbHVuLiAwNiBmw6l2ci4gMjAyMyAxMToxNzoyNyArMDEwMCwgYSBlY3JpdDoN
Cj4+IE9uIDA2LjAyLjIzIDExOjEzLCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6DQo+Pj4NCj4+
PiBKdWVyZ2VuIEdyb3NzLCBsZSB2ZW4uIDAzIGbDqXZyLiAyMDIzIDEwOjE4OjA5ICswMTAw
LCBhIGVjcml0Og0KPj4+PiBUaGlzIHBhdGNoIGlzIG1pc3NpbmcgdGhlIGxpbWl0YXRpb24g
b2YgcmVhZC93cml0ZSBtZXNzYWdlcyB0byBzdGF5DQo+Pj4+IGJlbG93IHRoZSBtYXguIHN1
cHBvcnRlZCBtZXNzYWdlIHNpemUuDQo+Pj4NCj4+PiBJdCBzaG91bGQgYXQgbGVhc3QgYmUg
YXNzZXJ0ZWQuDQo+Pg0KPj4gSXQgY2FuIGVhc2lseSBiZSBsaW1pdGVkIGJ5IHJldHVybmlu
ZyB0aGUgcmVzdWx0aW5nIGxpbWl0IGFzIHRoZQ0KPj4gbnVtYmVyIG9mIHByb2Nlc3NlZCBi
eXRlcy4NCj4gDQo+IFN0cmljdGx5IHNwZWFraW5nLCBwb3NpeCBhbGxvd3MgdG8gcmV0dXJu
IHNob3J0IHJlYWRzLCBidXQgdGhhdCdzDQo+IHVzdWFsbHkgb25seSBoYW5kbGVkIGJ5IGFw
cGxpY2F0aW9ucyB3aGVuIHRoZXkga25vdyB0aGF0IHRoZXkgbWF5IGdldA0KPiBzaWduYWxz
LiBJJ2QgdGh1cyByYXRoZXIgaGF2ZSByZWFkL3dyaXRlIGxvb3Agb3ZlciB0aGUgc2l6ZS4N
Cg0KT2theS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------CX9llXcnU2Kt063y0y38DmiH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CX9llXcnU2Kt063y0y38DmiH--

--------------ofXfWL0jC02OPXYzfjya7tIT--

--------------E0OOKWO0NiPn66yq2q0cE1v0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPhHioFAwAAAAAACgkQsN6d1ii/Ey+7
owf/d8FYHsMx6HjK3fQ8JrLkXyYI9TyLRZIblaiBFpLVZEo0mpRJmwiNcNMSAjRR+ODYOwHe1zCy
4S1lwOoFOwkiIAC5Ss8YaeYRCuMmGlcINb3mUeidrarWGAHdX98d7Q2cK87rH3Kmy9y8twcTAtV5
HY7C1YYCGRsCs+aXTqqZNDYpLtonTGQsAHda0nejAahQRGAE1szmObVqKXejgEYKmAZofabRthtK
E6qaPgE/F5amqiUxLTpDiwQBODLWGubtiN/XbSZiPNyLDQ4UBkcMUztZA1KLnKo3pxTnlu2jDbvp
Fw3Twpvwvsxj4jpCgXAQIX6O0tvd055B+FBOa7kDPA==
=T4vE
-----END PGP SIGNATURE-----

--------------E0OOKWO0NiPn66yq2q0cE1v0--

