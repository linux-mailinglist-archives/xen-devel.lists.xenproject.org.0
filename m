Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875CB11933
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 09:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057412.1425302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCt1-0007pD-5O; Fri, 25 Jul 2025 07:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057412.1425302; Fri, 25 Jul 2025 07:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufCt1-0007mH-1b; Fri, 25 Jul 2025 07:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1057412;
 Fri, 25 Jul 2025 07:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufCsz-0007mB-LO
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 07:30:33 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb9fe19-6929-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 09:30:31 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-607cc1a2bd8so2975977a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 00:30:31 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm1751557a12.22.2025.07.25.00.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 00:30:30 -0700 (PDT)
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
X-Inumbo-ID: 3eb9fe19-6929-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753428631; x=1754033431; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LDTSAhPR9Wz6HvbQ9O08C5j1xMnOXBcjODu1x+DZMDU=;
        b=QS+rZMbzlY9APBflYKZkhKKCy9co+glZ5F4c6R7H2bH/RehW6drJ2IU52qzf5RQDGk
         OWDEzNY2SAaCb9KRHLx9gdsUxciiZxiT49G7nhZz0chBSI1xc+7eV/s4GwqYwurqIW46
         //WEz2603hIrQ1I+N8mhr+MIJHtaf95eEgG4rsQrRFCZ35dJBJRYo0iYbUBUcK8lczp2
         xzQ/4wXB6Q37yr1CkxqZR7+rhXF0p3rxub1hPBOeL5bQZpcCOrZ/KL86hMiq4OVm5ghE
         U4zL7kFypruel7c87HJdHSBpshXhim1Fwb6TU27i43kAsqdBS0MrsF/9qBORLpK5P8oo
         TB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753428631; x=1754033431;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LDTSAhPR9Wz6HvbQ9O08C5j1xMnOXBcjODu1x+DZMDU=;
        b=Xw0FcGjwBsr7CHD5svfWfxSj5Z61qWV8yiQnbrCtJHzrZDJaiyppv3BhHw6n2eB7Px
         oobp/eAC5/NVq8Y9senWk2aOUdsHSA4fKdwh2O+f9WQuX2X9xv4XXy8JJBydeOE65Vqu
         WjdjpNje74VqDR+Adyh3UxZsb2evDIUI6c+Sap1QrNLs6w1sd8SFeLYtLFzmrLSRFs2J
         k/XlKbMgiFRBMlFcR9lBRmgESdfaYCk0XNiTr5rxZtEXBr8pmBPVd8EkZIbGdjJbu9Vy
         QBp3EhoqkfE/6Ei6Jhmg7eqrUDoFg7S8Bw8E61cVfIRbcFgsZoz83wWlQnVbhVRKKn1A
         8SKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnH7c/WBhk9V99IdvwJLzW3yuqMZuv9armWWJr3tIzPwLKPBS8GGwqbMoHmoGDgk8epfn3uoL0raY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWiKbeIdREOiM8BN+9c1zs+rgtsyMrzqJdnIlMAEh4zZY3Er1K
	XvObNxqF3QTssW93Ma6VO0agAKgWIq7iyS3wwb90czDx/m6IB3M/TNpi3PiGe4DyjMc=
X-Gm-Gg: ASbGncvfyJl6hzF1NT5v8Sh7BC7eLcMOSVC9LLOgSHmKD3SlpW+JIFli1i6prkfVlS1
	WOoDOx+VGRkrk8jsp9OJ9tGIQOJBIYAe+fz81DMsrGYcmQs9sMAjRP+F1uEVKQQj8bX1NBY1/S5
	x0RUT8XaLhUhu84P3kQQWk2VrGI38uxGdC3VFhQhmsiuEGrIk0JabdQfkWgbLDhiB9qrv7nEeW/
	4acTie/6blCvjQ8lPl6RshK0V5K5nyEzrhChusTwE2pJWpcT1IHW3ItrhAAUFZ+1fKk+uwyYws2
	WWYCj2rzXUii04CMSgSkwd0Y2NHbynel4bBjp2jrneGg5wbkYNkikwJxzlDLoNR6C9S773EioBX
	4N7b+PCX2lgtz50bu35H3d1CE1jF0/M+kVngCxZcbe0buUz5Z6lnqNzilPAeRoY0uYaVwdzUwkN
	cn6yJ+JJGY+kjwBl3q7nkwQSKze/8G8sFWmju3zYnjidGgMt8r1ZAJBlI=
