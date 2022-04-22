Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C350BADD
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 16:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311042.528026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhuhD-0002hR-SJ; Fri, 22 Apr 2022 14:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311042.528026; Fri, 22 Apr 2022 14:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhuhD-0002fF-Or; Fri, 22 Apr 2022 14:55:43 +0000
Received: by outflank-mailman (input) for mailman id 311042;
 Fri, 22 Apr 2022 14:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aXhv=VA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhuhC-0002et-EB
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 14:55:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4762da50-c24c-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 16:55:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 079FA1F388;
 Fri, 22 Apr 2022 14:55:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA75D13AE1;
 Fri, 22 Apr 2022 14:55:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rlskNOzBYmLQEQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Apr 2022 14:55:40 +0000
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
X-Inumbo-ID: 4762da50-c24c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650639341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxaMZ0DFNUnG/GvA3+xXEC79r2XUD+QrpwgwSqDbDnM=;
	b=bL0V9mlszGb0kf6zY3oAsaVLBl0T9pEjzELKCg1ppZoU+AO/mV0DIFEIVXBELm1xKo5Zap
	GPt+LDJLoeqLDD/cuAWRypt4AYtp2v9GRCRfM/ZycHHj6QjAt7BmwUngtG3NFPZ//9VOOe
	u8tcoLe9WPbXYfDmH41qACOqV10A4xs=
Message-ID: <f70f7746-2e9d-3418-d198-aa42cb58c9ad@suse.com>
Date: Fri, 22 Apr 2022 16:55:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] tools/libs/light: don't set errno to a negative value
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <20220420073119.16974-1-jgross@suse.com>
 <20220420073119.16974-5-jgross@suse.com>
 <f2d73d68-b313-0f5b-7a42-ad6bef7f5620@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f2d73d68-b313-0f5b-7a42-ad6bef7f5620@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bKH9gZZsE5VtHK3Y23Vmauqh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bKH9gZZsE5VtHK3Y23Vmauqh
Content-Type: multipart/mixed; boundary="------------XgMDZMCPHAzuIT0J0akbSoNi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Message-ID: <f70f7746-2e9d-3418-d198-aa42cb58c9ad@suse.com>
Subject: Re: [PATCH 4/4] tools/libs/light: don't set errno to a negative value
References: <20220420073119.16974-1-jgross@suse.com>
 <20220420073119.16974-5-jgross@suse.com>
 <f2d73d68-b313-0f5b-7a42-ad6bef7f5620@citrix.com>
In-Reply-To: <f2d73d68-b313-0f5b-7a42-ad6bef7f5620@citrix.com>

--------------XgMDZMCPHAzuIT0J0akbSoNi
Content-Type: multipart/mixed; boundary="------------vkYKFRQNVKPK0o3YlbnbvhSy"

--------------vkYKFRQNVKPK0o3YlbnbvhSy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjIgMTY6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDIwLzA0LzIw
MjIgMDg6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBTZXR0aW5nIGVycm5vIHRvIGEg
bmVnYXRpdmUgdmFsdWUgbWFrZXMgbm8gc2Vuc2UuDQo+IA0KPiBGaXhlczogZTc4ZThiOWJi
NjQ5Yg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KDQpEbyB5b3Ugd2FudCBtZSB0byBzZW5kIHRoZSBwYXRjaGVzIHdpdGgg
dGhlIEZpeGVzIHRhZ3MgYWRkZWQ/DQoNClRCSCBJIGRpZG4ndCBib3RoZXIgdG8gZG8gdGhl
IHJlc2VhcmNoIGZvciB0aG9zZSwgYXMgdGhlIHdyb25nIHZhbHVlcw0KZG9uJ3Qgc2VlbSB0
byBjYXVzZSBhbnkgaGFybSB0b2RheS4gSSBqdXN0IHN0dW1ibGVkIG92ZXIgdGhlIGlzc3Vl
cw0KYW5kIHRob3VnaHQgaXQgd291bGQgYmUgYSBnb29kIGlkZWEgdG8gZml4IHRob3NlLg0K
DQoNCkp1ZXJnZW4NCg==
--------------vkYKFRQNVKPK0o3YlbnbvhSy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vkYKFRQNVKPK0o3YlbnbvhSy--

--------------XgMDZMCPHAzuIT0J0akbSoNi--

--------------bKH9gZZsE5VtHK3Y23Vmauqh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJiwewFAwAAAAAACgkQsN6d1ii/Ey9F
ZAf/QmvI+5M8Hy1ORM5DCEN8xJ1WU4nRKf1kirJLBHTBujrxk+iQJ7rt/PXlyR1GA5HsTMcVJc5d
ZC/fWDeXEqWMy7QDp4Y2GvsiGHS0IU8JzqW1lN/234VcAuNS9nHBC6ffqOwMICGh8Q3e/pEWkLkB
TaqCn2VqH8BIn2XS0BnDvS8Pzn3BXvW0eQsKw5uNftpXj1sgCulVre2qt454sXpArUUDBj+fLVet
Zr5dvcpfPvrMrktwVtM8/jm5Ox19zkU+Gs/NE7BgLbN7JICrBLVwmJXYXkTMNFE7mqrQ/M9+kC41
Ul5RfU61ackTlhy9TwwkO+9ICWAycPPgEd6RuWdnKg==
=C3mi
-----END PGP SIGNATURE-----

--------------bKH9gZZsE5VtHK3Y23Vmauqh--

