Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08F9DFB54
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 08:34:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846284.1261461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI0wV-0000DH-0A; Mon, 02 Dec 2024 07:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846284.1261461; Mon, 02 Dec 2024 07:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI0wU-0000BB-T5; Mon, 02 Dec 2024 07:34:02 +0000
Received: by outflank-mailman (input) for mailman id 846284;
 Mon, 02 Dec 2024 07:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tI0wT-0000B5-N9
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 07:34:01 +0000
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [2a00:1450:4864:20::143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cade6ae7-b07f-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 08:33:58 +0100 (CET)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso4382113e87.2
 for <xen-devel@lists.xenproject.org>; Sun, 01 Dec 2024 23:33:58 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ea9c5952sm4613112f8f.67.2024.12.01.23.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2024 23:33:57 -0800 (PST)
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
X-Inumbo-ID: cade6ae7-b07f-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxNDMiLCJoZWxvIjoibWFpbC1sZjEteDE0My5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNhZGU2YWU3LWIwN2YtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTI0ODM4LjQ1NDAyMSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733124838; x=1733729638; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JEdQzfmHvFud2pyDc69tUs6vmsVBEXrSpmtr+dhUAh0=;
        b=CCmBUGSJCLiVEaz9uy0D7aOeIOqNDqbmB4j+ONzEqhAN2ZzmZogtzGpsyvZQUwQtpU
         XHMPbBPcY1g4Y5KesjVKP87bbT8mf41wYz+U3x9HletsTn3ljs4yURzI8PPtMvC8rj5f
         EOHW+ObbIeeSQvc+5lrGraq1dXi8fZmbl/8olBQKIyCTZfk7ebJcbcd5x7A4oxNGHjQC
         IQjQPjZUnun/aMxbngndaycjqSUg9Sf9Fo65vS4sCGVAGfOgqS66xm/d9Q1BJFrvYA9n
         jLYl1LGLbbKANGY/Dd69W7AOsQHmi7yRkonij0YdfTb6hZl3sHhkTbXNARirbBo6qYGV
         LLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733124838; x=1733729638;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEdQzfmHvFud2pyDc69tUs6vmsVBEXrSpmtr+dhUAh0=;
        b=L0LRKmUxPRSCG563ZJPvWbPc6xQdbBwkx4+t5Dk0oxcB472w7N0/bRprgW2DGBITir
         LRqLfDCAr+V9+sZC7lrZUVEfz5BAKngbvEG6eFDJoXLPLBRSjkb7RD4sY5vzTH58dO9+
         rpEXDNE1BaHv5pEm4MgJSEal26STuRs8gQdRnB3s3zKVrVXIBB6mSqMfldD/LQYz91nc
         1SAbcOoOSf2pW2EN+GgNe9LoHYnOhSEPKWWVv8NlGlpI/gBVnrssO4b3fg2bd694G5F3
         gBYkVRENTd7v1O9IqLvcdBEJGjzloCXgOkHoj6WAOiQj0Bwk66OcIuRZu6EFjEbr5f1u
         50ZA==
X-Gm-Message-State: AOJu0YwSJy4j+ca8Im6lcZqF+PZihiIBIl9scnXrqlSA/HswI6KflzfF
	IvTJnAJJjLPj7fdSqxPi1Ejc4Boq/Spde/WPyauQW/zZat3O5TZWCJD5uL9eUPvFgQea3/LsiR9
	KC40NpA==
X-Gm-Gg: ASbGnct8rEGa4EDZ692t1IzHzIsd6ixdwPuOcBm0L6j+jYPvYMNOC40m30GehRx0pZj
	Ql+2+ILb6GrkNF2OAD84zEUcb8nnaEJYqdBH09O1QnBMpKfsqrVrW+0bCAvUPD02TqMyfGH7f3r
	Uk2Hepac7W2HqVsgXQa9z2COYsHTj1yWZMuc+mlCyVqE5phgz8HASl4H1sR63BAVjb3EPNsFokb
	EaBy1pGyWVTf/huKU40utbxHRHEnsweK9w9dtm/lQmtbFuq9+VvG0XYnn4IFBYHvMlZNtJVH98A
	nbeRxTZtAAdnJCc3T7qC812ZYqjngqjnglNzEAj3KWGMFdCp7NA3vbShbYm4CgZGlo7c/r7Gev4
	=
X-Google-Smtp-Source: AGHT+IGjdQ2Dvw5Bf3yb024ca0Zj+Xhx3qyGkeWka9xgiYBPQC/kf4Qa3SCSUxz7PiVf7dYEQlnqUg==
X-Received: by 2002:a05:6512:3ba2:b0:53d:eec4:2bfa with SMTP id 2adb3069b0e04-53df0104777mr10774537e87.37.1733124837643;
        Sun, 01 Dec 2024 23:33:57 -0800 (PST)
Message-ID: <4aff0928-87a1-4010-8ec9-efef5845294f@suse.com>
Date: Mon, 2 Dec 2024 08:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] tools: add a dedicated header file for barrier
 definitions
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-6-jgross@suse.com> <Z0YFN13jUJMNb-7h@l14>
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
In-Reply-To: <Z0YFN13jUJMNb-7h@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MaXpSxldNgaGWHt8hq0M0r0c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MaXpSxldNgaGWHt8hq0M0r0c
Content-Type: multipart/mixed; boundary="------------TIsd6CCfmgEDaj4gI8KaK636";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Message-ID: <4aff0928-87a1-4010-8ec9-efef5845294f@suse.com>
Subject: Re: [PATCH 5/6] tools: add a dedicated header file for barrier
 definitions
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-6-jgross@suse.com> <Z0YFN13jUJMNb-7h@l14>
In-Reply-To: <Z0YFN13jUJMNb-7h@l14>

