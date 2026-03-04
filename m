Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOHbM9xBqGn8rgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:29:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C2A2017BE
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245476.1544844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnEA-0006sk-ML; Wed, 04 Mar 2026 14:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245476.1544844; Wed, 04 Mar 2026 14:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnEA-0006qd-JT; Wed, 04 Mar 2026 14:29:30 +0000
Received: by outflank-mailman (input) for mailman id 1245476;
 Wed, 04 Mar 2026 14:29:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=03ok=BE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vxnE8-0006qV-E1
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:29:28 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c5c4384-17d6-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 15:29:27 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b935cd1c6f3so1064496066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 06:29:27 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935afe7d28sm730129466b.67.2026.03.04.06.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 06:29:26 -0800 (PST)
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
X-Inumbo-ID: 8c5c4384-17d6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772634566; x=1773239366; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2W6PqjJjkvvzM4jill6dW7owJPHBge6fWDwErSN3/M4=;
        b=C4Bu1RGaz4qxsFb8KrlB6aJBRb2lwAE+yy1i/f3FguLcqgUtUrokEVKe1vvI4Zt91H
         KoFBKMWK5zPyAfflBH2rgaDuxjIr1Vn9plml1X30JS+CTb4I7vPfi2ELQWeCzb1IhOd9
         K07loIuRQ5LIEpRLaefMmbZLGkcZ6usy92VtZefW40KPzSs6x0c0bztNQ14eaJJ5w4yE
         Yv4VS4zKV1Tsvu5+YsZpv410HVmsPxFTDHf/erKzS+ICsgRu0q29q5/pejjfank+8yLg
         S3/B0GvdRNh5EZGxkw37H1h5gXdUX6eg/6lte6ZFmocH1NXArghnc4OGRyA2V7omiaI6
         Qhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634566; x=1773239366;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2W6PqjJjkvvzM4jill6dW7owJPHBge6fWDwErSN3/M4=;
        b=dZ9IBbKyQLHRMAHkGKSFbp9ypDiexkE744zATe9x5nzF9t1cT9J/N6xmb2I+SFrrvw
         TgCcZb/tEvnZUhMd13w7/LwwcC6yn40lBLYtoYojRzK9vZ8dXalfOyQaEIx+ElS/gDUb
         O4Ecs8ecFVlJmaitwMFggY60Rp2tII32b9yBRvSKoMKb9JuDgOVe92XT6PjaK+PgG4hi
         Mbpv02SWzLfrtmuFwfrvoZcABquOXZOM4kzMmxqR7TSYuYsJLSI1H5YbYLxX0tEgqVHp
         yHsBFG6xhsZFWcgpegj2LH7SA80VWHdavKCd2ZQ6HcugBv0kFtzpZLYe4YG5fTB65sqK
         /mag==
X-Forwarded-Encrypted: i=1; AJvYcCW7nPBzlhi7wMurcF2MyMVKUEikGLhf3WnMpiCnFS+aZOABd90KrNRSNPNFEOjqybcQb2e+C9WjMGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWcqsmsMK3pF6FuDAxor89iqSpQBvnWy0hKXQsBmO9Hm2Jbm2q
	Gra2KpmsFAdqq0jaNlgToSzJvBsbKbA07Bp/zFfzmwWB31WiEyqBMRzDkralwZ3cpztkTXFnmwQ
	O939Uaxs=
