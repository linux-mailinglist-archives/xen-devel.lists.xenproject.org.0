Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013F2A23990
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 07:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879858.1290069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkg6-0000Nu-QO; Fri, 31 Jan 2025 06:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879858.1290069; Fri, 31 Jan 2025 06:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkg6-0000MS-Na; Fri, 31 Jan 2025 06:38:58 +0000
Received: by outflank-mailman (input) for mailman id 879858;
 Fri, 31 Jan 2025 06:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Snzw=UX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tdkg4-0000MK-RK
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 06:38:56 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b350e99-df9e-11ef-a0e6-8be0dac302b0;
 Fri, 31 Jan 2025 07:38:55 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so17607665e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 22:38:55 -0800 (PST)
Received: from ?IPV6:2003:e5:8731:2800:842d:42a0:5992:3595?
 (p200300e587312800842d42a059923595.dip0.t-ipconnect.de.
 [2003:e5:8731:2800:842d:42a0:5992:3595])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245f49dsm44795305e9.35.2025.01.30.22.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 22:38:54 -0800 (PST)
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
X-Inumbo-ID: 0b350e99-df9e-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738305535; x=1738910335; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eA6vRW07J0P2LGVdUIhL5k3oNhbtfPasDGkSr4Lw8Nc=;
        b=FLObjua52EVgW28MQN0hXHJEDtXplVd/KMdJy+MIANVGuzb60mcBfAFVfiX33OpLBg
         c1qxobra4B1vB+Ry55cUm15QOgJWf3umlSUxvfRTDw5A/e/DHDw0yoCQI94fErip6vy4
         XAIlV9X/pJL1b9vfmoJI6b4lr2y+BY8FJxGQ21r8WSL19QKKPukVQ3gxhdqYRKPU0TZW
         1bHdqk2DqZgXPm35UPqZPYYdfvw7EkaLMM3ltltYuCHEiOPGzXNj2CdikHWvew78BsJw
         tS3j1cuvro3Rh71ABH0MS6UdONy4gKczYn3u++qzARGAWu1lr29cn8iFqvpSt6rEOUMo
         UKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305535; x=1738910335;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eA6vRW07J0P2LGVdUIhL5k3oNhbtfPasDGkSr4Lw8Nc=;
        b=qwUPzpCHIOfFmspNuNcfFxtUTGJoIc/f1N+0oaitjcS5Lo36fNVJLI4o2U/bCDxcfc
         t/aHcTIHzeF5Phu/pDGJpCGtnex/bcuj/5smTYRqtWUhwQ2NxIi33C/VBf9CtJbQQCEk
         f8REUJPNc/uMuObmEvCuzo7nac5Z9morJMXliFhgOyqxxrX30YaA+J71ImG7glLxjvZg
         xi46xH7vvjkfsCLVs6yA3kCxCMFAqESLWw4swTuccw4ekTu9PxE3ZoNeBcsfm7O8yiji
         rehdUu4O5jefHwzeGSfIBs2++QR5CYmL5Q0lPTJEpGcWSQ7GwxSQKWv2t0lkLrmISALD
         XWog==
X-Forwarded-Encrypted: i=1; AJvYcCWTsQE9+NkxCETk8UtDfpx2bnbUK96IWDKAHeLxctBtQsdU6qKkyhYQmebQoyQg6j5o1Ov4HmWTPMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjlLQEAUtAimUSOAgcm/jxBO55/dLIdLP4X9Ii+kLjW9b8B8Jw
	BeHaFi4NHjLYG5xNpSKToIPFxLnogjdZpOhbZDia690sVwtSMuXtSKnULlStyoA=
X-Gm-Gg: ASbGncv6IDUxbMuch+7x79UnF1vbTJz2n4dP26iioP4kY+Jpgyg0Xbfg33UB3TQHdyh
	hXSUPof111NiX4TQ7FgcZbVnFE3FdkZI8fVWXvnyBFMkJoRubBi1d3l853cYZKqC3Oxx/qk4tDa
	+j59aZwdZK9iSkfqu04ME/uGrmCYDODQDgfex57/DTy+17zMojqS319vvdgEW/wn3Sa5UKM3xct
	j5Gq6MBr0VuZI+ebk4s0OAHSSHmb9Bk18D+3mXoiLsaf7oWqIaFgPiJqV3PBV3C0v9eBTrEFhhB
	1xhZRr71x6evnq5JXVPP3Xndsv9msY2tKPMCMiP514/WIvXdCtDWA4HOgslFc4ZJibbWgHPqNNa
	WnqoDSgfvPjVKUKBbynpNqZXqJdoemleLU3ku3aNy
