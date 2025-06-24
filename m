Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C566AAE6A19
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 17:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023827.1399901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5E2-00073L-9v; Tue, 24 Jun 2025 15:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023827.1399901; Tue, 24 Jun 2025 15:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU5E2-00071G-75; Tue, 24 Jun 2025 15:06:18 +0000
Received: by outflank-mailman (input) for mailman id 1023827;
 Tue, 24 Jun 2025 15:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uU5E0-00070u-Ge
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 15:06:16 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5bc10c3-510c-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 17:06:14 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6099d89a19cso11437181a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 08:06:14 -0700 (PDT)
Received: from ?IPV6:2003:e5:8746:1a00:ff67:e633:2aa8:93ba?
 (p200300e587461a00ff67e6332aa893ba.dip0.t-ipconnect.de.
 [2003:e5:8746:1a00:ff67:e633:2aa8:93ba])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054082d25sm878697066b.88.2025.06.24.08.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 08:06:13 -0700 (PDT)
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
X-Inumbo-ID: c5bc10c3-510c-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750777574; x=1751382374; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OaEKKSglKBjpw0HRltdpBtSbGccxJxjiBgHBw7o2xk4=;
        b=bFTJii4kvfeJH+c5D2VI84O2rRjBnqOiTt3qHEXDBeOsFupZQp4HsMuVeBhPaER7zw
         vm/aoVcfDwa6ya3NlJ5j/4igITyUTo4Ad62uvpII6t8VBsiSPKSm7vwiVAwpxTqBJvzy
         Vme3YlhPWk4NAQ5Xky51LASW/6/YEozQVBxxFtACtz6Sc8jWLwBGdIhVYpgHKiemE8Wt
         wsc6VSiDtc1Lxh/IRU1C0mp8Q7WgK3V9r9GoLFqRoalwPRSxl+eBBybCsbFiInh3bwIX
         8CGfdF2TQZQOMgxdUxcyTSkd0DPIqMUTUe4h04fRQmG4qsijhFcgMmaYhpWD7msut6sH
         FmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750777574; x=1751382374;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaEKKSglKBjpw0HRltdpBtSbGccxJxjiBgHBw7o2xk4=;
        b=BcoXVy4A/dfxb2PFWiZVJFRQeTUIq6tk39g1rlrBTFN7eA3W2LPwGuvQtjHzT0DfmM
         rd+17V1EEmU/HEQaSXD7Yb00O94/Uw4Fu6k+vLjSibaWRls6v2AapRw+3ucPmr6Clmoh
         IGaqa1Ht5/Vq1g5pGMQ3/KdTNPwCbVkI3TF1dAS+vVYXnzlFze07pfyFUM7rQLhaeaLY
         OWW8OMZoK7HQZRc7ezTVLpwWQ9nW7WTKNHH8ykNh7JGHkIhrImQMy/jUgjPYrWXzWrwp
         T1lN44UCJmQadp9L27n/nSiHPmbX3GPgtGA4jW+aH0Uc1JE9JvzU13X9Eu4a7vPGX6LD
         CGxg==
X-Forwarded-Encrypted: i=1; AJvYcCWRYYEnw9VIt5XTCaO5E68pKFnIC1V53AvUXQa4aeFENwbhZ6P4dFtrN32XapAXa2bgxcTr2Pel4uk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3ag1V6OUTzyEYEyojCSq1KsACtAovsQDECXmknvCMxS2QPKDl
	SwqcWx3ikWnZx3A3FxxuUeEYUDqFWeSHq4yiM9ObOcgIIjl6qr9fTpSUzRB3x/USBr3zn8uNsoN
	QTwWC188=
