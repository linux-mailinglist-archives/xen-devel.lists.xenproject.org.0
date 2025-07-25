Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F1B117DB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 07:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057062.1424993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufAou-0003VX-2I; Fri, 25 Jul 2025 05:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057062.1424993; Fri, 25 Jul 2025 05:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufAot-0003Tf-VV; Fri, 25 Jul 2025 05:18:11 +0000
Received: by outflank-mailman (input) for mailman id 1057062;
 Fri, 25 Jul 2025 05:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufAos-0003TZ-MX
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 05:18:10 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0de9869-6916-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 07:18:09 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso340894866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 22:18:09 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f44d758sm209401466b.76.2025.07.24.22.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 22:18:08 -0700 (PDT)
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
X-Inumbo-ID: c0de9869-6916-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753420689; x=1754025489; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TFnJ/tsKuZYqEkJOffAD4NEzTmDOxrMKf8zScRAW7os=;
        b=PsXI7Hx0qOEDWKOFkxk7Fg3vScZhh/uJHCl81qfBRwyTh8Xf0KGmw9T7ooeE+oP4+N
         6R2b7tkx/o6qnaAsgn1lADYl96OjcF7oGqtCTvkRx8jMKn4GNzRCwayiB5RuCGxoa9zR
         KyYOTFhRH+il9cje7F+3BmUUlX+1jyfK9KGh6Qv1OohCVD2AwKar7FS1xQ1HTUvREaNz
         fvtv0bgxTma4Cffdjtg8bPsPQF7EDfVV4/Ccyp4y8wWD1gLyz6h0TslQLT/HpSYk7Xq0
         ViQUH6JhmIH2/7wGUwuLNwc6sZvL6FPzccn3A32n5p+CjEsia0AY11cFMK1B7cUMu1Ty
         Bp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753420689; x=1754025489;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFnJ/tsKuZYqEkJOffAD4NEzTmDOxrMKf8zScRAW7os=;
        b=FCb0BQ59a5ehq/zzHqkCGY3k0WOEcEmu2YWwsBtIm7geYsRuYZZLJdzSjquuYx6LZc
         YdJg9kku8m/+dvCBuhmeiDRyY7E/RG1soGMg4f13ssKkPxCdOmoEqdihTc++B/vZDQD1
         yTYb83/6xlJCZKDxL/iymBaBE7NdEU4qgDA/ad8s2ikkEdr4/q8CUA2s+7aGLu0D6e26
         r77S99x23RL8R9Fpd68x9i98RYkKeLfruY4m0de6FTH+VbzI1OySL/l48wwTxkbyyvya
         n1CAbFCNKmzreyC6FIsbryFEwuVM2LZLDvmWh7CC0CpsfnzAERw6PcFfVmq4n+/kmNhB
         lTDw==
X-Forwarded-Encrypted: i=1; AJvYcCUPIzI1cQ49ZpcRhSL10lpd8aWXCHa5FBhMQ6ImdiP6ahVnI0BnU1wL0P8Wgg2xVdYEdlIl83/nVWo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsPQpZWYX+x80lqukz/CGKhdx0+4XACXd4c5xbKFhNKIWDvX73
	u2RLBPcbeJfTyo5KT6TySjW9duncWx/HqToQypo1HIWt6KVHoI2k/CeBYO0Kf7ex65o=
X-Gm-Gg: ASbGnctnGBpslmj0zEa1xfkcefd1WayU3A8QX2WK8RnJI2O8P3RLFXDDodX5YvOfP9H
	ac3kF/+i8S/TniHVmAAqbivt01g1kxQEiBuMNbN4dgSYdgKnJlXYj4kpCN97GaLcpMZR8rkIpPl
	mJGEbKgN3RAnqokp72Il4Axy86WAFMlMZ99K8sL4mUT/rehQ6rC35Bkc/fzZagKx1kWx3f72Oq5
	I3u7D9hCLxhHZYNpJXV1XpOaBJm1oLXGR5oji6vNYpwrICcdFZYyc5br7YBUrC3iWB9/r9PQF0C
	S5/IlnsSDq+Zm0eg6lpNo2qO5+DtDAJp1f6JzuZLrokzCMuAca+d8THzfFXRn4CJfrPC8GOYM7j
	g+DNRjfypKIDYcN4HaDeQVqCH/9erAfmYsndVSdB68u/Du+gWqFdI1ogIwGj2tbcPFf0cf4/Kvq
	h0gwHnfK8ComeNkc+18k5009d+xJBY2B/w6SvdLmMuKlPk
X-Google-Smtp-Source: AGHT+IFI4DuXpzopScQCeDI5wnoBaQLXhj9xlfMhbtwJwvIhWmECMhqLvDD0YttrrMCpFsiz3wfVDA==
X-Received: by 2002:a17:907:3d8b:b0:ae0:c355:2140 with SMTP id a640c23a62f3a-af61e534f0fmr67553366b.45.1753420688797;
        Thu, 24 Jul 2025 22:18:08 -0700 (PDT)
