Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B8A5BA31
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907343.1314592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1truOo-0007da-Kf; Tue, 11 Mar 2025 07:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907343.1314592; Tue, 11 Mar 2025 07:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1truOo-0007bt-Gf; Tue, 11 Mar 2025 07:51:38 +0000
Received: by outflank-mailman (input) for mailman id 907343;
 Tue, 11 Mar 2025 07:51:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6th=V6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1truOm-0007bL-SF
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:51:36 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7704229-fe4d-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 08:51:34 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so3651768a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 00:51:34 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c768f213sm7793531a12.74.2025.03.11.00.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:51:33 -0700 (PDT)
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
X-Inumbo-ID: a7704229-fe4d-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741679494; x=1742284294; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N0lbnrwbaL2E4Nl9iI1tNjTceRSSPe5Wn2+dDlaStaU=;
        b=RNdRFYyuLuFXKgTbsE76LhHIfgdaJ9SRES5n0146BF81bc43R91oaxBkio1v/VHXU2
         SyWQC4sbAYdO8gZtW683+zCsPQQ96LKXWhviD2VdYrdSI6R6/rhr9eA6JfRo1hE+YcyP
         wihILjlbkqkW1WAI1txLiNcmTjRZg+NAxFUmzwg3/OmR+pICl5QORpEL3Bdhbryu+O9i
         46wAz7l1iq7W4vY4jtUD/v17pvdqiTfQNWdA6QT47S3C341EwtUtyYFJsafo3ewr1kzj
         tyKeY4o13ZHY+MHcE92Vwy0u7M+oMF5YcL55GPQCLWt75nVw5j9t4snwprboGGVuKXMv
         Xi5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741679494; x=1742284294;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0lbnrwbaL2E4Nl9iI1tNjTceRSSPe5Wn2+dDlaStaU=;
        b=nXyEo7o2EM+39h+xkUZSYbRkw2ZZ9NlVwa1ruk2HYSC07VKzEo0T1zTousLMnAipY1
         FOUgDIIlWGcq26wXWzYbkm/lbQsEre/T1vVgbZlvNr5CfKrPwQTjTf9paWK/VT6S6Xc7
         nXf4qQJonWAoWgolG32UEjWHFFZmbDA31nCNg0nu/O2i3odkbwT+dhAoWuiKyvTEioEl
         SM3uNmd9tq9nVkaGt6gouUdznfAwcR3fw1S9DpA/ljpc6bmcRTlO5SUENOtg47thiiev
         4e26qWkX7hlBhRA9F/KKiUi6HlJ2G19hjj/ihoxDEC5G3rlbjF+b7YnI1WnbOeJEsAg2
         zUNA==
X-Forwarded-Encrypted: i=1; AJvYcCWIXKg71wZD+Yn4VJLapvotyBceeNSPntPbpl7q4X+XIuoD22mBD91AJrHqN0LnJgxP/lBIJUgi0eE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUBoOnKMSDEWJ2bG8OxI0gLj2B7QxaZLBNpfkdh+sXAuH81iuG
	JioB2iPzPjQ0vBP/HbI4Bcxzqq9cy0boEmHf19RS0+J18Ir+6jDee7qorAlaAHOQVW7NrBy/F7V
	E
X-Gm-Gg: ASbGncuCRzLkwnJA5mN4Yil9JgijcIT/UPds74ggU+KSsJoYlddbi6lc10mWxbUjuY3
	mKjP3rDEZJrFzKgfxrh7VkAUqeTiVNqm1RtNl6vxNeqfZb6NM48TJpMwaqTS/sn2O3EKh2jUfin
	z3Op+z72BbudgKk+g86ThidqjQIgWejPeRmrToMTcD+avONXQylIIZgT03u9cUpA+LFDRYK622K
	3pMpUa5pkln9KlNMWucXuMQxRqn2wEDsMPbScqkje2AE4b1IVg6MDQu4z5wX2ZgakS5fdS7hK6F
	AlfbCwZ56vWcPJ3xNVXmf9bIuhlCeIR62HrD2Dfbr3ulRuiichjsuHm4Kyw3mkoTnziZJOPyXdS
	EHW+0fSGn27flhW4ceVSis0qnsN4LMilgKMYWyEK5/IyYD3xygImq1yCe3nr7V4i1ZW4=
