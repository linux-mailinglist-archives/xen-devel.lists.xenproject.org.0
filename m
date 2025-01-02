Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF049FFA4F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 15:17:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864077.1275385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTM0G-0005HY-7j; Thu, 02 Jan 2025 14:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864077.1275385; Thu, 02 Jan 2025 14:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTM0F-0005AY-UH; Thu, 02 Jan 2025 14:16:47 +0000
Received: by outflank-mailman (input) for mailman id 864077;
 Thu, 02 Jan 2025 14:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDYY=T2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tTM0E-00056n-Ha
 for xen-devel@lists.xen.org; Thu, 02 Jan 2025 14:16:46 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31e7b54f-c914-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 15:16:45 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283dedso113701675e9.3
 for <xen-devel@lists.xen.org>; Thu, 02 Jan 2025 06:16:45 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661289d3dsm459020945e9.41.2025.01.02.06.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 06:16:43 -0800 (PST)
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
X-Inumbo-ID: 31e7b54f-c914-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735827404; x=1736432204; darn=lists.xen.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=79l1iDs8UjX35qRld3NaX+5rfISg1qYZwL/Mg3McJOc=;
        b=LX/cn8NdGxh5QeJY+yrwMzDq2E+xBmWw+4FnbfLN46cVoZSQK7C9sd7pXEDaq+Ys1j
         GJ3ijaLmKAimTWhaJ+kkl+MwF4gXwBWOLhZfqAR4QKfdFfQfibtDxBSI90dgCHQpM+h+
         MwAtHGwr0OwjBxyVva4bBjqf8ndBMEuFRY2yxZil45aXE+FA8RqeYXpkk+D2dAYMEjd6
         g3XpkktWs02T0ZU9P6NhDkgMZS6FD2uxeDM3Qg6/MbR04XICWIUeopDZH8rYsmD3+7IK
         NoP6raQYzVTI/6oELrum/QZYA5ZOh4Dly2t5AbHyDfi9Kro8ub4eHJrWKZ6Owjn5mAry
         CKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735827404; x=1736432204;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79l1iDs8UjX35qRld3NaX+5rfISg1qYZwL/Mg3McJOc=;
        b=I/NDLoUAEIJ1k717Mu7mjbTAZn+Nyw04OAsA5BAhJ93vAdIWld+lL+vGvjDXIL1kUH
         A1Fv+09GiLt87GUieHgR4sfzsXiSwj3dLmgcXY7PRJD9lbgxV576fHf+5N+DFPx0T/iD
         4HVcBzxiCoI5S/+5zuP9nGstFe9WRt/5XT/azCkA7EPb5vIhPxVFSn312pTeFeGRqtg9
         dZaB6q0KWu4KB+FczAc+V5Fn8oLyPRrMubyPg8wgnBAyvgepKOL8F7HTPbGgBueVrMp3
         38VFUFpgsF2V7bk0PZp/hArnCE4uMa7bn8TZ/wG+11GTrXRDVQClI7p172vgRH9TSreJ
         Z/HA==
X-Forwarded-Encrypted: i=1; AJvYcCWIToeGPAvn1/XE3+J3LeMqjXZpjxDZZhyPtKa/bOaV8wsV3u4V2srPr6fmPdkq/EQjoipqoT0jesY=@lists.xen.org
X-Gm-Message-State: AOJu0Yz4IckD8CF2NOMJf844JLYttXyzeccKp3UIwewPWX/VpAFvvED+
	rWXdeFsqsWWZf/3XhHSJ6uYQOMIwTp5y0LSVm0bd2jBL+Gn6xiuH1KRhBLETksk=
X-Gm-Gg: ASbGncsfK9It5z2e6P0wyAbb1mLbsJ9/TI8gJTdJa8++pItroSyS1hSF4RRUEfu+wcd
	OBNv1U0j2Bmf56BYaKaVm/MNNuszSLN0z5XeCbvbLaFBLUGE/D6XA00wBtRJcsSqPVgDsqLl5rJ
	F39jsapZLZcu3f/8o0bzaSJu6Ub7aJJmBAtkCKVs3HdUwZIcdwy0tI1Dq81sU8zHJYTLYcDgK5X
	sfjLgOOd0Sd1wbpUyWaCL3cit3L+Vqvq7FCQCWtFjtFP4hlfmRMrAyXdEbd94sAOdltoX91wui7
	pU129QQKaJtH37FKaW+I0n1rEVimYvErJGLQ3xg7lUrO8kHE/psNl90AlohXT711txBKl7DbTL0
	d6BbMSg==
