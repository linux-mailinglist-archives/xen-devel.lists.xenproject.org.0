Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34769B4976
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 13:17:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827356.1241950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5l9s-0008WI-RY; Tue, 29 Oct 2024 12:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827356.1241950; Tue, 29 Oct 2024 12:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5l9s-0008Sp-NR; Tue, 29 Oct 2024 12:17:12 +0000
Received: by outflank-mailman (input) for mailman id 827356;
 Tue, 29 Oct 2024 12:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uXRL=RZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t5l9r-0008SQ-90
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 12:17:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5db8cc8-95ef-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 13:17:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6CC5B1FE6C;
 Tue, 29 Oct 2024 12:17:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E246136A5;
 Tue, 29 Oct 2024 12:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WgItDD/SIGf2VAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 29 Oct 2024 12:17:03 +0000
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
X-Inumbo-ID: b5db8cc8-95ef-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5NS4xMzUuMjIzLjEzMSIsImhlbG8iOiJzbXRwLW91dDIuc3VzZS5kZSJ9
X-Custom-Transaction: eyJpZCI6ImI1ZGI4Y2M4LTk1ZWYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjA0MjI4LjQ3ODQ2OSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1730204224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4vFi6pAHciU773ywiaskr/mBUMx5VR/SZi+XZE16DNc=;
	b=nrauY2MU3zUyxP90uoxX6CmMJDVSwmb9KUksY9vSw13GBen1DICcf9SyK04GBGEJSrAcMK
	cfPOIna0jwWlCdJUnDUQk5d1nlhgo87Knk0NZwQ8CyTf+VH8zS6MzS4P2YRI2jgDTWVUVK
	7nLE8f/gP93DEkyZosjIDZ7y/S0qhtk=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1730204223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4vFi6pAHciU773ywiaskr/mBUMx5VR/SZi+XZE16DNc=;
	b=PxD0gRYivi9DXN/8WaYVRf+RkgU3bcw4Vxfd1m+QWPOFnxGb4VISTR2b6y5ZxKWsF5n1Or
	l8yRJkAbJIDOExSDEsTmO2HXWXoqir7CgjtiHzi4TJqecBsfQYxQ7JLm58jNNr8W8JVSt8
	q8g3UlBbO/091IqkVT8gqxDe6UdZhT8=
Message-ID: <2894832c-a7c8-4f60-8484-c2eca7927e7e@suse.com>
Date: Tue, 29 Oct 2024 13:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Mini-OS PATCH] Add missing symbol exports for grub-pv
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Natanael Copa <ncopa@alpinelinux.org>
References: <20241029114158.17231-1-jgross@suse.com> <ZyDL9fGtcouw9bar@begin>
 <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>
 <b13cc450-f032-44e2-bbbe-bdc98d4b7050@suse.com>
 <2846b6dc-4209-4f1e-8713-cb8e66ca789c@citrix.com>
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
In-Reply-To: <2846b6dc-4209-4f1e-8713-cb8e66ca789c@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kUjErIsUfEojt0vB488yZWXI"
X-Spam-Level: 
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid]
X-Spam-Score: -6.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kUjErIsUfEojt0vB488yZWXI
Content-Type: multipart/mixed; boundary="------------d2WiQPzGoK84nuXTNLV4Uil1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 Natanael Copa <ncopa@alpinelinux.org>
Message-ID: <2894832c-a7c8-4f60-8484-c2eca7927e7e@suse.com>
Subject: Re: [Mini-OS PATCH] Add missing symbol exports for grub-pv
References: <20241029114158.17231-1-jgross@suse.com> <ZyDL9fGtcouw9bar@begin>
 <2181e8fc-1066-4749-abca-e4f0de084770@citrix.com>
 <b13cc450-f032-44e2-bbbe-bdc98d4b7050@suse.com>
 <2846b6dc-4209-4f1e-8713-cb8e66ca789c@citrix.com>
In-Reply-To: <2846b6dc-4209-4f1e-8713-cb8e66ca789c@citrix.com>

--------------d2WiQPzGoK84nuXTNLV4Uil1
Content-Type: multipart/mixed; boundary="------------lYFRJhB9r2lOxYzYGRBqovef"

