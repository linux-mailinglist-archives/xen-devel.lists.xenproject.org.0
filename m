Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184E624684
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 17:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441977.696011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otA13-0001z7-Rc; Thu, 10 Nov 2022 16:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441977.696011; Thu, 10 Nov 2022 16:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otA13-0001xJ-OY; Thu, 10 Nov 2022 16:02:57 +0000
Received: by outflank-mailman (input) for mailman id 441977;
 Thu, 10 Nov 2022 16:02:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1otA11-0001x9-Hf
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 16:02:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208ce74d-6111-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 17:02:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF7531FDF1;
 Thu, 10 Nov 2022 16:02:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 993EA1332F;
 Thu, 10 Nov 2022 16:02:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rv/9I60gbWNcWwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Nov 2022 16:02:53 +0000
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
X-Inumbo-ID: 208ce74d-6111-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668096173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EH1RsOGCFqO3Gwh5C+rmGdbYlC05tU3LBQpJ6dmL0Ck=;
	b=k+kePPyF/ssAgAJupcwAl+3aekx6Drn+6VGHnS94pEU+tr80YXMUP4c5kWG1rah0O1pfPS
	4rJGl8G+wlqz4hB2+hvbR6M55aziSEvXyJJDfHHBukTnJm1P55GZ0TFSQD20OgShDa7mU6
	vYuYj90zbFrYiJgSHTKKHrnJR9hHdqE=
Message-ID: <71bf1069-88d3-a9dd-157f-90ecb37ad9a1@suse.com>
Date: Thu, 10 Nov 2022 17:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] xen/pcpu: fix possible memory leak in register_pcpu()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com
References: <20221110152441.401630-1-yangyingliang@huawei.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221110152441.401630-1-yangyingliang@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6fkCioUGQkjyRoZzh4hlkvgS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6fkCioUGQkjyRoZzh4hlkvgS
Content-Type: multipart/mixed; boundary="------------gEimVDGntJGH0oqgfWUQE39h";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Yang Yingliang <yangyingliang@huawei.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com
Message-ID: <71bf1069-88d3-a9dd-157f-90ecb37ad9a1@suse.com>
Subject: Re: [PATCH] xen/pcpu: fix possible memory leak in register_pcpu()
References: <20221110152441.401630-1-yangyingliang@huawei.com>
In-Reply-To: <20221110152441.401630-1-yangyingliang@huawei.com>

--------------gEimVDGntJGH0oqgfWUQE39h
Content-Type: multipart/mixed; boundary="------------cm09FzvPvSXkufkIg2tBLfP6"

--------------cm09FzvPvSXkufkIg2tBLfP6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjIgMTY6MjQsIFlhbmcgWWluZ2xpYW5nIHdyb3RlOg0KPiBJbiBkZXZpY2Vf
YWRkKCksIGRldl9zZXRfbmFtZSgpIGlzIGNhbGxlZCB0byBhbGxvY2F0ZSBuYW1lLCBpZiBp
dCByZXR1cm5zDQo+IGVycm9yLCB0aGUgbmFtZSBuZWVkIGJlIGZyZWVkLiBBcyBjb21tZW50
IG9mIGRldmljZV9yZWdpc3RlcigpIHNheXMsIGl0DQo+IHNob3VsZCB1c2UgcHV0X2Rldmlj
ZSgpIHRvIGdpdmUgdXAgdGhlIHJlZmVyZW5jZSBpbiB0aGUgZXJyb3IgcGF0aC4gU28gZml4
DQo+IHRoaXMgYnkgY2FsbGluZyBwdXRfZGV2aWNlKCksIHRoZW4gdGhlIG5hbWUgY2FuIGJl
IGZyZWVkIGluIGtvYmplY3RfY2xlYW51cCgpLg0KPiANCj4gRml4ZXM6IGY2NWM5YmIzZmI3
MiAoInhlbi9wY3B1OiBYZW4gcGh5c2ljYWwgY3B1cyBvbmxpbmUvb2ZmbGluZSBzeXMgaW50
ZXJmYWNlIikNCj4gU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlh
bmdAaHVhd2VpLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------cm09FzvPvSXkufkIg2tBLfP6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------cm09FzvPvSXkufkIg2tBLfP6--

--------------gEimVDGntJGH0oqgfWUQE39h--

--------------6fkCioUGQkjyRoZzh4hlkvgS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNtIK0FAwAAAAAACgkQsN6d1ii/Ey+t
ZAf/akaqdY1YnXDgKrQLwNexTKEkJqzBovalU4VbjlpzcDw+w4GTVD1Bj+qmr7EBUbMlrPA6ITt2
5ehRyxJtP6789lzTLeDNnfGdroouOpJjwS0ME6df2gMZNWPAP/00BVSKICsxG7z3ay4S2eNdZMuu
XcZ4LTpFKlYNYuqyeVA8mHzbFcwwrn2i+mJPFi9vL935O5/HfhoIaF7YBm1PycLeDpIoaD03REl4
53UKskZCWqkTBMzjDNDJvUq1izUiSs1IAMdT6linJmYPyVDHeo43Xn066fIl2/kRvRCICDpr8E8o
6Qrvu7VkizAZYwFXZXlOFrcclcZtzUJDaHTLL9aadA==
=Kzys
-----END PGP SIGNATURE-----

--------------6fkCioUGQkjyRoZzh4hlkvgS--