X-Gm-Gg: ASbGnctVom+hAXPUaoBwTW8ErkXpJKGe662hGBWzu16MEiu/RSC7W2z/Xfo3fyyoKWf
	xmL2heNCEK8k8zIByFs7orCNJXrdUdfYIfANq15BJskMVeglC++abG5G9UOfx73dgNiMfHUYDkg
	LJKtsFIz7dePx4QFTOH/fWywwN+RXpYivowW0IEflZwj2r7xkQIwMsYDWh3QR4al+zv2+CYQUtA
	3xYSf7pQaunuMy8P36aOyyPSlKPWE3AwUy6K3ONxMQuayvBwMCTzowJrnACBF9p7+bblUD3qQz7
	BRXskMvndeys9nIJkVZeRIoljW4n5efsm1ddypIJ9Ss72FIJ4cV7eX1lcy2P/37P2InorQCoP9Y
	9ANsj7PzseXmODOvBQMFZ/Zyfw0ldeKosdHckMLo+HpO83YceZT0QgLTUG/i5FkNRb6SCrUz1Gr
	+t3dt6Sd5F4fM=
X-Google-Smtp-Source: AGHT+IEhq1M/S93Bf1xBQzA/yzeUHuH1yQCmEpvTjgxrdgTfMJndkUwnQfvG+pdpuptB2w0fhKYW4A==
X-Received: by 2002:a17:907:3d46:b0:ae0:a912:f366 with SMTP id a640c23a62f3a-ae0a912f9e1mr386456766b.54.1750777573722;
        Tue, 24 Jun 2025 08:06:13 -0700 (PDT)
Message-ID: <aad590a6-fd57-4c8b-bc64-93b7f12a9352@suse.com>
Date: Tue, 24 Jun 2025 17:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xenstore - Suggestion of batching watch events
To: Andriy Sultanov <sultanovandriy@gmail.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 ngoc-tu.dinh@vates.tech, Christian Lindig <christian.lindig@citrix.com>
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
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
In-Reply-To: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0MSUCUuua06DpeRxob0dVkRw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0MSUCUuua06DpeRxob0dVkRw
Content-Type: multipart/mixed; boundary="------------YY1xq8VnnRAZbUFKO0SIusx3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andriy Sultanov <sultanovandriy@gmail.com>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 ngoc-tu.dinh@vates.tech, Christian Lindig <christian.lindig@citrix.com>
Message-ID: <aad590a6-fd57-4c8b-bc64-93b7f12a9352@suse.com>
Subject: Re: xenstore - Suggestion of batching watch events
References: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>
In-Reply-To: <47b7f870-e1d9-44c9-b8ea-5b9028843963@gmail.com>

--------------YY1xq8VnnRAZbUFKO0SIusx3
Content-Type: multipart/mixed; boundary="------------B00gjkcfWdiPAdwplBp70dXC"

