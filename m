Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C887E41FD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628845.980725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NJB-0007yc-KT; Tue, 07 Nov 2023 14:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628845.980725; Tue, 07 Nov 2023 14:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NJB-0007wx-HX; Tue, 07 Nov 2023 14:44:01 +0000
Received: by outflank-mailman (input) for mailman id 628845;
 Tue, 07 Nov 2023 14:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ht7K=GU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r0NJ9-0007vY-NF
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:43:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15933d31-7d7c-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 15:43:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 906B21F37C;
 Tue,  7 Nov 2023 14:43:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65C9F132FD;
 Tue,  7 Nov 2023 14:43:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dscBFy5NSmU4CAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Nov 2023 14:43:58 +0000
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
X-Inumbo-ID: 15933d31-7d7c-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699368238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6a6kVDnRWKEvo692xIuvB+2PK7A331KJadRRizg6Hhg=;
	b=tckc0mknureTpfekxJdjS5Uw3ie6z2zezhscIxFJQ/YZitkwuLfS72eXrYCzy/LhFlpBMP
	3YjXnYV4e3O9ieHyfiVoVq+sYsyj6MVPbgDZTh9NeLeiBN+WDC35Rf9ReAkXsO+k+Q29i6
	WrgYJN9iRbveCCSoAP36ceKW72M2YBo=
Message-ID: <ce5dca09-206b-4a5f-af27-a27a109f1718@suse.com>
Date: Tue, 7 Nov 2023 15:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/29] tools/xenlogd: add 9pfs write request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-14-jgross@suse.com>
 <CAKf6xpvkEAv4RkPB_536=w2ysjuTbja7vsEg_xRTpotNDOGriw@mail.gmail.com>
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
In-Reply-To: <CAKf6xpvkEAv4RkPB_536=w2ysjuTbja7vsEg_xRTpotNDOGriw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------q1V4jvnzYo0O349UunOBP7ne"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------q1V4jvnzYo0O349UunOBP7ne
Content-Type: multipart/mixed; boundary="------------T9FSKVL08q3EowAHMwWnhPbs";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <ce5dca09-206b-4a5f-af27-a27a109f1718@suse.com>
Subject: Re: [PATCH 13/29] tools/xenlogd: add 9pfs write request support
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-14-jgross@suse.com>
 <CAKf6xpvkEAv4RkPB_536=w2ysjuTbja7vsEg_xRTpotNDOGriw@mail.gmail.com>
In-Reply-To: <CAKf6xpvkEAv4RkPB_536=w2ysjuTbja7vsEg_xRTpotNDOGriw@mail.gmail.com>

--------------T9FSKVL08q3EowAHMwWnhPbs
Content-Type: multipart/mixed; boundary="------------581AIm03w9ns4LrqMx9LkK8T"

--------------581AIm03w9ns4LrqMx9LkK8T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTEuMjMgMTU6MTAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNTo1NOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSB3cml0ZSByZXF1ZXN0IG9mIHRoZSA5cGZzIHByb3Rv
Y29sLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCj4+IC0tLQ0KPj4gICB0b29scy94ZW5sb2dkL2lvLmMgfCA1MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA1MCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbmxv
Z2QvaW8uYyBiL3Rvb2xzL3hlbmxvZ2QvaW8uYw0KPj4gaW5kZXggNmU5MjY2N2ZhYi4uNmI0
NjkyY2E2NyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbmxvZ2QvaW8uYw0KPj4gKysrIGIv
dG9vbHMveGVubG9nZC9pby5jDQo+IA0KPj4gQEAgLTEwMTAsNiArMTAxMSw1MSBAQCBzdGF0
aWMgdm9pZCBwOV9jcmVhdGUoZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBwOV9oZWFkZXIgKmhk
cikNCj4+ICAgICAgIGZpbGxfYnVmZmVyKGRldmljZSwgaGRyLT5jbWQgKyAxLCBoZHItPnRh
ZywgIlFVIiwgJnFpZCwgJmlvdW5pdCk7DQo+PiAgIH0NCj4+DQo+PiArc3RhdGljIHZvaWQg
cDlfd3JpdGUoZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBwOV9oZWFkZXIgKmhkcikNCj4+ICt7
DQo+PiArICAgIHVpbnQzMl90IGZpZDsNCj4+ICsgICAgdWludDY0X3Qgb2ZmOw0KPj4gKyAg
ICB1bnNpZ25lZCBpbnQgbGVuOw0KPj4gKyAgICB1aW50MzJfdCB3cml0dGVuOw0KPj4gKyAg
ICB2b2lkICpidWY7DQo+PiArICAgIHN0cnVjdCBwOV9maWQgKmZpZHA7DQo+PiArICAgIGlu
dCByZXQ7DQo+PiArDQo+PiArICAgIHJldCA9IGZpbGxfZGF0YShkZXZpY2UsICJVTEQiLCAm
ZmlkLCAmb2ZmLCAmbGVuLCBkZXZpY2UtPmJ1ZmZlcik7DQo+PiArICAgIGlmICggcmV0ICE9
IDMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwOV9lcnJvcihkZXZpY2UsIGhkci0+dGFn
LCBFSU5WQUwpOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+PiAr
ICAgIGZpZHAgPSBmaW5kX2ZpZChkZXZpY2UsIGZpZCk7DQo+PiArICAgIGlmICggIWZpZHAg
fHwgIWZpZHAtPm9wZW5lZCB8fCBmaWRwLT5pc2RpciApDQo+IA0KPiBJIHRoaW5rIHlvdSB3
YW50IGFuIGFkZGl0aW9uYWwgY2hlY2sgdGhhdCB0aGUgZmlkcCBpcyB3cml0YWJsZS4NCg0K
VGhlIG9wZW4gd2FzIGRvbmUgd2l0aCB0aGUgY29ycmVjdCBtb2RlLiBJZiBmaWRwIGlzbid0
IHdyaXRhYmxlLCB0aGUgd3JpdGUoKQ0Kd2lsbCBmYWlsIHdpdGggdGhlIGNvcnJlY3QgZXJy
bm8uDQoNCg0KSnVlcmdlbg0KDQo=
--------------581AIm03w9ns4LrqMx9LkK8T
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------581AIm03w9ns4LrqMx9LkK8T--

--------------T9FSKVL08q3EowAHMwWnhPbs--

--------------q1V4jvnzYo0O349UunOBP7ne
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVKTS0FAwAAAAAACgkQsN6d1ii/Ey8E
dQf+LdxK8nxFOfkHBENSdyXbuEoxSqhqvWCzFf31g/gA291Kq8JuiGqTIZj//oO+NqVU81WwOhwn
VNG7HbA7vD4oJ5UMp/XVUeTeYskZ8kE9FvZSPLz6OWZ586fmraXDSsnh0LlHEtSauUa6hAmnyjEl
ta4fa9CppUpwUE64SL0SHb9W9YBZEq+Y+zzHpTKT1vF88FHgm2ZcQZO5fa08V4UX94jwp0cXD03U
Wn9nYYkzq6AkBS5TK0HW5A3uzGFv/nwFtxH0L/lCSeIvvzpWm+8LKlD5tMo/6mxhYVLkkpmNd7em
4+f36aZT4RBKkCFqYXg7uj0qaFrbcxqrccsKKfSTwA==
=Ovnf
-----END PGP SIGNATURE-----

--------------q1V4jvnzYo0O349UunOBP7ne--

