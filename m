Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57973A91DC5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 15:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957712.1350764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PCT-0004yG-0W; Thu, 17 Apr 2025 13:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957712.1350764; Thu, 17 Apr 2025 13:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PCS-0004wF-TB; Thu, 17 Apr 2025 13:22:40 +0000
Received: by outflank-mailman (input) for mailman id 957712;
 Thu, 17 Apr 2025 13:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VG4i=XD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u5PCR-0004vm-OQ
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 13:22:39 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07fc5fac-1b8f-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 15:22:37 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so743223f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 06:22:37 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43ccd8sm20487892f8f.72.2025.04.17.06.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 06:22:36 -0700 (PDT)
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
X-Inumbo-ID: 07fc5fac-1b8f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744896157; x=1745500957; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/zrfeMzJfamxk1gEssa3Qzik7vUYCx08CffmS9zSy0w=;
        b=IpTFWlJfHzxGCGDvyxB5X1Y7WqZktWql/Ov5Af6K3chkMzBxXpSrCDfx+SjqoYB7YZ
         8xd7Rpc5TTDVTNASNjQMpiMWtZiKoRsQx/6N7JTGVtFEgCL63uGBv1cAV6oitHeeSDxg
         0IhWaJyIdebeFggrcm8X2pmHzX5GdaD25ynK99VIbSiskICLHq0hR4cDfu6BBLRXZt7x
         VjqA0ZMd9bhLsmEi/V0VOU3SW0yxx+6c7rOVG+y3PTIz1IXGXTUSNvGsmIfj6U8tHkbM
         brpbzBmavYO53WlYHjoQyIBjxPo7MdOidgkvdalW5KJTlY4W194uauhHrVnZfW3h42dw
         US0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744896157; x=1745500957;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zrfeMzJfamxk1gEssa3Qzik7vUYCx08CffmS9zSy0w=;
        b=V58odj/Au0e8pTVvIbTTthi8KD8//AZI9bbj4YbNECCb+S16G6d+8eP7jGgfoqmRWF
         O3C8ckd99rvysz3+sebZ3mT4irxXBAgl2jiXcvTOjhYxUP17xmg9VKxpaTxOkEzOxYod
         qmW/flzaWM0WYKxGzuKOC2K7//hBCLko94sQXtkbl8vV2YN6TmwLaP8uJfiYzHrO8seV
         Vl9F9pJy9q6x1RWaElXmFXJY8Zmx0bW+wieGjib5BwBfkCFS6pjOQ1AGoQMNkzBoXYs4
         YR4AZUH3ow62hetMJKqvlZGVuv9L9vAln2xaFKu07vXYVVSz2LOg1dAdKZ1uvbh5YGHj
         y8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWWA1VxPc0OqCMMPD/9Hgi+TjbVcLMw14wGb1aW/8yUY25f1FPGWDF86sg1zxfnjBryHCiMQstm2t0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGeJZBrPz2HLl1KedrRp6yYbKdXS6Wb+OWZ8oGYZ3fspk3U5IL
	+47RAxx/bHYfr28lrk6VL5dZle/CkdB7/ybmUBK9biJzuZaxQ4t704gQkoIDUEQ=
X-Gm-Gg: ASbGncvCtLzuWZ7AnPGK2OuOWWJ8O6wZ6C3WMwnqDViiJz+8j8BR9wQINNu8P0S8DO1
	uDbKi0IseoL6gFVNWOuxgWhUk/4MSO5CENcldXHNidOS2jem0PhfDgrcxtsHU7oZAyOEB7H58YU
	pRSIgUj7TimN79f1mr7YdNBJfQz5/zGhA+U1LAd0kRGAf1HDfxpLGcnFRswMaz7cSpd6WNWK3T8
	lUNLqySQOZyscb8gBjfnO1cabK9GNfHXPsMZh5AXAnx7u32z4UUrg6FqAR2GHlTvOuaLg2chzsD
	ad3eB4D+A4T5aRICORiBVaTTIV+KXp0aQXm3WBhx7aqcUBG9xCqV0zv9DkQjD9WjAuifdarNG8w
	oaZTAiCbMF3LEl3GcgQdLo+cEVFHsRcMaQFvPsWatWTmT+AdAC/BblymlgQNpOIK7eA==
X-Google-Smtp-Source: AGHT+IE0xCdVKiDulnkBrlOLJ+CDf03RXlUnLB01h0DYd5fN+o6tFJ9/XRwZaY7Ejj2G1Kqr2MlkUA==
X-Received: by 2002:a05:6000:40c7:b0:39c:1257:cc26 with SMTP id ffacd0b85a97d-39ee5badc09mr5385973f8f.57.1744896157117;
        Thu, 17 Apr 2025 06:22:37 -0700 (PDT)