--------------TIsd6CCfmgEDaj4gI8KaK636
Content-Type: multipart/mixed; boundary="------------LXDEvQWQ67wW0lsueoREevNY"

--------------LXDEvQWQ67wW0lsueoREevNY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTEuMjQgMTg6MjgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBXZWQsIE9j
dCAyMywgMjAyNCBhdCAwMzoxMDowNFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUveGVuLWJhcnJpZXIuaCBiL3Rvb2xzL2lu
Y2x1ZGUveGVuLWJhcnJpZXIuaA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4
IDAwMDAwMDAwMDAuLjYyMDM2ZjUyOGINCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3Rv
b2xzL2luY2x1ZGUveGVuLWJhcnJpZXIuaA0KPj4gQEAgLTAsMCArMSw1MSBAQA0KPj4gKy8q
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioNCj4+ICsgKiB4ZW4tYmFycmllci5oDQo+PiArICoN
Cj4+ICsgKiBEZWZpbml0aW9uIG9mIENQVSBiYXJyaWVycywgcGFydCBvZiBsaWJ4ZW5jdHJs
Lg0KPiANCj4gRG9lcyBpdCBuZWVkcyB0byBiZSBwYXJ0IG9mICJsaWJ4ZW5jdHJsIiA/IDot
KSBTaW5jZSB0aGUgZ29hbCBpcyB0byBiZQ0KPiBhYmxlIHRvIHVzZSB0aGUgaGVhZGVyIHdp
dGhvdXQgeGVuY3RybC4NCg0KWWVhaCwgYnV0IGl0IHdhcyBwYXJ0IG9mIGxpYnhlbmN0cmwg
dW50aWwgbm93Lg0KDQpTbyBpdCBuZWVkcyB0byBiZSBkaXN0cmlidXRlZCB0b2dldGhlciB3
aXRoIHhlbmN0cmwuaCwgb3RoZXJ3aXNlIHdlJ2QNCm5lZWQgYW5vdGhlciBkaXN0cmlidXRp
b24gdW5pdCBsaWJ4ZW5jdHJsIGhhcyB0byBkZXBlbmQgb24uDQoNCj4+ICsgKg0KPj4gKyAq
IENvcHlyaWdodCAoYykgMjAwMy0yMDA0LCBLIEEgRnJhc2VyLg0KPiANCj4gSSdtIG5vdCBz
dXJlIHRoaXMgY29weXJpZ2h0IGxpbmUgaXMgZW5vdWdoLCBsb29raW5nIGF0IGBnaXQgYmxh
bWVgLg0KPiANCj4gS2VpciBpbnRyb2R1Y2UgeGVuX2JhcnJpZXIgbWFjcm8gaW4gMjAxMiwg
aW4NCj4gOGQzZjc1NzMyOGUxICgibGlieGM6IFVwZGF0ZSBybWIvd21iIGZvciB4ODYuIikN
Cj4gU3RlZmFubyBpbnRyb2R1Y2VkIHRoZSBBcm0gbWFjcm8gaW4gMjAxMiwgaW4gZGFhMzE0
ZmUxOTM4ICgiYXJtOiBjb21waWxlDQo+IGxpYnhjIiksIGFuZCBJYW4gaW4gMjAxMyBpbiBh
ZTRiNmYyOWE5ODMgKCJ0b29sczogbGlieGM6IGFybTY0DQo+IHN1cHBvcnQiKS4NCj4gVGhl
cmUncyBiZWVuIGEgbW9kaWZpY2F0aW9uIGJ5IEFuZHJldyBpbiAyMDIwLCBzbyBDaXRyaXgg
Y29weXJpZ2h0LA0KPiBpbiBkZTE2YThmYTBkYjcgKCJ4ODY6IFVzZSBMT0NLIEFERCBpbnN0
ZWFkIG9mIE1GRU5DRSBmb3Igc21wX21iKCkiKS4NCj4gDQo+IFNvIG92ZXJhbGwsIHdlIHBy
b2JhYmx5IHdhbnQ6DQo+IENvcHlyaWdodCAoQykgMjAwMy0yMDEyLCBLIEEgRnJhc2VyLg0K
PiBDb3B5cmlnaHQgKEMpIDIwMTItMjAyMCBDaXRyaXggU3lzdGVtcywgSW5jLg0KDQpIbW0s
IEkganVzdCBjb3BpZWQgdGhlIENvcHlyaWdodCBmcm9tIHhlbmN0cmwuaCwgd2hlcmUgSSB0
b29rIHRoZSBjb250ZW50cw0Kb2YgdGhlIG5ldyBoZWFkZXIgZnJvbS4NCg0KSSBjYW4gc2Vl
IGEgcmVhc29uIGZvciBhZGRpbmcgdGhlIENvcHlyaWdodCBmb3IgQ2l0cml4LCBidXQgSU1I
TyB0aGlzDQpfc2hvdWxkXyBoYXZlIGhhcHBlbmVkIHdoZW4gdGhlIGNoYW5nZXMgd2VyZSBh
cHBsaWVkIGluIDIwMjAuIEFuZCBJJ20gZmVlbGluZw0KYSBsaXR0bGUgYml0IHVuZWFzeSB0
byBhZGQgYSBDb3B5cmlnaHQgZm9yIGEgY29tcGFueSBJJ20gbm90IHdvcmtpbmcgZm9yLiBI
b3cNCmRvIEkgcmVhbGx5IGtub3cgQ2l0cml4IGlzIHdhbnRpbmcgdGhhdCBDb3B5cmlnaHQg
dG8gYmUgYWRkZWQ/DQoNCj4+ICsgKg0KPj4gKyAqIFRoaXMgbGlicmFyeSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3INCj4+ICsgKiBtb2RpZnkg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljDQo+
PiArICogTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbjsNCj4+ICsgKiB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZS4NCj4+ICsgKg0KPj4g
KyAqIFRoaXMgbGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdp
bGwgYmUgdXNlZnVsLA0KPj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91
dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+PiArICogTUVSQ0hBTlRBQklMSVRZ
IG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUNCj4+
ICsgKiBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLg0K
Pj4gKyAqDQo+PiArICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUg
R05VIExlc3NlciBHZW5lcmFsIFB1YmxpYw0KPj4gKyAqIExpY2Vuc2UgYWxvbmcgd2l0aCB0
aGlzIGxpYnJhcnk7IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMv
Pi4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjaWZuZGVmIFhFTkJBUlJJRVJfSA0KPj4gKyNkZWZp
bmUgWEVOQkFSUklFUl9IDQo+IA0KPiBXaXRoIGFuIGV4dHJhICdfJyBmb3IgdGhlICctJyBp
biB0aGUgaGVhZGVyIGZpbGVuYW1lPw0KPiAgICAgIFhFTl9CQVJSSUVSX0gNCg0KT2theS4N
Cg0KPiBPdGhlcndpc2UsIHRoZSByZXN0IG9mIHRoZSBwYXRjaCBsb29rcyBmaW5lIHRvIG1l
LCBldmVuIHdpdGhvdXQgdGhlIHJlc3QNCj4gb2YgdGhlIHNlcmllcy4NCg0KVGhhbmtzLA0K
DQoNCkp1ZXJnZW4NCg==
--------------LXDEvQWQ67wW0lsueoREevNY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------LXDEvQWQ67wW0lsueoREevNY--

--------------TIsd6CCfmgEDaj4gI8KaK636--

--------------MaXpSxldNgaGWHt8hq0M0r0c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdNYuQFAwAAAAAACgkQsN6d1ii/Ey+x
Uwf/Q0LkQSNI1sYcNTd+uwQQWOWC0OSLrk/7irE+tvIRWbBlRkT4dn9fXWwyALwsxt1kVNVed5dk
lU8EwtJs6uuRjy/U6LWA2eqPXbpCh7q6OyB/kjrSCWH9o0bitlVWw789j+Uvk8zhJOAmq9aMgSSr
8qJqUcfhIEjNpQEDsXG1nulAHRdROnJeyh8KnsP5mVrmF0RVdvw2ElGkbdTjcG5IYy+SGsmgoSHr
1o3lXL1XoVs9VjouTPXN3yD/Usth4pdjU4JuYzhfz98VnBvKg2+Ky5IbyzpKuea3ZE2ZXQoROyP9
ui+ynAEr++kUSccdgWrwj+9mkpVo5VfMGUi/Ze3ltg==
=9xYK
-----END PGP SIGNATURE-----

--------------MaXpSxldNgaGWHt8hq0M0r0c--

