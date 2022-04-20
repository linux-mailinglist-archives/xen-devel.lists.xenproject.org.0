Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E3A508A1B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309277.525369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB0j-00087m-Cv; Wed, 20 Apr 2022 14:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309277.525369; Wed, 20 Apr 2022 14:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB0j-00085v-9G; Wed, 20 Apr 2022 14:08:49 +0000
Received: by outflank-mailman (input) for mailman id 309277;
 Wed, 20 Apr 2022 14:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhB0h-00085m-F1
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:08:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 647e6e77-c0b3-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 16:08:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B74B31F380;
 Wed, 20 Apr 2022 14:08:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5414A13A30;
 Wed, 20 Apr 2022 14:08:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kfO+Eu0TYGJ/EgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 14:08:45 +0000
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
X-Inumbo-ID: 647e6e77-c0b3-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650463725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XR9S3JAXaAm2nsvkdiVk/cyq5vfM5KURazSwqsS4JaM=;
	b=ZM4RQjYqM7BFEjqYbpiM+OJ6gzIjgUXVAPgcSSP1PAxy8rfa/SHegqTzE4lSIqGI7asp6+
	kEN41K7yOYU60QL/X8u3dp6fNK3GXcucffi60WYis5wCXy+kcAJsQ0K8sUql5/J7g19v5g
	EgftEUoET9E+HPf+XYPvG4ElMAkGql0=
Message-ID: <4d6f2048-e658-8cb0-97a1-34fc4cd43413@suse.com>
Date: Wed, 20 Apr 2022 16:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
 <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
 <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
 <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
 <alpine.DEB.2.22.394.2204121616030.3066615@ubuntu-linux-20-04-desktop>
 <39D59E80-A4B5-4587-9A2A-1D5F06C8C33E@arm.com>
 <13f077b9-6b61-5737-1c94-b17da0fd6ecc@suse.com>
 <AB17024F-15BF-4F43-802B-9F54B76F6348@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <AB17024F-15BF-4F43-802B-9F54B76F6348@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iWut7SOdnUTnzgb1ULH0FCwx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iWut7SOdnUTnzgb1ULH0FCwx
Content-Type: multipart/mixed; boundary="------------PhBnKmc00rN9J3wzgWTZt020";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <4d6f2048-e658-8cb0-97a1-34fc4cd43413@suse.com>
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
 <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
 <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
 <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
 <alpine.DEB.2.22.394.2204121616030.3066615@ubuntu-linux-20-04-desktop>
 <39D59E80-A4B5-4587-9A2A-1D5F06C8C33E@arm.com>
 <13f077b9-6b61-5737-1c94-b17da0fd6ecc@suse.com>
 <AB17024F-15BF-4F43-802B-9F54B76F6348@arm.com>
In-Reply-To: <AB17024F-15BF-4F43-802B-9F54B76F6348@arm.com>

--------------PhBnKmc00rN9J3wzgWTZt020
Content-Type: multipart/mixed; boundary="------------Qj6Zedq0LBnDBg9pqSydHn0K"