X-Google-Smtp-Source: AGHT+IH4ELbhJH8tlMr2DSrSrQ4349PE/c3Zdoc7amFsop0uLPb4fwaDJuKCxXlniLHkvVavLQIt/Q==
X-Received: by 2002:a05:600c:a0a:b0:434:fe62:28c1 with SMTP id 5b1f17b1804b1-43668645ffdmr416988425e9.18.1735827404087;
        Thu, 02 Jan 2025 06:16:44 -0800 (PST)
Message-ID: <fc4170ed-d238-4e1c-817e-3695a7112d9d@suse.com>
Date: Thu, 2 Jan 2025 15:16:42 +0100
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
 <40734e79-fb55-4712-aae1-3ef350af4f3c@suse.com>
 <f9b4ae8af70b8b5136b59237c7925f57220b3d5b.camel@infradead.org>
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
In-Reply-To: <f9b4ae8af70b8b5136b59237c7925f57220b3d5b.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wp0qlsW66f4Ym0lcgmYGpqv0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wp0qlsW66f4Ym0lcgmYGpqv0
Content-Type: multipart/mixed; boundary="------------XZSu9UgLyITEawqz3bzsrt5z";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
Message-ID: <fc4170ed-d238-4e1c-817e-3695a7112d9d@suse.com>
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
 <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
 <b7323a9fa5239443b9b6f3daa423196de1051748.camel@infradead.org>
 <40734e79-fb55-4712-aae1-3ef350af4f3c@suse.com>
 <f9b4ae8af70b8b5136b59237c7925f57220b3d5b.camel@infradead.org>
In-Reply-To: <f9b4ae8af70b8b5136b59237c7925f57220b3d5b.camel@infradead.org>
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

--------------XZSu9UgLyITEawqz3bzsrt5z
Content-Type: multipart/mixed; boundary="------------Kd70v4fuM69COeWUhTNOl0ty"

