Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A39DFB2E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 08:26:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846263.1261441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI0nw-0006Sp-Qz; Mon, 02 Dec 2024 07:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846263.1261441; Mon, 02 Dec 2024 07:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI0nw-0006QI-NE; Mon, 02 Dec 2024 07:25:12 +0000
Received: by outflank-mailman (input) for mailman id 846263;
 Mon, 02 Dec 2024 07:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tI0nu-0006Q8-Tg
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 07:25:11 +0000
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c758711-b07e-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 08:25:04 +0100 (CET)
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-aa560a65fd6so668629366b.0
 for <xen-devel@lists.xenproject.org>; Sun, 01 Dec 2024 23:25:04 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d5651sm478928666b.60.2024.12.01.23.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Dec 2024 23:25:03 -0800 (PST)
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
X-Inumbo-ID: 8c758711-b07e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2NDIiLCJoZWxvIjoibWFpbC1lajEteDY0Mi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhjNzU4NzExLWIwN2UtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTI0MzA0LjI4OTQ2LCJzZW5kZXIiOiJqZ3Jvc3NAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733124304; x=1733729104; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UWoShG7di6vkn4Jos4Z2jQDm+QslUzISpyuQRzKKTfQ=;
        b=RH8gI9iQo56g0KHP8Dp6LNpiwS9ObltMQznUwrAQnbV49pmpUHYlqy0z8iRE2fWx3K
         cXzP+DBYFItpMHkio6ZdlOhLiKjvK3bi9PPYurFXDNEVhgV4poGyIAVJDU6aUrBEa5ps
         xyblG7w5KVhNrjiRROO/PxL4sAMQkF8AEznPrz0gqN/75VfESN7d8iQprjdYnqkt/aNK
         5U4TE5wSuw6ixGy0aHr/SgPEPw3zZe1J2SF/39+H785skaV8x0nCQK75d6hMbNjz3ANp
         itXiljFsChBPLQUoHs4RcJ+uQz89wzMxkWnefeSok18wQs5DM/w5LvEc7E+HjhAPF0mT
         hpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733124304; x=1733729104;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWoShG7di6vkn4Jos4Z2jQDm+QslUzISpyuQRzKKTfQ=;
        b=I0DqUsbiPozpzonkO4fzrogDB1IfwYaTaFM+GlxN4wWhbnvOw/dUEX9V4wZdGFIIhP
         v9yG6KjYe3XHznwfkFeoCuKhS0cwkhuYOHfe9SFqNEpiW+y5yiaiEqmu2bQIYZngUb40
         ccd8Iz3IotDFRxsLvUQJ/RmXiJ4nbicAWk+Bcpr36U2bMxDf2M/Tt6svt1V+DsOizKQc
         USuK5GOfSkcgCRkTEXHDSgxiaWO9+wgdXnmCeSGISJoxwL5+kz9/sD6LbtUM7VMlNGx4
         SiDcLCav78nVKkF6A5QDJr+rPM80ObzotrgIZ2UAQGp4r5BMVAfjUor/n5riSzEFx6yG
         xWNw==
X-Gm-Message-State: AOJu0YwcV6K/MbV1Ni4lgXzmNP3gvlXIbhEy0RC1GPzfYenife6Mu6MA
	03h5vWEeWqHx1O/SRRHgRhK0B2wViXP81+bRKSqLFu2UyLE4E7FBM6OLTukZTZrW6z8AaUSsnpK
	pe7xkmw==
X-Gm-Gg: ASbGnctJsRCMYYreee5IjNo8sTp6rtfRtUOzIa0uQWVsbLSPjXi/melwNfXqg9VH+kR
	zOw9hojY8rvqtf2jc+9fTKTFV3Fck1fHCwzdM0qY9SOd6WpBRW6/gEpQtwtxGb9/RRWRG07vlYd
	Am7geBPwo1DeCBm1mlEQHMwr6mmnSHUMQ0dIBYhoDAFmmDy5cmvZA7H1UpbJceECPQIzWt5pi8O
	1236Fbl984H5+Se8dOJRw1EVa3nkCFiMrs/3DSGJvYw2FWj0k8ccyigOdxaHA6xh6jgkzYNi/qa
	JETE76XD7CYi87SSgCD0xFq+8jJ/QeFDkSss1KyPEoBoz+FjVq1372FW3wuB9svlxxIF3nmPYFI
	=
