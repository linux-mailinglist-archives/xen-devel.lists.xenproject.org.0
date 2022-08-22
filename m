Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A759B8AE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 07:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391170.628892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPzom-0007f5-5N; Mon, 22 Aug 2022 05:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391170.628892; Mon, 22 Aug 2022 05:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPzom-0007d9-22; Mon, 22 Aug 2022 05:17:44 +0000
Received: by outflank-mailman (input) for mailman id 391170;
 Mon, 22 Aug 2022 05:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtSS=Y2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oPzol-0007cu-3O
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 05:17:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bef0515b-21d9-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 07:17:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 123B5350BE;
 Mon, 22 Aug 2022 05:17:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEFEF13523;
 Mon, 22 Aug 2022 05:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ax/bLHQRA2ORdwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 22 Aug 2022 05:17:40 +0000
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
X-Inumbo-ID: bef0515b-21d9-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661145461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vY1VH6lzIy1Y3/cwRE8IBW/WLXqJEr5eviMiPFX0swQ=;
	b=HBZEF7XSESCertmpJliJY4FEAGK5r/EXPrw26qxuyQ5/V/1rH+j2snQNrKyjJVer9l+eaU
	T4itY8Lle5XGowj+UnMh5IPf/rt5g9SyU+ewpDRSLFXqaQoa9fjhLVno7wpqwx0OXePDBu
	dhNB3XOFIC/pZTk+ovSi51TDHVYh7JI=
Message-ID: <f205da1c-db33-299c-5fc6-922a8ebd1983@suse.com>
Date: Mon, 22 Aug 2022 07:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/10] x86/mtrr: fix MTRR fixup on APs
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-2-jgross@suse.com> <YwIkV7mYAC4Ebbwb@zn.tnic>
 <YwKmcFuKlq3/MzVi@zn.tnic>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YwKmcFuKlq3/MzVi@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rgQoxPG8PxAqRPi5h4dr3iHz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rgQoxPG8PxAqRPi5h4dr3iHz
Content-Type: multipart/mixed; boundary="------------deTqKyETXm5My9umETo0yKcn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Message-ID: <f205da1c-db33-299c-5fc6-922a8ebd1983@suse.com>
Subject: Re: [PATCH v2 01/10] x86/mtrr: fix MTRR fixup on APs
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-2-jgross@suse.com> <YwIkV7mYAC4Ebbwb@zn.tnic>
 <YwKmcFuKlq3/MzVi@zn.tnic>
In-Reply-To: <YwKmcFuKlq3/MzVi@zn.tnic>

--------------deTqKyETXm5My9umETo0yKcn
Content-Type: multipart/mixed; boundary="------------yphORmUAsvDAEqIX7KyC60fC"

