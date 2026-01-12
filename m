Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D78AD12014
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:48:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200036.1516054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFTO-00048Q-6T; Mon, 12 Jan 2026 10:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200036.1516054; Mon, 12 Jan 2026 10:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFTO-00045U-3f; Mon, 12 Jan 2026 10:48:34 +0000
Received: by outflank-mailman (input) for mailman id 1200036;
 Mon, 12 Jan 2026 10:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pUjb=7R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vfFTM-00045G-AB
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:48:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c0b1412-efa4-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 11:48:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 734B8336D7;
 Mon, 12 Jan 2026 10:48:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 53E6C3EA63;
 Mon, 12 Jan 2026 10:48:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id knaNEn7RZGn/CgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 12 Jan 2026 10:48:30 +0000
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
X-Inumbo-ID: 3c0b1412-efa4-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768214910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RKzCs3EHfscXaf27uIc/6u29nG95jbTHMErvKP3MT5Q=;
	b=qPeo3UuRHWvz5kAYrbnCNRAfq9cB9P0k6VB4KW7BIXunBYaW1s2rn1iynrAoNmamoMC3Gb
	GSx5FqPVbg76s7/kcJJ8QnePps69/dXImD2W/ktXhK7OvxpMFNWvgrpcg7Iux/wKf/m2GZ
	yWN+mmy4poMB5bco2N3yBbdKZB0emCk=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qPeo3UuR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1768214910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RKzCs3EHfscXaf27uIc/6u29nG95jbTHMErvKP3MT5Q=;
	b=qPeo3UuRHWvz5kAYrbnCNRAfq9cB9P0k6VB4KW7BIXunBYaW1s2rn1iynrAoNmamoMC3Gb
	GSx5FqPVbg76s7/kcJJ8QnePps69/dXImD2W/ktXhK7OvxpMFNWvgrpcg7Iux/wKf/m2GZ
	yWN+mmy4poMB5bco2N3yBbdKZB0emCk=
Message-ID: <20e1bbdf-da94-48ed-84d0-7050436c3b6e@suse.com>
Date: Mon, 12 Jan 2026 11:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: introduce xen_console_io option
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601091515310.992863@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601091515310.992863@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PGQlewguDXdt21TBRvFJvcjw"
X-Spam-Score: -5.41
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 734B8336D7
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PGQlewguDXdt21TBRvFJvcjw
Content-Type: multipart/mixed; boundary="------------9wlGni05LTNQe0IgfptKbKsi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org
Message-ID: <20e1bbdf-da94-48ed-84d0-7050436c3b6e@suse.com>
Subject: Re: [PATCH] xen: introduce xen_console_io option
References: <alpine.DEB.2.22.394.2601091515310.992863@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2601091515310.992863@ubuntu-linux-20-04-desktop>

--------------9wlGni05LTNQe0IgfptKbKsi
Content-Type: multipart/mixed; boundary="------------oja8Yxxh93BJdDnSK4Gr4k6e"

