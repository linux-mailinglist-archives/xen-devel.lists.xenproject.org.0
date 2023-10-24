Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3507D4E23
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621828.968670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEqU-00007I-EO; Tue, 24 Oct 2023 10:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621828.968670; Tue, 24 Oct 2023 10:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEqU-0008WH-Bk; Tue, 24 Oct 2023 10:41:10 +0000
Received: by outflank-mailman (input) for mailman id 621828;
 Tue, 24 Oct 2023 10:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CJyy=GG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qvEqT-0008WB-18
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:41:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6ab71fe-7259-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 12:41:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E57AD1FD8B;
 Tue, 24 Oct 2023 10:41:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9696B1391C;
 Tue, 24 Oct 2023 10:41:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gtKPIkKfN2UNLQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 24 Oct 2023 10:41:06 +0000
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
X-Inumbo-ID: d6ab71fe-7259-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698144066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kfuLYJIPokUZDpyAw19CMxNTcf2Dk4HGZzTHwuBUMZ8=;
	b=CfmDtNxDHeg3yx+JXt43E9TM7x1Q47YPueFp73JCMpBjtK6Y30TARc5Y+vqyVFTU31y+Av
	LYBu2k/CDpxEHWu7Bcy8JW8FlYP3PxuXnuMdnM3cU2Iwztgk9kIExetgpSgwuEdQdPX5H3
	hZFTB/1rWTqpuf+vPtT9Mob6FL5nPtQ=
