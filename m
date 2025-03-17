Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC83A653FA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:42:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917045.1322045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBfI-0001GE-8v; Mon, 17 Mar 2025 14:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917045.1322045; Mon, 17 Mar 2025 14:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBfI-0001CA-50; Mon, 17 Mar 2025 14:42:04 +0000
Received: by outflank-mailman (input) for mailman id 917045;
 Mon, 17 Mar 2025 14:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tuBfG-00019t-R5
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:42:02 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb32625-033d-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:42:01 +0100 (CET)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so338256966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:42:01 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314aa64a6sm682418866b.178.2025.03.17.07.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:42:00 -0700 (PDT)
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
X-Inumbo-ID: fcb32625-033d-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742222521; x=1742827321; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Ij4MlBRs1GlqHF3e6C5FtQZkj7bVBsb7pHeMzoFBZg=;
        b=B6Ql0W5w0bKDCiqoc07BktO0R5AjDcf303o/3fOgQ6rVFHWcRHFG53zXfzotfnroWg
         lf9HiuhpEYzBT/2dd1PdbFUBezjh2U4BNW1fDQLND3sHRzosvyOVW5jYAOF4FaBMeMF+
         TfSrnDkadaN/Bod6Z80BiHs6OZpUr5epzhAVxBreZbKn+M1Z0XplbqexUG08CwTrBn9F
         udTvZGEf3rwA0tJRsIACfppC8k9vDEz5wjIhsyI0eiKy6MFogQ/LuIeImV902eAJtPIH
         7+Z1NfELoIC1/F8eilVbg48TH+bnxdu8Dy2mAYhS9IhuOIW9KHAJQ2heOJ0T6ldXRvcX
         b5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742222521; x=1742827321;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ij4MlBRs1GlqHF3e6C5FtQZkj7bVBsb7pHeMzoFBZg=;
        b=Gzcf1tadLAuH6WEsbmOXgtNNpJzT5SMt0Z+XSJ8gmnSJ2gOPvgO93o1isKJyal3i59
         z1jq5RiSyIZhRp6lTb4JRZ/R2qKKJ1Wv0fenoGZohErz4eol7u7EcWQWnFfPj18pZzg7
         /okDSPFfA25fg0vWyiEVyCj9NlfEDbbFIsDy09jpHtigva3riDKzlLvDsPR/SwNGwEPM
         pn74PbZ0UOKpgeS4597CaMXdc5o5eIAn/fXD4budJfQuvUrRsAL4xa9l8No08ElDNpgX
         YQ7A6i7RKEn5mnxPVp9Nt3SfJsvMvshHRRe07d+ciB182+Am2L6zXB1rSv+fO47ll7Pk
         3Akw==
X-Forwarded-Encrypted: i=1; AJvYcCVnewk9QHCus4Wetn5t8BZj/7UdW1mjm3snIdQlQrU5RK08Q2hWS52bcacbB0Kv1UeVXfEHgKYtGn4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzebWnObXq4bpO4YJRWvVjaduzkjR34FdC3QoWNoLxSC0QVxD+U
	ZDnfPaMa6rZI++fHs1y/3orRx3nPiatWUzg6KZ+0lEy5fH8ty6lx3oikeZhJP50=
X-Gm-Gg: ASbGncussGIlAXF6yxdtjNR3yDA69SEgfG11sND2L5cDz/Fi+h90PSdjb9bbNph7tce
	AfUOJl6Dg4+Rzz3hivUFRa3rp6blIeZW7eUvOaBJazyXG/0CDvOjNMTBVQBpfn54pHhT8k4y8Bm
	jQ0084Y1gcVxncJCqwxx0UxqiRc72iG0XpIPDD8nXYYoYFbzDZkjQLOlBOQsWkznEbwy0mPolhP
	ose9i2LZXh7qb6YHuIyDGncJmQqWKn/EhdtmFFAyEKKYYp8N2Ue4qh7vPi2D15za8d/PksXwqmg
	xqsViUHzv71Y7bdkgTqiLptooGxghwKlDFdQ5YDIWTqUzQ5pZAMI/btIwDz9MQ7s7O1U8r7tYKp
	8OG/Lhg+YyVCxGFGvPFOL2oMOzTfIBZy101VH4hvqoxjzi3hOcG3Ao1BZ+qTHqKpc77bmgiP8s1
	pD4RnZ
