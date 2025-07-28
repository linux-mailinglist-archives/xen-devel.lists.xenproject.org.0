Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4283DB13C1B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061566.1427171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOJx-0004Kn-Qp; Mon, 28 Jul 2025 13:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061566.1427171; Mon, 28 Jul 2025 13:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOJx-0004JF-OC; Mon, 28 Jul 2025 13:55:17 +0000
Received: by outflank-mailman (input) for mailman id 1061566;
 Mon, 28 Jul 2025 13:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERLN=2J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ugOJw-0004J6-Co
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:55:16 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d050254-6bba-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 15:55:15 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6150be62be4so3001558a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:55:15 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a62ab9sm429652466b.86.2025.07.28.06.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:55:14 -0700 (PDT)
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
X-Inumbo-ID: 7d050254-6bba-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753710915; x=1754315715; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bwOQZ538lIxNo1Kph2+nVhgsNC6xdXufdvReRbHEo8E=;
        b=Uh7rhYJZjIVUpt/fROzCq+Xjwu7DyiBuLU6a0XsAxOBNAg32ddyYbX5EoQrVrQHDBg
         0Wa0LMOhy3IMmhICDHADx33ZkI1Cevc8zcUskRexqUQqLuRyrn4iYr9/NKBE+PCRDk19
         ZEJeIRr6cSAI8vfZrNQGQJ6AF6xtKcTXwFVuUp/H/m2W1bYIRLPEscWumMdCRA/thTv/
         PUIktkkF+p70Faw9nL/vYPg/s2XPezkedH23CTalFWrECJ27JtDF1a5XEbyory51zupc
         5hHkldHySeuufKgYiIUSu5n0Ef8aTwPQ536Kub42SaR7II3ho90w2CnlmZQ+A9bS5DgH
         /qVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710915; x=1754315715;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bwOQZ538lIxNo1Kph2+nVhgsNC6xdXufdvReRbHEo8E=;
        b=OvwxcYkh0Kva9dnRiwrlOHQc8A9La/HPTNi+SDCoCrDnjQbSxTn7j+qz4tdfTPmDqa
         PxDO9HzlnUulPd67jxdiZ0VFMQnLATwGr3C994MH2TPVL1Bh/w9RRksHKJu2baHvGjYs
         s9n9jSrToSxt40JGBSlKp/mS//HulCWpTT0bcfsTF86G5qd0PawGVxbNnfbXZuvcUgkA
         o9ILP0uDUgrog6c5Mo5WJ5zZxVa64japJlveiXhTIVitAJRPpoP4DHaoG1QA7DpXy8GN
         kwwDe9yga6YZNBDlCCcUC75OaMpVw8GkC0qw1wZCu+l4L9BcYhaqQ294XGokerLSSVSX
         S1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWExjRWeONgDRNThYhYyseJ8H2hoFLnd4AaMfQ3fsT0qWEpVhkbGnzIf85hkHa6V2epcm8qT2wFxBg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIM+bRVoLvJQ2jhY2CSXA0se4A0mclfZ4eTQefB2jkS/eIMvdY
	pP3cVCixPTIWhb2d6+YNACNLkWWXYpBP7ZOK2ZYFXj/BVlZAro4VW9eao/htziRbwpU=
X-Gm-Gg: ASbGncuZujIuiArAo6YLNuiQFOhNYrhf/aTSjOxKcR+2VWfxtEEp7cYmLuU710kEhER
	aC6SPLCnKV86a69OwiVoQE38y3cYlOOX7w5dY8tXUneVxEbAi+ZVPLnnpzN0nV1Jjf46xlxfnK9
	7+kenpAg3knp2T/m4PfDiuHmiLLJBEd1k7CelhaRKzgVe8yh+v7T67rtsmDhuK2iK0zq50pZKlv
	fsHDlbDAwx0WCLjS86wifrAsrHYX2W2Y3ye9YwBZBHKgtHuhkms0OiyMn6mpfXEHCHlUvqS444L
	0qcIU0UGpjChjB5v4o57lzkV3yb7DlBog2sXjd2VzT7z5+uGhB0vKIVKGUy8CuXUwXP0gF8Zfq2
	9AUlKFOsRPFkV1v/FkhX2k9jNytKOWFjnpvXag+rszgSRL5gX0oxSLHLmXWFJawPj+cacZ58MAY
	svec+ylq0QTIA0JAPtlUtjitpUwO0gAkBSW81Q3hohlg==
