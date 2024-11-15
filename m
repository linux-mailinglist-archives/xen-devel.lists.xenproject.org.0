Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B29CD816
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 07:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836910.1252819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBq5w-0000GC-1G; Fri, 15 Nov 2024 06:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836910.1252819; Fri, 15 Nov 2024 06:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBq5v-0000DV-Ut; Fri, 15 Nov 2024 06:46:15 +0000
Received: by outflank-mailman (input) for mailman id 836910;
 Fri, 15 Nov 2024 06:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tBq5u-0000DM-OI
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 06:46:14 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c44a7a0-a31d-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 07:46:10 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53da5511f3cso1432431e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 22:46:10 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da28bbddsm46682445e9.30.2024.11.14.22.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 22:46:08 -0800 (PST)
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
X-Inumbo-ID: 4c44a7a0-a31d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzAiLCJoZWxvIjoibWFpbC1sZjEteDEzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRjNDRhN2EwLWEzMWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjUzMTcwLjIwMTE0OCwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731653169; x=1732257969; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LHcWU1fnMJKPmn1xtu4UO2KMa4bnNO8B+bez41rDJbs=;
        b=fzlBLr6vRtQaVhzslf4ErF99jeOKek3Ae24/Jcos/MECUKGK/cuGswcVDTvmQg9fYz
         KDMjmkBdeYwK63PyHZlRNzR3/ULyq4Wil1m3EcNwUK/TWdpLsTX15py5C+YaUi2UTq0D
         86LRNbm7ifE9O9m4PZhlwCX6Xdnb4v++oVdnVSPTDrKMeLKy4oM2plUrlIpRMHhKi95+
         Yh4/FJHWPNQLI6kdTalr2ohTHvitTw18NXLHg1iQAvxpuvsnjvbEAMVOE6UuS4jaZGiQ
         ZwPbaVoFdk77CjtlVVzsmKDMo3NGxX879qBqnh72moRYBkuvDwdRu2XgA+Gel+Bwz/CA
         KFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731653169; x=1732257969;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LHcWU1fnMJKPmn1xtu4UO2KMa4bnNO8B+bez41rDJbs=;
        b=mU6BOOCB+GwkcY27dS0Ap/HKr/Md+y50PSRsX+gt06jJOlMg0qtzUyOAr/GS5chBRm
         eFOw95ah5KIuxig+4MFFgePrIJHODahgHAvNg0dfKsmdX9N2W8HgFvhrc5zZhKLsdZTa
         F6f5lkkxpa0Mw994qO2g2EUMfWebEQAJJK5ZQbcaMbjizfRlFkjVkCZZX/eK/AVN6ajM
         yDIgiQyc9tUQzRznwkPdAZK/1k5OI7kF3nqTFPru8Va9f6041KKX3OInRtfxfCc7RIvw
         d0ado50UhgrY/wfFaM8YeQJUZB/Dk3yXICm/chh+3CBaKRgbC/ROWyl31rG64pdTXG2h
         7eEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9R1F3egGCLD2N2khEcBVM+lR60cdEjOW6Ctl9p0LE4uExDfzQfr/GN8We+MDw5rSmTlqiAjDNtGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+dtz7lNsTtkzed9cYnRhBoCAe0oLbvt2BaBoE4rWm/cj7wuGA
	EY7kzrtXSbYktukNInC2bKcouo/k+d4UJ1FBXCNBZHj+NUmS5wsNbPBa5eNnT14=
X-Google-Smtp-Source: AGHT+IFhzmEo3Bf12ozsS7VtomVvuaWM6s6J1mEqIqrRrv75a6+PagviSvwN1rR7O29a06LXHmpUgQ==
X-Received: by 2002:a05:6512:a8b:b0:537:a745:3e with SMTP id 2adb3069b0e04-53dab3b05d0mr581913e87.45.1731653169326;
        Thu, 14 Nov 2024 22:46:09 -0800 (PST)
