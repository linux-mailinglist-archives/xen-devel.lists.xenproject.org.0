Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B162BADA8F5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016774.1393708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3yX-0002zv-I3; Mon, 16 Jun 2025 07:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016774.1393708; Mon, 16 Jun 2025 07:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3yX-0002xn-Dq; Mon, 16 Jun 2025 07:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1016774;
 Mon, 16 Jun 2025 07:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR3yV-0002bg-4X
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:09:47 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e285219e-4a80-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 09:09:46 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad8a6c202ffso761508466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 00:09:46 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adf688970a1sm495683166b.175.2025.06.16.00.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 00:09:45 -0700 (PDT)
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
X-Inumbo-ID: e285219e-4a80-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750057786; x=1750662586; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TdMrFDstKn6cFwXSX2aSGseaDZLzq5Mn2zXgiyVBtT8=;
        b=fGQyAKrmK5Ek8v5s3DU2jX2hpQoL89hympg5QT+WcxfDJgXImVgxkfBOJWbK1TgNHw
         B7z87J6nH0Yk9uPi8/3Z+76K1PuEFNo96GUEuc3oVumyzaUhYe41HwqmSkmnzzZJDSLQ
         xiAXvYZXSDmVLa3Oztrsrot1411RkvltwLu6o3Sqmy7gX0E5Eure+8A+s5o4P1EAMScm
         sZI+eEPtCo/HifZRupgpoeS72YfTL064TXYtO3w6RG+66GeKSzvDY5eanm9pcVLpXB30
         vOge3G0zNIcbecvq9vCcew1wfF6guFyb8+3a3+4BT/N1XF2T/0C76QmdeFG68w9r8Rl4
         ojTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057786; x=1750662586;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdMrFDstKn6cFwXSX2aSGseaDZLzq5Mn2zXgiyVBtT8=;
        b=eBB5E3p34T67bN8+m/Ejk16f7UmT4o84hHCEQ5xNByTu8lsBW5oJ4U+y8dU5NhFEnj
         vUxIEe2yLwlqOt+c4Gb+qP1ZNNM7OO+Q9xdv+H250cacaV8LNgC4aDoxzQ5QCfg382uV
         tOTovZ3V8WDcx/mYkgh2CceLJWDfZX5hRUBXw0m9Y8xXjs9X1g0BjgV1YEOhTmj+yeEA
         Jbqga3NILkspXITMX7Fa2wHic0C5nkPRIE4CmHXNhdxuDVCW6s+NJR4xuRQC4QYbBNqU
         b7RI/WTPkTCEt5Vl7qsabMMSteuCvbfbqFd9LxCR6wp/J9SH7FfYiphH/PT7o3RtVRMj
         QOWw==
X-Forwarded-Encrypted: i=1; AJvYcCUKujpgJuo4RrHU+ur2MlPRY8SmP+xquzC6uzn0IRmzgYYNGwnPPa1N6DLn6BkWP1x/nzKORKEFVjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFYoD5TsUnq3y3tH1pWtRa4aCa7LT0KcBC1tlcKXymK20VGDwS
	uVc4mXF8IRdRW/0/w8bq6winKTB2LQ083Tfz6EaleVP4B4ooI07u2mipj0bzWRcX9WIaSvGh7UE
	M5sN35R4=
X-Gm-Gg: ASbGncvuO9snBkTKm8vuYqZNCOAwlvj4cixcz0ls3SFHk1vlrsHsFwuqm3E/DAf+hTH
	i/tLk3tZysPO5V4Lv/O1hJLf3qkeqdVR81Hpm4N2L47fZ18K+dgv7lzLEEkTKfHGvcK2TqVrvyl
	fnwwOTfmnykT8BeDKaaVqMN3BjamlqMrVn9m0uay41aPjWQXXU5U8oaRkQH/VBx4GITfChTLbhu
	/Jmqg7nzjJuqXBc29VURqzYo7erdLgRuQboBj3/+SmvHej6BdMyRUzhB4sJhxv93NybcxMFFavQ
	V10Rxrduj8cfJT+nqLOE/gD7dSU5SZKhchDDWMWttQW4LZBxBoR3QdhsFUdhA1SGMV5BhQTc64b
	HLSBMB8uMq6QEt1fQv/P0koJPrzDX/ibGQdQgbLBE1RFI+Jh7OK+k4/bu9OTgOpThHonMWgUEIR
	XD5tobihuB9xg=
X-Google-Smtp-Source: AGHT+IHYOJ/m4LZU+MYkhd+4VpPHnPSCBqI3ScgO3G6RETwNk4ZL2qvwaJO4dVa6IRKxQ2Me+WPtjg==
X-Received: by 2002:a17:907:86a3:b0:ade:a7b9:fa34 with SMTP id a640c23a62f3a-adfad43d8f6mr848269766b.45.1750057785854;
        Mon, 16 Jun 2025 00:09:45 -0700 (PDT)