X-Google-Smtp-Source: AGHT+IGGRIJJFu2oB4RxYndCUd1sEmix/B9K2dHgLUuXs4xX0HRCcfQ4fHiUjQFYmjB2mt+SJ5uLWw==
X-Received: by 2002:a17:906:d54b:b0:aa5:3fe7:4475 with SMTP id a640c23a62f3a-aa59453454fmr2311817866b.11.1733124303615;
        Sun, 01 Dec 2024 23:25:03 -0800 (PST)
Message-ID: <24b4d5a6-be4b-47fb-9190-fa8171b7a892@suse.com>
Date: Mon, 2 Dec 2024 08:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libs: add a new libxenmanage library
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-5-jgross@suse.com> <Z0CNNdezcIbUelrk@l14>
 <1846da14-f942-4414-8776-d76019fba37f@suse.com> <Z0X6-EzHQtVjDGs7@l14>
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
In-Reply-To: <Z0X6-EzHQtVjDGs7@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G4NJzX6KXWrFPXj98gh0rRYI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G4NJzX6KXWrFPXj98gh0rRYI
Content-Type: multipart/mixed; boundary="------------kkU0bUC1tb6PYQa9jLHIz0PU";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org
Message-ID: <24b4d5a6-be4b-47fb-9190-fa8171b7a892@suse.com>
Subject: Re: [PATCH 4/6] tools/libs: add a new libxenmanage library
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-5-jgross@suse.com> <Z0CNNdezcIbUelrk@l14>
 <1846da14-f942-4414-8776-d76019fba37f@suse.com> <Z0X6-EzHQtVjDGs7@l14>
In-Reply-To: <Z0X6-EzHQtVjDGs7@l14>

--------------kkU0bUC1tb6PYQa9jLHIz0PU
Content-Type: multipart/mixed; boundary="------------6vHj0p8lLX6AI0WaOghXwSRU"

