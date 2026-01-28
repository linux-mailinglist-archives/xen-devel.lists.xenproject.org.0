Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF/aH7HzeWnT1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:32:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E65A0750
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215511.1525683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3lU-0002Sy-Vn; Wed, 28 Jan 2026 11:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215511.1525683; Wed, 28 Jan 2026 11:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3lU-0002Qa-Sv; Wed, 28 Jan 2026 11:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1215511;
 Wed, 28 Jan 2026 11:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MrbJ=AB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vl3lU-0002QL-9T
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:31:16 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db01480a-fc3c-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 12:31:15 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6580dbdb41eso9568977a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 03:31:15 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1?
 (2a00-12d0-af5b-2f01-4042-c03-ce4d-a5a1.ip.tng.de.
 [2a00:12d0:af5b:2f01:4042:c03:ce4d:a5a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbffb7263sm110619066b.28.2026.01.28.03.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 03:31:14 -0800 (PST)
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
X-Inumbo-ID: db01480a-fc3c-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769599875; x=1770204675; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=znczj6Y3gseHlfGskrjL6lmLOkTck5hmV/v0qvXsQP8=;
        b=BY0Jxw5sSxbuQ6BFSvXMS/9QYGa4/6gT/VnGcsRkP3z9lqVVz7VZWT85O+VN2c6XWY
         QP55F2j7YlLvYnrQWqpuVRxAZAk0ZYpoyRQIclfBy8nKIu85HvWuZYerl6TwDU4cTNZ0
         4HntHPBe91OZconFyYVb6tUJhyJurwRHL7yxs/FSZfWAludG+BsZaFGdEZmcnONofBhB
         QirzN2Lf1eIPO3qlY6yI9iAIfNSO4WWl66EgazEyEvcvCGkW75ABObNDvGFLNi2u3veu
         QsMl1rAHY2/eCDNh5hnWrYTEB0QqNbDO74NwgjEqbrtcRze9vdWxKsO7NnAPdEMG1srb
         Yvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599875; x=1770204675;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znczj6Y3gseHlfGskrjL6lmLOkTck5hmV/v0qvXsQP8=;
        b=D3PAEU4u82K1BpStxDUwSh1vGW5nu5S4P3zObr20bHnS89P8mrMQjDJ7wh3kOe8PEW
         51RH2vuuO31xeStQ0CYdmPzDO8hR7bKV5y51wc3T+fODXlcsPSI36kz9ugnxE7kW4vT9
         ljkh3SHbpzBQK1/mmBJhd8A7lbqvM2w/sIJ3wMX2147ti2MBbLQVSrNHMxHYImoJIpMk
         yDaD5nckGfbK43d1Ld6kUdx6L+GZzSCYcnisWgw+WiKmAMzBTjDykNyBnMNu03okof9u
         Ucqnjjrx44zI1mNKZyUc2tO0H9vQTIxB4wXJynhYNLoe+fJKvql4k1lY6TxfInorZ7QI
         Td/g==
X-Forwarded-Encrypted: i=1; AJvYcCUOKSPtocJPkn5fPSKSicY+qzEeG2QOTiiaNcR5HiUIieH2a4dT+o3SP+DnuNe/eg9z+9aP+2Kgbh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwL6zctBIbEZYnNZOYTjtncYWXlJ6YwLcg4DxsqhZQvjW2F87FH
	UBbM6RBeAeOUSFd6UHqwzNTEzSy9kYsOYalVX9LGdkqXJcNJO38uWvevjrvFoqvFdiA=
X-Gm-Gg: AZuq6aIIZvkl0UnK4qvBDkeMfCE5PorXUPeve8tV9dP2Z258VRvE2GqdN2Q61YFmdlk
	DwFAngNkLOSqJnuzg4ZJva+0Aj24VZ3rS02GU83KKX4EvvIOrsG31FKDCxRqkMTwYe1W0mjtLCF
	c4aYQIkfvcNW0xMcQzkmM7mliOCwGeOw+4Ihqdtoi+3ZiUFJOokHTXsA9xV88gkCHCLOHd/MynQ
	BJ6IXEe6bEL5pwDcleHYW/eb4xv6WgmA6hmOMDwaDFHgyp6RzehQwPxIlxkpThbg5IEspZpDv2H
	WqrbHTKYszCdMUKnDznBRxrZvqoaMTbh/VXVLIlpytkDUKyojYBlItPIFZI9tXlXbB9EUMl2mij
	7Giy4YFcMYXAh5//At7eWuscH7jrIRm/U5WwvWjCivtlSATNsu+EXg8QUpF8AXfSSG9HzM7iaEc
	l1k80cqyRzi8NHQGAJp5pD7JWfBj8D5atHylwAgyouPu81hDgG654wf6qdq9vbrDlg4GfnW1jpM
	2c236NZVxPAJaOMnzL0Wuv+flYe1nj5IbFRpA==
X-Received: by 2002:a17:907:7f8f:b0:b8a:8537:e399 with SMTP id a640c23a62f3a-b8dab45deffmr351003066b.48.1769599874432;
        Wed, 28 Jan 2026 03:31:14 -0800 (PST)
Message-ID: <596b08db-dc0e-4d42-ac17-570ca6e06bca@suse.com>
Date: Wed, 28 Jan 2026 12:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon
 target for dom0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-3-roger.pau@citrix.com>
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
In-Reply-To: <20260128110510.46425-3-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Qamlj3oqA4Q6UeDj2NstIo3L"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.50 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D2E65A0750
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Qamlj3oqA4Q6UeDj2NstIo3L
Content-Type: multipart/mixed; boundary="------------4G5xfRCGlq20KnRkzKR9kuec";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <596b08db-dc0e-4d42-ac17-570ca6e06bca@suse.com>
Subject: Re: [PATCH 2/2] xen/balloon: improve accuracy of initial balloon
 target for dom0
References: <20260128110510.46425-1-roger.pau@citrix.com>
 <20260128110510.46425-3-roger.pau@citrix.com>
In-Reply-To: <20260128110510.46425-3-roger.pau@citrix.com>

--------------4G5xfRCGlq20KnRkzKR9kuec
Content-Type: multipart/mixed; boundary="------------mxlF8SS0BMLPqEDxR4mHA0bY"

--------------mxlF8SS0BMLPqEDxR4mHA0bY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDEuMjYgMTI6MDUsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gVGhlIGRvbTAg
YmFsbG9vbiB0YXJnZXQgc2V0IGJ5IHRoZSB0b29sc3RhY2sgaXMgdGhlIHZhbHVlIHJldHVy
bmVkIGJ5DQo+IFhFTk1FTV9jdXJyZW50X3Jlc2VydmF0aW9uLiAgRG8gdGhlIHNhbWUgaW4g
dGhlIGtlcm5lbCBiYWxsb29uIGRyaXZlciBhbmQNCj4gc2V0IHRoZSBjdXJyZW50IGFsbG9j
YXRpb24gdG8gdGhlIHZhbHVlIHJldHVybmVkIGJ5DQo+IFhFTk1FTV9jdXJyZW50X3Jlc2Vy
dmF0aW9uLiAgT24gbXkgdGVzdCBzeXN0ZW0gdGhpcyBjYXVzZXMgdGhlIGtlcm5lbA0KPiBi
YWxsb29uIGRyaXZlciB0YXJnZXQgdG8gZXhhY3RseSBtYXRjaCB0aGUgdmFsdWUgc2V0IGJ5
IHRoZSB0b29sc3RhY2sgaW4NCj4geGVuc3RvcmUuDQo+IA0KPiBOb3RlIHRoaXMgYXBwcm9h
Y2ggY2FuIGJlIHVzZWQgYnkgYm90aCBQViBhbmQgUFZIIGRvbTBzLCBhcyB0aGUgdG9vbHN0
YWNrDQo+IGFsd2F5cyB1c2VzIFhFTk1FTV9jdXJyZW50X3Jlc2VydmF0aW9uIHRvIHNldCB0
aGUgaW5pdGlhbCB0YXJnZXQgcmVnYXJkbGVzcw0KPiBvZiB0aGUgZG9tMCB0eXBlLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMveGVuL2JhbGxvb24uYyB8IDI3ICsrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9iYWxs
b29uLmMgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMNCj4gaW5kZXggOGM0NGEyNWE3ZDJiLi45
YjY1MzFlYjI4YjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMveGVuL2JhbGxvb24uYw0KPiAr
KysgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMNCj4gQEAgLTcyNCw3ICs3MjQsOCBAQCBzdGF0
aWMgaW50IF9faW5pdCBiYWxsb29uX2FkZF9yZWdpb25zKHZvaWQpDQo+ICAgc3RhdGljIGlu
dCBfX2luaXQgYmFsbG9vbl9pbml0KHZvaWQpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnRhc2s7DQo+IC0JdW5zaWduZWQgbG9uZyBjdXJyZW50X3BhZ2VzOw0KPiArCWxv
bmcgY3VycmVudF9wYWdlcyA9IDA7DQo+ICsJZG9taWRfdCBkb21pZCA9IERPTUlEX1NFTEY7
DQo+ICAgCWludCByYzsNCj4gICANCj4gICAJaWYgKCF4ZW5fZG9tYWluKCkpDQo+IEBAIC03
MzIsMTUgKzczMywyMSBAQCBzdGF0aWMgaW50IF9faW5pdCBiYWxsb29uX2luaXQodm9pZCkN
Cj4gICANCj4gICAJcHJfaW5mbygiSW5pdGlhbGlzaW5nIGJhbGxvb24gZHJpdmVyXG4iKTsN
Cj4gICANCj4gLQlpZiAoeGVuX3B2X2RvbWFpbigpKSB7DQo+IC0JCWlmICh4ZW5fcmVsZWFz
ZWRfcGFnZXMgPj0geGVuX3N0YXJ0X2luZm8tPm5yX3BhZ2VzKQ0KPiAtCQkJZ290byB1bmRl
cmZsb3c7DQo+IC0JCWN1cnJlbnRfcGFnZXMgPSBtaW4oeGVuX3N0YXJ0X2luZm8tPm5yX3Bh
Z2VzIC0NCj4gLQkJICAgICAgICAgICAgICAgICAgICB4ZW5fcmVsZWFzZWRfcGFnZXMsIG1h
eF9wZm4pOw0KPiAtCX0gZWxzZSB7DQo+IC0JCWlmICh4ZW5fdW5wb3B1bGF0ZWRfcGFnZXMg
Pj0gZ2V0X251bV9waHlzcGFnZXMoKSkNCj4gLQkJCWdvdG8gdW5kZXJmbG93Ow0KPiAtCQlj
dXJyZW50X3BhZ2VzID0gZ2V0X251bV9waHlzcGFnZXMoKSAtIHhlbl91bnBvcHVsYXRlZF9w
YWdlczsNCj4gKwlpZiAoeGVuX2luaXRpYWxfZG9tYWluKCkpDQo+ICsJCWN1cnJlbnRfcGFn
ZXMgPSBIWVBFUlZJU09SX21lbW9yeV9vcChYRU5NRU1fY3VycmVudF9yZXNlcnZhdGlvbiwN
Cj4gKwkJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkb21pZCk7DQoN
CklzIHRoZXJlIGFueSBzcGVjaWZpYyByZWFzb24gd2h5IHRoaXMgc2hvdWxkIGJlIGxpbWl0
ZWQgdG8gZG9tMD8NCg0KSSBfdGhpbmtfIHRoaXMgc2hvdWxkIHdvcmsgZm9yIG90aGVyIGRv
bWFpbnMsIHRvby4NCg0KDQpKdWVyZ2VuDQoNCj4gKwlpZiAoY3VycmVudF9wYWdlcyA8PSAw
KSB7DQo+ICsJCWlmICh4ZW5fcHZfZG9tYWluKCkpIHsNCj4gKwkJCWlmICh4ZW5fcmVsZWFz
ZWRfcGFnZXMgPj0geGVuX3N0YXJ0X2luZm8tPm5yX3BhZ2VzKQ0KPiArCQkJCWdvdG8gdW5k
ZXJmbG93Ow0KPiArCQkJY3VycmVudF9wYWdlcyA9IG1pbih4ZW5fc3RhcnRfaW5mby0+bnJf
cGFnZXMgLQ0KPiArCQkJICAgICAgICAgICAgICAgICAgICB4ZW5fcmVsZWFzZWRfcGFnZXMs
IG1heF9wZm4pOw0KPiArCQl9IGVsc2Ugew0KPiArCQkJaWYgKHhlbl91bnBvcHVsYXRlZF9w
YWdlcyA+PSBnZXRfbnVtX3BoeXNwYWdlcygpKQ0KPiArCQkJCWdvdG8gdW5kZXJmbG93Ow0K
PiArCQkJY3VycmVudF9wYWdlcyA9IGdldF9udW1fcGh5c3BhZ2VzKCkgLQ0KPiArCQkJICAg
ICAgICAgICAgICAgIHhlbl91bnBvcHVsYXRlZF9wYWdlczsNCj4gKwkJfQ0KPiAgIAl9DQo+
ICAgDQo+ICAgCWJhbGxvb25fc3RhdHMuY3VycmVudF9wYWdlcyA9IGN1cnJlbnRfcGFnZXM7
DQoNCg==
--------------mxlF8SS0BMLPqEDxR4mHA0bY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mxlF8SS0BMLPqEDxR4mHA0bY--

--------------4G5xfRCGlq20KnRkzKR9kuec--

--------------Qamlj3oqA4Q6UeDj2NstIo3L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAml584EFAwAAAAAACgkQsN6d1ii/Ey+u
VQf8DcxU7MvP+EMKFuONGIpGphsN92z6CKiv1P1T71aWYzJhArSZdxvSZ7L+dSQrrlkJh71U0yAc
tOXDn+C1wybBexE80+QYf4WPiCewa/g/+JYBFFaCjUgntO6FWwzp3xNKbkByCmBPhcLginKYINjh
WiID2XjwEG+apJ6/7Eeew8IRYxHjmRmUy65gWpwQPfTViPDs5jIhnusc77wlqa4J/oB4kdOn6b36
RMFq/PZFB8g0JzlwFYbX8BaFrcEgVnR+3VjIIDVzSeFx2WqE/k6bfGyxdvJhF9N2FGoNyyqSadJV
3XpcnRTmAnHbUq4Ts4LMkJHZ5ErKV909v9b3YYDK2A==
=/QoD
-----END PGP SIGNATURE-----

--------------Qamlj3oqA4Q6UeDj2NstIo3L--