X-Gm-Gg: ATEYQzxQV9GyxGHriYOM84ZkK1lzuaCsi4UVEZIJJ5RrYMh+hH6RgMVwBgr+Vgm/qZi
	otKLoP2JXSAKZolYZhlDLbwvgQh2RM6BTP9tkBohhOoibLc8SkV/apXE2KmRsRE1JGwi5rZCiwn
	hCiXyLzdcV3qdYBNCEKzWKbdsOTrHHg8FIrtjB/+IrW2pzM+rjeQiuc5Rnls16AmwWB/vzFu9Mn
	5h3l09ykLVPO+HxXW6aDcFZJtuWYtZXv67Zyqdeb6sJN7NYm0DeBMAoY5U+K/cQBcvGrTASDyEd
	7qpVn30YqUThA5qo9abNoiLJk1xViXBRHc+Pi7o2j78mlH91Oa5uyvOx2eW58eXMds8lO8vCoUi
	RlOYlxbB7lMDj4mPkzJHKuJFpHhGNlhtkHIslcgzpdY+xa+GceTZHRjydWHYVtZAu6SOljT/G3K
	IoOu+QjSXq/BBYAbWSart2xuLaDAKXfuDWt6a/2F5T73QSqtUUOGyuJvqmub2PVBkp8ZseygBRn
	HWn+CX1+pdQhXQlp0C0W8XvdkM+apngRTOpV0K+iziqRoXv1DJviA==
X-Received: by 2002:a17:907:2d94:b0:b93:8d6a:7ec8 with SMTP id a640c23a62f3a-b93f137125bmr121052566b.24.1772634566483;
        Wed, 04 Mar 2026 06:29:26 -0800 (PST)
Message-ID: <0a99e49b-ee8f-4331-9395-f5889cfe14a1@suse.com>
Date: Wed, 4 Mar 2026 15:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: sysctl: Add documentation for /proc/sys/xen/
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, corbet@lwn.net
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-doc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
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
In-Reply-To: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YsdEc1OjNF18WtOMj3B7oZX0"
X-Rspamd-Queue-Id: 05C2A2017BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chakrabortyshubham66@gmail.com,m:corbet@lwn.net,m:sstabellini@kernel.org,m:boris.ostrovsky@oracle.com,m:linux-doc@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lwn.net];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YsdEc1OjNF18WtOMj3B7oZX0
Content-Type: multipart/mixed; boundary="------------ipVnQz6wlUAsuL6nf6BAvEEV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, corbet@lwn.net
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-doc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <0a99e49b-ee8f-4331-9395-f5889cfe14a1@suse.com>
Subject: Re: [PATCH] docs: sysctl: Add documentation for /proc/sys/xen/
References: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
In-Reply-To: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>

--------------ipVnQz6wlUAsuL6nf6BAvEEV
Content-Type: multipart/mixed; boundary="------------nMOGoNb04DKiVnZSjGOmOkQ9"