Message-ID: <8ec281cf-0492-46b3-ae6b-ec3f2e595498@suse.com>
Date: Mon, 16 Jun 2025 09:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 12/12] kexec: do the final kexec step
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-13-jgross@suse.com>
 <CAKf6xpuyhqeONEr20BjzPxPmhBr6J+Fuw4YJUg-ecst8MLXVYg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <CAKf6xpuyhqeONEr20BjzPxPmhBr6J+Fuw4YJUg-ecst8MLXVYg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A4dlste03f9KB1rlEcMDuTgz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A4dlste03f9KB1rlEcMDuTgz
Content-Type: multipart/mixed; boundary="------------7aUcww5pQYfuuokapTbgzTqU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org
Message-ID: <8ec281cf-0492-46b3-ae6b-ec3f2e595498@suse.com>
Subject: Re: [MINI-OS PATCH 12/12] kexec: do the final kexec step
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-13-jgross@suse.com>
 <CAKf6xpuyhqeONEr20BjzPxPmhBr6J+Fuw4YJUg-ecst8MLXVYg@mail.gmail.com>
In-Reply-To: <CAKf6xpuyhqeONEr20BjzPxPmhBr6J+Fuw4YJUg-ecst8MLXVYg@mail.gmail.com>

--------------7aUcww5pQYfuuokapTbgzTqU
Content-Type: multipart/mixed; boundary="------------wkfD8VS06aXqbg0nPhKKGd3p"

--------------wkfD8VS06aXqbg0nPhKKGd3p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDYuMjUgMTk6MzksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFy
IDIxLCAyMDI1IGF0IDU6MzDigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IFdpdGggYWxsIGtleGVjIHByZXBhcmF0aW9ucyBkb25lLCBhY3Rp
dmF0ZSB0aGUgbmV3IGtlcm5lbC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+ICAga2V4ZWMuYyB8IDE3ICsrKysr
KysrKysrKysrKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9rZXhlYy5jIGIva2V4ZWMuYw0K
Pj4gaW5kZXggMmRiODc2ZTguLjg1YjA5OTU5IDEwMDY0NA0KPj4gLS0tIGEva2V4ZWMuYw0K
Pj4gKysrIGIva2V4ZWMuYw0KPj4gQEAgLTE2OSw2ICsxNjksNyBAQCBpbnQga2V4ZWModm9p
ZCAqa2VybmVsLCB1bnNpZ25lZCBsb25nIGtlcm5lbF9zaXplLCBjb25zdCBjaGFyICpjbWRs
aW5lKQ0KPiANCj4+IEBAIC0xOTIsNiArMTkzLDEzIEBAIGludCBrZXhlYyh2b2lkICprZXJu
ZWwsIHVuc2lnbmVkIGxvbmcga2VybmVsX3NpemUsIGNvbnN0IGNoYXIgKmNtZGxpbmUpDQo+
PiAgICAgICBpZiAoIHJldCApDQo+PiAgICAgICAgICAgZ290byBlcnI7DQo+Pg0KPj4gKyAg
ICBrZXhlY19wYWdlID0gKHZvaWQgKilhbGxvY19wYWdlKCk7DQo+IA0KPiBrZXhlY19wYWdl
KCkgaXMgcmVmZXJlbmNlZCBhbHJlYWR5IGluIGRvX2tleGVjKCksIGJ1dCBpdCBoYXNuJ3Qg
YmVlbg0KPiBob29rZWQgdXAgeWV0LCByaWdodD8gIEkgZ3Vlc3MgdGhhdCBpcyBva2F5Lg0K
DQpZZXMsIHNob3VsZG4ndCBjYXVzZSBhbnkgaXNzdWVzLg0KDQo+IA0KPiBJZiBub3QgYW4g
QVNTRVJUIG9uIDEgcGFnZSwgdGhlbiBhbGxvY2F0ZSBLRVhFQ19TRUNTSVpFPw0KDQpIYW5k
bGVkIG5vdyB2aWEgYW4gQVNTRVJUKCkgaW4gdGhlIGxpbmtlciBzY3JpcHQuDQoNCg0KSnVl
cmdlbg0K
--------------wkfD8VS06aXqbg0nPhKKGd3p
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------wkfD8VS06aXqbg0nPhKKGd3p--

--------------7aUcww5pQYfuuokapTbgzTqU--

--------------A4dlste03f9KB1rlEcMDuTgz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhPwzkFAwAAAAAACgkQsN6d1ii/Ey+d
4Qf+PzkYR5iEiTxWy9+kmeG83qC1jG6gN1TKBhynJneUSMsZEuXQuNCcueKxOIFiMo8AjJJ3Ryrh
S1gJCfH/YbNQ+aEojbVnUgPWTM+W/g3Vdqqx7uwvhMtkqAqCoGpe+27XblmVf8ol6qk2EBWcU0zv
dBh5liNl5WZzXO3WojgzhJHvv9dDyejDzAGGvQTQVraZvyJrT0QOlT/7jYuc/e2Uc4dJIFRlL7wK
Q8NOznh1eRykTflUzVZyP9pvM/1fRu5FwBVwuto9+FDJrizgWyiRG2WPr4iq2lsBcDX2W8lqwbRj
MlT1PMBvQLJ4C2Vt3yNioGcCcgMR8D3SJz2IKEwe+w==
=tEZy
-----END PGP SIGNATURE-----

--------------A4dlste03f9KB1rlEcMDuTgz--