Message-ID: <0f6fb528-7432-42b9-8605-58d95621509d@suse.com>
Date: Fri, 15 Nov 2024 07:46:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD EPYC virtual network performances
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <ZzTg_p-8E0_jrkii@mattapan.m5p.com>
 <467e46ad-d0d0-4217-9b70-b48e3c7a1fb5@suse.com>
 <ZzaRnFLMq9OY3jj6@mattapan.m5p.com>
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
In-Reply-To: <ZzaRnFLMq9OY3jj6@mattapan.m5p.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K0OR75mBQjX9KJ6l0lFxYGyd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K0OR75mBQjX9KJ6l0lFxYGyd
Content-Type: multipart/mixed; boundary="------------14CBNCBmiqaffpvb5bWJvk0l";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <0f6fb528-7432-42b9-8605-58d95621509d@suse.com>
Subject: Re: AMD EPYC virtual network performances
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <ZzTg_p-8E0_jrkii@mattapan.m5p.com>
 <467e46ad-d0d0-4217-9b70-b48e3c7a1fb5@suse.com>
 <ZzaRnFLMq9OY3jj6@mattapan.m5p.com>
In-Reply-To: <ZzaRnFLMq9OY3jj6@mattapan.m5p.com>

--------------14CBNCBmiqaffpvb5bWJvk0l
Content-Type: multipart/mixed; boundary="------------dSX3KTKLVEQ21wFGM0aIyus0"