X-Google-Smtp-Source: AGHT+IFryDrAZi9bpf7H5w3l+aymIWvrvi1s9MJr0DYFVEDhLvEjParIz/+ydcA+jEWk0YX8XnfKlQ==
X-Received: by 2002:a17:907:7295:b0:ae3:502f:cdea with SMTP id a640c23a62f3a-af619c0ca43mr1007982066b.60.1753710914681;
        Mon, 28 Jul 2025 06:55:14 -0700 (PDT)
Message-ID: <97ef444c-11fb-427c-9292-c1547ea375bf@suse.com>
Date: Mon, 28 Jul 2025 15:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] tools/xenstored: Use priv_domid for manual nodes
 and permission
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-9-jason.andryuk@amd.com>
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
In-Reply-To: <20250725235858.666813-9-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RFOHVrNuNhDj2llf83O3alZf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RFOHVrNuNhDj2llf83O3alZf
Content-Type: multipart/mixed; boundary="------------SpLmd9p1suk7PjYWCmBr7CB0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <97ef444c-11fb-427c-9292-c1547ea375bf@suse.com>
Subject: Re: [PATCH v5 08/11] tools/xenstored: Use priv_domid for manual nodes
 and permission
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-9-jason.andryuk@amd.com>
In-Reply-To: <20250725235858.666813-9-jason.andryuk@amd.com>

--------------SpLmd9p1suk7PjYWCmBr7CB0
Content-Type: multipart/mixed; boundary="------------Dt03EkMQ0hvPP0wMI4YiA7l8"

