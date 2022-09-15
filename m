Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB95B948D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 08:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407238.649667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYiZf-0007wH-7R; Thu, 15 Sep 2022 06:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407238.649667; Thu, 15 Sep 2022 06:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYiZf-0007tp-4d; Thu, 15 Sep 2022 06:42:11 +0000
Received: by outflank-mailman (input) for mailman id 407238;
 Thu, 15 Sep 2022 06:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oYiZd-0007tj-S3
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 06:42:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8494adfc-34c1-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 08:42:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D6D433A2F;
 Thu, 15 Sep 2022 06:42:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB2B4139C8;
 Thu, 15 Sep 2022 06:42:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKAKND7JImM0TwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 15 Sep 2022 06:42:06 +0000
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
X-Inumbo-ID: 8494adfc-34c1-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663224127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3JmMwmLBDnkQ/gcVGLee+wpTgqcAwml++vmuBq3SbLU=;
	b=XJnrKUMqDmLHaZt88Zy7UYg+2RKfxPTXIRdgRJ35bQsMZIhfOvkeWQxxvVYZ/eChH3TFeO
	wOM5/Dqmb3wrPsC0nn5pwCSU5yj8V7FqpEeTb7xxjGmro0oku9tebw5bkdx9gBxLAt3MTs
	iQ0u+8s5IxyR+S0L8NpA/PnzIHEeeSY=
Message-ID: <fca322ea-6823-1a7a-213a-73e7dfbea830@suse.com>
Date: Thu, 15 Sep 2022 08:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
 "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
 "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
 <3c1eccfe-3ca5-32d8-ee5a-cf8e7b23d587@suse.com>
 <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------biiJqnzPU0CXD6IblapDZIG4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------biiJqnzPU0CXD6IblapDZIG4
Content-Type: multipart/mixed; boundary="------------0jp0HFcCgn7FobYyXJ0iQLnN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
 "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
 "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>
Message-ID: <fca322ea-6823-1a7a-213a-73e7dfbea830@suse.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
 <3c1eccfe-3ca5-32d8-ee5a-cf8e7b23d587@suse.com>
 <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop>

--------------0jp0HFcCgn7FobYyXJ0iQLnN
Content-Type: multipart/mixed; boundary="------------9HddmWv73H5VvPv3wXJmBu6Z"

