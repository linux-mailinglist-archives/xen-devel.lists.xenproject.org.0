Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879419FF9DF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 14:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863930.1275299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTLPa-0001zo-4B; Thu, 02 Jan 2025 13:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863930.1275299; Thu, 02 Jan 2025 13:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTLPa-0001wg-07; Thu, 02 Jan 2025 13:38:54 +0000
Received: by outflank-mailman (input) for mailman id 863930;
 Thu, 02 Jan 2025 13:38:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDYY=T2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tTLPY-0001av-Df
 for xen-devel@lists.xen.org; Thu, 02 Jan 2025 13:38:52 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5a010c0-c90e-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 14:38:49 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so8970529f8f.0
 for <xen-devel@lists.xen.org>; Thu, 02 Jan 2025 05:38:49 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acb17sm37661535f8f.97.2025.01.02.05.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2025 05:38:48 -0800 (PST)
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
X-Inumbo-ID: e5a010c0-c90e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735825129; x=1736429929; darn=lists.xen.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w8tNcqAfbc/w5Y825OEalan1QasEQ19JbuEFRiq05JU=;
        b=ExNgCf6meqw1vc9QbG5Ikrk/Rwx31qwO+eR2T7WfQAKxX/GHa+BFUWoGAgMdSTqeMM
         vY/NC75RhlYBIp/QM+u+mEEcC9k7VjtDBFjeHAzCkU/h51x4CPCgHWbeGORogpGTlVmY
         9m3TV0BU+gr3wd2VNIE27a83bkWghgsU2Fz+KDNPO6x0idyJDcr5FX4wS6hUJd8rL+sH
         hS2m8PHdc0ro0WjUbE/RY5xwx4XMdiwdv3TbEvQR9HkG4ml99/Fx4kOH5kBbkbULg8i3
         NGOVmeobk5i+P5U9DMsFDrvYUiyquoaehJNW4MmcLqGNz1XDELIalaFByHqqgCNUEcNg
         cBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735825129; x=1736429929;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8tNcqAfbc/w5Y825OEalan1QasEQ19JbuEFRiq05JU=;
        b=FPqguJustIaIRll8Oj315rBFhxqrwyODTDTjko6D9d1somzShmh+q9l5YJc2XXQVns
         b+i3krtPYSGm+S8jcAM/QbPKT0Y1VQzT/vLVZddIEYgKeJECUvUEC+0LbpW2VS3U64/V
         IJDirD7mOOcOp3QYPgQGHT+l2iCVsptTq2TYfEfdrZKCQBz8L/fR99APooCRl8PGREqb
         0Fk+ePxOZwK9YnHHxG2jaOEINMmfIhxzPq5qkcSu5rHrmJ/I0JgUrrSuj9UR8ksNwxRW
         bi77rUKKO5HKDoPeTX0G/8uKd5pofVLP6ubLOh2gUkxwy6IpKTDKpsytubqPDFbRMMZj
         h0UA==
X-Forwarded-Encrypted: i=1; AJvYcCWbwXo9Sl6To0jKjqqZsMh4uJWvFPcbshd4P0l5tjzdJ6Hy1SChB9yo+L3CiIm4zd5QtNHXBcjF+cM=@lists.xen.org
X-Gm-Message-State: AOJu0YyVSVZ8tXBvDC/els95ZI1KJYMFxAzetVoqoNI0eRF+ZR3T1f3S
	d4MKlYcdM//YBcFn8/w561/8CZhotx7Pxw+sW8NMq0B0oJ4XAlmya3SgSNxruos=
X-Gm-Gg: ASbGncs320GwtjWCXOb8sB4gv3QoUufwBCUUDdqPUe6wJMGEE1LCI5GAgycj9VzDA6K
	xYPc/cI755j+tIIXTHN0QRP7u7XE9r23nqa9q39V6m6no8P/YMaeisQ2PSd4BFlK3sDqTbdtKQZ
	rtvyOyoDxVOsEwEzpdSKlkjH7A9q5S+iw+z/xHX+qrGtOUuCDYqLUU1fXGcitgtt+MdHKZ0grtk
	Y6OpV2vkjuOKRp1ZqHlOPJsFdwvLJ5bRbHK7ps5abk3wmE1GnMUUOqD9RoOgB2JeiHzGeloShWf
	IvXobIAokvmfnKn5QrIC0EfuexJZmnUmPAjf2tP2L3QiSotP01BGuvgHBMEAuuEMszwWHczjVgm
	LDlNUgg==
