Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF8D1CECB
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 08:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202589.1518090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvXv-0000SR-4f; Wed, 14 Jan 2026 07:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202589.1518090; Wed, 14 Jan 2026 07:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvXv-0000QF-1O; Wed, 14 Jan 2026 07:44:03 +0000
Received: by outflank-mailman (input) for mailman id 1202589;
 Wed, 14 Jan 2026 07:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J70X=7T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vfvXs-0000Q9-MV
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 07:44:00 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d900d5-f11c-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 08:43:58 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-652fdd043f9so3247667a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 23:43:58 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8?
 (2a00-12d0-af5b-2f01-96c4-9745-9e8c-b1e8.ip.tng.de.
 [2a00:12d0:af5b:2f01:96c4:9745:9e8c:b1e8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4454sm22377242a12.3.2026.01.13.23.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:43:57 -0800 (PST)
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
X-Inumbo-ID: c8d900d5-f11c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768376637; x=1768981437; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nZBcekoOmtM0omaCckBMLaoIquuqBm2yb/TA/kpHHdw=;
        b=Dhoxr6BWv6/RKH4J/oGe8osD4nhaadfQjsxR0rHJsHydc1q4hjgE9teO/e2wGRo6yK
         EFI0tfjfvIr9Vwl34zhdx/X6DU2uCR09Fy4mC9PUMj+I9r9SqwBNaXXmguSNg/1BCcNv
         DGWaXNXNQYPLp9H3CyBDbj1SRDyfhIIJnH0CcIsK1tvwRcrDJh3SHrEIqqW9adDeOScW
         vbRH9IlyUJUx1VezQpQmR0gfj9z8KQspkzYJbTOD9RvP6j81kbPtV+PzgJchkFkFaUYT
         jp2UUU6IzS/DEEuaHncEeipCNpkBgqR3yRAwq7LrWe5wSmpJX/6A98DXUuZI1/ZuF9Kn
         OePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768376637; x=1768981437;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZBcekoOmtM0omaCckBMLaoIquuqBm2yb/TA/kpHHdw=;
        b=l17LbABMvoXEwBWRCWXvGkwqGGkVSbEC/vu93FPbmGZUaoszya3cjEUYLuhPUgBC4n
         AJWqabkgPyRMjB5Oq96ZYZlgEAONtZcP+sdMkVuCHujXrch4nrE8sQZdjra/FAehHHDS
         hppKB/YuIgausHj61BIApC7qlPVeFpZQmTZcUsszRVjVkFTVoUKyZaE38GQnCb0VYC+4
         0h17acCe78yrH7EbWKJL9Ji50YlwgyoTMjxvaLrbGnw3JqIJ3EQwcZYw86A724jcyBsk
         fmNKp9vB3KbSukXhetm/+NZeUUGQqNgpTZEnozqP5+xZvOQWswLixY0V+uqs2GAvHwHv
         0Thw==
X-Forwarded-Encrypted: i=1; AJvYcCW61RGoRorAtFZ1jIHdSykgIAUxTWNLKYgdHaIOXBCufuVTsSek4TZYGtnxkMvLh+X44cKt166m4mU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNpIQfBsLkqZ6T51hIfkyKJZVYtnxOvOymV2h1AKhqMnc4q5Bi
	hzEvez7W9u9PJ/h6eFLlgdjSbK2CPdI/gtwdSK6DK1E7uh3obd3/Ko0gvTODlstCQKI1N1bBGmX
	ACPzP8+vBwQ==
X-Gm-Gg: AY/fxX62GZXqaFhYezdyS9rXIHCzim9WdeLs4+9/hkf01Ng4EpsascD95P2x7Lgj/IM
	myyEn4sf/QnEX2WbT2JLBW9imRr9HNHO9Psbpl5a2cWgtulWYiNAefx4W8uY3EXg/qeM8ga6D7b
	WItgHAklRA1Xm2g97JcQx0ePT8y0eo9fXT13XLHuA2EFDh/RdCrKvWhW+CY464u1Q2hfsFLU4QN
	xGEEXFChZYU/SEGoFKyUUnfNL6HkgseCheTHQHbojlR9AXa4BoQuNLKRXjtqqn4iVS56RTKCfGh
	ogQw4AXSHzqYaku1RvZs14nott7vxAa1f3XE1QTLyGd5XO+p4yJEBZiACWAjgVLpdAJ3JbDAuhp
	ywyT+yhUdKxt3xFG84ursKGvcnl3xYPScnIwl8wcpPpxW5zIrL2YG2JOkxCHA0M31kFagy0PXQc
	XVqsxJDxvJ89QhgNf2RxRYbRWrOrZ8QZCdj5TnQUfbcOTTSNHg1nsxfgCfbWkZkybx3Jm74Ha0N
	fgcNEmxxjcNW8K7W3iRiH1SPlxsM9oNB+xQgTY=
X-Received: by 2002:a05:6402:278e:b0:64b:3f56:55c9 with SMTP id 4fb4d7f45d1cf-653ee1b06f9mr906340a12.26.1768376637459;
        Tue, 13 Jan 2026 23:43:57 -0800 (PST)
Message-ID: <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
Date: Wed, 14 Jan 2026 08:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
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
In-Reply-To: <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A0DlLc8TqXrk8i0VLuch07h4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A0DlLc8TqXrk8i0VLuch07h4
Content-Type: multipart/mixed; boundary="------------yMmA46rM5fOCVXy6dq1hREsv";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alexandre GRIVEAUX <agriveaux@deutnet.info>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
In-Reply-To: <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>

--------------yMmA46rM5fOCVXy6dq1hREsv
Content-Type: multipart/mixed; boundary="------------qc1mysV7e0pTh740olARuGJa"

--------------qc1mysV7e0pTh740olARuGJa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDEuMjYgMDg6MjYsIEFsZXhhbmRyZSBHUklWRUFVWCB3cm90ZToNCj4gTGUgMTMv
MDEvMjAyNiDDoCAwNzoxNSwgSnVlcmdlbiBHcm9zcyBhIMOpY3JpdMKgOg0KPj4gT24gMTIu
MDEuMjYgMjM6NDQsIEFsZXhhbmRyZSBHUklWRUFVWCB3cm90ZToNCj4+PiBVcGRhdGUgZmls
ZXMgZXhlbXBsZXMgUFYmUFZIIGZvciBub24gZGlyZWN0IGtlcm5lbCBib290IHdpdGggcHln
cnViLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdSSVZFQVVYIDxhZ3Jp
dmVhdXhAZGV1dG5ldC5pbmZvPg0KPj4+IC0tLQ0KPj4+IMKgIHRvb2xzL2V4YW1wbGVzL3hs
ZXhhbXBsZS5wdmhsaW51eCB8IDMgKysrDQo+Pj4gwqAgdG9vbHMvZXhhbXBsZXMveGxleGFt
cGxlLnB2bGludXjCoCB8IDMgKysrDQo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS90b29scy9leGFtcGxlcy94bGV4YW1w
bGUucHZobGludXggYi90b29scy9leGFtcGxlcy8gDQo+Pj4geGxleGFtcGxlLnB2aGxpbnV4
DQo+Pj4gaW5kZXggMTgzMDViODBhZi4uMmJkZDQzYzJjNSAxMDA2NDQNCj4+PiAtLS0gYS90
b29scy9leGFtcGxlcy94bGV4YW1wbGUucHZobGludXgNCj4+PiArKysgYi90b29scy9leGFt
cGxlcy94bGV4YW1wbGUucHZobGludXgNCj4+PiBAQCAtMjUsNiArMjUsOSBAQCBrZXJuZWwg
PSAiL2Jvb3Qvdm1saW51eiINCj4+PiDCoCAjIEtlcm5lbCBjb21tYW5kIGxpbmUgb3B0aW9u
cw0KPj4+IMKgIGV4dHJhID0gInJvb3Q9L2Rldi94dmRhMSINCj4+PiDCoCArIyBFbmFibGUg
dG8gdXNlIGEgZ3J1YjIgZW11bGF0aW9uIGluc2lkZSBndWVzdCBpbnN0ZWFkIG9mIGRpcmVj
dCBrZXJuZWwgYm9vdC4NCj4+DQo+PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgY29ycmVjdC4N
Cj4+DQo+PiBweWdydWIgaXMgcnVubmluZyBpbiBkb20wLCBub3QgaW4gdGhlIGd1ZXN0Lg0K
Pj4NCj4+DQo+PiBKdWVyZ2VuDQo+IA0KPiBIZWxsbywNCj4gDQo+IA0KPiBJIGRvZXNuJ3Qg
dW5kZXJzdGFuZCB5b3VyIHJlcGx5LCB5ZXMgcHlncnViIGlzIHJ1bm5pbmcgb24gdGhlIERv
bTAsIGFuZCB0aGlzIA0KPiBnb2FsIGlzIHRvIGJlaGF2ZSBsaWtlIHRoZXJlIGlzIGEgZ3J1
YjIgb24gdGhlIERvbVUuDQoNClllcy4gVGhpcyBpcyB3aHkgSSBkb24ndCBsaWtlIHRoZSB3
b3JkaW5nICJpbnNpZGUgZ3Vlc3QiLCB3aGljaCBpcyBqdXN0IG5vdA0KdHJ1ZS4NCg0KUGxl
YXNlIGJlIGF3YXJlIHRoYXQgd2UgYXJlIHRyeWluZyB0byBwaGFzZSBvdXQgcHlncnViLCBh
cyBpdCB3aWRlbnMgdGhlDQphdHRhY2sgc3VyZmFjZSBvZiBkb20wIGZyb20gYSBndWVzdC4g
cHlncnViIG5lZWRzIHRvIGxvb2sgaW50byBndWVzdA0KY29udHJvbGxlZCBmaWxlIHN5c3Rl
bXMsIHNvIGFueSBidWcgaW4gdGhlIHJlbGF0ZWQgY29kZSAoZS5nLiBmYWlsdXJlIHRvDQpo
YW5kbGUgYSBjb3JydXB0ZWQgb3IgbWFsaWNpb3VzbHkgbW9kaWZpZWQgZmlsZSBzeXN0ZW0p
IG1pZ2h0IHJlc3VsdCBpbg0Kc2VjdXJpdHkgaXNzdWVzIGxpa2UgY29kZSBpbmplY3Rpb24u
DQoNClNvIEknbSBvbiB0aGUgZWRnZSB3aGV0aGVyIHdlIHJlYWxseSBzaG91bGQgbWFrZSBp
dCBlYXNpZXIgdG8gdXNlIHB5Z3J1Yi4NCg0KDQpKdWVyZ2VuDQo=
--------------qc1mysV7e0pTh740olARuGJa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------qc1mysV7e0pTh740olARuGJa--

--------------yMmA46rM5fOCVXy6dq1hREsv--

--------------A0DlLc8TqXrk8i0VLuch07h4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlnSTwFAwAAAAAACgkQsN6d1ii/Ey9N
1AgAnrRcwgQrvWr2yn21BhZe+XA+55AJR+ANVCiK0ixnREg01Vc1VLblNpM1MsqSLH1iHIBVp+XJ
twVRoLKrd8qSsjnNfnxLlK85YtTrBRrysbzjAQNYAlnazfAUFVvzcHjOzYHiAkgJQDCMZsyyydSD
Kp/uGLaS8cz5ZW4dlR0Yt2Cz0PLvi5gVD6jjuh7MFZRHnkoC8C6qg69BLx4kJNWwVk06AZXxa3Lv
LDFY4U27ODc/xekNF+y9DBigdhJwvdEIpfiGLpJZeeNuRhQsJ4SLEthMqgMB4vOEqgXOoCn3arTw
2u1yM7qo8zURj8w2QAIrbH6KHWdgvv7V18Itv9KoJA==
=EI1V
-----END PGP SIGNATURE-----

--------------A0DlLc8TqXrk8i0VLuch07h4--

