Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E96F5AE6
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529301.823560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEJb-0004YU-F6; Wed, 03 May 2023 15:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529301.823560; Wed, 03 May 2023 15:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEJb-0004WP-CE; Wed, 03 May 2023 15:22:47 +0000
Received: by outflank-mailman (input) for mailman id 529301;
 Wed, 03 May 2023 15:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C18W=AY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1puEJa-0004WI-1R
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:22:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a2d4f79-e9c6-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:22:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A4B51FEC0;
 Wed,  3 May 2023 15:22:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE31E13584;
 Wed,  3 May 2023 15:22:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RmCDKEN8UmRyYwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 May 2023 15:22:43 +0000
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
X-Inumbo-ID: 5a2d4f79-e9c6-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683127364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiJyyFT5NgGLMYEWC/qN3yTxGI2R5QUMP+cQbIcM3+0=;
	b=DudI60UQ37JdVpDHP3DqnQsgwBRBkbiDoD9bVg2ZXwyzdPFYmUm59x0TeBhiEYFQQ/vBfz
	f4USNzO+sh0ccfIvEgOJZUMrzY+Ha7u8SV+Viw+2cQIf2rglczQANONlbPaPQCe4zbf8fm
	DcQq+niJUBrMHLvok92/U/MoQfAfclM=
Message-ID: <998dbbeb-94d7-7afe-e4c2-02ef134cbe94@suse.com>
Date: Wed, 3 May 2023 17:22:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: dom0less vs xenstored setup race Was: xen | Failed pipeline for
 staging | 6a47ba2f
To: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com,
 Stefano Stabellini <sstabellini@kernel.org>, alejandro.vallejo@cloud.com
Cc: committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com>
 <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LKvmCwmwmvjJzje9EwrTHrka"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LKvmCwmwmvjJzje9EwrTHrka
Content-Type: multipart/mixed; boundary="------------pCCo8kU23o0UY5ep3g9fRqkn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com,
 Stefano Stabellini <sstabellini@kernel.org>, alejandro.vallejo@cloud.com
Cc: committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>
Message-ID: <998dbbeb-94d7-7afe-e4c2-02ef134cbe94@suse.com>
Subject: Re: dom0less vs xenstored setup race Was: xen | Failed pipeline for
 staging | 6a47ba2f
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <c74d231f-75e2-a26d-f2c4-3a135cc1ac10@citrix.com>
 <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>
In-Reply-To: <28235d38-ad7f-f1bd-f093-bd83f9fd6589@xen.org>

--------------pCCo8kU23o0UY5ep3g9fRqkn
Content-Type: multipart/mixed; boundary="------------3Fd0Q0UDsfMiJdb1Utf8YC0a"

