Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4RnFIydtPmq0FwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:14:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A296CCE56
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:14:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QgJItnrx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1346092.1604631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5Rg-0008TB-4O; Fri, 26 Jun 2026 12:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346092.1604631; Fri, 26 Jun 2026 12:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5Rg-0008Qb-10; Fri, 26 Jun 2026 12:14:08 +0000
Received: by outflank-mailman (input) for mailman id 1346092;
 Fri, 26 Jun 2026 12:14:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wd5Re-0008QV-AH
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:14:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5Rd-0072ec-Ms
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:14:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e6d0d-5cb7-0a2a0a5109dd-0a2a4503a430-0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:14:05 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e6d0d-ec1a-0a2a45030019-d155da32b0d8-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:14:05 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c07c246ad7bso111906266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:14:05 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-697f4bd7719sm2785947a12.30.2026.06.26.05.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 05:14:03 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782476045; x=1783080845; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gc4qVH2QvP+AtVZgR6WSgEH6OCyXdc7W8ELrghe/QwM=;
        b=QgJItnrx52Asr5MGfu1JUId7ceaj4oP7E0r3dZApzo1FEdsvJFg/J6sRkTtCN3ls1u
         3VhhAgQKgpxhgHCbof3RurXjPj7cN6zEKfhSgdBGLBwTXtptruGKiyF/8yGRdUVY23xE
         gOyJe9g/SVrrzyzm94vBziDPu28RhT6RyNWQdLOSjJ5aGICGinNj+cJ+bhyVXzE4pHV6
         78lQohZbq4R62rDecaysLeIPxwE9TrvsXEBuoTJi1GuoELwfkBFEV7zjF+Sho3Ok3dG2
         7u5+ssVU6rHWi/3QpMnEb7ZmCs3zNZaU9vfzhd4jDPRAkmg+LGUSekd5vMb3qH2MNhQ8
         p6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782476045; x=1783080845;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gc4qVH2QvP+AtVZgR6WSgEH6OCyXdc7W8ELrghe/QwM=;
        b=VdqYLtfM8NLI8Z8DsvNYPiWLnGYvkrdcqrGe/2182so+F6WxRL7CThLzLHVq/CaHoE
         GpagGgZr5OEx3hD8mpQg3MshERykRvsc7ryX7CLf1DGup3sXdlcTv4GuX+aX8KTeR1/i
         dXiuMRTF1X/NbsWS59UPHfnrMCpoU7gDFFvzM/wPXolcT9r4OMBoy6P1Fulq2WDdClSD
         a3OKfE3pUx1v8QfBNepa5pXTlzzVU30ASouPGGZ4A572RK62Jgu6rUoPF6hi4kL3451h
         8zzk93o3JQzfbpudRT29vqboz+jMm5ETwp+yqWoJBY3bF/ddJozzKE2JgbNidlws2ugV
         dF9w==
X-Gm-Message-State: AOJu0Yym0Rkjxc+9w5jF0K2Eh73cujMGQ/GPgTt0ZqnGDPaY9G/84pgX
	cWSQhU+wp1QrcFMxwkqsg5mhau9ZFSgs5hEonmcWz5Cnpynjn34BWddxxwcOsfRj1PA=
X-Gm-Gg: AfdE7cmxos+6EYXQppE35qfYQoDq87T4J+Ol184tYYVmBVQ+n5UqDSLPQdG4tjqj+yC
	DIAbo+HHkRl5ejggPwOL1/GWGozza43dtMG2LJRW1ZXT4nVcLQ9tIGPu6B461kAAWkpAMSqnuT6
	fRduiuLOzk0LxcQpX0Up/rI17wrEvjsRq+AsruG+Stw5pojd7OWXwrGdHh1kdr1P2NV3vNQxY+Z
	F95jpHLM1eojssg2HkvLwKhXRFB8CnPi0P8V/OPptlFKGzvF3mrGdJeMw7QzQbAT6eOcQWTl80U
	DA5AUMSpO8vWH3J+CZNDaLJlujJZO8mHxO0so2uDUtnYtO0ZYHAMatABSybefaSb1j8oq1h5t1p
	D9GnHuD5graWwIZ60IExeMzVbZEPNS/T+xUeiFCVFVXRhnykO/x2SNBs3eFLmKbB4/A3SCQ77LK
	A+mBX15ISdu8z4FFHDpA18LOW0YgjbFBHZq4Ds6+T+bx9GJLr7C7TU/IjVZYazdyglrl9e018oQ
	LPrWoM8d24MB1RfLNudeql1Zt7WVDW/omi1mS3JXU0OxJnvPIyXAQ==
