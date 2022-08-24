Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33759F81E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 12:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392399.630728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQntY-00087U-Oe; Wed, 24 Aug 2022 10:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392399.630728; Wed, 24 Aug 2022 10:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQntY-00084P-Le; Wed, 24 Aug 2022 10:46:00 +0000
Received: by outflank-mailman (input) for mailman id 392399;
 Wed, 24 Aug 2022 10:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQntW-00084J-TI
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:45:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efce9acd-2399-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:45:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 922CF204AC;
 Wed, 24 Aug 2022 10:45:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5276F13780;
 Wed, 24 Aug 2022 10:45:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kDdzEmUBBmMQIwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 10:45:57 +0000
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
X-Inumbo-ID: efce9acd-2399-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661337957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kuU5JaL5xi1iBNEQCkhLsI2pfVugRqKVsbqhjzmKszc=;
	b=LRqI4QCpVN+w+tzj7JYl3GiC0AILI7gP7HL7Pn+2cojgNa+vO4KP6QNPwhP9sOxwN468DY
	kANdEIyZzw6QSh+m6Al6E/jyggTQMffKG3G6GP2pvp7U7kbHkt98mvL6q82IJWpktif+VS
	J3ggRkEuI/5Z/YytPKlIuRZfbe9XryI=
Message-ID: <de8a9208-0936-27db-e3ec-742254ff0525@suse.com>
Date: Wed, 24 Aug 2022 12:45:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220824102225.11431-1-jgross@suse.com>
 <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
In-Reply-To: <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------je39ZVg13IGl03Uwr8hI94zb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------je39ZVg13IGl03Uwr8hI94zb
Content-Type: multipart/mixed; boundary="------------M7cDwDd498D3D1wmODmd3Mju";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <de8a9208-0936-27db-e3ec-742254ff0525@suse.com>
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
References: <20220824102225.11431-1-jgross@suse.com>
 <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
In-Reply-To: <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>

--------------M7cDwDd498D3D1wmODmd3Mju
Content-Type: multipart/mixed; boundary="------------Wcva10PB2wRob7VVvw0hXvXb"

--------------Wcva10PB2wRob7VVvw0hXvXb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTI6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOC4yMDIy
IDEyOjIyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSGl0dGluZyBhbiBBU1NFUlRfVU5S
RUFDSEFCTEUoKSBpcyBhbHdheXMgd3JvbmcsIHNvIGV2ZW4gaW4gcHJvZHVjdGlvbg0KPj4g
YnVpbGRzIGEgd2FybmluZyBzZWVtcyB0byBiZSBhcHByb3ByaWF0ZSB3aGVuIGhpdHRpbmcg
b25lLg0KPiANCj4gSSBkaXNhZ3JlZSwgZm9yIHR3byByZWFzb25zOiBUaGlzIHZpb2xhdGVz
IHRoZSBpbXBsaWNhdGlvbiBvZiBOREVCVUcNCj4gbWVhbmluZyBBU1NFUlQoKSBhbmQgZnJp
ZW5kcyBleHBhbmQgdG8gbm8gYWN0dWFsIGNvZGUuIFBsdXMgaWYgZG9pbmcgc28NCg0KVGhp
cyBpcyBzb21ldGhpbmcgd2UgY2FuIGNoYW5nZSBJTUhPLg0KDQo+IGZvciBBU1NFUlRfVU5S
RUFDSEFCTEUoKSwgd2h5IHdvdWxkIHdlIG5vdCBkbyB0aGUgc2FtZSBmb3IgQVNTRVJUKCk/
DQoNClRoZXJlIGFyZSBtdWx0aXBsZSByZWFzb25zIHRvIGhhdmUgQVNTRVJUKClzLiBTb21l
IHNlcnZlIGFzIGEga2luZCBvZg0KZG9jdW1lbnRhdGlvbiAoZS5nLiB0byBkb2N1bWVudCB0
aGF0IHRoZSBwcm9ncmFtbWVyIHRob3VnaHQgb2YgYSBzcGVjaWFsDQpjYXNlIG5vdCBiZWlu
ZyBwb3NzaWJsZSksIG9yIHRoZXkgYXJlIG1lYW50IHRvIGNhdGNoIGhhcmQgdG8gZGlhZ25v
c2UNCmJ1Z3MgcmF0aGVyIGVhcmx5IGluc3RlYWQgb2YgbGV0dGluZyB0aGVtIGhpdCBsYXRl
ciBpbiBhIHNpdHVhdGlvbiB3aGVyZQ0KaXQgd291bGRuJ3QgYmUgY2xlYXIgd2hhdCBjYXVz
ZWQgdGhlbS4gQWRkaW5nIGEgV0FSTigpIGZvciBhbGwgb2YgdGhlc2UNCmNhc2VzIGlzbid0
IHJlYWxseSBhcHByb3ByaWF0ZSwgZXNwZWNpYWxseSBhcyB0aGlzIG1pZ2h0IGltcGFjdA0K
cGVyZm9ybWFuY2UgZHVlIHRvIGFkZGVkIHRlc3RzLCB3aGljaCBpc24ndCB0aGUgY2FzZSBm
b3IgdGhlb3JldGljYWxseQ0KdW5yZWFjaGFibGUgY29kZS4NCg0KPiBUaGVyZSdzIGEgcmVh
c29uIHdlIGhhdmUgQVNTRVJUKCkgYW5kIGZyaWVuZHMgYW5kLCBpbmRlcGVuZGVudGx5LA0K
PiBXQVJOX09OKCkgLyBCVUdfT04oKSBldCBhbC4NCg0KV2UgbWlnaHQgd2FudCB0byBpbnRy
b2R1Y2Ugc29tZXRoaW5nIGxpa2UgQVNTRVJUX09SX1dBUk4oKS4gSSdtIHN1cmUNCnRoaXMg
Y291bGQgYmUgdXNlZnVsIGluIHNvbWUgY2FzZXMuDQoNCg0KSnVlcmdlbg0K
--------------Wcva10PB2wRob7VVvw0hXvXb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Wcva10PB2wRob7VVvw0hXvXb--

--------------M7cDwDd498D3D1wmODmd3Mju--

--------------je39ZVg13IGl03Uwr8hI94zb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMGAWQFAwAAAAAACgkQsN6d1ii/Ey+4
3Af/RjDKspZoSwhWlaMii/aIEtXN8GNmf+Mxeo9wdxbnwod0Z8O5nVIclSec+TFQOibKYr1uKZhS
nbIHSTXKY08nI1gcoXeaClZFsHTBVJR7cWRCuKq7fiI5JZqo1nDFQSq292T4TYzNyGizusLKHQV4
ncPycVQKSQ92VJPOxtihNFeNiKYpXzFP0lgz8wjveRSDqkqm2vQUg02+RNTnr6OCJAZYXKamSGmn
8+lOnEhl56BHk4CARPuY+7BMsYoglWej60WUjBUKclBsWsrvnrZ8tKy13NHUdzGTilNIWV0uCzz3
9wd21YSlFzr2olnjDQ+I5/lv9d+xF1DlhCLg3rdy7w==
=jHjw
-----END PGP SIGNATURE-----

--------------je39ZVg13IGl03Uwr8hI94zb--