X-Google-Smtp-Source: AGHT+IFwxrHoXgEDeadsm/UfKKeIqGBAu4U/ADiNz/gMWkKvoECR8nDq/a9C1LS0cLCmscJQPfiYKQ==
X-Received: by 2002:a5d:6486:0:b0:38a:4575:5ffd with SMTP id ffacd0b85a97d-38a45756035mr20097305f8f.45.1735825128579;
        Thu, 02 Jan 2025 05:38:48 -0800 (PST)
Message-ID: <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
Date: Thu, 2 Jan 2025 14:38:47 +0100
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
In-Reply-To: <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0uxjyXf9Ftc0bjwaQOQdIpii"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0uxjyXf9Ftc0bjwaQOQdIpii
Content-Type: multipart/mixed; boundary="------------xcT6P0TDFNtkkbHlvsbrcSgE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 "Xen.org security team" <security@xen.org>, xen-announce@lists.xen.org,
 xen-devel@lists.xen.org, xen-users@lists.xen.org,
 oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
Message-ID: <fd993f8d-280f-439a-a6a0-506e2815f281@suse.com>
Subject: Re: Xen Security Advisory 466 v3 (CVE-2024-53241) - Xen hypercall
 page unsafe against speculative attacks
References: <E1tNWXG-00E268-2p@xenbits.xenproject.org>
 <54c892eded2b4ebdda8ee1085c383178f44414ad.camel@infradead.org>
 <a3031e7d-fe9d-4db8-8ccd-923165c9af72@suse.com>
 <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
In-Reply-To: <fc4c45ea86567ef0c46d7e5a20e8abffa75cc4ec.camel@infradead.org>
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

--------------xcT6P0TDFNtkkbHlvsbrcSgE
Content-Type: multipart/mixed; boundary="------------gPCxleBjg0dVyFbMrKZisqpt"