X-Google-Smtp-Source: AGHT+IEEn+FHcAe/JT+VUko98QB86zRnMg/SibtguW3HIvwnvCESdwF1M4oZ9B5MKY1MBcHhIiD7kw==
X-Received: by 2002:a05:600c:19cc:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-438e298fea7mr47974095e9.4.1738305535279;
        Thu, 30 Jan 2025 22:38:55 -0800 (PST)
Message-ID: <9316269c-dbc4-45e4-a580-082edcf3a65d@suse.com>
Date: Fri, 31 Jan 2025 07:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
 <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
 <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
 <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>
 <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
 <alpine.DEB.2.22.394.2501301226330.11632@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501301226330.11632@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gBR1om3a0aT0VEghtIh1tEBw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gBR1om3a0aT0VEghtIh1tEBw
Content-Type: multipart/mixed; boundary="------------tBXvzTgiiczaSsTA0JKdPJqT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
Message-ID: <9316269c-dbc4-45e4-a580-082edcf3a65d@suse.com>
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
 <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
 <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
 <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com>
 <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
 <alpine.DEB.2.22.394.2501301226330.11632@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2501301226330.11632@ubuntu-linux-20-04-desktop>

--------------tBXvzTgiiczaSsTA0JKdPJqT
Content-Type: multipart/mixed; boundary="------------QBBmk1MGxChaWIAqHSG78WQf"

