Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 747287E7C3C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630277.982998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Qq4-0005QW-V9; Fri, 10 Nov 2023 12:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630277.982998; Fri, 10 Nov 2023 12:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Qq4-0005OH-SL; Fri, 10 Nov 2023 12:42:20 +0000
Received: by outflank-mailman (input) for mailman id 630277;
 Fri, 10 Nov 2023 12:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1Qq3-00051z-Ij
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:42:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93d56ec9-7fc6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:42:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 100E41F8BB;
 Fri, 10 Nov 2023 12:42:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8F38138FC;
 Fri, 10 Nov 2023 12:42:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cLdiMyYlTmVfJAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 12:42:14 +0000
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
X-Inumbo-ID: 93d56ec9-7fc6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699620135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=r1/LNCgLgUKDn1qGWlJFRikWFAGSNtAdim5Mj/B4fgw=;
	b=b8RdLkOn0S8Cwv+4GEYY8p3aZUTK2/bN1XLHVGdWIXqA+5kYyod3Yz+tsFjsrxJ0eCAUxu
	lmifOEvE6+6lEBwliRzSC/sT256BgTNNYqhMmZZy8G79NQUlv5jwbxAeA/YKb7+xFpPzID
	GUyC1B30dyKWi5nwnLAI8UTJAgwjSOA=
Message-ID: <ded7609e-8a30-47b8-b1d0-012290a35ae6@suse.com>
Date: Fri, 10 Nov 2023 13:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
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
In-Reply-To: <ZU4g0y-Y6-77sY-C@macbook.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VVZiQwYQ6ZKIHlqyTJw5OgFk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VVZiQwYQ6ZKIHlqyTJw5OgFk
Content-Type: multipart/mixed; boundary="------------i69ZSmSMl9paR0nNUA19x50C";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <ded7609e-8a30-47b8-b1d0-012290a35ae6@suse.com>
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
In-Reply-To: <ZU4g0y-Y6-77sY-C@macbook.local>

--------------i69ZSmSMl9paR0nNUA19x50C
Content-Type: multipart/mixed; boundary="------------5VxGzoHVdgJYqLZSXR0p9VO5"

--------------5VxGzoHVdgJYqLZSXR0p9VO5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjMgMTM6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIEZyaSwg
Tm92IDEwLCAyMDIzIGF0IDEyOjM0OjMyUE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
DQo+PiBHZXQgdGhlIG93biBkb21pZCB2aWEgY3JlYXRpb24gb2YgYSB0ZW1wb3JhcnkgZXZl
bnQgY2hhbm5lbC4gVGhlcmUgaXMNCj4+IG5vICJvZmZpY2lhbCIgd2F5IHRvIHJlYWQgdGhl
IG93biBkb21pZCBpbiBQViBndWVzdHMsIHNvIHVzZSB0aGUgZXZlbnQNCj4+IGNoYW5uZWwg
aW50ZXJmYWNlIHRvIGdldCBpdDoNCj4+DQo+PiAtIGFsbG9jYXRlIGFuIHVuYm91bmQgZXZl
bnQgY2hhbm5lbCBzcGVjaWZ5aW5nIERPTUlEX1NFTEYgZm9yIHRoZQ0KPj4gICAgb3RoZXIg
ZW5kDQo+Pg0KPj4gLSByZWFkIHRoZSBldmVudCBjaGFubmVsIHN0YXR1cyB3aGljaCB3aWxs
IGNvbnRhaW4gdGhlIG93biBkb21pZCBpbg0KPj4gICAgdW5ib3VuZC5kb20NCj4+DQo+PiAt
IGNsb3NlIHRoZSBldmVudCBjaGFubmVsDQo+IA0KPiBTaG91bGQgd2UgbG9vayBpbnRvIGlu
dHJvZHVjaW5nIGEgd2F5IHRvIGV4cG9zZSB0aGUgZG9taWQsIHNvIHRoYXQgaW4NCj4gdGhl
IGZ1dHVyZSB3ZSBtaWdodCBub3QgbmVlZCB0byByZXNvcnQgdG8gdGhpcyB3b3JrYXJvdW5k
cyB0byBnZXQgdGhlDQo+IGRvbWlkPw0KPiANCj4gTWF5YmUgaW4gdGhlIFBWLXNwZWNpZmlj
IGNwdWlkIGxlYWY/ICBJdCdzIGEgc2hhbWUgd2UgZGlkbid0IHB1dCBpdCBpbg0KPiBhIG5v
bi1IVk0gc3BlY2lmaWMgbGVhZiB3aGVuIGl0IHdhcyBtYWRlIGF2YWlsYWJsZSB0byBIVk0g
Zm9yIHB2c2hpbQ0KPiByZWFzb25zLg0KDQpJJ20gaW4gZmF2b3Igb2YgYW4gIm9mZmljaWFs
IiB3YXkgdG8gZ2V0IHRoZSBkb21pZC4NCg0KQXMgdGhpcyBtaWdodCBiZSBuZWVkZWQgb24g
b3RoZXIgYXJjaGl0ZWN0dXJlcywgdG9vLCBJIGd1ZXNzIHRoaXMgd2lsbCBtb3N0DQpsaWtl
bHkgcmVxdWlyZSBhIChzdGFibGUpIGh5cGVyY2FsbC4NCg0KQXMgc29vbiBhcyB0aGlzIGlz
IGF2YWlsYWJsZSwgSSdkIGJlIGhhcHB5IHRvIGNoYW5nZSBNaW5pLU9TIGFnYWluIHRvIHVz
ZSB0aGUNCm5ldyBoeXBlcmNhbGwuIEluIG9yZGVyIG5vdCB0byBibG9jayBteSBYZW5zdG9y
ZS1zdHViZG9tIHNlcmllcywgSSdkIGxpa2UgdG8NCnVzZSB0aGUgaGFjayBvZiB0aGlzIHBh
dGNoIHVudGlsIHRoZW4uIE1heWJlIEkgc2hvdWxkIHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8N
CmdldF9vd25fZG9taWQoKSBpbiBvcmRlciB0byBhdm9pZCBoYXZpbmcgdG8gY2hhbmdlIHRo
ZSB1c2VyKHMpLg0KDQoNCkp1ZXJnZW4NCg==
--------------5VxGzoHVdgJYqLZSXR0p9VO5
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5VxGzoHVdgJYqLZSXR0p9VO5--

--------------i69ZSmSMl9paR0nNUA19x50C--

--------------VVZiQwYQ6ZKIHlqyTJw5OgFk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVOJSYFAwAAAAAACgkQsN6d1ii/Ey+3
xAf+JmU1AAD0+Q19WHbuFzkEj71QWr23MGKBVAtOFYRHtT36I4sQ8HFcut01GjdS4+DgTaKlOuG+
SIb/6q24ZwYF41JloxkGrD+GSEIDStypnCBADWBba1ynGFFxJgqo8GY3es2hbyLvjwwRfIPwH+7V
Bfdv0DLVySO8MaocjJrLsYt9PMTFXRYtO9uM27OQArkc+Sv/I7txNFEINatN0zt3T9GYRI3sMWqG
c0mocSRFTbcCZaV6n7CfR3qDx0yygTf/lwPlrQ/WIA6BRfT9PseQ4PUHtIHeZGPpGQj2kyhjj9h7
6OEr83U032zVFVO1rUY2WuAvFWO1e9MMoVROciRo9Q==
=FTW+
-----END PGP SIGNATURE-----

--------------VVZiQwYQ6ZKIHlqyTJw5OgFk--