--------------lYFRJhB9r2lOxYzYGRBqovef
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMTAuMjQgMTM6MTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI5LzEwLzIw
MjQgMTI6MDIgcG0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAyOS4xMC4yNCAxMzow
MSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAyOS8xMC8yMDI0IDExOjUwIGFtLCBT
YW11ZWwgVGhpYmF1bHQgd3JvdGU6DQo+Pj4+IEp1ZXJnZW4gR3Jvc3MsIGxlIG1hci4gMjkg
b2N0LiAyMDI0IDEyOjQxOjU4ICswMTAwLCBhIGVjcml0Og0KPj4+Pj4gR3J1Yi1wdiBuZWVk
cyBzdGFydF9pbmZvX3VuaW9uIGFuZCBwaHlzX3RvX21hY2hpbmVfbWFwcGluZyB0byBiZQ0K
Pj4+Pj4gYWNjZXNzaWJsZS4gRXhwb3J0IGJvdGggc3ltYm9scy4NCj4+Pj4+DQo+Pj4+PiBG
aXhlczogMzM0MTFhMTFmODQ4ICgiTWluaS1PUzogaGlkZSBhbGwgc3ltYm9scyBub3QgZXhw
b3J0ZWQgdmlhDQo+Pj4+PiBFWFBPUlRfU1lNQk9MUygpIikNCj4+Pj4+IFJlcG9ydGVkLWJ5
OiBOYXRhbmFlbCBDb3BhIDxuY29wYUBhbHBpbmVsaW51eC5vcmc+DQo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+IFJldmlld2Vk
LWJ5OiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlvbi5vcmc+DQo+
Pj4NCj4+PiBDb21taXR0ZWQuDQo+Pj4NCj4+PiBKdXJnZW4sIHdoYXQgZG8geW91IHdhbnQg
dG8gZG8gd2l0aCB1cGRhdGluZyA0LjE5P8KgIERvbid0IHdlIG5lZWQgdG8NCj4+PiBmb3Jr
IGEgNC4xOSBicmFuY2ggdG8gYXZvaWQgdGhlIENPTkZJR19YQyBjaGFuZ2UgPw0KPj4NCj4+
IFllcywgSSB0aGluayB0aGlzIGlzIHRoZSB3YXkgdG8gZ28uDQo+IA0KPiBPay7CoCBodHRw
czovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9bWluaS1vcy5naXQ7YT1zdW1tYXJ5DQo+
IA0KPiBtYXN0ZXIgaGFzIHRoaXMgZml4LCBhbmQgdGhlcmUncyBhIG5ldyBicmFuY2gsIHhl
bi1zdGFibGUtNC4xOSwgc3RhcnRpbmcNCj4gZnJvbSB0aGUgeGVuLVJFTEVBU0UtNC4xOS4w
IHRhZyB3aXRoIHRoaXMgY2hhbmdlIGJhY2twb3J0ZWQuDQo+IA0KPiBYZW4gNC4xOCBhbmQg
ZWFybGllciBkb24ndCBoYXZlIHRoZSBzeW1ib2wgcmVzdHJpY3Rpb25zLg0KDQpZb3Ugd2Fu
dCBhIHJlbGF0ZWQgcGF0Y2ggb24gdGhlIFhlbiA0LjE5IGJyYW5jaCB0byB1cGRhdGUgdGhl
IE1pbmktT1MNCmNvbW1pdCBpbiBDb25maWcubWsuDQoNCg0KSnVlcmdlbg0K
--------------lYFRJhB9r2lOxYzYGRBqovef
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lYFRJhB9r2lOxYzYGRBqovef--

--------------d2WiQPzGoK84nuXTNLV4Uil1--

--------------kUjErIsUfEojt0vB488yZWXI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcg0j4FAwAAAAAACgkQsN6d1ii/Ey+4
TAf/b5QOI7PGUaOifNWpo97GJgg89n6PyRhUDwlnsU2qgtvlctW5TxGMWpcDZKnQbdIQMSrhVeRo
/lxnwO69Hx+ysOkv666Rv5CMIIwkq80/jwlJyuifvX1j/tZmv7qXxDIVMRwZ8jjyIz1Aslw/WdlY
PfiS1fIAu0XPfKnM38vCvfDQK2f7+QIV7BPmDgb958kwAnQ4KNoz/4nhpN/MGvWTB9FXwRjMDfBT
Sfl/HRUt6pjFkBkqkpsNu2KJxy6PElNVJQZT6aPufO8ojPmlwECZn1rBFIJLfqzLWnmpDkg6XkoC
GXs/N/qRvQsK7j0q3DwXW4VvQdc4+exGmjAOdgu2ow==
=g6yh
-----END PGP SIGNATURE-----

--------------kUjErIsUfEojt0vB488yZWXI--