--------------Dt03EkMQ0hvPP0wMI4YiA7l8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjUgMDE6NTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFVzdWFsbHksIHBy
aXZfZG9taWQgPT0gZG9tMF9kb21pZCA9PSAwLCBhbmQgdGhhdCBpcyB3aGF0IGlzIGV4cGVj
dGVkLg0KPiBJZiB3ZSByZW5hbWUgcy9kb20wX2RvbWlkL3N0b3JlX2RvbWlkLywgaXQgc2Vl
bXMgbW9yZSBsaWtlbHkgd2Ugd2FudCB0bw0KPiBhY3R1YWxseSBoYXZlIHRoZSBwcml2X2Rv
bWlkIGFzIHRoZSBvd25lci4NCj4gDQo+IFRoYXQgbGVhZHMgdG8gZm9sbG93IG9uIGNoYW5n
ZXMgdG8gZW5zdXJlIHRoYXQgdGhlIHByaXZfZG9taWQgaXMgY3JlYXRlZA0KPiBmaXJzdC4N
Cj4gDQo+IElmIHByaXZfZG9taWQgaXMgdW5zZXQsIHNldCB0byBkb20wX2RvbWlkIHRvIGhh
dmUgYSBmdW5jdGlvbmFsDQo+IHhlbnN0b3JlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEph
c29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCj4gLS0tDQo+IEhlbGQgb2Zm
IFItYiBKdWVyZ2VuIGJlY2F1c2Ugb2YgcHJpdl9kb21pZCBzZXR0aW5nDQo+IA0KPiB2NToN
Cj4gQWRkIHVuc2V0IHByaXZfZG9taWQgc2V0dGluZw0KPiBBZGRpdGlvbmFsIGNoYW5nZSBm
b3IgY29udGludWUgY2hlY2sgaW5zaWRlIHRoZSBsb29wDQo+IC0tLQ0KPiAgIHRvb2xzL3hl
bnN0b3JlZC9jb3JlLmMgICB8ICA0ICsrLS0NCj4gICB0b29scy94ZW5zdG9yZWQvZG9tYWlu
LmMgfCAxNiArKysrKysrKy0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy94
ZW5zdG9yZWQvY29yZS5jIGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPiBpbmRleCBkYmYz
NTQ4YThlLi4wOTg5NThmNjExIDEwMDY0NA0KPiAtLS0gYS90b29scy94ZW5zdG9yZWQvY29y
ZS5jDQo+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4gQEAgLTIyNjYsNyArMjI2
Niw3IEBAIHN0cnVjdCBjb25uZWN0aW9uICpnZXRfY29ubmVjdGlvbl9ieV9pZCh1bnNpZ25l
ZCBpbnQgY29ubl9pZCkNCj4gICBzdGF0aWMgdm9pZCBtYW51YWxfbm9kZShjb25zdCBjaGFy
ICpuYW1lLCBjb25zdCBjaGFyICpjaGlsZCkNCj4gICB7DQo+ICAgCXN0cnVjdCBub2RlICpu
b2RlOw0KPiAtCXN0cnVjdCB4c19wZXJtaXNzaW9ucyBwZXJtcyA9IHsgLmlkID0gZG9tMF9k
b21pZCwNCj4gKwlzdHJ1Y3QgeHNfcGVybWlzc2lvbnMgcGVybXMgPSB7IC5pZCA9IHByaXZf
ZG9taWQsDQo+ICAgCQkJCQkucGVybXMgPSBYU19QRVJNX05PTkUgfTsNCj4gICANCj4gICAJ
bm9kZSA9IHRhbGxvY196ZXJvKE5VTEwsIHN0cnVjdCBub2RlKTsNCj4gQEAgLTIzMTcsNyAr
MjMxNyw3IEBAIHZvaWQgc2V0dXBfc3RydWN0dXJlKGJvb2wgbGl2ZV91cGRhdGUpDQo+ICAg
CQltYW51YWxfbm9kZSgiL3Rvb2wveGVuc3RvcmVkIiwgTlVMTCk7DQo+ICAgCQltYW51YWxf
bm9kZSgiQHJlbGVhc2VEb21haW4iLCBOVUxMKTsNCj4gICAJCW1hbnVhbF9ub2RlKCJAaW50
cm9kdWNlRG9tYWluIiwgTlVMTCk7DQo+IC0JCWRvbWFpbl9uYmVudHJ5X2ZpeChkb20wX2Rv
bWlkLCA1LCB0cnVlKTsNCj4gKwkJZG9tYWluX25iZW50cnlfZml4KHByaXZfZG9taWQsIDUs
IHRydWUpOw0KPiAgIAl9DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVu
c3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+IGluZGV4IDVl
NTNmZTg3MzYuLjk0Y2JlODFjYTUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9k
b21haW4uYw0KPiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4gQEAgLTEwMTQs
NyArMTAxNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZG9tYWluICppbnRyb2R1Y2VfZG9tYWluKGNv
bnN0IHZvaWQgKmN0eCwNCj4gICAJc3RydWN0IGRvbWFpbiAqZG9tYWluOw0KPiAgIAlpbnQg
cmM7DQo+ICAgCXN0cnVjdCB4ZW5zdG9yZV9kb21haW5faW50ZXJmYWNlICppbnRlcmZhY2U7
DQo+IC0JYm9vbCBpc19tYXN0ZXJfZG9tYWluID0gKGRvbWlkID09IHhlbmJ1c19tYXN0ZXJf
ZG9taWQoKSk7DQo+ICsJYm9vbCBpc19wcml2X2RvbWFpbiA9IChkb21pZCA9PSBwcml2X2Rv
bWlkKTsNCj4gICANCj4gICAJZG9tYWluID0gZmluZF9vcl9hbGxvY19kb21haW4oY3R4LCBk
b21pZCk7DQo+ICAgCWlmICghZG9tYWluKQ0KPiBAQCAtMTAzNywxMyArMTAzNywxMyBAQCBz
dGF0aWMgc3RydWN0IGRvbWFpbiAqaW50cm9kdWNlX2RvbWFpbihjb25zdCB2b2lkICpjdHgs
DQo+ICAgCQl9DQo+ICAgCQlkb21haW4tPmludGVyZmFjZSA9IGludGVyZmFjZTsNCj4gICAN
Cj4gLQkJaWYgKGlzX21hc3Rlcl9kb21haW4pDQo+ICsJCWlmIChpc19wcml2X2RvbWFpbikN
Cj4gICAJCQlzZXR1cF9zdHJ1Y3R1cmUocmVzdG9yZSk7DQo+ICAgDQo+ICAgCQkvKiBOb3cg
ZG9tYWluIGJlbG9uZ3MgdG8gaXRzIGNvbm5lY3Rpb24uICovDQo+ICAgCQl0YWxsb2Nfc3Rl
YWwoZG9tYWluLT5jb25uLCBkb21haW4pOw0KPiAgIA0KPiAtCQlpZiAoIWlzX21hc3Rlcl9k
b21haW4gJiYgIXJlc3RvcmUpDQo+ICsJCWlmICghaXNfcHJpdl9kb21haW4gJiYgIXJlc3Rv
cmUpDQo+ICAgCQkJZmlyZV9zcGVjaWFsX3dhdGNoZXMoIkBpbnRyb2R1Y2VEb21haW4iKTsN
Cj4gICAJfSBlbHNlIHsNCj4gICAJCS8qIFVzZSBYU19JTlRST0RVQ0UgZm9yIHJlY3JlYXRp
bmcgdGhlIHhlbmJ1cyBldmVudC1jaGFubmVsLiAqLw0KPiBAQCAtMTMxMSwyMiArMTMxMSwy
MiBAQCB2b2lkIGluaXRfZG9tYWlucyh2b2lkKQ0KPiAgIAkJfQ0KPiAgIAl9DQo+ICAgDQo+
IC0JaWYgKGRvbTBfZG9taWQgPT0gRE9NSURfSU5WQUxJRCkNCj4gLQkJZG9tMF9kb21pZCA9
IHByaXZfZG9taWQ7DQo+ICsJaWYgKHByaXZfZG9taWQgPT0gRE9NSURfSU5WQUxJRCkNCj4g
KwkJcHJpdl9kb21pZCA9IGRvbTBfZG9taWQ7DQo+ICAgDQo+IC0JaWYgKGRvbTBfZG9taWQg
PT0gRE9NSURfSU5WQUxJRCkNCj4gKwlpZiAocHJpdl9kb21pZCA9PSBET01JRF9JTlZBTElE
KQ0KPiAgIAkJYmFyZigiQ291bGQgbm90IGRldGVybWluZSB4ZW5zdG9yZSBkb21pZFxuIik7
DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIExvY2FsIGRvbWlkIG11c3QgYmUgZmlyc3QgdG8g
c2V0dXAgc3RydWN0dXJlcyBmb3IgZmlyaW5nIHRoZSBzcGVjaWFsDQoNCk9oLCBqdXN0IHNh
dyBpdCBub3c6DQoNCnMvTG9jYWwvUHJpdmlsZWdlZC8NCg0KV2l0aCB0aGF0IE15IFItYjog
c3RhbmRzLg0KDQoNCkp1ZXJnZW4NCg==
--------------Dt03EkMQ0hvPP0wMI4YiA7l8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Dt03EkMQ0hvPP0wMI4YiA7l8--

--------------SpLmd9p1suk7PjYWCmBr7CB0--

--------------RFOHVrNuNhDj2llf83O3alZf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiHgUIFAwAAAAAACgkQsN6d1ii/Ey85
5Af/X+xIvGe11PfZiejtCq/RxHT5iQEnyGPaev7anJOBi6ZA1HQin/g7WTCuRM8a/ac4kCzE+IEj
DqEtsSQ4BOY6DMsEP9Y2cQi590psc7kBOrJrQOnirgrBEPz+w8Dpe4o5WNcKCpNJWUdcXk99eJOy
vWdp95C6jVDiNUlPsuiwhsoXLnZK0ez4jMSyHlPvd6jZmfFKyc/Opk4zIApuiXy/WaUmcPJYTJH3
wG696X2EGCXYJI3WB6s300nWnPVletxrmtlnEuxuR2nsg5LIlAkmOD+KGd0fbEKogs6zzurLHgH6
DfTgdMemgQl34RfFQlafcd1QPOHS8fiHI6gQY23LcQ==
=trw/
-----END PGP SIGNATURE-----

--------------RFOHVrNuNhDj2llf83O3alZf--