X-Received: by 2002:a17:907:6d1e:b0:bf1:a59e:653f with SMTP id a640c23a62f3a-c12335f0ea3mr23276566b.28.1782476044972;
        Fri, 26 Jun 2026 05:14:04 -0700 (PDT)
Message-ID: <c89b3907-d32f-4f39-beef-fcacd575ca2b@suse.com>
Date: Fri, 26 Jun 2026 14:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gntalloc: validate grant count before allocation
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260624124745.10073-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <20260624124745.10073-1-alhouseenyousef@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z5dcA2bS0wejZ8woxF6jiPy7"
X-purgate-ID: tlsNG-33051d/1782476045-05B345D1-496E110D/0/0
X-purgate-type: clean
X-purgate-size: 9593
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,epam.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8A296CCE56

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z5dcA2bS0wejZ8woxF6jiPy7
Content-Type: multipart/mixed; boundary="------------1PafdFd7YnoQKSR5XDZyecJM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <c89b3907-d32f-4f39-beef-fcacd575ca2b@suse.com>
Subject: Re: [PATCH] xen/gntalloc: validate grant count before allocation
References: <20260624124745.10073-1-alhouseenyousef@gmail.com>
In-Reply-To: <20260624124745.10073-1-alhouseenyousef@gmail.com>

--------------1PafdFd7YnoQKSR5XDZyecJM
Content-Type: multipart/mixed; boundary="------------joNe91i64WQT5R8qWN0vzi0B"