--------------6vHj0p8lLX6AI0WaOghXwSRU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTEuMjQgMTc6NDQsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBGcmksIE5v
diAyMiwgMjAyNCBhdCAwNDoxMjoyNVBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
Pj4gT24gMjIuMTEuMjQgMTQ6NTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IE9uIFdl
ZCwgT2N0IDIzLCAyMDI0IGF0IDAzOjEwOjAzUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL3hlbm1hbmFnZS5oIGIvdG9v
bHMvaW5jbHVkZS94ZW5tYW5hZ2UuaA0KPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+
PiBpbmRleCAwMDAwMDAwMDAwLi4yZTZjM2RlZGFhDQo+Pj4+IC0tLSAvZGV2L251bGwNCj4+
Pj4gKysrIGIvdG9vbHMvaW5jbHVkZS94ZW5tYW5hZ2UuaA0KPj4+PiBAQCAtMCwwICsxLDk4
IEBADQo+Pj4+ICsvKg0KPj4+PiArICogQ29weXJpZ2h0IChjKSAyMDI0IFNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4+PiArICoNCj4+Pj4gKyAqIFRoaXMgbGli
cmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IN
Cj4+Pj4gKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIg
R2VuZXJhbCBQdWJsaWMNCj4+Pj4gKyAqIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb247DQo+Pj4+ICsgKiB2ZXJzaW9uIDIuMSBvZiB0aGUg
TGljZW5zZS4NCj4+Pj4gKyAqDQo+Pj4+ICsgKiBUaGlzIGxpYnJhcnkgaXMgZGlzdHJpYnV0
ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwNCj4+Pj4gKyAqIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5
IG9mDQo+Pj4+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQ0KPj4+PiArICogTGVzc2VyIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCj4+Pj4gKyAqDQo+Pj4+ICsgKiBZb3Ug
c2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwg
UHVibGljDQo+Pj4+ICsgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBsaWJyYXJ5OyBJZiBu
b3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+Pj4NCj4+PiBTaGFs
bCB3ZSB1c2UgU1BEWCB0YWdzIGluc3RlYWQgb2YgdGhpcyBib2lsZXJwbGF0ZT8NCj4+DQo+
PiBNeSB0aGlua2luZyB3YXMgdG8gYXZvaWQgdGhhdCBmb3IgIm9mZmljaWFsIiBoZWFkZXIg
ZmlsZXMsIGFzIHRob3NlIG1pZ2h0DQo+PiBiZSBjb3BpZWQgdmVyYmF0aW0gdG8gb3RoZXIg
cHJvamVjdHMsIHdoaWNoIG1pZ2h0IG5vdCB1c2UgU1BEWC4gU28gaGF2aW5nDQo+PiB0aGUg
bGljZW5zZSB0ZXh0IHZlcmJhdGltIGF2b2lkcyBhbnkgcHJvYmxlbXMgaW4gdGhpcyByZWdh
cmQuDQo+IA0KPiBXZWxsLCB0aGlzIGhlYWRlciBpbiBwYXJ0aWN1bGFyIHdvdWxkIGJlIGZh
aXJseSB1c2VsZXNzLCBJIGJlbGlldmUsIGlmIGl0DQo+IHdhcyBjb3BpZWQgaW50byBhbiBv
dGhlciBwcm9qZWN0LCBpdCBkZXNjcmliZWQgYSBsaWJyYXJ5IHNvIG5lZWQgdG8gYmUNCj4g
ZGlzdHJpYnV0ZWQgYWxvbmcgc2lkZSB0aGUgbGlicmFyeS4gU2Vjb25kLCB0aGlzIGlzbid0
IHRoZSB0ZXh0IG9mIHRoZQ0KPiBsaWNlbnNlIGJ1dCBzb21ldGhpbmcgZGVzY3JpYmluZyB3
aGljaCBsaWNlbnNlIGlzIHVzZWQgYW5kIHdoZXJlIHRvDQo+IGZpbmQgdGhlIHRleHQgZm9y
IGl0LiBBbiBTUERYIHRhZyBkb2VzIG5lYXJseSB0aGUgc2FtZSB0aGluZywgYnV0IGNhbg0K
PiBhY3R1YWxseSBiZSBwYXJzZSBieSBhIGNvbXB1dGVyLg0KPiANCj4gT2ZmaWNpYWwgaGVh
ZGVycyB0aGF0IHdvdWxkIGJlIHVzZWZ1bCB0byBiZSBjb3BpZWQgaW50byBvdGhlciBwcm9q
ZWN0DQo+IGFscmVhZHkgZXhwb3NlIHRoZSBTUERYIHRhZ3MsIG1hbnkvYWxsIHRoZSBoZWFk
ZXJzIGluDQo+IHhlbi9pbmNsdWRlL3B1YmxpYywgYXMgd2VsbCBhcyBoZWFkZXJzIGNyZWF0
ZWQgYnkgYG1raGVhZGVyLnB5YCBpbiB0aGlzDQo+IGRpcmVjdG9yeSAodG9vbHMvaW5jbHVk
ZSkuDQo+IA0KPiBJJ3ZlIHRha2VuIGEgbG9vayBpbnRvIG15IGRpcmVjdG9yeSAiL3Vzci9p
bmNsdWRlIiwgYW5kIHRoZXkgYXJlIHBsZW50eQ0KPiBvZiBoZWFkZXJzIGhhdmluZyB0aGUg
U1BEWCB0YWcuDQo+IA0KPiBTbyBvdmVyYWxsLCBJIHRoaW5rIHdlIGFyZSBmaW5lIHRvIHVz
ZSBTUERYIHRhZ3MgaGVyZSBhcyB3ZWxsLiA7LSkNCg0KT2theSwgSSdsbCBzd2l0Y2ggdG8g
U1BEWC4NCg0KDQpKdWVyZ2VuDQo=
--------------6vHj0p8lLX6AI0WaOghXwSRU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------6vHj0p8lLX6AI0WaOghXwSRU--

--------------kkU0bUC1tb6PYQa9jLHIz0PU--

--------------G4NJzX6KXWrFPXj98gh0rRYI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdNYM4FAwAAAAAACgkQsN6d1ii/Ey8J
rgf+NJFjrsOVZ5W8Gj9caCUiRO7uTEOtNEMu4V4aQiESLlnDq9ZSCDmsEDCN+tSE5QxvtbL6wwKH
TIlWEhoJ4Vw9VpKOtnJ49cgyhv/rARqkd9sEkacI3QjNljocscJI2hmsed635ORiO8fBWC9wiXcu
YrojCClxlHgpxC2kp5y71y/b/NSCj+B8k0rhfplAOWYdIwEiSyIFt5aWnCgtWwfat/T7POsAganQ
WiIczkk8LK0nOCksNqTCBfhS95Abeado5BrKTXsvk7B77mx4oV3Nrjq0SV09FfGLtAmQ0DAF18Po
OGHouC+aPvQCdA+8KC8DWguN5m6U3Lz5P4b+7ID40w==
=ir8N
-----END PGP SIGNATURE-----

--------------G4NJzX6KXWrFPXj98gh0rRYI--

