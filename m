Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6616C29FE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 06:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512205.792002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peUoz-00033N-MQ; Tue, 21 Mar 2023 05:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512205.792002; Tue, 21 Mar 2023 05:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peUoz-00030E-J5; Tue, 21 Mar 2023 05:46:09 +0000
Received: by outflank-mailman (input) for mailman id 512205;
 Tue, 21 Mar 2023 05:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YM/b=7N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1peUox-000308-Sw
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 05:46:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a90548a9-c7ab-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 06:46:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5999B21A70;
 Tue, 21 Mar 2023 05:46:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3612713443;
 Tue, 21 Mar 2023 05:46:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CXKJC5hEGWSWSAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Mar 2023 05:46:00 +0000
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
X-Inumbo-ID: a90548a9-c7ab-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679377560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pswkUkxlRFMc/GMwBiiT50Ayi8etmPNuzZUGTe1LIJU=;
	b=NqNJcFTkWGMaX5rc6Yp4aNrdKFFn+18FtWIXrLngkIHMcad4BCwFZeB5JsYVDWx5bGudrl
	N5+/XIRISKd3WcUXcm7BPf4s91D/hr3lJYvLkmp5BPfJIVKxtcWSY4g/a3padde3liP//w
	XrLKkxMetECrcbFqBw2wDxqVbVIL898=
Message-ID: <46c79eed-e141-1eda-26ed-04e3837715f0@suse.com>
Date: Tue, 21 Mar 2023 06:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] tools/xl: rework p9 config parsing
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230317111546.18061-1-jgross@suse.com>
 <20230317111546.18061-3-jgross@suse.com>
 <CAKf6xpuaXyPqP72QwjaZZM2ana68ZG9kXQyHr9Vd7Y-_1YDV2A@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <CAKf6xpuaXyPqP72QwjaZZM2ana68ZG9kXQyHr9Vd7Y-_1YDV2A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T0Du6TjBb5uHOYe08tudX36N"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T0Du6TjBb5uHOYe08tudX36N
Content-Type: multipart/mixed; boundary="------------0OkP78cPCGziWeBATIvG9Vfx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <46c79eed-e141-1eda-26ed-04e3837715f0@suse.com>
Subject: Re: [PATCH 2/2] tools/xl: rework p9 config parsing
References: <20230317111546.18061-1-jgross@suse.com>
 <20230317111546.18061-3-jgross@suse.com>
 <CAKf6xpuaXyPqP72QwjaZZM2ana68ZG9kXQyHr9Vd7Y-_1YDV2A@mail.gmail.com>
In-Reply-To: <CAKf6xpuaXyPqP72QwjaZZM2ana68ZG9kXQyHr9Vd7Y-_1YDV2A@mail.gmail.com>

--------------0OkP78cPCGziWeBATIvG9Vfx
Content-Type: multipart/mixed; boundary="------------CO4qJRD5JpikSAG8iZPH3nVN"

