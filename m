Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB28080B7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 07:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649557.1014190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB7uh-0001HU-5i; Thu, 07 Dec 2023 06:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649557.1014190; Thu, 07 Dec 2023 06:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB7uh-0001FD-2R; Thu, 07 Dec 2023 06:31:11 +0000
Received: by outflank-mailman (input) for mailman id 649557;
 Thu, 07 Dec 2023 06:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZW7A=HS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rB7uf-0001F7-Ot
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 06:31:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33d0cac3-94ca-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 07:31:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73EE21FD6E;
 Thu,  7 Dec 2023 06:31:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F2A213976;
 Thu,  7 Dec 2023 06:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jx6sBapmcWXBCQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 07 Dec 2023 06:31:06 +0000
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
X-Inumbo-ID: 33d0cac3-94ca-11ee-98e6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701930666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZLz8cDtshWs7alLSh+tN3whfu/1OpZwUM5yhe7Jyns=;
	b=ojuZbMx6RlhdhLhi6bjhsVbiqSktJBehw1tI3CoX3FtphLnFuoS1zVqiGEl3bu1/ImCEp4
	M6NRMcvutUzpfHrE0w4pMhsLqB4iDdTQnRgYZSAp8cblureZP/QKvhJVwuOCbMMnqznp+C
	hg2uddW9WfI5hAL4cOTjYZhM+ROC4t4=
Message-ID: <ba2cbc7e-4309-4970-8d54-58aec51a3ae6@suse.com>
Date: Thu, 7 Dec 2023 07:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MiniOS build regressions
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0836857a-e9f7-41e9-9094-2833913e6485@citrix.com>
 <274e9e03-31fc-4838-9585-4ea2c9231203@xen.org>
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
In-Reply-To: <274e9e03-31fc-4838-9585-4ea2c9231203@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------le0VhQX18RruZzICFILOVUhG"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.77
X-Spamd-Result: default: False [0.77 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 BAYES_HAM(-0.01)[49.58%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 TO_DN_ALL(0.00)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 NEURAL_SPAM_SHORT(2.77)[0.923];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 FREEMAIL_CC(0.00)[suse.com,amazon.com,citrix.com,ens-lyon.org,gmail.com,kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------le0VhQX18RruZzICFILOVUhG
Content-Type: multipart/mixed; boundary="------------WExXOUnUuGwAh14XTgaIXNq7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ba2cbc7e-4309-4970-8d54-58aec51a3ae6@suse.com>
Subject: Re: MiniOS build regressions
References: <0836857a-e9f7-41e9-9094-2833913e6485@citrix.com>
 <274e9e03-31fc-4838-9585-4ea2c9231203@xen.org>
In-Reply-To: <274e9e03-31fc-4838-9585-4ea2c9231203@xen.org>

--------------WExXOUnUuGwAh14XTgaIXNq7
Content-Type: multipart/mixed; boundary="------------kaDmr36YhDZHTiyOHmNDoy0b"

--------------kaDmr36YhDZHTiyOHmNDoy0b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTIuMjMgMjI6MzksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAwNi8xMi8yMDIzIDIxOjU4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gRm9sbG93aW5n
IHRoZSBjaGFvcyB0aGlzIG1vcm5pbmcgYW5kIGEgc2NhdHRlcmluZyBvZiBmaXhlcywgSSBm
aW5hbGx5DQo+PiBnb3QgYmFjayB0byBhIHdvcmtpbmcgR2l0bGFiIHdpdGg6DQo+Pg0KPj4g
aHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL3Bp
cGVsaW5lcy8xMDk3ODQzNDU0DQo+Pg0KPj4gVGhpcyBjb250YWlucyBhIGZ1bGwgcmV2ZXJ0
IG9mIHRoZSBETUkgcGF0Y2gsIGFuZCByZW1vdmFsIG9mIHRoZSBYaWxpbngNCj4+IGhhcmR3
YXJlIHJ1bm5lciwgYm90aCBoYW5kbGVkIGluIG90aGVyIHRocmVhZHMgYnV0IG5vdGVkIGhl
cmUgZm9yIGFueW9uZQ0KPj4gbG9va2luZyBhdCB0aGUgdGVzdCByZXN1bHRzLg0KPj4NCj4+
IEl0IGFsc28gY29udGFpbnMgMyBNaW5pT1MgZml4ZXMsIG1peGVkIGJldHdlZW4gcmVwb3M6
DQo+Pg0KPj4gInRvb2xzL2xpYnMvZXZ0Y2huOiBkcm9wIGFzc2VydCgpcyBpbiBzdHViZG9t
IiBpbiB4ZW4gWzFdDQo+PiAiTWluaS1PUzogZG9uJ3QgdXNlIG9iamNvcHkgLS1kdW1wLXNl
Y3Rpb24iIGluIG1pbmlvcyBbMl0NCj4+ICJNaW5pLU9TOiBleHBvcnQgbWFpbl90aHJlYWQi
IFszXQ0KPj4NCj4+IGFuZCB0aGUgcmVzdWx0IHdpdGggYWxsIG9mIHRoZXNlIHBhc3Nlcy4N
Cj4+DQo+PiBIb3dldmVyLCBpdCBpcyBteSB1bmRlcnN0YW5kaW5nIHRoYXQgd2UgZG9uJ3Qg
YWN0dWFsbHkgd2FudCB0byB0YWtlDQo+PiBwYXRjaCAzLCBpbnN0ZWFkIHByZWZlcnJpbmcg
cGF0Y2ggMSBhcyBhbiBhbHRlcm5hdGl2ZS4NCj4gDQo+IExvb2tpbmcgYXQgcGF0Y2ggMSwg
SSBmZWVsIHRoYXQgMyBpcyBiZXR0ZXIgdGVtcG9yYXJpbHkgdW50aWwgd2UgaGF2ZSBwcm9w
ZXIgDQo+IGxvY2tpbmcuIFdpdGggMSwgd2UgYXJlIGp1c3Qgc2V0dGluZyBvdXJzZWxmIGZv
ciBhbm90aGVyIGZhaWx1cmUuDQoNClJlcGxhY2VtZW50IHBhdGNoIHdpdGggcHJvcGVyIGxv
Y2tpbmcgc2VudC4NCg0KDQpKdWVyZ2VuDQo=
--------------kaDmr36YhDZHTiyOHmNDoy0b
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------kaDmr36YhDZHTiyOHmNDoy0b--

--------------WExXOUnUuGwAh14XTgaIXNq7--

--------------le0VhQX18RruZzICFILOVUhG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVxZqkFAwAAAAAACgkQsN6d1ii/Ey8f
WQf+O7IErxmjGhU5i5pt5i2I/SAgt2SfOkR9s/ceC8QpdzAvTwD4R3pln9oBauSKPSdbUp140l4A
AkreZVaS6US9tyxHKWICKyFVgxdEJDYa2yqeb6r9Czaybs353lJ42IpWP5KXM2qTvS/GHg8guWKs
fgm8ASY2IsB+d4st1k9hcjCkUktye/RfbeVNR+IioLUIg2QIeWWAdD8ZEtQJKX1Z2XyLbj0oElLs
mBcgy+gMoy4psyrYS5bOFFosYHO8E8Uerwkl4a3TO7cLOQ0rX5r5PEdollqj6nC9SJKM6wUpyvv6
xX8uwZ7KPQ7Ff37/mpdAitrqHX8mcT0bdmovVfhr+g==
=PpUB
-----END PGP SIGNATURE-----

--------------le0VhQX18RruZzICFILOVUhG--