--------------QBBmk1MGxChaWIAqHSG78WQf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDEuMjUgMjE6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gVGh1
LCAzMCBKYW4gMjAyNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IENhbiB5b3UgdHJ5IHRo
ZSBhdHRhY2hlZCBwYXRjaCwgcGxlYXNlPyBJIGRvbid0IGhhdmUgYSBzeXN0ZW0gYXQgaGFu
ZA0KPj4gc2hvd2luZyB0aGUgcHJvYmxlbS4NCj4+DQo+PiAgRnJvbSBjZmY0M2U5OTdmNzlh
OTVkYzQ0ZTAyZGViYWVhZmU1ZjEyN2Y0MGJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0K
Pj4gRnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gRGF0ZTogVGh1
LCAzMCBKYW4gMjAyNSAwOTo1Njo1NyArMDEwMA0KPj4gU3ViamVjdDogW1BBVENIXSB4ODYv
eGVuOiBhbGxvdyBsYXJnZXIgY29udGlndW91cyBtZW1vcnkgcmVnaW9ucyBpbiBQViBndWVz
dHMNCj4+DQo+PiBUb2RheSBhIFBWIGd1ZXN0IChpbmNsdWRpbmcgZG9tMCkgY2FuIGNyZWF0
ZSAyTUIgY29udGlndW91cyBtZW1vcnkNCj4+IHJlZ2lvbnMgZm9yIERNQSBidWZmZXJzIGF0
IG1heC4gVGhpcyBoYXMgbGVkIHRvIHByb2JsZW1zIGF0IGxlYXN0DQo+PiB3aXRoIHRoZSBt
ZWdhcmFpZF9zYXMgZHJpdmVyLCB3aGljaCB3YW50cyB0byBhbGxvY2F0ZSBhIDIuM01CIERN
QQ0KPj4gYnVmZmVyLg0KPj4NCj4+IFRoZSBsaW1pdGluZyBmYWN0b3IgaXMgdGhlIGZyYW1l
IGFycmF5IHVzZWQgdG8gZG8gdGhlIGh5cGVyY2FsbCBmb3INCj4+IG1ha2luZyB0aGUgbWVt
b3J5IGNvbnRpZ3VvdXMsIHdoaWNoIGhhcyA1MTIgZW50cmllcyBhbmQgaXMganVzdCBhDQo+
PiBzdGF0aWMgYXJyYXkgaW4gbW11X3B2LmMuDQo+Pg0KPj4gSW4gY2FzZSBhIGNvbnRpZ3Vv
dXMgbWVtb3J5IGFyZWEgbGFyZ2VyIHRoYW4gdGhlIGluaXRpYWxseSBzdXBwb3J0ZWQNCj4+
IDJNQiBpcyByZXF1ZXN0ZWQsIGFsbG9jYXRlIGEgbGFyZ2VyIGJ1ZmZlciBmb3IgdGhlIGZy
YW1lIGxpc3QuIE5vdGUNCj4+IHRoYXQgc3VjaCBhbiBhbGxvY2F0aW9uIGlzIHRyaWVkIG9u
bHkgYWZ0ZXIgbWVtb3J5IG1hbmFnZW1lbnQgaGFzIGJlZW4NCj4+IGluaXRpYWxpemVkIHBy
b3Blcmx5LCB3aGljaCBpcyB0ZXN0ZWQgdmlhIHRoZSBlYXJseV9ib290X2lycXNfZGlzYWJs
ZWQNCj4+IGZsYWcuDQo+Pg0KPj4gRml4ZXM6IDlmNDBlYzg0YTc5NyAoInhlbi9zd2lvdGxi
OiBhZGQgYWxpZ25tZW50IGNoZWNrIGZvciBkbWEgYnVmZmVycyIpDQo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IE5vdGUg
dGhhdCB0aGUgIkZpeGVzOiIgdGFnIGlzIG5vdCByZWFsbHkgY29ycmVjdCwgYXMgdGhhdCBw
YXRjaCBkaWRuJ3QNCj4+IGludHJvZHVjZSB0aGUgcHJvYmxlbSwgYnV0IHJhdGhlciBtYWRl
IGl0IHZpc2libGUuIE9UT0ggaXQgaXMgdGhlIGJlc3QNCj4+IGluZGljYXRvciB3ZSBoYXZl
IHRvIGlkZW50aWZ5IGtlcm5lbCB2ZXJzaW9ucyB0aGlzIHBhdGNoIHNob3VsZCBiZQ0KPj4g
YmFja3BvcnRlZCB0by4NCj4+IC0tLQ0KPj4gICBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgfCA0
NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9hcmNoL3g4Ni94ZW4vbW11
X3B2LmMNCj4+IGluZGV4IDU1YTQ5OTZkMGMwNC4uNjJhZWMyOWI4MTc0IDEwMDY0NA0KPj4g
LS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5jDQo+PiArKysgYi9hcmNoL3g4Ni94ZW4vbW11
X3B2LmMNCj4+IEBAIC0yMjAwLDggKzIyMDAsMTAgQEAgdm9pZCBfX2luaXQgeGVuX2luaXRf
bW11X29wcyh2b2lkKQ0KPj4gICB9DQo+PiAgIA0KPj4gICAvKiBQcm90ZWN0ZWQgYnkgeGVu
X3Jlc2VydmF0aW9uX2xvY2suICovDQo+PiAtI2RlZmluZSBNQVhfQ09OVElHX09SREVSIDkg
LyogMk1CICovDQo+PiAtc3RhdGljIHVuc2lnbmVkIGxvbmcgZGlzY29udGlnX2ZyYW1lc1sx
PDxNQVhfQ09OVElHX09SREVSXTsNCj4+ICsjZGVmaW5lIE1JTl9DT05USUdfT1JERVIgOSAv
KiAyTUIgKi8NCj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IGRpc2NvbnRpZ19mcmFtZXNfb3Jk
ZXIgPSBNSU5fQ09OVElHX09SREVSOw0KPj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGRpc2Nv
bnRpZ19mcmFtZXNfZWFybHlbMVVMIDw8IE1JTl9DT05USUdfT1JERVJdOw0KPj4gK3N0YXRp
YyB1bnNpZ25lZCBsb25nICpkaXNjb250aWdfZnJhbWVzID0gZGlzY29udGlnX2ZyYW1lc19l
YXJseTsNCj4+ICAgDQo+PiAgICNkZWZpbmUgVk9JRF9QVEUgKG1mbl9wdGUoMCwgX19wZ3By
b3QoMCkpKQ0KPj4gICBzdGF0aWMgdm9pZCB4ZW5femFwX3Bmbl9yYW5nZSh1bnNpZ25lZCBs
b25nIHZhZGRyLCB1bnNpZ25lZCBpbnQgb3JkZXIsDQo+PiBAQCAtMjMxOSwxOCArMjMyMSw0
NCBAQCBpbnQgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbihwaHlzX2FkZHJfdCBwc3Rh
cnQsIHVuc2lnbmVkIGludCBvcmRlciwNCj4+ICAgCQkJCSB1bnNpZ25lZCBpbnQgYWRkcmVz
c19iaXRzLA0KPj4gICAJCQkJIGRtYV9hZGRyX3QgKmRtYV9oYW5kbGUpDQo+PiAgIHsNCj4+
IC0JdW5zaWduZWQgbG9uZyAqaW5fZnJhbWVzID0gZGlzY29udGlnX2ZyYW1lcywgb3V0X2Zy
YW1lOw0KPj4gKwl1bnNpZ25lZCBsb25nICppbl9mcmFtZXMsIG91dF9mcmFtZTsNCj4+ICsJ
dW5zaWduZWQgbG9uZyAqbmV3X2FycmF5LCAqb2xkX2FycmF5Ow0KPj4gICAJdW5zaWduZWQg
bG9uZyAgZmxhZ3M7DQo+PiAgIAlpbnQgICAgICAgICAgICBzdWNjZXNzOw0KPj4gICAJdW5z
aWduZWQgbG9uZyB2c3RhcnQgPSAodW5zaWduZWQgbG9uZylwaHlzX3RvX3ZpcnQocHN0YXJ0
KTsNCj4+ICAgDQo+PiAtCWlmICh1bmxpa2VseShvcmRlciA+IE1BWF9DT05USUdfT1JERVIp
KQ0KPj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+PiArCWlmICh1bmxpa2VseShvcmRlciA+IGRp
c2NvbnRpZ19mcmFtZXNfb3JkZXIpKSB7DQo+PiArCQlpZiAoZWFybHlfYm9vdF9pcnFzX2Rp
c2FibGVkKQ0KPj4gKwkJCXJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gKwkJbmV3X2FycmF5
ID0gdm1hbGxvYyhzaXplb2YodW5zaWduZWQgbG9uZykgKiAoMVVMIDw8IG9yZGVyKSk7DQo+
PiArDQo+PiArCQlpZiAoIW5ld19hcnJheSkNCj4+ICsJCQlyZXR1cm4gLUVOT01FTTsNCj4+
ICsNCj4+ICsJCXNwaW5fbG9ja19pcnFzYXZlKCZ4ZW5fcmVzZXJ2YXRpb25fbG9jaywgZmxh
Z3MpOw0KPj4gKw0KPj4gKwkJaWYgKG9yZGVyID4gZGlzY29udGlnX2ZyYW1lc19vcmRlcikg
ew0KPiANCj4gDQo+IFRoaXMgc2Vjb25kIGlmIGNoZWNrIHNob3VsZCBub3QgYmUgbmVlZGVk
IGJlY2F1c2UgaXQgaXMgdGhlIHNhbWUgYXMgdGhlDQo+IG91dGVyIGlmIGNoZWNrLg0KDQpJ
dCBpcyBuZWVkZWQsIGFzIGluc2lkZSB0aGUgbG9ja2VkIHJlZ2lvbiBJIG5lZWQgdG8gdmVy
aWZ5IHRoYXQgbm8NCmNvbmN1cnJlbnQgY2FsbCBkaWQgYWxyZWFkeSB1cGRhdGUgdGhlIGJ1
ZmZlciwgbWF5YmUgd2l0aCBhbiBldmVuDQpsYXJnZXIgc2l6ZS4NCg0KDQpKdWVyZ2VuDQo=