--------------CO4qJRD5JpikSAG8iZPH3nVN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDMuMjMgMTg6MTIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFy
IDE3LCAyMDIzIGF0IDc6MTbigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IFJld29yayB0aGUgY29uZmlnIHBhcnNpbmcgb2YgYSBwOSBkZXZp
Y2UgdG8gdXNlIHRoZQ0KPj4gc3BsaXRfc3RyaW5nX2ludG9fcGFpcigpIGZ1bmN0aW9uIGlu
c3RlYWQgb2Ygb3BlbiBjb2RpbmcgaXQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiAgIHRvb2xzL3hsL3hsX3Bh
cnNlLmMgfCA3MiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94bC94bF9wYXJzZS5jIGIvdG9vbHMv
eGwveGxfcGFyc2UuYw0KPj4gaW5kZXggMmY5ZGZlYTA1Yy4uNzE1ZTE0Zjk1ZiAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMNCj4+ICsrKyBiL3Rvb2xzL3hsL3hsX3Bh
cnNlLmMNCj4+IEBAIC0yMTExLDU0ICsyMTExLDUyIEBAIHZvaWQgcGFyc2VfY29uZmlnX2Rh
dGEoY29uc3QgY2hhciAqY29uZmlnX3NvdXJjZSwNCj4+DQo+PiAgICAgICBpZiAoIXhsdV9j
ZmdfZ2V0X2xpc3QoY29uZmlnLCAicDkiLCAmcDlkZXZzLCAwLCAwKSkgew0KPj4gICAgICAg
ICAgIGxpYnhsX2RldmljZV9wOSAqcDk7DQo+PiAtICAgICAgICBjaGFyICpzZWN1cml0eV9t
b2RlbCA9IE5VTEw7DQo+PiAtICAgICAgICBjaGFyICpwYXRoID0gTlVMTDsNCj4+IC0gICAg
ICAgIGNoYXIgKnRhZyA9IE5VTEw7DQo+PiAtICAgICAgICBjaGFyICpiYWNrZW5kID0gTlVM
TDsNCj4+IC0gICAgICAgIGNoYXIgKnAsICpwMiwgKmJ1ZjI7DQo+Pg0KPj4gICAgICAgICAg
IGRfY29uZmlnLT5udW1fcDlzID0gMDsNCj4+ICAgICAgICAgICBkX2NvbmZpZy0+cDlzID0g
TlVMTDsNCj4+ICAgICAgICAgICB3aGlsZSAoKGJ1ZiA9IHhsdV9jZmdfZ2V0X2xpc3RpdGVt
IChwOWRldnMsIGRfY29uZmlnLT5udW1fcDlzKSkgIT0gTlVMTCkgew0KPj4gKyAgICAgICAg
ICAgIGxpYnhsX3N0cmluZ19saXN0IHBhaXJzOw0KPj4gKyAgICAgICAgICAgIGludCBsZW47
DQo+PiArDQo+PiAgICAgICAgICAgICAgIHA5ID0gQVJSQVlfRVhURU5EX0lOSVQoZF9jb25m
aWctPnA5cywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkX2Nv
bmZpZy0+bnVtX3A5cywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaWJ4bF9kZXZpY2VfcDlfaW5pdCk7DQo+PiAgICAgICAgICAgICAgIGxpYnhsX2Rldmlj
ZV9wOV9pbml0KHA5KTsNCj4+DQo+PiAtICAgICAgICAgICAgYnVmMiA9IHN0cmR1cChidWYp
Ow0KPj4gLSAgICAgICAgICAgIHAgPSBzdHJ0b2soYnVmMiwgIiwiKTsNCj4+IC0gICAgICAg
ICAgICBpZihwKSB7DQo+PiAtICAgICAgICAgICAgICAgZG8gew0KPj4gLSAgICAgICAgICAg
ICAgICAgIHdoaWxlKCpwID09ICcgJykNCj4+IC0gICAgICAgICAgICAgICAgICAgICArK3A7
DQo+PiAtICAgICAgICAgICAgICAgICAgaWYgKChwMiA9IHN0cmNocihwLCAnPScpKSA9PSBO
VUxMKQ0KPj4gLSAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gLSAgICAgICAgICAg
ICAgICAgICpwMiA9ICdcMCc7DQo+PiAtICAgICAgICAgICAgICAgICAgaWYgKCFzdHJjbXAo
cCwgInNlY3VyaXR5X21vZGVsIikpIHsNCj4+IC0gICAgICAgICAgICAgICAgICAgICBzZWN1
cml0eV9tb2RlbCA9IHN0cmR1cChwMiArIDEpOw0KPj4gLSAgICAgICAgICAgICAgICAgIH0g
ZWxzZSBpZighc3RyY21wKHAsICJwYXRoIikpIHsNCj4+IC0gICAgICAgICAgICAgICAgICAg
ICBwYXRoID0gc3RyZHVwKHAyICsgMSk7DQo+PiAtICAgICAgICAgICAgICAgICAgfSBlbHNl
IGlmKCFzdHJjbXAocCwgInRhZyIpKSB7DQo+PiAtICAgICAgICAgICAgICAgICAgICAgdGFn
ID0gc3RyZHVwKHAyICsgMSk7DQo+PiAtICAgICAgICAgICAgICAgICAgfSBlbHNlIGlmKCFz
dHJjbXAocCwgImJhY2tlbmQiKSkgew0KPj4gLSAgICAgICAgICAgICAgICAgICAgIGJhY2tl
bmQgPSBzdHJkdXAocDIgKyAxKTsNCj4+IC0gICAgICAgICAgICAgICAgICB9IGVsc2Ugew0K
Pj4gLSAgICAgICAgICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiVW5rbm93biBzdHJp
bmcgYCVzJyBpbiA5cGZzIHNwZWNcbiIsIHApOw0KPj4gLSAgICAgICAgICAgICAgICAgICAg
IGV4aXQoMSk7DQo+PiAtICAgICAgICAgICAgICAgICAgfQ0KPj4gLSAgICAgICAgICAgICAg
IH0gd2hpbGUgKChwID0gc3RydG9rKE5VTEwsICIsIikpICE9IE5VTEwpOw0KPj4gLSAgICAg
ICAgICAgIH0NCj4+IC0gICAgICAgICAgICBpZiAoIXBhdGggfHwgIXNlY3VyaXR5X21vZGVs
IHx8ICF0YWcpIHsNCj4+IC0gICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIjlwZnMg
c3BlYyBtaXNzaW5nIHJlcXVpcmVkIGZpZWxkIVxuIik7DQo+PiAtICAgICAgICAgICAgICAg
ZXhpdCgxKTsNCj4+ICsgICAgICAgICAgICBzcGxpdF9zdHJpbmdfaW50b19zdHJpbmdfbGlz
dChidWYsICIsIiwgJnBhaXJzKTsNCj4+ICsgICAgICAgICAgICBsZW4gPSBsaWJ4bF9zdHJp
bmdfbGlzdF9sZW5ndGgoJnBhaXJzKTsNCj4+ICsgICAgICAgICAgICBmb3IgKGkgPSAwOyBp
IDwgbGVuOyBpKyspIHsNCj4+ICsgICAgICAgICAgICAgICAgY2hhciAqa2V5LCAqdmFsdWU7
DQo+PiArICAgICAgICAgICAgICAgIGludCByYzsNCj4+ICsNCj4+ICsgICAgICAgICAgICAg
ICAgcmMgPSBzcGxpdF9zdHJpbmdfaW50b19wYWlyKHBhaXJzW2ldLCAiPSIsICZrZXksICZ2
YWx1ZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlzc3BhY2UpOw0KPj4gKyAgICAgICAgICAgICAgICBpZiAocmMgIT0gMCkgew0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJmYWlsZWQgdG8gcGFyc2UgOXBm
cyBjb25maWd1cmF0aW9uOiAlcyIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBhaXJzW2ldKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgIGV4aXQoMSk7DQo+PiArICAg
ICAgICAgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgICAgICAgICAgaWYgKCFzdHJjbXAo
a2V5LCAic2VjdXJpdHlfbW9kZWwiKSkgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgcmVw
bGFjZV9zdHJpbmcoJnA5LT5zZWN1cml0eV9tb2RlbCwgdmFsdWUpOw0KPj4gKyAgICAgICAg
ICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAoa2V5LCAicGF0aCIpKSB7DQo+PiArICAgICAg
ICAgICAgICAgICAgICByZXBsYWNlX3N0cmluZygmcDktPnBhdGgsIHZhbHVlKTsNCj4+ICsg
ICAgICAgICAgICAgICAgfSBlbHNlIGlmICghc3RyY21wKGtleSwgInRhZyIpKSB7DQo+PiAr
ICAgICAgICAgICAgICAgICAgICByZXBsYWNlX3N0cmluZygmcDktPnRhZywgdmFsdWUpOw0K
Pj4gKyAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAoa2V5LCAiYmFja2VuZCIp
KSB7DQo+PiArICAgICAgICAgICAgICAgICAgICByZXBsYWNlX3N0cmluZygmcDktPmJhY2tl
bmRfZG9tbmFtZSwgdmFsdWUpOw0KPj4gKyAgICAgICAgICAgICAgICB9IGVsc2Ugew0KPj4g
KyAgICAgICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJVbmtub3duIDlwZnMgcGFy
YW1ldGVyICclcydcbiIsIGtleSk7DQo+PiArICAgICAgICAgICAgICAgICAgICBleGl0KDEp
Ow0KPj4gKyAgICAgICAgICAgICAgICB9DQo+PiArICAgICAgICAgICAgICAgIGZyZWUoa2V5
KTsNCj4+ICsgICAgICAgICAgICAgICAgZnJlZSh2YWx1ZSk7DQo+PiAgICAgICAgICAgICAg
IH0NCj4+IC0gICAgICAgICAgICBmcmVlKGJ1ZjIpOw0KPiANCj4gSSB0aGluayB5b3UgbmVl
ZCBsaWJ4bF9zdHJpbmdfbGlzdF9kaXNwb3NlKCZwYWlycyk7IHNvbWV3aGVyZSBhcm91bmQg
aGVyZT8NCg0KQWggeWVzLCB0aGFua3MgZm9yIG5vdGljaW5nLg0KDQoNCkp1ZXJnZW4NCg0K

