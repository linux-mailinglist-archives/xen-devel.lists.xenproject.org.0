Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D3741315
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 15:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556493.869080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVce-0005NW-6b; Wed, 28 Jun 2023 13:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556493.869080; Wed, 28 Jun 2023 13:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEVce-0005Lh-3X; Wed, 28 Jun 2023 13:54:16 +0000
Received: by outflank-mailman (input) for mailman id 556493;
 Wed, 28 Jun 2023 13:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEVcd-0005La-26
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 13:54:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 438f14ca-15bb-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 15:54:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE1F82189A;
 Wed, 28 Jun 2023 13:54:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75EFF138EF;
 Wed, 28 Jun 2023 13:54:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2fE6G4Q7nGQ0DgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 28 Jun 2023 13:54:12 +0000
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
X-Inumbo-ID: 438f14ca-15bb-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687960452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dFpQfUxUsCp/V+QjVU55xiHyRkbe4P7IY0pmI1UEDJM=;
	b=pky9Q/sVQuP963cR8aD325/jeA7M3SaK4e+dq6qaMjtHHCb41z51X35m1rBnmQ9YGnPboC
	89TuuZ6f6eoaTMrHGqit3nFF+geO1GXOdcrB/n30gyKPCaV45PZZC3LrJauKMzKNaigg9h
	ZzwIqPk91PLJ+mkpHNAGjNZJ2OpmsoA=
Message-ID: <bc49c9cd-0ff1-2f8b-6a0b-53c3f194e39b@suse.com>
Date: Wed, 28 Jun 2023 15:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
 <58622fcf-0939-95c5-7318-60c93307f991@suse.com>
 <2a195157-fe59-3bfd-f5cb-c377d883cef4@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: XenSummit: Empty per-arch files
In-Reply-To: <2a195157-fe59-3bfd-f5cb-c377d883cef4@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5B8zfuquakIOvB8XYE6cSaNh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5B8zfuquakIOvB8XYE6cSaNh
Content-Type: multipart/mixed; boundary="------------l6nmx8Fr3zFFzSug2WmSF2DT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
Message-ID: <bc49c9cd-0ff1-2f8b-6a0b-53c3f194e39b@suse.com>
Subject: Re: XenSummit: Empty per-arch files
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
 <58622fcf-0939-95c5-7318-60c93307f991@suse.com>
 <2a195157-fe59-3bfd-f5cb-c377d883cef4@citrix.com>
In-Reply-To: <2a195157-fe59-3bfd-f5cb-c377d883cef4@citrix.com>

--------------l6nmx8Fr3zFFzSug2WmSF2DT
Content-Type: multipart/mixed; boundary="------------54Molu28xgQqsYXqf0GBQ960"

