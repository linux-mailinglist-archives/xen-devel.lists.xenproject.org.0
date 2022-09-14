Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8315B8743
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 13:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406936.649355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYQZD-0007CW-SI; Wed, 14 Sep 2022 11:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406936.649355; Wed, 14 Sep 2022 11:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYQZD-0007AO-P3; Wed, 14 Sep 2022 11:28:31 +0000
Received: by outflank-mailman (input) for mailman id 406936;
 Wed, 14 Sep 2022 11:28:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7DUC=ZR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oYQZB-0007AI-Sf
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 11:28:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ab39afe-3420-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 13:28:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1073E1F974;
 Wed, 14 Sep 2022 11:28:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3E4013494;
 Wed, 14 Sep 2022 11:28:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PM4YJtu6IWOdYQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Sep 2022 11:28:27 +0000
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
X-Inumbo-ID: 5ab39afe-3420-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663154908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dv1+xG4QI6T64Nul1wKUmD7/bcGnE8zzXxRkKAVJ1Ag=;
	b=jgBo28K2qqcgvZm8FLYtR2V9gjRt7kPlDJp6b0kNooou2GG3vR6hdx4jcg2SzAfGp2LsRO
	PG3q/VDLseyPYRV61mV5IS6E/RUgPkdMw+MttpYPqb5vJ4bJiW6Q1jlvENbOdTIg6I3Yra
	FePamKJXqOnTvEP/pM8FBnR6BcpwiME=
Message-ID: <7a068199-ef6f-89bd-ded1-56766b9420fe@suse.com>
Date: Wed, 14 Sep 2022 13:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
 <YyCnNem7dj8EfQCd@MacBook-Air-de-Roger.local>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Licensing issues
In-Reply-To: <YyCnNem7dj8EfQCd@MacBook-Air-de-Roger.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sqzP2CkNwCmo1odwW9oUTFfE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sqzP2CkNwCmo1odwW9oUTFfE
Content-Type: multipart/mixed; boundary="------------csgXTQsWg6QMfn1aNaymTN9o";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <7a068199-ef6f-89bd-ded1-56766b9420fe@suse.com>
Subject: Re: Licensing issues
References: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
 <YyCnNem7dj8EfQCd@MacBook-Air-de-Roger.local>
In-Reply-To: <YyCnNem7dj8EfQCd@MacBook-Air-de-Roger.local>

--------------csgXTQsWg6QMfn1aNaymTN9o
Content-Type: multipart/mixed; boundary="------------IQF90RKiTCGUnoN0QjlvN45l"