--------------QBBmk1MGxChaWIAqHSG78WQf
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

--------------QBBmk1MGxChaWIAqHSG78WQf--

--------------tBXvzTgiiczaSsTA0JKdPJqT--

--------------gBR1om3a0aT0VEghtIh1tEBw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmecb/0FAwAAAAAACgkQsN6d1ii/Ey/e
wwgAmKFq0zc/HtH2xmd/vkNJVx7IeIINZUxnmHRrllzFjO4AKfjZ3wnT8HZGmodlE7cifdCajkAl
vXvlmEeL0YAW7XSrk/wj5Hq0cvARfM+Z78Mo7pJRgldndIBecks4c4dwXuDi5LRRHePgqGIlDS6T
nOnXyqf9F+c7c8uBU4FDwBVfNm2J+LNkNlLgNPBao6QKD8Wpv4kcPJtRxRRcCW7efD+pU6axqYU6
ZwYY6W8RTTqdZBeIiSfbIMqQeC6l3LG8+AP8+UVYIxduopspUKbiubGGHQh4Z61Mgz86lCd1wChc
11hxxbFRwz9h9Fe5p3UKrcO5VQDdo0ImkCB+gMyQoA==
=46NW
-----END PGP SIGNATURE-----

--------------gBR1om3a0aT0VEghtIh1tEBw--

