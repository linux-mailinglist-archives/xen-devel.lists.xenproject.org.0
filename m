Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B16ED04E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525441.816641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqx9r-00022T-Uh; Mon, 24 Apr 2023 14:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525441.816641; Mon, 24 Apr 2023 14:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqx9r-00020K-Rb; Mon, 24 Apr 2023 14:27:11 +0000
Received: by outflank-mailman (input) for mailman id 525441;
 Mon, 24 Apr 2023 14:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ydgZ=AP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pqx9q-00020E-Br
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:27:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 186166c6-e2ac-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 16:27:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8D6E1FD87;
 Mon, 24 Apr 2023 14:27:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7601C1390E;
 Mon, 24 Apr 2023 14:27:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m4J+G7yRRmR9PwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 24 Apr 2023 14:27:08 +0000
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
X-Inumbo-ID: 186166c6-e2ac-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682346428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v755W+aGz+A0y0POsF4k2I5EYZ+j3vq34CdnqNBgV4g=;
	b=mi7P5vOCp/NNOa0HcdX+42Rp8g8vgzMZwYbMawC0iyewTjNyXe7MOtkebc/NIeEtoSNqg8
	BUNzQuUpAOiB3EwufsCZck1qgpUMUeOc5keNBHni38PCFqp/MiesGWmK60V3HmfhwbchA+
	5xgN9DimJgkcLwZGwu5vyEYXDwK3UFc=
Message-ID: <9e97bf0b-0a98-38ea-9705-1277175e50fc@suse.com>
Date: Mon, 24 Apr 2023 16:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] xen: add support for crash dump analysis with xen.efi
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230421135933.23353-1-jgross@suse.com>
 <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>
 <e3a900e6-ef5e-9ac2-19fc-c276dc31c487@suse.com>
 <2f20d5c0-d21f-ad1d-290c-631230e1f323@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <2f20d5c0-d21f-ad1d-290c-631230e1f323@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I3nE0VjNruNiKltxviS0voWI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I3nE0VjNruNiKltxviS0voWI
Content-Type: multipart/mixed; boundary="------------pdkI3UMFwU5x0mVfPq1dFgWA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <9e97bf0b-0a98-38ea-9705-1277175e50fc@suse.com>
Subject: Re: [PATCH] xen: add support for crash dump analysis with xen.efi
References: <20230421135933.23353-1-jgross@suse.com>
 <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>
 <e3a900e6-ef5e-9ac2-19fc-c276dc31c487@suse.com>
 <2f20d5c0-d21f-ad1d-290c-631230e1f323@suse.com>
In-Reply-To: <2f20d5c0-d21f-ad1d-290c-631230e1f323@suse.com>

--------------pdkI3UMFwU5x0mVfPq1dFgWA
Content-Type: multipart/mixed; boundary="------------t1LjkSM0rpaQ5DtANubeIHNd"

--------------t1LjkSM0rpaQ5DtANubeIHNd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDQuMjMgMTY6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wNC4yMDIz
IDE1OjQ0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjQuMDQuMjMgMTQ6MDEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IEZpbmFsbHkgLSBkbyB5b3UgcmVhbGx5IG5lZWQgdG8g
Y29weSBhbGwgdGhlIG5vbi1kZWJ1ZyBzZWN0aW9ucyBhcyB3ZWxsPw0KPj4+IE1pZ2h0IC0t
b25seS1rZWVwLWRlYnVnIGJlIGhlbHBmdWwgaGVyZSAocHJvdmlkZWQgaXQgd29ya3MgZm9y
IGEgUEUvQ09GRg0KPj4+IC0+IEVMRiBjb3B5IG9wZXJhdGlvbjsgaXQgbG9va3MgdG8gZG8g
c28gaW4gbXkgc2ltcGxlIGV4cGVyaW1lbnRzKT8NCj4+DQo+PiBObywgZG9lc24ndCB3b3Jr
IChvYmpjb3B5IGRvZXMsIGJ1dCBub3QgY3Jhc2ggd2l0aCB0aGF0IGZpbGUpOg0KPj4NCj4+
ICAgICBjcmFzaDogeGVuLmVmaS5lbGY6IG5vIHRleHQgYW5kIGRhdGEgY29udGVudHMNCj4g
DQo+IE9oLCB3b3cuIFdoYXQgdXNlIGRvIHRoZXkgaGF2ZSBmb3IgdGhlIC50ZXh0IC8gLmRh
dGEgY29udGVudHM/IEkgdmVyeSBtdWNoDQo+IGhvcGUgdGhleSB1c2UgdGhlIGluLW1lbW9y
eSBYZW4gaW1hZ2UgZm9yIGFuYWx5c2lzLCBub3Qgd2hhdCB0aGV5IG1heSByZWFkDQo+IG91
dCBvZiB0aGUgaW1hZ2UuDQoNCkkgdGhpbmsgY3Jhc2ggaXMgZmluZSBpbiB0aGlzIHJlZ2Fy
ZC4gQXQgbGVhc3QgX19zdGFydF94ZW4oKSBzZWVtcyB0byBiZSBhbGwNCnplcm9lcyBpbiBt
eSB0ZXN0IGR1bXAsIHdoaWNoIGlzIGZpbmUgZm9yIGFuIC5pbml0IGZ1bmN0aW9uIGFmdGVy
IHRoZSBzeXN0ZW0NCmlzIHVwIGFuZCBydW5uaW5nLiA6LSkNCg0KPiBJbiBhbnkgZXZlbnQs
IHBsZWFzZSBhZGQgaGFsZiBhIHNlbnRlbmNlIHRvIHRoZSBkZXNjcmlwdGlvbiB0byBtZW50
aW9uDQo+IHRoaXMgYXNwZWN0Lg0KDQpPa2F5Lg0KDQoNCkp1ZXJnZW4NCg==
--------------t1LjkSM0rpaQ5DtANubeIHNd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------t1LjkSM0rpaQ5DtANubeIHNd--

--------------pdkI3UMFwU5x0mVfPq1dFgWA--

--------------I3nE0VjNruNiKltxviS0voWI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRGkbwFAwAAAAAACgkQsN6d1ii/Ey94
VQf7BZz3jQmxalMLJUhqF8PUGoZaWQ53j5GBn0j/ATpdYRLbNwBtlOp2cB5BiINhoo4QvXyQ1P6X
jcd/iqNufSdQxrr7armOmuN0fPXT+slqB8Kk4cCONrqskKmw29DIY6By8Y2gPa+a1AusThvfo7WU
IT7c0bhmn6ELFa6/FL6bcSWlqU3ND5V17A4gYyCrOF6fHhNGLLLJhS6NUZ9UIfseAQ5XtZVIs7UR
WgUPohbq9vBDJBOUzcpA7aZLxRUU8XP63gJ73wbCuevjAEljRGB8dO3kUPko0Y0+2/mWIaC7o2vs
Bgz7HXotj47GK4szbd1tfe+i4LkDof0SeaDGKrNdEg==
=+DEV
-----END PGP SIGNATURE-----

--------------I3nE0VjNruNiKltxviS0voWI--