--------------IQF90RKiTCGUnoN0QjlvN45l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDkuMjIgMTc6NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIEZyaSwg
SnVsIDIyLCAyMDIyIGF0IDAyOjMxOjI4UE0gKzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6
DQo+PiBJJ3ZlIGJlZW4gY3Jvc3MtY2hlY2tpbmcgbGljZW5zaW5nIGRldGFpbHMsIGFuZCB3
ZSBoYXZlIHNvbWUgcHJvYmxlbXMuDQo+Pg0KPj4gMSkgV2UgaW5zdGFsbCB4ZW4vaW5jbHVk
ZS9wdWJsaWMvQ09QWUlORyBpbnRvIC91c3IvaW5jbHVkZS94ZW4vQ09QWUlORywNCj4+IHdo
aWNoIGlzIG5vdCBjb21tb24gcHJhY3RpY2UuwqAgVGhlIGluc3RhbGxlZCBmaWxlIGlzIG1v
c3RseSB1c2VsZXNzDQo+PiBiZWNhdXNlIGl0IGRpc2N1c3NlcyBmaWxlcyBiYXNlZCBvbiB0
aGVpciB4ZW4uZ2l0IHBhdGhzLg0KPj4NCj4+IDIpIFdlIGFjdHVhbGx5IHVzZSB0aGUgTUlU
IGhlYWRlciBmb3IgdGhlIHB1YmxpYyBpbnRlcmZhY2UsIGJ1dCB3ZSBkb24ndA0KPj4gYWN0
dWFsbHkgY2FsbCBpdCBieSBpdCdzIGNvbW1vbiBuYW1lIGFueXdoZXJlLg0KPj4NCj4+IDMp
IFRoZSBmb2xsb3dpbmcgZmlsZXMgYXJlIG1pc3NpbmcgdGhlIE1JVCBoZWFkZXI6DQo+Pg0K
Pj4gL3Vzci9pbmNsdWRlL3hlbi9mb3JlaWduL3g4Nl8zMi5oDQo+PiAvdXNyL2luY2x1ZGUv
eGVuL2ZvcmVpZ24veDg2XzY0LmgNCj4+IC91c3IvaW5jbHVkZS94ZW4vZm9yZWlnbi9hcm0z
Mi5oDQo+PiAvdXNyL2luY2x1ZGUveGVuL2ZvcmVpZ24vYXJtNjQuaA0KPj4gL3Vzci9pbmNs
dWRlL3hlbi9zeXMvZ250YWxsb2MuaA0KPj4gL3Vzci9pbmNsdWRlL3hlbi9kZXZpY2VfdHJl
ZV9kZWZzLmgNCj4+IC91c3IvaW5jbHVkZS94ZW4vZXJybm8uaA0KPj4NCj4+IEZvcmVpZ24g
YXJlIGF1dG9nZW5lcmF0ZWQgZnJvbSBoZWFkZXJzIHdpdGggTUlUIGxpY2VuY2VzLCBzbyB0
aGF0J3MgYW4NCj4+IGVhc3kgZml4Lg0KPj4NCj4+IGVycm5vLmggd2FzIGFuIG92ZXJzaWdo
dCB3aGVuIHdlIGFkZGVkIGl0LsKgIFRoZXJlJ3Mgbm8gcHJvYmxlbSBmaXhpbmcNCj4+IGl0
LCBhcyBpdCBpcyBjb3ZlcmVkIGJ5IG11bHRpcGxlIHN0YXRlbWVudHMgZWxzZXdoZXJlIGlu
IHRoZSB0cmVlLg0KPj4NCj4+IGRldmljZV90cmVlX2RlZnMuaCBpcyBwcm9ibGVtYXRpYy7C
oCBJdCBjYW1lIGludG8gZXhpc3RlbmNlIGluIGMvcw0KPj4gMWM4OThhOWZlYzdlNCB3aGVu
IHNvbWUgTEdQTCBjb2RlIHdhcyBtb3ZlZCBvdXQgb2YgbGlieGwsIGFuZCBzb21lIEdQTA0K
Pj4gY29kZSB3YXMgY29waWVkIG91dCBvZiBYZW4uwqAgU28gdGhlcmUncyBjdXJyZW50bHkg
YW4gR1BMK0xHUEwgdnMgTUlUDQo+PiBsaWNlbnNpbmcgdmlvbGF0aW9uLg0KPj4NCj4+IEkg
aGF2ZSBub3QgbG9va2VkIHRocm91Z2ggaGlzdG9yeSwgYnV0IGl0J3MgbGlrZWx5IHRoYXQg
dGhlIGNvcHlyaWdodCBpcw0KPj4gY292ZXJlZCBieSBpbmRpdmlkdWFscy9jb21wYW5pZXMg
d2hvIGFyZSBzdGlsbCBhY3RpdmUgbWVtYmVycyBvZiBYZW4sDQo+PiBhbmQgSSBkb24ndCBh
bnRpY2lwYXRlIGFueSBwcm9ibGVtIGdldHRpbmcgaXQgZm9ybWFsbHkgcmVsaWNlbnNlZCAo
aXQncw0KPj4ganVzdCBhIGZldyBjb25zdGFudHMpLCBidXQgdGhpcyBkb2VzIG5lZWQgZml4
aW5nLg0KPj4NCj4+IHN5cy9nbnRhbGxvYy5oIGlzIG1vcmUgY29tcGxpY2F0ZWQuwqAgSXQn
cyBzdGF0ZWQgYXMgcHVibGljIGRvbWFpbiB3aGljaA0KPj4gaXMgZmluZSBmb3Igb3VyIHB1
cnBvc2VzLCBidXQgaW5jb25zaXN0ZW50IHdpdGggZXZlcnl0aGluZyBlbHNlLCBhbmQgd2UN
Cj4+IG5lZWQgdG8gYWRqdXN0IHRoZSB2YXJpb3VzIGZpbGVzIHdlJ3ZlIGdvdCB3aGljaCBz
dGF0ZSB0aGF0IHRoZSBmdWxsDQo+PiBwdWJsaWMgQVBJIGlzIE1JVC4NCj4+DQo+PiBCdXQg
aXQgZG9lcyByYWlzZSBhIGRpZmZlcmVudCBidWcuwqAgV2h5IGRvIHdlIGhhdmUgcmFuZG9t
IGxpbnV4IGhlYWRlcnMNCj4+IGNvbW1pdHRlZCBpbiB0aGUgdHJlZSwgdXNlZCBieSBzb21l
IHVzZXJzcGFjZSBsaWJyYXJpZXM/DQo+IA0KPiBJIHdvdWxkIGd1ZXNzIHRoaXMgaXMgYmVj
YXVzZSBpbiB0aGUgcGFzdCAocHJlIExpbnV4IHB2b3BzIGtlcm5lbHMpIHdlDQo+IHdhbnRl
ZCBkaXN0cm9zIHRvIGJlIGFibGUgdG8gYnVpbGQgWGVuIHBhY2thZ2VzIG9uIGJveGVzIHRo
YXQgZGlkIG5vdA0KPiBydW4gWGVuIHBhdGNoZWQga2VybmVscywgYW5kIGhlbmNlIGRpZG4n
dCBoYXZlIHRoZSB1c2VyLXNwYWNlIGhlYWRlcnMsDQo+IHRoYXQncyB3aHkgd2UgaGFkIHRv
IGFkZCB0aGVtIHRvIHhlbi5naXQuDQoNCkl0IGlzbid0IHNvIGVhc3kuDQoNClRob3NlIGFy
ZSBoZWFkZXJzIG9mIFhlbi1zcGVjaWZpYyBrZXJuZWwgZHJpdmVycy4NCg0KRXNwZWNpYWxs
eSBpbiBjYXNlIG5ldyBmZWF0dXJlcyBhcmUgYWRkZWQgdG8gdGhlIHVwc3RyZWFtIGtlcm5l
bCBkcml2ZXJzLA0Kd2Ugd2FudCB0byBiZSBhYmxlIHRvIGJ1aWxkIHRoZSBYZW4gdG9vbHMg
dXNpbmcgdGhlbSB3aXRob3V0IHJlcXVpcmluZyBhDQpibGVlZGluZyBlZGdlIGtlcm5lbCBp
bnN0YWxsZWQuDQoNClRoaXMgd2hvbGUgc2NoZW1lIHJlcXVpcmVzIHRvIG5vdCByZW1vdmUg
YW55IGZlYXR1cmVzIGZyb20gdGhlIGhlYWRlcnMsDQpvZiBjb3Vyc2UsIHNpbWlsYXIgdG8g
dGhlIGhhbmRsaW5nIG9mIG91ciBwdWJsaWMgWGVuIGhlYWRlcnMuDQoNCg0KSnVlcmdlbg0K