--------------gPCxleBjg0dVyFbMrKZisqpt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDEuMjUgMTM6NTMsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4gT24gVGh1LCAy
MDI1LTAxLTAyIGF0IDEzOjA3ICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24g
MjMuMTIuMjQgMTU6MjQsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToNCj4+PiBPbiBUdWUsIDIw
MjQtMTItMTcgYXQgMTI6MTggKzAwMDAsIFhlbi5vcmcgc2VjdXJpdHkgdGVhbSB3cm90ZToN
Cj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhlbiBTZWN1cml0eSBBZHZpc29y
eSBDVkUtMjAyNC01MzI0MSAvIFhTQS00NjYNCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmVyc2lvbiAz
DQo+Pj4+DQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgWGVuIGh5cGVyY2FsbCBwYWdlIHVu
c2FmZSBhZ2FpbnN0IHNwZWN1bGF0aXZlIGF0dGFja3MNCj4+Pj4NCj4+Pj4gVVBEQVRFUyBJ
TiBWRVJTSU9OIDMNCj4+Pj4gPT09PT09PT09PT09PT09PT09PT0NCj4+Pj4NCj4+Pj4gVXBk
YXRlIG9mIHBhdGNoIDUsIHB1YmxpYyByZWxlYXNlLg0KPj4+DQo+Pj4gQ2FuJ3Qgd2UgZXZl
biB1c2UgdGhlIGh5cGVyY2FsbCBwYWdlIGVhcmx5IGluIGJvb3Q/IFN1cmVseSB3ZSBoYXZl
IHRvDQo+Pj4ga25vdyB3aGV0aGVyIHdlJ3JlIHJ1bm5pbmcgb24gYW4gSW50ZWwgb3IgQU1E
IENQVSBiZWZvcmUgd2UgZ2V0IHRvIHRoZQ0KPj4+IHBvaW50IHdoZXJlIHdlIGNhbiBlbmFi
bGUgYW55IG9mIHRoZSBuZXcgY29udHJvbC1mbG93IGludGVncml0eQ0KPj4+IHN1cHBvcnQ/
IERvIHdlIG5lZWQgdG8ganVtcCB0aHJvdWdoIHRob3NlIGhvb3BzIGRvIGRvIHRoYXQgZWFy
bHkNCj4+PiBkZXRlY3Rpb24gYW5kIHNldHVwPw0KPj4NCj4+IFRoZSBkb3duc2lkZSBvZiB0
aGlzIGFwcHJvYWNoIHdvdWxkIGJlIHRvIGhhdmUgYW5vdGhlciB2YXJpYW50IHRvIGRvDQo+
PiBoeXBlcmNhbGxzLiBTbyB5b3UnZCBoYXZlIHRvIHJlcGxhY2UgdGhlIHZhcmlhbnQgYmVp
bmcgYWJsZSB0byB1c2UgQU1EDQo+PiBvciBJTlRFTCBzcGVjaWZpYyBpbnN0cnVjdGlvbnMg
d2l0aCBhIGZ1bmN0aW9uIGRvaW5nIHRoZSBoeXBlcmNhbGwgdmlhDQo+PiB0aGUgaHlwZXJj
YWxsIHBhZ2UuDQo+IA0KPiBZb3UnZCBwcm9iYWJseSBzdGFydCB3aXRoIHRoZSBoeXBlcmNh
bGwgZnVuY3Rpb24ganVzdCBqdW1waW5nIGRpcmVjdGx5DQo+IGludG8gdGhlIHRlbXBvcmFy
eSBoeXBlcmNhbGwgcGFnZSBkdXJpbmcgZWFybHkgYm9vdCwgYW5kIHRoZW4geW91J2QNCj4g
dXBkYXRlIHRoZW0gdG8gdXNlIHRoZSBuYXRpdmVseSBwcmVwYXJlZCB2bWNhbGwvdm1tY2Fs
bCB2ZXJzaW9uIGxhdGVyLg0KPiANCj4gQWxsIHRoZSBjb21wbGV4aXR5IG9mIHBhdGNoaW5n
IGFuZCBDUFUgZGV0ZWN0aW9uIGluIGVhcmx5IGJvb3Qgc2VlbXMgdG8NCj4gYmUgc29tZXdo
YXQgZ3JhdHVpdG91cyBhbmQgZXZlbiBjb3VudGVyLXByb2R1Y3RpdmUgZ2l2ZW4gdGhlIGNo
YW5nZSBpdA0KPiBpbnRyb2R1Y2VzIHRvIDY0LWJpdCBsYXRjaGluZy4NCj4gDQo+IEFuZCBl
dmVuIGlmIHRoZSA2NC1iaXQgbGF0Y2ggZG9lcyBoYXBwZW4gd2hlbiBIVk1fUEFSQU1fQ0FM
TEJBQ0tfSVJRIGlzDQo+IHNldCwgaXNuJ3QgdGhhdCBwb3RlbnRpYWxseSBhIGxvdCBsYXRl
ciBpbiBib290PyBYZW4gd2lsbCBiZSB0cmVhdGluZw0KPiB0aGlzIGd1ZXN0IGFzIDMyLWJp
dCB1bnRpbCB0aGVuLCBzbyB3b24ndCBhbGwgdGhlIHZjcHVfaW5mbyBhbmQNCj4gcnVuc3Rh
dGUgc3RydWN0dXJlcyBiZSB3cm9uZyBldmVuIGFzIHRoZSBzZWNvbmRhcnkgQ1BVcyBhcmUg
YWxyZWFkeSB1cA0KPiBhbmQgcnVubmluZz8NCg0KV2hhdCBJIGRvbid0IGdldCBpcyB3aHkg
dGhpcyBsYXRjaGluZyBpc24ndCBkb25lIHdoZW4gdGhlIHNoYXJlZCBpbmZvDQpwYWdlIGlz
IG1hcHBlZCBpbnRvIHRoZSBndWVzdCB2aWEgdGhlIFhFTk1BUFNQQUNFX3NoYXJlZF9pbmZv
IGh5cGVyY2FsbA0Kb3IgbWF5YmUgYWRkaXRpb25hbGx5IHdoZW4gVkNQVU9QX3JlZ2lzdGVy
X3J1bnN0YXRlX21lbW9yeV9hcmVhIGlzIGJlaW5nDQp1c2VkIGJ5IHRoZSBndWVzdC4NCg0K
VGhlc2UgYXJlIHRoZSBlYXJsaWVzdCBwb3NzaWJsZSBjYXNlcyB3aGVyZSB0aGUgZ3Vlc3Qg
aXMgYWJsZSB0byBhY2Nlc3MNCnRoaXMgZGF0YS4NCg0KPiANCj4+IEknbSBwbGFubmluZyB0
byBzZW5kIHBhdGNoZXMgZm9yIFhlbiBhbmQgdGhlIGtlcm5lbCB0byBhZGQgQ1BVSUQgZmVh
dHVyZQ0KPj4gYml0cyBpbmRpY2F0aW5nIHdoaWNoIGluc3RydWN0aW9uIHRvIHVzZS4gVGhp
cyB3aWxsIG1ha2UgbGlmZSBtdWNoIGVhc2llci4NCj4+DQo+Pj4gRW5hYmxpbmcgdGhlIGh5
cGVyY2FsbCBwYWdlIGlzIGFsc28gb25lIG9mIHRoZSB0d28gcG9pbnRzIHdoZXJlIFhlbg0K
Pj4+IHdpbGwgJ2xhdGNoJyB0aGF0IHRoZSBndWVzdCBpcyA2NC1iaXQsIHdoaWNoIGFmZmVj
dHMgdGhlIGxheW91dCBvZiB0aGUNCj4+PiBzaGFyZWRfaW5mbywgdmNwdV9pbmZvIGFuZCBy
dW5zdGF0ZSBzdHJ1Y3R1cmVzLg0KPj4+DQo+Pj4gVGhlIG90aGVyIHN1Y2ggbGF0Y2hpbmcg
cG9pbnQgaXMgd2hlbiB0aGUgZ3Vlc3Qgc2V0cw0KPj4+IEhWTV9QQVJBTV9DQUxMQkFDS19J
UlEsIGFuZCBJICp0aGluayogdGhhdCBzaG91bGQgd29yayBpbiBhbGwNCj4+PiBpbXBsZW1l
bnRhdGlvbnMgb2YgdGhlIFhlbiBBQkkgKGluY2x1ZGluZyBRRU1VL0tWTSBhbmQgRUMyKS4g
QnV0IHdvdWxkDQo+Pj4gd2FudCB0byB0ZXN0Lg0KPj4+DQo+Pj4gQnV0IHBlcmhhcHMgaXQg
d291bGRuJ3QgaHVydCBmb3IgbWF4aW1hbCBjb21wYXRpYmlsaXR5IGZvciBMaW51eCB0byBz
ZXQNCj4+PiB0aGUgaHlwZXJjYWxsIHBhZ2UgKmFueXdheSosIGV2ZW4gaWYgTGludXggZG9l
c24ndCB0aGVuIHVzZSBpdCDigJQgb3INCj4+PiBvbmx5IHVzZXMgaXQgZHVyaW5nIGVhcmx5
IGJvb3Q/DQo+Pg0KPj4gSSdtIHNlZWluZyBwb3RlbnRpYWwgcHJvYmxlbXMgd2l0aCB0aGF0
IGFwcHJvYWNoIHdoZW4gc29tZW9uZSBpcyB1c2luZw0KPj4gYW4gb3V0LW9mLXRyZWUgbW9k
dWxlIGRvaW5nIGh5cGVyY2FsbHMuDQo+Pg0KPj4gV2l0aCBoYXZpbmcgdGhlIGh5cGVyY2Fs
bCBwYWdlIHByZXNlbnQgc3VjaCBhIG1vZHVsZSB3b3VsZCBhZGQgYSB3YXkgdG8gZG8NCj4+
IHNwZWN1bGF0aXZlIGF0dGFja3MsIHdoaWxlIGRlbGV0aW5nIHRoZSBoeXBlcmNhbGwgcGFn
ZSB3b3VsZCByZXN1bHQgaW4gYQ0KPj4gZmFpbHVyZSB0cnlpbmcgdG8gbG9hZCBzdWNoIGEg
bW9kdWxlLg0KPiANCj4gSXMgdGhhdCBhIHJlc3BvbnNlIHRvIHRoZSBvcmlnaW5hbCBwYXRj
aCBzZXJpZXMsIG9yIHRvIG15IHN1Z2dlc3Rpb24/DQo+IA0KPiBJZiB3ZSB0ZW1wb3Jhcmls
eSBhc2sgWGVuIHRvIHBvcHVsYXRlIGEgaHlwZXJjYWxsIHBhZ2Ugd2hpY2ggaXMgdXNlZA0K
PiBkdXJpbmcgZWFybHkgYm9vdCAob3IgZXZlbiBpZiBpdCdzICpub3QqIHVzZWQsIGFuZCBv
bmx5IHVzZWQgdG8gbWFrZQ0KPiBzdXJlIFhlbiBsYXRjaGVzIDY0LWJpdCBtb2RlIGVhcmx5
KS4uLiBJIGRvbid0IHNlZSB3aHkgdGhhdCBtYWtlcyBhbnkNCj4gZGlmZmVyZW5jZSB0byBt
b2R1bGVzLiBJIHdhc24ndCBzdWdnZXN0aW5nIHdlIGtlZXAgaXQgYXJvdW5kIGFuZA0KPiAq
ZXhwb3J0KiBpdC4NCg0KQWgsIEkgZGlkbid0IHJlYWQgeW91ciBzdWdnZXN0aW9uIHRoYXQg
d2F5Lg0KDQpTdGlsbCBJIGJlbGlldmUgdXNpbmcgdGhlIGh5cGVyY2FsbCBwYWdlIGlzIG5v
dCBhIGdvb2QgaWRlYSwgZXNwZWNpYWxseSBhcw0Kd2UnZCBhZGQgYSBoYXJkIGRlcGVuZGVu
Y3kgb24gdGhlIGFiaWxpdHkgdG8gZW5hYmxlIENGSSBpbiB0aGUga2VybmVsIHJlbGF0ZWQN
CnRvIHRoZSBzd2l0Y2ggZnJvbSB0aGUgaHlwZXJjYWxsIHBhZ2UgdG8gdGhlIG5ldyBkaXJl
Y3QgaHlwZXJjYWxsIGZ1bmN0aW9ucy4NCg0KDQpKdWVyZ2VuDQo=
--------------gPCxleBjg0dVyFbMrKZisqpt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gPCxleBjg0dVyFbMrKZisqpt--

--------------xcT6P0TDFNtkkbHlvsbrcSgE--

--------------0uxjyXf9Ftc0bjwaQOQdIpii
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmd2lucFAwAAAAAACgkQsN6d1ii/Ey9f
LAgAkYLiDHc3xv4gBMFKWXZr4io5FgmuhYLEBB+ggxjb/cuRtPlAbWzdzPod7+xApbYxsIE9UkCa
dlJ3MFqwl1yyhdjw+R7P4fh86NDcNjShCZtq6Vsz50XA81zgLpvNh84kz4ASzl/Vm8/x0Y5KNZnf
bvfK1bMqSv7hloyXdmS/X5skBNypUapnMOxSdR3A8yaDLKJtBNpupV+ZJMcPdSOVcSHT3LlAVTNN
384nEh5rLq79Ec401GJW121gjuxKY46pH9DLEcXTQt+KaSjpxKsVi57YuQOZcLPV9KmAS87gABLO
Nm0fQHR8Eb/1YAV5WULAfGwiZbErdMTkW/J3VxkcHw==
=e/Wa
-----END PGP SIGNATURE-----

--------------0uxjyXf9Ftc0bjwaQOQdIpii--