X-Google-Smtp-Source: AGHT+IFNqkfrgh8cAet8tsEeQdxQsmxaiBRFyUU2kxr41gyhOqAGxhoBQb+43R+it0NnR7uVsOqIYg==
X-Received: by 2002:a17:907:60d0:b0:af4:148:e51f with SMTP id a640c23a62f3a-af61740cf25mr105799066b.2.1753428630921;
        Fri, 25 Jul 2025 00:30:30 -0700 (PDT)
Message-ID: <de709510-72a6-4a10-bd28-d92c1a523c24@suse.com>
Date: Fri, 25 Jul 2025 09:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] tools/xenstored: Rename dom0_domid to
 store_domid
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-11-jason.andryuk@amd.com>
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
In-Reply-To: <20250725022812.466897-11-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L6RAF4EWJinUm0ws5jYLwoNX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L6RAF4EWJinUm0ws5jYLwoNX
Content-Type: multipart/mixed; boundary="------------wIsNbH0gH7byoe0n5wOJGOe5";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <de709510-72a6-4a10-bd28-d92c1a523c24@suse.com>
Subject: Re: [PATCH v4 10/12] tools/xenstored: Rename dom0_domid to
 store_domid
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-11-jason.andryuk@amd.com>
In-Reply-To: <20250725022812.466897-11-jason.andryuk@amd.com>

--------------wIsNbH0gH7byoe0n5wOJGOe5
Content-Type: multipart/mixed; boundary="------------eCuumCo0Jq9CIu1csc51Qasf"