X-Google-Smtp-Source: AGHT+IFrinjVbI+lAUVKC/GloO5ITmBT3Dw+yi4S+We31B/hs+jwbrjW0ie8ubb8zTv9GonPXwHX1Q==
X-Received: by 2002:a17:907:7d87:b0:ac3:26fb:f420 with SMTP id a640c23a62f3a-ac3303715c9mr1443581966b.42.1742222520859;
        Mon, 17 Mar 2025 07:42:00 -0700 (PDT)
Message-ID: <74b2f36d-b375-44d3-8b5b-9532d53349f4@suse.com>
Date: Mon, 17 Mar 2025 15:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen panic when shutting down ARINC653 cpupool
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
References: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <fd4fe44c-6c8d-402c-8b0f-466cf596f8af@suse.com>
 <BN0P110MB21482540CB855953D54BAB1090DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <ddc56efc-5f18-45db-85c2-1749e8ef715a@citrix.com>
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
In-Reply-To: <ddc56efc-5f18-45db-85c2-1749e8ef715a@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3qP0nWWPfZjshRInxjqrlb0X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3qP0nWWPfZjshRInxjqrlb0X
Content-Type: multipart/mixed; boundary="------------K9iZeFGkn4lpjnO6EhARHtx6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
Message-ID: <74b2f36d-b375-44d3-8b5b-9532d53349f4@suse.com>
Subject: Re: Xen panic when shutting down ARINC653 cpupool
References: <BN0P110MB21487F77F8E578780A3FE44490DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <fd4fe44c-6c8d-402c-8b0f-466cf596f8af@suse.com>
 <BN0P110MB21482540CB855953D54BAB1090DFA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <ddc56efc-5f18-45db-85c2-1749e8ef715a@citrix.com>
In-Reply-To: <ddc56efc-5f18-45db-85c2-1749e8ef715a@citrix.com>

--------------K9iZeFGkn4lpjnO6EhARHtx6
Content-Type: multipart/mixed; boundary="------------NlZAe6LjDV7RheQLjWjsE7Ds"

