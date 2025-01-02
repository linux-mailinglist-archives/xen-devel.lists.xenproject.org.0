Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964D69FFA0C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 15:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864004.1275328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTLmo-0000Lg-HC; Thu, 02 Jan 2025 14:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864004.1275328; Thu, 02 Jan 2025 14:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTLmo-0000K8-Cw; Thu, 02 Jan 2025 14:02:54 +0000
Received: by outflank-mailman (input) for mailman id 864004;
 Thu, 02 Jan 2025 14:02:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDYY=T2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tTLmm-0000Jn-NG
 for xen-devel@lists.xen.org; Thu, 02 Jan 2025 14:02:52 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4122488e-c912-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 15:02:51 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso8529670f8f.2
 for <xen-devel@lists.xen.org>; Thu, 02 Jan 2025 06:02:51 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e43dsm38856245f8f.70.2025.01.02.06.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 06:02:50 -0800 (PST)
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
X-Inumbo-ID: 4122488e-c912-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735826571; x=1736431371; darn=lists.xen.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nNcuJtlhJ5LXl9Cmsw41uL7uAoRkzt7QZeZpVDDbcsw=;
        b=AFT69sUexFz7xZYE6GFlO7Hm97TJbActl6ME2pdx0iPOKIVqBZ2mSpmxPpJygOhKA8
         g47bnBc+ueiNZW85euOIfhyjOE15B96Sjl+wROYjR4rspi7ZQRz028ozFwecK7QFM/uH
         HS7NNt6ptXmK/4BRN16nR8G6cbTo+JBCQjE1tX3B60xOU7gxhvjvTUaTECjTsUrKm89D
         nqZFs17eEZCLy2K83+cclTKWwBfQbWxs/2DpAxlVIES9XsA/C2KUwFVrTTqu5iKBwl4S
         DCNQlZ13+QrWIgq7n/QiXJhsMOklk9O26OwniVFQ8BNZjHiXmeRMv1pOaqNQpdE1nzLu
         fDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735826571; x=1736431371;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNcuJtlhJ5LXl9Cmsw41uL7uAoRkzt7QZeZpVDDbcsw=;
        b=pG7cKoGhgWMfrZlIn+f+RgrOsYcMg+gd7I4TPXJwn5tnSxe8ZbHETtao2FzXB/OBuu
         MJ8FKAP+R6Q7gntwFqMUu8phhdZH7bA6LuGClgekYm35hDtCMfI6niJUXUcjigjB5HfE
         JjeL9jJOMt5JDFIldwvBPB3P7/i9GJvl3LTF/PumqjQJV3dFoBttyddyR3M4+aNlYyZP
         k4cxXr4+T+4z47QKU3zyS0k5mNJ8w/E3/zLsSQmQIIMj9DbVua98TWAiCPqWV/1qIC3l
         m9L0X64uVBQgApgoHLNfaXtfMj7M461eW+3dfPv32hddOLxulo8tfkpLJKmmsl+dhu5u
         X7dw==
X-Forwarded-Encrypted: i=1; AJvYcCVEYl8SjidwnG5VtH+gORMAitvrJhRxV3gDDnRafZIPqhUKLDo4+OXgD4FiV1pJpzSKw71M84VEVFU=@lists.xen.org
X-Gm-Message-State: AOJu0YxHr7iB0gOaCciSrpQUMmRwMXs4tgT/FVEROubUsjqPRAX0m5gv
	gj/z5R7ros/Cber3KYq8xBNp0/4R7gBAzPIGj6/gD2FI9PoJIooZmYM+2Bc+Eno=
X-Gm-Gg: ASbGnctQ2oZrnip1p2hwcNa0BZZZ6qessIRbBMkvx4b5rhicVUaK2sX3NzBkmTO20Mx
	xyB9XxIwyMpc6jQFbjeQ3cd4wu6+8/o1uW9Llej9u8WCIzy7Zn4WMvRowozAIRuvHb+jt0EROSx
	7d3ob7Bil2g1lEGkZBhUcKJXLfPIPPLlX0XWHOuO0XW/0EjtvemqaublntPcdoqOJP+rdpFgEqf
	kh/W+2jI/IFxi0WPmw1ZPxQ3Id9aFTlLzzFsEUgR1n7wKXjyfyk69xRZS4HZX18yzTpzkzOYCSe
	mN/ShDyN/m6xFc7MI4UawhsdamW3dq0UEqKxcc+UTvqqewoGtwglYMiNnWTBW+ElkoPFHzUYBTX
	CENP4+Q==