--------------9HddmWv73H5VvPv3wXJmBu6Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDkuMjIgMDM6MTgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gV2Vk
LCAxNCBTZXAgMjAyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNC4wOS4yMDIyIDAx
OjMxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gVGhlIHByb2JsZW0gaXMgdGhh
dCBkcml2ZXJzL3hlbi9wcml2Y21kLmM6cHJpdmNtZF9tbWFwIHNldHMgVk1fSU8gfA0KPj4+
IFZNX1BGTk1BUCwgYW5kIGVpdGhlciBmbGFnIHdvdWxkIGNhdXNlIGNoZWNrX3ZtYV9mbGFn
cyB0byByZXR1cm4NCj4+PiAtRUZBVUxULg0KPj4+DQo+Pj4gRG8geW91IGtub3cgaWYgaXQg
d29ya3MgaWYgeW91IHJlbW92ZSBWTV9JTyB8IFZNX1BGTk1BUCBmcm9tDQo+Pj4gcHJpdmNt
ZF9tbWFwPw0KPj4NCj4+IE15IExpbnV4IE1NIGtub3dsZWRnZSBpcyBjZXJ0YWlubHkgcnVz
dHksIGJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgY2FuDQo+PiB3b3JrLCBhdCB0aGUgdmVyeSBs
ZWFzdCBub3Qgd2l0aG91dCBmdXJ0aGVyIGNoYW5nZXMgZWxzZXdoZXJlLg0KPiANCj4gVGhl
IGRlZmluaXRpb24gb2YgVk1fUEZOTUFQIGlzOg0KPiANCj4gICAgICBQYWdlLXJhbmdlcyBt
YW5hZ2VkIHdpdGhvdXQgInN0cnVjdCBwYWdlIiwganVzdCBwdXJlIFBGTg0KPiANCj4gU28g
aXQgbWFkZSBwZXJmZWN0IHNlbnNlIHRvIHVzZSBWTV9QRk5NQVAgYmFjayBpbiB0aGUgZGF5
IHdoZW4gd2Ugd2VyZQ0KPiB1c2luZyBhZGRyZXNzIHJhbmdlcyB3aXRob3V0ICJzdHJ1Y3Qg
cGFnZSIgZm9yIGZvcmVpZ24gbWFwcGluZ3MuDQo+IA0KPiANCj4gSG93ZXZlciwgbm93YWRh
eXMgTGludXggZHJpdmVycyB0eXBpY2FsbHkgY2FsbA0KPiB4ZW5fYWxsb2NfdW5wb3B1bGF0
ZWRfcGFnZXMgdG8gZ2V0IGxvY2FsIHBhZ2VzIHRvIGJlIHVzZWQgZm9yIGZvcmVpZ24NCj4g
bWFwcGluZ3MuIHhlbl9hbGxvY191bnBvcHVsYXRlZF9wYWdlcyBzaG91bGQgd29yayBmb3Ig
Ym90aCBQViBhbmQNCj4gYXV0b3RyYW5zbGF0ZWQgZ3Vlc3RzLiBTbyB0aGUgbG9jYWwgcGFn
ZXMgc2hvdWxkIGhhdmUgYSByZWd1bGFyICJzdHJ1Y3QNCj4gcGFnZSIgYmFja2luZyB0aGVt
Lg0KDQpJIGFncmVlIHRoYXQgYSBzdHJ1Y3QgcGFnZSBpcyBhc3NvY2lhdGVkIHdpdGggc3Vj
aCBQRk5zLg0KDQpJJ20gbm90IHN1cmUgdGhlcmUgYXJlIG5vIG90aGVyIGltcGxpY2l0IGRl
cGVuZGVuY2llcyBpbiBvdXIgZHJpdmVycyByZWx5aW5nDQpvbiBWTV9QRk5NQVAgYW5kL29y
IFZNX0lPIGJlaW5nIHNldC4NCg0KVGhpcyB3b3VsZCBuZWVkIHJlYWxseSBpbnRlbnNpdmUg
dGVzdGluZyBmb3IgdmVyaWZpY2F0aW9uLg0KDQo+IEkgbm90aWNlZCB0aGF0IHByaXZjbWQg
Y2FsbHMNCj4gYWxsb2NfZW1wdHlfcGFnZXMtPnhlbl9hbGxvY191bnBvcHVsYXRlZF9wYWdl
cyBvbmx5IGZvciBhdXRvdHJhbnNsYXRlZA0KPiBndWVzdHMuIERvIHlvdSBndXlzIHRoaW5r
IGl0IGlzIGludGVudGlvbmFsPyBJbiB0aGVvcnksDQo+IHhlbl9hbGxvY191bnBvcHVsYXRl
ZF9wYWdlcyBzaG91bGQgd29yayBmb3IgUFYgZ3Vlc3RzIHRvby4NCg0KSSBhZ3JlZSB0aGF0
IGl0IHNob3VsZCB3b3JrLCBidXQgaXQgaXNuJ3QgbmVlZGVkLg0KDQo+IEFmdGVyIHRoYXQs
IHByaXZjbWQgY2FsbHMgeGVuX3JlbWFwX2RvbWFpbl9nZm5fYXJyYXksIHdoaWNoIGNhbGxz
DQo+IHhlbl94bGF0ZV9yZW1hcF9nZm5fYXJyYXkgb3IgeGVuX3JlbWFwX3BmbiBkZXBlbmRp
bmcgb24NCj4gUFYgb3IgYXV0b3RyYW5zbGF0ZWQuDQo+IA0KPiBCdXQgdGhlbiBJIGNhbiBz
ZWUgdGhlIGZvbGxvd2luZyBhdCB0aGUgdG9wIG9mIHhsYXRlX3JlbWFwX2dmbl9hcnJheToN
Cj4gDQo+IAkvKiBLZXB0IGhlcmUgZm9yIHRoZSBwdXJwb3NlIG9mIG1ha2luZyBzdXJlIGNv
ZGUgZG9lc24ndCBicmVhaw0KPiAJICAgeDg2IFBWT1BTICovDQo+IAlCVUdfT04oISgodm1h
LT52bV9mbGFncyAmIChWTV9QRk5NQVAgfCBWTV9JTykpID09IChWTV9QRk5NQVAgfCBWTV9J
TykpKTsNCj4gDQo+IGFuZCBhIHNpbWlsYXIgb25lIGluIGFyY2gveDg2L3hlbi9tbXVfcHYu
Yzp4ZW5fcmVtYXBfcGZuOg0KPiANCj4gCUJVR19PTighKCh2bWEtPnZtX2ZsYWdzICYgKFZN
X1BGTk1BUCB8IFZNX0lPKSkgPT0gKFZNX1BGTk1BUCB8IFZNX0lPKSkpOw0KPiANCj4gDQo+
IEdpdmVuIHRoYXQgdGhlIHBhZ2VzIHBhc3NlZCB0byB4ZW5feGxhdGVfcmVtYXBfZ2ZuX2Fy
cmF5IGFuZA0KPiB4ZW5fcmVtYXBfcGZuIGNvdWxkIGhhdmUgYmVlbiBhbGxvY2F0ZWQgd2l0
aA0KPiB4ZW5fYWxsb2NfdW5wb3B1bGF0ZWRfcGFnZXMsIHdoeSB0aGUgQlVHX09OPw0KPiAN
Cj4gSXMgdGhpcyBqdXN0IGxlZ2FjeT8gSW4gdGhlIHNlbnNlIHRoYXQgdGhlIGZvbGxvd2lu
ZyBjb3VsZCB3b3JrPw0KPiANCj4gLSBwcml2Y21kIGNhbGxzIHhlbl9hbGxvY191bnBvcHVs
YXRlZF9wYWdlcyBmb3IgYm90aCBQViAmIGF1dG90cmFuc2xhdGVkDQoNClRoaXMgd291bGQg
YWRkIHNvbWUgcGVyZm9ybWFuY2UgcGVuYWx0eSBmb3IgUFYgY29tcGFyZWQgdG8gdG9kYXku
DQoNCj4gLSBubyBzZXR0aW5nIFZNX1BGTk1BUCB8IFZNX0lPDQoNClRoaXMgd291bGQgbmVl
ZCBzb21lIHZlcnkgdGhvcm91Z2ggdGVzdGluZyBmb3Igbm90IGJyZWFraW5nIGFueSBQViBk
ZXZpY2UuDQpUaGVyZSBhcmUgZXZlbiBtb3JlIGltcGxpY2F0aW9ucywgYXMgZS5nLiB0aGUg
a2VybmVsJ3MgbWVtb3J5IG1hbmFnZW1lbnQNCm1pZ2h0IGludGVyZmVyZSBpbiBleHRyZW1l
IHNpdHVhdGlvbnMgbGlrZSBtZW1vcnkgc2hvcnRhZ2Ugb3IgcGFnZSBtaWdyYXRpb24NCndp
dGggcGFnZXMgbm90IGhhdmluZyBzZXQgdGhlIGZsYWdzIChJIG1pZ2h0IGJlIHdyb25nIGhl
cmUsIGJ1dCBiZXR0ZXIgc2FmZQ0KdGhhbiBzb3JyeSkuDQoNCj4gLSBubyBCVUdfT04gaW4g
eGxhdGVfcmVtYXBfZ2ZuX2FycmF5DQo+IC0gbm8gQlVHX09OIGluIHhlbl9yZW1hcF9wZm4N
Cg0KVGhvc2UgYXJlIHJhdGhlciBlYXN5LCBhcyBJJ20gbm90IGF3YXJlIG9mIHRob3NlIEJV
R19PTigpcyBoYXZpbmcgdHJpZ2dlcmVkDQppbiB0aGUgbGFzdCBmZXcgeWVhcnMuDQoNCg0K
SnVlcmdlbg0K
--------------9HddmWv73H5VvPv3wXJmBu6Z
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------9HddmWv73H5VvPv3wXJmBu6Z--

--------------0jp0HFcCgn7FobYyXJ0iQLnN--

--------------biiJqnzPU0CXD6IblapDZIG4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMiyT4FAwAAAAAACgkQsN6d1ii/Ey/V
Gwf/XQAQc+AleQMto7T03CT++gQ9Z7n1wXutzSLQ3M9AWpH0wTrQjuM+AhjHvo/7+Y1QXl/6l9V2
9rrxP6HyjmeaGuGpKqLZto3OPu+fXy8VpgJXAa9vHHcxFasX8u/Il7zsawLxGvIVNcynFBBgPq1i
kFjG3AGxapqkFiXtBwcGRbnU7eQRht0y7ZyOW38vZrX1OMUKcYHlb5YY8x4W+AnvKZZB5SE3tRoz
IN5S+6kTAXoRY8432FRkSqaYlNbcsMPPBrJWC4JnW3uj9d+2v169ChVBp67FJQwt/dDrA7/iAuMS
ogmsaCM/ewE3R8WJyQEfKKslkvPQzel+A2FpUw7Dzw==
=hwKP
-----END PGP SIGNATURE-----

--------------biiJqnzPU0CXD6IblapDZIG4--