--------------54Molu28xgQqsYXqf0GBQ960
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDYuMjMgMTU6NDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI4LzA2LzIw
MjMgMjoyNiBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IE9uIDI4LjA2LjIzIDEzOjMy
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IEhlbGxvLA0KPj4+DQo+Pj4gVGhpcyB3YXNu
J3QgYSBmb3JtYWwgZGlzY3Vzc2lvbiBwb2ludCBhdCBYZW5TdW1taXQsIGJ1dCBPbGVrc2lp
IHBvaW50ZWQNCj4+PiBvdXQgdGhhdCBpdCB3YXMgc3RpbGwgYSBwcm9ibGVtLCBoZW5jZSB0
aGlzIHRocmVhZC4NCj4+Pg0KPj4+IEFzIHdlIHRha2Ugb24gbW9yZSBhcmNoaXRlY3R1cmVz
LCBpdCBiZWNvbWVzIG1vcmUgYW5kIG1vcmUgaW1wb3J0YW50IGZvcg0KPj4+IHRoaW5ncyB0
byBiZSBoYW5kbGVkIGluIGEgbW9zdGx5LWNvbW1vbiB3YXkuwqAgV2l0aCB0aGF0IGNvbWVz
IHF1aXRlIGENCj4+PiBsb3Qgb2YgPHhlbi9mb28uaD4gaW5jbHVkaW5nIDxhc20vZm9vLmg+
LCBhbmQgdGhlIGFyY2ggb25lIGJlaW5nIGEgc3R1Yg0KPj4+IGluIHNpbXBsZSBjYXNlcy4N
Cj4+Pg0KPj4+IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHJpZCBvZiB0aGUgc3R1YiBmaWxl
czsgdGhleSdyZSBpcnJpdGF0aW5nIHRvDQo+Pj4gZGVhbCB3aXRoLCBib3RoIHdoZW4gcmVm
YWN0b3JpbmcgYW5kIHNpbXBseSBmb3IgdGhlIGZpbGUgYmxvYXQgdGhleQ0KPj4+IGNyZWF0
ZS4NCj4+Pg0KPj4+IFRoZXJlIGFyZSB0d28gb3B0aW9ucyB3aGljaCBjb21lIHRvIG1pbmQu
DQo+Pj4NCj4+PiAxKSBVc2UgX19oYXNfaW5jbHVkZSgpLsKgIFRoaXMgd291bGQgYmUgaWRl
YWwsIGJ1dCB3b3VsZCByZXF1aXJlIHVzDQo+Pj4gYnVtcGluZyB0aGUgbWluaW11bSBHQ0Mg
dmVyc2lvbiB0byA0LjkuMiBhcyBhIHByZXJlcXVpc2l0ZS7CoCBJJ20gbm90DQo+Pj4gYXdh
cmUgb2YgYW55IHdheSB0byBlbXVsYXRlIHRoZSBuZWNlc3NhcnkgYmVoYXZpb3VyIG9uIG9s
ZGVyIHRvb2xjaGFpbnMuDQo+Pj4NCj4+PiAyKSBIYXZlIGEgc3R1YiAiYXJjaGl0ZWN0dXJl
IiB3aGljaCBpcyBhbHdheXMgbGFzdCBvbiB0aGUgaW5jbHVkZSBwYXRoLg0KPj4+IFRoaXMg
d291bGQgcmVkdWNlIHRoZSBudW1iZXIgb2Ygc3R1YiBmaWxlcyBmcm9tIG9uZSBzZXQgcGVy
IGFyY2gsIHRvDQo+Pj4gb25seSBvbmUgc2V0Lg0KPj4+DQo+Pj4gQW55dGhpbmcgZWxzZSB0
aGF0IEkndmUgbWlzc2VkPw0KPj4NCj4+IFdoYXQgYWJvdXQgYSBtYWtlIHJ1bGUgY3JlYXRp
bmcgYW4gZW1wdHkgaW5jbHVkZSBmaWxlIGlmIGl0IGlzIG1pc3Npbmc/DQo+IA0KPiBXb3Vs
ZG4ndCB0aGF0IGNhdXNlIGEgdHlwbydkIGhlYWRlciBmaWxlIG5hbWUgdG8gc3ByaW5nIGlu
dG8gZXhpc3RlbmNlID8NCj4gDQo+IEFuZCBpdCB3b3VsZCBjYXVzZSBhIGJ1aWxkIHRvIGxl
YXZlIHRoZSB3b3JraW5nIHRyZWUgZGlydHkuDQoNCkRlcGVuZHMgaG93IGl0IGlzIGRvbmUu
DQoNClRoZXJlIGNvdWxkIGJlIGEgZmlsZSBjb250YWluaW5nIHRoZSBhbGxvd2VkIGhlYWRl
ciBuYW1lcyB0byBiZSBnZW5lcmF0ZWQuDQoNCkFuZCB0aGUgZmlsZXMgd291bGRuJ3QgbmVl
ZCB0byBiZSBnZW5lcmF0ZWQgaW4gYXJjaC88YXJjaD4vaW5jbHVkZS9hc20sIGJ1dA0KY291
bGQgYmUgZ2VuZXJhdGVkIGluIGUuZy4gaW5jbHVkZS9nZW5lcmF0ZWQvYXNtIHdoaWNoIHdv
dWxkIGJlIHVzZWQgYWZ0ZXINCnRoZSBhcmNoIGluY2x1ZGUgcGF0aC4NCg0KVGhpcyB3b3Vs
ZCBiYXNpY2FsbHkgYmUgdGhlIGNlbnRyYWwgc3R1YiB2YXJpYW50IHlvdSB3ZXJlIG1lbnRp
b25pbmcsIGJ1dA0KYnVpbGRpbmcgaXQgZHluYW1pY2FsbHkuDQoNCg0KSnVlcmdlbg0K
--------------54Molu28xgQqsYXqf0GBQ960
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------54Molu28xgQqsYXqf0GBQ960--

--------------l6nmx8Fr3zFFzSug2WmSF2DT--

--------------5B8zfuquakIOvB8XYE6cSaNh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmScO4MFAwAAAAAACgkQsN6d1ii/Ey9/
Hwf+O63vwOJ/dY/zUhMJQXDf9Zm0bpFsSg/PdW/1S82cR0buelXdOtegQPU7QzoI445cCTaImZq4
qUYPv8XhqhLz+Ko5rYg9kUbIAyZ6Olc67J5w7fcp14UYQLRlvevpDITnGCW8k8R8awZI4313LGA3
++UlEUFfsXX8aOVAHlREFqHUkmTZVYg5tJGE+x0P2Z1VGMgqfOWIuohc5tBQEGaXHJ3U4R3sZmIo
TeYg2PymDbl8M0VkiGpug8+g/LC0zY6W7LF0wHFaiIMQzRWzIsObNBW+I9xzI7GhYuYKVkrO4urN
t9h39G6dp8Pbl6x5WwH/lStZSUWHqilOvJkr1k+VbA==
=vrle
-----END PGP SIGNATURE-----

--------------5B8zfuquakIOvB8XYE6cSaNh--