--------------nMOGoNb04DKiVnZSjGOmOkQ9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDMuMjYgMTU6MTYsIFNodWJoYW0gQ2hha3JhYm9ydHkgd3JvdGU6DQo+IEFkZCBk
b2N1bWVudGF0aW9uIGZvciB0aGUgWGVuIGh5cGVydmlzb3Igc3lzY3RsIGNvbnRyb2xzIGlu
DQo+IC9wcm9jL3N5cy94ZW4vYmFsbG9vbi8uDQo+IA0KPiBEb2N1bWVudHMgdGhlIGhvdHBs
dWdfdW5wb3B1bGF0ZWQgdHVuYWJsZSAoYXZhaWxhYmxlIHdoZW4NCj4gQ09ORklHX1hFTl9C
QUxMT09OX01FTU9SWV9IT1RQTFVHIGlzIGVuYWJsZWQpIHdoaWNoIGNvbnRyb2xzDQo+IHdo
ZXRoZXIgdW5wb3B1bGF0ZWQgbWVtb3J5IHJlZ2lvbnMgYXJlIGF1dG9tYXRpY2FsbHkgaG90
cGx1Z2dlZA0KPiB3aGVuIHRoZSBYZW4gYmFsbG9vbiBkcml2ZXIgbmVlZHMgdG8gcmVjbGFp
bSBtZW1vcnkuDQo+IA0KPiBUaGUgZG9jdW1lbnRhdGlvbiBpcyBiYXNlZCBvbiBzb3VyY2Ug
Y29kZSBhbmFseXNpcyBvZg0KPiBkcml2ZXJzL3hlbi9iYWxsb29uLmMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTaHViaGFtIENoYWtyYWJvcnR5IDxjaGFrcmFib3J0eXNodWJoYW02NkBn
bWFpbC5jb20+DQo+IC0tLQ0KPiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3Rs
L2luZGV4LnJzdCB8ICAzICstDQo+ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNj
dGwveGVuLnJzdCAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC94ZW4ucnN0DQo+
IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvaW5k
ZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvaW5kZXgucnN0DQo+
IGluZGV4IDRkZDJjOWI1ZDc1Mi4uYWFlNjgzNzM5MDJmIDEwMDY0NA0KPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvaW5kZXgucnN0DQo+IEBAIC04NCw3ICs4NCw3
IEBAIHN1bnJwYy8JCVNVTiBSZW1vdGUgUHJvY2VkdXJlIENhbGwgKE5GUykNCj4gICB1c2Vy
LwkJUGVyIHVzZXIgbmFtZXNwYWNlIGxpbWl0cw0KPiAgIHZtLwkJbWVtb3J5IG1hbmFnZW1l
bnQgdHVuaW5nDQo+ICAgCQlidWZmZXIgYW5kIGNhY2hlIG1hbmFnZW1lbnQNCj4gLXhlbi8J
CTx1bmRvY3VtZW50ZWQ+DQo+ICt4ZW4vCQlYZW4gaHlwZXJ2aXNvciBjb250cm9scw0KPiAg
ID09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gICANCj4gICBUaGVzZSBhcmUgdGhlIHN1
YmRpcnMgSSBoYXZlIG9uIG15IHN5c3RlbSBvciBoYXZlIGJlZW4gZGlzY292ZXJlZCBieQ0K
PiBAQCAtMTAyLDMgKzEwMiw0IEBAIGl0IDotKQ0KDQpJIHRoaW5rIHlvdSBlZGl0ZWQgdGhl
IHBhdGNoIGZpbGUsIGJ1dCB0aGlzIHdhc24ndCBpbXByb3ZpbmcgaXQuIDotKQ0KDQpQbGVh
c2UgcmVzZW5kIHdpdGhvdXQgYWRkaXRpb25zIG1ha2luZyBpdCBtYWxmb3JtZWQuDQoNCj4g
ICAgICBzdW5ycGMNCj4gICAgICB1c2VyDQo+ICAgICAgdm0NCj4gKyAgIHhlbg0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwveGVuLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL3hlbi5yc3QNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi45NTdmZWJkNmJhYjkNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC94ZW4u
cnN0DQo+IEBAIC0wLDAgKzEsMzMgQEANCj4gKz09PT09PT09PT09PT09PQ0KPiArL3Byb2Mv
c3lzL3hlbi8NCj4gKz09PT09PT09PT09PT09PQ0KPiArDQo+ICtUaGVzZSBmaWxlcyBzaG93
IHVwIGluIGBgL3Byb2Mvc3lzL3hlbi9gYCwgZGVwZW5kaW5nIG9uIHRoZQ0KPiAra2VybmVs
IGNvbmZpZ3VyYXRpb246DQo+ICsNCj4gKy4uIGNvbnRlbnRzOjogOmxvY2FsOg0KPiArDQo+
ICtiYWxsb29uL2hvdHBsdWdfdW5wb3B1bGF0ZWQNCj4gKz09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiArDQo+ICtUaGlzIGZsYWcgY29udHJvbHMgd2hldGhlciB1bnBvcHVsYXRl
ZCBtZW1vcnkgcmFuZ2VzIGFyZSBhdXRvbWF0aWNhbGx5DQo+ICtob3RwbHVnZ2VkIGFzIHN5
c3RlbSBSQU0uDQo+ICsNCj4gKy0gYGAwYGA6IFVucG9wdWxhdGVkIHJhbmdlcyBhcmUgbm90
IGhvdHBsdWdnZWQgKGRlZmF1bHQpLg0KPiArLSBgYDFgYDogVW5wb3B1bGF0ZWQgcmFuZ2Vz
IGFyZSBhdXRvbWF0aWNhbGx5IGhvdHBsdWdnZWQuDQo+ICsNCj4gK1doZW4gZW5hYmxlZCwg
dGhlIFhlbiBiYWxsb29uIGRyaXZlciB3aWxsIGFkZCBtZW1vcnkgcmVnaW9ucyB0aGF0IGFy
ZQ0KPiArbWFya2VkIGFzIHVucG9wdWxhdGVkIGluIHRoZSBYZW4gbWVtb3J5IG1hcCB0byB0
aGUgc3lzdGVtIGFzIHVzYWJsZSBSQU0uDQo+ICtUaGlzIGFsbG93cyBmb3IgZHluYW1pYyBt
ZW1vcnkgZXhwYW5zaW9uIGluIFhlbiBndWVzdCBkb21haW5zLg0KPiArDQo+ICtUaGlzIG9w
dGlvbiBpcyBvbmx5IGF2YWlsYWJsZSB3aGVuIHRoZSBrZXJuZWwgaXMgYnVpbHQgd2l0aA0K
PiArYGBDT05GSUdfWEVOX0JBTExPT05fTUVNT1JZX0hPVFBMVUdgYCBlbmFibGVkLg0KDQpU
aGUgc3R1ZmYgYmVsb3cgZG9lc24ndCBzZWVtIGFwcHJvcHJpYXRlIGhlcmUsIHRvby4gSSB0
aGluayBpdCBjYW4gYmUNCmVpdGhlciBkcm9wcGVkLCBvciBzaG91bGQgbW92ZSB1cCBpbiB0
aGUgZmlsZS4NCg0KPiArDQo+ICtDb3B5cmlnaHQgKGMpIDIwMjYsIFNodWJoYW0gQ2hha3Jh
Ym9ydHkgPGNoYWtyYWJvcnR5c2h1YmhhbTY2QGdtYWlsLmNvbT4NCj4gKw0KPiArRm9yIGdl
bmVyYWwgaW5mbyBhbmQgbGVnYWwgYmx1cmIsIHBsZWFzZSBsb29rIGluDQo+ICtEb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9pbmRleC5yc3QuDQo+ICsNCj4gKy4uIFNlZSBz
Y3JpcHRzL2NoZWNrLXN5c2N0bC1kb2NzIHRvIGtlZXAgdGhpcyB1cCB0byBkYXRlOg0KPiAr
Li4gc2NyaXB0cy9jaGVjay1zeXNjdGwtZG9jcyAtdnRhYmxlPSJ4ZW4iIFwNCj4gKy4uICAg
ICAgICAgJChnaXQgZ3JlcCAtbCByZWdpc3Rlcl9zeXNjdGxfKQ0KDQoNCkp1ZXJnZW4NCg==