Message-ID: <8e6c144f-f808-4603-8de4-76decc3c2838@suse.com>
Date: Tue, 24 Oct 2023 12:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
 <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
 <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
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
In-Reply-To: <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lbP3yDP4QJAMM1iBpEtEkiVV"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.95
X-Spamd-Result: default: False [-5.95 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.96)[86.69%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 TO_DN_ALL(0.00)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lbP3yDP4QJAMM1iBpEtEkiVV
Content-Type: multipart/mixed; boundary="------------yNSknw0v1xgl0xmKBU7Oe55e";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Message-ID: <8e6c144f-f808-4603-8de4-76decc3c2838@suse.com>
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
 <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
 <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
In-Reply-To: <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>

--------------yNSknw0v1xgl0xmKBU7Oe55e
Content-Type: multipart/mixed; boundary="------------Xt4ja4uKiEsnwc4xBQJUpYjy"

--------------Xt4ja4uKiEsnwc4xBQJUpYjy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTAuMjMgMDk6NDMsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gT24gVHVlLCAy
MDIzLTEwLTI0IGF0IDA4OjUzICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4NCj4+
IEknbSBwdXp6bGVkLiBUaGlzIHBhdGggZG9lc24ndCBjb250YWluIGFueSBvZiB0aGUgUkNV
IHVzYWdlIEkndmUgYWRkZWQgaW4NCj4+IGNvbW1pdCA4Nzc5N2ZhZDZjY2UuDQo+Pg0KPj4g
QXJlIHlvdSBzdXJlIHRoYXQgd2l0aCBqdXN0IHJldmVydGluZyBjb21taXQgODc3OTdmYWQ2
Y2NlIHRoZSBpc3N1ZSBkb2Vzbid0DQo+PiBtYW5pZmVzdCBhbnltb3JlPyBJJ2QgcmF0aGVy
IGV4cGVjdCBjb21taXQgNzIxMjU1Yjk4MjZiIGhhdmluZyBjYXVzZWQgdGhpcw0KPj4gYmVo
YXZpb3IsIGp1c3QgdGVsbGluZyBmcm9tIHRoZSBtZXNzYWdlcyBhYm92ZS4NCj4gDQo+IFJl
dGVzdGluZyBpbiB0aGUgY29sZCBsaWdodCBvZiBkYXksIHllcy4gVXNpbmcgdjYuNi1yYzUg
d2hpY2ggaXMgdGhlDQo+IHBhcmVudCBjb21taXQgb2YgdGhlIG9mZmVuZGluZyA4Nzc5N2Zh
ZDZjY2UuDQo+IA0KPiBJIG5vdyBzZWUgdGhpcyB3YXJuaW5nIGF0IGJvb3QgdGltZSBhZ2Fp
biwgd2hpY2ggSSBiZWxpZXZlIHdhcyBhbg0KPiBhc3BlY3Qgb2Ygd2hhdCB5b3Ugd2VyZSB0
cnlpbmcgdG8gZml4Og0KPiANCj4gWyAgICAwLjA1OTAxNF0geGVuOmV2ZW50czogVXNpbmcg
RklGTy1iYXNlZCBBQkkNCj4gWyAgICAwLjA1OTAyOV0geGVuOmV2ZW50czogWGVuIEhWTSBj
YWxsYmFjayB2ZWN0b3IgZm9yIGV2ZW50IGRlbGl2ZXJ5IGlzIGVuYWJsZWQNCj4gWyAgICAw
LjA1OTIyN10gcmN1OiBzcmN1X2luaXQ6IFNldHRpbmcgc3JjdV9zdHJ1Y3Qgc2l6ZXMgYmFz
ZWQgb24gY29udGVudGlvbi4NCj4gWyAgICAwLjA1OTI5Nl0NCj4gWyAgICAwLjA1OTI5N10g
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gWyAgICAwLjA1OTI5OF0gWyBCVUc6
IEludmFsaWQgd2FpdCBjb250ZXh0IF0NCj4gWyAgICAwLjA1OTI5OV0gNi42LjAtcmM1ICMx
Mzc0IE5vdCB0YWludGVkDQo+IFsgICAgMC4wNTkzMDBdIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+IFsgICAgMC4wNTkzMDFdIHN3YXBwZXIvMC8wIGlzIHRyeWluZyB0byBs
b2NrOg0KPiBbICAgIDAuMDU5MzAzXSBmZmZmZmZmZjhhZDU5NWY4IChldnRjaG5fcndsb2Nr
KXsuLi4ufS17MzozfSwgYXQ6IHhlbl9ldnRjaG5fZG9fdXBjYWxsKzB4NTkvMHhkMA0KDQpJ
bmRlZWQuDQoNCldoYXQgSSBzdGlsbCBub3QgZ2V0IGlzIHdoeSB0aGUgcmN1X2RlcmVmZXJl
bmNlX2NoZWNrKCkgc3BsYXQgaXNuJ3QNCmhhcHBlbmluZyB3aXRob3V0IG15IHBhdGNoLg0K
DQpJTUhPIGl0IHNob3VsZCBiZSByZWxhdGVkIHRvIHRoZSBmYWN0IHRoYXQgY3B1aHBfcmVw
b3J0X2lkbGVfZGVhZCgpDQppcyB0cnlpbmcgdG8gc2VuZCBhbiBJUEkgdmlhIHhlbl9zZW5k
X0lQSV9vbmUoKSwgd2hpY2ggaXMgdXNpbmcNCm5vdGlmeV9yZW1vdGVfdmlhX2lycSgpLCB3
aGljaCBpbiB0dXJuIG5lZWRzIHRvIGNhbGwgaXJxX2dldF9jaGlwX2RhdGEoKS4NClRoaXMg
aXMgdXNpbmcgdGhlIG1hcGxlLXRyZWUgc2luY2UgNzIxMjU1Yjk4MjZiLCB3aGljaCBpcyB1
c2luZw0KcmN1X3JlYWRfbG9jaygpLg0KDQpJIGNhbiBwcm9iYWJseSBjaGFuZ2UgeGVuX3Nl
bmRfSVBJX29uZSgpIHRvIG5vdCBuZWVkIGlycV9nZXRfY2hpcF9kYXRhKCkuDQpCdXQgSSdk
IGxpa2UgdG8gdW5kZXJzdGFuZCB3aHkgbXkgcGF0Y2ggY2F1c2VzIHRoZSBwcm9ibGVtIHRv
IHN1cmZhY2UNCm9ubHkgbm93LCBpbnN0ZWFkIG9mIGhhdmluZyBiZWVuIHByb21pbmVudCBz
aW5jZSBjb21taXQgNzIxMjU1Yjk4MjZiLg0KDQpQYXVsLCBkbyB5b3UgaGF2ZSBhbiBleHBs
YW5hdGlvbiBmb3IgdGhlIHNwbGF0IG9ubHkgY29taW5nIG91dCBub3c/DQoNCg0KSnVlcmdl
bg0K
--------------Xt4ja4uKiEsnwc4xBQJUpYjy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Xt4ja4uKiEsnwc4xBQJUpYjy--

--------------yNSknw0v1xgl0xmKBU7Oe55e--

--------------lbP3yDP4QJAMM1iBpEtEkiVV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmU3n0IFAwAAAAAACgkQsN6d1ii/Ey8H
FQf/R8mncueOtQlKlKUMObQWbV2IIsskrsYBfgtbUEJ4dvpuklP86071VU4j3WCp1OxYB5XI2BeB
rox0Mk8G/bnIrWIjmco6p8Ltj7YPJgX3dCe2fGiNgPydKlnPpEfC4Ajin3TDXB8LhwZAZul0RKFB
BJotT8v81M/otPMsVqr97JHv8TvxHAawehgFo/HKsDLEqcgS5D5ye55Y1KLjbJzOvGXyHxZHBUOj
r6eimmHXONQR/79TNRmCBgUGUks1Wt8u7XzoGuAOGf/wyutYEseaX/l2o7tblqmPRWXmwS/EUSa1
2rBmvSB7ypUNdqDTczM7timMHC66cB9xoHy/JwSVqA==
=hnJy
-----END PGP SIGNATURE-----

--------------lbP3yDP4QJAMM1iBpEtEkiVV--