X-Google-Smtp-Source: AGHT+IEqSRq0MK9Ua8bDWNn1H6Gi2bH5zZD+tGEIW8t1h5a8bIxlP2waBjVSvv0f6ptGyK4wTSCR0g==
X-Received: by 2002:a5d:64cf:0:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38a221f6746mr41364282f8f.16.1735826570525;
        Thu, 02 Jan 2025 06:02:50 -0800 (PST)
Message-ID: <40734e79-fb55-4712-aae1-3ef350af4f3c@suse.com>
Date: Thu, 2 Jan 2025 15:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
To: David Woodhouse <dwmw2@infradead.org>,
 "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
 <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
 <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
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
In-Reply-To: <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c0M9FqHxUp1Rk3Wzjq3QJQBR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c0M9FqHxUp1Rk3Wzjq3QJQBR
Content-Type: multipart/mixed; boundary="------------9vpxaHT0z3Ue0SWjxQFPzTkK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
Message-ID: <40734e79-fb55-4712-aae1-3ef350af4f3c@suse.com>
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
 <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
 <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
In-Reply-To: <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
Autocrypt-Gossip: addr=security@xen.org; keydata=
 xsBNBE+hNqgBCADYua5OFR0/Jeu0rByk+Obk6+SewIeGej1FAcjo+Cvpcr1dfnLBAhmmhbfM
 b++qr6SG6Ek+cUQogYAFvZcEcusbRPy4MIzJkqoPSyOUhCxZoxWNWUfhDdt0TWA3Hs1vYmFO
 e+2jvlL3h7yAsGMYO8jo6ow8ceBEOmf8Q5BLq2OPkNpGcaHEhbSv0VZ3mdHM30ynY6GubIws
 c68LZ5hTORTSjKaj2WVCe4OorBMZte5Im+6MOEUbCjynqPJSU9KNFhIhUuyXp1vn0gZ2N5QS
 pkghpzBJLzeBNEI6ecV3Q0p+/pq8EvEAuUSNLUEbIZ/NSLqyTVMc9HZxnPu59im8wB9rABEB
 AAHNK1hlbi5vcmcgKGluY29taW5nIGVtYWlsKSA8c2VjdXJpdHlAeGVuLm9yZz7CwHgEEwEC
 ACIFAk+hNqgCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHQ6P8qC06lk1y0H/2Pj
 jQyPDZVS4zIVnR4xQOQ1KphPCdSTPlhj+VVrjZZNXWGCUKvJShL84XIONH62fIgQE/6CTWXJ
 tx6i4u1oAtFH4+8HayFjg609lxx9frJ4tJkJitw5TT6VEGAambchIG5QaP9hepgyrVXjQ0X2
 ot0jgpwL6G3sx0L1gewiMALXtGT6oTqLjXius/nv69yRe26wxU1GX80oWWH/5p585xt54C1X
 nhDEVzp0S9UW7VAAVDCWuSefSrihh3jZi4QE1fnGRwO0RfeLh1sXeuMn9uFIz0CmaCbAp5Pe
 UyNb6wgG60h4JLCDyhJntoHfq8pQLEJ8G9nvjDfw8BLvkBKYNvbOwE0ET6E2qAEIALqWNlGF
 d3uIj+DXZ40/i7fsoPb+HaYaG6Y+7+ZWxMxUeQDTLBnTYiAa+EGVutc4v52BXH8RZc9I/NH9
 lBT2/AwaEVSomxLicbixXUGoFC9kMp/VP1xwWJ+gm+ZEnQzY+2AFJGMvqEsGocQA7yLw121J
 UOrorny3CqpHykPUF3fqp4n/GL47VTaKxlsoV8o2JgZZ62NJlkBtnbA4ODzhWr6cA21smWFg
 sfFJ+EkXb1NEeYLs8CWtTn2EiQXlZTQ8OgBPahfvLZ+AJ4sM/Raoi2c3UIQrlCsg9BoojKMk
 Li8XUrywr8HEJYjhBYObCgbmaeIEfmrw5XJqOKlMg40XY+MAEQEAAcLAXwQYAQIACQUCT6E2
 qAIbDAAKCRB0Oj/KgtOpZDhJB/0XtxrlVuRttpjK1PEYK/A/9h47VH9p0UvVYCH+ZS2a+sTg
 sapx0zp4uni8wtytkvGw/EM06D4ZoaWAUcjXILNKGdi62q/z+WAfdEY/WrONxAbr2Dtv/LT0
 0/2nifYU9O1vGYS1Kx/B3D8fU0w+2Sjv+hYjbGDWn619etC8dNEIxczH6V/cVOZf0D2KhoBf
 MCHUoKeuAfaIKDMxOZjb7sajfUW70cxFFWYqH96Py01oxDroOKzy0x62iVdsYFGB3FvcD9tD
 WsxVWwGHA8DKEfKMuNPiuapzdxdrNm5AQilSUlfD65KK9d3kQdoOUPdPWoIQnz8GnHMPDe99
 7SuwxWGb

