Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90955BAC5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 17:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356867.585196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qkl-0004Ge-Nl; Mon, 27 Jun 2022 15:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356867.585196; Mon, 27 Jun 2022 15:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qkl-0004EG-KX; Mon, 27 Jun 2022 15:34:19 +0000
Received: by outflank-mailman (input) for mailman id 356867;
 Mon, 27 Jun 2022 15:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6rY=XC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o5qkk-0004EA-Q9
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 15:34:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b58dfe-f62e-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 17:34:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B73B21DB0;
 Mon, 27 Jun 2022 15:34:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF1A813AB2;
 Mon, 27 Jun 2022 15:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a24tMfjNuWKtWQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Jun 2022 15:34:16 +0000
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
X-Inumbo-ID: 98b58dfe-f62e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656344057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C+S45zKi9V9sA4MZmEglV2Ia55SYVUyIjqCZ749k8i8=;
	b=Hj7eOjPjkapZulPPPJxHR57PyT86RqV6elMpGZbiAJ7R6ERxsdnqGK1y+cMRzFTb/YPyFJ
	SBYXCWCybXcmi2oi4tCBKCeuzFmDP7hcnVDshRP3qe9Untm97mK8TO/FOoKSo8ZGSdEnX2
	n5iHXldBIl61uE6/AVPqxSDcvoXEIGQ=
Message-ID: <cb414ba0-d049-51d4-3e44-e52785119ea1@suse.com>
Date: Mon, 27 Jun 2022 17:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/manage: Use orderly_reboot() to reboot
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <PH0PR03MB6382AA82CA7C475532E6AFE6F0B99@PH0PR03MB6382.namprd03.prod.outlook.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <PH0PR03MB6382AA82CA7C475532E6AFE6F0B99@PH0PR03MB6382.namprd03.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RtPbTXkN908i7MtQcQ37OQh8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RtPbTXkN908i7MtQcQ37OQh8
Content-Type: multipart/mixed; boundary="------------B2bve18atiGrvFHMzoO9TShl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dongli Zhang <dongli.zhang@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <cb414ba0-d049-51d4-3e44-e52785119ea1@suse.com>
Subject: Re: [PATCH] xen/manage: Use orderly_reboot() to reboot
References: <PH0PR03MB6382AA82CA7C475532E6AFE6F0B99@PH0PR03MB6382.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB6382AA82CA7C475532E6AFE6F0B99@PH0PR03MB6382.namprd03.prod.outlook.com>

--------------B2bve18atiGrvFHMzoO9TShl
Content-Type: multipart/mixed; boundary="------------8YebmerxXxTtcf9Ro2sHewd5"