Message-ID: <7e73b2ee-45be-42d7-a1f4-9e573448051d@suse.com>
Date: Thu, 17 Apr 2025 15:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
To: Alexey <sdl@nppct.ru>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
 <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
 <452bac2e-2840-4db7-bbf4-c41e94d437a8@nppct.ru>
 <ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com>
 <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>
 <4679ca25-572b-44aa-bc00-cb9dc1c0080c@suse.com>
 <ff6eed52-5f1f-4070-90dc-8cf057f35e41@nppct.ru>
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
In-Reply-To: <ff6eed52-5f1f-4070-90dc-8cf057f35e41@nppct.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QazOABvnpvqW3YNWG83asdoy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QazOABvnpvqW3YNWG83asdoy
Content-Type: multipart/mixed; boundary="------------Y4ktICBzSDRA6vIdt3JQnVh3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Alexey <sdl@nppct.ru>, Jakub Kicinski <kuba@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
Message-ID: <7e73b2ee-45be-42d7-a1f4-9e573448051d@suse.com>
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
 <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
 <0c29a3f9-9e22-4e44-892d-431f06555600@suse.com>
 <452bac2e-2840-4db7-bbf4-c41e94d437a8@nppct.ru>
 <ed8dec2a-f507-49be-a6f3-fb8a91bfef01@suse.com>
 <8264519a-d58a-486e-b3c5-dba400658513@nppct.ru>
 <4679ca25-572b-44aa-bc00-cb9dc1c0080c@suse.com>
 <ff6eed52-5f1f-4070-90dc-8cf057f35e41@nppct.ru>
In-Reply-To: <ff6eed52-5f1f-4070-90dc-8cf057f35e41@nppct.ru>

--------------Y4ktICBzSDRA6vIdt3JQnVh3
Content-Type: multipart/mixed; boundary="------------lnAp0nlzMwIlgaMFs4Ry41gP"