--------------yphORmUAsvDAEqIX7KyC60fC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDguMjIgMjM6NDEsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gU3VuLCBB
dWcgMjEsIDIwMjIgYXQgMDI6MjU6NTlQTSArMDIwMCwgQm9yaXNsYXYgUGV0a292IHdyb3Rl
Og0KPj4+IEZpeCB0aGF0IGJ5IHVzaW5nIHBlcmNwdSB2YXJpYWJsZXMgZm9yIHNhdmluZyB0
aGUgTVNSIGNvbnRlbnRzLg0KPj4+DQo+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcN
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
Pj4gLS0tDQo+Pj4gSSB0aG91Z2h0IGFkZGluZyBhICJGaXhlczoiIHRhZyBmb3IgdGhlIGtl
cm5lbCdzIGluaXRpYWwgZ2l0IGNvbW1pdA0KPj4+IHdvdWxkIG1heWJlIGJlIGVudGVydGFp
bmluZywgYnV0IHdpdGhvdXQgYmVpbmcgcmVhbGx5IGhlbHBmdWwuDQo+Pj4gVGhlIHBlcmNw
dSB2YXJpYWJsZXMgd2VyZSBwcmVmZXJyZWQgb3ZlciBvbi1zdGFjayBvbmVzIGluIG9yZGVy
IHRvDQo+Pj4gYXZvaWQgbW9yZSBjb2RlIGNodXJuIGluIGZvbGxvd3VwIHBhdGNoZXMgZGVj
b3VwbGluZyBQQVQgZnJvbSBNVFJSDQo+Pj4gc3VwcG9ydC4NCj4+DQo+PiBTbyBpZiB0aGF0
IHRoaW5nIGhhcyBiZWVuIGJyb2tlbiBmb3Igc28gbG9uZyBhbmQgbm8gb25lIG5vdGljZWQs
IHdlDQo+PiBjb3VsZCBqdXN0IGFzIHdlbGwgbm90IGJhY2twb3J0IHRvIHN0YWJsZSBhdCBh
bGwuLi4NCj4gDQo+IFllYWgsIHlvdSBjYW4ndCBkbyB0aGF0Lg0KPiANCj4gVGhlIHdob2xl
IGRheSB0b2RheSBJIGtlcHQgdGhpbmtpbmcgdGhhdCBzb21ldGhpbmcncyB3cm9uZyB3aXRo
IHRoaXMNCj4gaGVyZS4gQXMgaW4sIHdoeSBoYXNuJ3QgaXQgYmVlbiByZXBvcnRlZCB1bnRp
bCBub3cuDQo+IA0KPiBZb3Ugc2F5IGFib3ZlOg0KPiANCj4gIi4uLiBmb3IgYWxsIGNwdXMg
aXMgcmFjeSBpbiBjYXNlIHRoZSBNU1IgY29udGVudHMgZGlmZmVyIGFjcm9zcyBjcHVzLiIN
Cj4gDQo+IEJ1dCB0aGV5IGRvbid0IGRpZmZlcjoNCj4gDQo+ICI3LjcuNSBNVFJScyBpbiBN
dWx0aS1Qcm9jZXNzaW5nIEVudmlyb25tZW50cw0KPiANCj4gSW4gbXVsdGktcHJvY2Vzc2lu
ZyBlbnZpcm9ubWVudHMsIHRoZSBNVFJScyBsb2NhdGVkIGluIGFsbCBwcm9jZXNzb3JzDQo+
IG11c3QgY2hhcmFjdGVyaXplIG1lbW9yeSBpbiB0aGUgc2FtZSB3YXkuIEdlbmVyYWxseSwg
dGhpcyBtZWFucyB0aGF0DQo+IGlkZW50aWNhbCB2YWx1ZXMgYXJlIHdyaXR0ZW4gdG8gdGhl
IE1UUlJzIHVzZWQgYnkgdGhlIHByb2Nlc3NvcnMuIFRoaXMNCj4gYWxzbyBtZWFucyB0aGF0
IHZhbHVlcyBDUjAuQ0QgYW5kIHRoZSBQQVQgbXVzdCBiZSBjb25zaXN0ZW50IGFjcm9zcw0K
PiBwcm9jZXNzb3JzLiBGYWlsdXJlIHRvIGRvIHNvIG1heSByZXN1bHQgaW4gY29oZXJlbmN5
IHZpb2xhdGlvbnMgb3IgbG9zcw0KPiBvZiBhdG9taWNpdHkuIFByb2Nlc3NvciBpbXBsZW1l
bnRhdGlvbnMgZG8gbm90IGNoZWNrIHRoZSBNVFJSIHNldHRpbmdzDQo+IGluIG90aGVyIHBy
b2Nlc3NvcnMgdG8gZW5zdXJlIGNvbnNpc3RlbmN5LiBJdCBpcyB0aGUgcmVzcG9uc2liaWxp
dHkgb2YNCj4gc3lzdGVtIHNvZnR3YXJlIHRvIGluaXRpYWxpemUgYW5kIG1haW50YWluIE1U
UlIgY29uc2lzdGVuY3kgYWNyb3NzIGFsbA0KPiBwcm9jZXNzb3JzLiINCj4gDQo+IEFuZCB5
b3UgY2FuJ3QgaGF2ZSBkaWZmZXJlbnQgZml4ZWQgTVRSUiB0eXBlIG9uIGVhY2ggQ1BVIC0g
dGhhdCB3b3VsZA0KPiBsZWFkIHRvIGFsbCBraW5kcyBvZiBuYXN0eSBidWdzLg0KPiANCj4g
QW5kIGhlcmUncyBmcm9tIGEgYmlnIGZhdCBib3g6DQo+IA0KPiAkIHJkbXNyIC1hIDB4MmZm
IHwgdW5pcSAtYw0KPiAgICAgIDI1NiBjMDANCj4gDQo+IEFsbCAyNTYgQ1BVcyBoYXZlIHRo
ZSBkZWYgdHlwZSBzZXQgdG8gdGhlIHNhbWUgdGhpbmcuDQo+IA0KPiBOb3csIGlmIGFsbCBD
UFVzIGdvIHdyaXRlIHRoYXQgc2FtZSBkZWZ0eXBlX2xvIHZhcmlhYmxlIGluIHRoZQ0KPiBy
ZW5kZXp2b3VzIGhhbmRsZXIsIHRoZSBvbmx5IGlzc3VlIHRoYXQgY291bGQgaGFwcGVuIGlz
IGlmIGEgcmVhZA0KPiBzZWVzIGEgcGFydGlhbCB3cml0ZS4gQlVULCBBRkFJSywgeDg2IGRv
ZXNuJ3QgdGVhciAzMi1iaXQgd3JpdGVzIHNvIEkNCj4gKnRoaW5rKiBhbGwgQ1BVcyBzZWUg
dGhlIHNhbWUgdmFsdWUgYmVpbmcgY29ycmVjdGVkIGJ5IHVzaW5nIG10cnJfc3RhdGUNCj4g
cHJldmlvdXNseSBzYXZlZCBvbiB0aGUgQlNQLg0KPiANCj4gQXMgSSBzYWlkLCB3ZSBzaG91
bGQndmUgc2VlbiB0aGlzIGV4cGxvZGluZyBsZWZ0IGFuZCByaWdodCBvdGhlcndpc2UuLi4N
Cg0KQW5kIHRoZW4gdGhlcmUgaXMgbXRycl9zdGF0ZV93YXJuKCkgaW4gYXJjaC94ODYva2Vy
bmVsL2NwdS9tdHJyL2dlbmVyaWMuYw0Kd2hpY2ggaGFzIGEgY29tbWVudCBzYXlpbmc6DQoN
Ci8qIFNvbWUgQklPUydzIGFyZSBtZXNzZWQgdXAgYW5kIGRvbid0IHNldCBhbGwgTVRSUnMg
dGhlIHNhbWUhICovDQoNClllcywgdGhlIGNoYW5jZXMgYXJlIHNsaW0gdG8gaGl0IHN1Y2gg
YSBib3gsIGJ1dCB5b3VyIHJlYXNvbmluZyBzdWdnZXN0cw0KSSBzaG91bGQgcmVtb3ZlIHRo
ZSByZWxhdGVkIGNvZGU/DQoNCg0KSnVlcmdlbg0K
--------------yphORmUAsvDAEqIX7KyC60fC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yphORmUAsvDAEqIX7KyC60fC--

--------------deTqKyETXm5My9umETo0yKcn--

--------------rgQoxPG8PxAqRPi5h4dr3iHz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMDEXQFAwAAAAAACgkQsN6d1ii/Ey+K
uAf9ErHr/q4mtRTikw5ZZb+gOGyCc5mQVvD5RuFlHFGttHwwSvmxAWlgEsqb6rQZA/tRVojtFjhK
dZzS0uSvK3bnGUW67nNOkgMzXMq5vt0ij0BLtzOozcBECdpKo5YyrcDMd6ehM8A04u3mKYfJWU4N
F+MZSADB5Ybn9rktoOBCG37blBle03PJbYAWQB2T1FZDtLsFBupsPrji8AzHoXyVsoSkZKpFzoS9
DPno3dmARyUgHY/BZHOLyFk3PQotRYJ0YmBLjrMP/oNdAWp4fpQyGaadtrFObKni7vXa4fD321f0
5DsGSjSSDaM1Nyx/XdCjRAszyFsewiaQhrdvwJ4ZFg==
=d92A
-----END PGP SIGNATURE-----

--------------rgQoxPG8PxAqRPi5h4dr3iHz--

