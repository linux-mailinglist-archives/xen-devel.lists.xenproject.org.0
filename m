Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49F6C1381
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 14:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511921.791365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFfM-0005wL-Bb; Mon, 20 Mar 2023 13:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511921.791365; Mon, 20 Mar 2023 13:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peFfM-0005sy-8e; Mon, 20 Mar 2023 13:35:12 +0000
Received: by outflank-mailman (input) for mailman id 511921;
 Mon, 20 Mar 2023 13:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QRzq=7M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1peFfK-0005sp-SG
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 13:35:10 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08a173b7-c724-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 14:35:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4A8931F85D;
 Mon, 20 Mar 2023 13:35:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 268B213416;
 Mon, 20 Mar 2023 13:35:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xwy1Bw1hGGSCBAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Mar 2023 13:35:09 +0000
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
X-Inumbo-ID: 08a173b7-c724-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679319309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xOdr1zjd9RkWQAsKzeOHd//+vNfzRRAAv6K6hzHu5ak=;
	b=lzv+idS/4NqKXojpm8P29nQrORF6vRVyOTISKcZe1b/tLpV3hQMxmaeTWCtPw7hi0XSm5g
	dHJJOogIVZ8eVuCwYWTrieqQ1kQC+01AVWtXr0kNXlyABsQgV40nJgoql8W/VlIQteZEak
	r2HXrBXj9HPFzCqxJ/YBflB/96loFO8=
Message-ID: <6ec137f7-d4c9-d9b9-eb07-098d48ede3e7@suse.com>
Date: Mon, 20 Mar 2023 14:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>
 <0303d8a7-722f-3c84-042a-1cdb059beee6@suse.com>
 <84b1afc7-26cc-75c8-b9db-1bec4656ff8f@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <84b1afc7-26cc-75c8-b9db-1bec4656ff8f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C43BhrqPc03SSF6JfmozD7P9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C43BhrqPc03SSF6JfmozD7P9
Content-Type: multipart/mixed; boundary="------------AznWfkac3GNKSQlMOv3SdVp0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <6ec137f7-d4c9-d9b9-eb07-098d48ede3e7@suse.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>
 <0303d8a7-722f-3c84-042a-1cdb059beee6@suse.com>
 <84b1afc7-26cc-75c8-b9db-1bec4656ff8f@suse.com>
In-Reply-To: <84b1afc7-26cc-75c8-b9db-1bec4656ff8f@suse.com>

--------------AznWfkac3GNKSQlMOv3SdVp0
Content-Type: multipart/mixed; boundary="------------BlyJ1FWqLaySIv2YJxZemQ9I"