--------------NlZAe6LjDV7RheQLjWjsE7Ds
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDMuMjUgMTQ6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE3LzAzLzIw
MjUgMToyMSBwbSwgQ2hvaSwgQW5kZXJzb24gd3JvdGU6DQo+PiBKw7xyZ2VuLA0KPj4NCj4+
PiBPbiAxNy4wMy4yNSAwNjowNywgQ2hvaSwgQW5kZXJzb24gd3JvdGU6DQo+Pj4+IEknZCBs
aWtlIHRvIHJlcG9ydCB4ZW4gcGFuaWMgd2hlbiBzaHV0dGluZyBkb3duIGFuIEFSSU5DNjUz
IGRvbWFpbg0KPj4+PiB3aXRoIHRoZSBmb2xsb3dpbmcgc2V0dXAuIE5vdGUgdGhhdCB0aGlz
IGlzIG9ubHkgb2JzZXJ2ZWQgd2hlbg0KPj4+PiBDT05GSUdfREVCVUcgaXMgZW5hYmxlZC4N
Cj4+Pj4NCj4+Pj4gW1Rlc3QgZW52aXJvbm1lbnRdDQo+Pj4+IFlvY3RvIHJlbGVhc2UgOiA1
LjA1DQo+Pj4+IFhlbiByZWxlYXNlIDogNC4xOSAoaGFzaCA9IDAyNmM5ZmEyOTcxNmIwZmYw
ZjhiN2M2ODc5MDhlNzFiYTI5Y2YyMzkpDQo+Pj4+IFRhcmdldCBtYWNoaW5lIDogUUVNVSBB
Uk02NA0KPj4+PiBOdW1iZXIgb2YgcGh5c2ljYWwgQ1BVcyA6IDQNCj4+Pj4NCj4+Pj4gW1hl
biBjb25maWddDQo+Pj4+IENPTkZJR19ERUJVRyA9IHkNCj4+Pj4NCj4+Pj4gW0NQVSBwb29s
IGNvbmZpZ3VyYXRpb24gZmlsZXNdDQo+Pj4+IGNwdXBvb2xfYXJpbmMwLmNmZw0KPj4+PiAt
IG5hbWU9ICJQb29sLWFyaW5jMCINCj4+Pj4gLSBzY2hlZD0iYXJpbmM2NTMiDQo+Pj4+IC0g
Y3B1cz1bIjIiXQ0KPj4+Pg0KPj4+PiBbRG9tYWluIGNvbmZpZ3VyYXRpb24gZmlsZV0NCj4+
Pj4gZG9tMS5jZmcNCj4+Pj4gLSB2Y3B1cyA9IDENCj4+Pj4gLSBwb29sID0gIlBvb2wtYXJp
bmMwIg0KPj4+Pg0KPj4+PiAkIHhsIGNwdXBvb2wtY3B1LXJlbW92ZSBQb29sLTAgMg0KPj4+
PiAkIHhsIGNwdXBvb2wtY3JlYXRlIC1mIGNwdXBvb2xfYXJpbmMwLmNmZyAkIHhsIGNyZWF0
ZSBkb20xLmNmZyAkDQo+Pj4+IGE2NTNfc2NoZWQgLVAgUG9vbC1hcmluYzAgZG9tMToxMDAN
Cj4+Pj4NCj4+Pj4gKiogV2FpdCBmb3IgRE9NMSB0byBjb21wbGV0ZSBib290LioqDQo+Pj4+
DQo+Pj4+ICQgeGwgc2h1dGRvd24gZG9tMQ0KPj4+Pg0KPj4+PiBbeGVuIGxvZ10gcm9vdEBi
b2VpbmctbGludXgtcmVmOn4jIHhsIHNodXRkb3duIGRvbTEgU2h1dHRpbmcgZG93bg0KPj4+
PiBkb21haW4gMSByb290QGJvZWluZy1saW51eC1yZWY6fiMgKFhFTikgQXNzZXJ0aW9uICch
aW5faXJxKCkgJiYNCj4+Pj4gKGxvY2FsX2lycV9pc19lbmFibGVkKCkgfHwgbnVtX29ubGlu
ZV9jcHVzKCkgPD0gMSknIGZhaWxlZCBhdA0KPj4+PiBjb21tb24veG1hbGxvY190bHNmLmM6
NzE0IChYRU4pIC0tLS1bIFhlbi00LjE5LjEtcHJlICBhcm02NCAgZGVidWc9eQ0KPj4+PiBU
YWludGVkOiBJICAgICAgXS0tLS0gKFhFTikgQ1BVOiAgICAyIChYRU4pIFBDOiAgICAgMDAw
MDBhMDAwMDIyZDJiMA0KPj4+PiB4ZnJlZSsweDEzMC8weDFhNCAoWEVOKSBMUjogICAgIDAw
MDAwYTAwMDAyMmQyYTQgKFhFTikgU1A6DQo+Pj4+IDAwMDA4MDAwZmZmNzdiNTAgKFhFTikg
Q1BTUjogICAwMDAwMDAwMDIwMDAwMmM5IE1PREU6NjQtYml0IEVMMmgNCj4+Pj4gKEh5cGVy
dmlzb3IsIGhhbmRsZXIpIC4uLiAoWEVOKSBYZW4gY2FsbCB0cmFjZTogKFhFTikNCj4+Pj4g
WzwwMDAwMGEwMDAwMjJkMmIwPl0geGZyZWUrMHgxMzAvMHgxYTQgKFBDKSAoWEVOKQ0KPj4+
PiBbPDAwMDAwYTAwMDAyMmQyYTQ+XSB4ZnJlZSsweDEyNC8weDFhNCAoTFIpIChYRU4pDQo+
Pj4+IFs8MDAwMDBhMDAwMDIzMjFmMD5dIGFyaW5jNjUzLmMjYTY1M3NjaGVkX2ZyZWVfdWRh
dGErMHg1MC8weGM0IChYRU4pDQo+Pj4+IFs8MDAwMDBhMDAwMDI0MWJjMD5dIGNvcmUuYyNz
Y2hlZF9tb3ZlX2RvbWFpbl9jbGVhbnVwKzB4NWMvMHg4MCAoWEVOKQ0KPj4+PiAgIFs8MDAw
MDBhMDAwMDI0NTMyOD5dIHNjaGVkX21vdmVfZG9tYWluKzB4NjljLzB4NzBjIChYRU4pDQo+
Pj4+IFs8MDAwMDBhMDAwMDIyZjg0MD5dIGNwdXBvb2wuYyNjcHVwb29sX21vdmVfZG9tYWlu
X2xvY2tlZCsweDM4LzB4NzANCj4+Pj4gKFhFTikgICAgWzwwMDAwMGEwMDAwMjMwZjIwPl0g
Y3B1cG9vbF9tb3ZlX2RvbWFpbisweDM0LzB4NTQgKFhFTikNCj4+Pj4gWzwwMDAwMGEwMDAw
MjA2YzQwPl0gZG9tYWluX2tpbGwrMHhjMC8weDE1YyAoWEVOKQ0KPj4+PiBbPDAwMDAwYTAw
MDAyMmUwZDQ+XSBkb19kb21jdGwrMHg5MDQvMHgxMmVjIChYRU4pDQo+Pj4+IFs8MDAwMDBh
MDAwMDI3N2ExYz5dIHRyYXBzLmMjZG9fdHJhcF9oeXBlcmNhbGwrMHgxZjQvMHgyODggKFhF
TikNCj4+Pj4gWzwwMDAwMGEwMDAwMjc5MDE4Pl0gZG9fdHJhcF9ndWVzdF9zeW5jKzB4NDQ4
LzB4NjNjIChYRU4pDQo+Pj4+IFs8MDAwMDBhMDAwMDI2MmM4MD5dIGVudHJ5Lm8jZ3Vlc3Rf
c3luY19zbG93cGF0aCsweGE4LzB4ZDggKFhFTikNCj4+Pj4gKFhFTikNCj4+Pj4gKFhFTikg
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiAoWEVOKSBQYW5pYyBv
biBDUFUgMjoNCj4+Pj4gKFhFTikgQXNzZXJ0aW9uICchaW5faXJxKCkgJiYgKGxvY2FsX2ly
cV9pc19lbmFibGVkKCkgfHwNCj4+Pj4gbnVtX29ubGluZV9jcHVzKCkgPD0gMSknIGZhaWxl
ZCBhdCBjb21tb24veG1hbGxvY190bHNmLmM6NzE0IChYRU4pDQo+Pj4+ICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+Pj4NCj4+Pj4gSW4gY29tbWl0IDE5
MDQ5ZjhkIChzY2hlZDogZml4IGxvY2tpbmcgaW4gYTY1M3NjaGVkX2ZyZWVfdmRhdGEoKSks
DQo+Pj4+IGxvY2tpbmcNCj4+PiB3YXMgaW50cm9kdWNlZCB0byBwcmV2ZW50IGEgcmFjZSBh
Z2FpbnN0IHRoZSBsaXN0IG1hbmlwdWxhdGlvbiBidXQNCj4+PiBsZWFkcyB0byBhc3NlcnRp
b24gZmFpbHVyZSB3aGVuIHRoZSBBUklOQyA2NTMgZG9tYWluIGlzIHNodXRkb3duLg0KPj4+
PiBJIHRoaW5rIHRoaXMgY2FuIGJlIGZpeGVkIGJ5IGNhbGxpbmcgeGZyZWUoKSBhZnRlcg0K
Pj4+PiBzcGluX3VubG9ja19pcnFyZXN0b3JlKCkgYXMgc2hvd24gYmVsb3cuDQo+Pj4+DQo+
Pj4+IHhlbi9jb21tb24vc2NoZWQvYXJpbmM2NTMuYyB8IDMgKystDQo+Pj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkgZGlmZiAtLWdpdA0K
Pj4+PiBhL3hlbi9jb21tb24vc2NoZWQvYXJpbmM2NTMuYyBiL3hlbi9jb21tb24vc2NoZWQv
YXJpbmM2NTMuYyBpbmRleA0KPj4+PiA3YmYyODgyNjRjLi4xNjE1ZjFiYzQ2IDEwMDY0NA0K
Pj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMNCj4+Pj4gKysrIGIveGVu
L2NvbW1vbi9zY2hlZC9hcmluYzY1My5jDQo+Pj4+IEBAIC00NjMsMTAgKzQ2MywxMSBAQCBh
NjUzc2NoZWRfZnJlZV91ZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyDQo+Pj4+ICpvcHMs
DQo+Pj4gdm9pZCAqcHJpdikNCj4+Pj4gICAgICAgIGlmICggIWlzX2lkbGVfdW5pdChhdi0+
dW5pdCkgKQ0KPj4+PiAgICAgICAgICAgIGxpc3RfZGVsKCZhdi0+bGlzdCk7DQo+Pj4+IC0g
ICAgeGZyZWUoYXYpOw0KPj4+PiAgICAgICAgdXBkYXRlX3NjaGVkdWxlX3VuaXRzKG9wcyk7
DQo+Pj4+ICAgICAgICANCj4+Pj4gICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNj
aGVkX3ByaXYtPmxvY2ssIGZsYWdzKTsNCj4+Pj4gKw0KPj4+PiArICAgIHhmcmVlKGF2KTsN
Cj4+Pj4gICAgfQ0KPj4+PiBDYW4gSSBoZWFyIHlvdXIgb3BpbmlvbiBvbiB0aGlzPw0KPj4+
IFllcywgdGhpcyBzZWVtcyB0aGUgcmlnaHQgd2F5IHRvIGZpeCB0aGUgaXNzdWUuDQo+Pj4N
Cj4+PiBDb3VsZCB5b3UgcGxlYXNlIHNlbmQgYSBwcm9wZXIgcGF0Y2ggKHBsZWFzZSBoYXZl
IGEgbG9vayBhdCBbMV0gaW4NCj4+PiBjYXNlIHlvdSBhcmUgdW5zdXJlIGhvdyBhIHByb3Bl
ciBwYXRjaCBzaG91bGQgbG9vayBsaWtlKT8NCj4+Pg0KPj4+IEp1ZXJnZW4NCj4+Pg0KPj4+
IFsxXQ0KPj4+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1i
bG9iO2Y9ZG9jcy9wcm9jZXNzL3NlbmRpbmcNCj4+PiAtDQo+Pj4gcGF0Y2hlcy5wYW5kb2MN
Cj4+IFRoYW5rcyBmb3IgeW91ciBvcGluaW9uLiBMZXQgbWUgcmVhZCB0aHJvdWdoIHRoZSBs
aW5rIGFuZCBzdWJtaXQgdGhlIHBhdGNoLg0KPiANCj4gT3RoZXIgZ29vZCByZWZlcmVuY2Vz
IGFyZToNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDI1MDMx
MzA5MzE1Ny4zMDQ1MC0xLWpncm9zc0BzdXNlLmNvbS8NCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcveGVuLWRldmVsL2Q4YzA4YzIyLWVlNzAtNGMwNi04ZmNkLWFkNDRmYzBkYzU4ZkBz
dXNlLmNvbS8NCj4gDQo+IE9uZSB5b3UgaG9wZWZ1bGx5IHJlY29nbmlzZSwgYW5kIHRoZSBv
dGhlciBpcyBhbm90aGVyIGJ1Z2ZpeCB0byBBUklOQw0KPiBub3RpY2VkIGJ5IHRoZSBDb3Zl
cml0eSBydW4gb3ZlciB0aGUgd2Vla2VuZC4NCg0KUGxlYXNlIG5vdGUgdGhhdCB0aGUgQ292
ZXJpdHkgcmVwb3J0IGlzIG5vdCBhYm91dCBhIHJlYWwgYnVnLCBidXQganVzdA0KYSBsYXRl
bnQgb25lLiBBcyBsb25nIGFzIHRoZSBhcmluYzY1MyBzY2hlZHVsZXIgaXMgc3VwcG9ydGlu
ZyBhIHNpbmdsZQ0KcGh5c2ljYWwgY3B1IG9ubHksIHRoZXJlIGlzIG5vIHJlYWwgbmVlZCBm
b3IgdGhlIGxvY2sgd2hlbiBhY2Nlc3NpbmcNCnNjaGVkX3ByaXYtPm5leHRfc3dpdGNoX3Rp
bWUgKHRoZSBsb2NrIGlzIHRob3VnaHQgdG8gcHJvdGVjdCB0aGUgbGlzdA0Kb2YgdW5pdHMv
dmNwdXMsIG5vdCBhbGwgdGhlIG90aGVyIGZpZWxkcyBvZiBzY2hlZF9wcml2KS4NCg0KDQpK
dWVyZ2VuDQo=
--------------NlZAe6LjDV7RheQLjWjsE7Ds
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NlZAe6LjDV7RheQLjWjsE7Ds--

--------------K9iZeFGkn4lpjnO6EhARHtx6--

--------------3qP0nWWPfZjshRInxjqrlb0X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfYNLcFAwAAAAAACgkQsN6d1ii/Ey8t
Agf/TtM4NrFertrPgtl5QeRgyGxjLEfuFQMxtFjBSMVRPqjG5ULcJCegEr27T1TpRzF5pzK1W5mE
aAtdzjE0rLF73fSvRoLvr5gVSOcqI1t19ShDLoDEjPSf2sn5LLDedFZSsm5R3fuAWNAHk6xZpjmE
oPYOwbdNKJSS60oGk+eMaF5eU+ir8mzAprJIthM0D8xA10TUoOynEKnKYlhgBwxyLuySHC6LY3Ba
KkS/EXlv3OqiX3u4a+O/jXYOQfXPbtqFou2gAx72fZ8GyWBLbj9nDYgA0eYHAZwZ201Q1mHK0zN4
47mIEal2RpBtSbZ4zn/7/ZL0jntema/I2m/0iSqe+A==
=umQS
-----END PGP SIGNATURE-----

--------------3qP0nWWPfZjshRInxjqrlb0X--

