Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD280E43E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 07:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652647.1018625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwDy-0002L5-Oj; Tue, 12 Dec 2023 06:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652647.1018625; Tue, 12 Dec 2023 06:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCwDy-0002Hy-M4; Tue, 12 Dec 2023 06:26:34 +0000
Received: by outflank-mailman (input) for mailman id 652647;
 Tue, 12 Dec 2023 06:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCwDx-0002Hq-0N
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 06:26:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63c54cc2-98b7-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 07:26:32 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 108E82247E;
 Tue, 12 Dec 2023 06:26:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA9AA136C7;
 Tue, 12 Dec 2023 06:26:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RDWcMxb9d2WiTQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 06:26:30 +0000
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
X-Inumbo-ID: 63c54cc2-98b7-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702362391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s6xbaBTQOrj7vKm0fwHcZWKVdMxFBUAXRygZl9oliv0=;
	b=bwxGRl3AdOqQtUBWqPkTpuftrYgvBFPfgNk09YsEz+FxNvAXjoAmefu4FepOgMPDV30cow
	ByBMXmx7AqnpEdqGByselHUgYDanEQOMkJbYrUS7m6PlqxJ93+2RXQ3oNCuHt9goH4gbPK
	2G39HKvrGHJGR+dwAHwagFhM5wqyz7w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702362391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s6xbaBTQOrj7vKm0fwHcZWKVdMxFBUAXRygZl9oliv0=;
	b=bwxGRl3AdOqQtUBWqPkTpuftrYgvBFPfgNk09YsEz+FxNvAXjoAmefu4FepOgMPDV30cow
	ByBMXmx7AqnpEdqGByselHUgYDanEQOMkJbYrUS7m6PlqxJ93+2RXQ3oNCuHt9goH4gbPK
	2G39HKvrGHJGR+dwAHwagFhM5wqyz7w=
Message-ID: <b300f3ac-cf83-4ba7-9c93-c78bec0b38d2@suse.com>
Date: Tue, 12 Dec 2023 07:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenstored: potentially split trace_io() out message
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231123160834.17674-1-jgross@suse.com>
 <c5a72070-fb63-4c05-a34e-e5abcb781ea2@xen.org>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <c5a72070-fb63-4c05-a34e-e5abcb781ea2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7oaqwcbTY30EtE3IhVgE3FoW"