--------------B00gjkcfWdiPAdwplBp70dXC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjUgMTY6NTEsIEFuZHJpeSBTdWx0YW5vdiB3cm90ZToNCj4gQ3VycmVudGx5
LCBhcyBmYXIgYXMgSSBhbSBhd2FyZSwgdGhlIGFiaWxpdHkgb2YgeGVuc3RvcmUgY2xpZW50
cyB0byBwcm9wZXJseQ0KPiBoYW5kbGUgYW5kIGRldGVjdCBiYXRjaCB1cGRhdGVzIGlzIHNv
bWV3aGF0IGxhY2tpbmcuIFRyYW5zYWN0aW9ucyBhcmUgbm90DQo+IGRpcmVjdGx5IHZpc2li
bGUgdG8gdGhlIGNsaWVudHMgd2F0Y2hpbmcgYSBwYXJ0aWN1bGFyIGRpcmVjdG9yeSAtIHRo
ZXkgd2lsbA0KPiByZWNlaXZlIGEgbG90IG9mIGluZGl2aWR1YWwgd2F0Y2hfZXZlbnQncyBv
bmNlIHRoZSB0cmFuc2FjdGlvbiBpcyBjb21taXR0ZWQsDQo+IHdpdGhvdXQgYW55IGluZGlj
YXRpb24gd2hlbiBzdWNoIHVwZGF0ZXMgYXJlIGdvaW5nIHRvIGVuZC4NCj4gDQo+IENsaWVu
dHMgc3VjaCBhcyB4ZW5vcHNkIGZyb20gdGhlIHhhcGkgdG9vbHN0YWNrIGFyZSByZWxpYW50
IG9uIHhlbnN0b3JlIHRvDQo+IHRyYWNrIHRoZWlyIG1hbmFnZWQgZG9tYWlucywgYW5kIGEg
Zmxvb2Qgb2YgaW5kaXZpZHVhbCB1cGRhdGVzIG1vc3Qgb2Z0ZW4NCj4gcmVzdWx0cyBpbiBh
IGZsb29kIG9mIGV2ZW50cyByYWlzZWQgZnJvbSB4ZW5vcHNkIHRvIHhhcGkgKFRoZXJlIGFy
ZQ0KPiBjb25zb2xpZGF0aW9uIG1lY2hhbmlzbXMgaW1wbGVtZW50ZWQgdGhlcmUsIHdpdGgg
dXBkYXRlcyBnZXR0aW5nIG1lcmdlZA0KPiB0b2dldGhlciwgYnV0IGlmIHhhcGkgcGlja3Mg
dXAgdXBkYXRlIGV2ZW50cyBmcm9tIHRoZSBxdWV1ZSBxdWlja2x5IGVub3VnaCwgaXQNCj4g
d2lsbCBvbmx5IGdldCBtb3JlIHVwZGF0ZSBldmVudHMgbGF0ZXIpDQo+IA0KPiBUaGUgbmVl
ZCBmb3IgYmF0Y2hpbmcgaXMgZmFpcmx5IGV2aWRlbnQgZnJvbSB0aGUgZmFjdCB0aGF0IFhl
blNlcnZlcidzIFdpbmRvd3MNCj4gUFYgZHJpdmVycywgZm9yIGV4YW1wbGUsIGFkb3B0ZWQg
YW4gYWQtaG9jICJiYXRjaCIgb3B0aW1pemF0aW9uIChub3QgZG9jdW1lbnRlZA0KPiBhbnl3
aGVyZSwgb2YgY291cnNlKSwgd2hlcmUgc29tZSBzZXF1ZW5jZSBvZiB3cml0ZXMgaXMgZm9s
bG93ZWQgYnkgYSB3cml0ZSBvZg0KPiB0aGUgdmFsdWUgIjEiIHRvICJkYXRhL3VwZGF0ZWQi
LiBUaGlzIHVzZWQgdG8gYmUgaG9ub3VyZWQgYnkgeGFwaSwgd2hpY2ggd291bGQNCj4gbm90
IGNvbnNpZGVyIHRoZSBndWVzdCBhZ2VudCB1cGRhdGUgZG9uZSB1bnRpbCBpdCByZWNlaXZl
ZCBub3RpY2Ugb2Ygc3VjaCBhDQo+ICJiYXRjaCBlbmRlZCIgdXBkYXRlLCBidXQgaXQgY2F1
c2VkIHhhcGkgdG8gbWlzcyB1cGRhdGVzIHRoYXQgd2VyZSBub3QgZm9sbG93ZWQNCj4gYnkg
c3VjaCBhIHdyaXRlLCBzbyB4YXBpIG5vdyBpZ25vcmVzIHRoaXMgYWQtaG9jIGJhdGNoaW5n
LiBPbmUgY291bGQgaW1hZ2luZQ0KPiBtYW55IHdvcmthcm91bmRzIGhlcmUgKGZvciBleGFt
cGxlLCBzb21lIHNvcnQgb2YgYSBtZWNoYW5pc20gd2hlcmUgeGVub3BzZA0KPiBzdGFsbHMg
YW4gdXBkYXRlIGZvciBhIHNlY29uZCB0byBzZWUgaWYgYW55IG1vcmUgcmVsYXRlZCB1cGRh
dGVzIHNob3cgdXAgYW5kDQo+IG9ubHkgdGhlbiBub3RpZmllcyB4YXBpIG9mIGl0LCB3aXRo
IG9idmlvdXMgdHJhZGUtb2ZmcyksIGJ1dCBJTU8gaXQgY291bGQgYmUNCj4gd29ydGggY29u
c2lkZXJpbmcgbWFraW5nIHRoaXMgZWFzaWVyIG9uIHRoZSB4ZW5zdG9yZSBzaWRlIGZvciBk
aWZmZXJlbnQNCj4gdXNlLWNhc2VzLg0KPiANCj4gU3VnZ2VzdGlvbjoNCj4gV0FUQ0hfRVZF
TlQncyByZXFfaWQgYW5kIHR4X2lkIGFyZSBjdXJyZW50bHkgMC4gQ291bGQgaXQgYmUgcG9z
c2libGUsIGZvcg0KPiBleGFtcGxlLCB0byBtb2RpZnkgdGhpcyBzdWNoIHRoYXQgd2F0Y2gg
ZXZlbnRzIGNvbWluZyBhcyBhIHJlc3VsdCBvZiBhDQo+IHRyYW5zYWN0aW9uIGNvbW1pdCAo
YSAiYmF0Y2giKSBoYXZlIHR4X2lkIG9mIHRoZSBjb3JyZXNwb25kaW5nIHRyYW5zYWN0aW9u
DQo+IGFuZCByZXFfaWQgb2YsIHNheSwgMiBpZiBpdCdzIHRoZSBsYXN0IHN1Y2ggd2F0Y2gg
ZXZlbnQgb2YgYSBiYXRjaCBhbmQgMQ0KPiBvdGhlcndpc2U/IE9sZCBjbGllbnRzIHdvdWxk
IHN0aWxsIGlnbm9yZSB0aGVzZSB2YWx1ZXMsIGJ1dCBpdCB3b3VsZCBhbGxvdw0KPiBzb21l
IG90aGVycyB0byBkZXRlY3QgaWYgYW4gdXBkYXRlIGlzIHBhcnQgb2YgYSBsb2dpY2FsIGJh
dGNoIHRoYXQgZG9lc24ndCBlbmQNCj4gdW50aWwgaXRzIGxhc3QgZXZlbnQuDQo+IA0KPiBJ
cyB0aGlzIGJleW9uZCB0aGUgc2NvcGUgb2Ygd2hhdCB4ZW5zdG9yZWQgd2FudHMgdG8gZG8/
IEZyb20gYSBmaXJzdCBnbGFuY2UsDQo+IHRoaXMgZG9lcyBub3Qgc2VlbSB0byBpbnRyb2R1
Y2Ugb2J2aW91cyB1bndhbnRlZCBpbmZvcm1hdGlvbiBsZWFrcyBlaXRoZXIsIGJ1dA0KPiBJ
IGNvdWxkIGJlIHdyb25nLiBJIHdvdWxkIGxvdmUgdG8gaGVhciBpZiB0aGlzIGlzIHNvbWV0
aGluZyB0aGF0IGNvdWxkIGJlDQo+IGludGVyZXN0aW5nIHRvIG90aGVycyBhbmQgaWYgdGhp
cyBjb3VsZCBiZSBjb25zaWRlcmVkIGF0IGFsbC4NCg0KVGhlIG1haW4gcmVhc29uIGZvciB0
aGUgbGFyZ2UgbnVtYmVyIG9mIHdhdGNoIGV2ZW50cyBhZnRlciBhIHRyYW5zYWN0aW9uIGlz
DQp0aGUgZmFjdCB0aGF0IHRoZSB3YXRjaCBmb3IgZS5nLiBkZXRlY3RpbmcgdGhlIGFkZGl0
aW9uIG9mIGEgbmV3IGJsb2NrIGRldmljZQ0Kd2lsbCBiZSBzZXQgb24gYSBub2RlIGJlaW5n
IGNvbW1vbiBmb3IgYWxsIHBvdGVudGlhbCBibG9jayBkZXZpY2VzIGhhbmRsZWQNCmJ5IHRo
ZSB3YXRjaGVyLiBUaGlzIHJlc3VsdHMgaW4gYSB3YXRjaCBldmVudCBmb3IgZWFjaCBzaW5n
bGUgbm9kZSBtb2RpZmllZA0KYmVsb3cgdGhpcyBub2RlLCB3aGljaCBhcmUgdXN1YWxseSBx
dWl0ZSBhIGxvdCBldmVuIHdoZW4gb25seSBhZGRpbmcgYSBzaW5nbGUNCmRldmljZS4NCg0K
VGhlIHNvbHV0aW9uIGZvciB0aGlzIHByb2JsZW0gaXMgTk9UIHRvIGJhdGNoIGFsbCB0aGUg
ZXZlbnRzIGFuZCB0byBpZ25vcmUgdGhlDQptYWpvcml0eSBvZiB0aG9zZSBldmVudHMsIGJ1
dCB0byBhdm9pZCBjcmVhdGluZyBtb3N0IG9mIHRob3NlIGV2ZW50cy4NCg0KRm9yIHRoaXMg
cmVhc29uIHRoZSBYZW5zdG9yZSBwcm90b2NvbCBoYXMgYmVlbiBleHRlbmRlZCB0byBhbGxv
dyBmb3IgbGltaXRpbmcNCnRoZSBudW1iZXIgb2Ygbm9kZSBsZXZlbHMgYmVsb3cgYSB3YXRj
aGVkIG5vZGUgdG8gYmUgcmVsZXZhbnQgZm9yIGEgd2F0Y2ggdG8NCmZpcmUuDQoNCldoYXQg
aXMgbWlzc2luZyBzbyBmYXIgYXJlIFhlbnN0b3JlIGltcGxlbWVudGF0aW9ucyB0byBzdXBw
b3J0IHRoaXMgZmVhdHVyZSwNCmFuZCBYZW5zdG9yZSB1c2VycyB0byBtYWtlIHVzZSBvZiBp
dC4gSSdtIHdvcmtpbmcgb24gc3VwcG9ydGluZyB0aGlzIGluDQpDIHhlbnN0b3JlZCwgYnV0
IGR1ZSB0byBvdGhlciB1cmdlbnQgd29yayB0aGlzIHdpbGwgcHJvYmFibHkgbGFuZCB1cHN0
cmVhbSBvbmx5DQppbiB0aGUgWGVuIDQuMjIgdGltZSBmcmFtZSwgcHJvYmFibHkgdG9nZXRo
ZXIgd2l0aCBYZW4gdG9vbHMgKGxpYnhsKSBtYWtpbmcgdXNlDQpvZiB0aGlzIGZlYXR1cmUu
DQoNCg0KSnVlcmdlbg0K
--------------B00gjkcfWdiPAdwplBp70dXC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------B00gjkcfWdiPAdwplBp70dXC--

--------------YY1xq8VnnRAZbUFKO0SIusx3--

--------------0MSUCUuua06DpeRxob0dVkRw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhavuMFAwAAAAAACgkQsN6d1ii/Ey9c
fAf/Z+IunNpwjvetRvpu82528SqMfS7DgZM2TXD0CPaukXfve2PFtnXNoO+L7TIe/TjWEYKMpv19
LtpQKgZx9/dPKIoQN3/ggoXH1eyYoCcpspiDuo704/VrdxwOHd9BC9C6TFyyig7otKSwQoZJnnAr
8mo8u8U0yLp8lBHetkHBxdeXZ3VvqXpBY96eoHUd/Z97dk4V9pCMyTroeoIyTEBtP1uqc6LiKANO
FOa9t22cY0HVU+Y/6kC7L0IK7rnNyLye3MHRDyG/VDsGLgZoSP/UDTVfOkJdrZ7NKeutQAMaYhOH
BGUreLEq0UmgfiTbJZMzOq0SwTh5VCR6XCvZ8rqptg==
=AgpO
-----END PGP SIGNATURE-----

--------------0MSUCUuua06DpeRxob0dVkRw--