--------------8YebmerxXxTtcf9Ro2sHewd5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDYuMjIgMTc6MjksIFJvc3MgTGFnZXJ3YWxsIHdyb3RlOg0KPj4gRnJvbTogSnVl
cmdlbiBHcm9zcw0KPj4gU2VudDogTW9uZGF5LCBKdW5lIDI3LCAyMDIyIDM6NDkgUE0NCj4+
IFRvOiBSb3NzIExhZ2Vyd2FsbDsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pOyBPbGVrc2FuZHIgVHlzaGNoZW5rbzsgRG9uZ2xp
IFpoYW5nOyBCb3JpcyBPc3Ryb3Zza3kNCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9t
YW5hZ2U6IFVzZSBvcmRlcmx5X3JlYm9vdCgpIHRvIHJlYm9vdA0KPj4gICAgICAgICAgICAg
IA0KPj4gICAgICAgICAgICAgDQo+PiBPbiAyNy4wNi4yMiAxNjoyOCwgUm9zcyBMYWdlcndh
bGwgd3JvdGU6DQo+Pj4gQ3VycmVudGx5IHdoZW4gdGhlIHRvb2xzdGFjayBpc3N1ZXMgYSBy
ZWJvb3QsIGl0IGdldHMgdHJhbnNsYXRlZCBpbnRvIGENCj4+PiBjYWxsIHRvIGN0cmxfYWx0
X2RlbCgpLiBCdXQgdHlpbmcgcmVib290IHRvIGN0cmwtYWx0LWRlbCBtZWFucyByZWJvb3Rp
bmcNCj4+PiBtYXkgZmFpbCBpZiBlLmcuIHRoZSB1c2VyIGhhcyBtYXNrZWQgdGhlIGN0cmwt
YWx0LWRlbC50YXJnZXQgdW5kZXINCj4+PiBzeXN0ZW1kLg0KPj4+DQo+Pj4gQSBwcmV2aW91
cyBhdHRlbXB0IHRvIGZpeCB0aGlzIHNldCB0aGUgZmxhZyB0byBmb3JjZSByZWJvb3Rpbmcg
d2hlbg0KPj4+IGN0cmxfYWx0X2RlbCgpIGlzIGNhbGxlZC4NCj4+DQo+PiBTb3JyeSwgSSBo
YXZlIHByb2JsZW1zIHBhcnNpbmcgdGhpcyBzZW50ZW5jZS4NCj4gDQo+IFByb2JhYmx5IGJl
Y2F1c2UgaXQgaXMgcG9vcmx5IHdvcmRlZC4uLiBIb3cgYWJvdXQgdGhpcz8NCj4gDQo+IEEg
cHJldmlvdXMgYXR0ZW1wdCB0byBmaXggdGhpcyBpc3N1ZSBtYWRlIGEgY2hhbmdlIHRoYXQg
c2V0cyB0aGUNCj4ga2VybmVsLmN0cmwtYWx0LWRlbCBzeXNjdGwgdG8gMSBiZWZvcmUgY3Ry
bF9hbHRfZGVsKCkgaXMgY2FsbGVkLg0KDQpZZXMsIG11Y2ggYmV0dGVyLg0KDQpXaXRoIHRo
YXQgKGNhbiBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcpOg0KDQpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQo+IA0KPj4NCj4+PiBIb3dldmVyLCB0
aGlzIGRvZXNuJ3QgZ2l2ZSB1c2Vyc3BhY2UgdGhlDQo+Pj4gb3Bwb3J0dW5pdHkgdG8gYmxv
Y2sgcmVib290aW5nIG9yIGV2ZW4gZG8gYW55IGNsZWFudXAgb3Igc3luY2luZy4NCj4+Pg0K
Pj4+IEluc3RlYWQsIGNhbGwgb3JkZXJseV9yZWJvb3QoKSB3aGljaCB3aWxsIGNhbGwgdGhl
ICJyZWJvb3QiIGNvbW1hbmQsDQo+Pj4gZ2l2aW5nIHVzZXJzcGFjZSB0aGUgb3Bwb3J0dW5p
dHkgdG8gYmxvY2sgaXQgb3IgcGVyZm9ybSB0aGUgdXN1YWwgcmVib290DQo+Pj4gcHJvY2Vz
cyB3aGlsZSBiZWluZyBpbmRlcGVuZGVudCBvZiB0aGUgY3RybC1hbHQtZGVsIGJlaGF2aW91
ci4gSXQgYWxzbw0KPj4+IG1hdGNoZXMgd2hhdCBoYXBwZW5zIGluIHRoZSBzaHV0ZG93biBj
YXNlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFn
ZXJ3YWxsQGNpdHJpeC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy94ZW4vbWFuYWdl
LmMgfCAyICstDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vbWFuYWdlLmMg
Yi9kcml2ZXJzL3hlbi9tYW5hZ2UuYw0KPj4+IGluZGV4IDNkNWEzODRkNjVmNy4uYzE2ZGY2
Mjk5MDdlIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMveGVuL21hbmFnZS5jDQo+Pj4gKysr
IGIvZHJpdmVycy94ZW4vbWFuYWdlLmMNCj4+PiBAQCAtMjA1LDcgKzIwNSw3IEBAIHN0YXRp
YyB2b2lkIGRvX3Bvd2Vyb2ZmKHZvaWQpDQo+Pj4gICAgc3RhdGljIHZvaWQgZG9fcmVib290
KHZvaWQpDQo+Pj4gICAgew0KPj4+ICAgICAgICAgc2h1dHRpbmdfZG93biA9IFNIVVRET1dO
X1BPV0VST0ZGOyAvKiA/ICovDQo+Pj4gLSAgICAgY3RybF9hbHRfZGVsKCk7DQo+Pj4gKyAg
ICAgb3JkZXJseV9yZWJvb3QoKTsNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gICAgc3RhdGlj
IHN0cnVjdCBzaHV0ZG93bl9oYW5kbGVyIHNodXRkb3duX2hhbmRsZXJzW10gPSB7DQo+Pg0K
Pj4gVGhlIGNvZGUgc2VlbXMgdG8gYmUgZmluZS4NCj4+DQo+PiBBbGJlaXQgSSB3b25kZXIg
d2hldGhlciB3ZSBzaG91bGRuJ3QgdHVybiBzaHV0dGluZ19kb3duIGludG8gYSBib29sLA0K
Pj4gYXMgYWxsIHRoYXQgc2VlbXMgdG8gYmUgbmVlZGVkIGlzICJzaHV0dGluZ19kb3duICE9
IFNIVVRET1dOX0lOVkFMSUQiDQo+PiB0b2RheS4gQnV0IHRoaXMgY291bGQgYmUgcGFydCBv
ZiBhbm90aGVyIHBhdGNoLg0KPj4NCj4gDQo+IEFncmVlZCB0aGF0IHNodXR0aW5nX2Rvd24g
Y291bGQgYmUgYSBib29sIGJ1dCBiZXR0ZXIgdG8gY2hhbmdlIGl0DQo+IGluIGEgc2VwYXJh
dGUgcGF0Y2guDQoNClllcy4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------8YebmerxXxTtcf9Ro2sHewd5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------8YebmerxXxTtcf9Ro2sHewd5--

--------------B2bve18atiGrvFHMzoO9TShl--

--------------RtPbTXkN908i7MtQcQ37OQh8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK5zfgFAwAAAAAACgkQsN6d1ii/Ey9O
Kgf/QGzMFkLaIFT/dN0++ABIcfaA9nTzP9SNdO0tUT6Rydf0cRxhJdDUzmDd5JX3Ip14Scyu8rvd
AoxbpdGx6jPmzSDwDwT286lxSeUDNEc5tn4PlBRpfl6YQI2ANegQIxiTQF2A7hf8sa8WGoI+12Rp
jhOG8C1hoDwx2wWD/vcIqPyH7DQqyE240Z2rbg0Tb4eeQSFVoS4RFwawyuHTvw/9L0weVH2ePYXk
64ZN3LPrCA+xe512vV0JRE1C5ecG3CcXMxH6eYUILwG9+mwVWa9OBcavtfIsTRtOSmvsrnLNUORq
GyKP0yYy44rxvb8FhQyv2Ew7tIOo0eQx5z/qE9KRYA==
=3a9r
-----END PGP SIGNATURE-----

--------------RtPbTXkN908i7MtQcQ37OQh8--