X-Spam-Level: ****************
X-Spam-Flag: NO
X-Spam-Score: 16.91
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=bwxGRl3A;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-10.95 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 SIGNED_PGP(-2.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.05)[60.55%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -10.95
X-Rspamd-Queue-Id: 108E82247E
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7oaqwcbTY30EtE3IhVgE3FoW
Content-Type: multipart/mixed; boundary="------------5y9Vuqkq6qR66XJLxGqkKawc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <b300f3ac-cf83-4ba7-9c93-c78bec0b38d2@suse.com>
Subject: Re: [PATCH] tools/xenstored: potentially split trace_io() out message
References: <20231123160834.17674-1-jgross@suse.com>
 <c5a72070-fb63-4c05-a34e-e5abcb781ea2@xen.org>
In-Reply-To: <c5a72070-fb63-4c05-a34e-e5abcb781ea2@xen.org>

--------------5y9Vuqkq6qR66XJLxGqkKawc
Content-Type: multipart/mixed; boundary="------------VsGyncIkv8E9bolJdq3Iopns"

--------------VsGyncIkv8E9bolJdq3Iopns
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMTIuMjMgMjA6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIzLzExLzIwMjMgMTY6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSB3cml0ZV9tZXNzYWdlcygpIHdpbGwgY2FsbCB0cmFjZV9pbygpIGFmdGVyIGhhdmlu
ZyB3cml0dGVuIHRoZQ0KPj4gY29tcGxldGUgbWVzc2FnZSB0byB0aGUgcmluZyBidWZmZXIg
b3Igc29ja2V0Lg0KPj4NCj4+IEluIGNhc2UgdGhlIG1lc3NhZ2UgY2FuJ3QgYmUgd3JpdHRl
biBpbiBvbmUgZ28sIHNwbGl0IGl0IGJ5IHdyaXRpbmcNCj4+IG9uZSB0cmFjZSBlbnRyeSB3
aGVuIHN0YXJ0aW5nIHRoZSB3cml0ZSBhbmQgb25lIHdoZW4gZmluaXNoaW5nIGl0Lg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4g
DQo+IFdpdGggb25lIHJlbWFyayBiZWxvdzoNCj4gDQo+IFJldmlld2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4+IC0tLQ0KPj4gVGhpcyBwYXRjaCBp
cyBtZWFudCB0byBnbyBvbiB0b3Agb2YgdGhlIHBhdGNoICJ0b29scy94ZW5zdG9yZWQ6IHJl
bW92ZQ0KPj4gXCItVlwiIGNvbW1hbmQgbGluZSBvcHRpb24iIGluIG9yZGVyIHRvIG5vdCBs
b3NlIGFueSBwb3NzaWJsZSBkZWJ1Zw0KPj4gaW5mb3JtYXRpb24uDQo+PiAtLS0NCj4+IMKg
IHRvb2xzL3hlbnN0b3JlZC9jb3JlLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuYyBi
L3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+IGluZGV4IDkwNDZiMjAwYmMuLmExNGIyNDBl
ZDkgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+PiArKysgYi90
b29scy94ZW5zdG9yZWQvY29yZS5jDQo+PiBAQCAtMTIxLDcgKzEyMSw3IEBAIHZvaWQgdHJh
Y2UoY29uc3QgY2hhciAqZm10LCAuLi4pDQo+PiDCoCBzdGF0aWMgdm9pZCB0cmFjZV9pbyhj
b25zdCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29uc3Qgc3RydWN0IGJ1ZmZlcmVkX2RhdGEgKmRhdGEsDQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGludCBvdXQpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0IGNoYXIgKnR5cGUpDQo+IA0KPiBUaGlzIGNoYW5nZSBzZWVtcyBzb21ld2hh
dCB1bnJlbGF0ZWQuIEl0IHdvdWxkIGJlIHdvcnRoIG1lbnRpb25pbmcgaXQgaW4gdGhlIA0K
PiBjb21taXQgbWVzc2FnZS4NCj4gDQo+IElmIHlvdSBwcm9wb3NlIGEgbmV3IHdvcmRpbmcs
IEkgY2FuIHVwZGF0ZSBpdCB3aGlsZSBjb21taXR0aW5nLg0KDQpXaGF0IGFib3V0Og0KDQpJ
biBvcmRlciB0byBkaXN0aW5ndWlzaCBhIGNvbXBsZXRlIE9VVCBtZXNzYWdlIGZyb20gYSBz
cGxpdCBvbmUsIGxldCB0aGUNCmNhbGxlciBvZiB0cmFjZV9pbyBzcGVjaWZ5IHRoZSBwcmVm
aXggc3RyaW5nICgiSU4iLCAiT1VUIiwgIk9VVChTVEFSVCkiLA0KIk9VVChFTkQpIikgZGly
ZWN0bHkgaW5zdGVhZCB2aWEgYW4gaW50Lg0KDQoNCkp1ZXJnZW4NCg==
--------------VsGyncIkv8E9bolJdq3Iopns
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------VsGyncIkv8E9bolJdq3Iopns--

--------------5y9Vuqkq6qR66XJLxGqkKawc--

--------------7oaqwcbTY30EtE3IhVgE3FoW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV3/RYFAwAAAAAACgkQsN6d1ii/Ey/L
DwgAl5l7JH9OEWU4W9xlMDs0/wHAKnmwOUM+tpDwhWIaWmr1x0Bsb6pwDFMRCRZpFgVDQldOv5bD
t9z9a81gp8n9A3HV5mPmw027XDY0gZ8tzjuEoaZ7KdRhVEK2vgXztkOpYkaZUtQ6sdEOUkDkLFwW
oj1Mc0dp0EgOu21bjsHoMouehk8YHnXjEK9lovsJXGfOODHmc2M3z8pfW+JBNr/YXzP90+A7IHTU
Z2S2RV/CQYAWtLlgpTTSU3Y3ddCovsdF1th8NjUW0JFHfLm296DUkh7IA0UlsBg0XqzpiB9Z3HSL
4BPzu+a7r5di924ZKu0Ru480X7CA3k7VI3hjhbpgeA==
=jQH8
-----END PGP SIGNATURE-----

--------------7oaqwcbTY30EtE3IhVgE3FoW--