Message-ID: <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>
Date: Fri, 25 Jul 2025 07:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] tools/xenstored: add server feature support
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-5-jgross@suse.com>
 <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>
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
In-Reply-To: <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------99S3L8jY33noopmka3OP6AaH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------99S3L8jY33noopmka3OP6AaH
Content-Type: multipart/mixed; boundary="------------NXn6jidQgyPuAYQ900TM0ATr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>
Subject: Re: [PATCH 4/7] tools/xenstored: add server feature support
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-5-jgross@suse.com>
 <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>
In-Reply-To: <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>

--------------NXn6jidQgyPuAYQ900TM0ATr
Content-Type: multipart/mixed; boundary="------------j4fn5k61YhW5Bl5P80Hzi4LK"

--------------j4fn5k61YhW5Bl5P80Hzi4LK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDA6NDgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IA0KPiANCj4gT24g
MjAyNS0wNy0yMiAxMDowNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEFkZCBwZXIgZG9t
YWluIHNlcnZlciBmZWF0dXJlcywgd2hpY2ggYXJlIGluaXRpYWxpemVkIGJ5IHRoZSBzdXBw
b3J0ZWQNCj4+IGZlYXR1cmVzIGF0IGRvbWFpbiBpbnRyb2R1Y3Rpb24sIG9yIGJ5IGxpdmUg
dXBkYXRlIGZyb20gdGhlIG1pZ3JhdGlvbg0KPj4gc3RyZWFtLiBUaGlzIHJlcXVpcmVzIHRv
IGFkZCB0aGUgRE9NQUlOX0RBVEEgcmVjb3JkIHRvIHRoZSBtaWdyYXRpb24NCj4+IHN0cmVh
bSwgYnV0IGZvciBub3cgaXQgd2lsbCBvbmx5IGNvbnRhaW4gdGhlIGZlYXR1cmUgd29yZC4N
Cj4+DQo+PiBBZHZlcnRpc2UgdGhlIFhlbnN0b3JlIGZlYXR1cmVzIHRvIGd1ZXN0cyBieSBz
ZXR0aW5nIHRoZSBhcHByb3ByaWF0ZQ0KPj4gYml0cyBpbiB0aGUgcmluZyBwYWdlLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+
IC0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIHwgNzEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmVkL2Rv
bWFpbi5oIHzCoCAzICsrDQo+PiDCoCB0b29scy94ZW5zdG9yZWQvbHUuY8KgwqDCoMKgIHwg
MTQgKysrKysrLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9sdS5owqDCoMKgwqAgfMKgIDIg
Ky0NCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBi
L3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gaW5kZXggZTFkNWU4ZDYxNC4uZjZkMjRi
YzEzYSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gKysr
IGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+PiBAQCAtMzIsNiArMzIsNyBAQA0KPj4g
wqAgI2luY2x1ZGUgInRyYW5zYWN0aW9uLmgiDQo+PiDCoCAjaW5jbHVkZSAid2F0Y2guaCIN
Cj4+IMKgICNpbmNsdWRlICJjb250cm9sLmgiDQo+PiArI2luY2x1ZGUgImx1LmgiDQo+PiDC
oCAjaW5jbHVkZSA8eGVuZXZ0Y2huLmg+DQo+PiDCoCAjaW5jbHVkZSA8eGVubWFuYWdlLmg+
DQo+PiBAQCAtNDIsNiArNDMsOCBAQA0KPj4gwqAgI2luY2x1ZGUgPG1pbmktb3MveGVuYnVz
Lmg+DQo+PiDCoCAjZW5kaWYNCj4+ICsjZGVmaW5lIFhFTlNUT1JFX0ZFQVRVUkVTwqDCoMKg
IFhFTlNUT1JFX1NFUlZFUl9GRUFUVVJFX0VSUk9SDQo+PiArDQo+PiDCoCBzdGF0aWMgeGVu
bWFuYWdlX2hhbmRsZSAqeG1faGFuZGxlOw0KPj4gwqAgeGVuZ250dGFiX2hhbmRsZSAqKnhn
dF9oYW5kbGU7DQo+PiDCoCBzdGF0aWMgZXZ0Y2huX3BvcnRfdCB2aXJxX3BvcnQ7DQo+PiBA
QCAtMTE1LDYgKzExOCw5IEBAIHN0cnVjdCBkb21haW4NCj4+IMKgwqDCoMKgwqAgLyogRXZl
bnQgY2hhbm5lbCBwb3J0ICovDQo+PiDCoMKgwqDCoMKgIGV2dGNobl9wb3J0X3QgcG9ydDsN
Cj4+ICvCoMKgwqAgLyogU2VydmVyIGZlYXR1cmVzIHN1cHBvcnRlZCBmb3IgdGhpcyBkb21h
aW4uICovDQo+PiArwqDCoMKgIHVuc2lnbmVkIGludCBmZWF0dXJlczsNCj4+ICsNCj4+IMKg
wqDCoMKgwqAgLyogRG9tYWluIHBhdGggaW4gc3RvcmUuICovDQo+PiDCoMKgwqDCoMKgIGNo
YXIgKnBhdGg7DQo+PiBAQCAtNzk5LDYgKzgwNSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG9tYWlu
ICphbGxvY19kb21haW4oY29uc3Qgdm9pZCAqY29udGV4dCwgDQo+PiB1bnNpZ25lZCBpbnQg
ZG9taWQsDQo+PiDCoMKgwqDCoMKgIGRvbWFpbi0+dW5pcXVlX2lkID0gdW5pcXVlX2lkOw0K
Pj4gwqDCoMKgwqDCoCBkb21haW4tPmdlbmVyYXRpb24gPSBnZW5lcmF0aW9uOw0KPj4gwqDC
oMKgwqDCoCBkb21haW4tPmludHJvZHVjZWQgPSBmYWxzZTsNCj4+ICvCoMKgwqAgZG9tYWlu
LT5mZWF0dXJlcyA9IFhFTlNUT1JFX0ZFQVRVUkVTOw0KPj4gwqDCoMKgwqDCoCBpZiAoaGFz
aHRhYmxlX2FkZChkb21oYXNoLCAmZG9tYWluLT5kb21pZCwgZG9tYWluKSkgew0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHRhbGxvY19mcmVlKGRvbWFpbik7DQo+PiBAQCAtOTkyLDcgKzk5
OSw4IEBAIHZvaWQgaWdub3JlX2Nvbm5lY3Rpb24oc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4s
IHVuc2lnbmVkIA0KPj4gaW50IGVycikNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgdHJhY2Uo
IkNPTk4gJXAgaWdub3JlZCwgcmVhc29uICV1XG4iLCBjb25uLCBlcnIpOw0KPj4gLcKgwqDC
oCBpZiAoY29ubi0+ZG9tYWluICYmIGNvbm4tPmRvbWFpbi0+aW50ZXJmYWNlKQ0KPj4gK8Kg
wqDCoCBpZiAoY29ubi0+ZG9tYWluICYmIGNvbm4tPmRvbWFpbi0+aW50ZXJmYWNlICYmDQo+
PiArwqDCoMKgwqDCoMKgwqAgKGNvbm4tPmRvbWFpbi0+ZmVhdHVyZXMgJiBYRU5TVE9SRV9T
RVJWRVJfRkVBVFVSRV9FUlJPUikpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY29ubi0+ZG9t
YWluLT5pbnRlcmZhY2UtPmVycm9yID0gZXJyOw0KPj4gwqDCoMKgwqDCoCBjb25uLT5pc19p
Z25vcmVkID0gdHJ1ZTsNCj4+IEBAIC0xMDc4LDExICsxMDg2LDE0IEBAIGludCBkb19pbnRy
b2R1Y2UoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiANCj4+ICpjb25uLA0K
Pj4gwqDCoMKgwqDCoCBkb21haW5fY29ubl9yZXNldChkb21haW4pOw0KPj4gLcKgwqDCoCBp
ZiAoZG9tYWluLT5pbnRlcmZhY2UgIT0gTlVMTCAmJg0KPj4gLcKgwqDCoMKgwqDCoMKgIGRv
bWFpbi0+aW50ZXJmYWNlLT5jb25uZWN0aW9uID09IFhFTlNUT1JFX1JFQ09OTkVDVCkgew0K
Pj4gLcKgwqDCoMKgwqDCoMKgIC8qIE5vdGlmeSB0aGUgZG9tYWluIHRoYXQgeGVuc3RvcmUg
aXMgYXZhaWxhYmxlICovDQo+PiAtwqDCoMKgwqDCoMKgwqAgZG9tYWluLT5pbnRlcmZhY2Ut
PmNvbm5lY3Rpb24gPSBYRU5TVE9SRV9DT05ORUNURUQ7DQo+PiAtwqDCoMKgwqDCoMKgwqAg
eGVuZXZ0Y2huX25vdGlmeSh4Y2VfaGFuZGxlLCBkb21haW4tPnBvcnQpOw0KPj4gK8KgwqDC
oCBpZiAoZG9tYWluLT5pbnRlcmZhY2UgIT0gTlVMTCkgew0KPj4gK8KgwqDCoMKgwqDCoMKg
IGRvbWFpbi0+aW50ZXJmYWNlLT5zZXJ2ZXJfZmVhdHVyZXMgPSBkb21haW4tPmZlYXR1cmVz
Ow0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChkb21haW4tPmludGVyZmFjZS0+Y29u
bmVjdGlvbiA9PSBYRU5TVE9SRV9SRUNPTk5FQ1QpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC8qIE5vdGlmeSB0aGUgZG9tYWluIHRoYXQgeGVuc3RvcmUgaXMgYXZhaWxhYmxl
ICovDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21haW4tPmludGVyZmFjZS0+Y29u
bmVjdGlvbiA9IFhFTlNUT1JFX0NPTk5FQ1RFRDsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHhlbmV2dGNobl9ub3RpZnkoeGNlX2hhbmRsZSwgZG9tYWluLT5wb3J0KTsNCj4+ICvC
oMKgwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqAgc2VuZF9h
Y2soY29ubiwgWFNfSU5UUk9EVUNFKTsNCj4+IEBAIC0xODQ5LDYgKzE4NjAsNTQgQEAgdm9p
ZCByZWFkX3N0YXRlX2Nvbm5lY3Rpb24oY29uc3Qgdm9pZCAqY3R4LCBjb25zdCB2b2lkIA0K
Pj4gKnN0YXRlKQ0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCB9DQo+PiArc3RhdGljIGludCBk
dW1wX3N0YXRlX2RvbWFpbihjb25zdCB2b2lkICprLCB2b2lkICp2LCB2b2lkICphcmcpDQo+
PiArew0KPj4gK8KgwqDCoCBzdHJ1Y3QgZG9tYWluICpkb21haW4gPSB2Ow0KPj4gK8KgwqDC
oCBGSUxFICpmcCA9IGFyZzsNCj4+ICvCoMKgwqAgc3RydWN0IHhzX3N0YXRlX2RvbWFpbiBz
ZDsNCj4+ICvCoMKgwqAgc3RydWN0IHhzX3N0YXRlX3JlY29yZF9oZWFkZXIgaGVhZDsNCj4+
ICsNCj4+ICvCoMKgwqAgaGVhZC50eXBlID0gWFNfU1RBVEVfVFlQRV9ET01BSU47DQo+PiAr
wqDCoMKgIGhlYWQubGVuZ3RoID0gc2l6ZW9mKHNkKTsNCj4+ICvCoMKgwqAgbWVtc2V0KCZz
ZCwgMCwgc2l6ZW9mKHNkKSk7DQo+PiArwqDCoMKgIHNkLmRvbWFpbl9pZCA9IGRvbWFpbi0+
ZG9taWQ7DQo+PiArDQo+PiArwqDCoMKgIGlmIChsdV9zdGF0dXMtPnZlcnNpb24gPiAxKQ0K
PiANCj4gSXMgdGhpcyB3aHkgeW91IGV4cG9zZSBsdV9zdGF0ZSBiZWxvdz/CoCBJIGNhbid0
IGZpbmQgYW55IG90aGVyIHVzZS4NCg0KWWVzLg0KDQo+IA0KPiBBcmUgeW91IGd1YXJhbnRl
ZWQgbHVfc3RhdHVzICE9IE5VTEw/DQoNClllcywgd2UgYXJlIGFscmVhZHkgd3JpdGluZyBv
dXQgdGhlIGRhdGEgZm9yIHRoZSBuZXcgWGVuc3RvcmUgaW5zdGFuY2UsDQpzbyBsdV9zdGF0
dXMgbXVzdCBoYXZlIGJlZW4gc2V0dXAuDQoNCg0KSnVlcmdlbg0K
--------------j4fn5k61YhW5Bl5P80Hzi4LK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------j4fn5k61YhW5Bl5P80Hzi4LK--

--------------NXn6jidQgyPuAYQ900TM0ATr--

--------------99S3L8jY33noopmka3OP6AaH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDE48FAwAAAAAACgkQsN6d1ii/Ey8y
wQf/f444zZ382t+k5td3Va/CoH165NCqXf7F/3TgHONbEsjaq5PLrAz/xHXGXMlrng5eVEFgbzG/
SzeQVT1ky/jbB6Mnx2buAlqzh/AGX0MJn74pNCp//IeoxvTFUp649Z+jtwQWjWrceP7DTWSXkSkl
OB7u2i7DZpMozdHnc85MhMFxJTA61lB8uJfDEmRiWbCLdQbTNLles0/sa1Dlpcq72ka2o/h/iO0d
ARU40LmXE8sDnzu2k+fCIARtoztYx2S0xlMBCC7xF1A/CoTSwfBdE2g1fZgc/mWvsFO9uQ4XsTYH
Xca0d+IuB2ZPbzU1KwvuQcJAmju4SfNwAruP9cOeRA==
=oaaR
-----END PGP SIGNATURE-----

--------------99S3L8jY33noopmka3OP6AaH--