--------------nMOGoNb04DKiVnZSjGOmOkQ9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nMOGoNb04DKiVnZSjGOmOkQ9--

--------------ipVnQz6wlUAsuL6nf6BAvEEV--

--------------YsdEc1OjNF18WtOMj3B7oZX0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmoQcUFAwAAAAAACgkQsN6d1ii/Ey8a
ZQf/XKRD+RhbXO8yP1VcD826s2hbtRV5APomaGy7gKV5MxiWYXCCSFkrTa79+5W1ksakw/opvZR1
us7FZ4o0UoDqyhg71R/1aiHOydoG9iwjfItfITC/acH6kBFn6w/ColiJVP+lOH3I15l52b3xRHBT
YSsl/hwO6BjPBS0SMiCD8kyhmVqDvs1pX5cemZOQD+YjULs4d7zIQJ3hRx76t6OyHK/SH9PvIrPt
5HvRxWgc1f3bKTUb3M2VOIaBAFcuwoIusfsxBcSOUifNoD7ae3xPfYEraYyY34ZFD6PsHnUNt0k8
UZBrYqhXYBAvuZhSzLt96FTSospy5XQFe/t5VjlzbQ==
=g24M
-----END PGP SIGNATURE-----

--------------YsdEc1OjNF18WtOMj3B7oZX0--