X-Google-Smtp-Source: AGHT+IFuAwd3xL4lCWVUXOGrOwiEkO+wrx/es0/+ujl4oCMsGK8h2bqDfU9lzyDIvvQx0BP3bVCsAg==
X-Received: by 2002:a05:6402:2793:b0:5e7:73ad:60a2 with SMTP id 4fb4d7f45d1cf-5e773ad622fmr1985091a12.30.1741679494106;
        Tue, 11 Mar 2025 00:51:34 -0700 (PDT)
Message-ID: <b07d1169-eb57-425b-83ad-602bee778fdf@suse.com>
Date: Tue, 11 Mar 2025 08:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/23] tools/xenstored: Automatically set dom0_domid and
 priv_domid
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-12-jason.andryuk@amd.com>
 <5c0a1526-7faa-407a-b249-e80fb23c97b2@suse.com>
 <18198558-87dc-4901-8c26-e35871b88ad7@amd.com>
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
In-Reply-To: <18198558-87dc-4901-8c26-e35871b88ad7@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b3P5BN0leF50FuuBYfe09xH2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b3P5BN0leF50FuuBYfe09xH2
Content-Type: multipart/mixed; boundary="------------VswRv9aVuolJuE4z5fX5TBzA";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <b07d1169-eb57-425b-83ad-602bee778fdf@suse.com>
Subject: Re: [PATCH 11/23] tools/xenstored: Automatically set dom0_domid and
 priv_domid
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-12-jason.andryuk@amd.com>
 <5c0a1526-7faa-407a-b249-e80fb23c97b2@suse.com>
 <18198558-87dc-4901-8c26-e35871b88ad7@amd.com>
In-Reply-To: <18198558-87dc-4901-8c26-e35871b88ad7@amd.com>

--------------VswRv9aVuolJuE4z5fX5TBzA
Content-Type: multipart/mixed; boundary="------------zDFhn040QlO8mPIBHkeciIhU"