--------------lnAp0nlzMwIlgaMFs4Ry41gP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDQuMjUgMTM6MTksIEFsZXhleSB3cm90ZToNCj4gDQo+IE9uIDE3LjA0LjIwMjUg
MTM6MjMsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAxNy4wNC4yNSAxMjowNiwgQWxl
eGV5IHdyb3RlOg0KPj4+DQo+Pj4gT24gMTcuMDQuMjAyNSAxMTo1MSwgSnVlcmdlbiBHcm9z
cyB3cm90ZToNCj4+Pj4gT24gMTcuMDQuMjUgMTA6NDUsIEFsZXhleSB3cm90ZToNCj4+Pj4+
DQo+Pj4+PiBPbiAxNy4wNC4yMDI1IDEwOjEyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4+
Pj4+IE9uIDE3LjA0LjI1IDA5OjAwLCBBbGV4ZXkgd3JvdGU6DQo+Pj4+Pj4+DQo+Pj4+Pj4+
IE9uIDE3LjA0LjIwMjUgMDM6NTgsIEpha3ViIEtpY2luc2tpIHdyb3RlOg0KPj4+Pj4+Pj4g
T24gTW9uLCAxNCBBcHIgMjAyNSAxODozNDowMSArMDAwMCBBbGV4ZXkgTmVwb21ueWFzaGlo
IHdyb3RlOg0KPj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnZXRfcGFnZShwZGF0YSk7
DQo+Pj4+Pj4+PiBQbGVhc2Ugbm90aWNlIHRoaXMgZ2V0X3BhZ2UoKSBoZXJlLg0KPj4+Pj4+
Pj4NCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeGRwZiA9IHhkcF9jb252ZXJ0X2J1
ZmZfdG9fZnJhbWUoeGRwKTsNCj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlr
ZWx5KCF4ZHBmKSkgew0KPj4+Pj4+Pj4+ICsgdHJhY2VfeGRwX2V4Y2VwdGlvbihxdWV1ZS0+
aW5mby0+bmV0ZGV2LCBwcm9nLCBhY3QpOw0KPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOw0KPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+Pj4+IERv
IHlvdSBtZWFuIHRoYXQgaXQgd291bGQgYmUgYmV0dGVyIHRvIG1vdmUgdGhlIGdldF9wYWdl
KHBkYXRhKSBjYWxsIGxvd2VyLA0KPj4+Pj4+PiBhZnRlciBjaGVja2luZyBmb3IgTlVMTCBp
biB4ZHBmLCBzbyB0aGF0IHRoZSByZWZlcmVuY2UgY291bnQgaXMgb25seSANCj4+Pj4+Pj4g
aW5jcmVhc2VkDQo+Pj4+Pj4+IGFmdGVyIGEgc3VjY2Vzc2Z1bCBjb252ZXJzaW9uPw0KPj4+
Pj4+DQo+Pj4+Pj4gSSB0aGluayB0aGUgZXJyb3IgaGFuZGxpbmcgaGVyZSBpcyBnZW5lcmFs
bHkgYnJva2VuIChvciBhdCBsZWFzdCB2ZXJ5DQo+Pj4+Pj4gcXVlc3Rpb25hYmxlKS4NCj4+
Pj4+Pg0KPj4+Pj4+IEkgc3VzcGVjdCB0aGF0IGluIGNhc2Ugb2YgYXQgbGVhc3Qgc29tZSBl
cnJvcnMgdGhlIGdldF9wYWdlKCkgaXMgbGVha2luZw0KPj4+Pj4+IGV2ZW4gd2l0aG91dCB0
aGlzIG5ldyBwYXRjaC4NCj4+Pj4+Pg0KPj4+Pj4+IEluIGNhc2UgSSdtIHdyb25nIGEgY29t
bWVudCByZWFzb25pbmcgd2h5IHRoZXJlIGlzIG5vIGxlYWsgc2hvdWxkIGJlDQo+Pj4+Pj4g
YWRkZWQuDQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IEp1ZXJnZW4NCj4+Pj4+DQo+Pj4+PiBJ
IHRoaW5rIHBkYXRhIGlzIGZyZWVkIGluIHhkcF9yZXR1cm5fZnJhbWVfcnhfbmFwaSgpIC0+
IF9feGRwX3JldHVybigpDQo+Pj4+DQo+Pj4+IEFncmVlZC4gQnV0IHdoYXQgaWYgeGVubmV0
X3hkcF94bWl0KCkgcmV0dXJucyBhbiBlcnJvciA8IDA/DQo+Pj4+DQo+Pj4+IEluIHRoaXMg
Y2FzZSB4ZHBfcmV0dXJuX2ZyYW1lX3J4X25hcGkoKSB3b24ndCBiZSBjYWxsZWQuDQo+Pj4+
DQo+Pj4+DQo+Pj4+IEp1ZXJnZW4NCj4+Pg0KPj4+IEFncmVlZC4gVGhlcmUgaXMgbm8gZXhw
bGljaXQgZnJlZWQgcGRhdGEgaW4gdGhlIGNhbGxpbmcgZnVuY3Rpb24NCj4+PiB4ZW5uZXRf
Z2V0X3Jlc3BvbnNlcygpLiBXaXRob3V0IHRoaXMsIHRoZSBwYWdlIHJlZmVyZW5jZWQgYnkg
cGRhdGENCj4+PiBjb3VsZCBiZSBsZWFrZWQuDQo+Pj4NCj4+PiBJIHN1Z2dlc3Q6DQo+Pg0K
Pj4gQ291bGQgeW91IHBsZWFzZSBtZXJnZSB0aGUgdHdvIGlmICgpIGJsb2NrcywgYXMgdGhl
eSBzaGFyZSB0aGUNCj4+IGNhbGwgb2YgeGRwX3JldHVybl9mcmFtZV9yeF9uYXBpKCkgbm93
PyBTb21ldGhpbmcgbGlrZToNCj4+DQo+PiBpZiAodW5saWtlbHkoZXJyIDw9IDApKSB7DQo+
PiDCoMKgwqDCoGlmIChlcnIgPCAwKQ0KPj4gwqDCoMKgwqDCoMKgwqAgdHJhY2VfeGRwX2V4
Y2VwdGlvbihxdWV1ZS0+aW5mby0+bmV0ZGV2LCBwcm9nLCBhY3QpOw0KPj4gwqDCoMKgwqB4
ZHBfcmV0dXJuX2ZyYW1lX3J4X25hcGkoeGRwZik7DQo+PiB9DQo+Pg0KPj4gSnVlcmdlbg0K
Pj4NCj4+IFAuUy46IHBsZWFzZSBkb24ndCB1c2UgSFRNTCBpbiBlbWFpbHMNCj4gDQo+IEkg
Y2FuJ3QgZG8gdGhpcyBiZWNhdXNlIHhlbm5ldF94ZHBfeG1pdCgpIGNhbiByZXR1cm4gYSB2
YWx1ZSA+IDANCg0KWWVzLCB0aGlzIGlzIHdoYXQgdGhlICJpZiAodW5saWtlbHkoZXJyIDw9
IDApKSIgaXMgZm9yLg0KDQoNCkp1ZXJnZW4NCg==
--------------lnAp0nlzMwIlgaMFs4Ry41gP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lnAp0nlzMwIlgaMFs4Ry41gP--

--------------Y4ktICBzSDRA6vIdt3JQnVh3--

--------------QazOABvnpvqW3YNWG83asdoy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgBAJsFAwAAAAAACgkQsN6d1ii/Ey88
Vgf+MaxOLqDuCeHDhPDe0TkAwFTRCNeKwsJaYbj4fl+2MrZSLcJyHia8AGc1gbYRSOS4S4RO7+A5
W2BxbcmWlzWGS7Hz0dltyCeUau2xCOZEpMopSieTcXg5qGvuzrde+WEzOF302GZwmIa4f3BG+GSC
YCfsV6CU79QPCRlObjbx1GZo3UXAkZ1gziQwMWQUNbNTRcOPGDPgdufJ/viqji8LqW2NccTREpQH
MtG3QuKsjMIJ01YoG+GGZm2bKObOHnL0MhG21Iy4slAfgC2toyX8z/nEAUjTVrfgxOoRFfNJmawr
Is1aGAA5MWXL/a9gn9+HHD9RX0w/hb9uVATgWYriVw==
=ffAU
-----END PGP SIGNATURE-----

--------------QazOABvnpvqW3YNWG83asdoy--