--------------BlyJ1FWqLaySIv2YJxZemQ9I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDMuMjMgMTQ6MTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wMy4yMDIz
IDE0OjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjAuMDMuMjMgMTE6MTksIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE3LjAzLjIwMjMgMTQ6NTYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+ICt2b2lkIF9faW5pdCB4ZW5fcHZfZml4X21pdGlnYXRpb25zKHZv
aWQpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgICAgaWYgKCF4ZW5fdm1fYXNzaXN0X2licGIodHJ1
ZSkpDQo+Pj4+ICsgICAgICAgICAgICAgICBzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9GRUFU
VVJFX0VOVFJZX0lCUEIpOw0KPj4+DQo+Pj4gLi4uIHVzaW5nIGJvdGggc2V0dXBfY2xlYXJf
Y3B1X2NhcCgpIChoZXJlKSBhbmQgc2V0dXBfZm9yY2VfY3B1X2NhcCgpDQo+Pj4gKGluIHJl
dGJsZWVkX3NlbGVjdF9taXRpZ2F0aW9uKCkgd29uJ3Qgd29yazogVGhlIGxhdHRlciB3aW5z
LCBkdWUgdG8NCj4+PiBob3cgYXBwbHlfZm9yY2VkX2NhcHMoKSB3b3Jrcy4NCj4+DQo+PiBP
aCwgcmlnaHQuDQo+Pg0KPj4gSnVzdCBhIHdpbGQgZ3Vlc3Mgb2YgbWluZTogcHJvYmFibHkg
dGhlIHg4NiBtYWludGFpbmVycyB3b3VsZCBzdGlsbCBwcmVmZXINCj4+IGEgc2luZ2xlIFhl
biBob29rIHBsdXMgc29tZXRoaW5nIGxpa2UgYSBzZXR1cF91bmZvcmNlX2NwdV9jYXAoKSBh
ZGRpdGlvbi4NCj4gDQo+IElmIHNvLCBJJ20gbm90IHdpbGxpbmcgdG8gbWFrZSBzdWNoIGEg
cGF0Y2guIFRoYXQncyBjbGVhcmx5IG1vcmUgZnJhZ2lsZQ0KPiB0aGFuIHRoZSBhcHByb2Fj
aCBjaG9zZW4uIEkgZ3Vlc3Mgb25jZSBJJ3ZlIG1hZGUgdGhlIG9uZSBhZGp1c3RtZW50IHlv
dQ0KPiBoYXZlIHBvaW50ZWQgb3V0LCBJJ2xsIHJlc3VibWl0IG90aGVyd2lzZSB1bmNoYW5n
ZWQgYW5kIGluY2x1ZGUgeDg2IGZvbGtzLg0KPiBXZSdsbCBzZWUgd2hhdCB0aGUgcmVzcG9u
c2VzIGFyZSBnb2luZyB0byBiZSwgaWYgYW55IGF0IGFsbC4NCg0KRmluZSB3aXRoIG1lLg0K
DQo+IA0KPj4+IEJ1dCBvZiBjb3Vyc2UgY2FsbGluZyBib3RoIGZ1bmN0aW9ucyBmb3IgdGhl
IHNhbWUgZmVhdHVyZSBpcyBib2d1cw0KPj4+IGFueXdheS4gSW4gZmFjdCBJIHRoaW5rIGl0
IGlzIGZvciBhIGdvb2QgcmVhc29uIHRoYXQgaW4gWGVuIHdlIGxvZyBhDQo+Pj4gbWVzc2Fn
ZSBpbiBzdWNoIGFuIGV2ZW50Lg0KPj4NCj4+IERlcGVuZHMuIEZvciBYZW4gd2UgZG8gc28g
aW4gdGhlIGtlcm5lbCBmb3IgbXVsdGlwbGUgZmVhdHVyZXMsIHNlZQ0KPj4geGVuX2luaXRf
Y2FwYWJpbGl0aWVzKCkuDQo+IA0KPiBJIGRvbid0IHNlZSBhbnl0aGluZyB0aGVyZSB3aGlj
aCBsb29rcyBsaWtlIGl0IG1pZ2h0IGJlIGJvdGggImZvcmNlImQNCj4gYW5kICJjbGVhciJl
ZCBpbiBhIHNpbmdsZSBzZXNzaW9uLg0KDQpPaCwgSSBtaXN1bmRlcnN0b29kIHlvdSB0aGVu
Lg0KDQoNCkp1ZXJnZW4NCg0K
--------------BlyJ1FWqLaySIv2YJxZemQ9I
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BlyJ1FWqLaySIv2YJxZemQ9I--

--------------AznWfkac3GNKSQlMOv3SdVp0--

--------------C43BhrqPc03SSF6JfmozD7P9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQYYQwFAwAAAAAACgkQsN6d1ii/Ey9L
Ewf/US0xbOYjf415q/mkM2CysnhbxraDQCf3z25xW9CbTiOWDbw8SGE3WiTSC2ibr7orjmkRqg0C
2NrWFzDXC83MbQyO83Epbb7OptKk+ztGJEj7eXjQdSVkFJsqr7AEuT5/LbPecxsv+8AP2LPkJ/CR
pgYmo3yEk1BwbX8796r4B7/49xXLlYgnqCZDVsVgQTeuJL4WNUtkJrtzpsZiz1/5zSy6Iscb0FHJ
pWZvqHqzs6kAWN+8wlGqCblpuUEWzHTT8RAwuyoT0lvRjOwUOUdECYV+dTmyEsE+7QTGCI6fJchL
Bh94dSA+vU/74ZrJhQatDoINvC5mZnY+iRpiv7wTxA==
=pv5i
-----END PGP SIGNATURE-----

--------------C43BhrqPc03SSF6JfmozD7P9--