--------------zDFhn040QlO8mPIBHkeciIhU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDMuMjUgMTU6MzIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IA0KPiANCj4gT24g
MjAyNS0wMy0wOCAwMjowMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDA2LjAzLjI1
IDIzOjAzLCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4+IFdpdGggc3BsaXQgaGFyZHdhcmUg
YW5kIGNvbnRyb2wgZG9tYWlucywgZWFjaCBkb21haW4gc2hvdWxkIGJlDQo+Pj4gcHJpdmls
ZWdlZCB3aXRoIHJlc3BlY3QgdG8geGVuc3RvcmUuwqAgV2hlbiBhZGRpbmcgZG9tYWlucyB0
byB4ZW5zdG9yZSwNCj4+PiBsb29rIGF0IHRoZWlyIHByaXZpbGVnZSBhbmQgYWRkIHRoZW0g
dG8geGVuc3RvcmVkIGFzIGFwcHJvcHJpYXRlLg0KPj4+IGRvbTBfZG9taWQgaXMgdXNlZCBm
b3IgdGhlIGhhcmR3YXJlIGRvbWFpbiwgYW5kIHByaXZfZG9taWQgaXMgdXNlZCBmb3IgYQ0K
Pj4+IGNvbnRyb2wgZG9tYWluLg0KPj4+DQo+Pj4gT25seSBvbmUgb2YgZWFjaCBpcyBhbGxv
d2VkIGZvciBub3cuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxq
YXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gwqAgdG9vbHMveGVuc3RvcmVk
L2RvbWFpbi5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3Rv
cmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+Pj4gaW5kZXggNjRj
OGZkMGNjMy4uZjIzOTRjZDZlOSAxMDA2NDQNCj4+PiAtLS0gYS90b29scy94ZW5zdG9yZWQv
ZG9tYWluLmMNCj4+PiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+PiBAQCAt
Nzk1LDYgKzc5NSwyMCBAQCBzdGF0aWMgc3RydWN0IGRvbWFpbiANCj4+PiAqZmluZF9vcl9h
bGxvY19leGlzdGluZ19kb21haW4odW5zaWduZWQgaW50IGRvbWlkKQ0KPj4+IMKgwqDCoMKg
wqAgcmV0dXJuIGRvbWFpbjsNCj4+PiDCoCB9DQo+Pj4gK3N0YXRpYyB2b2lkIGRvbWFpbl9z
ZXRfcHJpdmlsZWdlZChzdHJ1Y3QgZG9tYWluICpkb21haW4pDQo+Pj4gK3sNCj4+PiArwqDC
oMKgIHhjX2RvbWFpbmluZm9fdCBkb21pbmZvOw0KPj4+ICsNCj4+PiArwqDCoMKgIGlmICgg
IWdldF9kb21haW5faW5mbyhkb21haW4tPmRvbWlkLCAmZG9taW5mbykgKQ0KPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm47DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKCBkb21pbmZvLmZs
YWdzICYgWEVOX0RPTUlORl9wcml2ICkNCj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpdl9kb21p
ZCA9IGRvbWFpbi0+ZG9taWQ7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKCBkb21pbmZvLmZs
YWdzICYgWEVOX0RPTUlORl9oYXJkd2FyZSApDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGRvbTBf
ZG9taWQgPSBkb21haW4tPmRvbWlkOw0KPj4+ICt9DQo+Pg0KPj4gUGxlYXNlIG5vIHVzZSBv
ZiBsaWJ4ZW5jdHJsLiBJIGhhdmUgd29ya2VkIGhhcmQgdG8gZWxpbWluYXRlIHRoZSB1c2Fn
ZQ0KPj4gaW4gb3JkZXIgdG8gZW5hYmxlIGEgeGVuc3RvcmUtc3R1YmRvbSBiZWluZyB1c2Vk
IGFjcm9zcyBYZW4gdmVyc2lvbnMNCj4+IChDIFhlbnN0b3JlIGlzIHJlbHlpbmcgb24gc3Rh
YmxlIGh5cGVyY2FsbHMgb25seSBub3cpLg0KPiANCj4gUmlnaHQuwqAgWWVzLCBuaWNlIHdv
cmsgb24gc3dpdGNoaW5nIHRvIHN0YWJsZSBoeXBlcmNhbGxzLg0KPiANCj4+IFlvdSBuZWVk
IHRvIGFkZCB0aGUgbmVlZGVkIGZsYWdzIHRvIHRoZSByYXRoZXIgbmV3IHN0YWJsZSBkb21j
dGwNCj4+IFhFTl9ET01DVExfZ2V0X2RvbWFpbl9zdGF0ZSBhbmQgdG8gbGlieGVubWFuYWdl
Lg0KPiANCj4gT2suDQo+IA0KPj4+ICsNCj4+PiDCoCBzdGF0aWMgaW50IG5ld19kb21haW4o
c3RydWN0IGRvbWFpbiAqZG9tYWluLCBpbnQgcG9ydCwgYm9vbCByZXN0b3JlKQ0KPj4+IMKg
IHsNCj4+PiDCoMKgwqDCoMKgIGludCByYzsNCj4+PiBAQCAtODMxLDYgKzg0NSw4IEBAIHN0
YXRpYyBpbnQgbmV3X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkb21haW4sIGludCBwb3J0LCAN
Cj4+PiBib29sIHJlc3RvcmUpDQo+Pj4gwqDCoMKgwqDCoCBkb21haW4tPmNvbm4tPmRvbWFp
biA9IGRvbWFpbjsNCj4+PiDCoMKgwqDCoMKgIGRvbWFpbi0+Y29ubi0+aWQgPSBkb21haW4t
PmRvbWlkOw0KPj4+ICvCoMKgwqAgZG9tYWluX3NldF9wcml2aWxlZ2VkKGRvbWFpbik7DQo+
Pg0KPj4gVGhlIG5hbWUgaW1wbGllcyB5b3UgYXJlIGNoYW5naW5nIHRoZSBkb21haW4gdG8g
YmUgcHJpdmlsZWdlZCwgYnV0IHRoaXMNCj4+IGlzIGRvbmUgY29uZGl0aW9uYWxseSBvbmx5
Lg0KPj4NCj4+IE1heWJlIG5hbWUgdGhlIGZ1bmN0aW9uIGRvbWFpbl9hcHBseV9wcml2aWxl
Z2VzKCk/DQo+IA0KPiBJJ20gdGhpbmtpbmcgZG9tYWluX2FwcGx5X2NhcGFiaWxpdGllcygp
IHNpbmNlIHRoZXkgYXJlIGJlaW5nIHJlZmVycmVkIHRvIGFzIA0KPiBjYXBhYmlsaXRpZXMu
DQo+IA0KPiBCdXQgSSdsbCBoYXZlIHRvIHJldmlzaXQgdGhpcy7CoCBUbyBtYWtlIHhlbnN0
b3JlZCAianVzdCB3b3JrIiB3aGVuIGRvbWlkICE9IDAsIA0KPiBpdCBzaG91bGQgYXV0by1k
ZXRlY3QgaXRzIGRvbWFpbiBpZCwgYW5kIHRoYXQgaGFzIHRvIGJlIGRvbmUgZWFybGllciB0
aGFuIHRoaXMuDQoNCkkgdGhpbmsgd2l0aCB0aGUgMyByZW1haW5pbmcgcGF0Y2hlcyBvZiBt
eSBzZXJpZXMgWzFdIHRoaXMgc2hvdWxkIGJlIGhhbmRsZWQNCmFscmVhZHkuDQoNClsxXTog
aHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDIv
bXNnMDAxMjAuaHRtbA0KICAgICAgaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMjUtMDIvbXNnMDAxMjEuaHRtbA0KICAgICAgaHR0cHM6Ly9saXN0
cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDIvbXNnMDAxMjIuaHRt
bA0KDQoNCkp1ZXJnZW4NCg==
--------------zDFhn040QlO8mPIBHkeciIhU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zDFhn040QlO8mPIBHkeciIhU--

--------------VswRv9aVuolJuE4z5fX5TBzA--

--------------b3P5BN0leF50FuuBYfe09xH2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfP64UFAwAAAAAACgkQsN6d1ii/Ey98
gQf9E04RU3iIAnqvefokLFl4rW0z3yJTYltp/dL5U1tHz6M8vTAi7v215uhNywesrDJa14joz3SG
09rUYugYvLYOYMX6844oDIseiCdwbutWVwvKtmvN+NCzljdnQcsE1tc80cnMr4n+5wFptUIqZzZ+
ZbS4Jr3jwft2H9lc0bJJaFTEJXk3NTf2xRX+dnh+kkQBNTxUsXhKpYXFt4jfrPrmwkDa6ll2nrEL
48uMmjvtbpXkyXRz0BDr5lNFosZ6EaMn/EQg6hGsqgimK9zYfYJMe5amtJA4Qh+1zu/PPaxl8uIS
ERtB2K8yGDEAsEYsA+6zDdqToKeFKjdxPMav7uGfLA==
=Iajk
-----END PGP SIGNATURE-----

--------------b3P5BN0leF50FuuBYfe09xH2--