--------------oja8Yxxh93BJdDnSK4Gr4k6e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDEuMjYgMDA6MTgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gWGVuIGNh
biBzdXBwb3J0IGNvbnNvbGVfaW8gaHlwZXJjYWxscyBmb3IgYW55IGRvbWFpbnMsIG5vdCBq
dXN0IGRvbTAsDQo+IGRlcGVuZGluZyBvbiBERUJVRyBhbmQgWFNNIHBvbGljaWVzLiBUaGVz
ZSBoeXBlcmNhbGxzIGNhbiBiZSB2ZXJ5IHVzZWZ1bA0KPiBmb3IgZGV2ZWxvcG1lbnQgYW5k
IGRlYnVnZ2luZy4NCj4gDQo+IEludHJvZHVjZSBhIGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0
aW9uIHhlbl9jb25zb2xlX2lvIHRvIGVuYWJsZSB0aGUNCj4gdXNhZ2Ugb2YgY29uc29sZV9p
byBoeXBlcmNhbGxzIGZvciBhbnkgZG9tYWluIHVwb24gcmVxdWVzdC4gV2hlbg0KPiB4ZW5f
Y29uc29sZV9pbyBpcyBub3Qgc3BlY2lmaWVkLCB0aGUgY3VycmVudCBiZWhhdmlvciBpcyBy
ZXRhaW5lZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3Rl
ZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+IC0tLQ0KPiAgIC4uLi9hZG1pbi1ndWlkZS9r
ZXJuZWwtcGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICsrKw0KPiAgIGRyaXZlcnMvdHR5
L2h2Yy9odmNfeGVuLmMgICAgICAgICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrKysr
KystLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9r
ZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5l
bC1wYXJhbWV0ZXJzLnR4dA0KPiBpbmRleCBlODg1MDVlOTQ1ZDUyLi45NTNkM2Y1OTdmMDA3
IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJh
bWV0ZXJzLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dA0KPiBAQCAtNzYyMCw2ICs3NjIwLDExIEBADQo+ICAgCQkJc2F2ZS9y
ZXN0b3JlL21pZ3JhdGlvbiBtdXN0IGJlIGVuYWJsZWQgdG8gaGFuZGxlIGxhcmdlcg0KPiAg
IAkJCWRvbWFpbnMuDQo+ICAgDQo+ICsJeGVuX2NvbnNvbGVfaW8JW1hFTixFQVJMWV0NCj4g
KwkJCUJvb2xlYW4gb3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIHRoZSB1c2FnZSBvZiB0aGUg
WGVuDQo+ICsJCQljb25zb2xlX2lvIGh5cGVyY2FsbHMgdG8gcmVhZCBhbmQgd3JpdGUgdG8g
dGhlIGNvbnNvbGUuDQo+ICsJCQlNb3N0bHkgdXNlZnVsIGZvciBkZWJ1Z2dpbmcgYW5kIGRl
dmVsb3BtZW50Lg0KPiArDQo+ICAgCXhlbl9lbXVsX3VucGx1Zz0JCVtIVyxYODYsWEVOLEVB
UkxZXQ0KPiAgIAkJCVVucGx1ZyBYZW4gZW11bGF0ZWQgZGV2aWNlcw0KPiAgIAkJCUZvcm1h
dDogW3VucGx1ZzAsXVt1bnBsdWcxXQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvaHZj
L2h2Y194ZW4uYyBiL2RyaXZlcnMvdHR5L2h2Yy9odmNfeGVuLmMNCj4gaW5kZXggMzg4YTcx
YWZkNmVmZS4uMjk5YjA4YzkwYmFiMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy90dHkvaHZj
L2h2Y194ZW4uYw0KPiArKysgYi9kcml2ZXJzL3R0eS9odmMvaHZjX3hlbi5jDQo+IEBAIC01
MSw2ICs1MSwyOCBAQCBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHhlbmNvbnNfbG9jayk7DQo+
ICAgDQo+ICAgLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICovDQo+ICAgDQo+ICtzdGF0aWMgYm9vbCB4ZW5f
Y29uc29sZV9pbyA9IGZhbHNlOw0KPiArc3RhdGljIGludCBfX2luaXRkYXRhIG9wdF9jb25z
b2xlX2lvID0gLTE7DQo+ICsNCj4gK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX3hlbl9jb25z
b2xlX2lvKGNoYXIgKmFyZykNCj4gK3sNCj4gKwlpZiAoIWFyZykNCj4gKwkJcmV0dXJuIC1F
SU5WQUw7DQo+ICsNCj4gKwlpZiAoc3RyY21wKGFyZywgIm9mZiIpID09IDAgfHwNCj4gKwkg
ICAgc3RyY21wKGFyZywgImRpc2FibGVkIikgPT0gMCB8fA0KPiArCSAgICBzdHJjbXAoYXJn
LCAiMCIpID09IDApIHsNCj4gKwkJb3B0X2NvbnNvbGVfaW8gPSAwOw0KPiArCX0NCj4gKwll
bHNlIGlmIChzdHJjbXAoYXJnLCAib24iKSA9PSAwIHx8DQo+ICsJCSBzdHJjbXAoYXJnLCAi
ZW5hYmxlZCIpID09IDAgfHwNCj4gKwkJIHN0cmNtcChhcmcsICIxIikgPT0gMCkgew0KPiAr
CQlvcHRfY29uc29sZV9pbyA9IDE7DQo+ICsJfQ0KDQpJJ2QgcHJlZmVyIHVzZSBvZiBrc3Ry
dG9ib29sKCkgaW5zdGVhZCBvZiBvcGVuLWNvZGluZyBzb21ldGhpbmcgc2ltaWxhci4NCg0K
DQpKdWVyZ2VuDQo=
--------------oja8Yxxh93BJdDnSK4Gr4k6e
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oja8Yxxh93BJdDnSK4Gr4k6e--

--------------9wlGni05LTNQe0IgfptKbKsi--

--------------PGQlewguDXdt21TBRvFJvcjw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlk0X0FAwAAAAAACgkQsN6d1ii/Ey+Q
lgf/Vvy1tljOBN2IxBYLvT+I+2bYLm4rhr1X30l0o+CA6u+ouNyi1ajWjp34J1hbMqYq5IhGz6vz
Pj2C4wjiMeiEU+IBVvBsinc/iAEsFHexYQ3PvUjf9SPpYLHey51OiSTSDn5Oby2772i/ngiYHRFT
z/1WNAaDuvlVxUWV20Yg7SoBZ+8MrfT7CNiCtkFO4ZAzKzTxWzIybCeoRi/q8zScnEcNfig39TkN
M+0pjEMnT11Vf/RiMbnX76oykaZ5/E+jlZogKd1vP3BeX1wmAF6ePup9rkYmoST/s9JO/pEAkCUM
86CM/tG5uMmsLAgUJXLTrSd/72FrMejTlBebv9ddvQ==
=CS5j
-----END PGP SIGNATURE-----

--------------PGQlewguDXdt21TBRvFJvcjw--