--------------IQF90RKiTCGUnoN0QjlvN45l
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------IQF90RKiTCGUnoN0QjlvN45l--

--------------csgXTQsWg6QMfn1aNaymTN9o--

--------------sqzP2CkNwCmo1odwW9oUTFfE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMhutsFAwAAAAAACgkQsN6d1ii/Ey+q
9Af/eeKK1xjrooSkmOmPNyWITqJ5FM66aBU1enYkG3o3T1dyiCkTEmm4+GRfQcV3SLn0FJMD2D9F
Mf2beg+xcq07Zx+CMsJ/dhXpF4cGpfYUVS+sAO4RRox4FbTlFtY72zita51mfkMG+kzK6i3DxfX/
pz1pr6O39cAox5YvlkYMp8u3s7NMi4L2GJZAGKiT3FNP+An1XWCxHrkHCx8T0KMHY1y9JKzO1P/V
EiiAx+QkHmy2wltjfyOBU4M9Q5ResH6+9YRlw1I2GfTfLAPcggZpoc62rVz7BhQZdy0s/yyZx/aO
bqQHHR2MqcNOoAvWrQQL1IfEWnkKi0Y4z7bLrkOaLw==
=3CTy
-----END PGP SIGNATURE-----

--------------sqzP2CkNwCmo1odwW9oUTFfE--