--------------Kd70v4fuM69COeWUhTNOl0ty
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDEuMjUgMTU6MDYsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gT24gVGh1LCAy
MDI1LTAxLTAyIGF0IDE1OjAyICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+IEFy
ZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IHlvdSdyZSBhYmxlIHRvIGVuYWJsZSB0aGUgQ1BVLXNw
ZWNpZmljIENGSQ0KPj4+IHByb3RlY3Rpb25zIGJlZm9yZSB5b3UgZXZlbiBrbm93IHdoZXRo
ZXIgaXQncyBhbiBJbnRlbCBvciBBTUQgQ1BVPw0KPj4NCj4+IE5vdCBiZWZvcmUgdGhhdCwg
YnV0IG1heWJlIHJhdGhlciBzb29uIGFmdGVyd2FyZHMuIEFuZCB0aGUgaHlwZXJjYWxsIHBh
Z2UNCj4+IG5lZWRzIHRvIGJlIGRlY29tbWlzc2lvbmVkIGJlZm9yZSB0aGUgbmV4dCBoeXBl
cmNhbGwgaXMgaGFwcGVuaW5nLiBUaGUgcXVlc3Rpb24NCj4+IGlzIHdoZXRoZXIgd2UgaGF2
ZSBhIGhvb2sgaW4gcGxhY2UgdG8gZG8gdGhhdCBzd2l0Y2ggYmV0d2VlbiBjcHUgaWRlbnRp
ZmljYXRpb24NCj4+IGFuZCBDRkkgZW5hYmxpbmcuDQo+IA0KPiBOb3Qgc3VyZSB0aGF0J3Mg
aG93IEknZCBwaHJhc2UgaXQuIEV2ZW4gaWYgd2UgaGF2ZSB0byBhZGQgYSBob29rIGF0IHRo
ZQ0KPiByaWdodCB0aW1lIHRvIHN3aXRjaCBmcm9tIHRoZSBYZW4tcG9wdWxhdGVkIGh5cGVy
Y2FsbCBwYWdlIHRvIHRoZSBvbmUNCj4gZmlsbGVkIGluIGJ5IExpbnV4LCB0aGUgcXVlc3Rp
b24gaXMgd2hldGhlciBhZGRpbmcgdGhhdCBob29rIGlzIHNpbXBsZXINCj4gdGhhbiBhbGwg
dGhpcyBlYXJseSBzdGF0aWNfY2FsbCBzdHVmZiB0aGF0J3MgYmVlbiB0aHJvd24gdG9nZXRo
ZXIsIGFuZA0KPiB0aGUgb3BlbiBxdWVzdGlvbnMgYWJvdXQgdGhlIDY0LWJpdCBsYXRjaGlu
Zy4NCg0KVGhpcyBpcyBhIHZhbGlkIHF1ZXN0aW9uLCB5ZXMuIE15IGZpcnN0IHZlcnNpb24g
b2YgdGhlc2UgcGF0Y2hlcyBkaWRuJ3QNCndvcmsgd2l0aCBzdGF0aWNfY2FsbCwgYnV0IHVz
ZWQgdGhlIHBhcmF2aXJ0IGNhbGwgcGF0Y2hpbmcgbWVjaGFuaXNtDQpyZXBsYWNpbmcgYW4g
aW5kaXJlY3QgY2FsbCB3aXRoIGEgZGlyZWN0IG9uZSB2aWEgQUxURVJOQVRJVkVzLiBUaGF0
DQp2ZXJzaW9uIHdhcyBkaXNsaWtlZCBieSBzb21lIGludm9sdmVkIHg4NiBtYWludGFpbmVy
cywgcmVzdWx0aW5nIGluIHRoZQ0KYWRkaXRpb24gb2YgdGhlIGVhcmx5IHN0YXRpY19jYWxs
IHVwZGF0ZSBtZWNoYW5pc20uDQoNCk9uZSB0aGluZyB0byBtZW50aW9uIHJlZ2FyZGluZyB0
aGUgNjQtYml0IGxhdGNoaW5nOiB3aGF0IHdvdWxkIHlvdSBkbw0Kd2l0aCBIVk0gZG9tYWlu
cz8gVGhvc2UgYXJlIHNldHRpbmcgdXAgdGhlIGh5cGVyY2FsbCBwYWdlIHJhdGhlciBsYXRl
Lg0KSW4gY2FzZSB0aGUga2VybmVsIHdvdWxkIHVzZSBDRkksIGVuYWJsaW5nIHdvdWxkIGhh
cHBlbiB3YXkgYmVmb3JlIHRoZQ0KZ3Vlc3Qgd291bGQgaXNzdWUgYW55IGh5cGVyY2FsbCwg
c28gSSBndWVzcyB0aGUgbGF0Y2hpbmcgbmVlZHMgdG8gaGFwcGVuDQpieSBvdGhlciBtZWFu
cyBhbnl3YXkuIE9yIHdvdWxkIHlvdSB3YW50IHRvIHJlZ2lzdGVyIHRoZSBoeXBlcmNhbGwg
cGFnZQ0Kd2l0aG91dCBldmVyIGludGVuZGluZyB0byB1c2UgaXQ/DQoNCg0KSnVlcmdlbg0K

--------------Kd70v4fuM69COeWUhTNOl0ty
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Kd70v4fuM69COeWUhTNOl0ty--

--------------XZSu9UgLyITEawqz3bzsrt5z--

--------------wp0qlsW66f4Ym0lcgmYGpqv0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd2n8sFAwAAAAAACgkQsN6d1ii/Ey+L
lAgAn+fIhEjUYurkgBAivjBO694YEf7TyDEK+2OkOJzVZHnswXXgeFXAPcC8ztKTHperiCVkHumW
9AYeT+viZlCYlspgSGSdSKnhOrZ999iC0NxD3qUZDcKbH/ZGHdEnwZNEVh71BYeAANE+40h654zy
fk9jGOsveaakcdj2TpNu4I1PoePszaI7PjNPmVa4/pOuJD9cqF9GERP4aqRW35YxRwERd+GPcBd3
jYQySoR41YFKrT4t3b4SzSqb16Whf3YpP7xRYxm3AqLGDsPgaXdKhiRYMOfn4Vc84dL+1E0FEaMY
1RPwI9+7tSIiwIfsoWq2FcxUPmSMsuAXmqIKZH+G4w==
=PsMF
-----END PGP SIGNATURE-----

--------------wp0qlsW66f4Ym0lcgmYGpqv0--