--------------eCuumCo0Jq9CIu1csc51Qasf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDQ6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFRoZSBkb20wX2Rv
bWlkIHZhcmlhYmxlIGlzIG1pc25hbWVkIGFuZCBjb25mbGF0ZXMgcHVycG9zZXMuICBJZiB3
ZSBoYXZlDQo+IHhlbnN0b3JlZCBydW5uaW5nIGluIGEgTGludXggZG9tYWluIHRoYXQgaXMg
bm90IGRvbTAsIHRoaXMgdmFyaWFibGUNCj4gY29udHJvbHMgdGhlIGxvb2t1cCBvZiAvcHJv
Yy94ZW4veHNkX2t2YSBhbmQgdGhlIGV2ZW50IGNoYW5uZWwuDQo+IA0KPiBPbmUgaW1wbGlj
YXRpb24gb2YgdGhpcyBjaGFuZ2UgaXMgdGhhdCB0aGUgeGVuc3RvcmUgZG9tYWluIGlzIG5v
dA0KPiBwcml2aWxlZ2VkIGJ5IHZpcnR1ZSBvZiBjb25zaWRlcmluZyBzdG9yZV9kb21pZCBh
cyBwcml2aWxlZ2VkLg0KPiANCj4gUmVuYW1lIHRvIHN0b3JlX2RvbWlkIHRvIGJldHRlciBz
aG93IGl0cyBwdXJwb3NlLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBB
ZGQgYSBkZXNjcmlwdGlvbiBvZiB0aGUgLW0vLS1tYXN0ZXItZG9taWQgb3B0aW9ucyB3aGls
ZQ0KPiBkb2luZyB0aGlzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8
amFzb24uYW5kcnl1a0BhbWQuY29tPg0KPiAtLS0NCj4gICB0b29scy94ZW5zdG9yZWQvY29y
ZS5jICAgfCA5ICsrKysrKy0tLQ0KPiAgIHRvb2xzL3hlbnN0b3JlZC9jb3JlLmggICB8IDYg
KysrLS0tDQo+ICAgdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIHwgOCArKysrLS0tLQ0KPiAg
IHRvb2xzL3hlbnN0b3JlZC9wb3NpeC5jICB8IDIgKy0NCj4gICA0IGZpbGVzIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMgYi90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+IGlu
ZGV4IDE5ZWRkNzViYzMuLjk4MTkwN2VjMjggMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hlbnN0
b3JlZC9jb3JlLmMNCj4gKysrIGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPiBAQCAtMjUz
Niw3ICsyNTM2LDEwIEBAIHN0YXRpYyB2b2lkIHVzYWdlKHZvaWQpDQo+ICAgIiAgICAgICAg
ICAgICAgICAgICAgICAgICAgYWxsb3dlZCB0aW1lb3V0IGNhbmRpZGF0ZXMgYXJlOlxuIg0K
PiAgICIgICAgICAgICAgICAgICAgICAgICAgICAgIHdhdGNoLWV2ZW50OiB0aW1lIGEgd2F0
Y2gtZXZlbnQgaXMga2VwdCBwZW5kaW5nXG4iDQo+ICAgIiAgLUssIC0ta2VlcC1vcnBoYW5z
ICAgICAgZG9uJ3QgZGVsZXRlIG5vZGVzIG93bmVkIGJ5IGEgZG9tYWluIHdoZW4gdGhlXG4i
DQo+IC0iICAgICAgICAgICAgICAgICAgICAgICAgICBkb21haW4gaXMgZGVsZXRlZCAodGhp
cyBpcyBhIHNlY3VyaXR5IHJpc2shKVxuIik7DQo+ICsiICAgICAgICAgICAgICAgICAgICAg
ICAgICBkb21haW4gaXMgZGVsZXRlZCAodGhpcyBpcyBhIHNlY3VyaXR5IHJpc2shKVxuIg0K
PiArIiAgLW0sIC0tbWFzdGVyLWRvbWlkICAgICAgc3BlY2lmeSB0aGUgZG9taWQgb2YgdGhl
IGRvbWFpbiB3aGVyZSB4ZW5zdG9yZWRcbiINCj4gKyIgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlzIHJ1bm5pbmcuICBkZWZhdWx0cyB0byAwXG4iDQo+ICspOw0KPiAgIH0NCj4gICAN
Cj4gICANCj4gQEAgLTI1NjQsNyArMjU2Nyw3IEBAIHN0YXRpYyBzdHJ1Y3Qgb3B0aW9uIG9w
dGlvbnNbXSA9IHsNCj4gICAjZW5kaWYNCj4gICAJeyBOVUxMLCAwLCBOVUxMLCAwIH0gfTsN
Cj4gICANCj4gLWludCBkb20wX2RvbWlkID0gMDsNCj4gK2ludCBzdG9yZV9kb21pZCA9IDA7
DQo+ICAgaW50IGRvbTBfZXZlbnQgPSAwOw0KPiAgIGludCBwcml2X2RvbWlkID0gMDsNCj4g
ICBkb21pZF90IHN0dWJfZG9taWQgPSBET01JRF9JTlZBTElEOw0KPiBAQCAtMjczMyw3ICsy
NzM2LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkNCj4gICAJCQlkb20w
X2V2ZW50ID0gZ2V0X29wdHZhbF91aW50KG9wdGFyZyk7DQo+ICAgCQkJYnJlYWs7DQo+ICAg
CQljYXNlICdtJzoNCj4gLQkJCWRvbTBfZG9taWQgPSBnZXRfb3B0dmFsX3VpbnQob3B0YXJn
KTsNCj4gKwkJCXN0b3JlX2RvbWlkID0gZ2V0X29wdHZhbF91aW50KG9wdGFyZyk7DQo+ICAg
CQkJYnJlYWs7DQo+ICAgCQljYXNlICdwJzoNCj4gICAJCQlwcml2X2RvbWlkID0gZ2V0X29w
dHZhbF91aW50KG9wdGFyZyk7DQo+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvY29y
ZS5oIGIvdG9vbHMveGVuc3RvcmVkL2NvcmUuaA0KPiBpbmRleCAxYmE5NTkyZDE2Li5kNDRj
Y2E4NDU0IDEwMDY0NA0KPiAtLS0gYS90b29scy94ZW5zdG9yZWQvY29yZS5oDQo+ICsrKyBi
L3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmgNCj4gQEAgLTM2NCw3ICszNjQsNyBAQCBkbyB7CQkJ
CQkJXA0KPiAgIAkJdHJhY2UoInRkYjogIiBfX1ZBX0FSR1NfXyk7CVwNCj4gICB9IHdoaWxl
ICgwKQ0KPiAgIA0KPiAtZXh0ZXJuIGludCBkb20wX2RvbWlkOw0KPiArZXh0ZXJuIGludCBz
dG9yZV9kb21pZDsNCj4gICBleHRlcm4gaW50IGRvbTBfZXZlbnQ7DQo+ICAgZXh0ZXJuIGlu
dCBwcml2X2RvbWlkOw0KPiAgIGV4dGVybiBkb21pZF90IHN0dWJfZG9taWQ7DQo+IEBAIC0z
ODEsMTEgKzM4MSwxMSBAQCB1aW50NjRfdCBnZXRfbm93X21zZWModm9pZCk7DQo+ICAgdm9p
ZCAqeGVuYnVzX21hcCh2b2lkKTsNCj4gICB2b2lkIHVubWFwX3hlbmJ1cyh2b2lkICppbnRl
cmZhY2UpOw0KPiAgIA0KPiAtc3RhdGljIGlubGluZSBpbnQgeGVuYnVzX21hc3Rlcl9kb21p
ZCh2b2lkKSB7IHJldHVybiBkb20wX2RvbWlkOyB9DQo+ICtzdGF0aWMgaW5saW5lIGludCB4
ZW5idXNfbWFzdGVyX2RvbWlkKHZvaWQpIHsgcmV0dXJuIHN0b3JlX2RvbWlkOyB9DQoNCk1h
eWJlIGp1c3QgZHJvcCB4ZW5idXNfbWFzdGVyX2RvbWlkKCkgYW5kIHJlcGxhY2UgaXRzIHVz
ZSBjYXNlcyB3aXRoDQpzdG9yZV9kb21pZCBkaXJlY3RseT8NCg0KPiAgIA0KPiAgIHN0YXRp
YyBpbmxpbmUgYm9vbCBkb21pZF9pc191bnByaXZpbGVnZWQodW5zaWduZWQgaW50IGRvbWlk
KQ0KPiAgIHsNCj4gLQlyZXR1cm4gZG9taWQgIT0gZG9tMF9kb21pZCAmJiBkb21pZCAhPSBw
cml2X2RvbWlkOw0KPiArCXJldHVybiBkb21pZCAhPSBzdG9yZV9kb21pZCAmJiBkb21pZCAh
PSBwcml2X2RvbWlkOw0KDQpJJ2Qgc2F5IGRyb3AgdGhlIHRlc3QgZm9yIHN0b3JlX2RvbWlk
IGhlcmUuIEkgZG9uJ3QgdGhpbmsgaXQgaXMNCmFwcHJvcHJpYXRlIHRvIGdpdmUgeGVuc3Rv
cmUtc3R1YmRvbSBzcGVjaWFsIHJpZ2h0cy4NCg0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMg
aW5saW5lIGJvb2wgZG9tYWluX2lzX3VucHJpdmlsZWdlZChjb25zdCBzdHJ1Y3QgY29ubmVj
dGlvbiAqY29ubikNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBi
L3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPiBpbmRleCBkYmVhY2FhOTNlLi5kOTE0NGU5
N2ExIDEwMDY0NA0KPiAtLS0gYS90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4gKysrIGIv
dG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+IEBAIC0xMTM5LDcgKzExMzksNyBAQCBzdGF0
aWMgc3RydWN0IGRvbWFpbiAqb25lYXJnX2RvbWFpbihzdHJ1Y3QgY29ubmVjdGlvbiAqY29u
biwNCj4gICAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgIA0KPiAgIAlkb21pZCA9
IGF0b2koZG9taWRfc3RyKTsNCj4gLQlpZiAoZG9taWQgPT0gZG9tMF9kb21pZCkNCj4gKwlp
ZiAoZG9taWQgPT0gc3RvcmVfZG9taWQpDQoNCkFuZCBoZXJlIEknbSBub3Qgc3VyZSB3ZSB3
YW50IHRvIGFsbG93IHRvIHByaXZfZG9taWQuDQoNClRoZXJlIHdpbGwgYmUgbm9vbmUgbGVm
dCB3aG8gY291bGQgY2FsbCBYU19SRVNVTUUgaWYgd2UnZCBhbGxvdw0KcHJpdl9kb21pZCB0
byBiZSByZWxlYXNlZC4gc3RvcmVfZG9taWQgbmVlZHMgdG8gYmUga2VwdCBleGNsdWRlZCwg
dG9vLA0Kb2YgY291cnNlLg0KDQo+ICAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4g
ICANCj4gICAJcmV0dXJuIGZpbmRfY29ubmVjdGVkX2RvbWFpbihkb21pZCk7DQo+IEBAIC0x
MjY3LDcgKzEyNjcsNyBAQCBldnRjaG5fcG9ydF90IGdldF9kb21haW5fZXZ0Y2huKGRvbWlk
X3QgZG9taWQpDQo+ICAgCQlyZXR1cm4gZ2V0X3hlbmJ1c19ldnRjaG4oKTsNCj4gICAJfQ0K
PiAgICNlbHNlDQo+IC0JaWYgKGRvbWlkID09IHhlbmJ1c19tYXN0ZXJfZG9taWQoKSkgew0K
PiArCWlmIChkb21pZCA9PSBzdG9yZV9kb21pZCkgew0KPiAgIAkJcmV0dXJuIGdldF94ZW5i
dXNfZXZ0Y2huKCk7DQoNCkFuZCBub3cgdGhpcyBpcyBjb3JyZWN0LiA6LSkNCg0KPiAgIAl9
DQo+ICAgI2VuZGlmDQo+IEBAIC0xMjk1LDEzICsxMjk1LDEzIEBAIHZvaWQgaW5pdF9kb21h
aW5zKHZvaWQpDQo+ICAgCQlkb21pZHNbbnJfZG9taWRzIC0gMV0gPSBkb21pZDsNCj4gICAN
Cj4gICAJCWlmIChjYXBzICYgWEVOTUFOQUdFX0dFVERPTVNUQVRFX0NBUF9YRU5TVE9SRSkg
ew0KPiAtCQkJZG9tMF9kb21pZCA9IGRvbWlkOw0KPiArCQkJc3RvcmVfZG9taWQgPSBkb21p
ZDsNCj4gICAJCX0NCj4gICANCj4gICAJCWlmIChjYXBzICYgWEVOTUFOQUdFX0dFVERPTVNU
QVRFX0NBUF9DT05UUk9MKSB7DQo+ICAgCQkJbWVtbW92ZSgmZG9taWRzWzFdLCBkb21pZHMs
IChucl9kb21pZHMgLSAxKSAqIHNpemVvZigqZG9taWRzKSk7DQo+ICAgCQkJLyoNCj4gLQkJ
CSAqIExvY2FsIGRvbWlkIG11c3QgYmUgZmlyc3QgdG8gc2V0dXAgc3RydWN0dXJlcyBmb3IN
Cj4gKwkJCSAqIHByaXYgZG9taWQgbXVzdCBiZSBmaXJzdCB0byBzZXR1cCBzdHJ1Y3R1cmVz
IGZvcg0KPiAgIAkJCSAqIGZpcmluZyB0aGUgc3BlY2lhbCB3YXRjaGVzLg0KPiAgIAkJCSAq
Lw0KPiAgIAkJCWRvbWlkc1swXSA9IGRvbWlkOw0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVu
c3RvcmVkL3Bvc2l4LmMgYi90b29scy94ZW5zdG9yZWQvcG9zaXguYw0KPiBpbmRleCA2MDM3
ZDczOWQwLi5kMDYyMmRjMDVmIDEwMDY0NA0KPiAtLS0gYS90b29scy94ZW5zdG9yZWQvcG9z
aXguYw0KPiArKysgYi90b29scy94ZW5zdG9yZWQvcG9zaXguYw0KPiBAQCAtMjY2LDcgKzI2
Niw3IEBAIHN0YXRpYyB2b2lkIGFjY2VwdF9jb25uZWN0aW9uKGludCBzb2NrKQ0KPiAgIAlj
b25uID0gbmV3X2Nvbm5lY3Rpb24oJnNvY2tldF9mdW5jcyk7DQo+ICAgCWlmIChjb25uKSB7
DQo+ICAgCQljb25uLT5mZCA9IGZkOw0KPiAtCQljb25uLT5pZCA9IGRvbTBfZG9taWQ7DQo+
ICsJCWNvbm4tPmlkID0gc3RvcmVfZG9taWQ7DQo+ICAgCX0gZWxzZQ0KPiAgIAkJY2xvc2Uo
ZmQpOw0KPiAgIH0NCg0KDQpKdWVyZ2VuDQo=
--------------eCuumCo0Jq9CIu1csc51Qasf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------eCuumCo0Jq9CIu1csc51Qasf--

--------------wIsNbH0gH7byoe0n5wOJGOe5--

--------------L6RAF4EWJinUm0ws5jYLwoNX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDMpYFAwAAAAAACgkQsN6d1ii/Ey/u
Iwf9HQWQHw2w9dT31k8teoLsH956cIGOVwu2nF9aHDEYDLOHByV3ER1JLKklfAkiS7I0pz5CjLrG
1tDZwQFDZgP14yo674CiieKhTc3eVnemBrhFGIEZynYBvv1BRcsRP00BKVErTz8a5/06tkWQlnP7
7KNLlZHAfRBhrWcYVTJERbB13RD9/xpYX3e2LjjwVmgxZuen6oMFIOtw1u6TpnGNEkJRHOaycwgH
ZHR9zHCT/G/JxQmjJPFzbXamHj1+IYvdo8olBawqlbZ27dygI/V78G7kzj96AwkzbZYdIj/lKICw
WIFkvjRg4MX1YzgpW/0FQyAbOVz1k/j9Hzx6RgH2qw==
=9kKi
-----END PGP SIGNATURE-----

--------------L6RAF4EWJinUm0ws5jYLwoNX--