--------------9vpxaHT0z3Ue0SWjxQFPzTkK
Content-Type: multipart/mixed; boundary="------------IRz9aSAd8Ft6qHNXUM0HpvSP"

--------------IRz9aSAd8Ft6qHNXUM0HpvSP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDEuMjUgMTQ6NDAsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gT24gVGh1LCAy
MDI1LTAxLTAyIGF0IDE0OjM4ICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24g
MDIuMDEuMjUgMTM6NTMsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4+PiBPbiBUaHUsIDIw
MjUtMDEtMDIgYXQgMTM6MDcgKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+IE9u
IDIzLjEyLjI0IDE1OjI0LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6DQo+Pj4+PiBPbiBUdWUs
IDIwMjQtMTItMTcgYXQgMTI6MTggKzAwMDAsIFhlbi5vcmcgc2VjdXJpdHkgdGVhbSB3cm90
ZToNCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYZW4gU2VjdXJpdHkg
QWR2aXNvcnkgQ1ZFLTIwMjQtNTMyNDEgLyBYU0EtNDY2DQo+Pj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2ZXJzaW9uIDMNCj4+Pj4+Pg0KPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYZW4g
aHlwZXJjYWxsIHBhZ2UgdW5zYWZlIGFnYWluc3Qgc3BlY3VsYXRpdmUgYXR0YWNrcw0KPj4+
Pj4+DQo+Pj4+Pj4gVVBEQVRFUyBJTiBWRVJTSU9OIDMNCj4+Pj4+PiA9PT09PT09PT09PT09
PT09PT09PQ0KPj4+Pj4+DQo+Pj4+Pj4gVXBkYXRlIG9mIHBhdGNoIDUsIHB1YmxpYyByZWxl
YXNlLg0KPj4+Pj4NCj4+Pj4+IENhbid0IHdlIGV2ZW4gdXNlIHRoZSBoeXBlcmNhbGwgcGFn
ZSBlYXJseSBpbiBib290PyBTdXJlbHkgd2UgaGF2ZSB0bw0KPj4+Pj4ga25vdyB3aGV0aGVy
IHdlJ3JlIHJ1bm5pbmcgb24gYW4gSW50ZWwgb3IgQU1EIENQVSBiZWZvcmUgd2UgZ2V0IHRv
IHRoZQ0KPj4+Pj4gcG9pbnQgd2hlcmUgd2UgY2FuIGVuYWJsZSBhbnkgb2YgdGhlIG5ldyBj
b250cm9sLWZsb3cgaW50ZWdyaXR5DQo+Pj4+PiBzdXBwb3J0PyBEbyB3ZSBuZWVkIHRvIGp1
bXAgdGhyb3VnaCB0aG9zZSBob29wcyBkbyBkbyB0aGF0IGVhcmx5DQo+Pj4+PiBkZXRlY3Rp
b24gYW5kIHNldHVwPw0KPj4+Pg0KPj4+PiBUaGUgZG93bnNpZGUgb2YgdGhpcyBhcHByb2Fj
aCB3b3VsZCBiZSB0byBoYXZlIGFub3RoZXIgdmFyaWFudCB0byBkbw0KPj4+PiBoeXBlcmNh
bGxzLiBTbyB5b3UnZCBoYXZlIHRvIHJlcGxhY2UgdGhlIHZhcmlhbnQgYmVpbmcgYWJsZSB0
byB1c2UgQU1EDQo+Pj4+IG9yIElOVEVMIHNwZWNpZmljIGluc3RydWN0aW9ucyB3aXRoIGEg
ZnVuY3Rpb24gZG9pbmcgdGhlIGh5cGVyY2FsbCB2aWENCj4+Pj4gdGhlIGh5cGVyY2FsbCBw
YWdlLg0KPj4+DQo+Pj4gWW91J2QgcHJvYmFibHkgc3RhcnQgd2l0aCB0aGUgaHlwZXJjYWxs
IGZ1bmN0aW9uIGp1c3QganVtcGluZyBkaXJlY3RseQ0KPj4+IGludG8gdGhlIHRlbXBvcmFy
eSBoeXBlcmNhbGwgcGFnZSBkdXJpbmcgZWFybHkgYm9vdCwgYW5kIHRoZW4geW91J2QNCj4+
PiB1cGRhdGUgdGhlbSB0byB1c2UgdGhlIG5hdGl2ZWx5IHByZXBhcmVkIHZtY2FsbC92bW1j
YWxsIHZlcnNpb24gbGF0ZXIuDQo+Pj4NCj4+PiBBbGwgdGhlIGNvbXBsZXhpdHkgb2YgcGF0
Y2hpbmcgYW5kIENQVSBkZXRlY3Rpb24gaW4gZWFybHkgYm9vdCBzZWVtcyB0bw0KPj4+IGJl
IHNvbWV3aGF0IGdyYXR1aXRvdXMgYW5kIGV2ZW4gY291bnRlci1wcm9kdWN0aXZlIGdpdmVu
IHRoZSBjaGFuZ2UgaXQNCj4+PiBpbnRyb2R1Y2VzIHRvIDY0LWJpdCBsYXRjaGluZy4NCj4+
Pg0KPj4+IEFuZCBldmVuIGlmIHRoZSA2NC1iaXQgbGF0Y2ggZG9lcyBoYXBwZW4gd2hlbiBI
Vk1fUEFSQU1fQ0FMTEJBQ0tfSVJRIGlzDQo+Pj4gc2V0LCBpc24ndCB0aGF0IHBvdGVudGlh
bGx5IGEgbG90IGxhdGVyIGluIGJvb3Q/IFhlbiB3aWxsIGJlIHRyZWF0aW5nDQo+Pj4gdGhp
cyBndWVzdCBhcyAzMi1iaXQgdW50aWwgdGhlbiwgc28gd29uJ3QgYWxsIHRoZSB2Y3B1X2lu
Zm8gYW5kDQo+Pj4gcnVuc3RhdGUgc3RydWN0dXJlcyBiZSB3cm9uZyBldmVuIGFzIHRoZSBz
ZWNvbmRhcnkgQ1BVcyBhcmUgYWxyZWFkeSB1cA0KPj4+IGFuZCBydW5uaW5nPw0KPj4NCj4+
IFdoYXQgSSBkb24ndCBnZXQgaXMgd2h5IHRoaXMgbGF0Y2hpbmcgaXNuJ3QgZG9uZSB3aGVu
IHRoZSBzaGFyZWQgaW5mbw0KPj4gcGFnZSBpcyBtYXBwZWQgaW50byB0aGUgZ3Vlc3Qgdmlh
IHRoZSBYRU5NQVBTUEFDRV9zaGFyZWRfaW5mbyBoeXBlcmNhbGwNCj4+IG9yIG1heWJlIGFk
ZGl0aW9uYWxseSB3aGVuIFZDUFVPUF9yZWdpc3Rlcl9ydW5zdGF0ZV9tZW1vcnlfYXJlYSBp
cyBiZWluZw0KPj4gdXNlZCBieSB0aGUgZ3Vlc3QuDQo+Pg0KPj4gVGhlc2UgYXJlIHRoZSBl
YXJsaWVzdCBwb3NzaWJsZSBjYXNlcyB3aGVyZSB0aGUgZ3Vlc3QgaXMgYWJsZSB0byBhY2Nl
c3MNCj4+IHRoaXMgZGF0YS4NCj4gDQo+IFdlbGwsIHRoYXQncyBhIGdyZWF0IGlkZWEuIEdv
dCBhIHRpbWUgbWFjaGluZT8gSWYgeW91IGhhdmUsIEkgaGF2ZSBzb21lDQo+IGNvbW1lbnRz
IG9uIHRoZSBNU0nihpJQSVJRIG1hcHBpbmcgbm9uc2Vuc2UgdG9vLi4uIDopDQo+IA0KPj4+
DQo+Pj4+IEknbSBwbGFubmluZyB0byBzZW5kIHBhdGNoZXMgZm9yIFhlbiBhbmQgdGhlIGtl
cm5lbCB0byBhZGQgQ1BVSUQgZmVhdHVyZQ0KPj4+PiBiaXRzIGluZGljYXRpbmcgd2hpY2gg
aW5zdHJ1Y3Rpb24gdG8gdXNlLiBUaGlzIHdpbGwgbWFrZSBsaWZlIG11Y2ggZWFzaWVyLg0K
Pj4+Pg0KPj4+Pj4gRW5hYmxpbmcgdGhlIGh5cGVyY2FsbCBwYWdlIGlzIGFsc28gb25lIG9m
IHRoZSB0d28gcG9pbnRzIHdoZXJlIFhlbg0KPj4+Pj4gd2lsbCAnbGF0Y2gnIHRoYXQgdGhl
IGd1ZXN0IGlzIDY0LWJpdCwgd2hpY2ggYWZmZWN0cyB0aGUgbGF5b3V0IG9mIHRoZQ0KPj4+
Pj4gc2hhcmVkX2luZm8sIHZjcHVfaW5mbyBhbmQgcnVuc3RhdGUgc3RydWN0dXJlcy4NCj4+
Pj4+DQo+Pj4+PiBUaGUgb3RoZXIgc3VjaCBsYXRjaGluZyBwb2ludCBpcyB3aGVuIHRoZSBn
dWVzdCBzZXRzDQo+Pj4+PiBIVk1fUEFSQU1fQ0FMTEJBQ0tfSVJRLCBhbmQgSSAqdGhpbmsq
IHRoYXQgc2hvdWxkIHdvcmsgaW4gYWxsDQo+Pj4+PiBpbXBsZW1lbnRhdGlvbnMgb2YgdGhl
IFhlbiBBQkkgKGluY2x1ZGluZyBRRU1VL0tWTSBhbmQgRUMyKS4gQnV0IHdvdWxkDQo+Pj4+
PiB3YW50IHRvIHRlc3QuDQo+Pj4+Pg0KPj4+Pj4gQnV0IHBlcmhhcHMgaXQgd291bGRuJ3Qg
aHVydCBmb3IgbWF4aW1hbCBjb21wYXRpYmlsaXR5IGZvciBMaW51eCB0byBzZXQNCj4+Pj4+
IHRoZSBoeXBlcmNhbGwgcGFnZSAqYW55d2F5KiwgZXZlbiBpZiBMaW51eCBkb2Vzbid0IHRo
ZW4gdXNlIGl0IOKAlCBvcg0KPj4+Pj4gb25seSB1c2VzIGl0IGR1cmluZyBlYXJseSBib290
Pw0KPj4+Pg0KPj4+PiBJJ20gc2VlaW5nIHBvdGVudGlhbCBwcm9ibGVtcyB3aXRoIHRoYXQg
YXBwcm9hY2ggd2hlbiBzb21lb25lIGlzIHVzaW5nDQo+Pj4+IGFuIG91dC1vZi10cmVlIG1v
ZHVsZSBkb2luZyBoeXBlcmNhbGxzLg0KPj4+Pg0KPj4+PiBXaXRoIGhhdmluZyB0aGUgaHlw
ZXJjYWxsIHBhZ2UgcHJlc2VudCBzdWNoIGEgbW9kdWxlIHdvdWxkIGFkZCBhIHdheSB0byBk
bw0KPj4+PiBzcGVjdWxhdGl2ZSBhdHRhY2tzLCB3aGlsZSBkZWxldGluZyB0aGUgaHlwZXJj
YWxsIHBhZ2Ugd291bGQgcmVzdWx0IGluIGENCj4+Pj4gZmFpbHVyZSB0cnlpbmcgdG8gbG9h
ZCBzdWNoIGEgbW9kdWxlLg0KPj4+DQo+Pj4gSXMgdGhhdCBhIHJlc3BvbnNlIHRvIHRoZSBv
cmlnaW5hbCBwYXRjaCBzZXJpZXMsIG9yIHRvIG15IHN1Z2dlc3Rpb24/DQo+Pj4NCj4+PiBJ
ZiB3ZSB0ZW1wb3JhcmlseSBhc2sgWGVuIHRvIHBvcHVsYXRlIGEgaHlwZXJjYWxsIHBhZ2Ug
d2hpY2ggaXMgdXNlZA0KPj4+IGR1cmluZyBlYXJseSBib290IChvciBldmVuIGlmIGl0J3Mg
Km5vdCogdXNlZCwgYW5kIG9ubHkgdXNlZCB0byBtYWtlDQo+Pj4gc3VyZSBYZW4gbGF0Y2hl
cyA2NC1iaXQgbW9kZSBlYXJseSkuLi4gSSBkb24ndCBzZWUgd2h5IHRoYXQgbWFrZXMgYW55
DQo+Pj4gZGlmZmVyZW5jZSB0byBtb2R1bGVzLiBJIHdhc24ndCBzdWdnZXN0aW5nIHdlIGtl
ZXAgaXQgYXJvdW5kIGFuZA0KPj4+ICpleHBvcnQqIGl0Lg0KPj4NCj4+IEFoLCBJIGRpZG4n
dCByZWFkIHlvdXIgc3VnZ2VzdGlvbiB0aGF0IHdheS4NCj4+DQo+PiBTdGlsbCBJIGJlbGll
dmUgdXNpbmcgdGhlIGh5cGVyY2FsbCBwYWdlIGlzIG5vdCBhIGdvb2QgaWRlYSwgZXNwZWNp
YWxseSBhcw0KPj4gd2UnZCBhZGQgYSBoYXJkIGRlcGVuZGVuY3kgb24gdGhlIGFiaWxpdHkg
dG8gZW5hYmxlIENGSSBpbiB0aGUga2VybmVsIHJlbGF0ZWQNCj4+IHRvIHRoZSBzd2l0Y2gg
ZnJvbSB0aGUgaHlwZXJjYWxsIHBhZ2UgdG8gdGhlIG5ldyBkaXJlY3QgaHlwZXJjYWxsIGZ1
bmN0aW9ucy4NCj4gDQo+IEFyZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IHlvdSdyZSBhYmxlIHRv
IGVuYWJsZSB0aGUgQ1BVLXNwZWNpZmljIENGSQ0KPiBwcm90ZWN0aW9ucyBiZWZvcmUgeW91
IGV2ZW4ga25vdyB3aGV0aGVyIGl0J3MgYW4gSW50ZWwgb3IgQU1EIENQVT8NCg0KTm90IGJl
Zm9yZSB0aGF0LCBidXQgbWF5YmUgcmF0aGVyIHNvb24gYWZ0ZXJ3YXJkcy4gQW5kIHRoZSBo
eXBlcmNhbGwgcGFnZQ0KbmVlZHMgdG8gYmUgZGVjb21taXNzaW9uZWQgYmVmb3JlIHRoZSBu
ZXh0IGh5cGVyY2FsbCBpcyBoYXBwZW5pbmcuIFRoZSBxdWVzdGlvbg0KaXMgd2hldGhlciB3
ZSBoYXZlIGEgaG9vayBpbiBwbGFjZSB0byBkbyB0aGF0IHN3aXRjaCBiZXR3ZWVuIGNwdSBp
ZGVudGlmaWNhdGlvbg0KYW5kIENGSSBlbmFibGluZy4NCg0KDQpKdWVyZ2VuDQo=
--------------IRz9aSAd8Ft6qHNXUM0HpvSP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IRz9aSAd8Ft6qHNXUM0HpvSP--

--------------9vpxaHT0z3Ue0SWjxQFPzTkK--

--------------c0M9FqHxUp1Rk3Wzjq3QJQBR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd2nIkFAwAAAAAACgkQsN6d1ii/Ey8/
YAf+NTjlgpdITaqL7CKla5/NUdN0w0oO9s7TPJhcIz4/6ixNURetEnGKrgPs6qOlVEjdEaV0zRbx
Zy8hwcp6x4m5f7BjIjYOHFYAxZBf/o03sRfML4LJw+QwGlube3JrkF/GJN4yo6Cq2Iv50hGKxi4a
ctHxknrM23dyuBucH6/AuvlZKOK6UJxDy0HMYkP7vUMb6HjQ29q2iBcZeyHILWr+85AvTjevZnIx
QtE097oXwsAR7UhPDVModvclg/eS6j6/gml+cZ+ycjK7WtooZ6A/aytLMD1OciCNvWIKRxIilUMh
PN5fo+L540eV/pGrZHF98hfI2OdQhe3mXmFL1H/W8Q==
=sTLL
-----END PGP SIGNATURE-----

--------------c0M9FqHxUp1Rk3Wzjq3QJQBR--