--------------Qj6Zedq0LBnDBg9pqSydHn0K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDQuMjIgMTY6MDAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDEzIEFwciAyMDIyLCBhdCAwODoyMiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBPbiAxMy4wNC4yMDIyIDA5OjE1LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4+DQo+Pj4+Pg0KPj4+Pj4gTm8sIEknbSBub3Qgc3VnZ2VzdGluZyBhIG5ldyBt
ZW51LiBJIHdhcyBtZXJlbHkgd29uZGVyaW5nIHdoZXRoZXIgdGhlDQo+Pj4+PiBLY29uZmln
IGNvbnRlbnRzIHdvdWxkbid0IGxvY2F0aW9uLXdpc2UgYmV0dGVyIG1hdGNoIHdoZXJlIHRo
ZQ0KPj4+Pj4gcmVzcGVjdGl2ZSBzb3VyY2UgZmlsZSBsaXZlcy4NCj4+Pj4NCj4+Pj4gSXQg
Y291bGQgYmUgaW4geGVuL2NvbW1vbi9zY2hlZC9LY29uZmlnIGF0IHRoZSBiZWdpbm5pbmcg
b2YgdGhlIGZpbGUNCj4+Pj4gYmVmb3JlIGNyZWF0aW5nIHRoZSBuZXcgIlNjaGVkdWxlcnMi
IG1lbnUsIGUuZy46DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVk
L0tjb25maWcgYi94ZW4vY29tbW9uL3NjaGVkL0tjb25maWcNCj4+Pj4gaW5kZXggM2Q5Zjky
MTRiOC4uZjY1NDVmNGU5YiAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9L
Y29uZmlnDQo+Pj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvS2NvbmZpZw0KPj4+PiBAQCAt
MSwzICsxLDEwIEBADQo+Pj4+ICtjb25maWcgQk9PVF9USU1FX0NQVVBPT0xTDQo+Pj4+ICsg
Ym9vbCAiQ3JlYXRlIGNwdXBvb2xzIGF0IGJvb3QgdGltZSINCj4+Pj4gKyBkZXBlbmRzIG9u
IEhBU19ERVZJQ0VfVFJFRQ0KPj4+PiArIGhlbHANCj4+Pj4gKyBDcmVhdGVzIGNwdXBvb2xz
IGR1cmluZyBib290IHRpbWUgYW5kIGFzc2lnbnMgY3B1cyB0byB0aGVtLiBDcHVwb29scw0K
Pj4+PiArIG9wdGlvbnMgY2FuIGJlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUuDQo+
Pj4+ICsNCj4+Pj4gbWVudSAiU2NoZWR1bGVycyINCj4+Pj4gCXZpc2libGUgaWYgRVhQRVJU
DQo+Pj4+DQo+Pj4+DQo+Pj4+IEkgdGhpbmsgaXQgaXMgZmluZSBlaXRoZXIgd2F5LCBzbzoN
Cj4+Pj4NCj4+Pj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4NCj4+Pg0KPj4+IFRoYW5rIHlvdSBTdGVmYW5vLA0KPj4+DQo+Pj4g
SmFuIGZvciB5b3UgaXMgaXQgb2sgYXQgdGhlIGJlZ2lubmluZyBsaWtlIFN0ZWZhbm8gc2Fp
ZD8NCj4+DQo+PiBQZXJzb25hbGx5IEknZCBwcmVmZXIgaXQgYXQgdGhlIGVuZCAoc3RpbGwg
b3V0c2lkZSB0aGUgbWVudSksIGJ1dA0KPj4gcmVhbGx5IHRoZSBzY2hlZHVsZXIgbWFpbnRh
aW5lcnMgYXJlIGdvaW5nIHRvIGhhdmUgdGhlIGZpbmFsIHNheS4NCj4gDQo+IEhpIGNwdXBv
b2xzIG1haW50YWluZXIsDQo+IA0KPiBJ4oCZbSBnb2luZyB0byBhZGRyZXNzIHRoaXMgZmlu
YWwgY29tbWVudCBhbmQgcmUtcHVzaCB0aGUgc2VyaWUsIGluIG9yZGVyDQo+IHRvIGF2b2lk
IGZ1cnRoZXIgbm9pc2UsIHdvdWxkIHlvdSBtaW5kIHRvIGdpdmUgbWUgYSBmZWVkYmFjayBv
biB0aGF0Pw0KPiANCj4gV2hhdCBpcyB5b3VyIHByZWZlcmVuY2UgZm9yIHRoZSBLY29uZmln
IHBhcmFtZXRlciBwbGFjZW1lbnQsIGJlZ2lubmluZw0KPiBvZiB0aGUgZmlsZSBvciBlbmQ/
DQoNCkknZCBwdXQgaXQgYXQgdGhlIGVuZCwgYXMgdGhlIHNjaGVkdWxlciBzZWxlY3Rpb24g
aXMgZ2VuZXJhbGx5IG9mIG1vcmUNCmludGVyZXN0IElNSE8uDQoNCg0KSnVlcmdlbg0K
--------------Qj6Zedq0LBnDBg9pqSydHn0K
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Qj6Zedq0LBnDBg9pqSydHn0K--

--------------PhBnKmc00rN9J3wzgWTZt020--

--------------iWut7SOdnUTnzgb1ULH0FCwx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJgE+wFAwAAAAAACgkQsN6d1ii/Ey/u
vwf/S9sWqkevwVNA9MurdCRVKU3jzq3Q73AdBWnaOVrdb6Xjzn4G/FTfB+xY5hmIYPXHPykWQUD9
txv4TKwzE+gNdxUtb3MgoYL0dcaentocJVS0IquYCrj2ZZ2ri/CZEzZPOoGL9mThNf9vf9zN28Wc
WyhSbYVbDw4o0bNRD5wmb7x8OeWVhMzsASTVilPOwtGc/yR9Mnc0iOiA8Z5LRIYwOpWPykaipIZa
zT+jT1bf5gj9jcbdSWgTYpmWbwtKyTh/QBgE/lZ9jTW67T5rfqvWAz6ilqetxrfuGSj5wqjUK8qj
Hb0YY5G/bF1nxJvqEir2QAvkK5UvnVPqD0S8K/7xDw==
=/Rzz
-----END PGP SIGNATURE-----

--------------iWut7SOdnUTnzgb1ULH0FCwx--

