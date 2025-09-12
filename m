Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 258BFB5484D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 11:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121731.1465850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0P8-0003aF-MY; Fri, 12 Sep 2025 09:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121731.1465850; Fri, 12 Sep 2025 09:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0P8-0003YH-Jw; Fri, 12 Sep 2025 09:49:18 +0000
Received: by outflank-mailman (input) for mailman id 1121731;
 Fri, 12 Sep 2025 09:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVpM=3X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ux0P6-0003YB-W2
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 09:49:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdf339ce-8fbd-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 11:49:14 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b0787fc3008so234326666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 02:49:14 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:be00:c26:b971:1ba7:9d8b?
 (p200300e5873dbe000c26b9711ba79d8b.dip0.t-ipconnect.de.
 [2003:e5:873d:be00:c26:b971:1ba7:9d8b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31291b0sm337259166b.34.2025.09.12.02.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 02:49:13 -0700 (PDT)
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
X-Inumbo-ID: bdf339ce-8fbd-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757670554; x=1758275354; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCfKepTI44+aiMfz+fCazCpPOr/YPjAvTn6JXYE1Ds8=;
        b=PbmALipCMT11RszH0Y2dIuIfLxMlG4ymV1+XqNMqKZdVORKTfeaGCTE6XOl9SXm+yb
         0QBRIURs+lm6tzh8Vfh6SZj26dkJfvxQBm6OCxwDrMcFT6+O2Tx1Daq9LRuJcqJB5bZL
         hJYp7WZENVxiChuNyOY7D7VvpuQVT4p8Irs/ifUY9TPG3Oidf+2Bjp+b04tY2c+KqsHD
         LMqYxryZ6+uSKl1HwNBCnb3L4AdcWN5dK/mCCC3BwnuTNdTSYle+nIKGJE0qxpPplxQk
         xQJiwlIUHYa2PTYHYkz3oIqJYq3QwPfGtsYOpiudMObxiF204v1QHhPmZoL7Jode/Ddv
         d7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757670554; x=1758275354;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCfKepTI44+aiMfz+fCazCpPOr/YPjAvTn6JXYE1Ds8=;
        b=nfdTQ5t5crp2SKltlhuatr6M7yyAlOFfCFwBO1KgBv/J6Pqi7tTmne4xlU6AURCKPm
         dl3J+bPSG6/9JNOhnMsrHve9LufPUjclbdHyKTGeP49sJkX7RDYYsXaKthoUVpFMLzIn
         TFJYkdvPZ7TdJuxkjeEv4X7nXvYAFBypuM7aR2iaK6Ir71lEggwLb5BXRSnDNAr5cBo/
         tSy+Njrl1UyWuHwAS3uUxDsinzJJXoSb3s1I9L4rSukHaprk4zl+Ddq0SldveFLMNo5S
         zOVSt8DPoH/wxkuVgmqplaHfj0NPSDmVEZrN4+TOIdZkhaVhpVKDpeQhAoC5CWFraU3i
         8QAA==
X-Forwarded-Encrypted: i=1; AJvYcCVJOF0AWVPQGKeeNlcecwJ/WFiQUCYUpL1kBeWkAgUG09Km+J9ntnbjMqj4VILb2NYHyBnAsTxeuTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIZ1ol5ZsI8Gy3dyHxc9G8o2V0b8IOxsdbHP7VF81p3ytH96yU
	ZKb5sjytLwpxfdDqR1BtV9briH+tas0uhZ/YCRWiFgVT7lPOtbLD4o1P5lJFkjJvcxA=
X-Gm-Gg: ASbGncsMwOIwPF7+TJNC8N0ysVkSg7Zna+omMmNwusCuKNaE6iAHFrtBjBmRKCKO0aq
	w8w+9Yev1IuOl4t1uLL96gJKXm4WGjxS0kW5C8Qz8bUmPVGuEf3F2AiVrTEEvfRT+Me0y+kTU23
	xNgAySkeYapz7bcJ6YWc94lsfQzEjymX5k3DucZgVRQejYsjtnP7yjx23VzwikBqk843yThMmS5
	+gflT/SIxc7P/TrfJD45B0Jf0hDMmFX7sXCXJreXJjHNo6Y5spbUJk822gVsACFPUpwPUZNzTCD
	L7shSpVUOBNzAXy2hKgXtmruJxzlDFSotcw+vXFlMsV092A1GYRSNIGDfJ+FS5wBsPdu6z1+6/l
	xfo3XCs+ylvO8R38wYYxiNs4qR3oqLEIfx/DAjWG04yYfJA4I/xjNFm8HSCo4mlBd7un2fEY8k4
	vj94f2AlSyEySjQKUIabVGpyYPrRdL0y428+6SstHbF+S+
X-Google-Smtp-Source: AGHT+IFQDNbG+mSizXCHYgdgZc5bpBYCEGvOvt3RqGb0cJg1KCyWZjhvzljHh8moTtF892HF/Z+G1w==
X-Received: by 2002:a17:906:fd82:b0:b04:760d:1162 with SMTP id a640c23a62f3a-b07c384ae2dmr187984966b.47.1757670554073;
        Fri, 12 Sep 2025 02:49:14 -0700 (PDT)
Message-ID: <776ba15a-f922-407d-b1f2-2a2186c4729e@suse.com>
Date: Fri, 12 Sep 2025 11:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WARN in xennet_disconnect_backend when frontend is paused during
 backend shutdown
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <aMLmkjui9kdEuiy2@mail-itl>
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
In-Reply-To: <aMLmkjui9kdEuiy2@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zfMhlxn0vqbr5l0if1ACoHpA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zfMhlxn0vqbr5l0if1ACoHpA
Content-Type: multipart/mixed; boundary="------------VqrcMoDPvxkZ0lgIbmGPIpJg";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <776ba15a-f922-407d-b1f2-2a2186c4729e@suse.com>
Subject: Re: WARN in xennet_disconnect_backend when frontend is paused during
 backend shutdown
References: <aMLmkjui9kdEuiy2@mail-itl>
In-Reply-To: <aMLmkjui9kdEuiy2@mail-itl>

--------------VqrcMoDPvxkZ0lgIbmGPIpJg
Content-Type: multipart/mixed; boundary="------------chSMkUMN6gxtqd0bb7uhXVHL"

--------------chSMkUMN6gxtqd0bb7uhXVHL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDkuMjUgMTc6MTEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gSGksDQo+IA0KPiBUaGUgc3RlcHM6DQo+IDEuIEhhdmUgZG9tVSBuZXRmcm9udCAoInVu
dHJ1c3RlZCIgaGVyZSkgYW5kIGRvbVUgbmV0YmFjaw0KPiAoInN5cy1maXJld2FsbC1hbHQi
IGhlcmUpLg0KPiAyLiBQYXVzZSBmcm9udGVuZA0KPiAzLiBTaHV0ZG93biBiYWNrZW5kDQo+
IDQuIFVucGF1c2UgZnJvbnRlbmQNCj4gNS4gRGV0YWNoIG5ldHdvcmsgKGluIG15IGNhc2Ug
YXR0YWNoaW5nIGFub3RoZXIgb25lIGZvbGxvd3MganVzdCBhZnRlciwNCj4gYnV0IEkgYmVs
aWV2ZSBpdCdzIG5vdCByZWxldmFudCkuDQo+IA0KPiBUaGlzIGdpdmVzIHRoZSBmb2xsb3dp
bmcgb24gdGhlIGZyb250ZW5kIHNpZGU6DQo+IA0KPiAgICAgIC0tLS0tLS0tLS0tLVsgY3V0
IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiAgICAgIFdBUk5JTkc6IENQVTogMSBQSUQ6IDE0MSBh
dCBpbmNsdWRlL2xpbnV4L21tLmg6MTMyOCB4ZW5uZXRfZGlzY29ubmVjdF9iYWNrZW5kKzB4
MWJlLzB4NTkwIFt4ZW5fbmV0ZnJvbnRdDQo+ICAgICAgTW9kdWxlcyBsaW5rZWQgaW46IHNu
ZF9zZXFfZHVtbXkgc25kX2hydGltZXIgc25kX3NlcSBzbmRfc2VxX2RldmljZSBzbmRfdGlt
ZXIgc25kIHNvdW5kY29yZSBuZnRfcmVqZWN0X2lwdjYgbmZfcmVqZWN0X2lwdjYgbmZ0X3Jl
amVjdF9pcHY0IG5mX3JlamVjdF9pcHY0IG5mdF9yZWplY3QgbmZ0X2N0IG5mdF9tYXNxIG5m
dF9jaGFpbl9uYXQgbmZfbmF0IG5mX2Nvbm50cmFjayBuZl9kZWZyYWdfaXB2NiBuZl9kZWZy
YWdfaXB2NCBuZl90YWJsZXMgaW50ZWxfcmFwbF9tc3IgaW50ZWxfcmFwbF9jb21tb24gaW50
ZWxfdW5jb3JlX2ZyZXF1ZW5jeV9jb21tb24gaW50ZWxfcG1jX2NvcmUgcG10X3RlbGVtZXRy
eSBwbXRfZGlzY292ZXJ5IHBtdF9jbGFzcyBpbnRlbF9wbWNfc3NyYW1fdGVsZW1ldHJ5IGlu
dGVsX3ZzZWMgcG9seXZhbF9jbG11bG5pZ2hhc2hfY2xtdWxuaV9pbnRlbCB4ZW5fbmV0ZnJv
bnQgcGNzcGtyIHhlbl9zY3NpYmFjayB0YXJnZXRfY29yZV9tb2QgeGVuX25ldGJhY2sgeGVu
X3ByaXZjbWQgeGVuX2dudGRldiB4ZW5fZ250YWxsb2MgeGVuX2Jsa2JhY2sgeGVuX2V2dGNo
biBpMmNfZGV2IGxvb3AgZnVzZSBuZm5ldGxpbmsgb3ZlcmxheSB4ZW5fYmxrZnJvbnQNCj4g
ICAgICBDUFU6IDEgVUlEOiAwIFBJRDogMTQxIENvbW06IHhlbndhdGNoIE5vdCB0YWludGVk
IDYuMTcuMC0wLnJjNS4xLnF1YmVzLjEuZmM0MS54ODZfNjQgIzEgUFJFRU1QVChmdWxsKQ0K
PiAgICAgIFJJUDogMDAxMDp4ZW5uZXRfZGlzY29ubmVjdF9iYWNrZW5kKzB4MWJlLzB4NTkw
IFt4ZW5fbmV0ZnJvbnRdDQo+ICAgICAgQ29kZTogMDAgMGYgODMgOTMgMDMgMDAgMDAgNDgg
OGIgOTQgZGQgOTAgMTAgMDAgMDAgNDggOGIgNGEgMDggZjYgYzEgMDEgNzUgNzkgNjYgOTAg
MGYgYjYgNGEgMzMgODEgZjkgZjUgMDAgMDAgMDAgMGYgODUgZjMgZmUgZmYgZmYgPDBmPiAw
YiA0OSA4MSBmZiAwMCAwMSAwMCAwMCAwZiA4MiAwMSBmZiBmZiBmZiA0YyA4OSBmZSA0OCBj
NyBjNyBlMA0KPiAgICAgIFJTUDogMDAxODpmZmZmYzkwMDAxMTIzY2Y4IEVGTEFHUzogMDAw
MTAyNDYNCj4gICAgICBSQVg6IDAwMDAwMDAwMDAwMDAwMTAgUkJYOiAwMDAwMDAwMDAwMDAw
MDAxIFJDWDogMDAwMDAwMDAwMDAwMDBmNQ0KPiAgICAgIFJEWDogZmZmZmVhMDAwMGEwNTIw
MCBSU0k6IDAwMDAwMDAwMDAwMDAwMDEgUkRJOiBmZmZmZmZmZjgyNTI4ZDYwDQo+ICAgICAg
UkJQOiBmZmZmODg4MDQxNDAwMDAwIFIwODogZmZmZjg4ODAwNTA1NGM4MCBSMDk6IGZmZmY4
ODgwMDUwNTRjODANCj4gICAgICBSMTA6IDAwMDAwMDAwMDAxNTAwMTMgUjExOiBmZmZmODg4
MDE4NTFjZDgwIFIxMjogMDAwMDAwMDAwMDAwMDAwMA0KPiAgICAgIFIxMzogZmZmZjg4ODA1
MzYxOTAwMCBSMTQ6IGZmZmY4ODgwMDVkNjFhODAgUjE1OiAwMDAwMDAwMDAwMDAwMDAxDQo+
ICAgICAgRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4ODgwOTUyYzYwMDAo
MDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiAgICAgIENTOiAgMDAxMCBEUzogMDAw
MCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCj4gICAgICBDUjI6IDAwMDA2MTgy
YTExZjMzMjggQ1IzOiAwMDAwMDAwMDEwODRjMDA2IENSNDogMDAwMDAwMDAwMDc3MGVmMA0K
PiAgICAgIFBLUlU6IDU1NTU1NTU0DQo+ICAgICAgQ2FsbCBUcmFjZToNCj4gICAgICAgPFRB
U0s+DQo+ICAgICAgIHhlbm5ldF9yZW1vdmUrMHgxZS8weDgwIFt4ZW5fbmV0ZnJvbnRdDQo+
ICAgICAgIHhlbmJ1c19kZXZfcmVtb3ZlKzB4NmUvMHhmMA0KPiAgICAgICBkZXZpY2VfcmVs
ZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHgxOWMvMHgyMDANCj4gICAgICAgYnVzX3JlbW92ZV9k
ZXZpY2UrMHhjNi8weDEzMA0KPiAgICAgICBkZXZpY2VfZGVsKzB4MTYwLzB4M2UwDQo+ICAg
ICAgID8gX3Jhd19zcGluX3VubG9jaysweGUvMHgzMA0KPiAgICAgICA/IGtsaXN0X2l0ZXJf
ZXhpdCsweDE4LzB4MzANCj4gICAgICAgPyBfX3BmeF94ZW53YXRjaF90aHJlYWQrMHgxMC8w
eDEwDQo+ICAgICAgIGRldmljZV91bnJlZ2lzdGVyKzB4MTcvMHg2MA0KPiAgICAgICB4ZW5i
dXNfZGV2X2NoYW5nZWQrMHgxZDcvMHgyNDANCj4gICAgICAgeGVud2F0Y2hfdGhyZWFkKzB4
OGYvMHgxYzANCj4gICAgICAgPyBfX3BmeF9hdXRvcmVtb3ZlX3dha2VfZnVuY3Rpb24rMHgx
MC8weDEwDQo+ICAgICAgIGt0aHJlYWQrMHhmOS8weDI0MA0KPiAgICAgICA/IF9fcGZ4X2t0
aHJlYWQrMHgxMC8weDEwDQo+ICAgICAgIHJldF9mcm9tX2ZvcmsrMHgxNTIvMHgxODANCj4g
ICAgICAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgxMA0KPiAgICAgICByZXRfZnJvbV9mb3Jr
X2FzbSsweDFhLzB4MzANCj4gICAgICAgPC9UQVNLPg0KPiAgICAgIC0tLVsgZW5kIHRyYWNl
IDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiAgICAgIHhlbl9uZXRmcm9udDogYmFja2VuZCBz
dXBwb3J0cyBYRFAgaGVhZHJvb20NCj4gICAgICB2aWYgdmlmLTA6IGJvdW5jaW5nIHRyYW5z
bWl0dGVkIGRhdGEgdG8gemVyb2VkIHBhZ2VzDQo+IA0KPiBUaGUgbGFzdCB0d28gYXJlIGxp
a2VseSByZWxhdGVkIHRvIGZvbGxvd2luZyBhdHRhY2gsIG5vdCBkZXRhY2guDQo+IA0KPiBU
aGUgc2FtZSBoYXBwZW5zIG9uIDYuMTUgdG9vLCBzbyBpdCBpc24ndCBuZXcgdGhpbmcuDQo+
IA0KPiBTaHV0dGluZyBkb3duIGJhY2tlbmQgd2l0aG91dCBkZXRhY2hpbmcgZmlyc3QgaXMg
bm90IHJlYWxseSBhIG5vcm1hbA0KPiBvcGVyYXRpb24sIGFuZCBkb2luZyB0aGF0IHdoaWxl
IGZyb250ZW5kIGlzIHBhdXNlZCBpcyBldmVuIGxlc3Mgc28uIEJ1dA0KPiBpcyB0aGUgYWJv
dmUgZXhwZWN0ZWQgb3V0Y29tZT8gSWYgSSByZWFkIGl0IHJpZ2h0LCBpdCdzDQo+IFdBUk5f
T05fT05DRShmb2xpb190ZXN0X3NsYWIoZm9saW8pKSBpbiBnZXRfcGFnZSgpLCB3aGljaCBJ
IGZpbmQNCj4gY29uZnVzaW5nLg0KPiANCj4gT3JpZ2luYWxseSByZXBvcnRlZCBhdCBodHRw
czovL2dpdGh1Yi5jb20vUXViZXNPUy9xdWJlcy1jb3JlLWFnZW50LWxpbnV4L3B1bGwvNjAz
I2lzc3VlY29tbWVudC0zMjgwOTUzMDgwDQo+IA0KDQpIbW0sIHdpdGggdGhpcyBzY2VuYXJp
byBJIGltYWdpbmUgeW91IGNvdWxkIG1hbmFnZSB0byBoYXZlDQp4ZW5uZXRfZGlzY29ubmVj
dF9iYWNrZW5kKCkgcnVubmluZyBtdWx0aXBsZSB0aW1lcyBmb3IgdGhlIHNhbWUgZGV2aWNl
DQpjb25jdXJyZW50bHkuDQoNCkhvdyByZWxpYWJsZSBjYW4gdGhpcyBiZSByZXByb2R1Y2Vk
PyBIb3cgbWFueSB2Y3B1cyBkb2VzIHRoZSBndWVzdCBoYXZlPw0KDQpNYXliZSB0aGUgZml4
IGlzIGFzIHNpbXBsZSBhcyBhZGRpbmcgYSBsb2NrIGluIHhlbm5ldF9kaXNjb25uZWN0X2Jh
Y2tlbmQoKS4NCg0KDQpKdWVyZ2VuDQo=
--------------chSMkUMN6gxtqd0bb7uhXVHL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------chSMkUMN6gxtqd0bb7uhXVHL--

--------------VqrcMoDPvxkZ0lgIbmGPIpJg--

--------------zfMhlxn0vqbr5l0if1ACoHpA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjD7JgFAwAAAAAACgkQsN6d1ii/Ey/B
CAf/XWjfbsht4eg1gM2OkzUmZu5wgXQ9Gv5X4MN+A7IiyREyrQT1RAk8aiM0wWRdhfNqG8y93OM9
aXX7J+fDrc5vWnYzS8kUHVRv5Iz4GLIFgEkKIkzjXrtvPIvEEqFA9JFNYlBqX/db4wpTae06rKJr
MqE23+7ua39Dtk4rBX8TBUIIjid7RVKlqKYXv3rqBJge7zHHTdyU02FsUXLfkoSyWZdYY6yl6l9b
qoejJAOWYKzDlObD+QYt9ioMXULqlwZkLgbdFl3pP03e7kquIxkpprmQZXNc4LmERSE9km+yDUz5
NAS0VJd+AAJFgpIzem2OyntzHhjHXatnb6T+OCODEg==
=y54H
-----END PGP SIGNATURE-----

--------------zfMhlxn0vqbr5l0if1ACoHpA--