--------------CO4qJRD5JpikSAG8iZPH3nVN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------CO4qJRD5JpikSAG8iZPH3nVN--

--------------0OkP78cPCGziWeBATIvG9Vfx--

--------------T0Du6TjBb5uHOYe08tudX36N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQZRJcFAwAAAAAACgkQsN6d1ii/Ey+F
rwf+JplMGwJm4iSt9igP5g1LKi8Z3v+cL9auUnz8I+/zyuxy+bzWBIp3EW0q5eiVlTmKfAIQtN41
oLIRuust7IeGkxJ3ojZvnKxmV0SaMr8fEi+0hLZH3cS8bYWm9btcT47HYGYNayPx6lagLBgtb0yr
Z+XWkNl4A+M7OCUo2zVtIxXuXLAsVlNQV4Q0HKv7qJXthYXvYM65t/LNu5B306+gGvMcSeEBJL++
fEnKaS2dQ+zIUDlEvXFJ4xicOh2982NjlPLYfTHMkzBpHsrVjrDQQ+0KBea5Wm3zWeYznSABGEKF
ZBnILYMFGvqpDR/TL31Qi7NQnaHk8ggxVA8SAs5JEw==
=6XN7
-----END PGP SIGNATURE-----

--------------T0Du6TjBb5uHOYe08tudX36N--