--------------dSX3KTKLVEQ21wFGM0aIyus0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMTEuMjQgMDE6MTEsIEVsbGlvdHQgTWl0Y2hlbGwgd3JvdGU6DQo+IE9uIFdlZCwg
Tm92IDEzLCAyMDI0IGF0IDA4OjIwOjAyUE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6
DQo+PiBPbiAxMy4xMS4yNCAxODoyNSwgRWxsaW90dCBNaXRjaGVsbCB3cm90ZToNCj4+PiBP
biBUdWUsIEp1bCAwOSwgMjAyNCBhdCAwODozNjoxOEFNICswMDAwLCBBbmRyZWkgU2VtZW5v
diB3cm90ZToNCj4+Pj4NCj4+Pj4gQWZ0ZXIgc29tZSBpbnZlc3RpZ2F0aW9ucyB3ZSBub3Rp
Y2VzIGEgaHVnZSBwZXJmb3JtYW5jZXMgZHJvcCAocGVyZnMgZGl2aWRlZA0KPj4+PiBieQ0K
Pj4+PiBmYWN0b3Igb2YgNSkgc3RhcnRpbmcgZnJvbSA1LjEwLjg4IExpbnV4IGtlcm5lbCB2
ZXJzaW9uIG9uIHRoZSBBTUQgRVBZQw0KPj4+PiBwbGF0Zm9ybXMuIFRoZSBwYXRjaCBpbnRy
b2R1Y2VkIGluIHRoaXMga2VybmVsIHZlcnNpb24gdGhhdCBhbGxvd3MgdG8NCj4+Pj4gcGlu
cG9pbnQNCj4+Pj4gdGhlIGJ1Z2d5IGJlaGF2aW9yIGlzIDoNCj4+Pj4NCj4+Pj4gICDCoOKA
nHhlbi9uZXRmcm9udDogaGFyZGVuIG5ldGZyb250IGFnYWluc3QgZXZlbnQgY2hhbm5lbCBz
dG9ybXPigJ0NCj4+Pj4gZDMxYjMzNzkxNzlkNjQ3MjRkM2JiZmE4N2JkNGFkYTk0ZTMyMzdk
ZQ0KPj4+Pg0KPj4+PiBUaGUgcGF0Y2ggYmFzaWNhbGx5IGJpbmRzIHRoZSBuZXR3b3JrIGZy
b250ZW5kIHRvIHRoZSBgeGVuX2xhdGVlb2lfY2hpcGANCj4+Pj4gaXJxX2NoaXAgKGluc2Vh
ZCBvZiBgeGVuX2R5bmFtaWNfY2hpcGApIHdoaWNoIGFsbG93cyB0byBpdHMgY2xpZW50cyB0
bw0KPj4+PiBpbmZvcm0NCj4+Pj4gdGhlIGNoaXAgaWYgc3B1cmlvdXMgaW50ZXJydXB0cyBh
cmUgZGV0ZWN0ZWQgYW5kIHNvIHRoZSBkZWxheSBpbiBpbnRlcnJ1cHQNCj4+Pj4gdHJlYXRt
ZW50IGlzIGludHJvZHVjZWQgYnkgdGhlIGNoaXAuDQo+Pj4NCj4+PiBJIHdvcnJ5IEknbSBi
ZWluZyBrbmF2ZSBoZXJlLg0KPj4+DQo+Pj4gRm9yIHRoZSBoZWNrIG9mIGl0LCBJIHRvb2sg
YSBnbGFuY2UgYXQgYjI3ZDQ3OTUwZTQ4LiAgSWYgbXkgdW5kZXJzdGFuZGluZw0KPj4+IGlz
IGNvcnJlY3QsIGIyN2Q0Nzk1MGU0OCBpcyBtYWtpbmcgYSB2ZXJ5IGJhc2ljIChhbmQgd3Jv
bmcpIGFzc3VtcHRpb24NCj4+PiBhYm91dCB0aW1pbmcvbGF0ZW5jeS4NCj4+Pg0KPj4+IElu
IHBhcnRpY3VsYXIgYW55IHRpbWUgZWl0aGVyIHNpZGUgcmVjZWl2ZSBhbiBldmVudCwgaXQg
d2lsbCBoYW5kbGUNCj4+PiBYICMgb2YgaW5jb21pbmcgcGF5bG9hZHMgYW5kIFkgIyBvZiBh
Y2tub3dsZWRnZWQgb3V0Z29pbmcgcGF5bG9hZHMuICBBcw0KPj4+IHN1Y2ggaWYgWCArIFkg
PiAxLCB0aGVuIHVwIHRvIFggKyBZIC0gMSBzcHVyaW91cyBldmVudHMgbWF5IGJlIGRldGVj
dGVkLg0KPj4+IFRoZSBpc3N1ZSBpcyB0aGVyZSBpcyBubyBzeW5jaHJvbml6YXRpb24gYmV0
d2VlbiB0aGUgZXZlbnQgY2hhbm5lbCBhbmQNCj4+PiB0aGUgd29yayBxdWV1ZXMuDQo+Pj4N
Cj4+PiBJbiBwYXJ0aWN1bGFyIHRoZSBuZXR3b3JrIGJhY2sgZW5kIGNvdWxkIGxlZ2l0aW1h
dGVseSBnZW5lcmF0ZToNCj4+Pg0KPj4+IHdvcmswCXNpZ25hbDAJd29yazEJc2lnbmFsMQl3
b3JrMglzaWduYWwyCXdvcmszCXNpZ25hbDMNCj4+Pg0KPj4+IFdoZXJlYXMgdGhlIG5ldHdv
cmsgZnJvbnQgZW5kIG1heSBoYW5kbGUgdGhpcyBhczoNCj4+Pg0KPj4+IGV2ZW50MAl3b3Jr
MAl3b3JrMQl3b3JrMgl3b3JrMwlldmVudDEJZXZlbnQyCWV2ZW50Mw0KPj4+DQo+Pj4gV2hl
cmUgYjI3ZDQ3OTUwZTQ4IHdvdWxkIGludGVycHJldCBldmVudHMgMS0zIGFzIHNwdXJpb3Vz
LCBldmVuIHRob3VnaA0KPj4+IHRoZXkncmUgcGVyZmVjdGx5IGxlZ2l0aW1hdGUuICBUaGUg
c2FtZSBwaGVub21lbm9uIGNvdWxkIG9jY3VyIGluIGJvdGgNCj4+PiBkaXJlY3Rpb25zIGFu
ZCBhbHNvIHdpdGggdGhlIFhlbiBibG9jayBkZXZpY2VzLg0KPj4NCj4+IE5vLg0KPj4NCj4+
IEZvciBvbmUsIGFzIGxvbmcgYXMgZXZlbnQwIGlzbid0IEVPSSdkLCB0aGUgb3RoZXIgZXZl
bnRzIHdvdWxkIGp1c3QgYmUNCj4+IG1lcmdlZCBpbnRvIGEgc2luZ2xlIG9uZS4NCj4gDQo+
IFdpdGggdGhlIDItbGV2ZWwgYml0ZmllbGQgZXZlbnQgY2hhbm5lbCBjZXJ0YWlubHksIGJ1
dCB3aGF0IGlmIEZJRk8NCj4gZXZlbnQgY2hhbm5lbHMgd2VyZSBpbiB1c2U/DQoNClRoZSBz
YW1lIGFwcGxpZXMuIFRoZSBldmVudCBjaGFubmVsIGlzIG1hc2tlZCBhcyBsb25nIGFzIHRo
ZXJlIHdhcyBubw0KRU9JLg0KDQo+IA0KPj4gQWRkaXRpb25hbGx5LCBhcyBsb25nIGFzIHdv
cmswIGlzbid0IGFja25vd2xlZGdlZCBieSBpbmNyZW1lbnRpbmcgdGhlDQo+PiBjb25zdW1l
ciBpbmRleCwgYWRkaXRpb25hbCBxdWV1ZWQgd29yayBpdGVtcyBzaG91bGQgTk9UIHJlc3Vs
dCBpbg0KPj4gYWRkaXRpb25hbCBldmVudHMgYmVpbmcgc2VudC4gQW4gZXZlbnQgaXMgb25s
eSBzZW50IGlmIGEgd29yayBpdGVtIGlzDQo+PiBxdWV1ZWQgdG8gYSByaW5nIGJ1ZmZlciB3
aXRoIGNvbnN1bWVyID09IHByb2R1Y2VyLg0KPiANCj4gV2hhdCBpZiB0aGUgZnJvbnQtZW5k
IGFuZCBiYWNrLWVuZCB3ZXJlIHJ1bm5pbmcgc2ltdWx0YW5lb3VzbHkgb24NCj4gZGlmZmVy
ZW50IHByb2Nlc3NvcnM/DQoNClRoZXJlIGFyZSAob3Igc2hvdWxkIGJlKSBhcHByb3ByaWF0
ZSBiYXJyaWVycyBhcm91bmQgYWNjZXNzZXMgb2YgY29uc3VtZXINCmFuZCBwcm9kdWNlciBp
bmRpY2VzLCBhbmQgdGhlIHNlcXVlbmNlIHRoZXkgc2hvdWxkIGJlIGFjY2Vzc2VkIGlzIHdl
bGwNCmRlZmluZWQuDQoNCj4gDQo+Pj4gVWx0aW1hdGVseSBob3cgaXMgdGhlIG5ldHdvcmsg
cG9ydGlvbiBvZiBYU0EtMzkxIGFueSBkaWZmZXJlbnQgZnJvbSBhbnkNCj4+PiBvdGhlciBu
ZXR3b3JrIERvUz8gIElmIGFuIGludGVycnVwdCBpcyBnZW5lcmF0ZWQgZm9yIGV2ZXJ5IHNp
bmdsZSBwYWNrZXQNCj4+PiBvZiBhIHNlcmllcyBvZiBydW50IGZyYW1lcywgdGhlcmUgd2ls
bCBiZSBoZWF2eSBwcm9jZXNzb3IgdXNlIGZvciBsaXR0bGUNCj4+PiBuZXR3b3JrIHRyYWZm
aWMuDQo+Pg0KPj4gVGhlIHByb2JsZW0gaXMgdGhhdCBhIHN0ZWFkeSBzdHJlYW0gb2YgZXZl
bnRzIGNvdWxkIGtlZXAgdGhlIG90aGVyIHNpZGUNCj4+IGluIElSUSBoYW5kbGluZyBmb3Ig
YXJiaXRyYXJ5IGFtb3VudCBvZiB0aW1lcywgbGVhZGluZyB0byBoYW5ndXBzLg0KPiANCj4g
SSBrbm93LiAgSSB3YXMgcG9pbnRpbmcgb3V0IHRoaXMgc2VlbXMgbGl0dGxlIGRpZmZlcmVu
dCBmcm9tIG90aGVyDQo+IHR5cGljYWwgbmV0d29yayBEb1MgYmVoYXZpb3IuICBUaGlzIHNv
cnQgb2Ygc2l0dWF0aW9uIGlzIGFsc28gYW4gaXNzdWUNCj4gd2hlbiBuZXR3b3JrIHNwZWVk
cyBhcmUgaW5jcmVhc2luZyBzaW5jZSBtb3JlIHBhY2tldHMgbWVhbnMgbW9yZQ0KPiBpbnRl
cnJ1cHRzLg0KPiANCj4+PiBBTUQgc3lzdGVtcyBtYXkgZmFpciB3b3JzZSB0aGFuIEludGVs
IHN5c3RlbXMgZHVlIHRvIGRpZmZlcmluZyBjYWNoZQ0KPj4+IGNvaGVyZW5jZSBiZWhhdmlv
ci9sYXRlbmN5LiAgUGVyaGFwcyBBTUQncyBOVU1BIGltcGxlbWVudGF0aW9uIGFkZHMNCj4+
PiBzb21lIGxhdGVuY3kuICAoaHVoLCBzdWRkZW5seSB0aGUgUkFJRDEgaXNzdWUgY29tZXMg
dG8gbWluZCkNCj4+Pg0KPj4+DQo+Pj4gSG9wZWZ1bGx5IEknbSBub3QgbWFraW5nIGtuYXZl
IHNwZWN1bGF0aW9uIGhlcmUuICBNaWdodCB0aGlzIGJlIHRoZQ0KPj4+IHNpbXBsZXN0IG9m
IGlzc3VlcywganVzdCBpdCB3YXMgbWlzc2VkIGR1ZSB0byBiZWluZyB0b28gb2J2aW91cz8N
Cj4+DQo+PiBJIGRvbid0IGFncmVlIHdpdGggeW91ciBhbmFseXNpcywgc2VlIGFib3ZlLg0K
PiANCj4gT2theS4gIEkgd2FzIGFza2luZyBzaW5jZSBpdCBsb29rZWQgYSBiaXQgb2RkIGFu
ZCB0aGVyZSBoYXMgYmVlbiBubyBuZXdzDQo+IG9uIHRoaXMgaXNzdWUgKHVubGVzcyBJIG1p
c3NlZCBzb21lIHBhdGNoIGZseWluZyBieSkuDQo+IA0KPiBJIGRvbid0IGtub3cgaG93IGxh
cmdlIHRoZSBpbXBhY3Qgb2YgdGhpcyBpcy4gIEkgd291bGRuJ3QgYmUgc3VycHJpc2VkIGlm
DQo+IHRoaXMgdHVybmVkIG91dCB0byBvdmVyd2hlbG0gYWxsIG15IG90aGVyIGVmZm9ydHMg
YXQgcGVyZm9ybWFuY2UNCj4gaW1wcm92ZW1lbnQuDQo+IA0KPiBBbnkgbmV3cyBvbiB5b3Vy
IGVmZm9ydHMgdG8gdHJhY2sgdGhpcyBkb3duPw0KDQpFTk9USU1FIHVwIHRvIG5vdy4NCg0K
RGlkIHlvdSB0cnkgdG8gc2V0IHRoZSBzcHVyaW91cyB0aHJlc2hvbGQgdG8gZS5nLiAyIGlu
c3RlYWQgb2YgdGhlIGRlZmF1bHQNCm9mIDE/IEluIGNhc2UgdGhhdCBoZWxwcyBpdCBtaWdo
dCBiZSBhIGdvb2QgaWRlYSB0byBlaXRoZXIgY2hhbmdlIHRoZSBkZWZhdWx0DQpvciB0byBh
dCBsZWFzdCBhZGQgYSBib290IHBhcmFtZXRlciBmb3Igc2V0dGluZyB0aGUgZGVmYXVsdC4N
Cg0KDQpKdWVyZ2VuDQo=
--------------dSX3KTKLVEQ21wFGM0aIyus0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dSX3KTKLVEQ21wFGM0aIyus0--

--------------14CBNCBmiqaffpvb5bWJvk0l--

--------------K0OR75mBQjX9KJ6l0lFxYGyd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmc27i8FAwAAAAAACgkQsN6d1ii/Ey/V
pwgAhWz8cljrVTkHqLk3/yBZjuBOT0n2gjXaHMdQVPRCMxwD+jFx5qaOkaeSof6BVUw/jsTalJnk
L79ev8zc7b/OnPt4s2SFqxDLeE5Tc1ClxZGh1SD/hUDNE88VWF7BDBFKfYwALGlAz5q2tCyHuXHI
miFJ5qZJ/iSnvqKYHyLqJVRZSORi7rDaoXuLXtgZMWL0MxePf/Oyv/8qujOrjGhrEezn27iRdpo+
tiGo67IzD2k6pxV6+x7bZus2LkSOFC6/1yWIhq4ZOIKIomT95/q/nPihFMorauNm9IrlbFNMKLs0
s7yS/HMo5rdc47vl/HvtEhnS7GkDKgW6GNU+vSwEFg==
=u0v0
-----END PGP SIGNATURE-----

--------------K0OR75mBQjX9KJ6l0lFxYGyd--