--------------joNe91i64WQT5R8qWN0vzi0B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDYuMjYgMTQ6NDcsIFlvdXNlZiBBbGhvdXNlZW4gd3JvdGU6DQo+IGdudGFsbG9j
X2lvY3RsX2FsbG9jKCkgYWxsb2NhdGVzIHRoZSBncmFudC1pZCBhcnJheSBiZWZvcmUgY2hl
Y2tpbmcNCj4gd2hldGhlciB0aGUgcmVxdWVzdGVkIGNvdW50IGNhbiBmaXQgd2l0aGluIHRo
ZSBnbG9iYWwgZ3JhbnQgbGltaXQuDQo+IENvdW50cyBhYm92ZSB0aGUgbGltaXQgY2Fubm90
IHN1Y2NlZWQsIHNvIHJlamVjdCB0aGVtIGJlZm9yZSB0aGUNCj4gdXNlci1jb250cm9sbGVk
IGFsbG9jYXRpb24gc2l6ZSByZWFjaGVzIGtjYWxsb2MoKS4NCj4gDQo+IFRoZSBsb2NrZWQg
bGltaXQgY2hlY2sgYWxzbyBhZGRzIGEgdTMyIGNvdW50IHRvIHNpZ25lZCBnbG9iYWwgY291
bnRlcnMuDQo+IFJld3JpdGUgaXQgYXMgYSBzdWJ0cmFjdGlvbi1iYXNlZCByYW5nZSBjaGVj
ayBzbyB0aGUgYXJpdGhtZXRpYyBjYW5ub3QNCj4gd3JhcCBhcm91bmQgdGhlIGxpbWl0Lg0K
PiANCj4gV2hpbGUgdGhlcmUsIGNhc3QgdGhlIGNvdW50IGJlZm9yZSBhZHZhbmNpbmcgdGhl
IHBlci1maWxlIGluZGV4IHNvIHRoZQ0KPiBwYWdlLXNpemUgbXVsdGlwbGljYXRpb24gaXMg
ZG9uZSBpbiA2NC1iaXQgYXJpdGhtZXRpYy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlvdXNl
ZiBBbGhvdXNlZW4gPGFsaG91c2VlbnlvdXNlZkBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMveGVuL2dudGFsbG9jLmMgfCAxMyArKysrKysrKysrKy0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy94ZW4vZ250YWxsb2MuYyBiL2RyaXZlcnMveGVuL2dudGFsbG9jLmMN
Cj4gaW5kZXggZWFkZWRkMWU5Li5iYTZhMjVhMDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
eGVuL2dudGFsbG9jLmMNCj4gKysrIGIvZHJpdmVycy94ZW4vZ250YWxsb2MuYw0KPiBAQCAt
MjcyLDYgKzI3Miw3IEBAIHN0YXRpYyBsb25nIGdudGFsbG9jX2lvY3RsX2FsbG9jKHN0cnVj
dCBnbnRhbGxvY19maWxlX3ByaXZhdGVfZGF0YSAqcHJpdiwNCj4gICAJaW50IHJjID0gMDsN
Cj4gICAJc3RydWN0IGlvY3RsX2dudGFsbG9jX2FsbG9jX2dyZWYgb3A7DQo+ICAgCXVpbnQz
Ml90ICpncmVmX2lkczsNCj4gKwlpbnQgbGltaXRfc25hcHNob3Q7DQoNClRoaXMgbmVlZHMg
dG8gYmUgYW4gdW5zaWduZWQgaW50LCBzYW1lIGFwcGxpZXMgdG8gdGhlIGFscmVhZHkgZXhp
c3RpbmcNCiJsaW1pdCIgYW5kICJncmVmX2lkcyIuDQoNCkNvdWxkIHlvdSBwbGVhc2UgY3Jl
YXRlIGEgc21hbGwgc2VyaWVzIHdpdGggcGF0Y2ggMSBjaGFuZ2luZyAibGltaXQiIGFuZA0K
ImdyZWZfaWRzIiB0byB1bnNpZ25lZCBpbnQgYW5kIGxldCB0aGlzIHBhdGNoIGJlIHBhdGNo
IDI/DQoNClRoZSByZXN0IG9mIHRoaXMgcGF0Y2ggKHdpdGggdGhlICI8IDAiIHRlc3RzIGFu
ZCBzb21lIHR5cGUgY2FzdHMgcmVtb3ZlZCkNCmlzIGxvb2tpbmcgZmluZSB0byBtZS4NCg0K
DQpKdWVyZ2VuDQoNCj4gICANCj4gICAJcHJfZGVidWcoIiVzOiBwcml2ICVwXG4iLCBfX2Z1
bmNfXywgcHJpdik7DQo+ICAgDQo+IEBAIC0yODAsNiArMjgxLDEyIEBAIHN0YXRpYyBsb25n
IGdudGFsbG9jX2lvY3RsX2FsbG9jKHN0cnVjdCBnbnRhbGxvY19maWxlX3ByaXZhdGVfZGF0
YSAqcHJpdiwNCj4gICAJCWdvdG8gb3V0Ow0KPiAgIAl9DQo+ICAgDQo+ICsJbGltaXRfc25h
cHNob3QgPSBSRUFEX09OQ0UobGltaXQpOw0KPiArCWlmIChsaW1pdF9zbmFwc2hvdCA8IDAg
fHwgb3AuY291bnQgPiAodWludDMyX3QpbGltaXRfc25hcHNob3QpIHsNCj4gKwkJcmMgPSAt
RU5PU1BDOw0KPiArCQlnb3RvIG91dDsNCj4gKwl9DQo+ICsNCj4gICAJZ3JlZl9pZHMgPSBr
Y2FsbG9jKG9wLmNvdW50LCBzaXplb2YoZ3JlZl9pZHNbMF0pLCBHRlBfS0VSTkVMKTsNCj4g
ICAJaWYgKCFncmVmX2lkcykgew0KPiAgIAkJcmMgPSAtRU5PTUVNOw0KPiBAQCAtMjkyLDE0
ICsyOTksMTYgQEAgc3RhdGljIGxvbmcgZ250YWxsb2NfaW9jdGxfYWxsb2Moc3RydWN0IGdu
dGFsbG9jX2ZpbGVfcHJpdmF0ZV9kYXRhICpwcml2LA0KPiAgIAkgKiBhcmUgYWJvdXQgdG8g
ZW5mb3JjZSwgcmVtb3ZpbmcgdGhlbSBoZXJlIGlzIGEgZ29vZCBpZGVhLg0KPiAgIAkgKi8N
Cj4gICAJZG9fY2xlYW51cCgpOw0KPiAtCWlmIChncmVmX3NpemUgKyBvcC5jb3VudCA+IGxp
bWl0KSB7DQo+ICsJbGltaXRfc25hcHNob3QgPSBSRUFEX09OQ0UobGltaXQpOw0KPiArCWlm
IChsaW1pdF9zbmFwc2hvdCA8IDAgfHwgZ3JlZl9zaXplID4gbGltaXRfc25hcHNob3QgfHwN
Cj4gKwkgICAgb3AuY291bnQgPiAodWludDMyX3QpKGxpbWl0X3NuYXBzaG90IC0gZ3JlZl9z
aXplKSkgew0KPiAgIAkJbXV0ZXhfdW5sb2NrKCZncmVmX211dGV4KTsNCj4gICAJCXJjID0g
LUVOT1NQQzsNCj4gICAJCWdvdG8gb3V0X2ZyZWU7DQo+ICAgCX0NCj4gICAJZ3JlZl9zaXpl
ICs9IG9wLmNvdW50Ow0KPiAgIAlvcC5pbmRleCA9IHByaXYtPmluZGV4Ow0KPiAtCXByaXYt
PmluZGV4ICs9IG9wLmNvdW50ICogUEFHRV9TSVpFOw0KPiArCXByaXYtPmluZGV4ICs9ICh1
aW50NjRfdClvcC5jb3VudCAqIFBBR0VfU0laRTsNCj4gICAJbXV0ZXhfdW5sb2NrKCZncmVm
X211dGV4KTsNCj4gICANCj4gICAJcmMgPSBhZGRfZ3JlZnMoJm9wLCBncmVmX2lkcywgcHJp
dik7DQoNCg==
--------------joNe91i64WQT5R8qWN0vzi0B
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------joNe91i64WQT5R8qWN0vzi0B--

--------------1PafdFd7YnoQKSR5XDZyecJM--

--------------Z5dcA2bS0wejZ8woxF6jiPy7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmo+bQsFAwAAAAAACgkQsN6d1ii/Ey8q
IAf9HDyxfh0OkvlypP7nNgSyAH32aMtTvSOLFEBpJsBi0I1s6eBTGWFGmZ/z5nJqlb3HAu0GgPDY
HD+TgKFfviFZaBi6E9COCrwoIYiTLTbBiZ5MF+G5r4Pv0bvNkg+2ThFS2S4tsRYrYQbimL8yY8+0
dulv2nUHTxu7dX/mJ0CoX6qYP34P8sQYbTurQfjDM8vx0ndNcb93Li6D52EDDnNVuJ0EuH8Rxbma
ufmxZ4H4KMQbLHvwz0NpUWbzobZR5xQ2WrM2+Nt75kDks4ZGnC6jnmzncB36a8uMnqmp+gXhkq+C
2SQLlSbyjmcIyozJfyN97y/PiPCb760Dg9hiQPcQpQ==
=UKmb
-----END PGP SIGNATURE-----

--------------Z5dcA2bS0wejZ8woxF6jiPy7--