--------------3Fd0Q0UDsfMiJdb1Utf8YC0a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTc6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAwMy8wNS8yMDIzIDE1OjM4LCBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tIHdyb3RlOg0K
Pj4gSGVsbG8sDQo+Pg0KPj4gQWZ0ZXIgd2hhdCBzZWVtcyBsaWtlIGFuIHVucmVhc29uYWJs
ZSBhbW91bnQgb2YgZGVidWdnaW5nLCB3ZSd2ZSB0cmFja2VkDQo+PiBkb3duIGV4YWN0bHkg
d2hhdCBpcyBnb2luZyB3cm9uZyBoZXJlLg0KPj4NCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS94
ZW4tcHJvamVjdC9wZW9wbGUvYW5keWhocC94ZW4vLS9qb2JzLzQyMTk3MjE5NDQNCj4+DQo+
PiBPZiBub3RlIGlzIHRoZSBzbW9rZS5zZXJpYWwgbG9nIGFyb3VuZDoNCj4+DQo+PiBpbzog
SU4gMHhmZmZmOTBmZWMyNTAgZDAgMjAyMzA1MDMgMTQ6MjA6NDIgSU5UUk9EVUNFICgxIDIz
MzQ3MyAxICkNCj4+IG9iajogQ1JFQVRFIGNvbm5lY3Rpb24gMHhmZmZmOTBmZmYxZjANCj4+
ICoqKiBkMSBDT05OIFJFU0VUIHJlcV9jb25zIDAwMDAwMDAwLCByZXFfcHJvZCAwMDAwMDAz
YSByc3BfY29ucw0KPj4gMDAwMDAwMDAsIHJzcF9wcm9kIDAwMDAwMDAwDQo+PiBpbzogT1VU
IDB4ZmZmZjkxMDVjZWYwIGQwIDIwMjMwNTAzIDE0OjIwOjQyIFdBVENIX0VWRU5UDQo+PiAo
QGludHJvZHVjZURvbWFpbiBkb21saXN0ICkNCj4+DQo+PiBYU19JTlRST0RVQ0UgKGluIEMg
eGVuc3RvcmVkIGF0IGxlYXN0LCBub3QgY2hlY2tlZCBPIHlldCkgYWx3YXlzDQo+PiBjbG9i
YmVycyB0aGUgcmluZyBwb2ludGVycy7CoCBUaGUgYWRkZWQgcHJlc3N1cmUgb24gZG9tMCB0
aGF0IHRoZQ0KPj4geGVuc2NvbnNvbGVkIGFkZHMgd2l0aCBpdCdzIDRNIGh5cGVyY2FsbCBi
b3VuY2UgYnVmZmVyIG9jY2FzaW9uYWxseQ0KPj4gZGVmZXJzIHhlbnN0b3JlZCBsb25nIGVu
b3VnaCB0aGF0IHRoZSBYU19JTlRST0RVQ0UgY2xvYmJlcnMgdGhlIGZpcnN0DQo+PiBtZXNz
YWdlIHRoYXQgZG9tMSB3cm90ZSBpbnRvIHRoZSByaW5nLg0KPj4NCj4+IFRoZSBvdGhlciBi
ZWhhdmlvdXIgc2VlbiB3YXMgeGVuc3RvcmVkIG9ic2VydmluZyBhIGhlYWRlciBsb29raW5n
IGxpa2UgdGhpczoNCj4+DQo+PiAqKiogZDEgSERSIHsgdHkgMHg3NDZlNmY2MywgcnFpZCAw
eDJmNmM2ZjcyLCB0eGlkIDB4NzQ2MTZjNzAsIGxlbg0KPj4gMHg2ZDcyNmY2NiB9DQo+Pg0K
Pj4gd2hpY2ggd2FzIHJlamVjdGVkIGFzIGJlaW5nIHRvbyBsb25nLsKgIFRoYXQncyAiY29u
dHJvbC9wbGF0Zm9ybSIgaW4NCj4+IEFTQ0lJLCBzbyB0aGUgWFNfSU5UUk9EVUNFIGludGVy
c2VjdGVkIGRvbTEgYmV0d2VlbiB3cml0aW5nIHRoZSBoZWFkZXINCj4+IGFuZCB3cml0aW5n
IHRoZSBwYXlsb2FkLg0KPj4NCj4+DQo+PiBBbnl3YXksIGl0IGlzIGJ1Z2d5IGZvciBYU19J
TlRST0RVQ0UgdG8gYmUgY2FsbGVkIG9uIGEgbGl2ZSBhbg0KPj4gdW5zdXNwZWN0aW5nIGNv
bm5lY3Rpb24uwqAgSXQgaXMgdWx0aW1hdGVseSBpbml0LWRvbTBsZXNzJ3MgZmF1bHQgZm9y
DQo+PiB0ZWxsaW5nIGRvbTEgaXQncyBnb29kIHRvIGdvIGJlZm9yZSBoYXZpbmcgd2FpdGVk
IGZvciBYU19JTlRST0RVQ0UgdG8NCj4+IGNvbXBsZXRlLg0KPiANCj4gU28gdGhlIHByb2Js
ZW0gaXMgeGVuc3RvcmVkIHdpbGwgc2V0IGludGVyZmFjZS0+Y29ubmVjdGlvbiB0byBYRU5T
VE9SRV9DT05ORUNURUQgDQo+IGJlZm9yZSBmaW5hbGl6aW5nIHRoZSBjb25uZWN0aW9uLiBD
YXFuIHlvdSB0cnkgdGhlIGZvbGxvd2luZywgZm9yIG5vdywgdmVyeSANCj4gaGFja2lzaCBw
YXRjaDoNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9t
YWluLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMNCj4gaW5kZXggZjYy
YmUyMjQ1YzQyLi5iYmY4NWJiYmVhM2IgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlZF9kb21haW4uYw0KPiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
ZG9tYWluLmMNCj4gQEAgLTY4OCw2ICs2ODgsNyBAQCBzdGF0aWMgc3RydWN0IGRvbWFpbiAq
aW50cm9kdWNlX2RvbWFpbihjb25zdCB2b2lkICpjdHgsDQo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdGFsbG9jX3N0ZWFsKGRvbWFpbi0+Y29ubiwgZG9tYWluKTsNCj4g
DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyZXN0b3JlKSB7DQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW5f
Y29ubl9yZXNldChkb21haW4pOw0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBOb3RpZnkgdGhlIGRvbWFpbiB0aGF0IHhlbnN0b3JlIGlz
IGF2YWlsYWJsZSAqLw0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbnRlcmZhY2UtPmNvbm5lY3Rpb24gPSBYRU5TVE9SRV9DT05ORUNURUQ7
DQoNCkkgdGhpbmsgdGhlcmUgYXJlIGJhcnJpZXJzIG1pc3NpbmcgKGVzcGVjaWFsbHkgaW4g
b3JkZXIgdG8gd29yayBvbiBBcm0pPw0KDQpBbmQgSSB0aGluayB5b3Ugd2lsbCBicmVhayBk
b20wIHdpdGggY2FsbGluZyBkb21haW5fY29ubl9yZXNldCgpLCBhcyB0aGUNCmtlcm5lbCBt
aWdodCBhbHJlYWR5IGhhdmUgd3JpdHRlbiBkYXRhIGludG8gdGhlIHhlbmJ1cyBwYWdlLiBT
byB5b3UgbWlnaHQNCndhbnQgdG8gbWFrZSB0aGUgY2FsbCBkZXBlbmQgb24gIWlzX21hc3Rl
cl9kb21haW4uDQoNCg0KSnVlcmdlbg0K
--------------3Fd0Q0UDsfMiJdb1Utf8YC0a
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------3Fd0Q0UDsfMiJdb1Utf8YC0a--

--------------pCCo8kU23o0UY5ep3g9fRqkn--

--------------LKvmCwmwmvjJzje9EwrTHrka
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRSfEMFAwAAAAAACgkQsN6d1ii/Ey8G
9Af+NEwenYC1cdXgo/lIM3vfvV5ynElLMzFKBEG6TxJHrMLGsNvYonkVl1O3gf6EsjBKZjZsSBta
AlFhsqPW4o/VLWWMxSR/Buyck3KLyEmsEnaH0lOqLEClOIS9lvYKZnMBrK1wPZzXYywy6VMr6kgO
8H7eVufMtt878b5tSPCwr7NTDa5fBM600MNYn1SAtW65kMHjwjB/4ZErh5lIFrJZRu+OtG8JZri4
qbnNHW416PpW0GDIwdu3AzQ69ZATsT9LuL3frTxyp86EOGONukItDPbjhuZX2dNyeY2Qrzec/HcY
jGUxCVjFhHMDsUS4YKw3Vdq7JEWnxAc/Mvfuq1LQgg==
=aWMQ
-----END PGP SIGNATURE-----

--------------LKvmCwmwmvjJzje9EwrTHrka--

